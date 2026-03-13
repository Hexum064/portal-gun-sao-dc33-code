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
	.globl _interrupt
	.globl _main
	.globl _read_touch_raw
	.globl _update_pattern
	.globl _output_leds
	.globl _stop_tone_out
	.globl _start_tone_out_button
	.globl _start_tone_out_startup
	.globl _copy_to_buff
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
	.globl _copy_to_buff_PARM_2
	.globl _copy_to_buff_PARM_1
	.globl _resample_count
	.globl _last_touch
	.globl _touch_base
	.globl _tone_time
	.globl _tone_out_ctr
	.globl _pattern_step
	.globl _pattern_index
	.globl _pattern_count
	.globl _button_down
	.globl _button_ctr
	.globl _byte_ctr
	.globl _byte_t
	.globl _bytes
	.globl _pixel_buff
	.globl _off_color
	.globl _bright_blue_color
	.globl _bright_orange_color
	.globl _blue_color
	.globl _orange_color
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
_orange_color::
	.ds 3
_blue_color::
	.ds 3
_bright_orange_color::
	.ds 3
_bright_blue_color::
	.ds 3
_off_color::
	.ds 3
_pixel_buff::
	.ds 12
_bytes::
	.ds 1
_byte_t::
	.ds 1
_byte_ctr::
	.ds 1
_button_ctr::
	.ds 1
_button_down::
	.ds 1
_pattern_count::
	.ds 1
_pattern_index::
	.ds 1
_pattern_step::
	.ds 1
_tone_out_ctr::
	.ds 1
_tone_time::
	.ds 1
_touch_base::
	.ds 2
_last_touch::
	.ds 2
_resample_count::
	.ds 1
_copy_to_buff_PARM_1:
	.ds 3
_copy_to_buff_PARM_2:
	.ds 1
_copy_to_buff_sloc0_1_0:
	.ds 1
_copy_to_buff_sloc1_1_0:
	.ds 1
_update_pattern_bright_10000_20:
	.ds 3
_interrupt_sloc2_1_0:
	.ds 2
_interrupt_sloc3_1_0:
	.ds 2
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
	goto	_interrupt
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
;	main.c: 69: color_t orange_color = {.r = 32, .g = 8, .b = 0};
	mov	a, #0x20
	mov	_orange_color+1, a
	mov	a, #0x08
	mov	_orange_color+0, a
	clear	_orange_color+2
;	main.c: 70: color_t blue_color = {.r = 0, .g = 0, .b = 64};
	clear	_blue_color+1
	clear	_blue_color+0
	mov	a, #0x40
	mov	_blue_color+2, a
;	main.c: 71: color_t bright_orange_color = {.r = 80, .g = 32, .b = 16};
	mov	a, #0x50
	mov	_bright_orange_color+1, a
	mov	a, #0x20
	mov	_bright_orange_color+0, a
	mov	a, #0x10
	mov	_bright_orange_color+2, a
;	main.c: 72: color_t bright_blue_color = {.r = 16, .g = 16, .b = 128};
	mov	a, #0x10
	mov	_bright_blue_color+1, a
	mov	a, #0x10
	mov	_bright_blue_color+0, a
	mov	a, #0x80
	mov	_bright_blue_color+2, a
;	main.c: 73: color_t off_color = {.r = 0, .g = 0, .b = 0};
	clear	_off_color+1
	clear	_off_color+0
	clear	_off_color+2
;	main.c: 77: volatile uint8_t bytes = LED_COUNT * 3;
	mov	a, #0x0c
	mov	_bytes+0, a
;	main.c: 78: volatile uint8_t byte_t = 0;
	clear	_byte_t+0
;	main.c: 80: volatile uint8_t byte_ctr = 0;
	clear	_byte_ctr+0
;	main.c: 81: volatile uint8_t button_ctr = 0;
	clear	_button_ctr+0
;	main.c: 82: volatile uint8_t button_down = 0;
	clear	_button_down+0
;	main.c: 83: volatile uint8_t pattern_count = 0;
	clear	_pattern_count+0
;	main.c: 84: volatile uint8_t pattern_index = 0;
	clear	_pattern_index+0
