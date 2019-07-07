; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=ebc -verify-machineinstrs < %s \
; RUN:  | FileCheck -check-prefix=EBC %s

declare i64 @external_function(i64)

define i64 @test_call_external(i64 %a) nounwind {
; EBC-LABEL: test_call_external:
; EBC:       ; %bb.0:
; EBC-NEXT:    movqw r0, r0 (0,-8)
; EBC-NEXT:    push64 r1
; EBC-NEXT:    moviww r7, -8
; EBC-NEXT:    movqq r1, r0
; EBC-NEXT:    add64 r1, r7
; EBC-NEXT:    movqw r7, r0 (0,24)
; EBC-NEXT:    movqq r7, @r7
; EBC-NEXT:    movqq @r1, r7
; EBC-NEXT:    call64 external_function
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    movqw r0, r0 (0,8)
; EBC-NEXT:    ret
  %1 = call i64 @external_function(i64 %a)
  ret i64 %1
}

define i64 @defined_function(i64 %a) nounwind {
; EBC-LABEL: defined_function:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    movqw r7, r0 (0,16)
; EBC-NEXT:    movqq r7, @r7
; EBC-NEXT:    moviww r1, 1
; EBC-NEXT:    add64 r7, r1
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %1 = add i64 %a, 1
  ret i64 %1
}

define i64 @test_call_defined(i64 %a) nounwind {
; EBC-LABEL: test_call_defined:
; EBC:       ; %bb.0:
; EBC-NEXT:    movqw r0, r0 (0,-8)
; EBC-NEXT:    push64 r1
; EBC-NEXT:    moviww r7, -8
; EBC-NEXT:    movqq r1, r0
; EBC-NEXT:    add64 r1, r7
; EBC-NEXT:    movqw r7, r0 (0,24)
; EBC-NEXT:    movqq r7, @r7
; EBC-NEXT:    movqq @r1, r7
; EBC-NEXT:    call64 defined_function
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    movqw r0, r0 (0,8)
; EBC-NEXT:    ret
  %1 = call i64 @defined_function(i64 %a) nounwind
  ret i64 %1
}

define i64 @test_call_indirect(i64 (i64)* %a, i64 %b) nounwind {
; EBC-LABEL: test_call_indirect:
; EBC:       ; %bb.0:
; EBC-NEXT:    movqw r0, r0 (0,-8)
; EBC-NEXT:    push64 r1
; EBC-NEXT:    moviww r7, -8
; EBC-NEXT:    movqq r1, r0
; EBC-NEXT:    add64 r1, r7
; EBC-NEXT:    movqw r7, r0 (0,32)
; EBC-NEXT:    movqq r7, @r7
; EBC-NEXT:    movqq @r1, r7
; EBC-NEXT:    movqw r7, r0 (0,24)
; EBC-NEXT:    call32a @r7
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    movqw r0, r0 (0,8)
; EBC-NEXT:    ret
  %1 = call i64 %a(i64 %b)
  ret i64 %1
}

; Ensure that calls to fastcc functions aren't rejected. Such calls may be
; introduced when compiling with optimization.

define fastcc i64 @fastcc_function(i64 %a, i64 %b) nounwind {
; EBC-LABEL: fastcc_function:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    movqw r7, r0 (0,24)
; EBC-NEXT:    movqq r1, @r7
; EBC-NEXT:    movqw r7, r0 (0,16)
; EBC-NEXT:    movqq r7, @r7
; EBC-NEXT:    add64 r7, r1
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %1 = add i64 %a, %b
  ret i64 %1
}

define i64 @test_call_fastcc(i64 %a, i64 %b) nounwind {
; EBC-LABEL: test_call_fastcc:
; EBC:       ; %bb.0:
; EBC-NEXT:    movqw r0, r0 (0,-16)
; EBC-NEXT:    push64 r1
; EBC-NEXT:    moviww r7, -16
; EBC-NEXT:    movqq r1, r0
; EBC-NEXT:    add64 r1, r7
; EBC-NEXT:    movqw r7, r0 (0,40)
; EBC-NEXT:    movqq r7, @r7
; EBC-NEXT:    movqq @r1, r7
; EBC-NEXT:    moviww r7, -8
; EBC-NEXT:    movqq r1, r0
; EBC-NEXT:    add64 r1, r7
; EBC-NEXT:    movqw r7, r0 (0,32)
; EBC-NEXT:    movqq r7, @r7
; EBC-NEXT:    movqq @r1, r7
; EBC-NEXT:    call64 fastcc_function
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    movqw r0, r0 (0,16)
; EBC-NEXT:    ret
  %1 = call fastcc i64 @fastcc_function(i64 %a, i64 %b)
  ret i64 %1
}
