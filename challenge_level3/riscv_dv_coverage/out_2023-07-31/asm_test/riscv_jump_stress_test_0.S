.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x31, h0_start
jalr x0, x31, 0
h0_start:
                  li x14, 0x40000100
                  csrw 0x301, x14
kernel_sp:        
                  la x30, kernel_stack_end

trap_vec_init:    
                  la x14, mtvec_handler
                  ori x14, x14, 1
                  csrw 0x305, x14 # MTVEC

mepc_setup:       
                  la x14, init
                  csrw 0x341, x14

init_machine_mode:
                  li x14, 0x1a00
                  csrw 0x300, x14 # MSTATUS
                  li x14, 0x0
                  csrw 0x304, x14 # MIE
                  mret
init:             
                  li x0, 0x80000000
                  li x1, 0xf60c5db2
                  li x2, 0x0
                  li x3, 0x0
                  li x4, 0x25035c75
                  li x5, 0x80000000
                  li x6, 0x0
                  li x7, 0x1
                  li x8, 0xe205f078
                  li x9, 0xb3cab5ac
                  li x10, 0x2
                  li x11, 0xfea76570
                  li x12, 0xb0e1948d
                  li x13, 0x9
                  li x14, 0x0
                  li x15, 0xf5ed6ff9
                  li x16, 0x80000000
                  li x17, 0x0
                  li x18, 0x5e0d2165
                  li x19, 0x0
                  li x20, 0x9
                  li x21, 0x0
                  li x22, 0xc
                  li x23, 0xf7b53511
                  li x24, 0x0
                  li x25, 0x0
                  li x26, 0xb73518d8
                  li x27, 0x0
                  li x28, 0x6
                  li x31, 0x4
                  la x29, user_stack_end
main:             jal         s7, 4f
0:                jal         ra, 10f
1:                jal         ra, 11f
2:                jal         ra, 14f
3:                jal         s11, 13f
4:                jal         ra, 5f
5:                jal         tp, 1b
6:                jal         a7, 0b
7:                jal         ra, 12f
8:                jal         ra, 9f
9:                jal         s1, 3b
10:               jal         s6, 8b
11:               jal         s8, 6b
12:               jal         ra, 2b
13:               jal         ra, 7b
14:               xor         s7, zero, t0
main_0:           jal         s7, 20f
0:                jal         ra, 22f
1:                jal         ra, 25f
2:                jal         ra, 14f
3:                jal         ra, 1b
4:                jal         ra, 19f
5:                jal         ra, 0b
6:                jal         ra, 17f
7:                jal         ra, 15f
8:                jal         a6, 4b
9:                jal         ra, 12f
10:               jal         ra, 7b
11:               jal         sp, 28f
12:               jal         sp, 30f
13:               jal         ra, 16f
14:               jal         ra, 6b
15:               jal         s0, 23f
16:               jal         ra, 10b
17:               jal         ra, 8b
18:               jal         t2, 2b
19:               jal         ra, 29f
20:               jal         a6, 13b
21:               jal         ra, 5b
22:               jal         ra, 26f
23:               jal         ra, 27f
24:               jal         s3, 11b
25:               jal         ra, 24b
26:               jal         sp, 18b
27:               jal         sp, 21b
28:               jal         s4, 9b
29:               jal         ra, 3b
30:               auipc       a4, 955919
                  and         a5, t2, s1
                  and         zero, s11, a7
                  sub         s4, t2, s1
                  andi        a1, a4, -145
                  bgeu        t1, t4, 24f
                  add         s8, gp, a1
                  xor         a1, a5, a6
                  bne         t2, a5, 11f
                  xori        s0, s2, 1873
                  bge         a1, a2, 25f
                  slti        zero, a6, -334
11:               sltiu       a3, tp, -522
                  auipc       a5, 154808
                  or          s2, s3, sp
                  lui         s6, 849666
                  ori         sp, ra, 1667
                  slt         t1, sp, s5
                  sub         t1, t0, s0
                  auipc       a1, 166116
                  srli        a4, sp, 10
                  slti        s7, s11, -1051
                  bge         a4, a3, 27f
                  ori         s8, s4, -329
                  add         s7, s6, a4
24:               sub         s6, tp, a3
25:               ori         s2, a5, 136
                  or          s3, s5, a7
27:               bltu        zero, s2, 38f
                  sra         s4, t5, a6
                  lui         t1, 308268
                  srl         a3, t6, t4
                  lui         sp, 529444
                  xor         s1, gp, zero
                  sra         s1, a4, a2
                  and         t0, a3, a6
                  blt         s5, s2, 44f
                  xori        s7, a1, -569
                  add         s8, t3, t6
38:               and         zero, s0, t3
                  bge         s4, t6, 56f
                  andi        s2, t5, -887
                  addi        s1, t0, -853
                  srai        s1, ra, 26
                  nop
44:               bltu        a7, s10, 53f
                  srl         a5, s0, a2
                  addi        s7, a2, -570
                  add         t0, gp, t5
                  sra         gp, s8, s5
                  lui         a3, 257458
                  srli        sp, a4, 19
                  andi        s1, a2, 1236
                  slt         s9, a4, t1
