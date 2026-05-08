#include <stdint.h>
#include <stdio.h>
#include "easypdk/pdk.h"

#include "easypdk/pfc161.h"

// NOTE: Touch Cap = 470pF

#define LED_bm 0x20
#define BTN_bm 0x10
#define CS_bm 0x80

#define GLOBAL_TICK_ms 10
#define LED_COUNT 4

#define BLUE_R_STEP 2
#define BLUE_G_STEP 2
#define BLUE_B_STEP 8
#define ORANGE_R_STEP 10
#define ORANGE_G_STEP 4
#define ORANGE_B_STEP 2

#define BLUE_R_BASE 0
#define BLUE_G_BASE 0
#define BLUE_B_BASE 64
#define ORANGE_R_BASE 32
#define ORANGE_G_BASE 8
#define ORANGE_B_BASE 0

#define FADE_STEPS 8

#define STATE_1_DELAY_ms 200
#define STATE_2_DELAY_ms 100
#define STATE_3_DELAY_ms 100
#define STATE_4_DELAY_ms 200
#define STATE_5_DELAY_ms 200
#define STATE_6_DELAY_ms 200
#define STATE_7_DELAY_ms 1000

#define LED_UPDATE_DELAY_ms 50
#define TOUCH_WINDOW_DIV 25
#define RESAMPLE_COUNT_10ms 1600 // 16 seconds
#define INIT_TOUCH_SAMPLES 10

#define READ_TOKEN 0xFF
#define TOUCH_TOKEN 0xFE

#define DEBUG

#define F_CPU 600000L
#define TX_PIN 0x08 // PA3
#define BAUD_RATE 9600
#define BIT_PERIOD (F_CPU / BAUD_RATE)

typedef struct
{
    uint8_t g;
    uint8_t r;
    uint8_t b;
} color_t;

typedef enum
{
    NONE,
    STEP_1,
    STEP_2,
    STEP_3,
    STEP_4,
    STEP_5,
    STEP_6,
    STEP_7
} Steps;

typedef enum
{
    OFF,
    BLUE,
    ORANGE
} Patterns;

const color_t orange_base_color = {.r = ORANGE_R_BASE, .g = ORANGE_G_BASE, .b = ORANGE_B_BASE};
const color_t orange_highlight_color = {.r = (ORANGE_R_STEP * FADE_STEPS) + ORANGE_R_BASE, .g = (ORANGE_G_STEP * FADE_STEPS) + ORANGE_G_BASE, .b = (ORANGE_B_STEP * FADE_STEPS) + ORANGE_B_BASE};
const color_t blue_base_color = {.r = BLUE_R_BASE, .g = BLUE_G_BASE, .b = BLUE_B_BASE};
const color_t blue_highlight_color = {.r = (BLUE_R_STEP * FADE_STEPS) + BLUE_R_BASE, .g = (BLUE_G_STEP * FADE_STEPS) + BLUE_G_BASE, .b = (BLUE_B_STEP * FADE_STEPS) + BLUE_B_BASE};
const color_t off_color = {.r = 0, .g = 0, .b = 0};

volatile color_t base_color;
volatile color_t highlight_color;

volatile Steps step = STEP_1;
volatile Patterns state = OFF;

volatile color_t pixel_buff[LED_COUNT];
volatile uint8_t fades[LED_COUNT];

//---For the ASM
volatile uint8_t bytes = LED_COUNT * 3;
volatile uint8_t byte_t = 0;
volatile uint8_t byte_ctr = 0;
//---

volatile uint8_t r_step = 0;
volatile uint8_t g_step = 0;
volatile uint8_t b_step = 0;

volatile uint8_t button_handled = 0;
volatile uint8_t button_down = 0;

volatile uint16_t led_update_delay_ms_cnt = 0;
volatile uint16_t state_update_delay_ms_cnt = 0;

volatile uint16_t base_touch = 0;
volatile uint16_t last_touch = 0;
volatile uint16_t hi_touch = 0;
volatile uint16_t lo_touch = 0;
volatile uint16_t resample_count = 0;

// Microsecond delay for SDCC (approximate)
void delay_cycles(uint16_t cycles)
{
    while (cycles--)
    {
        __asm__("nop"); // Adjust based on compiler cycle counts
    }
}

void uart_tx_byte(uint8_t data)
{
    // 1. Start Bit (Low)
    PA &= ~TX_PIN;
    delay_cycles(BIT_PERIOD);

    // 2. Data Bits (8 bits, LSB first)
    for (uint8_t i = 0; i < 8; i++)
    {
        if (data & 0x01)
        {
            PA |= TX_PIN;
        }
        else
        {
            PA &= ~TX_PIN;
        }
        data >>= 1;
        delay_cycles(BIT_PERIOD);
    }

    // 3. Stop Bit (High)
    PA |= TX_PIN;
    delay_cycles(BIT_PERIOD);

    delay_cycles(BIT_PERIOD);
}

