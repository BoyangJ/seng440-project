	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"colour_space_conversion.c"
	.text
	.align	2
	.global	clamp
	.type	clamp, %function
clamp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bcc	.L2
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	movcc	r3, r2
	str	r3, [fp, #-20]
	b	.L3
.L2:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-20]
.L3:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	clamp, .-clamp
	.align	2
	.global	rgb_to_ycc
	.type	rgb_to_ycc, %function
rgb_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	mov	r4, r0
	sub	r0, fp, #40
	stmia	r0, {r1, r2, r3}
	ldr	r1, [fp, #-40]
	mov	r3, r1
	mov	r2, r3, asl #5
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	rsb	r3, r3, #0
	mov	r0, r3, asr #14
	ldr	r1, [fp, #-36]
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #4
	mov	r3, r3, asr #13
	rsb	r0, r3, r0
	ldr	r1, [fp, #-32]
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	mov	r3, r3, asr #13
	add	r3, r0, r3
	add	r3, r3, #2048
	mov	r0, r3
	mov	r1, #256
	mov	r2, #3840
	bl	clamp
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r1, [fp, #-40]
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	mov	r0, r3, asr #13
	ldr	r1, [fp, #-36]
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r2, r3, asl #4
	rsb	r3, r3, r2
	mov	r3, r3, asr #13
	rsb	r0, r3, r0
	ldr	r1, [fp, #-32]
	mov	r3, r1
	mov	r3, r3, asl #5
	mov	r2, r3, asl #2
	rsb	r2, r3, r2
	add	r2, r2, r1
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	mov	r3, r3, asr #15
	rsb	r3, r3, r0
	add	r3, r3, #2048
	mov	r0, r3
	mov	r1, #256
	mov	r2, #3840
	bl	clamp
	mov	r3, r0
	str	r3, [fp, #-16]
	mov	ip, r4
	sub	r3, fp, #24
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	mov	r0, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	rgb_to_ycc, .-rgb_to_ycc
	.global	__aeabi_ui2f
	.align	2
	.global	rgb_to_ycc_y
	.type	rgb_to_ycc_y, %function
rgb_to_ycc_y:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	sub	r3, fp, #16
	stmia	r3, {r0, r1, r2}
	ldr	r1, [fp, #-16]
	mov	r3, r1
	mov	r3, r3, asl #3
	mov	r2, r3, asl #5
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r3, r3, asl #3
	add	r3, r3, r1
	mov	r1, r3, asr #13
	ldr	r3, [fp, #-12]
	mov	r2, r3, asl #4
	mov	r3, r2, asl #7
	add	r3, r2, r3
	mov	r3, r3, asr #12
	add	r0, r1, r3
	ldr	r1, [fp, #-8]
	mov	r3, r1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r2, r3, asl #3
	add	r3, r3, r2
	rsb	r3, r1, r3
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	mov	r3, r2, asl #1
	add	r3, r3, r1
	mov	r3, r3, asr #15
	add	r3, r0, r3
	add	r3, r3, #256
	mov	r0, r3
	mov	r1, #256
	mov	r2, #3760
	bl	clamp
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_ui2f
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	rgb_to_ycc_y, .-rgb_to_ycc_y
	.align	2
	.global	rgb_to_ycc_avg
	.type	rgb_to_ycc_avg, %function
rgb_to_ycc_avg:
	@ Function supports interworking.
	@ args = 36, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #84
	mov	r4, r0
	sub	r0, fp, #88
	stmia	r0, {r1, r2, r3}
	sub	r3, fp, #36
	mov	r0, r3
	sub	r3, fp, #88
	ldmia	r3, {r1, r2, r3}
	bl	rgb_to_ycc
	sub	r3, fp, #48
	mov	r0, r3
	add	r3, fp, #4
	ldmia	r3, {r1, r2, r3}
	bl	rgb_to_ycc
	sub	r3, fp, #60
	mov	r0, r3
	add	r3, fp, #16
	ldmia	r3, {r1, r2, r3}
	bl	rgb_to_ycc
	sub	r3, fp, #72
	mov	r0, r3
	add	r3, fp, #28
	ldmia	r3, {r1, r2, r3}
	bl	rgb_to_ycc
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-44]
	add	r2, r2, r3
	ldr	r3, [fp, #-56]
	add	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	mov	r3, r3, asr #2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	mov	r3, r3, asr #2
	str	r3, [fp, #-16]
	mov	ip, r4
	sub	r3, fp, #24
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	mov	r0, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	rgb_to_ycc_avg, .-rgb_to_ycc_avg
	.global	__aeabi_f2iz
	.align	2
	.global	matrix_rgb_to_ycc
	.type	matrix_rgb_to_ycc, %function
matrix_rgb_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #96
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	ldr	r3, [fp, #-56]
	ldr	lr, [r3, #0]
	ldr	r3, [fp, #-56]
	add	r3, r3, #4
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #0]
	add	r4, r3, #12
	ldr	r3, [fp, #-56]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r5, r3, #12
	sub	r6, fp, #40
	mov	ip, sp
	mov	r3, r2
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	ip, sp, #12
	mov	r3, r4
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	ip, sp, #24
	mov	r3, r5
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	mov	r0, r6
	ldmia	lr, {r1, r2, r3}
	bl	rgb_to_ycc_avg
	ldr	r3, [fp, #-56]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r4, r3, #24
	ldr	r3, [fp, #-56]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r2, r3, #24
	ldr	r3, [fp, #-56]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r5, r3, #36
	ldr	r3, [fp, #-56]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r6, r3, #36
	sub	r7, fp, #52
	mov	ip, sp
	mov	r3, r2
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	ip, sp, #12
	mov	r3, r5
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	ip, sp, #24
	mov	r3, r6
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	mov	r0, r7
	ldmia	r4, {r1, r2, r3}
	bl	rgb_to_ycc_avg
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L12
.L15:
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L13
.L14:
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r4, r1, r3
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r4, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r4, r1, r3
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r4, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldr	r3, [fp, #-32]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldr	r3, [fp, #-32]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldr	r3, [fp, #-32]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r2, r1, r3
	ldr	r3, [fp, #-32]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #24
	add	r4, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #24
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #24
	add	r4, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #24
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #36
	add	r4, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #36
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #36
	add	r4, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #36
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #24
	add	r2, r1, r3
	ldr	r3, [fp, #-48]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #24
	add	r2, r1, r3
	ldr	r3, [fp, #-48]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #36
	add	r2, r1, r3
	ldr	r3, [fp, #-48]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #36
	add	r2, r1, r3
	ldr	r3, [fp, #-48]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #24
	add	r2, r1, r3
	ldr	r3, [fp, #-44]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #24
	add	r2, r1, r3
	ldr	r3, [fp, #-44]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #36
	add	r2, r1, r3
	ldr	r3, [fp, #-44]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #36
	add	r2, r1, r3
	ldr	r3, [fp, #-44]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #24
	add	r4, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #24
	add	r0, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #36
	add	r5, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #36
	add	r6, r1, r3
	sub	r7, fp, #76
	mov	ip, sp
	mov	r3, r0
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	ip, sp, #12
	mov	r3, r5
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	ip, sp, #24
	mov	r3, r6
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	mov	r0, r7
	ldmia	r4, {r1, r2, r3}
	bl	rgb_to_ycc_avg
	sub	ip, fp, #40
	sub	r3, fp, #76
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #48
	add	r4, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #5
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #48
	add	r0, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #60
	add	r5, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #5
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #60
	add	r6, r1, r3
	sub	r7, fp, #76
	mov	ip, sp
	mov	r3, r0
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	ip, sp, #12
	mov	r3, r5
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	add	ip, sp, #24
	mov	r3, r6
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	mov	r0, r7
	ldmia	r4, {r1, r2, r3}
	bl	rgb_to_ycc_avg
	sub	ip, fp, #52
	sub	r3, fp, #76
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	ldr	r3, [fp, #-24]
	add	r3, r3, #4
	str	r3, [fp, #-24]
.L13:
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	sub	r2, r3, #3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L14
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	str	r3, [fp, #-28]
.L12:
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	sub	r2, r3, #3
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bgt	.L15
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #24
	add	r4, r1, r3
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #24
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r2, r3, #0
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #24
	add	r4, r1, r3
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r2, r3, #0
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #24
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #12
	add	r4, r1, r3
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #12
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r2, r3, #0
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #12
	add	r4, r1, r3
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r2, r3, #0
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #12
	add	r3, r1, r3
	ldmia	r3, {r0, r1, r2}
	bl	rgb_to_ycc_y
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #24
	add	r2, r1, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #4]
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r2, r3, #0
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #24
	add	r2, r1, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #4]
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #12
	add	r2, r1, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #4]
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r2, r3, #0
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #12
	add	r2, r1, r3
	ldr	r3, [fp, #-36]
	str	r3, [r2, #4]
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #24
	add	r2, r1, r3
	ldr	r3, [fp, #-32]
	str	r3, [r2, #8]
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r2, r3, #0
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #24
	add	r2, r1, r3
	ldr	r3, [fp, #-32]
	str	r3, [r2, #8]
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	sub	r3, r3, #2
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #12
	add	r2, r1, r3
	ldr	r3, [fp, #-32]
	str	r3, [r2, #8]
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r2, r3, #0
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	sub	r3, r3, #12
	add	r2, r1, r3
	ldr	r3, [fp, #-32]
	str	r3, [r2, #8]
	sub	sp, fp, #20
	ldmfd	sp!, {r4, r5, r6, r7, fp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	width
	.word	height
	.size	matrix_rgb_to_ycc, .-matrix_rgb_to_ycc
	.align	2
	.global	ycc_to_rgb
	.type	ycc_to_rgb, %function
ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	mov	r4, r0
	sub	r0, fp, #40
	stmia	r0, {r1, r2, r3}
	ldr	r1, [fp, #-40]
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #4
	sub	r3, r3, #610304
	mov	r0, r3, asr #11
	ldr	r1, [fp, #-32]
	mov	r3, r1
	mov	r2, r3, asl #4
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r2, r3, asl #4
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, #-16777216
	add	r3, r3, #10027008
	add	r3, r3, #55296
	mov	r3, r3, asr #11
	add	r3, r0, r3
	mov	r0, r3
	mov	r1, #0
	mov	r2, #4080
	add	r2, r2, #15
	bl	clamp
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-40]
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #4
	sub	r3, r3, #610304
	mov	r0, r3, asr #11
	ldr	r1, [fp, #-36]
	mov	r3, r1
	mov	r2, r3, asl #3
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r2, r3, asl #7
	add	r3, r3, r2
	add	r3, r3, r1
	sub	r3, r3, #6291456
	sub	r3, r3, #51200
	mov	r3, r3, asr #13
	rsb	r0, r3, r0
	ldr	r1, [fp, #-32]
	mov	r3, r1
	mov	r3, r3, asl #4
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	rsb	r2, r1, r2
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #1
	sub	r3, r3, #6815744
	sub	r3, r3, #4096
	mov	r3, r3, asr #12
	rsb	r3, r3, r0
	mov	r0, r3
	mov	r1, #0
	mov	r2, #4080
	add	r2, r2, #15
	bl	clamp
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r1, [fp, #-40]
	mov	r3, r1
	mov	r3, r3, asl #2
	mov	r2, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #4
	sub	r3, r3, #610304
	mov	r0, r3, asr #11
	ldr	r1, [fp, #-36]
	mov	r3, r1
	mov	r3, r3, asl #4
	mov	r2, r3, asl #7
	add	r3, r3, r2
	add	r3, r3, r1
	sub	r3, r3, #4194304
	sub	r3, r3, #34816
	mov	r3, r3, asr #10
	add	r3, r0, r3
	mov	r0, r3
	mov	r1, #0
	mov	r2, #4080
	add	r2, r2, #15
	bl	clamp
	mov	r3, r0
	str	r3, [fp, #-16]
	mov	ip, r4
	sub	r3, fp, #24
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	mov	r0, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	ycc_to_rgb, .-ycc_to_rgb
	.align	2
	.global	matrix_ycc_to_rgb
	.type	matrix_ycc_to_rgb, %function
matrix_ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L22
.L25:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L23
.L24:
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r4, r1, r3
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	sub	r2, fp, #44
	mov	r0, r2
	ldmia	r3, {r1, r2, r3}
	bl	ycc_to_rgb
	mov	ip, r4
	sub	r3, fp, #44
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L23:
	ldr	r3, .L27
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	cmp	r3, r2
	blt	.L24
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L22:
	ldr	r3, .L27+4
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	cmp	r3, r2
	blt	.L25
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	width
	.word	height
	.size	matrix_ycc_to_rgb, .-matrix_ycc_to_rgb
	.section	.rodata
	.align	2
.LC0:
	.ascii	"bits.rgb\000"
	.align	2
.LC1:
	.ascii	"r\000"
	.align	2
.LC2:
	.ascii	"%d\000"
	.align	2
.LC3:
	.ascii	"%d %d %d\000"
	.align	2
.LC4:
	.ascii	"optimized_out_1.ycc\000"
	.align	2
.LC5:
	.ascii	"w\000"
	.align	2
.LC6:
	.ascii	"%d %d %d\012\000"
	.align	2
.LC7:
	.ascii	"optimized_orig_1.rgb\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 288
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #300
	ldr	r0, .L49
	ldr	r1, .L49+4
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r0, [fp, #-36]
	ldr	r1, .L49+8
	ldr	r2, .L49+12
	bl	fscanf
	ldr	r0, [fp, #-36]
	ldr	r1, .L49+8
	ldr	r2, .L49+16
	bl	fscanf
	ldr	r3, .L49+16
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, .L49+16
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L30
.L31:
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r4, r3, r2
	ldr	r3, .L49+12
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-20]
	add	r4, r3, r2
	ldr	r3, .L49+12
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L30:
	ldr	r3, .L49+16
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	cmp	r3, r2
	blt	.L31
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L32
.L35:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L33
.L34:
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	mov	ip, r3
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	add	lr, r3, #4
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	add	r3, r3, #8
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, .L49+20
	mov	r2, ip
	mov	r3, lr
	bl	fscanf
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L33:
	ldr	r3, .L49+12
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	cmp	r3, r2
	blt	.L34
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L32:
	ldr	r3, .L49+16
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	cmp	r3, r2
	blt	.L35
	ldr	r0, [fp, #-36]
	bl	fclose
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-20]
	bl	matrix_rgb_to_ycc
	ldr	r0, .L49+24
	ldr	r1, .L49+28
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L36
.L39:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L37
.L38:
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	ip, [r3, #0]
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	lr, [r3, #4]
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #8]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, .L49+32
	mov	r2, ip
	mov	r3, lr
	bl	fprintf
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L37:
	ldr	r3, .L49+12
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	cmp	r3, r2
	blt	.L38
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L36:
	ldr	r3, .L49+16
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	cmp	r3, r2
	blt	.L39
	ldr	r0, [fp, #-36]
	bl	fclose
	ldr	r3, .L49+16
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L40
.L41:
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r4, r3, r2
	ldr	r3, .L49+12
	ldr	r3, [r3, #0]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L40:
	ldr	r3, .L49+16
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	cmp	r3, r2
	blt	.L41
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-16]
	bl	matrix_ycc_to_rgb
	ldr	r0, .L49+36
	ldr	r1, .L49+28
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L42
.L45:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L43
.L44:
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	ip, [r3, #0]
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	lr, [r3, #4]
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	add	r3, r1, r3
	ldr	r3, [r3, #8]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, .L49+32
	mov	r2, ip
	mov	r3, lr
	bl	fprintf
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L43:
	ldr	r3, .L49+12
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	cmp	r3, r2
	blt	.L44
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L42:
	ldr	r3, .L49+16
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	cmp	r3, r2
	blt	.L45
	ldr	r0, [fp, #-36]
	bl	fclose
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L46
.L47:
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	free
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L46:
	ldr	r3, .L49+16
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	cmp	r3, r2
	blt	.L47
	ldr	r0, [fp, #-24]
	bl	free
	ldr	r0, [fp, #-20]
	bl	free
	ldr	r0, [fp, #-16]
	bl	free
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L50:
	.align	2
.L49:
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
	.size	main, .-main
	.comm	height,4,4
	.comm	width,4,4
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
