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
	.globl _off_color
	.globl _blue_highlight_color
	.globl _blue_base_color
	.globl _orange_highlight_color
	.globl _orange_base_color
	.globl _main
	.globl _handle_tick
	.globl _button_check
	.globl _handle_state_update
	.globl _state_check
	.globl _read_touch_raw
	.globl _output_leds
	.globl _timer_init
	.globl _led_init
	.globl _sys_clk_init
	.globl _touch_init
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
	.globl _resample_count
	.globl _last_touch
	.globl _touch_base
	.globl _state_update_delay_ms_cnt
	.globl _led_update_delay_ms_cnt
	.globl _button_down
	.globl _button_ctr
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
_button_ctr::
	.ds 1
_button_down::
	.ds 1
_led_update_delay_ms_cnt::
	.ds 2
_state_update_delay_ms_cnt::
	.ds 2
_touch_base::
	.ds 2
_last_touch::
	.ds 2
_resample_count::
	.ds 1
_button_check_sloc0_1_0:
	.ds 2
_button_check_sloc1_1_0:
	.ds 2
_handle_tick_sloc2_1_0:
	.ds 1
_handle_tick_sloc3_1_0:
	.ds 1
_handle_tick_sloc4_1_0:
	.ds 1
_handle_tick_sloc5_1_0:
	.ds 1
_handle_tick_sloc6_1_0:
	.ds 1
;--------------------------------------------------------
; overlayable items in ram
;--------------------------------------------------------
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
;	main.c: 124: volatile Steps step = STEP_1;
	mov	a, #0x01
	mov	_step+0, a
;	main.c: 125: volatile Patterns state = OFF;
	clear	_state+0
;	main.c: 131: volatile uint8_t bytes = LED_COUNT * 3;
	mov	a, #0x0c
	mov	_bytes+0, a
;	main.c: 132: volatile uint8_t byte_t = 0;
	clear	_byte_t+0
;	main.c: 133: volatile uint8_t byte_ctr = 0;
	clear	_byte_ctr+0
;	main.c: 136: volatile uint8_t r_step = 0;
	clear	_r_step+0
;	main.c: 137: volatile uint8_t g_step = 0;
	clear	_g_step+0
;	main.c: 138: volatile uint8_t b_step = 0;
	clear	_b_step+0
;	main.c: 140: volatile uint8_t button_ctr = 0;
	clear	_button_ctr+0
;	main.c: 141: volatile uint8_t button_down = 0;
	clear	_button_down+0
;	main.c: 143: volatile uint16_t led_update_delay_ms_cnt = 0;
	clear	_led_update_delay_ms_cnt+0
	clear	_led_update_delay_ms_cnt+1
;	main.c: 144: volatile uint16_t state_update_delay_ms_cnt = 0;
	clear	_state_update_delay_ms_cnt+0
	clear	_state_update_delay_ms_cnt+1
;	main.c: 146: volatile uint16_t touch_base = 0;
	clear	_touch_base+0
	clear	_touch_base+1
;	main.c: 147: volatile uint16_t last_touch = 0;
	clear	_last_touch+0
	clear	_last_touch+1
;	main.c: 148: volatile uint8_t resample_count = 0;
	clear	_resample_count+0
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
;	main.c: 150: void touch_init()
;	-----------------------------------------
;	 function touch_init
;	-----------------------------------------
_touch_init:
;	main.c: 153: TS = TS_TP_CLK_IHRC_DIV2 | TS_TP_VREF_VCC05 | TS_DISCHARGE_WAIT_128CLOCKS;
	mov	a, #0x13
	mov.io	__ts, a
;	main.c: 154: TPS2 = TPS2_TOUCH_TYPE_B | TPS2_VREFNONFLOAT_ALWAYS_ON;
	mov	a, #0x41
	mov.io	__tps2, a
;	main.c: 155: PAC &= ~(BTN_bm);            // Pin 4 as in
	set0.io	__pac, #4
;	main.c: 156: PADIER &= ~(BTN_bm | CS_bm); // Disable digital input for touch and CS pins
	mov.io	a, __padier
	and	a, #0x6f
	mov.io	__padier, a
