; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=ebc -verify-machineinstrs < %s \
; RUN:  | FileCheck %s -check-prefix=EBC

define void @ret() nounwind {
; EBC-LABEL:  ret:
; EBC:        ; %bb.0:
; EBC-NEXT:     ret
  ret void
}
