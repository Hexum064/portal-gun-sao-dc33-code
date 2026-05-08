;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module main
	
	.optsdcc -mpdk14

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _running_avg_PARM_1
	.globl _delay_cycles_PARM_1
	.globl _off_color
	.globl _blue_highlight_color
	.globl _blue_base_color
	.globl _orange_highlight_color
	.globl _orange_base_color
	.globl _main
	.globl _handle_tick
	.globl _button_check
	.globl _running_avg
	.globl _handle_state_update
	.globl _state_check
	.globl _read_touch_raw
	.globl _calc_touch_window
	.globl _output_leds
	.globl _timer_init
	.globl _led_init
	.globl _sys_clk_init
	.globl _touch_init
	.globl _uart_tx_byte
	.globl _delay_cycles
	.globl __t16c
	.globl __rop
	.globl __ilrcr
	.globl __tm3b
	.globl __tm3s
	.globl __tm3ct
	.globl __tm3c
	.globl __lvdc
	.globl __tkcl
	.globl __tkch
	.globl __tps2
	.globl __tps
	.globl __tke1
	.globl __tke2
	.globl __tcc
	.globl __ts
	.globl __tm2b
	.globl __tm2s
	.globl __tm2ct
	.globl __tm2c
	.globl __misclvr
	.globl __bgtr
	.globl __gpcs
	.globl __gpcc
	.globl __pbpl
	.globl __pbph
	.globl __pbc
	.globl __pb
	.globl __papl
	.globl __paph
	.globl __pac
	.globl __pa
	.globl __misc2
	.globl __pbdier
	.globl __padier
	.globl __integs
	.globl __ihrcr
	.globl __eoscr
	.globl __misc
	.globl __t16m
	.globl __intrq
	.globl __inten
	.globl __clkmd
	.globl __sp
	.globl __flag
	.globl _uart_tx_byte_PARM_1
	.globl _resample_count
	.globl _lo_touch
	.globl _hi_touch
	.globl _last_touch
	.globl _base_touch
	.globl _state_update_delay_ms_cnt
	.globl _led_update_delay_ms_cnt
	.globl _button_down
	.globl _button_handled
	.globl _b_step
	.globl _g_step
	.globl _r_step
	.globl _byte_ctr
	.globl _byte_t
	.globl _bytes
	.globl _fades
	.globl _pixel_buff
	.globl _state
	.globl _step
	.globl _highlight_color
	.globl _base_color
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG (ABS)
	.org 0x0000
__flag	=	0x0000
__sp	=	0x0002
__clkmd	=	0x0003
__inten	=	0x0004
__intrq	=	0x0005
__t16m	=	0x0006
__misc	=	0x0008
__eoscr	=	0x000a
__ihrcr	=	0x000b
__integs	=	0x000c
__padier	=	0x000d
__pbdier	=	0x000e
__misc2	=	0x000f
__pa	=	0x0010
__pac	=	0x0011
__paph	=	0x0012
__papl	=	0x0013
__pb	=	0x0014
__pbc	=	0x0015
__pbph	=	0x0016
__pbpl	=	0x0017
__gpcc	=	0x0018
__gpcs	=	0x0019
__bgtr	=	0x001a
__misclvr	=	0x001b
__tm2c	=	0x001c
__tm2ct	=	0x001d
__tm2s	=	0x001e
__tm2b	=	0x001f
__ts	=	0x0020
__tcc	=	0x0021
__tke2	=	0x0022
__tke1	=	0x0024
__tps	=	0x0026
__tps2	=	0x0028
__tkch	=	0x002b
__tkcl	=	0x002c
__lvdc	=	0x002d
__tm3c	=	0x0032
__tm3ct	=	0x0033
__tm3s	=	0x0034
__tm3b	=	0x0035
__ilrcr	=	0x0039
__rop	=	0x003a
__t16c::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_base_color::
	.ds 3
_highlight_color::
	.ds 3
_step::
	.ds 1
_state::
	.ds 1
_pixel_buff::
	.ds 12
_fades::
	.ds 4
_bytes::
	.ds 1
_byte_t::
	.ds 1
_byte_ctr::
	.ds 1
_r_step::
	.ds 1
_g_step::
	.ds 1
_b_step::
	.ds 1
_button_handled::
	.ds 1
_button_down::
	.ds 1
_led_update_delay_ms_cnt::
	.ds 2
_state_update_delay_ms_cnt::
	.ds 2
_base_touch::
	.ds 2
_last_touch::
	.ds 2
_hi_touch::
	.ds 2
_lo_touch::
	.ds 2
_resample_count::
	.ds 2
_uart_tx_byte_PARM_1:
	.ds 1
_uart_tx_byte_sloc1_1_0:
	.ds 1
_calc_touch_window_sloc2_1_0:
	.ds 2
_running_avg_filter_reg_10000_41:
	.ds 4
_handle_tick_sloc5_1_0:
	.ds 1
_handle_tick_sloc6_1_0:
	.ds 1
_handle_tick_sloc7_1_0:
	.ds 1
_handle_tick_sloc8_1_0:
	.ds 1
_handle_tick_sloc9_1_0:
	.ds 1
_main_sloc10_1_0:
	.ds 2
_main_sloc11_1_0:
	.ds 1
;--------------------------------------------------------
; overlayable items in ram
;--------------------------------------------------------
	.area	OSEG (OVR,DATA)
_delay_cycles_PARM_1:
	.ds 2
_delay_cycles_sloc0_1_0:
	.ds 2
	.area	OSEG (OVR,DATA)
_running_avg_PARM_1:
	.ds 1
