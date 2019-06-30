; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=ebc -verify-machineinstrs < %s \
; RUN:  | FileCheck -check-prefix=EBC %s

declare i16 @llvm.bswap.i16(i16)
declare i32 @llvm.bswap.i32(i32)
declare i64 @llvm.bswap.i64(i64)
declare i8 @llvm.cttz.i8(i8, i1)
declare i16 @llvm.cttz.i16(i16, i1)
declare i32 @llvm.cttz.i32(i32, i1)
declare i64 @llvm.cttz.i64(i64, i1)
declare i64 @llvm.ctlz.i64(i64, i1)
declare i64 @llvm.ctpop.i64(i64)

define i16 @test_bswap_i16(i16 %a) nounwind {
; EBC-LABEL: test_bswap_i16:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    movqw r1, r0 (0,24)
; EBC-NEXT:    movww r7, @r1
; EBC-NEXT:    extndw64 r1, r7
; EBC-NEXT:    moviww r2, 56
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    shl64 r7, r2
; EBC-NEXT:    moviww r2, 40
; EBC-NEXT:    shl64 r1, r2
; EBC-NEXT:    moviqq r2, 71776119061217280
; EBC-NEXT:    and64 r1, r2
; EBC-NEXT:    or64 r7, r1
; EBC-NEXT:    moviww r1, 48
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i16 @llvm.bswap.i16(i16 %a)
  ret i16 %tmp
}

define i32 @test_bswap_i32(i32 %a) nounwind {
; EBC-LABEL: test_bswap_i32:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    push64 r3
; EBC-NEXT:    movqw r1, r0 (0,32)
; EBC-NEXT:    movdw r7, @r1
; EBC-NEXT:    extndd64 r1, r7
; EBC-NEXT:    moviww r7, 8
; EBC-NEXT:    movqq r3, r1
; EBC-NEXT:    shl64 r3, r7
; EBC-NEXT:    moviqq r7, 1095216660480
; EBC-NEXT:    and64 r3, r7
; EBC-NEXT:    moviww r7, 24
; EBC-NEXT:    movqq r2, r1
; EBC-NEXT:    shl64 r2, r7
; EBC-NEXT:    moviqq r7, 280375465082880
; EBC-NEXT:    and64 r2, r7
; EBC-NEXT:    or64 r2, r3
; EBC-NEXT:    moviww r3, 56
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    shl64 r7, r3
; EBC-NEXT:    moviww r3, 40
; EBC-NEXT:    shl64 r1, r3
; EBC-NEXT:    moviqq r3, 71776119061217280
; EBC-NEXT:    and64 r1, r3
; EBC-NEXT:    or64 r7, r1
; EBC-NEXT:    or64 r7, r2
; EBC-NEXT:    moviww r1, 32
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:    pop64 r3
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i32 @llvm.bswap.i32(i32 %a)
  ret i32 %tmp
}

define i64 @test_bswap_i64(i64 %a) nounwind {
; EBC-LABEL: test_bswap_i64:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    push64 r3
; EBC-NEXT:    push64 r4
; EBC-NEXT:    push64 r5
; EBC-NEXT:    push64 r6
; EBC-NEXT:    movqw r7, r0 (0,72)
; EBC-NEXT:    movqq r2, @r7
; EBC-NEXT:    moviww r7, 24
; EBC-NEXT:    push64 r7
; EBC-NEXT:    movqq r4, r2
; EBC-NEXT:    shr64 r4, r7
; EBC-NEXT:    movidd r7, 16711680
; EBC-NEXT:    and64 r4, r7
; EBC-NEXT:    moviww r7, 8
; EBC-NEXT:    movqq r1, r2
; EBC-NEXT:    shr64 r1, r7
; EBC-NEXT:    moviqq r3, 4278190080
; EBC-NEXT:    and64 r1, r3
; EBC-NEXT:    movqq r3, r1
; EBC-NEXT:    moviww r1, 40
; EBC-NEXT:    push64 r1
; EBC-NEXT:    movqq r5, r2
; EBC-NEXT:    shr64 r5, r1
; EBC-NEXT:    movidd r6, 65280
; EBC-NEXT:    and64 r5, r6
; EBC-NEXT:    moviww r6, 56
; EBC-NEXT:    movqq r1, r2
; EBC-NEXT:    shr64 r1, r6
; EBC-NEXT:    or64 r5, r1
; EBC-NEXT:    or64 r3, r4
; EBC-NEXT:    movqq r1, r2
; EBC-NEXT:    shl64 r1, r7
; EBC-NEXT:    moviqq r7, 1095216660480
; EBC-NEXT:    and64 r1, r7
; EBC-NEXT:    movqq r4, r2
; EBC-NEXT:    pop64 r7
; EBC-NEXT:    shl64 r4, r7
; EBC-NEXT:    moviqq r7, 280375465082880
; EBC-NEXT:    and64 r4, r7
; EBC-NEXT:    or64 r3, r5
; EBC-NEXT:    or64 r4, r1
; EBC-NEXT:    movqq r7, r2
; EBC-NEXT:    shl64 r7, r6
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    shl64 r2, r1
; EBC-NEXT:    moviqq r1, 71776119061217280
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    or64 r7, r2
; EBC-NEXT:    or64 r7, r4
; EBC-NEXT:    or64 r7, r3
; EBC-NEXT:    pop64 r6
; EBC-NEXT:    pop64 r5
; EBC-NEXT:    pop64 r4
; EBC-NEXT:    pop64 r3
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i64 @llvm.bswap.i64(i64 %a)
  ret i64 %tmp
}

