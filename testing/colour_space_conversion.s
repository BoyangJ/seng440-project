	.arch armv4t
	.fpu softvfp
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
	.global	clamp
	.type	clamp, %function
clamp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	cmp	r3, r1
	mov	r0, r1
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
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	sub	sp, sp, #32
	add	ip, sp, #4
	stmia	ip, {r1, r2, r3}
	ldr	r4, [sp, #12]
	mov	r6, r1
	mov	r1, r1, asl #7
	sub	r1, r1, r6, asl #5
	mov	ip, r4, asl #6
	ldr	r5, [sp, #8]
	sub	ip, ip, r4, asl #2
	add	r1, r1, r6
	mov	r3, r1, asl #2
	mov	r2, ip, asl #4
	add	r1, r1, r3
	rsb	r2, ip, r2
	mov	r3, r5, asl #2
	mov	r8, r5, asl #5
	rsb	r2, r4, r2
	add	r3, r3, r8
	mov	ip, r1, asl #2
	add	r1, r1, ip
	mov	r2, r2, asl #2
	add	r3, r3, r5
	rsb	r1, r1, #0
	mov	r2, r2, asr #13
	mov	r3, r3, asl #2
	add	r2, r2, r1, asr #14
	add	r3, r3, r5
	add	r2, r2, #2048
	mov	r3, r3, asl #4
	sub	r2, r2, r3, asr #13
	cmp	r2, #255
	mov	r7, r0
	movls	sl, #256
	bls	.L7
	cmp	r2, #3840
	movcc	sl, r2
	movcs	sl, #3840
.L7:
	mov	r0, r5, asl #3
	add	r0, r0, r8
	mov	r3, r0, asl #2
	mov	r2, r6, asl #6
	mov	ip, r4, asl #7
	sub	r2, r2, r6, asl #2
	add	r0, r0, r3
	sub	ip, ip, r4, asl #5
	add	r0, r0, r5
	add	ip, ip, r4
	mov	r1, r2, asl #4
	rsb	r1, r2, r1
	mov	r3, r0, asl #4
	mov	r2, ip, asl #2
	rsb	r3, r0, r3
	rsb	r1, r6, r1
	rsb	r2, ip, r2
	mov	r1, r1, asl #2
	mov	r3, r3, asr #13
	mov	r2, r2, asl #3
	rsb	r3, r3, r1, asr #13
	rsb	r2, r4, r2
	sub	r3, r3, r2, asr #15
	add	r0, r3, #2048
	cmp	r0, #255
	movls	r0, #256
	bls	.L9
	cmp	r0, #3840
	movcs	r0, #3840
.L9:
	str	r0, [r7, #8]
	str	sl, [r7, #4]
	mov	r0, r7
	add	sp, sp, #32
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
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
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #20
	add	r3, sp, #4
	stmia	r3, {r0, r1, r2}
	ldr	r5, [sp, #12]
	mov	r4, r0
	mov	r0, r5, asl #4
	sub	r0, r0, r5, asl #2
	ldr	r1, [sp, #8]
	mov	r3, r4, asl #8
	mov	r2, r4, asl #3
	mov	ip, r0, asl #3
	add	r2, r2, r3
	add	r0, r0, ip
	rsb	r0, r5, r0
	mov	r3, r1, asl #11
	rsb	r2, r4, r2
	mov	r1, r1, asl #4
	add	r1, r1, r3
	mov	r2, r2, asl #3
	mov	r3, r0, asl #4
	rsb	r3, r0, r3
	add	r2, r2, r4
	mov	r1, r1, asr #12
	add	r1, r1, r2, asr #13
	mov	r3, r3, asl #1
	add	r3, r3, r5
	add	r1, r1, #256
	add	r0, r1, r3, asr #15
	cmp	r0, #255
	movls	r0, #1124073472
	addls	r0, r0, #8388608
	bls	.L13
	cmp	r0, #3760
	movcs	r0, #3760
	bl	__aeabi_ui2f
.L13:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
	.size	rgb_to_ycc_y, .-rgb_to_ycc_y
	.align	2
	.global	ycc_to_rgb
	.type	ycc_to_rgb, %function
ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8}
	sub	sp, sp, #20
	add	ip, sp, #4
	stmia	ip, {r1, r2, r3}
	mov	r5, r1
	add	r7, sp, #8
	ldmia	r7, {r7, r8}	@ phole ldm
	mov	r3, r5, asl #5
	mov	r1, r1, asl #2
	mov	r2, r8, asl #4
	add	r1, r1, r3
	mov	r4, r7, asl #5
	mov	r6, r8, asl #7
	mov	ip, r8, asl #6
	sub	r4, r4, r7, asl #3
	rsb	ip, r2, ip
	add	r1, r1, r5
	rsb	r6, r2, r6
	rsb	r6, r8, r6
	mov	r3, r4, asl #7
	mov	r2, ip, asl #4
	mov	r1, r1, asl #2
	add	r1, r1, r5
	add	r4, r4, r3
	add	ip, ip, r2
	mov	r2, r6, asl #4
	mov	r3, r7, asl #11
	mov	r5, r7, asl #4
	add	r4, r4, r7
	rsb	r2, r6, r2
	mov	r1, r1, asl #4
	add	r5, r5, r3
	add	ip, ip, r8
	sub	r1, r1, #610304
	sub	r4, r4, #6291456
	mov	r2, r2, asl #1
	mov	r3, #-16777216
	mov	r1, r1, asr #11
	add	r5, r5, r7
	mov	ip, ip, asl #2
	sub	r4, r4, #51200
	sub	r2, r2, #6815744
	add	r3, r3, #10027008
	add	ip, ip, r8
	add	r3, r3, #55296
	sub	r4, r1, r4, asr #13
	sub	r2, r2, #4096
	sub	r5, r5, #4194304
	sub	r4, r4, r2, asr #12
	add	ip, ip, r3
	sub	r5, r5, #34816
	mov	r2, #4080
	add	r2, r2, #15
	add	ip, r1, ip, asr #11
	add	r1, r1, r5, asr #10
	cmp	ip, r2
	strls	ip, [r0, #0]
	strhi	r2, [r0, #0]
	cmp	r1, r2
	strls	r1, [r0, #8]
	strhi	r2, [r0, #8]
	cmp	r4, r2
	strls	r4, [r0, #4]
	strhi	r2, [r0, #4]
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
	.size	ycc_to_rgb, .-ycc_to_rgb
	.align	2
	.global	matrix_ycc_to_rgb
	.type	matrix_ycc_to_rgb, %function
matrix_ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r3, .L24
	ldr	r3, [r3, #0]
	sub	sp, sp, #24
	cmp	r3, #0
	str	r3, [sp, #12]
	str	r0, [sp, #4]
	str	r1, [sp, #0]
	ble	.L22
	ldr	r3, .L24+4
	ldr	r3, [r3, #0]
	mov	r2, #0
	mov	fp, #4080
	str	r2, [sp, #16]
	str	r3, [sp, #8]
	str	r2, [sp, #20]
	add	fp, fp, #15
.L19:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	ble	.L21
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #20]
	ldr	sl, [r3, r2]
	ldr	r3, [sp, #0]
	ldr	r8, [r3, r2]
	mov	r9, #0
.L20:
	ldr	r6, [sl, #8]
	ldr	r7, [sl, #4]
	ldr	ip, [sl], #12
	mov	r4, r6, asl #4
	mov	r3, ip, asl #5
	mov	r2, ip, asl #2
	mov	r1, r6, asl #6
	rsb	r1, r4, r1
	add	r2, r2, r3
	mov	r5, r6, asl #7
	mov	r3, r7, asl #5
	mov	r0, r1, asl #4
	rsb	r5, r4, r5
	sub	r3, r3, r7, asl #3
	add	r2, r2, ip
	add	r1, r1, r0
	rsb	r5, r6, r5
	mov	r0, r3, asl #7
	mov	r2, r2, asl #2
	add	r2, r2, ip
	add	r3, r3, r0
	mov	r0, r5, asl #4
	add	r1, r1, r6
	rsb	r0, r5, r0
	mov	r2, r2, asl #4
	add	r3, r3, r7
	mov	r1, r1, asl #2
	mov	ip, r7, asl #4
	mov	r4, r7, asl #11
	sub	r2, r2, #610304
	sub	r3, r3, #6291456
	mov	r0, r0, asl #1
	mov	r2, r2, asr #11
	add	ip, ip, r4
	add	r1, r1, r6
	sub	r3, r3, #51200
	sub	r0, r0, #6815744
	sub	r3, r2, r3, asr #13
	add	ip, ip, r7
	add	r1, r1, #-16777216
	sub	r0, r0, #4096
	sub	r3, r3, r0, asr #12
	add	r1, r1, #10027008
	sub	ip, ip, #4194304
	cmp	r3, fp
	strls	r3, [r8, #4]
	strhi	fp, [r8, #4]
	add	r1, r1, #55296
	sub	ip, ip, #34816
	ldr	r3, [sp, #8]
	add	ip, r2, ip, asr #10
	add	r9, r9, #1
	add	r2, r2, r1, asr #11
	cmp	r2, fp
	strls	r2, [r8, #0]
	strhi	fp, [r8, #0]
	cmp	ip, fp
	strls	ip, [r8, #8]
	strhi	fp, [r8, #8]
	cmp	r9, r3
	add	r8, r8, #12
	blt	.L20
.L21:
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #12]
	add	r2, r2, #1
	str	r2, [sp, #16]
	cmp	r2, r3
	ldr	r2, [sp, #20]
	add	r2, r2, #4
	str	r2, [sp, #20]
	blt	.L19
.L22:
	add	sp, sp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L25:
	.align	2
.L24:
	.word	height
	.word	width
	.size	matrix_ycc_to_rgb, .-matrix_ycc_to_rgb
	.align	2
	.global	rgb_to_ycc_avg
	.type	rgb_to_ycc_avg, %function
rgb_to_ycc_avg:
	@ Function supports interworking.
	@ args = 36, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	sub	sp, sp, #104
	add	ip, sp, #20
	stmia	ip, {r1, r2, r3}
	ldr	r4, [sp, #28]
	mov	r6, r1
	mov	r1, r1, asl #7
	sub	r1, r1, r6, asl #5
	mov	ip, r4, asl #6
	ldr	r5, [sp, #24]
	sub	ip, ip, r4, asl #2
	add	r1, r1, r6
	mov	r3, r1, asl #2
	mov	r2, ip, asl #4
	add	r1, r1, r3
	rsb	r2, ip, r2
	mov	r3, r5, asl #2
	mov	r7, r5, asl #5
	rsb	r2, r4, r2
	add	r3, r3, r7
	mov	ip, r1, asl #2
	add	r1, r1, ip
	mov	r2, r2, asl #2
	add	r3, r3, r5
	rsb	r1, r1, #0
	mov	r2, r2, asr #13
	mov	r3, r3, asl #2
	add	r2, r2, r1, asr #14
	add	r3, r3, r5
	add	r2, r2, #2048
	mov	r3, r3, asl #4
	sub	r2, r2, r3, asr #13
	cmp	r2, #255
	str	r0, [sp, #0]
	movls	sl, #256
	bls	.L28
	cmp	r2, #3840
	movcc	sl, r2
	movcs	sl, #3840
.L28:
	mov	r0, r5, asl #3
	add	r0, r0, r7
	mov	r3, r0, asl #2
	mov	r2, r6, asl #6
	mov	ip, r4, asl #7
	sub	r2, r2, r6, asl #2
	add	r0, r0, r3
	sub	ip, ip, r4, asl #5
	add	r0, r0, r5
	add	ip, ip, r4
	mov	r1, r2, asl #4
	rsb	r1, r2, r1
	mov	r3, r0, asl #4
	mov	r2, ip, asl #2
	rsb	r3, r0, r3
	rsb	r1, r6, r1
	rsb	r2, ip, r2
	mov	r1, r1, asl #2
	mov	r3, r3, asr #13
	mov	r2, r2, asl #3
	rsb	r3, r3, r1, asr #13
	rsb	r2, r4, r2
	sub	r3, r3, r2, asr #15
	add	r0, r3, #2048
	cmp	r0, #255
	movls	r0, #256
	bls	.L30
	cmp	r0, #3840
	movcs	r0, #3840
.L30:
	ldr	r8, [sp, #136]
	ldr	r6, [sp, #144]
	mov	r5, r8, asl #7
	sub	r5, r5, r8, asl #5
	add	r5, r5, r8
	mov	r3, r6, asl #6
	ldr	r7, [sp, #140]
	sub	r3, r3, r6, asl #2
	mov	r2, r5, asl #2
	str	sl, [sp, #36]
	str	r0, [sp, #40]
	add	r5, r5, r2
	mov	r4, r3, asl #4
	add	r9, sp, #32
	ldmia	r9, {r0, r1, r2}
	rsb	r4, r3, r4
	mov	ip, r7, asl #2
	mov	r3, r5, asl #2
	mov	sl, r7, asl #5
	add	r5, r5, r3
	rsb	r4, r6, r4
	add	ip, ip, sl
	add	r3, sp, #80
	stmia	r3, {r0, r1, r2}
	mov	r4, r4, asl #2
	add	ip, ip, r7
	rsb	r5, r5, #0
	mov	r4, r4, asr #13
	mov	ip, ip, asl #2
	add	r4, r4, r5, asr #14
	add	ip, ip, r7
	add	r4, r4, #2048
	mov	ip, ip, asl #4
	sub	r4, r4, ip, asr #13
	ldr	r0, [sp, #88]
	ldr	r1, [sp, #84]
	cmp	r4, #255
	stmib	sp, {r0, r1}	@ phole stm
	movls	fp, #256
	bls	.L32
	cmp	r4, #3840
	movcc	fp, r4
	movcs	fp, #3840
.L32:
	mov	r0, r7, asl #3
	add	r0, r0, sl
	mov	r3, r0, asl #2
	mov	r2, r8, asl #6
	mov	ip, r6, asl #7
	sub	r2, r2, r8, asl #2
	add	r0, r0, r3
	sub	ip, ip, r6, asl #5
	add	r0, r0, r7
	add	ip, ip, r6
	mov	r1, r2, asl #4
	rsb	r1, r2, r1
	mov	r3, r0, asl #4
	mov	r2, ip, asl #2
	rsb	r3, r0, r3
	rsb	r1, r8, r1
	rsb	r2, ip, r2
	mov	r1, r1, asl #2
	mov	r3, r3, asr #13
	mov	r2, r2, asl #3
	rsb	r3, r3, r1, asr #13
	rsb	r2, r6, r2
	sub	r3, r3, r2, asr #15
	add	r0, r3, #2048
	cmp	r0, #255
	movls	r0, #256
	bls	.L34
	cmp	r0, #3840
	movcs	r0, #3840
.L34:
	ldr	r8, [sp, #148]
	ldr	r6, [sp, #156]
	mov	r5, r8, asl #7
	sub	r5, r5, r8, asl #5
	add	r5, r5, r8
	mov	r3, r6, asl #6
	ldr	r7, [sp, #152]
	sub	r3, r3, r6, asl #2
	mov	r2, r5, asl #2
	str	fp, [sp, #36]
	str	r0, [sp, #40]
	add	r5, r5, r2
	mov	r4, r3, asl #4
	rsb	r4, r3, r4
	ldmia	r9, {r0, r1, r2}
	mov	r3, r5, asl #2
	mov	ip, r7, asl #2
	mov	sl, r7, asl #5
	add	r5, r5, r3
	rsb	r4, r6, r4
	add	r3, sp, #68
	add	ip, ip, sl
	stmia	r3, {r0, r1, r2}
	mov	r4, r4, asl #2
	add	ip, ip, r7
	rsb	r5, r5, #0
	mov	r4, r4, asr #13
	mov	ip, ip, asl #2
	add	r4, r4, r5, asr #14
	add	ip, ip, r7
	add	r4, r4, #2048
	mov	ip, ip, asl #4
	sub	r4, r4, ip, asr #13
	add	r0, sp, #72
	ldmia	r0, {r0, r3}	@ phole ldm
	cmp	r4, #255
	str	r3, [sp, #12]
	str	r0, [sp, #16]
	movls	fp, #256
	bls	.L36
	cmp	r4, #3840
	movcc	fp, r4
	movcs	fp, #3840
.L36:
	mov	r0, r7, asl #3
	add	r0, r0, sl
	mov	r3, r0, asl #2
	mov	r2, r8, asl #6
	mov	ip, r6, asl #7
	sub	r2, r2, r8, asl #2
	add	r0, r0, r3
	sub	ip, ip, r6, asl #5
	add	r0, r0, r7
	add	ip, ip, r6
	mov	r1, r2, asl #4
	rsb	r1, r2, r1
	mov	r3, r0, asl #4
	mov	r2, ip, asl #2
	rsb	r3, r0, r3
	rsb	r1, r8, r1
	rsb	r2, ip, r2
	mov	r1, r1, asl #2
	mov	r3, r3, asr #13
	mov	r2, r2, asl #3
	rsb	r3, r3, r1, asr #13
	rsb	r2, r6, r2
	sub	r3, r3, r2, asr #15
	add	r0, r3, #2048
	cmp	r0, #255
	movls	r0, #256
	bls	.L38
	cmp	r0, #3840
	movcs	r0, #3840
.L38:
	ldr	r8, [sp, #160]
	ldr	r6, [sp, #168]
	mov	r5, r8, asl #7
	sub	r5, r5, r8, asl #5
	mov	r3, r6, asl #6
	ldr	r7, [sp, #164]
	sub	r3, r3, r6, asl #2
	add	r5, r5, r8
	mov	r2, r5, asl #2
	mov	r4, r3, asl #4
	add	r5, r5, r2
	str	fp, [sp, #36]
	rsb	r4, r3, r4
	str	r0, [sp, #40]
	mov	ip, r7, asl #2
	mov	sl, r7, asl #5
	mov	r3, r5, asl #2
	rsb	r4, r6, r4
	add	ip, ip, sl
	add	r5, r5, r3
	mov	r4, r4, asl #2
	add	ip, ip, r7
	ldmia	r9, {r0, r1, r2}
	rsb	r5, r5, #0
	mov	r4, r4, asr #13
	mov	ip, ip, asl #2
	add	r3, sp, #56
	stmia	r3, {r0, r1, r2}
	add	r4, r4, r5, asr #14
	add	ip, ip, r7
	add	r4, r4, #2048
	mov	ip, ip, asl #4
	sub	r4, r4, ip, asr #13
	cmp	r4, #255
	add	r5, sp, #60
	ldmia	r5, {r5, fp}	@ phole ldm
	movls	r4, #256
	bls	.L40
	cmp	r4, #3840
	movcs	r4, #3840
.L40:
	mov	r0, r7, asl #3
	add	r0, r0, sl
	mov	r3, r0, asl #2
	mov	r2, r8, asl #6
	mov	ip, r6, asl #7
	sub	r2, r2, r8, asl #2
	add	r0, r0, r3
	sub	ip, ip, r6, asl #5
	add	r0, r0, r7
	add	ip, ip, r6
	mov	r1, r2, asl #4
	rsb	r1, r2, r1
	mov	r3, r0, asl #4
	mov	r2, ip, asl #2
	rsb	r3, r0, r3
	rsb	r1, r8, r1
	rsb	r2, ip, r2
	mov	r1, r1, asl #2
	mov	r3, r3, asr #13
	mov	r2, r2, asl #3
	rsb	r3, r3, r1, asr #13
	rsb	r2, r6, r2
	sub	r3, r3, r2, asr #15
	add	r0, r3, #2048
	cmp	r0, #255
	movls	r0, #256
	bls	.L42
	cmp	r0, #3840
	movcs	r0, #3840
.L42:
	str	r4, [sp, #36]
	str	r0, [sp, #40]
	ldmia	r9, {r0, r1, r2}
	add	r3, sp, #44
	stmia	r3, {r0, r1, r2}
	ldr	r3, [sp, #12]
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #8]
	add	r2, r3, r1
	ldr	r1, [sp, #16]
	add	r3, r1, r0
	add	r0, sp, #48
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r2, r2, fp
	add	r3, r3, r5
	add	r2, r2, r1
	add	r3, r3, r0
	ldr	r0, [sp, #0]
	mov	r2, r2, asr #2
	mov	r3, r3, asr #2
	str	r3, [r0, #4]
	str	r2, [r0, #8]
	add	sp, sp, #104
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
	.size	rgb_to_ycc_avg, .-rgb_to_ycc_avg
	.global	__aeabi_f2iz
	.align	2
	.global	matrix_rgb_to_ycc
	.type	matrix_rgb_to_ycc, %function
matrix_rgb_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [r0, #4]
	sub	sp, sp, #156
	str	r0, [sp, #64]
	str	r1, [sp, #60]
	ldmia	ip, {r0, r1, r2}
	mov	r3, sp
	stmia	r3, {r0, r1, r2}
	ldr	r2, [sp, #64]
	ldr	r4, [r2, #0]
	add	r3, r4, #12
	ldmia	r3, {r0, r1, r2}
	add	r3, sp, #12
	str	r3, [sp, #52]
	stmia	r3, {r0, r1, r2}
	add	ip, ip, #12
	ldmia	ip, {r0, r1, r2}
	add	r3, sp, #24
	str	r3, [sp, #48]
	stmia	r3, {r0, r1, r2}
	add	r0, sp, #140
	ldmia	r4, {r1, r2, r3}
	bl	rgb_to_ycc_avg
	ldr	r3, .L69
	ldr	r3, [r3, #0]
	sub	r2, r3, #3
	cmp	r2, #0
	str	r3, [sp, #68]
	ldrle	r3, .L69+4
	str	r2, [sp, #72]
	add	r9, sp, #144
	ldmia	r9, {r9, fp}	@ phole ldm
	strle	r3, [sp, #56]
	ble	.L45
	ldr	r2, .L69+4
	ldr	r3, [r2, #0]
	str	r3, [sp, #132]
	sub	r3, r3, #4
	mov	r3, r3, lsr #1
	add	r3, r3, #1
	str	r2, [sp, #56]
	ldr	r2, [sp, #60]
	str	r3, [sp, #44]
	ldr	r3, [sp, #64]
	str	r2, [sp, #116]
	mov	r2, #0
	str	r3, [sp, #120]
	str	r2, [sp, #92]
.L46:
	ldr	r2, [sp, #132]
	cmp	r2, #3
	ble	.L56
	add	r2, sp, #116
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r3, [r3, #0]
	ldr	r2, [r2, #4]
	str	r3, [sp, #100]
	mov	r3, #0
	str	r2, [sp, #104]
	str	r3, [sp, #112]
	add	r2, sp, #116
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r2, [r2, #0]
	ldr	r3, [r3, #4]
	str	r2, [sp, #96]
	str	r3, [sp, #108]
	ldr	r2, [sp, #120]
	ldr	r3, [sp, #120]
	ldr	sl, [sp, #100]
	ldr	r3, [r3, #12]
	ldr	r2, [r2, #8]
	str	r3, [sp, #124]
	ldr	r8, [sp, #104]
	str	r2, [sp, #128]
	mov	r7, #0
	mov	r3, sl
	b	.L57
.L55:
	str	r4, [sp, #128]
	str	r5, [sp, #124]
	ldr	r3, [sp, #100]
.L57:
	ldr	r4, [sl, #8]
	ldr	lr, [r3, r7]!
	mov	r0, r4, asl #4
	sub	r0, r0, r4, asl #2
	ldr	r1, [r3, #4]
	mov	r2, lr, asl #3
	mov	r3, lr, asl #8
	mov	ip, r0, asl #3
	add	r2, r2, r3
	add	r0, r0, ip
	rsb	r0, r4, r0
	mov	r3, r1, asl #11
	rsb	r2, lr, r2
	mov	r1, r1, asl #4
	add	r1, r1, r3
	mov	r2, r2, asl #3
	mov	r3, r0, asl #4
	rsb	r3, r0, r3
	add	r2, r2, lr
	mov	r1, r1, asr #12
	add	r1, r1, r2, asr #13
	mov	r3, r3, asl #1
	add	r3, r3, r4
	add	r1, r1, #256
	add	r0, r1, r3, asr #15
	cmp	r0, #255
	movls	r0, #256
	bls	.L48
	cmp	r0, #3760
	movcs	r0, #3760
	bl	__aeabi_ui2f
	bl	__aeabi_f2iz
.L48:
	ldr	r3, [sp, #96]
	ldr	r2, [sp, #108]
	str	r0, [r3, r7]
	add	r6, r2, r7
	ldr	r4, [r6, #8]
	ldr	lr, [r2, r7]
	mov	r0, r4, asl #4
	sub	r0, r0, r4, asl #2
	ldr	r1, [r6, #4]
	mov	r3, lr, asl #8
	mov	r2, lr, asl #3
	mov	ip, r0, asl #3
	add	r2, r2, r3
	add	r0, r0, ip
	rsb	r0, r4, r0
	mov	r3, r1, asl #11
	rsb	r2, lr, r2
	mov	r1, r1, asl #4
	add	r1, r1, r3
	mov	r2, r2, asl #3
	mov	r3, r0, asl #4
	rsb	r3, r0, r3
	add	r2, r2, lr
	mov	r1, r1, asr #12
	add	r1, r1, r2, asr #13
	mov	r3, r3, asl #1
	add	r3, r3, r4
	add	r1, r1, #256
	add	r0, r1, r3, asr #15
	cmp	r0, #255
	movls	r0, #256
	bls	.L50
	cmp	r0, #3760
	movcs	r0, #3760
	bl	__aeabi_ui2f
	bl	__aeabi_f2iz
.L50:
	ldr	r3, [sp, #104]
	str	r0, [r3, r7]
	ldr	r4, [sl, #20]
	ldr	lr, [sl, #12]
	mov	r0, r4, asl #4
	sub	r0, r0, r4, asl #2
	ldr	r1, [sl, #16]
	mov	r3, lr, asl #8
	mov	r2, lr, asl #3
	mov	ip, r0, asl #3
	add	r2, r2, r3
	add	r0, r0, ip
	rsb	r0, r4, r0
	mov	r3, r1, asl #11
	rsb	r2, lr, r2
	mov	r1, r1, asl #4
	add	r1, r1, r3
	mov	r2, r2, asl #3
	mov	r3, r0, asl #4
	rsb	r3, r0, r3
	add	r2, r2, lr
	mov	r1, r1, asr #12
	add	r1, r1, r2, asr #13
	mov	r3, r3, asl #1
	add	r3, r3, r4
	add	r1, r1, #256
	add	r0, r1, r3, asr #15
	cmp	r0, #255
	movls	r0, #256
	bls	.L52
	cmp	r0, #3760
	movcs	r0, #3760
	bl	__aeabi_ui2f
	bl	__aeabi_f2iz
.L52:
	ldr	r2, [sp, #96]
	add	r5, r2, r7
	str	r0, [r5, #12]
	ldr	r4, [r6, #20]
	ldr	lr, [r6, #12]
	mov	r0, r4, asl #4
	sub	r0, r0, r4, asl #2
	ldr	r1, [r6, #16]
	mov	r3, lr, asl #8
	mov	r2, lr, asl #3
	mov	ip, r0, asl #3
	add	r2, r2, r3
	add	r0, r0, ip
	rsb	r0, r4, r0
	mov	r3, r1, asl #11
	rsb	r2, lr, r2
	mov	r1, r1, asl #4
	add	r1, r1, r3
	mov	r2, r2, asl #3
	mov	r3, r0, asl #4
	rsb	r3, r0, r3
	add	r2, r2, lr
	mov	r1, r1, asr #12
	add	r1, r1, r2, asr #13
	mov	r3, r3, asl #1
	add	r3, r3, r4
	add	r1, r1, #256
	add	r0, r1, r3, asr #15
	cmp	r0, #255
	movls	r0, #256
	bls	.L54
	cmp	r0, #3760
	movcs	r0, #3760
	bl	__aeabi_ui2f
	bl	__aeabi_f2iz
.L54:
	ldr	r2, [sp, #104]
	add	r3, r2, r7
	str	r9, [r5, #4]
	str	r9, [r3, #4]
	ldr	r3, [sp, #124]
	str	fp, [r5, #8]
	str	r9, [r5, #16]
	str	fp, [r8, #8]
	str	r9, [r8, #16]
	str	fp, [r5, #20]
	str	r0, [r8, #12]
	str	fp, [r8, #20]
	add	r5, r3, #24
	ldmia	r5, {r0, r1, r2}
	mov	r3, sp
	stmia	r3, {r0, r1, r2}
	ldr	r2, [sp, #128]
	add	r3, r2, #36
	ldmia	r3, {r0, r1, r2}
	ldr	r3, [sp, #52]
	stmia	r3, {r0, r1, r2}
	ldr	r2, [sp, #124]
	add	r3, r2, #36
	ldmia	r3, {r0, r1, r2}
	ldr	r3, [sp, #48]
	stmia	r3, {r0, r1, r2}
	ldr	r2, [sp, #128]
	ldr	r3, [sp, #112]
	add	r4, r2, #24
	add	r3, r3, #1
	str	r3, [sp, #112]
	add	r0, sp, #140
	ldmia	r4, {r1, r2, r3}
	bl	rgb_to_ycc_avg
	ldr	r2, [sp, #112]
	ldr	r3, [sp, #44]
	cmp	r2, r3
	add	r7, r7, #24
	add	sl, sl, #24
	add	r8, r8, #24
	add	r9, sp, #144
	ldmia	r9, {r9, fp}	@ phole ldm
	bne	.L55
.L56:
	ldr	r2, [sp, #92]
	ldr	r3, [sp, #72]
	add	r2, r2, #2
	cmp	r2, r3
	str	r2, [sp, #92]
	add	r2, sp, #116
	ldmia	r2, {r2, r3}	@ phole ldm
	add	r3, r3, #8
	add	r2, r2, #8
	str	r2, [sp, #116]
	str	r3, [sp, #120]
	blt	.L46
.L45:
	ldr	r3, [sp, #56]
	ldr	r2, [r3, #0]
	ldr	r3, [sp, #68]
	sub	r6, r3, #2
	mov	r3, r2, asl #4
	sub	r3, r3, r2, asl #2
	ldr	r2, [sp, #64]
	ldr	sl, [r2, r6, asl #2]
	sub	r7, r3, #24
	str	r3, [sp, #80]
	add	r3, sl, r7
	ldr	r5, [r3, #8]
	ldr	r4, [sl, r7]
	mov	r0, r5, asl #4
	sub	r0, r0, r5, asl #2
	ldr	r1, [r3, #4]
	mov	r2, r4, asl #3
	mov	r3, r4, asl #8
	mov	ip, r0, asl #3
	add	r2, r2, r3
	add	r0, r0, ip
	rsb	r0, r5, r0
	mov	r3, r1, asl #11
	rsb	r2, r4, r2
	mov	r1, r1, asl #4
	add	r1, r1, r3
	mov	r2, r2, asl #3
	mov	r3, r0, asl #4
	add	r2, r2, r4
	rsb	r3, r0, r3
	mov	r1, r1, asr #12
	add	r1, r1, r2, asr #13
	mov	r3, r3, asl #1
	add	r3, r3, r5
	add	r1, r1, #256
	add	r0, r1, r3, asr #15
	ldr	r3, [sp, #60]
	ldr	r6, [r3, r6, asl #2]
	cmp	r0, #255
	add	r2, r6, r7
	str	r6, [sp, #76]
	str	r2, [sp, #84]
	movls	r0, #256
	bls	.L59
	cmp	r0, #3760
	movcs	r0, #3760
	bl	__aeabi_ui2f
	bl	__aeabi_f2iz
.L59:
	add	r2, sp, #64
	ldmia	r2, {r2, r3}	@ phole ldm
	mov	r6, r3, asl #2
	sub	r6, r6, #4
	ldr	r3, [sp, #76]
	ldr	r8, [r2, r6]
	str	r0, [r3, r7]
	add	r3, r8, r7
	ldr	r5, [r3, #8]
	ldr	r4, [r8, r7]
	mov	r0, r5, asl #4
	ldr	r1, [r3, #4]
	sub	r0, r0, r5, asl #2
	mov	r3, r4, asl #8
	mov	r2, r4, asl #3
	add	r2, r2, r3
	mov	ip, r0, asl #3
	mov	r3, r1, asl #11
	add	r0, r0, ip
	rsb	r2, r4, r2
	mov	r1, r1, asl #4
	rsb	r0, r5, r0
	add	r1, r1, r3
	mov	r2, r2, asl #3
	mov	r3, r0, asl #4
	add	r2, r2, r4
	mov	r1, r1, asr #12
	rsb	r3, r0, r3
	add	r1, r1, r2, asr #13
	ldr	r2, [sp, #60]
	mov	r3, r3, asl #1
	add	r3, r3, r5
	add	r1, r1, #256
	ldr	r6, [r2, r6]
	add	r0, r1, r3, asr #15
	cmp	r0, #255
	add	r3, r6, r7
	str	r3, [sp, #88]
	movls	r0, #256
	bls	.L61
	cmp	r0, #3760
	movcs	r0, #3760
	bl	__aeabi_ui2f
	bl	__aeabi_f2iz
.L61:
	ldr	r2, [sp, #80]
	str	r0, [r6, r7]
	sub	r7, r2, #12
	add	r3, sl, r7
	ldr	r5, [r3, #8]
	ldr	r4, [sl, r7]
	mov	r0, r5, asl #4
	sub	r0, r0, r5, asl #2
	ldr	r1, [r3, #4]
	mov	r2, r4, asl #3
	mov	r3, r4, asl #8
	mov	ip, r0, asl #3
	add	r2, r2, r3
	add	r0, r0, ip
	rsb	r0, r5, r0
	mov	r3, r1, asl #11
	rsb	r2, r4, r2
	mov	r1, r1, asl #4
	add	r1, r1, r3
	mov	r2, r2, asl #3
	mov	r3, r0, asl #4
	rsb	r3, r0, r3
	add	r2, r2, r4
	mov	r1, r1, asr #12
	add	r1, r1, r2, asr #13
	mov	r3, r3, asl #1
	add	r3, r3, r5
	add	r1, r1, #256
	add	r0, r1, r3, asr #15
	ldr	r3, [sp, #76]
	cmp	r0, #255
	add	sl, r3, r7
	movls	r0, #256
	bls	.L63
	cmp	r0, #3760
	movcs	r0, #3760
	bl	__aeabi_ui2f
	bl	__aeabi_f2iz
.L63:
	ldr	r2, [sp, #76]
	str	r0, [r2, r7]
	add	r3, r8, r7
	ldr	r5, [r3, #8]
	ldr	r4, [r8, r7]
	mov	r0, r5, asl #4
	sub	r0, r0, r5, asl #2
	ldr	r1, [r3, #4]
	mov	r2, r4, asl #3
	mov	r3, r4, asl #8
	mov	ip, r0, asl #3
	add	r2, r2, r3
	add	r0, r0, ip
	rsb	r0, r5, r0
	mov	r3, r1, asl #11
	rsb	r2, r4, r2
	mov	r1, r1, asl #4
	add	r1, r1, r3
	mov	r2, r2, asl #3
	mov	r3, r0, asl #4
	add	r2, r2, r4
	rsb	r3, r0, r3
	mov	r1, r1, asr #12
	add	r1, r1, r2, asr #13
	mov	r3, r3, asl #1
	add	r3, r3, r5
	add	r1, r1, #256
	add	r0, r1, r3, asr #15
	cmp	r0, #255
	add	r4, r6, r7
	movls	r0, #256
	bls	.L65
	cmp	r0, #3760
	movcs	r0, #3760
	bl	__aeabi_ui2f
	bl	__aeabi_f2iz
.L65:
	ldr	r3, [sp, #84]
	ldr	r2, [sp, #88]
	stmib	r3, {r9, fp}	@ phole stm
	stmib	r2, {r9, fp}	@ phole stm
	stmib	sl, {r9, fp}	@ phole stm
	str	r0, [r6, r7]
	stmib	r4, {r9, fp}	@ phole stm
	add	sp, sp, #156
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	height
	.word	width
	.size	matrix_rgb_to_ycc, .-matrix_rgb_to_ycc
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r1, .L103
	sub	sp, sp, #44
	ldr	r0, .L103+4
	bl	fopen
	ldr	fp, .L103+8
	mov	r7, r0
	ldr	r1, .L103+12
	mov	r2, fp
	bl	fscanf
	ldr	r2, .L103+16
	ldr	r1, .L103+12
	mov	r0, r7
	bl	fscanf
	ldr	r1, .L103+16
	ldr	r0, [r1, #0]
	mov	r0, r0, asl #2
	bl	malloc
	ldr	r2, .L103+16
	str	r0, [sp, #12]
	ldr	r0, [r2, #0]
	mov	r0, r0, asl #2
	bl	malloc
	ldr	r1, .L103+16
	ldr	r3, [r1, #0]
	cmp	r3, #0
	str	r0, [sp, #16]
	ble	.L72
	mov	r5, #0
	mov	r4, r5
.L73:
	ldr	r3, [fp, #0]
	mov	r0, r3, asl #4
	sub	r0, r0, r3, asl #2
	bl	malloc
	ldr	r3, [fp, #0]
	ldr	r1, [sp, #12]
	mov	r2, r3, asl #4
	str	r0, [r1, r4]
	sub	r0, r2, r3, asl #2
	bl	malloc
	ldr	r2, .L103+16
	ldr	r3, [r2, #0]
	add	r5, r5, #1
	ldr	r1, [sp, #16]
	cmp	r3, r5
	str	r0, [r1, r4]
	add	r4, r4, #4
	bgt	.L73
	cmp	r3, #0
	movgt	r8, #0
	ble	.L72
.L74:
	ldr	r3, [fp, #0]
	cmp	r3, #0
	movgt	r5, #0
	movgt	r4, r5
	movgt	r6, r8, asl #2
	ble	.L77
.L75:
	ldr	r2, [sp, #12]
	ldr	ip, [r2, r6]
	add	ip, ip, r4
	mov	r2, ip
	add	r3, r2, #4
	add	ip, ip, #8
	mov	r0, r7
	ldr	r1, .L103+20
	str	ip, [sp, #0]
	bl	fscanf
	ldr	r3, [fp, #0]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #12
	bgt	.L75
.L77:
	ldr	r1, .L103+16
	ldr	r3, [r1, #0]
	add	r8, r8, #1
	cmp	r3, r8
	bgt	.L74
.L72:
	mov	r0, r7
	bl	fclose
	add	r0, sp, #12
	ldmia	r0, {r0, r1}	@ phole ldm
	bl	matrix_rgb_to_ycc
	ldr	r0, .L103+24
	ldr	r1, .L103+28
	bl	fopen
	ldr	r2, .L103+16
	ldr	r3, [r2, #0]
	cmp	r3, #0
	mov	r7, r0
	movgt	r8, #0
	ble	.L78
.L79:
	ldr	r3, [fp, #0]
	cmp	r3, #0
	movgt	r5, #0
	movgt	r4, r5
	movgt	r6, r8, asl #2
	ble	.L82
.L80:
	ldr	r1, [sp, #16]
	ldr	r3, [r1, r6]
	add	r1, r3, r4
	ldr	ip, [r1, #8]
	ldr	r2, [r3, r4]
	mov	r0, r7
	ldr	r3, [r1, #4]
	ldr	r1, .L103+32
	str	ip, [sp, #0]
	bl	fprintf
	ldr	r3, [fp, #0]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #12
	bgt	.L80
.L82:
	ldr	r2, .L103+16
	ldr	r3, [r2, #0]
	add	r8, r8, #1
	cmp	r3, r8
	bgt	.L79
.L78:
	mov	r0, r7
	bl	fclose
	ldr	r3, .L103+16
	ldr	r0, [r3, #0]
	mov	r0, r0, asl #2
	bl	malloc
	ldr	r1, .L103+16
	ldr	r3, [r1, #0]
	cmp	r3, #0
	str	r0, [sp, #20]
	ble	.L83
	mov	r4, #0
.L84:
	ldr	r3, [fp, #0]
	mov	r0, r3, asl #4
	sub	r0, r0, r3, asl #2
	bl	malloc
	ldr	r2, .L103+16
	ldr	r3, [sp, #20]
	ldr	r2, [r2, #0]
	str	r0, [r3, r4, asl #2]
	add	r4, r4, #1
	cmp	r2, r4
	str	r2, [sp, #36]
	bgt	.L84
	cmp	r2, #0
	ble	.L83
	ldr	r3, .L103+8
	ldr	r3, [r3, #0]
	mov	r1, #0
	mov	r9, #4080
	str	r1, [sp, #28]
	str	r3, [sp, #24]
	str	r1, [sp, #32]
	add	r9, r9, #15
.L85:
	ldr	r3, [sp, #24]
	cmp	r3, #0
	ble	.L87
	ldr	r1, [sp, #32]
	add	r2, sp, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r8, [r2, r1]
	ldr	r7, [r3, r1]
	mov	sl, #0
.L86:
	ldr	r5, [r8, #8]
	ldr	r6, [r8, #4]
	ldr	ip, [r8], #12
	mov	lr, r5, asl #4
	mov	r1, r5, asl #6
	rsb	r1, lr, r1
	mov	r3, ip, asl #5
	mov	r2, ip, asl #2
	add	r2, r2, r3
	mov	r0, r1, asl #4
	add	r1, r1, r0
	add	r2, r2, ip
	mov	r3, r6, asl #5
	sub	r3, r3, r6, asl #3
	mov	r4, r5, asl #7
	mov	r2, r2, asl #2
	add	r1, r1, r5
	rsb	r4, lr, r4
	mov	r0, r3, asl #7
	add	r2, r2, ip
	mov	r1, r1, asl #2
	mov	ip, r6, asl #4
	mov	lr, r6, asl #11
	rsb	r4, r5, r4
	add	r3, r3, r0
	add	ip, ip, lr
	add	r1, r1, r5
	mov	r0, r4, asl #4
	mov	r2, r2, asl #4
	add	r3, r3, r6
	add	ip, ip, r6
	add	r1, r1, #-16777216
	rsb	r0, r4, r0
	sub	r2, r2, #610304
	sub	r3, r3, #6291456
	add	r1, r1, #10027008
	sub	ip, ip, #4194304
	mov	r2, r2, asr #11
	mov	r0, r0, asl #1
	sub	r3, r3, #51200
	add	r1, r1, #55296
	sub	ip, ip, #34816
	sub	r3, r2, r3, asr #13
	add	ip, r2, ip, asr #10
	sub	r0, r0, #6815744
	add	r2, r2, r1, asr #11
	cmp	r2, r9
	strls	r2, [r7, #0]
	strhi	r9, [r7, #0]
	sub	r0, r0, #4096
	ldr	r2, [sp, #24]
	sub	r3, r3, r0, asr #12
	add	sl, sl, #1
	cmp	r3, r9
	strls	r3, [r7, #4]
	strhi	r9, [r7, #4]
	cmp	ip, r9
	strls	ip, [r7, #8]
	strhi	r9, [r7, #8]
	cmp	sl, r2
	add	r7, r7, #12
	blt	.L86
.L87:
	ldr	r3, [sp, #28]
	ldr	r2, [sp, #32]
	ldr	r1, [sp, #36]
	add	r3, r3, #1
	add	r2, r2, #4
	cmp	r3, r1
	str	r3, [sp, #28]
	str	r2, [sp, #32]
	blt	.L85
.L83:
	ldr	r1, .L103+28
	ldr	r0, .L103+36
	bl	fopen
	ldr	r1, .L103+16
	ldr	r3, [r1, #0]
	cmp	r3, #0
	mov	r7, r0
	movgt	r8, #0
	ble	.L88
.L89:
	ldr	r3, [fp, #0]
	cmp	r3, #0
	movgt	r5, #0
	movgt	r4, r5
	movgt	r6, r8, asl #2
	ble	.L92
.L90:
	ldr	r2, [sp, #20]
	ldr	r3, [r2, r6]
	add	r1, r3, r4
	ldr	ip, [r1, #8]
	ldr	r2, [r3, r4]
	mov	r0, r7
	ldr	r3, [r1, #4]
	ldr	r1, .L103+32
	str	ip, [sp, #0]
	bl	fprintf
	ldr	r3, [fp, #0]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #12
	bgt	.L90
.L92:
	ldr	r1, .L103+16
	ldr	r3, [r1, #0]
	add	r8, r8, #1
	cmp	r3, r8
	bgt	.L89
.L88:
	mov	r0, r7
	bl	fclose
	ldr	r2, .L103+16
	ldr	r3, [r2, #0]
	cmp	r3, #0
	ble	.L93
	mov	r5, #0
	mov	r4, r5
.L94:
	ldr	r3, [sp, #12]
	ldr	r0, [r3, r4]
	bl	free
	ldr	r1, [sp, #16]
	ldr	r0, [r1, r4]
	bl	free
	ldr	r2, [sp, #20]
	ldr	r0, [r2, r4]
	bl	free
	ldr	r1, .L103+16
	ldr	r3, [r1, #0]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #4
	bgt	.L94
.L93:
	ldr	r0, [sp, #12]
	bl	free
	ldr	r0, [sp, #16]
	bl	free
	ldr	r0, [sp, #20]
	bl	free
	add	sp, sp, #44
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	.LC1
	.word	.LC0
	.word	width
	.word	.LC2
	.word	height
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
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
	.ascii	"optimized_out_1.ycc\000"
.LC5:
	.ascii	"w\000"
	.space	2
.LC6:
	.ascii	"%d %d %d\012\000"
	.space	2
.LC7:
	.ascii	"optimized_orig_1.rgb\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