_running_avg_sloc3_1_0:
	.ds 4
_running_avg_sloc4_1_0:
	.ds 4
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	.area	HEADER (ABS)
	.org	 0x0020
	reti
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	.area	PREG (ABS)
	.org 0x00
p::
	.ds 2
	.area	HEADER (ABS)
	.org 0x0000
	nop
	clear	p+1
	mov	a, #s_OSEG
	add	a, #l_OSEG + 1
	and	a, #0xfe
	mov.io	sp, a
	call	___sdcc_external_startup
	cneqsn	a, #0x00
	goto	__sdcc_init_data
	goto	__sdcc_program_startup
	.area GSINIT
__sdcc_init_data:
	mov	a, #s_DATA
	mov	p, a
	goto	00002$
00001$:
	mov	a, #0x00
	idxm	p, a
	inc	p
	mov	a, #s_DATA
00002$:
	add	a, #l_DATA
	ceqsn	a, p
	goto	00001$
;	main.c: 332: static uint32_t filter_reg = 0;
	clear	_running_avg_filter_reg_10000_41+0
	clear	_running_avg_filter_reg_10000_41+1
	clear	_running_avg_filter_reg_10000_41+2
	clear	_running_avg_filter_reg_10000_41+3
;	main.c: 90: volatile Steps step = STEP_1;
	mov	a, #0x01
	mov	_step+0, a
;	main.c: 91: volatile Patterns state = OFF;
	clear	_state+0
;	main.c: 97: volatile uint8_t bytes = LED_COUNT * 3;
	mov	a, #0x0c
	mov	_bytes+0, a
;	main.c: 98: volatile uint8_t byte_t = 0;
	clear	_byte_t+0
;	main.c: 99: volatile uint8_t byte_ctr = 0;
	clear	_byte_ctr+0
;	main.c: 102: volatile uint8_t r_step = 0;
	clear	_r_step+0
;	main.c: 103: volatile uint8_t g_step = 0;
	clear	_g_step+0
;	main.c: 104: volatile uint8_t b_step = 0;
	clear	_b_step+0
;	main.c: 106: volatile uint8_t button_handled = 0;
	clear	_button_handled+0
;	main.c: 107: volatile uint8_t button_down = 0;
	clear	_button_down+0
;	main.c: 109: volatile uint16_t led_update_delay_ms_cnt = 0;
	clear	_led_update_delay_ms_cnt+0
	clear	_led_update_delay_ms_cnt+1
;	main.c: 110: volatile uint16_t state_update_delay_ms_cnt = 0;
	clear	_state_update_delay_ms_cnt+0
	clear	_state_update_delay_ms_cnt+1
;	main.c: 112: volatile uint16_t base_touch = 0;
	clear	_base_touch+0
	clear	_base_touch+1
;	main.c: 113: volatile uint16_t last_touch = 0;
	clear	_last_touch+0
	clear	_last_touch+1
;	main.c: 114: volatile uint16_t hi_touch = 0;
	clear	_hi_touch+0
	clear	_hi_touch+1
;	main.c: 115: volatile uint16_t lo_touch = 0;
	clear	_lo_touch+0
	clear	_lo_touch+1
;	main.c: 116: volatile uint16_t resample_count = 0;
	clear	_resample_count+0
	clear	_resample_count+1
	.area GSFINAL
	goto	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	goto	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 119: void delay_cycles(uint16_t cycles)
;	-----------------------------------------
;	 function delay_cycles
;	-----------------------------------------
_delay_cycles:
;	main.c: 121: while (cycles--)
	mov	a, _delay_cycles_PARM_1+0
	mov	_delay_cycles_sloc0_1_0+0, a
	mov	a, _delay_cycles_PARM_1+1
	mov	_delay_cycles_sloc0_1_0+1, a
00101$:
	mov	a, _delay_cycles_sloc0_1_0+1
	mov	p, a
	mov	a, _delay_cycles_sloc0_1_0+0
	dec	_delay_cycles_sloc0_1_0+0
	subc	_delay_cycles_sloc0_1_0+1
	or	a, p
	cneqsn	a, #0x00
	ret
00119$:
;	main.c: 123: __asm__("nop"); // Adjust based on compiler cycle counts
	nop
	goto	00101$
;	main.c: 125: }
	ret
;	main.c: 127: void uart_tx_byte(uint8_t data)
;	-----------------------------------------
;	 function uart_tx_byte
;	-----------------------------------------
_uart_tx_byte:
;	main.c: 130: PA &= ~TX_PIN;
	set0.io	__pa, #3
;	main.c: 131: delay_cycles(BIT_PERIOD);
	mov	a, #0x3e
	mov	_delay_cycles_PARM_1+0, a
	clear	_delay_cycles_PARM_1+1
	call	_delay_cycles
;	main.c: 134: for (uint8_t i = 0; i < 8; i++)
	clear	_uart_tx_byte_sloc1_1_0+0
00106$:
	mov	a, _uart_tx_byte_sloc1_1_0+0
	sub	a, #0x08
	t1sn.io	f, c
	goto	00104$
00129$:
;	main.c: 136: if (data & 0x01)
	mov	a, _uart_tx_byte_PARM_1+0
	and	a, #0x01
	cneqsn	a, #0x00
	goto	00102$
00130$:
;	main.c: 138: PA |= TX_PIN;
	set1.io	__pa, #3
	goto	00103$
00102$:
;	main.c: 142: PA &= ~TX_PIN;
	set0.io	__pa, #3
00103$:
;	main.c: 144: data >>= 1;
	sr	_uart_tx_byte_PARM_1+0
