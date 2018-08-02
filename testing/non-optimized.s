	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 18, 4
	.file	"colour_space_conversion.c"
	.text
	.align	2
	.global	clamp
	.type	clamp, %function
clamp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	mov	r0, r1
	cmp	r3, r1
	bxcc	lr
	cmp	r2, r3
	movcc	r0, r2
	movcs	r0, r3
	bx	lr
	.size	clamp, .-clamp
	.align	2
	.global	rgb_to_ycc
	.type	rgb_to_ycc, %function
rgb_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #36
	mov	r8, r0
	add	r0, sp, #4
	stmia	r0, {r1, r2, r3}
	mov	r5, r1
	ldr	r6, [sp, #8]
	ldr	r4, [sp, #12]
	mov	r1, r1, asl #7
	sub	r1, r1, r5, asl #5
	add	r1, r1, r5
	mov	r3, r1, asl #2
	add	r1, r1, r3
	mov	r3, r1, asl #2
	add	r1, r1, r3
	rsb	r1, r1, #0
	mov	r3, r4, asl #6
	sub	r3, r3, r4, asl #2
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	rsb	r2, r4, r2
	mov	r2, r2, asl #2
	mov	r2, r2, asr #13
	add	r2, r2, r1, asr #14
	add	r2, r2, #2048
	mov	r0, r6, asl #2
	mov	r7, r6, asl #5
	add	r0, r0, r7
	add	r0, r0, r6
	mov	r0, r0, asl #2
	add	r0, r0, r6
	mov	r0, r0, asl #4
	sub	r0, r2, r0, asr #13
	mov	r1, #256
	mov	r2, #3840
	bl	clamp
	mov	sl, r0
	mov	r3, r5, asl #6
	sub	r3, r3, r5, asl #2
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	rsb	r2, r5, r2
	mov	r2, r2, asl #2
	mov	r3, r6, asl #3
	add	r3, r3, r7
	mov	r1, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r6
	mov	r0, r3, asl #4
	rsb	r0, r3, r0
	mov	r0, r0, asr #13
	rsb	r0, r0, r2, asr #13
	mov	r2, r4, asl #7
	sub	r2, r2, r4, asl #5
	add	r2, r2, r4
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	rsb	r3, r4, r3
	sub	r0, r0, r3, asr #15
	add	r0, r0, #2048
	mov	r1, #256
	mov	r2, #3840
	bl	clamp
	str	sl, [r8, #4]
	str	r0, [r8, #8]
	mov	r0, r8
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
	.size	rgb_to_ycc, .-rgb_to_ycc
	.global	__aeabi_ui2f
	.align	2
	.global	rgb_to_ycc_y
	.type	rgb_to_ycc_y, %function
rgb_to_ycc_y:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	add	r3, sp, #4
	stmia	r3, {r0, r1, r2}
	mov	r2, r0, asl #3
	mov	r3, r0, asl #8
	add	r2, r2, r3
	rsb	r2, r0, r2
	mov	r2, r2, asl #3
	add	r2, r2, r0
	ldr	r3, [sp, #8]
	mov	r1, r3, asl #4
	mov	r3, r3, asl #11
	add	r1, r1, r3
	mov	r1, r1, asr #12
	add	r1, r1, r2, asr #13
	add	r1, r1, #256
	ldr	ip, [sp, #12]
	mov	r3, ip, asl #4
	sub	r3, r3, ip, asl #2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	rsb	r3, ip, r3
	mov	r0, r3, asl #4
	rsb	r0, r3, r0
	mov	r0, r0, asl #1
	add	r0, r0, ip
	add	r0, r1, r0, asr #15
	mov	r1, #256
	mov	r2, #3760
	bl	clamp
	bl	__aeabi_ui2f
	add	sp, sp, #20
	ldr	lr, [sp], #4
	bx	lr
	.size	rgb_to_ycc_y, .-rgb_to_ycc_y
	.align	2
	.global	rgb_to_ycc_avg
	.type	rgb_to_ycc_avg, %function
rgb_to_ycc_avg:
	@ Function supports interworking.
	@ args = 36, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #80
	mov	r4, r0
	add	ip, sp, #4
	stmia	ip, {r1, r2, r3}
	add	r0, sp, #56
	ldmia	ip, {r1, r2, r3}
	bl	rgb_to_ycc
	add	r0, sp, #44
	add	r3, sp, #88
	ldmia	r3, {r1, r2, r3}
	bl	rgb_to_ycc
	add	r0, sp, #32
	add	r3, sp, #100
	ldmia	r3, {r1, r2, r3}
	bl	rgb_to_ycc
	add	r0, sp, #20
	add	r3, sp, #112
	ldmia	r3, {r1, r2, r3}
	bl	rgb_to_ycc
	ldr	r3, [sp, #64]
	ldr	r1, [sp, #52]
	add	r1, r1, r3
	ldr	r3, [sp, #40]
	add	r1, r1, r3
	ldr	r3, [sp, #28]
	add	r1, r1, r3
	mov	r1, r1, asr #2
	ldr	r2, [sp, #60]
	ldr	r3, [sp, #48]
	add	r3, r3, r2
	ldr	r2, [sp, #36]
	add	r3, r3, r2
	ldr	r2, [sp, #24]
	add	r3, r3, r2
	mov	r3, r3, asr #2
	str	r3, [r4, #4]
	str	r1, [r4, #8]
	mov	r0, r4
	add	sp, sp, #80
	ldmfd	sp!, {r4, lr}
	bx	lr
	.size	rgb_to_ycc_avg, .-rgb_to_ycc_avg
	.global	__aeabi_f2iz
	.align	2
	.global	matrix_rgb_to_ycc
	.type	matrix_rgb_to_ycc, %function
matrix_rgb_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #92
	str	r0, [sp, #60]
	str	r1, [sp, #56]
	ldmia	r0, {r4, ip}	@ phole ldm
	ldmia	ip, {r0, r1, r2}
	mov	r3, sp
	stmia	r3, {r0, r1, r2}
	add	lr, sp, #12
	add	r3, r4, #12
	ldmia	r3, {r0, r1, r2}
	stmia	lr, {r0, r1, r2}
	add	r3, sp, #24
	add	ip, ip, #12
	ldmia	ip, {r0, r1, r2}
	stmia	r3, {r0, r1, r2}
	add	r0, sp, #76
	ldmia	r4, {r1, r2, r3}
	bl	rgb_to_ycc_avg
	ldr	r0, [sp, #84]
	str	r0, [sp, #68]
	ldr	r9, [sp, #80]
	ldr	r3, .L17
	ldr	r5, [r3, #0]
	sub	r3, r5, #3
	cmp	r3, #0
	ble	.L11
	add	r7, sp, #56
	ldmia	r7, {r7, sl}	@ phole ldm
	mov	r2, #0
	str	r2, [sp, #64]
	str	r2, [sp, #52]
	add	r3, sp, #12
	str	r3, [sp, #48]
	add	r0, sp, #24
	str	r0, [sp, #44]
	add	r2, sp, #76
	str	r2, [sp, #40]
	b	.L12
.L13:
	mov	r6, r8
.L15:
	ldr	r3, [sl, #0]
	add	r3, r3, r6
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	ldr	r4, [r7, #0]
	bl	__aeabi_f2iz
	str	r0, [r4, r6]
	ldr	r3, [sl, #4]
	add	r3, r3, r6
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	ldr	r4, [r7, #4]
	bl	__aeabi_f2iz
	str	r0, [r4, r6]
	add	r5, r6, #12
	ldr	r3, [sl, #0]
	add	r3, r3, r5
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	ldr	r4, [r7, #0]
	bl	__aeabi_f2iz
	str	r0, [r4, r5]
	ldr	r3, [sl, #4]
	add	r3, r3, r5
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	ldr	r4, [r7, #4]
	bl	__aeabi_f2iz
	str	r0, [r4, r5]
	ldr	r3, [r7, #0]
	add	r3, r3, r6
	str	r9, [r3, #4]
	ldr	r3, [r7, #4]
	add	r3, r3, r6
	str	r9, [r3, #4]
	ldr	r3, [r7, #0]
	add	r3, r3, r5
	str	r9, [r3, #4]
	ldr	r3, [r7, #4]
	add	r3, r3, r5
	str	r9, [r3, #4]
	ldr	r3, [r7, #0]
	add	r3, r3, r6
	ldr	r0, [sp, #68]
	str	r0, [r3, #8]
	ldr	r3, [r7, #4]
	add	r3, r3, r6
	str	r0, [r3, #8]
	ldr	r3, [r7, #0]
	add	r3, r3, r5
	str	r0, [r3, #8]
	ldr	r3, [r7, #4]
	add	r3, r3, r5
	str	r0, [r3, #8]
	ldr	r4, [sl, #8]
	add	r8, r6, #24
	ldr	ip, [sl, #12]
	add	r5, r6, #36
	add	r3, ip, r8
	ldmia	r3, {r0, r1, r2}
	mov	r3, sp
	stmia	r3, {r0, r1, r2}
	add	r3, r4, r5
	ldmia	r3, {r0, r1, r2}
	ldr	r3, [sp, #48]
	stmia	r3, {r0, r1, r2}
	add	ip, ip, r5
	ldmia	ip, {r0, r1, r2}
	ldr	r3, [sp, #44]
	stmia	r3, {r0, r1, r2}
	ldr	r0, [sp, #40]
	add	r4, r4, r8
	ldmia	r4, {r1, r2, r3}
	bl	rgb_to_ycc_avg
	ldr	r0, [sp, #84]
	str	r0, [sp, #68]
	ldr	r9, [sp, #80]
	add	fp, fp, #2
	ldr	r2, .L17+4
	ldr	r3, [r2, #0]
	sub	r3, r3, #3
	cmp	r3, fp
	bgt	.L13
.L14:
	ldr	r3, [sp, #64]
	add	r3, r3, #2
	str	r3, [sp, #64]
	ldr	r3, .L17
	ldr	r5, [r3, #0]
	add	r7, r7, #8
	add	sl, sl, #8
	sub	r3, r5, #3
	ldr	r0, [sp, #64]
	cmp	r3, r0
	ble	.L11
.L12:
	ldr	r2, .L17+4
	ldr	r3, [r2, #0]
	sub	r3, r3, #3
	cmp	r3, #0
	movgt	fp, #0
	ldrgt	r6, [sp, #52]
	bgt	.L15
	b	.L14
.L11:
	sub	r5, r5, #2
	mov	r5, r5, asl #2
	ldr	r7, .L17+4
	ldr	r3, [r7, #0]
	mov	r4, r3, asl #4
	sub	r4, r4, r3, asl #2
	sub	r4, r4, #24
	ldr	r0, [sp, #60]
	ldr	r3, [r0, r5]
	add	r3, r3, r4
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	ldr	r2, [sp, #56]
	ldr	r5, [r2, r5]
	bl	__aeabi_f2iz
	str	r0, [r5, r4]
	ldr	r6, .L17
	ldr	r5, [r6, #0]
	mov	r5, r5, asl #2
	sub	r5, r5, #4
	ldr	r3, [r7, #0]
	mov	r4, r3, asl #4
	sub	r4, r4, r3, asl #2
	sub	r4, r4, #24
	ldr	r0, [sp, #60]
	ldr	r3, [r0, r5]
	add	r3, r3, r4
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	ldr	r2, [sp, #56]
	ldr	r5, [r2, r5]
	bl	__aeabi_f2iz
	str	r0, [r5, r4]
	ldr	r5, [r6, #0]
	sub	r5, r5, #2
	mov	r5, r5, asl #2
	ldr	r3, [r7, #0]
	mov	r4, r3, asl #4
	sub	r4, r4, r3, asl #2
	sub	r4, r4, #12
	ldr	r0, [sp, #60]
	ldr	r3, [r0, r5]
	add	r3, r3, r4
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	ldr	r2, [sp, #56]
	ldr	r5, [r2, r5]
	bl	__aeabi_f2iz
	str	r0, [r5, r4]
	ldr	r5, [r6, #0]
	mov	r5, r5, asl #2
	sub	r5, r5, #4
	ldr	r3, [r7, #0]
	mov	r4, r3, asl #4
	sub	r4, r4, r3, asl #2
	sub	r4, r4, #12
	ldr	r0, [sp, #60]
	ldr	r3, [r0, r5]
	add	r3, r3, r4
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	ldr	r2, [sp, #56]
	ldr	r5, [r2, r5]
	bl	__aeabi_f2iz
	str	r0, [r5, r4]
	ldr	r3, [r6, #0]
	sub	r3, r3, #2
	ldr	r1, [r7, #0]
	ldr	r0, [sp, #56]
	ldr	r2, [r0, r3, asl #2]
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	add	r2, r2, r3
	str	r9, [r2, #-20]
	ldr	r3, [r6, #0]
	mov	r3, r3, asl #2
	sub	r3, r3, #4
	ldr	r1, [r7, #0]
	ldr	r2, [r0, r3]
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	add	r2, r2, r3
	str	r9, [r2, #-20]
	ldr	r3, [r6, #0]
	sub	r3, r3, #2
	ldr	r1, [r7, #0]
	ldr	r2, [r0, r3, asl #2]
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	add	r2, r2, r3
	str	r9, [r2, #-8]
	ldr	r3, [r6, #0]
	mov	r3, r3, asl #2
	sub	r3, r3, #4
	ldr	r1, [r7, #0]
	ldr	r2, [r0, r3]
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	add	r2, r2, r3
	str	r9, [r2, #-8]
	ldr	r3, [r6, #0]
	sub	r3, r3, #2
	ldr	r1, [r7, #0]
	ldr	r2, [r0, r3, asl #2]
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	add	r2, r2, r3
	ldr	r3, [sp, #68]
	str	r3, [r2, #-16]
	ldr	r3, [r6, #0]
	mov	r3, r3, asl #2
	sub	r3, r3, #4
	ldr	r1, [r7, #0]
	ldr	r2, [r0, r3]
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	add	r2, r2, r3
	ldr	r0, [sp, #68]
	str	r0, [r2, #-16]
	ldr	r3, [r6, #0]
	sub	r3, r3, #2
	ldr	r1, [r7, #0]
	ldr	r0, [sp, #56]
	ldr	r2, [r0, r3, asl #2]
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	add	r2, r2, r3
	ldr	r3, [sp, #68]
	str	r3, [r2, #-4]
	ldr	r3, [r6, #0]
	mov	r3, r3, asl #2
	sub	r3, r3, #4
	ldr	r1, [r7, #0]
	ldr	r2, [r0, r3]
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	add	r2, r2, r3
	ldr	r0, [sp, #68]
	str	r0, [r2, #-4]
	add	sp, sp, #92
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	height
	.word	width
	.size	matrix_rgb_to_ycc, .-matrix_rgb_to_ycc
	.align	2
	.global	ycc_to_rgb
	.type	ycc_to_rgb, %function
ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	sub	sp, sp, #16
	mov	r8, r0
	add	r0, sp, #4
	stmia	r0, {r1, r2, r3}
	ldr	r5, [sp, #12]
	ldr	r7, [sp, #8]
	mov	r4, r1, asl #2
	mov	r3, r1, asl #5
	add	r4, r4, r3
	add	r4, r4, r1
	mov	r4, r4, asl #2
	add	r4, r4, r1
	mov	r4, r4, asl #4
	sub	r4, r4, #610304
	mov	r4, r4, asr #11
	mov	sl, r5, asl #4
	mov	r0, r5, asl #6
	rsb	r0, sl, r0
	mov	r3, r0, asl #4
	add	r0, r0, r3
	add	r0, r0, r5
	mov	r0, r0, asl #2
	add	r0, r0, r5
	mov	r3, #-16777216
	add	r3, r3, #10027008
	add	r3, r3, #55296
	add	r0, r0, r3
	mov	r6, #4080
	add	r6, r6, #15
	add	r0, r4, r0, asr #11
	mov	r1, #0
	mov	r2, r6
	bl	clamp
	mov	r9, r0
	mov	r2, r7, asl #5
	sub	r2, r2, r7, asl #3
	mov	r3, r2, asl #7
	add	r2, r2, r3
	add	r2, r2, r7
	sub	r2, r2, #6291456
	sub	r2, r2, #51200
	sub	r2, r4, r2, asr #13
	mov	r3, r5, asl #7
	rsb	r3, sl, r3
	rsb	r3, r5, r3
	mov	r0, r3, asl #4
	rsb	r0, r3, r0
	mov	r0, r0, asl #1
	sub	r0, r0, #6815744
	sub	r0, r0, #4096
	sub	r0, r2, r0, asr #12
	mov	r1, #0
	mov	r2, r6
	bl	clamp
	mov	r5, r0
	mov	r0, r7, asl #4
	mov	r3, r7, asl #11
	add	r0, r0, r3
	add	r0, r0, r7
	sub	r0, r0, #4194304
	sub	r0, r0, #34816
	add	r0, r4, r0, asr #10
	mov	r1, #0
	mov	r2, r6
	bl	clamp
	str	r0, [r8, #8]
	str	r5, [r8, #4]
	str	r9, [r8, #0]
	mov	r0, r8
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
	.size	ycc_to_rgb, .-ycc_to_rgb
	.align	2
	.global	matrix_ycc_to_rgb
	.type	matrix_ycc_to_rgb, %function
matrix_ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	str	r0, [sp, #8]
	mov	fp, r1
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L27
	mov	r2, #0
	str	r2, [sp, #12]
	mov	r7, r2
	ldr	r9, .L29+4
	str	r2, [sp, #4]
	add	r8, sp, #16
	mov	sl, r8
	str	r9, [sp, #0]
	b	.L23
.L24:
	ldr	r4, [fp, r7]
	ldr	r2, [sp, #8]
	ldr	r3, [r2, r7]
	mov	r0, sl
	add	r3, r3, r5
	ldmia	r3, {r1, r2, r3}
	bl	ycc_to_rgb
	add	r4, r4, r5
	ldmia	r8, {r0, r1, r2}
	stmia	r4, {r0, r1, r2}
	add	r6, r6, #1
	add	r5, r5, #12
	ldr	r3, [r9, #0]
	cmp	r3, r6
	bgt	.L24
.L26:
	ldr	r3, [sp, #12]
	add	r3, r3, #1
	str	r3, [sp, #12]
	add	r7, r7, #4
	ldr	r2, .L29
	ldr	r3, [r2, #0]
	ldr	r2, [sp, #12]
	cmp	r3, r2
	ble	.L27
.L23:
	ldr	r3, [r9, #0]
	cmp	r3, #0
	movgt	r6, #0
	ldrgt	r5, [sp, #4]
	bgt	.L24
	b	.L26
.L27:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	height
	.word	width
	.size	matrix_ycc_to_rgb, .-matrix_ycc_to_rgb
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_dadd
	.global	__aeabi_dsub
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #52
	ldr	r0, .L59
	ldr	r1, .L59+4
	bl	fopen
	mov	r7, r0
	ldr	r5, .L59+8
	mov	r1, r5
	ldr	r2, .L59+12
	bl	fscanf
	ldr	r4, .L59+16
	mov	r0, r7
	mov	r1, r5
	mov	r2, r4
	bl	fscanf
	ldr	r0, [r4, #0]
	mov	r0, r0, asl #2
	bl	malloc
	str	r0, [sp, #12]
	str	r0, [sp, #20]
	ldr	r0, [r4, #0]
	mov	r0, r0, asl #2
	bl	malloc
	str	r0, [sp, #16]
	str	r0, [sp, #24]
	ldr	r3, [r4, #0]
	cmp	r3, #0
	ble	.L32
	mov	r5, #0
	mov	r4, r5
	ldr	r6, .L59+12
	ldr	r8, .L59+16
.L33:
	ldr	r3, [r6, #0]
	mov	r0, r3, asl #4
	sub	r0, r0, r3, asl #2
	bl	malloc
	ldr	r2, [sp, #12]
	str	r0, [r2, r4]
	ldr	r3, [r6, #0]
	mov	r0, r3, asl #4
	sub	r0, r0, r3, asl #2
	bl	malloc
	ldr	r3, [sp, #16]
	str	r0, [r3, r4]
	add	r5, r5, #1
	add	r4, r4, #4
	ldr	r3, [r8, #0]
	cmp	r3, r5
	bgt	.L33
	ldr	r3, .L59+16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L32
	mov	sl, #0
	ldr	fp, .L59+12
	mov	r9, sl
	ldr	r8, .L59+20
	b	.L34
.L35:
	ldr	r2, [sp, #12]
	ldr	r3, [r2, r6]
	add	r3, r3, r4
	add	r2, r3, #8
	str	r2, [sp, #0]
	mov	r0, r7
	mov	r1, r8
	mov	r2, r3
	add	r3, r3, #4
	bl	fscanf
	add	r5, r5, #1
	add	r4, r4, #12
	ldr	r3, [fp, #0]
	cmp	r3, r5
	bgt	.L35
.L37:
	add	sl, sl, #1
	ldr	r2, .L59+16
	ldr	r3, [r2, #0]
	cmp	r3, sl
	ble	.L32
.L34:
	ldr	r3, [fp, #0]
	cmp	r3, #0
	movgt	r5, #0
	movgt	r4, r9
	movgt	r6, sl, asl #2
	bgt	.L35
	b	.L37
.L32:
	mov	r0, r7
	bl	fclose
	add	r0, sp, #40
	mov	r1, #0
	bl	gettimeofday
	add	r0, sp, #20
	ldmia	r0, {r0, r1}	@ phole ldm
	bl	matrix_rgb_to_ycc
	add	r0, sp, #32
	mov	r1, #0
	bl	gettimeofday
	ldr	r0, [sp, #32]
	bl	__aeabi_i2d
	mov	r4, #0
	mov	r5, #1073741824
	add	r5, r5, #9371648
	add	r5, r5, #16384
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	mov	r6, r0
	mov	r7, r1
	ldr	r0, [sp, #36]
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dadd
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [sp, #40]
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	mov	r6, r0
	mov	r7, r1
	ldr	r0, [sp, #44]
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L59+24
	bl	printf
	ldr	r0, .L59+28
	ldr	r1, .L59+32
	bl	fopen
	mov	r7, r0
	ldr	r3, .L59+16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L38
	mov	sl, #0
	ldr	r9, .L59+12
	mov	fp, sl
	ldr	r8, .L59+36
	b	.L39
.L40:
	ldr	r3, [sp, #16]
	ldr	r1, [r3, r6]
	add	r1, r1, r4
	ldmia	r1, {r2, r3}	@ phole ldm
	ldr	r1, [r1, #8]
	str	r1, [sp, #0]
	mov	r0, r7
	mov	r1, r8
	bl	fprintf
	add	r5, r5, #1
	add	r4, r4, #12
	ldr	r3, [r9, #0]
	cmp	r3, r5
	bgt	.L40
.L42:
	add	sl, sl, #1
	ldr	r2, .L59+16
	ldr	r3, [r2, #0]
	cmp	r3, sl
	ble	.L38
.L39:
	ldr	r3, [r9, #0]
	cmp	r3, #0
	movgt	r5, #0
	movgt	r4, fp
	movgt	r6, sl, asl #2
	bgt	.L40
	b	.L42
.L38:
	mov	r0, r7
	bl	fclose
	ldr	r4, .L59+16
	ldr	r0, [r4, #0]
	mov	r0, r0, asl #2
	bl	malloc
	mov	fp, r0
	str	r0, [sp, #28]
	ldr	r3, [r4, #0]
	cmp	r3, #0
	ble	.L43
	mov	r4, #0
	ldr	r6, .L59+12
	ldr	r5, .L59+16
.L44:
	ldr	r3, [r6, #0]
	mov	r0, r3, asl #4
	sub	r0, r0, r3, asl #2
	bl	malloc
	str	r0, [fp, r4, asl #2]
	add	r4, r4, #1
	ldr	r3, [r5, #0]
	cmp	r3, r4
	bgt	.L44
.L43:
	add	r0, sp, #40
	mov	r1, #0
	bl	gettimeofday
	add	r0, sp, #24
	ldmia	r0, {r0, r1}	@ phole ldm
	bl	matrix_ycc_to_rgb
	add	r0, sp, #32
	mov	r1, #0
	bl	gettimeofday
	ldr	r0, [sp, #32]
	bl	__aeabi_i2d
	mov	r4, #0
	mov	r5, #1073741824
	add	r5, r5, #9371648
	add	r5, r5, #16384
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	mov	r6, r0
	mov	r7, r1
	ldr	r0, [sp, #36]
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dadd
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [sp, #40]
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	mov	r6, r0
	mov	r7, r1
	ldr	r0, [sp, #44]
	bl	__aeabi_i2d
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L59+40
	bl	printf
	ldr	r0, .L59+44
	ldr	r1, .L59+32
	bl	fopen
	mov	r7, r0
	ldr	r3, .L59+16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L45
	mov	sl, #0
	ldr	r9, .L59+12
	str	sl, [sp, #8]
	ldr	r8, .L59+36
	b	.L46
.L47:
	ldr	r1, [fp, r6]
	add	r1, r1, r4
	ldmia	r1, {r2, r3}	@ phole ldm
	ldr	r1, [r1, #8]
	str	r1, [sp, #0]
	mov	r0, r7
	mov	r1, r8
	bl	fprintf
	add	r5, r5, #1
	add	r4, r4, #12
	ldr	r3, [r9, #0]
	cmp	r3, r5
	bgt	.L47
.L49:
	add	sl, sl, #1
	ldr	r2, .L59+16
	ldr	r3, [r2, #0]
	cmp	r3, sl
	ble	.L45
.L46:
	ldr	r3, [r9, #0]
	cmp	r3, #0
	movgt	r5, #0
	ldrgt	r4, [sp, #8]
	movgt	r6, sl, asl #2
	bgt	.L47
	b	.L49
.L45:
	mov	r0, r7
	bl	fclose
	ldr	r3, .L59+16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L50
	mov	r5, #0
	mov	r4, r5
	ldr	r6, .L59+16
.L51:
	ldr	r3, [sp, #12]
	ldr	r0, [r3, r4]
	bl	free
	ldr	r2, [sp, #16]
	ldr	r0, [r2, r4]
	bl	free
	ldr	r0, [fp, r4]
	bl	free
	add	r5, r5, #1
	add	r4, r4, #4
	ldr	r3, [r6, #0]
	cmp	r3, r5
	bgt	.L51
.L50:
	ldr	r0, [sp, #20]
	bl	free
	ldr	r0, [sp, #24]
	bl	free
	ldr	r0, [sp, #28]
	bl	free
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	width
	.word	height
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.size	main, .-main
	.comm	height,4,4
	.comm	width,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"bits.rgb\000"
	.space	3
.LC1:
	.ascii	"r\000"
	.space	2
.LC2:
	.ascii	"%d\000"
	.space	1
.LC3:
	.ascii	"%d %d %d\000"
	.space	3
.LC4:
	.ascii	"time for rgb -> ycc: %f\012\000"
	.space	3
.LC5:
	.ascii	"optimized_out_1.ycc\000"
.LC6:
	.ascii	"w\000"
	.space	2
.LC7:
	.ascii	"%d %d %d\012\000"
	.space	2
.LC8:
	.ascii	"time for ycc -> rgb: %f\012\000"
	.space	3
.LC9:
	.ascii	"optimized_orig_1.rgb\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
