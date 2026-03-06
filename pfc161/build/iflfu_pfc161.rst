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
                                     73 	.globl _resample_count
                                     74 	.globl _last_touch
                                     75 	.globl _touch_base
                                     76 	.globl _tone_time
                                     77 	.globl _tone_out_ctr
                                     78 	.globl _pattern_step
                                     79 	.globl _pattern_index
                                     80 	.globl _pattern_count
                                     81 	.globl _button_down
                                     82 	.globl _button_ctr
                                     83 	.globl _byte_ctr
                                     84 	.globl _byte_t
                                     85 	.globl _bytes
                                     86 	.globl _pixel_buff
                                     87 	.globl _off_color
                                     88 	.globl _bright_blue_color
                                     89 	.globl _bright_orange_color
                                     90 	.globl _blue_color
                                     91 	.globl _orange_color
                                     92 ;--------------------------------------------------------
                                     93 ; special function registers
                                     94 ;--------------------------------------------------------
                                     95 	.area RSEG (ABS)
      000000                         96 	.org 0x0000
                           000000    97 __flag	=	0x0000
                           000002    98 __sp	=	0x0002
                           000003    99 __clkmd	=	0x0003
                           000004   100 __inten	=	0x0004
                           000005   101 __intrq	=	0x0005
                           000006   102 __t16m	=	0x0006
                           000008   103 __misc	=	0x0008
                           00000A   104 __eoscr	=	0x000a
                           00000B   105 __ihrcr	=	0x000b
                           00000C   106 __integs	=	0x000c
                           00000D   107 __padier	=	0x000d
                           00000E   108 __pbdier	=	0x000e
                           00000F   109 __misc2	=	0x000f
                           000010   110 __pa	=	0x0010
                           000011   111 __pac	=	0x0011
                           000012   112 __paph	=	0x0012
                           000013   113 __papl	=	0x0013
                           000014   114 __pb	=	0x0014
                           000015   115 __pbc	=	0x0015
                           000016   116 __pbph	=	0x0016
                           000017   117 __pbpl	=	0x0017
                           000018   118 __gpcc	=	0x0018
                           000019   119 __gpcs	=	0x0019
                           00001A   120 __bgtr	=	0x001a
                           00001B   121 __misclvr	=	0x001b
                           00001C   122 __tm2c	=	0x001c
                           00001D   123 __tm2ct	=	0x001d
                           00001E   124 __tm2s	=	0x001e
                           00001F   125 __tm2b	=	0x001f
                           000020   126 __ts	=	0x0020
                           000021   127 __tcc	=	0x0021
                           000022   128 __tke2	=	0x0022
                           000024   129 __tke1	=	0x0024
                           000026   130 __tps	=	0x0026
                           000028   131 __tps2	=	0x0028
                           00002B   132 __tkch	=	0x002b
                           00002C   133 __tkcl	=	0x002c
                           00002D   134 __lvdc	=	0x002d
                           000032   135 __tm3c	=	0x0032
                           000033   136 __tm3ct	=	0x0033
                           000034   137 __tm3s	=	0x0034
                           000035   138 __tm3b	=	0x0035
                           000039   139 __ilrcr	=	0x0039
                           00003A   140 __rop	=	0x003a
      000000                        141 __t16c::
      000000                        142 	.ds 2
                                    143 ;--------------------------------------------------------
                                    144 ; ram data
                                    145 ;--------------------------------------------------------
                                    146 	.area DATA
      000002                        147 _orange_color::
      000002                        148 	.ds 3
      000005                        149 _blue_color::
      000005                        150 	.ds 3
      000008                        151 _bright_orange_color::
      000008                        152 	.ds 3
      00000B                        153 _bright_blue_color::
      00000B                        154 	.ds 3
      00000E                        155 _off_color::
      00000E                        156 	.ds 3
      000011                        157 _pixel_buff::
      000011                        158 	.ds 12
      00001D                        159 _bytes::
      00001D                        160 	.ds 1
      00001E                        161 _byte_t::
      00001E                        162 	.ds 1
      00001F                        163 _byte_ctr::
      00001F                        164 	.ds 1
      000020                        165 _button_ctr::
      000020                        166 	.ds 1
      000021                        167 _button_down::
      000021                        168 	.ds 1
      000022                        169 _pattern_count::
      000022                        170 	.ds 1
      000023                        171 _pattern_index::
      000023                        172 	.ds 1
      000024                        173 _pattern_step::
      000024                        174 	.ds 1
      000025                        175 _tone_out_ctr::
      000025                        176 	.ds 1
      000026                        177 _tone_time::
      000026                        178 	.ds 1
      000027                        179 _touch_base::
      000027                        180 	.ds 2
      000029                        181 _last_touch::
      000029                        182 	.ds 2
      00002B                        183 _resample_count::
      00002B                        184 	.ds 1
      00002C                        185 _copy_to_buff_PARM_1:
      00002C                        186 	.ds 3
      00002F                        187 _copy_to_buff_PARM_2:
      00002F                        188 	.ds 1
      000030                        189 _copy_to_buff_sloc0_1_0:
      000030                        190 	.ds 1
      000031                        191 _copy_to_buff_sloc1_1_0:
      000031                        192 	.ds 1
      000032                        193 _update_pattern_bright_10000_20:
      000032                        194 	.ds 3
      000035                        195 _interrupt_sloc2_1_0:
      000035                        196 	.ds 2
      000037                        197 _interrupt_sloc3_1_0:
      000037                        198 	.ds 2
                                    199 ;--------------------------------------------------------
                                    200 ; overlayable items in ram
                                    201 ;--------------------------------------------------------
                                    202 ;--------------------------------------------------------
                                    203 ; Stack segment in internal ram
                                    204 ;--------------------------------------------------------
                                    205 	.area SSEG
      000050                        206 __start__stack:
      000050                        207 	.ds	1
                                    208 
                                    209 ;--------------------------------------------------------
                                    210 ; absolute external ram data
                                    211 ;--------------------------------------------------------
                                    212 	.area DABS (ABS)
                                    213 ;--------------------------------------------------------
                                    214 ; interrupt vector
                                    215 ;--------------------------------------------------------
                                    216 	.area HOME
      000022                        217 __interrupt_vect:
                                    218 	.area	HEADER (ABS)
      000020                        219 	.org	 0x0020
      000020 46 31                  220 	goto	_interrupt
                                    221 ;--------------------------------------------------------
                                    222 ; global & static initialisations
                                    223 ;--------------------------------------------------------
                                    224 	.area HOME
                                    225 	.area GSINIT
                                    226 	.area GSFINAL
                                    227 	.area GSINIT
                                    228 	.area	PREG (ABS)
      000000                        229 	.org 0x00
      000000                        230 p::
      000000                        231 	.ds 2
                                    232 	.area	HEADER (ABS)
      000000                        233 	.org 0x0000
      000000 00 00                  234 	nop
      000002 01 13                  235 	clear	p+1
      000004 42 2F                  236 	mov	a, #s_OSEG
      000006 0F 28                  237 	add	a, #l_OSEG + 1
      000008 FE 2C                  238 	and	a, #0xfe
      00000A 82 01                  239 	mov.io	sp, a
      00000C 38 3A                  240 	call	___sdcc_external_startup
      00000E 00 2B                  241 	cneqsn	a, #0x00
      000010 12 30                  242 	goto	__sdcc_init_data
      000012 11 30                  243 	goto	__sdcc_program_startup
                                    244 	.area GSINIT
      000024                        245 __sdcc_init_data:
      000024 02 2F                  246 	mov	a, #s_DATA
      000026 80 0B                  247 	mov	p, a
      000028 19 30                  248 	goto	00002$
      00002A                        249 00001$:
      00002A 00 2F                  250 	mov	a, #0x00
      00002C 80 03                  251 	idxm	p, a
      00002E 00 12                  252 	inc	p
      000030 02 2F                  253 	mov	a, #s_DATA
      000032                        254 00002$:
      000032 40 28                  255 	add	a, #l_DATA
      000034 00 17                  256 	ceqsn	a, p
      000036 15 30                  257 	goto	00001$
                                    258 ;	main.c: 67: color_t orange_color = {.r = 64, .g = 16, .b = 0};
      000038 40 2F                  259 	mov	a, #0x40
      00003A 83 0B                  260 	mov	_orange_color+1, a
      00003C 10 2F                  261 	mov	a, #0x10
      00003E 82 0B                  262 	mov	_orange_color+0, a
      000040 04 13                  263 	clear	_orange_color+2
                                    264 ;	main.c: 68: color_t blue_color = {.r = 0, .g = 0, .b = 128};
      000042 06 13                  265 	clear	_blue_color+1
      000044 05 13                  266 	clear	_blue_color+0
      000046 80 2F                  267 	mov	a, #0x80
      000048 87 0B                  268 	mov	_blue_color+2, a
                                    269 ;	main.c: 69: color_t bright_orange_color = {.r = 80, .g = 32, .b = 16};
      00004A 50 2F                  270 	mov	a, #0x50
      00004C 89 0B                  271 	mov	_bright_orange_color+1, a
      00004E 20 2F                  272 	mov	a, #0x20
      000050 88 0B                  273 	mov	_bright_orange_color+0, a
      000052 10 2F                  274 	mov	a, #0x10
      000054 8A 0B                  275 	mov	_bright_orange_color+2, a
                                    276 ;	main.c: 70: color_t bright_blue_color = {.r = 16, .g = 16, .b = 128};
      000056 10 2F                  277 	mov	a, #0x10
      000058 8C 0B                  278 	mov	_bright_blue_color+1, a
      00005A 10 2F                  279 	mov	a, #0x10
      00005C 8B 0B                  280 	mov	_bright_blue_color+0, a
      00005E 80 2F                  281 	mov	a, #0x80
      000060 8D 0B                  282 	mov	_bright_blue_color+2, a
                                    283 ;	main.c: 71: color_t off_color = {.r = 0, .g = 0, .b = 0};
      000062 0F 13                  284 	clear	_off_color+1
      000064 0E 13                  285 	clear	_off_color+0
      000066 10 13                  286 	clear	_off_color+2
                                    287 ;	main.c: 75: volatile uint8_t bytes = LED_COUNT * 3;
      000068 0C 2F                  288 	mov	a, #0x0c
      00006A 9D 0B                  289 	mov	_bytes+0, a
                                    290 ;	main.c: 76: volatile uint8_t byte_t = 0;
      00006C 1E 13                  291 	clear	_byte_t+0
                                    292 ;	main.c: 78: volatile uint8_t byte_ctr = 0;
      00006E 1F 13                  293 	clear	_byte_ctr+0
                                    294 ;	main.c: 79: volatile uint8_t button_ctr = 0;
      000070 20 13                  295 	clear	_button_ctr+0
                                    296 ;	main.c: 80: volatile uint8_t button_down = 0;
      000072 21 13                  297 	clear	_button_down+0
                                    298 ;	main.c: 81: volatile uint8_t pattern_count = 0;
      000074 22 13                  299 	clear	_pattern_count+0
                                    300 ;	main.c: 82: volatile uint8_t pattern_index = 0;
      000076 23 13                  301 	clear	_pattern_index+0
                                    302 ;	main.c: 83: volatile uint8_t pattern_step = 0;
      000078 24 13                  303 	clear	_pattern_step+0
                                    304 ;	main.c: 84: volatile uint8_t tone_out_ctr = 0;
      00007A 25 13                  305 	clear	_tone_out_ctr+0
                                    306 ;	main.c: 85: volatile uint8_t tone_time = 0;
      00007C 26 13                  307 	clear	_tone_time+0
                                    308 ;	main.c: 86: volatile uint16_t touch_base = 0;
      00007E 27 13                  309 	clear	_touch_base+0
      000080 28 13                  310 	clear	_touch_base+1
                                    311 ;	main.c: 87: volatile uint16_t last_touch = 0;
      000082 29 13                  312 	clear	_last_touch+0
      000084 2A 13                  313 	clear	_last_touch+1
                                    314 ;	main.c: 88: volatile uint8_t resample_count = 0;
      000086 2B 13                  315 	clear	_resample_count+0
                                    316 	.area GSFINAL
      000088 11 30                  317 	goto	__sdcc_program_startup
                                    318 ;--------------------------------------------------------
                                    319 ; Home
                                    320 ;--------------------------------------------------------
                                    321 	.area HOME
                                    322 	.area HOME
      000022                        323 __sdcc_program_startup:
      000022 28 31                  324 	goto	_main
                                    325 ;	return from main will return to caller
                                    326 ;--------------------------------------------------------
                                    327 ; code
                                    328 ;--------------------------------------------------------
                                    329 	.area CODE
                                    330 ;	main.c: 90: void touch_init() {
                                    331 ;	-----------------------------------------
                                    332 ;	 function touch_init
                                    333 ;	-----------------------------------------
      00008A                        334 _touch_init:
                                    335 ;	main.c: 92: TS = TS_TP_CLK_IHRC_DIV2 | TS_TP_VREF_VCC05 | TS_DISCHARGE_WAIT_128CLOCKS;
      00008A 13 2F                  336 	mov	a, #0x13
      00008C A0 01                  337 	mov.io	__ts, a
                                    338 ;	main.c: 93: TPS2 = TPS2_TOUCH_TYPE_B | TPS2_VREFNONFLOAT_ALWAYS_ON;
      00008E 41 2F                  339 	mov	a, #0x41
      000090 A8 01                  340 	mov.io	__tps2, a
                                    341 ;	main.c: 94: PAC &= ~(BTN_bm); // Pin 4 as in
      000092 11 1D                  342 	set0.io	__pac, #4
                                    343 ;	main.c: 95: PADIER &= ~(BTN_bm | CS_bm); // Disable digital input for touch and CS pins
      000094 CD 01                  344 	mov.io	a, __padier
      000096 6F 2C                  345 	and	a, #0x6f
      000098 8D 01                  346 	mov.io	__padier, a
                                    347 ;	main.c: 96: }
      00009A 7A 00                  348 	ret
                                    349 ;	main.c: 98: void copy_to_buff(color_t pixel, uint8_t len)
                                    350 ;	-----------------------------------------
                                    351 ;	 function copy_to_buff
                                    352 ;	-----------------------------------------
      00009C                        353 _copy_to_buff:
                                    354 ;	main.c: 100: for (uint8_t i = 0; i < len; i++)
      00009C 30 13                  355 	clear	_copy_to_buff_sloc0_1_0+0
      00009E                        356 00103$:
      00009E B0 0F                  357 	mov	a, _copy_to_buff_sloc0_1_0+0
      0000A0 AF 0C                  358 	sub	a, _copy_to_buff_PARM_2+0
      0000A2 40 1A                  359 	t1sn.io	f, c
      0000A4 7A 00                  360 	ret
      0000A6                        361 00120$:
                                    362 ;	main.c: 102: pixel_buff[i].r = pixel.r;
      0000A6 B0 0F                  363 	mov	a, _copy_to_buff_sloc0_1_0+0
      0000A8 6B 00                  364 	sl	a
      0000AA 30 0C                  365 	add	a, _copy_to_buff_sloc0_1_0+0
      0000AC B1 0B                  366 	mov	_copy_to_buff_sloc1_1_0+0, a
      0000AE 11 2F                  367 	mov	a, #(_pixel_buff + 0)
      0000B0 31 0C                  368 	add	a, _copy_to_buff_sloc1_1_0+0
      0000B2 01 28                  369 	add	a, #0x01
      0000B4 72 00                  370 	push	af
      0000B6 AD 0F                  371 	mov	a, _copy_to_buff_PARM_1+1
      0000B8 80 0B                  372 	mov	p, a
      0000BA 73 00                  373 	pop	af
      0000BC 80 13                  374 	xch	a, p
      0000BE 80 03                  375 	idxm	p, a
                                    376 ;	main.c: 103: pixel_buff[i].g = pixel.g;
      0000C0 11 2F                  377 	mov	a, #(_pixel_buff + 0)
      0000C2 31 0C                  378 	add	a, _copy_to_buff_sloc1_1_0+0
      0000C4 72 00                  379 	push	af
      0000C6 AC 0F                  380 	mov	a, _copy_to_buff_PARM_1+0
      0000C8 80 0B                  381 	mov	p, a
      0000CA 73 00                  382 	pop	af
      0000CC 80 13                  383 	xch	a, p
      0000CE 80 03                  384 	idxm	p, a
                                    385 ;	main.c: 104: pixel_buff[i].b = pixel.b;
      0000D0 11 2F                  386 	mov	a, #(_pixel_buff + 0)
      0000D2 31 0C                  387 	add	a, _copy_to_buff_sloc1_1_0+0
      0000D4 02 28                  388 	add	a, #0x02
      0000D6 72 00                  389 	push	af
      0000D8 AE 0F                  390 	mov	a, _copy_to_buff_PARM_1+2
      0000DA 80 0B                  391 	mov	p, a
      0000DC 73 00                  392 	pop	af
      0000DE 80 13                  393 	xch	a, p
      0000E0 80 03                  394 	idxm	p, a
                                    395 ;	main.c: 100: for (uint8_t i = 0; i < len; i++)
      0000E2 30 12                  396 	inc	_copy_to_buff_sloc0_1_0+0
      0000E4 4F 30                  397 	goto	00103$
                                    398 ;	main.c: 106: }
      0000E6 7A 00                  399 	ret
                                    400 ;	main.c: 108: void start_tone_out_startup()
                                    401 ;	-----------------------------------------
                                    402 ;	 function start_tone_out_startup
                                    403 ;	-----------------------------------------
      0000E8                        404 _start_tone_out_startup:
                                    405 ;	main.c: 110: tone_out_ctr = 0;
      0000E8 25 13                  406 	clear	_tone_out_ctr+0
                                    407 ;	main.c: 111: tone_time = STARTUP_TONE_TIME;
                                    408 ;	main.c: 112: TM2B = STARTUP_BOUNDS;
      0000EA 0A 2F                  409 	mov a, #0x0a
      0000EC A6 0B                  410 	mov  _tone_time+0, a
      0000EE 9F 01                  411 	mov.io	__tm2b, a
                                    412 ;	main.c: 113: TM2C |= TM2C_CLK_IHRC;
      0000F0 5C 1F                  413 	set1.io	__tm2c, #5
                                    414 ;	main.c: 114: }
      0000F2 7A 00                  415 	ret
                                    416 ;	main.c: 116: void start_tone_out_button()
                                    417 ;	-----------------------------------------
                                    418 ;	 function start_tone_out_button
                                    419 ;	-----------------------------------------
      0000F4                        420 _start_tone_out_button:
                                    421 ;	main.c: 118: tone_out_ctr = 0;
      0000F4 25 13                  422 	clear	_tone_out_ctr+0
                                    423 ;	main.c: 119: tone_time = BUTTON_TONE_TIME;
                                    424 ;	main.c: 120: TM2B = BUTTON_BOUNDS;
      0000F6 05 2F                  425 	mov a, #0x05
      0000F8 A6 0B                  426 	mov  _tone_time+0, a
      0000FA 9F 01                  427 	mov.io	__tm2b, a
                                    428 ;	main.c: 121: TM2C |= TM2C_CLK_IHRC;
      0000FC 5C 1F                  429 	set1.io	__tm2c, #5
                                    430 ;	main.c: 122: }
      0000FE 7A 00                  431 	ret
                                    432 ;	main.c: 124: void stop_tone_out()
                                    433 ;	-----------------------------------------
                                    434 ;	 function stop_tone_out
                                    435 ;	-----------------------------------------
      000100                        436 _stop_tone_out:
                                    437 ;	main.c: 126: tone_time = 0;
      000100 26 13                  438 	clear	_tone_time+0
                                    439 ;	main.c: 127: TM2C &= 0x0F; // 0 out the top 4 bits for clock source
      000102 DC 01                  440 	mov.io	a, __tm2c
      000104 0F 2C                  441 	and	a, #0x0f
      000106 9C 01                  442 	mov.io	__tm2c, a
                                    443 ;	main.c: 128: }
      000108 7A 00                  444 	ret
                                    445 ;	main.c: 130: void output_leds()
                                    446 ;	-----------------------------------------
                                    447 ;	 function output_leds
                                    448 ;	-----------------------------------------
      00010A                        449 _output_leds:
                                    450 ;	main.c: 132: __asm__("    mov a, _bytes              ;move our byte count into a");
      00010A 9D 0F                  451 	mov	a, _bytes              ;move our byte count into a
                                    452 ;	main.c: 133: __asm__("    mov _byte_ctr, a           ;move a into our index counter");
      00010C 9F 0B                  453 	mov	_byte_ctr, a           ;move a into our index counter
                                    454 ;	main.c: 134: __asm__("    mov	a, #(_pixel_buff)   ;load the address of the array into a");
      00010E 11 2F                  455 	mov	a, #(_pixel_buff)   ;load the address of the array into a
                                    456 ;	main.c: 135: __asm__("    mov	p, a                ;put that address into p (a mem location)");
      000110 80 0B                  457 	mov	p, a                ;put that address into p (a mem location)
                                    458 ;	main.c: 136: __asm__("00010$:");
      000112                        459 	00010$:
                                    460 ;	main.c: 137: __asm__("    idxm	a, p                ;load the byte data from the array into a");
      000112 81 03                  461 	idxm	a, p                ;load the byte data from the array into a
                                    462 ;	main.c: 138: __asm__("    inc p                      ;inc p to the next address");
      000114 00 12                  463 	inc	p                      ;inc p to the next address
                                    464 ;	main.c: 139: __asm__("    mov	_byte_t, a          ;load the byte data into byte_t");
      000116 9E 0B                  465 	mov	_byte_t, a          ;load the byte data into byte_t
                                    466 ;	main.c: 140: __asm__("    mov a, #0x08               ;reset the bit count");
      000118 08 2F                  467 	mov	a, #0x08               ;reset the bit count
                                    468 ;	main.c: 141: __asm__("00011$:");
      00011A                        469 	00011$:
                                    470 ;	main.c: 142: __asm__("    ;output bit");
                                    471 ;output	bit
                                    472 ;	main.c: 143: __asm__("    set1.io __pa, #5           ;set the output pin high");
      00011A 50 1F                  473 	set1.io	__pa, #5           ;set the output pin high
                                    474 ;	main.c: 144: __asm__("    t1sn _byte_t, #7           ;if the current MSB is 1, skip setting the pin low now");
      00011C DE 23                  475 	t1sn	_byte_t, #7           ;if the current MSB is 1, skip setting the pin low now
                                    476 ;	main.c: 145: __asm__("    set0.io __pa, #5           ;set the output pin low");
      00011E 50 1D                  477 	set0.io	__pa, #5           ;set the output pin low
                                    478 ;	main.c: 146: __asm__("    nop                        ;wait one cycle");
      000120 00 00                  479 	nop	                       ;wait one cycle
                                    480 ;	main.c: 147: __asm__("    set0.io __pa, #5           ;set the output pin low");
      000122 50 1D                  481 	set0.io	__pa, #5           ;set the output pin low
                                    482 ;	main.c: 148: __asm__("    sl _byte_t                 ;left-shift the data byte (the LEDs are MSB first)");
      000124 9E 15                  483 	sl	_byte_t                 ;left-shift the data byte (the LEDs are MSB first)
                                    484 ;	main.c: 149: __asm__("    dzsn a                     ;dec a and skip next instruction if 0");
      000126 63 00                  485 	dzsn	a                     ;dec a and skip next instruction if 0
                                    486 ;	main.c: 150: __asm__("    goto 00011$                ;jump back to 00011");
      000128 8D 30                  487 	goto	00011$                ;jump back to 00011
                                    488 ;	main.c: 151: __asm__("    dzsn _byte_ctr             ;dec our index counter and skip the goto if 0");
      00012A 9F 11                  489 	dzsn	_byte_ctr             ;dec our index counter and skip the goto if 0
                                    490 ;	main.c: 152: __asm__("    goto	00010$              ;goto the next byte");
      00012C 89 30                  491 	goto	00010$              ;goto the next byte
                                    492 ;	main.c: 153: }
      00012E 7A 00                  493 	ret
                                    494 ;	main.c: 155: void update_pattern()
                                    495 ;	-----------------------------------------
                                    496 ;	 function update_pattern
                                    497 ;	-----------------------------------------
      000130                        498 _update_pattern:
                                    499 ;	main.c: 160: switch (pattern_index)
      000130 A3 0F                  500 	mov	a, _pattern_index+0
      000132 00 2B                  501 	cneqsn	a, #0x00
      000134 A0 30                  502 	goto	00101$
      000136                        503 00169$:
      000136 01 2B                  504 	cneqsn	a, #0x01
      000138 AE 30                  505 	goto	00102$
      00013A                        506 00171$:
      00013A 02 2B                  507 	cneqsn	a, #0x02
      00013C C6 30                  508 	goto	00103$
      00013E                        509 00173$:
      00013E DD 30                  510 	goto	00104$
                                    511 ;	main.c: 162: case 0:
      000140                        512 00101$:
                                    513 ;	main.c: 163: copy_to_buff(off_color, LED_COUNT);
      000140 0E 2F                  514 	mov	a, #(_off_color + 0)
      000142 C4 0B                  515 	mov	___memcpy_PARM_2+0, a
      000144 45 13                  516 	clear	___memcpy_PARM_2+1
      000146 2C 2F                  517 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      000148 C2 0B                  518 	mov	___memcpy_PARM_1+0, a
      00014A 43 13                  519 	clear	___memcpy_PARM_1+1
      00014C 03 2F                  520 	mov	a, #0x03
      00014E C6 0B                  521 	mov	___memcpy_PARM_3+0, a
      000150 47 13                  522 	clear	___memcpy_PARM_3+1
      000152 A8 39                  523 	call	___memcpy
      000154 04 2F                  524 	mov	a, #0x04
      000156 AF 0B                  525 	mov	_copy_to_buff_PARM_2+0, a
      000158 4E 30                  526 	goto	_copy_to_buff
                                    527 ;	main.c: 164: return;
      00015A 7A 00                  528 	ret
                                    529 ;	main.c: 165: case 1:
      00015C                        530 00102$:
                                    531 ;	main.c: 166: copy_to_buff(blue_color, LED_COUNT);
      00015C 05 2F                  532 	mov	a, #(_blue_color + 0)
      00015E C4 0B                  533 	mov	___memcpy_PARM_2+0, a
      000160 45 13                  534 	clear	___memcpy_PARM_2+1
      000162 2C 2F                  535 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      000164 C2 0B                  536 	mov	___memcpy_PARM_1+0, a
      000166 43 13                  537 	clear	___memcpy_PARM_1+1
      000168 03 2F                  538 	mov	a, #0x03
      00016A C6 0B                  539 	mov	___memcpy_PARM_3+0, a
      00016C 47 13                  540 	clear	___memcpy_PARM_3+1
      00016E A8 39                  541 	call	___memcpy
      000170 04 2F                  542 	mov	a, #0x04
      000172 AF 0B                  543 	mov	_copy_to_buff_PARM_2+0, a
      000174 4E 38                  544 	call	_copy_to_buff
                                    545 ;	main.c: 167: bright = bright_blue_color;
      000176 32 2F                  546 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      000178 C2 0B                  547 	mov	___memcpy_PARM_1+0, a
      00017A 43 13                  548 	clear	___memcpy_PARM_1+1
      00017C 0B 2F                  549 	mov	a, #(_bright_blue_color + 0)
      00017E C4 0B                  550 	mov	___memcpy_PARM_2+0, a
      000180 45 13                  551 	clear	___memcpy_PARM_2+1
      000182 03 2F                  552 	mov	a, #0x03
      000184 C6 0B                  553 	mov	___memcpy_PARM_3+0, a
      000186 47 13                  554 	clear	___memcpy_PARM_3+1
      000188 A8 39                  555 	call	___memcpy
                                    556 ;	main.c: 168: break;
      00018A DD 30                  557 	goto	00104$
                                    558 ;	main.c: 169: case 2:
      00018C                        559 00103$:
                                    560 ;	main.c: 170: copy_to_buff(orange_color, LED_COUNT);
      00018C 02 2F                  561 	mov	a, #(_orange_color + 0)
      00018E C4 0B                  562 	mov	___memcpy_PARM_2+0, a
      000190 45 13                  563 	clear	___memcpy_PARM_2+1
      000192 2C 2F                  564 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      000194 C2 0B                  565 	mov	___memcpy_PARM_1+0, a
      000196 43 13                  566 	clear	___memcpy_PARM_1+1
      000198 03 2F                  567 	mov	a, #0x03
      00019A C6 0B                  568 	mov	___memcpy_PARM_3+0, a
      00019C 47 13                  569 	clear	___memcpy_PARM_3+1
      00019E A8 39                  570 	call	___memcpy
      0001A0 04 2F                  571 	mov	a, #0x04
      0001A2 AF 0B                  572 	mov	_copy_to_buff_PARM_2+0, a
      0001A4 4E 38                  573 	call	_copy_to_buff
                                    574 ;	main.c: 171: bright = bright_orange_color;
      0001A6 32 2F                  575 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      0001A8 C2 0B                  576 	mov	___memcpy_PARM_1+0, a
      0001AA 43 13                  577 	clear	___memcpy_PARM_1+1
      0001AC 08 2F                  578 	mov	a, #(_bright_orange_color + 0)
      0001AE C4 0B                  579 	mov	___memcpy_PARM_2+0, a
      0001B0 45 13                  580 	clear	___memcpy_PARM_2+1
      0001B2 03 2F                  581 	mov	a, #0x03
      0001B4 C6 0B                  582 	mov	___memcpy_PARM_3+0, a
      0001B6 47 13                  583 	clear	___memcpy_PARM_3+1
      0001B8 A8 39                  584 	call	___memcpy
                                    585 ;	main.c: 173: }
      0001BA                        586 00104$:
                                    587 ;	main.c: 175: pattern_step++;
      0001BA A4 0F                  588 	mov	a, _pattern_step+0
      0001BC 01 28                  589 	add	a, #0x01
      0001BE A4 0B                  590 	mov	_pattern_step+0, a
                                    591 ;	main.c: 177: switch (pattern_step)
      0001C0 A4 0F                  592 	mov	a, _pattern_step+0
      0001C2 01 2B                  593 	cneqsn	a, #0x01
      0001C4 EE 30                  594 	goto	00105$
      0001C6                        595 00175$:
      0001C6 03 2B                  596 	cneqsn	a, #0x03
      0001C8 F9 30                  597 	goto	00106$
      0001CA                        598 00177$:
      0001CA 04 2B                  599 	cneqsn	a, #0x04
      0001CC 04 31                  600 	goto	00107$
      0001CE                        601 00179$:
      0001CE 06 2B                  602 	cneqsn	a, #0x06
      0001D0 0F 31                  603 	goto	00109$
      0001D2                        604 00181$:
      0001D2 07 2B                  605 	cneqsn	a, #0x07
      0001D4 0F 31                  606 	goto	00109$
      0001D6                        607 00183$:
      0001D6 0A 2B                  608 	cneqsn	a, #0x0a
      0001D8 1A 31                  609 	goto	00110$
      0001DA                        610 00185$:
      0001DA 7A 00                  611 	ret
                                    612 ;	main.c: 179: case 1:
      0001DC                        613 00105$:
                                    614 ;	main.c: 180: pixel_buff[3] = bright;
      0001DC 1A 2F                  615 	mov	a, #(_pixel_buff + 9)
      0001DE C2 0B                  616 	mov	___memcpy_PARM_1+0, a
      0001E0 43 13                  617 	clear	___memcpy_PARM_1+1
      0001E2 32 2F                  618 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      0001E4 C4 0B                  619 	mov	___memcpy_PARM_2+0, a
      0001E6 45 13                  620 	clear	___memcpy_PARM_2+1
      0001E8 03 2F                  621 	mov	a, #0x03
      0001EA C6 0B                  622 	mov	___memcpy_PARM_3+0, a
      0001EC 47 13                  623 	clear	___memcpy_PARM_3+1
      0001EE A8 31                  624 	goto	___memcpy
                                    625 ;	main.c: 181: break;
      0001F0 7A 00                  626 	ret
                                    627 ;	main.c: 182: case 3:
      0001F2                        628 00106$:
                                    629 ;	main.c: 183: pixel_buff[2] = bright;
      0001F2 17 2F                  630 	mov	a, #(_pixel_buff + 6)
      0001F4 C2 0B                  631 	mov	___memcpy_PARM_1+0, a
      0001F6 43 13                  632 	clear	___memcpy_PARM_1+1
      0001F8 32 2F                  633 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      0001FA C4 0B                  634 	mov	___memcpy_PARM_2+0, a
      0001FC 45 13                  635 	clear	___memcpy_PARM_2+1
      0001FE 03 2F                  636 	mov	a, #0x03
      000200 C6 0B                  637 	mov	___memcpy_PARM_3+0, a
      000202 47 13                  638 	clear	___memcpy_PARM_3+1
      000204 A8 31                  639 	goto	___memcpy
                                    640 ;	main.c: 184: break;
      000206 7A 00                  641 	ret
                                    642 ;	main.c: 185: case 4:
      000208                        643 00107$:
                                    644 ;	main.c: 186: pixel_buff[1] = bright;
      000208 14 2F                  645 	mov	a, #(_pixel_buff + 3)
      00020A C2 0B                  646 	mov	___memcpy_PARM_1+0, a
      00020C 43 13                  647 	clear	___memcpy_PARM_1+1
      00020E 32 2F                  648 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      000210 C4 0B                  649 	mov	___memcpy_PARM_2+0, a
      000212 45 13                  650 	clear	___memcpy_PARM_2+1
      000214 03 2F                  651 	mov	a, #0x03
      000216 C6 0B                  652 	mov	___memcpy_PARM_3+0, a
      000218 47 13                  653 	clear	___memcpy_PARM_3+1
      00021A A8 31                  654 	goto	___memcpy
                                    655 ;	main.c: 187: break;
      00021C 7A 00                  656 	ret
                                    657 ;	main.c: 189: case 7:
      00021E                        658 00109$:
                                    659 ;	main.c: 190: pixel_buff[0] = bright;
      00021E 11 2F                  660 	mov	a, #(_pixel_buff + 0)
      000220 C2 0B                  661 	mov	___memcpy_PARM_1+0, a
      000222 43 13                  662 	clear	___memcpy_PARM_1+1
      000224 32 2F                  663 	mov	a, #(_update_pattern_bright_10000_20 + 0)
      000226 C4 0B                  664 	mov	___memcpy_PARM_2+0, a
      000228 45 13                  665 	clear	___memcpy_PARM_2+1
      00022A 03 2F                  666 	mov	a, #0x03
      00022C C6 0B                  667 	mov	___memcpy_PARM_3+0, a
      00022E 47 13                  668 	clear	___memcpy_PARM_3+1
      000230 A8 31                  669 	goto	___memcpy
                                    670 ;	main.c: 191: break;
      000232 7A 00                  671 	ret
                                    672 ;	main.c: 192: case 10:
      000234                        673 00110$:
                                    674 ;	main.c: 193: pattern_step = 0;
      000234 24 13                  675 	clear	_pattern_step+0
                                    676 ;	main.c: 195: }
                                    677 ;	main.c: 196: }
      000236 7A 00                  678 	ret
                                    679 ;	main.c: 198: uint16_t read_touch_raw() {
                                    680 ;	-----------------------------------------
                                    681 ;	 function read_touch_raw
                                    682 ;	-----------------------------------------
      000238                        683 _read_touch_raw:
                                    684 ;	main.c: 200: TKE1 = TKE1_TK6_PA4; // Use PA4 as touch input
      000238 40 2F                  685 	mov	a, #0x40
      00023A A4 01                  686 	mov.io	__tke1, a
                                    687 ;	main.c: 201: TKE2 = 0; // Disable other channels
      00023C 00 2F                  688 	mov	a, #0x00
      00023E A2 01                  689 	mov.io	__tke2, a
                                    690 ;	main.c: 202: TCC = TCC_TK_RUN;
      000240 10 2F                  691 	mov	a, #0x10
      000242 A1 01                  692 	mov.io	__tcc, a
                                    693 ;	main.c: 204: while(TCC & TCC_TK_RUN); // Wait for measurement to complete
      000244                        694 00101$:
      000244 21 19                  695 	t0sn.io	__tcc, #4
      000246 22 31                  696 	goto	00101$
      000248                        697 00118$:
                                    698 ;	main.c: 206: return (TKCH << 8) | TKCL; 
      000248 EB 01                  699 	mov.io	a, __tkch
      00024A 80 0B                  700 	mov	p, a
      00024C EC 01                  701 	mov.io	a, __tkcl
                                    702 ;	main.c: 207: }
      00024E 7A 00                  703 	ret
                                    704 ;	main.c: 209: void main(void)
                                    705 ;	-----------------------------------------
                                    706 ;	 function main
                                    707 ;	-----------------------------------------
      000250                        708 _main:
                                    709 ;	main.c: 212: __disgint();
      000250 79 00                  710 	disgint
                                    711 ;	main.c: 213: CLKMD |= 0x10; // First enable IHRC
      000252 03 1F                  712 	set1.io	__clkmd, #4
                                    713 ;	main.c: 214: CLKMD = 0x34;  // Switch to IHRC/2 but leave ILRC on
      000254 34 2F                  714 	mov	a, #0x34
      000256 83 01                  715 	mov.io	__clkmd, a
                                    716 ;	main.c: 215: CLKMD &= ~(CLKMD_ENABLE_WATCHDOG);
      000258 43 1C                  717 	set0.io	__clkmd, #1
                                    718 ;	main.c: 216: PAC = LED_bm;     // Pin 5 as out
      00025A 20 2F                  719 	mov	a, #0x20
      00025C 91 01                  720 	mov.io	__pac, a
                                    721 ;	main.c: 229: touch_init();    
      00025E 45 38                  722 	call	_touch_init
                                    723 ;	main.c: 237: INTEN = INTEN_TM3;
      000260 80 2F                  724 	mov	a, #0x80
      000262 84 01                  725 	mov.io	__inten, a
                                    726 ;	main.c: 240: TM3B = 10;
      000264 0A 2F                  727 	mov	a, #0x0a
      000266 B5 01                  728 	mov.io	__tm3b, a
                                    729 ;	main.c: 241: TM3C = TM3C_CLK_ILRC | TM3C_OUT_DISABLE | TM3C_MODE_PERIOD;
      000268 40 2F                  730 	mov	a, #0x40
      00026A B2 01                  731 	mov.io	__tm3c, a
                                    732 ;	main.c: 242: TM3S = TM3S_PRESCALE_DIV64; // should also start the timer
      00026C 60 2F                  733 	mov	a, #0x60
      00026E B4 01                  734 	mov.io	__tm3s, a
                                    735 ;	main.c: 244: TM2B = 10;
      000270 0A 2F                  736 	mov	a, #0x0a
      000272 9F 01                  737 	mov.io	__tm2b, a
                                    738 ;	main.c: 245: TM2C = TM2C_CLK_DISABLE | TM3C_MODE_PERIOD; //| TM2C_OUT_PA3 
      000274 00 2F                  739 	mov	a, #0x00
      000276 9C 01                  740 	mov.io	__tm2c, a
                                    741 ;	main.c: 246: TM2S = TM2S_PRESCALE_DIV16;
      000278 40 2F                  742 	mov	a, #0x40
      00027A 9E 01                  743 	mov.io	__tm2s, a
                                    744 ;	main.c: 249: touch_base = read_touch_raw();
      00027C 1C 39                  745 	call	_read_touch_raw
      00027E A7 0B                  746 	mov	_touch_base+0, a
      000280 80 0F                  747 	mov	a, p
      000282 A8 0B                  748 	mov	_touch_base+1, a
                                    749 ;	main.c: 252: __engint();
      000284 78 00                  750 	engint
                                    751 ;	main.c: 254: start_tone_out_startup();
      000286 74 38                  752 	call	_start_tone_out_startup
                                    753 ;	main.c: 256: while (1)
      000288                        754 00102$:
      000288 44 31                  755 	goto	00102$
                                    756 ;	main.c: 258: }
      00028A 7A 00                  757 	ret
                                    758 ;	main.c: 260: void interrupt(void) __interrupt(0)
                                    759 ;	-----------------------------------------
                                    760 ;	 function interrupt
                                    761 ;	-----------------------------------------
      00028C                        762 _interrupt:
      00028C 72 00                  763 	push	af
      00028E 80 0F                  764 	mov	a, p
      000290 72 00                  765 	push	af
                                    766 ;	main.c: 263: if (INTRQ & INTRQ_TM3) // Timer3 interrupt request
      000292 C5 1B                  767 	t1sn.io	__intrq, #7
      000294 A4 31                  768 	goto	00121$
      000296                        769 00177$:
                                    770 ;	main.c: 267: uint16_t touch_value = read_touch_raw();
      000296 1C 39                  771 	call	_read_touch_raw
      000298 B5 0B                  772 	mov	_interrupt_sloc2_1_0+0, a
      00029A 80 0F                  773 	mov	a, p
      00029C B6 0B                  774 	mov	_interrupt_sloc2_1_0+1, a
                                    775 ;	main.c: 269: if (touch_value == last_touch){
      00029E B5 0F                  776 	mov	a, _interrupt_sloc2_1_0+0
      0002A0 29 17                  777 	ceqsn	a, _last_touch+0
      0002A2 59 31                  778 	goto	00102$
      0002A4                        779 00178$:
      0002A4 B6 0F                  780 	mov	a, _interrupt_sloc2_1_0+1
      0002A6 2A 17                  781 	ceqsn	a, _last_touch+1
      0002A8 59 31                  782 	goto	00102$
      0002AA                        783 00179$:
                                    784 ;	main.c: 270: resample_count++;
      0002AA AB 0F                  785 	mov	a, _resample_count+0
      0002AC 01 28                  786 	add	a, #0x01
      0002AE AB 0B                  787 	mov	_resample_count+0, a
      0002B0 5E 31                  788 	goto	00103$
      0002B2                        789 00102$:
                                    790 ;	main.c: 272: resample_count = 0;
      0002B2 2B 13                  791 	clear	_resample_count+0
                                    792 ;	main.c: 273: last_touch = touch_value;
      0002B4 B5 0F                  793 	mov	a, _interrupt_sloc2_1_0+0
      0002B6 A9 0B                  794 	mov	_last_touch+0, a
      0002B8 B6 0F                  795 	mov	a, _interrupt_sloc2_1_0+1
      0002BA AA 0B                  796 	mov	_last_touch+1, a
      0002BC                        797 00103$:
                                    798 ;	main.c: 276: if (resample_count >= RESAMPLE_BASE_COUNT) {
      0002BC AB 0F                  799 	mov	a, _resample_count+0
      0002BE 64 29                  800 	sub	a, #0x64
      0002C0 40 18                  801 	t0sn.io	f, c
      0002C2 67 31                  802 	goto	00105$
      0002C4                        803 00180$:
                                    804 ;	main.c: 277: touch_base = touch_value;
      0002C4 B5 0F                  805 	mov	a, _interrupt_sloc2_1_0+0
      0002C6 A7 0B                  806 	mov	_touch_base+0, a
      0002C8 B6 0F                  807 	mov	a, _interrupt_sloc2_1_0+1
      0002CA A8 0B                  808 	mov	_touch_base+1, a
                                    809 ;	main.c: 278: resample_count = 0;
      0002CC 2B 13                  810 	clear	_resample_count+0
      0002CE                        811 00105$:
                                    812 ;	main.c: 284: if (touch_value < touch_base - TOUCH_THRESHOLD)
      0002CE A7 0F                  813 	mov	a, _touch_base+0
      0002D0 05 29                  814 	sub	a, #0x05
      0002D2 B7 0B                  815 	mov	_interrupt_sloc3_1_0+0, a
      0002D4 A8 0F                  816 	mov	a, _touch_base+1
      0002D6 61 00                  817 	subc	a
      0002D8 B8 0B                  818 	mov	_interrupt_sloc3_1_0+1, a
      0002DA B6 0F                  819 	mov	a, _interrupt_sloc2_1_0+1
      0002DC 80 0B                  820 	mov	p, a
      0002DE B5 0F                  821 	mov	a, _interrupt_sloc2_1_0+0
      0002E0 B7 0C                  822 	sub	a, _interrupt_sloc3_1_0+0
      0002E2 80 0F                  823 	mov	a, p
      0002E4 B8 0D                  824 	subc	a, _interrupt_sloc3_1_0+1
      0002E6 40 1A                  825 	t1sn.io	f, c
      0002E8 8E 31                  826 	goto	00111$
      0002EA                        827 00181$:
                                    828 ;	main.c: 290: if (!button_down)
      0002EA A1 0F                  829 	mov	a, _button_down+0
      0002EC 00 2A                  830 	ceqsn	a, #0x00
      0002EE 90 31                  831 	goto	00112$
      0002F0                        832 00182$:
                                    833 ;	main.c: 292: button_ctr++;
      0002F0 A0 0F                  834 	mov	a, _button_ctr+0
      0002F2 01 28                  835 	add	a, #0x01
      0002F4 A0 0B                  836 	mov	_button_ctr+0, a
                                    837 ;	main.c: 294: if (button_ctr == BTN_DEBOUNCE_DELAY)
      0002F6 A0 0F                  838 	mov	a, _button_ctr+0
      0002F8 05 2A                  839 	ceqsn	a, #0x05
      0002FA 90 31                  840 	goto	00112$
      0002FC                        841 00183$:
                                    842 ;	main.c: 296: button_down = 1;
      0002FC 01 2F                  843 	mov	a, #0x01
      0002FE A1 0B                  844 	mov	_button_down+0, a
                                    845 ;	main.c: 297: pattern_index = (pattern_index + 1) % 3;
      000300 A3 0F                  846 	mov	a, _pattern_index+0
      000302 01 28                  847 	add	a, #0x01
      000304 B9 0B                  848 	mov	__modsint_PARM_1+0, a
      000306 00 2F                  849 	mov	a, #0x00
      000308 60 00                  850 	addc	a
      00030A BA 0B                  851 	mov	__modsint_PARM_1+1, a
      00030C 03 2F                  852 	mov	a, #0x03
      00030E BB 0B                  853 	mov	__modsint_PARM_2+0, a
      000310 3C 13                  854 	clear	__modsint_PARM_2+1
      000312 D1 39                  855 	call	__modsint
      000314 A3 0B                  856 	mov	_pattern_index+0, a
                                    857 ;	main.c: 298: pattern_step = 0;
      000316 24 13                  858 	clear	_pattern_step+0
                                    859 ;	main.c: 299: start_tone_out_button();
      000318 7A 38                  860 	call	_start_tone_out_button
      00031A 90 31                  861 	goto	00112$
      00031C                        862 00111$:
                                    863 ;	main.c: 305: button_ctr = 0;
      00031C 20 13                  864 	clear	_button_ctr+0
                                    865 ;	main.c: 306: button_down = 0;
      00031E 21 13                  866 	clear	_button_down+0
      000320                        867 00112$:
                                    868 ;	main.c: 309: pattern_count++;
      000320 A2 0F                  869 	mov	a, _pattern_count+0
      000322 01 28                  870 	add	a, #0x01
      000324 A2 0B                  871 	mov	_pattern_count+0, a
                                    872 ;	main.c: 311: if (pattern_count == PATTERN_UPDATE_DELAY)
      000326 A2 0F                  873 	mov	a, _pattern_count+0
      000328 32 2A                  874 	ceqsn	a, #0x32
      00032A 99 31                  875 	goto	00114$
      00032C                        876 00184$:
                                    877 ;	main.c: 313: update_pattern();
      00032C 98 38                  878 	call	_update_pattern
                                    879 ;	main.c: 314: output_leds();
      00032E 85 38                  880 	call	_output_leds
                                    881 ;	main.c: 315: pattern_count = 0;
      000330 22 13                  882 	clear	_pattern_count+0
      000332                        883 00114$:
                                    884 ;	main.c: 318: if (tone_time)
      000332 A6 0F                  885 	mov	a, _tone_time+0
      000334 00 2B                  886 	cneqsn	a, #0x00
      000336 A3 31                  887 	goto	00118$
      000338                        888 00185$:
                                    889 ;	main.c: 320: tone_out_ctr++;
      000338 A5 0F                  890 	mov	a, _tone_out_ctr+0
      00033A 01 28                  891 	add	a, #0x01
      00033C A5 0B                  892 	mov	_tone_out_ctr+0, a
                                    893 ;	main.c: 322: if (tone_out_ctr >= tone_time)
      00033E A5 0F                  894 	mov	a, _tone_out_ctr+0
      000340 A6 0C                  895 	sub	a, _tone_time+0
                                    896 ;	main.c: 324: stop_tone_out();
      000342 40 1A                  897 	t1sn.io	f, c
      000344 80 38                  898 	call	_stop_tone_out
      000346                        899 00118$:
                                    900 ;	main.c: 328: INTRQ &= ~INTRQ_TM3; // Clear interrupt flag
      000346 C5 1D                  901 	set0.io	__intrq, #7
      000348                        902 00121$:
                                    903 ;	main.c: 330: }
      000348 73 00                  904 	pop	af
      00034A 80 0B                  905 	mov	p, a
      00034C 73 00                  906 	pop	af
      00034E 7B 00                  907 	reti
                                    908 	.area CODE
                                    909 	.area CONST
                                    910 	.area CABS (ABS)