void touch_init(void)
{
    // Configure the touch sensing module
    TS = TS_TP_CLK_IHRC_DIV2 | TS_TP_VREF_VCC05 | TS_DISCHARGE_WAIT_128CLOCKS;
    TPS2 = TPS2_TOUCH_TYPE_B | TPS2_VREFNONFLOAT_ALWAYS_ON;
    PAC &= ~(BTN_bm);            // Pin 4 as in
    PADIER &= ~(BTN_bm | CS_bm); // Disable digital input for touch and CS pins
}

void sys_clk_init(void)
{
    // Enable hi speed, div 2, enable low speed. Leave WD disabled
    CLKMD = CLKMD_ENABLE_IHRC | CLKMD_IHRC_DIV2 | CLKMD_ENABLE_ILRC; // First enable IHRC
}

void led_init(void)
{
    // Set pin 5 as output for LED
    PAC |= LED_bm;
}

void timer_init(void)
{
    TM2B = 0xFF; // Max bound for 8-bit timer
    TM2C = TM2C_CLK_ILRC | TM2C_OUT_DISABLE | TM2C_MODE_PERIOD;
    TM2S = TM2S_PRESCALE_DIV64; // Should be 1ms, and start
}

// Reminder for when I forget: Best to keep this here because of how
// paduk assembly uses variables and labels.
void output_leds(void)
{
    __asm__("    mov a, _bytes              ;move our byte count into a");
    __asm__("    mov _byte_ctr, a           ;move a into our index counter");
    __asm__("    mov	a, #(_pixel_buff)   ;load the address of the array into a");
    __asm__("    mov	p, a                ;put that address into p (a mem location)");
    __asm__("00010$:");
    __asm__("    idxm	a, p                ;load the byte data from the array into a");
    __asm__("    inc p                      ;inc p to the next address");
    __asm__("    mov	_byte_t, a          ;load the byte data into byte_t");
    __asm__("    mov a, #0x08               ;reset the bit count");
    __asm__("00011$:");
    __asm__("    ;output bit");
    __asm__("    set1.io __pa, #5           ;set the output pin high");
    __asm__("    t1sn _byte_t, #7           ;if the current MSB is 1, skip setting the pin low now");
    __asm__("    set0.io __pa, #5           ;set the output pin low");
    __asm__("    nop                        ;wait one cycle");
    __asm__("    set0.io __pa, #5           ;set the output pin low");
    __asm__("    sl _byte_t                 ;left-shift the data byte (the LEDs are MSB first)");
    __asm__("    dzsn a                     ;dec a and skip next instruction if 0");
    __asm__("    goto 00011$                ;jump back to 00011");
    __asm__("    dzsn _byte_ctr             ;dec our index counter and skip the goto if 0");
    __asm__("    goto	00010$              ;goto the next byte");
}

void calc_touch_window(void)
{
    uint16_t big_thress = base_touch * TOUCH_WINDOW_DIV;
    uint16_t thresh = big_thress >> 7; // divide by 128

    hi_touch = base_touch + thresh;
    lo_touch = (base_touch > thresh) ? base_touch - thresh : 0;

    // #ifdef DEBUG

    //     uart_tx_byte(base_touch);
    //     uart_tx_byte(lo_touch);
    //     uart_tx_byte(hi_touch);

    // #endif
}

uint16_t read_touch_raw(void)
{
    // 1. Select channel and enable touch module
    TKE1 = TKE1_TK6_PA4; // Use PA4 as touch input
    TKE2 = 0;            // Disable other channels
    TCC = TCC_TK_RUN;

    while (TCC & TCC_TK_RUN)
        ; // Wait for measurement to complete

    return (TKCH << 8) | TKCL;
}