define i8 @test_cttz_i8(i8 %a) nounwind {
; EBC-LABEL: test_cttz_i8:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    push64 r3
; EBC-NEXT:    moviww r7, 8
; EBC-NEXT:    movqw r1, r0 (0,32)
; EBC-NEXT:    movqq r1, @r1
; EBC-NEXT:    moviww r2, 255
; EBC-NEXT:    movqq r3, r1
; EBC-NEXT:    and64 r3, r2
; EBC-NEXT:    moviww r2, 0
; EBC-NEXT:    cmp64eq r3, r2
; EBC-NEXT:    jmp64cs LBB3_2
; EBC-NEXT:  ; %bb.1: ; %cond.false
; EBC-NEXT:    moviww r2, -1
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    xor64 r7, r2
; EBC-NEXT:    and64 r7, r1 -1
; EBC-NEXT:    moviww r1, 1
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 6148914691236517205
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    sub64 r7, r2
; EBC-NEXT:    moviww r1, 2
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 3689348814741910323
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviww r1, 4
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviqq r1, 1085102592571150095
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    moviqq r1, 72340172838076673
; EBC-NEXT:    mul64 r7, r1
; EBC-NEXT:    moviww r1, 56
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:  LBB3_2: ; %cond.end
; EBC-NEXT:    pop64 r3
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i8 @llvm.cttz.i8(i8 %a, i1 false)
  ret i8 %tmp
}

define i16 @test_cttz_i16(i16 %a) nounwind {
; EBC-LABEL: test_cttz_i16:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    push64 r3
; EBC-NEXT:    moviww r7, 16
; EBC-NEXT:    movqw r1, r0 (0,32)
; EBC-NEXT:    movqq r1, @r1
; EBC-NEXT:    movidd r2, 65535
; EBC-NEXT:    movqq r3, r1
; EBC-NEXT:    and64 r3, r2
; EBC-NEXT:    moviww r2, 0
; EBC-NEXT:    cmp64eq r3, r2
; EBC-NEXT:    jmp64cs LBB4_2
; EBC-NEXT:  ; %bb.1: ; %cond.false
; EBC-NEXT:    moviww r2, -1
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    xor64 r7, r2
; EBC-NEXT:    and64 r7, r1 -1
; EBC-NEXT:    moviww r1, 1
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 6148914691236517205
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    sub64 r7, r2
; EBC-NEXT:    moviww r1, 2
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 3689348814741910323
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviww r1, 4
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviqq r1, 1085102592571150095
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    moviqq r1, 72340172838076673
; EBC-NEXT:    mul64 r7, r1
; EBC-NEXT:    moviww r1, 56
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:  LBB4_2: ; %cond.end
; EBC-NEXT:    pop64 r3
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i16 @llvm.cttz.i16(i16 %a, i1 false)
  ret i16 %tmp
}

define i32 @test_cttz_i32(i32 %a) nounwind {
; EBC-LABEL: test_cttz_i32:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    push64 r3
; EBC-NEXT:    moviww r7, 32
; EBC-NEXT:    movqw r1, r0 (0,32)
; EBC-NEXT:    movqq r1, @r1
; EBC-NEXT:    moviqq r2, 4294967295
; EBC-NEXT:    movqq r3, r1
; EBC-NEXT:    and64 r3, r2
; EBC-NEXT:    moviww r2, 0
; EBC-NEXT:    cmp64eq r3, r2
; EBC-NEXT:    jmp64cs LBB5_2
; EBC-NEXT:  ; %bb.1: ; %cond.false
; EBC-NEXT:    moviww r2, -1
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    xor64 r7, r2
; EBC-NEXT:    and64 r7, r1 -1
; EBC-NEXT:    moviww r1, 1
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 6148914691236517205
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    sub64 r7, r2
; EBC-NEXT:    moviww r1, 2
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 3689348814741910323
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviww r1, 4
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviqq r1, 1085102592571150095
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    moviqq r1, 72340172838076673
; EBC-NEXT:    mul64 r7, r1
; EBC-NEXT:    moviww r1, 56
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:  LBB5_2: ; %cond.end
; EBC-NEXT:    pop64 r3
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i32 @llvm.cttz.i32(i32 %a, i1 false)
  ret i32 %tmp
}