;	main.c: 157: }
	ret
;	main.c: 159: void sys_clk_init()
;	-----------------------------------------
;	 function sys_clk_init
;	-----------------------------------------
_sys_clk_init:
;	main.c: 162: CLKMD = CLKMD_ENABLE_IHRC | CLKMD_IHRC_DIV2 | CLKMD_ENABLE_ILRC; // First enable IHRC
	mov	a, #0x34
	mov.io	__clkmd, a
;	main.c: 163: }
	ret
;	main.c: 165: void led_init()
;	-----------------------------------------
;	 function led_init
;	-----------------------------------------
_led_init:
;	main.c: 168: PAC |= LED_bm;
	set1.io	__pac, #5
;	main.c: 169: }
	ret
;	main.c: 171: void timer_init()
;	-----------------------------------------
;	 function timer_init
;	-----------------------------------------
_timer_init:
;	main.c: 173: TM2B = 0xFF; // Max bound for 8-bit timer
	mov	a, #0xff
	mov.io	__tm2b, a
;	main.c: 174: TM2C = TM2C_CLK_ILRC | TM2C_OUT_DISABLE | TM2C_MODE_PERIOD;
	mov	a, #0x40
	mov.io	__tm2c, a
;	main.c: 175: TM2S = TM2S_PRESCALE_DIV64; // Should be 1ms, and start
	mov	a, #0x60
	mov.io	__tm2s, a
;	main.c: 176: }
	ret
;	main.c: 178: void output_leds()
;	-----------------------------------------
;	 function output_leds
;	-----------------------------------------
_output_leds:
;	main.c: 180: __asm__("    mov a, _bytes              ;move our byte count into a");
	mov	a, _bytes              ;move our byte count into a
;	main.c: 181: __asm__("    mov _byte_ctr, a           ;move a into our index counter");
	mov	_byte_ctr, a           ;move a into our index counter
;	main.c: 182: __asm__("    mov	a, #(_pixel_buff)   ;load the address of the array into a");
	mov	a, #(_pixel_buff)   ;load the address of the array into a
;	main.c: 183: __asm__("    mov	p, a                ;put that address into p (a mem location)");
	mov	p, a                ;put that address into p (a mem location)
;	main.c: 184: __asm__("00010$:");
	00010$:
;	main.c: 185: __asm__("    idxm	a, p                ;load the byte data from the array into a");
	idxm	a, p                ;load the byte data from the array into a
;	main.c: 186: __asm__("    inc p                      ;inc p to the next address");
	inc	p                      ;inc p to the next address
;	main.c: 187: __asm__("    mov	_byte_t, a          ;load the byte data into byte_t");
	mov	_byte_t, a          ;load the byte data into byte_t
;	main.c: 188: __asm__("    mov a, #0x08               ;reset the bit count");
	mov	a, #0x08               ;reset the bit count
;	main.c: 189: __asm__("00011$:");
	00011$:
;	main.c: 190: __asm__("    ;output bit");
;output	bit
;	main.c: 191: __asm__("    set1.io __pa, #5           ;set the output pin high");
	set1.io	__pa, #5           ;set the output pin high
;	main.c: 192: __asm__("    t1sn _byte_t, #7           ;if the current MSB is 1, skip setting the pin low now");
	t1sn	_byte_t, #7           ;if the current MSB is 1, skip setting the pin low now
;	main.c: 193: __asm__("    set0.io __pa, #5           ;set the output pin low");
	set0.io	__pa, #5           ;set the output pin low
;	main.c: 194: __asm__("    nop                        ;wait one cycle");
	nop	                       ;wait one cycle
;	main.c: 195: __asm__("    set0.io __pa, #5           ;set the output pin low");
	set0.io	__pa, #5           ;set the output pin low
;	main.c: 196: __asm__("    sl _byte_t                 ;left-shift the data byte (the LEDs are MSB first)");
	sl	_byte_t                 ;left-shift the data byte (the LEDs are MSB first)
;	main.c: 197: __asm__("    dzsn a                     ;dec a and skip next instruction if 0");
	dzsn	a                     ;dec a and skip next instruction if 0