;	main.c: 145: delay_cycles(BIT_PERIOD);
	mov	a, #0x3e
	mov	_delay_cycles_PARM_1+0, a
	clear	_delay_cycles_PARM_1+1
	call	_delay_cycles
;	main.c: 134: for (uint8_t i = 0; i < 8; i++)
	inc	_uart_tx_byte_sloc1_1_0+0
	goto	00106$
00104$:
;	main.c: 149: PA |= TX_PIN;
	set1.io	__pa, #3
;	main.c: 150: delay_cycles(BIT_PERIOD);
	mov	a, #0x3e
	mov	_delay_cycles_PARM_1+0, a
	clear	_delay_cycles_PARM_1+1
	call	_delay_cycles
;	main.c: 152: delay_cycles(BIT_PERIOD);
	mov	a, #0x3e
	mov	_delay_cycles_PARM_1+0, a
	clear	_delay_cycles_PARM_1+1
	goto	_delay_cycles
;	main.c: 153: }
	ret
;	main.c: 155: void touch_init(void)
;	-----------------------------------------
;	 function touch_init
;	-----------------------------------------
_touch_init:
;	main.c: 158: TS = TS_TP_CLK_IHRC_DIV2 | TS_TP_VREF_VCC05 | TS_DISCHARGE_WAIT_128CLOCKS;
	mov	a, #0x13
	mov.io	__ts, a
;	main.c: 159: TPS2 = TPS2_TOUCH_TYPE_B | TPS2_VREFNONFLOAT_ALWAYS_ON;
	mov	a, #0x41
	mov.io	__tps2, a
;	main.c: 160: PAC &= ~(BTN_bm);            // Pin 4 as in
	set0.io	__pac, #4
;	main.c: 161: PADIER &= ~(BTN_bm | CS_bm); // Disable digital input for touch and CS pins
	mov.io	a, __padier
	and	a, #0x6f
	mov.io	__padier, a
;	main.c: 162: }
	ret
;	main.c: 164: void sys_clk_init(void)
;	-----------------------------------------
;	 function sys_clk_init
;	-----------------------------------------
_sys_clk_init:
;	main.c: 167: CLKMD = CLKMD_ENABLE_IHRC | CLKMD_IHRC_DIV2 | CLKMD_ENABLE_ILRC; // First enable IHRC
	mov	a, #0x34
	mov.io	__clkmd, a
;	main.c: 168: }
	ret
;	main.c: 170: void led_init(void)
;	-----------------------------------------
;	 function led_init
;	-----------------------------------------
_led_init:
;	main.c: 173: PAC |= LED_bm;
	set1.io	__pac, #5
;	main.c: 174: }
	ret
;	main.c: 176: void timer_init(void)
;	-----------------------------------------
;	 function timer_init
;	-----------------------------------------
_timer_init:
;	main.c: 178: TM2B = 0xFF; // Max bound for 8-bit timer
	mov	a, #0xff
	mov.io	__tm2b, a
;	main.c: 179: TM2C = TM2C_CLK_ILRC | TM2C_OUT_DISABLE | TM2C_MODE_PERIOD;
	mov	a, #0x40
	mov.io	__tm2c, a
;	main.c: 180: TM2S = TM2S_PRESCALE_DIV64; // Should be 1ms, and start
	mov	a, #0x60
	mov.io	__tm2s, a
;	main.c: 181: }
	ret
;	main.c: 185: void output_leds(void)
;	-----------------------------------------
;	 function output_leds
;	-----------------------------------------
_output_leds:
;	main.c: 187: __asm__("    mov a, _bytes              ;move our byte count into a");
	mov	a, _bytes              ;move our byte count into a
;	main.c: 188: __asm__("    mov _byte_ctr, a           ;move a into our index counter");
	mov	_byte_ctr, a           ;move a into our index counter
;	main.c: 189: __asm__("    mov	a, #(_pixel_buff)   ;load the address of the array into a");
	mov	a, #(_pixel_buff)   ;load the address of the array into a
;	main.c: 190: __asm__("    mov	p, a                ;put that address into p (a mem location)");
	mov	p, a                ;put that address into p (a mem location)
;	main.c: 191: __asm__("00010$:");
	00010$:
;	main.c: 192: __asm__("    idxm	a, p                ;load the byte data from the array into a");
	idxm	a, p                ;load the byte data from the array into a
;	main.c: 193: __asm__("    inc p                      ;inc p to the next address");
	inc	p                      ;inc p to the next address
;	main.c: 194: __asm__("    mov	_byte_t, a          ;load the byte data into byte_t");
	mov	_byte_t, a          ;load the byte data into byte_t
;	main.c: 195: __asm__("    mov a, #0x08               ;reset the bit count");
	mov	a, #0x08               ;reset the bit count
;	main.c: 196: __asm__("00011$:");
	00011$:
;	main.c: 197: __asm__("    ;output bit");
;output	bit
;	main.c: 198: __asm__("    set1.io __pa, #5           ;set the output pin high");
	set1.io	__pa, #5           ;set the output pin high
;	main.c: 199: __asm__("    t1sn _byte_t, #7           ;if the current MSB is 1, skip setting the pin low now");
	t1sn	_byte_t, #7           ;if the current MSB is 1, skip setting the pin low now
;	main.c: 200: __asm__("    set0.io __pa, #5           ;set the output pin low");
	set0.io	__pa, #5           ;set the output pin low
;	main.c: 201: __asm__("    nop                        ;wait one cycle");
	nop	                       ;wait one cycle