void state_check(void)
{

    switch (step)
    {
    case STEP_1:
        pixel_buff[3] = highlight_color;
        pixel_buff[2] = base_color;
        pixel_buff[1] = base_color;
        pixel_buff[0] = base_color;
        fades[3] = FADE_STEPS;
        fades[2] = 0;
        fades[1] = 0;
        fades[0] = 0;
        state_update_delay_ms_cnt = STATE_1_DELAY_ms;
        step = STEP_2;
        break;

    case STEP_2:
        state_update_delay_ms_cnt = STATE_2_DELAY_ms;
        step = STEP_3;
        break;
    case STEP_3:
        pixel_buff[2] = highlight_color;
        fades[2] = FADE_STEPS;
        state_update_delay_ms_cnt = STATE_3_DELAY_ms;
        step = STEP_4;
        break;
    case STEP_4:
        pixel_buff[1] = highlight_color;
        fades[1] = FADE_STEPS;
        state_update_delay_ms_cnt = STATE_4_DELAY_ms;
        step = STEP_5;
        break;
    case STEP_5:
        state_update_delay_ms_cnt = STATE_5_DELAY_ms;
        step = STEP_6;
        break;
    case STEP_6:
        pixel_buff[0] = highlight_color;
        fades[0] = FADE_STEPS;
        state_update_delay_ms_cnt = STATE_6_DELAY_ms;
        step = STEP_7;
        break;
    case STEP_7:
        state_update_delay_ms_cnt = STATE_7_DELAY_ms;
        step = STEP_1;
        break;
    default:
    case NONE:
        pixel_buff[0] = off_color;
        pixel_buff[1] = off_color;
        pixel_buff[2] = off_color;
        pixel_buff[3] = off_color;
        output_leds();
        break;
    }
}

void handle_state_update(void)
{

    switch (state)
    {
    default:
    case OFF:
        step = NONE;
        state = BLUE;
        break;
    case BLUE:
        r_step = BLUE_R_STEP;
        g_step = BLUE_G_STEP;
        b_step = BLUE_B_STEP;
        highlight_color = blue_highlight_color;
        base_color = blue_base_color;
        step = STEP_1;
        state = ORANGE;
        break;
    case ORANGE:
        r_step = ORANGE_R_STEP;
        g_step = ORANGE_G_STEP;
        b_step = ORANGE_B_STEP;
        highlight_color = orange_highlight_color;
        base_color = orange_base_color;
        step = STEP_1;
        state = OFF;
        break;
    }
}

uint8_t running_avg(uint8_t new_val)
{
    static uint32_t filter_reg = 0;

    // Bit-shift (>> 3) is the same as dividing by 8
    filter_reg = filter_reg - (filter_reg >> 3) + new_val;

    return (uint8_t)(filter_reg >> 3);
}

void button_check(void)
{
    // should happen every ~10ms.

    last_touch = running_avg(read_touch_raw());

    if (last_touch < lo_touch)
    {
        button_down = 1;
        base_touch = last_touch;
        calc_touch_window();
        resample_count = 0;
    }
    else if (last_touch > hi_touch)
    {
        button_down = 0;
        button_handled = 0;
        base_touch = last_touch;
        calc_touch_window();
        resample_count = 0;
    }
    else
    {
        resample_count++;
        if (resample_count >= RESAMPLE_COUNT_10ms)
        {
            base_touch = last_touch;
            calc_touch_window();
            resample_count = 0;
        }
    }

    if (button_down == 1 && button_handled == 0)
    {
        uart_tx_byte(TOUCH_TOKEN);
        uart_tx_byte(last_touch);
        button_handled = 1;
        handle_state_update();
        state_check();
    }
    else
    {
        uart_tx_byte(READ_TOKEN);
        uart_tx_byte(last_touch);
    }

}

void handle_tick(void)
{
    button_check();

    if (state_update_delay_ms_cnt >= GLOBAL_TICK_ms && step != NONE)
    {
        state_update_delay_ms_cnt -= GLOBAL_TICK_ms;

        if (led_update_delay_ms_cnt >= LED_UPDATE_DELAY_ms)
        {
            for (uint8_t i = 0; i < LED_COUNT; i++)
            {
                if (fades[i] > 0)
                {
                    fades[i]--;

                    pixel_buff[i].r = (pixel_buff[i].r - r_step);
                    pixel_buff[i].g = (pixel_buff[i].g - g_step);
                    pixel_buff[i].b = (pixel_buff[i].b - b_step);
                }
            }

            output_leds();
            led_update_delay_ms_cnt = 0;
        }

        led_update_delay_ms_cnt += GLOBAL_TICK_ms;

        return;
    }

    state_check();
}

void main(void)
{

    sys_clk_init();
    led_init();
    timer_init();

#ifdef DEBUG
    // Initialize IO
    for (uint16_t i = 0; i < 65535; i++)
    {
        __asm__("nop"); // Short delay to ensure stable power before configuring pins
    }
    PAC |= TX_PIN; // Set PA.0 as output
    PA |= TX_PIN;  // Idle High
#endif

    touch_init();

    state = BLUE;
    step = NONE;
    handle_state_update();

    uint8_t init_samples = INIT_TOUCH_SAMPLES;

    while (init_samples--)
    {
        base_touch = running_avg(read_touch_raw());
    }
    calc_touch_window();

    while (1)
    {
        if (TM2CT >= GLOBAL_TICK_ms)
        {
            TM2CT = 0; // Clear the timer count
            handle_tick();
        }
    }
}