53:               sra         a1, a4, a7
                  sll         s3, s11, s10
                  beq         a5, s2, 56f
56:               slli        sp, a6, 5
                  sltu        a4, s2, zero
                  sll         zero, t5, a3
                  or          s0, tp, s3
                  bltu        a6, t6, 80f
                  slti        a6, s5, 1211
                  sll         t3, t0, t0
                  bgeu        a3, s1, 70f
                  srli        s5, t4, 7
                  bge         a2, s9, 79f
                  sltu        s4, t3, a0
                  add         s8, s10, ra
                  bltu        a6, a3, 79f
                  sll         t3, s8, a4
70:               bgeu        ra, t6, 81f
                  sltu        s10, a5, a6
                  slli        sp, a3, 27
                  or          a7, t5, sp
                  slti        a1, sp, 1379
                  addi        s1, a3, -1709
                  sll         a7, sp, gp
                  bne         t1, t3, 86f
                  bge         sp, s4, 82f
79:               beq         a5, a7, 84f
80:               slt         t3, s5, t2
81:               xor         ra, a6, a1
82:               and         s8, s9, a3
                  sra         ra, sp, a6
84:               ori         s10, a0, -1644
                  or          s1, a0, s4
86:               bltu        a2, a1, 92f
                  blt         gp, t0, 95f
                  auipc       t0, 319053
                  lui         s6, 541223
                  sltu        zero, a1, ra
                  srl         t0, s2, ra
92:               slt         a6, t3, s5
                  and         tp, zero, ra
                  slti        zero, t4, 447
95:               slli        a7, a5, 0
                  sra         s9, sp, s0
                  slti        s3, t0, 1886
                  xori        a3, sp, 1762
                  srl         s5, a7, s6
                  nop
                  slli        a7, t0, 5
                  slt         s4, s8, a0
                  sll         s2, a3, sp
                  and         a5, gp, a1
                  xori        a3, s7, 1481
                  add         a5, s4, ra
                  ori         a7, s5, 970
                  sra         s7, s11, gp
                  slti        zero, zero, 3
                  sra         zero, a4, a0
                  or          zero, t4, s3
                  xori        t2, a5, 1996
                  srl         zero, s9, ra
                  bne         a0, s2, 126f
                  bltu        s7, a2, 133f
                  bge         t3, a3, 135f
                  slli        s5, t6, 19
                  sra         t0, sp, a0
                  addi        t2, s0, -1609
                  andi        s11, s7, -1370
                  beq         t0, sp, 122f
122:              ori         ra, a1, 1640
                  srl         s8, ra, s1
                  slt         a6, s9, a1
                  sltiu       s9, tp, -676
126:              andi        s6, a5, 1754
                  sltu        s11, zero, a2
                  sll         a6, a7, ra
                  sub         ra, a0, a0
                  xor         a4, t2, s5
                  sltiu       sp, s2, -1524
                  slli        s10, s7, 14
133:              xor         a4, a6, s8
                  bgeu        s8, s7, 143f
135:              blt         s3, t5, 147f
                  srl         a4, s5, t5
                  sra         a0, a6, s2
                  srli        t2, s6, 14
                  slli        t3, t1, 3
                  srli        a2, ra, 7
                  or          t0, a6, s4
                  ori         t0, a3, -40
143:              ori         ra, t1, -1
                  auipc       s2, 424873
                  sub         s6, zero, s4
                  bne         sp, ra, 155f
147:              slti        zero, t1, 678
                  srl         a6, s11, s1
                  bgeu        s2, s1, 154f
                  sltiu       a6, s3, -1990
                  bge         tp, s4, 157f
                  add         s0, s8, s5
                  slt         zero, t3, a5
154:              add         s5, t3, zero
155:              bgeu        t1, t6, 174f
                  bgeu        s2, s8, 161f
157:              srli        sp, tp, 27
                  sra         ra, t6, s8
                  ori         a6, t6, -1770
                  slli        a5, a6, 9
161:              and         ra, a6, gp
                  sltu        a4, s1, s4
                  sra         zero, a2, t3
                  auipc       t2, 541475
                  sltu        s6, a2, t4
                  lui         s8, 583563
                  srai        sp, sp, 30
                  slli        zero, s8, 26
                  andi        ra, t3, 1058
                  srai        zero, t5, 16
                  andi        ra, s4, 942
                  or          zero, t3, a0
                  bgeu        a7, t2, 174f
174:              andi        ra, s5, 571
                  blt         a7, tp, 192f
                  nop
                  sll         s8, s10, s0
                  bne         t2, a2, 187f
                  blt         s0, s10, 185f
                  slti        t3, t1, 367
                  or          a3, s7, s2
                  sltiu       s7, s9, 353
                  bge         s10, s8, 189f
                  sll         zero, s3, a1
185:              slt         s3, t4, s7
                  beq         t5, t0, 190f
187:              sub         s1, t5, gp
                  srai        s6, t2, 11
189:              xori        zero, s7, 1142
190:              slti        s7, t4, -1018
                  bgeu        a3, s2, 203f