;	main.c: 85: volatile uint8_t pattern_step = 0;
	clear	_pattern_step+0
;	main.c: 86: volatile uint8_t tone_out_ctr = 0;
	clear	_tone_out_ctr+0
;	main.c: 87: volatile uint8_t tone_time = 0;
	clear	_tone_time+0
;	main.c: 88: volatile uint16_t touch_base = 0;
	clear	_touch_base+0
	clear	_touch_base+1
;	main.c: 89: volatile uint16_t last_touch = 0;
	clear	_last_touch+0
	clear	_last_touch+1
;	main.c: 90: volatile uint8_t resample_count = 0;
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
;	main.c: 92: void touch_init() {
;	-----------------------------------------
;	 function touch_init
;	-----------------------------------------
_touch_init:
;	main.c: 94: TS = TS_TP_CLK_IHRC_DIV2 | TS_TP_VREF_VCC05 | TS_DISCHARGE_WAIT_128CLOCKS;
	mov	a, #0x13
	mov.io	__ts, a
;	main.c: 95: TPS2 = TPS2_TOUCH_TYPE_B | TPS2_VREFNONFLOAT_ALWAYS_ON;
	mov	a, #0x41
	mov.io	__tps2, a
;	main.c: 96: PAC &= ~(BTN_bm); // Pin 4 as in
	set0.io	__pac, #4
;	main.c: 97: PADIER &= ~(BTN_bm | CS_bm); // Disable digital input for touch and CS pins
	mov.io	a, __padier
	and	a, #0x6f
	mov.io	__padier, a
;	main.c: 98: }
	ret
;	main.c: 100: void copy_to_buff(color_t pixel, uint8_t len)
;	-----------------------------------------
;	 function copy_to_buff
;	-----------------------------------------
_copy_to_buff:
;	main.c: 102: for (uint8_t i = 0; i < len; i++)
	clear	_copy_to_buff_sloc0_1_0+0
00103$:
	mov	a, _copy_to_buff_sloc0_1_0+0
	sub	a, _copy_to_buff_PARM_2+0
	t1sn.io	f, c
	ret
00120$:
;	main.c: 104: pixel_buff[i].r = pixel.r;
	mov	a, _copy_to_buff_sloc0_1_0+0
	sl	a
	add	a, _copy_to_buff_sloc0_1_0+0
	mov	_copy_to_buff_sloc1_1_0+0, a
	mov	a, #(_pixel_buff + 0)
	add	a, _copy_to_buff_sloc1_1_0+0
	add	a, #0x01
	push	af
	mov	a, _copy_to_buff_PARM_1+1
	mov	p, a
	pop	af
	xch	a, p
	idxm	p, a
;	main.c: 105: pixel_buff[i].g = pixel.g;
	mov	a, #(_pixel_buff + 0)
	add	a, _copy_to_buff_sloc1_1_0+0
	push	af
	mov	a, _copy_to_buff_PARM_1+0
	mov	p, a
	pop	af
	xch	a, p
	idxm	p, a
;	main.c: 106: pixel_buff[i].b = pixel.b;
	mov	a, #(_pixel_buff + 0)
	add	a, _copy_to_buff_sloc1_1_0+0
	add	a, #0x02
	push	af
	mov	a, _copy_to_buff_PARM_1+2
	mov	p, a
	pop	af
	xch	a, p
	idxm	p, a
;	main.c: 102: for (uint8_t i = 0; i < len; i++)
	inc	_copy_to_buff_sloc0_1_0+0
	goto	00103$
;	main.c: 108: }
	ret
;	main.c: 110: void start_tone_out_startup()
;	-----------------------------------------
;	 function start_tone_out_startup
;	-----------------------------------------
_start_tone_out_startup:
;	main.c: 112: tone_out_ctr = 0;
	clear	_tone_out_ctr+0
;	main.c: 113: tone_time = STARTUP_TONE_TIME;
;	main.c: 114: TM2B = STARTUP_BOUNDS;
	mov a, #0x0a
	mov  _tone_time+0, a
	mov.io	__tm2b, a