;	main.c: 198: __asm__("    goto 00011$                ;jump back to 00011");
	goto	00011$                ;jump back to 00011
;	main.c: 199: __asm__("    dzsn _byte_ctr             ;dec our index counter and skip the goto if 0");
	dzsn	_byte_ctr             ;dec our index counter and skip the goto if 0
;	main.c: 200: __asm__("    goto	00010$              ;goto the next byte");
	goto	00010$              ;goto the next byte
;	main.c: 201: }
	ret
;	main.c: 203: uint16_t read_touch_raw()
;	-----------------------------------------
;	 function read_touch_raw
;	-----------------------------------------
_read_touch_raw:
;	main.c: 206: TKE1 = TKE1_TK6_PA4; // Use PA4 as touch input
	mov	a, #0x40
	mov.io	__tke1, a
;	main.c: 207: TKE2 = 0;            // Disable other channels
	mov	a, #0x00
	mov.io	__tke2, a
;	main.c: 208: TCC = TCC_TK_RUN;
	mov	a, #0x10
	mov.io	__tcc, a
;	main.c: 210: while (TCC & TCC_TK_RUN)
00101$:
	t0sn.io	__tcc, #4
	goto	00101$
00118$:
;	main.c: 213: return (TKCH << 8) | TKCL;
	mov.io	a, __tkch
	mov	p, a
	mov.io	a, __tkcl
;	main.c: 214: }
	ret
;	main.c: 216: void state_check()
;	-----------------------------------------
;	 function state_check
;	-----------------------------------------
_state_check:
;	main.c: 218: switch (step)
	mov	a, _step+0
	ceqsn	a, #0x08
	t1sn.io	f, c
00119$:
	goto	00102$
00120$:
	add	a, #0x01
	pcadd	a
	goto	#00102$
	goto	#00103$
	goto	#00104$
	goto	#00105$
	goto	#00106$
	goto	#00107$
	goto	#00108$
	goto	#00109$
;	main.c: 221: case NONE:
00102$:
;	main.c: 222: pixel_buff[0] = off_color;
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
;	main.c: 223: pixel_buff[1] = off_color;
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
;	main.c: 224: pixel_buff[2] = off_color;
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
;	main.c: 225: pixel_buff[3] = off_color;
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
;	main.c: 226: output_leds();
	goto	_output_leds
;	main.c: 227: break;
	ret
;	main.c: 228: case STEP_1:
00103$:
;	main.c: 229: pixel_buff[3] = highlight_color;
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
;	main.c: 230: pixel_buff[2] = base_color;
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
;	main.c: 231: pixel_buff[1] = base_color;
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
;	main.c: 232: pixel_buff[0] = base_color;
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
;	main.c: 233: fades[3] = FADE_STEPS;
	mov	a, #0x08
	mov	_fades+3, a
;	main.c: 234: fades[2] = 0;
	clear	_fades+2
;	main.c: 235: fades[1] = 0;
	clear	_fades+1
;	main.c: 236: fades[0] = 0;
	clear	_fades+0
;	main.c: 237: state_update_delay_ms_cnt = STATE_1_DELAY_ms;
	mov	a, #0xc8
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 238: step = STEP_2;
	mov	a, #0x02
	mov	_step+0, a
;	main.c: 239: break;
	ret
;	main.c: 241: case STEP_2:
00104$:
;	main.c: 242: state_update_delay_ms_cnt = STATE_2_DELAY_ms;
	mov	a, #0x64
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 243: step = STEP_3;
	mov	a, #0x03
	mov	_step+0, a
;	main.c: 244: break;
	ret
;	main.c: 245: case STEP_3:
00105$:
;	main.c: 246: pixel_buff[2] = highlight_color;
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
;	main.c: 247: fades[2] = FADE_STEPS;
	mov	a, #0x08
	mov	_fades+2, a
;	main.c: 248: state_update_delay_ms_cnt = STATE_3_DELAY_ms;
	mov	a, #0x28
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 249: step = STEP_4;
	mov	a, #0x04
	mov	_step+0, a
;	main.c: 250: break;
	ret