192:              auipc       sp, 734260
                  bne         s2, a3, 202f
                  srli        a2, s0, 31
                  nop
                  bltu        s2, s0, 216f
                  beq         t0, a3, 209f
                  bge         s0, a1, 217f
                  nop
                  srli        s6, s6, 13
                  sltiu       s5, a3, 370
202:              andi        s2, s6, -343
203:              lui         s11, 745253
                  slli        a3, s5, 30
                  bgeu        a4, s8, 213f
                  blt         s4, gp, 215f
                  srl         s0, s10, gp
                  bgeu        s9, t6, 228f
209:              sub         s3, s1, t6
                  blt         zero, t6, 214f
                  slli        zero, s1, 3
                  andi        t0, t0, -1212
213:              srai        a5, t2, 23
214:              srl         s6, s9, t2
215:              andi        sp, a4, -920
216:              sra         ra, a7, a3
217:              auipc       s5, 353971
                  xori        zero, s11, 991
                  bgeu        a7, s6, 224f
                  slli        s2, a1, 30
                  bgeu        s4, s10, 230f
                  bltu        t2, a4, 236f
                  blt         s9, t6, 228f
224:              or          sp, t6, s2
                  ori         s0, a4, 1065
                  sltu        s0, ra, t2
                  sltu        zero, a1, s6
228:              xori        s4, t6, -669
                  lui         zero, 679345
230:              sra         t3, t4, a6
                  slti        a2, s3, -899
                  bge         t5, sp, 248f
                  ori         s11, a6, 1982
                  xori        s10, a0, 703
                  bgeu        t1, s10, 253f
236:              sll         s0, s11, s2
                  sub         s2, t1, a1
                  lui         s11, 505416
                  srai        s0, s1, 13
                  srli        tp, t3, 0
                  sltiu       a7, sp, -1653
                  xor         zero, s10, t1
                  sltiu       s1, t0, 1250
                  ori         t0, ra, 393
                  sub         s8, a4, a1
                  beq         sp, a1, 265f
                  srli        a7, s1, 3
248:              addi        tp, s10, 762
                  slli        a0, a6, 9
                  sltu        zero, a4, a7
                  bge         s0, zero, 262f
                  sra         s5, a3, s10
253:              ori         a7, s9, 110
                  bge         s9, a7, 261f
                  bgeu        t5, ra, 260f
                  auipc       s1, 360693
                  addi        s1, sp, 1253
                  xor         zero, a0, s1
                  addi        a7, zero, -330
260:              sltu        a1, a0, s1
261:              nop
262:              bgeu        s4, s11, 268f
                  addi        t0, gp, -649
                  andi        a7, t6, -1565
265:              slt         sp, s4, a2
                  xor         s9, s11, a2
                  beq         s6, t3, 276f
268:              srai        s0, a6, 10
                  slli        s9, s4, 2
                  xori        ra, s3, -1608
                  add         zero, ra, t2
                  bltu        tp, a5, 273f
273:              srl         a6, s9, a2
                  srl         ra, ra, t5
                  srl         s9, s5, s1
276:              xori        gp, t0, -947
                  or          a4, t5, s10
                  ori         a0, s11, -1724
                  slt         a2, s5, t3
                  xor         s7, s11, sp
                  sub         s2, s10, s1
                  sltiu       tp, gp, -1672
                  sltiu       s8, s8, -820
                  blt         a5, s7, 295f
                  auipc       ra, 342331
                  srai        s6, s2, 7
                  lui         a6, 34995
                  sub         zero, gp, s7
                  or          ra, tp, t1
                  blt         s7, s1, 301f
                  bne         s5, t1, 300f
                  sltu        t0, a6, a1
                  bgeu        t4, tp, 304f
                  xori        a2, s7, 2013
295:              srli        s0, sp, 0
                  blt         s10, t0, 316f
                  nop
                  bltu        a5, t6, 306f
                  sll         a1, s11, a6
300:              blt         s1, t1, 301f
301:              slt         a2, s11, t6
                  nop
                  sltu        s6, t5, s0
304:              sltiu       t3, s5, 1166
                  bgeu        gp, a6, 310f
306:              add         a1, a0, s9
                  xori        t1, t3, 1673
                  or          zero, a7, s8
                  or          s6, s8, a1
310:              srai        s0, s6, 13
                  sll         t3, s10, t6
                  sltiu       s3, ra, 1838
                  blt         a3, s3, 318f
                  nop
                  or          sp, s6, zero
316:              lui         ra, 194665
                  slli        s11, s8, 2
318:              xori        a4, s0, -439
                  andi        zero, a0, -354
                  andi        a7, s1, -1946
                  blt         s0, s1, 333f
                  bne         t5, sp, 340f
                  sltiu       s10, s8, 687
                  bge         t1, t2, 330f
                  srai        zero, s5, 13
                  ori         tp, t4, 1039
                  slti        s10, s11, 2028
                  xor         s8, s0, a2
                  ori         s8, s2, -308
330:              xori        zero, a7, -613
                  srl         a2, s3, sp
                  auipc       s8, 986060
