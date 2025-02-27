; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs < %s | FileCheck %s

target datalayout = "e-m:e-p:16:8-i16:8-i32:8-i64:8-f32:8-f64:8-a:8-Fi8-n8"
target triple = "mos"

declare i16 @llvm.fshl.i16 (i16 %a, i16 %b, i16 %c)
declare i16 @llvm.fshr.i16 (i16 %a, i16 %b, i16 %c)

define i16 @shl_1(i16 %a) {
; CHECK-LABEL: shl_1:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    asl
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = shl i16 %a, 1
  ret i16 %0
}
define i16 @shl_2(i16 %a) {
; CHECK-LABEL: shl_2:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    asl
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    asl
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = shl i16 %a, 2
  ret i16 %0
}
define i16 @shl_4(i16 %a) {
; CHECK-LABEL: shl_4:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    asl
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    asl
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    asl
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    asl
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = shl i16 %a, 4
  ret i16 %0
}
define i16 @shl_5(i16 %a) {
; CHECK-LABEL: shl_5:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    stx mos8(__rc3)
; CHECK-NEXT:    lsr mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    lda #0
; CHECK-NEXT:    ror
; CHECK-NEXT:    lsr mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    lsr mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = shl i16 %a, 5
  ret i16 %0
}
define i16 @shl_7(i16 %a) {
; CHECK-LABEL: shl_7:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    lsr
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    lda #0
; CHECK-NEXT:    ror
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = shl i16 %a, 7
  ret i16 %0
}
define i16 @shl_8(i16 %a) {
; CHECK-LABEL: shl_8:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda #0
; CHECK-NEXT:    rts
entry:
  %0 = shl i16 %a, 8
  ret i16 %0
}
define i16 @shl_15(i16 %a) {
; CHECK-LABEL: shl_15:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    lsr
; CHECK-NEXT:    lda #0
; CHECK-NEXT:    ror
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda #0
; CHECK-NEXT:    ror
; CHECK-NEXT:    rts
entry:
  %0 = shl i16 %a, 15
  ret i16 %0
}

define i32 @shl_32_1(i32 %a) {
; CHECK-LABEL: shl_32_1:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc4)
; CHECK-NEXT:    asl
; CHECK-NEXT:    rol mos8(__rc4)
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol mos8(__rc3)
; CHECK-NEXT:    ldx mos8(__rc4)
; CHECK-NEXT:    rts
entry:
  %0 = shl i32 %a, 1
  ret i32 %0
}

define i16 @lshr_1(i16 %a) {
; CHECK-LABEL: lshr_1:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    lsr mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = lshr i16 %a, 1
  ret i16 %0
}
define i16 @lshr_2(i16 %a) {
; CHECK-LABEL: lshr_2:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    lsr mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    lsr mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = lshr i16 %a, 2
  ret i16 %0
}
define i16 @lshr_4(i16 %a) {
; CHECK-LABEL: lshr_4:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    lsr mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    lsr mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    lsr mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    lsr mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = lshr i16 %a, 4
  ret i16 %0
}
define i16 @lshr_5(i16 %a) {
; CHECK-LABEL: lshr_5:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc3)
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    asl mos8(__rc3)
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    lda #0
; CHECK-NEXT:    rol
; CHECK-NEXT:    asl mos8(__rc3)
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    asl mos8(__rc3)
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = lshr i16 %a, 5
  ret i16 %0
}
define i16 @lshr_7(i16 %a) {
; CHECK-LABEL: lshr_7:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    asl
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    lda #0
; CHECK-NEXT:    rol
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = lshr i16 %a, 7
  ret i16 %0
}
define i16 @lshr_8(i16 %a) {
; CHECK-LABEL: lshr_8:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    txa
; CHECK-NEXT:    ldx #0
; CHECK-NEXT:    rts
entry:
  %0 = lshr i16 %a, 8
  ret i16 %0
}
define i16 @lshr_15(i16 %a) {
; CHECK-LABEL: lshr_15:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    txa
; CHECK-NEXT:    asl
; CHECK-NEXT:    lda #0
; CHECK-NEXT:    rol
; CHECK-NEXT:    tay
; CHECK-NEXT:    lda #0
; CHECK-NEXT:    rol
; CHECK-NEXT:    tax
; CHECK-NEXT:    tya
; CHECK-NEXT:    rts
entry:
  %0 = lshr i16 %a, 15
  ret i16 %0
}

