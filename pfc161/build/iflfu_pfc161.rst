                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	
                                      7 	.optsdcc -mpdk14
                                      8 
                                      9 ; default segment ordering in RAM for linker
                                     10 	.area DATA
                                     11 	.area OSEG (OVR,DATA)
                                     12 
                                     13 ;--------------------------------------------------------
                                     14 ; Public variables in this module
                                     15 ;--------------------------------------------------------
                                     16 	.globl _interrupt
                                     17 	.globl _main
                                     18 	.globl _read_touch_raw
                                     19 	.globl _update_pattern
                                     20 	.globl _output_leds
                                     21 	.globl _stop_tone_out
                                     22 	.globl _start_tone_out_button
                                     23 	.globl _start_tone_out_startup
                                     24 	.globl _copy_to_buff
                                     25 	.globl _touch_init
                                     26 	.globl __t16c
                                     27 	.globl __rop
                                     28 	.globl __ilrcr
                                     29 	.globl __tm3b
                                     30 	.globl __tm3s
                                     31 	.globl __tm3ct
                                     32 	.globl __tm3c
                                     33 	.globl __lvdc
                                     34 	.globl __tkcl
                                     35 	.globl __tkch
                                     36 	.globl __tps2
                                     37 	.globl __tps
                                     38 	.globl __tke1
                                     39 	.globl __tke2
                                     40 	.globl __tcc
                                     41 	.globl __ts
                                     42 	.globl __tm2b
                                     43 	.globl __tm2s
                                     44 	.globl __tm2ct
                                     45 	.globl __tm2c
                                     46 	.globl __misclvr
                                     47 	.globl __bgtr
                                     48 	.globl __gpcs
                                     49 	.globl __gpcc
                                     50 	.globl __pbpl
                                     51 	.globl __pbph
                                     52 	.globl __pbc
                                     53 	.globl __pb
                                     54 	.globl __papl
                                     55 	.globl __paph
                                     56 	.globl __pac
                                     57 	.globl __pa
                                     58 	.globl __misc2
                                     59 	.globl __pbdier
                                     60 	.globl __padier
                                     61 	.globl __integs
                                     62 	.globl __ihrcr
                                     63 	.globl __eoscr
                                     64 	.globl __misc
                                     65 	.globl __t16m
                                     66 	.globl __intrq
                                     67 	.globl __inten
                                     68 	.globl __clkmd
                                     69 	.globl __sp
                                     70 	.globl __flag
                                     71 	.globl _copy_to_buff_PARM_2
                                     72 	.globl _copy_to_buff_PARM_1
                                     73 	.globl _touch_base
                                     74 	.globl _tone_time
                                     75 	.globl _tone_out_ctr
                                     76 	.globl _pattern_step
                                     77 	.globl _pattern_index
                                     78 	.globl _pattern_count
                                     79 	.globl _button_down
                                     80 	.globl _button_ctr
                                     81 	.globl _byte_ctr
                                     82 	.globl _byte_t
                                     83 	.globl _bytes
                                     84 	.globl _pixel_buff
                                     85 	.globl _off_color
                                     86 	.globl _bright_blue_color
                                     87 	.globl _bright_orange_color
                                     88 	.globl _blue_color
                                     89 	.globl _orange_color
                                     90 ;--------------------------------------------------------
                                     91 ; special function registers
                                     92 ;--------------------------------------------------------
                                     93 	.area RSEG (ABS)
      000000                         94 	.org 0x0000
                           000000    95 __flag	=	0x0000
                           000002    96 __sp	=	0x0002
                           000003    97 __clkmd	=	0x0003
                           000004    98 __inten	=	0x0004
                           000005    99 __intrq	=	0x0005
                           000006   100 __t16m	=	0x0006
                           000008   101 __misc	=	0x0008
                           00000A   102 __eoscr	=	0x000a
                           00000B   103 __ihrcr	=	0x000b
                           00000C   104 __integs	=	0x000c
                           00000D   105 __padier	=	0x000d
                           00000E   106 __pbdier	=	0x000e
                           00000F   107 __misc2	=	0x000f
                           000010   108 __pa	=	0x0010
                           000011   109 __pac	=	0x0011
                           000012   110 __paph	=	0x0012
                           000013   111 __papl	=	0x0013
                           000014   112 __pb	=	0x0014
                           000015   113 __pbc	=	0x0015
                           000016   114 __pbph	=	0x0016
                           000017   115 __pbpl	=	0x0017
                           000018   116 __gpcc	=	0x0018
                           000019   117 __gpcs	=	0x0019
                           00001A   118 __bgtr	=	0x001a
                           00001B   119 __misclvr	=	0x001b
                           00001C   120 __tm2c	=	0x001c
                           00001D   121 __tm2ct	=	0x001d
                           00001E   122 __tm2s	=	0x001e
                           00001F   123 __tm2b	=	0x001f
                           000020   124 __ts	=	0x0020
                           000021   125 __tcc	=	0x0021
                           000022   126 __tke2	=	0x0022
                           000024   127 __tke1	=	0x0024
                           000026   128 __tps	=	0x0026
                           000028   129 __tps2	=	0x0028
                           00002B   130 __tkch	=	0x002b
                           00002C   131 __tkcl	=	0x002c
                           00002D   132 __lvdc	=	0x002d
                           000032   133 __tm3c	=	0x0032
                           000033   134 __tm3ct	=	0x0033
                           000034   135 __tm3s	=	0x0034
                           000035   136 __tm3b	=	0x0035
                           000039   137 __ilrcr	=	0x0039
                           00003A   138 __rop	=	0x003a
      000000                        139 __t16c::
      000000                        140 	.ds 2
                                    141 ;--------------------------------------------------------
                                    142 ; ram data
                                    143 ;--------------------------------------------------------
                                    144 	.area DATA
      000002                        145 _orange_color::
      000002                        146 	.ds 3
      000005                        147 _blue_color::
      000005                        148 	.ds 3
      000008                        149 _bright_orange_color::
      000008                        150 	.ds 3
      00000B                        151 _bright_blue_color::
      00000B                        152 	.ds 3
      00000E                        153 _off_color::
      00000E                        154 	.ds 3
      000011                        155 _pixel_buff::
      000011                        156 	.ds 12
      00001D                        157 _bytes::
      00001D                        158 	.ds 1
      00001E                        159 _byte_t::
      00001E                        160 	.ds 1
      00001F                        161 _byte_ctr::
      00001F                        162 	.ds 1
      000020                        163 _button_ctr::
      000020                        164 	.ds 1
      000021                        165 _button_down::
      000021                        166 	.ds 1
      000022                        167 _pattern_count::
      000022                        168 	.ds 1
      000023                        169 _pattern_index::
      000023                        170 	.ds 1
      000024                        171 _pattern_step::
      000024                        172 	.ds 1
      000025                        173 _tone_out_ctr::
      000025                        174 	.ds 1
      000026                        175 _tone_time::
      000026                        176 	.ds 1
      000027                        177 _touch_base::
      000027                        178 	.ds 2
      000029                        179 _copy_to_buff_PARM_1:
      000029                        180 	.ds 3
      00002C                        181 _copy_to_buff_PARM_2:
      00002C                        182 	.ds 1
      00002D                        183 _copy_to_buff_sloc0_1_0:
      00002D                        184 	.ds 1
      00002E                        185 _copy_to_buff_sloc1_1_0:
      00002E                        186 	.ds 1
      00002F                        187 _update_pattern_bright_10000_20:
      00002F                        188 	.ds 3
      000032                        189 _interrupt_sloc2_1_0:
      000032                        190 	.ds 2
                                    191 ;--------------------------------------------------------
                                    192 ; overlayable items in ram
                                    193 ;--------------------------------------------------------
                                    194 ;--------------------------------------------------------
                                    195 ; Stack segment in internal ram
                                    196 ;--------------------------------------------------------
                                    197 	.area SSEG
      00004B                        198 __start__stack:
      00004B                        199 	.ds	1
                                    200 
                                    201 ;--------------------------------------------------------
                                    202 ; absolute external ram data
                                    203 ;--------------------------------------------------------
                                    204 	.area DABS (ABS)
                                    205 ;--------------------------------------------------------
                                    206 ; interrupt vector
                                    207 ;--------------------------------------------------------
                                    208 	.area HOME
      000022                        209 __interrupt_vect:
                                    210 	.area	HEADER (ABS)
      000020                        211 	.org	 0x0020
      000020 43 31                  212 	goto	_interrupt
                                    213 ;--------------------------------------------------------
                                    214 ; global & static initialisations
                                    215 ;--------------------------------------------------------
                                    216 	.area HOME
                                    217 	.area GSINIT
                                    218 	.area GSFINAL
                                    219 	.area GSINIT
                                    220 	.area	PREG (ABS)
      000000                        221 	.org 0x00
      000000                        222 p::
      000000                        223 	.ds 2
                                    224 	.area	HEADER (ABS)
      000000                        225 	.org 0x0000
      000000 00 00                  226 	nop
      000002 01 13                  227 	clear	p+1
      000004 3D 2F                  228 	mov	a, #s_OSEG
      000006 0F 28                  229 	add	a, #l_OSEG + 1
      000008 FE 2C                  230 	and	a, #0xfe
      00000A 82 01                  231 	mov.io	sp, a
      00000C 19 3A                  232 	call	___sdcc_external_startup
      00000E 00 2B                  233 	cneqsn	a, #0x00
      000010 12 30                  234 	goto	__sdcc_init_data
      000012 11 30                  235 	goto	__sdcc_program_startup
                                    236 	.area GSINIT
      000024                        237 __sdcc_init_data:
      000024 02 2F                  238 	mov	a, #s_DATA
      000026 80 0B                  239 	mov	p, a
      000028 19 30                  240 	goto	00002$
      00002A                        241 00001$:
      00002A 00 2F                  242 	mov	a, #0x00
      00002C 80 03                  243 	idxm	p, a
      00002E 00 12                  244 	inc	p
      000030 02 2F                  245 	mov	a, #s_DATA
      000032                        246 00002$:
      000032 3B 28                  247 	add	a, #l_DATA
      000034 00 17                  248 	ceqsn	a, p
      000036 15 30                  249 	goto	00001$
                                    250 ;	main.c: 66: color_t orange_color = {.r = 64, .g = 16, .b = 0};
      000038 40 2F                  251 	mov	a, #0x40
      00003A 83 0B                  252 	mov	_orange_color+1, a
      00003C 10 2F                  253 	mov	a, #0x10
      00003E 82 0B                  254 	mov	_orange_color+0, a
      000040 04 13                  255 	clear	_orange_color+2
                                    256 ;	main.c: 67: color_t blue_color = {.r = 0, .g = 0, .b = 128};
      000042 06 13                  257 	clear	_blue_color+1
      000044 05 13                  258 	clear	_blue_color+0
      000046 80 2F                  259 	mov	a, #0x80
      000048 87 0B                  260 	mov	_blue_color+2, a
                                    261 ;	main.c: 68: color_t bright_orange_color = {.r = 80, .g = 32, .b = 16};
      00004A 50 2F                  262 	mov	a, #0x50
      00004C 89 0B                  263 	mov	_bright_orange_color+1, a
      00004E 20 2F                  264 	mov	a, #0x20
      000050 88 0B                  265 	mov	_bright_orange_color+0, a
      000052 10 2F                  266 	mov	a, #0x10
      000054 8A 0B                  267 	mov	_bright_orange_color+2, a
                                    268 ;	main.c: 69: color_t bright_blue_color = {.r = 16, .g = 16, .b = 128};
      000056 10 2F                  269 	mov	a, #0x10
      000058 8C 0B                  270 	mov	_bright_blue_color+1, a
      00005A 10 2F                  271 	mov	a, #0x10
      00005C 8B 0B                  272 	mov	_bright_blue_color+0, a
      00005E 80 2F                  273 	mov	a, #0x80
      000060 8D 0B                  274 	mov	_bright_blue_color+2, a
                                    275 ;	main.c: 70: color_t off_color = {.r = 0, .g = 0, .b = 0};
      000062 0F 13                  276 	clear	_off_color+1
      000064 0E 13                  277 	clear	_off_color+0
      000066 10 13                  278 	clear	_off_color+2
                                    279 ;	main.c: 74: volatile uint8_t bytes = LED_COUNT * 3;
      000068 0C 2F                  280 	mov	a, #0x0c
      00006A 9D 0B                  281 	mov	_bytes+0, a
                                    282 ;	main.c: 75: volatile uint8_t byte_t = 0;
      00006C 1E 13                  283 	clear	_byte_t+0
                                    284 ;	main.c: 77: volatile uint8_t byte_ctr = 0;
      00006E 1F 13                  285 	clear	_byte_ctr+0
                                    286 ;	main.c: 78: volatile uint8_t button_ctr = 0;
      000070 20 13                  287 	clear	_button_ctr+0
                                    288 ;	main.c: 79: volatile uint8_t button_down = 0;
      000072 21 13                  289 	clear	_button_down+0
                                    290 ;	main.c: 80: volatile uint8_t pattern_count = 0;
      000074 22 13                  291 	clear	_pattern_count+0
                                    292 ;	main.c: 81: volatile uint8_t pattern_index = 0;
      000076 23 13                  293 	clear	_pattern_index+0
                                    294 ;	main.c: 82: volatile uint8_t pattern_step = 0;
      000078 24 13                  295 	clear	_pattern_step+0
                                    296 ;	main.c: 83: volatile uint8_t tone_out_ctr = 0;
      00007A 25 13                  297 	clear	_tone_out_ctr+0
                                    298 ;	main.c: 84: volatile uint8_t tone_time = 0;
      00007C 26 13                  299 	clear	_tone_time+0
                                    300 ;	main.c: 85: volatile uint16_t touch_base = 0;
      00007E 27 13                  301 	clear	_touch_base+0
      000080 28 13                  302 	clear	_touch_base+1
                                    303 	.area GSFINAL
      000082 11 30                  304 	goto	__sdcc_program_startup
                                    305 ;--------------------------------------------------------
                                    306 ; Home
                                    307 ;--------------------------------------------------------
                                    308 	.area HOME
                                    309 	.area HOME
      000022                        310 __sdcc_program_startup:
      000022 25 31                  311 	goto	_main
                                    312 ;	return from main will return to caller
                                    313 ;--------------------------------------------------------
                                    314 ; code
                                    315 ;--------------------------------------------------------
                                    316 	.area CODE
                                    317 ;	main.c: 87: void touch_init() {
                                    318 ;	-----------------------------------------
                                    319 ;	 function touch_init
                                    320 ;	-----------------------------------------
      000084                        321 _touch_init:
                                    322 ;	main.c: 89: TS = TS_TP_CLK_IHRC_DIV2 | TS_TP_VREF_VCC05 | TS_DISCHARGE_WAIT_128CLOCKS;
      000084 13 2F                  323 	mov	a, #0x13
      000086 A0 01                  324 	mov.io	__ts, a
                                    325 ;	main.c: 90: TPS2 = TPS2_TOUCH_TYPE_B | TPS2_VREFNONFLOAT_ALWAYS_ON;
      000088 41 2F                  326 	mov	a, #0x41
      00008A A8 01                  327 	mov.io	__tps2, a
                                    328 ;	main.c: 91: PAC &= ~(BTN_bm); // Pin 4 as in
      00008C 11 1D                  329 	set0.io	__pac, #4
                                    330 ;	main.c: 92: PADIER &= ~(BTN_bm | CS_bm); // Disable digital input for touch and CS pins
      00008E CD 01                  331 	mov.io	a, __padier
      000090 6F 2C                  332 	and	a, #0x6f
      000092 8D 01                  333 	mov.io	__padier, a
                                    334 ;	main.c: 93: }
      000094 7A 00                  335 	ret
                                    336 ;	main.c: 95: void copy_to_buff(color_t pixel, uint8_t len)
                                    337 ;	-----------------------------------------
                                    338 ;	 function copy_to_buff
                                    339 ;	-----------------------------------------
      000096                        340 _copy_to_buff:
                                    341 ;	main.c: 97: for (uint8_t i = 0; i < len; i++)
      000096 2D 13                  342 	clear	_copy_to_buff_sloc0_1_0+0
      000098                        343 00103$:
      000098 AD 0F                  344 	mov	a, _copy_to_buff_sloc0_1_0+0
      00009A AC 0C                  345 	sub	a, _copy_to_buff_PARM_2+0
      00009C 40 1A                  346 	t1sn.io	f, c
      00009E 7A 00                  347 	ret
      0000A0                        348 00120$:
                                    349 ;	main.c: 99: pixel_buff[i].r = pixel.r;
      0000A0 AD 0F                  350 	mov	a, _copy_to_buff_sloc0_1_0+0
      0000A2 6B 00                  351 	sl	a
      0000A4 2D 0C                  352 	add	a, _copy_to_buff_sloc0_1_0+0
      0000A6 AE 0B                  353 	mov	_copy_to_buff_sloc1_1_0+0, a
      0000A8 11 2F                  354 	mov	a, #(_pixel_buff + 0)
      0000AA 2E 0C                  355 	add	a, _copy_to_buff_sloc1_1_0+0
      0000AC 01 28                  356 	add	a, #0x01
      0000AE 72 00                  357 	push	af
      0000B0 AA 0F                  358 	mov	a, _copy_to_buff_PARM_1+1
      0000B2 80 0B                  359 	mov	p, a
      0000B4 73 00                  360 	pop	af
      0000B6 80 13                  361 	xch	a, p
      0000B8 80 03                  362 	idxm	p, a
                                    363 ;	main.c: 100: pixel_buff[i].g = pixel.g;
      0000BA 11 2F                  364 	mov	a, #(_pixel_buff + 0)
      0000BC 2E 0C                  365 	add	a, _copy_to_buff_sloc1_1_0+0
      0000BE 72 00                  366 	push	af
      0000C0 A9 0F                  367 	mov	a, _copy_to_buff_PARM_1+0
      0000C2 80 0B                  368 	mov	p, a
      0000C4 73 00                  369 	pop	af
      0000C6 80 13                  370 	xch	a, p
      0000C8 80 03                  371 	idxm	p, a
                                    372 ;	main.c: 101: pixel_buff[i].b = pixel.b;
      0000CA 11 2F                  373 	mov	a, #(_pixel_buff + 0)
      0000CC 2E 0C                  374 	add	a, _copy_to_buff_sloc1_1_0+0
      0000CE 02 28                  375 	add	a, #0x02
      0000D0 72 00                  376 	push	af
      0000D2 AB 0F                  377 	mov	a, _copy_to_buff_PARM_1+2
      0000D4 80 0B                  378 	mov	p, a
      0000D6 73 00                  379 	pop	af
      0000D8 80 13                  380 	xch	a, p
      0000DA 80 03                  381 	idxm	p, a
                                    382 ;	main.c: 97: for (uint8_t i = 0; i < len; i++)
      0000DC 2D 12                  383 	inc	_copy_to_buff_sloc0_1_0+0
      0000DE 4C 30                  384 	goto	00103$
                                    385 ;	main.c: 103: }
      0000E0 7A 00                  386 	ret
                                    387 ;	main.c: 105: void start_tone_out_startup()
                                    388 ;	-----------------------------------------
                                    389 ;	 function start_tone_out_startup
                                    390 ;	-----------------------------------------
      0000E2                        391 _start_tone_out_startup:
                                    392 ;	main.c: 107: tone_out_ctr = 0;
      0000E2 25 13                  393 	clear	_tone_out_ctr+0
                                    394 ;	main.c: 108: tone_time = STARTUP_TONE_TIME;
                                    395 ;	main.c: 109: TM2B = STARTUP_BOUNDS;
      0000E4 0A 2F                  396 	mov a, #0x0a
      0000E6 A6 0B                  397 	mov  _tone_time+0, a
      0000E8 9F 01                  398 	mov.io	__tm2b, a
                                    399 ;	main.c: 110: TM2C |= TM2C_CLK_IHRC;
      0000EA 5C 1F                  400 	set1.io	__tm2c, #5
                                    401 ;	main.c: 111: }
      0000EC 7A 00                  402 	ret
                                    403 ;	main.c: 113: void start_tone_out_button()
                                    404 ;	-----------------------------------------
                                    405 ;	 function start_tone_out_button
                                    406 ;	-----------------------------------------
      0000EE                        407 _start_tone_out_button:
                                    408 ;	main.c: 115: tone_out_ctr = 0;
      0000EE 25 13                  409 	clear	_tone_out_ctr+0
                                    410 ;	main.c: 116: tone_time = BUTTON_TONE_TIME;
                                    411 ;	main.c: 117: TM2B = BUTTON_BOUNDS;
      0000F0 05 2F                  412 	mov a, #0x05
      0000F2 A6 0B                  413 	mov  _tone_time+0, a
      0000F4 9F 01                  414 	mov.io	__tm2b, a
                                    415 ;	main.c: 118: TM2C |= TM2C_CLK_IHRC;
      0000F6 5C 1F                  416 	set1.io	__tm2c, #5
                                    417 ;	main.c: 119: }
      0000F8 7A 00                  418 	ret
                                    419 ;	main.c: 121: void stop_tone_out()
                                    420 ;	-----------------------------------------
                                    421 ;	 function stop_tone_out
                                    422 ;	-----------------------------------------
      0000FA                        423 _stop_tone_out:
                                    424 ;	main.c: 123: tone_time = 0;
      0000FA 26 13                  425 	clear	_tone_time+0
                                    426 ;	main.c: 124: TM2C &= 0x0F; // 0 out the top 4 bits for clock source
      0000FC DC 01                  427 	mov.io	a, __tm2c
      0000FE 0F 2C                  428 	and	a, #0x0f
      000100 9C 01                  429 	mov.io	__tm2c, a
                                    430 ;	main.c: 125: }
      000102 7A 00                  431 	ret
                                    432 ;	main.c: 127: void output_leds()
                                    433 ;	-----------------------------------------
                                    434 ;	 function output_leds
                                    435 ;	-----------------------------------------
      000104                        436 _output_leds:
                                    437 ;	main.c: 129: __asm__("    mov a, _bytes              ;move our byte count into a");
      000104 9D 0F                  438 	mov	a, _bytes              ;move our byte count into a
                                    439 ;	main.c: 130: __asm__("    mov _byte_ctr, a           ;move a into our index counter");
      000106 9F 0B                  440 	mov	_byte_ctr, a           ;move a into our index counter
                                    441 ;	main.c: 131: __asm__("    mov	a, #(_pixel_buff)   ;load the address of the array into a");
      000108 11 2F                  442 	mov	a, #(_pixel_buff)   ;load the address of the array into a
                                    443 ;	main.c: 132: __asm__("    mov	p, a                ;put that address into p (a mem location)");
      00010A 80 0B                  444 	mov	p, a                ;put that address into p (a mem location)
                                    445 ;	main.c: 133: __asm__("00010$:");
      00010C                        446 	00010$:
                                    447 ;	main.c: 134: __asm__("    idxm	a, p                ;load the byte data from the array into a");
      00010C 81 03                  448 	idxm	a, p                ;load the byte data from the array into a
                                    449 ;	main.c: 135: __asm__("    inc p                      ;inc p to the next address");
      00010E 00 12                  450 	inc	p                      ;inc p to the next address
                                    451 ;	main.c: 136: __asm__("    mov	_byte_t, a          ;load the byte data into byte_t");
      000110 9E 0B                  452 	mov	_byte_t, a          ;load the byte data into byte_t
                                    453 ;	main.c: 137: __asm__("    mov a, #0x08               ;reset the bit count");
      000112 08 2F                  454 	mov	a, #0x08               ;reset the bit count
                                    455 ;	main.c: 138: __asm__("00011$:");
      000114                        456 	00011$:
                                    457 ;	main.c: 139: __asm__("    ;output bit");
                                    458 ;output	bit
                                    459 ;	main.c: 140: __asm__("    set1.io __pa, #5           ;set the output pin high");
      000114 50 1F                  460 	set1.io	__pa, #5           ;set the output pin high
                                    461 ;	main.c: 141: __asm__("    t1sn _byte_t, #7           ;if the current MSB is 1, skip setting the pin low now");
      000116 DE 23                  462 	t1sn	_byte_t, #7           ;if the current MSB is 1, skip setting the pin low now
                                    463 ;	main.c: 142: __asm__("    set0.io __pa, #5           ;set the output pin low");
      000118 50 1D                  464 	set0.io	__pa, #5           ;set the output pin low
                                    465 ;	main.c: 143: __asm__("    nop                        ;wait one cycle");
      00011A 00 00                  466 	nop	                       ;wait one cycle
                                    467 ;	main.c: 144: __asm__("    set0.io __pa, #5           ;set the output pin low");
      00011C 50 1D                  468 	set0.io	__pa, #5           ;set the output pin low
                                    469 ;	main.c: 145: __asm__("    sl _byte_t                 ;left-shift the data byte (the LEDs are MSB first)");
      00011E 9E 15                  470 	sl	_byte_t                 ;left-shift the data byte (the LEDs are MSB first)
                                    471 ;	main.c: 146: __asm__("    dzsn a                     ;dec a and skip next instruction if 0");
      000120 63 00                  472 	dzsn	a                     ;dec a and skip next instruction if 0
                                    473 ;	main.c: 147: __asm__("    goto 00011$                ;jump back to 00011");
      000122 8A 30                  474 	goto	00011$                ;jump back to 00011
                                    475 ;	main.c: 148: __asm__("    dzsn _byte_ctr             ;dec our index counter and skip the goto if 0");
      000124 9F 11                  476 	dzsn	_byte_ctr             ;dec our index counter and skip the goto if 0
                                    477 ;	main.c: 149: __asm__("    goto	00010$              ;goto the next byte");
      000126 86 30                  478 	goto	00010$              ;goto the next byte
                                    479 ;	main.c: 150: }
      000128 7A 00                  480 	ret
                                    481 ;	main.c: 152: void update_pattern()
                                    482 ;	-----------------------------------------
                                    483 ;	 function update_pattern
                                    484 ;	-----------------------------------------
      00012A                        485 _update_pattern:
                                    486 ;	main.c: 157: switch (pattern_index)
      00012A A3 0F                  487 	mov	a, _pattern_index+0
      00012C 00 2B                  488 	cneqsn	a, #0x00
      00012E 9D 30                  489 	goto	00101$
      000130                        490 00169$:
      000130 01 2B                  491 	cneqsn	a, #0x01
      000132 AB 30                  492 	goto	00102$
      000134                        493 00171$:
      000134 02 2B                  494 	cneqsn	a, #0x02
      000136 C3 30                  495 	goto	00103$
      000138                        496 00173$:
      000138 DA 30                  497 	goto	00104$
                                    498 ;	main.c: 159: case 0:
      00013A                        499 00101$:
                                    500 ;	main.c: 160: copy_to_buff(off_color, LED_COUNT);
      00013A 0E 2F                  501 	mov	a, #(_off_color + 0)
      00013C BF 0B                  502 	mov	___memcpy_PARM_2+0, a
      00013E 40 13                  503 	clear	___memcpy_PARM_2+1
      000140 29 2F                  504 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      000142 BD 0B                  505 	mov	___memcpy_PARM_1+0, a
      000144 3E 13                  506 	clear	___memcpy_PARM_1+1
      000146 03 2F                  507 	mov	a, #0x03
      000148 C1 0B                  508 	mov	___memcpy_PARM_3+0, a
      00014A 42 13                  509 	clear	___memcpy_PARM_3+1
      00014C 89 39                  510 	call	___memcpy
      00014E 04 2F                  511 	mov	a, #0x04
      000150 AC 0B                  512 	mov	_copy_to_buff_PARM_2+0, a
      000152 4B 30                  513 	goto	_copy_to_buff
                                    514 ;	main.c: 161: return;
      000154 7A 00                  515 	ret
                                    516 ;	main.c: 162: case 1:
      000156                        517 00102$:
                                    518 ;	main.c: 163: copy_to_buff(blue_color, LED_COUNT);
      000156 05 2F                  519 	mov	a, #(_blue_color + 0)
      000158 BF 0B                  520 	mov	___memcpy_PARM_2+0, a
      00015A 40 13                  521 	clear	___memcpy_PARM_2+1
      00015C 29 2F                  522 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      00015E BD 0B                  523 	mov	___memcpy_PARM_1+0, a
      000160 3E 13                  524 	clear	___memcpy_PARM_1+1
      000162 03 2F                  525 	mov	a, #0x03
      000164 C1 0B                  526 	mov	___memcpy_PARM_3+0, a
      000166 42 13                  527 	clear	___memcpy_PARM_3+1
      000168 89 39                  528 	call	___memcpy
      00016A 04 2F                  529 	mov	a, #0x04
      00016C AC 0B                  530 	mov	_copy_to_buff_PARM_2+0, a
      00016E 4B 38                  531 	call	_copy_to_buff
                                    532 ;	main.c: 164: bright = bright_blue_color;
      000170 2F 2F                  533 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      000172 BD 0B                  534 	mov	___memcpy_PARM_1+0, a
      000174 3E 13                  535 	clear	___memcpy_PARM_1+1
      000176 0B 2F                  536 	mov	a, #(_bright_blue_color + 0)
      000178 BF 0B                  537 	mov	___memcpy_PARM_2+0, a
      00017A 40 13                  538 	clear	___memcpy_PARM_2+1
      00017C 03 2F                  539 	mov	a, #0x03
      00017E C1 0B                  540 	mov	___memcpy_PARM_3+0, a
      000180 42 13                  541 	clear	___memcpy_PARM_3+1
      000182 89 39                  542 	call	___memcpy
                                    543 ;	main.c: 165: break;
      000184 DA 30                  544 	goto	00104$
                                    545 ;	main.c: 166: case 2:
      000186                        546 00103$:
                                    547 ;	main.c: 167: copy_to_buff(orange_color, LED_COUNT);
      000186 02 2F                  548 	mov	a, #(_orange_color + 0)
      000188 BF 0B                  549 	mov	___memcpy_PARM_2+0, a
      00018A 40 13                  550 	clear	___memcpy_PARM_2+1
      00018C 29 2F                  551 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      00018E BD 0B                  552 	mov	___memcpy_PARM_1+0, a
      000190 3E 13                  553 	clear	___memcpy_PARM_1+1
      000192 03 2F                  554 	mov	a, #0x03
      000194 C1 0B                  555 	mov	___memcpy_PARM_3+0, a
      000196 42 13                  556 	clear	___memcpy_PARM_3+1
      000198 89 39                  557 	call	___memcpy
      00019A 04 2F                  558 	mov	a, #0x04
      00019C AC 0B                  559 	mov	_copy_to_buff_PARM_2+0, a
      00019E 4B 38                  560 	call	_copy_to_buff
                                    561 ;	main.c: 168: bright = bright_orange_color;
      0001A0 2F 2F                  562 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      0001A2 BD 0B                  563 	mov	___memcpy_PARM_1+0, a
      0001A4 3E 13                  564 	clear	___memcpy_PARM_1+1
      0001A6 08 2F                  565 	mov	a, #(_bright_orange_color + 0)
      0001A8 BF 0B                  566 	mov	___memcpy_PARM_2+0, a
      0001AA 40 13                  567 	clear	___memcpy_PARM_2+1
      0001AC 03 2F                  568 	mov	a, #0x03
      0001AE C1 0B                  569 	mov	___memcpy_PARM_3+0, a
      0001B0 42 13                  570 	clear	___memcpy_PARM_3+1
      0001B2 89 39                  571 	call	___memcpy
                                    572 ;	main.c: 170: }
      0001B4                        573 00104$:
                                    574 ;	main.c: 172: pattern_step++;
      0001B4 A4 0F                  575 	mov	a, _pattern_step+0
      0001B6 01 28                  576 	add	a, #0x01
      0001B8 A4 0B                  577 	mov	_pattern_step+0, a
                                    578 ;	main.c: 174: switch (pattern_step)
      0001BA A4 0F                  579 	mov	a, _pattern_step+0
      0001BC 01 2B                  580 	cneqsn	a, #0x01
      0001BE EB 30                  581 	goto	00105$
      0001C0                        582 00175$:
      0001C0 03 2B                  583 	cneqsn	a, #0x03
      0001C2 F6 30                  584 	goto	00106$
      0001C4                        585 00177$:
      0001C4 04 2B                  586 	cneqsn	a, #0x04
      0001C6 01 31                  587 	goto	00107$
      0001C8                        588 00179$:
      0001C8 06 2B                  589 	cneqsn	a, #0x06
      0001CA 0C 31                  590 	goto	00109$
      0001CC                        591 00181$:
      0001CC 07 2B                  592 	cneqsn	a, #0x07
      0001CE 0C 31                  593 	goto	00109$
      0001D0                        594 00183$:
      0001D0 0A 2B                  595 	cneqsn	a, #0x0a
      0001D2 17 31                  596 	goto	00110$
      0001D4                        597 00185$:
      0001D4 7A 00                  598 	ret
                                    599 ;	main.c: 176: case 1:
      0001D6                        600 00105$:
                                    601 ;	main.c: 177: pixel_buff[3] = bright;
      0001D6 1A 2F                  602 	mov	a, #(_pixel_buff + 9)
      0001D8 BD 0B                  603 	mov	___memcpy_PARM_1+0, a
      0001DA 3E 13                  604 	clear	___memcpy_PARM_1+1
      0001DC 2F 2F                  605 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      0001DE BF 0B                  606 	mov	___memcpy_PARM_2+0, a
      0001E0 40 13                  607 	clear	___memcpy_PARM_2+1
      0001E2 03 2F                  608 	mov	a, #0x03
      0001E4 C1 0B                  609 	mov	___memcpy_PARM_3+0, a
      0001E6 42 13                  610 	clear	___memcpy_PARM_3+1
      0001E8 89 31                  611 	goto	___memcpy
                                    612 ;	main.c: 178: break;
      0001EA 7A 00                  613 	ret
                                    614 ;	main.c: 179: case 3:
      0001EC                        615 00106$:
                                    616 ;	main.c: 180: pixel_buff[2] = bright;
      0001EC 17 2F                  617 	mov	a, #(_pixel_buff + 6)
      0001EE BD 0B                  618 	mov	___memcpy_PARM_1+0, a
      0001F0 3E 13                  619 	clear	___memcpy_PARM_1+1
      0001F2 2F 2F                  620 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      0001F4 BF 0B                  621 	mov	___memcpy_PARM_2+0, a
      0001F6 40 13                  622 	clear	___memcpy_PARM_2+1
      0001F8 03 2F                  623 	mov	a, #0x03
      0001FA C1 0B                  624 	mov	___memcpy_PARM_3+0, a
      0001FC 42 13                  625 	clear	___memcpy_PARM_3+1
      0001FE 89 31                  626 	goto	___memcpy
                                    627 ;	main.c: 181: break;
      000200 7A 00                  628 	ret
                                    629 ;	main.c: 182: case 4:
      000202                        630 00107$:
                                    631 ;	main.c: 183: pixel_buff[1] = bright;
      000202 14 2F                  632 	mov	a, #(_pixel_buff + 3)
      000204 BD 0B                  633 	mov	___memcpy_PARM_1+0, a
      000206 3E 13                  634 	clear	___memcpy_PARM_1+1
      000208 2F 2F                  635 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      00020A BF 0B                  636 	mov	___memcpy_PARM_2+0, a
      00020C 40 13                  637 	clear	___memcpy_PARM_2+1
      00020E 03 2F                  638 	mov	a, #0x03
      000210 C1 0B                  639 	mov	___memcpy_PARM_3+0, a
      000212 42 13                  640 	clear	___memcpy_PARM_3+1
      000214 89 31                  641 	goto	___memcpy
                                    642 ;	main.c: 184: break;
      000216 7A 00                  643 	ret
                                    644 ;	main.c: 186: case 7:
      000218                        645 00109$:
                                    646 ;	main.c: 187: pixel_buff[0] = bright;
      000218 11 2F                  647 	mov	a, #(_pixel_buff + 0)
      00021A BD 0B                  648 	mov	___memcpy_PARM_1+0, a
      00021C 3E 13                  649 	clear	___memcpy_PARM_1+1
      00021E 2F 2F                  650 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      000220 BF 0B                  651 	mov	___memcpy_PARM_2+0, a
      000222 40 13                  652 	clear	___memcpy_PARM_2+1
      000224 03 2F                  653 	mov	a, #0x03
      000226 C1 0B                  654 	mov	___memcpy_PARM_3+0, a
      000228 42 13                  655 	clear	___memcpy_PARM_3+1
      00022A 89 31                  656 	goto	___memcpy
                                    657 ;	main.c: 188: break;
      00022C 7A 00                  658 	ret
                                    659 ;	main.c: 189: case 10:
      00022E                        660 00110$:
                                    661 ;	main.c: 190: pattern_step = 0;
      00022E 24 13                  662 	clear	_pattern_step+0
                                    663 ;	main.c: 192: }
                                    664 ;	main.c: 193: }
      000230 7A 00                  665 	ret
                                    666 ;	main.c: 195: uint16_t read_touch_raw() {
                                    667 ;	-----------------------------------------
                                    668 ;	 function read_touch_raw
                                    669 ;	-----------------------------------------
      000232                        670 _read_touch_raw:
                                    671 ;	main.c: 197: TKE1 = TKE1_TK6_PA4; // Use PA4 as touch input
      000232 40 2F                  672 	mov	a, #0x40
      000234 A4 01                  673 	mov.io	__tke1, a
                                    674 ;	main.c: 198: TKE2 = 0; // Disable other channels
      000236 00 2F                  675 	mov	a, #0x00
      000238 A2 01                  676 	mov.io	__tke2, a
                                    677 ;	main.c: 199: TCC = TCC_TK_RUN;
      00023A 10 2F                  678 	mov	a, #0x10
      00023C A1 01                  679 	mov.io	__tcc, a
                                    680 ;	main.c: 201: while(TCC & TCC_TK_RUN); // Wait for measurement to complete
      00023E                        681 00101$:
      00023E 21 19                  682 	t0sn.io	__tcc, #4
      000240 1F 31                  683 	goto	00101$
      000242                        684 00118$:
                                    685 ;	main.c: 203: return (TKCH << 8) | TKCL; 
      000242 EB 01                  686 	mov.io	a, __tkch
      000244 80 0B                  687 	mov	p, a
      000246 EC 01                  688 	mov.io	a, __tkcl
                                    689 ;	main.c: 204: }
      000248 7A 00                  690 	ret
                                    691 ;	main.c: 206: void main(void)
                                    692 ;	-----------------------------------------
                                    693 ;	 function main
                                    694 ;	-----------------------------------------
      00024A                        695 _main:
                                    696 ;	main.c: 209: __disgint();
      00024A 79 00                  697 	disgint
                                    698 ;	main.c: 210: CLKMD |= 0x10; // First enable IHRC
      00024C 03 1F                  699 	set1.io	__clkmd, #4
                                    700 ;	main.c: 211: CLKMD = 0x34;  // Switch to IHRC/2 but leave ILRC on
      00024E 34 2F                  701 	mov	a, #0x34
      000250 83 01                  702 	mov.io	__clkmd, a
                                    703 ;	main.c: 212: CLKMD &= ~(CLKMD_ENABLE_WATCHDOG);
      000252 43 1C                  704 	set0.io	__clkmd, #1
                                    705 ;	main.c: 213: PAC = LED_bm;     // Pin 5 as out
      000254 20 2F                  706 	mov	a, #0x20
      000256 91 01                  707 	mov.io	__pac, a
                                    708 ;	main.c: 226: touch_init();    
      000258 42 38                  709 	call	_touch_init
                                    710 ;	main.c: 234: INTEN = INTEN_TM3;
      00025A 80 2F                  711 	mov	a, #0x80
      00025C 84 01                  712 	mov.io	__inten, a
                                    713 ;	main.c: 237: TM3B = 10;
      00025E 0A 2F                  714 	mov	a, #0x0a
      000260 B5 01                  715 	mov.io	__tm3b, a
                                    716 ;	main.c: 238: TM3C = TM3C_CLK_ILRC | TM3C_OUT_DISABLE | TM3C_MODE_PERIOD;
      000262 40 2F                  717 	mov	a, #0x40
      000264 B2 01                  718 	mov.io	__tm3c, a
                                    719 ;	main.c: 239: TM3S = TM3S_PRESCALE_DIV64; // should also start the timer
      000266 60 2F                  720 	mov	a, #0x60
      000268 B4 01                  721 	mov.io	__tm3s, a
                                    722 ;	main.c: 241: TM2B = 10;
      00026A 0A 2F                  723 	mov	a, #0x0a
      00026C 9F 01                  724 	mov.io	__tm2b, a
                                    725 ;	main.c: 242: TM2C = TM2C_CLK_DISABLE | TM3C_MODE_PERIOD; //| TM2C_OUT_PA3 
      00026E 00 2F                  726 	mov	a, #0x00
      000270 9C 01                  727 	mov.io	__tm2c, a
                                    728 ;	main.c: 243: TM2S = TM2S_PRESCALE_DIV16;
      000272 40 2F                  729 	mov	a, #0x40
      000274 9E 01                  730 	mov.io	__tm2s, a
                                    731 ;	main.c: 246: touch_base = read_touch_raw();
      000276 19 39                  732 	call	_read_touch_raw
      000278 A7 0B                  733 	mov	_touch_base+0, a
      00027A 80 0F                  734 	mov	a, p
      00027C A8 0B                  735 	mov	_touch_base+1, a
                                    736 ;	main.c: 249: __engint();
      00027E 78 00                  737 	engint
                                    738 ;	main.c: 251: start_tone_out_startup();
      000280 71 38                  739 	call	_start_tone_out_startup
                                    740 ;	main.c: 253: while (1)
      000282                        741 00102$:
      000282 41 31                  742 	goto	00102$
                                    743 ;	main.c: 255: }
      000284 7A 00                  744 	ret
                                    745 ;	main.c: 257: void interrupt(void) __interrupt(0)
                                    746 ;	-----------------------------------------
                                    747 ;	 function interrupt
                                    748 ;	-----------------------------------------
      000286                        749 _interrupt:
      000286 72 00                  750 	push	af
      000288 80 0F                  751 	mov	a, p
      00028A 72 00                  752 	push	af
                                    753 ;	main.c: 260: if (INTRQ & INTRQ_TM3) // Timer3 interrupt request
      00028C C5 1B                  754 	t1sn.io	__intrq, #7
      00028E 85 31                  755 	goto	00116$
      000290                        756 00160$:
                                    757 ;	main.c: 264: uint16_t touch_value = read_touch_raw();
      000290 19 39                  758 	call	_read_touch_raw
                                    759 ;	main.c: 268: if (touch_value < touch_base - TOUCH_THRESHOLD)
      000292 72 00                  760 	push	af
      000294 A7 0F                  761 	mov	a, _touch_base+0
      000296 01 29                  762 	sub	a, #0x01
      000298 B2 0B                  763 	mov	_interrupt_sloc2_1_0+0, a
      00029A A8 0F                  764 	mov	a, _touch_base+1
      00029C 61 00                  765 	subc	a
      00029E B3 0B                  766 	mov	_interrupt_sloc2_1_0+1, a
      0002A0 73 00                  767 	pop	af
      0002A2 B2 0C                  768 	sub	a, _interrupt_sloc2_1_0+0
      0002A4 80 0F                  769 	mov	a, p
      0002A6 B3 0D                  770 	subc	a, _interrupt_sloc2_1_0+1
      0002A8 40 1A                  771 	t1sn.io	f, c
      0002AA 6F 31                  772 	goto	00106$
      0002AC                        773 00161$:
                                    774 ;	main.c: 274: if (!button_down)
      0002AC A1 0F                  775 	mov	a, _button_down+0
      0002AE 00 2A                  776 	ceqsn	a, #0x00
      0002B0 71 31                  777 	goto	00107$
      0002B2                        778 00162$:
                                    779 ;	main.c: 276: button_ctr++;
      0002B2 A0 0F                  780 	mov	a, _button_ctr+0
      0002B4 01 28                  781 	add	a, #0x01
      0002B6 A0 0B                  782 	mov	_button_ctr+0, a
                                    783 ;	main.c: 278: if (button_ctr == BTN_DEBOUNCE_DELAY)
      0002B8 A0 0F                  784 	mov	a, _button_ctr+0
      0002BA 05 2A                  785 	ceqsn	a, #0x05
      0002BC 71 31                  786 	goto	00107$
      0002BE                        787 00163$:
                                    788 ;	main.c: 280: button_down = 1;
      0002BE 01 2F                  789 	mov	a, #0x01
      0002C0 A1 0B                  790 	mov	_button_down+0, a
                                    791 ;	main.c: 281: pattern_index = (pattern_index + 1) % 3;
      0002C2 A3 0F                  792 	mov	a, _pattern_index+0
      0002C4 01 28                  793 	add	a, #0x01
      0002C6 B4 0B                  794 	mov	__modsint_PARM_1+0, a
      0002C8 00 2F                  795 	mov	a, #0x00
      0002CA 60 00                  796 	addc	a
      0002CC B5 0B                  797 	mov	__modsint_PARM_1+1, a
      0002CE 03 2F                  798 	mov	a, #0x03
      0002D0 B6 0B                  799 	mov	__modsint_PARM_2+0, a
      0002D2 37 13                  800 	clear	__modsint_PARM_2+1
      0002D4 B2 39                  801 	call	__modsint
      0002D6 A3 0B                  802 	mov	_pattern_index+0, a
                                    803 ;	main.c: 282: pattern_step = 0;
      0002D8 24 13                  804 	clear	_pattern_step+0
                                    805 ;	main.c: 283: start_tone_out_button();
      0002DA 77 38                  806 	call	_start_tone_out_button
      0002DC 71 31                  807 	goto	00107$
      0002DE                        808 00106$:
                                    809 ;	main.c: 289: button_ctr = 0;
      0002DE 20 13                  810 	clear	_button_ctr+0
                                    811 ;	main.c: 290: button_down = 0;
      0002E0 21 13                  812 	clear	_button_down+0
      0002E2                        813 00107$:
                                    814 ;	main.c: 293: pattern_count++;
      0002E2 A2 0F                  815 	mov	a, _pattern_count+0
      0002E4 01 28                  816 	add	a, #0x01
      0002E6 A2 0B                  817 	mov	_pattern_count+0, a
                                    818 ;	main.c: 295: if (pattern_count == PATTERN_UPDATE_DELAY)
      0002E8 A2 0F                  819 	mov	a, _pattern_count+0
      0002EA 32 2A                  820 	ceqsn	a, #0x32
      0002EC 7A 31                  821 	goto	00109$
      0002EE                        822 00164$:
                                    823 ;	main.c: 297: update_pattern();
      0002EE 95 38                  824 	call	_update_pattern
                                    825 ;	main.c: 298: output_leds();
      0002F0 82 38                  826 	call	_output_leds
                                    827 ;	main.c: 299: pattern_count = 0;
      0002F2 22 13                  828 	clear	_pattern_count+0
      0002F4                        829 00109$:
                                    830 ;	main.c: 302: if (tone_time)
      0002F4 A6 0F                  831 	mov	a, _tone_time+0
      0002F6 00 2B                  832 	cneqsn	a, #0x00
      0002F8 84 31                  833 	goto	00113$
      0002FA                        834 00165$:
                                    835 ;	main.c: 304: tone_out_ctr++;
      0002FA A5 0F                  836 	mov	a, _tone_out_ctr+0
      0002FC 01 28                  837 	add	a, #0x01
      0002FE A5 0B                  838 	mov	_tone_out_ctr+0, a
                                    839 ;	main.c: 306: if (tone_out_ctr >= tone_time)
      000300 A5 0F                  840 	mov	a, _tone_out_ctr+0
      000302 A6 0C                  841 	sub	a, _tone_time+0
                                    842 ;	main.c: 308: stop_tone_out();
      000304 40 1A                  843 	t1sn.io	f, c
      000306 7D 38                  844 	call	_stop_tone_out
      000308                        845 00113$:
                                    846 ;	main.c: 312: INTRQ &= ~INTRQ_TM3; // Clear interrupt flag
      000308 C5 1D                  847 	set0.io	__intrq, #7
      00030A                        848 00116$:
                                    849 ;	main.c: 314: }
      00030A 73 00                  850 	pop	af
      00030C 80 0B                  851 	mov	p, a
      00030E 73 00                  852 	pop	af
      000310 7B 00                  853 	reti
                                    854 	.area CODE
                                    855 	.area CONST
                                    856 	.area CABS (ABS)