333:              slti        gp, a1, -617
                  or          a3, sp, t3
                  xor         s9, tp, t6
                  blt         t3, s0, 345f
                  auipc       s11, 467053
                  sltiu       zero, s1, -1233
                  nop
340:              srli        s11, sp, 13
                  lui         zero, 836583
                  slli        a0, s8, 13
                  srl         s8, a4, s6
                  slt         zero, s4, ra
345:              xor         s6, s8, s10
                  andi        sp, t6, 743
                  bne         a1, a5, 353f
                  bltu        t1, s0, 353f
                  or          s11, s5, s2
                  sub         s0, t5, s7
                  sll         s1, t6, s7
                  beq         t1, s5, 356f
353:              blt         t5, s10, 359f
                  ori         s8, a3, -2023
                  xori        gp, t3, 1847
356:              sll         a6, s2, a6
                  srl         s10, t3, a5
                  bne         ra, t6, 369f
359:              lui         zero, 169427
                  bgeu        s8, a0, 364f
                  ori         zero, tp, -1923
                  beq         s6, s0, 382f
                  xori        s8, s10, 562
364:              sll         s2, t3, t2
                  bge         s5, t4, 374f
                  and         t2, s0, a0
                  sll         s7, s3, t3
                  bltu        a3, s8, 384f
369:              sra         t1, s5, a6
                  addi        t3, a0, 363
                  sra         zero, s8, a2
                  bgeu        s1, s2, 386f
                  bge         ra, a5, 392f
374:              slti        gp, s3, -1105
                  bge         s3, s4, 384f
                  nop
                  srli        t3, a5, 30
                  addi        s2, s2, -365
                  srl         zero, a3, s4
                  lui         s11, 172771
                  sra         a1, s11, s6
382:              srl         zero, s2, s1
                  srli        s3, s4, 8
384:              andi        t3, a1, 1570
                  auipc       s6, 968720
386:              sltiu       s1, s9, 582
                  srl         s2, a5, a3
                  bltu        a0, a4, 407f
                  slti        sp, a5, -1569
                  and         s5, s9, zero
                  srli        a5, s4, 12
392:              beq         gp, a4, 393f
393:              xor         s9, t6, s7
                  ori         a6, a2, -1230
                  nop
                  auipc       s11, 382472
                  auipc       a1, 896682
                  and         s1, t4, sp
                  sltiu       t2, s6, -114
                  xor         a2, a0, s4
                  srli        s6, s3, 31
                  add         t0, sp, a4
                  bge         t2, s0, 410f
                  or          t1, a5, a6
                  blt         s0, s0, 414f
                  sra         a3, s5, a7
407:              sra         sp, a3, a5
                  slli        a0, s6, 27
                  slti        a7, s2, -854
410:              slt         zero, a0, ra
                  andi        a3, gp, 130
                  xori        t1, t4, 1557
                  sltu        zero, zero, s1
414:              slli        s5, t1, 10
                  sll         a2, a3, t6
                  bge         s8, s5, 427f
                  xor         s6, s2, t0
                  sll         a3, s4, s0
                  sra         a5, a0, s11
                  xor         a2, t5, a0
                  slt         s3, s6, s4
                  and         s4, s11, s9
                  beq         s9, t0, 440f
                  srli        a1, sp, 23
                  lui         zero, 546701
                  slli        s1, a5, 21
427:              blt         s10, t2, 439f
                  sra         zero, s4, s9
                  andi        a2, s1, -1317
                  beq         t6, s2, 449f
                  sltu        gp, tp, a7
                  bne         t6, t0, 443f
                  blt         t2, a0, 434f
434:              bge         a4, s10, 438f
                  ori         tp, t1, 1493
                  or          zero, t1, a4
                  slt         zero, s7, t4
438:              slli        t3, s6, 9
439:              slli        zero, a4, 3
440:              auipc       a0, 472489
                  sltiu       s4, a2, -1985
                  sra         t1, t5, t1
443:              or          gp, a2, gp
                  ori         t3, t4, 27
                  sltu        a0, s8, a5
                  nop
                  bne         t3, t0, 455f
                  sltiu       t2, s11, 396
449:              sub         sp, a4, a5
                  nop
                  slti        a5, s8, 1901
                  srli        s5, a2, 14
                  blt         ra, t3, 470f
                  xori        a2, tp, 1158
455:              blt         a5, s7, 466f
                  bltu        sp, s10, 465f
                  srl         s6, s3, a5
                  beq         t2, ra, 463f
                  slt         a7, a1, s11
                  bge         s7, sp, 476f
                  beq         gp, a6, 475f
                  or          a7, s9, sp
463:              sub         a1, t4, t1
                  xori        s4, a5, -1086
465:              sltiu       a1, t4, -1390
466:              bge         t0, a6, 471f
                  sra         tp, a0, a5
                  slti        zero, a0, -346
                  bltu        tp, s1, 478f
470:              and         s5, s5, t3
471:              and         tp, a5, t6
                  auipc       a1, 563794
                  sltiu       zero, a5, 70
                  lui         t3, 794464
475:              add         s11, a3, a4
476:              andi        s1, t5, -1914
                  srli        ra, a0, 30