;	main.c: 202: __asm__("    set0.io __pa, #5           ;set the output pin low");
	set0.io	__pa, #5           ;set the output pin low
;	main.c: 203: __asm__("    sl _byte_t                 ;left-shift the data byte (the LEDs are MSB first)");
	sl	_byte_t                 ;left-shift the data byte (the LEDs are MSB first)
;	main.c: 204: __asm__("    dzsn a                     ;dec a and skip next instruction if 0");
	dzsn	a                     ;dec a and skip next instruction if 0
;	main.c: 205: __asm__("    goto 00011$                ;jump back to 00011");
	goto	00011$                ;jump back to 00011
;	main.c: 206: __asm__("    dzsn _byte_ctr             ;dec our index counter and skip the goto if 0");
	dzsn	_byte_ctr             ;dec our index counter and skip the goto if 0
;	main.c: 207: __asm__("    goto	00010$              ;goto the next byte");
	goto	00010$              ;goto the next byte
;	main.c: 208: }
	ret
;	main.c: 210: void calc_touch_window(void)
;	-----------------------------------------
;	 function calc_touch_window
;	-----------------------------------------
_calc_touch_window:
;	main.c: 212: uint16_t big_thress = base_touch * TOUCH_WINDOW_DIV;
	mov	a, _base_touch+0
	mov	__mulint_PARM_2+0, a
	mov	a, _base_touch+1
	mov	__mulint_PARM_2+1, a
	mov	a, #0x19
	mov	__mulint_PARM_1+0, a
	clear	__mulint_PARM_1+1
	call	__mulint
;	main.c: 213: uint16_t thresh = big_thress >> 7; // divide by 128
	mov	_calc_touch_window_sloc2_1_0+0, a
	mov	a, p
	mov	_calc_touch_window_sloc2_1_0+1, a
	mov	a, #7
00111$:
	sr	_calc_touch_window_sloc2_1_0+1
	src	_calc_touch_window_sloc2_1_0+0
	dzsn	a
	goto	00111$
00112$:
;	main.c: 215: hi_touch = base_touch + thresh;
	mov	a, _base_touch+0
	add	a, _calc_touch_window_sloc2_1_0+0
	mov	_hi_touch+0, a
	mov	a, _base_touch+1
	addc	a, _calc_touch_window_sloc2_1_0+1
	mov	_hi_touch+1, a
;	main.c: 216: lo_touch = (base_touch > thresh) ? base_touch - thresh : 0;
	mov	a, _calc_touch_window_sloc2_1_0+0
	sub	a, _base_touch+0
	mov	a, _calc_touch_window_sloc2_1_0+1
	subc	a, _base_touch+1
	t1sn.io	f, c
	goto	00103$
00113$:
	mov	a, _base_touch+0
	sub	a, _calc_touch_window_sloc2_1_0+0
	mov	p, a
	mov	a, _base_touch+1
	subc	a, _calc_touch_window_sloc2_1_0+1
	goto	00104$
00103$:
	clear	p
	mov	a, #0x00
00104$:
	mov	_lo_touch+1, a
	mov	a, p
	mov	_lo_touch+0, a
;	main.c: 225: }
	ret
;	main.c: 227: uint16_t read_touch_raw(void)
;	-----------------------------------------
;	 function read_touch_raw
;	-----------------------------------------
_read_touch_raw:
;	main.c: 230: TKE1 = TKE1_TK6_PA4; // Use PA4 as touch input
	mov	a, #0x40
	mov.io	__tke1, a
;	main.c: 231: TKE2 = 0;            // Disable other channels
	mov	a, #0x00
	mov.io	__tke2, a
;	main.c: 232: TCC = TCC_TK_RUN;
	mov	a, #0x10
	mov.io	__tcc, a
;	main.c: 234: while (TCC & TCC_TK_RUN)
00101$:
	t0sn.io	__tcc, #4
	goto	00101$
00118$:
;	main.c: 237: return (TKCH << 8) | TKCL;
	mov.io	a, __tkch
	mov	p, a
	mov.io	a, __tkcl
;	main.c: 238: }
	ret
;	main.c: 240: void state_check(void)
;	-----------------------------------------
;	 function state_check
;	-----------------------------------------
_state_check:
;	main.c: 243: switch (step)
	mov	a, _step+0
	ceqsn	a, #0x08
	t1sn.io	f, c
00119$:
	goto	00109$
00120$:
	add	a, #0x01
	pcadd	a
	goto	#00109$
	goto	#00101$
	goto	#00102$
	goto	#00103$
	goto	#00104$
	goto	#00105$
	goto	#00106$
	goto	#00107$
;	main.c: 245: case STEP_1:
00101$:
;	main.c: 246: pixel_buff[3] = highlight_color;
	mov	a, #(_pixel_buff + 9)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_highlight_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 247: pixel_buff[2] = base_color;
	mov	a, #(_pixel_buff + 6)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_base_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 248: pixel_buff[1] = base_color;
	mov	a, #(_pixel_buff + 3)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_base_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 249: pixel_buff[0] = base_color;
	mov	a, #(_pixel_buff + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_base_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 250: fades[3] = FADE_STEPS;
	mov	a, #0x08
	mov	_fades+3, a
;	main.c: 251: fades[2] = 0;
	clear	_fades+2
;	main.c: 252: fades[1] = 0;
	clear	_fades+1
;	main.c: 253: fades[0] = 0;
	clear	_fades+0
;	main.c: 254: state_update_delay_ms_cnt = STATE_1_DELAY_ms;
	mov	a, #0xc8
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 255: step = STEP_2;
	mov	a, #0x02
	mov	_step+0, a