define i64 @test_cttz_i64(i64 %a) nounwind {
; EBC-LABEL: test_cttz_i64:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    moviww r7, 64
; EBC-NEXT:    movqw r1, r0 (0,24)
; EBC-NEXT:    movqq r1, @r1
; EBC-NEXT:    moviww r2, 0
; EBC-NEXT:    cmp64eq r1, r2
; EBC-NEXT:    jmp64cs LBB6_2
; EBC-NEXT:  ; %bb.1: ; %cond.false
; EBC-NEXT:    moviww r2, -1
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    xor64 r7, r2
; EBC-NEXT:    and64 r7, r1 -1
; EBC-NEXT:    moviww r1, 1
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 6148914691236517205
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    sub64 r7, r2
; EBC-NEXT:    moviww r1, 2
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 3689348814741910323
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviww r1, 4
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviqq r1, 1085102592571150095
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    moviqq r1, 72340172838076673
; EBC-NEXT:    mul64 r7, r1
; EBC-NEXT:    moviww r1, 56
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:  LBB6_2: ; %cond.end
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i64 @llvm.cttz.i64(i64 %a, i1 false)
  ret i64 %tmp
}

define i8 @test_cttz_i8_zero_undef(i8 %a) nounwind {
; EBC-LABEL: test_cttz_i8_zero_undef:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    movqw r1, r0 (0,24)
; EBC-NEXT:    movbw r7, @r1
; EBC-NEXT:    extndb64 r1, r7
; EBC-NEXT:    moviww r2, -1
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    xor64 r7, r2
; EBC-NEXT:    and64 r7, r1 -1
; EBC-NEXT:    moviww r1, 1
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 6148914691236517205
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    sub64 r7, r2
; EBC-NEXT:    moviww r1, 2
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 3689348814741910323
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviww r1, 4
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviqq r1, 1085102592571150095
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    moviqq r1, 72340172838076673
; EBC-NEXT:    mul64 r7, r1
; EBC-NEXT:    moviww r1, 56
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i8 @llvm.cttz.i8(i8 %a, i1 true)
  ret i8 %tmp
}

define i16 @test_cttz_i16_zero_undef(i16 %a) nounwind {
; EBC-LABEL: test_cttz_i16_zero_undef:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    movqw r1, r0 (0,24)
; EBC-NEXT:    movww r7, @r1
; EBC-NEXT:    extndw64 r1, r7
; EBC-NEXT:    moviww r2, -1
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    xor64 r7, r2
; EBC-NEXT:    and64 r7, r1 -1
; EBC-NEXT:    moviww r1, 1
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 6148914691236517205
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    sub64 r7, r2
; EBC-NEXT:    moviww r1, 2
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 3689348814741910323
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviww r1, 4
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviqq r1, 1085102592571150095
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    moviqq r1, 72340172838076673
; EBC-NEXT:    mul64 r7, r1
; EBC-NEXT:    moviww r1, 56
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i16 @llvm.cttz.i16(i16 %a, i1 true)
  ret i16 %tmp
}

define i32 @test_cttz_i32_zero_undef(i32 %a) nounwind {
; EBC-LABEL: test_cttz_i32_zero_undef:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    movqw r1, r0 (0,24)
; EBC-NEXT:    movdw r7, @r1
; EBC-NEXT:    extndd64 r1, r7
; EBC-NEXT:    moviww r2, -1
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    xor64 r7, r2
; EBC-NEXT:    and64 r7, r1 -1
; EBC-NEXT:    moviww r1, 1
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 6148914691236517205
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    sub64 r7, r2
; EBC-NEXT:    moviww r1, 2
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 3689348814741910323
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviww r1, 4
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviqq r1, 1085102592571150095
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    moviqq r1, 72340172838076673
; EBC-NEXT:    mul64 r7, r1
; EBC-NEXT:    moviww r1, 56
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i32 @llvm.cttz.i32(i32 %a, i1 true)
  ret i32 %tmp
}

define i64 @test_cttz_i64_zero_undef(i64 %a) nounwind {
; EBC-LABEL: test_cttz_i64_zero_undef:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    movqw r7, r0 (0,24)
; EBC-NEXT:    movqq r1, @r7
; EBC-NEXT:    moviww r2, -1
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    xor64 r7, r2
; EBC-NEXT:    and64 r7, r1 -1
; EBC-NEXT:    moviww r1, 1
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 6148914691236517205
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    sub64 r7, r2
; EBC-NEXT:    moviww r1, 2
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 3689348814741910323
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviww r1, 4
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviqq r1, 1085102592571150095
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    moviqq r1, 72340172838076673
; EBC-NEXT:    mul64 r7, r1
; EBC-NEXT:    moviww r1, 56
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i64 @llvm.cttz.i64(i64 %a, i1 true)
  ret i64 %tmp
}