478:              andi        s10, s7, 355
                  srai        tp, s11, 8
                  or          zero, ra, a1
                  xor         zero, t4, zero
                  bge         a1, s11, 489f
                  slt         s2, t0, t4
                  and         t3, s10, t2
                  bge         a1, s5, 491f
                  srli        a4, s9, 4
                  auipc       s10, 558877
                  slt         s0, s3, tp
489:              srli        a0, t0, 31
                  lui         s5, 1000932
491:              addi        s0, t5, -267
                  bgeu        ra, s9, 501f
                  bne         t0, t3, 502f
                  xori        zero, gp, 1462
                  sltiu       s7, t6, -440
                  beq         a4, zero, 505f
                  sub         s3, t5, a3
                  srl         s6, t2, zero
                  slti        t3, sp, 1621
                  beq         sp, s2, 519f
501:              and         zero, t4, t5
502:              sltu        sp, a3, s9
                  srl         t3, t4, t2
                  ori         a7, a4, 1630
505:              sltu        a3, s7, s8
                  slti        s8, t5, 93
                  bge         s0, t4, 513f
                  lui         sp, 355784
main_2:           jal         s7, 14f
0:                jal         ra, 3f
1:                jal         ra, 4f
2:                jal         ra, 12f
3:                jal         ra, 17f
4:                jal         ra, 22f
5:                jal         t2, 10f
6:                jal         s4, 16f
7:                jal         s0, 18f
8:                jal         ra, 23f
9:                jal         ra, 2b
10:               jal         ra, 15f
11:               jal         ra, 21f
12:               jal         ra, 13f
13:               jal         a7, 6b
14:               jal         ra, 20f
15:               jal         s9, 7b
16:               jal         sp, 8b
17:               jal         ra, 1b
18:               jal         ra, 11b
19:               jal         s11, 9b
20:               jal         s3, 5b
21:               jal         a6, 0b
22:               jal         s10, 19b
23:               sltu        s10, s0, s2
                  slti        s0, t5, 373
                  and         s1, a6, s10
                  bge         s4, tp, 517f
                  srli        s11, a7, 9
513:              andi        zero, s7, 273
                  bge         a3, ra, 519f
                  slli        a7, s10, 12
                  blt         s10, a6, 536f
517:              or          s5, s1, a3
                  slti        gp, s7, 412
519:              srai        s4, a6, 9
                  slli        s10, s7, 14
                  bge         sp, s3, 541f
                  srl         a3, a6, a1
                  srl         gp, t6, s8
                  srl         a1, t5, s9
                  slli        a0, s7, 13
main_1:           jal         s7, 1f
0:                jal         ra, 10f
1:                jal         ra, 3f
2:                jal         ra, 17f
3:                jal         ra, 2b
4:                jal         ra, 6f
5:                jal         ra, 8f
6:                jal         ra, 15f
7:                jal         ra, 12f
8:                jal         t3, 7b
9:                jal         ra, 4b
10:               jal         ra, 14f
11:               jal         ra, 16f
12:               jal         s5, 19f
13:               jal         s3, 9b
14:               jal         ra, 5b
15:               jal         s8, 11b
16:               jal         t3, 18f
17:               jal         ra, 13b
18:               jal         ra, 0b
19:               lui         t1, 160082
                  lui         s7, 925718
                  bgeu        s8, s10, 539f
                  beq         t0, zero, 529f
529:              bne         s8, t5, 547f
                  sll         t1, gp, t1
                  slli        s9, s9, 11
                  andi        s1, a7, 1353
                  nop
                  lui         t1, 827376
                  xor         s2, t6, t4
536:              slti        s8, a7, 1431
                  add         a5, s0, t1
                  ori         gp, tp, 1391
539:              sra         s2, s2, s9
                  nop
541:              beq         s10, t1, 552f
                  addi        a0, t1, 1469
                  sub         gp, t3, zero
                  slli        s3, a7, 16
                  sra         a0, s8, s6
                  slt         zero, t5, a7
547:              srai        t0, s8, 5
                  slti        s5, a6, 806
                  or          s2, a6, s0
                  addi        s6, t5, -794
                  srli        s1, sp, 25
552:              or          a1, a7, s3
                  ori         t1, gp, -1389
                  sra         a3, s5, a1
                  blt         a3, a7, 559f
                  srl         zero, tp, s10
                  auipc       a5, 649534
                  nop
559:              auipc       sp, 164956
                  andi        a6, s7, 159
                  ori         s4, s7, 505
                  sra         t0, s10, sp
                  bltu        s11, t6, 575f
                  sll         zero, a2, s10
                  slt         a3, a1, a5
                  bne         s1, s1, 575f
                  andi        a0, ra, -716
                  nop
                  addi        s1, s10, -1576
                  and         zero, t3, a3
                  srli        s8, s10, 4
                  bgeu        t2, s3, 579f
                  blt         a0, a7, 579f
                  sltiu       s6, a4, -1231
575:              and         a0, a3, zero
                  bne         s9, s0, 587f
                  bgeu        t4, zero, 595f
                  sub         s5, t2, a3