;	main.c: 115: TM2C |= TM2C_CLK_IHRC;
	set1.io	__tm2c, #5
;	main.c: 116: }
	ret
;	main.c: 118: void start_tone_out_button()
;	-----------------------------------------
;	 function start_tone_out_button
;	-----------------------------------------
_start_tone_out_button:
;	main.c: 120: tone_out_ctr = 0;
	clear	_tone_out_ctr+0
;	main.c: 121: tone_time = BUTTON_TONE_TIME;
;	main.c: 122: TM2B = BUTTON_BOUNDS;
	mov a, #0x05
	mov  _tone_time+0, a
	mov.io	__tm2b, a
;	main.c: 123: TM2C |= TM2C_CLK_IHRC;
	set1.io	__tm2c, #5
;	main.c: 124: }
	ret
;	main.c: 126: void stop_tone_out()
;	-----------------------------------------
;	 function stop_tone_out
;	-----------------------------------------
_stop_tone_out:
;	main.c: 128: tone_time = 0;
	clear	_tone_time+0
;	main.c: 129: TM2C &= 0x0F; // 0 out the top 4 bits for clock source
	mov.io	a, __tm2c
	and	a, #0x0f
	mov.io	__tm2c, a
;	main.c: 130: }
	ret
;	main.c: 132: void output_leds()
;	-----------------------------------------
;	 function output_leds
;	-----------------------------------------
_output_leds:
;	main.c: 134: __asm__("    mov a, _bytes              ;move our byte count into a");
	mov	a, _bytes              ;move our byte count into a
;	main.c: 135: __asm__("    mov _byte_ctr, a           ;move a into our index counter");
	mov	_byte_ctr, a           ;move a into our index counter
;	main.c: 136: __asm__("    mov	a, #(_pixel_buff)   ;load the address of the array into a");
	mov	a, #(_pixel_buff)   ;load the address of the array into a
;	main.c: 137: __asm__("    mov	p, a                ;put that address into p (a mem location)");
	mov	p, a                ;put that address into p (a mem location)
;	main.c: 138: __asm__("00010$:");
	00010$:
;	main.c: 139: __asm__("    idxm	a, p                ;load the byte data from the array into a");
	idxm	a, p                ;load the byte data from the array into a
;	main.c: 140: __asm__("    inc p                      ;inc p to the next address");
	inc	p                      ;inc p to the next address
;	main.c: 141: __asm__("    mov	_byte_t, a          ;load the byte data into byte_t");
	mov	_byte_t, a          ;load the byte data into byte_t
;	main.c: 142: __asm__("    mov a, #0x08               ;reset the bit count");
	mov	a, #0x08               ;reset the bit count
;	main.c: 143: __asm__("00011$:");
	00011$:
;	main.c: 144: __asm__("    ;output bit");
;output	bit
;	main.c: 145: __asm__("    set1.io __pa, #5           ;set the output pin high");
	set1.io	__pa, #5           ;set the output pin high
;	main.c: 146: __asm__("    t1sn _byte_t, #7           ;if the current MSB is 1, skip setting the pin low now");
	t1sn	_byte_t, #7           ;if the current MSB is 1, skip setting the pin low now
;	main.c: 147: __asm__("    set0.io __pa, #5           ;set the output pin low");
	set0.io	__pa, #5           ;set the output pin low
;	main.c: 148: __asm__("    nop                        ;wait one cycle");
	nop	                       ;wait one cycle
;	main.c: 149: __asm__("    set0.io __pa, #5           ;set the output pin low");
	set0.io	__pa, #5           ;set the output pin low
;	main.c: 150: __asm__("    sl _byte_t                 ;left-shift the data byte (the LEDs are MSB first)");
	sl	_byte_t                 ;left-shift the data byte (the LEDs are MSB first)
;	main.c: 151: __asm__("    dzsn a                     ;dec a and skip next instruction if 0");
	dzsn	a                     ;dec a and skip next instruction if 0
;	main.c: 152: __asm__("    goto 00011$                ;jump back to 00011");
	goto	00011$                ;jump back to 00011
