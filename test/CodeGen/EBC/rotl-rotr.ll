; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=ebc -verify-machineinstrs < %s \
; RUN:  | FileCheck -check-prefix=EBC %s

define i64 @rotl(i64 %x, i64 %y) {
; EBC-LABEL: rotl:
; EBC:       ; %bb.0:
; EBC-NEXT:    movqw r0, r0 (0,-32)
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    push64 r3
; EBC-NEXT:    movqw r7, r0 (0,48)
; EBC-NEXT:    movqq r1, @r7
; EBC-NEXT:    moviww r2, 64
; EBC-NEXT:    sub64 r2, r1
; EBC-NEXT:    movqw r7, r0 (0,40)
; EBC-NEXT:    movqq r3, @r7
; EBC-NEXT:    movqq r7, r3
; EBC-NEXT:    shl64 r7, r1
; EBC-NEXT:    shr64 r3, r2
; EBC-NEXT:    or64 r7, r3
; EBC-NEXT:    pop64 r3
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    movqw r0, r0 (0,32)
; EBC-NEXT:    ret
  %z = sub i64 64, %y
  %b = shl i64 %x, %y
  %c = lshr i64 %x, %z
  %d = or i64 %b, %c
  ret i64 %d
}

define i64 @rotr(i64 %x, i64 %y) {
; EBC-LABEL: rotr:
; EBC:       ; %bb.0:
; EBC-NEXT:    movqw r0, r0 (0,-32)
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    push64 r3
; EBC-NEXT:    movqw r7, r0 (0,48)
; EBC-NEXT:    movqq r1, @r7
; EBC-NEXT:    moviww r2, 64
; EBC-NEXT:    sub64 r2, r1
; EBC-NEXT:    movqw r7, r0 (0,40)
; EBC-NEXT:    movqq r3, @r7
; EBC-NEXT:    movqq r7, r3
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:    shl64 r3, r2
; EBC-NEXT:    or64 r7, r3
; EBC-NEXT:    pop64 r3
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    movqw r0, r0 (0,32)
; EBC-NEXT:    ret
  %z = sub i64 64, %y
  %b = lshr i64 %x, %y
  %c = shl i64 %x, %z
  %d = or i64 %b, %c
  ret i64 %d
}
