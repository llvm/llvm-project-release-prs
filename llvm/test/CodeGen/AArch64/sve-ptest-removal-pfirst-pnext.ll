; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64--linux-gnu -mattr=+sve %s -o - | FileCheck %s

define i32 @pfirst_16(<vscale x 16 x i1> %pg, <vscale x 16 x i1> %a) {
; CHECK-LABEL: pfirst_16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    pfirst p1.b, p0, p1.b
; CHECK-NEXT:    cset w0, ne
; CHECK-NEXT:    ret
  %1 = tail call <vscale x 16 x i1> @llvm.aarch64.sve.pfirst.nxv16i1(<vscale x 16 x i1> %pg, <vscale x 16 x i1> %a)
  %2 = tail call i1 @llvm.aarch64.sve.ptest.any.nxv16i1(<vscale x 16 x i1> %pg, <vscale x 16 x i1> %1)
  %conv = zext i1 %2 to i32
  ret i32 %conv
}

define i32 @pnext_2(<vscale x 2 x i1> %pg, <vscale x 2 x i1> %a) {
; CHECK-LABEL: pnext_2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    pnext p1.d, p0, p1.d
; CHECK-NEXT:    cset w0, ne
; CHECK-NEXT:    ret
  %1 = tail call <vscale x 2 x i1> @llvm.aarch64.sve.pnext.nxv2i1(<vscale x 2 x i1> %pg, <vscale x 2 x i1> %a)
  %2 = tail call i1 @llvm.aarch64.sve.ptest.any.nxv2i1(<vscale x 2 x i1> %pg, <vscale x 2 x i1> %1)
  %conv = zext i1 %2 to i32
  ret i32 %conv
}

define i32 @pnext_4(<vscale x 4 x i1> %pg, <vscale x 4 x i1> %a) {
; CHECK-LABEL: pnext_4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    pnext p1.s, p0, p1.s
; CHECK-NEXT:    cset w0, ne
; CHECK-NEXT:    ret
  %1 = tail call <vscale x 4 x i1> @llvm.aarch64.sve.pnext.nxv4i1(<vscale x 4 x i1> %pg, <vscale x 4 x i1> %a)
  %2 = tail call i1 @llvm.aarch64.sve.ptest.any.nxv4i1(<vscale x 4 x i1> %pg, <vscale x 4 x i1> %1)
  %conv = zext i1 %2 to i32
  ret i32 %conv
}

define i32 @pnext_8(<vscale x 8 x i1> %pg, <vscale x 8 x i1> %a) {
; CHECK-LABEL: pnext_8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    pnext p1.h, p0, p1.h
; CHECK-NEXT:    cset w0, ne
; CHECK-NEXT:    ret
  %1 = tail call <vscale x 8 x i1> @llvm.aarch64.sve.pnext.nxv8i1(<vscale x 8 x i1> %pg, <vscale x 8 x i1> %a)
  %2 = tail call i1 @llvm.aarch64.sve.ptest.any.nxv8i1(<vscale x 8 x i1> %pg, <vscale x 8 x i1> %1)
  %conv = zext i1 %2 to i32
  ret i32 %conv
}

define i32 @pnext_16(<vscale x 16 x i1> %pg, <vscale x 16 x i1> %a) {
; CHECK-LABEL: pnext_16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    pnext p1.b, p0, p1.b
; CHECK-NEXT:    cset w0, ne
; CHECK-NEXT:    ret
  %1 = tail call <vscale x 16 x i1> @llvm.aarch64.sve.pnext.nxv16i1(<vscale x 16 x i1> %pg, <vscale x 16 x i1> %a)
  %2 = tail call i1 @llvm.aarch64.sve.ptest.any.nxv16i1(<vscale x 16 x i1> %pg, <vscale x 16 x i1> %1)
  %conv = zext i1 %2 to i32
  ret i32 %conv
}

declare <vscale x 16 x i1> @llvm.aarch64.sve.pfirst.nxv16i1(<vscale x 16 x i1>, <vscale x 16 x i1>)

declare <vscale x 16 x i1> @llvm.aarch64.sve.pnext.nxv16i1(<vscale x 16 x i1>, <vscale x 16 x i1>)
declare <vscale x 8 x i1> @llvm.aarch64.sve.pnext.nxv8i1(<vscale x 8 x i1>, <vscale x 8 x i1>)
declare <vscale x 4 x i1> @llvm.aarch64.sve.pnext.nxv4i1(<vscale x 4 x i1>, <vscale x 4 x i1>)
declare <vscale x 2 x i1> @llvm.aarch64.sve.pnext.nxv2i1(<vscale x 2 x i1>, <vscale x 2 x i1>)

declare i1 @llvm.aarch64.sve.ptest.any.nxv16i1(<vscale x 16 x i1>, <vscale x 16 x i1>)
declare i1 @llvm.aarch64.sve.ptest.any.nxv8i1(<vscale x 8 x i1>, <vscale x 8 x i1>)
declare i1 @llvm.aarch64.sve.ptest.any.nxv4i1(<vscale x 4 x i1>, <vscale x 4 x i1>)
declare i1 @llvm.aarch64.sve.ptest.any.nxv2i1(<vscale x 2 x i1>, <vscale x 2 x i1>)
