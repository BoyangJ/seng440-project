	.arch armv4t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"colour_space_conversion.c"
	.text
	.align	2
	.global	rgb_to_ycc
	.type	rgb_to_ycc, %function
rgb_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	add	ip, sp, #4
	stmia	ip, {r1, r2, r3}
	flds	s14, [sp, #8]
	fcvtds	d7, s14
	flds	s6, [sp, #4]
	fldd	d16, .L3
	fldd	d17, .L3+8
	fmuld	d4, d7, d16
	fldd	d16, .L3+16
	fcvtds	d3, s6
	fmuld	d5, d7, d16
	fmuld	d6, d7, d17
	flds	s14, [sp, #12]
	fldd	d18, .L3+24
	fldd	d16, .L3+32
	fldd	d17, .L3+40
	fcvtds	d7, s14
	fmacd	d4, d3, d16
	fmacd	d6, d3, d17
	fmacd	d5, d3, d18
	fldd	d16, .L3+48
	fldd	d17, .L3+56
	fmacd	d4, d7, d16
	fmacd	d5, d7, d17
	fmacd	d6, d7, d18
	fconstd	d16, #48
	fldd	d17, .L3+64
	faddd	d4, d4, d16
	faddd	d6, d6, d17
	faddd	d5, d5, d17
	fcvtsd	s12, d6
	fcvtsd	s10, d5
	fcvtsd	s8, d4
	fsts	s10, [r0, #8]
	fsts	s8, [r0, #0]
	fsts	s12, [r0, #4]
	add	sp, sp, #16
	bx	lr
.L4:
	.align	3
.L3:
	.word	-1683627180
	.word	1071653060
	.word	1992864825
	.word	-1076715586
	.word	-549755814
	.word	-1076392625
	.word	1958505087
	.word	1071388819
	.word	549755814
	.word	1070625456
	.word	-68719477
	.word	-1077743191
	.word	721554506
	.word	1069094535
	.word	1443109011
	.word	-1078842098
	.word	0
	.word	1080033280
	.size	rgb_to_ycc, .-rgb_to_ycc
	.align	2
	.global	rgb_to_ycc_y
	.type	rgb_to_ycc_y, %function
rgb_to_ycc_y:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	add	r3, sp, #4
	stmia	r3, {r0, r1, r2}
	flds	s14, [sp, #8]
	flds	s12, [sp, #4]
	fcvtds	d7, s14
	fldd	d17, .L7
	fcvtds	d6, s12
	fmuld	d16, d7, d17
	flds	s14, [sp, #12]
	fldd	d17, .L7+8
	fcvtds	d7, s14
	fmacd	d16, d6, d17
	fldd	d17, .L7+16
	fconstd	d18, #48
	fmacd	d16, d7, d17
	faddd	d16, d16, d18
	fcvtsd	s15, d16
	fmrs	r0, s15
	add	sp, sp, #16
	bx	lr
.L8:
	.align	3
.L7:
	.word	-1683627180
	.word	1071653060
	.word	549755814
	.word	1070625456
	.word	721554506
	.word	1069094535
	.size	rgb_to_ycc_y, .-rgb_to_ycc_y
	.align	2
	.global	ycc_to_rgb
	.type	ycc_to_rgb, %function
ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	add	ip, sp, #4
	stmia	ip, {r1, r2, r3}
	fconsts	s13, #48
	flds	s14, [sp, #4]
	fsubs	s14, s14, s13
	flds	s10, [sp, #8]
	flds	s9, .L11+40
	fcvtds	d7, s14
	fldd	d16, .L11
	fsubs	s10, s10, s9
	fmuld	d6, d7, d16
	flds	s14, [sp, #12]
	fcvtds	d5, s10
	fsubs	s14, s14, s9
	fcpyd	d3, d6
	fldd	d16, .L11+8
	fcvtds	d7, s14
	fmacd	d3, d5, d16
	fcpyd	d4, d6
	fldd	d16, .L11+16
	fldd	d17, .L11+24
	fmacd	d3, d7, d16
	fldd	d16, .L11+32
	fmacd	d4, d5, d17
	fmacd	d6, d7, d16
	fcvtsd	s8, d4
	fcvtsd	s6, d3
	fcvtsd	s12, d6
	fsts	s8, [r0, #8]
	fsts	s12, [r0, #0]
	fsts	s6, [r0, #4]
	add	sp, sp, #16
	bx	lr
.L12:
	.align	3
.L11:
	.word	1992864825
	.word	1072865214
	.word	-377957122
	.word	-1076350682
	.word	-1821066134
	.word	-1075182568
	.word	-446676599
	.word	1073750736
	.word	1271310320
	.word	1073318199
	.word	1124073472
	.size	ycc_to_rgb, .-ycc_to_rgb
	.align	2
	.global	matrix_ycc_to_rgb
	.type	matrix_ycc_to_rgb, %function
matrix_ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L21+44
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r5, [r3, #0]
	cmp	r5, #0
	mov	r7, r0
	mov	r6, r1
	ble	.L18
	fconsts	s4, #48
	flds	s5, .L21+40
	ldr	r3, .L21+48
	mov	r4, #0
	ldr	r1, [r3, #0]
	fldd	d20, .L21
	fldd	d19, .L21+8
	mov	r0, r4
.L15:
	cmp	r1, #0
	ble	.L17
	ldr	ip, [r7, r0]
	ldr	r2, [r6, r0]
	fldd	d18, .L21+16
	fldd	d17, .L21+24
	fldd	d16, .L21+32
	mov	r3, #0
.L16:
	flds	s14, [ip, #0]
	fsubs	s14, s14, s4
	flds	s8, [ip, #4]
	fcvtds	d7, s14
	flds	s12, [ip, #8]
	fmuld	d5, d7, d20
	fsubs	s8, s8, s5
	fcpyd	d7, d5
	fcvtds	d4, s8
	fsubs	s12, s12, s5
	fcpyd	d3, d5
	fcvtds	d6, s12
	fmacd	d7, d4, d18
	fmacd	d3, d6, d19
	fmacd	d7, d6, d17
	fmacd	d5, d4, d16
	fcvtsd	s6, d3
	fcvtsd	s14, d7
	fcvtsd	s10, d5
	add	r3, r3, #1
	cmp	r3, r1
	fsts	s6, [r2, #0]
	fsts	s14, [r2, #4]
	fsts	s10, [r2, #8]
	add	ip, ip, #12
	add	r2, r2, #12
	blt	.L16
.L17:
	add	r4, r4, #1
	cmp	r5, r4
	add	r0, r0, #4
	bgt	.L15
.L18:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L22:
	.align	3
.L21:
	.word	1992864825
	.word	1072865214
	.word	1271310320
	.word	1073318199
	.word	-377957122
	.word	-1076350682
	.word	-1821066134
	.word	-1075182568
	.word	-446676599
	.word	1073750736
	.word	1124073472
	.word	height
	.word	width
	.size	matrix_ycc_to_rgb, .-matrix_ycc_to_rgb
	.align	2
	.global	rgb_to_ycc_avg
	.type	rgb_to_ycc_avg, %function
rgb_to_ycc_avg:
	@ Function supports interworking.
	@ args = 36, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	fstmfdd	sp!, {d8, d9, d10, d11, d12, d13, d14, d15}
	sub	sp, sp, #16
	add	ip, sp, #4
	stmia	ip, {r1, r2, r3}
	flds	s6, [sp, #84]
	flds	s14, [sp, #8]
	fcvtds	d3, s6
	fcvtds	d7, s14
	flds	s2, [sp, #4]
	flds	s4, [sp, #80]
	flds	s18, [sp, #96]
	fldd	d18, .L25
	fldd	d23, .L25+8
	fldd	d16, .L25+16
	fcvtds	d1, s2
	fcvtds	d2, s4
	fcvtds	d9, s18
	fmuld	d4, d7, d16
	fmuld	d24, d3, d16
	fmuld	d5, d7, d18
	fmuld	d13, d3, d18
	fmuld	d6, d7, d23
	fmuld	d12, d3, d23
	flds	s30, [sp, #12]
	flds	s6, [sp, #88]
	flds	s28, [sp, #92]
	flds	s14, [sp, #108]
	fldd	d17, .L25+24
	fldd	d22, .L25+32
	fldd	d21, .L25+40
	fcvtds	d7, s14
	fmacd	d4, d1, d21
	fcvtds	d15, s30
	fcvtds	d3, s6
	fcvtds	d14, s28
	fmacd	d5, d1, d17
	fmacd	d6, d1, d22
	flds	s22, [sp, #100]
	flds	s2, [sp, #104]
	fmacd	d24, d2, d21
	fmacd	d13, d2, d17
	fmacd	d12, d2, d22
	fmuld	d10, d9, d16
	fmuld	d0, d9, d18
	fmuld	d8, d9, d23
	fldd	d20, .L25+48
	fldd	d19, .L25+56
	fmuld	d9, d7, d16
	fcvtds	d11, s22
	fcvtds	d1, s2
	fmuld	d2, d7, d18
	fmacd	d24, d3, d19
	fconstd	d18, #48
	fmacd	d10, d14, d21
	fmacd	d13, d3, d20
	fmacd	d12, d3, d17
	fmacd	d4, d15, d19
	fmuld	d3, d7, d23
	fmacd	d5, d15, d20
	flds	s14, [sp, #112]
	fmacd	d0, d14, d17
	fmacd	d6, d15, d17
	fmacd	d8, d14, d22
	fldd	d16, .L25+64
	fcvtds	d7, s14
	fmacd	d9, d1, d21
	faddd	d4, d4, d18
	fmacd	d3, d1, d22
	fmacd	d10, d11, d19
	faddd	d5, d5, d16
	faddd	d13, d13, d16
	fmacd	d0, d11, d20
	fmacd	d2, d1, d17
	faddd	d6, d6, d16
	faddd	d12, d12, d16
	fmacd	d8, d11, d17
	faddd	d21, d24, d18
	fmacd	d9, d7, d19
	fmacd	d2, d7, d20
	fmacd	d3, d7, d17
	fcvtsd	s10, d5
	fcvtsd	s15, d21
	fcvtsd	s26, d13
	faddd	d0, d0, d16
	fcvtsd	s12, d6
	fcvtsd	s24, d12
	faddd	d8, d8, d16
	fcvtsd	s8, d4
	faddd	d10, d10, d18
	faddd	d3, d3, d16
	fadds	s10, s10, s26
	fadds	s12, s12, s24
	fadds	s8, s8, s15
	faddd	d9, d9, d18
	fcvtsd	s0, d0
	faddd	d2, d2, d16
	fcvtsd	s16, d8
	fcvtsd	s20, d10
	fcvtsd	s6, d3
	fadds	s10, s10, s0
	fadds	s12, s12, s16
	fadds	s8, s8, s20
	fcvtsd	s4, d2
	fcvtsd	s18, d9
	fconsts	s15, #80
	fadds	s10, s10, s4
	fadds	s12, s12, s6
	fadds	s8, s8, s18
	fmuls	s7, s10, s15
	fmuls	s14, s8, s15
	fmuls	s9, s12, s15
	fsts	s14, [r0, #0]
	fsts	s7, [r0, #8]
	fsts	s9, [r0, #4]
	add	sp, sp, #16
	fldmfdd	sp!, {d8, d9, d10, d11, d12, d13, d14, d15}
	bx	lr
.L26:
	.align	3
.L25:
	.word	-549755814
	.word	-1076392625
	.word	1992864825
	.word	-1076715586
	.word	-1683627180
	.word	1071653060
	.word	1958505087
	.word	1071388819
	.word	-68719477
	.word	-1077743191
	.word	549755814
	.word	1070625456
	.word	1443109011
	.word	-1078842098
	.word	721554506
	.word	1069094535
	.word	0
	.word	1080033280
	.size	rgb_to_ycc_avg, .-rgb_to_ycc_avg
	.align	2
	.global	matrix_rgb_to_ycc
	.type	matrix_rgb_to_ycc, %function
matrix_rgb_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	fstmfdd	sp!, {d8, d9, d10, d11}
	ldr	r3, .L34+24
	ldr	r2, [r3, #0]
	sub	r2, r2, #1
	sub	sp, sp, #108
	cmp	r2, #0
	str	r2, [sp, #52]
	ble	.L32
	ldr	r3, .L34+28
	ldr	r2, [r3, #0]
	str	r0, [sp, #84]
	sub	r2, r2, #1
	mov	r0, #0
	str	r1, [sp, #80]
	str	r2, [sp, #48]
	str	r0, [sp, #56]
	fldd	d11, .L34
	fldd	d10, .L34+8
	fldd	d9, .L34+16
.L29:
	ldr	r2, [sp, #48]
	cmp	r2, #0
	ble	.L31
	fconstd	d8, #48
	ldr	r3, [sp, #80]
	ldr	r0, [sp, #84]
	add	r1, sp, #80
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	r0, [r0, #0]
	ldr	r3, [r3, #0]
	ldr	r1, [r1, #4]
	ldr	r2, [r2, #4]
	str	r3, [sp, #64]
	str	r0, [sp, #68]
	mov	r3, #0
	mov	r7, r0
	add	r0, sp, #12
	str	r1, [sp, #72]
	str	r2, [sp, #76]
	str	r3, [sp, #60]
	ldr	r9, [sp, #64]
	str	r0, [sp, #44]
	mov	r6, r2
	mov	sl, r1
	mov	r8, r3
	add	fp, sp, #24
.L30:
	ldr	r3, [sp, #68]
	add	r3, r3, r8
	flds	s12, [r3, #4]
	flds	s8, [r3, #0]
	fcvtds	d6, s12
	flds	s10, [r7, #8]
	fcvtds	d4, s8
	fmuld	d7, d6, d10
	fcvtds	d5, s10
	fmacd	d7, d4, d11
	fmacd	d7, d5, d9
	faddd	d7, d7, d8
	fcvtsd	s14, d7
	fmrs	r2, s14
	ldr	r5, [sp, #64]
	ldr	r3, [sp, #76]
	str	r2, [r5, r8]!	@ float
	add	r3, r3, r8
	flds	s12, [r3, #4]
	flds	s8, [r3, #0]
	fcvtds	d6, s12
	flds	s10, [r6, #8]
	fmuld	d7, d6, d10
	fcvtds	d4, s8
	fcvtds	d5, s10
	fmacd	d7, d4, d11
	fmacd	d7, d5, d9
	faddd	d7, d7, d8
	fcvtsd	s14, d7
	fmrs	r1, s14
	ldr	r4, [sp, #72]
	str	r1, [r4, r8]!	@ float
	flds	s12, [r7, #16]
	flds	s10, [r7, #12]
	fcvtds	d6, s12
	fcvtds	d5, s10
	fmuld	d7, d6, d10
	flds	s12, [r7, #20]
	fmacd	d7, d5, d11
	fcvtds	d6, s12
	fmacd	d7, d6, d9
	faddd	d7, d7, d8
	fcvtsd	s14, d7
	fsts	s14, [r9, #12]
	flds	s12, [r6, #16]
	flds	s10, [r6, #12]
	fcvtds	d6, s12
	fcvtds	d5, s10
	fmuld	d7, d6, d10
	flds	s12, [r6, #20]
	fmacd	d7, d5, d11
	fcvtds	d6, s12
	fmacd	d7, d6, d9
	faddd	d7, d7, d8
	fcvtsd	s14, d7
	fsts	s14, [sl, #12]
	ldmia	r6, {r0, r1, r2}
	mov	r3, sp
	stmia	r3, {r0, r1, r2}
	add	r3, r7, #12
	ldmia	r3, {r0, r1, r2}
	ldr	r3, [sp, #44]
	stmia	r3, {r0, r1, r2}
	add	r3, r6, #12
	ldmia	r3, {r0, r1, r2}
	stmia	fp, {r0, r1, r2}
	add	r0, sp, #92
	ldmia	r7, {r1, r2, r3}
	bl	rgb_to_ycc_avg
	ldr	r0, [sp, #60]
	ldr	r1, [sp, #48]
	ldr	r2, [sp, #100]	@ float
	ldr	r3, [sp, #96]	@ float
	add	r0, r0, #2
	cmp	r1, r0
	str	r3, [r5, #4]	@ float
	str	r2, [r9, #8]	@ float
	str	r3, [r4, #4]	@ float
	str	r2, [sl, #8]	@ float
	str	r3, [r9, #16]	@ float
	str	r2, [r9, #20]	@ float
	str	r3, [sl, #16]	@ float
	str	r2, [sl, #20]	@ float
	str	r0, [sp, #60]
	add	r8, r8, #24
	add	r7, r7, #24
	add	r6, r6, #24
	add	r9, r9, #24
	add	sl, sl, #24
	bgt	.L30
.L31:
	ldr	r2, [sp, #56]
	add	r0, sp, #80
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r3, [sp, #52]
	add	r2, r2, #2
	add	r0, r0, #8
	add	r1, r1, #8
	cmp	r3, r2
	str	r2, [sp, #56]
	str	r0, [sp, #80]
	str	r1, [sp, #84]
	bgt	.L29
.L32:
	add	sp, sp, #108
	fldmfdd	sp!, {d8, d9, d10, d11}
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L35:
	.align	3
.L34:
	.word	549755814
	.word	1070625456
	.word	-1683627180
	.word	1071653060
	.word	721554506
	.word	1069094535
	.word	height
	.word	width
	.size	matrix_rgb_to_ycc, .-matrix_rgb_to_ycc
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #28
	bl	clock
	ldr	r1, .L69+44
	str	r0, [sp, #20]
	ldr	r0, .L69+48
	bl	fopen
	ldr	sl, .L69+52
	mov	r7, r0
	ldr	r1, .L69+56
	mov	r2, sl
	bl	fscanf
	ldr	r2, .L69+60
	ldr	r1, .L69+56
	mov	r0, r7
	bl	fscanf
	ldr	r1, .L69+60
	ldr	r0, [r1, #0]
	mov	r0, r0, asl #2
	bl	malloc
	ldr	r2, .L69+60
	str	r0, [sp, #16]
	ldr	r0, [r2, #0]
	mov	r0, r0, asl #2
	bl	malloc
	mov	fp, r0
	ldr	r0, .L69+60
	ldr	r3, [r0, #0]
	cmp	r3, #0
	ble	.L37
	mov	r5, #0
	mov	r4, r5
.L38:
	ldr	r3, [sl, #0]
	mov	r0, r3, asl #4
	sub	r0, r0, r3, asl #2
	bl	malloc
	ldr	r3, [sl, #0]
	ldr	r1, [sp, #16]
	mov	r2, r3, asl #4
	str	r0, [r1, r4]
	sub	r0, r2, r3, asl #2
	bl	malloc
	ldr	r2, .L69+60
	ldr	r3, [r2, #0]
	add	r5, r5, #1
	cmp	r3, r5
	str	r0, [fp, r4]
	add	r4, r4, #4
	bgt	.L38
	cmp	r3, #0
	movgt	r8, #0
	ble	.L37
.L39:
	ldr	r3, [sl, #0]
	cmp	r3, #0
	movgt	r5, #0
	movgt	r4, r5
	movgt	r6, r8, asl #2
	ble	.L42
.L40:
	ldr	r3, [sp, #16]
	ldr	ip, [r3, r6]
	add	ip, ip, r4
	mov	r2, ip
	add	r3, r2, #4
	add	ip, ip, #8
	mov	r0, r7
	ldr	r1, .L69+64
	str	ip, [sp, #0]
	bl	fscanf
	ldr	r3, [sl, #0]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #12
	bgt	.L40
.L42:
	ldr	r0, .L69+60
	ldr	r3, [r0, #0]
	add	r8, r8, #1
	cmp	r3, r8
	bgt	.L39
.L37:
	mov	r0, r7
	bl	fclose
	ldr	r0, [sp, #16]
	mov	r1, fp
	bl	matrix_rgb_to_ycc
	ldr	r1, .L69+68
	ldr	r0, .L69+72
	bl	fopen
	ldr	r1, .L69+60
	ldr	r3, [r1, #0]
	cmp	r3, #0
	mov	r7, r0
	movgt	r8, #0
	ble	.L43
.L44:
	ldr	r3, [sl, #0]
	cmp	r3, #0
	movgt	r5, #0
	movgt	r4, r5
	movgt	r6, r8, asl #2
	ble	.L47
.L45:
	ldr	r3, [fp, r6]
	add	r2, r3, r4
	flds	s14, [r2, #4]
	fcvtds	d7, s14
	add	r3, r3, r4
	flds	s11, [r3, #0]
	fstd	d7, [sp, #0]
	flds	s12, [r2, #8]
	fcvtds	d16, s11
	fcvtds	d6, s12
	fmrrd	r2, r3, d16
	mov	r0, r7
	ldr	r1, .L69+76
	fstd	d6, [sp, #8]
	bl	fprintf
	ldr	r3, [sl, #0]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #12
	bgt	.L45
.L47:
	ldr	r0, .L69+60
	ldr	r3, [r0, #0]
	add	r8, r8, #1
	cmp	r3, r8
	bgt	.L44
.L43:
	mov	r0, r7
	bl	fclose
	ldr	r1, .L69+60
	ldr	r0, [r1, #0]
	mov	r0, r0, asl #2
	bl	malloc
	ldr	r2, .L69+60
	ldr	r3, [r2, #0]
	cmp	r3, #0
	mov	r9, r0
	ble	.L48
	mov	r4, #0
.L49:
	ldr	r3, [sl, #0]
	mov	r0, r3, asl #4
	sub	r0, r0, r3, asl #2
	bl	malloc
	ldr	r3, .L69+60
	ldr	r6, [r3, #0]
	str	r0, [r9, r4, asl #2]
	add	r4, r4, #1
	cmp	r6, r4
	bgt	.L49
	cmp	r6, #0
	ble	.L48
	fconsts	s4, #48
	flds	s5, .L69+40
	ldr	r3, .L69+52
	mov	r5, #0
	ldr	lr, [r3, #0]
	fldd	d20, .L69
	fldd	d19, .L69+8
	mov	r4, r5
.L50:
	cmp	lr, #0
	ble	.L53
	mov	r1, #0
	fldd	d18, .L69+16
	fldd	d17, .L69+24
	fldd	d16, .L69+32
	ldr	ip, [r9, r4]
	ldr	r0, [fp, r4]
	mov	r2, r1
.L51:
	add	r7, r0, r2
	flds	s12, [r7, #0]
	fsubs	s12, s12, s4
	add	r3, r0, r2
	flds	s8, [r3, #4]
	flds	s14, [r3, #8]
	fcvtds	d6, s12
	fsubs	s8, s8, s5
	fmuld	d5, d6, d20
	fsubs	s14, s14, s5
	fcvtds	d4, s8
	fcvtds	d7, s14
	fcpyd	d6, d5
	fcpyd	d3, d5
	fmacd	d6, d4, d18
	fmacd	d3, d7, d19
	fmacd	d6, d7, d17
	fmacd	d5, d4, d16
	fcvtsd	s6, d3
	fcvtsd	s12, d6
	fcvtsd	s10, d5
	fmrs	r7, s6
	add	r1, r1, #1
	add	r3, ip, r2
	cmp	r1, lr
	str	r7, [ip, r2]	@ float
	fsts	s10, [r3, #8]
	fsts	s12, [r3, #4]
	add	r2, r2, #12
	blt	.L51
.L53:
	add	r5, r5, #1
	cmp	r5, r6
	add	r4, r4, #4
	blt	.L50
.L48:
	ldr	r0, .L69+80
	ldr	r1, .L69+68
	bl	fopen
	mov	r7, r0
	ldr	r0, .L69+60
	ldr	r3, [r0, #0]
	cmp	r3, #0
	movgt	r8, #0
	ble	.L54
.L55:
	ldr	r3, [sl, #0]
	cmp	r3, #0
	movgt	r5, #0
	movgt	r4, r5
	movgt	r6, r8, asl #2
	ble	.L58
.L56:
	ldr	r3, [r9, r6]
	add	r2, r3, r4
	flds	s14, [r2, #4]
	fcvtds	d7, s14
	add	r3, r3, r4
	flds	s11, [r3, #0]
	fstd	d7, [sp, #0]
	flds	s12, [r2, #8]
	fcvtds	d16, s11
	fcvtds	d6, s12
	fmrrd	r2, r3, d16
	mov	r0, r7
	ldr	r1, .L69+76
	fstd	d6, [sp, #8]
	bl	fprintf
	ldr	r3, [sl, #0]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #12
	bgt	.L56
.L58:
	ldr	r0, .L69+60
	ldr	r3, [r0, #0]
	add	r8, r8, #1
	cmp	r3, r8
	bgt	.L55
.L54:
	mov	r0, r7
	bl	fclose
	ldr	r1, .L69+60
	ldr	r3, [r1, #0]
	cmp	r3, #0
	ble	.L59
	mov	r5, #0
	mov	r4, r5
.L60:
	ldr	r2, [sp, #16]
	ldr	r0, [r2, r4]
	bl	free
	ldr	r7, .L69+60
	ldr	r0, [fp, r4]
	bl	free
	ldr	r0, [r9, r4]
	bl	free
	ldr	r3, [r7, #0]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #4
	bgt	.L60
.L59:
	ldr	r0, [sp, #16]
	bl	free
	mov	r0, fp
	bl	free
	mov	r0, r9
	bl	free
	bl	clock
	ldr	r2, [sp, #20]
	ldr	r3, .L69+84
	rsb	r1, r2, r0
	smull	r7, r2, r3, r1
	mov	r1, r1, asr #31
	rsb	r1, r1, r2, asr #6
	ldr	r0, .L69+88
	bl	printf
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L70:
	.align	3
.L69:
	.word	1992864825
	.word	1072865214
	.word	1271310320
	.word	1073318199
	.word	-377957122
	.word	-1076350682
	.word	-1821066134
	.word	-1075182568
	.word	-446676599
	.word	1073750736
	.word	1124073472
	.word	.LC1
	.word	.LC0
	.word	width
	.word	.LC2
	.word	height
	.word	.LC3
	.word	.LC5
	.word	.LC4
	.word	.LC6
	.word	.LC7
	.word	274877907
	.word	.LC8
	.size	main, .-main
	.comm	height,4,4
	.comm	width,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"test2.rgb\000"
	.space	2
.LC1:
	.ascii	"r\000"
	.space	2
.LC2:
	.ascii	"%d\000"
	.space	1
.LC3:
	.ascii	"%f %f %f\000"
	.space	3
.LC4:
	.ascii	"out.ycc\000"
.LC5:
	.ascii	"w\000"
	.space	2
.LC6:
	.ascii	"%.0f %.0f %.0f\012\000"
.LC7:
	.ascii	"orig.rgb\000"
	.space	3
.LC8:
	.ascii	"Time for rgb -> ycc in ms: %d\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
