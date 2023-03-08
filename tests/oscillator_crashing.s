	.syntax unified
	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.fpu fpv4-sp-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.syntax unified
	.file	"oscillator.cpp"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
	.type	_ZStL19piecewise_construct, %object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.space	1
	.text
	.align	2
	.global	_Z11convert_intf
	.thumb
	.thumb_func
	.type	_Z11convert_intf, %function
_Z11convert_intf:
.LFB1019:
	.file 1 "../build/oscillator.cpp"
	.loc 1 25 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	vstr.32	s0, [r7, #4]
	.loc 1 26 0
	vldr.32	s15, [r7, #4]
	vabs.f32	s15, s15
	vldr.32	s14, .L8
	vcmp.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	ite	hi
	movhi	r3, #1
	movls	r3, #0
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	and	r3, r3, #1
	uxtb	r2, r3
	vldr.32	s15, [r7, #4]
	vabs.f32	s15, s15
	vldr.32	s14, .L8+4
	vcmp.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	ite	lt
	movlt	r3, #1
	movge	r3, #0
	uxtb	r3, r3
	eor	r3, r3, #1
	uxtb	r3, r3
	and	r3, r3, #1
	uxtb	r3, r3
	ands	r3, r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L2
	.loc 1 26 0 is_stmt 0 discriminator 1
	vldr.32	s15, [r7, #4]
	vldr.32	s14, .L8+8
	vcmpe.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	blt	.L2
	.loc 1 26 0 discriminator 2
	vldr.32	s15, [r7, #4]
	vldr.32	s14, .L8+12
	vcmpe.f32	s15, s14
	vmrs	APSR_nzcv, FPSCR
	bhi	.L2
	.loc 1 27 0 is_stmt 1
	vldr.32	s15, [r7, #4]
	vcvt.s32.f32	s15, s15
	vmov	r3, s15	@ int
	b	.L5
.L2:
	.loc 1 29 0
	movs	r3, #0
.L5:
	.loc 1 30 0
	mov	r0, r3
	adds	r7, r7, #12
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L9:
	.align	2
.L8:
	.word	2139095039
	.word	8388608
	.word	-915135488
	.word	1232348160
	.cfi_endproc
.LFE1019:
	.size	_Z11convert_intf, .-_Z11convert_intf
	.section	.text._ZSt5floorf,"axG",%progbits,_ZSt5floorf,comdat
	.align	2
	.weak	_ZSt5floorf
	.thumb
	.thumb_func
	.type	_ZSt5floorf, %function
_ZSt5floorf:
.LFB1051:
	.file 2 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/cmath"
	.loc 2 280 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	vstr.32	s0, [r7, #4]
	.loc 2 280 0
	vldr.32	s0, [r7, #4]
	bl	floorf
	vmov.f32	s15, s0
	vmov.f32	s0, s15
	adds	r7, r7, #8
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE1051:
	.size	_ZSt5floorf, .-_ZSt5floorf
	.global	f
	.bss
	.align	2
	.type	f, %object
	.size	f, 4
f:
	.space	4
	.section	.text._ZN5mydsp13instanceClearEv,"axG",%progbits,_ZN5mydsp13instanceClearEv,comdat
	.align	2
	.weak	_ZN5mydsp13instanceClearEv
	.thumb
	.thumb_func
	.type	_ZN5mydsp13instanceClearEv, %function
_ZN5mydsp13instanceClearEv:
.LFB1239:
	.loc 1 66 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #68
	.cfi_def_cfa_offset 72
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
.LBB2:
	.loc 1 67 0
	movs	r3, #0
	str	r3, [r7, #60]
.L14:
	.loc 1 67 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #60]
	cmp	r3, #1
	bgt	.L13
	.loc 1 68 0 is_stmt 1 discriminator 2
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #60]
	movs	r1, #0
	str	r1, [r3, r2, lsl #2]
	.loc 1 67 0 discriminator 2
	ldr	r3, [r7, #60]
	adds	r3, r3, #1
	str	r3, [r7, #60]
	b	.L14
.L13:
.LBE2:
	.loc 1 70 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
.LBB3:
	.loc 1 71 0
	movs	r3, #0
	str	r3, [r7, #56]
.L16:
	.loc 1 71 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #56]
	cmp	r3, #1
	bgt	.L15
	.loc 1 72 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #56]
	adds	r3, r3, #2
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #4
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 71 0 discriminator 2
	ldr	r3, [r7, #56]
	adds	r3, r3, #1
	str	r3, [r7, #56]
	b	.L16
.L15:
.LBE3:
.LBB4:
	.loc 1 74 0
	movs	r3, #0
	str	r3, [r7, #52]
.L18:
	.loc 1 74 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #52]
	cmp	r3, #1
	bgt	.L17
	.loc 1 75 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #52]
	adds	r3, r3, #4
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #4
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 74 0 discriminator 2
	ldr	r3, [r7, #52]
	adds	r3, r3, #1
	str	r3, [r7, #52]
	b	.L18
.L17:
.LBE4:
.LBB5:
	.loc 1 77 0
	movs	r3, #0
	str	r3, [r7, #48]
.L20:
	.loc 1 77 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #48]
	cmp	r3, #3
	bgt	.L19
	.loc 1 78 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #48]
	adds	r3, r3, #6
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #4
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 77 0 discriminator 2
	ldr	r3, [r7, #48]
	adds	r3, r3, #1
	str	r3, [r7, #48]
	b	.L20
.L19:
.LBE5:
.LBB6:
	.loc 1 80 0
	movs	r3, #0
	str	r3, [r7, #44]
.L22:
	.loc 1 80 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #44]
	cmp	r3, #512
	bge	.L21
	.loc 1 81 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #44]
	adds	r3, r3, #10
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #4
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 80 0 discriminator 2
	ldr	r3, [r7, #44]
	adds	r3, r3, #1
	str	r3, [r7, #44]
	b	.L22
.L21:
.LBE6:
.LBB7:
	.loc 1 83 0
	movs	r3, #0
	str	r3, [r7, #40]
.L24:
	.loc 1 83 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #40]
	cmp	r3, #1
	bgt	.L23
	.loc 1 84 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #40]
	addw	r3, r3, #522
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #4
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 83 0 discriminator 2
	ldr	r3, [r7, #40]
	adds	r3, r3, #1
	str	r3, [r7, #40]
	b	.L24
.L23:
.LBE7:
.LBB8:
	.loc 1 86 0
	movs	r3, #0
	str	r3, [r7, #36]
.L26:
	.loc 1 86 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #36]
	cmp	r3, #512
	bge	.L25
	.loc 1 87 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #36]
	add	r3, r3, #524
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #4
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 86 0 discriminator 2
	ldr	r3, [r7, #36]
	adds	r3, r3, #1
	str	r3, [r7, #36]
	b	.L26
.L25:
.LBE8:
.LBB9:
	.loc 1 89 0
	movs	r3, #0
	str	r3, [r7, #32]
.L28:
	.loc 1 89 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #32]
	cmp	r3, #512
	bge	.L27
	.loc 1 90 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #32]
	addw	r3, r3, #1036
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #4
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 89 0 discriminator 2
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
	b	.L28
.L27:
.LBE9:
.LBB10:
	.loc 1 92 0
	movs	r3, #0
	str	r3, [r7, #28]
.L30:
	.loc 1 92 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #28]
	cmp	r3, #1
	bgt	.L29
	.loc 1 93 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #28]
	addw	r3, r3, #1548
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #4
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 92 0 discriminator 2
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
	b	.L30
.L29:
.LBE10:
.LBB11:
	.loc 1 95 0
	movs	r3, #0
	str	r3, [r7, #24]
.L32:
	.loc 1 95 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #24]
	cmp	r3, #3
	bgt	.L31
	.loc 1 96 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #24]
	addw	r3, r3, #1550
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #4
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 95 0 discriminator 2
	ldr	r3, [r7, #24]
	adds	r3, r3, #1
	str	r3, [r7, #24]
	b	.L32
.L31:
.LBE11:
.LBB12:
	.loc 1 98 0
	movs	r3, #0
	str	r3, [r7, #20]
.L34:
	.loc 1 98 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #20]
	cmp	r3, #2
	bgt	.L33
	.loc 1 99 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #20]
	addw	r3, r3, #1554
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #4
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 98 0 discriminator 2
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
	b	.L34
.L33:
.LBE12:
.LBB13:
	.loc 1 101 0
	movs	r3, #0
	str	r3, [r7, #16]
.L36:
	.loc 1 101 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #16]
	cmp	r3, #1
	bgt	.L35
	.loc 1 102 0 is_stmt 1 discriminator 2
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	addw	r2, r2, #1558
	movs	r1, #0
	str	r1, [r3, r2, lsl #2]
	.loc 1 101 0 discriminator 2
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
	b	.L36
.L35:
.LBE13:
.LBB14:
	.loc 1 104 0
	movs	r3, #0
	str	r3, [r7, #12]
.L38:
	.loc 1 104 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #12]
	cmp	r3, #512
	bge	.L37
	.loc 1 105 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	add	r3, r3, #1560
	lsls	r3, r3, #2
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 104 0 discriminator 2
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
	b	.L38
.L37:
.LBE14:
.LBB15:
	.loc 1 107 0
	movs	r3, #0
	str	r3, [r7, #8]
.L40:
	.loc 1 107 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #8]
	cmp	r3, #1
	bgt	.L41
	.loc 1 108 0 is_stmt 1 discriminator 2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	addw	r3, r3, #2072
	lsls	r3, r3, #2
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3]	@ float
	.loc 1 107 0 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
	b	.L40
.L41:
.LBE15:
	.loc 1 110 0
	nop
	adds	r7, r7, #68
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE1239:
	.size	_ZN5mydsp13instanceClearEv, .-_ZN5mydsp13instanceClearEv
	.section	.text._ZN5mydsp7computeEiPPfS1_,"axG",%progbits,_ZN5mydsp7computeEiPPfS1_,comdat
	.align	2
	.weak	_ZN5mydsp7computeEiPPfS1_
	.thumb
	.thumb_func
	.type	_ZN5mydsp7computeEiPPfS1_, %function
_ZN5mydsp7computeEiPPfS1_:
.LFB1240:
	.loc 1 112 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #128
	.cfi_def_cfa_offset 136
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
.LBB16:
	.loc 1 113 0
	movs	r3, #0
	str	r3, [r7, #124]
.L44:
	.loc 1 113 0 is_stmt 0 discriminator 3
	ldr	r2, [r7, #124]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bge	.L45
.LBB17:
	.loc 1 114 0 is_stmt 1 discriminator 2
	.syntax unified
@ 114 "../build/oscillator.cpp" 1
	@assign fRec15
@ 0 "" 2
	.thumb
	.syntax unified
nop
nop
nop
@	ldr	r3, [r7, #12]
nop
nop
nop
@	add	r3, r3, #6208
nop
nop
nop
@	adds	r3, r3, #28
nop
nop
nop
@	ldr	r3, [r3]
nop
nop
nop
@	vmov	s15, r3	@ int
nop
nop
nop
@	vcvt.f32.s32	s14, s15
nop
nop
nop
@	ldr	r3, [r7, #12]
nop
nop
nop
@	add	r3, r3, #6208
nop
nop
nop
@	adds	r3, r3, #4
nop
nop
nop
@	vldr.32	s15, [r3]
nop
nop
nop
@	vldr.32	s13, .L46
nop
nop
nop
@	vmul.f32	s13, s15, s13
nop
nop
nop
@	ldr	r3, [r7, #12]
nop
nop
nop
@	add	r3, r3, #6208
nop
nop
nop
@	vldr.32	s12, [r3]
nop
nop
nop
@	ldr	r3, [r7, #12]
nop
nop
nop
@	add	r3, r3, #6208
nop
nop
nop
@	adds	r3, r3, #8
nop
nop
nop
@	vldr.32	s15, [r3]
nop
nop
nop
@	vadd.f32	s15, s12, s15
nop
nop
nop
@	vldr.32	s12, .L46+4
nop
nop
nop
@	vmul.f32	s15, s15, s12
nop
nop
nop
@	vadd.f32	s15, s13, s15
nop
nop
nop
@	vldr.32	s13, .L46+8
nop
nop
nop
@	vmul.f32	s15, s15, s13
nop
nop
nop
@	vsub.f32	s15, s14, s15
nop
nop
nop
@	vstr.32	s15, [r7, #120]
nop
nop
nop
@	.loc 1 115 0 discriminator 2
	.syntax unified
@ 115 "../build/oscillator.cpp" 1
	@assign fTemp0
@ 0 "" 2
	.thumb
	.syntax unified
nop
nop
nop
@	ldr	r3, [r7, #12]
nop
nop
nop
@	vldr.32	s15, [r3, #12]
nop
nop
nop
@	vmov.f32	s14, #1.0e+0
nop
nop
nop
@	vsub.f32	s15, s14, s15
nop
nop
nop
@	vldr.32	s14, .L46+12
nop
nop
nop
@	vmul.f32	s15, s15, s14
nop
nop
nop
@	vstr.32	s15, [r7, #116]
nop
nop
nop
@	.loc 1 116 0 discriminator 2
	.syntax unified
@ 116 "../build/oscillator.cpp" 1
	@assign fTemp1
@ 0 "" 2
	.thumb
	.syntax unified
nop
nop
nop
@	vldr.32	s15, [r7, #116]
nop
nop
nop
@	vldr.32	s14, .L46+16
nop
nop
nop
@	vsub.f32	s15, s15, s14
nop
nop
nop
@	vstr.32	s15, [r7, #112]
nop
nop
nop
@	.loc 1 117 0 discriminator 2
	.syntax unified
@ 117 "../build/oscillator.cpp" 1
	@assign iTemp2
@ 0 "" 2
	.thumb
	.syntax unified
	vldr.32	s0, [r7, #112]
    bl	_Z11convert_intf
	str	r0, [r7, #108]
	.loc 1 118 0 discriminator 2
	.syntax unified
@ 118 "../build/oscillator.cpp" 1
	@assign iTemp3
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L46+20
	str	r3, [r7, #16]	@ float
	movs	r3, #0
	str	r3, [r7, #24]
	ldr	r3, [r7, #108]
	adds	r3, r3, #4
	str	r3, [r7, #28]
	add	r2, r7, #28
	add	r3, r7, #24
	mov	r1, r2
	mov	r0, r3
	bl	_ZSt3maxIiERKT_S2_S2_
	mov	r3, r0
	ldr	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s15, s15
	vstr.32	s15, [r7, #20]
	add	r2, r7, #20
	add	r3, r7, #16
	mov	r1, r2
	mov	r0, r3
	bl	_ZSt3minIfERKT_S2_S2_
	mov	r3, r0
	vldr.32	s15, [r3]
	vmov.f32	s0, s15
	bl	_Z11convert_intf
	str	r0, [r7, #104]
	.loc 1 119 0 discriminator 2
	.syntax unified
@ 119 "../build/oscillator.cpp" 1
	@assign fTemp4
@ 0 "" 2
	.thumb
	.syntax unified
	vldr.32	s0, [r7, #112]
	bl	_ZSt5floorf
	vstr.32	s0, [r7, #100]
	.loc 1 120 0 discriminator 2
	.syntax unified
@ 120 "../build/oscillator.cpp" 1
	@assign fTemp5
@ 0 "" 2
	.thumb
	.syntax unified
nop
nop
nop
@	vmov.f32	s14, #-3.0e+0
nop
nop
nop
@	vldr.32	s15, [r7, #100]
nop
nop
nop
@	vsub.f32	s14, s14, s15
nop
nop
nop
@	vldr.32	s15, [r7, #116]
nop
nop
nop
@	vadd.f32	s15, s14, s15
nop
nop
nop
@	vstr.32	s15, [r7, #96]
nop
nop
nop
@	.loc 1 121 0 discriminator 2
	.syntax unified
@ 121 "../build/oscillator.cpp" 1
	@assign fTemp6
@ 0 "" 2
	.thumb
	.syntax unified
nop
nop
nop
@	vmov.f32	s14, #-2.0e+0
nop
nop
nop
@	vldr.32	s15, [r7, #100]
nop
nop
nop
@	vsub.f32	s14, s14, s15
nop
nop
nop
@	vldr.32	s15, [r7, #116]
nop
nop
nop
@	vadd.f32	s15, s14, s15
nop
nop
nop
@	vstr.32	s15, [r7, #92]
nop
nop
nop
@	.loc 1 122 0 discriminator 2
	.syntax unified
@ 122 "../build/oscillator.cpp" 1
	@assign fTemp7
@ 0 "" 2
	.thumb
	.syntax unified
nop
nop
nop
@	vmov.f32	s14, #-1.0e+0
nop
nop
nop
@	vldr.32	s15, [r7, #100]
nop
nop
nop
@	vsub.f32	s14, s14, s15
nop
nop
nop
@	vldr.32	s15, [r7, #116]
nop
nop
nop
@	vadd.f32	s15, s14, s15
nop
nop
nop
@	vstr.32	s15, [r7, #88]
nop
nop
nop
@	.loc 1 123 0 discriminator 2
	.syntax unified
@ 123 "../build/oscillator.cpp" 1
	@assign fTemp8
@ 0 "" 2
	.thumb
	.syntax unified
	vldr.32	s14, [r7, #88]
	vldr.32	s15, [r7, #92]
	vmul.f32	s15, s14, s15
	vstr.32	s15, [r7, #84]
	.loc 1 124 0 discriminator 2
	.syntax unified
@ 124 "../build/oscillator.cpp" 1
	@assign fTemp9
@ 0 "" 2
	.thumb
	.syntax unified
	vldr.32	s14, [r7, #84]
	vldr.32	s15, [r7, #96]
	vmul.f32	s15, s14, s15
	vstr.32	s15, [r7, #80]
	.loc 1 125 0 discriminator 2
	.syntax unified
@ 125 "../build/oscillator.cpp" 1
	@assign fTemp10
@ 0 "" 2
	.thumb
	.syntax unified
	vmov.f32	s14, #-4.0e+0
	vldr.32	s15, [r7, #100]
	vsub.f32	s14, s14, s15
	vldr.32	s15, [r7, #116]
	vadd.f32	s15, s14, s15
	vstr.32	s15, [r7, #76]
	.loc 1 126 0 discriminator 2
	.syntax unified
@ 126 "../build/oscillator.cpp" 1
	@assign fTemp11
@ 0 "" 2
	.thumb
	.syntax unified
	vldr.32	s14, .L46+24
	vldr.32	s15, [r7, #76]
	vsub.f32	s15, s14, s15
	vstr.32	s15, [r7, #72]
	.loc 1 127 0 discriminator 2
	.syntax unified
@ 127 "../build/oscillator.cpp" 1
	@assign iTemp12
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L46+20
	str	r3, [r7, #32]	@ float
	movs	r3, #0
	str	r3, [r7, #40]
	ldr	r3, [r7, #108]
	adds	r3, r3, #3
	str	r3, [r7, #44]
	add	r2, r7, #44
	add	r3, r7, #40
	mov	r1, r2
	mov	r0, r3
	bl	_ZSt3maxIiERKT_S2_S2_
	mov	r3, r0
	ldr	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s15, s15
	vstr.32	s15, [r7, #36]
	add	r2, r7, #36
	add	r3, r7, #32
	mov	r1, r2
	mov	r0, r3
	bl	_ZSt3minIfERKT_S2_S2_
	mov	r3, r0
	vldr.32	s15, [r3]
	vmov.f32	s0, s15
	bl	_Z11convert_intf
	str	r0, [r7, #68]
	.loc 1 128 0 discriminator 2
	.syntax unified
@ 128 "../build/oscillator.cpp" 1
	@assign iTemp15
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L46+20
	str	r3, [r7, #48]	@ float
	movs	r3, #0
	str	r3, [r7, #56]
	ldr	r3, [r7, #108]
	adds	r3, r3, #2
	str	r3, [r7, #60]
	add	r2, r7, #60
	add	r3, r7, #56
	mov	r1, r2
	mov	r0, r3
	bl	_ZSt3maxIiERKT_S2_S2_
	mov	r3, r0
	ldr	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s15, s15
	vstr.32	s15, [r7, #52]
	add	r2, r7, #52
	add	r3, r7, #48
	mov	r1, r2
	mov	r0, r3
	bl	_ZSt3minIfERKT_S2_S2_
	mov	r3, r0
	vldr.32	s15, [r3]
	vmov.f32	s0, s15
	bl	_Z11convert_intf
	str	r0, [r7, #64]
.LBE17:
	.loc 1 113 0 discriminator 2
	ldr	r3, [r7, #124]
	adds	r3, r3, #1
	str	r3, [r7, #124]
	b	.L44
.L45:
.LBE16:
	.loc 1 130 0
	nop
	adds	r7, r7, #128
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L47:
	.align	2
.L46:
	.word	1058642330
	.word	1045220557
	.word	1065173107
	.word	1190304346
	.word	1069547478
	.word	1137951684
	.word	0
	.cfi_endproc
.LFE1240:
	.size	_ZN5mydsp7computeEiPPfS1_, .-_ZN5mydsp7computeEiPPfS1_
	.global	dsp
	.bss
	.align	2
	.type	dsp, %object
	.size	dsp, 8300
dsp:
	.space	8300
	.text
	.align	2
	.global	_hook_init
	.thumb
	.thumb_func
	.type	_hook_init, %function
_hook_init:
.LFB1241:
	.loc 1 138 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 141 0
	ldr	r0, .L49
	bl	_ZN5mydsp13instanceClearEv
	.loc 1 142 0
	nop
	adds	r7, r7, #8
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L50:
	.align	2
.L49:
	.word	dsp
	.cfi_endproc
.LFE1241:
	.size	_hook_init, .-_hook_init
	.align	2
	.global	_hook_cycle
	.thumb
	.thumb_func
	.type	_hook_cycle, %function
_hook_cycle:
.LFB1242:
	.loc 1 147 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #32
	.cfi_def_cfa_offset 40
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
.LBB18:
	.loc 1 149 0
	movs	r3, #0
	str	r3, [r7, #28]
.L53:
	.loc 1 149 0 is_stmt 0 discriminator 3
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcs	.L54
.LBB19:
	.loc 1 152 0 is_stmt 1 discriminator 2
	add	r3, r7, #24
	str	r3, [r7, #20]
	.loc 1 153 0 discriminator 2
	add	r3, r7, #20
	add	r2, r7, #24
	movs	r1, #1
	ldr	r0, .L55
	bl	_ZN5mydsp7computeEiPPfS1_
	.loc 1 154 0 discriminator 2
	ldr	r3, [r7, #8]
	adds	r2, r3, #4
	str	r2, [r7, #8]
	vldr.32	s15, [r7, #24]
	vldr.32	s14, .L55+4
	vmul.f32	s15, s15, s14
	vcvt.s32.f32	s15, s15
	vmov	r2, s15	@ int
	str	r2, [r3]
.LBE19:
	.loc 1 149 0 discriminator 2
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
	b	.L53
.L54:
.LBE18:
	.loc 1 156 0
	nop
	adds	r7, r7, #32
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L56:
	.align	2
.L55:
	.word	dsp
	.word	1325400064
	.cfi_endproc
.LFE1242:
	.size	_hook_cycle, .-_hook_cycle
	.section	.text._ZSt3maxIiERKT_S2_S2_,"axG",%progbits,_ZSt3maxIiERKT_S2_S2_,comdat
	.align	2
	.weak	_ZSt3maxIiERKT_S2_S2_
	.thumb
	.thumb_func
	.type	_ZSt3maxIiERKT_S2_S2_, %function
_ZSt3maxIiERKT_S2_S2_:
.LFB1243:
	.file 3 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/bits/stl_algobase.h"
	.loc 3 219 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 3 224 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7]
	ldr	r3, [r3]
	cmp	r2, r3
	bge	.L58
	.loc 3 225 0
	ldr	r3, [r7]
	b	.L59
.L58:
	.loc 3 226 0
	ldr	r3, [r7, #4]
.L59:
	.loc 3 227 0
	mov	r0, r3
	adds	r7, r7, #12
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE1243:
	.size	_ZSt3maxIiERKT_S2_S2_, .-_ZSt3maxIiERKT_S2_S2_
	.section	.text._ZSt3minIfERKT_S2_S2_,"axG",%progbits,_ZSt3minIfERKT_S2_S2_,comdat
	.align	2
	.weak	_ZSt3minIfERKT_S2_S2_
	.thumb
	.thumb_func
	.type	_ZSt3minIfERKT_S2_S2_, %function
_ZSt3minIfERKT_S2_S2_:
.LFB1244:
	.loc 3 195 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 3 200 0
	ldr	r3, [r7]
	vldr.32	s14, [r3]
	ldr	r3, [r7, #4]
	vldr.32	s15, [r3]
	vcmpe.f32	s14, s15
	vmrs	APSR_nzcv, FPSCR
	bpl	.L65
	.loc 3 201 0
	ldr	r3, [r7]
	b	.L63
.L65:
	.loc 3 202 0
	ldr	r3, [r7, #4]
.L63:
	.loc 3 203 0
	mov	r0, r3
	adds	r7, r7, #12
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	r7, [sp], #4
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE1244:
	.size	_ZSt3minIfERKT_S2_S2_, .-_ZSt3minIfERKT_S2_S2_
	.text
.Letext0:
	.file 4 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/machine/_default_types.h"
	.file 5 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/sys/_stdint.h"
	.file 6 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/stdint.h"
	.file 7 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/arm-none-eabi/armv7e-m/fpu/bits/c++config.h"
	.file 8 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/debug/debug.h"
	.file 9 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/cstdlib"
	.file 10 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/bits/algorithmfwd.h"
	.file 11 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/bits/exception_ptr.h"
	.file 12 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/bits/stl_pair.h"
	.file 13 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/new"
	.file 14 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/bits/stl_algo.h"
	.file 15 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/cstdint"
	.file 16 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/bits/predefined_ops.h"
	.file 17 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/ext/numeric_traits.h"
	.file 18 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/lib/gcc/arm-none-eabi/5.4.1/include/stddef.h"
	.file 19 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/stdlib.h"
	.file 20 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/math.h"
	.file 21 "/home/nick/prog/others/logue-sdk/platform/minilogue-xd/../ext/CMSIS/CMSIS/Include/arm_math.h"
	.file 22 "/home/nick/prog/others/logue-sdk/tools/gcc/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include/c++/5.4.1/bits/cpp_type_traits.h"
	.file 23 "/home/nick/prog/others/logue-sdk/platform/minilogue-xd/inc/userosc.h"
	.file 24 "/home/nick/prog/others/logue-sdk/platform/minilogue-xd/inc/osc_api.h"
	.file 25 "<built-in>"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x12a2
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF205
	.byte	0x4
	.4byte	.LASF206
	.4byte	.LASF207
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x4
	.byte	0x1b
	.4byte	0x30
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x4
	.byte	0x1d
	.4byte	0x42
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x4
	.byte	0x29
	.4byte	0x54
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x4
	.byte	0x2b
	.4byte	0x66
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x4
	.byte	0x3f
	.4byte	0x78
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x4
	.byte	0x41
	.4byte	0x8a
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x4
	.byte	0x59
	.4byte	0x9c
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF13
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x4
	.byte	0x5b
	.4byte	0xae
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x4
	.byte	0x78
	.4byte	0x30
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x4
	.byte	0x7a
	.4byte	0x42
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x4
	.byte	0x92
	.4byte	0x54
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x4
	.byte	0x94
	.4byte	0x66
	.uleb128 0x2
	.4byte	.LASF20
	.byte	0x4
	.byte	0xa8
	.4byte	0x78
	.uleb128 0x2
	.4byte	.LASF21
	.byte	0x4
	.byte	0xaa
	.4byte	0x8a
	.uleb128 0x2
	.4byte	.LASF22
	.byte	0x4
	.byte	0xba
	.4byte	0x9c
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0x4
	.byte	0xbc
	.4byte	0xae
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x4
	.byte	0xc8
	.4byte	0x118
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0x4
	.byte	0xca
	.4byte	0x12a
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF26
	.uleb128 0x2
	.4byte	.LASF27
	.byte	0x5
	.byte	0x14
	.4byte	0x25
	.uleb128 0x2
	.4byte	.LASF28
	.byte	0x5
	.byte	0x18
	.4byte	0x37
	.uleb128 0x2
	.4byte	.LASF29
	.byte	0x5
	.byte	0x20
	.4byte	0x49
	.uleb128 0x2
	.4byte	.LASF30
	.byte	0x5
	.byte	0x24
	.4byte	0x5b
	.uleb128 0x2
	.4byte	.LASF31
	.byte	0x5
	.byte	0x2c
	.4byte	0x6d
	.uleb128 0x2
	.4byte	.LASF32
	.byte	0x5
	.byte	0x30
	.4byte	0x7f
	.uleb128 0x2
	.4byte	.LASF33
	.byte	0x5
	.byte	0x38
	.4byte	0x91
	.uleb128 0x2
	.4byte	.LASF34
	.byte	0x5
	.byte	0x3c
	.4byte	0xa3
	.uleb128 0x2
	.4byte	.LASF35
	.byte	0x5
	.byte	0x43
	.4byte	0x10d
	.uleb128 0x2
	.4byte	.LASF36
	.byte	0x5
	.byte	0x48
	.4byte	0x11f
	.uleb128 0x2
	.4byte	.LASF37
	.byte	0x6
	.byte	0x15
	.4byte	0xb5
	.uleb128 0x2
	.4byte	.LASF38
	.byte	0x6
	.byte	0x16
	.4byte	0xc0
	.uleb128 0x2
	.4byte	.LASF39
	.byte	0x6
	.byte	0x1b
	.4byte	0xcb
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0x6
	.byte	0x1c
	.4byte	0xd6
	.uleb128 0x2
	.4byte	.LASF41
	.byte	0x6
	.byte	0x21
	.4byte	0xe1
	.uleb128 0x2
	.4byte	.LASF42
	.byte	0x6
	.byte	0x22
	.4byte	0xec
	.uleb128 0x2
	.4byte	.LASF43
	.byte	0x6
	.byte	0x27
	.4byte	0xf7
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x6
	.byte	0x28
	.4byte	0x102
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0x6
	.byte	0x33
	.4byte	0x118
	.uleb128 0x2
	.4byte	.LASF46
	.byte	0x6
	.byte	0x34
	.4byte	0x12a
	.uleb128 0x2
	.4byte	.LASF47
	.byte	0x6
	.byte	0x3d
	.4byte	0x118
	.uleb128 0x2
	.4byte	.LASF48
	.byte	0x6
	.byte	0x3e
	.4byte	0x12a
	.uleb128 0x2
	.4byte	.LASF49
	.byte	0x6
	.byte	0x47
	.4byte	0x118
	.uleb128 0x2
	.4byte	.LASF50
	.byte	0x6
	.byte	0x48
	.4byte	0x12a
	.uleb128 0x2
	.4byte	.LASF51
	.byte	0x6
	.byte	0x51
	.4byte	0x9c
	.uleb128 0x2
	.4byte	.LASF52
	.byte	0x6
	.byte	0x52
	.4byte	0xae
	.uleb128 0x2
	.4byte	.LASF53
	.byte	0x6
	.byte	0x82
	.4byte	0x9c
	.uleb128 0x2
	.4byte	.LASF54
	.byte	0x6
	.byte	0x8b
	.4byte	0xae
	.uleb128 0x5
	.ascii	"std\000"
	.byte	0x19
	.byte	0
	.4byte	0x6d1
	.uleb128 0x6
	.4byte	.LASF55
	.byte	0x7
	.byte	0xda
	.uleb128 0x7
	.byte	0x7
	.byte	0xda
	.4byte	0x270
	.uleb128 0x8
	.4byte	.LASF80
	.byte	0x1
	.byte	0xc
	.byte	0x4c
	.uleb128 0x9
	.4byte	.LASF133
	.byte	0x1
	.byte	0x16
	.byte	0x88
	.4byte	0x2af
	.uleb128 0xa
	.byte	0x1
	.4byte	0x42
	.byte	0x16
	.byte	0x8a
	.4byte	0x2a5
	.uleb128 0xb
	.4byte	.LASF208
	.byte	0
	.byte	0
	.uleb128 0xc
	.ascii	"_Tp\000"
	.4byte	0x74a
	.byte	0
	.uleb128 0x6
	.4byte	.LASF56
	.byte	0x8
	.byte	0x30
	.uleb128 0xd
	.byte	0x9
	.byte	0x76
	.4byte	0x7c1
	.uleb128 0xd
	.byte	0x9
	.byte	0x77
	.4byte	0x7f1
	.uleb128 0xd
	.byte	0x9
	.byte	0x7b
	.4byte	0x828
	.uleb128 0xd
	.byte	0x9
	.byte	0x81
	.4byte	0x83d
	.uleb128 0xd
	.byte	0x9
	.byte	0x82
	.4byte	0x852
	.uleb128 0xd
	.byte	0x9
	.byte	0x83
	.4byte	0x867
	.uleb128 0xd
	.byte	0x9
	.byte	0x84
	.4byte	0x87c
	.uleb128 0xd
	.byte	0x9
	.byte	0x86
	.4byte	0x8a5
	.uleb128 0xd
	.byte	0x9
	.byte	0x89
	.4byte	0x8bf
	.uleb128 0xd
	.byte	0x9
	.byte	0x8b
	.4byte	0x8d4
	.uleb128 0xd
	.byte	0x9
	.byte	0x8e
	.4byte	0x8ee
	.uleb128 0xd
	.byte	0x9
	.byte	0x8f
	.4byte	0x908
	.uleb128 0xd
	.byte	0x9
	.byte	0x90
	.4byte	0x934
	.uleb128 0xd
	.byte	0x9
	.byte	0x92
	.4byte	0x953
	.uleb128 0xd
	.byte	0x9
	.byte	0x98
	.4byte	0x973
	.uleb128 0xd
	.byte	0x9
	.byte	0x9a
	.4byte	0x97e
	.uleb128 0xd
	.byte	0x9
	.byte	0x9b
	.4byte	0x98f
	.uleb128 0xd
	.byte	0x9
	.byte	0x9c
	.4byte	0x9af
	.uleb128 0xd
	.byte	0x9
	.byte	0x9d
	.4byte	0x9ce
	.uleb128 0xd
	.byte	0x9
	.byte	0x9e
	.4byte	0x9ed
	.uleb128 0xd
	.byte	0x9
	.byte	0xa0
	.4byte	0xa02
	.uleb128 0xd
	.byte	0x9
	.byte	0xa1
	.4byte	0xa2c
	.uleb128 0xe
	.ascii	"_V2\000"
	.byte	0xa
	.2byte	0x216
	.uleb128 0xf
	.byte	0xa
	.2byte	0x216
	.4byte	0x350
	.uleb128 0x10
	.4byte	.LASF57
	.byte	0xb
	.byte	0x36
	.4byte	0x542
	.uleb128 0x11
	.4byte	.LASF62
	.byte	0x4
	.byte	0xb
	.byte	0x4b
	.4byte	0x53c
	.uleb128 0x12
	.4byte	.LASF102
	.byte	0xb
	.byte	0x4d
	.4byte	0x77b
	.byte	0
	.uleb128 0x13
	.4byte	.LASF62
	.byte	0xb
	.byte	0x4f
	.4byte	.LASF63
	.4byte	0xa46
	.4byte	0x39a
	.4byte	0x3a5
	.uleb128 0x14
	.4byte	0xa46
	.uleb128 0x15
	.4byte	0x77b
	.byte	0
	.uleb128 0x16
	.4byte	.LASF58
	.byte	0xb
	.byte	0x51
	.4byte	.LASF60
	.4byte	0x3b8
	.4byte	0x3be
	.uleb128 0x14
	.4byte	0xa46
	.byte	0
	.uleb128 0x16
	.4byte	.LASF59
	.byte	0xb
	.byte	0x52
	.4byte	.LASF61
	.4byte	0x3d1
	.4byte	0x3d7
	.uleb128 0x14
	.4byte	0xa46
	.byte	0
	.uleb128 0x17
	.4byte	.LASF73
	.byte	0xb
	.byte	0x54
	.4byte	.LASF75
	.4byte	0x77b
	.4byte	0x3ee
	.4byte	0x3f4
	.uleb128 0x14
	.4byte	0xa4c
	.byte	0
	.uleb128 0x18
	.4byte	.LASF62
	.byte	0xb
	.byte	0x5a
	.4byte	.LASF64
	.4byte	0xa46
	.byte	0x1
	.4byte	0x40c
	.4byte	0x412
	.uleb128 0x14
	.4byte	0xa46
	.byte	0
	.uleb128 0x18
	.4byte	.LASF62
	.byte	0xb
	.byte	0x5c
	.4byte	.LASF65
	.4byte	0xa46
	.byte	0x1
	.4byte	0x42a
	.4byte	0x435
	.uleb128 0x14
	.4byte	0xa46
	.uleb128 0x15
	.4byte	0xa52
	.byte	0
	.uleb128 0x18
	.4byte	.LASF62
	.byte	0xb
	.byte	0x5f
	.4byte	.LASF66
	.4byte	0xa46
	.byte	0x1
	.4byte	0x44d
	.4byte	0x458
	.uleb128 0x14
	.4byte	0xa46
	.uleb128 0x15
	.4byte	0x549
	.byte	0
	.uleb128 0x18
	.4byte	.LASF62
	.byte	0xb
	.byte	0x63
	.4byte	.LASF67
	.4byte	0xa46
	.byte	0x1
	.4byte	0x470
	.4byte	0x47b
	.uleb128 0x14
	.4byte	0xa46
	.uleb128 0x15
	.4byte	0xa58
	.byte	0
	.uleb128 0x18
	.4byte	.LASF68
	.byte	0xb
	.byte	0x70
	.4byte	.LASF69
	.4byte	0xa5e
	.byte	0x1
	.4byte	0x493
	.4byte	0x49e
	.uleb128 0x14
	.4byte	0xa46
	.uleb128 0x15
	.4byte	0xa52
	.byte	0
	.uleb128 0x18
	.4byte	.LASF68
	.byte	0xb
	.byte	0x74
	.4byte	.LASF70
	.4byte	0xa5e
	.byte	0x1
	.4byte	0x4b6
	.4byte	0x4c1
	.uleb128 0x14
	.4byte	0xa46
	.uleb128 0x15
	.4byte	0xa58
	.byte	0
	.uleb128 0x18
	.4byte	.LASF71
	.byte	0xb
	.byte	0x7b
	.4byte	.LASF72
	.4byte	0x77b
	.byte	0x1
	.4byte	0x4d9
	.4byte	0x4e4
	.uleb128 0x14
	.4byte	0xa46
	.uleb128 0x14
	.4byte	0x118
	.byte	0
	.uleb128 0x19
	.4byte	.LASF74
	.byte	0xb
	.byte	0x7e
	.4byte	.LASF76
	.byte	0x1
	.4byte	0x4f8
	.4byte	0x503
	.uleb128 0x14
	.4byte	0xa46
	.uleb128 0x15
	.4byte	0xa5e
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF162
	.byte	0xb
	.byte	0x8a
	.4byte	.LASF164
	.4byte	0x730
	.byte	0x1
	.4byte	0x51b
	.4byte	0x521
	.uleb128 0x14
	.4byte	0xa4c
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF77
	.byte	0xb
	.byte	0x93
	.4byte	.LASF78
	.4byte	0xa64
	.byte	0x1
	.4byte	0x535
	.uleb128 0x14
	.4byte	0xa4c
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	0x36b
	.byte	0
	.uleb128 0xd
	.byte	0xb
	.byte	0x3a
	.4byte	0x36b
	.uleb128 0x2
	.4byte	.LASF79
	.byte	0x7
	.byte	0xc8
	.4byte	0x76f
	.uleb128 0x1d
	.4byte	.LASF209
	.uleb128 0x1c
	.4byte	0x554
	.uleb128 0x8
	.4byte	.LASF81
	.byte	0x1
	.byte	0xd
	.byte	0x52
	.uleb128 0xf
	.byte	0xe
	.2byte	0x4d9
	.4byte	0x350
	.uleb128 0x1e
	.byte	0x2
	.2byte	0x42b
	.4byte	0xa88
	.uleb128 0x1e
	.byte	0x2
	.2byte	0x42c
	.4byte	0xa7d
	.uleb128 0xd
	.byte	0xf
	.byte	0x30
	.4byte	0x131
	.uleb128 0xd
	.byte	0xf
	.byte	0x31
	.4byte	0x147
	.uleb128 0xd
	.byte	0xf
	.byte	0x32
	.4byte	0x15d
	.uleb128 0xd
	.byte	0xf
	.byte	0x33
	.4byte	0x173
	.uleb128 0xd
	.byte	0xf
	.byte	0x35
	.4byte	0x1f7
	.uleb128 0xd
	.byte	0xf
	.byte	0x36
	.4byte	0x20d
	.uleb128 0xd
	.byte	0xf
	.byte	0x37
	.4byte	0x223
	.uleb128 0xd
	.byte	0xf
	.byte	0x38
	.4byte	0x239
	.uleb128 0xd
	.byte	0xf
	.byte	0x3a
	.4byte	0x19f
	.uleb128 0xd
	.byte	0xf
	.byte	0x3b
	.4byte	0x1b5
	.uleb128 0xd
	.byte	0xf
	.byte	0x3c
	.4byte	0x1cb
	.uleb128 0xd
	.byte	0xf
	.byte	0x3d
	.4byte	0x1e1
	.uleb128 0xd
	.byte	0xf
	.byte	0x3f
	.4byte	0x24f
	.uleb128 0xd
	.byte	0xf
	.byte	0x40
	.4byte	0x189
	.uleb128 0xd
	.byte	0xf
	.byte	0x42
	.4byte	0x13c
	.uleb128 0xd
	.byte	0xf
	.byte	0x43
	.4byte	0x152
	.uleb128 0xd
	.byte	0xf
	.byte	0x44
	.4byte	0x168
	.uleb128 0xd
	.byte	0xf
	.byte	0x45
	.4byte	0x17e
	.uleb128 0xd
	.byte	0xf
	.byte	0x47
	.4byte	0x202
	.uleb128 0xd
	.byte	0xf
	.byte	0x48
	.4byte	0x218
	.uleb128 0xd
	.byte	0xf
	.byte	0x49
	.4byte	0x22e
	.uleb128 0xd
	.byte	0xf
	.byte	0x4a
	.4byte	0x244
	.uleb128 0xd
	.byte	0xf
	.byte	0x4c
	.4byte	0x1aa
	.uleb128 0xd
	.byte	0xf
	.byte	0x4d
	.4byte	0x1c0
	.uleb128 0xd
	.byte	0xf
	.byte	0x4e
	.4byte	0x1d6
	.uleb128 0xd
	.byte	0xf
	.byte	0x4f
	.4byte	0x1ec
	.uleb128 0xd
	.byte	0xf
	.byte	0x51
	.4byte	0x25a
	.uleb128 0xd
	.byte	0xf
	.byte	0x52
	.4byte	0x194
	.uleb128 0x1f
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x117
	.4byte	.LASF210
	.4byte	0x74a
	.4byte	0x65c
	.uleb128 0x15
	.4byte	0x74a
	.byte	0
	.uleb128 0x20
	.4byte	.LASF83
	.byte	0x3
	.byte	0xdb
	.4byte	.LASF84
	.4byte	0xc9e
	.4byte	0x683
	.uleb128 0xc
	.ascii	"_Tp\000"
	.4byte	0x118
	.uleb128 0x15
	.4byte	0xc9e
	.uleb128 0x15
	.4byte	0xc9e
	.byte	0
	.uleb128 0x20
	.4byte	.LASF85
	.byte	0x3
	.byte	0xc3
	.4byte	.LASF86
	.4byte	0xca9
	.4byte	0x6aa
	.uleb128 0xc
	.ascii	"_Tp\000"
	.4byte	0x74a
	.uleb128 0x15
	.4byte	0xca9
	.uleb128 0x15
	.4byte	0xca9
	.byte	0
	.uleb128 0x21
	.4byte	.LASF191
	.byte	0xc
	.byte	0x4f
	.4byte	0x6b7
	.byte	0x1
	.byte	0
	.uleb128 0x1c
	.4byte	0x27e
	.uleb128 0x22
	.4byte	.LASF211
	.byte	0xd
	.byte	0x54
	.4byte	.LASF212
	.4byte	0x6cb
	.uleb128 0x1c
	.4byte	0x55e
	.byte	0
	.uleb128 0x10
	.4byte	.LASF87
	.byte	0x7
	.byte	0xdd
	.4byte	0x730
	.uleb128 0x6
	.4byte	.LASF55
	.byte	0x7
	.byte	0xde
	.uleb128 0x7
	.byte	0x7
	.byte	0xde
	.4byte	0x6dc
	.uleb128 0x6
	.4byte	.LASF88
	.byte	0x10
	.byte	0x24
	.uleb128 0x23
	.4byte	.LASF213
	.byte	0x1
	.byte	0x11
	.byte	0x37
	.uleb128 0x24
	.4byte	.LASF89
	.byte	0x11
	.byte	0x3a
	.4byte	0xa6a
	.uleb128 0x24
	.4byte	.LASF90
	.byte	0x11
	.byte	0x3b
	.4byte	0xa6a
	.uleb128 0x24
	.4byte	.LASF91
	.byte	0x11
	.byte	0x3f
	.4byte	0x737
	.uleb128 0x24
	.4byte	.LASF92
	.byte	0x11
	.byte	0x40
	.4byte	0xa6a
	.uleb128 0x25
	.4byte	.LASF93
	.4byte	0x118
	.byte	0
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.4byte	.LASF94
	.uleb128 0x1c
	.4byte	0x730
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF95
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF96
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.4byte	.LASF97
	.uleb128 0x10
	.4byte	.LASF98
	.byte	0x8
	.byte	0x37
	.4byte	0x764
	.uleb128 0x7
	.byte	0x8
	.byte	0x38
	.4byte	0x2af
	.byte	0
	.uleb128 0x2
	.4byte	.LASF99
	.byte	0x12
	.byte	0xd8
	.4byte	0x12a
	.uleb128 0x26
	.4byte	.LASF214
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF100
	.uleb128 0x27
	.byte	0x4
	.uleb128 0x28
	.byte	0x4
	.4byte	0x783
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF101
	.uleb128 0x28
	.byte	0x4
	.4byte	0x790
	.uleb128 0x29
	.uleb128 0x28
	.byte	0x4
	.4byte	0x797
	.uleb128 0x1c
	.4byte	0x783
	.uleb128 0x2a
	.byte	0x8
	.byte	0x13
	.byte	0x24
	.4byte	.LASF105
	.4byte	0x7c1
	.uleb128 0x12
	.4byte	.LASF103
	.byte	0x13
	.byte	0x25
	.4byte	0x118
	.byte	0
	.uleb128 0x2b
	.ascii	"rem\000"
	.byte	0x13
	.byte	0x26
	.4byte	0x118
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.4byte	.LASF104
	.byte	0x13
	.byte	0x27
	.4byte	0x79c
	.uleb128 0x2a
	.byte	0x8
	.byte	0x13
	.byte	0x2a
	.4byte	.LASF106
	.4byte	0x7f1
	.uleb128 0x12
	.4byte	.LASF103
	.byte	0x13
	.byte	0x2b
	.4byte	0x78
	.byte	0
	.uleb128 0x2b
	.ascii	"rem\000"
	.byte	0x13
	.byte	0x2c
	.4byte	0x78
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.4byte	.LASF107
	.byte	0x13
	.byte	0x2d
	.4byte	0x7cc
	.uleb128 0x2
	.4byte	.LASF108
	.byte	0x13
	.byte	0x39
	.4byte	0x807
	.uleb128 0x28
	.byte	0x4
	.4byte	0x80d
	.uleb128 0x2c
	.4byte	0x118
	.4byte	0x821
	.uleb128 0x15
	.4byte	0x821
	.uleb128 0x15
	.4byte	0x821
	.byte	0
	.uleb128 0x28
	.byte	0x4
	.4byte	0x827
	.uleb128 0x2d
	.uleb128 0x2e
	.4byte	.LASF109
	.byte	0x13
	.byte	0x4c
	.4byte	0x118
	.4byte	0x83d
	.uleb128 0x15
	.4byte	0x78a
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF110
	.byte	0x13
	.byte	0x4d
	.4byte	0x743
	.4byte	0x852
	.uleb128 0x15
	.4byte	0x791
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF111
	.byte	0x13
	.byte	0x51
	.4byte	0x118
	.4byte	0x867
	.uleb128 0x15
	.4byte	0x791
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF112
	.byte	0x13
	.byte	0x53
	.4byte	0x78
	.4byte	0x87c
	.uleb128 0x15
	.4byte	0x791
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF113
	.byte	0x13
	.byte	0x55
	.4byte	0x77b
	.4byte	0x8a5
	.uleb128 0x15
	.4byte	0x821
	.uleb128 0x15
	.4byte	0x821
	.uleb128 0x15
	.4byte	0x764
	.uleb128 0x15
	.4byte	0x764
	.uleb128 0x15
	.4byte	0x7fc
	.byte	0
	.uleb128 0x2f
	.ascii	"div\000"
	.byte	0x13
	.byte	0x5b
	.4byte	0x7c1
	.4byte	0x8bf
	.uleb128 0x15
	.4byte	0x118
	.uleb128 0x15
	.4byte	0x118
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF114
	.byte	0x13
	.byte	0x5e
	.4byte	0x77d
	.4byte	0x8d4
	.uleb128 0x15
	.4byte	0x791
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF115
	.byte	0x13
	.byte	0x67
	.4byte	0x7f1
	.4byte	0x8ee
	.uleb128 0x15
	.4byte	0x78
	.uleb128 0x15
	.4byte	0x78
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF116
	.byte	0x13
	.byte	0x69
	.4byte	0x118
	.4byte	0x908
	.uleb128 0x15
	.4byte	0x791
	.uleb128 0x15
	.4byte	0x764
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF117
	.byte	0x13
	.byte	0x6f
	.4byte	0x764
	.4byte	0x927
	.uleb128 0x15
	.4byte	0x927
	.uleb128 0x15
	.4byte	0x791
	.uleb128 0x15
	.4byte	0x764
	.byte	0
	.uleb128 0x28
	.byte	0x4
	.4byte	0x92d
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF118
	.uleb128 0x2e
	.4byte	.LASF119
	.byte	0x13
	.byte	0x6b
	.4byte	0x118
	.4byte	0x953
	.uleb128 0x15
	.4byte	0x927
	.uleb128 0x15
	.4byte	0x791
	.uleb128 0x15
	.4byte	0x764
	.byte	0
	.uleb128 0x30
	.4byte	.LASF120
	.byte	0x13
	.byte	0x8b
	.4byte	0x973
	.uleb128 0x15
	.4byte	0x77b
	.uleb128 0x15
	.4byte	0x764
	.uleb128 0x15
	.4byte	0x764
	.uleb128 0x15
	.4byte	0x7fc
	.byte	0
	.uleb128 0x31
	.4byte	.LASF215
	.byte	0x13
	.byte	0x8c
	.4byte	0x118
	.uleb128 0x30
	.4byte	.LASF121
	.byte	0x13
	.byte	0x9a
	.4byte	0x98f
	.uleb128 0x15
	.4byte	0x12a
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF122
	.byte	0x13
	.byte	0x9b
	.4byte	0x743
	.4byte	0x9a9
	.uleb128 0x15
	.4byte	0x791
	.uleb128 0x15
	.4byte	0x9a9
	.byte	0
	.uleb128 0x28
	.byte	0x4
	.4byte	0x77d
	.uleb128 0x2e
	.4byte	.LASF123
	.byte	0x13
	.byte	0xa6
	.4byte	0x78
	.4byte	0x9ce
	.uleb128 0x15
	.4byte	0x791
	.uleb128 0x15
	.4byte	0x9a9
	.uleb128 0x15
	.4byte	0x118
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF124
	.byte	0x13
	.byte	0xa8
	.4byte	0x8a
	.4byte	0x9ed
	.uleb128 0x15
	.4byte	0x791
	.uleb128 0x15
	.4byte	0x9a9
	.uleb128 0x15
	.4byte	0x118
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF125
	.byte	0x13
	.byte	0xba
	.4byte	0x118
	.4byte	0xa02
	.uleb128 0x15
	.4byte	0x791
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF126
	.byte	0x13
	.byte	0x71
	.4byte	0x764
	.4byte	0xa21
	.uleb128 0x15
	.4byte	0x77d
	.uleb128 0x15
	.4byte	0xa21
	.uleb128 0x15
	.4byte	0x764
	.byte	0
	.uleb128 0x28
	.byte	0x4
	.4byte	0xa27
	.uleb128 0x1c
	.4byte	0x92d
	.uleb128 0x2e
	.4byte	.LASF127
	.byte	0x13
	.byte	0x6d
	.4byte	0x118
	.4byte	0xa46
	.uleb128 0x15
	.4byte	0x77d
	.uleb128 0x15
	.4byte	0x92d
	.byte	0
	.uleb128 0x28
	.byte	0x4
	.4byte	0x36b
	.uleb128 0x28
	.byte	0x4
	.4byte	0x53c
	.uleb128 0x32
	.byte	0x4
	.4byte	0x53c
	.uleb128 0x33
	.byte	0x4
	.4byte	0x36b
	.uleb128 0x32
	.byte	0x4
	.4byte	0x36b
	.uleb128 0x28
	.byte	0x4
	.4byte	0x559
	.uleb128 0x1c
	.4byte	0x118
	.uleb128 0x3
	.byte	0x2
	.byte	0x10
	.4byte	.LASF128
	.uleb128 0x3
	.byte	0x4
	.byte	0x10
	.4byte	.LASF129
	.uleb128 0x2
	.4byte	.LASF130
	.byte	0x14
	.byte	0xad
	.4byte	0x74a
	.uleb128 0x2
	.4byte	.LASF131
	.byte	0x14
	.byte	0xae
	.4byte	0x743
	.uleb128 0x34
	.4byte	.LASF132
	.byte	0x15
	.2byte	0x18d
	.4byte	0x15d
	.uleb128 0x28
	.byte	0x4
	.4byte	0x15d
	.uleb128 0x9
	.4byte	.LASF134
	.byte	0x10
	.byte	0x17
	.byte	0x3c
	.4byte	0xaee
	.uleb128 0x12
	.4byte	.LASF135
	.byte	0x17
	.byte	0x3e
	.4byte	0x15d
	.byte	0
	.uleb128 0x12
	.4byte	.LASF136
	.byte	0x17
	.byte	0x40
	.4byte	0x152
	.byte	0x4
	.uleb128 0x12
	.4byte	.LASF137
	.byte	0x17
	.byte	0x42
	.4byte	0x152
	.byte	0x6
	.uleb128 0x12
	.4byte	.LASF138
	.byte	0x17
	.byte	0x44
	.4byte	0x152
	.byte	0x8
	.uleb128 0x12
	.4byte	.LASF139
	.byte	0x17
	.byte	0x45
	.4byte	0xaee
	.byte	0xa
	.byte	0
	.uleb128 0x35
	.4byte	0x152
	.4byte	0xafe
	.uleb128 0x36
	.4byte	0x774
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.4byte	.LASF140
	.byte	0x17
	.byte	0x46
	.4byte	0xaa5
	.uleb128 0x28
	.byte	0x4
	.4byte	0xb0f
	.uleb128 0x1c
	.4byte	0xafe
	.uleb128 0x37
	.4byte	.LASF141
	.2byte	0x206c
	.byte	0x1
	.byte	0x2b
	.4byte	0xc3b
	.uleb128 0x38
	.4byte	.LASF142
	.byte	0x1
	.byte	0x2f
	.4byte	0xc3b
	.byte	0
	.byte	0x1
	.uleb128 0x38
	.4byte	.LASF143
	.byte	0x1
	.byte	0x30
	.4byte	0x118
	.byte	0x8
	.byte	0x1
	.uleb128 0x38
	.4byte	.LASF144
	.byte	0x1
	.byte	0x31
	.4byte	0xc4b
	.byte	0xc
	.byte	0x1
	.uleb128 0x38
	.4byte	.LASF145
	.byte	0x1
	.byte	0x32
	.4byte	0xc4b
	.byte	0x14
	.byte	0x1
	.uleb128 0x38
	.4byte	.LASF146
	.byte	0x1
	.byte	0x33
	.4byte	0xc5b
	.byte	0x1c
	.byte	0x1
	.uleb128 0x38
	.4byte	.LASF147
	.byte	0x1
	.byte	0x34
	.4byte	0xc6b
	.byte	0x2c
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF148
	.byte	0x1
	.byte	0x35
	.4byte	0xc4b
	.2byte	0x82c
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF149
	.byte	0x1
	.byte	0x36
	.4byte	0xc6b
	.2byte	0x834
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF150
	.byte	0x1
	.byte	0x37
	.4byte	0xc6b
	.2byte	0x1034
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF151
	.byte	0x1
	.byte	0x38
	.4byte	0xc4b
	.2byte	0x1834
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF152
	.byte	0x1
	.byte	0x39
	.4byte	0xc5b
	.2byte	0x183c
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF153
	.byte	0x1
	.byte	0x3a
	.4byte	0xc7c
	.2byte	0x184c
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF154
	.byte	0x1
	.byte	0x3b
	.4byte	0xc3b
	.2byte	0x1858
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF155
	.byte	0x1
	.byte	0x3c
	.4byte	0xc6b
	.2byte	0x1860
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF156
	.byte	0x1
	.byte	0x3d
	.4byte	0xc4b
	.2byte	0x2060
	.byte	0x1
	.uleb128 0x39
	.4byte	.LASF157
	.byte	0x1
	.byte	0x3e
	.4byte	0x118
	.2byte	0x2068
	.byte	0x1
	.uleb128 0x19
	.4byte	.LASF158
	.byte	0x1
	.byte	0x42
	.4byte	.LASF159
	.byte	0x1
	.4byte	0xc0f
	.4byte	0xc15
	.uleb128 0x14
	.4byte	0xc8c
	.byte	0
	.uleb128 0x3a
	.4byte	.LASF160
	.byte	0x1
	.byte	0x70
	.4byte	.LASF161
	.byte	0x1
	.4byte	0xc25
	.uleb128 0x14
	.4byte	0xc8c
	.uleb128 0x15
	.4byte	0x118
	.uleb128 0x15
	.4byte	0xc92
	.uleb128 0x15
	.4byte	0xc92
	.byte	0
	.byte	0
	.uleb128 0x35
	.4byte	0x118
	.4byte	0xc4b
	.uleb128 0x36
	.4byte	0x774
	.byte	0x1
	.byte	0
	.uleb128 0x35
	.4byte	0x74a
	.4byte	0xc5b
	.uleb128 0x36
	.4byte	0x774
	.byte	0x1
	.byte	0
	.uleb128 0x35
	.4byte	0x74a
	.4byte	0xc6b
	.uleb128 0x36
	.4byte	0x774
	.byte	0x3
	.byte	0
	.uleb128 0x35
	.4byte	0x74a
	.4byte	0xc7c
	.uleb128 0x3b
	.4byte	0x774
	.2byte	0x1ff
	.byte	0
	.uleb128 0x35
	.4byte	0x74a
	.4byte	0xc8c
	.uleb128 0x36
	.4byte	0x774
	.byte	0x2
	.byte	0
	.uleb128 0x28
	.byte	0x4
	.4byte	0xb14
	.uleb128 0x28
	.byte	0x4
	.4byte	0xc98
	.uleb128 0x28
	.byte	0x4
	.4byte	0x74a
	.uleb128 0x32
	.byte	0x4
	.4byte	0xa6a
	.uleb128 0x1c
	.4byte	0x74a
	.uleb128 0x32
	.byte	0x4
	.4byte	0xca4
	.uleb128 0x3c
	.4byte	.LASF163
	.byte	0x1
	.byte	0x19
	.4byte	.LASF165
	.4byte	0x118
	.4byte	.LFB1019
	.4byte	.LFE1019-.LFB1019
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcd9
	.uleb128 0x3d
	.ascii	"x\000"
	.byte	0x1
	.byte	0x19
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x3e
	.4byte	0x642
	.4byte	.LFB1051
	.4byte	.LFE1051-.LFB1051
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcfc
	.uleb128 0x3f
	.ascii	"__x\000"
	.byte	0x2
	.2byte	0x117
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x40
	.4byte	0xbfb
	.4byte	.LFB1239
	.4byte	.LFE1239-.LFB1239
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd13
	.4byte	0xe9b
	.uleb128 0x41
	.4byte	.LASF166
	.4byte	0xe9b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x42
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0xd3b
	.uleb128 0x43
	.ascii	"l0\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x42
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0xd56
	.uleb128 0x43
	.ascii	"l1\000"
	.byte	0x1
	.byte	0x47
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x42
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0xd71
	.uleb128 0x43
	.ascii	"l2\000"
	.byte	0x1
	.byte	0x4a
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x42
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0xd8c
	.uleb128 0x43
	.ascii	"l3\000"
	.byte	0x1
	.byte	0x4d
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x42
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0xda7
	.uleb128 0x43
	.ascii	"l4\000"
	.byte	0x1
	.byte	0x50
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x42
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.4byte	0xdc2
	.uleb128 0x43
	.ascii	"l5\000"
	.byte	0x1
	.byte	0x53
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x42
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.4byte	0xddd
	.uleb128 0x43
	.ascii	"l6\000"
	.byte	0x1
	.byte	0x56
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x42
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.4byte	0xdf8
	.uleb128 0x43
	.ascii	"l7\000"
	.byte	0x1
	.byte	0x59
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x42
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.4byte	0xe13
	.uleb128 0x43
	.ascii	"l8\000"
	.byte	0x1
	.byte	0x5c
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x42
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.4byte	0xe2e
	.uleb128 0x43
	.ascii	"l9\000"
	.byte	0x1
	.byte	0x5f
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x42
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.4byte	0xe4a
	.uleb128 0x43
	.ascii	"l10\000"
	.byte	0x1
	.byte	0x62
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x42
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.4byte	0xe66
	.uleb128 0x43
	.ascii	"l11\000"
	.byte	0x1
	.byte	0x65
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x42
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.4byte	0xe82
	.uleb128 0x43
	.ascii	"l12\000"
	.byte	0x1
	.byte	0x68
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.uleb128 0x44
	.4byte	.LBB15
	.4byte	.LBE15-.LBB15
	.uleb128 0x43
	.ascii	"l13\000"
	.byte	0x1
	.byte	0x6b
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	0xc8c
	.uleb128 0x45
	.4byte	0xc15
	.4byte	.LFB1240
	.4byte	.LFE1240-.LFB1240
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xeb7
	.4byte	0xfe7
	.uleb128 0x41
	.4byte	.LASF166
	.4byte	0xe9b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x46
	.4byte	.LASF167
	.byte	0x1
	.byte	0x70
	.4byte	0x118
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x46
	.4byte	.LASF168
	.byte	0x1
	.byte	0x70
	.4byte	0xfe7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x46
	.4byte	.LASF169
	.byte	0x1
	.byte	0x70
	.4byte	0xfe7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x44
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.uleb128 0x43
	.ascii	"i0\000"
	.byte	0x1
	.byte	0x71
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x44
	.4byte	.LBB17
	.4byte	.LBE17-.LBB17
	.uleb128 0x47
	.4byte	.LASF170
	.byte	0x1
	.byte	0x72
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x47
	.4byte	.LASF171
	.byte	0x1
	.byte	0x73
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x47
	.4byte	.LASF172
	.byte	0x1
	.byte	0x74
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x47
	.4byte	.LASF173
	.byte	0x1
	.byte	0x75
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x47
	.4byte	.LASF174
	.byte	0x1
	.byte	0x76
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x47
	.4byte	.LASF175
	.byte	0x1
	.byte	0x77
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x47
	.4byte	.LASF176
	.byte	0x1
	.byte	0x78
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x47
	.4byte	.LASF177
	.byte	0x1
	.byte	0x79
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x47
	.4byte	.LASF178
	.byte	0x1
	.byte	0x7a
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x47
	.4byte	.LASF179
	.byte	0x1
	.byte	0x7b
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x47
	.4byte	.LASF180
	.byte	0x1
	.byte	0x7c
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x47
	.4byte	.LASF181
	.byte	0x1
	.byte	0x7d
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x47
	.4byte	.LASF182
	.byte	0x1
	.byte	0x7e
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x47
	.4byte	.LASF183
	.byte	0x1
	.byte	0x7f
	.4byte	0x118
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x47
	.4byte	.LASF184
	.byte	0x1
	.byte	0x80
	.4byte	0x118
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x48
	.4byte	0xc92
	.uleb128 0x49
	.4byte	.LASF185
	.byte	0x1
	.byte	0x89
	.4byte	.LFB1241
	.4byte	.LFE1241-.LFB1241
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x101e
	.uleb128 0x46
	.4byte	.LASF186
	.byte	0x1
	.byte	0x89
	.4byte	0x168
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x3d
	.ascii	"api\000"
	.byte	0x1
	.byte	0x89
	.4byte	0x168
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x49
	.4byte	.LASF187
	.byte	0x1
	.byte	0x90
	.4byte	.LFB1242
	.4byte	.LFE1242-.LFB1242
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10a6
	.uleb128 0x46
	.4byte	.LASF188
	.byte	0x1
	.byte	0x90
	.4byte	0x10a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x3d
	.ascii	"yn\000"
	.byte	0x1
	.byte	0x91
	.4byte	0xa9f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x46
	.4byte	.LASF189
	.byte	0x1
	.byte	0x92
	.4byte	0x168
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x44
	.4byte	.LBB18
	.4byte	.LBE18-.LBB18
	.uleb128 0x43
	.ascii	"i\000"
	.byte	0x1
	.byte	0x95
	.4byte	0x118
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x44
	.4byte	.LBB19
	.4byte	.LBE19-.LBB19
	.uleb128 0x43
	.ascii	"yf\000"
	.byte	0x1
	.byte	0x96
	.4byte	0x74a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x47
	.4byte	.LASF168
	.byte	0x1
	.byte	0x97
	.4byte	0x10ab
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x47
	.4byte	.LASF169
	.byte	0x1
	.byte	0x98
	.4byte	0x10c2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	0xb09
	.uleb128 0x35
	.4byte	0xc98
	.4byte	0x10bb
	.uleb128 0x4a
	.4byte	0x10bb
	.sleb128 -1
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF190
	.uleb128 0x35
	.4byte	0xc98
	.4byte	0x10d2
	.uleb128 0x36
	.4byte	0x774
	.byte	0
	.byte	0
	.uleb128 0x4b
	.4byte	0x65c
	.4byte	.LFB1243
	.4byte	.LFE1243-.LFB1243
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x110b
	.uleb128 0xc
	.ascii	"_Tp\000"
	.4byte	0x118
	.uleb128 0x3d
	.ascii	"__a\000"
	.byte	0x3
	.byte	0xdb
	.4byte	0x110b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x3d
	.ascii	"__b\000"
	.byte	0x3
	.byte	0xdb
	.4byte	0x1110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1c
	.4byte	0xc9e
	.uleb128 0x1c
	.4byte	0xc9e
	.uleb128 0x4b
	.4byte	0x683
	.4byte	.LFB1244
	.4byte	.LFE1244-.LFB1244
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x114e
	.uleb128 0xc
	.ascii	"_Tp\000"
	.4byte	0x74a
	.uleb128 0x3d
	.ascii	"__a\000"
	.byte	0x3
	.byte	0xc3
	.4byte	0x114e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x3d
	.ascii	"__b\000"
	.byte	0x3
	.byte	0xc3
	.4byte	0x1153
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1c
	.4byte	0xca9
	.uleb128 0x1c
	.4byte	0xca9
	.uleb128 0x4c
	.4byte	.LASF192
	.byte	0x18
	.byte	0x45
	.4byte	0x1163
	.uleb128 0x1c
	.4byte	0x168
	.uleb128 0x4c
	.4byte	.LASF193
	.byte	0x18
	.byte	0x4a
	.4byte	0x1163
	.uleb128 0x35
	.4byte	0xca4
	.4byte	0x1183
	.uleb128 0x36
	.4byte	0x774
	.byte	0x97
	.byte	0
	.uleb128 0x4c
	.4byte	.LASF194
	.byte	0x18
	.byte	0x67
	.4byte	0x118e
	.uleb128 0x1c
	.4byte	0x1173
	.uleb128 0x35
	.4byte	0xca4
	.4byte	0x11a3
	.uleb128 0x36
	.4byte	0x774
	.byte	0x80
	.byte	0
	.uleb128 0x4c
	.4byte	.LASF195
	.byte	0x18
	.byte	0x94
	.4byte	0x11ae
	.uleb128 0x1c
	.4byte	0x1193
	.uleb128 0x35
	.4byte	0xca4
	.4byte	0x11c4
	.uleb128 0x3b
	.4byte	0x774
	.2byte	0x386
	.byte	0
	.uleb128 0x4c
	.4byte	.LASF196
	.byte	0x18
	.byte	0xc6
	.4byte	0x11cf
	.uleb128 0x1c
	.4byte	0x11b3
	.uleb128 0x4d
	.4byte	.LASF197
	.byte	0x18
	.2byte	0x138
	.4byte	0x11e0
	.uleb128 0x1c
	.4byte	0x11b3
	.uleb128 0x4d
	.4byte	.LASF198
	.byte	0x18
	.2byte	0x1ab
	.4byte	0x11f1
	.uleb128 0x1c
	.4byte	0x11b3
	.uleb128 0x35
	.4byte	0xca4
	.4byte	0x1207
	.uleb128 0x3b
	.4byte	0x774
	.2byte	0x100
	.byte	0
	.uleb128 0x4d
	.4byte	.LASF199
	.byte	0x18
	.2byte	0x24d
	.4byte	0x1213
	.uleb128 0x1c
	.4byte	0x11f6
	.uleb128 0x4d
	.4byte	.LASF200
	.byte	0x18
	.2byte	0x264
	.4byte	0x1224
	.uleb128 0x1c
	.4byte	0x11f6
	.uleb128 0x4d
	.4byte	.LASF201
	.byte	0x18
	.2byte	0x27c
	.4byte	0x1235
	.uleb128 0x1c
	.4byte	0x11f6
	.uleb128 0x4d
	.4byte	.LASF202
	.byte	0x18
	.2byte	0x2ab
	.4byte	0x1246
	.uleb128 0x1c
	.4byte	0x1193
	.uleb128 0x4d
	.4byte	.LASF203
	.byte	0x18
	.2byte	0x2c0
	.4byte	0x1257
	.uleb128 0x1c
	.4byte	0x1193
	.uleb128 0x4d
	.4byte	.LASF204
	.byte	0x18
	.2byte	0x2dd
	.4byte	0x1268
	.uleb128 0x1c
	.4byte	0x1193
	.uleb128 0x4e
	.ascii	"f\000"
	.byte	0x1
	.byte	0x29
	.4byte	0x118
	.uleb128 0x5
	.byte	0x3
	.4byte	f
	.uleb128 0x4e
	.ascii	"dsp\000"
	.byte	0x1
	.byte	0x87
	.4byte	0xb14
	.uleb128 0x5
	.byte	0x3
	.4byte	dsp
	.uleb128 0x4f
	.4byte	0x6aa
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZStL19piecewise_construct
	.uleb128 0x50
	.4byte	0x704
	.4byte	.LASF216
	.4byte	0x7fffffff
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x3a
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2f
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x3a
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x63
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x63
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2f
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x3b
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x15
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x42
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x45
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x46
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x47
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x48
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x49
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4a
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x4b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4f
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x50
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x44
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB1051
	.4byte	.LFE1051-.LFB1051
	.4byte	.LFB1239
	.4byte	.LFE1239-.LFB1239
	.4byte	.LFB1240
	.4byte	.LFE1240-.LFB1240
	.4byte	.LFB1243
	.4byte	.LFE1243-.LFB1243
	.4byte	.LFB1244
	.4byte	.LFE1244-.LFB1244
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.LFB1051
	.4byte	.LFE1051
	.4byte	.LFB1239
	.4byte	.LFE1239
	.4byte	.LFB1240
	.4byte	.LFE1240
	.4byte	.LFB1243
	.4byte	.LFE1243
	.4byte	.LFB1244
	.4byte	.LFE1244
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF171:
	.ascii	"fTemp0\000"
.LASF172:
	.ascii	"fTemp1\000"
.LASF65:
	.ascii	"_ZNSt15__exception_ptr13exception_ptrC4ERKS0_\000"
.LASF175:
	.ascii	"fTemp4\000"
.LASF176:
	.ascii	"fTemp5\000"
.LASF178:
	.ascii	"fTemp7\000"
.LASF179:
	.ascii	"fTemp8\000"
.LASF180:
	.ascii	"fTemp9\000"
.LASF89:
	.ascii	"__min\000"
.LASF99:
	.ascii	"size_t\000"
.LASF36:
	.ascii	"uintptr_t\000"
.LASF34:
	.ascii	"uint64_t\000"
.LASF79:
	.ascii	"nullptr_t\000"
.LASF1:
	.ascii	"__uint8_t\000"
.LASF197:
	.ascii	"wt_sqr_lut_f\000"
.LASF192:
	.ascii	"k_osc_api_platform\000"
.LASF80:
	.ascii	"piecewise_construct_t\000"
.LASF207:
	.ascii	"/home/nick/faustilogue/logue-project\000"
.LASF200:
	.ascii	"tanpi_lut_f\000"
.LASF143:
	.ascii	"IOTA0\000"
.LASF15:
	.ascii	"long long unsigned int\000"
.LASF86:
	.ascii	"_ZSt3minIfERKT_S2_S2_\000"
.LASF81:
	.ascii	"nothrow_t\000"
.LASF69:
	.ascii	"_ZNSt15__exception_ptr13exception_ptraSERKS0_\000"
.LASF12:
	.ascii	"__int64_t\000"
.LASF8:
	.ascii	"__int32_t\000"
.LASF50:
	.ascii	"uint_fast32_t\000"
.LASF165:
	.ascii	"_Z11convert_intf\000"
.LASF22:
	.ascii	"__int_least64_t\000"
.LASF109:
	.ascii	"atexit\000"
.LASF58:
	.ascii	"_M_addref\000"
.LASF29:
	.ascii	"int16_t\000"
.LASF13:
	.ascii	"long long int\000"
.LASF2:
	.ascii	"signed char\000"
.LASF120:
	.ascii	"qsort\000"
.LASF116:
	.ascii	"mblen\000"
.LASF54:
	.ascii	"uintmax_t\000"
.LASF64:
	.ascii	"_ZNSt15__exception_ptr13exception_ptrC4Ev\000"
.LASF196:
	.ascii	"wt_saw_lut_f\000"
.LASF0:
	.ascii	"__int8_t\000"
.LASF103:
	.ascii	"quot\000"
.LASF33:
	.ascii	"int64_t\000"
.LASF93:
	.ascii	"_Value\000"
.LASF185:
	.ascii	"_hook_init\000"
.LASF160:
	.ascii	"compute\000"
.LASF9:
	.ascii	"long int\000"
.LASF130:
	.ascii	"float_t\000"
.LASF128:
	.ascii	"char16_t\000"
.LASF41:
	.ascii	"int_least32_t\000"
.LASF129:
	.ascii	"char32_t\000"
.LASF85:
	.ascii	"min<float>\000"
.LASF83:
	.ascii	"max<int>\000"
.LASF45:
	.ascii	"int_fast8_t\000"
.LASF188:
	.ascii	"params\000"
.LASF96:
	.ascii	"double\000"
.LASF135:
	.ascii	"shape_lfo\000"
.LASF166:
	.ascii	"this\000"
.LASF55:
	.ascii	"__cxx11\000"
.LASF88:
	.ascii	"__ops\000"
.LASF167:
	.ascii	"count\000"
.LASF170:
	.ascii	"fRec15\000"
.LASF119:
	.ascii	"mbtowc\000"
.LASF151:
	.ascii	"fRec19\000"
.LASF10:
	.ascii	"__uint32_t\000"
.LASF24:
	.ascii	"__intptr_t\000"
.LASF112:
	.ascii	"atol\000"
.LASF154:
	.ascii	"iRec6\000"
.LASF4:
	.ascii	"__int16_t\000"
.LASF66:
	.ascii	"_ZNSt15__exception_ptr13exception_ptrC4EDn\000"
.LASF42:
	.ascii	"uint_least32_t\000"
.LASF181:
	.ascii	"fTemp10\000"
.LASF182:
	.ascii	"fTemp11\000"
.LASF18:
	.ascii	"__int_least16_t\000"
.LASF21:
	.ascii	"__uint_least32_t\000"
.LASF126:
	.ascii	"wcstombs\000"
.LASF30:
	.ascii	"uint16_t\000"
.LASF11:
	.ascii	"long unsigned int\000"
.LASF211:
	.ascii	"nothrow\000"
.LASF142:
	.ascii	"iRec10\000"
.LASF215:
	.ascii	"rand\000"
.LASF72:
	.ascii	"_ZNSt15__exception_ptr13exception_ptrD4Ev\000"
.LASF153:
	.ascii	"fRec14\000"
.LASF193:
	.ascii	"k_osc_api_version\000"
.LASF105:
	.ascii	"5div_t\000"
.LASF202:
	.ascii	"cubicsat_lut_f\000"
.LASF17:
	.ascii	"__uint_least8_t\000"
.LASF145:
	.ascii	"fRec20\000"
.LASF150:
	.ascii	"fRec17\000"
.LASF113:
	.ascii	"bsearch\000"
.LASF144:
	.ascii	"fRec23\000"
.LASF146:
	.ascii	"fRec24\000"
.LASF147:
	.ascii	"fRec25\000"
.LASF156:
	.ascii	"fRec0\000"
.LASF159:
	.ascii	"_ZN5mydsp13instanceClearEv\000"
.LASF163:
	.ascii	"convert_int\000"
.LASF52:
	.ascii	"uint_fast64_t\000"
.LASF118:
	.ascii	"wchar_t\000"
.LASF155:
	.ascii	"fRec2\000"
.LASF82:
	.ascii	"floor\000"
.LASF35:
	.ascii	"intptr_t\000"
.LASF140:
	.ascii	"user_osc_param_t\000"
.LASF102:
	.ascii	"_M_exception_object\000"
.LASF210:
	.ascii	"_ZSt5floorf\000"
.LASF214:
	.ascii	"decltype(nullptr)\000"
.LASF107:
	.ascii	"ldiv_t\000"
.LASF187:
	.ascii	"_hook_cycle\000"
.LASF114:
	.ascii	"getenv\000"
.LASF98:
	.ascii	"__gnu_debug\000"
.LASF37:
	.ascii	"int_least8_t\000"
.LASF62:
	.ascii	"exception_ptr\000"
.LASF76:
	.ascii	"_ZNSt15__exception_ptr13exception_ptr4swapERS0_\000"
.LASF100:
	.ascii	"sizetype\000"
.LASF138:
	.ascii	"resonance\000"
.LASF49:
	.ascii	"int_fast32_t\000"
.LASF43:
	.ascii	"int_least64_t\000"
.LASF212:
	.ascii	"_ZSt7nothrow\000"
.LASF141:
	.ascii	"mydsp\000"
.LASF57:
	.ascii	"__exception_ptr\000"
.LASF91:
	.ascii	"__is_signed\000"
.LASF186:
	.ascii	"platform\000"
.LASF115:
	.ascii	"ldiv\000"
.LASF53:
	.ascii	"intmax_t\000"
.LASF136:
	.ascii	"pitch\000"
.LASF78:
	.ascii	"_ZNKSt15__exception_ptr13exception_ptr20__cxa_excep"
	.ascii	"tion_typeEv\000"
.LASF157:
	.ascii	"fSampleRate\000"
.LASF73:
	.ascii	"_M_get\000"
.LASF14:
	.ascii	"__uint64_t\000"
.LASF61:
	.ascii	"_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv"
	.ascii	"\000"
.LASF216:
	.ascii	"_ZN9__gnu_cxx24__numeric_traits_integerIiE5__maxE\000"
.LASF97:
	.ascii	"float\000"
.LASF71:
	.ascii	"~exception_ptr\000"
.LASF44:
	.ascii	"uint_least64_t\000"
.LASF70:
	.ascii	"_ZNSt15__exception_ptr13exception_ptraSEOS0_\000"
.LASF48:
	.ascii	"uint_fast16_t\000"
.LASF117:
	.ascii	"mbstowcs\000"
.LASF121:
	.ascii	"srand\000"
.LASF94:
	.ascii	"bool\000"
.LASF169:
	.ascii	"outputs\000"
.LASF110:
	.ascii	"atof\000"
.LASF191:
	.ascii	"piecewise_construct\000"
.LASF23:
	.ascii	"__uint_least64_t\000"
.LASF111:
	.ascii	"atoi\000"
.LASF123:
	.ascii	"strtol\000"
.LASF31:
	.ascii	"int32_t\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF106:
	.ascii	"6ldiv_t\000"
.LASF68:
	.ascii	"operator=\000"
.LASF205:
	.ascii	"GNU C++11 5.4.1 20160919 (release) [ARM/embedded-5-"
	.ascii	"branch revision 240496] -mcpu=cortex-m4 -mthumb -mn"
	.ascii	"o-thumb-interwork -mlittle-endian -mfloat-abi=hard "
	.ascii	"-mfpu=fpv4-sp-d16 -g -O0 -std=c++11 -fsingle-precis"
	.ascii	"ion-constant -fcheck-new -fno-rtti -fno-exceptions "
	.ascii	"-fno-non-call-exceptions\000"
.LASF60:
	.ascii	"_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv\000"
.LASF131:
	.ascii	"double_t\000"
.LASF168:
	.ascii	"inputs\000"
.LASF5:
	.ascii	"short int\000"
.LASF173:
	.ascii	"iTemp2\000"
.LASF174:
	.ascii	"iTemp3\000"
.LASF46:
	.ascii	"uint_fast8_t\000"
.LASF25:
	.ascii	"__uintptr_t\000"
.LASF201:
	.ascii	"sqrtm2log_lut_f\000"
.LASF127:
	.ascii	"wctomb\000"
.LASF39:
	.ascii	"int_least16_t\000"
.LASF47:
	.ascii	"int_fast16_t\000"
.LASF195:
	.ascii	"wt_sine_lut_f\000"
.LASF206:
	.ascii	"../build/oscillator.cpp\000"
.LASF208:
	.ascii	"__value\000"
.LASF84:
	.ascii	"_ZSt3maxIiERKT_S2_S2_\000"
.LASF213:
	.ascii	"__numeric_traits_integer<int>\000"
.LASF104:
	.ascii	"div_t\000"
.LASF194:
	.ascii	"midi_to_hz_lut_f\000"
.LASF95:
	.ascii	"long double\000"
.LASF152:
	.ascii	"fRec16\000"
.LASF203:
	.ascii	"schetzen_lut_f\000"
.LASF101:
	.ascii	"char\000"
.LASF26:
	.ascii	"unsigned int\000"
.LASF6:
	.ascii	"__uint16_t\000"
.LASF38:
	.ascii	"uint_least8_t\000"
.LASF56:
	.ascii	"__debug\000"
.LASF40:
	.ascii	"uint_least16_t\000"
.LASF209:
	.ascii	"type_info\000"
.LASF190:
	.ascii	"ssizetype\000"
.LASF75:
	.ascii	"_ZNKSt15__exception_ptr13exception_ptr6_M_getEv\000"
.LASF20:
	.ascii	"__int_least32_t\000"
.LASF19:
	.ascii	"__uint_least16_t\000"
.LASF7:
	.ascii	"short unsigned int\000"
.LASF51:
	.ascii	"int_fast64_t\000"
.LASF27:
	.ascii	"int8_t\000"
.LASF77:
	.ascii	"__cxa_exception_type\000"
.LASF137:
	.ascii	"cutoff\000"
.LASF59:
	.ascii	"_M_release\000"
.LASF177:
	.ascii	"fTemp6\000"
.LASF183:
	.ascii	"iTemp12\000"
.LASF184:
	.ascii	"iTemp15\000"
.LASF32:
	.ascii	"uint32_t\000"
.LASF198:
	.ascii	"wt_par_lut_f\000"
.LASF162:
	.ascii	"operator bool\000"
.LASF164:
	.ascii	"_ZNKSt15__exception_ptr13exception_ptrcvbEv\000"
.LASF124:
	.ascii	"strtoul\000"
.LASF92:
	.ascii	"__digits\000"
.LASF199:
	.ascii	"log_lut_f\000"
.LASF132:
	.ascii	"q31_t\000"
.LASF16:
	.ascii	"__int_least8_t\000"
.LASF63:
	.ascii	"_ZNSt15__exception_ptr13exception_ptrC4EPv\000"
.LASF133:
	.ascii	"__is_integer<float>\000"
.LASF28:
	.ascii	"uint8_t\000"
.LASF134:
	.ascii	"user_osc_param\000"
.LASF161:
	.ascii	"_ZN5mydsp7computeEiPPfS1_\000"
.LASF125:
	.ascii	"system\000"
.LASF204:
	.ascii	"bitres_lut_f\000"
.LASF108:
	.ascii	"__compar_fn_t\000"
.LASF74:
	.ascii	"swap\000"
.LASF139:
	.ascii	"reserved0\000"
.LASF148:
	.ascii	"fVec0\000"
.LASF149:
	.ascii	"fVec1\000"
.LASF158:
	.ascii	"instanceClear\000"
.LASF67:
	.ascii	"_ZNSt15__exception_ptr13exception_ptrC4EOS0_\000"
.LASF189:
	.ascii	"frames\000"
.LASF90:
	.ascii	"__max\000"
.LASF87:
	.ascii	"__gnu_cxx\000"
.LASF122:
	.ascii	"strtod\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.4.1 20160919 (release) [ARM/embedded-5-branch revision 240496]"