define i64 @test_ctlz_i64(i64 %a) nounwind {
; EBC-LABEL: test_ctlz_i64:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    push64 r3
; EBC-NEXT:    push64 r4
; EBC-NEXT:    push64 r5
; EBC-NEXT:    moviww r7, 64
; EBC-NEXT:    movqw r1, r0 (0,48)
; EBC-NEXT:    movqq r1, @r1
; EBC-NEXT:    moviww r2, 0
; EBC-NEXT:    cmp64eq r1, r2
; EBC-NEXT:    jmp64cs LBB11_2
; EBC-NEXT:  ; %bb.1: ; %cond.false
; EBC-NEXT:    moviww r3, 1
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    shr64 r7, r3
; EBC-NEXT:    or64 r1, r7
; EBC-NEXT:    moviww r2, 2
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:    shr64 r7, r2
; EBC-NEXT:    or64 r1, r7
; EBC-NEXT:    moviww r7, 4
; EBC-NEXT:    movqq r4, r1
; EBC-NEXT:    shr64 r4, r7
; EBC-NEXT:    or64 r1, r4
; EBC-NEXT:    moviww r4, 8
; EBC-NEXT:    movqq r5, r1
; EBC-NEXT:    shr64 r5, r4
; EBC-NEXT:    or64 r1, r5
; EBC-NEXT:    moviww r4, 16
; EBC-NEXT:    movqq r5, r1
; EBC-NEXT:    shr64 r5, r4
; EBC-NEXT:    or64 r1, r5
; EBC-NEXT:    moviww r4, 32
; EBC-NEXT:    movqq r5, r1
; EBC-NEXT:    shr64 r5, r4
; EBC-NEXT:    or64 r1, r5
; EBC-NEXT:    moviww r4, -1
; EBC-NEXT:    xor64 r1, r4
; EBC-NEXT:    movqq r4, r1
; EBC-NEXT:    shr64 r4, r3
; EBC-NEXT:    moviqq r3, 6148914691236517205
; EBC-NEXT:    and64 r4, r3
; EBC-NEXT:    sub64 r1, r4
; EBC-NEXT:    movqq r3, r1
; EBC-NEXT:    shr64 r3, r2
; EBC-NEXT:    moviqq r2, 3689348814741910323
; EBC-NEXT:    and64 r1, r2
; EBC-NEXT:    and64 r3, r2
; EBC-NEXT:    add64 r1, r3
; EBC-NEXT:    movqq r2, r1
; EBC-NEXT:    shr64 r2, r7
; EBC-NEXT:    add64 r1, r2
; EBC-NEXT:    moviqq r7, 1085102592571150095
; EBC-NEXT:    and64 r1, r7
; EBC-NEXT:    moviqq r7, 72340172838076673
; EBC-NEXT:    mul64 r1, r7
; EBC-NEXT:    moviww r7, 56
; EBC-NEXT:    shr64 r1, r7
; EBC-NEXT:    movqq r7, r1
; EBC-NEXT:  LBB11_2: ; %cond.end
; EBC-NEXT:    pop64 r5
; EBC-NEXT:    pop64 r4
; EBC-NEXT:    pop64 r3
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i64 @llvm.ctlz.i64(i64 %a, i1 false)
  ret i64 %tmp
}

define i64 @test_ctpop_i64(i64 %a) nounwind {
; EBC-LABEL: test_ctpop_i64:
; EBC:       ; %bb.0:
; EBC-NEXT:    push64 r1
; EBC-NEXT:    push64 r2
; EBC-NEXT:    movqw r7, r0 (0,24)
; EBC-NEXT:    movqq r7, @r7
; EBC-NEXT:    moviww r1, 1
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 6148914691236517205
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    sub64 r7, r2
; EBC-NEXT:    moviww r1, 2
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    moviqq r1, 3689348814741910323
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    and64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviww r1, 4
; EBC-NEXT:    movqq r2, r7
; EBC-NEXT:    shr64 r2, r1
; EBC-NEXT:    add64 r7, r2
; EBC-NEXT:    moviqq r1, 1085102592571150095
; EBC-NEXT:    and64 r7, r1
; EBC-NEXT:    moviqq r1, 72340172838076673
; EBC-NEXT:    mul64 r7, r1
; EBC-NEXT:    moviww r1, 56
; EBC-NEXT:    shr64 r7, r1
; EBC-NEXT:    pop64 r2
; EBC-NEXT:    pop64 r1
; EBC-NEXT:    ret
  %tmp = call i64 @llvm.ctpop.i64(i64 %a)
  ret i64 %tmp
}
