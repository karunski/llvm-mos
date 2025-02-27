; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs < %s | FileCheck %s

target datalayout = "e-m:e-p:16:8-i16:8-i32:8-i64:8-f32:8-f64:8-a:8-Fi8-n8"
target triple = "mos"

define i8 @add_i8(i8 %a, i8 %b) {
; CHECK-LABEL: add_i8:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    clc
; CHECK-NEXT:    adc mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = add i8 %a, %b
  ret i8 %0
}

define i16 @add_i16(i16 %a, i16 %b) {
; CHECK-LABEL: add_i16:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    clc
; CHECK-NEXT:    adc mos8(__rc2)
; CHECK-NEXT:    tay
; CHECK-NEXT:    txa
; CHECK-NEXT:    adc mos8(__rc3)
; CHECK-NEXT:    tax
; CHECK-NEXT:    tya
; CHECK-NEXT:    rts
entry:
  %0 = add i16 %a, %b
  ret i16 %0
}

define i8* @add_ptr(i8* %a, i16 %b) {
; CHECK-LABEL: add_ptr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc4)
; CHECK-NEXT:    clc
; CHECK-NEXT:    adc mos8(__rc2)
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    lda mos8(__rc3)
; CHECK-NEXT:    adc mos8(__rc4)
; CHECK-NEXT:    sta mos8(__rc3)
; CHECK-NEXT:    rts
entry:
  %0 = sext i16 %b to i32
  %1 = getelementptr i8, i8* %a, i32 %0
  ret i8* %1
}

define i8 @sub_i8(i8 %a, i8 %b) {
; CHECK-LABEL: sub_i8:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    sec
; CHECK-NEXT:    sbc mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = sub i8 %a, %b
  ret i8 %0
}

define i16 @sub_i16(i16 %a, i16 %b) {
; CHECK-LABEL: sub_i16:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sec
; CHECK-NEXT:    sbc mos8(__rc2)
; CHECK-NEXT:    tay
; CHECK-NEXT:    txa
; CHECK-NEXT:    sbc mos8(__rc3)
; CHECK-NEXT:    tax
; CHECK-NEXT:    tya
; CHECK-NEXT:    rts
entry:
  %0 = sub i16 %a, %b
  ret i16 %0
}

define i8* @sub_ptr(i8* %a, i16 %b) {
; CHECK-LABEL: sub_ptr:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc4)
; CHECK-NEXT:    stx mos8(__rc5)
; CHECK-NEXT:    sec
; CHECK-NEXT:    lda #0
; CHECK-NEXT:    sbc mos8(__rc4)
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda #0
; CHECK-NEXT:    sbc mos8(__rc5)
; CHECK-NEXT:    sta mos8(__rc4)
; CHECK-NEXT:    clc
; CHECK-NEXT:    txa
; CHECK-NEXT:    adc mos8(__rc2)
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    lda mos8(__rc3)
; CHECK-NEXT:    adc mos8(__rc4)
; CHECK-NEXT:    sta mos8(__rc3)
; CHECK-NEXT:    rts
entry:
  %0 = sub i16 0, %b
  %1 = sext i16 %0 to i32
  %2 = getelementptr i8, i8* %a, i32 %1
  ret i8* %2
}