;	main.c: 251: case STEP_4:
00106$:
;	main.c: 252: pixel_buff[1] = highlight_color;
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
;	main.c: 253: fades[1] = FADE_STEPS;
	mov	a, #0x08
	mov	_fades+1, a
;	main.c: 254: state_update_delay_ms_cnt = STATE_4_DELAY_ms;
	mov	a, #0xc8
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 255: step = STEP_5;
	mov	a, #0x05
	mov	_step+0, a
;	main.c: 256: break;
	ret
;	main.c: 257: case STEP_5:
00107$:
;	main.c: 258: state_update_delay_ms_cnt = STATE_5_DELAY_ms;
	mov	a, #0xc8
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 259: step = STEP_6;
	mov	a, #0x06
	mov	_step+0, a
;	main.c: 260: break;
	ret
;	main.c: 261: case STEP_6:
00108$:
;	main.c: 262: pixel_buff[0] = highlight_color;
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
;	main.c: 263: fades[0] = FADE_STEPS;
	mov	a, #0x08
	mov	_fades+0, a
;	main.c: 264: state_update_delay_ms_cnt = STATE_6_DELAY_ms;
	mov	a, #0xc8
	mov	_state_update_delay_ms_cnt+0, a
	clear	_state_update_delay_ms_cnt+1
;	main.c: 265: step = STEP_7;
	mov	a, #0x07
	mov	_step+0, a
;	main.c: 266: break;
	ret
;	main.c: 267: case STEP_7:
00109$:
;	main.c: 268: state_update_delay_ms_cnt = STATE_7_DELAY_ms;
	mov	a, #0xe8
	mov	_state_update_delay_ms_cnt+0, a
	mov	a, #0x03
	mov	_state_update_delay_ms_cnt+1, a
;	main.c: 269: step = STEP_1;
	mov	a, #0x01
	mov	_step+0, a
;	main.c: 271: }
;	main.c: 272: }
	ret
;	main.c: 274: void handle_state_update()
;	-----------------------------------------
;	 function handle_state_update
;	-----------------------------------------
_handle_state_update:
;	main.c: 277: switch (state)
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
;	main.c: 280: case OFF:
00102$:
;	main.c: 281: step = NONE;
	clear	_step+0
;	main.c: 282: state = BLUE;
	mov	a, #0x01
	mov	_state+0, a
;	main.c: 283: break;
	ret
;	main.c: 284: case BLUE:
00103$:
;	main.c: 285: r_step = BLUE_R_STEP;
;	main.c: 286: g_step = BLUE_G_STEP;
	mov a, #0x02
	mov  _r_step+0, a
	mov	_g_step+0, a
;	main.c: 287: b_step = BLUE_B_STEP;
	mov	a, #0x08
	mov	_b_step+0, a
;	main.c: 288: highlight_color = blue_highlight_color;
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
;	main.c: 289: base_color = blue_base_color;
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
;	main.c: 290: step = STEP_1;
	mov	a, #0x01
	mov	_step+0, a
;	main.c: 291: state = ORANGE;
	mov	a, #0x02
	mov	_state+0, a
;	main.c: 292: break;
	ret
;	main.c: 293: case ORANGE:
00104$:
;	main.c: 294: r_step = ORANGE_R_STEP;
	mov	a, #0x0a
	mov	_r_step+0, a
;	main.c: 295: g_step = ORANGE_G_STEP;
	mov	a, #0x04
	mov	_g_step+0, a
;	main.c: 296: b_step = ORANGE_B_STEP;
	mov	a, #0x02
	mov	_b_step+0, a
;	main.c: 297: highlight_color = orange_highlight_color;
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
;	main.c: 298: base_color = orange_base_color;
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
;	main.c: 299: step = STEP_1;
	mov	a, #0x01
	mov	_step+0, a
;	main.c: 300: state = OFF;
	clear	_state+0
;	main.c: 302: }
;	main.c: 303: }
	ret
;	main.c: 305: void button_check()
;	-----------------------------------------
;	 function button_check
;	-----------------------------------------
_button_check:
;	main.c: 307: uint16_t touch_value = read_touch_raw();
	call	_read_touch_raw
	mov	_button_check_sloc0_1_0+0, a
	mov	a, p
	mov	_button_check_sloc0_1_0+1, a