;	main.c: 153: __asm__("    dzsn _byte_ctr             ;dec our index counter and skip the goto if 0");
	dzsn	_byte_ctr             ;dec our index counter and skip the goto if 0
;	main.c: 154: __asm__("    goto	00010$              ;goto the next byte");
	goto	00010$              ;goto the next byte
;	main.c: 155: }
	ret
;	main.c: 157: void update_pattern()
;	-----------------------------------------
;	 function update_pattern
;	-----------------------------------------
_update_pattern:
;	main.c: 162: switch (pattern_index)
	mov	a, _pattern_index+0
	cneqsn	a, #0x00
	goto	00101$
00169$:
	cneqsn	a, #0x01
	goto	00102$
00171$:
	cneqsn	a, #0x02
	goto	00103$
00173$:
	goto	00104$
;	main.c: 164: case 0:
00101$:
;	main.c: 165: copy_to_buff(off_color, LED_COUNT);
	mov	a, #(_off_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #(_copy_to_buff_PARM_1 + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
	mov	a, #0x04
	mov	_copy_to_buff_PARM_2+0, a
	goto	_copy_to_buff
;	main.c: 166: return;
	ret
;	main.c: 167: case 1:
00102$:
;	main.c: 168: copy_to_buff(blue_color, LED_COUNT);
	mov	a, #(_blue_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #(_copy_to_buff_PARM_1 + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
	mov	a, #0x04
	mov	_copy_to_buff_PARM_2+0, a
	call	_copy_to_buff
;	main.c: 169: bright = bright_blue_color;
	mov	a, #(_update_pattern_bright_10000_20 + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_bright_blue_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 170: break;
	goto	00104$
;	main.c: 171: case 2:
00103$:
;	main.c: 172: copy_to_buff(orange_color, LED_COUNT);
	mov	a, #(_orange_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #(_copy_to_buff_PARM_1 + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
	mov	a, #0x04
	mov	_copy_to_buff_PARM_2+0, a
	call	_copy_to_buff
;	main.c: 173: bright = bright_orange_color;
	mov	a, #(_update_pattern_bright_10000_20 + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_bright_orange_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 175: }
00104$:
;	main.c: 177: pattern_step++;
	mov	a, _pattern_step+0
	add	a, #0x01
	mov	_pattern_step+0, a
;	main.c: 179: switch (pattern_step)
	mov	a, _pattern_step+0
	cneqsn	a, #0x01
	goto	00105$
00175$:
	cneqsn	a, #0x03
	goto	00106$
00177$:
	cneqsn	a, #0x04
	goto	00107$
00179$:
	cneqsn	a, #0x06
	goto	00109$
00181$:
	cneqsn	a, #0x07
	goto	00109$
00183$:
	cneqsn	a, #0x0a
	goto	00110$
00185$:
	ret
;	main.c: 181: case 1:
00105$:
;	main.c: 182: pixel_buff[3] = bright;
	mov	a, #(_pixel_buff + 9)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_update_pattern_bright_10000_20 + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	goto	___memcpy
;	main.c: 183: break;
	ret
;	main.c: 184: case 3:
00106$:
;	main.c: 185: pixel_buff[2] = bright;
	mov	a, #(_pixel_buff + 6)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_update_pattern_bright_10000_20 + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	goto	___memcpy
;	main.c: 186: break;
	ret
;	main.c: 187: case 4:
00107$:
;	main.c: 188: pixel_buff[1] = bright;
	mov	a, #(_pixel_buff + 3)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_update_pattern_bright_10000_20 + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	goto	___memcpy
;	main.c: 189: break;
	ret
;	main.c: 191: case 7:
00109$:
;	main.c: 192: pixel_buff[0] = bright;
	mov	a, #(_pixel_buff + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_update_pattern_bright_10000_20 + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	goto	___memcpy
;	main.c: 193: break;
	ret
;	main.c: 194: case 10:
00110$:
;	main.c: 195: pattern_step = 0;
	clear	_pattern_step+0
;	main.c: 197: }
;	main.c: 198: }
	ret