;	main.c: 256: break;
	ret
;	main.c: 258: case STEP_2:
00102$:
;	main.c: 259: state_update_delay_ms_cnt = STATE_2_DELAY_ms;
	mov	a, #0x64
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 260: step = STEP_3;
	mov	a, #0x03
	mov	_step+0, a
;	main.c: 261: break;
	ret
;	main.c: 262: case STEP_3:
00103$:
;	main.c: 263: pixel_buff[2] = highlight_color;
	mov	a, #(_pixel_buff + 6)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_highlight_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 264: fades[2] = FADE_STEPS;
	mov	a, #0x08
	mov	_fades+2, a
;	main.c: 265: state_update_delay_ms_cnt = STATE_3_DELAY_ms;
	mov	a, #0x64
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 266: step = STEP_4;
	mov	a, #0x04
	mov	_step+0, a
;	main.c: 267: break;
	ret
;	main.c: 268: case STEP_4:
00104$:
;	main.c: 269: pixel_buff[1] = highlight_color;
	mov	a, #(_pixel_buff + 3)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_highlight_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 270: fades[1] = FADE_STEPS;
	mov	a, #0x08
	mov	_fades+1, a
;	main.c: 271: state_update_delay_ms_cnt = STATE_4_DELAY_ms;
	mov	a, #0xc8
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 272: step = STEP_5;
	mov	a, #0x05
	mov	_step+0, a
;	main.c: 273: break;
	ret
;	main.c: 274: case STEP_5:
00105$:
;	main.c: 275: state_update_delay_ms_cnt = STATE_5_DELAY_ms;
	mov	a, #0xc8
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 276: step = STEP_6;
	mov	a, #0x06
	mov	_step+0, a
;	main.c: 277: break;
	ret
;	main.c: 278: case STEP_6:
00106$:
;	main.c: 279: pixel_buff[0] = highlight_color;
	mov	a, #(_pixel_buff + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_highlight_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 280: fades[0] = FADE_STEPS;
	mov	a, #0x08
	mov	_fades+0, a
;	main.c: 281: state_update_delay_ms_cnt = STATE_6_DELAY_ms;
	mov	a, #0xc8
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 282: step = STEP_7;
	mov	a, #0x07
	mov	_step+0, a
;	main.c: 283: break;
	ret
;	main.c: 284: case STEP_7:
00107$:
;	main.c: 285: state_update_delay_ms_cnt = STATE_7_DELAY_ms;
	mov	a, #0xe8
	mov	_state_update_delay_ms_cnt+0, a
	mov	a, #0x03
	mov	_state_update_delay_ms_cnt+1, a
;	main.c: 286: step = STEP_1;
	mov	a, #0x01
	mov	_step+0, a
;	main.c: 287: break;
	ret
;	main.c: 289: case NONE:
00109$:
;	main.c: 290: pixel_buff[0] = off_color;
	mov	a, #(_pixel_buff + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #<(_off_color + 0)
	mov	___memcpy_PARM_2+0, a
	mov	a, #>(_off_color + 0x8000 + 0)
	mov	___memcpy_PARM_2+1, a
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 291: pixel_buff[1] = off_color;
	mov	a, #(_pixel_buff + 3)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #<(_off_color + 0)
	mov	___memcpy_PARM_2+0, a
	mov	a, #>(_off_color + 0x8000 + 0)
	mov	___memcpy_PARM_2+1, a
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 292: pixel_buff[2] = off_color;
	mov	a, #(_pixel_buff + 6)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #<(_off_color + 0)
	mov	___memcpy_PARM_2+0, a
	mov	a, #>(_off_color + 0x8000 + 0)
	mov	___memcpy_PARM_2+1, a
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 293: pixel_buff[3] = off_color;
	mov	a, #(_pixel_buff + 9)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #<(_off_color + 0)
	mov	___memcpy_PARM_2+0, a
	mov	a, #>(_off_color + 0x8000 + 0)
	mov	___memcpy_PARM_2+1, a
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 294: output_leds();
	goto	_output_leds
;	main.c: 296: }
;	main.c: 297: }
	ret
;	main.c: 299: void handle_state_update(void)
;	-----------------------------------------
;	 function handle_state_update
;	-----------------------------------------
_handle_state_update:
;	main.c: 302: switch (state)
	mov	a, _state+0
	cneqsn	a, #0x00
	goto	00102$
00121$:
	cneqsn	a, #0x01
	goto	00103$
00123$:
	cneqsn	a, #0x02
	goto	00104$
00125$:
;	main.c: 305: case OFF:
00102$:
;	main.c: 306: step = NONE;
	clear	_step+0
;	main.c: 307: state = BLUE;
	mov	a, #0x01
	mov	_state+0, a
;	main.c: 308: break;
	ret
;	main.c: 309: case BLUE:
00103$:
;	main.c: 310: r_step = BLUE_R_STEP;
;	main.c: 311: g_step = BLUE_G_STEP;
	mov a, #0x02
	mov  _r_step+0, a
	mov	_g_step+0, a
;	main.c: 312: b_step = BLUE_B_STEP;
	mov	a, #0x08
	mov	_b_step+0, a
;	main.c: 313: highlight_color = blue_highlight_color;
	mov	a, #(_highlight_color + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #<(_blue_highlight_color + 0)
	mov	___memcpy_PARM_2+0, a
	mov	a, #>(_blue_highlight_color + 0x8000 + 0)
	mov	___memcpy_PARM_2+1, a
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 314: base_color = blue_base_color;
	mov	a, #(_base_color + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #<(_blue_base_color + 0)
	mov	___memcpy_PARM_2+0, a
	mov	a, #>(_blue_base_color + 0x8000 + 0)
	mov	___memcpy_PARM_2+1, a
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 315: step = STEP_1;
	mov	a, #0x01
	mov	_step+0, a
