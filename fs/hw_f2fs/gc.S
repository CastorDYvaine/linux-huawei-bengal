	.text
	.file	"gc.c"
	.globl	f2fs_init_gc_thread     // -- Begin function f2fs_init_gc_thread
	.p2align	3
	.type	f2fs_init_gc_thread,@function
f2fs_init_gc_thread:                    // @f2fs_init_gc_thread
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	adrp	x1, .L.str
	adrp	x2, f2fs_init_gc_thread.__key
	str	x19, [sp, #16]          // 8-byte Folded Spill
	mov	x19, x0
	add	x0, x0, #1720           // =1720
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:f2fs_init_gc_thread.__key
	mov	x29, sp
	bl	__init_waitqueue_head
	adrp	x1, .L.str.2
	adrp	x2, f2fs_init_gc_thread.__key.1
	add	x0, x19, #1776          // =1776
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:f2fs_init_gc_thread.__key.1
	bl	__init_waitqueue_head
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	f2fs_init_gc_thread, .Lfunc_end0-f2fs_init_gc_thread
                                        // -- End function
	.globl	f2fs_start_gc_thread    // -- Begin function f2fs_start_gc_thread
	.p2align	3
	.type	f2fs_start_gc_thread,@function
f2fs_start_gc_thread:                   // @f2fs_start_gc_thread
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x10, #60000
	ldr	x9, [x0]
	mov	x8, #500
	movk	x10, #37856, lsl #32
	movk	x8, #10000, lsl #32
	movk	x10, #4, lsl #48
	mov	x19, x0
	add	x11, x0, #1712          // =1712
	adrp	x3, .L.str.3
	ldr	x9, [x9, #248]
	mov	w2, #-1
	add	x3, x3, :lo12:.L.str.3
	mov	x1, x19
	mov	x29, sp
	ldr	w9, [x9]
	str	xzr, [x0, #1712]
	str	x8, [x0, #1744]
	mov	w8, #1
	str	x10, [x0, #1752]
	adrp	x0, gc_thread_func
	and	w5, w9, #0xfffff
	add	x0, x0, :lo12:gc_thread_func
	lsr	w4, w9, #20
	str	wzr, [x11, #60]
	str	w8, [x11, #52]
	bl	kthread_create_on_node
	mov	x20, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB1_2
// %bb.1:
	mov	x0, x20
	bl	wake_up_process
	str	x20, [x19, #1712]
	mov	w20, wzr
.LBB1_2:
	mov	w0, w20
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	f2fs_start_gc_thread, .Lfunc_end1-f2fs_start_gc_thread
                                        // -- End function
	.p2align	3               // -- Begin function gc_thread_func
	.type	gc_thread_func,@function
gc_thread_func:                         // @gc_thread_func
// %bb.0:
	sub	sp, sp, #224            // =224
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #128]    // 16-byte Folded Spill
	add	x29, sp, #128           // =128
	stp	x28, x27, [sp, #144]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #160]    // 16-byte Folded Spill
	//APP
	mrs x10, sp_el0
	//NO_APP
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	sub	x11, x29, #16           // =16
	stp	x24, x23, [sp, #176]    // 16-byte Folded Spill
	add	x11, x11, #4            // =4
	stp	x22, x21, [sp, #192]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #208]    // 16-byte Folded Spill
	mov	x19, x0
	stur	x8, [x29, #-8]
	ldr	w9, [x10, #108]
	ldr	w8, [x0, #1748]
	stp	x11, x10, [sp, #32]     // 16-byte Folded Spill
	orr	w9, w9, #0x2000000
	stp	w8, w8, [x29, #-16]
	stur	w8, [x29, #-60]
	str	w9, [x10, #108]
	bl	set_freezable
	add	x8, x19, #1720          // =1720
	adrp	x20, system_freezing_cnt
	str	x8, [sp, #16]           // 8-byte Folded Spill
	add	x8, x19, #1784          // =1784
	str	x8, [sp, #48]           // 8-byte Folded Spill
	add	x8, x19, #1664          // =1664
	str	x8, [sp, #56]           // 8-byte Folded Spill
	add	x8, x19, #1776          // =1776
	str	x8, [sp, #24]           // 8-byte Folded Spill
	add	x8, x19, #1236          // =1236
	str	x8, [sp, #8]            // 8-byte Folded Spill
	b	.LBB2_4
.LBB2_1:                                //   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [sp, #24]           // 8-byte Folded Reload
	mov	w1, #3
	mov	w2, wzr
	mov	x3, xzr
	bl	__wake_up
.LBB2_2:                                //   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [x19]
	mov	w1, #1
	bl	__sb_end_write
.LBB2_3:                                //   in Loop: Header=BB2_4 Depth=1
	bl	kthread_should_stop
	tbnz	w0, #0, .LBB2_179
.LBB2_4:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB2_13 Depth 2
                                        //     Child Loop BB2_83 Depth 2
                                        //     Child Loop BB2_172 Depth 2
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB2_6
// %bb.5:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbnz	w8, #0, .LBB2_7
.LBB2_6:                                //   in Loop: Header=BB2_4 Depth=1
	sub	x1, x29, #60            // =60
	mov	x0, x19
	bl	get_gc_wait_ms
	ldur	w26, [x29, #-60]
	b	.LBB2_17
.LBB2_7:                                //   in Loop: Header=BB2_4 Depth=1
	sub	x1, x29, #16            // =16
	mov	x0, x19
	str	wzr, [x19, #3308]
	bl	get_gc_wait_ms
	ldr	x1, [sp, #32]           // 8-byte Folded Reload
	mov	w8, #1
	ldr	w25, [x19, #1764]
	mov	x0, x19
	ldr	w27, [x19, #1748]
	str	w8, [x19, #3308]
	bl	get_gc_wait_ms
	ldp	w28, w22, [x29, #-16]
	ldr	w24, [x19, #1764]
	ldr	w21, [x19, #1748]
	subs	w8, w28, w22
	b.ls	.LBB2_9
// %bb.8:                               //   in Loop: Header=BB2_4 Depth=1
	mov	w9, #1
	mov	w26, w22
	stur	w22, [x29, #-60]
	b	.LBB2_10
.LBB2_9:                                //   in Loop: Header=BB2_4 Depth=1
	mov	w9, wzr
	sub	w8, w22, w28
	mov	w26, w28
	stur	w28, [x29, #-60]
.LBB2_10:                               //   in Loop: Header=BB2_4 Depth=1
	lsr	w8, w8, #4
	cmp	w8, #625                // =625
	mov	w8, #3
	csel	w23, w8, w9, lo
	cmp	w25, w24
	csel	w8, w24, w25, lo
	cmp	w27, w21
	csel	w9, w27, w21, lo
	str	w8, [x19, #1764]
	adrp	x8, __tracepoint_f2fs_select_gc_device
	add	x8, x8, :lo12:__tracepoint_f2fs_select_gc_device
	str	w9, [x19, #1748]
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB2_16
// %bb.11:                              //   in Loop: Header=BB2_4 Depth=1
	adrp	x9, cpu_number
	//APP
	.if 1 == 1
661:
	mrs x8, tpidr_el1
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 11
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	mrs x8, tpidr_el2
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	add	x9, x9, :lo12:cpu_number
	adrp	x10, __cpu_online_mask
	add	x10, x10, :lo12:__cpu_online_mask
	ldr	w8, [x8, x9]
	add	w9, w8, #63             // =63
	cmp	w8, #0                  // =0
	csel	w9, w9, w8, lt
	asr	w9, w9, #6
	ldr	x9, [x10, w9, sxtw #3]
	lsr	x8, x9, x8
	tbz	w8, #0, .LBB2_16
// %bb.12:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x9, [sp, #40]           // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	add	w8, w8, #1              // =1
	str	w8, [x9, #80]
	adrp	x8, __tracepoint_f2fs_select_gc_device
	add	x8, x8, :lo12:__tracepoint_f2fs_select_gc_device
	//APP
	//NO_APP
	ldr	x20, [x8, #32]
	cbz	x20, .LBB2_14
.LBB2_13:                               //   Parent Loop BB2_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x8, x0, [x20]
	mov	w1, w23
	mov	w2, w28
	mov	w3, w22
	mov	w4, w25
	mov	w5, w24
	mov	w6, w27
	mov	w7, w21
	blr	x8
	ldr	x8, [x20, #24]!
	cbnz	x8, .LBB2_13
.LBB2_14:                               //   in Loop: Header=BB2_4 Depth=1
	//APP
	//NO_APP
	adrp	x20, system_freezing_cnt
	ldr	x9, [sp, #40]           // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	b.ne	.LBB2_16
// %bb.15:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	ldr	x8, [x8]
	tbnz	w8, #1, .LBB2_176
.LBB2_16:                               //   in Loop: Header=BB2_4 Depth=1
	str	w23, [x19, #3308]
.LBB2_17:                               //   in Loop: Header=BB2_4 Depth=1
	mov	w0, w26
	bl	__msecs_to_jiffies
	ldr	w8, [x19, #1772]
	mov	x21, x0
	sxtw	x25, w0
	cbnz	w8, .LBB2_21
// %bb.18:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x20, :lo12:system_freezing_cnt]
	cbnz	w8, .LBB2_101
.LBB2_19:                               //   in Loop: Header=BB2_4 Depth=1
	bl	kthread_should_stop
	tbnz	w0, #0, .LBB2_21
// %bb.20:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	ldr	x8, [x9]
	cmp	x9, x8
	b.eq	.LBB2_60
.LBB2_21:                               //   in Loop: Header=BB2_4 Depth=1
	cmp	w21, #0                 // =0
	csinc	x27, x25, xzr, ne
.LBB2_22:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #1772]
	cbz	w8, .LBB2_24
// %bb.23:                              //   in Loop: Header=BB2_4 Depth=1
	str	wzr, [x19, #1772]
.LBB2_24:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [x19]
	mov	w1, #1
	mov	w2, wzr
	bl	__sb_start_write
	cbz	w0, .LBB2_34
// %bb.25:                              //   in Loop: Header=BB2_4 Depth=1
	cbz	w27, .LBB2_36
// %bb.26:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x20, :lo12:system_freezing_cnt]
	cbnz	w8, .LBB2_99
.LBB2_27:                               //   in Loop: Header=BB2_4 Depth=1
	bl	kthread_should_stop
	tbnz	w0, #0, .LBB2_178
// %bb.28:                              //   in Loop: Header=BB2_4 Depth=1
	tbnz	w27, #31, .LBB2_43
// %bb.29:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w20, [x19, #2232]
	cbz	w20, .LBB2_31
// %bb.30:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	bl	down_write
	mov	x0, x19
	mov	w1, #1
	mov	w2, wzr
	mov	w3, wzr
	mov	w4, #-1
	bl	f2fs_gc
	add	x8, x19, #2232          // =2232
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, w20
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB2_31:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	w22, [x19, #1192]
	adrp	x20, system_freezing_cnt
	ldr	w27, [x19, #1188]
	ldrsw	x24, [x19, #1284]
	ldr	w23, [x19, #1184]
	ldrsw	x25, [x19, #1272]
	ldrsw	x26, [x19, #1296]
	ldr	x8, [x19, #80]
	tbnz	w8, #3, .LBB2_1
// %bb.32:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x11, [x19, #136]
	ldr	x8, [x11, #8]
	ldr	w9, [x11, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	b.eq	.LBB2_44
// %bb.33:                              //   in Loop: Header=BB2_4 Depth=1
	udiv	w10, w9, w22
	mov	w15, #-1
	b	.LBB2_45
.LBB2_34:                               //   in Loop: Header=BB2_4 Depth=1
	ldrb	w8, [x19, #1232]
	tbz	w8, #4, .LBB2_3
// %bb.35:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #2144]
	add	w8, w8, #1              // =1
	str	w8, [x19, #2144]
	b	.LBB2_3
.LBB2_36:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [x19]
	ldr	w8, [x8, #616]
	cmp	w8, #1                  // =1
	b.lt	.LBB2_52
// %bb.37:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #1756]
	cmp	w26, w8
	b.eq	.LBB2_39
// %bb.38:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #1748]
	ldr	w9, [x19, #1752]
	add	x10, x8, w26, uxtw
	add	w8, w8, w26
	cmp	x10, x9
	csel	w26, w9, w8, hi
	stur	w26, [x29, #-60]
.LBB2_39:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #3024]
	sub	x9, x29, #16            // =16
	cmp	w8, #2                  // =2
	b.ne	.LBB2_80
// %bb.40:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB2_80
// %bb.41:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #3308]
	cmp	w8, #3                  // =3
	b.ne	.LBB2_79
// %bb.42:                              //   in Loop: Header=BB2_4 Depth=1
	stp	w26, w26, [x29, #-16]
	b	.LBB2_80
.LBB2_43:                               //   in Loop: Header=BB2_4 Depth=1
	adrp	x1, .L.str.12
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.12
	bl	f2fs_printk
	b	.LBB2_2
.LBB2_44:                               //   in Loop: Header=BB2_4 Depth=1
	mov	w15, #-1
	mov	w10, w15
.LBB2_45:                               //   in Loop: Header=BB2_4 Depth=1
	mov	w16, #48
	cmp	w8, w10
	b.ne	.LBB2_50
// %bb.46:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w12, [x19, #1284]
	ldr	w13, [x19, #1272]
	ldr	w28, [x19, #1272]
	ldr	x10, [x11, #24]
	ldr	x11, [x11]
	add	w12, w13, w12
	ldr	w14, [x10, #460]
	ldr	x11, [x11, #136]
	madd	x14, x14, x16, x11
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w13, w27, w14
	cmp	w13, w12
	b.lo	.LBB2_50
// %bb.47:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w13, [x10, #580]
	madd	x13, x13, x16, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w27, w13
	cmp	w13, w12
	b.lo	.LBB2_50
// %bb.48:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w13, [x10, #700]
	madd	x13, x13, x16, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w27, w13
	cmp	w13, w12
	b.lo	.LBB2_50
// %bb.49:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w12, [x10, #100]
	madd	x11, x12, x16, x11
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w11, w27, w11
	cmp	w11, w28
	b.hs	.LBB2_91
.LBB2_50:                               //   in Loop: Header=BB2_4 Depth=1
	mul	w10, w27, w22
	cmn	w9, #1                  // =1
	sub	x10, x10, #1            // =1
	add	x12, x10, x25
	add	x11, x10, x24
	asr	x12, x12, x23
	add	x10, x10, x26
	asr	x11, x11, x23
	udiv	w12, w12, w22
	asr	x10, x10, x23
	udiv	w11, w11, w22
	udiv	w10, w10, w22
	add	w11, w11, w12, lsl #1
	add	w10, w11, w10
	b.eq	.LBB2_57
// %bb.51:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w11, [x19, #1192]
	udiv	w9, w9, w11
	b	.LBB2_58
.LBB2_52:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	bl	down_write_trylock
	cbz	w0, .LBB2_80
// %bb.53:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #1868]
	cmp	w8, #5                  // =5
	b.ne	.LBB2_65
// %bb.54:                              //   in Loop: Header=BB2_4 Depth=1
	ldrb	w8, [x19, #1232]
	tbnz	w8, #3, .LBB2_109
// %bb.55:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #3024]
	ldr	w25, [x19, #1744]
	cmp	w8, #2                  // =2
	stur	w25, [x29, #-60]
	b.ne	.LBB2_162
// %bb.56:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbnz	w8, #0, .LBB2_142
	b	.LBB2_162
.LBB2_57:                               //   in Loop: Header=BB2_4 Depth=1
	mov	w9, w15
.LBB2_58:                               //   in Loop: Header=BB2_4 Depth=1
	add	w9, w10, w9
	cmp	w8, w9
	b.hi	.LBB2_1
// %bb.59:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	bl	down_write
	mov	x0, x19
	mov	w1, wzr
	mov	w2, wzr
	mov	w3, wzr
	mov	w4, #-1
	bl	f2fs_gc
	b	.LBB2_1
.LBB2_60:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #2232]
	cmp	w8, #0                  // =0
	ccmp	w21, #0, #0, ne
	csinc	x27, x25, xzr, ne
	cbnz	w8, .LBB2_22
// %bb.61:                              //   in Loop: Header=BB2_4 Depth=1
	cbz	x27, .LBB2_22
// %bb.62:                              //   in Loop: Header=BB2_4 Depth=1
	sub	x0, x29, #56            // =56
	mov	w1, wzr
	bl	init_wait_entry
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	sub	x1, x29, #56            // =56
	mov	w2, #1
	bl	prepare_to_wait_event
	ldr	w8, [x19, #1772]
	cbz	w8, .LBB2_82
.LBB2_63:                               //   in Loop: Header=BB2_4 Depth=1
	cmp	x25, #0                 // =0
	csinc	x21, x25, xzr, ne
.LBB2_64:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	sub	x1, x29, #56            // =56
	bl	finish_wait
	mov	x27, x21
	b	.LBB2_22
.LBB2_65:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #1308]
	cbnz	w9, .LBB2_72
// %bb.66:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #1312]
	cbnz	w9, .LBB2_72
// %bb.67:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #1316]
	cbnz	w9, .LBB2_72
// %bb.68:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #1304]
	cbnz	w9, .LBB2_72
// %bb.69:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #1300]
	cbnz	w9, .LBB2_72
// %bb.70:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #1324]
	cbnz	w9, .LBB2_72
// %bb.71:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #1320]
	cbz	w9, .LBB2_102
.LBB2_72:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #1232]
	tbnz	w8, #0, .LBB2_109
// %bb.73:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #1756]
	cmp	w26, w9
	b.eq	.LBB2_75
// %bb.74:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #1748]
	ldr	w10, [x19, #1752]
	add	x11, x9, w26, uxtw
	add	w9, w9, w26
	cmp	x11, x10
	csel	w26, w10, w9, hi
	stur	w26, [x29, #-60]
.LBB2_75:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB2_96
// %bb.76:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x9, [x19, #16]
	ldrb	w9, [x9, #2182]
	tbz	w9, #0, .LBB2_96
// %bb.77:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #3308]
	cmp	w9, #3                  // =3
	b.ne	.LBB2_95
// %bb.78:                              //   in Loop: Header=BB2_4 Depth=1
	stp	w26, w26, [x29, #-16]
	b	.LBB2_96
.LBB2_79:                               //   in Loop: Header=BB2_4 Depth=1
	str	w26, [x9, x8, lsl #2]
.LBB2_80:                               //   in Loop: Header=BB2_4 Depth=1
	ldrb	w8, [x19, #1232]
	tbz	w8, #4, .LBB2_2
// %bb.81:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #2144]
	add	w8, w8, #1              // =1
	str	w8, [x19, #2144]
	b	.LBB2_2
.LBB2_82:                               //   in Loop: Header=BB2_4 Depth=1
	mov	x27, x0
.LBB2_83:                               //   Parent Loop BB2_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w8, [x20, :lo12:system_freezing_cnt]
	cbnz	w8, .LBB2_90
.LBB2_84:                               //   in Loop: Header=BB2_83 Depth=2
	bl	kthread_should_stop
	tbnz	w0, #0, .LBB2_63
// %bb.85:                              //   in Loop: Header=BB2_83 Depth=2
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	ldr	x8, [x9]
	cmp	x9, x8
	b.ne	.LBB2_63
// %bb.86:                              //   in Loop: Header=BB2_83 Depth=2
	ldr	w8, [x19, #2232]
	cmp	w8, #0                  // =0
	ccmp	x25, #0, #0, ne
	csinc	x21, x25, xzr, ne
	cbnz	w8, .LBB2_64
// %bb.87:                              //   in Loop: Header=BB2_83 Depth=2
	cbz	x21, .LBB2_64
// %bb.88:                              //   in Loop: Header=BB2_83 Depth=2
	cbnz	x27, .LBB2_22
// %bb.89:                              //   in Loop: Header=BB2_83 Depth=2
	mov	x0, x21
	bl	schedule_timeout
	mov	x25, x0
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	sub	x1, x29, #56            // =56
	mov	w2, #1
	bl	prepare_to_wait_event
	ldr	w8, [x19, #1772]
	mov	x27, x0
	cbz	w8, .LBB2_83
	b	.LBB2_63
.LBB2_90:                               //   in Loop: Header=BB2_83 Depth=2
	ldr	x0, [sp, #40]           // 8-byte Folded Reload
	bl	freezing_slow_path
	tbz	w0, #0, .LBB2_84
	b	.LBB2_63
.LBB2_91:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB2_1
// %bb.92:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB2_1
// %bb.93:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w21, [x10, #820]
	mov	x0, x19
	mov	w1, w21
	bl	f2fs_usable_blks_in_seg
	ldr	x9, [x19, #136]
	mov	w10, #48
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x21, x10, x8
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w28
	b.hs	.LBB2_1
// %bb.94:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [x9, #8]
	mov	w15, #-1
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB2_50
.LBB2_95:                               //   in Loop: Header=BB2_4 Depth=1
	sub	x10, x29, #16           // =16
	str	w26, [x10, x9, lsl #2]
.LBB2_96:                               //   in Loop: Header=BB2_4 Depth=1
	tbz	w8, #4, .LBB2_98
// %bb.97:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #2140]
	add	w8, w8, #1              // =1
	str	w8, [x19, #2140]
.LBB2_98:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	bl	up_write
	b	.LBB2_2
.LBB2_99:                               //   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [sp, #40]           // 8-byte Folded Reload
	bl	freezing_slow_path
	tbz	w0, #0, .LBB2_27
// %bb.100:                             //   in Loop: Header=BB2_4 Depth=1
	mov	w0, wzr
	bl	__refrigerator
	tbz	w0, #0, .LBB2_27
	b	.LBB2_80
.LBB2_101:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [sp, #40]           // 8-byte Folded Reload
	bl	freezing_slow_path
	tbz	w0, #0, .LBB2_19
	b	.LBB2_21
.LBB2_102:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x9, [x19, #136]
	cbz	x9, .LBB2_107
// %bb.103:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	x10, [x9, #168]
	cbz	x10, .LBB2_105
// %bb.104:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	w10, [x10, #8336]
	cbnz	w10, .LBB2_72
.LBB2_105:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x9, [x9, #160]
	cbz	x9, .LBB2_107
// %bb.106:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x9, #36]
	cbnz	w9, .LBB2_72
.LBB2_107:                              //   in Loop: Header=BB2_4 Depth=1
	cmp	w8, #6                  // =6
	b.eq	.LBB2_109
// %bb.108:                             //   in Loop: Header=BB2_4 Depth=1
	adrp	x10, jiffies
	ldr	x8, [x19, #568]
	ldr	x9, [x19, #520]
	mov	w11, #250
	ldr	x10, [x10, :lo12:jiffies]
	madd	x8, x8, x11, x9
	cmp	x8, x10
	b.pl	.LBB2_72
.LBB2_109:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #3308]
	cmp	w8, #1                  // =1
	b.ls	.LBB2_111
// %bb.110:                             //   in Loop: Header=BB2_4 Depth=1
	mov	w10, #1
	b	.LBB2_114
.LBB2_111:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB2_113
// %bb.112:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	x9, [x19, #16]
	ldrb	w9, [x9, #2182]
	tbnz	w9, #0, .LBB2_116
.LBB2_113:                              //   in Loop: Header=BB2_4 Depth=1
	mov	w10, wzr
.LBB2_114:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x9, [x19, #136]
	ldr	w11, [x19, #1236]
	ldr	x9, [x9]
	ldr	w9, [x9, #16]
	sub	w9, w11, w9
	tbnz	w10, #0, .LBB2_118
// %bb.115:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	w11, [x19, #3024]
	ldr	x10, [sp, #8]           // 8-byte Folded Reload
	cmp	w11, #2                 // =2
	b.eq	.LBB2_117
	b	.LBB2_120
.LBB2_116:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x9, [x19, #3032]
	mov	w10, #192
	madd	x9, x8, x10, x9
	ldp	w10, w9, [x9, #180]
	subs	w9, w10, w9
	csel	w9, wzr, w9, lo
.LBB2_117:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x10, [x19, #16]
	ldrb	w10, [x10, #2182]
	tbnz	w10, #0, .LBB2_119
.LBB2_118:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x10, [sp, #8]           // 8-byte Folded Reload
	b	.LBB2_120
.LBB2_119:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x10, [x19, #3032]
	mov	w11, #192
	madd	x10, x8, x11, x10
	add	x10, x10, #180          // =180
.LBB2_120:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w10, [x10]
	mov	w11, #34079
	movk	w11, #20971, lsl #16
	add	w10, w10, w10, lsl #2
	lsl	w10, w10, #3
	umull	x10, w10, w11
	lsr	x10, x10, #37
	cmp	w9, w10
	b.ls	.LBB2_135
// %bb.121:                             //   in Loop: Header=BB2_4 Depth=1
	cmp	w8, #1                  // =1
	b.hi	.LBB2_124
// %bb.122:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	w9, [x19, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB2_124
// %bb.123:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	x9, [x19, #16]
	ldrb	w9, [x9, #2182]
	tbnz	w9, #0, .LBB2_145
.LBB2_124:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x10, [x19, #136]
	ldr	x9, [x10, #8]
	add	x10, x10, #104          // =104
	add	x9, x9, #4              // =4
.LBB2_125:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w10, [x10]
	ldr	w9, [x9]
	subs	w9, w9, w10
	b.hs	.LBB2_127
// %bb.126:                             //   in Loop: Header=BB2_4 Depth=1
	mov	w9, wzr
	cmp	w8, #1                  // =1
	b.ls	.LBB2_128
	b	.LBB2_130
.LBB2_127:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w10, [x19, #1184]
	lsl	w9, w9, w10
	cmp	w8, #1                  // =1
	b.hi	.LBB2_130
.LBB2_128:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w10, [x19, #3024]
	cmp	w10, #2                 // =2
	b.ne	.LBB2_130
// %bb.129:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	x10, [x19, #16]
	ldrb	w10, [x10, #2182]
	tbnz	w10, #0, .LBB2_146
.LBB2_130:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x10, [x19, #136]
	ldr	w11, [x19, #1236]
	ldr	x10, [x10]
	ldr	w10, [x10, #16]
	sub	w10, w11, w10
.LBB2_131:                              //   in Loop: Header=BB2_4 Depth=1
	mov	w11, #34079
	add	w10, w10, w10, lsl #2
	movk	w11, #20971, lsl #16
	lsl	w10, w10, #3
	umull	x10, w10, w11
	lsr	x10, x10, #37
	cmp	w9, w10
	b.hs	.LBB2_135
// %bb.132:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	w10, [x19, #1756]
	ldr	w9, [x19, #1748]
	cmp	w26, w10
	b.ne	.LBB2_134
// %bb.133:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	w26, [x19, #1752]
	stur	w26, [x29, #-60]
.LBB2_134:                              //   in Loop: Header=BB2_4 Depth=1
	mov	w11, w26
	sub	w12, w26, w9
	sub	x11, x11, x9
	cmp	x11, x9
	csel	w25, w9, w12, lt
	b	.LBB2_138
.LBB2_135:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w10, [x19, #1756]
	ldr	w9, [x19, #1748]
	cmp	w26, w10
	b.ne	.LBB2_137
// %bb.136:                             //   in Loop: Header=BB2_4 Depth=1
	mov	w25, w26
	b	.LBB2_139
.LBB2_137:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w11, [x19, #1752]
	add	x12, x9, w26, uxtw
	add	w13, w9, w26
	cmp	x12, x11
	csel	w25, w11, w13, hi
.LBB2_138:                              //   in Loop: Header=BB2_4 Depth=1
	mov	w26, w10
	stur	w25, [x29, #-60]
.LBB2_139:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w10, [x19, #3024]
	cmp	w10, #2                 // =2
	b.ne	.LBB2_162
// %bb.140:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	x10, [x19, #16]
	ldrb	w10, [x10, #2182]
	tbz	w10, #0, .LBB2_162
// %bb.141:                             //   in Loop: Header=BB2_4 Depth=1
	cmp	w8, #3                  // =3
	b.ne	.LBB2_143
.LBB2_142:                              //   in Loop: Header=BB2_4 Depth=1
	stp	w25, w25, [x29, #-16]
	b	.LBB2_162
.LBB2_143:                              //   in Loop: Header=BB2_4 Depth=1
	mov	w10, #1
	sub	x11, x29, #16           // =16
	sub	w10, w10, w8
	cmp	w8, #2                  // =2
	str	w25, [x11, x8, lsl #2]
	b.lo	.LBB2_147
// %bb.144:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	x11, [x19, #136]
	ldr	x12, [x11]
	ldr	w11, [x19, #1236]
	ldr	w12, [x12, #16]
	sub	w12, w11, w12
	b	.LBB2_148
.LBB2_145:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x9, [x19, #3032]
	mov	w10, #192
	madd	x10, x8, x10, x9
	add	x9, x10, #168           // =168
	add	x10, x10, #176          // =176
	b	.LBB2_125
.LBB2_146:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x10, [x19, #3032]
	mov	w11, #192
	madd	x10, x8, x11, x10
	ldp	w11, w10, [x10, #180]
	subs	w10, w11, w10
	csel	w10, wzr, w10, lo
	b	.LBB2_131
.LBB2_147:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x11, [x19, #3032]
	mov	w12, #192
	umaddl	x12, w10, w12, x11
	ldp	w11, w12, [x12, #180]
	subs	w12, w11, w12
	csel	w12, wzr, w12, lo
.LBB2_148:                              //   in Loop: Header=BB2_4 Depth=1
	mov	w13, #34079
	add	w11, w11, w11, lsl #2
	movk	w13, #20971, lsl #16
	lsl	w11, w11, #3
	umull	x11, w11, w13
	lsr	x11, x11, #37
	cmp	w12, w11
	b.ls	.LBB2_162
// %bb.149:                             //   in Loop: Header=BB2_4 Depth=1
	cmp	w8, #2                  // =2
	b.lo	.LBB2_151
// %bb.150:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	x12, [x19, #136]
	ldr	x11, [x12, #8]
	add	x12, x12, #104          // =104
	add	x11, x11, #4            // =4
	b	.LBB2_152
.LBB2_151:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x11, [x19, #3032]
	mov	w12, #192
	umaddl	x12, w10, w12, x11
	add	x11, x12, #168          // =168
	add	x12, x12, #176          // =176
.LBB2_152:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w12, [x12]
	ldr	w11, [x11]
	subs	w11, w11, w12
	b.hs	.LBB2_154
// %bb.153:                             //   in Loop: Header=BB2_4 Depth=1
	mov	w11, wzr
	b	.LBB2_155
.LBB2_154:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w12, [x19, #1184]
	lsl	w11, w11, w12
.LBB2_155:                              //   in Loop: Header=BB2_4 Depth=1
	cmp	w8, #2                  // =2
	b.lo	.LBB2_157
// %bb.156:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [x19, #136]
	ldr	w12, [x19, #1236]
	ldr	x8, [x8]
	ldr	w8, [x8, #16]
	sub	w8, w12, w8
	b	.LBB2_158
.LBB2_157:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [x19, #3032]
	mov	w12, #192
	umaddl	x8, w10, w12, x8
	ldp	w12, w8, [x8, #180]
	subs	w8, w12, w8
	csel	w8, wzr, w8, lo
.LBB2_158:                              //   in Loop: Header=BB2_4 Depth=1
	mov	w12, #34079
	add	w8, w8, w8, lsl #2
	movk	w12, #20971, lsl #16
	lsl	w8, w8, #3
	umull	x8, w8, w12
	lsr	x8, x8, #37
	cmp	w11, w8
	b.hs	.LBB2_162
// %bb.159:                             //   in Loop: Header=BB2_4 Depth=1
	sub	x13, x29, #16           // =16
	mov	w8, w10
	ldr	w11, [x13, w10, uxtw #2]
	cmp	w11, w26
	b.ne	.LBB2_161
// %bb.160:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	w11, [x19, #1752]
	str	w11, [x13, x8, lsl #2]
.LBB2_161:                              //   in Loop: Header=BB2_4 Depth=1
	mov	w10, w11
	mov	w12, w9
	sub	x10, x10, x12
	sub	w11, w11, w9
	cmp	x10, x12
	csel	w9, w9, w11, lt
	str	w9, [x13, x8, lsl #2]
.LBB2_162:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [x19, #2016]
	ldr	w9, [x8, #188]
	add	w9, w9, #1              // =1
	str	w9, [x8, #188]
	ldr	x10, [x19, #136]
	ldr	w9, [x19, #1236]
	ldr	x12, [x19, #2016]
	ldr	w13, [x19, #1240]
	ldr	w11, [x19, #1168]
	ldr	x14, [x10, #8]
	ldr	w4, [x12, #188]
	sub	w12, w9, w13
	ldr	w10, [x10, #100]
	ldr	w8, [x19, #1508]
	mul	x13, x11, x9
	ldr	w5, [x14, #8]
	mul	x11, x12, x11
	ldr	w9, [x19, #1192]
	lsr	x2, x13, #20
	lsr	x3, x11, #20
	cmn	w10, #1                 // =1
	b.eq	.LBB2_164
// %bb.163:                             //   in Loop: Header=BB2_4 Depth=1
	udiv	w6, w10, w9
	mov	w22, #-1
	b	.LBB2_165
.LBB2_164:                              //   in Loop: Header=BB2_4 Depth=1
	mov	w22, #-1
	mov	w6, w22
.LBB2_165:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	w10, [x19, #1188]
	cmp	w8, #2                  // =2
	ldrsw	x11, [x19, #1284]
	adrp	x1, .L.str.13
	ldr	w12, [x19, #1184]
	mov	x0, x19
	ldrsw	x13, [x19, #1272]
	add	x1, x1, :lo12:.L.str.13
	mul	w10, w10, w9
	cset	w21, eq
	sub	x10, x10, #1            // =1
	add	x11, x10, x11
	add	x10, x10, x13
	asr	x11, x11, x12
	asr	x10, x10, x12
	udiv	w7, w11, w9
	udiv	w8, w10, w9
	str	w8, [sp]
	bl	f2fs_printk
	mov	x0, x19
	mov	w1, w21
	mov	w2, #1
	mov	w3, wzr
	mov	w4, w22
	bl	f2fs_gc
	cbz	w0, .LBB2_169
// %bb.166:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [x19, #3024]
	ldr	w25, [x19, #1756]
	cmp	w8, #2                  // =2
	stur	w25, [x29, #-60]
	b.ne	.LBB2_169
// %bb.167:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB2_169
// %bb.168:                             //   in Loop: Header=BB2_4 Depth=1
	stp	w25, w25, [x29, #-16]
.LBB2_169:                              //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [x19, #136]
	ldr	x21, [x19]
	ldp	x8, x9, [x8, #8]
	ldr	w23, [x8, #4]
	adrp	x8, __tracepoint_f2fs_background_gc
	add	x8, x8, :lo12:__tracepoint_f2fs_background_gc
	ldr	w22, [x9, #140]
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB2_175
// %bb.170:                             //   in Loop: Header=BB2_4 Depth=1
	adrp	x9, cpu_number
	//APP
	.if 1 == 1
661:
	mrs x8, tpidr_el1
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 11
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	mrs x8, tpidr_el2
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	add	x9, x9, :lo12:cpu_number
	adrp	x10, __cpu_online_mask
	add	x10, x10, :lo12:__cpu_online_mask
	ldr	w8, [x8, x9]
	add	w9, w8, #63             // =63
	cmp	w8, #0                  // =0
	csel	w9, w9, w8, lt
	asr	w9, w9, #6
	ldr	x9, [x10, w9, sxtw #3]
	lsr	x8, x9, x8
	tbz	w8, #0, .LBB2_175
// %bb.171:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	x9, [sp, #40]           // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	add	w8, w8, #1              // =1
	str	w8, [x9, #80]
	adrp	x8, __tracepoint_f2fs_background_gc
	add	x8, x8, :lo12:__tracepoint_f2fs_background_gc
	//APP
	//NO_APP
	ldr	x20, [x8, #32]
	cbz	x20, .LBB2_173
.LBB2_172:                              //   Parent Loop BB2_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x8, x0, [x20]
	mov	x1, x21
	mov	w2, w25
	mov	w3, w22
	mov	w4, w23
	blr	x8
	ldr	x8, [x20, #24]!
	cbnz	x8, .LBB2_172
.LBB2_173:                              //   in Loop: Header=BB2_4 Depth=1
	//APP
	//NO_APP
	adrp	x20, system_freezing_cnt
	ldr	x9, [sp, #40]           // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	b.ne	.LBB2_175
// %bb.174:                             //   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	ldr	x8, [x8]
	tbnz	w8, #1, .LBB2_177
.LBB2_175:                              //   in Loop: Header=BB2_4 Depth=1
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_balance_fs_bg
	b	.LBB2_2
.LBB2_176:                              //   in Loop: Header=BB2_4 Depth=1
	bl	preempt_schedule_notrace
	b	.LBB2_16
.LBB2_177:                              //   in Loop: Header=BB2_4 Depth=1
	bl	preempt_schedule_notrace
	b	.LBB2_175
.LBB2_178:
	ldr	x0, [x19]
	mov	w1, #1
	bl	__sb_end_write
.LBB2_179:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB2_181
// %bb.180:
	ldp	x20, x19, [sp, #208]    // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x22, x21, [sp, #192]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #176]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #160]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #144]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #224            // =224
	ret
.LBB2_181:
	bl	__stack_chk_fail
.Lfunc_end2:
	.size	gc_thread_func, .Lfunc_end2-gc_thread_func
                                        // -- End function
	.globl	f2fs_stop_gc_thread     // -- Begin function f2fs_stop_gc_thread
	.p2align	3
	.type	f2fs_stop_gc_thread,@function
f2fs_stop_gc_thread:                    // @f2fs_stop_gc_thread
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	str	x19, [sp, #16]          // 8-byte Folded Spill
	mov	x19, x0
	ldr	x0, [x0, #1712]
	mov	x29, sp
	cbz	x0, .LBB3_2
// %bb.1:
	bl	kthread_stop
	add	x0, x19, #1776          // =1776
	mov	w1, #3
	mov	w2, wzr
	mov	x3, xzr
	str	xzr, [x19, #1712]
	bl	__wake_up
.LBB3_2:
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end3:
	.size	f2fs_stop_gc_thread, .Lfunc_end3-f2fs_stop_gc_thread
                                        // -- End function
	.globl	f2fs_start_bidx_of_node // -- Begin function f2fs_start_bidx_of_node
	.p2align	3
	.type	f2fs_start_bidx_of_node,@function
f2fs_start_bidx_of_node:                // @f2fs_start_bidx_of_node
// %bb.0:
	cbz	w0, .LBB4_14
// %bb.1:
	cmp	w0, #2                  // =2
	b.hi	.LBB4_3
// %bb.2:
	sub	w8, w0, #1              // =1
	b	.LBB4_6
.LBB4_3:
	cmp	w0, #2040               // =2040
	b.hi	.LBB4_5
// %bb.4:
	mov	w9, #37367
	sub	w8, w0, #4              // =4
	movk	w9, #321, lsl #16
	umull	x9, w8, w9
	lsr	x9, x9, #32
	sub	w8, w8, w9
	add	w8, w9, w8, lsr #1
	sub	w8, w0, w8, lsr #9
	sub	w8, w8, #2              // =2
	b	.LBB4_6
.LBB4_5:
	mov	w9, #37367
	sub	w8, w0, #2043           // =2043
	movk	w9, #321, lsl #16
	umull	x9, w8, w9
	lsr	x9, x9, #32
	sub	w8, w8, w9
	add	w8, w9, w8, lsr #1
	sub	w8, w0, w8, lsr #9
	sub	w8, w8, #5              // =5
.LBB4_6:
	ldrh	w9, [x1]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB4_9
// %bb.7:
	ldr	x11, [x1, #712]
	mov	w10, #1018
	tbz	w11, #31, .LBB4_10
// %bb.8:
	ldr	w11, [x1, #1268]
	neg	w11, w11
	and	w10, w11, w10
	b	.LBB4_10
.LBB4_9:
	mov	w10, #1018
.LBB4_10:
	ldr	w11, [x1, #1160]
	mul	w8, w10, w8
	ldr	w12, [x1, #1168]
	cmp	w9, #8, lsl #12         // =32768
	add	w10, w12, w11, asr #2
	mov	w11, #923
	sub	w10, w11, w10
	b.ne	.LBB4_13
// %bb.11:
	ldr	x9, [x1, #712]
	tbz	w9, #31, .LBB4_13
// %bb.12:
	ldr	w9, [x1, #1268]
	neg	w9, w9
	and	w10, w10, w9
.LBB4_13:
	add	w0, w10, w8
.LBB4_14:
	ret
.Lfunc_end4:
	.size	f2fs_start_bidx_of_node, .Lfunc_end4-f2fs_start_bidx_of_node
                                        // -- End function
	.globl	f2fs_set_dev_tag_for_page // -- Begin function f2fs_set_dev_tag_for_page
	.p2align	3
	.type	f2fs_set_dev_tag_for_page,@function
f2fs_set_dev_tag_for_page:              // @f2fs_set_dev_tag_for_page
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	ldr	w8, [x0, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB5_3
// %bb.1:
	ldr	x8, [x0, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB5_3
// %bb.2:
	ldr	x8, [x0, #1712]
	//APP
	mrs x25, sp_el0
	//NO_APP
	cmp	x8, x25
	b.eq	.LBB5_4
.LBB5_3:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB5_4:
	ldr	w8, [x0, #3308]
	cmp	w8, #1                  // =1
	b.eq	.LBB5_10
// %bb.5:
	cbnz	w8, .LBB5_20
// %bb.6:
	ldr	w9, [x0, #3312]
	ldr	x8, [x1]
	cbz	w9, .LBB5_14
// %bb.7:
	tbnz	w8, #13, .LBB5_9
// %bb.8:
	ldr	x8, [x1, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x1, x9, eq
	add	x8, x8, #52             // =52
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x1]
1:	ldxr	x8, [x1]
	orr	x8, x8, 8192
	stxr	w9, x8, [x1]
	cbnz	w9, 1b
	//NO_APP
	str	xzr, [x1, #40]
.LBB5_9:
	add	x8, x1, #40             // =40
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 128
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB5_20
.LBB5_10:
	ldr	w9, [x0, #3312]
	ldr	x8, [x1]
	cbz	w9, .LBB5_17
// %bb.11:
	tbnz	w8, #13, .LBB5_13
// %bb.12:
	ldr	x8, [x1, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x1, x9, eq
	add	x8, x8, #52             // =52
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x1]
1:	ldxr	x8, [x1]
	orr	x8, x8, 8192
	stxr	w9, x8, [x1]
	cbnz	w9, 1b
	//NO_APP
	str	xzr, [x1, #40]
.LBB5_13:
	add	x8, x1, #40             // =40
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 64
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB5_20
.LBB5_14:
	tbnz	w8, #13, .LBB5_16
// %bb.15:
	ldr	x8, [x1, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x1, x9, eq
	add	x8, x8, #52             // =52
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x1]
1:	ldxr	x8, [x1]
	orr	x8, x8, 8192
	stxr	w9, x8, [x1]
	cbnz	w9, 1b
	//NO_APP
	str	xzr, [x1, #40]
.LBB5_16:
	add	x8, x1, #40             // =40
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 64
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB5_20
.LBB5_17:
	tbnz	w8, #13, .LBB5_19
// %bb.18:
	ldr	x8, [x1, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x1, x9, eq
	add	x8, x8, #52             // =52
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x1]
1:	ldxr	x8, [x1]
	orr	x8, x8, 8192
	stxr	w9, x8, [x1]
	cbnz	w9, 1b
	//NO_APP
	str	xzr, [x1, #40]
.LBB5_19:
	add	x8, x1, #40             // =40
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 128
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB5_20:
	ldr	w19, [x0, #3308]
	ldr	w20, [x0, #3312]
	ldr	x8, [x1, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x1, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB5_22
// %bb.21:
	ldr	x8, [x1]
	tbnz	w8, #10, .LBB5_31
.LBB5_22:
	ldr	x8, [x1, #24]
.LBB5_23:
	ldr	x9, [x8]
	adrp	x8, __tracepoint_f2fs_set_page_dev_tag
	add	x8, x8, :lo12:__tracepoint_f2fs_set_page_dev_tag
	ldr	x21, [x1, #32]
	ldr	x22, [x0, #3032]
	ldr	x23, [x9, #64]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB5_3
// %bb.24:
	adrp	x10, cpu_number
	//APP
	.if 1 == 1
661:
	mrs x9, tpidr_el1
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 11
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	mrs x9, tpidr_el2
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	add	x10, x10, :lo12:cpu_number
	adrp	x11, __cpu_online_mask
	add	x11, x11, :lo12:__cpu_online_mask
	ldr	w9, [x9, x10]
	add	w10, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w10, w10, w9, lt
	asr	w10, w10, #6
	ldr	x10, [x11, w10, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB5_3
// %bb.25:
	ldr	w9, [x25, #80]
	add	w9, w9, #1              // =1
	str	w9, [x25, #80]
	//APP
	//NO_APP
	ldr	x26, [x8, #32]
	cbz	x26, .LBB5_28
// %bb.26:
	ldr	x8, [x26], #24
	add	x24, x22, #192          // =192
.LBB5_27:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x26, #-16]
	mov	w1, w19
	mov	w2, w20
	mov	x3, x23
	mov	x4, x21
	mov	x5, x22
	mov	x6, x24
	blr	x8
	ldr	x8, [x26], #24
	cbnz	x8, .LBB5_27
.LBB5_28:
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x25, #80]
	b.ne	.LBB5_3
// %bb.29:
	ldr	x8, [x25]
	tbz	w8, #1, .LBB5_3
// %bb.30:
	bl	preempt_schedule_notrace
	b	.LBB5_3
.LBB5_31:
	mov	x21, x0
	mov	x0, x1
	mov	x22, x1
	bl	__page_file_mapping
	mov	x1, x22
	mov	x8, x0
	mov	x0, x21
	b	.LBB5_23
.Lfunc_end5:
	.size	f2fs_set_dev_tag_for_page, .Lfunc_end5-f2fs_set_dev_tag_for_page
                                        // -- End function
	.globl	f2fs_set_dev_tag_for_fio // -- Begin function f2fs_set_dev_tag_for_fio
	.p2align	3
	.type	f2fs_set_dev_tag_for_fio,@function
f2fs_set_dev_tag_for_fio:               // @f2fs_set_dev_tag_for_fio
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	ldr	x8, [x0, #40]
	ldr	x8, [x8, #1104]
	ldr	w9, [x8, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB6_14
// %bb.1:
	ldr	x9, [x8, #16]
	ldrb	w9, [x9, #2182]
	tbz	w9, #0, .LBB6_14
// %bb.2:
	ldr	x9, [x8, #1712]
	//APP
	mrs x10, sp_el0
	//NO_APP
	cmp	x9, x10
	b.eq	.LBB6_7
// %bb.3:
	ldr	x9, [x0, #712]
	tbnz	x9, #40, .LBB6_10
// %bb.4:
	ldr	x9, [x0, #712]
	tbnz	x9, #42, .LBB6_6
// %bb.5:
	ldr	x9, [x8, #3032]
	ldr	w10, [x9, #84]
	cmp	w10, w2
	b.ls	.LBB6_12
.LBB6_6:
	mov	w9, #1
	b	.LBB6_13
.LBB6_7:
	ldr	w9, [x8, #3308]
	cmp	w9, #1                  // =1
	b.eq	.LBB6_11
// %bb.8:
	cbnz	w9, .LBB6_14
// %bb.9:
	ldr	w9, [x8, #3312]
	cmp	w9, #0                  // =0
	cset	w9, ne
	b	.LBB6_13
.LBB6_10:
	str	wzr, [x1, #136]
	b	.LBB6_14
.LBB6_11:
	ldr	w9, [x8, #3312]
	cmp	w9, #0                  // =0
	cset	w9, eq
	b	.LBB6_13
.LBB6_12:
	ldr	w9, [x9, #88]
	cmp	w9, w2
	cset	w9, lo
.LBB6_13:
	str	w9, [x1, #136]
.LBB6_14:
	adrp	x9, __tracepoint_f2fs_set_fio_dev_tag
	ldr	w19, [x8, #3308]
	add	x9, x9, :lo12:__tracepoint_f2fs_set_fio_dev_tag
	ldr	w20, [x8, #3312]
	ldr	w21, [x1, #8]
	ldr	w22, [x1, #136]
	ldr	x23, [x8, #3032]
	ldr	w8, [x9, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB6_21
// %bb.15:
	adrp	x10, cpu_number
	//APP
	.if 1 == 1
661:
	mrs x8, tpidr_el1
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 11
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	mrs x8, tpidr_el2
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	add	x10, x10, :lo12:cpu_number
	adrp	x11, __cpu_online_mask
	add	x11, x11, :lo12:__cpu_online_mask
	ldr	w8, [x8, x10]
	add	w10, w8, #63            // =63
	cmp	w8, #0                  // =0
	csel	w10, w10, w8, lt
	asr	w10, w10, #6
	ldr	x10, [x11, w10, sxtw #3]
	lsr	x8, x10, x8
	tbz	w8, #0, .LBB6_21
// %bb.16:
	//APP
	mrs x25, sp_el0
	//NO_APP
	ldr	w8, [x25, #80]
	add	w8, w8, #1              // =1
	str	w8, [x25, #80]
	//APP
	//NO_APP
	ldr	x26, [x9, #32]
	cbz	x26, .LBB6_19
// %bb.17:
	ldr	x8, [x26], #24
	add	x24, x23, #192          // =192
.LBB6_18:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x26, #-16]
	mov	w1, w19
	mov	w2, w20
	mov	x3, x21
	mov	x4, x22
	mov	x5, x23
	mov	x6, x24
	blr	x8
	ldr	x8, [x26], #24
	cbnz	x8, .LBB6_18
.LBB6_19:
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x25, #80]
	b.ne	.LBB6_21
// %bb.20:
	ldr	x8, [x25]
	tbnz	w8, #1, .LBB6_22
.LBB6_21:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB6_22:
	bl	preempt_schedule_notrace
	b	.LBB6_21
.Lfunc_end6:
	.size	f2fs_set_dev_tag_for_fio, .Lfunc_end6-f2fs_set_dev_tag_for_fio
                                        // -- End function
	.globl	f2fs_gc                 // -- Begin function f2fs_gc
	.p2align	3
	.type	f2fs_gc,@function
f2fs_gc:                                // @f2fs_gc
// %bb.0:
	sub	sp, sp, #368            // =368
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #272]    // 16-byte Folded Spill
	add	x29, sp, #272           // =272
	stp	x28, x27, [sp, #288]    // 16-byte Folded Spill
	sub	x9, x29, #88            // =88
	stp	x26, x25, [sp, #304]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	x11, xzr
	stp	x24, x23, [sp, #320]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #336]    // 16-byte Folded Spill
	mov	w22, w3
	stp	x20, x19, [sp, #352]    // 16-byte Folded Spill
	mov	x19, x0
	stur	w2, [x29, #-100]        // 4-byte Folded Spill
	stur	x8, [x29, #-16]
	stp	x9, x9, [x29, #-88]
	mov	x9, #274877906944
	ldr	x10, [x0, #1896]
	movk	x9, #96, lsl #48
	ldr	w8, [x0, #3024]
	str	w4, [sp, #60]           // 4-byte Folded Spill
	stur	w4, [x29, #-20]
	str	x10, [sp, #88]          // 8-byte Folded Spill
	ldr	w10, [x0, #3308]
	cmp	w8, #2                  // =2
	stp	x9, xzr, [x29, #-72]
	str	w10, [sp, #100]         // 4-byte Folded Spill
	b.ne	.LBB7_4
// %bb.1:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbnz	w8, #0, .LBB7_3
// %bb.2:
	mov	x11, xzr
	b	.LBB7_4
.LBB7_3:
	adrp	x8, vm_node_stat
	str	xzr, [x19, #1984]
	add	x8, x8, :lo12:vm_node_stat
	ldr	x8, [x8, #128]
	bic	x11, x8, x8, asr #63
.LBB7_4:
	and	w8, w1, #0x1
	str	x11, [sp, #40]          // 8-byte Folded Spill
	str	w1, [sp, #108]          // 4-byte Folded Spill
	stur	w8, [x29, #-96]         // 4-byte Folded Spill
	bl	sched_clock
	str	x0, [sp, #48]           // 8-byte Folded Spill
	adrp	x8, __tracepoint_f2fs_gc_begin
	ldr	x24, [x19]
	add	x8, x8, :lo12:__tracepoint_f2fs_gc_begin
	ldrsw	x26, [x19, #1284]
	ldrsw	x20, [x19, #1272]
	ldrsw	x28, [x19, #1296]
	ldr	x9, [x19, #136]
	ldp	x10, x11, [x9, #8]
	ldr	w13, [x9, #100]
	ldp	w21, w25, [x10, #4]
	ldr	w23, [x11, #140]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB7_11
// %bb.5:
	adrp	x10, cpu_number
	//APP
	.if 1 == 1
661:
	mrs x9, tpidr_el1
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 11
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	mrs x9, tpidr_el2
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	add	x10, x10, :lo12:cpu_number
	adrp	x11, __cpu_online_mask
	add	x11, x11, :lo12:__cpu_online_mask
	ldr	w9, [x9, x10]
	add	w10, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w10, w10, w9, lt
	asr	w10, w10, #6
	ldr	x10, [x11, w10, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB7_11
// %bb.6:
	stur	w22, [x29, #-112]       // 4-byte Folded Spill
	//APP
	mrs x10, sp_el0
	//NO_APP
	ldr	w9, [x10, #80]
	stur	x10, [x29, #-120]       // 8-byte Folded Spill
	add	w9, w9, #1              // =1
	str	w9, [x10, #80]
	//APP
	//NO_APP
	ldr	x27, [x8, #32]
	ldr	w9, [sp, #108]          // 4-byte Folded Reload
	ldur	w10, [x29, #-100]       // 4-byte Folded Reload
	cbz	x27, .LBB7_9
// %bb.7:
	ldr	x8, [x27], #24
.LBB7_8:                                // =>This Inner Loop Header: Depth=1
	ldur	x0, [x27, #-16]
	and	w2, w9, #0x1
	and	w3, w10, #0x1
	mov	x1, x24
	mov	x4, x26
	mov	x5, x20
	mov	x6, x28
	mov	w7, w25
	str	w23, [sp, #16]
	mov	w22, w13
	str	w13, [sp, #8]
	str	w21, [sp]
	blr	x8
	ldur	w10, [x29, #-100]       // 4-byte Folded Reload
	mov	w13, w22
	ldr	w9, [sp, #108]          // 4-byte Folded Reload
	ldr	x8, [x27], #24
	cbnz	x8, .LBB7_8
.LBB7_9:
	//APP
	//NO_APP
	ldur	x9, [x29, #-120]        // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	ldur	w22, [x29, #-112]       // 4-byte Folded Reload
	b.ne	.LBB7_11
// %bb.10:
	ldr	x8, [x9]
	tbnz	w8, #1, .LBB7_240
.LBB7_11:
	stur	wzr, [x29, #-120]       // 4-byte Folded Spill
	mov	w11, #2
	str	wzr, [sp, #132]         // 4-byte Folded Spill
	mov	w8, wzr
	str	wzr, [sp, #120]         // 4-byte Folded Spill
	mov	w24, wzr
	stur	wzr, [x29, #-124]       // 4-byte Folded Spill
	str	wzr, [sp, #56]          // 4-byte Folded Spill
	ldr	w9, [x19, #1424]
	ldr	x10, [x19, #80]
	str	xzr, [x19, #1904]
	tst	w9, #0x1000
	mov	w9, #4
	csel	w9, w9, w11, eq
	tst	x10, #0x2
	csinc	w9, w9, wzr, eq
	sub	x10, x29, #88           // =88
	stur	w9, [x29, #-56]
	add	x9, x10, #16            // =16
	str	x9, [sp, #64]           // 8-byte Folded Spill
	//APP
	mrs x9, sp_el0
	//NO_APP
	stp	x9, x19, [sp, #72]      // 16-byte Folded Spill
	and	w9, w22, #0x1
	str	w9, [sp, #104]          // 4-byte Folded Spill
	ldr	x9, [sp, #88]           // 8-byte Folded Reload
	str	x9, [sp, #112]          // 8-byte Folded Spill
.LBB7_12:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB7_14 Depth 2
                                        //       Child Loop BB7_19 Depth 3
                                        //       Child Loop BB7_30 Depth 3
	and	w8, w8, #0xff
	str	w8, [sp, #96]           // 4-byte Folded Spill
	b	.LBB7_14
.LBB7_13:                               //   in Loop: Header=BB7_14 Depth=2
	sub	x1, x29, #56            // =56
	mov	x0, x19
	bl	f2fs_write_checkpoint
	mov	w24, wzr
	mov	w8, #1
	stur	w8, [x29, #-120]        // 4-byte Folded Spill
	cbnz	w0, .LBB7_195
.LBB7_14:                               //   Parent Loop BB7_12 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB7_19 Depth 3
                                        //       Child Loop BB7_30 Depth 3
	ldr	w8, [x19, #3024]
	ldur	w22, [x29, #-96]        // 4-byte Folded Reload
	stur	w24, [x29, #-112]       // 4-byte Folded Spill
	cmp	w8, #2                  // =2
	b.ne	.LBB7_33
// %bb.15:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB7_22
// %bb.16:                              //   in Loop: Header=BB7_14 Depth=2
	ldur	x21, [x29, #-88]
	sub	x8, x29, #88            // =88
	cmp	x21, x8
	b.eq	.LBB7_22
// %bb.17:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x21]
	mov	x20, #256
	ldr	x22, [sp, #64]          // 8-byte Folded Reload
	movk	x20, #57005, lsl #48
	adrp	x23, f2fs_inode_entry_slab
	sub	x24, x29, #88           // =88
	b	.LBB7_19
.LBB7_18:                               //   in Loop: Header=BB7_19 Depth=3
	add	x8, x20, #256           // =256
	mov	x1, x21
	stp	x20, x8, [x21]
	ldr	x0, [x23, :lo12:f2fs_inode_entry_slab]
	bl	kmem_cache_free
	ldr	x8, [x19]
	mov	x21, x19
	cmp	x19, x24
	b.eq	.LBB7_21
.LBB7_19:                               //   Parent Loop BB7_12 Depth=1
                                        //     Parent Loop BB7_14 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x9, [x21, #16]
	mov	x0, x22
	mov	x19, x8
	ldr	x1, [x9, #64]
	bl	radix_tree_delete
	ldr	x0, [x21, #16]
	bl	iput
	mov	x0, x21
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB7_18
// %bb.20:                              //   in Loop: Header=BB7_19 Depth=3
	ldp	x9, x8, [x21]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB7_18
.LBB7_21:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	x19, [sp, #80]          // 8-byte Folded Reload
	ldur	w22, [x29, #-96]        // 4-byte Folded Reload
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB7_33
.LBB7_22:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	x9, [x19, #16]
	ldr	w10, [sp, #100]         // 4-byte Folded Reload
	ldr	w8, [x9, #2180]
	cmp	w10, #3                 // =3
	b.ne	.LBB7_25
// %bb.23:                              //   in Loop: Header=BB7_14 Depth=2
	tbz	w8, #16, .LBB7_25
// %bb.24:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w8, [sp, #96]           // 4-byte Folded Reload
	str	w8, [x19, #3308]
	ldr	w8, [x9, #2180]
.LBB7_25:                               //   in Loop: Header=BB7_14 Depth=2
	tbz	w8, #16, .LBB7_33
// %bb.26:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x28, [x19]
	ldrsw	x21, [x19, #1284]
	ldrsw	x20, [x19, #1272]
	ldrsw	x25, [x19, #1296]
	ldr	x8, [x19, #136]
	ldr	w13, [x19, #3308]
	ldp	x9, x10, [x8, #8]
	ldr	w27, [x8, #100]
	adrp	x8, __tracepoint_f2fs_gc_device
	add	x8, x8, :lo12:__tracepoint_f2fs_gc_device
	ldp	w24, w23, [x9, #4]
	ldr	w14, [x10, #140]
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB7_33
// %bb.27:                              //   in Loop: Header=BB7_14 Depth=2
	adrp	x9, cpu_number
	//APP
	.if 1 == 1
661:
	mrs x8, tpidr_el1
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 11
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	mrs x8, tpidr_el2
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	add	x9, x9, :lo12:cpu_number
	adrp	x10, __cpu_online_mask
	add	x10, x10, :lo12:__cpu_online_mask
	ldr	w8, [x8, x9]
	add	w9, w8, #63             // =63
	cmp	w8, #0                  // =0
	csel	w9, w9, w8, lt
	asr	w9, w9, #6
	ldr	x9, [x10, w9, sxtw #3]
	lsr	x8, x9, x8
	tbz	w8, #0, .LBB7_33
// %bb.28:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x9, [sp, #72]           // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	add	w8, w8, #1              // =1
	str	w8, [x9, #80]
	adrp	x8, __tracepoint_f2fs_gc_device
	add	x8, x8, :lo12:__tracepoint_f2fs_gc_device
	//APP
	//NO_APP
	ldr	x19, [x8, #32]
	ldr	w26, [sp, #108]         // 4-byte Folded Reload
	ldur	w9, [x29, #-100]        // 4-byte Folded Reload
	cbz	x19, .LBB7_31
// %bb.29:                              //   in Loop: Header=BB7_14 Depth=2
	str	w14, [sp, #136]         // 4-byte Folded Spill
.LBB7_30:                               //   Parent Loop BB7_12 Depth=1
                                        //     Parent Loop BB7_14 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldp	x8, x0, [x19]
	and	w2, w26, #0x1
	and	w3, w9, #0x1
	mov	x1, x28
	mov	x4, x21
	mov	x5, x20
	mov	x6, x25
	mov	w7, w23
	str	w13, [sp, #24]
	str	w14, [sp, #16]
	mov	w22, w13
	str	w27, [sp, #8]
	str	w24, [sp]
	blr	x8
	ldur	w9, [x29, #-100]        // 4-byte Folded Reload
	mov	w13, w22
	ldr	w14, [sp, #136]         // 4-byte Folded Reload
	ldr	x8, [x19, #24]!
	cbnz	x8, .LBB7_30
.LBB7_31:                               //   in Loop: Header=BB7_14 Depth=2
	//APP
	//NO_APP
	ldp	x9, x19, [sp, #72]      // 16-byte Folded Reload
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	ldur	w22, [x29, #-96]        // 4-byte Folded Reload
	b.ne	.LBB7_33
// %bb.32:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [sp, #72]           // 8-byte Folded Reload
	ldr	x8, [x8]
	tbnz	w8, #1, .LBB7_170
.LBB7_33:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19]
	ldrb	w8, [x8, #83]
	tbz	w8, #6, .LBB7_199
// %bb.34:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #224]
	mov	w27, #48
	ldur	w24, [x29, #-112]       // 4-byte Folded Reload
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB7_200
// %bb.35:                              //   in Loop: Header=BB7_14 Depth=2
	cbnz	w22, .LBB7_66
// %bb.36:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w22, [x19, #1192]
	ldr	w21, [x19, #1188]
	ldrsw	x26, [x19, #1284]
	ldr	w25, [x19, #1184]
	ldrsw	x27, [x19, #1272]
	ldrsw	x28, [x19, #1296]
	ldr	x8, [x19, #80]
	tbnz	w8, #3, .LBB7_48
// %bb.37:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #136]
	ldr	x9, [x8, #8]
	ldr	w10, [x8, #100]
	ldr	w9, [x9, #8]
	cmn	w10, #1                 // =1
	b.eq	.LBB7_39
// %bb.38:                              //   in Loop: Header=BB7_14 Depth=2
	udiv	w11, w10, w22
	cmp	w9, w11
	b.eq	.LBB7_40
	b	.LBB7_44
.LBB7_39:                               //   in Loop: Header=BB7_14 Depth=2
	mov	w11, #-1
                                        // kill: def $w11 killed $w11 killed $x11
	cmp	w9, w11
	b.ne	.LBB7_44
.LBB7_40:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [x19, #1284]
	mov	w16, #48
	ldr	w14, [x19, #1272]
	ldr	w20, [x19, #1272]
	ldr	x11, [x8, #24]
	ldr	x12, [x8]
	add	w13, w14, w13
	ldr	w15, [x11, #460]
	ldr	x12, [x12, #136]
	madd	x15, x15, x16, x12
	ldrh	w15, [x15, #2]
	and	w15, w15, #0x3ff
	sub	w14, w21, w15
	cmp	w14, w13
	b.lo	.LBB7_44
// %bb.41:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w14, [x11, #580]
	madd	x14, x14, x16, x12
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w14, w21, w14
	cmp	w14, w13
	b.lo	.LBB7_44
// %bb.42:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w14, [x11, #700]
	madd	x14, x14, x16, x12
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w14, w21, w14
	cmp	w14, w13
	b.lo	.LBB7_44
// %bb.43:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [x11, #100]
	mov	w23, #48
	madd	x12, x13, x16, x12
	ldrh	w12, [x12, #2]
	and	w12, w12, #0x3ff
	sub	w12, w21, w12
	cmp	w12, w20
	b.hs	.LBB7_146
.LBB7_44:                               //   in Loop: Header=BB7_14 Depth=2
	mul	w11, w21, w22
	cmn	w10, #1                 // =1
	sub	x11, x11, #1            // =1
	add	x13, x11, x27
	add	x12, x11, x26
	asr	x13, x13, x25
	add	x11, x11, x28
	asr	x12, x12, x25
	udiv	w13, w13, w22
	asr	x11, x11, x25
	udiv	w12, w12, w22
	udiv	w11, w11, w22
	add	w12, w12, w13, lsl #1
	add	w11, w12, w11
	b.eq	.LBB7_46
// %bb.45:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w12, [x19, #1192]
	udiv	w10, w10, w12
	b	.LBB7_47
.LBB7_46:                               //   in Loop: Header=BB7_14 Depth=2
	mov	w10, #-1
                                        // kill: def $w10 killed $w10 killed $x10
.LBB7_47:                               //   in Loop: Header=BB7_14 Depth=2
	add	w10, w11, w10
	cmp	w9, w10
	b.ls	.LBB7_50
.LBB7_48:                               //   in Loop: Header=BB7_14 Depth=2
	ldur	w8, [x29, #-100]        // 4-byte Folded Reload
	mov	w22, wzr
	tbz	w8, #0, .LBB7_196
// %bb.49:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w27, #48
	b	.LBB7_66
.LBB7_50:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x8, #16]
	ldr	w8, [x8, #140]
	cbz	w8, .LBB7_53
// %bb.51:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #80]
	tbnz	w8, #8, .LBB7_53
// %bb.52:                              //   in Loop: Header=BB7_14 Depth=2
	sub	x1, x29, #56            // =56
	mov	x0, x19
	bl	f2fs_write_checkpoint
	cbnz	w0, .LBB7_198
.LBB7_53:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	w22, [x19, #1192]
	ldr	w28, [x19, #1188]
	ldrsw	x20, [x19, #1284]
	ldr	w25, [x19, #1184]
	ldrsw	x26, [x19, #1272]
	ldrsw	x27, [x19, #1296]
	ldr	x8, [x19, #80]
	tbnz	w8, #3, .LBB7_163
// %bb.54:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x11, [x19, #136]
	ldr	x8, [x11, #8]
	ldr	w9, [x11, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	b.eq	.LBB7_56
// %bb.55:                              //   in Loop: Header=BB7_14 Depth=2
	udiv	w10, w9, w22
	cmp	w8, w10
	b.eq	.LBB7_57
	b	.LBB7_61
.LBB7_56:                               //   in Loop: Header=BB7_14 Depth=2
	mov	w10, #-1
                                        // kill: def $w10 killed $w10 killed $x10
	cmp	w8, w10
	b.ne	.LBB7_61
.LBB7_57:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	w12, [x19, #1284]
	mov	w15, #48
	ldr	w13, [x19, #1272]
	ldr	w23, [x19, #1272]
	ldr	x10, [x11, #24]
	ldr	x11, [x11]
	add	w12, w13, w12
	ldr	w14, [x10, #460]
	ldr	x11, [x11, #136]
	madd	x14, x14, x15, x11
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w13, w28, w14
	cmp	w13, w12
	b.lo	.LBB7_61
// %bb.58:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [x10, #580]
	madd	x13, x13, x15, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w28, w13
	cmp	w13, w12
	b.lo	.LBB7_61
// %bb.59:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [x10, #700]
	madd	x13, x13, x15, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w28, w13
	cmp	w13, w12
	b.lo	.LBB7_61
// %bb.60:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w12, [x10, #100]
	mov	w24, #48
	madd	x11, x12, x15, x11
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w11, w28, w11
	cmp	w11, w23
	b.hs	.LBB7_158
.LBB7_61:                               //   in Loop: Header=BB7_14 Depth=2
	mul	w10, w28, w22
	cmn	w9, #1                  // =1
	sub	x10, x10, #1            // =1
	add	x12, x10, x26
	add	x11, x10, x20
	asr	x12, x12, x25
	add	x10, x10, x27
	asr	x11, x11, x25
	udiv	w12, w12, w22
	asr	x10, x10, x25
	udiv	w11, w11, w22
	udiv	w10, w10, w22
	add	w11, w11, w12, lsl #1
	add	w10, w11, w10
	b.eq	.LBB7_63
// %bb.62:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w11, [x19, #1192]
	udiv	w9, w9, w11
	b	.LBB7_64
.LBB7_63:                               //   in Loop: Header=BB7_14 Depth=2
	mov	w9, #-1
                                        // kill: def $w9 killed $w9 killed $x9
.LBB7_64:                               //   in Loop: Header=BB7_14 Depth=2
	add	w9, w10, w9
	ldur	w24, [x29, #-112]       // 4-byte Folded Reload
	cmp	w8, w9
	mov	w27, #48
	cset	w22, ls
	ldur	w8, [x29, #-100]        // 4-byte Folded Reload
	tbnz	w22, #0, .LBB7_66
.LBB7_65:                               //   in Loop: Header=BB7_14 Depth=2
	tbz	w8, #0, .LBB7_197
.LBB7_66:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB7_68
// %bb.67:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbnz	w8, #0, .LBB7_79
.LBB7_68:                               //   in Loop: Header=BB7_14 Depth=2
	mov	x0, x19
	bl	get_max_reclaimable_segments
	ldr	x8, [x19, #136]
	mov	w21, w0
	ldur	w20, [x29, #-124]       // 4-byte Folded Reload
	ldr	x8, [x8, #8]
	ldr	w8, [x8, #4]
.LBB7_69:                               //   in Loop: Header=BB7_14 Depth=2
	cbnz	w22, .LBB7_72
// %bb.70:                              //   in Loop: Header=BB7_14 Depth=2
	adrp	x9, write_opt
	ldr	w9, [x9, :lo12:write_opt]
	cbz	w9, .LBB7_72
// %bb.71:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w9, #100
	mul	w9, w21, w9
	udiv	w8, w9, w8
	cmp	w8, #29                 // =29
	b.ls	.LBB7_183
.LBB7_72:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
	add	x21, x8, #88            // =88
	mov	x0, x21
	bl	down_write
	ldr	x8, [x19, #136]
	sub	x1, x29, #20            // =20
	mov	x0, x19
	mov	w2, w22
	mov	w3, #11
	mov	w4, wzr
	mov	x5, xzr
	ldr	x8, [x8, #16]
	ldr	x8, [x8]
	ldr	x8, [x8]
	blr	x8
	mov	w28, w0
	mov	x0, x21
	bl	up_write
	cbnz	w28, .LBB7_187
// %bb.73:                              //   in Loop: Header=BB7_14 Depth=2
	ldrb	w8, [x19, #1992]
	ldur	w1, [x29, #-20]
	cbz	w8, .LBB7_75
// %bb.74:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w8, [x19, #1976]
	cmp	w1, w8
	b.ne	.LBB7_164
.LBB7_75:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	w4, [sp, #104]          // 4-byte Folded Reload
	sub	x2, x29, #88            // =88
	mov	x0, x19
	mov	w3, w22
	bl	do_garbage_collect
	mov	w28, w0
	cmp	w22, #1                 // =1
	stur	w22, [x29, #-96]        // 4-byte Folded Spill
	b.ne	.LBB7_78
// %bb.76:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w9, [x19, #1192]
	cmp	w28, w9
	b.ne	.LBB7_83
// %bb.77:                              //   in Loop: Header=BB7_14 Depth=2
	add	w24, w24, #1            // =1
	b	.LBB7_84
.LBB7_78:                               //   in Loop: Header=BB7_14 Depth=2
	add	w20, w28, w20
	mov	w22, w24
	stur	w20, [x29, #-124]       // 4-byte Folded Spill
	ldr	w8, [sp, #108]          // 4-byte Folded Reload
	tbz	w8, #0, .LBB7_91
	b	.LBB7_185
.LBB7_79:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	w1, [x19, #3308]
	mov	x0, x19
	bl	get_dev_max_reclaimable_segments
	ldr	w8, [x19, #3024]
	mov	w21, w0
	ldrsw	x2, [x19, #3308]
	ldur	w20, [x29, #-124]       // 4-byte Folded Reload
	cmp	w8, #2                  // =2
	b.ne	.LBB7_89
// %bb.80:                              //   in Loop: Header=BB7_14 Depth=2
	cmp	w2, #1                  // =1
	b.gt	.LBB7_89
// %bb.81:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #16]
	ldr	w8, [x8, #2180]
	tbz	w8, #16, .LBB7_89
// %bb.82:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #3032]
	mov	w9, #192
	madd	x8, x2, x9, x8
	ldr	w8, [x8, #168]
	b	.LBB7_69
.LBB7_83:                               //   in Loop: Header=BB7_14 Depth=2
	cbz	w28, .LBB7_165
.LBB7_84:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #1896]
	add	w20, w28, w20
	ldr	x9, [sp, #112]          // 8-byte Folded Reload
	cmp	x8, x9
	b.hi	.LBB7_86
// %bb.85:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x9, [x19, #1904]
	cbz	x9, .LBB7_87
.LBB7_86:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	w9, [sp, #132]          // 4-byte Folded Reload
	add	w9, w9, #1              // =1
	str	w9, [sp, #132]          // 4-byte Folded Spill
.LBB7_87:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	w9, [sp, #120]          // 4-byte Folded Reload
	stur	w20, [x29, #-124]       // 4-byte Folded Spill
	add	w9, w9, #1              // =1
	str	w9, [sp, #120]          // 4-byte Folded Spill
	cbz	w28, .LBB7_90
// %bb.88:                              //   in Loop: Header=BB7_14 Depth=2
	str	x8, [sp, #112]          // 8-byte Folded Spill
	mov	w22, w24
	mov	w8, #-1
	str	w8, [x19, #1864]
	ldr	w8, [sp, #108]          // 4-byte Folded Reload
	tbz	w8, #0, .LBB7_91
	b	.LBB7_185
.LBB7_89:                               //   in Loop: Header=BB7_14 Depth=2
	adrp	x1, .L.str.16
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.16
                                        // kill: def $w2 killed $w2 killed $x2
	bl	f2fs_printk
	mov	w8, wzr
	b	.LBB7_69
.LBB7_90:                               //   in Loop: Header=BB7_14 Depth=2
	str	x8, [sp, #112]          // 8-byte Folded Spill
	mov	w22, w24
	ldr	w8, [sp, #108]          // 4-byte Folded Reload
	tbnz	w8, #0, .LBB7_185
.LBB7_91:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	w24, [x19, #1192]
	ldr	w20, [x19, #1188]
	ldrsw	x26, [x19, #1284]
	ldr	w25, [x19, #1184]
	ldrsw	x28, [x19, #1272]
	ldrsw	x21, [x19, #1296]
	ldr	x8, [x19, #80]
	tbnz	w8, #3, .LBB7_185
// %bb.92:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x10, [x19, #136]
	ldr	x8, [x10, #8]
	ldr	w9, [x10, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	add	w11, w8, w22
	b.eq	.LBB7_94
// %bb.93:                              //   in Loop: Header=BB7_14 Depth=2
	udiv	w12, w9, w24
	cmp	w11, w12
	b.eq	.LBB7_95
	b	.LBB7_103
.LBB7_94:                               //   in Loop: Header=BB7_14 Depth=2
	mov	w12, #-1
                                        // kill: def $w12 killed $w12 killed $x12
	cmp	w11, w12
	b.ne	.LBB7_103
.LBB7_95:                               //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [x19, #1284]
	ldr	w14, [x19, #1272]
	ldr	w23, [x19, #1272]
	ldr	x11, [x10, #24]
	ldr	x12, [x10]
	add	w13, w14, w13
	ldr	w15, [x11, #460]
	ldr	x12, [x12, #136]
	madd	x15, x15, x27, x12
	ldrh	w15, [x15, #2]
	and	w15, w15, #0x3ff
	sub	w14, w20, w15
	cmp	w14, w13
	b.lo	.LBB7_103
// %bb.96:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w14, [x11, #580]
	madd	x14, x14, x27, x12
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w14, w20, w14
	cmp	w14, w13
	b.lo	.LBB7_103
// %bb.97:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w14, [x11, #700]
	madd	x14, x14, x27, x12
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w14, w20, w14
	cmp	w14, w13
	b.lo	.LBB7_103
// %bb.98:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [x11, #100]
	madd	x12, x13, x27, x12
	ldrh	w12, [x12, #2]
	and	w12, w12, #0x3ff
	sub	w12, w20, w12
	cmp	w12, w23
	b.lo	.LBB7_103
// %bb.99:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB7_185
// %bb.100:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB7_185
// %bb.101:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w1, [x11, #820]
	mov	x0, x19
	stur	x1, [x29, #-112]        // 8-byte Folded Spill
                                        // kill: def $w1 killed $w1 killed $x1
	bl	f2fs_usable_blks_in_seg
	ldr	x10, [x19, #136]
	ldur	x9, [x29, #-112]        // 8-byte Folded Reload
	ldr	x8, [x10]
	ldr	x8, [x8, #136]
	madd	x8, x9, x27, x8
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w23
	b.hs	.LBB7_185
// %bb.102:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x10, #8]
	ldr	w9, [x10, #100]
	ldr	w8, [x8, #8]
.LBB7_103:                              //   in Loop: Header=BB7_14 Depth=2
	mul	w11, w20, w24
	cmn	w9, #1                  // =1
	sub	x11, x11, #1            // =1
	add	x13, x11, x28
	add	x12, x11, x26
	asr	x13, x13, x25
	add	x11, x11, x21
	asr	x12, x12, x25
	udiv	w13, w13, w24
	asr	x11, x11, x25
	udiv	w12, w12, w24
	udiv	w14, w11, w24
	add	w11, w8, w22
	add	w12, w12, w13, lsl #1
	add	w12, w12, w14
	b.eq	.LBB7_105
// %bb.104:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [x19, #1192]
	udiv	w13, w9, w13
	b	.LBB7_106
.LBB7_105:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w13, #-1
                                        // kill: def $w13 killed $w13 killed $x13
.LBB7_106:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w14, [sp, #132]         // 4-byte Folded Reload
	add	w12, w12, w13
	cmp	w11, w12
	b.hi	.LBB7_185
// %bb.107:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w11, [x19, #3024]
	cmp	w11, #2                 // =2
	b.ne	.LBB7_110
// %bb.108:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x12, [x19, #16]
	ldrb	w12, [x12, #2182]
	tbz	w12, #0, .LBB7_110
// %bb.109:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x12, [x19, #1984]
	cmp	x12, #51                // =51
	b.hs	.LBB7_184
.LBB7_110:                              //   in Loop: Header=BB7_14 Depth=2
	cmp	w14, #17                // =17
	b.lo	.LBB7_117
// %bb.111:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [sp, #120]         // 4-byte Folded Reload
	lsl	w12, w14, #1
	cmp	w12, w13
	b.lo	.LBB7_117
// %bb.112:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x9, [sp, #112]          // 8-byte Folded Reload
	subs	x8, x9, x8
	b.ls	.LBB7_180
// %bb.113:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x9, [x19, #1904]
	cmp	x8, x9
	b.ls	.LBB7_180
// %bb.114:                             //   in Loop: Header=BB7_14 Depth=2
	mov	x0, x19
	mov	w1, #1
	mov	w8, #1
	stur	w8, [x29, #-120]        // 4-byte Folded Spill
	bl	f2fs_drop_inmem_pages_all
	ldr	x11, [x19, #136]
	mov	w9, #-1
	mov	w24, w22
	stur	w9, [x29, #-20]
	ldr	x8, [x11, #16]
	ldr	w8, [x8, #140]
	cbz	w8, .LBB7_14
// %bb.115:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w8, [x11, #100]
	ldr	w25, [x19, #1192]
	cmn	w8, #1                  // =1
	udiv	w10, w8, w25
	b.eq	.LBB7_133
// %bb.116:                             //   in Loop: Header=BB7_14 Depth=2
	mov	w26, w10
	b	.LBB7_134
.LBB7_117:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x12, [x10, #16]
	mov	w13, #-1
	mov	w24, w22
	stur	w13, [x29, #-20]
	mov	w13, #1
	ldr	w12, [x12, #140]
	stur	w13, [x29, #-120]       // 4-byte Folded Spill
	cbz	w12, .LBB7_14
// %bb.118:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w25, [x19, #1192]
	cmn	w9, #1                  // =1
	udiv	w12, w9, w25
	b.eq	.LBB7_120
// %bb.119:                             //   in Loop: Header=BB7_14 Depth=2
	mov	w26, w12
	b	.LBB7_121
.LBB7_120:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w13, #-1
	mov	w26, w13
.LBB7_121:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w21, [x19, #1188]
	mov	w14, #1
	ldrsw	x23, [x19, #1284]
	mov	w24, w22
	ldr	w28, [x19, #1184]
	ldrsw	x16, [x19, #1272]
	ldrsw	x17, [x19, #1296]
	ldr	x13, [x19, #80]
	stur	w14, [x29, #-120]       // 4-byte Folded Spill
	tbnz	w13, #3, .LBB7_14
// %bb.122:                             //   in Loop: Header=BB7_14 Depth=2
	add	w13, w26, w8
	cmn	w9, #1                  // =1
	b.eq	.LBB7_124
// %bb.123:                             //   in Loop: Header=BB7_14 Depth=2
	cmp	w13, w12
	b.eq	.LBB7_125
	b	.LBB7_129
.LBB7_124:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w12, #-1
                                        // kill: def $w12 killed $w12 killed $x12
	cmp	w13, w12
	b.ne	.LBB7_129
.LBB7_125:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [x19, #1284]
	ldr	w14, [x19, #1272]
	ldr	w20, [x19, #1272]
	ldr	x12, [x10, #24]
	ldr	x10, [x10]
	add	w13, w14, w13
	ldr	w15, [x12, #460]
	ldr	x10, [x10, #136]
	madd	x15, x15, x27, x10
	ldrh	w15, [x15, #2]
	and	w15, w15, #0x3ff
	sub	w14, w21, w15
	cmp	w14, w13
	b.lo	.LBB7_129
// %bb.126:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w14, [x12, #580]
	madd	x14, x14, x27, x10
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w14, w21, w14
	cmp	w14, w13
	b.lo	.LBB7_129
// %bb.127:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w14, [x12, #700]
	madd	x14, x14, x27, x10
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w14, w21, w14
	cmp	w14, w13
	b.lo	.LBB7_129
// %bb.128:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [x12, #100]
	madd	x10, x13, x27, x10
	ldrh	w10, [x10, #2]
	and	w10, w10, #0x3ff
	sub	w10, w21, w10
	cmp	w10, w20
	b.hs	.LBB7_150
.LBB7_129:                              //   in Loop: Header=BB7_14 Depth=2
	mul	w10, w21, w25
	add	w8, w8, w26
	cmn	w9, #1                  // =1
	sub	x10, x10, #1            // =1
	add	x12, x10, x16
	add	x11, x10, x23
	asr	x12, x12, x28
	add	x10, x10, x17
	asr	x11, x11, x28
	udiv	w12, w12, w25
	asr	x10, x10, x28
	udiv	w11, w11, w25
	udiv	w10, w10, w25
	add	w11, w11, w12, lsl #1
	add	w10, w11, w10
	b.eq	.LBB7_131
// %bb.130:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w11, [x19, #1192]
	udiv	w9, w9, w11
	b	.LBB7_132
.LBB7_131:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w9, #-1
                                        // kill: def $w9 killed $w9 killed $x9
.LBB7_132:                              //   in Loop: Header=BB7_14 Depth=2
	add	w9, w10, w9
	mov	w10, #1
	mov	w24, w22
	cmp	w8, w9
	stur	w10, [x29, #-120]       // 4-byte Folded Spill
	b.hi	.LBB7_14
	b	.LBB7_13
.LBB7_133:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w9, #-1
	mov	w26, w9
.LBB7_134:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w21, [x19, #1188]
	mov	w12, #1
	ldrsw	x23, [x19, #1284]
	mov	w24, w22
	ldr	w28, [x19, #1184]
	ldrsw	x15, [x19, #1272]
	ldrsw	x16, [x19, #1296]
	ldr	x9, [x19, #80]
	stur	w12, [x29, #-120]       // 4-byte Folded Spill
	tbnz	w9, #3, .LBB7_14
// %bb.135:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x9, [x11, #8]
	cmn	w8, #1                  // =1
	ldr	w9, [x9, #8]
	add	w12, w9, w26
	b.eq	.LBB7_137
// %bb.136:                             //   in Loop: Header=BB7_14 Depth=2
	cmp	w12, w10
	b.eq	.LBB7_138
	b	.LBB7_142
.LBB7_137:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w10, #-1
                                        // kill: def $w10 killed $w10 killed $x10
	cmp	w12, w10
	b.ne	.LBB7_142
.LBB7_138:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w12, [x19, #1284]
	ldr	w13, [x19, #1272]
	ldr	w20, [x19, #1272]
	ldr	x10, [x11, #24]
	ldr	x11, [x11]
	add	w12, w13, w12
	ldr	w14, [x10, #460]
	ldr	x11, [x11, #136]
	madd	x14, x14, x27, x11
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w13, w21, w14
	cmp	w13, w12
	b.lo	.LBB7_142
// %bb.139:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [x10, #580]
	madd	x13, x13, x27, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w21, w13
	cmp	w13, w12
	b.lo	.LBB7_142
// %bb.140:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w13, [x10, #700]
	madd	x13, x13, x27, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w21, w13
	cmp	w13, w12
	b.lo	.LBB7_142
// %bb.141:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w12, [x10, #100]
	madd	x11, x12, x27, x11
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w11, w21, w11
	cmp	w11, w20
	b.hs	.LBB7_154
.LBB7_142:                              //   in Loop: Header=BB7_14 Depth=2
	mul	w10, w21, w25
	add	w9, w9, w26
	cmn	w8, #1                  // =1
	sub	x10, x10, #1            // =1
	add	x12, x10, x15
	add	x11, x10, x23
	asr	x12, x12, x28
	add	x10, x10, x16
	asr	x11, x11, x28
	udiv	w12, w12, w25
	asr	x10, x10, x28
	udiv	w11, w11, w25
	udiv	w10, w10, w25
	add	w11, w11, w12, lsl #1
	add	w10, w11, w10
	b.eq	.LBB7_144
// %bb.143:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w11, [x19, #1192]
	udiv	w8, w8, w11
	b	.LBB7_145
.LBB7_144:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w8, #-1
                                        // kill: def $w8 killed $w8 killed $x8
.LBB7_145:                              //   in Loop: Header=BB7_14 Depth=2
	add	w8, w10, w8
	mov	w10, #1
	mov	w24, w22
	cmp	w9, w8
	stur	w10, [x29, #-120]       // 4-byte Folded Spill
	b.hi	.LBB7_14
	b	.LBB7_13
.LBB7_146:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB7_48
// %bb.147:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB7_48
// %bb.148:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w1, [x11, #820]
	mov	x0, x19
	stur	x1, [x29, #-96]         // 8-byte Folded Spill
                                        // kill: def $w1 killed $w1 killed $x1
	bl	f2fs_usable_blks_in_seg
	ldr	x8, [x19, #136]
	ldur	x10, [x29, #-96]        // 8-byte Folded Reload
	ldr	x9, [x8]
	ldr	x9, [x9, #136]
	madd	x9, x10, x23, x9
	ldrh	w9, [x9, #2]
	and	w9, w9, #0x3ff
	sub	w9, w0, w9
	cmp	w9, w20
	b.hs	.LBB7_48
// %bb.149:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x9, [x8, #8]
	ldr	w10, [x8, #100]
	ldr	w9, [x9, #8]
	b	.LBB7_44
.LBB7_150:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w8, #1
	mov	w24, w22
	cmp	w11, #2                 // =2
	stur	w8, [x29, #-120]        // 4-byte Folded Spill
	b.ne	.LBB7_14
// %bb.151:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #16]
	mov	w9, #1
	mov	w24, w22
	stur	w9, [x29, #-120]        // 4-byte Folded Spill
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB7_14
// %bb.152:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w24, [x12, #820]
	mov	x0, x19
	stur	x16, [x29, #-112]       // 8-byte Folded Spill
	str	x17, [sp, #136]         // 8-byte Folded Spill
	mov	w1, w24
	bl	f2fs_usable_blks_in_seg
	ldr	x9, [x19, #136]
	mov	w10, #1
	ldr	x17, [sp, #136]         // 8-byte Folded Reload
	ldur	x16, [x29, #-112]       // 8-byte Folded Reload
	stur	w10, [x29, #-120]       // 4-byte Folded Spill
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x24, x27, x8
	mov	w24, w22
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w20
	b.hs	.LBB7_14
// %bb.153:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x9, #8]
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB7_129
.LBB7_154:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w8, [x19, #3024]
	mov	w9, #1
	mov	w24, w22
	stur	w9, [x29, #-120]        // 4-byte Folded Spill
	cmp	w8, #2                  // =2
	b.ne	.LBB7_14
// %bb.155:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #16]
	mov	w9, #1
	mov	w24, w22
	stur	w9, [x29, #-120]        // 4-byte Folded Spill
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB7_14
// %bb.156:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w24, [x10, #820]
	mov	x0, x19
	stur	x15, [x29, #-112]       // 8-byte Folded Spill
	str	x16, [sp, #136]         // 8-byte Folded Spill
	mov	w1, w24
	bl	f2fs_usable_blks_in_seg
	ldr	x8, [x19, #136]
	mov	w10, #1
	ldr	x16, [sp, #136]         // 8-byte Folded Reload
	ldur	x15, [x29, #-112]       // 8-byte Folded Reload
	stur	w10, [x29, #-120]       // 4-byte Folded Spill
	ldr	x9, [x8]
	ldr	x9, [x9, #136]
	madd	x9, x24, x27, x9
	mov	w24, w22
	ldrh	w9, [x9, #2]
	and	w9, w9, #0x3ff
	sub	w9, w0, w9
	cmp	w9, w20
	b.hs	.LBB7_14
// %bb.157:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x9, [x8, #8]
	ldr	w8, [x8, #100]
	ldr	w9, [x9, #8]
	b	.LBB7_142
.LBB7_158:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB7_162
// %bb.159:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB7_162
// %bb.160:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	w21, [x10, #820]
	mov	x0, x19
	mov	w1, w21
	bl	f2fs_usable_blks_in_seg
	ldr	x9, [x19, #136]
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x21, x24, x8
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w23
	b.hs	.LBB7_162
// %bb.161:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x9, #8]
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB7_61
.LBB7_162:                              //   in Loop: Header=BB7_14 Depth=2
	ldur	w24, [x29, #-112]       // 4-byte Folded Reload
.LBB7_163:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w22, wzr
	mov	w27, #48
	ldur	w8, [x29, #-100]        // 4-byte Folded Reload
	tbz	w22, #0, .LBB7_65
	b	.LBB7_66
.LBB7_164:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w8, #-1
	strb	wzr, [x19, #1992]
	str	xzr, [x19, #1968]
	str	w8, [x19, #1976]
	b	.LBB7_75
.LBB7_165:                              //   in Loop: Header=BB7_14 Depth=2
	ldrb	w8, [x19, #1992]
	cbz	w8, .LBB7_169
// %bb.166:                             //   in Loop: Header=BB7_14 Depth=2
	mov	x8, #32401
	ldr	x2, [x19, #1968]
	movk	x8, #15099, lsl #16
	mov	x10, #4299
	movk	x8, #52848, lsl #32
	movk	x10, #47815, lsl #16
	movk	x8, #53896, lsl #48
	movk	x10, #36280, lsl #32
	movk	x10, #6, lsl #48
	mul	x8, x2, x8
	ror	x8, x8, #4
	cmp	x8, x10
	b.hi	.LBB7_176
// %bb.167:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #136]
	cmp	w9, #2                  // =2
	ldur	w5, [x29, #-20]
	ldr	x10, [x8]
	mul	x12, x5, x27
	ldr	x11, [x10, #136]
	ldr	w11, [x11, x12]
	and	w6, w11, #0x3f
	b.hs	.LBB7_171
// %bb.168:                             //   in Loop: Header=BB7_14 Depth=2
	ubfx	w7, w11, #6, #10
	b	.LBB7_175
.LBB7_169:                              //   in Loop: Header=BB7_14 Depth=2
	ldur	w8, [x29, #-20]
	mov	w9, #1
	strb	w9, [x19, #1992]
	str	w8, [x19, #1976]
	mov	w8, #2
	str	x8, [x19, #1968]
	b	.LBB7_84
.LBB7_170:                              //   in Loop: Header=BB7_14 Depth=2
	bl	preempt_schedule_notrace
	b	.LBB7_33
.LBB7_171:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	x10, [x10, #144]
	cmn	w5, #1                  // =1
	b.eq	.LBB7_173
// %bb.172:                             //   in Loop: Header=BB7_14 Depth=2
	udiv	w9, w5, w9
	b	.LBB7_174
.LBB7_173:                              //   in Loop: Header=BB7_14 Depth=2
	mov	w9, #-1
.LBB7_174:                              //   in Loop: Header=BB7_14 Depth=2
	ldr	w7, [x10, x9, lsl #2]
.LBB7_175:                              //   in Loop: Header=BB7_14 Depth=2
	ldp	x9, x10, [x8, #8]
	adrp	x1, .L.str.4
	adrp	x3, .L__func__.f2fs_gc
	ldr	w8, [x8, #100]
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.4
	add	x3, x3, :lo12:.L__func__.f2fs_gc
	ldr	w9, [x9, #4]
	mov	w4, #3470
	ldr	w10, [x10, #140]
                                        // kill: def $w5 killed $w5 killed $x5
	str	w8, [sp, #16]
	str	w9, [sp]
	str	w10, [sp, #8]
	bl	f2fs_printk
	ldr	x2, [x19, #1968]
.LBB7_176:                              //   in Loop: Header=BB7_14 Depth=2
	add	x8, x2, #1              // =1
	mov	w9, #10001
	cmp	x8, x9
	str	x8, [x19, #1968]
	b.lo	.LBB7_84
// %bb.177:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x0, [x19, #2000]
	cbnz	x0, .LBB7_179
// %bb.178:                             //   in Loop: Header=BB7_14 Depth=2
	ldr	x8, [x19, #136]
	mov	w1, #32960
	movk	w1, #96, lsl #16
	mov	w2, #-1
                                        // kill: def $w2 killed $w2 killed $x2
	ldr	w8, [x8, #96]
	add	x8, x8, #63             // =63
	lsr	x8, x8, #3
	and	x0, x8, #0x3ffffff8
	bl	kvmalloc_node
	str	x0, [x19, #2000]
	cbz	x0, .LBB7_84
.LBB7_179:                              //   in Loop: Header=BB7_14 Depth=2
	ldur	w8, [x29, #-20]
	mov	w10, #1
	lsr	x9, x8, #3
	lsl	x8, x10, x8
	and	x9, x9, #0x1ffffff8
	add	x9, x0, x9
	//APP
	// atomic64_or
	prfm	pstl1strm, [x9]
1:	ldxr	x10, [x9]
	orr	x10, x10, x8
	stxr	w11, x10, [x9]
	cbnz	w11, 1b
	//NO_APP
	b	.LBB7_84
.LBB7_180:                              //   in Loop: Header=BB7_12 Depth=1
	ldur	w8, [x29, #-96]         // 4-byte Folded Reload
	cmp	w8, #1                  // =1
	b.ne	.LBB7_185
// %bb.181:                             //   in Loop: Header=BB7_12 Depth=1
	ldr	x8, [x19, #80]
	tbnz	w8, #8, .LBB7_193
// %bb.182:                             //   in Loop: Header=BB7_12 Depth=1
	sub	x1, x29, #56            // =56
	mov	x0, x19
	bl	f2fs_write_checkpoint
	mov	w28, w0
	b	.LBB7_194
.LBB7_183:                              //   in Loop: Header=BB7_12 Depth=1
	ldr	x8, [x19, #2016]
	mov	w22, wzr
	mov	w28, #-22
	ldr	w9, [x8, #188]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #188]
	b	.LBB7_187
.LBB7_184:                              //   in Loop: Header=BB7_12 Depth=1
	sub	x1, x29, #56            // =56
	mov	x0, x19
	bl	f2fs_write_checkpoint
	adrp	x1, .L.str.5
	adrp	x2, .L__func__.f2fs_gc
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.5
	add	x2, x2, :lo12:.L__func__.f2fs_gc
	bl	f2fs_printk
.LBB7_185:                              //   in Loop: Header=BB7_12 Depth=1
	mov	w8, #1
	mov	w28, wzr
	stur	w8, [x29, #-120]        // 4-byte Folded Spill
.LBB7_186:                              //   in Loop: Header=BB7_12 Depth=1
	mov	w24, w22
	ldur	w22, [x29, #-96]        // 4-byte Folded Reload
.LBB7_187:                              //   in Loop: Header=BB7_12 Depth=1
	ldr	w8, [x19, #3024]
	stur	w22, [x29, #-96]        // 4-byte Folded Spill
	cmp	w8, #2                  // =2
	b.ne	.LBB7_202
// %bb.188:                             //   in Loop: Header=BB7_12 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB7_202
// %bb.189:                             //   in Loop: Header=BB7_12 Depth=1
	ldr	w8, [sp, #100]          // 4-byte Folded Reload
	cmp	w8, #3                  // =3
	b.ne	.LBB7_201
// %bb.190:                             //   in Loop: Header=BB7_12 Depth=1
	ldr	w8, [sp, #60]           // 4-byte Folded Reload
	cmn	w8, #1                  // =1
	b.ne	.LBB7_201
// %bb.191:                             //   in Loop: Header=BB7_12 Depth=1
	ldr	w8, [sp, #96]           // 4-byte Folded Reload
	cbnz	w8, .LBB7_201
// %bb.192:                             //   in Loop: Header=BB7_12 Depth=1
	mov	w9, #-1
	mov	w8, #1
	str	w28, [sp, #56]          // 4-byte Folded Spill
	stur	w9, [x29, #-20]
	b	.LBB7_12
.LBB7_193:                              //   in Loop: Header=BB7_12 Depth=1
	mov	w28, wzr
.LBB7_194:                              //   in Loop: Header=BB7_12 Depth=1
	mov	w8, #1
	mov	w24, w22
	mov	w22, #1
	stur	w8, [x29, #-120]        // 4-byte Folded Spill
	b	.LBB7_187
.LBB7_195:                              //   in Loop: Header=BB7_12 Depth=1
	mov	w28, w0
	b	.LBB7_186
.LBB7_196:                              //   in Loop: Header=BB7_12 Depth=1
	mov	w28, #-22
	b	.LBB7_187
.LBB7_197:                              //   in Loop: Header=BB7_12 Depth=1
	mov	w22, wzr
	mov	w28, #-22
	b	.LBB7_187
.LBB7_198:                              //   in Loop: Header=BB7_12 Depth=1
	mov	w28, w0
	mov	w22, wzr
	b	.LBB7_187
.LBB7_199:                              //   in Loop: Header=BB7_12 Depth=1
	ldur	w24, [x29, #-112]       // 4-byte Folded Reload
	mov	w28, #-22
	b	.LBB7_187
.LBB7_200:                              //   in Loop: Header=BB7_12 Depth=1
	mov	w28, #-5
	b	.LBB7_187
.LBB7_201:
	mov	w8, #3
	str	w8, [x19, #3308]
.LBB7_202:
	ldr	x8, [x19, #136]
	ldr	w9, [sp, #60]           // 4-byte Folded Reload
	stur	w24, [x29, #-112]       // 4-byte Folded Spill
	ldr	x8, [x8]
	str	wzr, [x8, #212]
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
	str	w9, [x8, #216]
	adrp	x8, __tracepoint_f2fs_gc_end
	ldr	x26, [x19]
	add	x8, x8, :lo12:__tracepoint_f2fs_gc_end
	ldrsw	x20, [x19, #1284]
	ldrsw	x23, [x19, #1272]
	ldrsw	x21, [x19, #1296]
	ldr	x9, [x19, #136]
	ldp	x10, x11, [x9, #8]
	ldr	w25, [x9, #100]
	ldp	w22, w13, [x10, #4]
	ldr	w15, [x11, #140]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB7_209
// %bb.203:
	adrp	x10, cpu_number
	//APP
	.if 1 == 1
661:
	mrs x9, tpidr_el1
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 11
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	mrs x9, tpidr_el2
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	add	x10, x10, :lo12:cpu_number
	adrp	x11, __cpu_online_mask
	add	x11, x11, :lo12:__cpu_online_mask
	ldr	w9, [x9, x10]
	add	w10, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w10, w10, w9, lt
	asr	w10, w10, #6
	ldr	x10, [x11, w10, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB7_209
// %bb.204:
	//APP
	mrs x10, sp_el0
	//NO_APP
	ldr	w9, [x10, #80]
	str	x10, [sp, #120]         // 8-byte Folded Spill
	add	w9, w9, #1              // =1
	str	w9, [x10, #80]
	//APP
	//NO_APP
	ldr	x27, [x8, #32]
	ldur	w24, [x29, #-124]       // 4-byte Folded Reload
	ldur	w9, [x29, #-112]        // 4-byte Folded Reload
	cbz	x27, .LBB7_207
// %bb.205:
	ldr	x8, [x27], #24
	str	w28, [sp, #136]         // 4-byte Folded Spill
	stur	w13, [x29, #-100]       // 4-byte Folded Spill
	str	w15, [sp, #132]         // 4-byte Folded Spill
.LBB7_206:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x27, #-16]
	mov	x1, x26
	mov	w2, w28
	mov	w3, w24
	mov	w4, w9
	mov	x5, x20
	mov	x6, x23
	mov	x7, x21
	str	w15, [sp, #24]
	mov	w28, w9
	str	w25, [sp, #16]
	str	w22, [sp, #8]
	str	w13, [sp]
	blr	x8
	mov	w9, w28
	ldur	w13, [x29, #-100]       // 4-byte Folded Reload
	ldp	w15, w28, [sp, #132]    // 8-byte Folded Reload
	ldr	x8, [x27], #24
	cbnz	x8, .LBB7_206
.LBB7_207:
	//APP
	//NO_APP
	ldr	x9, [sp, #120]          // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	b.ne	.LBB7_209
// %bb.208:
	ldr	x8, [x9]
	tbnz	w8, #1, .LBB7_241
.LBB7_209:
	add	x0, x19, #1664          // =1664
	bl	up_write
	ldr	w22, [sp, #108]         // 4-byte Folded Reload
	mov	x23, #256
	ldr	x24, [sp, #64]          // 8-byte Folded Reload
	movk	x23, #57005, lsl #48
	ldur	w8, [x29, #-120]        // 4-byte Folded Reload
	adrp	x25, f2fs_inode_entry_slab
	cbz	w8, .LBB7_229
// %bb.210:
	add	x21, x19, #2192         // =2192
	mov	x0, x21
	bl	mutex_lock
	ldr	w8, [x19, #3024]
	ldr	x20, [sp, #48]          // 8-byte Folded Reload
	cmp	w8, #2                  // =2
	b.ne	.LBB7_219
// %bb.211:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB7_219
// %bb.212:
	adrp	x8, vm_node_stat
	add	x8, x8, :lo12:vm_node_stat
	ldr	x8, [x8, #128]
	ldr	x9, [sp, #40]           // 8-byte Folded Reload
	bic	x8, x8, x8, asr #63
	subs	x8, x8, x9
	b.ls	.LBB7_219
// %bb.213:
	ldr	x9, [x19, #2224]
	cbz	x9, .LBB7_219
// %bb.214:
	ldr	x10, [x9, #640]
	cmp	x10, x8
	b.hs	.LBB7_216
// %bb.215:
	str	x8, [x9, #640]
	ldr	x9, [x19, #2224]
	cbz	x9, .LBB7_219
.LBB7_216:
	ldr	x10, [x9, #648]
	cmp	x10, x8
	b.ls	.LBB7_218
// %bb.217:
	str	x8, [x9, #648]
	ldr	x9, [x19, #2224]
	cbz	x9, .LBB7_219
.LBB7_218:
	ldr	x10, [x9, #656]
	add	x8, x10, x8
	str	x8, [x9, #656]
.LBB7_219:
	cbz	x20, .LBB7_223
// %bb.220:
	ldur	w8, [x29, #-96]         // 4-byte Folded Reload
	cmp	w8, #1                  // =1
	b.ne	.LBB7_223
// %bb.221:
	bl	sched_clock
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB7_223
// %bb.222:
	ldr	x9, [x8, #144]
	sub	x10, x0, x20
	add	x9, x10, x9
	str	x9, [x8, #144]
.LBB7_223:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB7_225
// %bb.224:
	ldur	w9, [x29, #-96]         // 4-byte Folded Reload
	add	x8, x8, w9, sxtw #2
	ldr	w9, [x8, #80]
	add	w9, w9, #1              // =1
	str	w9, [x8, #80]
.LBB7_225:
	cbz	w28, .LBB7_228
// %bb.226:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB7_228
// %bb.227:
	ldur	w9, [x29, #-96]         // 4-byte Folded Reload
	add	x8, x8, w9, sxtw #2
	ldr	w9, [x8, #88]
	add	w9, w9, #1              // =1
	str	w9, [x8, #88]
.LBB7_228:
	mov	x0, x21
	bl	mutex_unlock
.LBB7_229:
	ldur	x21, [x29, #-88]
	sub	x20, x29, #88           // =88
	cmp	x21, x20
	b.eq	.LBB7_234
// %bb.230:
	ldr	x8, [x21]
	b	.LBB7_232
.LBB7_231:                              //   in Loop: Header=BB7_232 Depth=1
	add	x8, x23, #256           // =256
	mov	x1, x21
	stp	x23, x8, [x21]
	ldr	x0, [x25, :lo12:f2fs_inode_entry_slab]
	bl	kmem_cache_free
	ldr	x8, [x19]
	mov	x21, x19
	cmp	x19, x20
	b.eq	.LBB7_234
.LBB7_232:                              // =>This Inner Loop Header: Depth=1
	ldr	x9, [x21, #16]
	mov	x0, x24
	mov	x19, x8
	ldr	x1, [x9, #64]
	bl	radix_tree_delete
	ldr	x0, [x21, #16]
	bl	iput
	mov	x0, x21
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB7_231
// %bb.233:                             //   in Loop: Header=BB7_232 Depth=1
	ldp	x9, x8, [x21]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB7_231
.LBB7_234:
	ldr	w8, [sp, #56]           // 4-byte Folded Reload
	ldur	w10, [x29, #-112]       // 4-byte Folded Reload
	ldr	x19, [sp, #80]          // 8-byte Folded Reload
	cmp	w8, #0                  // =0
	ldr	w8, [sp, #100]          // 4-byte Folded Reload
	ldr	x0, [x19, #2000]
	ccmp	w8, #3, #0, eq
	csel	w8, w28, wzr, ne
	cmp	w8, #0                  // =0
	cset	w9, ne
	cmp	w10, #0                 // =0
	orn	w9, w9, w22
	mov	w10, #-11
	csel	w10, w10, wzr, eq
	tst	w9, #0x1
	csel	w20, w8, w10, ne
	cbnz	x0, .LBB7_238
// %bb.235:
	ldrb	w8, [x19, #1992]
	cbnz	w8, .LBB7_239
.LBB7_236:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB7_242
// %bb.237:
	mov	w0, w20
	ldp	x20, x19, [sp, #352]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #336]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #320]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #304]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #288]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #272]    // 16-byte Folded Reload
	add	sp, sp, #368            // =368
	ret
.LBB7_238:
	bl	kvfree
	str	xzr, [x19, #2000]
	ldrb	w8, [x19, #1992]
	cbz	w8, .LBB7_236
.LBB7_239:
	mov	w8, #-1
	strb	wzr, [x19, #1992]
	str	xzr, [x19, #1968]
	str	w8, [x19, #1976]
	b	.LBB7_236
.LBB7_240:
	bl	preempt_schedule_notrace
	b	.LBB7_11
.LBB7_241:
	bl	preempt_schedule_notrace
	b	.LBB7_209
.LBB7_242:
	bl	__stack_chk_fail
.Lfunc_end7:
	.size	f2fs_gc, .Lfunc_end7-f2fs_gc
                                        // -- End function
	.p2align	3               // -- Begin function do_garbage_collect
	.type	do_garbage_collect,@function
do_garbage_collect:                     // @do_garbage_collect
// %bb.0:
	sub	sp, sp, #368            // =368
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #272]    // 16-byte Folded Spill
	add	x29, sp, #272           // =272
	stp	x28, x27, [sp, #288]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #304]    // 16-byte Folded Spill
	mov	w10, #48
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	w25, w1
	stp	x24, x23, [sp, #320]    // 16-byte Folded Spill
	umull	x10, w1, w10
	stp	x22, x21, [sp, #336]    // 16-byte Folded Spill
	mov	w22, w4
	stp	x20, x19, [sp, #352]    // 16-byte Folded Spill
	mov	x19, x0
	stur	x3, [x29, #-96]         // 8-byte Folded Spill
	str	x2, [sp, #48]           // 8-byte Folded Spill
	stur	x8, [x29, #-16]
	ldr	x8, [x0, #136]
	ldr	x9, [x8]
	ldr	x11, [x9, #136]
	ldr	w9, [x0, #1192]
	ldr	w10, [x11, x10]
	add	w20, w9, w1
	and	x21, x10, #0x3f
	cmp	w21, #3                 // =3
	b.lo	.LBB8_3
// %bb.1:
	and	w11, w10, #0x3e
	cmp	w11, #6                 // =6
	ccmp	w21, #8, #2, hs
	b.ls	.LBB8_3
// %bb.2:
	mov	w24, #1
	cmp	w9, #2                  // =2
	b.hs	.LBB8_4
	b	.LBB8_5
.LBB8_3:
	mov	w24, wzr
	cmp	w9, #2                  // =2
	b.lo	.LBB8_5
.LBB8_4:
	udiv	w11, w20, w9
	mul	w20, w11, w9
.LBB8_5:
	and	w10, w10, #0x3e
	stur	x19, [x29, #-88]        // 8-byte Folded Spill
	cmp	w10, #6                 // =6
	b.hs	.LBB8_269
// %bb.6:
	cmp	w9, #2                  // =2
	b.lo	.LBB8_8
// %bb.7:
	ldr	w8, [x8, #88]
	sub	w2, w20, w25
	mov	x0, x19
	mov	w3, #3
	mov	w4, #1
	add	w1, w8, w25
	bl	f2fs_ra_meta_pages
.LBB8_8:
	cmp	w20, w25
	b.ls	.LBB8_240
// %bb.9:
	mov	w19, w25
	mov	w26, w25
.LBB8_10:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x29, #-88]         // 8-byte Folded Reload
	mov	w1, w26
	bl	f2fs_get_sum_page
	mov	x23, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB8_241
// %bb.11:                              //   in Loop: Header=BB8_10 Depth=1
	mov	x0, x23
	add	w26, w26, #1            // =1
	bl	unlock_page
	cmp	w26, w20
	b.ne	.LBB8_10
// %bb.12:
	sub	x0, x29, #80            // =80
	bl	blk_start_plug
	ldur	x8, [x29, #-96]         // 8-byte Folded Reload
	mov	w23, wzr
	mov	w20, w20
	mov	w26, #48
	mov	x25, x19
	stur	wzr, [x29, #-124]       // 4-byte Folded Spill
	str	wzr, [sp, #112]         // 4-byte Folded Spill
	cmp	w8, #0                  // =0
	str	w24, [sp, #132]         // 4-byte Folded Spill
	cset	w9, eq
	cmp	w24, #0                 // =0
	stur	x20, [x29, #-120]       // 8-byte Folded Spill
	str	w9, [sp, #92]           // 4-byte Folded Spill
	ldur	x9, [x29, #-88]         // 8-byte Folded Reload
	add	x10, x9, #1380          // =1380
	add	x28, x9, #2192          // =2192
	mov	x19, x9
	str	x10, [sp, #72]          // 8-byte Folded Spill
	sxtw	x10, w8
	add	x8, x9, w8, sxtw #2
	str	x28, [sp, #120]         // 8-byte Folded Spill
	str	x10, [sp, #80]          // 8-byte Folded Spill
	mov	w10, #1
	cinc	x10, x10, ne
	str	x10, [sp, #24]          // 8-byte Folded Spill
	add	x10, x21, #1            // =1
	add	x21, x8, #1872          // =1872
	//APP
	mrs x8, sp_el0
	//NO_APP
	str	x8, [sp, #56]           // 8-byte Folded Spill
	and	w8, w22, #0x1
	str	x10, [sp, #136]         // 8-byte Folded Spill
	str	x21, [sp, #40]          // 8-byte Folded Spill
	str	w8, [sp, #36]           // 4-byte Folded Spill
	b	.LBB8_14
.LBB8_13:                               //   in Loop: Header=BB8_14 Depth=1
	add	x25, x25, #1            // =1
	cmp	x25, x20
	b.eq	.LBB8_249
.LBB8_14:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB8_31 Depth 2
                                        //     Child Loop BB8_74 Depth 2
                                        //       Child Loop BB8_81 Depth 3
	ldr	x8, [x19, #136]
	mov	w2, wzr
	ldr	x9, [x19, #248]
	mov	w3, wzr
	ldr	w8, [x8, #88]
	ldr	x0, [x9, #48]
	add	w1, w8, w25
	bl	pagecache_get_page
	mov	x27, x0
	cbz	x0, .LBB8_17
// %bb.15:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x27, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB8_17
// %bb.16:                              //   in Loop: Header=BB8_14 Depth=1
	bl	__put_page
.LBB8_17:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #136]
	mul	x9, x25, x26
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	ldrh	w8, [x8, x9]
	tst	w8, #0xffc0
	b.eq	.LBB8_56
// %bb.18:                              //   in Loop: Header=BB8_14 Depth=1
	ldur	x8, [x29, #-96]         // 8-byte Folded Reload
	cbnz	w8, .LBB8_21
// %bb.19:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	w8, [x19, #1192]
	cmp	w8, #2                  // =2
	b.lo	.LBB8_21
// %bb.20:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	w8, [x19, #2012]
	ldur	w9, [x29, #-124]        // 4-byte Folded Reload
	cmp	w9, w8
	b.hs	.LBB8_221
.LBB8_21:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #2, .LBB8_221
// %bb.22:                              //   in Loop: Header=BB8_14 Depth=1
	//APP
	dmb ishld
	//NO_APP
	ldr	x8, [x19, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB8_221
// %bb.23:                              //   in Loop: Header=BB8_14 Depth=1
	lsl	x8, x27, #6
	orr	x8, x8, #0xffffffc000000000
	ldrb	w4, [x8, #4091]
	stur	x8, [x29, #-112]        // 8-byte Folded Spill
	cmp	w24, w4
	b.ne	.LBB8_35
// %bb.24:                              //   in Loop: Header=BB8_14 Depth=1
	stp	x27, x23, [sp, #96]     // 16-byte Folded Spill
	ldr	x8, [x19, #1712]
	ldr	x9, [sp, #56]           // 8-byte Folded Reload
	cmp	x8, x9
	b.eq	.LBB8_40
.LBB8_25:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB8_47
// %bb.26:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB8_47
// %bb.27:                              //   in Loop: Header=BB8_14 Depth=1
	adrp	x8, __tracepoint_f2fs_should_migrate
	ldr	w22, [x19, #3308]
	add	x8, x8, :lo12:__tracepoint_f2fs_should_migrate
	ldr	w27, [x19, #3312]
	ldr	x23, [x19, #3032]
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB8_47
// %bb.28:                              //   in Loop: Header=BB8_14 Depth=1
	adrp	x9, cpu_number
	//APP
	.if 1 == 1
661:
	mrs x8, tpidr_el1
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 11
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	mrs x8, tpidr_el2
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	add	x9, x9, :lo12:cpu_number
	adrp	x10, __cpu_online_mask
	add	x10, x10, :lo12:__cpu_online_mask
	ldr	w8, [x8, x9]
	add	w9, w8, #63             // =63
	cmp	w8, #0                  // =0
	csel	w9, w9, w8, lt
	asr	w9, w9, #6
	ldr	x9, [x10, w9, sxtw #3]
	lsr	x8, x9, x8
	tbz	w8, #0, .LBB8_47
// %bb.29:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [sp, #56]           // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	add	w8, w8, #1              // =1
	str	w8, [x9, #80]
	adrp	x8, __tracepoint_f2fs_should_migrate
	add	x8, x8, :lo12:__tracepoint_f2fs_should_migrate
	//APP
	//NO_APP
	ldr	x20, [x8, #32]
	cbz	x20, .LBB8_32
// %bb.30:                              //   in Loop: Header=BB8_14 Depth=1
	add	x26, x23, #192          // =192
.LBB8_31:                               //   Parent Loop BB8_14 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x8, x0, [x20]
	mov	w1, w22
	mov	w2, w27
	mov	x3, xzr
	mov	x4, xzr
	mov	x5, x23
	mov	x6, x26
	blr	x8
	ldr	x8, [x20, #24]!
	cbnz	x8, .LBB8_31
.LBB8_32:                               //   in Loop: Header=BB8_14 Depth=1
	//APP
	//NO_APP
	mov	w26, #48
	ldr	x9, [sp, #56]           // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	b.ne	.LBB8_47
// %bb.33:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [sp, #56]           // 8-byte Folded Reload
	ldr	x8, [x8]
	tbz	w8, #1, .LBB8_47
// %bb.34:                              //   in Loop: Header=BB8_14 Depth=1
	bl	preempt_schedule_notrace
	b	.LBB8_47
.LBB8_35:                               //   in Loop: Header=BB8_14 Depth=1
	adrp	x1, .L.str.17
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.17
	mov	w2, w25
	mov	w3, w24
	bl	f2fs_printk
	cbz	x19, .LBB8_37
// %bb.36:                              //   in Loop: Header=BB8_14 Depth=1
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB8_37:                               //   in Loop: Header=BB8_14 Depth=1
	mov	x0, x19
	mov	w1, wzr
	bl	f2fs_stop_checkpoint
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB8_221
// %bb.38:                              //   in Loop: Header=BB8_14 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB8_221
// %bb.39:                              //   in Loop: Header=BB8_14 Depth=1
	adrp	x22, f2fs_dclient
	adrp	x1, .L.str.18
	adrp	x2, .L__func__.do_garbage_collect
	add	x1, x1, :lo12:.L.str.18
	add	x2, x2, :lo12:.L__func__.do_garbage_collect
	mov	w3, #3196
	ldr	x0, [x22, :lo12:f2fs_dclient]
	bl	dsm_client_record
	mov	w8, #15241
	ldr	x0, [x22, :lo12:f2fs_dclient]
	movk	w8, #14160, lsl #16
	add	w1, w8, #3              // =3
	bl	dsm_client_notify
	b	.LBB8_221
.LBB8_40:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB8_47
// %bb.41:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB8_25
// %bb.42:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	w8, [x19, #3308]
	mov	w11, #192
	ldr	x9, [x19, #3032]
	mov	w12, #95
	mov	w13, #70
	cmp	w8, #0                  // =0
	cset	w10, ne
	csel	x12, x13, x12, eq
	mov	w13, #100
	umaddl	x10, w10, w11, x9
	ldp	w10, w11, [x10, #180]
	mul	x11, x11, x13
	mul	x12, x12, x10
	cset	w10, eq
	cmp	x11, x12
	b.ls	.LBB8_44
// %bb.43:                              //   in Loop: Header=BB8_14 Depth=1
	mov	w11, #192
	cmp	w8, #0                  // =0
	mov	w12, #90
	madd	x9, x10, x11, x9
	mov	w11, #65
	csel	x11, x12, x11, eq
	mov	w12, #100
	ldp	w9, w10, [x9, #180]
	mul	x10, x10, x12
	mul	x9, x11, x9
	cmp	x10, x9
	b.lo	.LBB8_235
.LBB8_44:                               //   in Loop: Header=BB8_14 Depth=1
	cmp	w8, #1                  // =1
	b.eq	.LBB8_233
// %bb.45:                              //   in Loop: Header=BB8_14 Depth=1
	cbnz	w8, .LBB8_25
// %bb.46:                              //   in Loop: Header=BB8_14 Depth=1
	mov	x0, x19
	mov	w1, #2
	b	.LBB8_234
.LBB8_47:                               //   in Loop: Header=BB8_14 Depth=1
	cbz	w24, .LBB8_50
// %bb.48:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #136]
	cbz	x8, .LBB8_71
// %bb.49:                              //   in Loop: Header=BB8_14 Depth=1
	add	x9, x8, #80             // =80
	b	.LBB8_72
.LBB8_50:                               //   in Loop: Header=BB8_14 Depth=1
	ldur	x1, [x29, #-112]        // 8-byte Folded Reload
	mov	x0, x19
	ldr	x2, [sp, #48]           // 8-byte Folded Reload
	mov	w3, w25
	ldr	w5, [sp, #36]           // 4-byte Folded Reload
	ldur	x4, [x29, #-96]         // 8-byte Folded Reload
                                        // kill: def $w4 killed $w4 killed $x4
	bl	gc_data_segment
	ldr	x23, [sp, #104]         // 8-byte Folded Reload
	ldur	x20, [x29, #-120]       // 8-byte Folded Reload
	str	w0, [sp, #116]          // 4-byte Folded Spill
	ldr	w8, [x19, #3312]
	cbz	w8, .LBB8_52
.LBB8_51:                               //   in Loop: Header=BB8_14 Depth=1
	str	wzr, [x19, #3312]
.LBB8_52:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #2016]
	ldp	w10, w11, [sp, #112]    // 8-byte Folded Reload
	ldr	x21, [sp, #40]          // 8-byte Folded Reload
	ldr	w9, [x8, #416]
	ldr	x27, [sp, #96]          // 8-byte Folded Reload
	add	w10, w11, w10
	add	w9, w9, #1              // =1
	str	w10, [sp, #112]         // 4-byte Folded Spill
	str	w9, [x8, #416]
	cbz	w24, .LBB8_54
// %bb.53:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	w9, [x8, #420]
	ldr	w10, [x8, #436]
	ldr	w11, [sp, #92]          // 4-byte Folded Reload
	add	w9, w9, #1              // =1
	add	w10, w10, w11
	str	w9, [x8, #420]
	str	w10, [x8, #436]
	b	.LBB8_55
.LBB8_54:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	w9, [x8, #424]
	ldr	w10, [x8, #440]
	ldr	w11, [sp, #92]          // 4-byte Folded Reload
	add	w9, w9, #1              // =1
	add	w10, w10, w11
	str	w9, [x8, #424]
	str	w10, [x8, #440]
.LBB8_55:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	w8, [x19, #1868]
	ldur	w10, [x29, #-124]       // 4-byte Folded Reload
	add	x8, x19, x8, lsl #2
	add	w10, w10, #1            // =1
	ldr	w9, [x8, #3144]
	stur	w10, [x29, #-124]       // 4-byte Folded Spill
	add	w9, w9, #1              // =1
	str	w9, [x8, #3144]
.LBB8_56:                               //   in Loop: Header=BB8_14 Depth=1
	ldur	x8, [x29, #-96]         // 8-byte Folded Reload
	cmp	w8, #1                  // =1
	b.ne	.LBB8_58
// %bb.57:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #136]
	mul	x9, x25, x26
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	ldrh	w8, [x8, x9]
	tst	w8, #0xffc0
	cinc	w23, w23, eq
.LBB8_58:                               //   in Loop: Header=BB8_14 Depth=1
	mov	x0, x28
	bl	mutex_lock
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB8_61
// %bb.59:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB8_61
// %bb.60:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	w8, [x19, #3308]
	cmp	w8, #1                  // =1
	b.ls	.LBB8_68
.LBB8_61:                               //   in Loop: Header=BB8_14 Depth=1
	ldur	x8, [x29, #-96]         // 8-byte Folded Reload
	cbz	w8, .LBB8_65
.LBB8_62:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [x19, #136]
	ldr	w8, [x19, #1192]
	ldr	x9, [x9]
	cmp	w8, #2                  // =2
	b.lo	.LBB8_64
// %bb.63:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [x9, #144]
	udiv	w8, w25, w8
	ldr	w8, [x9, w8, uxtw #2]
	cbnz	w8, .LBB8_213
	b	.LBB8_65
.LBB8_64:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x9, #136]
	mul	x9, x25, x26
	ldr	w8, [x8, x9]
	ubfx	w8, w8, #6, #10
	cbnz	w8, .LBB8_213
.LBB8_65:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #2224]
	cbz	w24, .LBB8_210
.LBB8_66:                               //   in Loop: Header=BB8_14 Depth=1
	cbz	x8, .LBB8_213
// %bb.67:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [sp, #80]           // 8-byte Folded Reload
	add	x8, x8, x9, lsl #2
	ldr	w9, [x8, #128]
	add	w9, w9, #1              // =1
	str	w9, [x8, #128]
	ldr	x8, [x19, #2224]
	cbnz	x8, .LBB8_212
	b	.LBB8_218
.LBB8_68:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [x19, #2224]
	ldur	x10, [x29, #-96]        // 8-byte Folded Reload
	cbz	w10, .LBB8_208
// %bb.69:                              //   in Loop: Header=BB8_14 Depth=1
	cbz	x9, .LBB8_62
// %bb.70:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x10, [sp, #24]          // 8-byte Folded Reload
	add	x9, x9, x10, lsl #3
	add	x8, x9, x8, lsl #2
	ldr	w9, [x8, #556]
	add	w9, w9, #1              // =1
	str	w9, [x8, #556]
	b	.LBB8_62
.LBB8_71:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB8_72:                               //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x8, #8]
	mov	w11, wzr
	ldr	w10, [x19, #1184]
	ldr	w9, [x9]
	str	wzr, [sp, #116]         // 4-byte Folded Spill
	ldr	w8, [x8]
	add	w8, w8, w25
	lsl	w8, w8, w10
	add	w8, w8, w9
	stp	w8, wzr, [sp, #64]      // 8-byte Folded Spill
	b	.LBB8_74
.LBB8_73:                               //   in Loop: Header=BB8_74 Depth=2
	ldur	w11, [x29, #-100]       // 4-byte Folded Reload
	ldr	w24, [sp, #132]         // 4-byte Folded Reload
	ldr	x28, [sp, #120]         // 8-byte Folded Reload
	ldur	x20, [x29, #-120]       // 8-byte Folded Reload
	add	w11, w11, #1            // =1
	cmp	w11, #3                 // =3
	b.eq	.LBB8_224
.LBB8_74:                               //   Parent Loop BB8_14 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB8_81 Depth 3
	ldur	x8, [x29, #-96]         // 8-byte Folded Reload
	cmp	w8, #1                  // =1
	b.ne	.LBB8_77
// %bb.75:                              //   in Loop: Header=BB8_74 Depth=2
	cmp	w11, #2                 // =2
	b.ne	.LBB8_77
// %bb.76:                              //   in Loop: Header=BB8_74 Depth=2
	ldr	x10, [sp, #72]          // 8-byte Folded Reload
	//APP
	// atomic_add
	prfm	pstl1strm, [x10]
1:	ldxr	w8, [x10]
	add	w8, w8, 1
	stxr	w9, w8, [x10]
	cbnz	w9, 1b
	//NO_APP
.LBB8_77:                               //   in Loop: Header=BB8_74 Depth=2
	ldr	w23, [x19, #1188]
	stur	w11, [x29, #-100]       // 4-byte Folded Spill
	cbz	w23, .LBB8_73
// %bb.78:                              //   in Loop: Header=BB8_74 Depth=2
	ldur	x21, [x29, #-112]       // 8-byte Folded Reload
	mov	w28, wzr
	b	.LBB8_81
.LBB8_79:                               //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x19
	mov	w1, w27
	bl	f2fs_ra_node_page
.LBB8_80:                               //   in Loop: Header=BB8_81 Depth=3
	ldr	w23, [x19, #1188]
	add	w28, w28, #1            // =1
	add	x21, x21, #7            // =7
	cmp	w28, w23
	b.hs	.LBB8_73
.LBB8_81:                               //   Parent Loop BB8_14 Depth=1
                                        //     Parent Loop BB8_74 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	w27, [x21]
	ldur	x8, [x29, #-96]         // 8-byte Folded Reload
	cbnz	w8, .LBB8_93
// %bb.82:                              //   in Loop: Header=BB8_81 Depth=3
	ldur	x8, [x29, #-88]         // 8-byte Folded Reload
	ldr	w22, [x8, #1192]
	ldrsw	x19, [x8, #1284]
	ldr	w20, [x8, #1184]
	ldrsw	x26, [x8, #1272]
	ldrsw	x24, [x8, #1296]
	ldr	x8, [x8, #80]
	tbnz	w8, #3, .LBB8_93
// %bb.83:                              //   in Loop: Header=BB8_81 Depth=3
	ldur	x8, [x29, #-88]         // 8-byte Folded Reload
	ldr	x11, [x8, #136]
	ldr	x8, [x11, #8]
	ldr	w9, [x11, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	b.eq	.LBB8_85
// %bb.84:                              //   in Loop: Header=BB8_81 Depth=3
	udiv	w10, w9, w22
	cmp	w8, w10
	b.eq	.LBB8_86
	b	.LBB8_90
.LBB8_85:                               //   in Loop: Header=BB8_81 Depth=3
	mov	w10, #-1
	cmp	w8, w10
	b.ne	.LBB8_90
.LBB8_86:                               //   in Loop: Header=BB8_81 Depth=3
	ldur	x10, [x29, #-88]        // 8-byte Folded Reload
	mov	w15, #48
	ldr	w12, [x10, #1284]
	ldr	w13, [x10, #1272]
	ldr	w16, [x10, #1272]
	ldr	x10, [x11, #24]
	ldr	x11, [x11]
	add	w12, w13, w12
	ldr	w14, [x10, #460]
	ldr	x11, [x11, #136]
	madd	x14, x14, x15, x11
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w13, w23, w14
	cmp	w13, w12
	b.lo	.LBB8_90
// %bb.87:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	w13, [x10, #580]
	madd	x13, x13, x15, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w23, w13
	cmp	w13, w12
	b.lo	.LBB8_90
// %bb.88:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	w13, [x10, #700]
	madd	x13, x13, x15, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w23, w13
	cmp	w13, w12
	b.lo	.LBB8_90
// %bb.89:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	w12, [x10, #100]
	madd	x11, x12, x15, x11
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w11, w23, w11
	cmp	w11, w16
	b.hs	.LBB8_173
.LBB8_90:                               //   in Loop: Header=BB8_81 Depth=3
	mul	w10, w22, w23
	cmn	w9, #1                  // =1
	sub	x10, x10, #1            // =1
	add	x12, x10, x26
	add	x11, x10, x19
	asr	x12, x12, x20
	add	x10, x10, x24
	asr	x11, x11, x20
	udiv	w12, w12, w22
	asr	x10, x10, x20
	udiv	w11, w11, w22
	udiv	w10, w10, w22
	add	w11, w11, w12, lsl #1
	add	w10, w11, w10
	b.eq	.LBB8_92
// %bb.91:                              //   in Loop: Header=BB8_81 Depth=3
	ldur	x11, [x29, #-88]        // 8-byte Folded Reload
	ldr	w11, [x11, #1192]
	udiv	w9, w9, w11
.LBB8_92:                               //   in Loop: Header=BB8_81 Depth=3
	add	w9, w10, w9
	cmp	w8, w9
	b.ls	.LBB8_200
.LBB8_93:                               //   in Loop: Header=BB8_81 Depth=3
	ldur	x19, [x29, #-88]        // 8-byte Folded Reload
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
	add	x22, x8, #88            // =88
	mov	x0, x22
	bl	down_read
	ldr	x8, [x19, #136]
	mov	w26, #48
	mov	w9, w28
	mov	x0, x22
	lsr	x20, x9, #3
	mvn	w9, w28
	and	w9, w9, #0x7
	mov	w10, #1
	ldr	x8, [x8]
	lsl	w24, w10, w9
	ldr	x8, [x8, #136]
	madd	x8, x25, x26, x8
	ldr	x8, [x8, #8]
	ldrb	w8, [x8, x20]
	and	w23, w24, w8
	bl	up_read
	cbz	w23, .LBB8_80
// %bb.94:                              //   in Loop: Header=BB8_81 Depth=3
	ldur	w8, [x29, #-100]        // 4-byte Folded Reload
	cmp	w8, #1                  // =1
	b.eq	.LBB8_79
// %bb.95:                              //   in Loop: Header=BB8_81 Depth=3
	cbnz	w8, .LBB8_97
// %bb.96:                              //   in Loop: Header=BB8_81 Depth=3
	mov	w8, #289
	mov	x0, x19
	movk	w8, #8210, lsl #16
	mov	w2, #1
	mov	w3, #1
	mov	w4, #1
	mul	x8, x27, x8
	lsr	x8, x8, #32
	sub	w9, w27, w8
	add	w8, w8, w9, lsr #1
	lsr	w1, w8, #8
	bl	f2fs_ra_meta_pages
	b	.LBB8_80
.LBB8_97:                               //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x19
	mov	x1, x27
	bl	f2fs_get_node_page
	cmn	x0, #4095               // =4095
	b.lo	.LBB8_101
// %bb.98:                              //   in Loop: Header=BB8_81 Depth=3
	ldrb	w8, [x19, #1992]
	cbz	w8, .LBB8_80
// %bb.99:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x9, #32401
	ldr	x8, [x19, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB8_80
// %bb.100:                             //   in Loop: Header=BB8_81 Depth=3
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.gc_node_segment
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.gc_node_segment
	mov	w3, #2071
	bl	f2fs_printk
	b	.LBB8_80
.LBB8_101:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x19, #136]
	mov	x22, x0
	ldr	x8, [x8]
	add	x23, x8, #88            // =88
	mov	x0, x23
	bl	down_read
	ldr	x8, [x19, #136]
	mov	x0, x23
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	madd	x8, x25, x26, x8
	ldr	x8, [x8, #8]
	ldrb	w8, [x8, x20]
	and	w20, w24, w8
	bl	up_read
	cbz	w20, .LBB8_120
// %bb.102:                             //   in Loop: Header=BB8_81 Depth=3
	sub	x2, x29, #32            // =32
	mov	x0, x19
	mov	w1, w27
	mov	w3, wzr
	bl	get_node_info_ex
	cbz	w0, .LBB8_137
// %bb.103:                             //   in Loop: Header=BB8_81 Depth=3
	cbz	x22, .LBB8_80
// %bb.104:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x22, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x22, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB8_141
// %bb.105:                             //   in Loop: Header=BB8_81 Depth=3
	tbnz	w8, #0, .LBB8_119
// %bb.106:                             //   in Loop: Header=BB8_81 Depth=3
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB8_109
// %bb.107:                             //   in Loop: Header=BB8_81 Depth=3
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB8_109
// %bb.108:                             //   in Loop: Header=BB8_81 Depth=3
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB8_109:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB8_111
// %bb.110:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB8_191
.LBB8_111:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x0, [x22, #24]
.LBB8_112:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB8_114
// %bb.113:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB8_192
.LBB8_114:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x0, [x22, #24]
.LBB8_115:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB8_117
// %bb.116:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB8_193
.LBB8_117:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x0, [x22, #24]
.LBB8_118:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB8_119:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB8_147
	b	.LBB8_263
.LBB8_120:                              //   in Loop: Header=BB8_81 Depth=3
	cbz	x22, .LBB8_80
// %bb.121:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x22, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x22, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB8_148
// %bb.122:                             //   in Loop: Header=BB8_81 Depth=3
	tbnz	w8, #0, .LBB8_136
// %bb.123:                             //   in Loop: Header=BB8_81 Depth=3
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB8_126
// %bb.124:                             //   in Loop: Header=BB8_81 Depth=3
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB8_126
// %bb.125:                             //   in Loop: Header=BB8_81 Depth=3
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB8_126:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB8_128
// %bb.127:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB8_194
.LBB8_128:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x0, [x22, #24]
.LBB8_129:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB8_131
// %bb.130:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB8_195
.LBB8_131:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x0, [x22, #24]
.LBB8_132:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB8_134
// %bb.133:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB8_196
.LBB8_134:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x0, [x22, #24]
.LBB8_135:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB8_136:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB8_154
	b	.LBB8_264
.LBB8_137:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	w9, [sp, #64]           // 4-byte Folded Reload
	ldur	w8, [x29, #-24]
	add	w9, w9, w28
	cmp	w8, w9
	b.ne	.LBB8_156
// %bb.138:                             //   in Loop: Header=BB8_81 Depth=3
	ldur	x20, [x29, #-96]        // 8-byte Folded Reload
	mov	x0, x22
	mov	w1, w20
	bl	f2fs_move_node_page
	cmp	w20, #1                 // =1
	b.ne	.LBB8_177
// %bb.139:                             //   in Loop: Header=BB8_81 Depth=3
	cbnz	w0, .LBB8_177
// %bb.140:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	w8, [sp, #116]          // 4-byte Folded Reload
	add	w8, w8, #1              // =1
	str	w8, [sp, #116]          // 4-byte Folded Spill
	b	.LBB8_178
.LBB8_141:                              //   in Loop: Header=BB8_81 Depth=3
	tbnz	w8, #0, .LBB8_146
// %bb.142:                             //   in Loop: Header=BB8_81 Depth=3
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB8_145
// %bb.143:                             //   in Loop: Header=BB8_81 Depth=3
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB8_145
// %bb.144:                             //   in Loop: Header=BB8_81 Depth=3
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB8_145:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB8_146:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB8_265
.LBB8_147:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	unlock_page
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x22, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB8_80
	b	.LBB8_155
.LBB8_148:                              //   in Loop: Header=BB8_81 Depth=3
	tbnz	w8, #0, .LBB8_153
// %bb.149:                             //   in Loop: Header=BB8_81 Depth=3
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB8_152
// %bb.150:                             //   in Loop: Header=BB8_81 Depth=3
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB8_152
// %bb.151:                             //   in Loop: Header=BB8_81 Depth=3
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB8_152:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB8_153:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB8_266
.LBB8_154:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	unlock_page
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x22, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB8_80
.LBB8_155:                              //   in Loop: Header=BB8_81 Depth=3
	bl	__put_page
	b	.LBB8_80
.LBB8_156:                              //   in Loop: Header=BB8_81 Depth=3
	cbz	x22, .LBB8_188
// %bb.157:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x22, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x22, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB8_180
// %bb.158:                             //   in Loop: Header=BB8_81 Depth=3
	tbnz	w8, #0, .LBB8_172
// %bb.159:                             //   in Loop: Header=BB8_81 Depth=3
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB8_162
// %bb.160:                             //   in Loop: Header=BB8_81 Depth=3
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB8_162
// %bb.161:                             //   in Loop: Header=BB8_81 Depth=3
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB8_162:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB8_164
// %bb.163:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB8_197
.LBB8_164:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x0, [x22, #24]
.LBB8_165:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB8_167
// %bb.166:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB8_198
.LBB8_167:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x0, [x22, #24]
.LBB8_168:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB8_170
// %bb.169:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB8_199
.LBB8_170:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x0, [x22, #24]
.LBB8_171:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB8_172:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB8_186
	b	.LBB8_267
.LBB8_173:                              //   in Loop: Header=BB8_81 Depth=3
	ldur	x8, [x29, #-88]         // 8-byte Folded Reload
	ldr	w8, [x8, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB8_93
// %bb.174:                             //   in Loop: Header=BB8_81 Depth=3
	ldur	x8, [x29, #-88]         // 8-byte Folded Reload
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB8_93
// %bb.175:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	w1, [x10, #820]
	ldur	x0, [x29, #-88]         // 8-byte Folded Reload
	str	w16, [sp, #20]          // 4-byte Folded Spill
	str	x1, [sp, #8]            // 8-byte Folded Spill
                                        // kill: def $w1 killed $w1 killed $x1
	bl	f2fs_usable_blks_in_seg
	ldur	x8, [x29, #-88]         // 8-byte Folded Reload
	mov	w10, #48
	ldr	x11, [sp, #8]           // 8-byte Folded Reload
	ldr	x9, [x8, #136]
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x11, x10, x8
	ldr	w10, [sp, #20]          // 4-byte Folded Reload
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w10
	b.hs	.LBB8_93
// %bb.176:                             //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x9, #8]
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB8_90
.LBB8_177:                              //   in Loop: Header=BB8_81 Depth=3
	cbnz	w0, .LBB8_179
.LBB8_178:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	w8, [sp, #68]           // 4-byte Folded Reload
	add	w8, w8, #1              // =1
	str	w8, [sp, #68]           // 4-byte Folded Spill
.LBB8_179:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x19, #2016]
	ldr	w12, [sp, #92]          // 4-byte Folded Reload
	ldr	w9, [x8, #444]
	ldr	w10, [x8, #452]
	ldr	w11, [x8, #460]
	add	w9, w9, #1              // =1
	add	w10, w10, #1            // =1
	add	w11, w11, w12
	str	w9, [x8, #444]
	str	w10, [x8, #452]
	str	w11, [x8, #460]
	b	.LBB8_80
.LBB8_180:                              //   in Loop: Header=BB8_81 Depth=3
	tbnz	w8, #0, .LBB8_185
// %bb.181:                             //   in Loop: Header=BB8_81 Depth=3
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB8_184
// %bb.182:                             //   in Loop: Header=BB8_81 Depth=3
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB8_184
// %bb.183:                             //   in Loop: Header=BB8_81 Depth=3
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB8_184:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB8_185:                              //   in Loop: Header=BB8_81 Depth=3
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB8_268
.LBB8_186:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	unlock_page
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x22, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB8_188
// %bb.187:                             //   in Loop: Header=BB8_81 Depth=3
	bl	__put_page
.LBB8_188:                              //   in Loop: Header=BB8_81 Depth=3
	ldrb	w8, [x19, #1992]
	cbz	w8, .LBB8_80
// %bb.189:                             //   in Loop: Header=BB8_81 Depth=3
	mov	x9, #32401
	ldr	x8, [x19, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB8_80
// %bb.190:                             //   in Loop: Header=BB8_81 Depth=3
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.gc_node_segment
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.gc_node_segment
	mov	w3, #2088
	bl	f2fs_printk
	b	.LBB8_80
.LBB8_191:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB8_112
.LBB8_192:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB8_115
.LBB8_193:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB8_118
.LBB8_194:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB8_129
.LBB8_195:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB8_132
.LBB8_196:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB8_135
.LBB8_197:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB8_165
.LBB8_198:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB8_168
.LBB8_199:                              //   in Loop: Header=BB8_81 Depth=3
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB8_171
.LBB8_200:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x28, [sp, #120]         // 8-byte Folded Reload
	mov	x0, x28
	bl	mutex_lock
	ldur	x19, [x29, #-88]        // 8-byte Folded Reload
	mov	w26, #48
	ldr	x23, [sp, #104]         // 8-byte Folded Reload
	ldr	w24, [sp, #132]         // 4-byte Folded Reload
	ldur	x20, [x29, #-120]       // 8-byte Folded Reload
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB8_205
// %bb.201:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB8_205
// %bb.202:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	w8, [x19, #3308]
	cmp	w8, #1                  // =1
	b.hi	.LBB8_205
// %bb.203:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [x19, #2224]
	cbz	x9, .LBB8_207
// %bb.204:                             //   in Loop: Header=BB8_14 Depth=1
	add	x8, x9, x8, lsl #2
	ldr	w10, [sp, #68]          // 4-byte Folded Reload
	ldr	w9, [x8, #628]
	add	w9, w9, w10
	str	w9, [x8, #628]
.LBB8_205:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB8_207
.LBB8_206:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	w9, [x8, #136]
	ldr	w10, [sp, #68]          // 4-byte Folded Reload
	add	w9, w9, w10
	str	w9, [x8, #136]
.LBB8_207:                              //   in Loop: Header=BB8_14 Depth=1
	mov	x0, x28
	bl	mutex_unlock
	ldr	w8, [x19, #3312]
	cbnz	w8, .LBB8_51
	b	.LBB8_52
.LBB8_208:                              //   in Loop: Header=BB8_14 Depth=1
	cbz	x9, .LBB8_232
// %bb.209:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	x10, [sp, #24]          // 8-byte Folded Reload
	add	x9, x9, x10, lsl #3
	add	x8, x9, x8, lsl #2
	ldr	w9, [x8, #596]
	add	w9, w9, #1              // =1
	str	w9, [x8, #596]
	ldr	x8, [x19, #2224]
	cbnz	w24, .LBB8_66
.LBB8_210:                              //   in Loop: Header=BB8_14 Depth=1
	cbz	x8, .LBB8_213
// %bb.211:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [sp, #80]           // 8-byte Folded Reload
	add	x8, x8, x9, lsl #2
	ldr	w9, [x8, #112]
	add	w9, w9, #1              // =1
	str	w9, [x8, #112]
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB8_218
.LBB8_212:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [sp, #136]          // 8-byte Folded Reload
	add	x8, x8, x9, lsl #3
	ldr	x9, [x8, #440]
	add	x9, x9, #1              // =1
	str	x9, [x8, #440]
.LBB8_213:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB8_218
// %bb.214:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	x10, [x19, #136]
	ldr	w9, [x19, #1192]
	ldr	x10, [x10]
	cmp	w9, #2                  // =2
	b.lo	.LBB8_216
// %bb.215:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	x10, [x10, #144]
	udiv	w9, w25, w9
	ldr	w9, [x10, w9, uxtw #2]
	b	.LBB8_217
.LBB8_216:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [x10, #136]
	mul	x10, x25, x26
	ldr	w9, [x9, x10]
	ubfx	w9, w9, #6, #10
.LBB8_217:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x10, [sp, #136]         // 8-byte Folded Reload
	add	x8, x8, x10, lsl #3
	ldr	x10, [x8, #496]
	add	x9, x10, w9, uxtw
	str	x9, [x8, #496]
.LBB8_218:                              //   in Loop: Header=BB8_14 Depth=1
	mov	x0, x28
	bl	mutex_unlock
	add	x8, x25, #1             // =1
	cmp	x8, x20
	b.hs	.LBB8_221
// %bb.219:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	w9, [x19, #1192]
	cmp	w9, #2                  // =2
	b.lo	.LBB8_221
// %bb.220:                             //   in Loop: Header=BB8_14 Depth=1
	str	w8, [x21]
.LBB8_221:                              //   in Loop: Header=BB8_14 Depth=1
	cbz	x27, .LBB8_13
// %bb.222:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x27, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB8_13
// %bb.223:                             //   in Loop: Header=BB8_14 Depth=1
	bl	__put_page
	b	.LBB8_13
.LBB8_224:                              //   in Loop: Header=BB8_14 Depth=1
	ldur	x8, [x29, #-96]         // 8-byte Folded Reload
	cmp	w8, #1                  // =1
	b.ne	.LBB8_226
// %bb.225:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	x10, [sp, #72]          // 8-byte Folded Reload
	//APP
	// atomic_sub
	prfm	pstl1strm, [x10]
1:	ldxr	w8, [x10]
	sub	w8, w8, 1
	stxr	w9, w8, [x10]
	cbnz	w9, 1b
	//NO_APP
.LBB8_226:                              //   in Loop: Header=BB8_14 Depth=1
	mov	x0, x28
	bl	mutex_lock
	ldr	w8, [x19, #3024]
	ldr	x23, [sp, #104]         // 8-byte Folded Reload
	cmp	w8, #2                  // =2
	b.ne	.LBB8_238
// %bb.227:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB8_238
// %bb.228:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	w8, [x19, #3308]
	cmp	w8, #1                  // =1
	b.hi	.LBB8_238
// %bb.229:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [x19, #2224]
	ldur	x10, [x29, #-96]        // 8-byte Folded Reload
	cbz	w10, .LBB8_236
// %bb.230:                             //   in Loop: Header=BB8_14 Depth=1
	cbz	x9, .LBB8_207
// %bb.231:                             //   in Loop: Header=BB8_14 Depth=1
	add	x8, x9, x8, lsl #2
	ldr	w10, [sp, #68]          // 4-byte Folded Reload
	ldr	w9, [x8, #588]
	add	w9, w9, w10
	str	w9, [x8, #588]
	b	.LBB8_238
.LBB8_232:                              //   in Loop: Header=BB8_14 Depth=1
	mov	x8, xzr
	cbnz	w24, .LBB8_66
	b	.LBB8_210
.LBB8_233:                              //   in Loop: Header=BB8_14 Depth=1
	mov	x0, x19
	mov	w1, #8
.LBB8_234:                              //   in Loop: Header=BB8_14 Depth=1
	bl	f2fs_dm_should_change_curseg
	tbz	w0, #0, .LBB8_25
.LBB8_235:                              //   in Loop: Header=BB8_14 Depth=1
	mov	w8, #1
	str	w8, [x19, #3312]
	b	.LBB8_25
.LBB8_236:                              //   in Loop: Header=BB8_14 Depth=1
	cbz	x9, .LBB8_207
// %bb.237:                             //   in Loop: Header=BB8_14 Depth=1
	add	x8, x9, x8, lsl #2
	ldr	w10, [sp, #68]          // 4-byte Folded Reload
	ldr	w9, [x8, #628]
	add	w9, w9, w10
	str	w9, [x8, #628]
.LBB8_238:                              //   in Loop: Header=BB8_14 Depth=1
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB8_207
// %bb.239:                             //   in Loop: Header=BB8_14 Depth=1
	ldr	x9, [sp, #80]           // 8-byte Folded Reload
	add	x8, x8, x9, lsl #2
	b	.LBB8_206
.LBB8_240:
	sub	x0, x29, #80            // =80
	bl	blk_start_plug
	mov	w23, wzr
	b	.LBB8_251
.LBB8_241:
	cmp	w26, w25
	b.ls	.LBB8_260
// %bb.242:
	ldur	x19, [x29, #-88]        // 8-byte Folded Reload
	b	.LBB8_244
.LBB8_243:                              //   in Loop: Header=BB8_244 Depth=1
	add	w25, w25, #1            // =1
	cmp	w25, w26
	b.eq	.LBB8_260
.LBB8_244:                              // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #136]
	mov	w2, wzr
	ldr	x9, [x19, #248]
	mov	w3, wzr
	ldr	w8, [x8, #88]
	ldr	x0, [x9, #48]
	add	w1, w25, w8
	bl	pagecache_get_page
	cbz	x0, .LBB8_243
// %bb.245:                             //   in Loop: Header=BB8_244 Depth=1
	ldr	x8, [x0, #8]
	mov	x20, x0
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x0, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB8_247
// %bb.246:                             //   in Loop: Header=BB8_244 Depth=1
	bl	__put_page
.LBB8_247:                              //   in Loop: Header=BB8_244 Depth=1
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x20, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB8_243
// %bb.248:                             //   in Loop: Header=BB8_244 Depth=1
	bl	__put_page
	b	.LBB8_243
.LBB8_249:
	ldr	w8, [sp, #112]          // 4-byte Folded Reload
	cbz	w8, .LBB8_251
// %bb.250:
	mov	x0, x19
	mov	w1, w24
	bl	f2fs_submit_merged_write
.LBB8_251:
	sub	x0, x29, #80            // =80
	bl	blk_finish_plug
	ldr	x8, [x19, #2016]
	add	x22, x19, #2192         // =2192
	mov	x0, x22
	ldr	w9, [x8, #404]
	add	w9, w9, #1              // =1
	str	w9, [x8, #404]
	bl	mutex_lock
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB8_259
// %bb.252:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB8_259
// %bb.253:
	ldr	w8, [x19, #3308]
	cmp	w8, #1                  // =1
	b.hi	.LBB8_259
// %bb.254:
	ldr	x9, [x19, #2224]
	ldur	x10, [x29, #-96]        // 8-byte Folded Reload
	cbz	w10, .LBB8_257
// %bb.255:
	cbz	x9, .LBB8_259
// %bb.256:
	add	x8, x9, x8, lsl #2
	ldr	w9, [x8, #556]
	add	w9, w9, #1              // =1
	str	w9, [x8, #556]
	b	.LBB8_259
.LBB8_257:
	cbz	x9, .LBB8_259
// %bb.258:
	add	x8, x9, x8, lsl #2
	ldr	w9, [x8, #596]
	add	w9, w9, #1              // =1
	str	w9, [x8, #596]
.LBB8_259:
	mov	x0, x22
	bl	mutex_unlock
.LBB8_260:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB8_262
// %bb.261:
	mov	w0, w23
	ldp	x20, x19, [sp, #352]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #336]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #320]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #304]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #288]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #272]    // 16-byte Folded Reload
	add	sp, sp, #368            // =368
	ret
.LBB8_262:
	bl	__stack_chk_fail
.LBB8_263:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB8_264:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB8_265:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB8_266:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB8_267:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB8_268:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB8_269:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB8_272
// %bb.270:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB8_272
// %bb.271:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.sanity_check_seg_type
	add	x1, x1, :lo12:.L.str.19
	mov	w3, #47
	add	x2, x2, :lo12:.L__func__.sanity_check_seg_type
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB8_272:
	ldur	x19, [x29, #-88]        // 8-byte Folded Reload
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.h"; .popsection; .long 14472b - 14470b; .short 47; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end8:
	.size	do_garbage_collect, .Lfunc_end8-do_garbage_collect
                                        // -- End function
	.section	.init.text,"ax",@progbits
	.globl	f2fs_create_garbage_collection_cache // -- Begin function f2fs_create_garbage_collection_cache
	.p2align	2
	.type	f2fs_create_garbage_collection_cache,@function
f2fs_create_garbage_collection_cache:   // @f2fs_create_garbage_collection_cache
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x0, .L.str.6
	mov	w1, #56
	add	x0, x0, :lo12:.L.str.6
	mov	w2, wzr
	mov	w3, #131072
	mov	x4, xzr
	mov	x29, sp
	bl	kmem_cache_create
	mov	w9, #-12
	cmp	x0, #0                  // =0
	mov	x8, x0
	csel	w0, w9, wzr, eq
	adrp	x9, victim_entry_slab
	str	x8, [x9, :lo12:victim_entry_slab]
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end9:
	.size	f2fs_create_garbage_collection_cache, .Lfunc_end9-f2fs_create_garbage_collection_cache
                                        // -- End function
	.text
	.globl	f2fs_destroy_garbage_collection_cache // -- Begin function f2fs_destroy_garbage_collection_cache
	.p2align	3
	.type	f2fs_destroy_garbage_collection_cache,@function
f2fs_destroy_garbage_collection_cache:  // @f2fs_destroy_garbage_collection_cache
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x8, victim_entry_slab
	mov	x29, sp
	ldr	x0, [x8, :lo12:victim_entry_slab]
	bl	kmem_cache_destroy
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end10:
	.size	f2fs_destroy_garbage_collection_cache, .Lfunc_end10-f2fs_destroy_garbage_collection_cache
                                        // -- End function
	.globl	f2fs_build_gc_manager   // -- Begin function f2fs_build_gc_manager
	.p2align	3
	.type	f2fs_build_gc_manager,@function
f2fs_build_gc_manager:                  // @f2fs_build_gc_manager
// %bb.0:
	ldr	x8, [x0, #136]
	adrp	x9, default_v_ops
	add	x9, x9, :lo12:default_v_ops
	ldr	x8, [x8, #16]
	str	x9, [x8]
	mov	w8, #2048
	ldr	w9, [x0, #3024]
	str	x8, [x0, #1912]
	cmp	w9, #2                  // =2
	b.lt	.LBB11_15
// %bb.1:
	ldr	w8, [x0, #1192]
	cmp	w8, #1                  // =1
	b.ne	.LBB11_15
// %bb.2:
	ldr	x12, [x0, #3032]
	ldr	w8, [x12, #80]
	add	w10, w8, #3             // =3
	cmp	w10, #4                 // =4
	b.lo	.LBB11_11
// %bb.3:
	ldr	x10, [x0]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	ldr	x10, [x10, #248]
	b	.LBB11_5
.LBB11_4:                               //   in Loop: Header=BB11_5 Depth=1
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x9
	b.eq	.LBB11_8
.LBB11_5:                               // =>This Inner Loop Header: Depth=1
	ldur	w13, [x12, #-4]
	cmp	w13, w8
	b.hi	.LBB11_4
// %bb.6:                               //   in Loop: Header=BB11_5 Depth=1
	ldr	w13, [x12]
	cmp	w13, w8
	b.lo	.LBB11_4
// %bb.7:
	ldur	x10, [x12, #-80]
.LBB11_8:
	cbz	x10, .LBB11_11
// %bb.9:
	ldr	x9, [x0, #136]
	cbz	x9, .LBB11_12
// %bb.10:
	add	x10, x9, #80            // =80
	b	.LBB11_13
.LBB11_11:
	mov	w8, wzr
	b	.LBB11_14
.LBB11_12:
	ldr	x10, [x0, #16]
	add	x10, x10, #72           // =72
.LBB11_13:
	ldr	x9, [x9, #8]
	ldr	w10, [x10]
	ldr	w11, [x0, #1184]
	ldr	w9, [x9]
	sub	w8, w8, w10
	lsr	w8, w8, w11
	sub	w8, w8, w9
	add	w8, w8, #1              // =1
.LBB11_14:
	ldr	x9, [x0, #136]
	ldr	x9, [x9]
	str	w8, [x9, #212]
.LBB11_15:
	ldrb	w9, [x0, #1427]
	mov	w8, #14975
	movk	w8, #9, lsl #16
	tbz	w9, #3, .LBB11_18
// %bb.16:
	ldr	x9, [x0, #136]
	ldr	x9, [x9]
	ldr	x9, [x9, #152]
	cmp	x9, x8
	b.ls	.LBB11_18
// %bb.17:
	mov	w9, #1
	strb	w9, [x0, #1800]
.LBB11_18:
	mov	x11, #10
	add	x9, x0, #1824           // =1824
	mov	x10, #85899345920
	movk	x11, #60, lsl #32
	add	x8, x8, #1              // =1
	str	xzr, [x0, #1816]
	str	xzr, [x0, #1808]
	str	x9, [x0, #1824]
	str	x9, [x0, #1832]
	str	x10, [x0, #1840]
	str	x11, [x0, #1848]
	str	x8, [x0, #1856]
	ret
.Lfunc_end11:
	.size	f2fs_build_gc_manager, .Lfunc_end11-f2fs_build_gc_manager
                                        // -- End function
	.globl	f2fs_resize_fs          // -- Begin function f2fs_resize_fs
	.p2align	3
	.type	f2fs_resize_fs,@function
f2fs_resize_fs:                         // @f2fs_resize_fs
// %bb.0:
	sub	sp, sp, #144            // =144
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	stp	x28, x27, [sp, #64]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #80]     // 16-byte Folded Spill
	adrp	x13, .L__const.free_segment_range.cpc
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	add	x13, x13, :lo12:.L__const.free_segment_range.cpc
	stp	x24, x23, [sp, #96]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	w9, [x0, #1192]
	ldr	w8, [x0, #1188]
	ldr	x12, [x0, #16]
	mul	w9, w8, w9
	lsl	w10, w9, #12
	add	x11, x1, x10
	sub	x11, x11, #1            // =1
	udiv	x21, x11, x10
	ldur	x11, [x12, #36]
	ldp	x14, x10, [x13]
	and	x12, x21, #0xffffffff
	ldp	x15, x13, [x13, #16]
	mul	x26, x12, x9
	stp	x14, x10, [sp, #8]
	cmp	x26, x11
	stp	x15, x13, [sp, #24]
	b.hi	.LBB12_9
// %bb.1:
	ldrsw	x9, [x0, #3024]
	mov	x19, x0
	cmp	w9, #2                  // =2
	b.lt	.LBB12_3
// %bb.2:
	ldr	x10, [x19, #3032]
	mov	w11, #192
	madd	x9, x9, x11, x10
	ldur	w9, [x9, #-120]
	mul	x8, x9, x8
	cmp	x8, x26
	b.ls	.LBB12_9
.LBB12_3:
	cbz	x26, .LBB12_12
// %bb.4:
	ldr	x8, [x19, #80]
	tbnz	w8, #2, .LBB12_13
// %bb.5:
	ldrb	w8, [x19, #1427]
	tbnz	w8, #1, .LBB12_14
// %bb.6:
	add	x20, x19, #1664         // =1664
	mov	x0, x20
	bl	down_write_trylock
	cbz	w0, .LBB12_15
// %bb.7:
	add	x1, sp, #8              // =8
	mov	x0, x19
	bl	f2fs_write_checkpoint
	cbz	w0, .LBB12_16
// %bb.8:
	mov	x0, x20
	bl	up_write
	mov	w24, #-11
	b	.LBB12_10
.LBB12_9:
	mov	w24, #-22
.LBB12_10:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB12_50
// %bb.11:
	mov	w0, w24
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #144            // =144
	ret
.LBB12_12:
	mov	w24, wzr
	b	.LBB12_10
.LBB12_13:
	adrp	x1, .L.str.7
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.7
	bl	f2fs_printk
	mov	w24, #-117
	b	.LBB12_10
.LBB12_14:
	adrp	x1, .L.str.8
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.8
	bl	f2fs_printk
	mov	w24, #-22
	b	.LBB12_10
.LBB12_15:
	mov	w24, #-11
	b	.LBB12_10
.LBB12_16:
	add	x22, x19, #368          // =368
	mov	w8, #1
	mov	x0, x22
	strb	w8, [x19, #3292]
	bl	_raw_spin_lock
	ldr	x8, [x19, #352]
	cbz	x8, .LBB12_18
// %bb.17:
	adrp	x23, jiffies
	ldr	x8, [x19, #360]
	ldr	x9, [x23, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB12_33
.LBB12_18:
	mov	x0, x22
	bl	_raw_spin_unlock
	add	x23, x19, #304          // =304
	mov	x0, x23
	bl	down_read
	add	x22, x19, #2236         // =2236
	mov	x0, x22
	bl	_raw_spin_lock
	ldr	w8, [x19, #1240]
	mov	x0, x22
	ldr	w9, [x19, #1256]
	ldr	w10, [x19, #1264]
	ldr	w11, [x19, #1436]
	add	x8, x26, x8
	ldr	w24, [x19, #1236]
	add	x8, x8, x9
	add	x8, x8, x10
	add	x25, x8, x11
	bl	_raw_spin_unlock
	cmp	x25, x24
	b.ls	.LBB12_20
// %bb.19:
	mov	w24, #-28
	b	.LBB12_21
.LBB12_20:
	mov	x0, x19
	mov	w1, w21
	mov	w2, #1
	bl	free_segment_range
	mov	w24, w0
.LBB12_21:
	mov	x0, x23
	bl	up_read
	mov	x0, x20
	bl	up_write
	cbnz	w24, .LBB12_49
// %bb.22:
	cbz	x19, .LBB12_24
// %bb.23:
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 8192
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB12_24:
	ldr	x0, [x19]
	bl	freeze_super
	mov	x0, x20
	bl	down_write
	add	x23, x19, #256          // =256
	mov	x0, x23
	bl	down_write
	mov	x0, x22
	bl	_raw_spin_lock
	ldr	w8, [x19, #1240]
	ldr	w9, [x19, #1256]
	ldr	w10, [x19, #1264]
	ldr	w11, [x19, #1436]
	add	x12, x26, x8
	ldr	w8, [x19, #1236]
	add	x9, x12, x9
	add	x9, x9, x10
	add	x9, x9, x11
	cmp	x9, x8
	b.ls	.LBB12_26
// %bb.25:
	mov	w24, #-28
	b	.LBB12_47
.LBB12_26:
	sub	w8, w8, w26
	mov	x0, x22
	str	w8, [x19, #1236]
	bl	_raw_spin_unlock
	mov	x0, x19
	mov	w1, w21
	mov	w2, wzr
	bl	free_segment_range
	mov	w24, w0
	cbnz	w0, .LBB12_44
// %bb.27:
	ldr	w8, [x19, #1192]
	add	x25, x19, #24           // =24
	ldr	x27, [x19, #16]
	mov	x0, x25
	mneg	w24, w21, w8
	bl	down_write
	ldp	w8, w9, [x27, #44]
	ldr	w10, [x27, #68]
	ldur	x11, [x27, #36]
	sub	w8, w8, w21
	add	w9, w9, w24
	add	w10, w10, w24
	stp	w8, w9, [x27, #44]
	sxtw	x9, w24
	str	w10, [x27, #68]
	ldr	w8, [x19, #1188]
	madd	x8, x8, x9, x11
	stur	x8, [x27, #36]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.lt	.LBB12_29
// %bb.28:
	sub	w8, w8, #1              // =1
	mov	w9, #68
	smaddl	x8, w8, w9, x27
	add	x8, x8, #2265           // =2265
	ldr	w9, [x8]
	add	w9, w9, w24
	str	w9, [x8]
.LBB12_29:
	mov	x0, x25
	bl	up_write
	mov	x0, x19
	mov	w1, wzr
	bl	f2fs_commit_super
	cbz	w0, .LBB12_34
// %bb.30:
	ldr	w8, [x19, #1192]
	mov	w24, w0
	ldr	x28, [x19, #16]
	mov	x0, x25
	mul	w27, w8, w21
	bl	down_write
	ldp	w8, w9, [x28, #44]
	ldr	w10, [x28, #68]
	ldur	x11, [x28, #36]
	add	w8, w8, w21
	add	w9, w9, w27
	add	w10, w10, w27
	stp	w8, w9, [x28, #44]
	sxtw	x9, w27
	str	w10, [x28, #68]
	ldr	w8, [x19, #1188]
	madd	x8, x8, x9, x11
	stur	x8, [x28, #36]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.lt	.LBB12_32
// %bb.31:
	sub	w8, w8, #1              // =1
	mov	w9, #68
	smaddl	x8, w8, w9, x28
	add	x8, x8, #2265           // =2265
	ldr	w9, [x8]
	add	w9, w9, w27
	str	w9, [x8]
.LBB12_32:
	mov	x0, x25
	bl	up_write
	b	.LBB12_44
.LBB12_33:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x19, #360]
	adrp	x0, .L.str.30
	ldr	x2, [x23, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.30
	bl	printk
	ldr	x0, [x19, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB12_18
.LBB12_34:
	ldr	x9, [x19, #136]
	neg	w10, w21
	ldr	w8, [x19, #1192]
	ldr	w12, [x19, #1188]
	ldr	w11, [x9, #92]
	mul	w8, w8, w10
	ldr	x10, [x19, #224]
	add	w11, w11, w8
	ldr	x10, [x10, #8]
	str	w11, [x9, #92]
	ldr	x9, [x19, #136]
	ldr	w11, [x9, #96]
	add	w11, w11, w8
	str	w11, [x9, #96]
	ldr	w9, [x19, #1200]
	ldr	x11, [x19, #136]
	sub	w9, w9, w21
	str	w9, [x19, #1200]
	ldr	x9, [x11, #8]
	ldr	w11, [x9, #8]
	sub	w11, w11, w21
	str	w11, [x9, #8]
	ldr	x9, [x19, #136]
	ldr	x11, [x9, #8]
	ldr	w9, [x11, #4]
	add	w13, w9, w8
	sxtw	x9, w8
	mul	x9, x9, x12
	str	w13, [x11, #4]
	add	x10, x10, x9
	ldr	x11, [x19, #224]
	str	x10, [x11, #8]
	ldrsw	x10, [x19, #3024]
	cmp	w10, #2                 // =2
	b.lt	.LBB12_36
// %bb.35:
	mov	w11, #192
	ldr	x12, [x19, #3032]
	mul	x10, x10, x11
	sub	x10, x10, #192          // =192
	add	x11, x12, x10
	ldr	w12, [x11, #72]
	add	w8, w12, w8
	str	w8, [x11, #72]
	ldr	x8, [x19, #3032]
	add	x8, x8, x10
	ldr	w10, [x8, #80]
	add	w9, w10, w9
	str	w9, [x8, #80]
.LBB12_36:
	add	x8, x19, #80            // =80
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 8192
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	cbz	x19, .LBB12_38
// %bb.37:
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB12_38:
	add	x1, sp, #8              // =8
	mov	x0, x19
	bl	f2fs_write_checkpoint
	mov	w24, w0
	cbz	w0, .LBB12_48
// %bb.39:
	ldr	x9, [x19, #136]
	ldr	w8, [x19, #1192]
	ldr	x11, [x19, #224]
	ldr	w12, [x19, #1188]
	ldr	w10, [x9, #92]
	mul	w8, w8, w21
	ldr	x11, [x11, #8]
	add	w10, w10, w8
	str	w10, [x9, #92]
	ldr	x9, [x19, #136]
	ldr	w10, [x9, #96]
	add	w10, w10, w8
	str	w10, [x9, #96]
	ldr	w9, [x19, #1200]
	ldr	x10, [x19, #136]
	add	w9, w9, w21
	str	w9, [x19, #1200]
	ldr	x9, [x10, #8]
	ldr	w10, [x9, #8]
	add	w10, w10, w21
	str	w10, [x9, #8]
	ldr	x9, [x19, #136]
	ldr	x10, [x9, #8]
	ldr	w9, [x10, #4]
	add	w13, w9, w8
	sxtw	x9, w8
	mul	x9, x9, x12
	str	w13, [x10, #4]
	add	x11, x11, x9
	ldr	x10, [x19, #224]
	str	x11, [x10, #8]
	ldrsw	x10, [x19, #3024]
	cmp	w10, #2                 // =2
	b.lt	.LBB12_41
// %bb.40:
	mov	w11, #192
	ldr	x12, [x19, #3032]
	mul	x10, x10, x11
	sub	x10, x10, #192          // =192
	add	x11, x12, x10
	ldr	w12, [x11, #72]
	add	w8, w12, w8
	str	w8, [x11, #72]
	ldr	x8, [x19, #3032]
	add	x8, x8, x10
	ldr	w10, [x8, #80]
	add	w9, w10, w9
	str	w9, [x8, #80]
.LBB12_41:
	ldr	w8, [x19, #1192]
	mov	x0, x25
	ldr	x28, [x19, #16]
	mul	w27, w8, w21
	bl	down_write
	ldp	w8, w9, [x28, #44]
	ldr	w10, [x28, #68]
	ldur	x11, [x28, #36]
	add	w8, w8, w21
	add	w9, w9, w27
	add	w10, w10, w27
	stp	w8, w9, [x28, #44]
	sxtw	x9, w27
	str	w10, [x28, #68]
	ldr	w8, [x19, #1188]
	madd	x8, x8, x9, x11
	stur	x8, [x28, #36]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.lt	.LBB12_43
// %bb.42:
	sub	w8, w8, #1              // =1
	mov	w9, #68
	smaddl	x8, w8, w9, x28
	add	x8, x8, #2265           // =2265
	ldr	w9, [x8]
	add	w9, w9, w27
	str	w9, [x8]
.LBB12_43:
	mov	x0, x25
	bl	up_write
	mov	x0, x19
	mov	w1, wzr
	bl	f2fs_commit_super
.LBB12_44:
	cbz	x19, .LBB12_46
// %bb.45:
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB12_46:
	adrp	x1, .L.str.9
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.9
	bl	f2fs_printk
	mov	x0, x22
	bl	_raw_spin_lock
	ldr	w8, [x19, #1236]
	add	w8, w8, w26
	str	w8, [x19, #1236]
.LBB12_47:
	mov	x0, x22
	bl	_raw_spin_unlock
.LBB12_48:
	mov	x0, x23
	bl	up_write
	mov	x0, x20
	bl	up_write
	mov	x20, x19
	ldr	x0, [x20], #80
	bl	thaw_super
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x20]
1:	ldxr	x8, [x20]
	bic	x8, x8, 8192
	stxr	w9, x8, [x20]
	cbnz	w9, 1b
	//NO_APP
	cbz	w24, .LBB12_10
.LBB12_49:
	strb	wzr, [x19, #3292]
	b	.LBB12_10
.LBB12_50:
	bl	__stack_chk_fail
.Lfunc_end12:
	.size	f2fs_resize_fs, .Lfunc_end12-f2fs_resize_fs
                                        // -- End function
	.p2align	3               // -- Begin function free_segment_range
	.type	free_segment_range,@function
free_segment_range:                     // @free_segment_range
// %bb.0:
	sub	sp, sp, #192            // =192
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	stp	x28, x27, [sp, #112]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #128]    // 16-byte Folded Spill
	adrp	x9, .L__const.free_segment_range.cpc
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	add	x9, x9, :lo12:.L__const.free_segment_range.cpc
	stp	x24, x23, [sp, #144]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #160]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #176]    // 16-byte Folded Spill
	mov	x19, x0
	str	w2, [sp, #20]           // 4-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	w8, [x0, #1200]
	ldp	x10, x11, [x9, #16]
	ldr	x12, [x0, #136]
	sub	w8, w8, w1
	str	w1, [sp, #16]           // 4-byte Folded Spill
	stp	x10, x11, [x29, #-24]
	ldr	w10, [x0, #1192]
	str	w8, [x0, #1200]
	ldr	x11, [x12, #16]
	ldp	x13, x9, [x9]
	mul	w21, w10, w8
	ldr	w20, [x12, #96]
	add	x0, x11, #80            // =80
	stp	x13, x9, [x29, #-40]
	bl	mutex_lock
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
	ldr	w9, [x8, #200]
	cmp	w9, w21
	b.lo	.LBB13_2
// %bb.1:
	str	wzr, [x8, #200]
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
.LBB13_2:
	ldr	w9, [x8, #204]
	cmp	w9, w21
	b.lo	.LBB13_4
// %bb.3:
	str	wzr, [x8, #204]
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
.LBB13_4:
	ldr	w9, [x8, #208]
	cmp	w9, w21
	b.lo	.LBB13_6
// %bb.5:
	str	wzr, [x8, #208]
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
.LBB13_6:
	ldr	w9, [x8, #212]
	cmp	w9, w21
	b.lo	.LBB13_8
// %bb.7:
	str	wzr, [x8, #212]
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
.LBB13_8:
	ldr	w9, [x8, #216]
	cmp	w9, w21
	b.lo	.LBB13_10
// %bb.9:
	str	wzr, [x8, #216]
.LBB13_10:
	ldr	w8, [x19, #1872]
	sub	w24, w20, #1            // =1
	cmp	w8, w21
	b.lo	.LBB13_12
// %bb.11:
	mov	w8, #-1
	str	w8, [x19, #1872]
.LBB13_12:
	ldr	w8, [x19, #1876]
	str	x20, [sp]               // 8-byte Folded Spill
	cmp	w8, w21
	b.lo	.LBB13_14
// %bb.13:
	mov	w8, #-1
	str	w8, [x19, #1876]
.LBB13_14:
	ldr	x8, [x19, #136]
	ldr	x8, [x8, #16]
	add	x0, x8, #80             // =80
	bl	mutex_unlock
	mov	x0, x19
	mov	w1, wzr
	mov	w2, w21
	mov	w3, w24
	bl	f2fs_allocate_segment_for_resize
	mov	x0, x19
	mov	w1, #1
	mov	w2, w21
	mov	w3, w24
	bl	f2fs_allocate_segment_for_resize
	mov	x0, x19
	mov	w1, #2
	mov	w2, w21
	mov	w3, w24
	bl	f2fs_allocate_segment_for_resize
	mov	x0, x19
	mov	w1, #3
	mov	w2, w21
	mov	w3, w24
	bl	f2fs_allocate_segment_for_resize
	mov	x0, x19
	mov	w1, #4
	mov	w2, w21
	mov	w3, w24
	bl	f2fs_allocate_segment_for_resize
	mov	w1, #5
	mov	x0, x19
	mov	w2, w21
	mov	w3, w24
	bl	f2fs_allocate_segment_for_resize
	cmp	w21, w24
	str	w21, [sp, #12]          // 4-byte Folded Spill
	b.ls	.LBB13_19
.LBB13_15:
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	tbnz	w8, #0, .LBB13_18
// %bb.16:
	sub	x1, x29, #40            // =40
	mov	x0, x19
	bl	f2fs_write_checkpoint
	cbnz	w0, .LBB13_45
// %bb.17:
	ldr	x8, [x19, #136]
	ldr	x20, [x8, #8]
	add	x22, x20, #12           // =12
	mov	x0, x22
	bl	_raw_spin_lock
	ldr	w8, [sp, #12]           // 4-byte Folded Reload
	ldr	x0, [x20, #16]
	ldr	x1, [sp]                // 8-byte Folded Reload
	mov	w2, w8
	bl	find_next_bit
	mov	x21, x0
	mov	x0, x22
	bl	_raw_spin_unlock
	cmp	w24, w21
	b.hs	.LBB13_48
.LBB13_18:
	mov	w0, wzr
	b	.LBB13_45
.LBB13_19:
	add	x21, sp, #24            // =24
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	add	x25, x21, #16           // =16
	tbz	w8, #0, .LBB13_29
// %bb.20:
	mov	x20, #256
	ldr	w26, [sp, #12]          // 4-byte Folded Reload
	movk	x20, #57005, lsl #48
	adrp	x28, f2fs_inode_entry_slab
	//APP
	mrs x22, sp_el0
	//NO_APP
	b	.LBB13_22
.LBB13_21:                              //   in Loop: Header=BB13_22 Depth=1
	ldr	w8, [x19, #1192]
	add	w26, w8, w26
	cmp	w26, w24
	b.hi	.LBB13_15
.LBB13_22:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB13_25 Depth 2
	mov	w8, #64
	add	x2, sp, #24             // =24
	movk	w8, #96, lsl #16
	mov	x0, x19
	mov	w1, w26
	mov	w3, #1
	mov	w4, #1
	stp	x21, x21, [sp, #24]
	stp	wzr, w8, [sp, #40]
	str	xzr, [sp, #48]
	bl	do_garbage_collect
	ldr	x27, [sp, #24]
	cmp	x27, x21
	b.eq	.LBB13_27
// %bb.23:                              //   in Loop: Header=BB13_22 Depth=1
	ldr	x8, [x27]
	b	.LBB13_25
.LBB13_24:                              //   in Loop: Header=BB13_25 Depth=2
	add	x8, x20, #256           // =256
	mov	x1, x27
	stp	x20, x8, [x27]
	ldr	x0, [x28, :lo12:f2fs_inode_entry_slab]
	bl	kmem_cache_free
	ldr	x8, [x23]
	mov	x27, x23
	cmp	x23, x21
	b.eq	.LBB13_27
.LBB13_25:                              //   Parent Loop BB13_22 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x9, [x27, #16]
	mov	x0, x25
	mov	x23, x8
	ldr	x1, [x9, #64]
	bl	radix_tree_delete
	ldr	x0, [x27, #16]
	bl	iput
	mov	x0, x27
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB13_24
// %bb.26:                              //   in Loop: Header=BB13_25 Depth=2
	ldp	x9, x8, [x27]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB13_24
.LBB13_27:                              //   in Loop: Header=BB13_22 Depth=1
	ldr	x8, [x22]
	tbz	w8, #0, .LBB13_21
// %bb.28:                              //   in Loop: Header=BB13_22 Depth=1
	ldrb	w8, [x22, #2361]
	tbz	w8, #0, .LBB13_21
	b	.LBB13_43
.LBB13_29:
	mov	x22, #256
	ldr	w27, [sp, #12]          // 4-byte Folded Reload
	movk	x22, #57005, lsl #48
	adrp	x20, f2fs_inode_entry_slab
	//APP
	mrs x26, sp_el0
	//NO_APP
	b	.LBB13_31
.LBB13_30:                              //   in Loop: Header=BB13_31 Depth=1
	add	w27, w8, w27
	cmp	w27, w24
	b.hi	.LBB13_15
.LBB13_31:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB13_34 Depth 2
	mov	w8, #64
	add	x2, sp, #24             // =24
	movk	w8, #96, lsl #16
	mov	x0, x19
	mov	w1, w27
	mov	w3, #1
	mov	w4, #1
	stp	x21, x21, [sp, #24]
	stp	wzr, w8, [sp, #40]
	str	xzr, [sp, #48]
	bl	do_garbage_collect
	ldr	x28, [sp, #24]
	cmp	x28, x21
	b.eq	.LBB13_36
// %bb.32:                              //   in Loop: Header=BB13_31 Depth=1
	ldr	x8, [x28]
	b	.LBB13_34
.LBB13_33:                              //   in Loop: Header=BB13_34 Depth=2
	add	x8, x22, #256           // =256
	mov	x1, x28
	stp	x22, x8, [x28]
	ldr	x0, [x20, :lo12:f2fs_inode_entry_slab]
	bl	kmem_cache_free
	ldr	x8, [x23]
	mov	x28, x23
	cmp	x23, x21
	b.eq	.LBB13_36
.LBB13_34:                              //   Parent Loop BB13_31 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x9, [x28, #16]
	mov	x0, x25
	mov	x23, x8
	ldr	x1, [x9, #64]
	bl	radix_tree_delete
	ldr	x0, [x28, #16]
	bl	iput
	mov	x0, x28
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB13_33
// %bb.35:                              //   in Loop: Header=BB13_34 Depth=2
	ldp	x9, x8, [x28]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB13_33
.LBB13_36:                              //   in Loop: Header=BB13_31 Depth=1
	ldr	x9, [x19, #136]
	ldr	w8, [x19, #1192]
	ldr	x9, [x9]
	cmp	w8, #2                  // =2
	b.lo	.LBB13_39
// %bb.37:                              //   in Loop: Header=BB13_31 Depth=1
	ldr	x9, [x9, #144]
	cmn	w27, #1                 // =1
	b.eq	.LBB13_40
// %bb.38:                              //   in Loop: Header=BB13_31 Depth=1
	udiv	w10, w27, w8
	ldr	w9, [x9, x10, lsl #2]
	cbz	w9, .LBB13_41
	b	.LBB13_44
.LBB13_39:                              //   in Loop: Header=BB13_31 Depth=1
	mov	w10, #48
	ldr	x9, [x9, #136]
	umull	x10, w27, w10
	ldr	w9, [x9, x10]
	ubfx	w9, w9, #6, #10
	cbz	w9, .LBB13_41
	b	.LBB13_44
.LBB13_40:                              //   in Loop: Header=BB13_31 Depth=1
	mov	w10, #-1
	ldr	w9, [x9, x10, lsl #2]
	cbnz	w9, .LBB13_44
.LBB13_41:                              //   in Loop: Header=BB13_31 Depth=1
	ldr	x9, [x26]
	tbz	w9, #0, .LBB13_30
// %bb.42:                              //   in Loop: Header=BB13_31 Depth=1
	ldrb	w9, [x26, #2361]
	tbz	w9, #0, .LBB13_30
.LBB13_43:
	mov	w0, #-512
	b	.LBB13_45
.LBB13_44:
	mov	w0, #-11
.LBB13_45:
	ldr	w8, [x19, #1200]
	ldr	w9, [sp, #16]           // 4-byte Folded Reload
	add	w8, w8, w9
	adrp	x9, __stack_chk_guard
	str	w8, [x19, #1200]
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB13_47
// %bb.46:
	ldp	x20, x19, [sp, #176]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #160]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #144]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #128]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #112]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	add	sp, sp, #192            // =192
	ret
.LBB13_47:
	bl	__stack_chk_fail
.LBB13_48:
	adrp	x1, .L.str.31
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.31
	mov	w2, w21
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB13_51
// %bb.49:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB13_51
// %bb.50:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.free_segment_range
	add	x1, x1, :lo12:.L.str.19
	mov	w3, #3727
	add	x2, x2, :lo12:.L__func__.free_segment_range
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB13_51:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 3727; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end13:
	.size	free_segment_range, .Lfunc_end13-free_segment_range
                                        // -- End function
	.globl	f2fs_move_dm_data       // -- Begin function f2fs_move_dm_data
	.p2align	3
	.type	f2fs_move_dm_data,@function
f2fs_move_dm_data:                      // @f2fs_move_dm_data
// %bb.0:
	sub	sp, sp, #128            // =128
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	str	x25, [sp, #64]          // 8-byte Folded Spill
	stp	x24, x23, [sp, #80]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x22, x21, [sp, #96]     // 16-byte Folded Spill
	mov	x22, x0
	stp	x20, x19, [sp, #112]    // 16-byte Folded Spill
	mov	w19, w2
	mov	x20, x1
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #40]
	ldr	w9, [x1]
	ldr	x21, [x8, #1104]
	add	w8, w9, w2
	add	w9, w8, #3              // =3
	cmp	w9, #4                  // =4
	b.hs	.LBB14_3
.LBB14_1:
	mov	w23, #-1
	ldr	x9, [x21, #136]
	cbz	x9, .LBB14_15
.LBB14_2:
	add	x10, x9, #80            // =80
	b	.LBB14_16
.LBB14_3:
	ldr	w10, [x21, #3024]
	cbz	w10, .LBB14_11
// %bb.4:
	ldr	x9, [x21]
	cmp	w10, #1                 // =1
	ldr	x9, [x9, #248]
	b.lt	.LBB14_10
// %bb.5:
	ldr	x12, [x21, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB14_7
.LBB14_6:                               //   in Loop: Header=BB14_7 Depth=1
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB14_10
.LBB14_7:                               // =>This Inner Loop Header: Depth=1
	ldur	w13, [x12, #-4]
	cmp	w13, w8
	b.hi	.LBB14_6
// %bb.8:                               //   in Loop: Header=BB14_7 Depth=1
	ldr	w13, [x12]
	cmp	w13, w8
	b.lo	.LBB14_6
// %bb.9:
	ldur	x9, [x12, #-80]
.LBB14_10:
	cbz	x9, .LBB14_1
.LBB14_11:
	ldr	x9, [x21, #136]
	cbz	x9, .LBB14_13
// %bb.12:
	add	x10, x9, #80            // =80
	b	.LBB14_14
.LBB14_13:
	ldr	x10, [x21, #16]
	add	x10, x10, #72           // =72
.LBB14_14:
	ldr	x9, [x9, #8]
	ldr	w10, [x10]
	ldr	w11, [x21, #1184]
	ldr	w9, [x9]
	sub	w10, w8, w10
	lsr	w10, w10, w11
	sub	w23, w10, w9
	ldr	x9, [x21, #136]
	cbnz	x9, .LBB14_2
.LBB14_15:
	ldr	x10, [x21, #16]
	add	x10, x10, #72           // =72
.LBB14_16:
	ldr	x9, [x9, #8]
	ldr	w10, [x10]
	ldr	w11, [x21, #1184]
	ldr	w9, [x9]
	ldr	w12, [x21, #640]
	sub	w8, w8, w10
	add	w9, w9, w23
	lsl	w9, w9, w11
	sub	w24, w8, w9
	cbz	w12, .LBB14_22
// %bb.17:
	mov	x0, sp
	mov	w1, wzr
	add	x25, x21, #3344         // =3344
	bl	init_wait_entry
.LBB14_18:                              // =>This Inner Loop Header: Depth=1
	mov	x1, sp
	mov	x0, x25
	mov	w2, #1
	bl	prepare_to_wait_event
	ldr	w8, [x21, #640]
	cbz	w8, .LBB14_21
// %bb.19:                              //   in Loop: Header=BB14_18 Depth=1
	cbnz	x0, .LBB14_22
// %bb.20:                              //   in Loop: Header=BB14_18 Depth=1
	bl	schedule
	b	.LBB14_18
.LBB14_21:
	mov	x1, sp
	mov	x0, x25
	bl	finish_wait
.LBB14_22:
	add	x25, x21, #1664         // =1664
	mov	x0, x25
	bl	down_write
	ldr	w8, [x20, #4]
	mov	x0, x22
	mov	w2, #1
	mov	w3, w23
	mov	w4, w24
	add	w1, w8, w19
	bl	move_data_page
	mov	w22, w0
	mov	x0, x25
	bl	up_write
	cbz	w22, .LBB14_24
// %bb.23:
	ldr	w8, [x20, #4]
	adrp	x1, .L.str.10
	add	x1, x1, :lo12:.L.str.10
	mov	x0, x21
	mov	w3, w22
	add	w2, w8, w19
	bl	f2fs_printk
.LBB14_24:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB14_26
// %bb.25:
	mov	w0, w22
	ldr	x25, [sp, #64]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #112]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #128            // =128
	ret
.LBB14_26:
	bl	__stack_chk_fail
.Lfunc_end14:
	.size	f2fs_move_dm_data, .Lfunc_end14-f2fs_move_dm_data
                                        // -- End function
	.p2align	3               // -- Begin function move_data_page
	.type	move_data_page,@function
move_data_page:                         // @move_data_page
// %bb.0:
	sub	sp, sp, #256            // =256
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #160]    // 16-byte Folded Spill
	add	x29, sp, #160           // =160
	stp	x28, x27, [sp, #176]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #192]    // 16-byte Folded Spill
	mov	w1, w1
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #208]    // 16-byte Folded Spill
	mov	w24, w4
	stp	x22, x21, [sp, #224]    // 16-byte Folded Spill
	mov	w21, w2
	stp	x20, x19, [sp, #240]    // 16-byte Folded Spill
	mov	w2, #1
	stur	x8, [x29, #-8]
	mov	w23, w3
	ldr	x8, [x0, #40]
	mov	x22, x0
	ldr	x20, [x8, #1104]
	bl	f2fs_get_lock_data_page
	mov	x19, x0
	cmn	x0, #4095               // =4095
	b.lo	.LBB15_4
// %bb.1:
	ldrb	w8, [x20, #1992]
	cbz	w8, .LBB15_3
// %bb.2:
	mov	x9, #32401
	ldr	x8, [x20, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.ls	.LBB15_74
.LBB15_3:
	mov	w21, w19
	b	.LBB15_72
.LBB15_4:
	ldr	x8, [x22, #40]
	ldr	x26, [x8, #1104]
	ldr	x8, [x26, #136]
	ldr	x8, [x8]
	add	x25, x8, #88            // =88
	mov	x0, x25
	bl	down_read
	ldr	x8, [x26, #136]
	mov	w9, #48
	mvn	w10, w24
	mov	x0, x25
	and	w26, w10, #0x7
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	umaddl	x8, w23, w9, x8
	mov	w9, w24
	lsr	x9, x9, #3
	ldr	x8, [x8, #8]
	ldrb	w24, [x8, x9]
	bl	up_read
	lsr	w8, w24, w26
	tbz	w8, #0, .LBB15_29
// %bb.5:
	ldr	x8, [x22, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB15_30
// %bb.6:
	ldr	x8, [x22, #712]
	tbnz	w8, #28, .LBB15_34
// %bb.7:
	cbz	w21, .LBB15_36
// %bb.8:
	ldr	x8, [x22, #40]
	mov	x11, #1
	ldr	x9, [x22, #64]
	mov	x10, #8589934592
	movk	x11, #2048, lsl #32
	stur	xzr, [sp, #36]
	strb	wzr, [sp, #104]
	mov	x28, #7864
	ldr	x8, [x8, #1104]
	movk	x28, #60293, lsl #16
	stur	x10, [sp, #20]
	movk	x28, #47185, lsl #32
	stur	x11, [sp, #28]
	mov	x25, xzr
	str	w9, [sp, #16]
	mov	w24, #1
	str	x8, [sp, #8]
	mov	w8, #7
	stp	x19, xzr, [sp, #48]
	movk	x28, #1310, lsl #48
	stp	xzr, xzr, [sp, #64]
	mov	w26, #5
	str	xzr, [sp, #80]
	strb	wzr, [sp, #88]
	str	wzr, [sp, #100]
	str	wzr, [sp, #92]
	stur	wzr, [sp, #95]
	str	w8, [sp, #108]
	stur	xzr, [sp, #140]
	stp	xzr, xzr, [sp, #112]
	str	xzr, [sp, #128]
	strb	wzr, [sp, #136]
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	str	x8, [sp]                // 8-byte Folded Spill
	b	.LBB15_10
.LBB15_9:                               //   in Loop: Header=BB15_10 Depth=1
	mov	w0, wzr
	mov	x1, x26
	bl	congestion_wait
	add	x24, x24, #1            // =1
.LBB15_10:                              // =>This Inner Loop Header: Depth=1
	mov	x0, x19
	mov	w1, wzr
	mov	w2, #1
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
	mov	x0, x19
	bl	set_page_dirty
	mov	x0, x19
	bl	clear_page_dirty_for_io
	cbz	w0, .LBB15_19
// %bb.11:                              //   in Loop: Header=BB15_10 Depth=1
	ldrh	w8, [x22]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.eq	.LBB15_14
// %bb.12:                              //   in Loop: Header=BB15_10 Depth=1
	cmp	w8, #10, lsl #12        // =40960
	b.eq	.LBB15_14
// %bb.13:                              //   in Loop: Header=BB15_10 Depth=1
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB15_18
.LBB15_14:                              //   in Loop: Header=BB15_10 Depth=1
	add	x8, x22, #768           // =768
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x22, #712]
	tbz	x8, #37, .LBB15_16
// %bb.15:                              //   in Loop: Header=BB15_10 Depth=1
	ldr	x8, [x22, #40]
	ldr	x8, [x8, #1104]
	add	x8, x8, #1328           // =1328
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB15_16:                              //   in Loop: Header=BB15_10 Depth=1
	ldr	x8, [x22, #40]
	ldrh	w9, [x22]
	ldr	x8, [x8, #1104]
	and	w9, w9, #0xf000
	cmp	w9, #4, lsl #12         // =16384
	cset	w9, ne
	add	x8, x8, w9, uxtw #2
	add	x8, x8, #1272           // =1272
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldrb	w8, [x22, #12]
	tbz	w8, #5, .LBB15_18
// %bb.17:                              //   in Loop: Header=BB15_10 Depth=1
	ldr	x8, [x22, #40]
	ldr	x8, [x8, #1104]
	add	x8, x8, #1280           // =1280
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB15_18:                              //   in Loop: Header=BB15_10 Depth=1
	mov	x0, x22
	bl	f2fs_remove_dirty_inode
.LBB15_19:                              //   in Loop: Header=BB15_10 Depth=1
	ldr	x8, [x19]
	tbnz	w8, #13, .LBB15_21
// %bb.20:                              //   in Loop: Header=BB15_10 Depth=1
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	add	x8, x8, #52             // =52
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	orr	x8, x8, 8192
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
	str	xzr, [x19, #40]
.LBB15_21:                              //   in Loop: Header=BB15_10 Depth=1
	add	x27, x19, #40           // =40
	//APP
	// atomic64_or
	prfm	pstl1strm, [x27]
1:	ldxr	x8, [x27]
	orr	x8, x8, 1
	stxr	w9, x8, [x27]
	cbnz	w9, 1b
	//NO_APP
	add	x1, sp, #8              // =8
	mov	x0, x22
	mov	w2, w23
	//APP
	// atomic64_or
	prfm	pstl1strm, [x27]
1:	ldxr	x8, [x27]
	orr	x8, x8, 8
	stxr	w9, x8, [x27]
	cbnz	w9, 1b
	//NO_APP
	bl	f2fs_set_dev_tag_for_fio
	add	x0, sp, #8              // =8
	bl	f2fs_do_write_data_page
	mov	w21, w0
	cbz	w0, .LBB15_46
// %bb.22:                              //   in Loop: Header=BB15_10 Depth=1
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x27]
1:	ldxr	x8, [x27]
	bic	x8, x8, 8
	stxr	w9, x8, [x27]
	cbnz	w9, 1b
	//NO_APP
	ldr	x8, [x19, #40]
	cmp	x8, #1                  // =1
	b.ne	.LBB15_26
// %bb.23:                              //   in Loop: Header=BB15_10 Depth=1
	str	xzr, [x19, #40]
	ldr	x8, [x19]
	tbz	w8, #13, .LBB15_26
// %bb.24:                              //   in Loop: Header=BB15_10 Depth=1
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	bic	x8, x8, 8192
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x19, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB15_26
// %bb.25:                              //   in Loop: Header=BB15_10 Depth=1
	bl	__put_page
.LBB15_26:                              //   in Loop: Header=BB15_10 Depth=1
	cmn	w21, #12                // =12
	b.ne	.LBB15_40
// %bb.27:                              //   in Loop: Header=BB15_10 Depth=1
	mov	x8, #23593
	add	x25, x25, #1            // =1
	movk	x8, #49807, lsl #16
	movk	x8, #10485, lsl #32
	movk	x8, #36700, lsl #48
	mul	x8, x25, x8
	ror	x8, x8, #1
	cmp	x8, x28
	b.hi	.LBB15_9
// %bb.28:                              //   in Loop: Header=BB15_10 Depth=1
	adrp	x1, .L.str.32
	adrp	x3, .L__func__.move_data_page
	mov	x0, x20
	add	x1, x1, :lo12:.L.str.32
	mov	x2, x24
	add	x3, x3, :lo12:.L__func__.move_data_page
	mov	w4, #2752
	bl	f2fs_printk
	b	.LBB15_9
.LBB15_29:
	mov	w21, #-2
	cbnz	x19, .LBB15_47
	b	.LBB15_72
.LBB15_30:
	ldr	w8, [x22, #700]
	ldr	x9, [x22, #40]
	add	w8, w8, #1              // =1
	str	w8, [x22, #700]
	ldr	x8, [x9, #1104]
	add	x8, x8, w21, sxtw #3
	ldr	x9, [x8, #1888]
	add	x9, x9, #1              // =1
	str	x9, [x8, #1888]
	ldrb	w8, [x20, #1992]
	cbz	w8, .LBB15_44
// %bb.31:
	mov	x9, #32401
	ldr	x8, [x20, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB15_44
// %bb.32:
	adrp	x1, .L.str.20
	mov	w3, #2677
.LBB15_33:
	add	x1, x1, :lo12:.L.str.20
	adrp	x2, .L__func__.move_data_page
	mov	x0, x20
	add	x2, x2, :lo12:.L__func__.move_data_page
	bl	f2fs_printk
	mov	w21, #-11
	cbnz	x19, .LBB15_47
	b	.LBB15_72
.LBB15_34:
	cmp	w21, #1                 // =1
	b.ne	.LBB15_44
// %bb.35:
	mov	x0, x22
	mov	w1, #1
	bl	f2fs_pin_file_control
	mov	w21, #-11
	cbnz	x19, .LBB15_47
	b	.LBB15_72
.LBB15_36:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	sxth	w8, w8
	tbnz	w8, #31, .LBB15_42
// %bb.37:
	mov	x0, x19
	bl	set_page_dirty
	ldr	x8, [x19]
	tbnz	w8, #13, .LBB15_39
// %bb.38:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	add	x8, x8, #52             // =52
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	orr	x8, x8, 8192
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
	str	xzr, [x19, #40]
.LBB15_39:
	add	x8, x19, #40            // =40
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	mov	x0, x20
	mov	x1, x19
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 8
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_set_dev_tag_for_page
	mov	w21, wzr
	cbnz	x19, .LBB15_47
	b	.LBB15_72
.LBB15_40:
	ldr	x8, [sp]                // 8-byte Folded Reload
	tbz	w8, #3, .LBB15_46
// %bb.41:
	mov	x0, x19
	bl	set_page_dirty
	cbnz	x19, .LBB15_47
	b	.LBB15_72
.LBB15_42:
	ldrb	w8, [x20, #1992]
	cbz	w8, .LBB15_45
// %bb.43:
	mov	x9, #32401
	ldr	x8, [x20, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.ls	.LBB15_78
.LBB15_44:
	mov	w21, #-11
	cbnz	x19, .LBB15_47
	b	.LBB15_72
.LBB15_45:
	mov	w21, #-11
.LBB15_46:
	cbz	x19, .LBB15_72
.LBB15_47:
	ldr	x8, [x19, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x19, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x19, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB15_64
// %bb.48:
	tbnz	w8, #0, .LBB15_62
// %bb.49:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB15_52
// %bb.50:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_52
// %bb.51:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_52:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB15_54
// %bb.53:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB15_75
.LBB15_54:
	ldr	x0, [x19, #24]
.LBB15_55:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB15_57
// %bb.56:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB15_76
.LBB15_57:
	ldr	x0, [x19, #24]
.LBB15_58:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB15_60
// %bb.59:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB15_77
.LBB15_60:
	ldr	x0, [x19, #24]
.LBB15_61:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB15_62:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB15_70
// %bb.63:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB15_64:
	tbnz	w8, #0, .LBB15_69
// %bb.65:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB15_68
// %bb.66:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_68
// %bb.67:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_68:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB15_69:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB15_80
.LBB15_70:
	mov	x0, x19
	bl	unlock_page
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x19, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB15_72
// %bb.71:
	bl	__put_page
.LBB15_72:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB15_79
// %bb.73:
	mov	w0, w21
	ldp	x20, x19, [sp, #240]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #224]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #208]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #192]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #176]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #160]    // 16-byte Folded Reload
	add	sp, sp, #256            // =256
	ret
.LBB15_74:
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_page
	add	x1, x1, :lo12:.L.str.20
	mov	w3, #2665
	add	x2, x2, :lo12:.L__func__.move_data_page
	mov	x0, x20
	bl	f2fs_printk
	b	.LBB15_3
.LBB15_75:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB15_55
.LBB15_76:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB15_58
.LBB15_77:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB15_61
.LBB15_78:
	adrp	x1, .L.str.20
	mov	w3, #2690
	b	.LBB15_33
.LBB15_79:
	bl	__stack_chk_fail
.LBB15_80:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end15:
	.size	move_data_page, .Lfunc_end15-move_data_page
                                        // -- End function
	.globl	f2fs_migrate_dm_file    // -- Begin function f2fs_migrate_dm_file
	.p2align	3
	.type	f2fs_migrate_dm_file,@function
f2fs_migrate_dm_file:                   // @f2fs_migrate_dm_file
// %bb.0:
	sub	sp, sp, #176            // =176
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	stp	x28, x27, [sp, #96]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #112]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #128]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #144]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #160]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	w8, [x1, #4]
	cbz	w8, .LBB16_75
// %bb.1:
	ldr	x8, [x0, #40]
	mov	x20, x0
	ldr	x19, [x8, #1104]
	ldr	x8, [x0, #712]
	tbnz	w8, #10, .LBB16_75
// %bb.2:
	ldr	x8, [x20, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB16_75
// %bb.3:
	ldr	x8, [x20, #712]
	tbnz	w8, #28, .LBB16_75
// %bb.4:
	mov	x21, x1
	ldr	w1, [x1]
	mov	x0, x20
	mov	x26, x2
	bl	f2fs_set_file_lable
	tbnz	w0, #31, .LBB16_78
// %bb.5:
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_balance_fs
	add	x23, x20, #968          // =968
	mov	x0, x23
	bl	down_write
	add	x0, x20, #1016          // =1016
	str	x0, [sp, #16]           // 8-byte Folded Spill
	bl	down_write
	mov	x0, x20
	bl	inode_dio_wait
	ldr	x8, [x20, #40]
	ldr	x9, [x20, #80]
	stp	xzr, xzr, [sp, #56]
	str	xzr, [sp, #32]
	ldr	x10, [x8, #1104]
	add	x8, x9, #4095           // =4095
	stp	xzr, xzr, [sp, #40]
	lsr	x22, x8, #12
	str	wzr, [x21, #8]
	cbz	w22, .LBB16_79
// %bb.6:
	mov	w8, wzr
	add	x26, x26, #2500         // =2500
	str	x10, [sp, #24]          // 8-byte Folded Spill
	str	x23, [sp, #8]           // 8-byte Folded Spill
	//APP
	mrs x23, sp_el0
	//NO_APP
.LBB16_7:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB16_15 Depth 2
                                        //     Child Loop BB16_27 Depth 2
                                        //     Child Loop BB16_38 Depth 2
                                        //     Child Loop BB16_62 Depth 2
                                        //     Child Loop BB16_70 Depth 2
	sub	w8, w22, w8
	mov	w9, #512
	cmp	w8, #512                // =512
	add	x1, sp, #32             // =32
	csel	w8, w8, w9, lo
	mov	x0, x20
	mov	w2, wzr
	mov	w3, #1
	str	w8, [sp, #40]
	bl	f2fs_map_blocks
	cbnz	w0, .LBB16_80
// %bb.8:                               //   in Loop: Header=BB16_7 Depth=1
	ldr	w9, [sp, #32]
	add	w8, w9, #3              // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB16_11
.LBB16_9:                               //   in Loop: Header=BB16_7 Depth=1
	ldp	w9, w8, [sp, #36]
	cmp	w8, #0                  // =0
	csinc	w8, w8, wzr, ne
	add	w8, w8, w9
	adrp	x9, jiffies
	str	w8, [sp, #36]
	ldr	x9, [x9, :lo12:jiffies]
	cmp	x26, x9
	b.mi	.LBB16_81
// %bb.10:                              //   in Loop: Header=BB16_7 Depth=1
	cmp	w8, w22
	b.lo	.LBB16_7
	b	.LBB16_82
.LBB16_11:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	ldr	w8, [x8, #3024]
	cbz	w8, .LBB16_19
// %bb.12:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x12, [sp, #24]          // 8-byte Folded Reload
	cmp	w8, #1                  // =1
	ldr	x10, [x12]
	ldr	x10, [x10, #248]
	b.lt	.LBB16_18
// %bb.13:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x12, [x12, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB16_15
.LBB16_14:                              //   in Loop: Header=BB16_15 Depth=2
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x8
	b.eq	.LBB16_18
.LBB16_15:                              //   Parent Loop BB16_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w13, [x12, #-4]
	cmp	w13, w9
	b.hi	.LBB16_14
// %bb.16:                              //   in Loop: Header=BB16_15 Depth=2
	ldr	w13, [x12]
	cmp	w13, w9
	b.lo	.LBB16_14
// %bb.17:                              //   in Loop: Header=BB16_7 Depth=1
	ldur	x10, [x12, #-80]
.LBB16_18:                              //   in Loop: Header=BB16_7 Depth=1
	cbz	x10, .LBB16_9
.LBB16_19:                              //   in Loop: Header=BB16_7 Depth=1
	ldrsw	x25, [sp, #40]
	cbz	w25, .LBB16_9
// %bb.20:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	w10, [x21]
	cmp	w10, #4                 // =4
	b.eq	.LBB16_33
// %bb.21:                              //   in Loop: Header=BB16_7 Depth=1
	cmp	w10, #2                 // =2
	b.ne	.LBB16_59
// %bb.22:                              //   in Loop: Header=BB16_7 Depth=1
	mov	w10, #-1
	add	w11, w9, #3             // =3
	cmp	w11, #4                 // =4
	b.lo	.LBB16_49
// %bb.23:                              //   in Loop: Header=BB16_7 Depth=1
	cbz	w8, .LBB16_31
// %bb.24:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x12, [sp, #24]          // 8-byte Folded Reload
	cmp	w8, #1                  // =1
	ldr	x10, [x12]
	ldr	x10, [x10, #248]
	b.lt	.LBB16_30
// %bb.25:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x12, [x12, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB16_27
.LBB16_26:                              //   in Loop: Header=BB16_27 Depth=2
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x8
	b.eq	.LBB16_30
.LBB16_27:                              //   Parent Loop BB16_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w13, [x12, #-4]
	cmp	w13, w9
	b.hi	.LBB16_26
// %bb.28:                              //   in Loop: Header=BB16_27 Depth=2
	ldr	w13, [x12]
	cmp	w13, w9
	b.lo	.LBB16_26
// %bb.29:                              //   in Loop: Header=BB16_7 Depth=1
	ldur	x10, [x12, #-80]
.LBB16_30:                              //   in Loop: Header=BB16_7 Depth=1
	cbz	x10, .LBB16_48
.LBB16_31:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x12, [sp, #24]          // 8-byte Folded Reload
	ldr	x10, [x12, #136]
	cbz	x10, .LBB16_44
// %bb.32:                              //   in Loop: Header=BB16_7 Depth=1
	add	x11, x10, #80           // =80
	b	.LBB16_45
.LBB16_33:                              //   in Loop: Header=BB16_7 Depth=1
	mov	w10, #-1
	add	w11, w9, #3             // =3
	cmp	w11, #4                 // =4
	b.lo	.LBB16_54
// %bb.34:                              //   in Loop: Header=BB16_7 Depth=1
	cbz	w8, .LBB16_42
// %bb.35:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x12, [sp, #24]          // 8-byte Folded Reload
	cmp	w8, #1                  // =1
	ldr	x10, [x12]
	ldr	x10, [x10, #248]
	b.lt	.LBB16_41
// %bb.36:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x12, [x12, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB16_38
.LBB16_37:                              //   in Loop: Header=BB16_38 Depth=2
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x8
	b.eq	.LBB16_41
.LBB16_38:                              //   Parent Loop BB16_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w13, [x12, #-4]
	cmp	w13, w9
	b.hi	.LBB16_37
// %bb.39:                              //   in Loop: Header=BB16_38 Depth=2
	ldr	w13, [x12]
	cmp	w13, w9
	b.lo	.LBB16_37
// %bb.40:                              //   in Loop: Header=BB16_7 Depth=1
	ldur	x10, [x12, #-80]
.LBB16_41:                              //   in Loop: Header=BB16_7 Depth=1
	cbz	x10, .LBB16_53
.LBB16_42:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x12, [sp, #24]          // 8-byte Folded Reload
	ldr	x10, [x12, #136]
	cbz	x10, .LBB16_46
// %bb.43:                              //   in Loop: Header=BB16_7 Depth=1
	add	x11, x10, #80           // =80
	b	.LBB16_47
.LBB16_44:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x11, [x12, #16]
	add	x11, x11, #72           // =72
.LBB16_45:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x10, [x10, #8]
	ldr	w11, [x11]
	ldr	w12, [x12, #1184]
	ldr	w10, [x10]
	sub	w9, w9, w11
	lsr	w9, w9, w12
	sub	w10, w9, w10
	b	.LBB16_49
.LBB16_46:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x11, [x12, #16]
	add	x11, x11, #72           // =72
.LBB16_47:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x10, [x10, #8]
	ldr	w11, [x11]
	ldr	w12, [x12, #1184]
	ldr	w10, [x10]
	sub	w9, w9, w11
	lsr	w9, w9, w12
	sub	w10, w9, w10
	b	.LBB16_54
.LBB16_48:                              //   in Loop: Header=BB16_7 Depth=1
	mov	w10, #-1
.LBB16_49:                              //   in Loop: Header=BB16_7 Depth=1
	cmp	w8, #2                  // =2
	b.ne	.LBB16_9
// %bb.50:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB16_9
// %bb.51:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	ldr	x8, [x8, #3032]
	ldr	w9, [x8, #84]
	cmp	w9, w10
	b.hi	.LBB16_59
// %bb.52:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	w8, [x8, #88]
	b	.LBB16_58
.LBB16_53:                              //   in Loop: Header=BB16_7 Depth=1
	mov	w10, #-1
.LBB16_54:                              //   in Loop: Header=BB16_7 Depth=1
	cmp	w8, #2                  // =2
	b.ne	.LBB16_59
// %bb.55:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB16_59
// %bb.56:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	ldr	x8, [x8, #3032]
	ldr	w9, [x8, #276]
	cmp	w9, w10
	b.hi	.LBB16_59
// %bb.57:                              //   in Loop: Header=BB16_7 Depth=1
	ldr	w8, [x8, #280]
.LBB16_58:                              //   in Loop: Header=BB16_7 Depth=1
	cmp	w8, w10
	b.hs	.LBB16_9
.LBB16_59:                              //   in Loop: Header=BB16_7 Depth=1
	ldp	x8, x0, [x20, #40]
	mov	x1, xzr
	mov	x3, x25
	ldr	w27, [sp, #36]
	mov	x4, xzr
	ldr	x8, [x8, #1104]
	mov	x2, x27
	str	x8, [sp]                // 8-byte Folded Spill
	bl	__do_page_cache_readahead
	cmp	w25, #1                 // =1
	b.lt	.LBB16_9
// %bb.60:                              //   in Loop: Header=BB16_7 Depth=1
	mov	x28, xzr
	and	x24, x25, #0xffffffff
	b	.LBB16_62
.LBB16_61:                              //   in Loop: Header=BB16_62 Depth=2
	add	x28, x28, #1            // =1
	cmp	x28, x24
	b.eq	.LBB16_69
.LBB16_62:                              //   Parent Loop BB16_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x8, [x23]
	tbz	w8, #0, .LBB16_65
// %bb.63:                              //   in Loop: Header=BB16_62 Depth=2
	ldrb	w8, [x23, #2361]
	tbnz	w8, #3, .LBB16_83
// %bb.64:                              //   in Loop: Header=BB16_62 Depth=2
	ldr	x8, [x23, #2304]
	ldrb	w8, [x8, #81]
	tbnz	w8, #3, .LBB16_83
.LBB16_65:                              //   in Loop: Header=BB16_62 Depth=2
	add	x1, x27, x28
	mov	x0, x20
	mov	w2, #524288
	mov	w3, #1
	bl	f2fs_get_read_data_page
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB16_61
// %bb.66:                              //   in Loop: Header=BB16_62 Depth=2
	cbz	x0, .LBB16_61
// %bb.67:                              //   in Loop: Header=BB16_62 Depth=2
	ldr	x8, [x0, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x0, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB16_61
// %bb.68:                              //   in Loop: Header=BB16_62 Depth=2
	bl	__put_page
	b	.LBB16_61
.LBB16_69:                              //   in Loop: Header=BB16_7 Depth=1
	mov	x28, xzr
.LBB16_70:                              //   Parent Loop BB16_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x8, [x23]
	tbz	w8, #0, .LBB16_73
// %bb.71:                              //   in Loop: Header=BB16_70 Depth=2
	ldrb	w8, [x23, #2361]
	tbnz	w8, #3, .LBB16_83
// %bb.72:                              //   in Loop: Header=BB16_70 Depth=2
	ldr	x8, [x23, #2304]
	ldrb	w8, [x8, #81]
	tbnz	w8, #3, .LBB16_83
.LBB16_73:                              //   in Loop: Header=BB16_70 Depth=2
	add	x1, sp, #32             // =32
	mov	x0, x20
	mov	w2, w28
	mov	w3, wzr
	bl	f2fs_move_dm_data
	cbnz	w0, .LBB16_91
// %bb.74:                              //   in Loop: Header=BB16_70 Depth=2
	ldr	w8, [x21, #8]
	add	x28, x28, #1            // =1
	cmp	x28, x24
	add	w8, w8, #1              // =1
	str	w8, [x21, #8]
	b.ne	.LBB16_70
	b	.LBB16_9
.LBB16_75:
	mov	w25, #-95
.LBB16_76:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB16_92
// %bb.77:
	mov	w0, w25
	ldp	x20, x19, [sp, #160]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #144]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #128]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #112]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #96]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB16_78:
	mov	w25, w0
	b	.LBB16_76
.LBB16_79:
	mov	w25, wzr
	b	.LBB16_85
.LBB16_80:
	mov	w25, w0
	ldr	w5, [sp, #40]
	ldp	w4, w3, [sp, #32]
	adrp	x1, .L.str.33
	mov	w2, w25
	ldr	x0, [sp, #24]           // 8-byte Folded Reload
	add	x1, x1, :lo12:.L.str.33
	bl	f2fs_printk
	b	.LBB16_84
.LBB16_81:
	mov	w25, #-16
	b	.LBB16_84
.LBB16_82:
	mov	w25, wzr
	b	.LBB16_84
.LBB16_83:
	ldr	w3, [x21, #8]
	adrp	x1, .L.str.34
	ldr	x0, [sp]                // 8-byte Folded Reload
	add	x2, x27, w28, uxtw
	add	x1, x1, :lo12:.L.str.34
	bl	f2fs_printk
	mov	w25, #-4
.LBB16_84:
	ldr	x23, [sp, #8]           // 8-byte Folded Reload
.LBB16_85:
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	bl	up_write
	mov	x0, x23
	bl	up_write
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_balance_fs
	tbnz	w25, #31, .LBB16_76
// %bb.86:
	ldr	w8, [x21, #8]
	cbz	w8, .LBB16_88
// %bb.87:
	mov	x0, x19
	mov	w1, wzr
	bl	f2fs_submit_merged_write
.LBB16_88:
	ldr	w8, [x21, #4]
	cbz	w8, .LBB16_76
// %bb.89:
	ldr	x0, [x20, #48]
	mov	x1, xzr
	ldr	x2, [x20, #80]
	bl	filemap_write_and_wait_range
	mov	w25, w0
	tbz	w0, #31, .LBB16_76
// %bb.90:
	adrp	x1, .L.str.11
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.11
	mov	w2, w25
	bl	f2fs_printk
	b	.LBB16_76
.LBB16_91:
	mov	w25, w0
	b	.LBB16_84
.LBB16_92:
	bl	__stack_chk_fail
.Lfunc_end16:
	.size	f2fs_migrate_dm_file, .Lfunc_end16-f2fs_migrate_dm_file
                                        // -- End function
	.p2align	3               // -- Begin function get_gc_wait_ms
	.type	get_gc_wait_ms,@function
get_gc_wait_ms:                         // @get_gc_wait_ms
// %bb.0:
	sub	sp, sp, #176            // =176
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	stp	x28, x27, [sp, #96]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #112]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #128]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #144]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #160]    // 16-byte Folded Spill
	mov	x20, x0
	stur	x8, [x29, #-8]
	ldr	w8, [x0, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB17_2
// %bb.1:
	ldr	x9, [x20, #16]
	ldrb	w9, [x9, #2182]
	tbnz	w9, #0, .LBB17_3
.LBB17_2:
	ldr	x9, [x20, #136]
	ldp	x12, x11, [x9]
	add	x10, x9, #104           // =104
	add	x9, x11, #4             // =4
	add	x11, x12, #16           // =16
	add	x12, x20, #1236         // =1236
	b	.LBB17_4
.LBB17_3:
	ldr	x9, [x20, #3032]
	mov	w11, #192
	ldr	w10, [x20, #3308]
	madd	x12, x10, x11, x9
	add	x9, x12, #168           // =168
	add	x10, x12, #176          // =176
	add	x11, x12, #184          // =184
	add	x12, x12, #180          // =180
.LBB17_4:
	ldr	w10, [x10]
	ldr	w22, [x9]
	ldr	w9, [x20, #1232]
	ldr	w24, [x11]
	add	w23, w10, w10, lsl #1
	ldr	w25, [x12]
	cmp	w22, w23
	and	w9, w9, #0x4
	ccmp	w9, #0, #0, lo
	b.ne	.LBB17_40
// %bb.5:
	ldr	w9, [x20, #3308]
	cmp	w8, #2                  // =2
	b.ne	.LBB17_10
// %bb.6:
	cmp	w9, #1                  // =1
	b.hi	.LBB17_10
// %bb.7:
	ldr	x10, [x20, #16]
	ldr	w10, [x10, #2180]
	tbz	w10, #16, .LBB17_10
// %bb.8:
	ldr	x10, [x20, #3032]
	mov	w11, #192
	madd	x10, x9, x11, x10
	ldp	w12, w11, [x10, #180]
	ldr	w13, [x10, #176]
	ldr	w14, [x10, #168]
	sub	w10, w12, w11
	subs	w11, w14, w13
	b.lo	.LBB17_11
.LBB17_9:
	ldr	w12, [x20, #1184]
	lsl	w11, w11, w12
	b	.LBB17_12
.LBB17_10:
	ldr	x10, [x20, #136]
	ldr	w13, [x20, #1236]
	ldp	x11, x12, [x10]
	ldr	w14, [x10, #104]
	ldr	w10, [x11, #16]
	ldr	w11, [x12, #4]
	sub	w10, w13, w10
	subs	w11, w11, w14
	b.hs	.LBB17_9
.LBB17_11:
	mov	x11, xzr
.LBB17_12:
	sub	x11, x10, x11
	cmp	x11, #1                 // =1
	b.lt	.LBB17_40
// %bb.13:
	add	x11, x11, x11, lsl #2
	lsl	x11, x11, #1
	cmp	x11, x10
	b.le	.LBB17_40
// %bb.14:
	ldr	x10, [x20, #3280]
	cmp	w8, #2                  // =2
	b.ne	.LBB17_20
// %bb.15:
	cmp	w9, #1                  // =1
	b.hi	.LBB17_20
// %bb.16:
	ldr	x8, [x20, #16]
	ldr	w11, [x8, #2180]
	tbz	w11, #16, .LBB17_20
// %bb.17:
	adrp	x11, jiffies
	mov	w13, #18928
	movk	w13, #2, lsl #16
	add	x10, x10, x13
	ldr	x12, [x11, :lo12:jiffies]
	cmp	x10, x12
	b.pl	.LBB17_21
// %bb.18:
	ldr	x10, [x11, :lo12:jiffies]
	str	x10, [x20, #3280]
	ldrb	w10, [x8, #2182]
	tbnz	w10, #0, .LBB17_35
// %bb.19:
	ldr	w27, [x8, #68]
	mov	w19, wzr
	ldur	x8, [x8, #36]
	add	x9, x20, #1240          // =1240
	b	.LBB17_36
.LBB17_20:
	adrp	x8, jiffies
	mov	w11, #18928
	movk	w11, #2, lsl #16
	add	x10, x10, x11
	ldr	x9, [x8, :lo12:jiffies]
	cmp	x10, x9
	b.mi	.LBB17_23
.LBB17_21:
	ldrb	w8, [x20, #3273]
	cbz	w8, .LBB17_40
.LBB17_22:
	mov	w8, #3
	mov	w9, #1000
	str	w8, [x20, #1764]
	str	w9, [x1]
	b	.LBB17_63
.LBB17_23:
	ldr	x9, [x8, :lo12:jiffies]
	ldr	x8, [x20, #16]
	str	x9, [x20, #3280]
	ldur	x9, [x8, #36]
	cmp	x9, #2048, lsl #12      // =8388608
	b.lo	.LBB17_38
// %bb.24:
	ldr	w10, [x20, #1240]
	sub	x9, x9, x10
	cmp	x9, #640, lsl #12       // =2621440
	b.hi	.LBB17_38
// %bb.25:
	str	x1, [sp, #8]            // 8-byte Folded Spill
	mov	w2, #40
	ldr	w19, [x8, #68]
	add	x0, sp, #32             // =32
	mov	w1, wzr
	bl	memset
	mov	w26, wzr
	str	x19, [sp, #16]          // 8-byte Folded Spill
	cbz	w19, .LBB17_104
// %bb.26:
	mov	x27, xzr
	cbnz	x20, .LBB17_75
// %bb.27:
	mov	w19, #9
	add	x21, sp, #32            // =32
	b	.LBB17_30
.LBB17_28:                              //   in Loop: Header=BB17_30 Depth=1
	ldr	w8, [sp, #68]
	add	w8, w8, w1
	str	w8, [sp, #68]
.LBB17_29:                              //   in Loop: Header=BB17_30 Depth=1
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	add	x27, x27, #1            // =1
	cmp	x27, x8
	b.eq	.LBB17_104
.LBB17_30:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB17_33 Depth 2
	ldr	x8, [x20, #136]
	mov	w9, #48
	ldr	w1, [x20, #1188]
	mul	x9, x27, x9
	ldr	x8, [x8]
	str	xzr, [sp, #24]
	ldr	x8, [x8, #136]
	ldr	w9, [x8, x9]
	ubfx	w9, w9, #6, #10
	cbz	w9, .LBB17_28
// %bb.31:                              //   in Loop: Header=BB17_30 Depth=1
	cmp	w9, w1
	ccmp	w1, #0, #4, ne
	b.eq	.LBB17_29
// %bb.32:                              //   in Loop: Header=BB17_30 Depth=1
	mov	w9, #48
	madd	x8, x27, x9, x8
	add	x28, x8, #8             // =8
.LBB17_33:                              //   Parent Loop BB17_30 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x0, [x28]
	add	x2, sp, #24             // =24
	bl	find_next_free_extent
	tbnz	w0, #31, .LBB17_29
// %bb.34:                              //   in Loop: Header=BB17_33 Depth=2
	clz	w8, w0
	cmp	w0, #1024               // =1024
	eor	w8, w8, #0x1f
	ldr	x10, [sp, #24]
	csel	w8, w8, w19, lo
	cmp	w0, #0                  // =0
	csinv	w8, w8, wzr, ne
	ldr	w1, [x20, #1188]
	sbfiz	x8, x8, #2, #32
	add	w26, w0, w26
	ldr	w9, [x21, x8]
	cmp	x10, x1
	add	w9, w9, w0
	str	w9, [x21, x8]
	b.lo	.LBB17_33
	b	.LBB17_29
.LBB17_35:
	ldr	x8, [x20, #3032]
	mov	w10, #192
	madd	x9, x9, x10, x8
	ldp	w19, w10, [x9, #84]
	ldr	w8, [x9, #188]
	add	x9, x9, #184            // =184
	add	w27, w10, #1            // =1
.LBB17_36:
	cmp	x8, #2048, lsl #12      // =8388608
	b.lo	.LBB17_38
// %bb.37:
	ldr	w9, [x9]
	sub	x8, x8, x9
	cmp	x8, #640, lsl #12       // =2621440
	b.ls	.LBB17_65
.LBB17_38:
	mov	w27, wzr
.LBB17_39:
	strb	w27, [x20, #3273]
	ldrb	w8, [x20, #3273]
	cbnz	w8, .LBB17_22
.LBB17_40:
	mov	w8, #100
	mul	x9, x24, x8
	udiv	x9, x9, x25
	cmp	x9, #90                 // =90
	b.ls	.LBB17_42
// %bb.41:
	mov	w8, #30000
	str	wzr, [x20, #1764]
	str	w8, [x20, #1748]
	b	.LBB17_63
.LBB17_42:
	ldr	w10, [x20, #3024]
	ldr	w9, [x20, #3308]
	cmp	w10, #2                 // =2
	b.ne	.LBB17_47
// %bb.43:
	cmp	w9, #1                  // =1
	b.hi	.LBB17_47
// %bb.44:
	ldr	x11, [x20, #16]
	ldr	w11, [x11, #2180]
	tbz	w11, #16, .LBB17_47
// %bb.45:
	ldr	x11, [x20, #3032]
	mov	w12, #192
	madd	x11, x9, x12, x11
	ldp	w13, w12, [x11, #180]
	ldr	w14, [x11, #176]
	ldr	w15, [x11, #168]
	sub	w11, w13, w12
	subs	w12, w15, w14
	b.lo	.LBB17_48
.LBB17_46:
	ldr	w13, [x20, #1184]
	lsl	w12, w12, w13
	cbnz	w11, .LBB17_49
	b	.LBB17_56
.LBB17_47:
	ldr	x11, [x20, #136]
	ldr	w14, [x20, #1236]
	ldp	x12, x13, [x11]
	ldr	w15, [x11, #104]
	ldr	w11, [x12, #16]
	ldr	w12, [x13, #4]
	sub	w11, w14, w11
	subs	w12, w12, w15
	b.hs	.LBB17_46
.LBB17_48:
	mov	w12, wzr
	cbz	w11, .LBB17_56
.LBB17_49:
	cmp	w22, w23
	b.hs	.LBB17_56
// %bb.50:
	umull	x12, w12, w8
	mov	w11, w11
	udiv	x11, x12, x11
	cmp	w11, #9                 // =9
	b.gt	.LBB17_56
// %bb.51:
	mov	w11, #2
	cmp	w10, #2                 // =2
	str	w11, [x20, #1764]
	b.ne	.LBB17_57
// %bb.52:
	cmp	w9, #1                  // =1
	b.hi	.LBB17_57
// %bb.53:
	ldr	x10, [x20, #16]
	ldr	w10, [x10, #2180]
	tbz	w10, #16, .LBB17_57
// %bb.54:
	ldr	x10, [x20, #3032]
	mov	w11, #192
	madd	x9, x9, x11, x10
	ldp	w11, w10, [x9, #180]
	ldr	w12, [x9, #176]
	ldr	w13, [x9, #168]
	sub	w9, w11, w10
	subs	w10, w13, w12
	b.lo	.LBB17_58
.LBB17_55:
	ldr	w11, [x20, #1184]
	lsl	w11, w10, w11
	mov	w10, #10000
	cbnz	w9, .LBB17_59
	b	.LBB17_62
.LBB17_56:
	mov	w8, #1
	mov	w9, #10000
	str	w8, [x20, #1764]
	str	w9, [x20, #1748]
	b	.LBB17_63
.LBB17_57:
	ldr	x9, [x20, #136]
	ldr	w12, [x20, #1236]
	ldp	x10, x11, [x9]
	ldr	w13, [x9, #104]
	ldr	w9, [x10, #16]
	ldr	w10, [x11, #4]
	sub	w9, w12, w9
	subs	w10, w10, w13
	b.hs	.LBB17_55
.LBB17_58:
	mov	w11, wzr
	mov	w10, #10000
	cbz	w9, .LBB17_62
.LBB17_59:
	umull	x8, w11, w8
	mov	w9, w9
	udiv	x8, x8, x9
	mov	w9, #34564
	movk	w9, #1, lsl #16
	mul	w8, w8, w10
	cmp	w8, w9
	b.lt	.LBB17_61
// %bb.60:
	mov	w9, #34079
	movk	w9, #20971, lsl #16
	smull	x8, w8, w9
	lsr	x9, x8, #63
	asr	x8, x8, #37
	add	w10, w8, w9
	b	.LBB17_62
.LBB17_61:
	mov	w10, #1000
.LBB17_62:
	str	w10, [x1]
.LBB17_63:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB17_89
// %bb.64:
	ldp	x20, x19, [sp, #160]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #144]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #128]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #112]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #96]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB17_65:
	str	x1, [sp, #8]            // 8-byte Folded Spill
	mov	w2, #40
	add	x0, sp, #32             // =32
	mov	w1, wzr
	bl	memset
	mov	w26, wzr
	cmp	w19, w27
	b.hs	.LBB17_104
// %bb.66:
	mov	w21, w19
	mov	w8, w27
	mov	w26, wzr
	str	x8, [sp, #16]           // 8-byte Folded Spill
	cbnz	x20, .LBB17_90
// %bb.67:
	mov	w27, #9
	add	x19, sp, #32            // =32
	b	.LBB17_70
.LBB17_68:                              //   in Loop: Header=BB17_70 Depth=1
	ldr	w8, [sp, #68]
	add	w8, w8, w1
	str	w8, [sp, #68]
.LBB17_69:                              //   in Loop: Header=BB17_70 Depth=1
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	add	x21, x21, #1            // =1
	cmp	x21, x8
	b.eq	.LBB17_104
.LBB17_70:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB17_73 Depth 2
	ldr	x8, [x20, #136]
	mov	w9, #48
	ldr	w1, [x20, #1188]
	mul	x9, x21, x9
	ldr	x8, [x8]
	str	xzr, [sp, #24]
	ldr	x8, [x8, #136]
	ldr	w9, [x8, x9]
	ubfx	w9, w9, #6, #10
	cbz	w9, .LBB17_68
// %bb.71:                              //   in Loop: Header=BB17_70 Depth=1
	cmp	w9, w1
	ccmp	w1, #0, #4, ne
	b.eq	.LBB17_69
// %bb.72:                              //   in Loop: Header=BB17_70 Depth=1
	mov	w9, #48
	madd	x8, x21, x9, x8
	add	x28, x8, #8             // =8
.LBB17_73:                              //   Parent Loop BB17_70 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x0, [x28]
	add	x2, sp, #24             // =24
	bl	find_next_free_extent
	tbnz	w0, #31, .LBB17_69
// %bb.74:                              //   in Loop: Header=BB17_73 Depth=2
	clz	w8, w0
	cmp	w0, #1024               // =1024
	eor	w8, w8, #0x1f
	ldr	x10, [sp, #24]
	csel	w8, w8, w27, lo
	cmp	w0, #0                  // =0
	csinv	w8, w8, wzr, ne
	ldr	w1, [x20, #1188]
	sbfiz	x8, x8, #2, #32
	add	w26, w0, w26
	ldr	w9, [x19, x8]
	cmp	x10, x1
	add	w9, w9, w0
	str	w9, [x19, x8]
	b.lo	.LBB17_73
	b	.LBB17_69
.LBB17_75:
	mov	w21, #48
	add	x28, sp, #32            // =32
	b	.LBB17_78
.LBB17_76:                              //   in Loop: Header=BB17_78 Depth=1
	ldr	w8, [sp, #68]
	add	w8, w8, w1
	str	w8, [sp, #68]
.LBB17_77:                              //   in Loop: Header=BB17_78 Depth=1
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	add	x27, x27, #1            // =1
	cmp	x27, x8
	b.eq	.LBB17_104
.LBB17_78:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB17_84 Depth 2
	ldr	x8, [x20, #136]
	mul	x9, x27, x21
	ldr	w1, [x20, #1188]
	ldr	x8, [x8]
	str	xzr, [sp, #24]
	ldr	x8, [x8, #136]
	ldr	w9, [x8, x9]
	ubfx	w9, w9, #6, #10
	cbz	w9, .LBB17_76
// %bb.79:                              //   in Loop: Header=BB17_78 Depth=1
	cmp	w9, w1
	ccmp	w1, #0, #4, ne
	b.eq	.LBB17_77
// %bb.80:                              //   in Loop: Header=BB17_78 Depth=1
	madd	x8, x27, x21, x8
	add	x19, x8, #8             // =8
	b	.LBB17_84
.LBB17_81:                              //   in Loop: Header=BB17_84 Depth=2
	mov	w8, #-1
.LBB17_82:                              //   in Loop: Header=BB17_84 Depth=2
                                        // kill: def $w8 killed $w8 def $x8
.LBB17_83:                              //   in Loop: Header=BB17_84 Depth=2
	sbfiz	x8, x8, #2, #32
	ldr	x10, [sp, #24]
	ldr	w1, [x20, #1188]
	add	w26, w0, w26
	ldr	w9, [x28, x8]
	cmp	x10, x1
	add	w9, w9, w0
	str	w9, [x28, x8]
	b.hs	.LBB17_77
.LBB17_84:                              //   Parent Loop BB17_78 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x0, [x19]
	add	x2, sp, #24             // =24
	bl	find_next_free_extent
	tbnz	w0, #31, .LBB17_77
// %bb.85:                              //   in Loop: Header=BB17_84 Depth=2
	cbz	w0, .LBB17_81
// %bb.86:                              //   in Loop: Header=BB17_84 Depth=2
	cmp	w0, #1024               // =1024
	b.hs	.LBB17_88
// %bb.87:                              //   in Loop: Header=BB17_84 Depth=2
	clz	w8, w0
	eor	w8, w8, #0x1f
	b	.LBB17_83
.LBB17_88:                              //   in Loop: Header=BB17_84 Depth=2
	add	x8, x20, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	mov	w8, #9
	b	.LBB17_82
.LBB17_89:
	bl	__stack_chk_fail
.LBB17_90:
	mov	w27, #48
	add	x28, sp, #32            // =32
	b	.LBB17_93
.LBB17_91:                              //   in Loop: Header=BB17_93 Depth=1
	ldr	w8, [sp, #68]
	add	w8, w8, w1
	str	w8, [sp, #68]
.LBB17_92:                              //   in Loop: Header=BB17_93 Depth=1
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	add	x21, x21, #1            // =1
	cmp	x21, x8
	b.eq	.LBB17_104
.LBB17_93:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB17_99 Depth 2
	ldr	x8, [x20, #136]
	mul	x9, x21, x27
	ldr	w1, [x20, #1188]
	ldr	x8, [x8]
	str	xzr, [sp, #24]
	ldr	x8, [x8, #136]
	ldr	w9, [x8, x9]
	ubfx	w9, w9, #6, #10
	cbz	w9, .LBB17_91
// %bb.94:                              //   in Loop: Header=BB17_93 Depth=1
	cmp	w9, w1
	ccmp	w1, #0, #4, ne
	b.eq	.LBB17_92
// %bb.95:                              //   in Loop: Header=BB17_93 Depth=1
	madd	x8, x21, x27, x8
	add	x19, x8, #8             // =8
	b	.LBB17_99
.LBB17_96:                              //   in Loop: Header=BB17_99 Depth=2
	mov	w8, #-1
.LBB17_97:                              //   in Loop: Header=BB17_99 Depth=2
                                        // kill: def $w8 killed $w8 def $x8
.LBB17_98:                              //   in Loop: Header=BB17_99 Depth=2
	sbfiz	x8, x8, #2, #32
	ldr	x10, [sp, #24]
	ldr	w1, [x20, #1188]
	add	w26, w0, w26
	ldr	w9, [x28, x8]
	cmp	x10, x1
	add	w9, w9, w0
	str	w9, [x28, x8]
	b.hs	.LBB17_92
.LBB17_99:                              //   Parent Loop BB17_93 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x0, [x19]
	add	x2, sp, #24             // =24
	bl	find_next_free_extent
	tbnz	w0, #31, .LBB17_92
// %bb.100:                             //   in Loop: Header=BB17_99 Depth=2
	cbz	w0, .LBB17_96
// %bb.101:                             //   in Loop: Header=BB17_99 Depth=2
	cmp	w0, #1024               // =1024
	b.hs	.LBB17_103
// %bb.102:                             //   in Loop: Header=BB17_99 Depth=2
	clz	w8, w0
	eor	w8, w8, #0x1f
	b	.LBB17_98
.LBB17_103:                             //   in Loop: Header=BB17_99 Depth=2
	add	x8, x20, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	mov	w8, #9
	b	.LBB17_97
.LBB17_104:
	adrp	x21, .L.str.15
	ldr	w3, [sp, #32]
	add	x21, x21, :lo12:.L.str.15
	mov	x0, x20
	mov	x1, x21
	mov	w2, wzr
	bl	f2fs_printk
	ldr	w3, [sp, #36]
	mov	x0, x20
	mov	x1, x21
	mov	w2, #1
	mov	w27, #1
	bl	f2fs_printk
	ldr	w3, [sp, #40]
	mov	x0, x20
	mov	x1, x21
	mov	w2, #2
	bl	f2fs_printk
	ldr	w3, [sp, #44]
	mov	x0, x20
	mov	x1, x21
	mov	w2, #3
	bl	f2fs_printk
	ldr	w3, [sp, #48]
	mov	x0, x20
	mov	x1, x21
	mov	w2, #4
	bl	f2fs_printk
	ldr	w3, [sp, #52]
	mov	w2, #5
	mov	x0, x20
	mov	x1, x21
	bl	f2fs_printk
	ldr	w3, [sp, #56]
	mov	x0, x20
	mov	x1, x21
	mov	w2, #6
	bl	f2fs_printk
	ldr	w3, [sp, #60]
	mov	x0, x20
	mov	x1, x21
	mov	w2, #7
	bl	f2fs_printk
	ldr	w3, [sp, #64]
	mov	x0, x20
	mov	x1, x21
	mov	w2, #8
	bl	f2fs_printk
	ldr	w3, [sp, #68]
	mov	w2, #9
	mov	x0, x20
	mov	x1, x21
	bl	f2fs_printk
	ldp	w8, w9, [sp, #32]
	ldr	x1, [sp, #8]            // 8-byte Folded Reload
	add	w9, w9, w8
	cmp	w9, w26, lsr #1
	b.hs	.LBB17_39
// %bb.105:
	cmp	w8, w26, lsr #2
	cset	w27, hs
	b	.LBB17_39
.Lfunc_end17:
	.size	get_gc_wait_ms, .Lfunc_end17-get_gc_wait_ms
                                        // -- End function
	.p2align	3               // -- Begin function gc_data_segment
	.type	gc_data_segment,@function
gc_data_segment:                        // @gc_data_segment
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	sub	sp, sp, #416            // =416
	adrp	x8, __stack_chk_guard
	str	w5, [sp, #128]          // 4-byte Folded Spill
	str	x4, [sp, #136]          // 8-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stur	x8, [x29, #-16]
	ldr	x8, [x0]
	ldr	w9, [x0, #3312]
	str	x1, [sp, #112]          // 8-byte Folded Spill
	str	x8, [sp, #80]           // 8-byte Folded Spill
	ldr	x8, [x0, #136]
	str	w9, [sp, #68]           // 4-byte Folded Spill
	cbz	x8, .LBB18_2
// %bb.1:
	add	x9, x8, #80             // =80
	b	.LBB18_3
.LBB18_2:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB18_3:
	mov	w11, w3
	stp	wzr, wzr, [sp, #100]    // 8-byte Folded Spill
	ldr	x8, [x8, #8]
	sub	x12, x29, #72           // =72
	ldr	x13, [sp, #136]         // 8-byte Folded Reload
	mov	w27, wzr
	str	x11, [sp, #144]         // 8-byte Folded Spill
	add	x11, x2, #16            // =16
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	str	x11, [sp, #72]          // 8-byte Folded Spill
	add	x11, sp, #200           // =200
	add	x11, x11, #24           // =24
	ldr	w9, [x9]
	cmp	w13, #0                 // =0
	sxtw	x13, w13
	add	w8, w8, w3
	str	w3, [sp, #124]          // 4-byte Folded Spill
	stp	x2, x11, [sp, #48]      // 16-byte Folded Spill
	lsl	w8, w8, w10
	ldr	w21, [x19, #1188]
	add	x11, x12, #8            // =8
	str	x13, [sp, #88]          // 8-byte Folded Spill
	cset	w13, eq
	add	w8, w8, w9
	str	x11, [sp, #40]          // 8-byte Folded Spill
	str	w13, [sp, #64]          // 4-byte Folded Spill
	str	w8, [sp, #108]          // 4-byte Folded Spill
	b	.LBB18_5
.LBB18_4:                               //   in Loop: Header=BB18_5 Depth=1
	add	w27, w27, #1            // =1
	cmp	w27, #5                 // =5
	b.eq	.LBB18_736
.LBB18_5:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB18_10 Depth 2
                                        //       Child Loop BB18_114 Depth 3
                                        //       Child Loop BB18_427 Depth 3
                                        //       Child Loop BB18_480 Depth 3
                                        //       Child Loop BB18_409 Depth 3
	cbz	w21, .LBB18_4
// %bb.6:                               //   in Loop: Header=BB18_5 Depth=1
	ldr	x22, [sp, #112]         // 8-byte Folded Reload
	mov	w26, wzr
	str	w27, [sp, #132]         // 4-byte Folded Spill
	b	.LBB18_10
.LBB18_7:                               //   in Loop: Header=BB18_10 Depth=2
	ldr	w27, [sp, #132]         // 4-byte Folded Reload
.LBB18_8:                               //   in Loop: Header=BB18_10 Depth=2
	ldr	x22, [sp, #152]         // 8-byte Folded Reload
.LBB18_9:                               //   in Loop: Header=BB18_10 Depth=2
	ldr	w21, [x19, #1188]
	add	w26, w26, #1            // =1
	add	x22, x22, #7            // =7
	cmp	w26, w21
	b.hs	.LBB18_4
.LBB18_10:                              //   Parent Loop BB18_5 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB18_114 Depth 3
                                        //       Child Loop BB18_427 Depth 3
                                        //       Child Loop BB18_480 Depth 3
                                        //       Child Loop BB18_409 Depth 3
	ldr	w25, [x22]
	ldr	x8, [sp, #136]          // 8-byte Folded Reload
	str	x22, [sp, #152]         // 8-byte Folded Spill
	cbnz	w8, .LBB18_23
// %bb.11:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w24, [x19, #1192]
	ldrsw	x23, [x19, #1284]
	ldr	w28, [x19, #1184]
	ldrsw	x27, [x19, #1272]
	ldrsw	x20, [x19, #1296]
	ldr	x8, [x19, #80]
	tbnz	w8, #3, .LBB18_23
// %bb.12:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x11, [x19, #136]
	ldr	x8, [x11, #8]
	ldr	w9, [x11, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	b.eq	.LBB18_14
// %bb.13:                              //   in Loop: Header=BB18_10 Depth=2
	udiv	w10, w9, w24
	cmp	w8, w10
	b.eq	.LBB18_15
	b	.LBB18_19
.LBB18_14:                              //   in Loop: Header=BB18_10 Depth=2
	mov	w10, #-1
                                        // kill: def $w10 killed $w10 killed $x10
	cmp	w8, w10
	b.ne	.LBB18_19
.LBB18_15:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w12, [x19, #1284]
	mov	w15, #48
	ldr	w13, [x19, #1272]
	ldr	w22, [x19, #1272]
	ldr	x10, [x11, #24]
	ldr	x11, [x11]
	add	w12, w13, w12
	ldr	w14, [x10, #460]
	ldr	x11, [x11, #136]
	madd	x14, x14, x15, x11
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w13, w21, w14
	cmp	w13, w12
	b.lo	.LBB18_19
// %bb.16:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w13, [x10, #580]
	madd	x13, x13, x15, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w21, w13
	cmp	w13, w12
	b.lo	.LBB18_19
// %bb.17:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w13, [x10, #700]
	madd	x13, x13, x15, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w21, w13
	cmp	w13, w12
	b.lo	.LBB18_19
// %bb.18:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w12, [x10, #100]
	madd	x11, x12, x15, x11
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w11, w21, w11
	cmp	w11, w22
	b.hs	.LBB18_76
.LBB18_19:                              //   in Loop: Header=BB18_10 Depth=2
	mul	w10, w24, w21
	cmn	w9, #1                  // =1
	sub	x10, x10, #1            // =1
	add	x12, x10, x27
	add	x11, x10, x23
	asr	x12, x12, x28
	add	x10, x10, x20
	asr	x11, x11, x28
	udiv	w12, w12, w24
	asr	x10, x10, x28
	udiv	w11, w11, w24
	udiv	w10, w10, w24
	add	w11, w11, w12, lsl #1
	add	w10, w11, w10
	b.eq	.LBB18_21
// %bb.20:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w11, [x19, #1192]
	udiv	w9, w9, w11
	b	.LBB18_22
.LBB18_21:                              //   in Loop: Header=BB18_10 Depth=2
	mov	w9, #-1
                                        // kill: def $w9 killed $w9 killed $x9
.LBB18_22:                              //   in Loop: Header=BB18_10 Depth=2
	add	w9, w10, w9
	cmp	w8, w9
	b.ls	.LBB18_736
.LBB18_23:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [sp, #128]          // 4-byte Folded Reload
	tbz	w8, #0, .LBB18_25
// %bb.24:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
	b	.LBB18_32
.LBB18_25:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x19, #136]
	ldr	w9, [x19, #1192]
	ldr	x8, [x8]
	cmp	w9, #2                  // =2
	b.lo	.LBB18_28
// %bb.26:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w11, [sp, #124]         // 4-byte Folded Reload
	ldr	x10, [x8, #144]
	cmn	w11, #1                 // =1
	b.eq	.LBB18_29
// %bb.27:                              //   in Loop: Header=BB18_10 Depth=2
	udiv	w11, w11, w9
	b	.LBB18_30
.LBB18_28:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x11, [sp, #144]         // 8-byte Folded Reload
	mov	w12, #48
	ldr	x10, [x8, #136]
	mul	x11, x11, x12
	ldr	w10, [x10, x11]
	ubfx	w10, w10, #6, #10
	b	.LBB18_31
.LBB18_29:                              //   in Loop: Header=BB18_10 Depth=2
	mov	w11, #-1
.LBB18_30:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w10, [x10, x11, lsl #2]
.LBB18_31:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w11, [x19, #1188]
	mul	w9, w11, w9
	cmp	w10, w9
	b.eq	.LBB18_736
.LBB18_32:                              //   in Loop: Header=BB18_10 Depth=2
	add	x20, x8, #88            // =88
	mov	x0, x20
	bl	down_read
	ldr	x8, [x19, #136]
	mov	w10, #48
	ldr	x9, [sp, #144]          // 8-byte Folded Reload
	mov	x0, x20
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	madd	x8, x9, x10, x8
	mov	w9, w26
	lsr	x24, x9, #3
	mvn	w9, w26
	and	w9, w9, #0x7
	mov	w10, #1
	ldr	x8, [x8, #8]
	lsl	w21, w10, w9
	ldrb	w8, [x8, x24]
	and	w22, w21, w8
	bl	up_read
	cbz	w22, .LBB18_7
// %bb.33:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w27, [sp, #132]         // 4-byte Folded Reload
	cmp	w27, #1                 // =1
	b.eq	.LBB18_36
// %bb.34:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x22, [sp, #152]         // 8-byte Folded Reload
	cbnz	w27, .LBB18_37
// %bb.35:                              //   in Loop: Header=BB18_10 Depth=2
	mov	w8, #289
	mov	x0, x19
	movk	w8, #8210, lsl #16
	mov	w2, #1
	mov	w3, #1
	mov	w4, #1
	umull	x8, w25, w8
	lsr	x8, x8, #32
	sub	w9, w25, w8
	add	w8, w8, w9, lsr #1
	lsr	w1, w8, #8
	bl	f2fs_ra_meta_pages
	b	.LBB18_9
.LBB18_36:                              //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x19
	mov	w1, w25
	bl	f2fs_ra_node_page
	b	.LBB18_8
.LBB18_37:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w20, [x22]
	mov	x0, x19
	ldurh	w23, [x22, #5]
	mov	x1, x20
	bl	f2fs_get_node_page
	cmn	x0, #1, lsl #12         // =4096
	b.ls	.LBB18_41
.LBB18_38:                              //   in Loop: Header=BB18_10 Depth=2
	ldrb	w8, [x19, #1992]
	cbz	w8, .LBB18_9
// %bb.39:                              //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x19, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB18_9
// %bb.40:                              //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.gc_data_segment
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.gc_data_segment
	mov	w3, #2899
	bl	f2fs_printk
	b	.LBB18_9
.LBB18_41:                              //   in Loop: Header=BB18_10 Depth=2
	mov	x25, x0
	add	x2, sp, #160            // =160
	mov	x0, x19
	mov	w1, w20
	mov	w3, wzr
	bl	get_node_info_ex
	cbz	w0, .LBB18_59
// %bb.42:                              //   in Loop: Header=BB18_10 Depth=2
	cbz	x25, .LBB18_38
// %bb.43:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x25, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x25, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_68
// %bb.44:                              //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_58
// %bb.45:                              //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_48
// %bb.46:                              //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_48
// %bb.47:                              //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_48:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_50
// %bb.49:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB18_418
.LBB18_50:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x25, #24]
.LBB18_51:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_53
// %bb.52:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB18_419
.LBB18_53:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x25, #24]
.LBB18_54:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_56
// %bb.55:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB18_420
.LBB18_56:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x25, #24]
.LBB18_57:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_58:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_74
	b	.LBB18_750
.LBB18_59:                              //   in Loop: Header=BB18_10 Depth=2
	ldrb	w8, [x22, #4]
	ldrb	w9, [sp, #172]
	cmp	w8, w9
	b.eq	.LBB18_65
// %bb.60:                              //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.21
	adrp	x2, .L__func__.is_alive
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.21
	add	x2, x2, :lo12:.L__func__.is_alive
	bl	f2fs_printk
	cbz	x19, .LBB18_62
// %bb.61:                              //   in Loop: Header=BB18_10 Depth=2
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB18_62:                              //   in Loop: Header=BB18_10 Depth=2
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_65
// %bb.63:                              //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_65
// %bb.64:                              //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.18
	adrp	x2, .L__func__.is_alive
	add	x1, x1, :lo12:.L.str.18
	add	x2, x2, :lo12:.L__func__.is_alive
	mov	w3, #2175
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	mov	w8, #15241
	ldr	x0, [x20, :lo12:f2fs_dclient]
	movk	w8, #14160, lsl #16
	add	w1, w8, #3              // =3
	bl	dsm_client_notify
.LBB18_65:                              //   in Loop: Header=BB18_10 Depth=2
	lsl	x8, x25, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w10, [x8, #4076]
	ldr	w20, [x8, #4080]
	cmp	w9, w10
	b.ne	.LBB18_67
// %bb.66:                              //   in Loop: Header=BB18_10 Depth=2
	ldrb	w11, [x8, #3]
	tbnz	w11, #5, .LBB18_80
.LBB18_67:                              //   in Loop: Header=BB18_10 Depth=2
	mov	x11, xzr
	b	.LBB18_81
.LBB18_68:                              //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_73
// %bb.69:                              //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_72
// %bb.70:                              //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_72
// %bb.71:                              //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_72:                              //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_73:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_751
.LBB18_74:                              //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	unlock_page
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x25, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_38
// %bb.75:                              //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
	b	.LBB18_38
.LBB18_76:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB18_23
// %bb.77:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB18_23
// %bb.78:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	w1, [x10, #820]
	mov	x0, x19
	str	x1, [sp, #32]           // 8-byte Folded Spill
                                        // kill: def $w1 killed $w1 killed $x1
	bl	f2fs_usable_blks_in_seg
	ldr	x9, [x19, #136]
	mov	w10, #48
	ldr	x11, [sp, #32]          // 8-byte Folded Reload
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x11, x10, x8
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w22
	b.hs	.LBB18_23
// %bb.79:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x9, #8]
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB18_19
.LBB18_80:                              //   in Loop: Header=BB18_10 Depth=2
	ldrh	w11, [x8, #360]
	lsr	x11, x11, #2
.LBB18_81:                              //   in Loop: Header=BB18_10 Depth=2
	add	x12, x8, #360           // =360
	cmp	w9, w10
	csel	x8, x12, x8, eq
	add	x9, x11, x23
	ldr	w28, [x8, x9, lsl #2]
	cbz	x25, .LBB18_106
// %bb.82:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x25, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x25, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_98
// %bb.83:                              //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_97
// %bb.84:                              //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_87
// %bb.85:                              //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_87
// %bb.86:                              //   in Loop: Header=BB18_10 Depth=2
	adrp	x22, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x22, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	ldr	x22, [sp, #152]         // 8-byte Folded Reload
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_87:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_89
// %bb.88:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB18_433
.LBB18_89:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x25, #24]
.LBB18_90:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_92
// %bb.91:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB18_434
.LBB18_92:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x25, #24]
.LBB18_93:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_95
// %bb.94:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB18_435
.LBB18_95:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x25, #24]
.LBB18_96:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_97:                              //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_104
	b	.LBB18_752
.LBB18_98:                              //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_103
// %bb.99:                              //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_102
// %bb.100:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_102
// %bb.101:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x22, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x22, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	ldr	x22, [sp, #152]         // 8-byte Folded Reload
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_102:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_103:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_753
.LBB18_104:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	unlock_page
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x25, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_106
// %bb.105:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
.LBB18_106:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [sp, #108]          // 4-byte Folded Reload
	add	w25, w8, w26
	cmp	w28, w25
	b.ne	.LBB18_109
// %bb.107:                             //   in Loop: Header=BB18_10 Depth=2
	cmp	w27, #2                 // =2
	b.ne	.LBB18_120
// %bb.108:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w1, [sp, #164]
	mov	x0, x19
	bl	f2fs_ra_node_page
	b	.LBB18_9
.LBB18_109:                             //   in Loop: Header=BB18_10 Depth=2
	add	w8, w25, #3             // =3
	mov	w20, #-1
	cmp	w8, #4                  // =4
                                        // kill: def $w20 killed $w20 killed $x20 def $x20
	b.lo	.LBB18_139
// %bb.110:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB18_118
// %bb.111:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x19]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB18_117
// %bb.112:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB18_114
.LBB18_113:                             //   in Loop: Header=BB18_114 Depth=3
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB18_117
.LBB18_114:                             //   Parent Loop BB18_5 Depth=1
                                        //     Parent Loop BB18_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w12, [x11, #-4]
	cmp	w12, w25
	b.hi	.LBB18_113
// %bb.115:                             //   in Loop: Header=BB18_114 Depth=3
	ldr	w12, [x11]
	cmp	w12, w25
	b.lo	.LBB18_113
// %bb.116:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	x8, [x11, #-80]
.LBB18_117:                             //   in Loop: Header=BB18_10 Depth=2
	cbz	x8, .LBB18_141
.LBB18_118:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x19, #136]
	cbz	x8, .LBB18_137
// %bb.119:                             //   in Loop: Header=BB18_10 Depth=2
	add	x9, x8, #80             // =80
	b	.LBB18_138
.LBB18_120:                             //   in Loop: Header=BB18_10 Depth=2
	ldurh	w28, [x22, #5]
	lsr	w23, w20, #3
	ldr	w1, [sp, #164]
	cmp	w27, #3                 // =3
	b.ne	.LBB18_128
// %bb.121:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	f2fs_iget
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB18_123
// %bb.122:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x25, x0
	bl	is_bad_inode
	tbz	w0, #0, .LBB18_146
.LBB18_123:                             //   in Loop: Header=BB18_10 Depth=2
	cbz	x19, .LBB18_125
// %bb.124:                             //   in Loop: Header=BB18_10 Depth=2
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB18_125:                             //   in Loop: Header=BB18_10 Depth=2
	ldrb	w8, [x19, #1992]
	cbz	w8, .LBB18_9
// %bb.126:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x19, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB18_9
// %bb.127:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.gc_data_segment
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.gc_data_segment
	mov	w3, #2919
	bl	f2fs_printk
	b	.LBB18_9
.LBB18_128:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [sp, #72]           // 8-byte Folded Reload
	bl	radix_tree_lookup
	cbz	x0, .LBB18_134
// %bb.129:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x25, [x0, #16]
	cbz	x25, .LBB18_134
// %bb.130:                             //   in Loop: Header=BB18_10 Depth=2
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB18_150
// %bb.131:                             //   in Loop: Header=BB18_10 Depth=2
	str	w28, [sp, #32]          // 4-byte Folded Spill
	add	x28, x25, #968          // =968
	mov	x0, x28
	bl	down_write_trylock
	cbz	w0, .LBB18_158
// %bb.132:                             //   in Loop: Header=BB18_10 Depth=2
	add	x0, x25, #1016          // =1016
	bl	down_write_trylock
	cbz	w0, .LBB18_164
// %bb.133:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	inode_dio_wait
	ldr	w28, [sp, #32]          // 4-byte Folded Reload
	mov	w8, #1
	b	.LBB18_151
.LBB18_134:                             //   in Loop: Header=BB18_10 Depth=2
	ldrb	w8, [x19, #1992]
	cbz	w8, .LBB18_9
// %bb.135:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x19, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB18_9
// %bb.136:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.gc_data_segment
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.gc_data_segment
	mov	w3, #3060
	bl	f2fs_printk
	b	.LBB18_9
.LBB18_137:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB18_138:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	sub	w9, w25, w9
	lsr	w9, w9, w10
	sub	w20, w9, w8
.LBB18_139:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x19, #136]
	cbz	x8, .LBB18_142
.LBB18_140:                             //   in Loop: Header=BB18_10 Depth=2
	add	x9, x8, #80             // =80
	b	.LBB18_143
.LBB18_141:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w20, #-1
                                        // kill: def $w20 killed $w20 killed $x20 def $x20
	ldr	x8, [x19, #136]
	cbnz	x8, .LBB18_140
.LBB18_142:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB18_143:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x8]
	ldr	w9, [x9]
	ldr	w10, [x19, #1188]
	add	x24, x8, #88            // =88
	mov	x0, x24
	sub	w9, w25, w9
	sub	w10, w10, #1            // =1
	and	w21, w10, w9
	mvn	w22, w21
	bl	down_read
	ldr	x8, [x19, #136]
	mov	w9, #48
	mov	x0, x24
	and	w22, w22, #0x7
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	umaddl	x8, w20, w9, x8
	lsr	x9, x21, #3
	ldr	x8, [x8, #8]
	ldrb	w21, [x8, x9]
	bl	up_read
	lsr	w8, w21, w22
	ldr	x22, [sp, #152]         // 8-byte Folded Reload
	tbz	w8, #0, .LBB18_38
// %bb.144:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x19, #136]
	lsr	w10, w20, #6
	ldr	x8, [x8]
	ldr	x8, [x8, #48]
	ldr	x9, [x8, w10, uxtw #3]
	str	x9, [sp, #200]
	mov	w9, #1
	ldr	x11, [sp, #200]
	lsl	x9, x9, x20
	tst	x11, x9
	b.ne	.LBB18_38
// %bb.145:                             //   in Loop: Header=BB18_10 Depth=2
	add	x8, x8, x10, lsl #3
	//APP
	// atomic64_fetch_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x11, x10, x9
	stlxr	w12, x11, [x8]
	cbnz	w12, 1b
	dmb ish
	//NO_APP
	tst	x10, x9
	b.ne	.LBB18_38
	b	.LBB18_754
.LBB18_146:                             //   in Loop: Header=BB18_10 Depth=2
	add	x24, x25, #1016         // =1016
	mov	x0, x24
	bl	down_write_trylock
	mov	w12, #1018
	cbz	w0, .LBB18_155
// %bb.147:                             //   in Loop: Header=BB18_10 Depth=2
	cbz	w23, .LBB18_161
// %bb.148:                             //   in Loop: Header=BB18_10 Depth=2
	cmp	w20, #23                // =23
	b.hi	.LBB18_162
// %bb.149:                             //   in Loop: Header=BB18_10 Depth=2
	sub	w8, w23, #1             // =1
	b	.LBB18_210
.LBB18_150:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w8, wzr
.LBB18_151:                             //   in Loop: Header=BB18_10 Depth=2
	str	w8, [sp, #32]           // 4-byte Folded Spill
	cbz	w23, .LBB18_154
// %bb.152:                             //   in Loop: Header=BB18_10 Depth=2
	cmp	w20, #23                // =23
	b.hi	.LBB18_156
// %bb.153:                             //   in Loop: Header=BB18_10 Depth=2
	sub	w8, w23, #1             // =1
	b	.LBB18_168
.LBB18_154:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w8, wzr
	b	.LBB18_175
.LBB18_155:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	iput
	ldr	x8, [x19, #1904]
	add	x8, x8, #1              // =1
	str	x8, [x19, #1904]
	b	.LBB18_9
.LBB18_156:                             //   in Loop: Header=BB18_10 Depth=2
	cmp	w23, #2040              // =2040
	b.hi	.LBB18_167
// %bb.157:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w9, #37367
	sub	w8, w23, #4             // =4
	movk	w9, #321, lsl #16
	umull	x9, w8, w9
	lsr	x9, x9, #32
	sub	w8, w8, w9
	add	w8, w9, w8, lsr #1
	sub	w8, w23, w8, lsr #9
	sub	w8, w8, #2              // =2
	b	.LBB18_168
.LBB18_158:                             //   in Loop: Header=BB18_10 Depth=2
	ldrb	w8, [x19, #1992]
	cbz	w8, .LBB18_9
// %bb.159:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x19, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB18_9
// %bb.160:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.gc_data_segment
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.gc_data_segment
	mov	w3, #2986
	bl	f2fs_printk
	b	.LBB18_9
.LBB18_161:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w8, wzr
	b	.LBB18_217
.LBB18_162:                             //   in Loop: Header=BB18_10 Depth=2
	cmp	w23, #2040              // =2040
	b.hi	.LBB18_209
// %bb.163:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w9, #37367
	sub	w8, w23, #4             // =4
	movk	w9, #321, lsl #16
	umull	x9, w8, w9
	lsr	x9, x9, #32
	sub	w8, w8, w9
	add	w8, w9, w8, lsr #1
	sub	w8, w23, w8, lsr #9
	sub	w8, w8, #2              // =2
	b	.LBB18_210
.LBB18_164:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x19, #1904]
	mov	x0, x28
	add	x8, x8, #1              // =1
	str	x8, [x19, #1904]
	bl	up_write
	ldrb	w8, [x19, #1992]
	cbz	w8, .LBB18_9
// %bb.165:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x19, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB18_9
// %bb.166:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.gc_data_segment
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.gc_data_segment
	mov	w3, #2993
	bl	f2fs_printk
	b	.LBB18_9
.LBB18_167:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w9, #37367
	sub	w8, w23, #2043          // =2043
	movk	w9, #321, lsl #16
	umull	x9, w8, w9
	lsr	x9, x9, #32
	sub	w8, w8, w9
	add	w8, w9, w8, lsr #1
	sub	w8, w23, w8, lsr #9
	sub	w8, w8, #5              // =5
.LBB18_168:                             //   in Loop: Header=BB18_10 Depth=2
	ldrh	w9, [x25]
	mov	w12, #1018
	mov	w10, w12
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB18_171
// %bb.169:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x11, [x25, #712]
	mov	w10, w12
	tbz	w11, #31, .LBB18_171
// %bb.170:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w10, [x25, #1268]
	neg	w10, w10
	and	w10, w10, w12
.LBB18_171:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w11, [x25, #1160]
	mul	w8, w10, w8
	ldr	w12, [x25, #1168]
	cmp	w9, #8, lsl #12         // =32768
	add	w10, w12, w11, asr #2
	mov	w11, #923
	sub	w10, w11, w10
	b.ne	.LBB18_174
// %bb.172:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x25, #712]
	tbz	w9, #31, .LBB18_174
// %bb.173:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w9, [x25, #1268]
	neg	w9, w9
	and	w10, w10, w9
.LBB18_174:                             //   in Loop: Header=BB18_10 Depth=2
	add	w8, w10, w8
.LBB18_175:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w2, [sp, #68]           // 4-byte Folded Reload
	mov	x0, x19
	mov	x1, x25
	add	w28, w8, w28
	bl	__get_gc_migrate_tag
	ldr	w8, [x19, #3312]
	cbz	w8, .LBB18_180
.LBB18_176:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w3, [sp, #124]          // 4-byte Folded Reload
	mov	x0, x25
	mov	w1, w28
	mov	w4, w26
	ldr	x2, [sp, #136]          // 8-byte Folded Reload
                                        // kill: def $w2 killed $w2 killed $x2
	bl	move_data_page
	mov	w24, w0
.LBB18_177:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w9, [sp, #32]           // 4-byte Folded Reload
	cbnz	w24, .LBB18_199
// %bb.178:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [sp, #136]          // 8-byte Folded Reload
	cmp	w8, #1                  // =1
	b.ne	.LBB18_198
.LBB18_179:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [sp, #100]          // 4-byte Folded Reload
	add	w8, w8, #1              // =1
	str	w8, [sp, #100]          // 4-byte Folded Spill
	b	.LBB18_199
.LBB18_180:                             //   in Loop: Header=BB18_10 Depth=2
	ldrb	w8, [x25, #13]
	tbz	w8, #6, .LBB18_182
// %bb.181:                             //   in Loop: Header=BB18_10 Depth=2
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.eq	.LBB18_183
.LBB18_182:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #640]
	cbz	x8, .LBB18_205
.LBB18_183:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x10, [sp, #56]          // 8-byte Folded Reload
	str	wzr, [sp, #180]
	stp	xzr, xzr, [x10, #104]
	stp	xzr, xzr, [x10, #88]
	stp	xzr, xzr, [x10, #72]
	stp	xzr, xzr, [x10, #56]
	stp	xzr, xzr, [x10, #40]
	stp	xzr, xzr, [x10, #24]
	stp	xzr, xzr, [x10, #8]
	ldr	x8, [x25, #40]
	ldr	x9, [x25, #64]
	str	xzr, [x10]
	str	wzr, [sp, #220]
	ldr	x8, [x8, #1104]
	str	w9, [sp, #208]
	mov	x9, #8589934592
	strb	wzr, [sp, #288]
	strb	wzr, [sp, #290]
	stur	x9, [sp, #212]
	ldr	w23, [x8, #1504]
	ldr	x9, [sp, #136]          // 8-byte Folded Reload
	str	x8, [sp, #200]
	cbnz	w9, .LBB18_186
// %bb.184:                             //   in Loop: Header=BB18_10 Depth=2
	ldrb	w9, [x8, #1800]
	cbz	w9, .LBB18_186
// %bb.185:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w9, [x8, #1868]
	mov	w10, #10
	cmp	w9, #5                  // =5
	b.ne	.LBB18_190
.LBB18_186:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w9, [x8, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB18_189
// %bb.187:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x8, #16]
	ldrb	w9, [x9, #2182]
	tbz	w9, #0, .LBB18_189
// %bb.188:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x8, #3032]
	ldr	w10, [sp, #124]         // 4-byte Folded Reload
	ldr	w9, [x8, #276]
	cmp	w9, w10
	b.ls	.LBB18_290
.LBB18_189:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w10, #2
.LBB18_190:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x25, #48]
	mov	w20, w28
	mov	x1, x20
	mov	w2, #7
	str	w10, [sp, #20]          // 4-byte Folded Spill
	ldr	w3, [x0, #140]
	bl	pagecache_get_page
	ldr	x8, [x25, #40]
	ldr	x28, [x8, #1104]
	cbz	x0, .LBB18_202
// %bb.191:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #136]
	str	w23, [sp, #16]          // 4-byte Folded Spill
	mov	x23, x25
	str	x0, [sp, #24]           // 8-byte Folded Spill
	ldr	x8, [x8]
	add	x25, x8, #88            // =88
	mov	x0, x25
	bl	down_read
	ldr	x8, [x28, #136]
	mov	w10, #48
	ldr	x9, [sp, #144]          // 8-byte Folded Reload
	mov	x0, x25
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	madd	x8, x9, x10, x8
	ldr	x8, [x8, #8]
	ldrb	w8, [x8, x24]
	and	w21, w21, w8
	bl	up_read
	mov	x25, x23
	cbz	w21, .LBB18_248
// %bb.192:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB18_281
// %bb.193:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #712]
	tbnz	w8, #28, .LBB18_285
// %bb.194:                             //   in Loop: Header=BB18_10 Depth=2
	sub	x0, x29, #72            // =72
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	sub	x0, x29, #72            // =72
	mov	x1, x20
	mov	w2, #1
	stur	x25, [x29, #-72]
	stp	xzr, xzr, [x8]
	str	wzr, [x8, #16]
	bl	f2fs_get_dnode_of_data
	cbz	w0, .LBB18_315
// %bb.195:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #40]
	mov	w24, w0
	ldr	x0, [x8, #1104]
	ldrb	w8, [x0, #1992]
	cbz	w8, .LBB18_639
// %bb.196:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x0, #1968]
	movk	x9, #15099, lsl #16
	ldr	x21, [sp, #24]          // 8-byte Folded Reload
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB18_640
// %bb.197:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_block
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.move_data_block
	mov	w3, #2484
	bl	f2fs_printk
	b	.LBB18_640
.LBB18_198:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [x19, #3312]
	cbz	w8, .LBB18_252
.LBB18_199:                             //   in Loop: Header=BB18_10 Depth=2
	cbz	w9, .LBB18_201
// %bb.200:                             //   in Loop: Header=BB18_10 Depth=2
	add	x0, x25, #1016          // =1016
	bl	up_write
	add	x0, x25, #968           // =968
	bl	up_write
.LBB18_201:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x19, #2016]
	cmp	w24, #0                 // =0
	ldr	w12, [sp, #64]          // 4-byte Folded Reload
	ldr	w11, [x8, #456]
	ldr	w9, [x8, #444]
	ldr	w10, [x8, #448]
	add	w11, w11, w12
	ldr	w12, [sp, #104]         // 4-byte Folded Reload
	add	w9, w9, #1              // =1
	add	w10, w10, #1            // =1
	str	w11, [x8, #456]
	cinc	w12, w12, eq
	str	w9, [x8, #444]
	str	w10, [x8, #448]
	str	w12, [sp, #104]         // 4-byte Folded Spill
	b	.LBB18_9
.LBB18_202:                             //   in Loop: Header=BB18_10 Depth=2
	ldrb	w8, [x28, #1992]
	cbz	w8, .LBB18_284
// %bb.203:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x28, #1968]
	movk	x9, #15099, lsl #16
	mov	w24, #-12
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB18_177
// %bb.204:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_block
	mov	x0, x28
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.move_data_block
	mov	w3, #2456
	bl	f2fs_printk
	mov	w24, #-12
	b	.LBB18_177
.LBB18_205:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB18_288
// %bb.206:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [x25, #1256]
	cbnz	w8, .LBB18_183
// %bb.207:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #712]
	tbnz	x8, #35, .LBB18_183
// %bb.208:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #712]
	tbz	x8, #34, .LBB18_176
	b	.LBB18_183
.LBB18_209:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w9, #37367
	sub	w8, w23, #2043          // =2043
	movk	w9, #321, lsl #16
	umull	x9, w8, w9
	lsr	x9, x9, #32
	sub	w8, w8, w9
	add	w8, w9, w8, lsr #1
	sub	w8, w23, w8, lsr #9
	sub	w8, w8, #5              // =5
.LBB18_210:                             //   in Loop: Header=BB18_10 Depth=2
	ldrh	w9, [x25]
	mov	w10, w12
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB18_213
// %bb.211:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x11, [x25, #712]
	mov	w10, w12
	tbz	w11, #31, .LBB18_213
// %bb.212:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w10, [x25, #1268]
	neg	w10, w10
	and	w10, w10, w12
.LBB18_213:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w11, [x25, #1160]
	mul	w8, w10, w8
	ldr	w12, [x25, #1168]
	cmp	w9, #8, lsl #12         // =32768
	add	w10, w12, w11, asr #2
	mov	w11, #923
	sub	w10, w11, w10
	b.ne	.LBB18_216
// %bb.214:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x25, #712]
	tbz	w9, #31, .LBB18_216
// %bb.215:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w9, [x25, #1268]
	neg	w9, w9
	and	w10, w10, w9
.LBB18_216:                             //   in Loop: Header=BB18_10 Depth=2
	add	w8, w10, w8
.LBB18_217:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w2, [sp, #68]           // 4-byte Folded Reload
	mov	x0, x19
	mov	x1, x25
	add	w21, w8, w28
	bl	__get_gc_migrate_tag
	ldr	w8, [x19, #3312]
	cbz	w8, .LBB18_220
.LBB18_218:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w1, w21
	mov	x0, x25
	mov	w2, #524288
	mov	w3, #1
	bl	f2fs_get_read_data_page
	mov	x20, x0
	mov	x0, x24
	bl	up_write
	cmn	x20, #4095              // =4095
	b.lo	.LBB18_245
// %bb.219:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	iput
	b	.LBB18_9
.LBB18_220:                             //   in Loop: Header=BB18_10 Depth=2
	ldrb	w8, [x25, #13]
	tbz	w8, #6, .LBB18_222
// %bb.221:                             //   in Loop: Header=BB18_10 Depth=2
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.eq	.LBB18_223
.LBB18_222:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #640]
	cbz	x8, .LBB18_259
.LBB18_223:                             //   in Loop: Header=BB18_10 Depth=2
	ldp	x8, x0, [x25, #40]
	mov	w20, w21
	mov	w2, #2
	ldr	x9, [sp, #56]           // 8-byte Folded Reload
	mov	x1, x20
	str	wzr, [sp, #192]
	ldr	x28, [x8, #1104]
	str	xzr, [sp, #184]
	stp	xzr, xzr, [x9, #104]
	stp	xzr, xzr, [x9, #88]
	stp	xzr, xzr, [x9, #72]
	stp	xzr, xzr, [x9, #56]
	stp	xzr, xzr, [x9, #40]
	stp	xzr, xzr, [x9, #24]
	stp	xzr, xzr, [x9, #8]
	ldr	x8, [x25, #64]
	str	xzr, [x9]
	str	x28, [sp, #200]
	str	wzr, [sp, #220]
	str	w8, [sp, #208]
	mov	x8, #8589934592
	strb	wzr, [sp, #288]
	strb	wzr, [sp, #290]
	stur	x8, [sp, #212]
	bl	grab_cache_page_write_begin
	cbz	x0, .LBB18_251
// %bb.224:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x23, x0
	add	x2, sp, #184            // =184
	mov	x0, x25
	mov	x1, x20
	bl	f2fs_lookup_extent_cache
	tbz	w0, #0, .LBB18_263
// %bb.225:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [sp, #192]
	mov	x0, x28
	ldr	w9, [sp, #184]
	mov	w2, #8
	add	w8, w8, w21
	sub	w1, w8, w9
	stur	w1, [x29, #-36]
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB18_414
.LBB18_226:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	w8, [x29, #-36]
	mov	x0, x23
	mov	w1, wzr
	mov	w2, #1
	mov	w3, #1
	str	x23, [sp, #240]
	stp	w8, w8, [sp, #228]
	bl	f2fs_wait_on_page_writeback
	ldur	w1, [x29, #-36]
	mov	x0, x25
	bl	f2fs_wait_on_block_writeback
	ldr	x8, [x28, #248]
	mov	w3, #64
	ldur	w1, [x29, #-36]
	mov	w2, #6
	movk	w3, #96, lsl #16
	ldr	x0, [x8, #48]
	bl	pagecache_get_page
	str	x0, [sp, #248]
	cbz	x0, .LBB18_292
// %bb.227:                             //   in Loop: Header=BB18_10 Depth=2
	add	x0, sp, #200            // =200
	mov	x21, x28
	bl	f2fs_submit_page_bio
	ldr	x28, [sp, #248]
	cbz	w0, .LBB18_296
// %bb.228:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w20, w0
	cbz	x28, .LBB18_376
// %bb.229:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x28, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x28, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_340
// %bb.230:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_244
// %bb.231:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_234
// %bb.232:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_234
// %bb.233:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x8, :lo12:f2fs_dclient]
	mov	w21, w20
	mov	x20, x8
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	mov	w20, w21
	bl	dsm_client_notify
.LBB18_234:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_236
// %bb.235:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_701
.LBB18_236:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_237:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_239
// %bb.238:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_702
.LBB18_239:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_240:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_242
// %bb.241:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_703
.LBB18_242:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_243:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_244:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_346
	b	.LBB18_758
.LBB18_245:                             //   in Loop: Header=BB18_10 Depth=2
	cbz	x20, .LBB18_404
// %bb.246:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x20, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_404
// %bb.247:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
	b	.LBB18_404
.LBB18_248:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #40]
	ldr	x0, [x8, #1104]
	ldrb	w8, [x0, #1992]
	cbz	w8, .LBB18_291
// %bb.249:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x0, #1968]
	movk	x9, #15099, lsl #16
	ldr	x21, [sp, #24]          // 8-byte Folded Reload
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.ls	.LBB18_690
// %bb.250:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w24, #-2
	b	.LBB18_640
.LBB18_251:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w20, #-12
	b	.LBB18_400
.LBB18_252:                             //   in Loop: Header=BB18_10 Depth=2
	ldrb	w8, [x25, #13]
	tbz	w8, #6, .LBB18_254
// %bb.253:                             //   in Loop: Header=BB18_10 Depth=2
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.eq	.LBB18_179
.LBB18_254:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #640]
	cbnz	x8, .LBB18_179
// %bb.255:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB18_360
// %bb.256:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [x25, #1256]
	cbnz	w8, .LBB18_179
// %bb.257:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #712]
	tbnz	x8, #35, .LBB18_179
// %bb.258:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #712]
	tbnz	x8, #34, .LBB18_179
	b	.LBB18_199
.LBB18_259:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB18_293
// %bb.260:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [x25, #1256]
	cbnz	w8, .LBB18_223
// %bb.261:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #712]
	tbnz	x8, #35, .LBB18_223
// %bb.262:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #712]
	tbz	x8, #34, .LBB18_218
	b	.LBB18_223
.LBB18_263:                             //   in Loop: Header=BB18_10 Depth=2
	sub	x0, x29, #72            // =72
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	sub	x0, x29, #72            // =72
	mov	x1, x20
	mov	w2, #1
	stur	x25, [x29, #-72]
	stp	xzr, xzr, [x8]
	str	wzr, [x8, #16]
	bl	f2fs_get_dnode_of_data
	mov	w20, w0
	cbnz	w0, .LBB18_376
// %bb.264:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x21, x28
	ldur	x28, [x29, #-56]
	cbz	x28, .LBB18_370
// %bb.265:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x28, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x28, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_362
// %bb.266:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_280
// %bb.267:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_270
// %bb.268:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_270
// %bb.269:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_270:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_272
// %bb.271:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_707
.LBB18_272:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_273:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_275
// %bb.274:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_708
.LBB18_275:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_276:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_278
// %bb.277:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_709
.LBB18_278:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_279:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_280:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_368
	b	.LBB18_759
.LBB18_281:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [x25, #700]
	ldr	x9, [x25, #40]
	add	w8, w8, #1              // =1
	str	w8, [x25, #700]
	ldr	x8, [x9, #1104]
	ldr	x9, [sp, #88]           // 8-byte Folded Reload
	add	x8, x8, x9, lsl #3
	ldr	x9, [x8, #1888]
	add	x9, x9, #1              // =1
	str	x9, [x8, #1888]
	ldr	x8, [x25, #40]
	ldr	x0, [x8, #1104]
	ldrb	w8, [x0, #1992]
	cbz	w8, .LBB18_295
// %bb.282:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x0, #1968]
	movk	x9, #15099, lsl #16
	ldr	x21, [sp, #24]          // 8-byte Folded Reload
	movk	x9, #52848, lsl #32
	mov	w24, #-11
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB18_640
// %bb.283:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_block
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.move_data_block
	mov	w3, #2469
	bl	f2fs_printk
	mov	w24, #-11
	b	.LBB18_640
.LBB18_284:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w24, #-12
	b	.LBB18_177
.LBB18_285:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #40]
	ldr	x0, [x8, #1104]
	ldrb	w8, [x0, #1992]
	cbz	w8, .LBB18_287
// %bb.286:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x0, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.ls	.LBB18_694
.LBB18_287:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	mov	w1, #1
	bl	f2fs_pin_file_control
	mov	w24, #-11
	b	.LBB18_639
.LBB18_288:                             //   in Loop: Header=BB18_10 Depth=2
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB18_176
// %bb.289:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #712]
	tbz	w8, #31, .LBB18_176
	b	.LBB18_183
.LBB18_290:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [x8, #280]
	mov	w9, #8
	cmp	w8, w10
	mov	w8, #2
	csel	w10, w8, w9, lo
	b	.LBB18_190
.LBB18_291:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w24, #-2
	b	.LBB18_639
.LBB18_292:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w20, #-12
	b	.LBB18_376
.LBB18_293:                             //   in Loop: Header=BB18_10 Depth=2
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB18_218
// %bb.294:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #712]
	tbz	w8, #31, .LBB18_218
	b	.LBB18_223
.LBB18_295:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w24, #-11
	b	.LBB18_639
.LBB18_296:                             //   in Loop: Header=BB18_10 Depth=2
	cbz	x28, .LBB18_299
// %bb.297:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x28, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_299
// %bb.298:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
.LBB18_299:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x23, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x23, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_348
// %bb.300:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_314
// %bb.301:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_304
// %bb.302:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_304
// %bb.303:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_304:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_306
// %bb.305:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB18_704
.LBB18_306:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x23, #24]
.LBB18_307:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_309
// %bb.308:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB18_705
.LBB18_309:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x23, #24]
.LBB18_310:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_312
// %bb.311:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB18_706
.LBB18_312:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x23, #24]
.LBB18_313:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_314:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_354
	b	.LBB18_760
.LBB18_315:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	w8, [x29, #-36]
	cbz	w8, .LBB18_695
// %bb.316:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [sp, #24]           // 8-byte Folded Reload
	mov	w1, wzr
	mov	w2, #1
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
	ldur	w1, [x29, #-36]
	mov	x0, x25
	bl	f2fs_wait_on_block_writeback
	ldr	x0, [sp, #200]
	add	x2, sp, #184            // =184
	ldur	w1, [x29, #-48]
	mov	w3, wzr
	bl	get_node_info_ex
	mov	w24, w0
	cbnz	w0, .LBB18_609
// %bb.317:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	ldur	w8, [x29, #-36]
	str	x9, [sp, #240]
	ldr	w9, [sp, #16]           // 4-byte Folded Reload
	stp	w8, w8, [sp, #228]
	cmp	w9, #1                  // =1
	b.ne	.LBB18_319
// %bb.318:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [sp, #200]
	add	x0, x8, #168            // =168
	bl	down_write
	ldr	w8, [sp, #232]
.LBB18_319:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [sp, #200]
	mov	w1, w8
	mov	w2, #7
	ldr	x9, [x9, #248]
	ldr	x0, [x9, #48]
	ldr	w3, [x0, #140]
	bl	pagecache_get_page
	cbz	x0, .LBB18_415
// %bb.320:                             //   in Loop: Header=BB18_10 Depth=2
	str	x0, [sp, #248]
	mov	x21, x0
	ldr	x8, [x0, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x0, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB18_421
// %bb.321:                             //   in Loop: Header=BB18_10 Depth=2
	add	x0, sp, #200            // =200
	bl	f2fs_submit_page_bio
	cbz	w0, .LBB18_437
// %bb.322:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #40]
	mov	w24, w0
	ldr	x0, [x8, #1104]
	ldrb	w8, [x0, #1992]
	cbz	w8, .LBB18_324
// %bb.323:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x0, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.ls	.LBB18_713
.LBB18_324:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x21, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x21, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_463
// %bb.325:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_339
// %bb.326:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_329
// %bb.327:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_329
// %bb.328:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_329:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_331
// %bb.330:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_719
.LBB18_331:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_332:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_334
// %bb.333:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_720
.LBB18_334:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_335:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_337
// %bb.336:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_721
.LBB18_337:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_338:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_339:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_469
	b	.LBB18_761
.LBB18_340:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_345
// %bb.341:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_344
// %bb.342:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_344
// %bb.343:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x8, :lo12:f2fs_dclient]
	mov	w21, w20
	mov	x20, x8
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	mov	w20, w21
	bl	dsm_client_notify
.LBB18_344:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_345:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_762
.LBB18_346:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	unlock_page
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x28, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_376
// %bb.347:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
	b	.LBB18_376
.LBB18_348:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_353
// %bb.349:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_352
// %bb.350:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_352
// %bb.351:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_352:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_353:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_763
.LBB18_354:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x23
	bl	unlock_page
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x23, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_356
// %bb.355:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
.LBB18_356:                             //   in Loop: Header=BB18_10 Depth=2
	ldrb	w8, [x21, #2600]
	cbz	w8, .LBB18_359
// %bb.357:                             //   in Loop: Header=BB18_10 Depth=2
	add	x20, x21, #2240         // =2240
	mov	x0, x20
	bl	_raw_spin_lock
	ldr	x8, [x21, #2376]
	mov	x0, x20
	add	x8, x8, #1, lsl #12     // =4096
	str	x8, [x21, #2376]
	bl	_raw_spin_unlock
	mov	x0, x21
	bl	f2fs_record_iostat
	ldrb	w8, [x21, #2600]
	cbz	w8, .LBB18_359
// %bb.358:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x20
	bl	_raw_spin_lock
	ldr	x8, [x21, #2384]
	mov	x0, x20
	add	x8, x8, #1, lsl #12     // =4096
	str	x8, [x21, #2384]
	bl	_raw_spin_unlock
	mov	x0, x21
	bl	f2fs_record_iostat
	mov	w20, wzr
	b	.LBB18_400
.LBB18_359:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w20, wzr
	b	.LBB18_400
.LBB18_360:                             //   in Loop: Header=BB18_10 Depth=2
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB18_199
// %bb.361:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #712]
	tbz	w8, #31, .LBB18_199
	b	.LBB18_179
.LBB18_362:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_367
// %bb.363:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_366
// %bb.364:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_366
// %bb.365:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_366:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_367:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_764
.LBB18_368:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	unlock_page
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x28, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_370
// %bb.369:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
.LBB18_370:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	x8, [x29, #-64]
	mov	x28, x21
	cbz	x8, .LBB18_374
// %bb.371:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	x9, [x29, #-56]
	cmp	x9, x8
	b.eq	.LBB18_374
// %bb.372:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x8, #8]
	sub	x10, x9, #1             // =1
	tst	x9, #0x1
	csel	x0, x8, x10, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_374
// %bb.373:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
.LBB18_374:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	w1, [x29, #-36]
	add	w8, w1, #3              // =3
	cmp	w8, #4                  // =4
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	stp	xzr, xzr, [x8]
	b.hs	.LBB18_405
.LBB18_375:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w20, #-2
.LBB18_376:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x23, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x23, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_392
// %bb.377:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_391
// %bb.378:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_381
// %bb.379:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_381
// %bb.380:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x8, :lo12:f2fs_dclient]
	mov	w21, w20
	mov	x20, x8
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	mov	w20, w21
	bl	dsm_client_notify
.LBB18_381:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_383
// %bb.382:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB18_698
.LBB18_383:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x23, #24]
.LBB18_384:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_386
// %bb.385:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB18_699
.LBB18_386:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x23, #24]
.LBB18_387:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_389
// %bb.388:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB18_700
.LBB18_389:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x23, #24]
.LBB18_390:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_391:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_398
	b	.LBB18_765
.LBB18_392:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_397
// %bb.393:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_396
// %bb.394:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_396
// %bb.395:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x8, :lo12:f2fs_dclient]
	mov	w21, w20
	mov	x20, x8
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	mov	w20, w21
	bl	dsm_client_notify
.LBB18_396:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_397:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_766
.LBB18_398:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x23
	bl	unlock_page
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x23, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_400
// %bb.399:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
.LBB18_400:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x24
	bl	up_write
	cbz	w20, .LBB18_404
// %bb.401:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	iput
	ldrb	w8, [x19, #1992]
	cbz	w8, .LBB18_9
// %bb.402:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x19, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB18_9
// %bb.403:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.gc_data_segment
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.gc_data_segment
	mov	w3, #2957
	bl	f2fs_printk
	b	.LBB18_9
.LBB18_404:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [sp, #48]           // 8-byte Folded Reload
	mov	x1, x25
	bl	add_gc_inode
	b	.LBB18_9
.LBB18_405:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w9, [x28, #3024]
	cbz	w9, .LBB18_413
// %bb.406:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB18_412
// %bb.407:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x11, [x28, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB18_409
.LBB18_408:                             //   in Loop: Header=BB18_409 Depth=3
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB18_412
.LBB18_409:                             //   Parent Loop BB18_5 Depth=1
                                        //     Parent Loop BB18_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w12, [x11, #-4]
	cmp	w12, w1
	b.hi	.LBB18_408
// %bb.410:                             //   in Loop: Header=BB18_409 Depth=3
	ldr	w12, [x11]
	cmp	w12, w1
	b.lo	.LBB18_408
// %bb.411:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	x8, [x11, #-80]
.LBB18_412:                             //   in Loop: Header=BB18_10 Depth=2
	cbz	x8, .LBB18_375
.LBB18_413:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	mov	w2, #7
	bl	f2fs_is_valid_blkaddr
	tbnz	w0, #0, .LBB18_226
.LBB18_414:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w20, #-117
	b	.LBB18_376
.LBB18_415:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x25, #40]
	ldr	x0, [x8, #1104]
	ldrb	w8, [x0, #1992]
	cbz	w8, .LBB18_436
// %bb.416:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x0, #1968]
	movk	x9, #15099, lsl #16
	mov	w24, #-12
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.hi	.LBB18_607
// %bb.417:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_block
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.move_data_block
	mov	w3, #2524
	bl	f2fs_printk
	mov	w24, #-12
	b	.LBB18_607
.LBB18_418:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB18_51
.LBB18_419:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB18_54
.LBB18_420:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB18_57
.LBB18_421:                             //   in Loop: Header=BB18_10 Depth=2
	//APP
	dmb ishld
	//NO_APP
.LBB18_422:                             //   in Loop: Header=BB18_10 Depth=2
	ldp	w8, w9, [x29, #-48]
	add	x3, sp, #180            // =180
	sub	x4, x29, #24            // =24
	ldrb	w10, [sp, #196]
	mov	x1, xzr
	ldr	x0, [sp, #200]
	mov	x6, xzr
	ldr	w2, [sp, #232]
	mov	w7, wzr
	ldr	w5, [sp, #20]           // 4-byte Folded Reload
	stur	w8, [x29, #-24]
	sturh	w9, [x29, #-19]
	sturb	w10, [x29, #-20]
	str	wzr, [sp]
	bl	f2fs_allocate_data_block
	ldr	w9, [sp, #232]
	mov	w8, #-1
	ldr	x0, [sp, #200]
                                        // kill: def $w8 killed $w8 killed $x8
	add	w10, w9, #3             // =3
	cmp	w10, #4                 // =4
	b.lo	.LBB18_475
// %bb.423:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w10, [x0, #3024]
	cbz	w10, .LBB18_431
// %bb.424:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	cmp	w10, #1                 // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB18_430
// %bb.425:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x12, [x0, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB18_427
.LBB18_426:                             //   in Loop: Header=BB18_427 Depth=3
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB18_430
.LBB18_427:                             //   Parent Loop BB18_5 Depth=1
                                        //     Parent Loop BB18_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w13, [x12, #-4]
	cmp	w13, w9
	b.hi	.LBB18_426
// %bb.428:                             //   in Loop: Header=BB18_427 Depth=3
	ldr	w13, [x12]
	cmp	w13, w9
	b.lo	.LBB18_426
// %bb.429:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	x8, [x12, #-80]
.LBB18_430:                             //   in Loop: Header=BB18_10 Depth=2
	cbz	x8, .LBB18_474
.LBB18_431:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0, #136]
	cbz	x8, .LBB18_472
// %bb.432:                             //   in Loop: Header=BB18_10 Depth=2
	add	x10, x8, #80            // =80
	b	.LBB18_473
.LBB18_433:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB18_90
.LBB18_434:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB18_93
.LBB18_435:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB18_96
.LBB18_436:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w24, #-12
	b	.LBB18_607
.LBB18_437:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x20, [sp, #200]
	ldrb	w8, [x20, #2600]
	cbz	w8, .LBB18_440
// %bb.438:                             //   in Loop: Header=BB18_10 Depth=2
	add	x24, x20, #2240         // =2240
	mov	x0, x24
	bl	_raw_spin_lock
	ldr	x8, [x20, #2376]
	mov	x0, x24
	add	x8, x8, #1, lsl #12     // =4096
	str	x8, [x20, #2376]
	bl	_raw_spin_unlock
	mov	x0, x20
	bl	f2fs_record_iostat
	ldr	x20, [sp, #200]
	ldrb	w8, [x20, #2600]
	cbz	w8, .LBB18_440
// %bb.439:                             //   in Loop: Header=BB18_10 Depth=2
	add	x24, x20, #2240         // =2240
	mov	x0, x24
	bl	_raw_spin_lock
	ldr	x8, [x20, #2384]
	mov	x0, x24
	add	x8, x8, #1, lsl #12     // =4096
	str	x8, [x20, #2384]
	bl	_raw_spin_unlock
	mov	x0, x20
	bl	f2fs_record_iostat
.LBB18_440:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x9, [x8]
	stur	x9, [x29, #-24]
	ldur	x9, [x29, #-24]
	tbnz	w9, #0, .LBB18_442
// %bb.441:                             //   in Loop: Header=BB18_10 Depth=2
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x8]
1:	ldaxr	x9, [x8]
	orr	x10, x9, 1
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	
	//NO_APP
	tbz	w9, #0, .LBB18_443
.LBB18_442:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__lock_page
.LBB18_443:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [sp, #200]
	ldr	x9, [x8, #248]
	ldr	x8, [x21, #24]
	ldr	x9, [x9, #48]
	cmp	x8, x9
	b.ne	.LBB18_445
// %bb.444:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x21, #8]
	sub	x10, x9, #1             // =1
	tst	x9, #0x1
	csel	x9, x21, x10, eq
	ldr	x9, [x9]
	tbnz	w9, #2, .LBB18_471
.LBB18_445:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x23, #40]
	ldr	x0, [x9, #1104]
	ldrb	w9, [x0, #1992]
	cbz	w9, .LBB18_447
// %bb.446:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x10, #32401
	ldr	x9, [x0, #1968]
	movk	x10, #15099, lsl #16
	movk	x10, #52848, lsl #32
	movk	x10, #53896, lsl #48
	mul	x9, x9, x10
	mov	x10, #4299
	movk	x10, #47815, lsl #16
	movk	x10, #36280, lsl #32
	movk	x10, #6, lsl #48
	ror	x9, x9, #4
	cmp	x9, x10
	b.ls	.LBB18_715
.LBB18_447:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x21, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x21, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_559
// %bb.448:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_462
// %bb.449:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_452
// %bb.450:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_452
// %bb.451:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_452:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_454
// %bb.453:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_729
.LBB18_454:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_455:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_457
// %bb.456:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_730
.LBB18_457:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_458:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_460
// %bb.459:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_731
.LBB18_460:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_461:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_462:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_565
	b	.LBB18_767
.LBB18_463:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_468
// %bb.464:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_467
// %bb.465:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_467
// %bb.466:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_467:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_468:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_768
.LBB18_469:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	unlock_page
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x21, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_606
// %bb.470:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
	b	.LBB18_606
.LBB18_471:                             //   in Loop: Header=BB18_10 Depth=2
	//APP
	dmb ishld
	//NO_APP
	b	.LBB18_422
.LBB18_472:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x10, [x0, #16]
	add	x10, x10, #72           // =72
.LBB18_473:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x8, #8]
	ldr	w10, [x10]
	ldr	w11, [x0, #1184]
	ldr	w8, [x8]
	sub	w9, w9, w10
	lsr	w9, w9, w11
	sub	w8, w9, w8
	b	.LBB18_475
.LBB18_474:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w8, #-1
                                        // kill: def $w8 killed $w8 killed $x8
.LBB18_475:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w1, [sp, #180]
	mov	w9, #-1
                                        // kill: def $w9 killed $w9 killed $x9
	add	w10, w1, #3             // =3
	cmp	w10, #4                 // =4
	b.lo	.LBB18_489
// %bb.476:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w10, [x0, #3024]
	cbz	w10, .LBB18_484
// %bb.477:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x0]
	cmp	w10, #1                 // =1
	ldr	x9, [x9, #248]
	b.lt	.LBB18_483
// %bb.478:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x12, [x0, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB18_480
.LBB18_479:                             //   in Loop: Header=BB18_480 Depth=3
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB18_483
.LBB18_480:                             //   Parent Loop BB18_5 Depth=1
                                        //     Parent Loop BB18_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w13, [x12, #-4]
	cmp	w13, w1
	b.hi	.LBB18_479
// %bb.481:                             //   in Loop: Header=BB18_480 Depth=3
	ldr	w13, [x12]
	cmp	w13, w1
	b.lo	.LBB18_479
// %bb.482:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	x9, [x12, #-80]
.LBB18_483:                             //   in Loop: Header=BB18_10 Depth=2
	cbz	x9, .LBB18_488
.LBB18_484:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x0, #136]
	cbz	x9, .LBB18_486
// %bb.485:                             //   in Loop: Header=BB18_10 Depth=2
	add	x10, x9, #80            // =80
	b	.LBB18_487
.LBB18_486:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x10, [x0, #16]
	add	x10, x10, #72           // =72
.LBB18_487:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x9, #8]
	ldr	w10, [x10]
	ldr	w11, [x0, #1184]
	ldr	w9, [x9]
	sub	w10, w1, w10
	lsr	w10, w10, w11
	sub	w9, w10, w9
	b	.LBB18_489
.LBB18_488:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w9, #-1
                                        // kill: def $w9 killed $w9 killed $x9
.LBB18_489:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w10, [x0, #3024]
	cmp	w10, #2                 // =2
	b.ne	.LBB18_499
// %bb.490:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x10, [x0, #16]
	ldrb	w10, [x10, #2182]
	tbz	w10, #0, .LBB18_499
// %bb.491:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x10, [x0, #3032]
	ldr	w11, [x10, #84]
	cmp	w11, w8
	b.hi	.LBB18_495
// %bb.492:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w12, [x10, #88]
	cmp	w12, w8
	b.lo	.LBB18_495
// %bb.493:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w12, [x10, #276]
	cmp	w12, w9
	b.hi	.LBB18_495
// %bb.494:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w12, [x10, #280]
	cmp	w12, w9
	b.hs	.LBB18_664
.LBB18_495:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w12, [x10, #276]
	cmp	w12, w8
	b.hi	.LBB18_499
// %bb.496:                             //   in Loop: Header=BB18_10 Depth=2
	cmp	w11, w9
	b.hi	.LBB18_499
// %bb.497:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w11, [x10, #280]
	cmp	w11, w8
	b.lo	.LBB18_499
// %bb.498:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [x10, #88]
	cmp	w8, w9
	b.hs	.LBB18_664
.LBB18_499:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0, #248]
	mov	w3, #64
	mov	w2, #6
	movk	w3, #96, lsl #16
	ldr	x0, [x8, #48]
	bl	pagecache_get_page
	str	x0, [sp, #248]
	cbz	x0, .LBB18_516
// %bb.500:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w1, wzr
	mov	w2, #1
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
	ldr	x8, [sp, #248]
	mov	w2, #4096
	lsl	x8, x8, #6
	orr	x0, x8, #0xffffffc000000000
	lsl	x8, x21, #6
	orr	x1, x8, #0xffffffc000000000
	bl	memcpy
	ldr	x8, [x21, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x21, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x21, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_534
// %bb.501:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_515
// %bb.502:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_505
// %bb.503:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_505
// %bb.504:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_505:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_507
// %bb.506:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_716
.LBB18_507:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_508:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_510
// %bb.509:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_717
.LBB18_510:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_511:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_513
// %bb.512:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_718
.LBB18_513:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_514:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_515:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_540
	b	.LBB18_769
.LBB18_516:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #40]
	ldr	x0, [x8, #1104]
	ldrb	w8, [x0, #1992]
	cbz	w8, .LBB18_518
// %bb.517:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x0, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.ls	.LBB18_714
.LBB18_518:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x21, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x21, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_551
// %bb.519:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_533
// %bb.520:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_523
// %bb.521:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_523
// %bb.522:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_523:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_525
// %bb.524:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_725
.LBB18_525:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_526:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_528
// %bb.527:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_726
.LBB18_528:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_529:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_531
// %bb.530:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_727
.LBB18_531:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_532:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_533:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_557
	b	.LBB18_770
.LBB18_534:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_539
// %bb.535:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_538
// %bb.536:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_538
// %bb.537:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_538:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_539:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_771
.LBB18_540:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	unlock_page
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x21, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_542
// %bb.541:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
.LBB18_542:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [sp, #200]
	ldr	w1, [sp, #232]
	ldr	x8, [x8, #248]
	mov	x2, x1
	ldr	x0, [x8, #48]
	bl	invalidate_mapping_pages
	ldr	x0, [sp, #200]
	ldr	w1, [sp, #232]
	bl	f2fs_invalidate_compress_page
	ldr	x0, [sp, #248]
	bl	set_page_dirty
	ldr	x0, [sp, #248]
	bl	clear_page_dirty_for_io
	cbz	w0, .LBB18_544
// %bb.543:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [sp, #200]
	add	x8, x8, #1288           // =1288
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB18_544:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [sp, #248]
	mov	w1, wzr
	bl	__test_set_page_writeback
	ldr	x10, [sp, #24]          // 8-byte Folded Reload
	ldr	x8, [x10, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x10, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 256
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [sp, #200]
	ldr	w9, [x8, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB18_571
// %bb.545:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x8, #16]
	ldrb	w9, [x9, #2182]
	tbz	w9, #0, .LBB18_571
// %bb.546:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [x8, #3308]
	cmp	w8, #1                  // =1
	b.eq	.LBB18_568
// %bb.547:                             //   in Loop: Header=BB18_10 Depth=2
	cbnz	w8, .LBB18_571
// %bb.548:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [sp, #248]
	ldr	x9, [x8]
	tbnz	w9, #13, .LBB18_550
// %bb.549:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x8, #8]
	sub	x10, x9, #1             // =1
	tst	x9, #0x1
	csel	x9, x8, x10, eq
	add	x9, x9, #52             // =52
	//APP
	// atomic_add
	prfm	pstl1strm, [x9]
1:	ldxr	w10, [x9]
	add	w10, w10, 1
	stxr	w11, w10, [x9]
	cbnz	w11, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 8192
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	str	xzr, [x8, #40]
.LBB18_550:                             //   in Loop: Header=BB18_10 Depth=2
	add	x8, x8, #40             // =40
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 64
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB18_571
.LBB18_551:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_556
// %bb.552:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_555
// %bb.553:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_555
// %bb.554:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_555:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_556:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_772
.LBB18_557:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	unlock_page
	ldr	x8, [x21, #8]
	mov	w24, #-12
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x21, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_605
// %bb.558:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
	mov	w24, #-12
	b	.LBB18_605
.LBB18_559:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_564
// %bb.560:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_563
// %bb.561:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_563
// %bb.562:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_563:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_564:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_773
.LBB18_565:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	unlock_page
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x21, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbz	w9, .LBB18_567
// %bb.566:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w24, #-5
	b	.LBB18_606
.LBB18_567:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
	mov	w24, #-5
	b	.LBB18_606
.LBB18_568:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [sp, #248]
	ldr	x9, [x8]
	tbnz	w9, #13, .LBB18_570
// %bb.569:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x8, #8]
	sub	x10, x9, #1             // =1
	tst	x9, #0x1
	csel	x9, x8, x10, eq
	add	x9, x9, #52             // =52
	//APP
	// atomic_add
	prfm	pstl1strm, [x9]
1:	ldxr	w10, [x9]
	add	w10, w10, 1
	stxr	w11, w10, [x9]
	cbnz	w11, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 8192
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	str	xzr, [x8, #40]
.LBB18_570:                             //   in Loop: Header=BB18_10 Depth=2
	add	x8, x8, #40             // =40
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 128
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB18_571:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [sp, #180]
	mov	x9, #1
	movk	x9, #2048, lsl #32
	add	x0, sp, #200            // =200
	stur	x9, [sp, #220]
	str	w8, [sp, #228]
	bl	f2fs_submit_page_write
	ldrb	w8, [sp, #290]
	cbz	w8, .LBB18_574
// %bb.572:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [sp, #248]
	mov	w24, #-11
	ldr	x8, [x0, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x0, x9, eq
	ldr	x8, [x8]
	sxth	w8, w8
	tbz	w8, #31, .LBB18_579
// %bb.573:                             //   in Loop: Header=BB18_10 Depth=2
	bl	end_page_writeback
	mov	w24, #-11
	b	.LBB18_579
.LBB18_574:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x20, [sp, #200]
	ldrb	w8, [x20, #2600]
	cbz	w8, .LBB18_576
// %bb.575:                             //   in Loop: Header=BB18_10 Depth=2
	add	x24, x20, #2240         // =2240
	mov	x0, x24
	bl	_raw_spin_lock
	ldr	x8, [x20, #2304]
	mov	x0, x24
	add	x8, x8, #1, lsl #12     // =4096
	str	x8, [x20, #2304]
	bl	_raw_spin_unlock
	mov	x0, x20
	bl	f2fs_record_iostat
.LBB18_576:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w1, [sp, #180]
	sub	x0, x29, #72            // =72
	bl	f2fs_update_data_blkaddr
	add	x8, x23, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4096
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	ldr	x9, [x9, #32]
	cbz	x9, .LBB18_578
// %bb.577:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w24, wzr
	b	.LBB18_579
.LBB18_578:                             //   in Loop: Header=BB18_10 Depth=2
	mov	w24, wzr
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 262144
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB18_579:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x28, [sp, #248]
	cbz	x28, .LBB18_604
// %bb.580:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x28, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x28, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_596
// %bb.581:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_595
// %bb.582:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_585
// %bb.583:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_585
// %bb.584:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_585:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_587
// %bb.586:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_722
.LBB18_587:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_588:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_590
// %bb.589:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_723
.LBB18_590:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_591:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_593
// %bb.592:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_724
.LBB18_593:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_594:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_595:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_602
	b	.LBB18_774
.LBB18_596:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_601
// %bb.597:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_600
// %bb.598:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_600
// %bb.599:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_600:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_601:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_775
.LBB18_602:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	unlock_page
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x28, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_604
// %bb.603:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
.LBB18_604:                             //   in Loop: Header=BB18_10 Depth=2
	cbz	w24, .LBB18_606
.LBB18_605:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [sp, #200]
	sub	x1, x29, #24            // =24
	ldr	w2, [sp, #180]
	mov	w4, #1
	ldr	w3, [sp, #232]
	mov	w5, #1
	mov	w6, #1
	bl	f2fs_do_replace_block
.LBB18_606:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w27, [sp, #132]         // 4-byte Folded Reload
	mov	x25, x23
	ldr	x22, [sp, #152]         // 8-byte Folded Reload
.LBB18_607:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w8, [sp, #16]           // 4-byte Folded Reload
	cmp	w8, #1                  // =1
	b.ne	.LBB18_609
// %bb.608:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [sp, #200]
	add	x0, x8, #168            // =168
	bl	up_write
.LBB18_609:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	x28, [x29, #-56]
	cbz	x28, .LBB18_634
.LBB18_610:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x28, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x28, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_626
// %bb.611:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_625
// %bb.612:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_615
// %bb.613:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_615
// %bb.614:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_615:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_617
// %bb.616:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_710
.LBB18_617:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_618:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_620
// %bb.619:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_711
.LBB18_620:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_621:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_623
// %bb.622:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB18_712
.LBB18_623:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x28, #24]
.LBB18_624:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	ldr	w27, [sp, #132]         // 4-byte Folded Reload
	mov	x25, x23
	ldr	x22, [sp, #152]         // 8-byte Folded Reload
.LBB18_625:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_632
	b	.LBB18_776
.LBB18_626:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_631
// %bb.627:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_630
// %bb.628:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_630
// %bb.629:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_630:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_631:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_777
.LBB18_632:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	unlock_page
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x28, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_634
// %bb.633:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
.LBB18_634:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	x8, [x29, #-64]
	cbz	x8, .LBB18_638
// %bb.635:                             //   in Loop: Header=BB18_10 Depth=2
	ldur	x9, [x29, #-56]
	cmp	x9, x8
	b.eq	.LBB18_638
// %bb.636:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x9, [x8, #8]
	sub	x10, x9, #1             // =1
	tst	x9, #0x1
	csel	x0, x8, x10, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_638
// %bb.637:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
.LBB18_638:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	stp	xzr, xzr, [x8]
.LBB18_639:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x21, [sp, #24]          // 8-byte Folded Reload
.LBB18_640:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x21, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x21, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_656
// %bb.641:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_655
// %bb.642:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_645
// %bb.643:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_645
// %bb.644:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_645:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_647
// %bb.646:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_691
.LBB18_647:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_648:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_650
// %bb.649:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_692
.LBB18_650:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_651:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_653
// %bb.652:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_693
.LBB18_653:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_654:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_655:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_662
	b	.LBB18_778
.LBB18_656:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_661
// %bb.657:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_660
// %bb.658:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_660
// %bb.659:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_660:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_661:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_779
.LBB18_662:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	unlock_page
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x21, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_177
// %bb.663:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
	b	.LBB18_177
.LBB18_664:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x23, #40]
	ldr	x8, [x8, #1104]
	ldrb	w9, [x8, #1992]
	cbz	w9, .LBB18_666
// %bb.665:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x10, #32401
	ldr	x9, [x8, #1968]
	movk	x10, #15099, lsl #16
	movk	x10, #52848, lsl #32
	movk	x10, #53896, lsl #48
	mul	x9, x9, x10
	mov	x10, #4299
	movk	x10, #47815, lsl #16
	movk	x10, #36280, lsl #32
	movk	x10, #6, lsl #48
	ror	x9, x9, #4
	cmp	x9, x10
	b.ls	.LBB18_728
.LBB18_666:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x3, [x23, #64]
	adrp	x1, .L.str.25
	adrp	x2, .L__func__.move_data_block
	add	x1, x1, :lo12:.L.str.25
	add	x2, x2, :lo12:.L__func__.move_data_block
	bl	f2fs_printk
	ldr	x8, [x21, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x21, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x21, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB18_682
// %bb.667:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_681
// %bb.668:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_671
// %bb.669:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_671
// %bb.670:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_671:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_673
// %bb.672:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_732
.LBB18_673:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_674:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_676
// %bb.675:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_733
.LBB18_676:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_677:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB18_679
// %bb.678:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB18_734
.LBB18_679:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x0, [x21, #24]
.LBB18_680:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB18_681:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB18_688
	b	.LBB18_780
.LBB18_682:                             //   in Loop: Header=BB18_10 Depth=2
	tbnz	w8, #0, .LBB18_687
// %bb.683:                             //   in Loop: Header=BB18_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_686
// %bb.684:                             //   in Loop: Header=BB18_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_686
// %bb.685:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_686:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB18_687:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB18_781
.LBB18_688:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	unlock_page
	ldr	x8, [x21, #8]
	mov	w24, #-28
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x21, x9, eq
	add	x8, x0, #52             // =52
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB18_605
// %bb.689:                             //   in Loop: Header=BB18_10 Depth=2
	bl	__put_page
	mov	w24, #-28
	b	.LBB18_605
.LBB18_690:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_block
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.move_data_block
	mov	w3, #2462
	bl	f2fs_printk
	mov	w24, #-2
	b	.LBB18_640
.LBB18_691:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_648
.LBB18_692:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_651
.LBB18_693:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_654
.LBB18_694:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_block
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.move_data_block
	mov	w3, #2475
	bl	f2fs_printk
	b	.LBB18_287
.LBB18_695:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	x10, [sp, #24]          // 8-byte Folded Reload
	ldr	x8, [x10, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x10, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x25, #40]
	ldr	x0, [x8, #1104]
	ldrb	w8, [x0, #1992]
	cbz	w8, .LBB18_697
// %bb.696:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x9, #32401
	ldr	x8, [x0, #1968]
	movk	x9, #15099, lsl #16
	movk	x9, #52848, lsl #32
	movk	x9, #53896, lsl #48
	mul	x8, x8, x9
	mov	x9, #4299
	movk	x9, #47815, lsl #16
	movk	x9, #36280, lsl #32
	movk	x9, #6, lsl #48
	ror	x8, x8, #4
	cmp	x8, x9
	b.ls	.LBB18_735
.LBB18_697:                             //   in Loop: Header=BB18_10 Depth=2
	ldr	w27, [sp, #132]         // 4-byte Folded Reload
	mov	w24, #-2
	ldr	x22, [sp, #152]         // 8-byte Folded Reload
	mov	x25, x23
	ldur	x28, [x29, #-56]
	cbnz	x28, .LBB18_610
	b	.LBB18_634
.LBB18_698:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB18_384
.LBB18_699:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB18_387
.LBB18_700:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB18_390
.LBB18_701:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_237
.LBB18_702:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_240
.LBB18_703:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_243
.LBB18_704:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB18_307
.LBB18_705:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB18_310
.LBB18_706:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB18_313
.LBB18_707:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_273
.LBB18_708:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_276
.LBB18_709:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_279
.LBB18_710:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_618
.LBB18_711:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_621
.LBB18_712:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_624
.LBB18_713:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_block
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.move_data_block
	mov	w3, #2534
	bl	f2fs_printk
	b	.LBB18_324
.LBB18_714:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_block
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.move_data_block
	mov	w3, #2577
	bl	f2fs_printk
	b	.LBB18_518
.LBB18_715:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_block
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.move_data_block
	mov	w3, #2548
	bl	f2fs_printk
	ldr	x8, [x21, #24]
	b	.LBB18_447
.LBB18_716:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_508
.LBB18_717:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_511
.LBB18_718:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_514
.LBB18_719:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_332
.LBB18_720:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_335
.LBB18_721:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_338
.LBB18_722:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_588
.LBB18_723:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_591
.LBB18_724:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB18_594
.LBB18_725:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_526
.LBB18_726:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_529
.LBB18_727:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_532
.LBB18_728:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_block
	mov	x0, x8
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.move_data_block
	mov	w3, #2565
	bl	f2fs_printk
	ldr	x0, [sp, #200]
	b	.LBB18_666
.LBB18_729:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_455
.LBB18_730:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_458
.LBB18_731:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_461
.LBB18_732:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_674
.LBB18_733:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_677
.LBB18_734:                             //   in Loop: Header=BB18_10 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB18_680
.LBB18_735:                             //   in Loop: Header=BB18_10 Depth=2
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.move_data_block
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.move_data_block
	mov	w3, #2490
	bl	f2fs_printk
	b	.LBB18_697
.LBB18_736:
	add	x20, x19, #2192         // =2192
	mov	x0, x20
	bl	mutex_lock
	ldr	w8, [x19, #3024]
	ldr	w10, [sp, #104]         // 4-byte Folded Reload
	cmp	w8, #2                  // =2
	b.ne	.LBB18_744
// %bb.737:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB18_744
// %bb.738:
	ldr	w8, [x19, #3308]
	cmp	w8, #1                  // =1
	b.hi	.LBB18_744
// %bb.739:
	ldr	x9, [x19, #2224]
	ldr	x11, [sp, #136]         // 8-byte Folded Reload
	cbz	w11, .LBB18_742
// %bb.740:
	cbz	x9, .LBB18_744
// %bb.741:
	add	x8, x9, x8, lsl #2
	ldr	w9, [x8, #580]
	add	w9, w9, w10
	str	w9, [x8, #580]
	b	.LBB18_744
.LBB18_742:
	cbz	x9, .LBB18_744
// %bb.743:
	add	x8, x9, x8, lsl #2
	ldr	w9, [x8, #620]
	add	w9, w9, w10
	str	w9, [x8, #620]
.LBB18_744:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB18_747
// %bb.745:
	ldr	x9, [sp, #88]           // 8-byte Folded Reload
	add	x8, x8, x9, lsl #2
	ldr	w9, [x8, #120]
	add	w9, w9, w10
	str	w9, [x8, #120]
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB18_747
// %bb.746:
	ldr	x9, [x8, #416]
	add	x9, x9, w10, sxtw
	str	x9, [x8, #416]
.LBB18_747:
	mov	x0, x20
	bl	mutex_unlock
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB18_749
// %bb.748:
	ldr	w0, [sp, #100]          // 4-byte Folded Reload
	add	sp, sp, #416            // =416
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB18_749:
	bl	__stack_chk_fail
.LBB18_750:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_751:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_752:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_753:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_754:
	adrp	x1, .L.str.22
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.22
	mov	w2, w25
	mov	w3, w28
	mov	w4, w20
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_757
// %bb.755:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_757
// %bb.756:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.is_alive
	add	x1, x1, :lo12:.L.str.19
	mov	w3, #2191
	add	x2, x2, :lo12:.L__func__.is_alive
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_757:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 2191; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_758:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_759:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_760:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_761:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_762:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_763:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_764:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_765:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_766:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_767:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_768:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_769:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_770:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_771:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_772:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_773:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_774:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_775:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_776:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_777:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_778:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_779:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_780:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_781:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end18:
	.size	gc_data_segment, .Lfunc_end18-gc_data_segment
                                        // -- End function
	.p2align	3               // -- Begin function __get_gc_migrate_tag
	.type	__get_gc_migrate_tag,@function
__get_gc_migrate_tag:                   // @__get_gc_migrate_tag
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	w8, [x0, #3024]
	mov	x29, sp
	cmp	w8, #2                  // =2
	b.ne	.LBB19_2
// %bb.1:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbnz	w8, #0, .LBB19_4
.LBB19_2:
	str	wzr, [x19, #3312]
.LBB19_3:
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.LBB19_4:
	ldr	x8, [x1, #40]
	mov	x20, x1
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB19_10
// %bb.5:
	ldr	w8, [x20, #1256]
	cbnz	w8, .LBB19_8
// %bb.6:
	ldr	x8, [x20, #712]
	tbnz	x8, #35, .LBB19_8
// %bb.7:
	ldr	x9, [x20, #712]
	add	x8, x19, #3312          // =3312
	tbnz	x9, #34, .LBB19_9
	b	.LBB19_13
.LBB19_8:
	add	x8, x19, #3312          // =3312
.LBB19_9:
	str	wzr, [x8]
	b	.LBB19_3
.LBB19_10:
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB19_12
// %bb.11:
	ldr	x9, [x20, #712]
	add	x8, x19, #3312          // =3312
	tbz	w9, #31, .LBB19_13
	b	.LBB19_9
.LBB19_12:
	add	x8, x19, #3312          // =3312
.LBB19_13:
	str	w2, [x8]
	cbz	w2, .LBB19_3
// %bb.14:
	ldrb	w8, [x20, #13]
	tbz	w8, #6, .LBB19_3
// %bb.15:
	mov	x0, x20
	bl	fscrypt_get_encryption_info
	cbz	w0, .LBB19_19
.LBB19_16:
	ldr	x8, [x19, #1984]
	cbnz	x8, .LBB19_18
// %bb.17:
	ldr	x2, [x20, #64]
	adrp	x1, .L.str.23
	add	x1, x1, :lo12:.L.str.23
	mov	x0, x19
	bl	f2fs_printk
	ldr	x8, [x19, #1984]
.LBB19_18:
	add	x8, x8, #1              // =1
	str	x8, [x19, #1984]
	b	.LBB19_2
.LBB19_19:
	cbz	x20, .LBB19_3
// %bb.20:
	ldr	x8, [x20, #632]
	cbnz	x8, .LBB19_3
	b	.LBB19_16
.Lfunc_end19:
	.size	__get_gc_migrate_tag, .Lfunc_end19-__get_gc_migrate_tag
                                        // -- End function
	.p2align	3               // -- Begin function add_gc_inode
	.type	add_gc_inode,@function
add_gc_inode:                           // @add_gc_inode
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x21, x1
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	add	x20, x0, #16            // =16
	ldr	w1, [x1, #64]
	mov	x19, x0
	mov	x0, x20
	bl	radix_tree_lookup
	cbz	x0, .LBB20_8
// %bb.1:
	ldr	x8, [x0, #16]
	cmp	x8, x21
	b.eq	.LBB20_9
.LBB20_2:
	adrp	x8, f2fs_inode_entry_slab
	mov	w24, #64
	movk	w24, #96, lsl #16
	mov	w1, w24
	ldr	x23, [x8, :lo12:f2fs_inode_entry_slab]
	mov	x0, x23
	bl	kmem_cache_alloc
	mov	x22, x0
	cbnz	x0, .LBB20_4
// %bb.3:
	add	w1, w24, #2048          // =2048
	mov	x0, x23
	bl	kmem_cache_alloc
	mov	x22, x0
.LBB20_4:
	ldr	x23, [x21, #64]
	str	x21, [x22, #16]
.LBB20_5:                               // =>This Inner Loop Header: Depth=1
	mov	x0, x20
	mov	x1, x23
	mov	w2, wzr
	mov	x3, x22
	bl	__radix_tree_insert
	cbnz	w0, .LBB20_5
// %bb.6:
	ldr	x20, [x19, #8]
	mov	x0, x22
	mov	x2, x19
	mov	x1, x20
	bl	__list_add_valid
	tbz	w0, #0, .LBB20_10
// %bb.7:
	str	x22, [x19, #8]
	stp	x19, x20, [x22]
	str	x22, [x20]
	b	.LBB20_10
.LBB20_8:
	mov	x8, xzr
	cmp	x8, x21
	b.ne	.LBB20_2
.LBB20_9:
	mov	x0, x21
	bl	iput
.LBB20_10:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end20:
	.size	add_gc_inode, .Lfunc_end20-add_gc_inode
                                        // -- End function
	.p2align	3               // -- Begin function get_victim_by_default
	.type	get_victim_by_default,@function
get_victim_by_default:                  // @get_victim_by_default
// %bb.0:
	sub	sp, sp, #320            // =320
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #224]    // 16-byte Folded Spill
	add	x29, sp, #224           // =224
	stp	x28, x27, [sp, #240]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #256]    // 16-byte Folded Spill
	mov	w25, w4
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #272]    // 16-byte Folded Spill
	mov	x24, x5
	stp	x22, x21, [sp, #288]    // 16-byte Folded Spill
	mov	w22, w3
	stp	x20, x19, [sp, #304]    // 16-byte Folded Spill
	mov	x19, x0
	str	w2, [sp, #112]          // 4-byte Folded Spill
	str	x1, [sp, #64]           // 8-byte Folded Spill
	stur	x8, [x29, #-16]
	ldr	x8, [x0, #136]
	ldr	x9, [x8, #16]
	ldr	x20, [x8]
	add	x0, x9, #80             // =80
	str	x9, [sp, #16]           // 8-byte Folded Spill
	str	x0, [sp, #32]           // 8-byte Folded Spill
	bl	mutex_lock
	ldr	w9, [x19, #1200]
	sub	w23, w22, #6            // =6
	ldr	w10, [x19, #1192]
	cmp	w23, #3                 // =3
	and	w8, w25, #0xff
	mov	w27, wzr
	mov	w28, wzr
	mov	x25, x20
	stur	x24, [x29, #-48]
	add	x24, x19, #1808         // =1808
	mul	w21, w10, w9
	add	x9, x19, #1824          // =1824
	sxtw	x10, w22
	stur	w8, [x29, #-96]
	ldr	x8, [x19, #1856]
	str	x9, [sp, #96]           // 8-byte Folded Spill
	mov	w9, #11
	csel	w9, w23, w9, lo
	str	x10, [sp, #24]          // 8-byte Folded Spill
	str	w21, [sp, #108]         // 4-byte Folded Spill
	stp	x20, x22, [sp, #48]     // 16-byte Folded Spill
	str	w9, [sp, #40]           // 4-byte Folded Spill
	mov	w9, #505
	lsr	w9, w9, w10
	str	w23, [sp, #84]          // 4-byte Folded Spill
	and	w9, w9, #0x1
	stur	x24, [x29, #-104]       // 8-byte Folded Spill
	str	w9, [sp, #44]           // 4-byte Folded Spill
	//APP
	mrs x9, sp_el0
	//NO_APP
	str	x9, [sp, #8]            // 8-byte Folded Spill
.LBB21_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB21_24 Depth 2
                                        //     Child Loop BB21_63 Depth 2
                                        //     Child Loop BB21_86 Depth 2
                                        //       Child Loop BB21_192 Depth 3
                                        //       Child Loop BB21_147 Depth 3
                                        //       Child Loop BB21_121 Depth 3
                                        //     Child Loop BB21_242 Depth 2
                                        //       Child Loop BB21_254 Depth 3
                                        //       Child Loop BB21_245 Depth 3
                                        //     Child Loop BB21_215 Depth 2
                                        //     Child Loop BB21_231 Depth 2
	ldr	x9, [x19, #136]
	mov	w26, w22
	ldr	w10, [x19, #3024]
	stur	x8, [x29, #-40]
	ldr	x20, [x9, #16]
	cmp	w10, #2                 // =2
	b.ne	.LBB21_10
// %bb.2:                               //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x19, #16]
	mov	w26, w22
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB21_10
// %bb.3:                               //   in Loop: Header=BB21_1 Depth=1
	cmp	w22, #11                // =11
	b.hi	.LBB21_202
// %bb.4:                               //   in Loop: Header=BB21_1 Depth=1
	ldr	w26, [sp, #40]          // 4-byte Folded Reload
	mov	w8, #1
	mov	w10, #2496
	lsl	w8, w8, w22
	tst	w8, w10
	b.eq	.LBB21_202
.LBB21_5:                               //   in Loop: Header=BB21_1 Depth=1
	ldur	w8, [x29, #-96]
	cmp	w8, #1                  // =1
	b.ne	.LBB21_7
// %bb.6:                               //   in Loop: Header=BB21_1 Depth=1
	cmp	w26, #6                 // =6
	b.ge	.LBB21_9
	b	.LBB21_12
.LBB21_7:                               //   in Loop: Header=BB21_1 Depth=1
	cmp	w26, #6                 // =6
	b.lt	.LBB21_10
// %bb.8:                               //   in Loop: Header=BB21_1 Depth=1
	cmp	w8, #3                  // =3
	b.ne	.LBB21_10
.LBB21_9:                               //   in Loop: Header=BB21_1 Depth=1
	adrp	x0, select_policy._rs
	adrp	x1, .L__func__.select_policy
	add	x0, x0, :lo12:select_policy._rs
	add	x1, x1, :lo12:.L__func__.select_policy
	bl	___ratelimit
	cbnz	w0, .LBB21_271
.LBB21_10:                              //   in Loop: Header=BB21_1 Depth=1
	ldur	w8, [x29, #-96]
	cmp	w8, #3                  // =3
	b.eq	.LBB21_13
// %bb.11:                              //   in Loop: Header=BB21_1 Depth=1
	cmp	w8, #1                  // =1
	b.ne	.LBB21_15
.LBB21_12:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w8, #1
	add	x9, x20, w26, sxtw #3
	add	x10, x20, w26, sxtw #2
	mov	w11, #1
	stur	w8, [x29, #-92]
	ldr	x9, [x9, #8]
	stur	x9, [x29, #-88]
	mov	w9, #1
	ldr	w10, [x10, #112]
	stur	w8, [x29, #-72]
	b	.LBB21_14
.LBB21_13:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w11, #1
	add	x8, x20, w26, sxtw #3
	add	x9, x20, w26, sxtw #2
	stur	w11, [x29, #-92]
	ldr	x8, [x8, #8]
	stur	x8, [x29, #-88]
	mov	w8, #3
	ldr	w10, [x9, #112]
	mov	w9, #1
	stur	w11, [x29, #-72]
.LBB21_14:                              //   in Loop: Header=BB21_1 Depth=1
	stur	w10, [x29, #-80]
	ldr	w26, [sp, #112]         // 4-byte Folded Reload
	mov	w20, w27
	b	.LBB21_28
.LBB21_15:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w26, [sp, #112]         // 4-byte Folded Reload
	cbz	w26, .LBB21_17
// %bb.16:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w9, #1
	b	.LBB21_18
.LBB21_17:                              //   in Loop: Header=BB21_1 Depth=1
	ldrb	w9, [x19, #1800]
	lsl	w9, w9, #1
.LBB21_18:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w10, [x19, #1868]
	sub	w10, w10, #1            // =1
	cmp	w10, #4                 // =4
	b.hi	.LBB21_21
// %bb.19:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w11, #27
	lsr	w11, w11, w10
	tbz	w11, #0, .LBB21_21
// %bb.20:                              //   in Loop: Header=BB21_1 Depth=1
	adrp	x9, .Lswitch.table.get_victim_by_default
	add	x9, x9, :lo12:.Lswitch.table.get_victim_by_default
	ldr	w9, [x9, w10, sxtw #2]
.LBB21_21:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w11, [x19, #1192]
	stur	w9, [x29, #-92]
	cmp	w11, #2                 // =2
	stur	w11, [x29, #-72]
	b.lo	.LBB21_26
// %bb.22:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	x12, [x20, #72]
	mov	w10, wzr
	ldr	w13, [x19, #1200]
	stur	x12, [x29, #-88]
	cbz	w13, .LBB21_27
// %bb.23:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w14, wzr
	mov	w20, w27
.LBB21_24:                              //   Parent Loop BB21_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	w15, w14, #63           // =63
	cmp	w14, #0                 // =0
	csel	w15, w15, w14, lt
	add	w16, w14, #1            // =1
	asr	w15, w15, #6
	cmp	w16, w13
	ldr	x15, [x12, w15, sxtw #3]
	lsr	x14, x15, x14
	and	w14, w14, #0x1
	add	w10, w10, w14
	mov	w14, w16
	b.ne	.LBB21_24
// %bb.25:                              //   in Loop: Header=BB21_1 Depth=1
	stur	w10, [x29, #-80]
	b	.LBB21_28
.LBB21_26:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	x10, [x20, #56]
	stur	x10, [x29, #-88]
	ldr	w10, [x20, #136]
.LBB21_27:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w20, w27
	stur	w10, [x29, #-80]
.LBB21_28:                              //   in Loop: Header=BB21_1 Depth=1
	cmp	w26, #1                 // =1
	b.eq	.LBB21_30
// %bb.29:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w12, [x19, #1868]
	cmp	w12, #5                 // =5
	b.ne	.LBB21_42
.LBB21_30:                              //   in Loop: Header=BB21_1 Depth=1
	ldrb	w12, [x19, #1424]
	tbz	w12, #3, .LBB21_34
// %bb.31:                              //   in Loop: Header=BB21_1 Depth=1
	cmp	w22, #8                 // =8
	b.hi	.LBB21_34
// %bb.32:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w12, [sp, #44]          // 4-byte Folded Reload
	cbz	w12, .LBB21_34
// %bb.33:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w12, wzr
	b	.LBB21_35
.LBB21_34:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	x12, [x19, #136]
	ldr	x12, [x12]
	add	x12, x12, w9, sxtw #2
	ldr	w12, [x12, #200]
.LBB21_35:                              //   in Loop: Header=BB21_1 Depth=1
	stur	w12, [x29, #-76]
	mov	w12, #-1
	cmp	w8, #1                  // =1
	stur	xzr, [x29, #-64]
	stur	w12, [x29, #-56]
	b.eq	.LBB21_38
// %bb.36:                              //   in Loop: Header=BB21_1 Depth=1
	cmp	w8, #3                  // =3
	b.ne	.LBB21_39
// %bb.37:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w11, #-1
	stur	w11, [x29, #-68]
	b	.LBB21_50
.LBB21_38:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w11, [x19, #1188]
	b	.LBB21_49
.LBB21_39:                              //   in Loop: Header=BB21_1 Depth=1
	cbz	w9, .LBB21_46
// %bb.40:                              //   in Loop: Header=BB21_1 Depth=1
	cmp	w9, #1                  // =1
	b.ne	.LBB21_48
// %bb.41:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w12, [x19, #1188]
	mul	w11, w11, w12
	lsl	w11, w11, #1
	b	.LBB21_47
.LBB21_42:                              //   in Loop: Header=BB21_1 Depth=1
	cmp	w8, #3                  // =3
	b.eq	.LBB21_30
// %bb.43:                              //   in Loop: Header=BB21_1 Depth=1
	cmp	w9, #2                  // =2
	b.eq	.LBB21_30
// %bb.44:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w12, [x19, #2008]
	cmp	w10, w12
	b.ls	.LBB21_30
// %bb.45:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w10, w12
	stur	w12, [x29, #-80]
	b	.LBB21_30
.LBB21_46:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w11, #-1
                                        // kill: def $w11 killed $w11 killed $x11
.LBB21_47:                              //   in Loop: Header=BB21_1 Depth=1
	str	wzr, [sp, #88]          // 4-byte Folded Spill
	stur	w11, [x29, #-68]
	b	.LBB21_52
.LBB21_48:                              //   in Loop: Header=BB21_1 Depth=1
	cmp	w9, #2                  // =2
	csetm	w11, eq
.LBB21_49:                              //   in Loop: Header=BB21_1 Depth=1
	cmp	w9, #2                  // =2
	stur	w11, [x29, #-68]
	b.ne	.LBB21_51
.LBB21_50:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	x11, [x19, #136]
	mov	w12, #1
	str	w12, [sp, #88]          // 4-byte Folded Spill
	mov	x12, #-1
	ldr	x11, [x11]
	str	x12, [x11, #184]
	b	.LBB21_52
.LBB21_51:                              //   in Loop: Header=BB21_1 Depth=1
	str	wzr, [sp, #88]          // 4-byte Folded Spill
.LBB21_52:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	x11, [sp, #64]          // 8-byte Folded Reload
	ldr	w11, [x11]
	cmn	w11, #1                 // =1
	b.ne	.LBB21_292
// %bb.53:                              //   in Loop: Header=BB21_1 Depth=1
	cbz	w10, .LBB21_306
// %bb.54:                              //   in Loop: Header=BB21_1 Depth=1
	cbnz	w8, .LBB21_59
// %bb.55:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w10, [x19, #1192]
	cmp	w10, #2                 // =2
	b.lo	.LBB21_59
// %bb.56:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w10, [x19, #1872]
	cmn	w10, #1                 // =1
	b.ne	.LBB21_320
// %bb.57:                              //   in Loop: Header=BB21_1 Depth=1
	cmp	w26, #1                 // =1
	b.ne	.LBB21_80
// %bb.58:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w10, [x19, #1876]
	cmn	w10, #1                 // =1
	b.ne	.LBB21_321
.LBB21_59:                              //   in Loop: Header=BB21_1 Depth=1
	add	x9, x25, w9, sxtw #2
	cmp	w26, #1                 // =1
	ldr	w28, [x9, #200]
	b.ne	.LBB21_81
// %bb.60:                              //   in Loop: Header=BB21_1 Depth=1
	cbnz	w8, .LBB21_81
// %bb.61:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x19, #136]
	mov	x2, xzr
	ldr	w1, [x19, #1200]
	ldr	x20, [x8, #16]
	ldr	x0, [x20, #144]
	b	.LBB21_63
.LBB21_62:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	x8, [x20, #144]
	mov	w1, w9
	add	w2, w0, #1              // =1
	mov	x0, x8
.LBB21_63:                              //   Parent Loop BB21_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	bl	find_next_bit
	ldr	w9, [x19, #1200]
	cmp	w9, w0
	b.ls	.LBB21_79
// %bb.64:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	x8, [x19, #136]
	ldr	x10, [x8, #24]
	ldr	w8, [x19, #1192]
	ldr	w11, [x10, #100]
	udiv	w11, w11, w8
	cmp	w11, w0
	b.eq	.LBB21_62
// %bb.65:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	w11, [x10, #220]
	udiv	w11, w11, w8
	cmp	w11, w0
	b.eq	.LBB21_62
// %bb.66:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	w11, [x10, #340]
	udiv	w11, w11, w8
	cmp	w11, w0
	b.eq	.LBB21_62
// %bb.67:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	w11, [x10, #460]
	udiv	w11, w11, w8
	cmp	w11, w0
	b.eq	.LBB21_62
// %bb.68:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	w11, [x10, #580]
	udiv	w11, w11, w8
	cmp	w11, w0
	b.eq	.LBB21_62
// %bb.69:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	w11, [x10, #700]
	udiv	w11, w11, w8
	cmp	w11, w0
	b.eq	.LBB21_62
// %bb.70:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	w11, [x10, #820]
	udiv	w11, w11, w8
	cmp	w11, w0
	b.eq	.LBB21_62
// %bb.71:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	w11, [x10, #940]
	udiv	w11, w11, w8
	cmp	w11, w0
	b.eq	.LBB21_62
// %bb.72:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	w11, [x10, #1060]
	udiv	w11, w11, w8
	cmp	w11, w0
	b.eq	.LBB21_62
// %bb.73:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	w11, [x10, #1180]
	udiv	w11, w11, w8
	cmp	w11, w0
	b.eq	.LBB21_62
// %bb.74:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	w10, [x10, #1300]
	udiv	w10, w10, w8
	cmp	w10, w0
	b.eq	.LBB21_62
// %bb.75:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	w10, [x19, #1864]
	cmp	w10, w0
	b.eq	.LBB21_62
// %bb.76:                              //   in Loop: Header=BB21_63 Depth=2
	ldr	x10, [x19, #2000]
	cbz	x10, .LBB21_78
// %bb.77:                              //   in Loop: Header=BB21_63 Depth=2
	mul	w8, w8, w0
	add	w11, w8, #63            // =63
	cmp	w8, #0                  // =0
	csel	w11, w11, w8, lt
	asr	w11, w11, #6
	ldr	x10, [x10, w11, sxtw #3]
	lsr	x8, x10, x8
	tbnz	w8, #0, .LBB21_62
.LBB21_78:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x20, #144]
	ubfx	x9, x0, #6, #26
	mov	w20, w27
	add	x8, x8, x9, lsl #3
	mov	w9, #1
	lsl	x9, x9, x0
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	w8, [x19, #1192]
	mul	w10, w8, w0
	cmn	w10, #1                 // =1
	stur	w10, [x29, #-56]
	b.eq	.LBB21_81
	b	.LBB21_288
.LBB21_79:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w8, #-1
	mov	w20, w27
	stur	w8, [x29, #-56]
	b	.LBB21_81
.LBB21_80:                              //   in Loop: Header=BB21_1 Depth=1
	add	x8, x25, w9, sxtw #2
	ldr	w28, [x8, #200]
.LBB21_81:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	w8, [x19, #3024]
	ldr	w27, [sp, #108]         // 4-byte Folded Reload
	str	w28, [sp, #72]          // 4-byte Folded Spill
	cmp	w8, #2                  // =2
	b.ne	.LBB21_85
// %bb.82:                              //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB21_85
// %bb.83:                              //   in Loop: Header=BB21_1 Depth=1
	cmp	w22, #10                // =10
	b.hi	.LBB21_203
// %bb.84:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w8, #1
	mov	w9, #1592
	lsl	w8, w8, w22
	tst	w8, w9
	b.eq	.LBB21_203
.LBB21_85:                              //   in Loop: Header=BB21_1 Depth=1
	mov	w26, wzr
	str	w27, [sp, #108]         // 4-byte Folded Spill
	stur	w20, [x29, #-108]       // 4-byte Folded Spill
.LBB21_86:                              //   Parent Loop BB21_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB21_192 Depth 3
                                        //       Child Loop BB21_147 Depth 3
                                        //       Child Loop BB21_121 Depth 3
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB21_91
// %bb.87:                              //   in Loop: Header=BB21_86 Depth=2
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB21_91
// %bb.88:                              //   in Loop: Header=BB21_86 Depth=2
	ldur	w8, [x29, #-76]
	cmp	w8, w20
	b.hs	.LBB21_90
// %bb.89:                              //   in Loop: Header=BB21_86 Depth=2
	stur	w20, [x29, #-76]
.LBB21_90:                              //   in Loop: Header=BB21_86 Depth=2
	cmp	w21, w27
	csel	w21, w27, w21, hi
.LBB21_91:                              //   in Loop: Header=BB21_86 Depth=2
	ldp	w9, w8, [x29, #-76]
	ldur	x0, [x29, #-88]
	udiv	w1, w21, w8
	udiv	w2, w9, w8
	bl	find_next_bit
	ldur	w8, [x29, #-72]
	mul	w28, w8, w0
	cmp	w28, w21
	b.lo	.LBB21_97
// %bb.92:                              //   in Loop: Header=BB21_86 Depth=2
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB21_95
// %bb.93:                              //   in Loop: Header=BB21_86 Depth=2
	cmp	w23, #2                 // =2
	b.hi	.LBB21_95
// %bb.94:                              //   in Loop: Header=BB21_86 Depth=2
	ldr	x8, [x19, #16]
	ldr	w8, [x8, #2180]
	tbnz	w8, #16, .LBB21_208
.LBB21_95:                              //   in Loop: Header=BB21_86 Depth=2
	ldursw	x8, [x29, #-92]
	add	x8, x25, x8, lsl #2
	ldr	w9, [x8, #200]!
	cbz	w9, .LBB21_208
// %bb.96:                              //   in Loop: Header=BB21_86 Depth=2
	mov	w21, w9
	str	wzr, [x8]
	stur	wzr, [x29, #-76]
	b	.LBB21_86
.LBB21_97:                              //   in Loop: Header=BB21_86 Depth=2
	add	w8, w28, w8
	ldr	x9, [x25, #48]
	add	w10, w28, #63           // =63
	cmp	w28, #0                 // =0
	csel	w20, w10, w28, lt
	asr	w10, w20, #6
	stur	w8, [x29, #-76]
	ldr	x8, [x9, w10, sxtw #3]
	mov	w9, #1
	lsl	x23, x9, x28
	tst	x8, x23
	b.ne	.LBB21_110
// %bb.98:                              //   in Loop: Header=BB21_86 Depth=2
	ldr	x9, [x19, #136]
	ldr	w8, [x19, #1192]
	ldr	x10, [x9, #24]
	udiv	w24, w28, w8
	ldr	w11, [x10, #100]
	udiv	w11, w11, w8
	cmp	w11, w24
	b.eq	.LBB21_110
// %bb.99:                              //   in Loop: Header=BB21_86 Depth=2
	ldr	w11, [x10, #220]
	udiv	w11, w11, w8
	cmp	w11, w24
	b.eq	.LBB21_110
// %bb.100:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w11, [x10, #340]
	udiv	w11, w11, w8
	cmp	w11, w24
	b.eq	.LBB21_110
// %bb.101:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w11, [x10, #460]
	udiv	w11, w11, w8
	cmp	w11, w24
	b.eq	.LBB21_110
// %bb.102:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w11, [x10, #580]
	udiv	w11, w11, w8
	cmp	w11, w24
	b.eq	.LBB21_110
// %bb.103:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w11, [x10, #700]
	udiv	w11, w11, w8
	cmp	w11, w24
	b.eq	.LBB21_110
// %bb.104:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w11, [x10, #820]
	udiv	w11, w11, w8
	cmp	w11, w24
	b.eq	.LBB21_110
// %bb.105:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w11, [x10, #940]
	udiv	w11, w11, w8
	cmp	w11, w24
	b.eq	.LBB21_110
// %bb.106:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w11, [x10, #1060]
	udiv	w11, w11, w8
	cmp	w11, w24
	b.eq	.LBB21_110
// %bb.107:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w11, [x10, #1180]
	udiv	w11, w11, w8
	cmp	w11, w24
	b.eq	.LBB21_110
// %bb.108:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w10, [x10, #1300]
	udiv	w10, w10, w8
	cmp	w10, w24
	b.eq	.LBB21_110
// %bb.109:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w10, [x19, #1864]
	cmp	w10, w24
	b.ne	.LBB21_111
.LBB21_110:                             //   in Loop: Header=BB21_86 Depth=2
	ldur	w8, [x29, #-80]
	add	w26, w26, #1            // =1
	ldr	w23, [sp, #84]          // 4-byte Folded Reload
	ldur	x24, [x29, #-104]       // 8-byte Folded Reload
	ldur	w20, [x29, #-108]       // 4-byte Folded Reload
	cmp	w26, w8
	b.lo	.LBB21_86
	b	.LBB21_205
.LBB21_111:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x10, [x19, #80]
	tbnz	w10, #8, .LBB21_188
.LBB21_112:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w8, [sp, #112]          // 4-byte Folded Reload
	cmp	w8, #1                  // =1
	b.eq	.LBB21_115
// %bb.113:                             //   in Loop: Header=BB21_86 Depth=2
	cbnz	w8, .LBB21_116
// %bb.114:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	add	w9, w24, #63            // =63
	cmp	w24, #0                 // =0
	csel	w9, w9, w24, lt
	asr	w9, w9, #6
	ldr	x8, [x8, #144]
	ldr	x8, [x8, w9, sxtw #3]
	lsr	x8, x8, x24
	tbnz	w8, #0, .LBB21_110
	b	.LBB21_116
.LBB21_115:                             //   in Loop: Header=BB21_86 Depth=2
	ldur	w8, [x29, #-96]
	cbz	w8, .LBB21_143
.LBB21_116:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w8, [sp, #88]           // 4-byte Folded Reload
	cbz	w8, .LBB21_136
// %bb.117:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w9, [x19, #1192]
	cmn	w28, #1                 // =1
	ldr	x8, [x19, #136]
	mov	w12, #-1
	udiv	w10, w28, w9
	ldr	x8, [x8]
	ldr	x11, [x19, #80]
	csel	w10, w12, w10, eq
	tbz	w11, #8, .LBB21_119
// %bb.118:                             //   in Loop: Header=BB21_86 Depth=2
	ldur	w11, [x29, #-92]
	cmp	w11, #2                 // =2
	b.eq	.LBB21_195
.LBB21_119:                             //   in Loop: Header=BB21_86 Depth=2
	mov	x11, xzr
	cbz	w9, .LBB21_122
// %bb.120:                             //   in Loop: Header=BB21_86 Depth=2
	mul	w10, w10, w9
	ldr	x12, [x8, #136]
	mov	x13, xzr
	mov	w15, #48
.LBB21_121:                             //   Parent Loop BB21_1 Depth=1
                                        //     Parent Loop BB21_86 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	umaddl	x14, w10, w15, x12
	add	x13, x13, #1            // =1
	add	w10, w10, #1            // =1
	cmp	x13, x9
	ldr	x14, [x14, #40]
	add	x11, x14, x11
	b.ne	.LBB21_121
.LBB21_122:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x10, [x8, #168]
	udiv	x24, x11, x9
	cmp	x24, x10
	b.hs	.LBB21_124
// %bb.123:                             //   in Loop: Header=BB21_86 Depth=2
	str	x24, [x8, #168]
.LBB21_124:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x9, [x8, #176]
	cmp	x24, x9
	b.ls	.LBB21_126
// %bb.125:                             //   in Loop: Header=BB21_86 Depth=2
	str	x24, [x8, #176]
.LBB21_126:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x9, [x8, #184]
	cmp	x24, x9
	b.hs	.LBB21_128
// %bb.127:                             //   in Loop: Header=BB21_86 Depth=2
	str	x24, [x8, #184]
.LBB21_128:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x9, [x8, #192]
	cmp	x24, x9
	b.ls	.LBB21_130
// %bb.129:                             //   in Loop: Header=BB21_86 Depth=2
	mov	x9, x24
	str	x24, [x8, #192]
.LBB21_130:                             //   in Loop: Header=BB21_86 Depth=2
	ldur	x8, [x29, #-40]
	sub	x9, x9, x24
	cmp	x9, x8
	b.lo	.LBB21_110
// %bb.131:                             //   in Loop: Header=BB21_86 Depth=2
	ldur	x23, [x29, #-104]       // 8-byte Folded Reload
	mov	w8, #1
	sub	x2, x29, #24            // =24
	sub	x4, x29, #28            // =28
	mov	x0, x19
	mov	x3, x24
	stur	xzr, [x29, #-24]
	mov	x1, x23
	sturb	w8, [x29, #-28]
	bl	f2fs_lookup_rb_tree_ext
	adrp	x8, victim_entry_slab
	mov	w1, #64
	ldur	x20, [x29, #-24]
	movk	w1, #96, lsl #16
	ldurb	w22, [x29, #-28]
	ldr	x8, [x8, :lo12:victim_entry_slab]
	str	x0, [sp]                // 8-byte Folded Spill
	mov	x0, x8
	mov	x27, x8
	bl	kmem_cache_alloc
	mov	x25, x0
	cbnz	x0, .LBB21_133
// %bb.132:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w8, #64
	mov	x0, x27
	movk	w8, #96, lsl #16
	add	w1, w8, #2048           // =2048
	bl	kmem_cache_alloc
	mov	x25, x0
.LBB21_133:                             //   in Loop: Header=BB21_86 Depth=2
	cmp	w22, #0                 // =0
	ldr	x8, [sp]                // 8-byte Folded Reload
	cset	w2, ne
	mov	x0, x25
	mov	x1, x23
	str	w28, [x25, #32]
	stp	x20, xzr, [x25]
	stp	xzr, x24, [x25, #16]
	str	x25, [x8]
	bl	rb_insert_color_cached
	ldr	x20, [x19, #1832]
	add	x22, x25, #40           // =40
	ldr	x2, [sp, #96]           // 8-byte Folded Reload
	mov	x0, x22
	mov	x1, x20
	bl	__list_add_valid
	tbz	w0, #0, .LBB21_135
// %bb.134:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x8, [sp, #96]           // 8-byte Folded Reload
	str	x22, [x19, #1832]
	stp	x8, x20, [x25, #40]
	str	x22, [x20]
.LBB21_135:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w8, [x19, #1840]
	ldr	w27, [sp, #108]         // 4-byte Folded Reload
	add	w8, w8, #1              // =1
	str	w8, [x19, #1840]
	ldp	x25, x22, [sp, #48]     // 16-byte Folded Reload
	b	.LBB21_110
.LBB21_136:                             //   in Loop: Header=BB21_86 Depth=2
	ldur	w8, [x29, #-96]
	cmp	w8, #1                  // =1
	b.ne	.LBB21_138
// %bb.137:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x8, [x19, #136]
	mov	w9, #48
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	umaddl	x8, w28, w9, x8
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	b	.LBB21_179
.LBB21_138:                             //   in Loop: Header=BB21_86 Depth=2
	ldur	w8, [x29, #-92]
	cbz	w8, .LBB21_145
// %bb.139:                             //   in Loop: Header=BB21_86 Depth=2
	cmp	w8, #1                  // =1
	b.ne	.LBB21_329
// %bb.140:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x8, [x19, #136]
	ldr	w9, [x19, #1192]
	ldr	x8, [x8]
	cmp	w9, #2                  // =2
	b.lo	.LBB21_161
// %bb.141:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x8, [x8, #144]
	cmn	w28, #1                 // =1
	b.eq	.LBB21_176
// %bb.142:                             //   in Loop: Header=BB21_86 Depth=2
	udiv	w9, w28, w9
	b	.LBB21_177
.LBB21_143:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x8, [x19, #2000]
	cbz	x8, .LBB21_116
// %bb.144:                             //   in Loop: Header=BB21_86 Depth=2
	sbfx	x9, x20, #6, #26
	ldr	x8, [x8, x9, lsl #3]
	tst	x8, x23
	b.ne	.LBB21_110
	b	.LBB21_116
.LBB21_145:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x8, [x19, #136]
	cmn	w28, #1                 // =1
	ldr	w13, [x19, #1192]
	mov	w10, #-1
	ldr	x12, [x8]
	udiv	w8, w28, w13
	csel	w10, w10, w8, eq
	mov	x8, xzr
	ldr	x9, [x12, #136]
	cbz	w13, .LBB21_150
// %bb.146:                             //   in Loop: Header=BB21_86 Depth=2
	mul	w10, w10, w13
	mov	x11, xzr
	mov	w15, #48
.LBB21_147:                             //   Parent Loop BB21_1 Depth=1
                                        //     Parent Loop BB21_86 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	umaddl	x14, w10, w15, x9
	add	x11, x11, #1            // =1
	add	w10, w10, #1            // =1
	cmp	x11, x13
	ldr	x14, [x14, #40]
	add	x8, x14, x8
	b.ne	.LBB21_147
// %bb.148:                             //   in Loop: Header=BB21_86 Depth=2
	cmp	w13, #2                 // =2
	b.lo	.LBB21_150
// %bb.149:                             //   in Loop: Header=BB21_86 Depth=2
	udiv	w9, w28, w13
	ldr	x10, [x12, #144]
	cmn	w28, #1                 // =1
	mov	w11, #-1
	csel	x9, x11, x9, eq
	ldr	w14, [x10, x9, lsl #2]
	b	.LBB21_151
.LBB21_150:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w10, #48
	umull	x10, w28, w10
	ldr	w9, [x9, x10]
	ubfx	w14, w9, #6, #10
.LBB21_151:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x9, [x12, #168]
	udiv	x8, x8, x13
	ldr	w10, [x19, #1184]
	cmp	x8, x9
	b.hs	.LBB21_153
// %bb.152:                             //   in Loop: Header=BB21_86 Depth=2
	mov	x9, x8
	str	x8, [x12, #168]
.LBB21_153:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x11, [x12, #176]
	udiv	w13, w14, w13
	cmp	x8, x11
	b.ls	.LBB21_155
// %bb.154:                             //   in Loop: Header=BB21_86 Depth=2
	mov	x11, x8
	str	x8, [x12, #176]
.LBB21_155:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w12, #100
	ldr	w14, [x19, #1764]
	mul	w12, w13, w12
	cbz	w14, .LBB21_171
// %bb.156:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w14, [x19, #3024]
	ldr	w13, [x19, #3308]
	cmp	w14, #2                 // =2
	b.ne	.LBB21_162
// %bb.157:                             //   in Loop: Header=BB21_86 Depth=2
	cmp	w13, #1                 // =1
	b.hi	.LBB21_162
// %bb.158:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x15, [x19, #16]
	ldr	w15, [x15, #2180]
	tbz	w15, #16, .LBB21_162
// %bb.159:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x15, [x19, #3032]
	mov	w16, #192
	madd	x15, x13, x16, x15
	ldp	w17, w16, [x15, #180]
	ldr	w18, [x15, #176]
	ldr	w0, [x15, #168]
	sub	w15, w17, w16
	subs	w16, w0, w18
	b.lo	.LBB21_163
.LBB21_160:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w17, [x19, #1184]
	lsl	w16, w16, w17
	b	.LBB21_164
.LBB21_161:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w9, #48
	ldr	x8, [x8, #136]
	umull	x9, w28, w9
	ldr	w8, [x8, x9]
	ubfx	w8, w8, #6, #10
	b	.LBB21_178
.LBB21_162:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x15, [x19, #136]
	ldr	w18, [x19, #1236]
	ldp	x16, x17, [x15]
	ldr	w0, [x15, #104]
	ldr	w15, [x16, #16]
	ldr	w16, [x17, #4]
	sub	w15, w18, w15
	subs	w16, w16, w0
	b.hs	.LBB21_160
.LBB21_163:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w16, wzr
.LBB21_164:                             //   in Loop: Header=BB21_86 Depth=2
	cbz	w15, .LBB21_171
// %bb.165:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w17, #100
	mov	w15, w15
	umull	x16, w16, w17
	udiv	x15, x16, x15
	cmp	w15, #9                 // =9
	b.gt	.LBB21_171
// %bb.166:                             //   in Loop: Header=BB21_86 Depth=2
	cmp	w14, #2                 // =2
	b.ne	.LBB21_181
// %bb.167:                             //   in Loop: Header=BB21_86 Depth=2
	cmp	w13, #1                 // =1
	b.hi	.LBB21_181
// %bb.168:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x14, [x19, #16]
	ldr	w14, [x14, #2180]
	tbz	w14, #16, .LBB21_181
// %bb.169:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x14, [x19, #3032]
	mov	w15, #192
	madd	x13, x13, x15, x14
	ldp	w15, w14, [x13, #180]
	ldr	w16, [x13, #176]
	ldr	w17, [x13, #168]
	sub	w13, w15, w14
	subs	w14, w17, w16
	b.lo	.LBB21_182
.LBB21_170:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w15, [x19, #1184]
	lsl	w14, w14, w15
	b	.LBB21_183
.LBB21_171:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w13, #100
.LBB21_172:                             //   in Loop: Header=BB21_86 Depth=2
	subs	x11, x11, x9
	lsr	w10, w12, w10
	b.ne	.LBB21_174
// %bb.173:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w8, wzr
	b	.LBB21_175
.LBB21_174:                             //   in Loop: Header=BB21_86 Depth=2
	sub	x8, x8, x9
	mul	x8, x13, x8
	udiv	x8, x8, x11
	sub	w8, w13, w8
	and	w8, w8, #0xff
.LBB21_175:                             //   in Loop: Header=BB21_86 Depth=2
	and	w9, w10, #0xff
	mov	w10, #100
	mov	x11, x10
	sub	w10, w11, w9
	add	w9, w9, #100            // =100
	mul	w8, w10, w8
	mul	w8, w8, w11
	sdiv	w8, w8, w9
	mvn	w8, w8
	b	.LBB21_178
.LBB21_176:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w9, #-1
.LBB21_177:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w8, [x8, x9, lsl #2]
.LBB21_178:                             //   in Loop: Header=BB21_86 Depth=2
	ldp	x25, x22, [sp, #48]     // 16-byte Folded Reload
	ldr	w27, [sp, #108]         // 4-byte Folded Reload
.LBB21_179:                             //   in Loop: Header=BB21_86 Depth=2
	ldur	w9, [x29, #-68]
	cmp	w9, w8
	b.ls	.LBB21_110
// %bb.180:                             //   in Loop: Header=BB21_86 Depth=2
	stur	w28, [x29, #-56]
	stur	w8, [x29, #-68]
	b	.LBB21_110
.LBB21_181:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x13, [x19, #136]
	ldr	w16, [x19, #1236]
	ldp	x14, x15, [x13]
	ldr	w17, [x13, #104]
	ldr	w13, [x14, #16]
	ldr	w14, [x15, #4]
	sub	w13, w16, w13
	subs	w14, w14, w17
	b.hs	.LBB21_170
.LBB21_182:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w14, wzr
.LBB21_183:                             //   in Loop: Header=BB21_86 Depth=2
	cbz	w13, .LBB21_186
// %bb.184:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w15, #100
	mov	w13, w13
	umull	x14, w14, w15
	udiv	x13, x14, x13
	add	w13, w13, w13, lsl #2
	lsl	w13, w13, #1
	cmp	w13, #2                 // =2
	b.ge	.LBB21_187
// %bb.185:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w13, #1
	b	.LBB21_187
.LBB21_186:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w13, #1000
.LBB21_187:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w13, w13
	b	.LBB21_172
.LBB21_188:                             //   in Loop: Header=BB21_86 Depth=2
	ldur	w10, [x29, #-96]
	cbz	w10, .LBB21_190
// %bb.189:                             //   in Loop: Header=BB21_86 Depth=2
	mov	x0, x19
	mov	w1, w28
	bl	f2fs_segment_has_free_slot
	ldp	x25, x22, [sp, #48]     // 16-byte Folded Reload
	ldr	w27, [sp, #108]         // 4-byte Folded Reload
	tbz	w0, #0, .LBB21_110
	b	.LBB21_112
.LBB21_190:                             //   in Loop: Header=BB21_86 Depth=2
	cmp	w8, #2                  // =2
	b.lo	.LBB21_193
// %bb.191:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w11, #4767
	ldr	x13, [x9]
	movk	w11, #10724, lsl #16
	mov	w10, wzr
	umull	x11, w28, w11
	lsr	x11, x11, #32
	sub	w12, w28, w11
	add	w9, w11, w12, lsr #1
	mov	w11, #55
	lsr	w9, w9, #5
	mov	w12, wzr
	mul	w9, w9, w11
	ldr	x11, [x13, #136]
.LBB21_192:                             //   Parent Loop BB21_1 Depth=1
                                        //     Parent Loop BB21_86 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	w13, #48
	add	w12, w12, #1            // =1
	cmp	w12, w8
	umaddl	x13, w9, w13, x11
	add	w9, w9, #1              // =1
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	add	w10, w13, w10
	b.ne	.LBB21_192
	b	.LBB21_194
.LBB21_193:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x8, [x9]
	mov	w9, #48
	ldr	x8, [x8, #136]
	umaddl	x8, w28, w9, x8
	ldrh	w8, [x8, #2]
	and	w10, w8, #0x3ff
.LBB21_194:                             //   in Loop: Header=BB21_86 Depth=2
	ldp	x25, x22, [sp, #48]     // 16-byte Folded Reload
	ldr	w27, [sp, #108]         // 4-byte Folded Reload
	cbnz	w10, .LBB21_110
	b	.LBB21_112
.LBB21_195:                             //   in Loop: Header=BB21_86 Depth=2
	cmp	w9, #2                  // =2
	b.lo	.LBB21_198
// %bb.196:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	x11, [x8, #144]
	cmn	w28, #1                 // =1
	b.eq	.LBB21_199
// %bb.197:                             //   in Loop: Header=BB21_86 Depth=2
	udiv	w12, w28, w9
	b	.LBB21_200
.LBB21_198:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w12, #48
	ldr	x11, [x8, #136]
	umull	x12, w28, w12
	ldr	w11, [x11, x12]
	ubfx	w11, w11, #6, #10
	b	.LBB21_201
.LBB21_199:                             //   in Loop: Header=BB21_86 Depth=2
	mov	w12, #-1
.LBB21_200:                             //   in Loop: Header=BB21_86 Depth=2
	ldr	w11, [x11, x12, lsl #2]
.LBB21_201:                             //   in Loop: Header=BB21_86 Depth=2
	ldp	x25, x22, [sp, #48]     // 16-byte Folded Reload
	ldr	w27, [sp, #108]         // 4-byte Folded Reload
	cbnz	w11, .LBB21_119
	b	.LBB21_110
.LBB21_202:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x9, #24]
	mov	w10, #120
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	madd	x8, x9, x10, x8
	ldrh	w26, [x8, #98]
	b	.LBB21_5
.LBB21_203:                             //   in Loop: Header=BB21_1 Depth=1
	cmp	w23, #2                 // =2
	b.hi	.LBB21_262
// %bb.204:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x19, #3032]
	ldr	w9, [x8, #280]
	ldr	w20, [x8, #276]
	add	w27, w9, #1             // =1
	b	.LBB21_85
.LBB21_205:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB21_264
// %bb.206:                             //   in Loop: Header=BB21_1 Depth=1
	cmp	w23, #2                 // =2
	b.hi	.LBB21_264
// %bb.207:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x19, #16]
	ldr	w8, [x8, #2180]
	tbz	w8, #16, .LBB21_264
.LBB21_208:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	w8, [sp, #88]           // 4-byte Folded Reload
	cbz	w8, .LBB21_287
.LBB21_209:                             //   in Loop: Header=BB21_1 Depth=1
	mov	x0, x19
	mov	x1, x24
	mov	w2, #1
	bl	f2fs_check_rb_tree_consistence
	tbz	w0, #0, .LBB21_275
.LBB21_210:                             //   in Loop: Header=BB21_1 Depth=1
	mov	x0, x19
	mov	x1, x24
	mov	w2, #1
	bl	f2fs_check_rb_tree_consistence
	tbz	w0, #0, .LBB21_333
// %bb.211:                             //   in Loop: Header=BB21_1 Depth=1
	ldur	w8, [x29, #-92]
	cmp	w8, #2                  // =2
	b.ne	.LBB21_226
// %bb.212:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x19, #136]
	ldr	w9, [x19, #1844]
	ldr	w10, [x19, #1840]
	ldr	x11, [x8]
	mul	w9, w10, w9
	ldr	w10, [x19, #1848]
	ldp	x20, x8, [x11, #184]
	mov	w11, #34079
	movk	w11, #20971, lsl #16
	umull	x9, w9, w11
	lsr	x9, x9, #37
	cmp	w10, w9
	csel	w23, w10, w9, hi
	cmp	x8, x20
	b.lo	.LBB21_228
// %bb.213:                             //   in Loop: Header=BB21_1 Depth=1
	add	x24, x8, #1             // =1
	mov	x8, #-1
	sub	x26, x24, x20
	mov	x9, #62915
	movk	x9, #23592, lsl #16
	ldr	x0, [x19, #1816]
	udiv	x8, x8, x26
	movk	x9, #49807, lsl #32
	movk	x9, #10485, lsl #48
	lsr	x8, x8, #2
	umulh	x8, x8, x9
	lsr	x9, x8, #6
	cmp	x9, #625                // =625
	mov	w9, #10000
	lsr	x8, x8, #2
	csel	x28, x8, x9, lo
	cbz	x0, .LBB21_228
// %bb.214:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	w8, [x19, #1192]
	mov	w22, wzr
	ldr	w9, [x19, #1188]
	ldr	w27, [x19, #1852]
	mul	w25, w9, w8
	mov	w8, w25
	str	x8, [sp, #88]           // 8-byte Folded Spill
	mov	w8, #100
	sub	w8, w8, w27
	str	x8, [sp, #72]           // 8-byte Folded Spill
.LBB21_215:                             //   Parent Loop BB21_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x9, [x0, #24]
	subs	x8, x24, x9
	ccmp	x9, x20, #0, hi
	b.lo	.LBB21_224
// %bb.216:                             //   in Loop: Header=BB21_215 Depth=2
	ldr	x10, [x19, #136]
	ldr	w11, [x19, #1192]
	ldr	w9, [x0, #32]
	ldr	x10, [x10]
	cmp	w11, #2                 // =2
	b.lo	.LBB21_218
// %bb.217:                             //   in Loop: Header=BB21_215 Depth=2
	udiv	w11, w9, w11
	ldr	x10, [x10, #144]
	cmn	w9, #1                  // =1
	mov	w9, #-1
	csel	x9, x9, x11, eq
	ldr	w9, [x10, x9, lsl #2]
	b	.LBB21_219
.LBB21_218:                             //   in Loop: Header=BB21_215 Depth=2
	mov	w11, #48
	ldr	x10, [x10, #136]
	mul	x9, x9, x11
	ldr	w9, [x10, x9]
	ubfx	w9, w9, #6, #10
.LBB21_219:                             //   in Loop: Header=BB21_215 Depth=2
	cmp	w9, #0                  // =0
	ccmp	w25, w9, #4, ne
	b.eq	.LBB21_334
// %bb.220:                             //   in Loop: Header=BB21_215 Depth=2
	sub	w9, w25, w9
	mul	x8, x8, x28
	ldr	x10, [sp, #88]          // 8-byte Folded Reload
	mul	x9, x28, x9
	udiv	x8, x8, x26
	udiv	x9, x9, x10
	ldr	x10, [sp, #72]          // 8-byte Folded Reload
	mul	x8, x8, x27
	madd	x9, x9, x10, x8
	mov	w10, #-1
	cmp	x9, x10
	b.hs	.LBB21_338
// %bb.221:                             //   in Loop: Header=BB21_215 Depth=2
	ldur	w10, [x29, #-68]
	mvn	w9, w9
	add	w22, w22, #1            // =1
	cmp	w10, w9
	b.hi	.LBB21_223
// %bb.222:                             //   in Loop: Header=BB21_215 Depth=2
	ldur	x10, [x29, #-64]
	ccmp	x8, x10, #0, eq
	b.ls	.LBB21_224
.LBB21_223:                             //   in Loop: Header=BB21_215 Depth=2
	stur	x8, [x29, #-64]
	ldr	w8, [x0, #32]
	stur	w9, [x29, #-68]
	stur	w8, [x29, #-56]
.LBB21_224:                             //   in Loop: Header=BB21_215 Depth=2
	cmp	w22, w23
	b.hs	.LBB21_228
// %bb.225:                             //   in Loop: Header=BB21_215 Depth=2
	bl	rb_next
	cbnz	x0, .LBB21_215
	b	.LBB21_228
.LBB21_226:                             //   in Loop: Header=BB21_1 Depth=1
	ldur	w8, [x29, #-96]
	cmp	w8, #3                  // =3
	b.ne	.LBB21_343
// %bb.227:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x19, #136]
	ldr	w9, [x19, #1844]
	ldr	w10, [x19, #1840]
	ldr	w11, [x19, #1848]
	ldr	x8, [x8]
	mul	w10, w10, w9
	ldp	x26, x9, [x8, #184]
	mov	w8, #34079
	movk	w8, #20971, lsl #16
	umull	x8, w10, w8
	lsr	x8, x8, #37
	cmp	w11, w8
	csel	w28, w11, w8, hi
	cmp	x9, x26
	b.hs	.LBB21_240
.LBB21_228:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x27, [sp, #96]          // 8-byte Folded Reload
	ldr	x26, [x27]
	cmp	x27, x26
	b.eq	.LBB21_234
// %bb.229:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x9, [x26]
	mov	x22, #256
	ldr	x25, [sp, #48]          // 8-byte Folded Reload
	movk	x22, #57005, lsl #48
	ldr	w23, [sp, #84]          // 4-byte Folded Reload
	ldur	x24, [x29, #-104]       // 8-byte Folded Reload
	b	.LBB21_231
.LBB21_230:                             //   in Loop: Header=BB21_231 Depth=2
	add	x8, x22, #256           // =256
	mov	x1, x28
	stp	x22, x8, [x26]
	adrp	x8, victim_entry_slab
	ldr	x0, [x8, :lo12:victim_entry_slab]
	bl	kmem_cache_free
	ldr	w8, [x19, #1840]
	mov	x26, x20
	cmp	x27, x20
	sub	w8, w8, #1              // =1
	str	w8, [x19, #1840]
	ldr	x9, [x20]
	b.eq	.LBB21_233
.LBB21_231:                             //   Parent Loop BB21_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x0, x26
	mov	x20, x9
	sub	x28, x26, #40           // =40
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB21_230
// %bb.232:                             //   in Loop: Header=BB21_231 Depth=2
	ldp	x9, x8, [x26]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB21_230
.LBB21_233:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x22, [sp, #56]          // 8-byte Folded Reload
	ldr	w26, [sp, #112]         // 4-byte Folded Reload
	b	.LBB21_235
.LBB21_234:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	w8, [x19, #1840]
	ldp	x25, x22, [sp, #48]     // 16-byte Folded Reload
	ldr	w26, [sp, #112]         // 4-byte Folded Reload
	ldr	w23, [sp, #84]          // 4-byte Folded Reload
	ldur	x24, [x29, #-104]       // 8-byte Folded Reload
.LBB21_235:                             //   in Loop: Header=BB21_1 Depth=1
	stp	xzr, xzr, [x24]
	ldur	w27, [x29, #-108]       // 4-byte Folded Reload
	cbnz	w8, .LBB21_279
.LBB21_236:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x9, [sp, #96]           // 8-byte Folded Reload
	ldr	x8, [x9]
	cmp	x9, x8
	b.ne	.LBB21_283
.LBB21_237:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x9]
	cmp	x9, x8
	b.ne	.LBB21_342
// %bb.238:                             //   in Loop: Header=BB21_1 Depth=1
	ldur	w10, [x29, #-56]
	cmn	w10, #1                 // =1
	b.ne	.LBB21_288
// %bb.239:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x9, [x25, #152]
	mov	x8, xzr
	ldur	x10, [x29, #-40]
	mov	w28, #-61
	cmp	x9, x10
	b.lo	.LBB21_1
	b	.LBB21_287
.LBB21_240:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	w23, [x19, #1188]
	mov	w8, wzr
	add	x24, x9, #1             // =1
	b	.LBB21_242
.LBB21_241:                             //   in Loop: Header=BB21_242 Depth=2
	mov	w8, #1
	cbnz	w20, .LBB21_228
.LBB21_242:                             //   Parent Loop BB21_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB21_254 Depth 3
                                        //       Child Loop BB21_245 Depth 3
	ldur	x3, [x29, #-48]
	sub	x2, x29, #24            // =24
	ldur	x1, [x29, #-104]        // 8-byte Folded Reload
	sub	x4, x29, #28            // =28
	mov	x0, x19
	mov	w20, w8
	stur	xzr, [x29, #-24]
	bl	f2fs_lookup_rb_tree_ext
	ldur	x0, [x29, #-24]
	mov	w25, #48
	cbz	x0, .LBB21_241
// %bb.243:                             //   in Loop: Header=BB21_242 Depth=2
	cmp	w20, #1                 // =1
	b.ne	.LBB21_253
// %bb.244:                             //   in Loop: Header=BB21_242 Depth=2
	mov	w22, wzr
.LBB21_245:                             //   Parent Loop BB21_1 Depth=1
                                        //     Parent Loop BB21_242 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x9, [x0, #24]
	subs	x8, x9, x24
	ccmp	x9, x26, #0, lo
	b.lo	.LBB21_251
// %bb.246:                             //   in Loop: Header=BB21_245 Depth=3
	ldr	x9, [x19, #136]
	ldr	w10, [x0, #32]
	ldr	x9, [x9]
	ldr	x9, [x9, #136]
	madd	x9, x10, x25, x9
	ldrh	w9, [x9, #2]
	ands	w9, w9, #0x3ff
	b.eq	.LBB21_325
// %bb.247:                             //   in Loop: Header=BB21_245 Depth=3
	cmp	w9, w23
	b.eq	.LBB21_251
// %bb.248:                             //   in Loop: Header=BB21_245 Depth=3
	ldur	x10, [x29, #-48]
	add	w22, w22, #1            // =1
	ldur	w11, [x29, #-68]
	add	x8, x10, x8
	cmp	x8, #0                  // =0
	cneg	x8, x8, mi
	sub	x10, x24, x8
	mvn	w8, w9
	cmp	w11, w8
	b.hi	.LBB21_250
// %bb.249:                             //   in Loop: Header=BB21_245 Depth=3
	ldur	x9, [x29, #-64]
	ccmp	x10, x9, #0, eq
	b.ls	.LBB21_251
.LBB21_250:                             //   in Loop: Header=BB21_245 Depth=3
	stur	x10, [x29, #-64]
	ldr	w9, [x0, #32]
	stur	w8, [x29, #-68]
	stur	w9, [x29, #-56]
.LBB21_251:                             //   in Loop: Header=BB21_245 Depth=3
	cmp	w22, w28
	b.hs	.LBB21_241
// %bb.252:                             //   in Loop: Header=BB21_245 Depth=3
	bl	rb_next
	cbnz	x0, .LBB21_245
	b	.LBB21_241
.LBB21_253:                             //   in Loop: Header=BB21_242 Depth=2
	mov	w22, wzr
.LBB21_254:                             //   Parent Loop BB21_1 Depth=1
                                        //     Parent Loop BB21_242 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x9, [x0, #24]
	subs	x8, x9, x24
	ccmp	x9, x26, #0, lo
	b.lo	.LBB21_260
// %bb.255:                             //   in Loop: Header=BB21_254 Depth=3
	ldr	x9, [x19, #136]
	ldr	w10, [x0, #32]
	ldr	x9, [x9]
	ldr	x9, [x9, #136]
	madd	x9, x10, x25, x9
	ldrh	w9, [x9, #2]
	ands	w9, w9, #0x3ff
	b.eq	.LBB21_325
// %bb.256:                             //   in Loop: Header=BB21_254 Depth=3
	cmp	w9, w23
	b.eq	.LBB21_260
// %bb.257:                             //   in Loop: Header=BB21_254 Depth=3
	ldur	x10, [x29, #-48]
	add	w22, w22, #1            // =1
	ldur	w11, [x29, #-68]
	add	x8, x10, x8
	cmp	x8, #0                  // =0
	cneg	x8, x8, mi
	sub	x10, x24, x8
	mvn	w8, w9
	cmp	w11, w8
	b.hi	.LBB21_259
// %bb.258:                             //   in Loop: Header=BB21_254 Depth=3
	ldur	x9, [x29, #-64]
	ccmp	x10, x9, #0, eq
	b.ls	.LBB21_260
.LBB21_259:                             //   in Loop: Header=BB21_254 Depth=3
	stur	x10, [x29, #-64]
	ldr	w9, [x0, #32]
	stur	w8, [x29, #-68]
	stur	w9, [x29, #-56]
.LBB21_260:                             //   in Loop: Header=BB21_254 Depth=3
	cmp	w22, w28
	b.hs	.LBB21_241
// %bb.261:                             //   in Loop: Header=BB21_254 Depth=3
	bl	rb_prev
	cbnz	x0, .LBB21_254
	b	.LBB21_241
.LBB21_262:                             //   in Loop: Header=BB21_1 Depth=1
	cmp	w22, #2                 // =2
	b.hi	.LBB21_267
// %bb.263:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x19, #3032]
	b	.LBB21_270
.LBB21_264:                             //   in Loop: Header=BB21_1 Depth=1
	ldursw	x8, [x29, #-92]
	ldur	w9, [x29, #-72]
	add	x8, x25, x8, lsl #2
	ldr	w10, [x8, #200]
	cmp	w10, #0                 // =0
	ldr	w10, [sp, #72]          // 4-byte Folded Reload
	ccmp	w28, w10, #2, eq
	csel	w10, w10, w28, ls
	add	w9, w10, w9
	str	w9, [x8, #200]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB21_266
// %bb.265:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbnz	w8, #0, .LBB21_272
.LBB21_266:                             //   in Loop: Header=BB21_1 Depth=1
	ldursw	x8, [x29, #-92]
	ldr	w9, [x19, #1200]
	ldr	w10, [x19, #1192]
	add	x8, x25, x8, lsl #2
	mul	w9, w10, w9
	ldr	w11, [x8, #200]
	udiv	w10, w11, w9
	msub	w9, w10, w9, w11
	str	w9, [x8, #200]
	b	.LBB21_273
.LBB21_267:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	ldrb	w8, [x8, #111]
	tbz	w8, #1, .LBB21_274
// %bb.268:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	w3, [x19, #3308]
	cmp	w3, #2                  // =2
	b.hs	.LBB21_347
// %bb.269:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x19, #3032]
	mov	w9, #192
	madd	x8, x3, x9, x8
.LBB21_270:                             //   in Loop: Header=BB21_1 Depth=1
	ldp	w20, w9, [x8, #84]
	add	w27, w9, #1             // =1
	b	.LBB21_85
.LBB21_271:                             //   in Loop: Header=BB21_1 Depth=1
	adrp	x0, .L.str.26
	adrp	x1, .L__func__.select_policy
	add	x0, x0, :lo12:.L.str.26
	add	x1, x1, :lo12:.L__func__.select_policy
	mov	w2, w22
	mov	w3, w26
	bl	printk
	b	.LBB21_10
.LBB21_272:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	x8, [x19, #3032]
	ldursw	x9, [x29, #-92]
	ldr	w10, [x19, #1192]
	ldr	w8, [x8, #88]
	add	x9, x25, x9, lsl #2
	add	w8, w8, #1              // =1
	ldr	w11, [x9, #200]
	mul	w8, w8, w10
	udiv	w10, w11, w8
	msub	w8, w10, w8, w11
	str	w8, [x9, #200]
.LBB21_273:                             //   in Loop: Header=BB21_1 Depth=1
	ldr	w8, [sp, #88]           // 4-byte Folded Reload
	tbnz	w8, #0, .LBB21_209
	b	.LBB21_287
.LBB21_274:                             //   in Loop: Header=BB21_1 Depth=1
	adrp	x1, .L.str.28
	adrp	x2, .L__func__.get_device_area
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.28
	add	x2, x2, :lo12:.L__func__.get_device_area
	mov	w3, w22
	bl	f2fs_printk
	adrp	x0, .L.str.29
	add	x0, x0, :lo12:.L.str.29
	bl	printk
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 1617; .short (1 << 0)|(((9) << 8)); .popsection; 14471: brk 0x800
	//NO_APP
	b	.LBB21_85
.LBB21_275:                             //   in Loop: Header=BB21_1 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_278
// %bb.276:                             //   in Loop: Header=BB21_1 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_278
// %bb.277:                             //   in Loop: Header=BB21_1 Depth=1
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.lookup_victim_by_age
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.lookup_victim_by_age
	mov	w3, #1536
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_278:                             //   in Loop: Header=BB21_1 Depth=1
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	b	.LBB21_210
.LBB21_279:                             //   in Loop: Header=BB21_1 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_282
// %bb.280:                             //   in Loop: Header=BB21_1 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_282
// %bb.281:                             //   in Loop: Header=BB21_1 Depth=1
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.release_victim_entry
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.release_victim_entry
	mov	w3, #1559
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_282:                             //   in Loop: Header=BB21_1 Depth=1
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	w8, [x19, #1840]
	cbz	w8, .LBB21_236
	b	.LBB21_351
.LBB21_283:                             //   in Loop: Header=BB21_1 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_286
// %bb.284:                             //   in Loop: Header=BB21_1 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_286
// %bb.285:                             //   in Loop: Header=BB21_1 Depth=1
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.release_victim_entry
	add	x1, x1, :lo12:.L.str.19
	add	x2, x2, :lo12:.L__func__.release_victim_entry
	mov	w3, #1560
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_286:                             //   in Loop: Header=BB21_1 Depth=1
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	x9, [sp, #96]           // 8-byte Folded Reload
	b	.LBB21_237
.LBB21_287:
	ldur	w10, [x29, #-56]
	ldr	w26, [sp, #112]         // 4-byte Folded Reload
	cmn	w10, #1                 // =1
	b.eq	.LBB21_306
.LBB21_288:
	ldur	w9, [x29, #-72]
	ldur	w8, [x29, #-96]
	udiv	w11, w10, w9
	mul	w9, w11, w9
	ldr	x11, [sp, #64]          // 8-byte Folded Reload
	str	w9, [x11]
.LBB21_289:
	cbnz	w8, .LBB21_308
// %bb.290:
	ldr	w8, [x19, #1192]
	cmp	w26, #1                 // =1
	udiv	w8, w10, w8
	b.ne	.LBB21_307
// %bb.291:
	str	w8, [x19, #1864]
	b	.LBB21_308
.LBB21_292:
	ldr	x8, [x19, #136]
	mov	w10, #48
	mul	x10, x11, x10
	ldr	x9, [x8]
	ldr	x9, [x9, #136]
	ldrh	w9, [x9, x10]
	tst	w9, #0xffc0
	b.eq	.LBB21_306
// %bb.293:
	ldr	x12, [x8, #24]
	ldr	w10, [x19, #1192]
	ldr	w13, [x12, #100]
	udiv	w9, w11, w10
	udiv	w13, w13, w10
	cmp	w13, w9
	b.eq	.LBB21_305
// %bb.294:
	ldr	w13, [x12, #220]
	udiv	w13, w13, w10
	cmp	w13, w9
	b.eq	.LBB21_305
// %bb.295:
	ldr	w13, [x12, #340]
	udiv	w13, w13, w10
	cmp	w13, w9
	b.eq	.LBB21_305
// %bb.296:
	ldr	w13, [x12, #460]
	udiv	w13, w13, w10
	cmp	w13, w9
	b.eq	.LBB21_305
// %bb.297:
	ldr	w13, [x12, #580]
	udiv	w13, w13, w10
	cmp	w13, w9
	b.eq	.LBB21_305
// %bb.298:
	ldr	w13, [x12, #700]
	udiv	w13, w13, w10
	cmp	w13, w9
	b.eq	.LBB21_305
// %bb.299:
	ldr	w13, [x12, #820]
	udiv	w13, w13, w10
	cmp	w13, w9
	b.eq	.LBB21_305
// %bb.300:
	ldr	w13, [x12, #940]
	udiv	w13, w13, w10
	cmp	w13, w9
	b.eq	.LBB21_305
// %bb.301:
	ldr	w13, [x12, #1060]
	udiv	w13, w13, w10
	cmp	w13, w9
	b.eq	.LBB21_305
// %bb.302:
	ldr	w13, [x12, #1180]
	udiv	w13, w13, w10
	cmp	w13, w9
	b.eq	.LBB21_305
// %bb.303:
	ldr	w12, [x12, #1300]
	udiv	w10, w12, w10
	cmp	w10, w9
	b.eq	.LBB21_305
// %bb.304:
	ldr	w23, [x19, #1864]
	cmp	w23, w9
	b.ne	.LBB21_323
.LBB21_305:
	ldr	x19, [sp, #32]          // 8-byte Folded Reload
	mov	w28, #-16
	b	.LBB21_318
.LBB21_306:
	ldr	x19, [sp, #32]          // 8-byte Folded Reload
	mov	w28, #-61
	b	.LBB21_318
.LBB21_307:
	ldr	x9, [sp, #16]           // 8-byte Folded Reload
	lsr	w10, w8, #6
	ldr	x9, [x9, #144]
	add	x9, x9, w10, uxtw #3
	mov	w10, #1
	lsl	x8, x10, x8
	//APP
	// atomic64_or
	prfm	pstl1strm, [x9]
1:	ldxr	x10, [x9]
	orr	x10, x10, x8
	stxr	w11, x10, [x9]
	cbnz	w11, 1b
	//NO_APP
	ldur	w8, [x29, #-56]
	cmn	w8, #1                  // =1
	b.eq	.LBB21_322
.LBB21_308:
	ldr	w23, [x19, #1864]
	mov	w28, wzr
	ldr	x8, [x19, #136]
.LBB21_309:
	ldp	x10, x9, [x8, #8]
	adrp	x8, __tracepoint_f2fs_get_victim
	add	x8, x8, :lo12:__tracepoint_f2fs_get_victim
	ldr	x19, [x19]
	ldr	w24, [x9, #140]
	ldr	w25, [x10, #4]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB21_317
// %bb.310:
	adrp	x10, cpu_number
	//APP
	.if 1 == 1
661:
	mrs x9, tpidr_el1
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 11
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	mrs x9, tpidr_el2
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	add	x10, x10, :lo12:cpu_number
	adrp	x11, __cpu_online_mask
	add	x11, x11, :lo12:__cpu_online_mask
	ldr	w9, [x9, x10]
	add	w10, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w10, w10, w9, lt
	asr	w10, w10, #6
	ldr	x10, [x11, w10, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB21_317
// %bb.311:
	//APP
	mrs x20, sp_el0
	//NO_APP
	ldr	w9, [x20, #80]
	add	w9, w9, #1              // =1
	str	w9, [x20, #80]
	//APP
	//NO_APP
	ldr	x21, [x8, #32]
	cbz	x21, .LBB21_314
// %bb.312:
	ldr	x8, [x21], #24
.LBB21_313:                             // =>This Inner Loop Header: Depth=1
	ldur	x0, [x21, #-16]
	sub	x4, x29, #96            // =96
	mov	x1, x19
	mov	w2, w22
	mov	w3, w26
	mov	w5, w23
	mov	w6, w24
	mov	w7, w25
	blr	x8
	ldr	x8, [x21], #24
	cbnz	x8, .LBB21_313
.LBB21_314:
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	ldr	x19, [sp, #32]          // 8-byte Folded Reload
	b.ne	.LBB21_318
// %bb.315:
	ldr	x8, [x20]
	tbz	w8, #1, .LBB21_318
// %bb.316:
	bl	preempt_schedule_notrace
	b	.LBB21_318
.LBB21_317:
	ldr	x19, [sp, #32]          // 8-byte Folded Reload
.LBB21_318:
	mov	x0, x19
	bl	mutex_unlock
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB21_324
// %bb.319:
	mov	w0, w28
	ldp	x20, x19, [sp, #304]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #288]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #272]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #256]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #240]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #224]    // 16-byte Folded Reload
	add	sp, sp, #320            // =320
	ret
.LBB21_320:
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	stur	w10, [x29, #-56]
	str	w10, [x9]
	mov	w9, #-1
	str	w9, [x19, #1872]
	b	.LBB21_289
.LBB21_321:
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	stur	w10, [x29, #-56]
	str	w10, [x9]
	mov	w9, #-1
	str	w9, [x19, #1876]
	b	.LBB21_289
.LBB21_322:
	ldr	x19, [sp, #32]          // 8-byte Folded Reload
	mov	w28, wzr
	b	.LBB21_318
.LBB21_323:
	ldr	x22, [sp, #56]          // 8-byte Folded Reload
	ldr	w26, [sp, #112]         // 4-byte Folded Reload
	stur	w11, [x29, #-56]
	b	.LBB21_309
.LBB21_324:
	bl	__stack_chk_fail
.LBB21_325:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_328
// %bb.326:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_328
// %bb.327:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.atssr_lookup_victim
	add	x1, x1, :lo12:.L.str.19
	mov	w3, #1500
	add	x2, x2, :lo12:.L__func__.atssr_lookup_victim
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_328:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 1500; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB21_329:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_332
// %bb.330:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_332
// %bb.331:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.get_gc_cost
	add	x1, x1, :lo12:.L.str.19
	mov	w3, #1279
	add	x2, x2, :lo12:.L__func__.get_gc_cost
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_332:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 1279; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB21_333:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 1536; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB21_334:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_337
// %bb.335:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_337
// %bb.336:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.atgc_lookup_victim
	add	x1, x1, :lo12:.L.str.19
	mov	w3, #1431
	add	x2, x2, :lo12:.L__func__.atgc_lookup_victim
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_337:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 1431; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB21_338:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_341
// %bb.339:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_341
// %bb.340:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.atgc_lookup_victim
	add	x1, x1, :lo12:.L.str.19
	mov	w3, #1437
	add	x2, x2, :lo12:.L__func__.atgc_lookup_victim
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_341:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 1437; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB21_342:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 1560; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB21_343:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_346
// %bb.344:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_346
// %bb.345:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.lookup_victim_by_age
	add	x1, x1, :lo12:.L.str.19
	mov	w3, #1543
	add	x2, x2, :lo12:.L__func__.lookup_victim_by_age
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_346:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 1543; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB21_347:
	adrp	x1, .L.str.27
	adrp	x2, .L__func__.get_device_area
	add	x1, x1, :lo12:.L.str.27
	add	x2, x2, :lo12:.L__func__.get_device_area
	mov	x0, x19
                                        // kill: def $w3 killed $w3 killed $x3
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_350
// %bb.348:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_350
// %bb.349:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.19
	adrp	x2, .L__func__.get_device_area
	add	x1, x1, :lo12:.L.str.19
	mov	w3, #1609
	add	x2, x2, :lo12:.L__func__.get_device_area
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_350:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 1609; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB21_351:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/gc.c"; .popsection; .long 14472b - 14470b; .short 1559; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end21:
	.size	get_victim_by_default, .Lfunc_end21-get_victim_by_default
                                        // -- End function
	.type	f2fs_init_gc_thread.__key,@object // @f2fs_init_gc_thread.__key
	.local	f2fs_init_gc_thread.__key
	.comm	f2fs_init_gc_thread.__key,1,1
	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"&gc_th->gc_wait_queue_head"
	.size	.L.str, 27

	.type	f2fs_init_gc_thread.__key.1,@object // @f2fs_init_gc_thread.__key.1
	.local	f2fs_init_gc_thread.__key.1
	.comm	f2fs_init_gc_thread.__key.1,1,1
	.type	.L.str.2,@object        // @.str.2
.L.str.2:
	.asciz	"&gc_th->fg_gc_wait"
	.size	.L.str.2, 19

	.type	.L.str.3,@object        // @.str.3
.L.str.3:
	.asciz	"f2fs_gc-%u:%u"
	.size	.L.str.3, 14

	.type	.L.str.4,@object        // @.str.4
.L.str.4:
	.asciz	"\0013f2fs_gc_loop same victim retry:%lu in %s:%d segno:%u type:%d blocks:%u free:%u prefree:%u rsvd:%u"
	.size	.L.str.4, 100

	.type	.L__func__.f2fs_gc,@object // @__func__.f2fs_gc
.L__func__.f2fs_gc:
	.asciz	"f2fs_gc"
	.size	.L__func__.f2fs_gc, 8

	.type	.L.str.5,@object        // @.str.5
.L.str.5:
	.asciz	"\0013%s: skip gc for encrpted inode\n"
	.size	.L.str.5, 34

	.type	.L.str.6,@object        // @.str.6
.L.str.6:
	.asciz	"f2fs_victim_entry"
	.size	.L.str.6, 18

	.type	victim_entry_slab,@object // @victim_entry_slab
	.local	victim_entry_slab
	.comm	victim_entry_slab,8,8
	.type	default_v_ops,@object   // @default_v_ops
	.section	.rodata,"a",@progbits
	.p2align	3
default_v_ops:
	.xword	get_victim_by_default
	.size	default_v_ops, 8

	.type	.L.str.7,@object        // @.str.7
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.7:
	.asciz	"\0013Should run fsck to repair first."
	.size	.L.str.7, 35

	.type	.L.str.8,@object        // @.str.8
.L.str.8:
	.asciz	"\0013Checkpoint should be enabled."
	.size	.L.str.8, 32

	.type	.L.str.9,@object        // @.str.9
.L.str.9:
	.asciz	"\0013resize_fs failed, should run fsck to repair!"
	.size	.L.str.9, 47

	.type	.L.str.10,@object       // @.str.10
.L.str.10:
	.asciz	"\0014migrate move bidx %u, err %d"
	.size	.L.str.10, 31

	.type	.L.str.11,@object       // @.str.11
.L.str.11:
	.asciz	"\0013sync filemap write err, ret %d"
	.size	.L.str.11, 33

	.type	.L.str.12,@object       // @.str.12
.L.str.12:
	.asciz	"\0013f2fs-gc: some signals have been received..."
	.size	.L.str.12, 46

	.type	.L.str.13,@object       // @.str.13
.L.str.13:
	.asciz	"\0015BG_GC: Size=%lluMB,Free=%lluMB,count=%d,free_sec=%u,reserved_sec=%u,node_secs=%d,dent_secs=%d"
	.size	.L.str.13, 96

	.type	.L.str.15,@object       // @.str.15
.L.str.15:
	.asciz	"\0015block_cnt[%d]: %d"
	.size	.L.str.15, 20

	.type	.L.str.16,@object       // @.str.16
.L.str.16:
	.asciz	"\0013Get free_segments dev %d is invalid."
	.size	.L.str.16, 39

	.type	.L.str.17,@object       // @.str.17
.L.str.17:
	.asciz	"\0013Inconsistent segment (%u) type [%d, %d] in SSA and SIT"
	.size	.L.str.17, 57

	.type	.L.str.18,@object       // @.str.18
.L.str.18:
	.asciz	"SBI_NEED_FSCK:%s:%d\n"
	.size	.L.str.18, 21

	.type	.L__func__.do_garbage_collect,@object // @__func__.do_garbage_collect
.L__func__.do_garbage_collect:
	.asciz	"do_garbage_collect"
	.size	.L__func__.do_garbage_collect, 19

	.type	.L.str.19,@object       // @.str.19
.L.str.19:
	.asciz	"F2FS bug: %s:%d\n"
	.size	.L.str.19, 17

	.type	.L__func__.sanity_check_seg_type,@object // @__func__.sanity_check_seg_type
.L__func__.sanity_check_seg_type:
	.asciz	"sanity_check_seg_type"
	.size	.L__func__.sanity_check_seg_type, 22

	.type	.L__func__.f2fs_put_page,@object // @__func__.f2fs_put_page
.L__func__.f2fs_put_page:
	.asciz	"f2fs_put_page"
	.size	.L__func__.f2fs_put_page, 14

	.type	.L.str.20,@object       // @.str.20
.L.str.20:
	.asciz	"\0013f2fs_gc_loop aborts from %s:%d"
	.size	.L.str.20, 33

	.type	.L__func__.gc_node_segment,@object // @__func__.gc_node_segment
.L__func__.gc_node_segment:
	.asciz	"gc_node_segment"
	.size	.L__func__.gc_node_segment, 16

	.type	.L__func__.gc_data_segment,@object // @__func__.gc_data_segment
.L__func__.gc_data_segment:
	.asciz	"gc_data_segment"
	.size	.L__func__.gc_data_segment, 16

	.type	.L.str.21,@object       // @.str.21
.L.str.21:
	.asciz	"\0014%s: valid data with mismatched node version."
	.size	.L.str.21, 47

	.type	.L__func__.is_alive,@object // @__func__.is_alive
.L__func__.is_alive:
	.asciz	"is_alive"
	.size	.L__func__.is_alive, 9

	.type	.L.str.22,@object       // @.str.22
.L.str.22:
	.asciz	"\0013mismatched blkaddr %u (source_blkaddr %u) in seg %u"
	.size	.L.str.22, 54

	.type	.L.str.23,@object       // @.str.23
.L.str.23:
	.asciz	"\0014fscrypt get encryption info error: skip inode->i_ino %lu"
	.size	.L.str.23, 59

	.type	.L__func__.move_data_block,@object // @__func__.move_data_block
.L__func__.move_data_block:
	.asciz	"move_data_block"
	.size	.L__func__.move_data_block, 16

	.type	.L.str.25,@object       // @.str.25
.L.str.25:
	.asciz	"\0015%s:single device gc can't cross device, ino %llu"
	.size	.L.str.25, 51

	.type	select_policy._rs,@object // @select_policy._rs
	.data
	.p2align	3
select_policy._rs:
	.zero	4
	.word	1250                    // 0x4e2
	.word	10                      // 0xa
	.word	0                       // 0x0
	.word	0                       // 0x0
	.zero	4
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.size	select_policy._rs, 40

	.type	.L__func__.select_policy,@object // @__func__.select_policy
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__func__.select_policy:
	.asciz	"select_policy"
	.size	.L__func__.select_policy, 14

	.type	.L.str.26,@object       // @.str.26
.L.str.26:
	.asciz	"\0013%s: F2fs: type %d dirty_type %d is unexpected.\n"
	.size	.L.str.26, 50

	.type	.L.str.27,@object       // @.str.27
.L.str.27:
	.asciz	"\0013%s: gc error, dev %u"
	.size	.L.str.27, 23

	.type	.L__func__.get_device_area,@object // @__func__.get_device_area
.L__func__.get_device_area:
	.asciz	"get_device_area"
	.size	.L__func__.get_device_area, 16

	.type	.L.str.28,@object       // @.str.28
.L.str.28:
	.asciz	"\0013%s: type %d is unexpected in get_victim and not in gc"
	.size	.L.str.28, 56

	.type	.L.str.29,@object       // @.str.29
.L.str.29:
	.asciz	"\0014------------[ cut here ]------------\n"
	.size	.L.str.29, 40

	.type	.L__func__.get_gc_cost,@object // @__func__.get_gc_cost
.L__func__.get_gc_cost:
	.asciz	"get_gc_cost"
	.size	.L__func__.get_gc_cost, 12

	.type	.L__func__.lookup_victim_by_age,@object // @__func__.lookup_victim_by_age
.L__func__.lookup_victim_by_age:
	.asciz	"lookup_victim_by_age"
	.size	.L__func__.lookup_victim_by_age, 21

	.type	.L__func__.atgc_lookup_victim,@object // @__func__.atgc_lookup_victim
.L__func__.atgc_lookup_victim:
	.asciz	"atgc_lookup_victim"
	.size	.L__func__.atgc_lookup_victim, 19

	.type	.L__func__.atssr_lookup_victim,@object // @__func__.atssr_lookup_victim
.L__func__.atssr_lookup_victim:
	.asciz	"atssr_lookup_victim"
	.size	.L__func__.atssr_lookup_victim, 20

	.type	.L__func__.release_victim_entry,@object // @__func__.release_victim_entry
.L__func__.release_victim_entry:
	.asciz	"release_victim_entry"
	.size	.L__func__.release_victim_entry, 21

	.type	.L.str.30,@object       // @.str.30
.L.str.30:
	.asciz	"\0013cp_rwsem_timeout: start: %lu now: %lu\n"
	.size	.L.str.30, 41

	.type	.L__const.free_segment_range.cpc,@object // @__const.free_segment_range.cpc
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	3
.L__const.free_segment_range.cpc:
	.word	128                     // 0x80
	.zero	4
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.size	.L__const.free_segment_range.cpc, 32

	.type	.L.str.31,@object       // @.str.31
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.31:
	.asciz	"\0013segno %u should be free but still inuse!"
	.size	.L.str.31, 43

	.type	.L__func__.free_segment_range,@object // @__func__.free_segment_range
.L__func__.free_segment_range:
	.asciz	"free_segment_range"
	.size	.L__func__.free_segment_range, 19

	.type	.L__func__.move_data_page,@object // @__func__.move_data_page
.L__func__.move_data_page:
	.asciz	"move_data_page"
	.size	.L__func__.move_data_page, 15

	.type	.L.str.32,@object       // @.str.32
.L.str.32:
	.asciz	"\0013f2fs_gc_loop nomem retry:%lu in %s:%d"
	.size	.L.str.32, 40

	.type	.L.str.33,@object       // @.str.33
.L.str.33:
	.asciz	"\0014map err %d lblk %u, pblk %u, len %u"
	.size	.L.str.33, 38

	.type	.L.str.34,@object       // @.str.34
.L.str.34:
	.asciz	"\0014migrate: signal received when move bidx %u, submitted %d"
	.size	.L.str.34, 59

	.type	.Lswitch.table.get_victim_by_default,@object // @switch.table.get_victim_by_default
	.section	.rodata,"a",@progbits
	.p2align	2
.Lswitch.table.get_victim_by_default:
	.word	0                       // 0x0
	.word	1                       // 0x1
	.word	0                       // 0x0
	.word	2                       // 0x2
	.word	1                       // 0x1
	.size	.Lswitch.table.get_victim_by_default, 20

	.ident	"Snapdragon LLVM ARM Compiler 10.0.7 for Android NDK"
	.section	".note.GNU-stack","",@progbits