;	main.c: 200: uint16_t read_touch_raw() {
;	-----------------------------------------
;	 function read_touch_raw
;	-----------------------------------------
_read_touch_raw:
;	main.c: 202: TKE1 = TKE1_TK6_PA4; // Use PA4 as touch input
	mov	a, #0x40
	mov.io	__tke1, a
;	main.c: 203: TKE2 = 0; // Disable other channels
	mov	a, #0x00
	mov.io	__tke2, a
;	main.c: 204: TCC = TCC_TK_RUN;
	mov	a, #0x10
	mov.io	__tcc, a
;	main.c: 206: while(TCC & TCC_TK_RUN); // Wait for measurement to complete
00101$:
	t0sn.io	__tcc, #4
	goto	00101$
00118$:
;	main.c: 208: return (TKCH << 8) | TKCL; 
	mov.io	a, __tkch
	mov	p, a
	mov.io	a, __tkcl
;	main.c: 209: }
	ret
;	main.c: 211: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 214: __disgint();
	disgint
;	main.c: 215: CLKMD |= 0x10; // First enable IHRC
	set1.io	__clkmd, #4
;	main.c: 216: CLKMD = 0x34;  // Switch to IHRC/2 but leave ILRC on
	mov	a, #0x34
	mov.io	__clkmd, a
;	main.c: 217: CLKMD &= ~(CLKMD_ENABLE_WATCHDOG);
	set0.io	__clkmd, #1
;	main.c: 218: PAC = LED_bm;     // Pin 5 as out
	mov	a, #0x20
	mov.io	__pac, a
;	main.c: 231: touch_init();    
	call	_touch_init
;	main.c: 239: INTEN = INTEN_TM3;
	mov	a, #0x80
	mov.io	__inten, a
;	main.c: 242: TM3B = 10;
	mov	a, #0x0a
	mov.io	__tm3b, a
;	main.c: 243: TM3C = TM3C_CLK_ILRC | TM3C_OUT_DISABLE | TM3C_MODE_PERIOD;
	mov	a, #0x40
	mov.io	__tm3c, a
;	main.c: 244: TM3S = TM3S_PRESCALE_DIV64; // should also start the timer
	mov	a, #0x60
	mov.io	__tm3s, a
;	main.c: 246: TM2B = 10;
	mov	a, #0x0a
	mov.io	__tm2b, a
;	main.c: 247: TM2C = TM2C_CLK_DISABLE | TM3C_MODE_PERIOD; //| TM2C_OUT_PA3 
	mov	a, #0x00
	mov.io	__tm2c, a
;	main.c: 248: TM2S = TM2S_PRESCALE_DIV16;
	mov	a, #0x40
	mov.io	__tm2s, a
;	main.c: 251: touch_base = read_touch_raw();
	call	_read_touch_raw
	mov	_touch_base+0, a
	mov	a, p
	mov	_touch_base+1, a
;	main.c: 254: __engint();
	engint
;	main.c: 256: start_tone_out_startup();
	call	_start_tone_out_startup
;	main.c: 258: while (1)
00102$:
	goto	00102$
;	main.c: 260: }
	ret
;	main.c: 262: void interrupt(void) __interrupt(0)
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	main.c: 265: if (INTRQ & INTRQ_TM3) // Timer3 interrupt request
	t1sn.io	__intrq, #7
	goto	00121$
00177$:
;	main.c: 269: uint16_t touch_value = read_touch_raw();
	call	_read_touch_raw
	mov	_interrupt_sloc2_1_0+0, a
	mov	a, p
	mov	_interrupt_sloc2_1_0+1, a