;	main.c: 309: if (touch_value == last_touch)
	mov	a, _button_check_sloc0_1_0+0
	ceqsn	a, _last_touch+0
	goto	00102$
00137$:
	mov	a, _button_check_sloc0_1_0+1
	ceqsn	a, _last_touch+1
	goto	00102$
00138$:
;	main.c: 311: resample_count++;
	mov	a, _resample_count+0
	add	a, #0x01
	mov	_resample_count+0, a
	goto	00103$
00102$:
;	main.c: 315: resample_count = 0;
	clear	_resample_count+0
;	main.c: 316: last_touch = touch_value;
	mov	a, _button_check_sloc0_1_0+0
	mov	_last_touch+0, a
	mov	a, _button_check_sloc0_1_0+1
	mov	_last_touch+1, a
00103$:
;	main.c: 319: if (resample_count >= RESAMPLE_BASE_COUNT)
	mov	a, _resample_count+0
	sub	a, #0x64
	t0sn.io	f, c
	goto	00105$
00139$:
;	main.c: 321: touch_base = touch_value;
	mov	a, _button_check_sloc0_1_0+0
	mov	_touch_base+0, a
	mov	a, _button_check_sloc0_1_0+1
	mov	_touch_base+1, a
;	main.c: 322: resample_count = 0;
	clear	_resample_count+0
00105$:
;	main.c: 329: if (touch_value < touch_base - TOUCH_THRESHOLD)
	mov	a, _touch_base+0
	sub	a, #0x05
	mov	_button_check_sloc1_1_0+0, a
	mov	a, _touch_base+1
	subc	a
	mov	_button_check_sloc1_1_0+1, a
	mov	a, _button_check_sloc0_1_0+1
	mov	p, a
	mov	a, _button_check_sloc0_1_0+0
	sub	a, _button_check_sloc1_1_0+0
	mov	a, p
	subc	a, _button_check_sloc1_1_0+1
	t1sn.io	f, c
	goto	00109$
00140$:
;	main.c: 332: if (!button_down)
	mov	a, _button_down+0
	ceqsn	a, #0x00
	ret
00141$:
;	main.c: 334: button_down = 1;
	mov	a, #0x01
	mov	_button_down+0, a
;	main.c: 335: handle_state_update();
	call	_handle_state_update
;	main.c: 336: state_check();
	goto	_state_check
	ret
00109$:
;	main.c: 342: button_down = 0;
	clear	_button_down+0
;	main.c: 344: }
	ret
;	main.c: 346: void handle_tick()
;	-----------------------------------------
;	 function handle_tick
;	-----------------------------------------
_handle_tick:
;	main.c: 348: button_check();
	call	_button_check
;	main.c: 350: if (state_update_delay_ms_cnt >= GLOBAL_TICK_ms && step != NONE)
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
;	main.c: 352: state_update_delay_ms_cnt -= GLOBAL_TICK_ms;
	mov	a, _state_update_delay_ms_cnt+0
	sub	a, #0x0a
	mov	p, a
	mov	a, _state_update_delay_ms_cnt+1
	subc	a
	mov	_state_update_delay_ms_cnt+1, a
	mov	a, p
	mov	_state_update_delay_ms_cnt+0, a
;	main.c: 354: if (led_update_delay_ms_cnt >= LED_UPDATE_DELAY_ms)
	mov	a, _led_update_delay_ms_cnt+1
	mov	p, a
	mov	a, _led_update_delay_ms_cnt+0
	sub	a, #0x32
	mov	a, p
	subc	a
	t0sn.io	f, c
	goto	00105$
00153$:
;	main.c: 356: for (uint8_t i = 0; i < LED_COUNT; i++)
	clear	_handle_tick_sloc2_1_0+0
00110$:
	mov	a, _handle_tick_sloc2_1_0+0
	sub	a, #0x04
	t1sn.io	f, c
	goto	00103$
00154$:
;	main.c: 358: if (fades[i] > 0)
	mov	a, #(_fades + 0)
	add	a, _handle_tick_sloc2_1_0+0
	mov	p, a
	idxm	a, p
	cneqsn	a, #0x00
	goto	00111$
