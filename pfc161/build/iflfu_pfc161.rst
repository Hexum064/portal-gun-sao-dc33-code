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
                                     16 	.globl _running_avg_PARM_1
                                     17 	.globl _delay_cycles_PARM_1
                                     18 	.globl _off_color
                                     19 	.globl _blue_highlight_color
                                     20 	.globl _blue_base_color
                                     21 	.globl _orange_highlight_color
                                     22 	.globl _orange_base_color
                                     23 	.globl _main
                                     24 	.globl _handle_tick
                                     25 	.globl _button_check
                                     26 	.globl _running_avg
                                     27 	.globl _handle_state_update
                                     28 	.globl _state_check
                                     29 	.globl _read_touch_raw
                                     30 	.globl _calc_touch_window
                                     31 	.globl _output_leds
                                     32 	.globl _timer_init
                                     33 	.globl _led_init
                                     34 	.globl _sys_clk_init
                                     35 	.globl _touch_init
                                     36 	.globl _uart_tx_byte
                                     37 	.globl _delay_cycles
                                     38 	.globl __t16c
                                     39 	.globl __rop
                                     40 	.globl __ilrcr
                                     41 	.globl __tm3b
                                     42 	.globl __tm3s
                                     43 	.globl __tm3ct
                                     44 	.globl __tm3c
                                     45 	.globl __lvdc
                                     46 	.globl __tkcl
                                     47 	.globl __tkch
                                     48 	.globl __tps2
                                     49 	.globl __tps
                                     50 	.globl __tke1
                                     51 	.globl __tke2
                                     52 	.globl __tcc
                                     53 	.globl __ts
                                     54 	.globl __tm2b
                                     55 	.globl __tm2s
                                     56 	.globl __tm2ct
                                     57 	.globl __tm2c
                                     58 	.globl __misclvr
                                     59 	.globl __bgtr
                                     60 	.globl __gpcs
                                     61 	.globl __gpcc
                                     62 	.globl __pbpl
                                     63 	.globl __pbph
                                     64 	.globl __pbc
                                     65 	.globl __pb
                                     66 	.globl __papl
                                     67 	.globl __paph
                                     68 	.globl __pac
                                     69 	.globl __pa
                                     70 	.globl __misc2
                                     71 	.globl __pbdier
                                     72 	.globl __padier
                                     73 	.globl __integs
                                     74 	.globl __ihrcr
                                     75 	.globl __eoscr
                                     76 	.globl __misc
                                     77 	.globl __t16m
                                     78 	.globl __intrq
                                     79 	.globl __inten
                                     80 	.globl __clkmd
                                     81 	.globl __sp
                                     82 	.globl __flag
                                     83 	.globl _uart_tx_byte_PARM_1
                                     84 	.globl _resample_count
                                     85 	.globl _lo_touch
                                     86 	.globl _hi_touch
                                     87 	.globl _last_touch
                                     88 	.globl _base_touch
                                     89 	.globl _state_update_delay_ms_cnt
                                     90 	.globl _led_update_delay_ms_cnt
                                     91 	.globl _button_down
                                     92 	.globl _button_handled
                                     93 	.globl _b_step
                                     94 	.globl _g_step
                                     95 	.globl _r_step
                                     96 	.globl _byte_ctr
                                     97 	.globl _byte_t
                                     98 	.globl _bytes
                                     99 	.globl _fades
                                    100 	.globl _pixel_buff
                                    101 	.globl _state
                                    102 	.globl _step
                                    103 	.globl _highlight_color
                                    104 	.globl _base_color
                                    105 ;--------------------------------------------------------
                                    106 ; special function registers
                                    107 ;--------------------------------------------------------
                                    108 	.area RSEG (ABS)
      000000                        109 	.org 0x0000
                           000000   110 __flag	=	0x0000
                           000002   111 __sp	=	0x0002
                           000003   112 __clkmd	=	0x0003
                           000004   113 __inten	=	0x0004
                           000005   114 __intrq	=	0x0005
                           000006   115 __t16m	=	0x0006
                           000008   116 __misc	=	0x0008
                           00000A   117 __eoscr	=	0x000a
                           00000B   118 __ihrcr	=	0x000b
                           00000C   119 __integs	=	0x000c
                           00000D   120 __padier	=	0x000d
                           00000E   121 __pbdier	=	0x000e
                           00000F   122 __misc2	=	0x000f
                           000010   123 __pa	=	0x0010
                           000011   124 __pac	=	0x0011
                           000012   125 __paph	=	0x0012
                           000013   126 __papl	=	0x0013
                           000014   127 __pb	=	0x0014
                           000015   128 __pbc	=	0x0015
                           000016   129 __pbph	=	0x0016
                           000017   130 __pbpl	=	0x0017
                           000018   131 __gpcc	=	0x0018
                           000019   132 __gpcs	=	0x0019
                           00001A   133 __bgtr	=	0x001a
                           00001B   134 __misclvr	=	0x001b
                           00001C   135 __tm2c	=	0x001c
                           00001D   136 __tm2ct	=	0x001d
                           00001E   137 __tm2s	=	0x001e
                           00001F   138 __tm2b	=	0x001f
                           000020   139 __ts	=	0x0020
                           000021   140 __tcc	=	0x0021
                           000022   141 __tke2	=	0x0022
                           000024   142 __tke1	=	0x0024
                           000026   143 __tps	=	0x0026
                           000028   144 __tps2	=	0x0028
                           00002B   145 __tkch	=	0x002b
                           00002C   146 __tkcl	=	0x002c
                           00002D   147 __lvdc	=	0x002d
                           000032   148 __tm3c	=	0x0032
                           000033   149 __tm3ct	=	0x0033
                           000034   150 __tm3s	=	0x0034
                           000035   151 __tm3b	=	0x0035
                           000039   152 __ilrcr	=	0x0039
                           00003A   153 __rop	=	0x003a
      000000                        154 __t16c::
      000000                        155 	.ds 2
                                    156 ;--------------------------------------------------------
                                    157 ; ram data
                                    158 ;--------------------------------------------------------
                                    159 	.area DATA
      000002                        160 _base_color::
      000002                        161 	.ds 3
      000005                        162 _highlight_color::
      000005                        163 	.ds 3
      000008                        164 _step::
      000008                        165 	.ds 1
      000009                        166 _state::
      000009                        167 	.ds 1
      00000A                        168 _pixel_buff::
      00000A                        169 	.ds 12
      000016                        170 _fades::
      000016                        171 	.ds 4
      00001A                        172 _bytes::
      00001A                        173 	.ds 1
      00001B                        174 _byte_t::
      00001B                        175 	.ds 1
      00001C                        176 _byte_ctr::
      00001C                        177 	.ds 1
      00001D                        178 _r_step::
      00001D                        179 	.ds 1
      00001E                        180 _g_step::
      00001E                        181 	.ds 1
      00001F                        182 _b_step::
      00001F                        183 	.ds 1
      000020                        184 _button_handled::
      000020                        185 	.ds 1
      000021                        186 _button_down::
      000021                        187 	.ds 1
      000022                        188 _led_update_delay_ms_cnt::
      000022                        189 	.ds 2
      000024                        190 _state_update_delay_ms_cnt::
      000024                        191 	.ds 2
      000026                        192 _base_touch::
      000026                        193 	.ds 2
      000028                        194 _last_touch::
      000028                        195 	.ds 2
      00002A                        196 _hi_touch::
      00002A                        197 	.ds 2
      00002C                        198 _lo_touch::
      00002C                        199 	.ds 2
      00002E                        200 _resample_count::
      00002E                        201 	.ds 2
      000030                        202 _uart_tx_byte_PARM_1:
      000030                        203 	.ds 1
      000031                        204 _uart_tx_byte_sloc1_1_0:
      000031                        205 	.ds 1
      000032                        206 _calc_touch_window_sloc2_1_0:
      000032                        207 	.ds 2
      000034                        208 _running_avg_filter_reg_10000_41:
      000034                        209 	.ds 4
      000038                        210 _handle_tick_sloc5_1_0:
      000038                        211 	.ds 1
      000039                        212 _handle_tick_sloc6_1_0:
      000039                        213 	.ds 1
      00003A                        214 _handle_tick_sloc7_1_0:
      00003A                        215 	.ds 1
      00003B                        216 _handle_tick_sloc8_1_0:
      00003B                        217 	.ds 1
      00003C                        218 _handle_tick_sloc9_1_0:
      00003C                        219 	.ds 1
      00003D                        220 _main_sloc10_1_0:
      00003D                        221 	.ds 2
      00003F                        222 _main_sloc11_1_0:
      00003F                        223 	.ds 1
                                    224 ;--------------------------------------------------------
                                    225 ; overlayable items in ram
                                    226 ;--------------------------------------------------------
                                    227 	.area	OSEG (OVR,DATA)
      000048                        228 _delay_cycles_PARM_1:
      000048                        229 	.ds 2
      00004A                        230 _delay_cycles_sloc0_1_0:
      00004A                        231 	.ds 2
                                    232 	.area	OSEG (OVR,DATA)
      000048                        233 _running_avg_PARM_1:
      000048                        234 	.ds 1
      000049                        235 _running_avg_sloc3_1_0:
      000049                        236 	.ds 4
      00004D                        237 _running_avg_sloc4_1_0:
      00004D                        238 	.ds 4
                                    239 ;--------------------------------------------------------
                                    240 ; Stack segment in internal ram
                                    241 ;--------------------------------------------------------
                                    242 	.area SSEG
      000056                        243 __start__stack:
      000056                        244 	.ds	1
                                    245 
                                    246 ;--------------------------------------------------------
                                    247 ; absolute external ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area DABS (ABS)
                                    250 ;--------------------------------------------------------
                                    251 ; interrupt vector
                                    252 ;--------------------------------------------------------
                                    253 	.area HOME
      000022                        254 __interrupt_vect:
                                    255 	.area	HEADER (ABS)
      000020                        256 	.org	 0x0020
      000020 7B 00                  257 	reti
                                    258 ;--------------------------------------------------------
                                    259 ; global & static initialisations
                                    260 ;--------------------------------------------------------
                                    261 	.area HOME
                                    262 	.area GSINIT
                                    263 	.area GSFINAL
                                    264 	.area GSINIT
                                    265 	.area	PREG (ABS)
      000000                        266 	.org 0x00
      000000                        267 p::
      000000                        268 	.ds 2
                                    269 	.area	HEADER (ABS)
      000000                        270 	.org 0x0000
      000000 00 00                  271 	nop
      000002 01 13                  272 	clear	p+1
      000004 48 2F                  273 	mov	a, #s_OSEG
      000006 0F 28                  274 	add	a, #l_OSEG + 1
      000008 FE 2C                  275 	and	a, #0xfe
      00000A 82 01                  276 	mov.io	sp, a
      00000C 45 3B                  277 	call	___sdcc_external_startup
      00000E 00 2B                  278 	cneqsn	a, #0x00
      000010 12 30                  279 	goto	__sdcc_init_data
      000012 11 30                  280 	goto	__sdcc_program_startup
                                    281 	.area GSINIT
      000024                        282 __sdcc_init_data:
      000024 02 2F                  283 	mov	a, #s_DATA
      000026 80 0B                  284 	mov	p, a
      000028 19 30                  285 	goto	00002$
      00002A                        286 00001$:
      00002A 00 2F                  287 	mov	a, #0x00
      00002C 80 03                  288 	idxm	p, a
      00002E 00 12                  289 	inc	p
      000030 02 2F                  290 	mov	a, #s_DATA
      000032                        291 00002$:
      000032 46 28                  292 	add	a, #l_DATA
      000034 00 17                  293 	ceqsn	a, p
      000036 15 30                  294 	goto	00001$
                                    295 ;	main.c: 332: static uint32_t filter_reg = 0;
      000038 34 13                  296 	clear	_running_avg_filter_reg_10000_41+0
      00003A 35 13                  297 	clear	_running_avg_filter_reg_10000_41+1
      00003C 36 13                  298 	clear	_running_avg_filter_reg_10000_41+2
      00003E 37 13                  299 	clear	_running_avg_filter_reg_10000_41+3
                                    300 ;	main.c: 90: volatile Steps step = STEP_1;
      000040 01 2F                  301 	mov	a, #0x01
      000042 88 0B                  302 	mov	_step+0, a
                                    303 ;	main.c: 91: volatile Patterns state = OFF;
      000044 09 13                  304 	clear	_state+0
                                    305 ;	main.c: 97: volatile uint8_t bytes = LED_COUNT * 3;
      000046 0C 2F                  306 	mov	a, #0x0c
      000048 9A 0B                  307 	mov	_bytes+0, a
                                    308 ;	main.c: 98: volatile uint8_t byte_t = 0;
      00004A 1B 13                  309 	clear	_byte_t+0
                                    310 ;	main.c: 99: volatile uint8_t byte_ctr = 0;
      00004C 1C 13                  311 	clear	_byte_ctr+0
                                    312 ;	main.c: 102: volatile uint8_t r_step = 0;
      00004E 1D 13                  313 	clear	_r_step+0
                                    314 ;	main.c: 103: volatile uint8_t g_step = 0;
      000050 1E 13                  315 	clear	_g_step+0
                                    316 ;	main.c: 104: volatile uint8_t b_step = 0;
      000052 1F 13                  317 	clear	_b_step+0
                                    318 ;	main.c: 106: volatile uint8_t button_handled = 0;
      000054 20 13                  319 	clear	_button_handled+0
                                    320 ;	main.c: 107: volatile uint8_t button_down = 0;
      000056 21 13                  321 	clear	_button_down+0
                                    322 ;	main.c: 109: volatile uint16_t led_update_delay_ms_cnt = 0;
      000058 22 13                  323 	clear	_led_update_delay_ms_cnt+0
      00005A 23 13                  324 	clear	_led_update_delay_ms_cnt+1
                                    325 ;	main.c: 110: volatile uint16_t state_update_delay_ms_cnt = 0;
      00005C 24 13                  326 	clear	_state_update_delay_ms_cnt+0
      00005E 25 13                  327 	clear	_state_update_delay_ms_cnt+1
                                    328 ;	main.c: 112: volatile uint16_t base_touch = 0;
      000060 26 13                  329 	clear	_base_touch+0
      000062 27 13                  330 	clear	_base_touch+1
                                    331 ;	main.c: 113: volatile uint16_t last_touch = 0;
      000064 28 13                  332 	clear	_last_touch+0
      000066 29 13                  333 	clear	_last_touch+1
                                    334 ;	main.c: 114: volatile uint16_t hi_touch = 0;
      000068 2A 13                  335 	clear	_hi_touch+0
      00006A 2B 13                  336 	clear	_hi_touch+1
                                    337 ;	main.c: 115: volatile uint16_t lo_touch = 0;
      00006C 2C 13                  338 	clear	_lo_touch+0
      00006E 2D 13                  339 	clear	_lo_touch+1
                                    340 ;	main.c: 116: volatile uint16_t resample_count = 0;
      000070 2E 13                  341 	clear	_resample_count+0
      000072 2F 13                  342 	clear	_resample_count+1
                                    343 	.area GSFINAL
      000074 11 30                  344 	goto	__sdcc_program_startup
                                    345 ;--------------------------------------------------------
                                    346 ; Home
                                    347 ;--------------------------------------------------------
                                    348 	.area HOME
                                    349 	.area HOME
      000022                        350 __sdcc_program_startup:
      000022 BA 32                  351 	goto	_main
                                    352 ;	return from main will return to caller
                                    353 ;--------------------------------------------------------
                                    354 ; code
                                    355 ;--------------------------------------------------------
                                    356 	.area CODE
                                    357 ;	main.c: 119: void delay_cycles(uint16_t cycles)
                                    358 ;	-----------------------------------------
                                    359 ;	 function delay_cycles
                                    360 ;	-----------------------------------------
      000076                        361 _delay_cycles:
                                    362 ;	main.c: 121: while (cycles--)
      000076 C8 0F                  363 	mov	a, _delay_cycles_PARM_1+0
      000078 CA 0B                  364 	mov	_delay_cycles_sloc0_1_0+0, a
      00007A C9 0F                  365 	mov	a, _delay_cycles_PARM_1+1
      00007C CB 0B                  366 	mov	_delay_cycles_sloc0_1_0+1, a
      00007E                        367 00101$:
      00007E CB 0F                  368 	mov	a, _delay_cycles_sloc0_1_0+1
      000080 80 0B                  369 	mov	p, a
      000082 CA 0F                  370 	mov	a, _delay_cycles_sloc0_1_0+0
      000084 CA 12                  371 	dec	_delay_cycles_sloc0_1_0+0
      000086 CB 10                  372 	subc	_delay_cycles_sloc0_1_0+1
      000088 80 0E                  373 	or	a, p
      00008A 00 2B                  374 	cneqsn	a, #0x00
      00008C 7A 00                  375 	ret
      00008E                        376 00119$:
                                    377 ;	main.c: 123: __asm__("nop"); // Adjust based on compiler cycle counts
      00008E 00 00                  378 	nop
      000090 3F 30                  379 	goto	00101$
                                    380 ;	main.c: 125: }
      000092 7A 00                  381 	ret
                                    382 ;	main.c: 127: void uart_tx_byte(uint8_t data)
                                    383 ;	-----------------------------------------
                                    384 ;	 function uart_tx_byte
                                    385 ;	-----------------------------------------
      000094                        386 _uart_tx_byte:
                                    387 ;	main.c: 130: PA &= ~TX_PIN;
      000094 D0 1C                  388 	set0.io	__pa, #3
                                    389 ;	main.c: 131: delay_cycles(BIT_PERIOD);
      000096 3E 2F                  390 	mov	a, #0x3e
      000098 C8 0B                  391 	mov	_delay_cycles_PARM_1+0, a
      00009A 49 13                  392 	clear	_delay_cycles_PARM_1+1
      00009C 3B 38                  393 	call	_delay_cycles
                                    394 ;	main.c: 134: for (uint8_t i = 0; i < 8; i++)
      00009E 31 13                  395 	clear	_uart_tx_byte_sloc1_1_0+0
      0000A0                        396 00106$:
      0000A0 B1 0F                  397 	mov	a, _uart_tx_byte_sloc1_1_0+0
      0000A2 08 29                  398 	sub	a, #0x08
      0000A4 40 1A                  399 	t1sn.io	f, c
      0000A6 62 30                  400 	goto	00104$
      0000A8                        401 00129$:
                                    402 ;	main.c: 136: if (data & 0x01)
      0000A8 B0 0F                  403 	mov	a, _uart_tx_byte_PARM_1+0
      0000AA 01 2C                  404 	and	a, #0x01
      0000AC 00 2B                  405 	cneqsn	a, #0x00
      0000AE 5A 30                  406 	goto	00102$
      0000B0                        407 00130$:
                                    408 ;	main.c: 138: PA |= TX_PIN;
      0000B0 D0 1E                  409 	set1.io	__pa, #3
      0000B2 5B 30                  410 	goto	00103$
      0000B4                        411 00102$:
                                    412 ;	main.c: 142: PA &= ~TX_PIN;
      0000B4 D0 1C                  413 	set0.io	__pa, #3
      0000B6                        414 00103$:
                                    415 ;	main.c: 144: data >>= 1;
      0000B6 30 15                  416 	sr	_uart_tx_byte_PARM_1+0
                                    417 ;	main.c: 145: delay_cycles(BIT_PERIOD);
      0000B8 3E 2F                  418 	mov	a, #0x3e
      0000BA C8 0B                  419 	mov	_delay_cycles_PARM_1+0, a
      0000BC 49 13                  420 	clear	_delay_cycles_PARM_1+1
      0000BE 3B 38                  421 	call	_delay_cycles
                                    422 ;	main.c: 134: for (uint8_t i = 0; i < 8; i++)
      0000C0 31 12                  423 	inc	_uart_tx_byte_sloc1_1_0+0
      0000C2 50 30                  424 	goto	00106$
      0000C4                        425 00104$:
                                    426 ;	main.c: 149: PA |= TX_PIN;
      0000C4 D0 1E                  427 	set1.io	__pa, #3
                                    428 ;	main.c: 150: delay_cycles(BIT_PERIOD);
      0000C6 3E 2F                  429 	mov	a, #0x3e
      0000C8 C8 0B                  430 	mov	_delay_cycles_PARM_1+0, a
      0000CA 49 13                  431 	clear	_delay_cycles_PARM_1+1
      0000CC 3B 38                  432 	call	_delay_cycles
                                    433 ;	main.c: 152: delay_cycles(BIT_PERIOD);
      0000CE 3E 2F                  434 	mov	a, #0x3e
      0000D0 C8 0B                  435 	mov	_delay_cycles_PARM_1+0, a
      0000D2 49 13                  436 	clear	_delay_cycles_PARM_1+1
      0000D4 3B 30                  437 	goto	_delay_cycles
                                    438 ;	main.c: 153: }
      0000D6 7A 00                  439 	ret
                                    440 ;	main.c: 155: void touch_init(void)
                                    441 ;	-----------------------------------------
                                    442 ;	 function touch_init
                                    443 ;	-----------------------------------------
      0000D8                        444 _touch_init:
                                    445 ;	main.c: 158: TS = TS_TP_CLK_IHRC_DIV2 | TS_TP_VREF_VCC05 | TS_DISCHARGE_WAIT_128CLOCKS;
      0000D8 13 2F                  446 	mov	a, #0x13
      0000DA A0 01                  447 	mov.io	__ts, a
                                    448 ;	main.c: 159: TPS2 = TPS2_TOUCH_TYPE_B | TPS2_VREFNONFLOAT_ALWAYS_ON;
      0000DC 41 2F                  449 	mov	a, #0x41
      0000DE A8 01                  450 	mov.io	__tps2, a
                                    451 ;	main.c: 160: PAC &= ~(BTN_bm);            // Pin 4 as in
      0000E0 11 1D                  452 	set0.io	__pac, #4
                                    453 ;	main.c: 161: PADIER &= ~(BTN_bm | CS_bm); // Disable digital input for touch and CS pins
      0000E2 CD 01                  454 	mov.io	a, __padier
      0000E4 6F 2C                  455 	and	a, #0x6f
      0000E6 8D 01                  456 	mov.io	__padier, a
                                    457 ;	main.c: 162: }
      0000E8 7A 00                  458 	ret
                                    459 ;	main.c: 164: void sys_clk_init(void)
                                    460 ;	-----------------------------------------
                                    461 ;	 function sys_clk_init
                                    462 ;	-----------------------------------------
      0000EA                        463 _sys_clk_init:
                                    464 ;	main.c: 167: CLKMD = CLKMD_ENABLE_IHRC | CLKMD_IHRC_DIV2 | CLKMD_ENABLE_ILRC; // First enable IHRC
      0000EA 34 2F                  465 	mov	a, #0x34
      0000EC 83 01                  466 	mov.io	__clkmd, a
                                    467 ;	main.c: 168: }
      0000EE 7A 00                  468 	ret
                                    469 ;	main.c: 170: void led_init(void)
                                    470 ;	-----------------------------------------
                                    471 ;	 function led_init
                                    472 ;	-----------------------------------------
      0000F0                        473 _led_init:
                                    474 ;	main.c: 173: PAC |= LED_bm;
      0000F0 51 1F                  475 	set1.io	__pac, #5
                                    476 ;	main.c: 174: }
      0000F2 7A 00                  477 	ret
                                    478 ;	main.c: 176: void timer_init(void)
                                    479 ;	-----------------------------------------
                                    480 ;	 function timer_init
                                    481 ;	-----------------------------------------
      0000F4                        482 _timer_init:
                                    483 ;	main.c: 178: TM2B = 0xFF; // Max bound for 8-bit timer
      0000F4 FF 2F                  484 	mov	a, #0xff
      0000F6 9F 01                  485 	mov.io	__tm2b, a
                                    486 ;	main.c: 179: TM2C = TM2C_CLK_ILRC | TM2C_OUT_DISABLE | TM2C_MODE_PERIOD;
      0000F8 40 2F                  487 	mov	a, #0x40
      0000FA 9C 01                  488 	mov.io	__tm2c, a
                                    489 ;	main.c: 180: TM2S = TM2S_PRESCALE_DIV64; // Should be 1ms, and start
      0000FC 60 2F                  490 	mov	a, #0x60
      0000FE 9E 01                  491 	mov.io	__tm2s, a
                                    492 ;	main.c: 181: }
      000100 7A 00                  493 	ret
                                    494 ;	main.c: 185: void output_leds(void)
                                    495 ;	-----------------------------------------
                                    496 ;	 function output_leds
                                    497 ;	-----------------------------------------
      000102                        498 _output_leds:
                                    499 ;	main.c: 187: __asm__("    mov a, _bytes              ;move our byte count into a");
      000102 9A 0F                  500 	mov	a, _bytes              ;move our byte count into a
                                    501 ;	main.c: 188: __asm__("    mov _byte_ctr, a           ;move a into our index counter");
      000104 9C 0B                  502 	mov	_byte_ctr, a           ;move a into our index counter
                                    503 ;	main.c: 189: __asm__("    mov	a, #(_pixel_buff)   ;load the address of the array into a");
      000106 0A 2F                  504 	mov	a, #(_pixel_buff)   ;load the address of the array into a
                                    505 ;	main.c: 190: __asm__("    mov	p, a                ;put that address into p (a mem location)");
      000108 80 0B                  506 	mov	p, a                ;put that address into p (a mem location)
                                    507 ;	main.c: 191: __asm__("00010$:");
      00010A                        508 	00010$:
                                    509 ;	main.c: 192: __asm__("    idxm	a, p                ;load the byte data from the array into a");
      00010A 81 03                  510 	idxm	a, p                ;load the byte data from the array into a
                                    511 ;	main.c: 193: __asm__("    inc p                      ;inc p to the next address");
      00010C 00 12                  512 	inc	p                      ;inc p to the next address
                                    513 ;	main.c: 194: __asm__("    mov	_byte_t, a          ;load the byte data into byte_t");
      00010E 9B 0B                  514 	mov	_byte_t, a          ;load the byte data into byte_t
                                    515 ;	main.c: 195: __asm__("    mov a, #0x08               ;reset the bit count");
      000110 08 2F                  516 	mov	a, #0x08               ;reset the bit count
                                    517 ;	main.c: 196: __asm__("00011$:");
      000112                        518 	00011$:
                                    519 ;	main.c: 197: __asm__("    ;output bit");
                                    520 ;output	bit
                                    521 ;	main.c: 198: __asm__("    set1.io __pa, #5           ;set the output pin high");
      000112 50 1F                  522 	set1.io	__pa, #5           ;set the output pin high
                                    523 ;	main.c: 199: __asm__("    t1sn _byte_t, #7           ;if the current MSB is 1, skip setting the pin low now");
      000114 DB 23                  524 	t1sn	_byte_t, #7           ;if the current MSB is 1, skip setting the pin low now
                                    525 ;	main.c: 200: __asm__("    set0.io __pa, #5           ;set the output pin low");
      000116 50 1D                  526 	set0.io	__pa, #5           ;set the output pin low
                                    527 ;	main.c: 201: __asm__("    nop                        ;wait one cycle");
      000118 00 00                  528 	nop	                       ;wait one cycle
                                    529 ;	main.c: 202: __asm__("    set0.io __pa, #5           ;set the output pin low");
      00011A 50 1D                  530 	set0.io	__pa, #5           ;set the output pin low
                                    531 ;	main.c: 203: __asm__("    sl _byte_t                 ;left-shift the data byte (the LEDs are MSB first)");
      00011C 9B 15                  532 	sl	_byte_t                 ;left-shift the data byte (the LEDs are MSB first)
                                    533 ;	main.c: 204: __asm__("    dzsn a                     ;dec a and skip next instruction if 0");
      00011E 63 00                  534 	dzsn	a                     ;dec a and skip next instruction if 0
                                    535 ;	main.c: 205: __asm__("    goto 00011$                ;jump back to 00011");
      000120 89 30                  536 	goto	00011$                ;jump back to 00011
                                    537 ;	main.c: 206: __asm__("    dzsn _byte_ctr             ;dec our index counter and skip the goto if 0");
      000122 9C 11                  538 	dzsn	_byte_ctr             ;dec our index counter and skip the goto if 0
                                    539 ;	main.c: 207: __asm__("    goto	00010$              ;goto the next byte");
      000124 85 30                  540 	goto	00010$              ;goto the next byte
                                    541 ;	main.c: 208: }
      000126 7A 00                  542 	ret
                                    543 ;	main.c: 210: void calc_touch_window(void)
                                    544 ;	-----------------------------------------
                                    545 ;	 function calc_touch_window
                                    546 ;	-----------------------------------------
      000128                        547 _calc_touch_window:
                                    548 ;	main.c: 212: uint16_t big_thress = base_touch * TOUCH_WINDOW_DIV;
      000128 A6 0F                  549 	mov	a, _base_touch+0
      00012A C4 0B                  550 	mov	__mulint_PARM_2+0, a
      00012C A7 0F                  551 	mov	a, _base_touch+1
      00012E C5 0B                  552 	mov	__mulint_PARM_2+1, a
      000130 19 2F                  553 	mov	a, #0x19
      000132 C2 0B                  554 	mov	__mulint_PARM_1+0, a
      000134 43 13                  555 	clear	__mulint_PARM_1+1
      000136 11 3B                  556 	call	__mulint
                                    557 ;	main.c: 213: uint16_t thresh = big_thress >> 7; // divide by 128
      000138 B2 0B                  558 	mov	_calc_touch_window_sloc2_1_0+0, a
      00013A 80 0F                  559 	mov	a, p
      00013C B3 0B                  560 	mov	_calc_touch_window_sloc2_1_0+1, a
      00013E 07 2F                  561 	mov	a, #7
      000140                        562 00111$:
      000140 33 15                  563 	sr	_calc_touch_window_sloc2_1_0+1
      000142 32 16                  564 	src	_calc_touch_window_sloc2_1_0+0
      000144 63 00                  565 	dzsn	a
      000146 A0 30                  566 	goto	00111$
      000148                        567 00112$:
                                    568 ;	main.c: 215: hi_touch = base_touch + thresh;
      000148 A6 0F                  569 	mov	a, _base_touch+0
      00014A 32 0C                  570 	add	a, _calc_touch_window_sloc2_1_0+0
      00014C AA 0B                  571 	mov	_hi_touch+0, a
      00014E A7 0F                  572 	mov	a, _base_touch+1
      000150 33 0D                  573 	addc	a, _calc_touch_window_sloc2_1_0+1
      000152 AB 0B                  574 	mov	_hi_touch+1, a
                                    575 ;	main.c: 216: lo_touch = (base_touch > thresh) ? base_touch - thresh : 0;
      000154 B2 0F                  576 	mov	a, _calc_touch_window_sloc2_1_0+0
      000156 A6 0C                  577 	sub	a, _base_touch+0
      000158 B3 0F                  578 	mov	a, _calc_touch_window_sloc2_1_0+1
      00015A A7 0D                  579 	subc	a, _base_touch+1
      00015C 40 1A                  580 	t1sn.io	f, c
      00015E B6 30                  581 	goto	00103$
      000160                        582 00113$:
      000160 A6 0F                  583 	mov	a, _base_touch+0
      000162 B2 0C                  584 	sub	a, _calc_touch_window_sloc2_1_0+0
      000164 80 0B                  585 	mov	p, a
      000166 A7 0F                  586 	mov	a, _base_touch+1
      000168 B3 0D                  587 	subc	a, _calc_touch_window_sloc2_1_0+1
      00016A B8 30                  588 	goto	00104$
      00016C                        589 00103$:
      00016C 00 13                  590 	clear	p
      00016E 00 2F                  591 	mov	a, #0x00
      000170                        592 00104$:
      000170 AD 0B                  593 	mov	_lo_touch+1, a
      000172 80 0F                  594 	mov	a, p
      000174 AC 0B                  595 	mov	_lo_touch+0, a
                                    596 ;	main.c: 225: }
      000176 7A 00                  597 	ret
                                    598 ;	main.c: 227: uint16_t read_touch_raw(void)
                                    599 ;	-----------------------------------------
                                    600 ;	 function read_touch_raw
                                    601 ;	-----------------------------------------
      000178                        602 _read_touch_raw:
                                    603 ;	main.c: 230: TKE1 = TKE1_TK6_PA4; // Use PA4 as touch input
      000178 40 2F                  604 	mov	a, #0x40
      00017A A4 01                  605 	mov.io	__tke1, a
                                    606 ;	main.c: 231: TKE2 = 0;            // Disable other channels
      00017C 00 2F                  607 	mov	a, #0x00
      00017E A2 01                  608 	mov.io	__tke2, a
                                    609 ;	main.c: 232: TCC = TCC_TK_RUN;
      000180 10 2F                  610 	mov	a, #0x10
      000182 A1 01                  611 	mov.io	__tcc, a
                                    612 ;	main.c: 234: while (TCC & TCC_TK_RUN)
      000184                        613 00101$:
      000184 21 19                  614 	t0sn.io	__tcc, #4
      000186 C2 30                  615 	goto	00101$
      000188                        616 00118$:
                                    617 ;	main.c: 237: return (TKCH << 8) | TKCL;
      000188 EB 01                  618 	mov.io	a, __tkch
      00018A 80 0B                  619 	mov	p, a
      00018C EC 01                  620 	mov.io	a, __tkcl
                                    621 ;	main.c: 238: }
      00018E 7A 00                  622 	ret
                                    623 ;	main.c: 240: void state_check(void)
                                    624 ;	-----------------------------------------
                                    625 ;	 function state_check
                                    626 ;	-----------------------------------------
      000190                        627 _state_check:
                                    628 ;	main.c: 243: switch (step)
      000190 88 0F                  629 	mov	a, _step+0
      000192 08 2A                  630 	ceqsn	a, #0x08
      000194 40 1A                  631 	t1sn.io	f, c
      000196                        632 00119$:
      000196 52 31                  633 	goto	00109$
      000198                        634 00120$:
      000198 01 28                  635 	add	a, #0x01
      00019A 67 00                  636 	pcadd	a
      00019C 52 31                  637 	goto	#00109$
      00019E D6 30                  638 	goto	#00101$
      0001A0 09 31                  639 	goto	#00102$
      0001A2 0F 31                  640 	goto	#00103$
      0001A4 21 31                  641 	goto	#00104$
      0001A6 33 31                  642 	goto	#00105$
      0001A8 39 31                  643 	goto	#00106$
      0001AA 4B 31                  644 	goto	#00107$
                                    645 ;	main.c: 245: case STEP_1:
      0001AC                        646 00101$:
                                    647 ;	main.c: 246: pixel_buff[3] = highlight_color;
      0001AC 13 2F                  648 	mov	a, #(_pixel_buff + 9)
      0001AE C8 0B                  649 	mov	___memcpy_PARM_1+0, a
      0001B0 49 13                  650 	clear	___memcpy_PARM_1+1
      0001B2 05 2F                  651 	mov	a, #(_highlight_color + 0)
      0001B4 CA 0B                  652 	mov	___memcpy_PARM_2+0, a
      0001B6 4B 13                  653 	clear	___memcpy_PARM_2+1
      0001B8 03 2F                  654 	mov	a, #0x03
      0001BA CC 0B                  655 	mov	___memcpy_PARM_3+0, a
      0001BC 4D 13                  656 	clear	___memcpy_PARM_3+1
      0001BE E8 3A                  657 	call	___memcpy
                                    658 ;	main.c: 247: pixel_buff[2] = base_color;
      0001C0 10 2F                  659 	mov	a, #(_pixel_buff + 6)
      0001C2 C8 0B                  660 	mov	___memcpy_PARM_1+0, a
      0001C4 49 13                  661 	clear	___memcpy_PARM_1+1
      0001C6 02 2F                  662 	mov	a, #(_base_color + 0)
      0001C8 CA 0B                  663 	mov	___memcpy_PARM_2+0, a
      0001CA 4B 13                  664 	clear	___memcpy_PARM_2+1
      0001CC 03 2F                  665 	mov	a, #0x03
      0001CE CC 0B                  666 	mov	___memcpy_PARM_3+0, a
      0001D0 4D 13                  667 	clear	___memcpy_PARM_3+1
      0001D2 E8 3A                  668 	call	___memcpy
                                    669 ;	main.c: 248: pixel_buff[1] = base_color;
      0001D4 0D 2F                  670 	mov	a, #(_pixel_buff + 3)
      0001D6 C8 0B                  671 	mov	___memcpy_PARM_1+0, a
      0001D8 49 13                  672 	clear	___memcpy_PARM_1+1
      0001DA 02 2F                  673 	mov	a, #(_base_color + 0)
      0001DC CA 0B                  674 	mov	___memcpy_PARM_2+0, a
      0001DE 4B 13                  675 	clear	___memcpy_PARM_2+1
      0001E0 03 2F                  676 	mov	a, #0x03
      0001E2 CC 0B                  677 	mov	___memcpy_PARM_3+0, a
      0001E4 4D 13                  678 	clear	___memcpy_PARM_3+1
      0001E6 E8 3A                  679 	call	___memcpy
                                    680 ;	main.c: 249: pixel_buff[0] = base_color;
      0001E8 0A 2F                  681 	mov	a, #(_pixel_buff + 0)
      0001EA C8 0B                  682 	mov	___memcpy_PARM_1+0, a
      0001EC 49 13                  683 	clear	___memcpy_PARM_1+1
      0001EE 02 2F                  684 	mov	a, #(_base_color + 0)
      0001F0 CA 0B                  685 	mov	___memcpy_PARM_2+0, a
      0001F2 4B 13                  686 	clear	___memcpy_PARM_2+1
      0001F4 03 2F                  687 	mov	a, #0x03
      0001F6 CC 0B                  688 	mov	___memcpy_PARM_3+0, a
      0001F8 4D 13                  689 	clear	___memcpy_PARM_3+1
      0001FA E8 3A                  690 	call	___memcpy
                                    691 ;	main.c: 250: fades[3] = FADE_STEPS;
      0001FC 08 2F                  692 	mov	a, #0x08
      0001FE 99 0B                  693 	mov	_fades+3, a
                                    694 ;	main.c: 251: fades[2] = 0;
      000200 18 13                  695 	clear	_fades+2
                                    696 ;	main.c: 252: fades[1] = 0;
      000202 17 13                  697 	clear	_fades+1
                                    698 ;	main.c: 253: fades[0] = 0;
      000204 16 13                  699 	clear	_fades+0
                                    700 ;	main.c: 254: state_update_delay_ms_cnt = STATE_1_DELAY_ms;
      000206 C8 2F                  701 	mov	a, #0xc8
      000208 A4 0B                  702 	mov	_state_update_delay_ms_cnt+0, a
      00020A 25 13                  703 	clear	_state_update_delay_ms_cnt+1
                                    704 ;	main.c: 255: step = STEP_2;
      00020C 02 2F                  705 	mov	a, #0x02
      00020E 88 0B                  706 	mov	_step+0, a
                                    707 ;	main.c: 256: break;
      000210 7A 00                  708 	ret
                                    709 ;	main.c: 258: case STEP_2:
      000212                        710 00102$:
                                    711 ;	main.c: 259: state_update_delay_ms_cnt = STATE_2_DELAY_ms;
      000212 64 2F                  712 	mov	a, #0x64
      000214 A4 0B                  713 	mov	_state_update_delay_ms_cnt+0, a
      000216 25 13                  714 	clear	_state_update_delay_ms_cnt+1
                                    715 ;	main.c: 260: step = STEP_3;
      000218 03 2F                  716 	mov	a, #0x03
      00021A 88 0B                  717 	mov	_step+0, a
                                    718 ;	main.c: 261: break;
      00021C 7A 00                  719 	ret
                                    720 ;	main.c: 262: case STEP_3:
      00021E                        721 00103$:
                                    722 ;	main.c: 263: pixel_buff[2] = highlight_color;
      00021E 10 2F                  723 	mov	a, #(_pixel_buff + 6)
      000220 C8 0B                  724 	mov	___memcpy_PARM_1+0, a
      000222 49 13                  725 	clear	___memcpy_PARM_1+1
      000224 05 2F                  726 	mov	a, #(_highlight_color + 0)
      000226 CA 0B                  727 	mov	___memcpy_PARM_2+0, a
      000228 4B 13                  728 	clear	___memcpy_PARM_2+1
      00022A 03 2F                  729 	mov	a, #0x03
      00022C CC 0B                  730 	mov	___memcpy_PARM_3+0, a
      00022E 4D 13                  731 	clear	___memcpy_PARM_3+1
      000230 E8 3A                  732 	call	___memcpy
                                    733 ;	main.c: 264: fades[2] = FADE_STEPS;
      000232 08 2F                  734 	mov	a, #0x08
      000234 98 0B                  735 	mov	_fades+2, a
                                    736 ;	main.c: 265: state_update_delay_ms_cnt = STATE_3_DELAY_ms;
      000236 64 2F                  737 	mov	a, #0x64
      000238 A4 0B                  738 	mov	_state_update_delay_ms_cnt+0, a
      00023A 25 13                  739 	clear	_state_update_delay_ms_cnt+1
                                    740 ;	main.c: 266: step = STEP_4;
      00023C 04 2F                  741 	mov	a, #0x04
      00023E 88 0B                  742 	mov	_step+0, a
                                    743 ;	main.c: 267: break;
      000240 7A 00                  744 	ret
                                    745 ;	main.c: 268: case STEP_4:
      000242                        746 00104$:
                                    747 ;	main.c: 269: pixel_buff[1] = highlight_color;
      000242 0D 2F                  748 	mov	a, #(_pixel_buff + 3)
      000244 C8 0B                  749 	mov	___memcpy_PARM_1+0, a
      000246 49 13                  750 	clear	___memcpy_PARM_1+1
      000248 05 2F                  751 	mov	a, #(_highlight_color + 0)
      00024A CA 0B                  752 	mov	___memcpy_PARM_2+0, a
      00024C 4B 13                  753 	clear	___memcpy_PARM_2+1
      00024E 03 2F                  754 	mov	a, #0x03
      000250 CC 0B                  755 	mov	___memcpy_PARM_3+0, a
      000252 4D 13                  756 	clear	___memcpy_PARM_3+1
      000254 E8 3A                  757 	call	___memcpy
                                    758 ;	main.c: 270: fades[1] = FADE_STEPS;
      000256 08 2F                  759 	mov	a, #0x08
      000258 97 0B                  760 	mov	_fades+1, a
                                    761 ;	main.c: 271: state_update_delay_ms_cnt = STATE_4_DELAY_ms;
      00025A C8 2F                  762 	mov	a, #0xc8
      00025C A4 0B                  763 	mov	_state_update_delay_ms_cnt+0, a
      00025E 25 13                  764 	clear	_state_update_delay_ms_cnt+1
                                    765 ;	main.c: 272: step = STEP_5;
      000260 05 2F                  766 	mov	a, #0x05
      000262 88 0B                  767 	mov	_step+0, a
                                    768 ;	main.c: 273: break;
      000264 7A 00                  769 	ret
                                    770 ;	main.c: 274: case STEP_5:
      000266                        771 00105$:
                                    772 ;	main.c: 275: state_update_delay_ms_cnt = STATE_5_DELAY_ms;
      000266 C8 2F                  773 	mov	a, #0xc8
      000268 A4 0B                  774 	mov	_state_update_delay_ms_cnt+0, a
      00026A 25 13                  775 	clear	_state_update_delay_ms_cnt+1
                                    776 ;	main.c: 276: step = STEP_6;
      00026C 06 2F                  777 	mov	a, #0x06
      00026E 88 0B                  778 	mov	_step+0, a
                                    779 ;	main.c: 277: break;
      000270 7A 00                  780 	ret
                                    781 ;	main.c: 278: case STEP_6:
      000272                        782 00106$:
                                    783 ;	main.c: 279: pixel_buff[0] = highlight_color;
      000272 0A 2F                  784 	mov	a, #(_pixel_buff + 0)
      000274 C8 0B                  785 	mov	___memcpy_PARM_1+0, a
      000276 49 13                  786 	clear	___memcpy_PARM_1+1
      000278 05 2F                  787 	mov	a, #(_highlight_color + 0)
      00027A CA 0B                  788 	mov	___memcpy_PARM_2+0, a
      00027C 4B 13                  789 	clear	___memcpy_PARM_2+1
      00027E 03 2F                  790 	mov	a, #0x03
      000280 CC 0B                  791 	mov	___memcpy_PARM_3+0, a
      000282 4D 13                  792 	clear	___memcpy_PARM_3+1
      000284 E8 3A                  793 	call	___memcpy
                                    794 ;	main.c: 280: fades[0] = FADE_STEPS;
      000286 08 2F                  795 	mov	a, #0x08
      000288 96 0B                  796 	mov	_fades+0, a
                                    797 ;	main.c: 281: state_update_delay_ms_cnt = STATE_6_DELAY_ms;
      00028A C8 2F                  798 	mov	a, #0xc8
      00028C A4 0B                  799 	mov	_state_update_delay_ms_cnt+0, a
      00028E 25 13                  800 	clear	_state_update_delay_ms_cnt+1
                                    801 ;	main.c: 282: step = STEP_7;
      000290 07 2F                  802 	mov	a, #0x07
      000292 88 0B                  803 	mov	_step+0, a
                                    804 ;	main.c: 283: break;
      000294 7A 00                  805 	ret
                                    806 ;	main.c: 284: case STEP_7:
      000296                        807 00107$:
                                    808 ;	main.c: 285: state_update_delay_ms_cnt = STATE_7_DELAY_ms;
      000296 E8 2F                  809 	mov	a, #0xe8
      000298 A4 0B                  810 	mov	_state_update_delay_ms_cnt+0, a
      00029A 03 2F                  811 	mov	a, #0x03
      00029C A5 0B                  812 	mov	_state_update_delay_ms_cnt+1, a
                                    813 ;	main.c: 286: step = STEP_1;
      00029E 01 2F                  814 	mov	a, #0x01
      0002A0 88 0B                  815 	mov	_step+0, a
                                    816 ;	main.c: 287: break;
      0002A2 7A 00                  817 	ret
                                    818 ;	main.c: 289: case NONE:
      0002A4                        819 00109$:
                                    820 ;	main.c: 290: pixel_buff[0] = off_color;
      0002A4 0A 2F                  821 	mov	a, #(_pixel_buff + 0)
      0002A6 C8 0B                  822 	mov	___memcpy_PARM_1+0, a
      0002A8 49 13                  823 	clear	___memcpy_PARM_1+1
      0002AA 5E 2F                  824 	mov	a, #<(_off_color + 0)
      0002AC CA 0B                  825 	mov	___memcpy_PARM_2+0, a
      0002AE 83 2F                  826 	mov	a, #>(_off_color + 0x8000 + 0)
      0002B0 CB 0B                  827 	mov	___memcpy_PARM_2+1, a
      0002B2 03 2F                  828 	mov	a, #0x03
      0002B4 CC 0B                  829 	mov	___memcpy_PARM_3+0, a
      0002B6 4D 13                  830 	clear	___memcpy_PARM_3+1
      0002B8 E8 3A                  831 	call	___memcpy
                                    832 ;	main.c: 291: pixel_buff[1] = off_color;
      0002BA 0D 2F                  833 	mov	a, #(_pixel_buff + 3)
      0002BC C8 0B                  834 	mov	___memcpy_PARM_1+0, a
      0002BE 49 13                  835 	clear	___memcpy_PARM_1+1
      0002C0 5E 2F                  836 	mov	a, #<(_off_color + 0)
      0002C2 CA 0B                  837 	mov	___memcpy_PARM_2+0, a
      0002C4 83 2F                  838 	mov	a, #>(_off_color + 0x8000 + 0)
      0002C6 CB 0B                  839 	mov	___memcpy_PARM_2+1, a
      0002C8 03 2F                  840 	mov	a, #0x03
      0002CA CC 0B                  841 	mov	___memcpy_PARM_3+0, a
      0002CC 4D 13                  842 	clear	___memcpy_PARM_3+1
      0002CE E8 3A                  843 	call	___memcpy
                                    844 ;	main.c: 292: pixel_buff[2] = off_color;
      0002D0 10 2F                  845 	mov	a, #(_pixel_buff + 6)
      0002D2 C8 0B                  846 	mov	___memcpy_PARM_1+0, a
      0002D4 49 13                  847 	clear	___memcpy_PARM_1+1
      0002D6 5E 2F                  848 	mov	a, #<(_off_color + 0)
      0002D8 CA 0B                  849 	mov	___memcpy_PARM_2+0, a
      0002DA 83 2F                  850 	mov	a, #>(_off_color + 0x8000 + 0)
      0002DC CB 0B                  851 	mov	___memcpy_PARM_2+1, a
      0002DE 03 2F                  852 	mov	a, #0x03
      0002E0 CC 0B                  853 	mov	___memcpy_PARM_3+0, a
      0002E2 4D 13                  854 	clear	___memcpy_PARM_3+1
      0002E4 E8 3A                  855 	call	___memcpy
                                    856 ;	main.c: 293: pixel_buff[3] = off_color;
      0002E6 13 2F                  857 	mov	a, #(_pixel_buff + 9)
      0002E8 C8 0B                  858 	mov	___memcpy_PARM_1+0, a
      0002EA 49 13                  859 	clear	___memcpy_PARM_1+1
      0002EC 5E 2F                  860 	mov	a, #<(_off_color + 0)
      0002EE CA 0B                  861 	mov	___memcpy_PARM_2+0, a
      0002F0 83 2F                  862 	mov	a, #>(_off_color + 0x8000 + 0)
      0002F2 CB 0B                  863 	mov	___memcpy_PARM_2+1, a
      0002F4 03 2F                  864 	mov	a, #0x03
      0002F6 CC 0B                  865 	mov	___memcpy_PARM_3+0, a
      0002F8 4D 13                  866 	clear	___memcpy_PARM_3+1
      0002FA E8 3A                  867 	call	___memcpy
                                    868 ;	main.c: 294: output_leds();
      0002FC 81 30                  869 	goto	_output_leds
                                    870 ;	main.c: 296: }
                                    871 ;	main.c: 297: }
      0002FE 7A 00                  872 	ret
                                    873 ;	main.c: 299: void handle_state_update(void)
                                    874 ;	-----------------------------------------
                                    875 ;	 function handle_state_update
                                    876 ;	-----------------------------------------
      000300                        877 _handle_state_update:
                                    878 ;	main.c: 302: switch (state)
      000300 89 0F                  879 	mov	a, _state+0
      000302 00 2B                  880 	cneqsn	a, #0x00
      000304 87 31                  881 	goto	00102$
      000306                        882 00121$:
      000306 01 2B                  883 	cneqsn	a, #0x01
      000308 8B 31                  884 	goto	00103$
      00030A                        885 00123$:
      00030A 02 2B                  886 	cneqsn	a, #0x02
      00030C AB 31                  887 	goto	00104$
      00030E                        888 00125$:
                                    889 ;	main.c: 305: case OFF:
      00030E                        890 00102$:
                                    891 ;	main.c: 306: step = NONE;
      00030E 08 13                  892 	clear	_step+0
                                    893 ;	main.c: 307: state = BLUE;
      000310 01 2F                  894 	mov	a, #0x01
      000312 89 0B                  895 	mov	_state+0, a
                                    896 ;	main.c: 308: break;
      000314 7A 00                  897 	ret
                                    898 ;	main.c: 309: case BLUE:
      000316                        899 00103$:
                                    900 ;	main.c: 310: r_step = BLUE_R_STEP;
                                    901 ;	main.c: 311: g_step = BLUE_G_STEP;
      000316 02 2F                  902 	mov a, #0x02
      000318 9D 0B                  903 	mov  _r_step+0, a
      00031A 9E 0B                  904 	mov	_g_step+0, a
                                    905 ;	main.c: 312: b_step = BLUE_B_STEP;
      00031C 08 2F                  906 	mov	a, #0x08
      00031E 9F 0B                  907 	mov	_b_step+0, a
                                    908 ;	main.c: 313: highlight_color = blue_highlight_color;
      000320 05 2F                  909 	mov	a, #(_highlight_color + 0)
      000322 C8 0B                  910 	mov	___memcpy_PARM_1+0, a
      000324 49 13                  911 	clear	___memcpy_PARM_1+1
      000326 5B 2F                  912 	mov	a, #<(_blue_highlight_color + 0)
      000328 CA 0B                  913 	mov	___memcpy_PARM_2+0, a
      00032A 83 2F                  914 	mov	a, #>(_blue_highlight_color + 0x8000 + 0)
      00032C CB 0B                  915 	mov	___memcpy_PARM_2+1, a
      00032E 03 2F                  916 	mov	a, #0x03
      000330 CC 0B                  917 	mov	___memcpy_PARM_3+0, a
      000332 4D 13                  918 	clear	___memcpy_PARM_3+1
      000334 E8 3A                  919 	call	___memcpy
                                    920 ;	main.c: 314: base_color = blue_base_color;
      000336 02 2F                  921 	mov	a, #(_base_color + 0)
      000338 C8 0B                  922 	mov	___memcpy_PARM_1+0, a
      00033A 49 13                  923 	clear	___memcpy_PARM_1+1
      00033C 58 2F                  924 	mov	a, #<(_blue_base_color + 0)
      00033E CA 0B                  925 	mov	___memcpy_PARM_2+0, a
      000340 83 2F                  926 	mov	a, #>(_blue_base_color + 0x8000 + 0)
      000342 CB 0B                  927 	mov	___memcpy_PARM_2+1, a
      000344 03 2F                  928 	mov	a, #0x03
      000346 CC 0B                  929 	mov	___memcpy_PARM_3+0, a
      000348 4D 13                  930 	clear	___memcpy_PARM_3+1
      00034A E8 3A                  931 	call	___memcpy
                                    932 ;	main.c: 315: step = STEP_1;
      00034C 01 2F                  933 	mov	a, #0x01
      00034E 88 0B                  934 	mov	_step+0, a
                                    935 ;	main.c: 316: state = ORANGE;
      000350 02 2F                  936 	mov	a, #0x02
      000352 89 0B                  937 	mov	_state+0, a
                                    938 ;	main.c: 317: break;
      000354 7A 00                  939 	ret
                                    940 ;	main.c: 318: case ORANGE:
      000356                        941 00104$:
                                    942 ;	main.c: 319: r_step = ORANGE_R_STEP;
      000356 0A 2F                  943 	mov	a, #0x0a
      000358 9D 0B                  944 	mov	_r_step+0, a
                                    945 ;	main.c: 320: g_step = ORANGE_G_STEP;
      00035A 04 2F                  946 	mov	a, #0x04
      00035C 9E 0B                  947 	mov	_g_step+0, a
                                    948 ;	main.c: 321: b_step = ORANGE_B_STEP;
      00035E 02 2F                  949 	mov	a, #0x02
      000360 9F 0B                  950 	mov	_b_step+0, a
                                    951 ;	main.c: 322: highlight_color = orange_highlight_color;
      000362 05 2F                  952 	mov	a, #(_highlight_color + 0)
      000364 C8 0B                  953 	mov	___memcpy_PARM_1+0, a
      000366 49 13                  954 	clear	___memcpy_PARM_1+1
      000368 55 2F                  955 	mov	a, #<(_orange_highlight_color + 0)
      00036A CA 0B                  956 	mov	___memcpy_PARM_2+0, a
      00036C 83 2F                  957 	mov	a, #>(_orange_highlight_color + 0x8000 + 0)
      00036E CB 0B                  958 	mov	___memcpy_PARM_2+1, a
      000370 03 2F                  959 	mov	a, #0x03
      000372 CC 0B                  960 	mov	___memcpy_PARM_3+0, a
      000374 4D 13                  961 	clear	___memcpy_PARM_3+1
      000376 E8 3A                  962 	call	___memcpy
                                    963 ;	main.c: 323: base_color = orange_base_color;
      000378 02 2F                  964 	mov	a, #(_base_color + 0)
      00037A C8 0B                  965 	mov	___memcpy_PARM_1+0, a
      00037C 49 13                  966 	clear	___memcpy_PARM_1+1
      00037E 52 2F                  967 	mov	a, #<(_orange_base_color + 0)
      000380 CA 0B                  968 	mov	___memcpy_PARM_2+0, a
      000382 83 2F                  969 	mov	a, #>(_orange_base_color + 0x8000 + 0)
      000384 CB 0B                  970 	mov	___memcpy_PARM_2+1, a
      000386 03 2F                  971 	mov	a, #0x03
      000388 CC 0B                  972 	mov	___memcpy_PARM_3+0, a
      00038A 4D 13                  973 	clear	___memcpy_PARM_3+1
      00038C E8 3A                  974 	call	___memcpy
                                    975 ;	main.c: 324: step = STEP_1;
      00038E 01 2F                  976 	mov	a, #0x01
      000390 88 0B                  977 	mov	_step+0, a
                                    978 ;	main.c: 325: state = OFF;
      000392 09 13                  979 	clear	_state+0
                                    980 ;	main.c: 327: }
                                    981 ;	main.c: 328: }
      000394 7A 00                  982 	ret
                                    983 ;	main.c: 330: uint8_t running_avg(uint8_t new_val)
                                    984 ;	-----------------------------------------
                                    985 ;	 function running_avg
                                    986 ;	-----------------------------------------
      000396                        987 _running_avg:
                                    988 ;	main.c: 335: filter_reg = filter_reg - (filter_reg >> 3) + new_val;
      000396 B4 0F                  989 	mov	a, _running_avg_filter_reg_10000_41+0
      000398 C9 0B                  990 	mov	_running_avg_sloc3_1_0+0, a
      00039A B5 0F                  991 	mov	a, _running_avg_filter_reg_10000_41+1
      00039C CA 0B                  992 	mov	_running_avg_sloc3_1_0+1, a
      00039E B6 0F                  993 	mov	a, _running_avg_filter_reg_10000_41+2
      0003A0 CB 0B                  994 	mov	_running_avg_sloc3_1_0+2, a
      0003A2 B7 0F                  995 	mov	a, _running_avg_filter_reg_10000_41+3
      0003A4 CC 0B                  996 	mov	_running_avg_sloc3_1_0+3, a
      0003A6 03 2F                  997 	mov	a, #3
      0003A8                        998 00103$:
      0003A8 4C 15                  999 	sr	_running_avg_sloc3_1_0+3
      0003AA 4B 16                 1000 	src	_running_avg_sloc3_1_0+2
      0003AC 4A 16                 1001 	src	_running_avg_sloc3_1_0+1
      0003AE 49 16                 1002 	src	_running_avg_sloc3_1_0+0
      0003B0 63 00                 1003 	dzsn	a
      0003B2 D4 31                 1004 	goto	00103$
      0003B4                       1005 00104$:
      0003B4 B4 0F                 1006 	mov	a, _running_avg_filter_reg_10000_41+0
      0003B6 C9 0C                 1007 	sub	a, _running_avg_sloc3_1_0+0
      0003B8 CD 0B                 1008 	mov	_running_avg_sloc4_1_0+0, a
      0003BA B5 0F                 1009 	mov	a, _running_avg_filter_reg_10000_41+1
      0003BC CA 0D                 1010 	subc	a, _running_avg_sloc3_1_0+1
      0003BE CE 0B                 1011 	mov	_running_avg_sloc4_1_0+1, a
      0003C0 B6 0F                 1012 	mov	a, _running_avg_filter_reg_10000_41+2
      0003C2 CB 0D                 1013 	subc	a, _running_avg_sloc3_1_0+2
      0003C4 CF 0B                 1014 	mov	_running_avg_sloc4_1_0+2, a
      0003C6 B7 0F                 1015 	mov	a, _running_avg_filter_reg_10000_41+3
      0003C8 CC 0D                 1016 	subc	a, _running_avg_sloc3_1_0+3
      0003CA D0 0B                 1017 	mov	_running_avg_sloc4_1_0+3, a
      0003CC CD 0F                 1018 	mov	a, _running_avg_sloc4_1_0+0
      0003CE 48 0C                 1019 	add	a, _running_avg_PARM_1+0
      0003D0 B4 0B                 1020 	mov	_running_avg_filter_reg_10000_41+0, a
      0003D2 CE 0F                 1021 	mov	a, _running_avg_sloc4_1_0+1
      0003D4 60 00                 1022 	addc	a
      0003D6 B5 0B                 1023 	mov	_running_avg_filter_reg_10000_41+1, a
      0003D8 CF 0F                 1024 	mov	a, _running_avg_sloc4_1_0+2
      0003DA 60 00                 1025 	addc	a
      0003DC B6 0B                 1026 	mov	_running_avg_filter_reg_10000_41+2, a
      0003DE D0 0F                 1027 	mov	a, _running_avg_sloc4_1_0+3
      0003E0 60 00                 1028 	addc	a
      0003E2 B7 0B                 1029 	mov	_running_avg_filter_reg_10000_41+3, a
                                   1030 ;	main.c: 337: return (uint8_t)(filter_reg >> 3);
      0003E4 B5 0F                 1031 	mov	a, _running_avg_filter_reg_10000_41+1
      0003E6 80 0B                 1032 	mov	p, a
      0003E8 B4 0F                 1033 	mov	a, _running_avg_filter_reg_10000_41+0
      0003EA 00 15                 1034 	sr	p
      0003EC 6C 00                 1035 	src	a
      0003EE 00 15                 1036 	sr	p
      0003F0 6C 00                 1037 	src	a
      0003F2 00 15                 1038 	sr	p
      0003F4 6C 00                 1039 	src	a
                                   1040 ;	main.c: 338: }
      0003F6 7A 00                 1041 	ret
                                   1042 ;	main.c: 340: void button_check(void)
                                   1043 ;	-----------------------------------------
                                   1044 ;	 function button_check
                                   1045 ;	-----------------------------------------
      0003F8                       1046 _button_check:
                                   1047 ;	main.c: 344: last_touch = running_avg(read_touch_raw());
      0003F8 BC 38                 1048 	call	_read_touch_raw
      0003FA C8 0B                 1049 	mov	_running_avg_PARM_1+0, a
      0003FC CB 39                 1050 	call	_running_avg
      0003FE A8 0B                 1051 	mov	_last_touch+0, a
      000400 29 13                 1052 	clear	_last_touch+1
                                   1053 ;	main.c: 346: if (last_touch < lo_touch)
      000402 A8 0F                 1054 	mov	a, _last_touch+0
      000404 AC 0C                 1055 	sub	a, _lo_touch+0
      000406 A9 0F                 1056 	mov	a, _last_touch+1
      000408 AD 0D                 1057 	subc	a, _lo_touch+1
      00040A 40 1A                 1058 	t1sn.io	f, c
      00040C 11 32                 1059 	goto	00107$
      00040E                       1060 00145$:
                                   1061 ;	main.c: 348: button_down = 1;
      00040E 01 2F                 1062 	mov	a, #0x01
      000410 A1 0B                 1063 	mov	_button_down+0, a
                                   1064 ;	main.c: 349: base_touch = last_touch;
      000412 A8 0F                 1065 	mov	a, _last_touch+0
      000414 A6 0B                 1066 	mov	_base_touch+0, a
      000416 A9 0F                 1067 	mov	a, _last_touch+1
      000418 A7 0B                 1068 	mov	_base_touch+1, a
                                   1069 ;	main.c: 350: calc_touch_window();
      00041A 94 38                 1070 	call	_calc_touch_window
                                   1071 ;	main.c: 351: resample_count = 0;
      00041C 2E 13                 1072 	clear	_resample_count+0
      00041E 2F 13                 1073 	clear	_resample_count+1
      000420 39 32                 1074 	goto	00108$
      000422                       1075 00107$:
                                   1076 ;	main.c: 353: else if (last_touch > hi_touch)
      000422 AA 0F                 1077 	mov	a, _hi_touch+0
      000424 A8 0C                 1078 	sub	a, _last_touch+0
      000426 AB 0F                 1079 	mov	a, _hi_touch+1
      000428 A9 0D                 1080 	subc	a, _last_touch+1
      00042A 40 1A                 1081 	t1sn.io	f, c
      00042C 21 32                 1082 	goto	00104$
      00042E                       1083 00146$:
                                   1084 ;	main.c: 355: button_down = 0;
      00042E 21 13                 1085 	clear	_button_down+0
                                   1086 ;	main.c: 356: button_handled = 0;
      000430 20 13                 1087 	clear	_button_handled+0
                                   1088 ;	main.c: 357: base_touch = last_touch;
      000432 A8 0F                 1089 	mov	a, _last_touch+0
      000434 A6 0B                 1090 	mov	_base_touch+0, a
      000436 A9 0F                 1091 	mov	a, _last_touch+1
      000438 A7 0B                 1092 	mov	_base_touch+1, a
                                   1093 ;	main.c: 358: calc_touch_window();
      00043A 94 38                 1094 	call	_calc_touch_window
                                   1095 ;	main.c: 359: resample_count = 0;
      00043C 2E 13                 1096 	clear	_resample_count+0
      00043E 2F 13                 1097 	clear	_resample_count+1
      000440 39 32                 1098 	goto	00108$
      000442                       1099 00104$:
                                   1100 ;	main.c: 363: resample_count++;
      000442 AF 0F                 1101 	mov	a, _resample_count+1
      000444 80 0B                 1102 	mov	p, a
      000446 AE 0F                 1103 	mov	a, _resample_count+0
      000448 01 28                 1104 	add	a, #0x01
      00044A AE 0B                 1105 	mov	_resample_count+0, a
      00044C 00 2F                 1106 	mov	a, #0x00
      00044E 00 0D                 1107 	addc	a, p
      000450 AF 0B                 1108 	mov	_resample_count+1, a
                                   1109 ;	main.c: 364: if (resample_count >= RESAMPLE_COUNT_10ms)
      000452 AF 0F                 1110 	mov	a, _resample_count+1
      000454 80 0B                 1111 	mov	p, a
      000456 AE 0F                 1112 	mov	a, _resample_count+0
      000458 40 29                 1113 	sub	a, #0x40
      00045A 06 2F                 1114 	mov	a, #0x06
      00045C 80 13                 1115 	xch	a, p
      00045E 80 0D                 1116 	subc	a, p
      000460 40 18                 1117 	t0sn.io	f, c
      000462 39 32                 1118 	goto	00108$
      000464                       1119 00147$:
                                   1120 ;	main.c: 366: base_touch = last_touch;
      000464 A8 0F                 1121 	mov	a, _last_touch+0
      000466 A6 0B                 1122 	mov	_base_touch+0, a
      000468 A9 0F                 1123 	mov	a, _last_touch+1
      00046A A7 0B                 1124 	mov	_base_touch+1, a
                                   1125 ;	main.c: 367: calc_touch_window();
      00046C 94 38                 1126 	call	_calc_touch_window
                                   1127 ;	main.c: 368: resample_count = 0;
      00046E 2E 13                 1128 	clear	_resample_count+0
      000470 2F 13                 1129 	clear	_resample_count+1
      000472                       1130 00108$:
                                   1131 ;	main.c: 380: if (button_down == 1 && button_handled == 0)
      000472 A1 0F                 1132 	mov	a, _button_down+0
      000474 01 2A                 1133 	ceqsn	a, #0x01
      000476 4A 32                 1134 	goto	00110$
      000478                       1135 00148$:
      000478 A0 0F                 1136 	mov	a, _button_handled+0
      00047A 00 2A                 1137 	ceqsn	a, #0x00
      00047C 4A 32                 1138 	goto	00110$
      00047E                       1139 00149$:
                                   1140 ;	main.c: 382: uart_tx_byte(TOUCH_TOKEN);
      00047E FE 2F                 1141 	mov	a, #0xfe
      000480 B0 0B                 1142 	mov	_uart_tx_byte_PARM_1+0, a
      000482 4A 38                 1143 	call	_uart_tx_byte
                                   1144 ;	main.c: 383: uart_tx_byte(last_touch);
      000484 A8 0F                 1145 	mov	a, _last_touch+0
      000486 B0 0B                 1146 	mov	_uart_tx_byte_PARM_1+0, a
      000488 4A 38                 1147 	call	_uart_tx_byte
                                   1148 ;	main.c: 384: button_handled = 1;
      00048A 01 2F                 1149 	mov	a, #0x01
      00048C A0 0B                 1150 	mov	_button_handled+0, a
                                   1151 ;	main.c: 385: handle_state_update();
      00048E 80 39                 1152 	call	_handle_state_update
                                   1153 ;	main.c: 386: state_check();
      000490 C8 30                 1154 	goto	_state_check
      000492 7A 00                 1155 	ret
      000494                       1156 00110$:
                                   1157 ;	main.c: 390: uart_tx_byte(READ_TOKEN);
      000494 FF 2F                 1158 	mov	a, #0xff
      000496 B0 0B                 1159 	mov	_uart_tx_byte_PARM_1+0, a
      000498 4A 38                 1160 	call	_uart_tx_byte
                                   1161 ;	main.c: 391: uart_tx_byte(last_touch);
      00049A A8 0F                 1162 	mov	a, _last_touch+0
      00049C B0 0B                 1163 	mov	_uart_tx_byte_PARM_1+0, a
      00049E 4A 30                 1164 	goto	_uart_tx_byte
                                   1165 ;	main.c: 425: }
      0004A0 7A 00                 1166 	ret
                                   1167 ;	main.c: 427: void handle_tick(void)
                                   1168 ;	-----------------------------------------
                                   1169 ;	 function handle_tick
                                   1170 ;	-----------------------------------------
      0004A2                       1171 _handle_tick:
                                   1172 ;	main.c: 429: button_check();
      0004A2 FC 39                 1173 	call	_button_check
                                   1174 ;	main.c: 431: if (state_update_delay_ms_cnt >= GLOBAL_TICK_ms && step != NONE)
      0004A4 A5 0F                 1175 	mov	a, _state_update_delay_ms_cnt+1
      0004A6 80 0B                 1176 	mov	p, a
      0004A8 A4 0F                 1177 	mov	a, _state_update_delay_ms_cnt+0
      0004AA 0A 29                 1178 	sub	a, #0x0a
      0004AC 80 0F                 1179 	mov	a, p
      0004AE 61 00                 1180 	subc	a
      0004B0 40 18                 1181 	t0sn.io	f, c
      0004B2 B8 32                 1182 	goto	00107$
      0004B4                       1183 00151$:
      0004B4 88 0F                 1184 	mov	a, _step+0
      0004B6 00 2B                 1185 	cneqsn	a, #0x00
      0004B8 B8 32                 1186 	goto	00107$
      0004BA                       1187 00152$:
                                   1188 ;	main.c: 433: state_update_delay_ms_cnt -= GLOBAL_TICK_ms;
      0004BA A4 0F                 1189 	mov	a, _state_update_delay_ms_cnt+0
      0004BC 0A 29                 1190 	sub	a, #0x0a
      0004BE 80 0B                 1191 	mov	p, a
      0004C0 A5 0F                 1192 	mov	a, _state_update_delay_ms_cnt+1
      0004C2 61 00                 1193 	subc	a
      0004C4 A5 0B                 1194 	mov	_state_update_delay_ms_cnt+1, a
      0004C6 80 0F                 1195 	mov	a, p
      0004C8 A4 0B                 1196 	mov	_state_update_delay_ms_cnt+0, a
                                   1197 ;	main.c: 435: if (led_update_delay_ms_cnt >= LED_UPDATE_DELAY_ms)
      0004CA A3 0F                 1198 	mov	a, _led_update_delay_ms_cnt+1
      0004CC 80 0B                 1199 	mov	p, a
      0004CE A2 0F                 1200 	mov	a, _led_update_delay_ms_cnt+0
      0004D0 32 29                 1201 	sub	a, #0x32
      0004D2 80 0F                 1202 	mov	a, p
      0004D4 61 00                 1203 	subc	a
      0004D6 40 18                 1204 	t0sn.io	f, c
      0004D8 AF 32                 1205 	goto	00105$
      0004DA                       1206 00153$:
                                   1207 ;	main.c: 437: for (uint8_t i = 0; i < LED_COUNT; i++)
      0004DA 38 13                 1208 	clear	_handle_tick_sloc5_1_0+0
      0004DC                       1209 00110$:
      0004DC B8 0F                 1210 	mov	a, _handle_tick_sloc5_1_0+0
      0004DE 04 29                 1211 	sub	a, #0x04
      0004E0 40 1A                 1212 	t1sn.io	f, c
      0004E2 AC 32                 1213 	goto	00103$
      0004E4                       1214 00154$:
                                   1215 ;	main.c: 439: if (fades[i] > 0)
      0004E4 16 2F                 1216 	mov	a, #(_fades + 0)
      0004E6 38 0C                 1217 	add	a, _handle_tick_sloc5_1_0+0
      0004E8 80 0B                 1218 	mov	p, a
      0004EA 81 03                 1219 	idxm	a, p
      0004EC 00 2B                 1220 	cneqsn	a, #0x00
      0004EE AA 32                 1221 	goto	00111$
      0004F0                       1222 00155$:
                                   1223 ;	main.c: 441: fades[i]--;
      0004F0 16 2F                 1224 	mov	a, #(_fades + 0)
      0004F2 38 0C                 1225 	add	a, _handle_tick_sloc5_1_0+0
      0004F4 80 0B                 1226 	mov	p, a
      0004F6 81 03                 1227 	idxm	a, p
      0004F8 01 29                 1228 	sub	a, #0x01
      0004FA 80 03                 1229 	idxm	p, a
                                   1230 ;	main.c: 443: pixel_buff[i].r = (pixel_buff[i].r - r_step);
      0004FC B8 0F                 1231 	mov	a, _handle_tick_sloc5_1_0+0
      0004FE 6B 00                 1232 	sl	a
      000500 38 0C                 1233 	add	a, _handle_tick_sloc5_1_0+0
      000502 B9 0B                 1234 	mov	_handle_tick_sloc6_1_0+0, a
      000504 0A 2F                 1235 	mov	a, #(_pixel_buff + 0)
      000506 39 0C                 1236 	add	a, _handle_tick_sloc6_1_0+0
      000508 01 28                 1237 	add	a, #0x01
      00050A BA 0B                 1238 	mov	_handle_tick_sloc7_1_0+0, a
      00050C 0A 2F                 1239 	mov	a, #(_pixel_buff + 0)
      00050E 39 0C                 1240 	add	a, _handle_tick_sloc6_1_0+0
      000510 01 28                 1241 	add	a, #0x01
      000512 80 0B                 1242 	mov	p, a
      000514 81 03                 1243 	idxm	a, p
      000516 9D 0C                 1244 	sub	a, _r_step+0
      000518 80 0B                 1245 	mov	p, a
      00051A BA 0F                 1246 	mov	a, _handle_tick_sloc7_1_0+0
      00051C 80 13                 1247 	xch	a, p
      00051E 80 03                 1248 	idxm	p, a
                                   1249 ;	main.c: 444: pixel_buff[i].g = (pixel_buff[i].g - g_step);
      000520 0A 2F                 1250 	mov	a, #(_pixel_buff + 0)
      000522 39 0C                 1251 	add	a, _handle_tick_sloc6_1_0+0
      000524 BB 0B                 1252 	mov	_handle_tick_sloc8_1_0+0, a
      000526 0A 2F                 1253 	mov	a, #(_pixel_buff + 0)
      000528 39 0C                 1254 	add	a, _handle_tick_sloc6_1_0+0
      00052A 80 0B                 1255 	mov	p, a
      00052C 81 03                 1256 	idxm	a, p
      00052E 9E 0C                 1257 	sub	a, _g_step+0
      000530 80 0B                 1258 	mov	p, a
      000532 BB 0F                 1259 	mov	a, _handle_tick_sloc8_1_0+0
      000534 80 13                 1260 	xch	a, p
      000536 80 03                 1261 	idxm	p, a
                                   1262 ;	main.c: 445: pixel_buff[i].b = (pixel_buff[i].b - b_step);
      000538 0A 2F                 1263 	mov	a, #(_pixel_buff + 0)
      00053A 39 0C                 1264 	add	a, _handle_tick_sloc6_1_0+0
      00053C 02 28                 1265 	add	a, #0x02
      00053E BC 0B                 1266 	mov	_handle_tick_sloc9_1_0+0, a
      000540 0A 2F                 1267 	mov	a, #(_pixel_buff + 0)
      000542 39 0C                 1268 	add	a, _handle_tick_sloc6_1_0+0
      000544 02 28                 1269 	add	a, #0x02
      000546 80 0B                 1270 	mov	p, a
      000548 81 03                 1271 	idxm	a, p
      00054A 9F 0C                 1272 	sub	a, _b_step+0
      00054C 80 0B                 1273 	mov	p, a
      00054E BC 0F                 1274 	mov	a, _handle_tick_sloc9_1_0+0
      000550 80 13                 1275 	xch	a, p
      000552 80 03                 1276 	idxm	p, a
      000554                       1277 00111$:
                                   1278 ;	main.c: 437: for (uint8_t i = 0; i < LED_COUNT; i++)
      000554 38 12                 1279 	inc	_handle_tick_sloc5_1_0+0
      000556 6E 32                 1280 	goto	00110$
      000558                       1281 00103$:
                                   1282 ;	main.c: 449: output_leds();
      000558 81 38                 1283 	call	_output_leds
                                   1284 ;	main.c: 450: led_update_delay_ms_cnt = 0;
      00055A 22 13                 1285 	clear	_led_update_delay_ms_cnt+0
      00055C 23 13                 1286 	clear	_led_update_delay_ms_cnt+1
      00055E                       1287 00105$:
                                   1288 ;	main.c: 453: led_update_delay_ms_cnt += GLOBAL_TICK_ms;
      00055E A2 0F                 1289 	mov	a, _led_update_delay_ms_cnt+0
      000560 0A 28                 1290 	add	a, #0x0a
      000562 80 0B                 1291 	mov	p, a
      000564 A3 0F                 1292 	mov	a, _led_update_delay_ms_cnt+1
      000566 60 00                 1293 	addc	a
      000568 A3 0B                 1294 	mov	_led_update_delay_ms_cnt+1, a
      00056A 80 0F                 1295 	mov	a, p
      00056C A2 0B                 1296 	mov	_led_update_delay_ms_cnt+0, a
                                   1297 ;	main.c: 455: return;
      00056E 7A 00                 1298 	ret
      000570                       1299 00107$:
                                   1300 ;	main.c: 458: state_check();
      000570 C8 30                 1301 	goto	_state_check
                                   1302 ;	main.c: 459: }
      000572 7A 00                 1303 	ret
                                   1304 ;	main.c: 461: void main(void)
                                   1305 ;	-----------------------------------------
                                   1306 ;	 function main
                                   1307 ;	-----------------------------------------
      000574                       1308 _main:
                                   1309 ;	main.c: 464: sys_clk_init();
      000574 75 38                 1310 	call	_sys_clk_init
                                   1311 ;	main.c: 465: led_init();
      000576 78 38                 1312 	call	_led_init
                                   1313 ;	main.c: 466: timer_init();
      000578 7A 38                 1314 	call	_timer_init
                                   1315 ;	main.c: 470: for (uint16_t i = 0; i < 65535; i++)
      00057A 3D 13                 1316 	clear	_main_sloc10_1_0+0
      00057C 3E 13                 1317 	clear	_main_sloc10_1_0+1
      00057E                       1318 00111$:
      00057E BD 0F                 1319 	mov	a, _main_sloc10_1_0+0
      000580 FF 29                 1320 	sub	a, #0xff
      000582 FF 2F                 1321 	mov	a, #0xff
      000584 80 0B                 1322 	mov	p, a
      000586 BE 0F                 1323 	mov	a, _main_sloc10_1_0+1
      000588 80 0D                 1324 	subc	a, p
      00058A 40 1A                 1325 	t1sn.io	f, c
      00058C CB 32                 1326 	goto	00101$
      00058E                       1327 00153$:
                                   1328 ;	main.c: 472: __asm__("nop"); // Short delay to ensure stable power before configuring pins
      00058E 00 00                 1329 	nop
                                   1330 ;	main.c: 470: for (uint16_t i = 0; i < 65535; i++)
      000590 3D 12                 1331 	inc	_main_sloc10_1_0+0
      000592 3E 10                 1332 	addc	_main_sloc10_1_0+1
      000594 BF 32                 1333 	goto	00111$
      000596                       1334 00101$:
                                   1335 ;	main.c: 474: PAC |= TX_PIN; // Set PA.0 as output
      000596 D1 1E                 1336 	set1.io	__pac, #3
                                   1337 ;	main.c: 475: PA |= TX_PIN;  // Idle High
      000598 D0 1E                 1338 	set1.io	__pa, #3
                                   1339 ;	main.c: 478: touch_init();
      00059A 6C 38                 1340 	call	_touch_init
                                   1341 ;	main.c: 480: state = BLUE;
      00059C 01 2F                 1342 	mov	a, #0x01
      00059E 89 0B                 1343 	mov	_state+0, a
                                   1344 ;	main.c: 481: step = NONE;
      0005A0 08 13                 1345 	clear	_step+0
                                   1346 ;	main.c: 482: handle_state_update();
      0005A2 80 39                 1347 	call	_handle_state_update
                                   1348 ;	main.c: 486: while (init_samples--)
      0005A4 0A 2F                 1349 	mov	a, #0x0a
      0005A6 BF 0B                 1350 	mov	_main_sloc11_1_0+0, a
      0005A8                       1351 00102$:
      0005A8 BF 0F                 1352 	mov	a, _main_sloc11_1_0+0
      0005AA BF 12                 1353 	dec	_main_sloc11_1_0+0
      0005AC 00 2B                 1354 	cneqsn	a, #0x00
      0005AE DE 32                 1355 	goto	00104$
      0005B0                       1356 00154$:
                                   1357 ;	main.c: 488: base_touch = running_avg(read_touch_raw());
      0005B0 BC 38                 1358 	call	_read_touch_raw
      0005B2 C8 0B                 1359 	mov	_running_avg_PARM_1+0, a
      0005B4 CB 39                 1360 	call	_running_avg
      0005B6 A6 0B                 1361 	mov	_base_touch+0, a
      0005B8 27 13                 1362 	clear	_base_touch+1
      0005BA D4 32                 1363 	goto	00102$
      0005BC                       1364 00104$:
                                   1365 ;	main.c: 490: calc_touch_window();
      0005BC 94 38                 1366 	call	_calc_touch_window
                                   1367 ;	main.c: 492: while (1)
      0005BE                       1368 00108$:
                                   1369 ;	main.c: 494: if (TM2CT >= GLOBAL_TICK_ms)
      0005BE DD 01                 1370 	mov.io	a, __tm2ct
      0005C0 0A 29                 1371 	sub	a, #0x0a
      0005C2 40 18                 1372 	t0sn.io	f, c
      0005C4 DF 32                 1373 	goto	00108$
      0005C6                       1374 00155$:
                                   1375 ;	main.c: 496: TM2CT = 0; // Clear the timer count
      0005C6 00 2F                 1376 	mov	a, #0x00
      0005C8 9D 01                 1377 	mov.io	__tm2ct, a
                                   1378 ;	main.c: 497: handle_tick();
      0005CA 51 3A                 1379 	call	_handle_tick
      0005CC DF 32                 1380 	goto	00108$
                                   1381 ;	main.c: 500: }
      0005CE 7A 00                 1382 	ret
                                   1383 	.area CODE
                                   1384 	.area CONST
                                   1385 	.area CONST
      0006A4                       1386 _orange_base_color:
      0006A4 08 02                 1387 	ret #0x08	; 8
      0006A6 20 02                 1388 	ret #0x20	; 32
      0006A8 00 02                 1389 	ret #0x00	; 0
                                   1390 	.area CODE
                                   1391 	.area CONST
      0006AA                       1392 _orange_highlight_color:
      0006AA 28 02                 1393 	ret #0x28	; 40
      0006AC 70 02                 1394 	ret #0x70	; 112	'p'
      0006AE 10 02                 1395 	ret #0x10	; 16
                                   1396 	.area CODE
                                   1397 	.area CONST
      0006B0                       1398 _blue_base_color:
      0006B0 00 02                 1399 	ret #0x00	; 0
      0006B2 00 02                 1400 	ret #0x00	; 0
      0006B4 40 02                 1401 	ret #0x40	; 64
                                   1402 	.area CODE
                                   1403 	.area CONST
      0006B6                       1404 _blue_highlight_color:
      0006B6 10 02                 1405 	ret #0x10	; 16
      0006B8 10 02                 1406 	ret #0x10	; 16
      0006BA 80 02                 1407 	ret #0x80	; 128
                                   1408 	.area CODE
                                   1409 	.area CONST
      0006BC                       1410 _off_color:
      0006BC 00 02                 1411 	ret #0x00	; 0
      0006BE 00 02                 1412 	ret #0x00	; 0
      0006C0 00 02                 1413 	ret #0x00	; 0
                                   1414 	.area CODE
                                   1415 	.area CABS (ABS)
