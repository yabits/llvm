; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=ebc -disable-block-placement -verify-machineinstrs < %s \
; RUN:  | FileCheck -check-prefix=EBC %s

define i64 @foo(i64 %a, i64 *%b) {
; EBC-LABEL: foo:
; EBC:       ; %bb.0:
; EBC-NEXT:    movqw r0, r0 (0,-16)
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    movqw r7, r0 (0,24)
; EBC-NEXT:    movqq r7, @r7
; EBC-NEXT:    movqw r1, r0 (0,32)
; EBC-NEXT:    movqq r1, @r1
; EBC-NEXT:    movqq r2, @r1
; EBC-NEXT:    cmp64eq r7, r2
; EBC-NEXT:    jmp64cs LBB0_2
; EBC-NEXT:  ; %bb.1:
; EBC-NEXT:    movqq r7, r2
; EBC-NEXT:  LBB0_2:
; EBC-NEXT:    movqq r2, @r1
; EBC-NEXT:    cmp64eq r7, r2
; EBC-NEXT:    jmp64cs LBB0_4
; EBC-NEXT:  ; %bb.3:
; EBC-NEXT:    movqq r7, r2
; EBC-NEXT:  LBB0_4:
; EBC-NEXT:    movqq r2, @r1
; EBC-NEXT:    cmp64ulte r7, r2
; EBC-NEXT:    jmp64cc LBB0_6
; EBC-NEXT:  ; %bb.5:
; EBC-NEXT:    movqq r7, r2
; EBC-NEXT:  LBB0_6:
; EBC-NEXT:    movqq r2, @r1
; EBC-NEXT:    cmp64ugte r7, r2
; EBC-NEXT:    jmp64cs LBB0_8
; EBC-NEXT:  ; %bb.7:
; EBC-NEXT:    movqq r7, r2
; EBC-NEXT:  LBB0_8:
; EBC-NEXT:    movqq r2, @r1
; EBC-NEXT:    cmp64ugte r7, r2
; EBC-NEXT:    jmp64cc LBB0_10
; EBC-NEXT:  ; %bb.9:
; EBC-NEXT:    movqq r7, r2
; EBC-NEXT:  LBB0_10:
; EBC-NEXT:    movqq r2, @r1
; EBC-NEXT:    cmp64ulte r7, r2
; EBC-NEXT:    jmp64cs LBB0_12
; EBC-NEXT:  ; %bb.11:
; EBC-NEXT:    movqq r7, r2
; EBC-NEXT:  LBB0_12:
; EBC-NEXT:    movqq r2, @r1
; EBC-NEXT:    cmp64lte r7, r2
; EBC-NEXT:    jmp64cc LBB0_14
; EBC-NEXT:  ; %bb.13:
; EBC-NEXT:    movqq r7, r2
; EBC-NEXT:  LBB0_14:
; EBC-NEXT:    movqq r2, @r1
; EBC-NEXT:    cmp64gte r7, r2
; EBC-NEXT:    jmp64cs LBB0_16
; EBC-NEXT:  ; %bb.15:
; EBC-NEXT:    movqq r7, r2
; EBC-NEXT:  LBB0_16:
; EBC-NEXT:    movqq r2, @r1
; EBC-NEXT:    cmp64gte r7, r2
; EBC-NEXT:    jmp64cc LBB0_18
; EBC-NEXT:  ; %bb.17:
; EBC-NEXT:    movqq r7, r2
; EBC-NEXT:  LBB0_18:
; EBC-NEXT:    movqq r1, @r1
; EBC-NEXT:    cmp64lte r7, r1
; EBC-NEXT:    jmp64cs LBB0_20
; EBC-NEXT:  ; %bb.19:
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:  LBB0_20:
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    movqw r0, r0 (0,16)
; EBC-NEXT:    ret
  %val1 = load volatile i64, i64* %b
  %tst1 = icmp eq i64 %a, %val1
  %val2 = select i1 %tst1, i64 %a, i64 %val1

  %val3 = load volatile i64, i64* %b
  %tst2 = icmp eq i64 %val2, %val3
  %val4 = select i1 %tst2, i64 %val2, i64 %val3

  %val5 = load volatile i64, i64* %b
  %tst3 = icmp ugt i64 %val4, %val5
  %val6 = select i1 %tst3, i64 %val4, i64 %val5

  %val7 = load volatile i64, i64* %b
  %tst4 = icmp uge i64 %val6, %val7
  %val8 = select i1 %tst4, i64 %val6, i64 %val7

  %val9 = load volatile i64, i64* %b
  %tst5 = icmp ult i64 %val8, %val9
  %val10 = select i1 %tst5, i64 %val8, i64 %val9

  %val11 = load volatile i64, i64* %b
  %tst6 = icmp ule i64 %val10, %val11
  %val12 = select i1 %tst6, i64 %val10, i64 %val11

  %val13 = load volatile i64, i64* %b
  %tst7 = icmp sgt i64 %val12, %val13
  %val14 = select i1 %tst7, i64 %val12, i64 %val13

  %val15 = load volatile i64, i64* %b
  %tst8 = icmp sge i64 %val14, %val15
  %val16 = select i1 %tst8, i64 %val14, i64 %val15

  %val17 = load volatile i64, i64* %b
  %tst9 = icmp slt i64 %val16, %val17
  %val18 = select i1 %tst9, i64 %val16, i64 %val17

  %val19 = load volatile i64, i64* %b
  %tst10 = icmp sle i64 %val18, %val19
  %val20 = select i1 %tst10, i64 %val18, i64 %val19

  ret i64 %val20
}