;	main.c: 316: state = ORANGE;
	mov	a, #0x02
	mov	_state+0, a
;	main.c: 317: break;
	ret
;	main.c: 318: case ORANGE:
00104$:
;	main.c: 319: r_step = ORANGE_R_STEP;
	mov	a, #0x0a
	mov	_r_step+0, a
;	main.c: 320: g_step = ORANGE_G_STEP;
	mov	a, #0x04
	mov	_g_step+0, a
;	main.c: 321: b_step = ORANGE_B_STEP;
	mov	a, #0x02
	mov	_b_step+0, a
;	main.c: 322: highlight_color = orange_highlight_color;
	mov	a, #(_highlight_color + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #<(_orange_highlight_color + 0)
	mov	___memcpy_PARM_2+0, a
	mov	a, #>(_orange_highlight_color + 0x8000 + 0)
	mov	___memcpy_PARM_2+1, a
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 323: base_color = orange_base_color;
	mov	a, #(_base_color + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #<(_orange_base_color + 0)
	mov	___memcpy_PARM_2+0, a
	mov	a, #>(_orange_base_color + 0x8000 + 0)
	mov	___memcpy_PARM_2+1, a
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 324: step = STEP_1;
	mov	a, #0x01
	mov	_step+0, a
;	main.c: 325: state = OFF;
	clear	_state+0
;	main.c: 327: }
;	main.c: 328: }
	ret
;	main.c: 330: uint8_t running_avg(uint8_t new_val)
;	-----------------------------------------
;	 function running_avg
;	-----------------------------------------
_running_avg:
;	main.c: 335: filter_reg = filter_reg - (filter_reg >> 3) + new_val;
	mov	a, _running_avg_filter_reg_10000_41+0
	mov	_running_avg_sloc3_1_0+0, a
	mov	a, _running_avg_filter_reg_10000_41+1
	mov	_running_avg_sloc3_1_0+1, a
	mov	a, _running_avg_filter_reg_10000_41+2
	mov	_running_avg_sloc3_1_0+2, a
	mov	a, _running_avg_filter_reg_10000_41+3
	mov	_running_avg_sloc3_1_0+3, a
	mov	a, #3
00103$:
	sr	_running_avg_sloc3_1_0+3
	src	_running_avg_sloc3_1_0+2
	src	_running_avg_sloc3_1_0+1
	src	_running_avg_sloc3_1_0+0
	dzsn	a
	goto	00103$
00104$:
	mov	a, _running_avg_filter_reg_10000_41+0
	sub	a, _running_avg_sloc3_1_0+0
	mov	_running_avg_sloc4_1_0+0, a
	mov	a, _running_avg_filter_reg_10000_41+1
	subc	a, _running_avg_sloc3_1_0+1
	mov	_running_avg_sloc4_1_0+1, a
	mov	a, _running_avg_filter_reg_10000_41+2
	subc	a, _running_avg_sloc3_1_0+2
	mov	_running_avg_sloc4_1_0+2, a
	mov	a, _running_avg_filter_reg_10000_41+3
	subc	a, _running_avg_sloc3_1_0+3
	mov	_running_avg_sloc4_1_0+3, a
	mov	a, _running_avg_sloc4_1_0+0
	add	a, _running_avg_PARM_1+0
	mov	_running_avg_filter_reg_10000_41+0, a
	mov	a, _running_avg_sloc4_1_0+1
	addc	a
	mov	_running_avg_filter_reg_10000_41+1, a
	mov	a, _running_avg_sloc4_1_0+2
	addc	a
	mov	_running_avg_filter_reg_10000_41+2, a
	mov	a, _running_avg_sloc4_1_0+3
	addc	a
	mov	_running_avg_filter_reg_10000_41+3, a
;	main.c: 337: return (uint8_t)(filter_reg >> 3);
	mov	a, _running_avg_filter_reg_10000_41+1
	mov	p, a
	mov	a, _running_avg_filter_reg_10000_41+0
	sr	p
	src	a
	sr	p
	src	a
	sr	p
	src	a
;	main.c: 338: }
	ret
;	main.c: 340: void button_check(void)
;	-----------------------------------------
;	 function button_check
;	-----------------------------------------
_button_check:
;	main.c: 344: last_touch = running_avg(read_touch_raw());
	call	_read_touch_raw
	mov	_running_avg_PARM_1+0, a
	call	_running_avg
	mov	_last_touch+0, a
	clear	_last_touch+1
;	main.c: 346: if (last_touch < lo_touch)
	mov	a, _last_touch+0
	sub	a, _lo_touch+0
	mov	a, _last_touch+1
	subc	a, _lo_touch+1
	t1sn.io	f, c
	goto	00107$
00145$:
;	main.c: 348: button_down = 1;
	mov	a, #0x01
	mov	_button_down+0, a
;	main.c: 349: base_touch = last_touch;
	mov	a, _last_touch+0
	mov	_base_touch+0, a
	mov	a, _last_touch+1
	mov	_base_touch+1, a
;	main.c: 350: calc_touch_window();
	call	_calc_touch_window
;	main.c: 351: resample_count = 0;
	clear	_resample_count+0
	clear	_resample_count+1
	goto	00108$
00107$:
;	main.c: 353: else if (last_touch > hi_touch)
	mov	a, _hi_touch+0
	sub	a, _last_touch+0
	mov	a, _hi_touch+1
	subc	a, _last_touch+1
	t1sn.io	f, c
	goto	00104$