579:              xor         s8, s3, s8
                  slli        a3, ra, 31
                  andi        a4, sp, -471
                  xor         t0, s9, t3
                  lui         s4, 512041
                  srli        a5, s11, 11
                  addi        zero, s3, 1139
                  bge         a2, s6, 598f
587:              sub         a5, s3, a4
                  lui         t3, 750906
                  sub         a5, s8, s9
                  auipc       t1, 757842
                  sltu        s1, a6, s7
                  bltu        t0, s9, 603f
                  slt         zero, t1, ra
                  xori        s9, a4, 498
595:              or          s5, s5, t6
                  bge         a7, a5, 608f
                  sra         sp, s4, a7
598:              and         s9, t2, s0
                  slti        a4, s11, -1858
                  srli        t1, zero, 6
                  or          s6, a7, gp
                  sll         zero, a4, s10
603:              add         a3, s8, s9
                  beq         t2, tp, 610f
                  slti        ra, s3, 626
                  xori        s10, s1, -1171
                  srai        a6, a2, 0
608:              lui         t1, 1009958
                  add         t1, sp, a3
610:              or          s3, a2, t6
                  bne         s2, ra, 631f
                  add         t0, s0, a7
                  bgeu        s10, s4, 630f
                  andi        s6, zero, 273
                  ori         t3, a5, 1469
                  sltu        s8, t3, s1
                  srli        s11, a2, 31
                  sra         s0, t2, t4
                  beq         tp, s2, 625f
                  sltu        s1, t5, t4
                  blt         a2, a7, 637f
                  and         s3, a4, s9
                  nop
                  addi        t0, t0, 269
625:              sub         s10, s8, gp
                  bltu        a7, a7, 630f
                  xor         t3, sp, s11
                  add         s0, tp, s11
                  andi        a6, s2, -464
630:              or          zero, s1, t6
631:              bne         a2, s11, 640f
                  srli        s8, a7, 14
                  sltiu       zero, s10, 645
                  sub         s1, a1, ra
                  add         a3, gp, a5
                  slti        t1, a4, -1834
637:              sltiu       s4, s11, 885
                  sra         a2, t4, t1
                  sub         zero, t6, s1
640:              bge         t0, t1, 641f
641:              andi        t3, s0, 174
                  sra         a6, t1, a2
                  slli        gp, gp, 4
                  bge         a1, s4, 653f
                  srli        s3, s4, 11
                  slt         t3, s4, t6
                  srai        zero, sp, 25
                  bgeu        a7, a0, 652f
                  and         s9, t3, t0
                  ori         t0, s10, -716
                  bltu        t6, a6, 660f
652:              nop
653:              srai        t1, tp, 8
                  blt         a2, t3, 663f
                  blt         a3, s0, 669f
                  sll         sp, a2, zero
                  slli        s10, a2, 24
                  andi        a4, t4, 336
                  slli        t2, a0, 31
660:              srai        t3, s6, 18
                  xori        a1, s11, -1452
                  add         a5, sp, s2
663:              slti        a2, gp, 1674
                  sltiu       zero, t1, -2007
                  auipc       s5, 713635
                  sltu        s9, gp, a4
                  andi        s5, a5, 1879
                  andi        zero, s11, -444
669:              sltu        a3, s6, s0
                  xor         ra, a4, s3
                  andi        zero, a0, 1221
                  ori         a1, s9, -787
                  srli        s9, ra, 23
                  bltu        a2, s2, 693f
                  slt         s3, s6, s3
                  bge         a2, a1, 684f
                  xori        s4, s9, 194
                  addi        s2, t1, 1094
                  and         s3, a3, s3
                  xori        t0, t3, -1195
                  bgeu        s4, t0, 682f
682:              or          a3, s4, t5
                  srli        s8, a6, 26
684:              beq         a2, s10, 703f
                  bltu        gp, t3, 690f
                  add         s11, s6, a5
                  lui         s8, 826610
                  andi        sp, s9, 861
                  and         s9, a5, s10
690:              srl         a4, s0, s7
                  sra         s2, ra, s2
                  andi        s3, s2, -221
693:              srai        s7, a6, 31
                  slti        s8, a1, 426
                  bgeu        tp, s11, 700f
                  srli        zero, t0, 3
                  slti        s8, s0, 1680
                  xori        ra, t1, 811
                  nop
700:              bgeu        t6, a6, 705f
                  bgeu        a0, t2, 712f
                  slli        ra, ra, 12
703:              slt         zero, t2, a4
                  slti        s10, s3, -1574
705:              bge         a2, s3, 725f
                  blt         s7, s7, 714f
                  blt         a0, a0, 726f
                  bne         s9, t5, 717f
                  srl         zero, t2, a0
                  xori        a4, t0, -771
                  slti        s9, s1, -1928
712:              sltiu       a6, a0, 1761
                  blt         s11, gp, 722f
714:              and         s3, a6, gp
                  sll         s11, a7, s7
                  and         sp, t6, s1
717:              xor         a0, t1, t4
                  bgeu        a7, s1, 727f
                  sub         s8, s10, s8
                  sub         s5, t4, s11
                  slli        s10, t6, 21
