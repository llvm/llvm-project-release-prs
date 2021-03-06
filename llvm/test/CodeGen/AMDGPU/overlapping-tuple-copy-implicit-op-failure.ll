; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -global-isel -O0 -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1031 -verify-machineinstrs < %s | FileCheck %s

; Testcase which happened to trigger a liveness verifier error
define amdgpu_kernel void @test_long_add4(<4 x i64> %arg) #0 {
; CHECK-LABEL: test_long_add4:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    s_mov_b64 s[4:5], 0
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    global_load_dwordx4 v[7:10], v[0:1], off
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    global_load_dwordx4 v[0:3], v[0:1], off offset:16
; CHECK-NEXT:    ; kill: def $vgpr7_vgpr8_vgpr9_vgpr10 killed $vgpr7_vgpr8_vgpr9_vgpr10 def $vgpr7_vgpr8_vgpr9_vgpr10_vgpr11_vgpr12_vgpr13_vgpr14 killed $exec
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v14, v3
; CHECK-NEXT:    v_mov_b32_e32 v13, v2
; CHECK-NEXT:    v_mov_b32_e32 v12, v1
; CHECK-NEXT:    v_mov_b32_e32 v11, v0
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    global_load_dwordx4 v[18:21], v[0:1], off
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    global_load_dwordx4 v[0:3], v[0:1], off offset:16
; CHECK-NEXT:    ; kill: def $vgpr18_vgpr19_vgpr20_vgpr21 killed $vgpr18_vgpr19_vgpr20_vgpr21 def $vgpr18_vgpr19_vgpr20_vgpr21_vgpr22_vgpr23_vgpr24_vgpr25 killed $exec
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v25, v3
; CHECK-NEXT:    v_mov_b32_e32 v24, v2
; CHECK-NEXT:    v_mov_b32_e32 v23, v1
; CHECK-NEXT:    v_mov_b32_e32 v22, v0
; CHECK-NEXT:    v_mov_b32_e32 v2, v7
; CHECK-NEXT:    v_mov_b32_e32 v3, v8
; CHECK-NEXT:    v_mov_b32_e32 v0, v9
; CHECK-NEXT:    v_mov_b32_e32 v1, v10
; CHECK-NEXT:    v_mov_b32_e32 v5, v11
; CHECK-NEXT:    v_mov_b32_e32 v6, v12
; CHECK-NEXT:    v_mov_b32_e32 v12, v13
; CHECK-NEXT:    v_mov_b32_e32 v13, v14
; CHECK-NEXT:    v_mov_b32_e32 v8, v18
; CHECK-NEXT:    v_mov_b32_e32 v9, v19
; CHECK-NEXT:    v_mov_b32_e32 v16, v20
; CHECK-NEXT:    v_mov_b32_e32 v17, v21
; CHECK-NEXT:    v_mov_b32_e32 v14, v22
; CHECK-NEXT:    v_mov_b32_e32 v15, v23
; CHECK-NEXT:    v_mov_b32_e32 v10, v24
; CHECK-NEXT:    v_mov_b32_e32 v11, v25
; CHECK-NEXT:    v_mov_b32_e32 v4, v2
; CHECK-NEXT:    v_mov_b32_e32 v2, v3
; CHECK-NEXT:    v_mov_b32_e32 v7, v8
; CHECK-NEXT:    v_mov_b32_e32 v3, v9
; CHECK-NEXT:    v_add_co_u32 v7, s6, v4, v7
; CHECK-NEXT:    v_add_co_ci_u32_e64 v2, s6, v2, v3, s6
; CHECK-NEXT:    ; kill: def $vgpr7 killed $vgpr7 def $vgpr7_vgpr8 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v8, v2
; CHECK-NEXT:    v_mov_b32_e32 v2, v0
; CHECK-NEXT:    v_mov_b32_e32 v0, v1
; CHECK-NEXT:    v_mov_b32_e32 v3, v16
; CHECK-NEXT:    v_mov_b32_e32 v1, v17
; CHECK-NEXT:    v_add_co_u32 v3, s6, v2, v3
; CHECK-NEXT:    v_add_co_ci_u32_e64 v0, s6, v0, v1, s6
; CHECK-NEXT:    ; kill: def $vgpr3 killed $vgpr3 def $vgpr3_vgpr4 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v4, v0
; CHECK-NEXT:    v_mov_b32_e32 v1, v5
; CHECK-NEXT:    v_mov_b32_e32 v0, v6
; CHECK-NEXT:    v_mov_b32_e32 v5, v14
; CHECK-NEXT:    v_mov_b32_e32 v2, v15
; CHECK-NEXT:    v_add_co_u32 v1, s6, v1, v5
; CHECK-NEXT:    v_add_co_ci_u32_e64 v0, s6, v0, v2, s6
; CHECK-NEXT:    ; kill: def $vgpr1 killed $vgpr1 def $vgpr1_vgpr2 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v2, v0
; CHECK-NEXT:    v_mov_b32_e32 v5, v12
; CHECK-NEXT:    v_mov_b32_e32 v0, v13
; CHECK-NEXT:    v_mov_b32_e32 v9, v10
; CHECK-NEXT:    v_mov_b32_e32 v6, v11
; CHECK-NEXT:    v_add_co_u32 v5, s6, v5, v9
; CHECK-NEXT:    v_add_co_ci_u32_e64 v0, s6, v0, v6, s6
; CHECK-NEXT:    ; kill: def $vgpr5 killed $vgpr5 def $vgpr5_vgpr6 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v6, v0
; CHECK-NEXT:    ; kill: def $vgpr7_vgpr8 killed $vgpr7_vgpr8 def $vgpr7_vgpr8_vgpr9_vgpr10 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v10, v4
; CHECK-NEXT:    v_mov_b32_e32 v9, v3
; CHECK-NEXT:    ; kill: def $vgpr1_vgpr2 killed $vgpr1_vgpr2 def $vgpr1_vgpr2_vgpr3_vgpr4 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v3, v5
; CHECK-NEXT:    v_mov_b32_e32 v4, v6
; CHECK-NEXT:    v_mov_b32_e32 v6, s5
; CHECK-NEXT:    v_mov_b32_e32 v5, s4
; CHECK-NEXT:    global_store_dwordx4 v[5:6], v[7:10], off
; CHECK-NEXT:    s_mov_b64 s[4:5], 16
; CHECK-NEXT:    v_mov_b32_e32 v0, 0
; CHECK-NEXT:    global_store_dwordx4 v0, v[1:4], s[4:5]
; CHECK-NEXT:    s_endpgm
entry:
  %load0 = load <4 x i64>, <4 x i64> addrspace(1)* null, align 32
  %load1 = load <4 x i64>, <4 x i64> addrspace(1)* null, align 32
  %add = add <4 x i64> %load0, %load1
  store <4 x i64> %add, <4 x i64> addrspace(1)* null, align 32
  ret void
}

attributes #0 = { noinline optnone }