define i16 @ashr_1(i16 %a) {
; CHECK-LABEL: ashr_1:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    cpx #128
; CHECK-NEXT:    ror
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = ashr i16 %a, 1
  ret i16 %0
}
define i16 @ashr_2(i16 %a) {
; CHECK-LABEL: ashr_2:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    cpx #128
; CHECK-NEXT:    ror
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    cmp #128
; CHECK-NEXT:    ror
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = ashr i16 %a, 2
  ret i16 %0
}
define i16 @ashr_4(i16 %a) {
; CHECK-LABEL: ashr_4:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    cpx #128
; CHECK-NEXT:    ror
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    cmp #128
; CHECK-NEXT:    ror
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    cmp #128
; CHECK-NEXT:    ror
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    cmp #128
; CHECK-NEXT:    ror
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = ashr i16 %a, 4
  ret i16 %0
}
define i16 @ashr_5(i16 %a) {
; CHECK-LABEL: ashr_5:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    bpl .LBB18_2
; CHECK-NEXT:  ; %bb.1: ; %entry
; CHECK-NEXT:    ldx #-1
; CHECK-NEXT:    jmp .LBB18_3
; CHECK-NEXT:  .LBB18_2: ; %entry
; CHECK-NEXT:    ldx #0
; CHECK-NEXT:  .LBB18_3: ; %entry
; CHECK-NEXT:    asl mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    stx mos8(__rc3)
; CHECK-NEXT:    rol mos8(__rc3)
; CHECK-NEXT:    asl mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    rol mos8(__rc3)
; CHECK-NEXT:    asl mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    rol mos8(__rc3)
; CHECK-NEXT:    ldx mos8(__rc3)
; CHECK-NEXT:    rts
entry:
  %0 = ashr i16 %a, 5
  ret i16 %0
}
define i16 @ashr_7(i16 %a) {
; CHECK-LABEL: ashr_7:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    bpl .LBB19_2
; CHECK-NEXT:  ; %bb.1: ; %entry
; CHECK-NEXT:    ldx #-1
; CHECK-NEXT:    jmp .LBB19_3
; CHECK-NEXT:  .LBB19_2: ; %entry
; CHECK-NEXT:    ldx #0
; CHECK-NEXT:  .LBB19_3: ; %entry
; CHECK-NEXT:    asl mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = ashr i16 %a, 7
  ret i16 %0
}
define i16 @ashr_8(i16 %a) {
; CHECK-LABEL: ashr_8:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    txa
; CHECK-NEXT:    bpl .LBB20_2
; CHECK-NEXT:  ; %bb.1: ; %entry
; CHECK-NEXT:    ldx #-1
; CHECK-NEXT:    rts
; CHECK-NEXT:  .LBB20_2: ; %entry
; CHECK-NEXT:    ldx #0
; CHECK-NEXT:    rts
entry:
  %0 = ashr i16 %a, 8
  ret i16 %0
}
define i16 @ashr_15(i16 %a) {
; CHECK-LABEL: ashr_15:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    bpl .LBB21_3
; CHECK-NEXT:  ; %bb.1: ; %entry
; CHECK-NEXT:    ldx #-1
; CHECK-NEXT:    txa
; CHECK-NEXT:    bmi .LBB21_4
; CHECK-NEXT:  .LBB21_2: ; %entry
; CHECK-NEXT:    ldx #0
; CHECK-NEXT:    jmp .LBB21_5
; CHECK-NEXT:  .LBB21_3: ; %entry
; CHECK-NEXT:    ldx #0
; CHECK-NEXT:    txa
; CHECK-NEXT:    bpl .LBB21_2
; CHECK-NEXT:  .LBB21_4: ; %entry
; CHECK-NEXT:    ldx #-1
; CHECK-NEXT:  .LBB21_5: ; %entry
; CHECK-NEXT:    asl mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = ashr i16 %a, 15
  ret i16 %0
}
define i32 @ashr_16(i32 %a) {
; CHECK-LABEL: ashr_16:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    ldx mos8(__rc3)
; CHECK-NEXT:    bpl .LBB22_2
; CHECK-NEXT:  ; %bb.1: ; %entry
; CHECK-NEXT:    ldy #-1
; CHECK-NEXT:    jmp .LBB22_3
; CHECK-NEXT:  .LBB22_2: ; %entry
; CHECK-NEXT:    ldy #0
; CHECK-NEXT:  .LBB22_3: ; %entry
; CHECK-NEXT:    sty mos8(__rc2)
; CHECK-NEXT:    sty mos8(__rc3)
; CHECK-NEXT:    rts
entry:
  %0 = ashr i32 %a, 16
  ret i32 %0
}