722:              sltiu       a3, t5, -1723
                  slli        sp, s4, 6
                  addi        zero, t5, -935
725:              sra         s3, a3, t5
726:              xor         a2, a7, a6
727:              slti        a1, s4, -98
                  add         s8, s4, gp
                  sltiu       s5, a2, 214
                  andi        zero, t5, 1436
                  srai        s0, t6, 24
                  ori         t0, t1, 199
                  sll         gp, t5, sp
                  bgeu        t6, a5, 746f
                  bge         zero, a2, 749f
                  bgeu        t3, s0, 752f
                  bltu        a2, s4, 757f
                  xori        a0, s5, 1460
                  sltiu       a3, s1, 863
                  lui         s7, 574317
                  blt         s0, ra, 747f
                  srli        gp, s0, 16
                  sll         t2, s10, s7
                  slti        zero, a6, 1616
                  auipc       s8, 194801
746:              sra         s9, s9, s1
747:              beq         t1, s1, 759f
                  ori         zero, zero, -1052
749:              beq         ra, a0, 750f
750:              xor         s4, s11, gp
                  slt         tp, a0, s11
752:              bgeu        s1, s3, 758f
                  auipc       a3, 369197
                  sltiu       gp, s2, 679
                  slli        a6, ra, 30
                  srli        s5, s7, 31
757:              slt         a5, s11, t2
758:              beq         t3, a3, 769f
759:              sltu        ra, a2, s9
                  bltu        s0, tp, 769f
                  slli        s11, a3, 15
                  ori         s6, s5, 1833
                  xor         s6, a7, s11
                  ori         s0, tp, 2043
                  xor         gp, sp, s6
                  xori        s4, s5, 894
                  or          t2, s7, a5
                  or          s5, a4, a3
769:              lui         s8, 769987
                  ori         s4, a2, -905
                  sub         s4, a4, s6
                  srai        t1, a1, 20
                  bge         t6, a3, 780f
                  srl         s1, a0, a4
                  nop
                  add         a5, sp, s1
                  slt         zero, gp, s3
                  sll         zero, gp, t2
                  ori         s5, t3, -876
780:              srli        a5, t3, 2
                  srl         s9, s10, t0
                  auipc       a1, 302164
                  add         s7, s11, t0
                  slti        gp, s6, -1507
                  nop
                  andi        a0, a1, -504
                  add         s1, s4, ra
                  add         s3, a2, s9
                  or          zero, a5, s0
                  nop
                  sub         s8, t4, t5
                  add         s2, s6, s7
                  xori        s2, a6, -553
                  sub         a0, s4, s4
                  srli        ra, t5, 25
                  xor         t2, t3, a6
                  slli        a6, t2, 0
                  bltu        s2, a0, 809f
                  add         s11, s1, s1
                  or          s10, s3, a1
                  srai        zero, s8, 3
                  sll         t0, s0, gp
                  sltiu       t1, a5, -603
                  and         a2, a5, s11
                  xori        a4, a2, -988
                  sra         sp, s4, s0
                  or          t1, zero, s8
                  add         s3, t0, s9
809:              sra         zero, t0, a0
                  sll         gp, s11, t2
                  bge         gp, t5, 829f
                  xori        a2, t5, -1630
                  sltu        s7, a5, s1
                  sll         a6, t0, gp
                  add         t0, s6, a3
                  bltu        sp, a6, 825f
                  or          a7, a2, gp
                  blt         t0, s7, 822f
                  bne         s0, t4, 830f
                  xor         s2, s10, s6
                  sub         a6, a3, zero
822:              bne         a0, a2, 831f
                  or          a4, a6, a4
                  sub         zero, a2, a5
825:              srl         a6, t3, a1
                  srai        a4, t6, 20
                  bne         a5, t3, 831f
                  slti        s8, s7, -1165
829:              auipc       a4, 406894
830:              sltu        t0, a5, t3
831:              slti        a6, s0, -139
                  la x31, test_done
                  jalr x0, x31, 0
test_done:        
                  li gp, 1
                  ecall
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

instr_end:        
                  nop

.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.section .user_stack,"aw",@progbits;
.align 2
user_stack_start:
.rept 4999
.4byte 0x0
.endr
user_stack_end:
.4byte 0x0
.align 2
kernel_instr_start:
.text
mmode_intr_vector_1:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_2:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_3:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_4:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_5:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_6:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_7:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_8:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_9:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_10:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_11:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_12:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_13:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_14:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

mmode_intr_vector_15:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x342 # MCAUSE
                  srli x14, x14, 0x1f
                  beqz x14, 1f
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

.align 4
mtvec_handler:    
                  .option norvc;
                  j mmode_exception_handler
                  j mmode_intr_vector_1
                  j mmode_intr_vector_2
                  j mmode_intr_vector_3
                  j mmode_intr_vector_4
                  j mmode_intr_vector_5
                  j mmode_intr_vector_6
                  j mmode_intr_vector_7
                  j mmode_intr_vector_8
                  j mmode_intr_vector_9
                  j mmode_intr_vector_10
                  j mmode_intr_vector_11
                  j mmode_intr_vector_12
                  j mmode_intr_vector_13
                  j mmode_intr_vector_14
                  j mmode_intr_vector_15

