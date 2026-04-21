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
                                     16 	.globl _delay_cycles_PARM_1
                                     17 	.globl _off_color
                                     18 	.globl _blue_highlight_color
                                     19 	.globl _blue_base_color
                                     20 	.globl _orange_highlight_color
                                     21 	.globl _orange_base_color
                                     22 	.globl _main
                                     23 	.globl _handle_tick
                                     24 	.globl _button_check
                                     25 	.globl _handle_state_update
                                     26 	.globl _state_check
                                     27 	.globl _read_touch_raw
                                     28 	.globl _output_leds
                                     29 	.globl _timer_init
                                     30 	.globl _led_init
                                     31 	.globl _sys_clk_init
                                     32 	.globl _touch_init
                                     33 	.globl _uart_tx_byte
                                     34 	.globl _delay_cycles
                                     35 	.globl __t16c
                                     36 	.globl __rop
                                     37 	.globl __ilrcr
                                     38 	.globl __tm3b
                                     39 	.globl __tm3s
                                     40 	.globl __tm3ct
                                     41 	.globl __tm3c
                                     42 	.globl __lvdc
                                     43 	.globl __tkcl
                                     44 	.globl __tkch
                                     45 	.globl __tps2
                                     46 	.globl __tps
                                     47 	.globl __tke1
                                     48 	.globl __tke2
                                     49 	.globl __tcc
                                     50 	.globl __ts
                                     51 	.globl __tm2b
                                     52 	.globl __tm2s
                                     53 	.globl __tm2ct
                                     54 	.globl __tm2c
                                     55 	.globl __misclvr
                                     56 	.globl __bgtr
                                     57 	.globl __gpcs
                                     58 	.globl __gpcc
                                     59 	.globl __pbpl
                                     60 	.globl __pbph
                                     61 	.globl __pbc
                                     62 	.globl __pb
                                     63 	.globl __papl
                                     64 	.globl __paph
                                     65 	.globl __pac
                                     66 	.globl __pa
                                     67 	.globl __misc2
                                     68 	.globl __pbdier
                                     69 	.globl __padier
                                     70 	.globl __integs
                                     71 	.globl __ihrcr
                                     72 	.globl __eoscr
                                     73 	.globl __misc
                                     74 	.globl __t16m
                                     75 	.globl __intrq
                                     76 	.globl __inten
                                     77 	.globl __clkmd
                                     78 	.globl __sp
                                     79 	.globl __flag
                                     80 	.globl _resample_count
                                     81 	.globl _last_touch
                                     82 	.globl _touch_base
                                     83 	.globl _state_update_delay_ms_cnt
                                     84 	.globl _led_update_delay_ms_cnt
                                     85 	.globl _button_down
                                     86 	.globl _button_ctr
                                     87 	.globl _b_step
                                     88 	.globl _g_step
                                     89 	.globl _r_step
                                     90 	.globl _byte_ctr
                                     91 	.globl _byte_t
                                     92 	.globl _bytes
                                     93 	.globl _fades
                                     94 	.globl _pixel_buff
                                     95 	.globl _state
                                     96 	.globl _step
                                     97 	.globl _highlight_color
                                     98 	.globl _base_color
                                     99 	.globl _uart_tx_byte_PARM_1
                                    100 ;--------------------------------------------------------
                                    101 ; special function registers
                                    102 ;--------------------------------------------------------
                                    103 	.area RSEG (ABS)
      000000                        104 	.org 0x0000
                           000000   105 __flag	=	0x0000
                           000002   106 __sp	=	0x0002
                           000003   107 __clkmd	=	0x0003
                           000004   108 __inten	=	0x0004
                           000005   109 __intrq	=	0x0005
                           000006   110 __t16m	=	0x0006
                           000008   111 __misc	=	0x0008
                           00000A   112 __eoscr	=	0x000a
                           00000B   113 __ihrcr	=	0x000b
                           00000C   114 __integs	=	0x000c
                           00000D   115 __padier	=	0x000d
                           00000E   116 __pbdier	=	0x000e
                           00000F   117 __misc2	=	0x000f
                           000010   118 __pa	=	0x0010
                           000011   119 __pac	=	0x0011
                           000012   120 __paph	=	0x0012
                           000013   121 __papl	=	0x0013
                           000014   122 __pb	=	0x0014
                           000015   123 __pbc	=	0x0015
                           000016   124 __pbph	=	0x0016
                           000017   125 __pbpl	=	0x0017
                           000018   126 __gpcc	=	0x0018
                           000019   127 __gpcs	=	0x0019
                           00001A   128 __bgtr	=	0x001a
                           00001B   129 __misclvr	=	0x001b
                           00001C   130 __tm2c	=	0x001c
                           00001D   131 __tm2ct	=	0x001d
                           00001E   132 __tm2s	=	0x001e
                           00001F   133 __tm2b	=	0x001f
                           000020   134 __ts	=	0x0020
                           000021   135 __tcc	=	0x0021
                           000022   136 __tke2	=	0x0022
                           000024   137 __tke1	=	0x0024
                           000026   138 __tps	=	0x0026
                           000028   139 __tps2	=	0x0028
                           00002B   140 __tkch	=	0x002b
                           00002C   141 __tkcl	=	0x002c
                           00002D   142 __lvdc	=	0x002d
                           000032   143 __tm3c	=	0x0032
                           000033   144 __tm3ct	=	0x0033
                           000034   145 __tm3s	=	0x0034
                           000035   146 __tm3b	=	0x0035
                           000039   147 __ilrcr	=	0x0039
                           00003A   148 __rop	=	0x003a
      000000                        149 __t16c::
      000000                        150 	.ds 2
                                    151 ;--------------------------------------------------------
                                    152 ; ram data
                                    153 ;--------------------------------------------------------
                                    154 	.area DATA
      000002                        155 _uart_tx_byte_PARM_1:
      000002                        156 	.ds 2
      000004                        157 _uart_tx_byte_sloc1_1_0:
      000004                        158 	.ds 1
      000005                        159 _base_color::
      000005                        160 	.ds 3
      000008                        161 _highlight_color::
      000008                        162 	.ds 3
      00000B                        163 _step::
      00000B                        164 	.ds 1
      00000C                        165 _state::
      00000C                        166 	.ds 1
      00000D                        167 _pixel_buff::
      00000D                        168 	.ds 12
      000019                        169 _fades::
      000019                        170 	.ds 4
      00001D                        171 _bytes::
      00001D                        172 	.ds 1
      00001E                        173 _byte_t::
      00001E                        174 	.ds 1
      00001F                        175 _byte_ctr::
      00001F                        176 	.ds 1
      000020                        177 _r_step::
      000020                        178 	.ds 1
      000021                        179 _g_step::
      000021                        180 	.ds 1
      000022                        181 _b_step::
      000022                        182 	.ds 1
      000023                        183 _button_ctr::
      000023                        184 	.ds 1
      000024                        185 _button_down::
      000024                        186 	.ds 1
      000025                        187 _led_update_delay_ms_cnt::
      000025                        188 	.ds 2
      000027                        189 _state_update_delay_ms_cnt::
      000027                        190 	.ds 2
      000029                        191 _touch_base::
      000029                        192 	.ds 2
      00002B                        193 _last_touch::
      00002B                        194 	.ds 2
      00002D                        195 _resample_count::
      00002D                        196 	.ds 2
      00002F                        197 _button_check_sloc2_1_0:
      00002F                        198 	.ds 2
      000031                        199 _handle_tick_sloc3_1_0:
      000031                        200 	.ds 1
      000032                        201 _handle_tick_sloc4_1_0:
      000032                        202 	.ds 1
      000033                        203 _handle_tick_sloc5_1_0:
      000033                        204 	.ds 1
      000034                        205 _handle_tick_sloc6_1_0:
      000034                        206 	.ds 1
      000035                        207 _handle_tick_sloc7_1_0:
      000035                        208 	.ds 1
      000036                        209 _main_sloc8_1_0:
      000036                        210 	.ds 2
                                    211 ;--------------------------------------------------------
                                    212 ; overlayable items in ram
                                    213 ;--------------------------------------------------------
                                    214 	.area	OSEG (OVR,DATA)
      000038                        215 _delay_cycles_PARM_1:
      000038                        216 	.ds 2
      00003A                        217 _delay_cycles_sloc0_1_0:
      00003A                        218 	.ds 2
                                    219 ;--------------------------------------------------------
                                    220 ; Stack segment in internal ram
                                    221 ;--------------------------------------------------------
                                    222 	.area SSEG
      000046                        223 __start__stack:
      000046                        224 	.ds	1
                                    225 
                                    226 ;--------------------------------------------------------
                                    227 ; absolute external ram data
                                    228 ;--------------------------------------------------------
                                    229 	.area DABS (ABS)
                                    230 ;--------------------------------------------------------
                                    231 ; interrupt vector
                                    232 ;--------------------------------------------------------
                                    233 	.area HOME
      000022                        234 __interrupt_vect:
                                    235 	.area	HEADER (ABS)
      000020                        236 	.org	 0x0020
      000020 7B 00                  237 	reti
                                    238 ;--------------------------------------------------------
                                    239 ; global & static initialisations
                                    240 ;--------------------------------------------------------
                                    241 	.area HOME
                                    242 	.area GSINIT
                                    243 	.area GSFINAL
                                    244 	.area GSINIT
                                    245 	.area	PREG (ABS)
      000000                        246 	.org 0x00
      000000                        247 p::
      000000                        248 	.ds 2
                                    249 	.area	HEADER (ABS)
      000000                        250 	.org 0x0000
      000000 00 00                  251 	nop
      000002 01 13                  252 	clear	p+1
      000004 38 2F                  253 	mov	a, #s_OSEG
      000006 0F 28                  254 	add	a, #l_OSEG + 1
      000008 FE 2C                  255 	and	a, #0xfe
      00000A 82 01                  256 	mov.io	sp, a
      00000C 6B 3A                  257 	call	___sdcc_external_startup
      00000E 00 2B                  258 	cneqsn	a, #0x00
      000010 12 30                  259 	goto	__sdcc_init_data
      000012 11 30                  260 	goto	__sdcc_program_startup
                                    261 	.area GSINIT
      000024                        262 __sdcc_init_data:
      000024 02 2F                  263 	mov	a, #s_DATA
      000026 80 0B                  264 	mov	p, a
      000028 19 30                  265 	goto	00002$
      00002A                        266 00001$:
      00002A 00 2F                  267 	mov	a, #0x00
      00002C 80 03                  268 	idxm	p, a
      00002E 00 12                  269 	inc	p
      000030 02 2F                  270 	mov	a, #s_DATA
      000032                        271 00002$:
      000032 36 28                  272 	add	a, #l_DATA
      000034 00 17                  273 	ceqsn	a, p
      000036 15 30                  274 	goto	00001$
                                    275 ;	main.c: 124: volatile Steps step = STEP_1;
      000038 01 2F                  276 	mov	a, #0x01
      00003A 8B 0B                  277 	mov	_step+0, a
                                    278 ;	main.c: 125: volatile Patterns state = OFF;
      00003C 0C 13                  279 	clear	_state+0
                                    280 ;	main.c: 131: volatile uint8_t bytes = LED_COUNT * 3;
      00003E 0C 2F                  281 	mov	a, #0x0c
      000040 9D 0B                  282 	mov	_bytes+0, a
                                    283 ;	main.c: 132: volatile uint8_t byte_t = 0;
      000042 1E 13                  284 	clear	_byte_t+0
                                    285 ;	main.c: 133: volatile uint8_t byte_ctr = 0;
      000044 1F 13                  286 	clear	_byte_ctr+0
                                    287 ;	main.c: 136: volatile uint8_t r_step = 0;
      000046 20 13                  288 	clear	_r_step+0
                                    289 ;	main.c: 137: volatile uint8_t g_step = 0;
      000048 21 13                  290 	clear	_g_step+0
                                    291 ;	main.c: 138: volatile uint8_t b_step = 0;
      00004A 22 13                  292 	clear	_b_step+0
                                    293 ;	main.c: 140: volatile uint8_t button_ctr = 0;
      00004C 23 13                  294 	clear	_button_ctr+0
                                    295 ;	main.c: 141: volatile uint8_t button_down = 0;
      00004E 24 13                  296 	clear	_button_down+0
                                    297 ;	main.c: 143: volatile uint16_t led_update_delay_ms_cnt = 0;
      000050 25 13                  298 	clear	_led_update_delay_ms_cnt+0
      000052 26 13                  299 	clear	_led_update_delay_ms_cnt+1
                                    300 ;	main.c: 144: volatile uint16_t state_update_delay_ms_cnt = 0;
      000054 27 13                  301 	clear	_state_update_delay_ms_cnt+0
      000056 28 13                  302 	clear	_state_update_delay_ms_cnt+1
                                    303 ;	main.c: 146: volatile uint16_t touch_base = 0;
      000058 29 13                  304 	clear	_touch_base+0
      00005A 2A 13                  305 	clear	_touch_base+1
                                    306 ;	main.c: 147: volatile uint16_t last_touch = 0;
      00005C 2B 13                  307 	clear	_last_touch+0
      00005E 2C 13                  308 	clear	_last_touch+1
                                    309 ;	main.c: 148: volatile uint16_t resample_count = 0;
      000060 2D 13                  310 	clear	_resample_count+0
      000062 2E 13                  311 	clear	_resample_count+1
                                    312 	.area GSFINAL
      000064 11 30                  313 	goto	__sdcc_program_startup
                                    314 ;--------------------------------------------------------
                                    315 ; Home
                                    316 ;--------------------------------------------------------
                                    317 	.area HOME
                                    318 	.area HOME
      000022                        319 __sdcc_program_startup:
      000022 1D 32                  320 	goto	_main
                                    321 ;	return from main will return to caller
                                    322 ;--------------------------------------------------------
                                    323 ; code
                                    324 ;--------------------------------------------------------
                                    325 	.area CODE
                                    326 ;	main.c: 53: void delay_cycles(uint16_t cycles)
                                    327 ;	-----------------------------------------
                                    328 ;	 function delay_cycles
                                    329 ;	-----------------------------------------
      000066                        330 _delay_cycles:
                                    331 ;	main.c: 55: while (cycles--)
      000066 B8 0F                  332 	mov	a, _delay_cycles_PARM_1+0
      000068 BA 0B                  333 	mov	_delay_cycles_sloc0_1_0+0, a
      00006A B9 0F                  334 	mov	a, _delay_cycles_PARM_1+1
      00006C BB 0B                  335 	mov	_delay_cycles_sloc0_1_0+1, a
      00006E                        336 00101$:
      00006E BB 0F                  337 	mov	a, _delay_cycles_sloc0_1_0+1
      000070 80 0B                  338 	mov	p, a
      000072 BA 0F                  339 	mov	a, _delay_cycles_sloc0_1_0+0
      000074 BA 12                  340 	dec	_delay_cycles_sloc0_1_0+0
      000076 BB 10                  341 	subc	_delay_cycles_sloc0_1_0+1
      000078 80 0E                  342 	or	a, p
      00007A 00 2B                  343 	cneqsn	a, #0x00
      00007C 7A 00                  344 	ret
      00007E                        345 00119$:
                                    346 ;	main.c: 57: __asm__("nop"); // Adjust based on compiler cycle counts
      00007E 00 00                  347 	nop
      000080 37 30                  348 	goto	00101$
                                    349 ;	main.c: 59: }
      000082 7A 00                  350 	ret
                                    351 ;	main.c: 61: void uart_tx_byte(uint16_t data)
                                    352 ;	-----------------------------------------
                                    353 ;	 function uart_tx_byte
                                    354 ;	-----------------------------------------
      000084                        355 _uart_tx_byte:
                                    356 ;	main.c: 64: PA &= ~TX_PIN;
      000084 D0 1C                  357 	set0.io	__pa, #3
                                    358 ;	main.c: 65: delay_cycles(BIT_PERIOD);
      000086 3E 2F                  359 	mov	a, #0x3e
      000088 B8 0B                  360 	mov	_delay_cycles_PARM_1+0, a
      00008A 39 13                  361 	clear	_delay_cycles_PARM_1+1
      00008C 33 38                  362 	call	_delay_cycles
                                    363 ;	main.c: 68: for (uint8_t i = 0; i < 16; i++)
      00008E 04 13                  364 	clear	_uart_tx_byte_sloc1_1_0+0
      000090                        365 00106$:
      000090 84 0F                  366 	mov	a, _uart_tx_byte_sloc1_1_0+0
      000092 10 29                  367 	sub	a, #0x10
      000094 40 1A                  368 	t1sn.io	f, c
      000096 5C 30                  369 	goto	00104$
      000098                        370 00129$:
                                    371 ;	main.c: 70: if (data & 0x01)
      000098 82 0F                  372 	mov	a, _uart_tx_byte_PARM_1+0
      00009A 80 0B                  373 	mov	p, a
      00009C 83 0F                  374 	mov	a, _uart_tx_byte_PARM_1+1
      00009E 00 22                  375 	t1sn	p, #0
      0000A0 53 30                  376 	goto	00102$
      0000A2                        377 00130$:
                                    378 ;	main.c: 72: PA |= TX_PIN;
      0000A2 D0 1E                  379 	set1.io	__pa, #3
      0000A4 54 30                  380 	goto	00103$
      0000A6                        381 00102$:
                                    382 ;	main.c: 76: PA &= ~TX_PIN;
      0000A6 D0 1C                  383 	set0.io	__pa, #3
      0000A8                        384 00103$:
                                    385 ;	main.c: 78: data >>= 1;
      0000A8 03 15                  386 	sr	_uart_tx_byte_PARM_1+1
      0000AA 02 16                  387 	src	_uart_tx_byte_PARM_1+0
                                    388 ;	main.c: 79: delay_cycles(BIT_PERIOD);
      0000AC 3E 2F                  389 	mov	a, #0x3e
      0000AE B8 0B                  390 	mov	_delay_cycles_PARM_1+0, a
      0000B0 39 13                  391 	clear	_delay_cycles_PARM_1+1
      0000B2 33 38                  392 	call	_delay_cycles
                                    393 ;	main.c: 68: for (uint8_t i = 0; i < 16; i++)
      0000B4 04 12                  394 	inc	_uart_tx_byte_sloc1_1_0+0
      0000B6 48 30                  395 	goto	00106$
      0000B8                        396 00104$:
                                    397 ;	main.c: 83: PA |= TX_PIN;
      0000B8 D0 1E                  398 	set1.io	__pa, #3
                                    399 ;	main.c: 84: delay_cycles(BIT_PERIOD);
      0000BA 3E 2F                  400 	mov	a, #0x3e
      0000BC B8 0B                  401 	mov	_delay_cycles_PARM_1+0, a
      0000BE 39 13                  402 	clear	_delay_cycles_PARM_1+1
      0000C0 33 30                  403 	goto	_delay_cycles
                                    404 ;	main.c: 85: }
      0000C2 7A 00                  405 	ret
                                    406 ;	main.c: 150: void touch_init()
                                    407 ;	-----------------------------------------
                                    408 ;	 function touch_init
                                    409 ;	-----------------------------------------
      0000C4                        410 _touch_init:
                                    411 ;	main.c: 153: TS = TS_TP_CLK_IHRC_DIV2 | TS_TP_VREF_VCC05 | TS_DISCHARGE_WAIT_128CLOCKS;
      0000C4 13 2F                  412 	mov	a, #0x13
      0000C6 A0 01                  413 	mov.io	__ts, a
                                    414 ;	main.c: 154: TPS2 = TPS2_TOUCH_TYPE_B | TPS2_VREFNONFLOAT_ALWAYS_ON;
      0000C8 41 2F                  415 	mov	a, #0x41
      0000CA A8 01                  416 	mov.io	__tps2, a
                                    417 ;	main.c: 155: PAC &= ~(BTN_bm);            // Pin 4 as in
      0000CC 11 1D                  418 	set0.io	__pac, #4
                                    419 ;	main.c: 156: PADIER &= ~(BTN_bm | CS_bm); // Disable digital input for touch and CS pins
      0000CE CD 01                  420 	mov.io	a, __padier
      0000D0 6F 2C                  421 	and	a, #0x6f
      0000D2 8D 01                  422 	mov.io	__padier, a
                                    423 ;	main.c: 157: }
      0000D4 7A 00                  424 	ret
                                    425 ;	main.c: 159: void sys_clk_init()
                                    426 ;	-----------------------------------------
                                    427 ;	 function sys_clk_init
                                    428 ;	-----------------------------------------
      0000D6                        429 _sys_clk_init:
                                    430 ;	main.c: 162: CLKMD = CLKMD_ENABLE_IHRC | CLKMD_IHRC_DIV2 | CLKMD_ENABLE_ILRC; // First enable IHRC
      0000D6 34 2F                  431 	mov	a, #0x34
      0000D8 83 01                  432 	mov.io	__clkmd, a
                                    433 ;	main.c: 163: }
      0000DA 7A 00                  434 	ret
                                    435 ;	main.c: 165: void led_init()
                                    436 ;	-----------------------------------------
                                    437 ;	 function led_init
                                    438 ;	-----------------------------------------
      0000DC                        439 _led_init:
                                    440 ;	main.c: 168: PAC |= LED_bm;
      0000DC 51 1F                  441 	set1.io	__pac, #5
                                    442 ;	main.c: 169: }
      0000DE 7A 00                  443 	ret
                                    444 ;	main.c: 171: void timer_init()
                                    445 ;	-----------------------------------------
                                    446 ;	 function timer_init
                                    447 ;	-----------------------------------------
      0000E0                        448 _timer_init:
                                    449 ;	main.c: 173: TM2B = 0xFF; // Max bound for 8-bit timer
      0000E0 FF 2F                  450 	mov	a, #0xff
      0000E2 9F 01                  451 	mov.io	__tm2b, a
                                    452 ;	main.c: 174: TM2C = TM2C_CLK_ILRC | TM2C_OUT_DISABLE | TM2C_MODE_PERIOD;
      0000E4 40 2F                  453 	mov	a, #0x40
      0000E6 9C 01                  454 	mov.io	__tm2c, a
                                    455 ;	main.c: 175: TM2S = TM2S_PRESCALE_DIV64; // Should be 1ms, and start
      0000E8 60 2F                  456 	mov	a, #0x60
      0000EA 9E 01                  457 	mov.io	__tm2s, a
                                    458 ;	main.c: 176: }
      0000EC 7A 00                  459 	ret
                                    460 ;	main.c: 178: void output_leds()
                                    461 ;	-----------------------------------------
                                    462 ;	 function output_leds
                                    463 ;	-----------------------------------------
      0000EE                        464 _output_leds:
                                    465 ;	main.c: 180: __asm__("    mov a, _bytes              ;move our byte count into a");
      0000EE 9D 0F                  466 	mov	a, _bytes              ;move our byte count into a
                                    467 ;	main.c: 181: __asm__("    mov _byte_ctr, a           ;move a into our index counter");
      0000F0 9F 0B                  468 	mov	_byte_ctr, a           ;move a into our index counter
                                    469 ;	main.c: 182: __asm__("    mov	a, #(_pixel_buff)   ;load the address of the array into a");
      0000F2 0D 2F                  470 	mov	a, #(_pixel_buff)   ;load the address of the array into a
                                    471 ;	main.c: 183: __asm__("    mov	p, a                ;put that address into p (a mem location)");
      0000F4 80 0B                  472 	mov	p, a                ;put that address into p (a mem location)
                                    473 ;	main.c: 184: __asm__("00010$:");
      0000F6                        474 	00010$:
                                    475 ;	main.c: 185: __asm__("    idxm	a, p                ;load the byte data from the array into a");
      0000F6 81 03                  476 	idxm	a, p                ;load the byte data from the array into a
                                    477 ;	main.c: 186: __asm__("    inc p                      ;inc p to the next address");
      0000F8 00 12                  478 	inc	p                      ;inc p to the next address
                                    479 ;	main.c: 187: __asm__("    mov	_byte_t, a          ;load the byte data into byte_t");
      0000FA 9E 0B                  480 	mov	_byte_t, a          ;load the byte data into byte_t
                                    481 ;	main.c: 188: __asm__("    mov a, #0x08               ;reset the bit count");
      0000FC 08 2F                  482 	mov	a, #0x08               ;reset the bit count
                                    483 ;	main.c: 189: __asm__("00011$:");
      0000FE                        484 	00011$:
                                    485 ;	main.c: 190: __asm__("    ;output bit");
                                    486 ;output	bit
                                    487 ;	main.c: 191: __asm__("    set1.io __pa, #5           ;set the output pin high");
      0000FE 50 1F                  488 	set1.io	__pa, #5           ;set the output pin high
                                    489 ;	main.c: 192: __asm__("    t1sn _byte_t, #7           ;if the current MSB is 1, skip setting the pin low now");
      000100 DE 23                  490 	t1sn	_byte_t, #7           ;if the current MSB is 1, skip setting the pin low now
                                    491 ;	main.c: 193: __asm__("    set0.io __pa, #5           ;set the output pin low");
      000102 50 1D                  492 	set0.io	__pa, #5           ;set the output pin low
                                    493 ;	main.c: 194: __asm__("    nop                        ;wait one cycle");
      000104 00 00                  494 	nop	                       ;wait one cycle
                                    495 ;	main.c: 195: __asm__("    set0.io __pa, #5           ;set the output pin low");
      000106 50 1D                  496 	set0.io	__pa, #5           ;set the output pin low
                                    497 ;	main.c: 196: __asm__("    sl _byte_t                 ;left-shift the data byte (the LEDs are MSB first)");
      000108 9E 15                  498 	sl	_byte_t                 ;left-shift the data byte (the LEDs are MSB first)
                                    499 ;	main.c: 197: __asm__("    dzsn a                     ;dec a and skip next instruction if 0");
      00010A 63 00                  500 	dzsn	a                     ;dec a and skip next instruction if 0
                                    501 ;	main.c: 198: __asm__("    goto 00011$                ;jump back to 00011");
      00010C 7F 30                  502 	goto	00011$                ;jump back to 00011
                                    503 ;	main.c: 199: __asm__("    dzsn _byte_ctr             ;dec our index counter and skip the goto if 0");
      00010E 9F 11                  504 	dzsn	_byte_ctr             ;dec our index counter and skip the goto if 0
                                    505 ;	main.c: 200: __asm__("    goto	00010$              ;goto the next byte");
      000110 7B 30                  506 	goto	00010$              ;goto the next byte
                                    507 ;	main.c: 201: }
      000112 7A 00                  508 	ret
                                    509 ;	main.c: 203: uint16_t read_touch_raw()
                                    510 ;	-----------------------------------------
                                    511 ;	 function read_touch_raw
                                    512 ;	-----------------------------------------
      000114                        513 _read_touch_raw:
                                    514 ;	main.c: 206: TKE1 = TKE1_TK6_PA4; // Use PA4 as touch input
      000114 40 2F                  515 	mov	a, #0x40
      000116 A4 01                  516 	mov.io	__tke1, a
                                    517 ;	main.c: 207: TKE2 = 0;            // Disable other channels
      000118 00 2F                  518 	mov	a, #0x00
      00011A A2 01                  519 	mov.io	__tke2, a
                                    520 ;	main.c: 208: TCC = TCC_TK_RUN;
      00011C 10 2F                  521 	mov	a, #0x10
      00011E A1 01                  522 	mov.io	__tcc, a
                                    523 ;	main.c: 210: while (TCC & TCC_TK_RUN)
      000120                        524 00101$:
      000120 21 19                  525 	t0sn.io	__tcc, #4
      000122 90 30                  526 	goto	00101$
      000124                        527 00118$:
                                    528 ;	main.c: 213: return (TKCH << 8) | TKCL;
      000124 EB 01                  529 	mov.io	a, __tkch
      000126 80 0B                  530 	mov	p, a
      000128 EC 01                  531 	mov.io	a, __tkcl
                                    532 ;	main.c: 214: }
      00012A 7A 00                  533 	ret
                                    534 ;	main.c: 216: void state_check()
                                    535 ;	-----------------------------------------
                                    536 ;	 function state_check
                                    537 ;	-----------------------------------------
      00012C                        538 _state_check:
                                    539 ;	main.c: 219: switch (step)
      00012C 8B 0F                  540 	mov	a, _step+0
      00012E 08 2A                  541 	ceqsn	a, #0x08
      000130 40 1A                  542 	t1sn.io	f, c
      000132                        543 00119$:
      000132 20 31                  544 	goto	00109$
      000134                        545 00120$:
      000134 01 28                  546 	add	a, #0x01
      000136 67 00                  547 	pcadd	a
      000138 20 31                  548 	goto	#00109$
      00013A A4 30                  549 	goto	#00101$
      00013C D7 30                  550 	goto	#00102$
      00013E DD 30                  551 	goto	#00103$
      000140 EF 30                  552 	goto	#00104$
      000142 01 31                  553 	goto	#00105$
      000144 07 31                  554 	goto	#00106$
      000146 19 31                  555 	goto	#00107$
                                    556 ;	main.c: 221: case STEP_1:
      000148                        557 00101$:
                                    558 ;	main.c: 222: pixel_buff[3] = highlight_color;
      000148 16 2F                  559 	mov	a, #(_pixel_buff + 9)
      00014A B8 0B                  560 	mov	___memcpy_PARM_1+0, a
      00014C 39 13                  561 	clear	___memcpy_PARM_1+1
      00014E 08 2F                  562 	mov	a, #(_highlight_color + 0)
      000150 BA 0B                  563 	mov	___memcpy_PARM_2+0, a
      000152 3B 13                  564 	clear	___memcpy_PARM_2+1
      000154 03 2F                  565 	mov	a, #0x03
      000156 BC 0B                  566 	mov	___memcpy_PARM_3+0, a
      000158 3D 13                  567 	clear	___memcpy_PARM_3+1
      00015A 42 3A                  568 	call	___memcpy
                                    569 ;	main.c: 223: pixel_buff[2] = base_color;
      00015C 13 2F                  570 	mov	a, #(_pixel_buff + 6)
      00015E B8 0B                  571 	mov	___memcpy_PARM_1+0, a
      000160 39 13                  572 	clear	___memcpy_PARM_1+1
      000162 05 2F                  573 	mov	a, #(_base_color + 0)
      000164 BA 0B                  574 	mov	___memcpy_PARM_2+0, a
      000166 3B 13                  575 	clear	___memcpy_PARM_2+1
      000168 03 2F                  576 	mov	a, #0x03
      00016A BC 0B                  577 	mov	___memcpy_PARM_3+0, a
      00016C 3D 13                  578 	clear	___memcpy_PARM_3+1
      00016E 42 3A                  579 	call	___memcpy
                                    580 ;	main.c: 224: pixel_buff[1] = base_color;
      000170 10 2F                  581 	mov	a, #(_pixel_buff + 3)
      000172 B8 0B                  582 	mov	___memcpy_PARM_1+0, a
      000174 39 13                  583 	clear	___memcpy_PARM_1+1
      000176 05 2F                  584 	mov	a, #(_base_color + 0)
      000178 BA 0B                  585 	mov	___memcpy_PARM_2+0, a
      00017A 3B 13                  586 	clear	___memcpy_PARM_2+1
      00017C 03 2F                  587 	mov	a, #0x03
      00017E BC 0B                  588 	mov	___memcpy_PARM_3+0, a
      000180 3D 13                  589 	clear	___memcpy_PARM_3+1
      000182 42 3A                  590 	call	___memcpy
                                    591 ;	main.c: 225: pixel_buff[0] = base_color;
      000184 0D 2F                  592 	mov	a, #(_pixel_buff + 0)
      000186 B8 0B                  593 	mov	___memcpy_PARM_1+0, a
      000188 39 13                  594 	clear	___memcpy_PARM_1+1
      00018A 05 2F                  595 	mov	a, #(_base_color + 0)
      00018C BA 0B                  596 	mov	___memcpy_PARM_2+0, a
      00018E 3B 13                  597 	clear	___memcpy_PARM_2+1
      000190 03 2F                  598 	mov	a, #0x03
      000192 BC 0B                  599 	mov	___memcpy_PARM_3+0, a
      000194 3D 13                  600 	clear	___memcpy_PARM_3+1
      000196 42 3A                  601 	call	___memcpy
                                    602 ;	main.c: 226: fades[3] = FADE_STEPS;
      000198 08 2F                  603 	mov	a, #0x08
      00019A 9C 0B                  604 	mov	_fades+3, a
                                    605 ;	main.c: 227: fades[2] = 0;
      00019C 1B 13                  606 	clear	_fades+2
                                    607 ;	main.c: 228: fades[1] = 0;
      00019E 1A 13                  608 	clear	_fades+1
                                    609 ;	main.c: 229: fades[0] = 0;
      0001A0 19 13                  610 	clear	_fades+0
                                    611 ;	main.c: 230: state_update_delay_ms_cnt = STATE_1_DELAY_ms;
      0001A2 C8 2F                  612 	mov	a, #0xc8
      0001A4 A7 0B                  613 	mov	_state_update_delay_ms_cnt+0, a
      0001A6 28 13                  614 	clear	_state_update_delay_ms_cnt+1
                                    615 ;	main.c: 231: step = STEP_2;
      0001A8 02 2F                  616 	mov	a, #0x02
      0001AA 8B 0B                  617 	mov	_step+0, a
                                    618 ;	main.c: 232: break;
      0001AC 7A 00                  619 	ret
                                    620 ;	main.c: 234: case STEP_2:
      0001AE                        621 00102$:
                                    622 ;	main.c: 235: state_update_delay_ms_cnt = STATE_2_DELAY_ms;
      0001AE 64 2F                  623 	mov	a, #0x64
      0001B0 A7 0B                  624 	mov	_state_update_delay_ms_cnt+0, a
      0001B2 28 13                  625 	clear	_state_update_delay_ms_cnt+1
                                    626 ;	main.c: 236: step = STEP_3;
      0001B4 03 2F                  627 	mov	a, #0x03
      0001B6 8B 0B                  628 	mov	_step+0, a
                                    629 ;	main.c: 237: break;
      0001B8 7A 00                  630 	ret
                                    631 ;	main.c: 238: case STEP_3:
      0001BA                        632 00103$:
                                    633 ;	main.c: 239: pixel_buff[2] = highlight_color;
      0001BA 13 2F                  634 	mov	a, #(_pixel_buff + 6)
      0001BC B8 0B                  635 	mov	___memcpy_PARM_1+0, a
      0001BE 39 13                  636 	clear	___memcpy_PARM_1+1
      0001C0 08 2F                  637 	mov	a, #(_highlight_color + 0)
      0001C2 BA 0B                  638 	mov	___memcpy_PARM_2+0, a
      0001C4 3B 13                  639 	clear	___memcpy_PARM_2+1
      0001C6 03 2F                  640 	mov	a, #0x03
      0001C8 BC 0B                  641 	mov	___memcpy_PARM_3+0, a
      0001CA 3D 13                  642 	clear	___memcpy_PARM_3+1
      0001CC 42 3A                  643 	call	___memcpy
                                    644 ;	main.c: 240: fades[2] = FADE_STEPS;
      0001CE 08 2F                  645 	mov	a, #0x08
      0001D0 9B 0B                  646 	mov	_fades+2, a
                                    647 ;	main.c: 241: state_update_delay_ms_cnt = STATE_3_DELAY_ms;
      0001D2 64 2F                  648 	mov	a, #0x64
      0001D4 A7 0B                  649 	mov	_state_update_delay_ms_cnt+0, a
      0001D6 28 13                  650 	clear	_state_update_delay_ms_cnt+1
                                    651 ;	main.c: 242: step = STEP_4;
      0001D8 04 2F                  652 	mov	a, #0x04
      0001DA 8B 0B                  653 	mov	_step+0, a
                                    654 ;	main.c: 243: break;
      0001DC 7A 00                  655 	ret
                                    656 ;	main.c: 244: case STEP_4:
      0001DE                        657 00104$:
                                    658 ;	main.c: 245: pixel_buff[1] = highlight_color;
      0001DE 10 2F                  659 	mov	a, #(_pixel_buff + 3)
      0001E0 B8 0B                  660 	mov	___memcpy_PARM_1+0, a
      0001E2 39 13                  661 	clear	___memcpy_PARM_1+1
      0001E4 08 2F                  662 	mov	a, #(_highlight_color + 0)
      0001E6 BA 0B                  663 	mov	___memcpy_PARM_2+0, a
      0001E8 3B 13                  664 	clear	___memcpy_PARM_2+1
      0001EA 03 2F                  665 	mov	a, #0x03
      0001EC BC 0B                  666 	mov	___memcpy_PARM_3+0, a
      0001EE 3D 13                  667 	clear	___memcpy_PARM_3+1
      0001F0 42 3A                  668 	call	___memcpy
                                    669 ;	main.c: 246: fades[1] = FADE_STEPS;
      0001F2 08 2F                  670 	mov	a, #0x08
      0001F4 9A 0B                  671 	mov	_fades+1, a
                                    672 ;	main.c: 247: state_update_delay_ms_cnt = STATE_4_DELAY_ms;
      0001F6 C8 2F                  673 	mov	a, #0xc8
      0001F8 A7 0B                  674 	mov	_state_update_delay_ms_cnt+0, a
      0001FA 28 13                  675 	clear	_state_update_delay_ms_cnt+1
                                    676 ;	main.c: 248: step = STEP_5;
      0001FC 05 2F                  677 	mov	a, #0x05
      0001FE 8B 0B                  678 	mov	_step+0, a
                                    679 ;	main.c: 249: break;
      000200 7A 00                  680 	ret
                                    681 ;	main.c: 250: case STEP_5:
      000202                        682 00105$:
                                    683 ;	main.c: 251: state_update_delay_ms_cnt = STATE_5_DELAY_ms;
      000202 C8 2F                  684 	mov	a, #0xc8
      000204 A7 0B                  685 	mov	_state_update_delay_ms_cnt+0, a
      000206 28 13                  686 	clear	_state_update_delay_ms_cnt+1
                                    687 ;	main.c: 252: step = STEP_6;
      000208 06 2F                  688 	mov	a, #0x06
      00020A 8B 0B                  689 	mov	_step+0, a
                                    690 ;	main.c: 253: break;
      00020C 7A 00                  691 	ret
                                    692 ;	main.c: 254: case STEP_6:
      00020E                        693 00106$:
                                    694 ;	main.c: 255: pixel_buff[0] = highlight_color;
      00020E 0D 2F                  695 	mov	a, #(_pixel_buff + 0)
      000210 B8 0B                  696 	mov	___memcpy_PARM_1+0, a
      000212 39 13                  697 	clear	___memcpy_PARM_1+1
      000214 08 2F                  698 	mov	a, #(_highlight_color + 0)
      000216 BA 0B                  699 	mov	___memcpy_PARM_2+0, a
      000218 3B 13                  700 	clear	___memcpy_PARM_2+1
      00021A 03 2F                  701 	mov	a, #0x03
      00021C BC 0B                  702 	mov	___memcpy_PARM_3+0, a
      00021E 3D 13                  703 	clear	___memcpy_PARM_3+1
      000220 42 3A                  704 	call	___memcpy
                                    705 ;	main.c: 256: fades[0] = FADE_STEPS;
      000222 08 2F                  706 	mov	a, #0x08
      000224 99 0B                  707 	mov	_fades+0, a
                                    708 ;	main.c: 257: state_update_delay_ms_cnt = STATE_6_DELAY_ms;
      000226 C8 2F                  709 	mov	a, #0xc8
      000228 A7 0B                  710 	mov	_state_update_delay_ms_cnt+0, a
      00022A 28 13                  711 	clear	_state_update_delay_ms_cnt+1
                                    712 ;	main.c: 258: step = STEP_7;
      00022C 07 2F                  713 	mov	a, #0x07
      00022E 8B 0B                  714 	mov	_step+0, a
                                    715 ;	main.c: 259: break;
      000230 7A 00                  716 	ret
                                    717 ;	main.c: 260: case STEP_7:
      000232                        718 00107$:
                                    719 ;	main.c: 261: state_update_delay_ms_cnt = STATE_7_DELAY_ms;
      000232 E8 2F                  720 	mov	a, #0xe8
      000234 A7 0B                  721 	mov	_state_update_delay_ms_cnt+0, a
      000236 03 2F                  722 	mov	a, #0x03
      000238 A8 0B                  723 	mov	_state_update_delay_ms_cnt+1, a
                                    724 ;	main.c: 262: step = STEP_1;
      00023A 01 2F                  725 	mov	a, #0x01
      00023C 8B 0B                  726 	mov	_step+0, a
                                    727 ;	main.c: 263: break;
      00023E 7A 00                  728 	ret
                                    729 ;	main.c: 265: case NONE:
      000240                        730 00109$:
                                    731 ;	main.c: 266: pixel_buff[0] = off_color;
      000240 0D 2F                  732 	mov	a, #(_pixel_buff + 0)
      000242 B8 0B                  733 	mov	___memcpy_PARM_1+0, a
      000244 39 13                  734 	clear	___memcpy_PARM_1+1
      000246 84 2F                  735 	mov	a, #<(_off_color + 0)
      000248 BA 0B                  736 	mov	___memcpy_PARM_2+0, a
      00024A 82 2F                  737 	mov	a, #>(_off_color + 0x8000 + 0)
      00024C BB 0B                  738 	mov	___memcpy_PARM_2+1, a
      00024E 03 2F                  739 	mov	a, #0x03
      000250 BC 0B                  740 	mov	___memcpy_PARM_3+0, a
      000252 3D 13                  741 	clear	___memcpy_PARM_3+1
      000254 42 3A                  742 	call	___memcpy
                                    743 ;	main.c: 267: pixel_buff[1] = off_color;
      000256 10 2F                  744 	mov	a, #(_pixel_buff + 3)
      000258 B8 0B                  745 	mov	___memcpy_PARM_1+0, a
      00025A 39 13                  746 	clear	___memcpy_PARM_1+1
      00025C 84 2F                  747 	mov	a, #<(_off_color + 0)
      00025E BA 0B                  748 	mov	___memcpy_PARM_2+0, a
      000260 82 2F                  749 	mov	a, #>(_off_color + 0x8000 + 0)
      000262 BB 0B                  750 	mov	___memcpy_PARM_2+1, a
      000264 03 2F                  751 	mov	a, #0x03
      000266 BC 0B                  752 	mov	___memcpy_PARM_3+0, a
      000268 3D 13                  753 	clear	___memcpy_PARM_3+1
      00026A 42 3A                  754 	call	___memcpy
                                    755 ;	main.c: 268: pixel_buff[2] = off_color;
      00026C 13 2F                  756 	mov	a, #(_pixel_buff + 6)
      00026E B8 0B                  757 	mov	___memcpy_PARM_1+0, a
      000270 39 13                  758 	clear	___memcpy_PARM_1+1
      000272 84 2F                  759 	mov	a, #<(_off_color + 0)
      000274 BA 0B                  760 	mov	___memcpy_PARM_2+0, a
      000276 82 2F                  761 	mov	a, #>(_off_color + 0x8000 + 0)
      000278 BB 0B                  762 	mov	___memcpy_PARM_2+1, a
      00027A 03 2F                  763 	mov	a, #0x03
      00027C BC 0B                  764 	mov	___memcpy_PARM_3+0, a
      00027E 3D 13                  765 	clear	___memcpy_PARM_3+1
      000280 42 3A                  766 	call	___memcpy
                                    767 ;	main.c: 269: pixel_buff[3] = off_color;
      000282 16 2F                  768 	mov	a, #(_pixel_buff + 9)
      000284 B8 0B                  769 	mov	___memcpy_PARM_1+0, a
      000286 39 13                  770 	clear	___memcpy_PARM_1+1
      000288 84 2F                  771 	mov	a, #<(_off_color + 0)
      00028A BA 0B                  772 	mov	___memcpy_PARM_2+0, a
      00028C 82 2F                  773 	mov	a, #>(_off_color + 0x8000 + 0)
      00028E BB 0B                  774 	mov	___memcpy_PARM_2+1, a
      000290 03 2F                  775 	mov	a, #0x03
      000292 BC 0B                  776 	mov	___memcpy_PARM_3+0, a
      000294 3D 13                  777 	clear	___memcpy_PARM_3+1
      000296 42 3A                  778 	call	___memcpy
                                    779 ;	main.c: 270: output_leds();
      000298 77 30                  780 	goto	_output_leds
                                    781 ;	main.c: 272: }
                                    782 ;	main.c: 273: }
      00029A 7A 00                  783 	ret
                                    784 ;	main.c: 275: void handle_state_update()
                                    785 ;	-----------------------------------------
                                    786 ;	 function handle_state_update
                                    787 ;	-----------------------------------------
      00029C                        788 _handle_state_update:
                                    789 ;	main.c: 278: switch (state)
      00029C 8C 0F                  790 	mov	a, _state+0
      00029E 00 2B                  791 	cneqsn	a, #0x00
      0002A0 55 31                  792 	goto	00102$
      0002A2                        793 00121$:
      0002A2 01 2B                  794 	cneqsn	a, #0x01
      0002A4 59 31                  795 	goto	00103$
      0002A6                        796 00123$:
      0002A6 02 2B                  797 	cneqsn	a, #0x02
      0002A8 79 31                  798 	goto	00104$
      0002AA                        799 00125$:
                                    800 ;	main.c: 281: case OFF:
      0002AA                        801 00102$:
                                    802 ;	main.c: 282: step = NONE;
      0002AA 0B 13                  803 	clear	_step+0
                                    804 ;	main.c: 283: state = BLUE;
      0002AC 01 2F                  805 	mov	a, #0x01
      0002AE 8C 0B                  806 	mov	_state+0, a
                                    807 ;	main.c: 284: break;
      0002B0 7A 00                  808 	ret
                                    809 ;	main.c: 285: case BLUE:
      0002B2                        810 00103$:
                                    811 ;	main.c: 286: r_step = BLUE_R_STEP;
                                    812 ;	main.c: 287: g_step = BLUE_G_STEP;
      0002B2 02 2F                  813 	mov a, #0x02
      0002B4 A0 0B                  814 	mov  _r_step+0, a
      0002B6 A1 0B                  815 	mov	_g_step+0, a
                                    816 ;	main.c: 288: b_step = BLUE_B_STEP;
      0002B8 08 2F                  817 	mov	a, #0x08
      0002BA A2 0B                  818 	mov	_b_step+0, a
                                    819 ;	main.c: 289: highlight_color = blue_highlight_color;
      0002BC 08 2F                  820 	mov	a, #(_highlight_color + 0)
      0002BE B8 0B                  821 	mov	___memcpy_PARM_1+0, a
      0002C0 39 13                  822 	clear	___memcpy_PARM_1+1
      0002C2 81 2F                  823 	mov	a, #<(_blue_highlight_color + 0)
      0002C4 BA 0B                  824 	mov	___memcpy_PARM_2+0, a
      0002C6 82 2F                  825 	mov	a, #>(_blue_highlight_color + 0x8000 + 0)
      0002C8 BB 0B                  826 	mov	___memcpy_PARM_2+1, a
      0002CA 03 2F                  827 	mov	a, #0x03
      0002CC BC 0B                  828 	mov	___memcpy_PARM_3+0, a
      0002CE 3D 13                  829 	clear	___memcpy_PARM_3+1
      0002D0 42 3A                  830 	call	___memcpy
                                    831 ;	main.c: 290: base_color = blue_base_color;
      0002D2 05 2F                  832 	mov	a, #(_base_color + 0)
      0002D4 B8 0B                  833 	mov	___memcpy_PARM_1+0, a
      0002D6 39 13                  834 	clear	___memcpy_PARM_1+1
      0002D8 7E 2F                  835 	mov	a, #<(_blue_base_color + 0)
      0002DA BA 0B                  836 	mov	___memcpy_PARM_2+0, a
      0002DC 82 2F                  837 	mov	a, #>(_blue_base_color + 0x8000 + 0)
      0002DE BB 0B                  838 	mov	___memcpy_PARM_2+1, a
      0002E0 03 2F                  839 	mov	a, #0x03
      0002E2 BC 0B                  840 	mov	___memcpy_PARM_3+0, a
      0002E4 3D 13                  841 	clear	___memcpy_PARM_3+1
      0002E6 42 3A                  842 	call	___memcpy
                                    843 ;	main.c: 291: step = STEP_1;
      0002E8 01 2F                  844 	mov	a, #0x01
      0002EA 8B 0B                  845 	mov	_step+0, a
                                    846 ;	main.c: 292: state = ORANGE;
      0002EC 02 2F                  847 	mov	a, #0x02
      0002EE 8C 0B                  848 	mov	_state+0, a
                                    849 ;	main.c: 293: break;
      0002F0 7A 00                  850 	ret
                                    851 ;	main.c: 294: case ORANGE:
      0002F2                        852 00104$:
                                    853 ;	main.c: 295: r_step = ORANGE_R_STEP;
      0002F2 0A 2F                  854 	mov	a, #0x0a
      0002F4 A0 0B                  855 	mov	_r_step+0, a
                                    856 ;	main.c: 296: g_step = ORANGE_G_STEP;
      0002F6 04 2F                  857 	mov	a, #0x04
      0002F8 A1 0B                  858 	mov	_g_step+0, a
                                    859 ;	main.c: 297: b_step = ORANGE_B_STEP;
      0002FA 02 2F                  860 	mov	a, #0x02
      0002FC A2 0B                  861 	mov	_b_step+0, a
                                    862 ;	main.c: 298: highlight_color = orange_highlight_color;
      0002FE 08 2F                  863 	mov	a, #(_highlight_color + 0)
      000300 B8 0B                  864 	mov	___memcpy_PARM_1+0, a
      000302 39 13                  865 	clear	___memcpy_PARM_1+1
      000304 7B 2F                  866 	mov	a, #<(_orange_highlight_color + 0)
      000306 BA 0B                  867 	mov	___memcpy_PARM_2+0, a
      000308 82 2F                  868 	mov	a, #>(_orange_highlight_color + 0x8000 + 0)
      00030A BB 0B                  869 	mov	___memcpy_PARM_2+1, a
      00030C 03 2F                  870 	mov	a, #0x03
      00030E BC 0B                  871 	mov	___memcpy_PARM_3+0, a
      000310 3D 13                  872 	clear	___memcpy_PARM_3+1
      000312 42 3A                  873 	call	___memcpy
                                    874 ;	main.c: 299: base_color = orange_base_color;
      000314 05 2F                  875 	mov	a, #(_base_color + 0)
      000316 B8 0B                  876 	mov	___memcpy_PARM_1+0, a
      000318 39 13                  877 	clear	___memcpy_PARM_1+1
      00031A 78 2F                  878 	mov	a, #<(_orange_base_color + 0)
      00031C BA 0B                  879 	mov	___memcpy_PARM_2+0, a
      00031E 82 2F                  880 	mov	a, #>(_orange_base_color + 0x8000 + 0)
      000320 BB 0B                  881 	mov	___memcpy_PARM_2+1, a
      000322 03 2F                  882 	mov	a, #0x03
      000324 BC 0B                  883 	mov	___memcpy_PARM_3+0, a
      000326 3D 13                  884 	clear	___memcpy_PARM_3+1
      000328 42 3A                  885 	call	___memcpy
                                    886 ;	main.c: 300: step = STEP_1;
      00032A 01 2F                  887 	mov	a, #0x01
      00032C 8B 0B                  888 	mov	_step+0, a
                                    889 ;	main.c: 301: state = OFF;
      00032E 0C 13                  890 	clear	_state+0
                                    891 ;	main.c: 303: }
                                    892 ;	main.c: 304: }
      000330 7A 00                  893 	ret
                                    894 ;	main.c: 306: void button_check()
                                    895 ;	-----------------------------------------
                                    896 ;	 function button_check
                                    897 ;	-----------------------------------------
      000332                        898 _button_check:
                                    899 ;	main.c: 308: uint16_t touch_value = read_touch_raw();
      000332 8A 38                  900 	call	_read_touch_raw
      000334 AF 0B                  901 	mov	_button_check_sloc2_1_0+0, a
      000336 80 0F                  902 	mov	a, p
      000338 B0 0B                  903 	mov	_button_check_sloc2_1_0+1, a
                                    904 ;	main.c: 311: uart_tx_byte(touch_value);
      00033A AF 0F                  905 	mov	a, _button_check_sloc2_1_0+0
      00033C 82 0B                  906 	mov	_uart_tx_byte_PARM_1+0, a
      00033E B0 0F                  907 	mov	a, _button_check_sloc2_1_0+1
      000340 83 0B                  908 	mov	_uart_tx_byte_PARM_1+1, a
      000342 42 38                  909 	call	_uart_tx_byte
                                    910 ;	main.c: 330: if (touch_value < TOUCH_THRESHOLD)
      000344 B0 0F                  911 	mov	a, _button_check_sloc2_1_0+1
      000346 80 0B                  912 	mov	p, a
      000348 AF 0F                  913 	mov	a, _button_check_sloc2_1_0+0
      00034A 06 29                  914 	sub	a, #0x06
      00034C 80 0F                  915 	mov	a, p
      00034E 61 00                  916 	subc	a
      000350 40 1A                  917 	t1sn.io	f, c
      000352 B2 31                  918 	goto	00104$
      000354                        919 00120$:
                                    920 ;	main.c: 333: if (!button_down)
      000354 A4 0F                  921 	mov	a, _button_down+0
      000356 00 2A                  922 	ceqsn	a, #0x00
      000358 7A 00                  923 	ret
      00035A                        924 00121$:
                                    925 ;	main.c: 336: button_down = 1;
      00035A 01 2F                  926 	mov	a, #0x01
      00035C A4 0B                  927 	mov	_button_down+0, a
                                    928 ;	main.c: 337: handle_state_update();
      00035E 4E 39                  929 	call	_handle_state_update
                                    930 ;	main.c: 338: state_check();
      000360 96 30                  931 	goto	_state_check
      000362 7A 00                  932 	ret
      000364                        933 00104$:
                                    934 ;	main.c: 344: button_down = 0;
      000364 24 13                  935 	clear	_button_down+0
                                    936 ;	main.c: 346: }
      000366 7A 00                  937 	ret
                                    938 ;	main.c: 348: void handle_tick()
                                    939 ;	-----------------------------------------
                                    940 ;	 function handle_tick
                                    941 ;	-----------------------------------------
      000368                        942 _handle_tick:
                                    943 ;	main.c: 350: button_check();
      000368 99 39                  944 	call	_button_check
                                    945 ;	main.c: 352: if (state_update_delay_ms_cnt >= GLOBAL_TICK_ms && step != NONE)
      00036A A8 0F                  946 	mov	a, _state_update_delay_ms_cnt+1
      00036C 80 0B                  947 	mov	p, a
      00036E A7 0F                  948 	mov	a, _state_update_delay_ms_cnt+0
      000370 0A 29                  949 	sub	a, #0x0a
      000372 80 0F                  950 	mov	a, p
      000374 61 00                  951 	subc	a
      000376 40 18                  952 	t0sn.io	f, c
      000378 1B 32                  953 	goto	00107$
      00037A                        954 00151$:
      00037A 8B 0F                  955 	mov	a, _step+0
      00037C 00 2B                  956 	cneqsn	a, #0x00
      00037E 1B 32                  957 	goto	00107$
      000380                        958 00152$:
                                    959 ;	main.c: 354: state_update_delay_ms_cnt -= GLOBAL_TICK_ms;
      000380 A7 0F                  960 	mov	a, _state_update_delay_ms_cnt+0
      000382 0A 29                  961 	sub	a, #0x0a
      000384 80 0B                  962 	mov	p, a
      000386 A8 0F                  963 	mov	a, _state_update_delay_ms_cnt+1
      000388 61 00                  964 	subc	a
      00038A A8 0B                  965 	mov	_state_update_delay_ms_cnt+1, a
      00038C 80 0F                  966 	mov	a, p
      00038E A7 0B                  967 	mov	_state_update_delay_ms_cnt+0, a
                                    968 ;	main.c: 356: if (led_update_delay_ms_cnt >= LED_UPDATE_DELAY_ms)
      000390 A6 0F                  969 	mov	a, _led_update_delay_ms_cnt+1
      000392 80 0B                  970 	mov	p, a
      000394 A5 0F                  971 	mov	a, _led_update_delay_ms_cnt+0
      000396 32 29                  972 	sub	a, #0x32
      000398 80 0F                  973 	mov	a, p
      00039A 61 00                  974 	subc	a
      00039C 40 18                  975 	t0sn.io	f, c
      00039E 12 32                  976 	goto	00105$
      0003A0                        977 00153$:
                                    978 ;	main.c: 358: for (uint8_t i = 0; i < LED_COUNT; i++)
      0003A0 31 13                  979 	clear	_handle_tick_sloc3_1_0+0
      0003A2                        980 00110$:
      0003A2 B1 0F                  981 	mov	a, _handle_tick_sloc3_1_0+0
      0003A4 04 29                  982 	sub	a, #0x04
      0003A6 40 1A                  983 	t1sn.io	f, c
      0003A8 0F 32                  984 	goto	00103$
      0003AA                        985 00154$:
                                    986 ;	main.c: 360: if (fades[i] > 0)
      0003AA 19 2F                  987 	mov	a, #(_fades + 0)
      0003AC 31 0C                  988 	add	a, _handle_tick_sloc3_1_0+0
      0003AE 80 0B                  989 	mov	p, a
      0003B0 81 03                  990 	idxm	a, p
      0003B2 00 2B                  991 	cneqsn	a, #0x00
      0003B4 0D 32                  992 	goto	00111$
      0003B6                        993 00155$:
                                    994 ;	main.c: 362: fades[i]--;
      0003B6 19 2F                  995 	mov	a, #(_fades + 0)
      0003B8 31 0C                  996 	add	a, _handle_tick_sloc3_1_0+0
      0003BA 80 0B                  997 	mov	p, a
      0003BC 81 03                  998 	idxm	a, p
      0003BE 01 29                  999 	sub	a, #0x01
      0003C0 80 03                 1000 	idxm	p, a
                                   1001 ;	main.c: 364: pixel_buff[i].r = (pixel_buff[i].r - r_step);
      0003C2 B1 0F                 1002 	mov	a, _handle_tick_sloc3_1_0+0
      0003C4 6B 00                 1003 	sl	a
      0003C6 31 0C                 1004 	add	a, _handle_tick_sloc3_1_0+0
      0003C8 B2 0B                 1005 	mov	_handle_tick_sloc4_1_0+0, a
      0003CA 0D 2F                 1006 	mov	a, #(_pixel_buff + 0)
      0003CC 32 0C                 1007 	add	a, _handle_tick_sloc4_1_0+0
      0003CE 01 28                 1008 	add	a, #0x01
      0003D0 B3 0B                 1009 	mov	_handle_tick_sloc5_1_0+0, a
      0003D2 0D 2F                 1010 	mov	a, #(_pixel_buff + 0)
      0003D4 32 0C                 1011 	add	a, _handle_tick_sloc4_1_0+0
      0003D6 01 28                 1012 	add	a, #0x01
      0003D8 80 0B                 1013 	mov	p, a
      0003DA 81 03                 1014 	idxm	a, p
      0003DC A0 0C                 1015 	sub	a, _r_step+0
      0003DE 80 0B                 1016 	mov	p, a
      0003E0 B3 0F                 1017 	mov	a, _handle_tick_sloc5_1_0+0
      0003E2 80 13                 1018 	xch	a, p
      0003E4 80 03                 1019 	idxm	p, a
                                   1020 ;	main.c: 365: pixel_buff[i].g = (pixel_buff[i].g - g_step);
      0003E6 0D 2F                 1021 	mov	a, #(_pixel_buff + 0)
      0003E8 32 0C                 1022 	add	a, _handle_tick_sloc4_1_0+0
      0003EA B4 0B                 1023 	mov	_handle_tick_sloc6_1_0+0, a
      0003EC 0D 2F                 1024 	mov	a, #(_pixel_buff + 0)
      0003EE 32 0C                 1025 	add	a, _handle_tick_sloc4_1_0+0
      0003F0 80 0B                 1026 	mov	p, a
      0003F2 81 03                 1027 	idxm	a, p
      0003F4 A1 0C                 1028 	sub	a, _g_step+0
      0003F6 80 0B                 1029 	mov	p, a
      0003F8 B4 0F                 1030 	mov	a, _handle_tick_sloc6_1_0+0
      0003FA 80 13                 1031 	xch	a, p
      0003FC 80 03                 1032 	idxm	p, a
                                   1033 ;	main.c: 366: pixel_buff[i].b = (pixel_buff[i].b - b_step);
      0003FE 0D 2F                 1034 	mov	a, #(_pixel_buff + 0)
      000400 32 0C                 1035 	add	a, _handle_tick_sloc4_1_0+0
      000402 02 28                 1036 	add	a, #0x02
      000404 B5 0B                 1037 	mov	_handle_tick_sloc7_1_0+0, a
      000406 0D 2F                 1038 	mov	a, #(_pixel_buff + 0)
      000408 32 0C                 1039 	add	a, _handle_tick_sloc4_1_0+0
      00040A 02 28                 1040 	add	a, #0x02
      00040C 80 0B                 1041 	mov	p, a
      00040E 81 03                 1042 	idxm	a, p
      000410 A2 0C                 1043 	sub	a, _b_step+0
      000412 80 0B                 1044 	mov	p, a
      000414 B5 0F                 1045 	mov	a, _handle_tick_sloc7_1_0+0
      000416 80 13                 1046 	xch	a, p
      000418 80 03                 1047 	idxm	p, a
      00041A                       1048 00111$:
                                   1049 ;	main.c: 358: for (uint8_t i = 0; i < LED_COUNT; i++)
      00041A 31 12                 1050 	inc	_handle_tick_sloc3_1_0+0
      00041C D1 31                 1051 	goto	00110$
      00041E                       1052 00103$:
                                   1053 ;	main.c: 370: output_leds();
      00041E 77 38                 1054 	call	_output_leds
                                   1055 ;	main.c: 371: led_update_delay_ms_cnt = 0;
      000420 25 13                 1056 	clear	_led_update_delay_ms_cnt+0
      000422 26 13                 1057 	clear	_led_update_delay_ms_cnt+1
      000424                       1058 00105$:
                                   1059 ;	main.c: 374: led_update_delay_ms_cnt += GLOBAL_TICK_ms;
      000424 A5 0F                 1060 	mov	a, _led_update_delay_ms_cnt+0
      000426 0A 28                 1061 	add	a, #0x0a
      000428 80 0B                 1062 	mov	p, a
      00042A A6 0F                 1063 	mov	a, _led_update_delay_ms_cnt+1
      00042C 60 00                 1064 	addc	a
      00042E A6 0B                 1065 	mov	_led_update_delay_ms_cnt+1, a
      000430 80 0F                 1066 	mov	a, p
      000432 A5 0B                 1067 	mov	_led_update_delay_ms_cnt+0, a
                                   1068 ;	main.c: 376: return;
      000434 7A 00                 1069 	ret
      000436                       1070 00107$:
                                   1071 ;	main.c: 379: state_check();
      000436 96 30                 1072 	goto	_state_check
                                   1073 ;	main.c: 380: }
      000438 7A 00                 1074 	ret
                                   1075 ;	main.c: 382: void main(void)
                                   1076 ;	-----------------------------------------
                                   1077 ;	 function main
                                   1078 ;	-----------------------------------------
      00043A                       1079 _main:
                                   1080 ;	main.c: 385: sys_clk_init();
      00043A 6B 38                 1081 	call	_sys_clk_init
                                   1082 ;	main.c: 386: led_init();
      00043C 6E 38                 1083 	call	_led_init
                                   1084 ;	main.c: 387: timer_init();
      00043E 70 38                 1085 	call	_timer_init
                                   1086 ;	main.c: 391: for (uint16_t i = 0; i < 65535; i++)
      000440 36 13                 1087 	clear	_main_sloc8_1_0+0
      000442 37 13                 1088 	clear	_main_sloc8_1_0+1
      000444                       1089 00108$:
      000444 B6 0F                 1090 	mov	a, _main_sloc8_1_0+0
      000446 FF 29                 1091 	sub	a, #0xff
      000448 FF 2F                 1092 	mov	a, #0xff
      00044A 80 0B                 1093 	mov	p, a
      00044C B7 0F                 1094 	mov	a, _main_sloc8_1_0+1
      00044E 80 0D                 1095 	subc	a, p
      000450 40 1A                 1096 	t1sn.io	f, c
      000452 2E 32                 1097 	goto	00101$
      000454                       1098 00137$:
                                   1099 ;	main.c: 393: __asm__("nop"); // Short delay to ensure stable power before configuring pins
      000454 00 00                 1100 	nop
                                   1101 ;	main.c: 391: for (uint16_t i = 0; i < 65535; i++)
      000456 36 12                 1102 	inc	_main_sloc8_1_0+0
      000458 37 10                 1103 	addc	_main_sloc8_1_0+1
      00045A 22 32                 1104 	goto	00108$
      00045C                       1105 00101$:
                                   1106 ;	main.c: 395: PAC |= TX_PIN; // Set PA.0 as output
      00045C D1 1E                 1107 	set1.io	__pac, #3
                                   1108 ;	main.c: 396: PA |= TX_PIN;  // Idle High
      00045E D0 1E                 1109 	set1.io	__pa, #3
                                   1110 ;	main.c: 399: touch_init();
      000460 62 38                 1111 	call	_touch_init
                                   1112 ;	main.c: 401: touch_base = read_touch_raw();
      000462 8A 38                 1113 	call	_read_touch_raw
      000464 A9 0B                 1114 	mov	_touch_base+0, a
      000466 80 0F                 1115 	mov	a, p
      000468 AA 0B                 1116 	mov	_touch_base+1, a
                                   1117 ;	main.c: 403: state = BLUE;
      00046A 01 2F                 1118 	mov	a, #0x01
      00046C 8C 0B                 1119 	mov	_state+0, a
                                   1120 ;	main.c: 404: step = NONE;
      00046E 0B 13                 1121 	clear	_step+0
                                   1122 ;	main.c: 405: handle_state_update();
      000470 4E 39                 1123 	call	_handle_state_update
                                   1124 ;	main.c: 407: while (1)
      000472                       1125 00105$:
                                   1126 ;	main.c: 409: if (TM2CT >= GLOBAL_TICK_ms)
      000472 DD 01                 1127 	mov.io	a, __tm2ct
      000474 0A 29                 1128 	sub	a, #0x0a
      000476 40 18                 1129 	t0sn.io	f, c
      000478 39 32                 1130 	goto	00105$
      00047A                       1131 00138$:
                                   1132 ;	main.c: 411: TM2CT = 0; // Clear the timer count
      00047A 00 2F                 1133 	mov	a, #0x00
      00047C 9D 01                 1134 	mov.io	__tm2ct, a
                                   1135 ;	main.c: 412: handle_tick();
      00047E B4 39                 1136 	call	_handle_tick
      000480 39 32                 1137 	goto	00105$
                                   1138 ;	main.c: 415: }
      000482 7A 00                 1139 	ret
                                   1140 	.area CODE
                                   1141 	.area CONST
                                   1142 	.area CONST
      0004F0                       1143 _orange_base_color:
      0004F0 08 02                 1144 	ret #0x08	; 8
      0004F2 20 02                 1145 	ret #0x20	; 32
      0004F4 00 02                 1146 	ret #0x00	; 0
                                   1147 	.area CODE
                                   1148 	.area CONST
      0004F6                       1149 _orange_highlight_color:
      0004F6 28 02                 1150 	ret #0x28	; 40
      0004F8 70 02                 1151 	ret #0x70	; 112	'p'
      0004FA 10 02                 1152 	ret #0x10	; 16
                                   1153 	.area CODE
                                   1154 	.area CONST
      0004FC                       1155 _blue_base_color:
      0004FC 00 02                 1156 	ret #0x00	; 0
      0004FE 00 02                 1157 	ret #0x00	; 0
      000500 40 02                 1158 	ret #0x40	; 64
                                   1159 	.area CODE
                                   1160 	.area CONST
      000502                       1161 _blue_highlight_color:
      000502 10 02                 1162 	ret #0x10	; 16
      000504 10 02                 1163 	ret #0x10	; 16
      000506 80 02                 1164 	ret #0x80	; 128
                                   1165 	.area CODE
                                   1166 	.area CONST
      000508                       1167 _off_color:
      000508 00 02                 1168 	ret #0x00	; 0
      00050A 00 02                 1169 	ret #0x00	; 0
      00050C 00 02                 1170 	ret #0x00	; 0
                                   1171 	.area CODE
                                   1172 	.area CABS (ABS)