define i16 @rol_1(i16 %a) {
; CHECK-LABEL: rol_1:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    cpx #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshl.i16(i16 %a, i16 %a, i16 1)
  ret i16 %0
}
define i16 @rol_2(i16 %a) {
; CHECK-LABEL: rol_2:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    cpx #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    cmp #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshl.i16(i16 %a, i16 %a, i16 2)
  ret i16 %0
}
define i16 @rol_4(i16 %a) {
; CHECK-LABEL: rol_4:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    cpx #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    cmp #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    cmp #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    cmp #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshl.i16(i16 %a, i16 %a, i16 4)
  ret i16 %0
}
define i16 @rol_5(i16 %a) {
; CHECK-LABEL: rol_5:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    stx mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    stx mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    stx mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshl.i16(i16 %a, i16 %a, i16 5)
  ret i16 %0
}
define i16 @rol_7(i16 %a) {
; CHECK-LABEL: rol_7:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    stx mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshl.i16(i16 %a, i16 %a, i16 7)
  ret i16 %0
}
define i16 @rol_8(i16 %a) {
; CHECK-LABEL: rol_8:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshl.i16(i16 %a, i16 %a, i16 8)
  ret i16 %0
}
define i16 @rol_15(i16 %a) {
; CHECK-LABEL: rol_15:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    sta mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshl.i16(i16 %a, i16 %a, i16 15)
  ret i16 %0
}

define i16 @ror_1(i16 %a) {
; CHECK-LABEL: ror_1:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    sta mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshr.i16(i16 %a, i16 %a, i16 1)
  ret i16 %0
}
define i16 @ror_2(i16 %a) {
; CHECK-LABEL: ror_2:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    sta mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    sta mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshr.i16(i16 %a, i16 %a, i16 2)
  ret i16 %0
}
define i16 @ror_4(i16 %a) {
; CHECK-LABEL: ror_4:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    sta mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    sta mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    sta mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    sta mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc3)
; CHECK-NEXT:    ror mos8(__rc2)
; CHECK-NEXT:    ror
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshr.i16(i16 %a, i16 %a, i16 4)
  ret i16 %0
}
define i16 @ror_5(i16 %a) {
; CHECK-LABEL: ror_5:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    cpx #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    cmp #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    cmp #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshr.i16(i16 %a, i16 %a, i16 5)
  ret i16 %0
}
define i16 @ror_7(i16 %a) {
; CHECK-LABEL: ror_7:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sta mos8(__rc2)
; CHECK-NEXT:    txa
; CHECK-NEXT:    cpx #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshr.i16(i16 %a, i16 %a, i16 7)
  ret i16 %0
}
define i16 @ror_8(i16 %a) {
; CHECK-LABEL: ror_8:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    tax
; CHECK-NEXT:    lda mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshr.i16(i16 %a, i16 %a, i16 8)
  ret i16 %0
}
define i16 @ror_15(i16 %a) {
; CHECK-LABEL: ror_15:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    stx mos8(__rc2)
; CHECK-NEXT:    cmp #128
; CHECK-NEXT:    rol mos8(__rc2)
; CHECK-NEXT:    rol
; CHECK-NEXT:    ldx mos8(__rc2)
; CHECK-NEXT:    rts
entry:
  %0 = call i16 @llvm.fshr.i16(i16 %a, i16 %a, i16 15)
  ret i16 %0
}