00146$:
;	main.c: 355: button_down = 0;
	clear	_button_down+0
;	main.c: 356: button_handled = 0;
	clear	_button_handled+0
;	main.c: 357: base_touch = last_touch;
	mov	a, _last_touch+0
	mov	_base_touch+0, a
	mov	a, _last_touch+1
	mov	_base_touch+1, a
;	main.c: 358: calc_touch_window();
	call	_calc_touch_window
;	main.c: 359: resample_count = 0;
	clear	_resample_count+0
	clear	_resample_count+1
	goto	00108$
00104$:
;	main.c: 363: resample_count++;
	mov	a, _resample_count+1
	mov	p, a
	mov	a, _resample_count+0
	add	a, #0x01
	mov	_resample_count+0, a
	mov	a, #0x00
	addc	a, p
	mov	_resample_count+1, a
;	main.c: 364: if (resample_count >= RESAMPLE_COUNT_10ms)
	mov	a, _resample_count+1
	mov	p, a
	mov	a, _resample_count+0
	sub	a, #0x40
	mov	a, #0x06
	xch	a, p
	subc	a, p
	t0sn.io	f, c
	goto	00108$
00147$:
;	main.c: 366: base_touch = last_touch;
	mov	a, _last_touch+0
	mov	_base_touch+0, a
	mov	a, _last_touch+1
	mov	_base_touch+1, a
;	main.c: 367: calc_touch_window();
	call	_calc_touch_window
;	main.c: 368: resample_count = 0;
	clear	_resample_count+0
	clear	_resample_count+1
00108$:
;	main.c: 380: if (button_down == 1 && button_handled == 0)
	mov	a, _button_down+0
	ceqsn	a, #0x01
	goto	00110$
00148$:
	mov	a, _button_handled+0
	ceqsn	a, #0x00
	goto	00110$
00149$:
;	main.c: 382: uart_tx_byte(TOUCH_TOKEN);
	mov	a, #0xfe
	mov	_uart_tx_byte_PARM_1+0, a
	call	_uart_tx_byte
;	main.c: 383: uart_tx_byte(last_touch);
	mov	a, _last_touch+0
	mov	_uart_tx_byte_PARM_1+0, a
	call	_uart_tx_byte
;	main.c: 384: button_handled = 1;
	mov	a, #0x01
	mov	_button_handled+0, a
;	main.c: 385: handle_state_update();
	call	_handle_state_update
;	main.c: 386: state_check();
	goto	_state_check
	ret
00110$:
;	main.c: 390: uart_tx_byte(READ_TOKEN);
	mov	a, #0xff
	mov	_uart_tx_byte_PARM_1+0, a
	call	_uart_tx_byte
;	main.c: 391: uart_tx_byte(last_touch);
	mov	a, _last_touch+0
	mov	_uart_tx_byte_PARM_1+0, a
	goto	_uart_tx_byte
;	main.c: 425: }
	ret
;	main.c: 427: void handle_tick(void)
;	-----------------------------------------
;	 function handle_tick
;	-----------------------------------------
_handle_tick:
;	main.c: 429: button_check();
	call	_button_check
;	main.c: 431: if (state_update_delay_ms_cnt >= GLOBAL_TICK_ms && step != NONE)
	mov	a, _state_update_delay_ms_cnt+1
	mov	p, a
	mov	a, _state_update_delay_ms_cnt+0
	sub	a, #0x0a
	mov	a, p
	subc	a
	t0sn.io	f, c
	goto	00107$
00151$:
	mov	a, _step+0
	cneqsn	a, #0x00
	goto	00107$
00152$:
;	main.c: 433: state_update_delay_ms_cnt -= GLOBAL_TICK_ms;
	mov	a, _state_update_delay_ms_cnt+0
	sub	a, #0x0a
	mov	p, a
	mov	a, _state_update_delay_ms_cnt+1
	subc	a
	mov	_state_update_delay_ms_cnt+1, a
	mov	a, p
	mov	_state_update_delay_ms_cnt+0, a
;	main.c: 435: if (led_update_delay_ms_cnt >= LED_UPDATE_DELAY_ms)
	mov	a, _led_update_delay_ms_cnt+1
	mov	p, a
	mov	a, _led_update_delay_ms_cnt+0
	sub	a, #0x32
	mov	a, p
	subc	a
	t0sn.io	f, c
	goto	00105$
00153$:
;	main.c: 437: for (uint8_t i = 0; i < LED_COUNT; i++)
	clear	_handle_tick_sloc5_1_0+0
00110$:
	mov	a, _handle_tick_sloc5_1_0+0
	sub	a, #0x04
	t1sn.io	f, c
	goto	00103$
00154$:
;	main.c: 439: if (fades[i] > 0)
	mov	a, #(_fades + 0)
	add	a, _handle_tick_sloc5_1_0+0
	mov	p, a
	idxm	a, p
	cneqsn	a, #0x00
	goto	00111$
00155$:
;	main.c: 441: fades[i]--;
	mov	a, #(_fades + 0)
	add	a, _handle_tick_sloc5_1_0+0
	mov	p, a
	idxm	a, p
	sub	a, #0x01
	idxm	p, a
;	main.c: 443: pixel_buff[i].r = (pixel_buff[i].r - r_step);
	mov	a, _handle_tick_sloc5_1_0+0
	sl	a
	add	a, _handle_tick_sloc5_1_0+0
	mov	_handle_tick_sloc6_1_0+0, a
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc6_1_0+0
	add	a, #0x01
	mov	_handle_tick_sloc7_1_0+0, a
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc6_1_0+0
	add	a, #0x01
	mov	p, a
	idxm	a, p
	sub	a, _r_step+0
	mov	p, a
	mov	a, _handle_tick_sloc7_1_0+0
	xch	a, p
	idxm	p, a
