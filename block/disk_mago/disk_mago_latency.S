	.text
	.file	"disk_mago_latency.c"
	.globl	get_latency_info        // -- Begin function get_latency_info
	.p2align	3
	.type	get_latency_info,@function
get_latency_info:                       // @get_latency_info
// %bb.0:
	ldr	w8, [x0]
	cmp	w8, #179                // =179
	b.eq	.LBB0_4
// %bb.1:
	cmp	w8, #8                  // =8
	b.ne	.LBB0_8
// %bb.2:
	adrp	x8, mago_scsi_host
	ldr	x8, [x8, :lo12:mago_scsi_host]
	cbz	x8, .LBB0_7
// %bb.3:
	ldr	x8, [x8, #312]
	cbnz	x8, .LBB0_6
	b	.LBB0_7
.LBB0_4:
	adrp	x8, mago_mmc_host
	ldr	x8, [x8, :lo12:mago_mmc_host]
	cbz	x8, .LBB0_7
// %bb.5:
	ldr	x8, [x8, #1976]
	cbz	x8, .LBB0_7
.LBB0_6:
	ldr	w9, [x8, #200]
	mov	w0, wzr
	str	w9, [x1, #16]
	ldr	w9, [x8, #204]
	str	w9, [x1, #20]
	ldr	w9, [x8, #208]
	str	w9, [x1, #24]
	ldr	w9, [x8, #212]
	str	w9, [x1, #28]
	ldr	w9, [x8, #216]
	str	w9, [x1, #32]
	ldr	w8, [x8, #220]
	str	w8, [x1, #36]
	ret
.LBB0_7:
	mov	w0, #-22
	ret
.LBB0_8:
	mov	w0, #-1
	ret
.Lfunc_end0:
	.size	get_latency_info, .Lfunc_end0-get_latency_info
                                        // -- End function
	.section	.init.text,"ax",@progbits
	.p2align	2               // -- Begin function parse_disk_mago_tag
	.type	parse_disk_mago_tag,@function
parse_disk_mago_tag:                    // @parse_disk_mago_tag
// %bb.0:
	cbnz	x0, .LBB1_2
// %bb.1:
	mov	w0, #-1
	ret
.LBB1_2:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	adrp	x20, .L.str.16
	add	x20, x20, :lo12:.L.str.16
	mov	x19, x0
	mov	x0, x20
	mov	x29, sp
	bl	strlen
	mov	x2, x0
	mov	x0, x19
	mov	x1, x20
	bl	strncmp
	cmp	w0, #0                  // =0
	adrp	x0, .L.str.17
	adrp	x1, .L.str.18
	adrp	x8, disk_mago_flag
	cset	w9, eq
	add	x0, x0, :lo12:.L.str.17
	add	x1, x1, :lo12:.L.str.18
	mov	x2, x19
	strb	w9, [x8, :lo12:disk_mago_flag]
	bl	printk
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	parse_disk_mago_tag, .Lfunc_end1-parse_disk_mago_tag
                                        // -- End function
	.text
	.globl	is_disk_mago            // -- Begin function is_disk_mago
	.p2align	3
	.type	is_disk_mago,@function
is_disk_mago:                           // @is_disk_mago
// %bb.0:
	adrp	x8, disk_mago_flag
	ldrb	w0, [x8, :lo12:disk_mago_flag]
	ret
.Lfunc_end2:
	.size	is_disk_mago, .Lfunc_end2-is_disk_mago
                                        // -- End function
	.globl	mago_ufs_io_latency_cmd_end // -- Begin function mago_ufs_io_latency_cmd_end
	.p2align	3
	.type	mago_ufs_io_latency_cmd_end,@function
mago_ufs_io_latency_cmd_end:            // @mago_ufs_io_latency_cmd_end
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	ldr	x8, [x0, #312]
	cbz	x8, .LBB3_3
// %bb.1:
	adrp	x8, jiffies
	mov	x19, x0
	mov	x20, x1
	ldr	x8, [x8, :lo12:jiffies]
	ldr	x9, [x1, #272]
	sub	x0, x8, x9
	bl	jiffies_to_msecs
	ldr	w9, [x20, #296]
	mov	w8, w0
	cmp	w9, #2                  // =2
	b.ne	.LBB3_4
// %bb.2:
	ldr	x9, [x19, #312]
	ldr	x10, [x9, #152]
	add	x10, x10, x8
	str	x10, [x9, #152]
	ldr	x9, [x19, #312]
	ldr	x10, [x9, #160]
	add	x10, x10, #1            // =1
	str	x10, [x9, #160]
	ldr	x9, [x19, #312]
	ldr	x10, [x9, #184]
	cmp	x10, x8
	csel	x8, x8, x10, lo
	str	x8, [x9, #184]
.LBB3_3:
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.LBB3_4:
	cmp	w9, #1                  // =1
	b.ne	.LBB3_3
// %bb.5:
	ldr	x9, [x19, #312]
	ldr	x10, [x9, #168]
	add	x10, x10, x8
	str	x10, [x9, #168]
	ldr	x9, [x19, #312]
	ldr	x10, [x9, #176]
	add	x10, x10, #1            // =1
	str	x10, [x9, #176]
	ldr	x9, [x19, #312]
	ldr	x10, [x9, #192]
	cmp	x10, x8
	csel	x8, x8, x10, lo
	str	x8, [x9, #192]
	b	.LBB3_3
.Lfunc_end3:
	.size	mago_ufs_io_latency_cmd_end, .Lfunc_end3-mago_ufs_io_latency_cmd_end
                                        // -- End function
	.globl	mago_mmc_io_latency_mrq_end // -- Begin function mago_mmc_io_latency_mrq_end
	.p2align	3
	.type	mago_mmc_io_latency_mrq_end,@function
mago_mmc_io_latency_mrq_end:            // @mago_mmc_io_latency_mrq_end
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	ldr	x8, [x0, #1976]
	cbz	x8, .LBB4_4
// %bb.1:
	ldr	x8, [x1, #16]
	mov	x20, x1
	cbz	x8, .LBB4_4
// %bb.2:
	adrp	x8, jiffies
	mov	x19, x0
	ldr	x8, [x8, :lo12:jiffies]
	ldr	x9, [x20, #128]
	sub	x0, x8, x9
	bl	jiffies_to_msecs
	ldr	x8, [x20, #16]
	ldr	w9, [x8, #24]
	mov	w8, w0
	tbz	w9, #9, .LBB4_5
// %bb.3:
	ldr	x9, [x19, #1976]
	ldr	x10, [x9, #152]
	add	x10, x10, x8
	str	x10, [x9, #152]
	ldr	x9, [x19, #1976]
	ldr	x10, [x9, #160]
	add	x10, x10, #1            // =1
	str	x10, [x9, #160]
	ldr	x9, [x19, #1976]
	ldr	x10, [x9, #184]
	cmp	x10, x8
	csel	x8, x8, x10, lo
	str	x8, [x9, #184]
.LBB4_4:
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.LBB4_5:
	tbz	w9, #8, .LBB4_4
// %bb.6:
	ldr	x9, [x19, #1976]
	ldr	x10, [x9, #168]
	add	x10, x10, x8
	str	x10, [x9, #168]
	ldr	x9, [x19, #1976]
	ldr	x10, [x9, #176]
	add	x10, x10, #1            // =1
	str	x10, [x9, #176]
	ldr	x9, [x19, #1976]
	ldr	x10, [x9, #192]
	cmp	x10, x8
	csel	x8, x8, x10, lo
	str	x8, [x9, #192]
	b	.LBB4_4
.Lfunc_end4:
	.size	mago_mmc_io_latency_mrq_end, .Lfunc_end4-mago_mmc_io_latency_mrq_end
                                        // -- End function
	.globl	mago_ufs_host_init      // -- Begin function mago_ufs_host_init
	.p2align	3
	.type	mago_ufs_host_init,@function
mago_ufs_host_init:                     // @mago_ufs_host_init
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	ldr	x8, [x0, #312]
	mov	x29, sp
	str	x19, [sp, #16]          // 8-byte Folded Spill
	cbnz	x8, .LBB5_2
// %bb.1:
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printk
	b	.LBB5_5
.LBB5_2:
	mov	x19, x0
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	bl	printk
	ldr	x8, [x19, #1544]
	adrp	x9, mago_scsi_host
	str	x19, [x9, :lo12:mago_scsi_host]
	cbnz	x8, .LBB5_4
// %bb.3:
	ldr	x8, [x19, #1448]
.LBB5_4:
	ldr	x9, [x19, #312]
	adrp	x1, delayed_work_timer_fn
	add	x1, x1, :lo12:delayed_work_timer_fn
	mov	w2, #2097152
	mov	x3, xzr
	mov	x4, xzr
	str	x8, [x9, #144]
	mov	w8, #250
	ldr	x19, [x19, #312]
	adrp	x9, mago_io_latency_work
	add	x9, x9, :lo12:mago_io_latency_work
	str	x8, [x19, #136]
	mov	x8, #68719476704
	add	x10, x19, #8            // =8
	add	x0, x19, #48            // =48
	stp	xzr, xzr, [x19, #152]
	stp	xzr, xzr, [x19, #168]
	stp	xzr, xzr, [x19, #184]
	str	x8, [x19]
	str	x10, [x19, #8]
	stp	x10, x9, [x19, #16]
	bl	init_timer_key
	adrp	x8, system_power_efficient_wq
	ldr	x3, [x19, #136]
	mov	w0, #8
	mov	x2, x19
	ldr	x1, [x8, :lo12:system_power_efficient_wq]
	bl	queue_delayed_work_on
.LBB5_5:
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end5:
	.size	mago_ufs_host_init, .Lfunc_end5-mago_ufs_host_init
                                        // -- End function
	.globl	mago_mmc_host_init      // -- Begin function mago_mmc_host_init
	.p2align	3
	.type	mago_mmc_host_init,@function
mago_mmc_host_init:                     // @mago_mmc_host_init
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	ldr	x8, [x0, #1976]
	mov	x29, sp
	str	x19, [sp, #16]          // 8-byte Folded Spill
	cbnz	x8, .LBB6_2
// %bb.1:
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	printk
	b	.LBB6_5
.LBB6_2:
	mov	x19, x0
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	bl	printk
	ldr	x8, [x19, #120]
	adrp	x9, mago_mmc_host
	str	x19, [x9, :lo12:mago_mmc_host]
	cbnz	x8, .LBB6_4
// %bb.3:
	ldr	x8, [x19, #24]
.LBB6_4:
	ldr	x9, [x19, #1976]
	adrp	x1, delayed_work_timer_fn
	add	x1, x1, :lo12:delayed_work_timer_fn
	mov	w2, #2097152
	mov	x3, xzr
	mov	x4, xzr
	str	x8, [x9, #144]
	mov	w8, #250
	ldr	x19, [x19, #1976]
	adrp	x9, mago_io_latency_work
	add	x9, x9, :lo12:mago_io_latency_work
	str	x8, [x19, #136]
	mov	x8, #68719476704
	add	x10, x19, #8            // =8
	add	x0, x19, #48            // =48
	stp	xzr, xzr, [x19, #152]
	stp	xzr, xzr, [x19, #168]
	stp	xzr, xzr, [x19, #184]
	str	x8, [x19]
	str	x10, [x19, #8]
	stp	x10, x9, [x19, #16]
	bl	init_timer_key
	adrp	x8, system_power_efficient_wq
	ldr	x3, [x19, #136]
	mov	w0, #8
	mov	x2, x19
	ldr	x1, [x8, :lo12:system_power_efficient_wq]
	bl	queue_delayed_work_on
.LBB6_5:
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end6:
	.size	mago_mmc_host_init, .Lfunc_end6-mago_mmc_host_init
                                        // -- End function
	.globl	mago_ufs_host_exit      // -- Begin function mago_ufs_host_exit
	.p2align	3
	.type	mago_ufs_host_exit,@function
mago_ufs_host_exit:                     // @mago_ufs_host_exit
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	ldr	x8, [x0, #312]
	mov	x29, sp
	str	x19, [sp, #16]          // 8-byte Folded Spill
	cbnz	x8, .LBB7_2
// %bb.1:
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	printk
	b	.LBB7_3
.LBB7_2:
	mov	x19, x0
	adrp	x0, .L.str.5
	add	x0, x0, :lo12:.L.str.5
	bl	printk
	ldr	x0, [x19, #312]
	bl	cancel_delayed_work_sync
.LBB7_3:
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end7:
	.size	mago_ufs_host_exit, .Lfunc_end7-mago_ufs_host_exit
                                        // -- End function
	.globl	mago_mmc_host_exit      // -- Begin function mago_mmc_host_exit
	.p2align	3
	.type	mago_mmc_host_exit,@function
mago_mmc_host_exit:                     // @mago_mmc_host_exit
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	ldr	x8, [x0, #1976]
	mov	x29, sp
	str	x19, [sp, #16]          // 8-byte Folded Spill
	cbnz	x8, .LBB8_2
// %bb.1:
	adrp	x0, .L.str.6
	add	x0, x0, :lo12:.L.str.6
	bl	printk
	b	.LBB8_3
.LBB8_2:
	mov	x19, x0
	adrp	x0, .L.str.7
	add	x0, x0, :lo12:.L.str.7
	bl	printk
	ldr	x0, [x19, #1976]
	bl	cancel_delayed_work_sync
.LBB8_3:
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end8:
	.size	mago_mmc_host_exit, .Lfunc_end8-mago_mmc_host_exit
                                        // -- End function
	.globl	mago_hba_host_pre_init  // -- Begin function mago_hba_host_pre_init
	.p2align	3
	.type	mago_hba_host_pre_init,@function
mago_hba_host_pre_init:                 // @mago_hba_host_pre_init
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	adrp	x8, disk_mago_flag
	str	x23, [sp, #16]          // 8-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	ldrb	w8, [x8, :lo12:disk_mago_flag]
	cbnz	w8, .LBB9_2
// %bb.1:
	adrp	x0, .L.str.8
	add	x0, x0, :lo12:.L.str.8
	bl	printk
	b	.LBB9_9
.LBB9_2:
	ldr	x23, [x0, #280]
	mov	x19, x0
	ldr	x20, [x23, #1544]
	mov	x21, x20
	cbnz	x20, .LBB9_4
// %bb.3:
	ldr	x21, [x23, #1448]
.LBB9_4:
	adrp	x22, .L.str.9
	add	x22, x22, :lo12:.L.str.9
	mov	x0, x22
	bl	strlen
	mov	x2, x0
	mov	x0, x21
	mov	x1, x22
	bl	strncmp
	cbnz	w0, .LBB9_6
// %bb.5:
	adrp	x0, .L.str.10
	add	x0, x0, :lo12:.L.str.10
	bl	printk
	ldr	x8, [x19, #280]
	add	x9, x19, #56            // =56
	str	x9, [x8, #312]
	b	.LBB9_9
.LBB9_6:
	cbnz	x20, .LBB9_8
// %bb.7:
	ldr	x20, [x23, #1448]
.LBB9_8:
	adrp	x0, .L.str.11
	mov	x1, x20
	add	x0, x0, :lo12:.L.str.11
	bl	printk
.LBB9_9:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end9:
	.size	mago_hba_host_pre_init, .Lfunc_end9-mago_hba_host_pre_init
                                        // -- End function
	.globl	mago_mmc_host_pre_init  // -- Begin function mago_mmc_host_pre_init
	.p2align	3
	.type	mago_mmc_host_pre_init,@function
mago_mmc_host_pre_init:                 // @mago_mmc_host_pre_init
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	adrp	x8, disk_mago_flag
	str	x23, [sp, #16]          // 8-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	ldrb	w8, [x8, :lo12:disk_mago_flag]
	cbnz	w8, .LBB10_2
// %bb.1:
	adrp	x0, .L.str.12
	add	x0, x0, :lo12:.L.str.12
	bl	printk
	b	.LBB10_9
.LBB10_2:
	ldr	x23, [x0, #64]
	mov	x19, x0
	ldr	x20, [x23, #120]
	mov	x21, x20
	cbnz	x20, .LBB10_4
// %bb.3:
	ldr	x21, [x23, #24]
.LBB10_4:
	adrp	x22, .L.str.13
	add	x22, x22, :lo12:.L.str.13
	mov	x0, x22
	bl	strlen
	mov	x2, x0
	mov	x0, x21
	mov	x1, x22
	bl	strncmp
	cbnz	w0, .LBB10_6
// %bb.5:
	adrp	x0, .L.str.14
	add	x0, x0, :lo12:.L.str.14
	bl	printk
	ldr	x8, [x19, #64]
	add	x9, x19, #1120          // =1120
	str	x9, [x8, #1976]
	b	.LBB10_9
.LBB10_6:
	cbnz	x20, .LBB10_8
// %bb.7:
	ldr	x20, [x23, #24]
.LBB10_8:
	adrp	x0, .L.str.15
	mov	x1, x20
	add	x0, x0, :lo12:.L.str.15
	bl	printk
.LBB10_9:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end10:
	.size	mago_mmc_host_pre_init, .Lfunc_end10-mago_mmc_host_pre_init
                                        // -- End function
	.p2align	3               // -- Begin function mago_io_latency_work
	.type	mago_io_latency_work,@function
mago_io_latency_work:                   // @mago_io_latency_work
// %bb.0:
	sub	sp, sp, #48             // =48
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	ldr	x5, [x0, #160]
	str	x19, [sp, #32]          // 8-byte Folded Spill
	mov	x19, x0
	cbnz	x5, .LBB11_3
// %bb.1:
	mov	x3, xzr
	ldr	x8, [x19, #176]
	cbz	x8, .LBB11_4
.LBB11_2:
	ldr	x9, [x19, #168]
	udiv	x7, x9, x8
	b	.LBB11_5
.LBB11_3:
	ldr	x8, [x19, #152]
	udiv	x3, x8, x5
	ldr	x8, [x19, #176]
	cbnz	x8, .LBB11_2
.LBB11_4:
	mov	x7, xzr
.LBB11_5:
	cmp	x3, #50                 // =50
	mov	w9, #1
	cinc	w10, w9, hs
	cmp	x3, #5                  // =5
	csel	w2, wzr, w10, lo
	cmp	x7, #50                 // =50
	ldp	x4, x10, [x19, #184]
	cinc	w9, w9, hs
	cmp	x7, #5                  // =5
	ldr	x1, [x19, #144]
	adrp	x0, .L.str.19
	csel	w6, wzr, w9, lo
	add	x0, x0, :lo12:.L.str.19
	stp	w3, w4, [x19, #208]
	stp	w7, w10, [x19, #216]
	stp	w2, w6, [x19, #200]
	stp	x10, x8, [sp]
	bl	printk
	adrp	x8, system_power_efficient_wq
	stp	xzr, xzr, [x19, #152]
	ldr	x3, [x19, #136]
	mov	w0, #8
	mov	x2, x19
	ldr	x1, [x8, :lo12:system_power_efficient_wq]
	stp	xzr, xzr, [x19, #168]
	stp	xzr, xzr, [x19, #184]
	bl	queue_delayed_work_on
	ldr	x19, [sp, #32]          // 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #48             // =48
	ret
.Lfunc_end11:
	.size	mago_io_latency_work, .Lfunc_end11-mago_io_latency_work
                                        // -- End function
	.type	mago_scsi_host,@object  // @mago_scsi_host
	.local	mago_scsi_host
	.comm	mago_scsi_host,8,8
	.type	mago_mmc_host,@object   // @mago_mmc_host
	.local	mago_mmc_host
	.comm	mago_mmc_host,8,8
	.type	__setup_str_parse_disk_mago_tag,@object // @__setup_str_parse_disk_mago_tag
	.section	.init.rodata,"a",@progbits
__setup_str_parse_disk_mago_tag:
	.asciz	"androidboot.isdiskmago"
	.size	__setup_str_parse_disk_mago_tag, 23

	.type	__setup_parse_disk_mago_tag,@object // @__setup_parse_disk_mago_tag
	.section	.init.setup,"aw",@progbits
	.p2align	3
__setup_parse_disk_mago_tag:
	.xword	__setup_str_parse_disk_mago_tag
	.xword	parse_disk_mago_tag
	.word	1                       // 0x1
	.zero	4
	.size	__setup_parse_disk_mago_tag, 24

	.type	disk_mago_flag,@object  // @disk_mago_flag
	.local	disk_mago_flag
	.comm	disk_mago_flag,1,4
	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\0016[MAGO_IO_LATENCY]host0:no entity, mago_ufs_host_init failed\n"
	.size	.L.str, 63

	.type	.L.str.1,@object        // @.str.1
.L.str.1:
	.asciz	"\0016[MAGO_IO_LATENCY]host0:init work queue, mago_ufs_host_init success\n"
	.size	.L.str.1, 70

	.type	.L.str.2,@object        // @.str.2
.L.str.2:
	.asciz	"\0016[MAGO_IO_LATENCY]mmc0:no entity, mago_mmc_host_init failed\n"
	.size	.L.str.2, 62

	.type	.L.str.3,@object        // @.str.3
.L.str.3:
	.asciz	"\0016[MAGO_IO_LATENCY]mmc0:init work queue, mago_mmc_host_init success\n"
	.size	.L.str.3, 69

	.type	.L.str.4,@object        // @.str.4
.L.str.4:
	.asciz	"\0016[MAGO_IO_LATENCY]host0:no entity, mago_ufs_host_exit failed\n"
	.size	.L.str.4, 63

	.type	.L.str.5,@object        // @.str.5
.L.str.5:
	.asciz	"\0016[MAGO_IO_LATENCY]host0:work queue exit, mago_ufs_host_exit success\n"
	.size	.L.str.5, 70

	.type	.L.str.6,@object        // @.str.6
.L.str.6:
	.asciz	"\0016[MAGO_IO_LATENCY]mmc0:no entity, mago_mmc_host_exit failed\n"
	.size	.L.str.6, 62

	.type	.L.str.7,@object        // @.str.7
.L.str.7:
	.asciz	"\0016[MAGO_IO_LATENCY]mmc0:work queue exit, mago_mmc_host_exit success\n"
	.size	.L.str.7, 69

	.type	.L.str.8,@object        // @.str.8
.L.str.8:
	.asciz	"\0016[MAGO_IO_LATENCY]host0:not disk mago, no need entity\n"
	.size	.L.str.8, 56

	.type	.L.str.9,@object        // @.str.9
.L.str.9:
	.asciz	"host0"
	.size	.L.str.9, 6

	.type	.L.str.10,@object       // @.str.10
.L.str.10:
	.asciz	"\0016[MAGO_IO_LATENCY]host0:init mago entity success\n"
	.size	.L.str.10, 51

	.type	.L.str.11,@object       // @.str.11
.L.str.11:
	.asciz	"\0016[MAGO_IO_LATENCY]:host is %s, not host0, no init mago entity\n"
	.size	.L.str.11, 64

	.type	.L.str.12,@object       // @.str.12
.L.str.12:
	.asciz	"\0016[MAGO_IO_LATENCY]mmc0:not disk mago, no need entity\n"
	.size	.L.str.12, 55

	.type	.L.str.13,@object       // @.str.13
.L.str.13:
	.asciz	"mmc0"
	.size	.L.str.13, 5

	.type	.L.str.14,@object       // @.str.14
.L.str.14:
	.asciz	"\0016[MAGO_IO_LATENCY]mmc0:init mago entity success\n"
	.size	.L.str.14, 50

	.type	.L.str.15,@object       // @.str.15
.L.str.15:
	.asciz	"\0016[MAGO_IO_LATENCY]:host is %s, not mmc0, no init mago entity\n"
	.size	.L.str.15, 63

	.type	.L.str.16,@object       // @.str.16
.L.str.16:
	.asciz	"1"
	.size	.L.str.16, 2

	.type	.L.str.17,@object       // @.str.17
.L.str.17:
	.asciz	"\0016[DISK_MAGO]cmdline %s=%s\n"
	.size	.L.str.17, 28

	.type	.L.str.18,@object       // @.str.18
.L.str.18:
	.asciz	"androidboot.isdiskmago"
	.size	.L.str.18, 23

	.type	.L.str.19,@object       // @.str.19
.L.str.19:
	.asciz	"\0016[MAGO_IO_LATENCY]%s:read:[%d/%lu/%lu/%lu],write:[%d/%lu/%lu/%lu]\n"
	.size	.L.str.19, 68

	.ident	"Snapdragon LLVM ARM Compiler 10.0.7 for Android NDK"
	.section	".note.GNU-stack","",@progbits