;	main.c: 271: if (touch_value == last_touch){
	mov	a, _interrupt_sloc2_1_0+0
	ceqsn	a, _last_touch+0
	goto	00102$
00178$:
	mov	a, _interrupt_sloc2_1_0+1
	ceqsn	a, _last_touch+1
	goto	00102$
00179$:
;	main.c: 272: resample_count++;
	mov	a, _resample_count+0
	add	a, #0x01
	mov	_resample_count+0, a
	goto	00103$
00102$:
;	main.c: 274: resample_count = 0;
	clear	_resample_count+0
;	main.c: 275: last_touch = touch_value;
	mov	a, _interrupt_sloc2_1_0+0
	mov	_last_touch+0, a
	mov	a, _interrupt_sloc2_1_0+1
	mov	_last_touch+1, a
00103$:
;	main.c: 278: if (resample_count >= RESAMPLE_BASE_COUNT) {
	mov	a, _resample_count+0
	sub	a, #0x64
	t0sn.io	f, c
	goto	00105$
00180$:
;	main.c: 279: touch_base = touch_value;
	mov	a, _interrupt_sloc2_1_0+0
	mov	_touch_base+0, a
	mov	a, _interrupt_sloc2_1_0+1
	mov	_touch_base+1, a
;	main.c: 280: resample_count = 0;
	clear	_resample_count+0
00105$:
;	main.c: 286: if (touch_value < touch_base - TOUCH_THRESHOLD)
	mov	a, _touch_base+0
	sub	a, #0x05
	mov	_interrupt_sloc3_1_0+0, a
	mov	a, _touch_base+1
	subc	a
	mov	_interrupt_sloc3_1_0+1, a
	mov	a, _interrupt_sloc2_1_0+1
	mov	p, a
	mov	a, _interrupt_sloc2_1_0+0
	sub	a, _interrupt_sloc3_1_0+0
	mov	a, p
	subc	a, _interrupt_sloc3_1_0+1
	t1sn.io	f, c
	goto	00111$
00181$:
;	main.c: 292: if (!button_down)
	mov	a, _button_down+0
	ceqsn	a, #0x00
	goto	00112$
00182$:
;	main.c: 294: button_ctr++;
	mov	a, _button_ctr+0
	add	a, #0x01
	mov	_button_ctr+0, a
;	main.c: 296: if (button_ctr == BTN_DEBOUNCE_DELAY)
	mov	a, _button_ctr+0
	ceqsn	a, #0x05
	goto	00112$
00183$:
;	main.c: 298: button_down = 1;
	mov	a, #0x01
	mov	_button_down+0, a
;	main.c: 299: pattern_index = (pattern_index + 1) % 3;
	mov	a, _pattern_index+0
	add	a, #0x01
	mov	__modsint_PARM_1+0, a
	mov	a, #0x00
	addc	a
	mov	__modsint_PARM_1+1, a
	mov	a, #0x03
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	mov	_pattern_index+0, a
;	main.c: 300: pattern_step = 0;
	clear	_pattern_step+0
;	main.c: 301: start_tone_out_button();
	call	_start_tone_out_button
	goto	00112$
00111$:
;	main.c: 307: button_ctr = 0;
	clear	_button_ctr+0
;	main.c: 308: button_down = 0;
	clear	_button_down+0
00112$:
;	main.c: 311: pattern_count++;
	mov	a, _pattern_count+0
	add	a, #0x01
	mov	_pattern_count+0, a
;	main.c: 313: if (pattern_count == PATTERN_UPDATE_DELAY)
	mov	a, _pattern_count+0
	ceqsn	a, #0x19
	goto	00114$
00184$:
;	main.c: 315: update_pattern();
	call	_update_pattern
;	main.c: 316: output_leds();
	call	_output_leds
;	main.c: 317: pattern_count = 0;
	clear	_pattern_count+0
00114$:
;	main.c: 320: if (tone_time)
	mov	a, _tone_time+0
	cneqsn	a, #0x00
	goto	00118$
00185$:
;	main.c: 322: tone_out_ctr++;
	mov	a, _tone_out_ctr+0
	add	a, #0x01
	mov	_tone_out_ctr+0, a
;	main.c: 324: if (tone_out_ctr >= tone_time)
	mov	a, _tone_out_ctr+0
	sub	a, _tone_time+0
;	main.c: 326: stop_tone_out();
	t1sn.io	f, c
	call	_stop_tone_out
00118$:
;	main.c: 330: INTRQ &= ~INTRQ_TM3; // Clear interrupt flag
	set0.io	__intrq, #7
00121$:
;	main.c: 332: }
	pop	af
	mov	p, a
	pop	af
	reti
	.area CODE
	.area CONST
	.area CABS (ABS)