00155$:
;	main.c: 360: fades[i]--;
	mov	a, #(_fades + 0)
	add	a, _handle_tick_sloc2_1_0+0
	mov	p, a
	idxm	a, p
	sub	a, #0x01
	idxm	p, a
;	main.c: 362: pixel_buff[i].r = (pixel_buff[i].r - r_step);
	mov	a, _handle_tick_sloc2_1_0+0
	sl	a
	add	a, _handle_tick_sloc2_1_0+0
	mov	_handle_tick_sloc3_1_0+0, a
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc3_1_0+0
	add	a, #0x01
	mov	_handle_tick_sloc4_1_0+0, a
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc3_1_0+0
	add	a, #0x01
	mov	p, a
	idxm	a, p
	sub	a, _r_step+0
	mov	p, a
	mov	a, _handle_tick_sloc4_1_0+0
	xch	a, p
	idxm	p, a
;	main.c: 363: pixel_buff[i].g = (pixel_buff[i].g - g_step);
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc3_1_0+0
	mov	_handle_tick_sloc5_1_0+0, a
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc3_1_0+0
	mov	p, a
	idxm	a, p
	sub	a, _g_step+0
	mov	p, a
	mov	a, _handle_tick_sloc5_1_0+0
	xch	a, p
	idxm	p, a
;	main.c: 364: pixel_buff[i].b = (pixel_buff[i].b - b_step);
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc3_1_0+0
	add	a, #0x02
	mov	_handle_tick_sloc6_1_0+0, a
	mov	a, #(_pixel_buff + 0)
	add	a, _handle_tick_sloc3_1_0+0
	add	a, #0x02
	mov	p, a
	idxm	a, p
	sub	a, _b_step+0
	mov	p, a
	mov	a, _handle_tick_sloc6_1_0+0
	xch	a, p
	idxm	p, a
00111$:
;	main.c: 356: for (uint8_t i = 0; i < LED_COUNT; i++)
	inc	_handle_tick_sloc2_1_0+0
	goto	00110$
00103$:
;	main.c: 368: output_leds();
	call	_output_leds
;	main.c: 369: led_update_delay_ms_cnt = 0;
	clear	_led_update_delay_ms_cnt+0
	clear	_led_update_delay_ms_cnt+1
00105$:
;	main.c: 372: led_update_delay_ms_cnt += GLOBAL_TICK_ms;
	mov	a, _led_update_delay_ms_cnt+0
	add	a, #0x0a
	mov	p, a
	mov	a, _led_update_delay_ms_cnt+1
	addc	a
	mov	_led_update_delay_ms_cnt+1, a
	mov	a, p
	mov	_led_update_delay_ms_cnt+0, a
;	main.c: 374: return;
	ret
00107$:
;	main.c: 377: state_check();
	goto	_state_check
;	main.c: 378: }
	ret
;	main.c: 380: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 383: sys_clk_init();
	call	_sys_clk_init
;	main.c: 384: led_init();
	call	_led_init
;	main.c: 385: timer_init();
	call	_timer_init
;	main.c: 397: touch_init();
	call	_touch_init
;	main.c: 399: touch_base = read_touch_raw();
	call	_read_touch_raw
	mov	_touch_base+0, a
	mov	a, p
	mov	_touch_base+1, a
;	main.c: 401: state = BLUE;
	mov	a, #0x01
	mov	_state+0, a
;	main.c: 402: step = NONE;
	clear	_step+0
;	main.c: 403: handle_state_update();
	call	_handle_state_update
;	main.c: 405: while (1)
00104$:
;	main.c: 407: if (TM2CT >= GLOBAL_TICK_ms)
	mov.io	a, __tm2ct
	sub	a, #0x0a
	t0sn.io	f, c
	goto	00104$
00120$:
;	main.c: 409: TM2CT = 0; // Clear the timer count
	mov	a, #0x00
	mov.io	__tm2ct, a
;	main.c: 410: handle_tick();
	call	_handle_tick
	goto	00104$
;	main.c: 413: }
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