mmode_exception_handler:
                  csrrw x29, 0x340, x29
                  add x29, x30, zero
                  1: addi x29, x29, -124
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr x14, 0x341 # MEPC
                  csrr x14, 0x342 # MCAUSE
                  li x28, 0xb # ECALL_MMODE
                  beq x14, x28, ecall_handler
                  li x28, 0x2 # ILLEGAL_INSTRUCTION
                  beq x14, x28, illegal_instr_handler
                  csrr x28, 0x343 # MTVAL
                  1: la x31, test_done
                  jalr x1, x31, 0

ecall_handler:    
                  la x14, _start
                  sw x0, 0(x14)
                  sw x1, 4(x14)
                  sw x2, 8(x14)
                  sw x3, 12(x14)
                  sw x4, 16(x14)
                  sw x5, 20(x14)
                  sw x6, 24(x14)
                  sw x7, 28(x14)
                  sw x8, 32(x14)
                  sw x9, 36(x14)
                  sw x10, 40(x14)
                  sw x11, 44(x14)
                  sw x12, 48(x14)
                  sw x13, 52(x14)
                  sw x14, 56(x14)
                  sw x15, 60(x14)
                  sw x16, 64(x14)
                  sw x17, 68(x14)
                  sw x18, 72(x14)
                  sw x19, 76(x14)
                  sw x20, 80(x14)
                  sw x21, 84(x14)
                  sw x22, 88(x14)
                  sw x23, 92(x14)
                  sw x24, 96(x14)
                  sw x25, 100(x14)
                  sw x26, 104(x14)
                  sw x27, 108(x14)
                  sw x28, 112(x14)
                  sw x29, 116(x14)
                  sw x30, 120(x14)
                  sw x31, 124(x14)
                  la x31, write_tohost
                  jalr x0, x31, 0

illegal_instr_handler:
                  csrr  x14, 0x341
                  addi  x14, x14, 4
                  csrw  0x341, x14
                  lw x1, 4(x29)
                  lw x2, 8(x29)
                  lw x3, 12(x29)
                  lw x4, 16(x29)
                  lw x5, 20(x29)
                  lw x6, 24(x29)
                  lw x7, 28(x29)
                  lw x8, 32(x29)
                  lw x9, 36(x29)
                  lw x10, 40(x29)
                  lw x11, 44(x29)
                  lw x12, 48(x29)
                  lw x13, 52(x29)
                  lw x14, 56(x29)
                  lw x15, 60(x29)
                  lw x16, 64(x29)
                  lw x17, 68(x29)
                  lw x18, 72(x29)
                  lw x19, 76(x29)
                  lw x20, 80(x29)
                  lw x21, 84(x29)
                  lw x22, 88(x29)
                  lw x23, 92(x29)
                  lw x24, 96(x29)
                  lw x25, 100(x29)
                  lw x26, 104(x29)
                  lw x27, 108(x29)
                  lw x28, 112(x29)
                  lw x29, 116(x29)
                  lw x30, 120(x29)
                  lw x31, 124(x29)
                  addi x29, x29, 124
                  add x30, x29, zero
                  csrrw x29, 0x340, x29
                  mret

pt_fault_handler: 

.align 2
mmode_intr_handler:
                  csrr  x14, 0x300 # MSTATUS;
                  csrr  x14, 0x304 # MIE;
                  csrr  x14, 0x344 # MIP;
                  csrrc x14, 0x344, x14 # MIP;
                  lw x1, 4(x29)
                  lw x2, 8(x29)
                  lw x3, 12(x29)
                  lw x4, 16(x29)
                  lw x5, 20(x29)
                  lw x6, 24(x29)
                  lw x7, 28(x29)
                  lw x8, 32(x29)
                  lw x9, 36(x29)
                  lw x10, 40(x29)
                  lw x11, 44(x29)
                  lw x12, 48(x29)
                  lw x13, 52(x29)
                  lw x14, 56(x29)
                  lw x15, 60(x29)
                  lw x16, 64(x29)
                  lw x17, 68(x29)
                  lw x18, 72(x29)
                  lw x19, 76(x29)
                  lw x20, 80(x29)
                  lw x21, 84(x29)
                  lw x22, 88(x29)
                  lw x23, 92(x29)
                  lw x24, 96(x29)
                  lw x25, 100(x29)
                  lw x26, 104(x29)
                  lw x27, 108(x29)
                  lw x28, 112(x29)
                  lw x29, 116(x29)
                  lw x30, 120(x29)
                  lw x31, 124(x29)
                  addi x29, x29, 124
                  add x30, x29, zero
                  csrrw x29, 0x340, x29
                  mret;

kernel_instr_end: nop
.align 2
kernel_data_start:
.section .kernel_stack,"aw",@progbits;
.align 2
kernel_stack_start:
.rept 4999
.4byte 0x0
.endr
kernel_stack_end:
.4byte 0x0
