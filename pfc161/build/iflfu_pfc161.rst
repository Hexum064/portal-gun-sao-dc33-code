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
                                     16 	.globl _off_color
                                     17 	.globl _blue_highlight_color
                                     18 	.globl _blue_base_color
                                     19 	.globl _orange_highlight_color
                                     20 	.globl _orange_base_color
                                     21 	.globl _main
                                     22 	.globl _handle_tick
                                     23 	.globl _button_check
                                     24 	.globl _handle_state_update
                                     25 	.globl _state_check
                                     26 	.globl _read_touch_raw
                                     27 	.globl _output_leds
                                     28 	.globl _timer_init
                                     29 	.globl _led_init
                                     30 	.globl _sys_clk_init
                                     31 	.globl _touch_init
                                     32 	.globl __t16c
                                     33 	.globl __rop
                                     34 	.globl __ilrcr
                                     35 	.globl __tm3b
                                     36 	.globl __tm3s
                                     37 	.globl __tm3ct
                                     38 	.globl __tm3c
                                     39 	.globl __lvdc
                                     40 	.globl __tkcl
                                     41 	.globl __tkch
                                     42 	.globl __tps2
                                     43 	.globl __tps
                                     44 	.globl __tke1
                                     45 	.globl __tke2
                                     46 	.globl __tcc
                                     47 	.globl __ts
                                     48 	.globl __tm2b
                                     49 	.globl __tm2s
                                     50 	.globl __tm2ct
                                     51 	.globl __tm2c
                                     52 	.globl __misclvr
                                     53 	.globl __bgtr
                                     54 	.globl __gpcs
                                     55 	.globl __gpcc
                                     56 	.globl __pbpl
                                     57 	.globl __pbph
                                     58 	.globl __pbc
                                     59 	.globl __pb
                                     60 	.globl __papl
                                     61 	.globl __paph
                                     62 	.globl __pac
                                     63 	.globl __pa
                                     64 	.globl __misc2
                                     65 	.globl __pbdier
                                     66 	.globl __padier
                                     67 	.globl __integs
                                     68 	.globl __ihrcr
                                     69 	.globl __eoscr
                                     70 	.globl __misc
                                     71 	.globl __t16m
                                     72 	.globl __intrq
                                     73 	.globl __inten
                                     74 	.globl __clkmd
                                     75 	.globl __sp
                                     76 	.globl __flag
                                     77 	.globl _resample_count
                                     78 	.globl _last_touch
                                     79 	.globl _touch_base
                                     80 	.globl _state_update_delay_ms_cnt
                                     81 	.globl _led_update_delay_ms_cnt
                                     82 	.globl _button_down
                                     83 	.globl _button_ctr
                                     84 	.globl _b_step
                                     85 	.globl _g_step
                                     86 	.globl _r_step
                                     87 	.globl _byte_ctr
                                     88 	.globl _byte_t
                                     89 	.globl _bytes
                                     90 	.globl _fades
                                     91 	.globl _pixel_buff
                                     92 	.globl _state
                                     93 	.globl _step
                                     94 	.globl _highlight_color
                                     95 	.globl _base_color
                                     96 ;--------------------------------------------------------
                                     97 ; special function registers
                                     98 ;--------------------------------------------------------
                                     99 	.area RSEG (ABS)
      000000                        100 	.org 0x0000
                           000000   101 __flag	=	0x0000
                           000002   102 __sp	=	0x0002
                           000003   103 __clkmd	=	0x0003
                           000004   104 __inten	=	0x0004
                           000005   105 __intrq	=	0x0005
                           000006   106 __t16m	=	0x0006
                           000008   107 __misc	=	0x0008
                           00000A   108 __eoscr	=	0x000a
                           00000B   109 __ihrcr	=	0x000b
                           00000C   110 __integs	=	0x000c
                           00000D   111 __padier	=	0x000d
                           00000E   112 __pbdier	=	0x000e
                           00000F   113 __misc2	=	0x000f
                           000010   114 __pa	=	0x0010
                           000011   115 __pac	=	0x0011
                           000012   116 __paph	=	0x0012
                           000013   117 __papl	=	0x0013
                           000014   118 __pb	=	0x0014
                           000015   119 __pbc	=	0x0015
                           000016   120 __pbph	=	0x0016
                           000017   121 __pbpl	=	0x0017
                           000018   122 __gpcc	=	0x0018
                           000019   123 __gpcs	=	0x0019
                           00001A   124 __bgtr	=	0x001a
                           00001B   125 __misclvr	=	0x001b
                           00001C   126 __tm2c	=	0x001c
                           00001D   127 __tm2ct	=	0x001d
                           00001E   128 __tm2s	=	0x001e
                           00001F   129 __tm2b	=	0x001f
                           000020   130 __ts	=	0x0020
                           000021   131 __tcc	=	0x0021
                           000022   132 __tke2	=	0x0022
                           000024   133 __tke1	=	0x0024
                           000026   134 __tps	=	0x0026
                           000028   135 __tps2	=	0x0028
                           00002B   136 __tkch	=	0x002b
                           00002C   137 __tkcl	=	0x002c
                           00002D   138 __lvdc	=	0x002d
                           000032   139 __tm3c	=	0x0032
                           000033   140 __tm3ct	=	0x0033
                           000034   141 __tm3s	=	0x0034
                           000035   142 __tm3b	=	0x0035
                           000039   143 __ilrcr	=	0x0039
                           00003A   144 __rop	=	0x003a
      000000                        145 __t16c::
      000000                        146 	.ds 2
                                    147 ;--------------------------------------------------------
                                    148 ; ram data
                                    149 ;--------------------------------------------------------
                                    150 	.area DATA
      000002                        151 _base_color::
      000002                        152 	.ds 3
      000005                        153 _highlight_color::
      000005                        154 	.ds 3
      000008                        155 _step::
      000008                        156 	.ds 1
      000009                        157 _state::
      000009                        158 	.ds 1
      00000A                        159 _pixel_buff::
      00000A                        160 	.ds 12
      000016                        161 _fades::
      000016                        162 	.ds 4
      00001A                        163 _bytes::
      00001A                        164 	.ds 1
      00001B                        165 _byte_t::
      00001B                        166 	.ds 1
      00001C                        167 _byte_ctr::
      00001C                        168 	.ds 1
      00001D                        169 _r_step::
      00001D                        170 	.ds 1
      00001E                        171 _g_step::
      00001E                        172 	.ds 1
      00001F                        173 _b_step::
      00001F                        174 	.ds 1
      000020                        175 _button_ctr::
      000020                        176 	.ds 1
      000021                        177 _button_down::
      000021                        178 	.ds 1
      000022                        179 _led_update_delay_ms_cnt::
      000022                        180 	.ds 2
      000024                        181 _state_update_delay_ms_cnt::
      000024                        182 	.ds 2
      000026                        183 _touch_base::
      000026                        184 	.ds 2
      000028                        185 _last_touch::
      000028                        186 	.ds 2
      00002A                        187 _resample_count::
      00002A                        188 	.ds 1
      00002B                        189 _button_check_sloc0_1_0:
      00002B                        190 	.ds 2
      00002D                        191 _button_check_sloc1_1_0:
      00002D                        192 	.ds 2
      00002F                        193 _handle_tick_sloc2_1_0:
      00002F                        194 	.ds 1
      000030                        195 _handle_tick_sloc3_1_0:
      000030                        196 	.ds 1
      000031                        197 _handle_tick_sloc4_1_0:
      000031                        198 	.ds 1
      000032                        199 _handle_tick_sloc5_1_0:
      000032                        200 	.ds 1
      000033                        201 _handle_tick_sloc6_1_0:
      000033                        202 	.ds 1
                                    203 ;--------------------------------------------------------
                                    204 ; overlayable items in ram
                                    205 ;--------------------------------------------------------
                                    206 ;--------------------------------------------------------
                                    207 ; Stack segment in internal ram
                                    208 ;--------------------------------------------------------
                                    209 	.area SSEG
      000042                        210 __start__stack:
      000042                        211 	.ds	1
                                    212 
                                    213 ;--------------------------------------------------------
                                    214 ; absolute external ram data
                                    215 ;--------------------------------------------------------
                                    216 	.area DABS (ABS)
                                    217 ;--------------------------------------------------------
                                    218 ; interrupt vector
                                    219 ;--------------------------------------------------------
                                    220 	.area HOME
      000022                        221 __interrupt_vect:
                                    222 	.area	HEADER (ABS)
      000020                        223 	.org	 0x0020
      000020 7B 00                  224 	reti
                                    225 ;--------------------------------------------------------
                                    226 ; global & static initialisations
                                    227 ;--------------------------------------------------------
                                    228 	.area HOME
                                    229 	.area GSINIT
                                    230 	.area GSFINAL
                                    231 	.area GSINIT
                                    232 	.area	PREG (ABS)
      000000                        233 	.org 0x00
      000000                        234 p::
      000000                        235 	.ds 2
                                    236 	.area	HEADER (ABS)
      000000                        237 	.org 0x0000
      000000 00 00                  238 	nop
      000002 01 13                  239 	clear	p+1
      000004 34 2F                  240 	mov	a, #s_OSEG
      000006 0F 28                  241 	add	a, #l_OSEG + 1
      000008 FE 2C                  242 	and	a, #0xfe
      00000A 82 01                  243 	mov.io	sp, a
      00000C 44 3A                  244 	call	___sdcc_external_startup
      00000E 00 2B                  245 	cneqsn	a, #0x00
      000010 12 30                  246 	goto	__sdcc_init_data
      000012 11 30                  247 	goto	__sdcc_program_startup
                                    248 	.area GSINIT
      000024                        249 __sdcc_init_data:
      000024 02 2F                  250 	mov	a, #s_DATA
      000026 80 0B                  251 	mov	p, a
      000028 19 30                  252 	goto	00002$
      00002A                        253 00001$:
      00002A 00 2F                  254 	mov	a, #0x00
      00002C 80 03                  255 	idxm	p, a
      00002E 00 12                  256 	inc	p
      000030 02 2F                  257 	mov	a, #s_DATA
      000032                        258 00002$:
      000032 32 28                  259 	add	a, #l_DATA
      000034 00 17                  260 	ceqsn	a, p
      000036 15 30                  261 	goto	00001$
                                    262 ;	main.c: 124: volatile Steps step = STEP_1;
      000038 01 2F                  263 	mov	a, #0x01
      00003A 88 0B                  264 	mov	_step+0, a
                                    265 ;	main.c: 125: volatile Patterns state = OFF;
      00003C 09 13                  266 	clear	_state+0
                                    267 ;	main.c: 131: volatile uint8_t bytes = LED_COUNT * 3;
      00003E 0C 2F                  268 	mov	a, #0x0c
      000040 9A 0B                  269 	mov	_bytes+0, a
                                    270 ;	main.c: 132: volatile uint8_t byte_t = 0;
      000042 1B 13                  271 	clear	_byte_t+0
                                    272 ;	main.c: 133: volatile uint8_t byte_ctr = 0;
      000044 1C 13                  273 	clear	_byte_ctr+0
                                    274 ;	main.c: 136: volatile uint8_t r_step = 0;
      000046 1D 13                  275 	clear	_r_step+0
                                    276 ;	main.c: 137: volatile uint8_t g_step = 0;
      000048 1E 13                  277 	clear	_g_step+0
                                    278 ;	main.c: 138: volatile uint8_t b_step = 0;
      00004A 1F 13                  279 	clear	_b_step+0
                                    280 ;	main.c: 140: volatile uint8_t button_ctr = 0;
      00004C 20 13                  281 	clear	_button_ctr+0
                                    282 ;	main.c: 141: volatile uint8_t button_down = 0;
      00004E 21 13                  283 	clear	_button_down+0
                                    284 ;	main.c: 143: volatile uint16_t led_update_delay_ms_cnt = 0;
      000050 22 13                  285 	clear	_led_update_delay_ms_cnt+0
      000052 23 13                  286 	clear	_led_update_delay_ms_cnt+1
                                    287 ;	main.c: 144: volatile uint16_t state_update_delay_ms_cnt = 0;
      000054 24 13                  288 	clear	_state_update_delay_ms_cnt+0
      000056 25 13                  289 	clear	_state_update_delay_ms_cnt+1
                                    290 ;	main.c: 146: volatile uint16_t touch_base = 0;
      000058 26 13                  291 	clear	_touch_base+0
      00005A 27 13                  292 	clear	_touch_base+1
                                    293 ;	main.c: 147: volatile uint16_t last_touch = 0;
      00005C 28 13                  294 	clear	_last_touch+0
      00005E 29 13                  295 	clear	_last_touch+1
                                    296 ;	main.c: 148: volatile uint8_t resample_count = 0;
      000060 2A 13                  297 	clear	_resample_count+0
                                    298 	.area GSFINAL
      000062 11 30                  299 	goto	__sdcc_program_startup
                                    300 ;--------------------------------------------------------
                                    301 ; Home
                                    302 ;--------------------------------------------------------
                                    303 	.area HOME
                                    304 	.area HOME
      000022                        305 __sdcc_program_startup:
      000022 06 32                  306 	goto	_main
                                    307 ;	return from main will return to caller
                                    308 ;--------------------------------------------------------
                                    309 ; code
                                    310 ;--------------------------------------------------------
                                    311 	.area CODE
                                    312 ;	main.c: 150: void touch_init()
                                    313 ;	-----------------------------------------
                                    314 ;	 function touch_init
                                    315 ;	-----------------------------------------
      000064                        316 _touch_init:
                                    317 ;	main.c: 153: TS = TS_TP_CLK_IHRC_DIV2 | TS_TP_VREF_VCC05 | TS_DISCHARGE_WAIT_128CLOCKS;
      000064 13 2F                  318 	mov	a, #0x13
      000066 A0 01                  319 	mov.io	__ts, a
                                    320 ;	main.c: 154: TPS2 = TPS2_TOUCH_TYPE_B | TPS2_VREFNONFLOAT_ALWAYS_ON;
      000068 41 2F                  321 	mov	a, #0x41
      00006A A8 01                  322 	mov.io	__tps2, a
                                    323 ;	main.c: 155: PAC &= ~(BTN_bm);            // Pin 4 as in
      00006C 11 1D                  324 	set0.io	__pac, #4
                                    325 ;	main.c: 156: PADIER &= ~(BTN_bm | CS_bm); // Disable digital input for touch and CS pins
      00006E CD 01                  326 	mov.io	a, __padier
      000070 6F 2C                  327 	and	a, #0x6f
      000072 8D 01                  328 	mov.io	__padier, a
                                    329 ;	main.c: 157: }
      000074 7A 00                  330 	ret
                                    331 ;	main.c: 159: void sys_clk_init()
                                    332 ;	-----------------------------------------
                                    333 ;	 function sys_clk_init
                                    334 ;	-----------------------------------------
      000076                        335 _sys_clk_init:
                                    336 ;	main.c: 162: CLKMD = CLKMD_ENABLE_IHRC | CLKMD_IHRC_DIV2 | CLKMD_ENABLE_ILRC; // First enable IHRC
      000076 34 2F                  337 	mov	a, #0x34
      000078 83 01                  338 	mov.io	__clkmd, a
                                    339 ;	main.c: 163: }
      00007A 7A 00                  340 	ret
                                    341 ;	main.c: 165: void led_init()
                                    342 ;	-----------------------------------------
                                    343 ;	 function led_init
                                    344 ;	-----------------------------------------
      00007C                        345 _led_init:
                                    346 ;	main.c: 168: PAC |= LED_bm;
      00007C 51 1F                  347 	set1.io	__pac, #5
                                    348 ;	main.c: 169: }
      00007E 7A 00                  349 	ret
                                    350 ;	main.c: 171: void timer_init()
                                    351 ;	-----------------------------------------
                                    352 ;	 function timer_init
                                    353 ;	-----------------------------------------
      000080                        354 _timer_init:
                                    355 ;	main.c: 173: TM2B = 0xFF; // Max bound for 8-bit timer
      000080 FF 2F                  356 	mov	a, #0xff
      000082 9F 01                  357 	mov.io	__tm2b, a
                                    358 ;	main.c: 174: TM2C = TM2C_CLK_ILRC | TM2C_OUT_DISABLE | TM2C_MODE_PERIOD;
      000084 40 2F                  359 	mov	a, #0x40
      000086 9C 01                  360 	mov.io	__tm2c, a
                                    361 ;	main.c: 175: TM2S = TM2S_PRESCALE_DIV64; // Should be 1ms, and start
      000088 60 2F                  362 	mov	a, #0x60
      00008A 9E 01                  363 	mov.io	__tm2s, a
                                    364 ;	main.c: 176: }
      00008C 7A 00                  365 	ret
                                    366 ;	main.c: 178: void output_leds()
                                    367 ;	-----------------------------------------
                                    368 ;	 function output_leds
                                    369 ;	-----------------------------------------
      00008E                        370 _output_leds:
                                    371 ;	main.c: 180: __asm__("    mov a, _bytes              ;move our byte count into a");
      00008E 9A 0F                  372 	mov	a, _bytes              ;move our byte count into a
                                    373 ;	main.c: 181: __asm__("    mov _byte_ctr, a           ;move a into our index counter");
      000090 9C 0B                  374 	mov	_byte_ctr, a           ;move a into our index counter
                                    375 ;	main.c: 182: __asm__("    mov	a, #(_pixel_buff)   ;load the address of the array into a");
      000092 0A 2F                  376 	mov	a, #(_pixel_buff)   ;load the address of the array into a
                                    377 ;	main.c: 183: __asm__("    mov	p, a                ;put that address into p (a mem location)");
      000094 80 0B                  378 	mov	p, a                ;put that address into p (a mem location)
                                    379 ;	main.c: 184: __asm__("00010$:");
      000096                        380 	00010$:
                                    381 ;	main.c: 185: __asm__("    idxm	a, p                ;load the byte data from the array into a");
      000096 81 03                  382 	idxm	a, p                ;load the byte data from the array into a
                                    383 ;	main.c: 186: __asm__("    inc p                      ;inc p to the next address");
      000098 00 12                  384 	inc	p                      ;inc p to the next address
                                    385 ;	main.c: 187: __asm__("    mov	_byte_t, a          ;load the byte data into byte_t");
      00009A 9B 0B                  386 	mov	_byte_t, a          ;load the byte data into byte_t
                                    387 ;	main.c: 188: __asm__("    mov a, #0x08               ;reset the bit count");
      00009C 08 2F                  388 	mov	a, #0x08               ;reset the bit count
                                    389 ;	main.c: 189: __asm__("00011$:");
      00009E                        390 	00011$:
                                    391 ;	main.c: 190: __asm__("    ;output bit");
                                    392 ;output	bit
                                    393 ;	main.c: 191: __asm__("    set1.io __pa, #5           ;set the output pin high");
      00009E 50 1F                  394 	set1.io	__pa, #5           ;set the output pin high
                                    395 ;	main.c: 192: __asm__("    t1sn _byte_t, #7           ;if the current MSB is 1, skip setting the pin low now");
      0000A0 DB 23                  396 	t1sn	_byte_t, #7           ;if the current MSB is 1, skip setting the pin low now
                                    397 ;	main.c: 193: __asm__("    set0.io __pa, #5           ;set the output pin low");
      0000A2 50 1D                  398 	set0.io	__pa, #5           ;set the output pin low
                                    399 ;	main.c: 194: __asm__("    nop                        ;wait one cycle");
      0000A4 00 00                  400 	nop	                       ;wait one cycle
                                    401 ;	main.c: 195: __asm__("    set0.io __pa, #5           ;set the output pin low");
      0000A6 50 1D                  402 	set0.io	__pa, #5           ;set the output pin low
                                    403 ;	main.c: 196: __asm__("    sl _byte_t                 ;left-shift the data byte (the LEDs are MSB first)");
      0000A8 9B 15                  404 	sl	_byte_t                 ;left-shift the data byte (the LEDs are MSB first)
                                    405 ;	main.c: 197: __asm__("    dzsn a                     ;dec a and skip next instruction if 0");
      0000AA 63 00                  406 	dzsn	a                     ;dec a and skip next instruction if 0
                                    407 ;	main.c: 198: __asm__("    goto 00011$                ;jump back to 00011");
      0000AC 4F 30                  408 	goto	00011$                ;jump back to 00011
                                    409 ;	main.c: 199: __asm__("    dzsn _byte_ctr             ;dec our index counter and skip the goto if 0");
      0000AE 9C 11                  410 	dzsn	_byte_ctr             ;dec our index counter and skip the goto if 0
                                    411 ;	main.c: 200: __asm__("    goto	00010$              ;goto the next byte");
      0000B0 4B 30                  412 	goto	00010$              ;goto the next byte
                                    413 ;	main.c: 201: }
      0000B2 7A 00                  414 	ret
                                    415 ;	main.c: 203: uint16_t read_touch_raw()
                                    416 ;	-----------------------------------------
                                    417 ;	 function read_touch_raw
                                    418 ;	-----------------------------------------
      0000B4                        419 _read_touch_raw:
                                    420 ;	main.c: 206: TKE1 = TKE1_TK6_PA4; // Use PA4 as touch input
      0000B4 40 2F                  421 	mov	a, #0x40
      0000B6 A4 01                  422 	mov.io	__tke1, a
                                    423 ;	main.c: 207: TKE2 = 0;            // Disable other channels
      0000B8 00 2F                  424 	mov	a, #0x00
      0000BA A2 01                  425 	mov.io	__tke2, a
                                    426 ;	main.c: 208: TCC = TCC_TK_RUN;
      0000BC 10 2F                  427 	mov	a, #0x10
      0000BE A1 01                  428 	mov.io	__tcc, a
                                    429 ;	main.c: 210: while (TCC & TCC_TK_RUN)
      0000C0                        430 00101$:
      0000C0 21 19                  431 	t0sn.io	__tcc, #4
      0000C2 60 30                  432 	goto	00101$
      0000C4                        433 00118$:
                                    434 ;	main.c: 213: return (TKCH << 8) | TKCL;
      0000C4 EB 01                  435 	mov.io	a, __tkch
      0000C6 80 0B                  436 	mov	p, a
      0000C8 EC 01                  437 	mov.io	a, __tkcl
                                    438 ;	main.c: 214: }
      0000CA 7A 00                  439 	ret
                                    440 ;	main.c: 216: void state_check()
                                    441 ;	-----------------------------------------
                                    442 ;	 function state_check
                                    443 ;	-----------------------------------------
      0000CC                        444 _state_check:
                                    445 ;	main.c: 218: switch (step)
      0000CC 88 0F                  446 	mov	a, _step+0
      0000CE 08 2A                  447 	ceqsn	a, #0x08
      0000D0 40 1A                  448 	t1sn.io	f, c
      0000D2                        449 00119$:
      0000D2 74 30                  450 	goto	00102$
      0000D4                        451 00120$:
      0000D4 01 28                  452 	add	a, #0x01
      0000D6 67 00                  453 	pcadd	a
      0000D8 74 30                  454 	goto	#00102$
      0000DA A2 30                  455 	goto	#00103$
      0000DC D5 30                  456 	goto	#00104$
      0000DE DB 30                  457 	goto	#00105$
      0000E0 ED 30                  458 	goto	#00106$
      0000E2 FF 30                  459 	goto	#00107$
      0000E4 05 31                  460 	goto	#00108$
      0000E6 17 31                  461 	goto	#00109$
                                    462 ;	main.c: 221: case NONE:
      0000E8                        463 00102$:
                                    464 ;	main.c: 222: pixel_buff[0] = off_color;
      0000E8 0A 2F                  465 	mov	a, #(_pixel_buff + 0)
      0000EA B4 0B                  466 	mov	___memcpy_PARM_1+0, a
      0000EC 35 13                  467 	clear	___memcpy_PARM_1+1
      0000EE 5D 2F                  468 	mov	a, #<(_off_color + 0)
      0000F0 B6 0B                  469 	mov	___memcpy_PARM_2+0, a
      0000F2 82 2F                  470 	mov	a, #>(_off_color + 0x8000 + 0)
      0000F4 B7 0B                  471 	mov	___memcpy_PARM_2+1, a
      0000F6 03 2F                  472 	mov	a, #0x03
      0000F8 B8 0B                  473 	mov	___memcpy_PARM_3+0, a
      0000FA 39 13                  474 	clear	___memcpy_PARM_3+1
      0000FC 1B 3A                  475 	call	___memcpy
                                    476 ;	main.c: 223: pixel_buff[1] = off_color;
      0000FE 0D 2F                  477 	mov	a, #(_pixel_buff + 3)
      000100 B4 0B                  478 	mov	___memcpy_PARM_1+0, a
      000102 35 13                  479 	clear	___memcpy_PARM_1+1
      000104 5D 2F                  480 	mov	a, #<(_off_color + 0)
      000106 B6 0B                  481 	mov	___memcpy_PARM_2+0, a
      000108 82 2F                  482 	mov	a, #>(_off_color + 0x8000 + 0)
      00010A B7 0B                  483 	mov	___memcpy_PARM_2+1, a
      00010C 03 2F                  484 	mov	a, #0x03
      00010E B8 0B                  485 	mov	___memcpy_PARM_3+0, a
      000110 39 13                  486 	clear	___memcpy_PARM_3+1
      000112 1B 3A                  487 	call	___memcpy
                                    488 ;	main.c: 224: pixel_buff[2] = off_color;
      000114 10 2F                  489 	mov	a, #(_pixel_buff + 6)
      000116 B4 0B                  490 	mov	___memcpy_PARM_1+0, a
      000118 35 13                  491 	clear	___memcpy_PARM_1+1
      00011A 5D 2F                  492 	mov	a, #<(_off_color + 0)
      00011C B6 0B                  493 	mov	___memcpy_PARM_2+0, a
      00011E 82 2F                  494 	mov	a, #>(_off_color + 0x8000 + 0)
      000120 B7 0B                  495 	mov	___memcpy_PARM_2+1, a
      000122 03 2F                  496 	mov	a, #0x03
      000124 B8 0B                  497 	mov	___memcpy_PARM_3+0, a
      000126 39 13                  498 	clear	___memcpy_PARM_3+1
      000128 1B 3A                  499 	call	___memcpy
                                    500 ;	main.c: 225: pixel_buff[3] = off_color;
      00012A 13 2F                  501 	mov	a, #(_pixel_buff + 9)
      00012C B4 0B                  502 	mov	___memcpy_PARM_1+0, a
      00012E 35 13                  503 	clear	___memcpy_PARM_1+1
      000130 5D 2F                  504 	mov	a, #<(_off_color + 0)
      000132 B6 0B                  505 	mov	___memcpy_PARM_2+0, a
      000134 82 2F                  506 	mov	a, #>(_off_color + 0x8000 + 0)
      000136 B7 0B                  507 	mov	___memcpy_PARM_2+1, a
      000138 03 2F                  508 	mov	a, #0x03
      00013A B8 0B                  509 	mov	___memcpy_PARM_3+0, a
      00013C 39 13                  510 	clear	___memcpy_PARM_3+1
      00013E 1B 3A                  511 	call	___memcpy
                                    512 ;	main.c: 226: output_leds();
      000140 47 30                  513 	goto	_output_leds
                                    514 ;	main.c: 227: break;
      000142 7A 00                  515 	ret
                                    516 ;	main.c: 228: case STEP_1:
      000144                        517 00103$:
                                    518 ;	main.c: 229: pixel_buff[3] = highlight_color;
      000144 13 2F                  519 	mov	a, #(_pixel_buff + 9)
      000146 B4 0B                  520 	mov	___memcpy_PARM_1+0, a
      000148 35 13                  521 	clear	___memcpy_PARM_1+1
      00014A 05 2F                  522 	mov	a, #(_highlight_color + 0)
      00014C B6 0B                  523 	mov	___memcpy_PARM_2+0, a
      00014E 37 13                  524 	clear	___memcpy_PARM_2+1
      000150 03 2F                  525 	mov	a, #0x03
      000152 B8 0B                  526 	mov	___memcpy_PARM_3+0, a
      000154 39 13                  527 	clear	___memcpy_PARM_3+1
      000156 1B 3A                  528 	call	___memcpy
                                    529 ;	main.c: 230: pixel_buff[2] = base_color;
      000158 10 2F                  530 	mov	a, #(_pixel_buff + 6)
      00015A B4 0B                  531 	mov	___memcpy_PARM_1+0, a
      00015C 35 13                  532 	clear	___memcpy_PARM_1+1
      00015E 02 2F                  533 	mov	a, #(_base_color + 0)
      000160 B6 0B                  534 	mov	___memcpy_PARM_2+0, a
      000162 37 13                  535 	clear	___memcpy_PARM_2+1
      000164 03 2F                  536 	mov	a, #0x03
      000166 B8 0B                  537 	mov	___memcpy_PARM_3+0, a
      000168 39 13                  538 	clear	___memcpy_PARM_3+1
      00016A 1B 3A                  539 	call	___memcpy
                                    540 ;	main.c: 231: pixel_buff[1] = base_color;
      00016C 0D 2F                  541 	mov	a, #(_pixel_buff + 3)
      00016E B4 0B                  542 	mov	___memcpy_PARM_1+0, a
      000170 35 13                  543 	clear	___memcpy_PARM_1+1
      000172 02 2F                  544 	mov	a, #(_base_color + 0)
      000174 B6 0B                  545 	mov	___memcpy_PARM_2+0, a
      000176 37 13                  546 	clear	___memcpy_PARM_2+1
      000178 03 2F                  547 	mov	a, #0x03
      00017A B8 0B                  548 	mov	___memcpy_PARM_3+0, a
      00017C 39 13                  549 	clear	___memcpy_PARM_3+1
      00017E 1B 3A                  550 	call	___memcpy
                                    551 ;	main.c: 232: pixel_buff[0] = base_color;
      000180 0A 2F                  552 	mov	a, #(_pixel_buff + 0)
      000182 B4 0B                  553 	mov	___memcpy_PARM_1+0, a
      000184 35 13                  554 	clear	___memcpy_PARM_1+1
      000186 02 2F                  555 	mov	a, #(_base_color + 0)
      000188 B6 0B                  556 	mov	___memcpy_PARM_2+0, a
      00018A 37 13                  557 	clear	___memcpy_PARM_2+1
      00018C 03 2F                  558 	mov	a, #0x03
      00018E B8 0B                  559 	mov	___memcpy_PARM_3+0, a
      000190 39 13                  560 	clear	___memcpy_PARM_3+1
      000192 1B 3A                  561 	call	___memcpy
                                    562 ;	main.c: 233: fades[3] = FADE_STEPS;
      000194 08 2F                  563 	mov	a, #0x08
      000196 99 0B                  564 	mov	_fades+3, a
                                    565 ;	main.c: 234: fades[2] = 0;
      000198 18 13                  566 	clear	_fades+2
                                    567 ;	main.c: 235: fades[1] = 0;
      00019A 17 13                  568 	clear	_fades+1
                                    569 ;	main.c: 236: fades[0] = 0;
      00019C 16 13                  570 	clear	_fades+0
                                    571 ;	main.c: 237: state_update_delay_ms_cnt = STATE_1_DELAY_ms;
      00019E C8 2F                  572 	mov	a, #0xc8
      0001A0 A4 0B                  573 	mov	_state_update_delay_ms_cnt+0, a
      0001A2 25 13                  574 	clear	_state_update_delay_ms_cnt+1
                                    575 ;	main.c: 238: step = STEP_2;
      0001A4 02 2F                  576 	mov	a, #0x02
      0001A6 88 0B                  577 	mov	_step+0, a
                                    578 ;	main.c: 239: break;
      0001A8 7A 00                  579 	ret
                                    580 ;	main.c: 241: case STEP_2:
      0001AA                        581 00104$:
                                    582 ;	main.c: 242: state_update_delay_ms_cnt = STATE_2_DELAY_ms;
      0001AA 64 2F                  583 	mov	a, #0x64
      0001AC A4 0B                  584 	mov	_state_update_delay_ms_cnt+0, a
      0001AE 25 13                  585 	clear	_state_update_delay_ms_cnt+1
                                    586 ;	main.c: 243: step = STEP_3;
      0001B0 03 2F                  587 	mov	a, #0x03
      0001B2 88 0B                  588 	mov	_step+0, a
                                    589 ;	main.c: 244: break;
      0001B4 7A 00                  590 	ret
                                    591 ;	main.c: 245: case STEP_3:
      0001B6                        592 00105$:
                                    593 ;	main.c: 246: pixel_buff[2] = highlight_color;
      0001B6 10 2F                  594 	mov	a, #(_pixel_buff + 6)
      0001B8 B4 0B                  595 	mov	___memcpy_PARM_1+0, a
      0001BA 35 13                  596 	clear	___memcpy_PARM_1+1
      0001BC 05 2F                  597 	mov	a, #(_highlight_color + 0)
      0001BE B6 0B                  598 	mov	___memcpy_PARM_2+0, a
      0001C0 37 13                  599 	clear	___memcpy_PARM_2+1
      0001C2 03 2F                  600 	mov	a, #0x03
      0001C4 B8 0B                  601 	mov	___memcpy_PARM_3+0, a
      0001C6 39 13                  602 	clear	___memcpy_PARM_3+1
      0001C8 1B 3A                  603 	call	___memcpy
                                    604 ;	main.c: 247: fades[2] = FADE_STEPS;
      0001CA 08 2F                  605 	mov	a, #0x08
      0001CC 98 0B                  606 	mov	_fades+2, a
                                    607 ;	main.c: 248: state_update_delay_ms_cnt = STATE_3_DELAY_ms;
      0001CE 28 2F                  608 	mov	a, #0x28
      0001D0 A4 0B                  609 	mov	_state_update_delay_ms_cnt+0, a
      0001D2 25 13                  610 	clear	_state_update_delay_ms_cnt+1
                                    611 ;	main.c: 249: step = STEP_4;
      0001D4 04 2F                  612 	mov	a, #0x04
      0001D6 88 0B                  613 	mov	_step+0, a
                                    614 ;	main.c: 250: break;
      0001D8 7A 00                  615 	ret
                                    616 ;	main.c: 251: case STEP_4:
      0001DA                        617 00106$:
                                    618 ;	main.c: 252: pixel_buff[1] = highlight_color;
      0001DA 0D 2F                  619 	mov	a, #(_pixel_buff + 3)
      0001DC B4 0B                  620 	mov	___memcpy_PARM_1+0, a
      0001DE 35 13                  621 	clear	___memcpy_PARM_1+1
      0001E0 05 2F                  622 	mov	a, #(_highlight_color + 0)
      0001E2 B6 0B                  623 	mov	___memcpy_PARM_2+0, a
      0001E4 37 13                  624 	clear	___memcpy_PARM_2+1
      0001E6 03 2F                  625 	mov	a, #0x03
      0001E8 B8 0B                  626 	mov	___memcpy_PARM_3+0, a
      0001EA 39 13                  627 	clear	___memcpy_PARM_3+1
      0001EC 1B 3A                  628 	call	___memcpy
                                    629 ;	main.c: 253: fades[1] = FADE_STEPS;
      0001EE 08 2F                  630 	mov	a, #0x08
      0001F0 97 0B                  631 	mov	_fades+1, a
                                    632 ;	main.c: 254: state_update_delay_ms_cnt = STATE_4_DELAY_ms;
      0001F2 C8 2F                  633 	mov	a, #0xc8
      0001F4 A4 0B                  634 	mov	_state_update_delay_ms_cnt+0, a
      0001F6 25 13                  635 	clear	_state_update_delay_ms_cnt+1
                                    636 ;	main.c: 255: step = STEP_5;
      0001F8 05 2F                  637 	mov	a, #0x05
      0001FA 88 0B                  638 	mov	_step+0, a
                                    639 ;	main.c: 256: break;
      0001FC 7A 00                  640 	ret
                                    641 ;	main.c: 257: case STEP_5:
      0001FE                        642 00107$:
                                    643 ;	main.c: 258: state_update_delay_ms_cnt = STATE_5_DELAY_ms;
      0001FE C8 2F                  644 	mov	a, #0xc8
      000200 A4 0B                  645 	mov	_state_update_delay_ms_cnt+0, a
      000202 25 13                  646 	clear	_state_update_delay_ms_cnt+1
                                    647 ;	main.c: 259: step = STEP_6;
      000204 06 2F                  648 	mov	a, #0x06
      000206 88 0B                  649 	mov	_step+0, a
                                    650 ;	main.c: 260: break;
      000208 7A 00                  651 	ret
                                    652 ;	main.c: 261: case STEP_6:
      00020A                        653 00108$:
                                    654 ;	main.c: 262: pixel_buff[0] = highlight_color;
      00020A 0A 2F                  655 	mov	a, #(_pixel_buff + 0)
      00020C B4 0B                  656 	mov	___memcpy_PARM_1+0, a
      00020E 35 13                  657 	clear	___memcpy_PARM_1+1
      000210 05 2F                  658 	mov	a, #(_highlight_color + 0)
      000212 B6 0B                  659 	mov	___memcpy_PARM_2+0, a
      000214 37 13                  660 	clear	___memcpy_PARM_2+1
      000216 03 2F                  661 	mov	a, #0x03
      000218 B8 0B                  662 	mov	___memcpy_PARM_3+0, a
      00021A 39 13                  663 	clear	___memcpy_PARM_3+1
      00021C 1B 3A                  664 	call	___memcpy
                                    665 ;	main.c: 263: fades[0] = FADE_STEPS;
      00021E 08 2F                  666 	mov	a, #0x08
      000220 96 0B                  667 	mov	_fades+0, a
                                    668 ;	main.c: 264: state_update_delay_ms_cnt = STATE_6_DELAY_ms;
      000222 C8 2F                  669 	mov	a, #0xc8
      000224 A4 0B                  670 	mov	_state_update_delay_ms_cnt+0, a
      000226 25 13                  671 	clear	_state_update_delay_ms_cnt+1
                                    672 ;	main.c: 265: step = STEP_7;
      000228 07 2F                  673 	mov	a, #0x07
      00022A 88 0B                  674 	mov	_step+0, a
                                    675 ;	main.c: 266: break;
      00022C 7A 00                  676 	ret
                                    677 ;	main.c: 267: case STEP_7:
      00022E                        678 00109$:
                                    679 ;	main.c: 268: state_update_delay_ms_cnt = STATE_7_DELAY_ms;
      00022E E8 2F                  680 	mov	a, #0xe8
      000230 A4 0B                  681 	mov	_state_update_delay_ms_cnt+0, a
      000232 03 2F                  682 	mov	a, #0x03
      000234 A5 0B                  683 	mov	_state_update_delay_ms_cnt+1, a
                                    684 ;	main.c: 269: step = STEP_1;
      000236 01 2F                  685 	mov	a, #0x01
      000238 88 0B                  686 	mov	_step+0, a
                                    687 ;	main.c: 271: }
                                    688 ;	main.c: 272: }
      00023A 7A 00                  689 	ret
                                    690 ;	main.c: 274: void handle_state_update()
                                    691 ;	-----------------------------------------
                                    692 ;	 function handle_state_update
                                    693 ;	-----------------------------------------
      00023C                        694 _handle_state_update:
                                    695 ;	main.c: 277: switch (state)
      00023C 89 0F                  696 	mov	a, _state+0
      00023E 00 2B                  697 	cneqsn	a, #0x00
      000240 25 31                  698 	goto	00102$
      000242                        699 00121$:
      000242 01 2B                  700 	cneqsn	a, #0x01
      000244 29 31                  701 	goto	00103$
      000246                        702 00123$:
      000246 02 2B                  703 	cneqsn	a, #0x02
      000248 49 31                  704 	goto	00104$
      00024A                        705 00125$:
                                    706 ;	main.c: 280: case OFF:
      00024A                        707 00102$:
                                    708 ;	main.c: 281: step = NONE;
      00024A 08 13                  709 	clear	_step+0
                                    710 ;	main.c: 282: state = BLUE;
      00024C 01 2F                  711 	mov	a, #0x01
      00024E 89 0B                  712 	mov	_state+0, a
                                    713 ;	main.c: 283: break;
      000250 7A 00                  714 	ret
                                    715 ;	main.c: 284: case BLUE:
      000252                        716 00103$:
                                    717 ;	main.c: 285: r_step = BLUE_R_STEP;
                                    718 ;	main.c: 286: g_step = BLUE_G_STEP;
      000252 02 2F                  719 	mov a, #0x02
      000254 9D 0B                  720 	mov  _r_step+0, a
      000256 9E 0B                  721 	mov	_g_step+0, a
                                    722 ;	main.c: 287: b_step = BLUE_B_STEP;
      000258 08 2F                  723 	mov	a, #0x08
      00025A 9F 0B                  724 	mov	_b_step+0, a
                                    725 ;	main.c: 288: highlight_color = blue_highlight_color;
      00025C 05 2F                  726 	mov	a, #(_highlight_color + 0)
      00025E B4 0B                  727 	mov	___memcpy_PARM_1+0, a
      000260 35 13                  728 	clear	___memcpy_PARM_1+1
      000262 5A 2F                  729 	mov	a, #<(_blue_highlight_color + 0)
      000264 B6 0B                  730 	mov	___memcpy_PARM_2+0, a
      000266 82 2F                  731 	mov	a, #>(_blue_highlight_color + 0x8000 + 0)
      000268 B7 0B                  732 	mov	___memcpy_PARM_2+1, a
      00026A 03 2F                  733 	mov	a, #0x03
      00026C B8 0B                  734 	mov	___memcpy_PARM_3+0, a
      00026E 39 13                  735 	clear	___memcpy_PARM_3+1
      000270 1B 3A                  736 	call	___memcpy
                                    737 ;	main.c: 289: base_color = blue_base_color;
      000272 02 2F                  738 	mov	a, #(_base_color + 0)
      000274 B4 0B                  739 	mov	___memcpy_PARM_1+0, a
      000276 35 13                  740 	clear	___memcpy_PARM_1+1
      000278 57 2F                  741 	mov	a, #<(_blue_base_color + 0)
      00027A B6 0B                  742 	mov	___memcpy_PARM_2+0, a
      00027C 82 2F                  743 	mov	a, #>(_blue_base_color + 0x8000 + 0)
      00027E B7 0B                  744 	mov	___memcpy_PARM_2+1, a
      000280 03 2F                  745 	mov	a, #0x03
      000282 B8 0B                  746 	mov	___memcpy_PARM_3+0, a
      000284 39 13                  747 	clear	___memcpy_PARM_3+1
      000286 1B 3A                  748 	call	___memcpy
                                    749 ;	main.c: 290: step = STEP_1;
      000288 01 2F                  750 	mov	a, #0x01
      00028A 88 0B                  751 	mov	_step+0, a
                                    752 ;	main.c: 291: state = ORANGE;
      00028C 02 2F                  753 	mov	a, #0x02
      00028E 89 0B                  754 	mov	_state+0, a
                                    755 ;	main.c: 292: break;
      000290 7A 00                  756 	ret
                                    757 ;	main.c: 293: case ORANGE:
      000292                        758 00104$:
                                    759 ;	main.c: 294: r_step = ORANGE_R_STEP;
      000292 0A 2F                  760 	mov	a, #0x0a
      000294 9D 0B                  761 	mov	_r_step+0, a
                                    762 ;	main.c: 295: g_step = ORANGE_G_STEP;
      000296 04 2F                  763 	mov	a, #0x04
      000298 9E 0B                  764 	mov	_g_step+0, a
                                    765 ;	main.c: 296: b_step = ORANGE_B_STEP;
      00029A 02 2F                  766 	mov	a, #0x02
      00029C 9F 0B                  767 	mov	_b_step+0, a
                                    768 ;	main.c: 297: highlight_color = orange_highlight_color;
      00029E 05 2F                  769 	mov	a, #(_highlight_color + 0)
      0002A0 B4 0B                  770 	mov	___memcpy_PARM_1+0, a
      0002A2 35 13                  771 	clear	___memcpy_PARM_1+1
      0002A4 54 2F                  772 	mov	a, #<(_orange_highlight_color + 0)
      0002A6 B6 0B                  773 	mov	___memcpy_PARM_2+0, a
      0002A8 82 2F                  774 	mov	a, #>(_orange_highlight_color + 0x8000 + 0)
      0002AA B7 0B                  775 	mov	___memcpy_PARM_2+1, a
      0002AC 03 2F                  776 	mov	a, #0x03
      0002AE B8 0B                  777 	mov	___memcpy_PARM_3+0, a
      0002B0 39 13                  778 	clear	___memcpy_PARM_3+1
      0002B2 1B 3A                  779 	call	___memcpy
                                    780 ;	main.c: 298: base_color = orange_base_color;
      0002B4 02 2F                  781 	mov	a, #(_base_color + 0)
      0002B6 B4 0B                  782 	mov	___memcpy_PARM_1+0, a
      0002B8 35 13                  783 	clear	___memcpy_PARM_1+1
      0002BA 51 2F                  784 	mov	a, #<(_orange_base_color + 0)
      0002BC B6 0B                  785 	mov	___memcpy_PARM_2+0, a
      0002BE 82 2F                  786 	mov	a, #>(_orange_base_color + 0x8000 + 0)
      0002C0 B7 0B                  787 	mov	___memcpy_PARM_2+1, a
      0002C2 03 2F                  788 	mov	a, #0x03
      0002C4 B8 0B                  789 	mov	___memcpy_PARM_3+0, a
      0002C6 39 13                  790 	clear	___memcpy_PARM_3+1
      0002C8 1B 3A                  791 	call	___memcpy
                                    792 ;	main.c: 299: step = STEP_1;
      0002CA 01 2F                  793 	mov	a, #0x01
      0002CC 88 0B                  794 	mov	_step+0, a
                                    795 ;	main.c: 300: state = OFF;
      0002CE 09 13                  796 	clear	_state+0
                                    797 ;	main.c: 302: }
                                    798 ;	main.c: 303: }
      0002D0 7A 00                  799 	ret
                                    800 ;	main.c: 305: void button_check()
                                    801 ;	-----------------------------------------
                                    802 ;	 function button_check
                                    803 ;	-----------------------------------------
      0002D2                        804 _button_check:
                                    805 ;	main.c: 307: uint16_t touch_value = read_touch_raw();
      0002D2 5A 38                  806 	call	_read_touch_raw
      0002D4 AB 0B                  807 	mov	_button_check_sloc0_1_0+0, a
      0002D6 80 0F                  808 	mov	a, p
      0002D8 AC 0B                  809 	mov	_button_check_sloc0_1_0+1, a
                                    810 ;	main.c: 309: if (touch_value == last_touch)
      0002DA AB 0F                  811 	mov	a, _button_check_sloc0_1_0+0
      0002DC 28 17                  812 	ceqsn	a, _last_touch+0
      0002DE 77 31                  813 	goto	00102$
      0002E0                        814 00137$:
      0002E0 AC 0F                  815 	mov	a, _button_check_sloc0_1_0+1
      0002E2 29 17                  816 	ceqsn	a, _last_touch+1
      0002E4 77 31                  817 	goto	00102$
      0002E6                        818 00138$:
                                    819 ;	main.c: 311: resample_count++;
      0002E6 AA 0F                  820 	mov	a, _resample_count+0
      0002E8 01 28                  821 	add	a, #0x01
      0002EA AA 0B                  822 	mov	_resample_count+0, a
      0002EC 7C 31                  823 	goto	00103$
      0002EE                        824 00102$:
                                    825 ;	main.c: 315: resample_count = 0;
      0002EE 2A 13                  826 	clear	_resample_count+0
                                    827 ;	main.c: 316: last_touch = touch_value;
      0002F0 AB 0F                  828 	mov	a, _button_check_sloc0_1_0+0
      0002F2 A8 0B                  829 	mov	_last_touch+0, a
      0002F4 AC 0F                  830 	mov	a, _button_check_sloc0_1_0+1
      0002F6 A9 0B                  831 	mov	_last_touch+1, a
      0002F8                        832 00103$:
                                    833 ;	main.c: 319: if (resample_count >= RESAMPLE_BASE_COUNT)
      0002F8 AA 0F                  834 	mov	a, _resample_count+0
      0002FA 64 29                  835 	sub	a, #0x64
      0002FC 40 18                  836 	t0sn.io	f, c
      0002FE 85 31                  837 	goto	00105$
      000300                        838 00139$:
                                    839 ;	main.c: 321: touch_base = touch_value;
      000300 AB 0F                  840 	mov	a, _button_check_sloc0_1_0+0
      000302 A6 0B                  841 	mov	_touch_base+0, a
      000304 AC 0F                  842 	mov	a, _button_check_sloc0_1_0+1
      000306 A7 0B                  843 	mov	_touch_base+1, a
                                    844 ;	main.c: 322: resample_count = 0;
      000308 2A 13                  845 	clear	_resample_count+0
      00030A                        846 00105$:
                                    847 ;	main.c: 329: if (touch_value < touch_base - TOUCH_THRESHOLD)
      00030A A6 0F                  848 	mov	a, _touch_base+0
      00030C 05 29                  849 	sub	a, #0x05
      00030E AD 0B                  850 	mov	_button_check_sloc1_1_0+0, a
      000310 A7 0F                  851 	mov	a, _touch_base+1
      000312 61 00                  852 	subc	a
      000314 AE 0B                  853 	mov	_button_check_sloc1_1_0+1, a
      000316 AC 0F                  854 	mov	a, _button_check_sloc0_1_0+1
      000318 80 0B                  855 	mov	p, a
      00031A AB 0F                  856 	mov	a, _button_check_sloc0_1_0+0
      00031C AD 0C                  857 	sub	a, _button_check_sloc1_1_0+0
      00031E 80 0F                  858 	mov	a, p
      000320 AE 0D                  859 	subc	a, _button_check_sloc1_1_0+1
      000322 40 1A                  860 	t1sn.io	f, c
      000324 9B 31                  861 	goto	00109$
      000326                        862 00140$:
                                    863 ;	main.c: 332: if (!button_down)
      000326 A1 0F                  864 	mov	a, _button_down+0
      000328 00 2A                  865 	ceqsn	a, #0x00
      00032A 7A 00                  866 	ret
      00032C                        867 00141$:
                                    868 ;	main.c: 334: button_down = 1;
      00032C 01 2F                  869 	mov	a, #0x01
      00032E A1 0B                  870 	mov	_button_down+0, a
                                    871 ;	main.c: 335: handle_state_update();
      000330 1E 39                  872 	call	_handle_state_update
                                    873 ;	main.c: 336: state_check();
      000332 66 30                  874 	goto	_state_check
      000334 7A 00                  875 	ret
      000336                        876 00109$:
                                    877 ;	main.c: 342: button_down = 0;
      000336 21 13                  878 	clear	_button_down+0
                                    879 ;	main.c: 344: }
      000338 7A 00                  880 	ret
                                    881 ;	main.c: 346: void handle_tick()
                                    882 ;	-----------------------------------------
                                    883 ;	 function handle_tick
                                    884 ;	-----------------------------------------
      00033A                        885 _handle_tick:
                                    886 ;	main.c: 348: button_check();
      00033A 69 39                  887 	call	_button_check
                                    888 ;	main.c: 350: if (state_update_delay_ms_cnt >= GLOBAL_TICK_ms && step != NONE)
      00033C A5 0F                  889 	mov	a, _state_update_delay_ms_cnt+1
      00033E 80 0B                  890 	mov	p, a
      000340 A4 0F                  891 	mov	a, _state_update_delay_ms_cnt+0
      000342 0A 29                  892 	sub	a, #0x0a
      000344 80 0F                  893 	mov	a, p
      000346 61 00                  894 	subc	a
      000348 40 18                  895 	t0sn.io	f, c
      00034A 04 32                  896 	goto	00107$
      00034C                        897 00151$:
      00034C 88 0F                  898 	mov	a, _step+0
      00034E 00 2B                  899 	cneqsn	a, #0x00
      000350 04 32                  900 	goto	00107$
      000352                        901 00152$:
                                    902 ;	main.c: 352: state_update_delay_ms_cnt -= GLOBAL_TICK_ms;
      000352 A4 0F                  903 	mov	a, _state_update_delay_ms_cnt+0
      000354 0A 29                  904 	sub	a, #0x0a
      000356 80 0B                  905 	mov	p, a
      000358 A5 0F                  906 	mov	a, _state_update_delay_ms_cnt+1
      00035A 61 00                  907 	subc	a
      00035C A5 0B                  908 	mov	_state_update_delay_ms_cnt+1, a
      00035E 80 0F                  909 	mov	a, p
      000360 A4 0B                  910 	mov	_state_update_delay_ms_cnt+0, a
                                    911 ;	main.c: 354: if (led_update_delay_ms_cnt >= LED_UPDATE_DELAY_ms)
      000362 A3 0F                  912 	mov	a, _led_update_delay_ms_cnt+1
      000364 80 0B                  913 	mov	p, a
      000366 A2 0F                  914 	mov	a, _led_update_delay_ms_cnt+0
      000368 32 29                  915 	sub	a, #0x32
      00036A 80 0F                  916 	mov	a, p
      00036C 61 00                  917 	subc	a
      00036E 40 18                  918 	t0sn.io	f, c
      000370 FB 31                  919 	goto	00105$
      000372                        920 00153$:
                                    921 ;	main.c: 356: for (uint8_t i = 0; i < LED_COUNT; i++)
      000372 2F 13                  922 	clear	_handle_tick_sloc2_1_0+0
      000374                        923 00110$:
      000374 AF 0F                  924 	mov	a, _handle_tick_sloc2_1_0+0
      000376 04 29                  925 	sub	a, #0x04
      000378 40 1A                  926 	t1sn.io	f, c
      00037A F8 31                  927 	goto	00103$
      00037C                        928 00154$:
                                    929 ;	main.c: 358: if (fades[i] > 0)
      00037C 16 2F                  930 	mov	a, #(_fades + 0)
      00037E 2F 0C                  931 	add	a, _handle_tick_sloc2_1_0+0
      000380 80 0B                  932 	mov	p, a
      000382 81 03                  933 	idxm	a, p
      000384 00 2B                  934 	cneqsn	a, #0x00
      000386 F6 31                  935 	goto	00111$
      000388                        936 00155$:
                                    937 ;	main.c: 360: fades[i]--;
      000388 16 2F                  938 	mov	a, #(_fades + 0)
      00038A 2F 0C                  939 	add	a, _handle_tick_sloc2_1_0+0
      00038C 80 0B                  940 	mov	p, a
      00038E 81 03                  941 	idxm	a, p
      000390 01 29                  942 	sub	a, #0x01
      000392 80 03                  943 	idxm	p, a
                                    944 ;	main.c: 362: pixel_buff[i].r = (pixel_buff[i].r - r_step);
      000394 AF 0F                  945 	mov	a, _handle_tick_sloc2_1_0+0
      000396 6B 00                  946 	sl	a
      000398 2F 0C                  947 	add	a, _handle_tick_sloc2_1_0+0
      00039A B0 0B                  948 	mov	_handle_tick_sloc3_1_0+0, a
      00039C 0A 2F                  949 	mov	a, #(_pixel_buff + 0)
      00039E 30 0C                  950 	add	a, _handle_tick_sloc3_1_0+0
      0003A0 01 28                  951 	add	a, #0x01
      0003A2 B1 0B                  952 	mov	_handle_tick_sloc4_1_0+0, a
      0003A4 0A 2F                  953 	mov	a, #(_pixel_buff + 0)
      0003A6 30 0C                  954 	add	a, _handle_tick_sloc3_1_0+0
      0003A8 01 28                  955 	add	a, #0x01
      0003AA 80 0B                  956 	mov	p, a
      0003AC 81 03                  957 	idxm	a, p
      0003AE 9D 0C                  958 	sub	a, _r_step+0
      0003B0 80 0B                  959 	mov	p, a
      0003B2 B1 0F                  960 	mov	a, _handle_tick_sloc4_1_0+0
      0003B4 80 13                  961 	xch	a, p
      0003B6 80 03                  962 	idxm	p, a
                                    963 ;	main.c: 363: pixel_buff[i].g = (pixel_buff[i].g - g_step);
      0003B8 0A 2F                  964 	mov	a, #(_pixel_buff + 0)
      0003BA 30 0C                  965 	add	a, _handle_tick_sloc3_1_0+0
      0003BC B2 0B                  966 	mov	_handle_tick_sloc5_1_0+0, a
      0003BE 0A 2F                  967 	mov	a, #(_pixel_buff + 0)
      0003C0 30 0C                  968 	add	a, _handle_tick_sloc3_1_0+0
      0003C2 80 0B                  969 	mov	p, a
      0003C4 81 03                  970 	idxm	a, p
      0003C6 9E 0C                  971 	sub	a, _g_step+0
      0003C8 80 0B                  972 	mov	p, a
      0003CA B2 0F                  973 	mov	a, _handle_tick_sloc5_1_0+0
      0003CC 80 13                  974 	xch	a, p
      0003CE 80 03                  975 	idxm	p, a
                                    976 ;	main.c: 364: pixel_buff[i].b = (pixel_buff[i].b - b_step);
      0003D0 0A 2F                  977 	mov	a, #(_pixel_buff + 0)
      0003D2 30 0C                  978 	add	a, _handle_tick_sloc3_1_0+0
      0003D4 02 28                  979 	add	a, #0x02
      0003D6 B3 0B                  980 	mov	_handle_tick_sloc6_1_0+0, a
      0003D8 0A 2F                  981 	mov	a, #(_pixel_buff + 0)
      0003DA 30 0C                  982 	add	a, _handle_tick_sloc3_1_0+0
      0003DC 02 28                  983 	add	a, #0x02
      0003DE 80 0B                  984 	mov	p, a
      0003E0 81 03                  985 	idxm	a, p
      0003E2 9F 0C                  986 	sub	a, _b_step+0
      0003E4 80 0B                  987 	mov	p, a
      0003E6 B3 0F                  988 	mov	a, _handle_tick_sloc6_1_0+0
      0003E8 80 13                  989 	xch	a, p
      0003EA 80 03                  990 	idxm	p, a
      0003EC                        991 00111$:
                                    992 ;	main.c: 356: for (uint8_t i = 0; i < LED_COUNT; i++)
      0003EC 2F 12                  993 	inc	_handle_tick_sloc2_1_0+0
      0003EE BA 31                  994 	goto	00110$
      0003F0                        995 00103$:
                                    996 ;	main.c: 368: output_leds();
      0003F0 47 38                  997 	call	_output_leds
                                    998 ;	main.c: 369: led_update_delay_ms_cnt = 0;
      0003F2 22 13                  999 	clear	_led_update_delay_ms_cnt+0
      0003F4 23 13                 1000 	clear	_led_update_delay_ms_cnt+1
      0003F6                       1001 00105$:
                                   1002 ;	main.c: 372: led_update_delay_ms_cnt += GLOBAL_TICK_ms;
      0003F6 A2 0F                 1003 	mov	a, _led_update_delay_ms_cnt+0
      0003F8 0A 28                 1004 	add	a, #0x0a
      0003FA 80 0B                 1005 	mov	p, a
      0003FC A3 0F                 1006 	mov	a, _led_update_delay_ms_cnt+1
      0003FE 60 00                 1007 	addc	a
      000400 A3 0B                 1008 	mov	_led_update_delay_ms_cnt+1, a
      000402 80 0F                 1009 	mov	a, p
      000404 A2 0B                 1010 	mov	_led_update_delay_ms_cnt+0, a
                                   1011 ;	main.c: 374: return;
      000406 7A 00                 1012 	ret
      000408                       1013 00107$:
                                   1014 ;	main.c: 377: state_check();
      000408 66 30                 1015 	goto	_state_check
                                   1016 ;	main.c: 378: }
      00040A 7A 00                 1017 	ret
                                   1018 ;	main.c: 380: void main(void)
                                   1019 ;	-----------------------------------------
                                   1020 ;	 function main
                                   1021 ;	-----------------------------------------
      00040C                       1022 _main:
                                   1023 ;	main.c: 383: sys_clk_init();
      00040C 3B 38                 1024 	call	_sys_clk_init
                                   1025 ;	main.c: 384: led_init();
      00040E 3E 38                 1026 	call	_led_init
                                   1027 ;	main.c: 385: timer_init();
      000410 40 38                 1028 	call	_timer_init
                                   1029 ;	main.c: 397: touch_init();
      000412 32 38                 1030 	call	_touch_init
                                   1031 ;	main.c: 399: touch_base = read_touch_raw();
      000414 5A 38                 1032 	call	_read_touch_raw
      000416 A6 0B                 1033 	mov	_touch_base+0, a
      000418 80 0F                 1034 	mov	a, p
      00041A A7 0B                 1035 	mov	_touch_base+1, a
                                   1036 ;	main.c: 401: state = BLUE;
      00041C 01 2F                 1037 	mov	a, #0x01
      00041E 89 0B                 1038 	mov	_state+0, a
                                   1039 ;	main.c: 402: step = NONE;
      000420 08 13                 1040 	clear	_step+0
                                   1041 ;	main.c: 403: handle_state_update();
      000422 1E 39                 1042 	call	_handle_state_update
                                   1043 ;	main.c: 405: while (1)
      000424                       1044 00104$:
                                   1045 ;	main.c: 407: if (TM2CT >= GLOBAL_TICK_ms)
      000424 DD 01                 1046 	mov.io	a, __tm2ct
      000426 0A 29                 1047 	sub	a, #0x0a
      000428 40 18                 1048 	t0sn.io	f, c
      00042A 12 32                 1049 	goto	00104$
      00042C                       1050 00120$:
                                   1051 ;	main.c: 409: TM2CT = 0; // Clear the timer count
      00042C 00 2F                 1052 	mov	a, #0x00
      00042E 9D 01                 1053 	mov.io	__tm2ct, a
                                   1054 ;	main.c: 410: handle_tick();
      000430 9D 39                 1055 	call	_handle_tick
      000432 12 32                 1056 	goto	00104$
                                   1057 ;	main.c: 413: }
      000434 7A 00                 1058 	ret
                                   1059 	.area CODE
                                   1060 	.area CONST
                                   1061 	.area CONST
      0004A2                       1062 _orange_base_color:
      0004A2 08 02                 1063 	ret #0x08	; 8
      0004A4 20 02                 1064 	ret #0x20	; 32
      0004A6 00 02                 1065 	ret #0x00	; 0
                                   1066 	.area CODE
                                   1067 	.area CONST
      0004A8                       1068 _orange_highlight_color:
      0004A8 28 02                 1069 	ret #0x28	; 40
      0004AA 70 02                 1070 	ret #0x70	; 112	'p'
      0004AC 10 02                 1071 	ret #0x10	; 16
                                   1072 	.area CODE
                                   1073 	.area CONST
      0004AE                       1074 _blue_base_color:
      0004AE 00 02                 1075 	ret #0x00	; 0
      0004B0 00 02                 1076 	ret #0x00	; 0
      0004B2 40 02                 1077 	ret #0x40	; 64
                                   1078 	.area CODE
                                   1079 	.area CONST
      0004B4                       1080 _blue_highlight_color:
      0004B4 10 02                 1081 	ret #0x10	; 16
      0004B6 10 02                 1082 	ret #0x10	; 16
      0004B8 80 02                 1083 	ret #0x80	; 128
                                   1084 	.area CODE
                                   1085 	.area CONST
      0004BA                       1086 _off_color:
      0004BA 00 02                 1087 	ret #0x00	; 0
      0004BC 00 02                 1088 	ret #0x00	; 0
      0004BE 00 02                 1089 	ret #0x00	; 0
                                   1090 	.area CODE
                                   1091 	.area CABS (ABS)