;	main.c: 444: pixel_buff[i].g = (pixel_buff[i].g - g_step);
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc6_1_0+0
	mov	_handle_tick_sloc8_1_0+0, a
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc6_1_0+0
	mov	p, a
	idxm	a, p
	sub	a, _g_step+0
	mov	p, a
	mov	a, _handle_tick_sloc8_1_0+0
	xch	a, p
	idxm	p, a
;	main.c: 445: pixel_buff[i].b = (pixel_buff[i].b - b_step);
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc6_1_0+0
	add	a, #0x02
	mov	_handle_tick_sloc9_1_0+0, a
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc6_1_0+0
	add	a, #0x02
	mov	p, a
	idxm	a, p
	sub	a, _b_step+0
	mov	p, a
	mov	a, _handle_tick_sloc9_1_0+0
	xch	a, p
	idxm	p, a
00111$:
;	main.c: 437: for (uint8_t i = 0; i < LED_COUNT; i++)
	inc	_handle_tick_sloc5_1_0+0
	goto	00110$
00103$:
;	main.c: 449: output_leds();
	call	_output_leds
;	main.c: 450: led_update_delay_ms_cnt = 0;
	clear	_led_update_delay_ms_cnt+0
	clear	_led_update_delay_ms_cnt+1
00105$:
;	main.c: 453: led_update_delay_ms_cnt += GLOBAL_TICK_ms;
	mov	a, _led_update_delay_ms_cnt+0
	add	a, #0x0a
	mov	p, a
	mov	a, _led_update_delay_ms_cnt+1
	addc	a
	mov	_led_update_delay_ms_cnt+1, a
	mov	a, p
	mov	_led_update_delay_ms_cnt+0, a
;	main.c: 455: return;
	ret
00107$:
;	main.c: 458: state_check();
	goto	_state_check
;	main.c: 459: }
	ret
;	main.c: 461: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 464: sys_clk_init();
	call	_sys_clk_init
;	main.c: 465: led_init();
	call	_led_init
;	main.c: 466: timer_init();
	call	_timer_init
;	main.c: 470: for (uint16_t i = 0; i < 65535; i++)
	clear	_main_sloc10_1_0+0
	clear	_main_sloc10_1_0+1
00111$:
	mov	a, _main_sloc10_1_0+0
	sub	a, #0xff
	mov	a, #0xff
	mov	p, a
	mov	a, _main_sloc10_1_0+1
	subc	a, p
	t1sn.io	f, c
	goto	00101$
00153$:
;	main.c: 472: __asm__("nop"); // Short delay to ensure stable power before configuring pins
	nop
;	main.c: 470: for (uint16_t i = 0; i < 65535; i++)
	inc	_main_sloc10_1_0+0
	addc	_main_sloc10_1_0+1
	goto	00111$
00101$:
;	main.c: 474: PAC |= TX_PIN; // Set PA.0 as output
	set1.io	__pac, #3
;	main.c: 475: PA |= TX_PIN;  // Idle High
	set1.io	__pa, #3
;	main.c: 478: touch_init();
	call	_touch_init
;	main.c: 480: state = BLUE;
	mov	a, #0x01
	mov	_state+0, a
;	main.c: 481: step = NONE;
	clear	_step+0
;	main.c: 482: handle_state_update();
	call	_handle_state_update
;	main.c: 486: while (init_samples--)
	mov	a, #0x0a
	mov	_main_sloc11_1_0+0, a
00102$:
	mov	a, _main_sloc11_1_0+0
	dec	_main_sloc11_1_0+0
	cneqsn	a, #0x00
	goto	00104$
00154$:
;	main.c: 488: base_touch = running_avg(read_touch_raw());
	call	_read_touch_raw
	mov	_running_avg_PARM_1+0, a
	call	_running_avg
	mov	_base_touch+0, a
	clear	_base_touch+1
	goto	00102$
00104$:
;	main.c: 490: calc_touch_window();
	call	_calc_touch_window
;	main.c: 492: while (1)
00108$:
;	main.c: 494: if (TM2CT >= GLOBAL_TICK_ms)
	mov.io	a, __tm2ct
	sub	a, #0x0a
	t0sn.io	f, c
	goto	00108$
00155$:
;	main.c: 496: TM2CT = 0; // Clear the timer count
	mov	a, #0x00
	mov.io	__tm2ct, a
;	main.c: 497: handle_tick();
	call	_handle_tick
	goto	00108$
;	main.c: 500: }
	ret
	.area CODE
	.area CONST
	.area CONST
_orange_base_color:
	ret #0x08	; 8
	ret #0x20	; 32
	ret #0x00	; 0
	.area CODE
	.area CONST
_orange_highlight_color:
	ret #0x28	; 40
	ret #0x70	; 112	'p'
	ret #0x10	; 16
	.area CODE
	.area CONST
_blue_base_color:
	ret #0x00	; 0
	ret #0x00	; 0
	ret #0x40	; 64
	.area CODE
	.area CONST
_blue_highlight_color:
	ret #0x10	; 16
	ret #0x10	; 16
	ret #0x80	; 128
	.area CODE
	.area CONST
_off_color:
	ret #0x00	; 0
	ret #0x00	; 0
	ret #0x00	; 0
	.area CODE
	.area CABS (ABS)
