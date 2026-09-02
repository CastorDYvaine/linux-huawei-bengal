	.text
	.file	"disk_mago_info.c"
	.globl	block_get_inflight_info // -- Begin function block_get_inflight_info
	.p2align	3
	.type	block_get_inflight_info,@function
block_get_inflight_info:                // @block_get_inflight_info
// %bb.0:
	cbz	x0, .LBB0_4
// %bb.1:
	ldr	x8, [x0, #128]
	cbz	x8, .LBB0_4
// %bb.2:
	ldr	x8, [x8, #1280]
	cbz	x8, .LBB0_4
// %bb.3:
	ldr	w9, [x8, #2600]
	mov	w0, wzr
	ldr	w10, [x8, #2604]
	ldr	w11, [x8, #2604]
	ldr	x12, [x8, #744]
	sub	w9, w9, w10
	str	w12, [x1]
	bic	w9, w9, w9, asr #31
	ldr	x8, [x8, #2128]
	ldr	w8, [x8, #20]
	str	w11, [x1, #12]
	stp	w8, w9, [x1, #4]
	ret
.LBB0_4:
	mov	w0, #-22
	ret
.Lfunc_end0:
	.size	block_get_inflight_info, .Lfunc_end0-block_get_inflight_info
                                        // -- End function
	.globl	block_get_dynamic_info  // -- Begin function block_get_dynamic_info
	.p2align	3
	.type	block_get_dynamic_info,@function
block_get_dynamic_info:                 // @block_get_dynamic_info
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	cbz	x0, .LBB1_6
// %bb.1:
	ldr	x8, [x0, #128]
	cbz	x8, .LBB1_6
// %bb.2:
	ldr	x8, [x8, #1280]
	cbz	x8, .LBB1_6
// %bb.3:
	ldr	w9, [x8, #2600]
	ldr	w10, [x8, #2604]
	ldr	w11, [x8, #2604]
	ldr	x12, [x8, #744]
	sub	w9, w9, w10
	str	w12, [x1]
	bic	w9, w9, w9, asr #31
	ldr	x8, [x8, #2128]
	ldr	w8, [x8, #20]
	str	w11, [x1, #12]
	stp	w8, w9, [x1, #4]
	ldr	x20, [x0, #128]
	mov	x0, x20
	bl	get_latency_info
	tbnz	w0, #31, .LBB1_7
// %bb.4:
	mov	w19, wzr
.LBB1_5:
	mov	w0, w19
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.LBB1_6:
	adrp	x0, .L.str
	adrp	x1, .L__func__.block_get_dynamic_info
	add	x0, x0, :lo12:.L.str
	add	x1, x1, :lo12:.L__func__.block_get_dynamic_info
	bl	printk
	mov	w19, #-22
	b	.LBB1_5
.LBB1_7:
	mov	w19, w0
	adrp	x0, .L.str.1
	add	x1, x20, #12            // =12
	add	x0, x0, :lo12:.L.str.1
	mov	w2, w19
	bl	printk
	b	.LBB1_5
.Lfunc_end1:
	.size	block_get_dynamic_info, .Lfunc_end1-block_get_dynamic_info
                                        // -- End function
	.globl	ufshcd_query_read_desc  // -- Begin function ufshcd_query_read_desc
	.p2align	3
	.type	ufshcd_query_read_desc,@function
ufshcd_query_read_desc:                 // @ufshcd_query_read_desc
// %bb.0:
	sub	sp, sp, #80             // =80
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	str	x23, [sp, #32]          // 8-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	str	x8, [sp, #8]
	mov	w8, #128
	ldrb	w21, [x1, #4]
	str	w8, [sp, #4]
	cbz	x0, .LBB2_7
// %bb.1:
	ldr	x23, [x0]
	adds	x22, x23, #2400         // =2400
	b.eq	.LBB2_8
// %bb.2:
	ldr	x0, [x23, #2688]
	mov	x19, x1
	mov	w1, #4
	mov	x20, x2
	bl	__pm_runtime_resume
	cmp	w21, #9                 // =9
	b.eq	.LBB2_4
// %bb.3:
	cbnz	w21, .LBB2_10
.LBB2_4:
	add	x6, sp, #4              // =4
	mov	x0, x22
	mov	w1, #1
	mov	w2, w21
	mov	w3, wzr
	mov	w4, wzr
	mov	x5, x20
	bl	ufshcd_query_descriptor_retry
	mov	w20, w0
	cbz	w0, .LBB2_6
// %bb.5:
	ldr	x0, [x23, #2688]
	adrp	x1, .L.str.4
	adrp	x2, .L__func__.ufshcd_query_read_desc
	add	x1, x1, :lo12:.L.str.4
	add	x2, x2, :lo12:.L__func__.ufshcd_query_read_desc
	mov	w3, w20
	bl	_dev_err
	b	.LBB2_11
.LBB2_6:
	ldr	w8, [sp, #4]
	mov	w9, #128
	cmp	w8, #128                // =128
	csel	w8, w8, w9, lt
	strh	w8, [x19, #6]
	b	.LBB2_11
.LBB2_7:
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	b	.LBB2_9
.LBB2_8:
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
.LBB2_9:
	adrp	x1, .L__func__.ufshcd_query_read_desc
	add	x1, x1, :lo12:.L__func__.ufshcd_query_read_desc
	bl	printk
.LBB2_10:
	mov	w20, #-22
.LBB2_11:
	adrp	x9, __stack_chk_guard
	ldr	x8, [sp, #8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB2_13
// %bb.12:
	mov	w0, w20
	ldr	x23, [sp, #32]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #80             // =80
	ret
.LBB2_13:
	bl	__stack_chk_fail
.Lfunc_end2:
	.size	ufshcd_query_read_desc, .Lfunc_end2-ufshcd_query_read_desc
                                        // -- End function
	.globl	block_get_healthy_info  // -- Begin function block_get_healthy_info
	.p2align	3
	.type	block_get_healthy_info,@function
block_get_healthy_info:                 // @block_get_healthy_info
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x28, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	sub	sp, sp, #544            // =544
	adrp	x8, __stack_chk_guard
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stur	x8, [x29, #-8]
	cbz	x0, .LBB3_2
// %bb.1:
	ldr	x21, [x0, #128]
	mov	x20, x0
	cbnz	x21, .LBB3_5
.LBB3_2:
	mov	w21, #-12
.LBB3_3:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB3_19
// %bb.4:
	mov	w0, w21
	add	sp, sp, #544            // =544
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB3_5:
	mov	w8, #100
	mov	x19, x1
	add	x0, sp, #8              // =8
	mov	w2, #2
	str	x8, [x1]
	mov	w1, wzr
	bl	memset
	ldr	w8, [x21]
	cmp	w8, #179                // =179
	b.eq	.LBB3_9
// %bb.6:
	cmp	w8, #8                  // =8
	b.ne	.LBB3_13
// %bb.7:
	add	x0, sp, #16             // =16
	mov	w1, wzr
	mov	w2, #8
	stp	xzr, xzr, [sp, #136]
	stp	xzr, xzr, [sp, #120]
	stp	xzr, xzr, [sp, #104]
	stp	xzr, xzr, [sp, #88]
	stp	xzr, xzr, [sp, #72]
	stp	xzr, xzr, [sp, #56]
	stp	xzr, xzr, [sp, #40]
	stp	xzr, xzr, [sp, #24]
	bl	memset
	ldr	x8, [x20, #128]
	mov	w9, #1
	mov	w10, #9
	add	x1, sp, #16             // =16
	add	x2, sp, #24             // =24
	str	w9, [sp, #16]
	ldr	x8, [x8, #1288]
	strb	w10, [sp, #20]
	ldr	x0, [x8, #8]
	mov	w8, #128
	strh	w8, [sp, #22]
	bl	ufshcd_query_read_desc
	mov	w21, w0
	cbnz	w0, .LBB3_14
// %bb.8:
	ldurh	w8, [sp, #27]
	b	.LBB3_11
.LBB3_9:
	add	x0, sp, #24             // =24
	mov	w1, wzr
	mov	w2, #512
	bl	memset
	add	x1, sp, #24             // =24
	mov	x0, x20
	bl	mmc_blk_get_health_info
	mov	w21, w0
	cbnz	w0, .LBB3_16
// %bb.10:
	ldrh	w8, [sp, #292]
.LBB3_11:
	strh	w8, [sp, #8]
.LBB3_12:
	ldrb	w8, [sp, #8]
	adrp	x0, .L.str.8
	ldrb	w9, [sp, #9]
	add	x0, x0, :lo12:.L.str.8
	ldr	x2, [x19]
	cmp	w8, w9
	csel	w10, w8, w9, hi
	cmp	w9, #10                 // =10
	ccmp	w8, #10, #2, lo
	mov	w8, #100
	add	x9, x10, w10, uxtw #2
	lsl	x9, x9, #1
	csel	x3, x9, x8, lo
	str	x3, [x19, #8]
	ldr	x8, [x20, #128]
	ldr	w1, [x8]
	bl	printk
	b	.LBB3_3
.LBB3_13:
	adrp	x0, .L.str.7
	adrp	x1, .L__func__.block_get_healthy_info
	add	x0, x0, :lo12:.L.str.7
	mov	w2, #219
	add	x1, x1, :lo12:.L__func__.block_get_healthy_info
	bl	printk
	mov	w21, #-22
	b	.LBB3_3
.LBB3_14:
	adrp	x0, .L.str.9
	adrp	x1, .L__func__.get_ufs_health_info
	add	x0, x0, :lo12:.L.str.9
	add	x1, x1, :lo12:.L__func__.get_ufs_health_info
	mov	w2, w21
	bl	printk
	tbz	w21, #31, .LBB3_12
// %bb.15:
	adrp	x0, .L.str.5
	mov	w2, #209
	add	x0, x0, :lo12:.L.str.5
	b	.LBB3_18
.LBB3_16:
	adrp	x0, .L.str.10
	mov	w1, w21
	add	x0, x0, :lo12:.L.str.10
	bl	printk
	tbz	w21, #31, .LBB3_12
// %bb.17:
	adrp	x0, .L.str.6
	mov	w2, #215
	add	x0, x0, :lo12:.L.str.6
.LBB3_18:
	adrp	x1, .L__func__.block_get_healthy_info
	add	x1, x1, :lo12:.L__func__.block_get_healthy_info
	bl	printk
	b	.LBB3_3
.LBB3_19:
	bl	__stack_chk_fail
.Lfunc_end3:
	.size	block_get_healthy_info, .Lfunc_end3-block_get_healthy_info
                                        // -- End function
	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\0013%s: block_get_inflight_info failed\n"
	.size	.L.str, 38

	.type	.L__func__.block_get_dynamic_info,@object // @__func__.block_get_dynamic_info
.L__func__.block_get_dynamic_info:
	.asciz	"block_get_dynamic_info"
	.size	.L__func__.block_get_dynamic_info, 23

	.type	.L.str.1,@object        // @.str.1
.L.str.1:
	.asciz	"\0013[MAGO_IO_LATENCY]%s:get_latency_info failed, ret:%d\n"
	.size	.L.str.1, 55

	.type	.L.str.2,@object        // @.str.2
.L.str.2:
	.asciz	"\0013%s: sdev or buffer is NULL!\n"
	.size	.L.str.2, 31

	.type	.L__func__.ufshcd_query_read_desc,@object // @__func__.ufshcd_query_read_desc
.L__func__.ufshcd_query_read_desc:
	.asciz	"ufshcd_query_read_desc"
	.size	.L__func__.ufshcd_query_read_desc, 23

	.type	.L.str.3,@object        // @.str.3
.L.str.3:
	.asciz	"\0013%s: hba is NULL!\n"
	.size	.L.str.3, 20

	.type	.L.str.4,@object        // @.str.4
.L.str.4:
	.asciz	"%s: read desc err %d\n"
	.size	.L.str.4, 22

	.type	.L.str.5,@object        // @.str.5
.L.str.5:
	.asciz	"\0013%s:%d: get_ufs_health_info failed\n"
	.size	.L.str.5, 37

	.type	.L__func__.block_get_healthy_info,@object // @__func__.block_get_healthy_info
.L__func__.block_get_healthy_info:
	.asciz	"block_get_healthy_info"
	.size	.L__func__.block_get_healthy_info, 23

	.type	.L.str.6,@object        // @.str.6
.L.str.6:
	.asciz	"\0013%s:%d: get_emmc_health_info failed\n"
	.size	.L.str.6, 38

	.type	.L.str.7,@object        // @.str.7
.L.str.7:
	.asciz	"\0013%s:%d: disk->major error\n"
	.size	.L.str.7, 28

	.type	.L.str.8,@object        // @.str.8
.L.str.8:
	.asciz	"\0016disk->major = %d total = %d, expired = %d\n"
	.size	.L.str.8, 45

	.type	.L.str.9,@object        // @.str.9
.L.str.9:
	.asciz	"\0013%s: failed, ret = %d\n"
	.size	.L.str.9, 24

	.type	.L__func__.get_ufs_health_info,@object // @__func__.get_ufs_health_info
.L__func__.get_ufs_health_info:
	.asciz	"get_ufs_health_info"
	.size	.L__func__.get_ufs_health_info, 20

	.type	.L.str.10,@object       // @.str.10
.L.str.10:
	.asciz	"\0013storage_info: mmc_blk_get_health_info, ret=%d\n"
	.size	.L.str.10, 49

	.ident	"Snapdragon LLVM ARM Compiler 10.0.7 for Android NDK"
	.section	".note.GNU-stack","",@progbits
