	.text
	.file	"segment.c"
	.globl	__find_rev_next_bit     // -- Begin function __find_rev_next_bit
	.p2align	3
	.type	__find_rev_next_bit,@function
__find_rev_next_bit:                    // @__find_rev_next_bit
// %bb.0:
	cmp	x2, x1
	b.hs	.LBB0_7
// %bb.1:
	lsr	x11, x2, #6
	and	x9, x2, #0xffffffffffffffc0
	neg	x8, x11, lsl #6
	sub	x9, x9, x1
	add	x11, x0, x11, lsl #3
	and	x10, x2, #0x3f
	add	x9, x9, #64             // =64
	add	x11, x11, #3            // =3
	mov	x12, #-1
.LBB0_2:                                // =>This Inner Loop Header: Depth=1
	ldur	x14, [x11, #-3]
	add	x13, x1, x8
	cbz	x14, .LBB0_4
// %bb.3:                               //   in Loop: Header=BB0_2 Depth=1
	ldurb	w15, [x11, #-2]
	lsl	x14, x14, #56
	ldurb	w16, [x11, #-1]
	cmp	x13, #64                // =64
	ldrb	w17, [x11]
	lsr	x10, x12, x10
	ldrb	w18, [x11, #1]
	bfi	x14, x15, #48, #8
	ldrb	w15, [x11, #2]
	bfi	x14, x16, #40, #8
	ldrb	w16, [x11, #3]
	bfi	x14, x17, #32, #8
	ldrb	w17, [x11, #4]
	bfi	x14, x18, #24, #8
	bfi	x14, x15, #16, #8
	lsl	x15, x12, x9
	bfi	x14, x16, #8, #8
	csinv	x15, x15, xzr, lo
	orr	x14, x14, x17
	and	x10, x15, x10
	ands	x10, x10, x14
	b.ne	.LBB0_6
.LBB0_4:                                //   in Loop: Header=BB0_2 Depth=1
	cmp	x13, #65                // =65
	b.lo	.LBB0_7
// %bb.5:                               //   in Loop: Header=BB0_2 Depth=1
	mov	x10, xzr
	sub	x8, x8, #64             // =64
	add	x9, x9, #64             // =64
	add	x11, x11, #8            // =8
	b	.LBB0_2
.LBB0_6:
	lsr	x9, x10, #32
	cmp	x9, #0                  // =0
	cset	w11, eq
	csel	x9, x10, x9, eq
	mov	w12, #16
	tst	x9, #0xffff0000
	lsl	w10, w11, #5
	bfi	w12, w11, #5, #1
	lsr	x11, x9, #16
	csel	x9, x9, x11, eq
	csel	w10, w12, w10, eq
	tst	x9, #0xff00
	orr	w11, w10, #0x8
	lsr	x12, x9, #8
	csel	x9, x9, x12, eq
	csel	w10, w11, w10, eq
	tst	x9, #0xf0
	orr	w11, w10, #0x4
	lsr	x12, x9, #4
	csel	x9, x9, x12, eq
	csel	w10, w11, w10, eq
	tst	x9, #0xc
	ubfx	x11, x9, #2, #30
	csel	w9, w9, w11, eq
	add	w11, w10, #2            // =2
	mov	w12, #1
	csel	w10, w11, w10, eq
	bic	w9, w12, w9, lsr #1
	add	w9, w9, w10
	sxtw	x9, w9
	sub	x1, x9, x8
.LBB0_7:
	mov	x0, x1
	ret
.Lfunc_end0:
	.size	__find_rev_next_bit, .Lfunc_end0-__find_rev_next_bit
                                        // -- End function
	.globl	__find_rev_next_zero_bit // -- Begin function __find_rev_next_zero_bit
	.p2align	3
	.type	__find_rev_next_zero_bit,@function
__find_rev_next_zero_bit:               // @__find_rev_next_zero_bit
// %bb.0:
	cmp	x2, x1
	b.hs	.LBB1_7
// %bb.1:
	lsr	x9, x2, #6
	and	x11, x2, #0x3f
	neg	x8, x9, lsl #6
	add	x9, x0, x9, lsl #3
	add	x9, x9, #3              // =3
	mov	x10, #-1
.LBB1_2:                                // =>This Inner Loop Header: Depth=1
	ldur	x13, [x9, #-3]
	add	x12, x1, x8
	cmn	x13, #1                 // =1
	b.eq	.LBB1_4
// %bb.3:                               //   in Loop: Header=BB1_2 Depth=1
	neg	x14, x11
	cmp	x11, #0                 // =0
	ldurb	w15, [x9, #-2]
	ldurb	w16, [x9, #-1]
	lsl	x11, x10, x14
	lsr	x14, x10, x12
	csel	x11, xzr, x11, eq
	cmp	x12, #64                // =64
	csel	x14, x14, xzr, lo
	ldrb	w17, [x9]
	orr	x11, x11, x14
	ldrb	w14, [x9, #1]
	orr	x11, x11, x13, lsl #56
	ldrb	w13, [x9, #2]
	orr	x11, x11, x15, lsl #48
	ldrb	w15, [x9, #3]
	orr	x11, x11, x16, lsl #40
	ldrb	w16, [x9, #4]
	orr	x11, x11, x17, lsl #32
	orr	x11, x11, x14, lsl #24
	orr	x11, x11, x13, lsl #16
	orr	x11, x11, x15, lsl #8
	orr	x11, x11, x16
	cmn	x11, #1                 // =1
	b.ne	.LBB1_6
.LBB1_4:                                //   in Loop: Header=BB1_2 Depth=1
	cmp	x12, #65                // =65
	b.lo	.LBB1_7
// %bb.5:                               //   in Loop: Header=BB1_2 Depth=1
	mov	x11, xzr
	sub	x8, x8, #64             // =64
	add	x9, x9, #8              // =8
	b	.LBB1_2
.LBB1_6:
	mov	x9, #-4294967297
	mov	w12, #16
	cmp	x11, x9
	mvn	x9, x11
	cset	w10, hi
	lsr	x9, x9, #32
	csinv	x9, x9, x11, ls
	lsl	w11, w10, #5
	tst	x9, #0xffff0000
	bfi	w12, w10, #5, #1
	lsr	x10, x9, #16
	csel	x9, x9, x10, eq
	csel	w11, w12, w11, eq
	tst	x9, #0xff00
	orr	w10, w11, #0x8
	lsr	x12, x9, #8
	csel	x9, x9, x12, eq
	csel	w10, w10, w11, eq
	tst	x9, #0xf0
	orr	w11, w10, #0x4
	lsr	x12, x9, #4
	csel	x9, x9, x12, eq
	csel	w10, w11, w10, eq
	tst	x9, #0xc
	ubfx	x11, x9, #2, #30
	csel	w9, w9, w11, eq
	add	w11, w10, #2            // =2
	mov	w12, #1
	csel	w10, w11, w10, eq
	bic	w9, w12, w9, lsr #1
	add	w9, w9, w10
	sxtw	x9, w9
	sub	x1, x9, x8
.LBB1_7:
	mov	x0, x1
	ret
.Lfunc_end1:
	.size	__find_rev_next_zero_bit, .Lfunc_end1-__find_rev_next_zero_bit
                                        // -- End function
	.globl	find_next_free_extent   // -- Begin function find_next_free_extent
	.p2align	3
	.type	find_next_free_extent,@function
find_next_free_extent:                  // @find_next_free_extent
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x2
	ldr	x2, [x2]
	mov	x20, x1
	mov	x22, x0
	bl	__find_rev_next_zero_bit
	cmp	x0, x20
	b.hs	.LBB2_2
// %bb.1:
	mov	x21, x0
	mov	x0, x22
	mov	x1, x20
	mov	x2, x21
	bl	__find_rev_next_bit
	mov	x8, x0
	sub	w0, w8, w21
	str	x8, [x19]
	b	.LBB2_3
.LBB2_2:
	mov	w0, #-12
.LBB2_3:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end2:
	.size	find_next_free_extent, .Lfunc_end2-find_next_free_extent
                                        // -- End function
	.globl	f2fs_need_SSR           // -- Begin function f2fs_need_SSR
	.p2align	3
	.type	f2fs_need_SSR,@function
f2fs_need_SSR:                          // @f2fs_need_SSR
// %bb.0:
	ldr	w8, [x0, #1192]
	ldr	w13, [x0, #1188]
	ldrsw	x10, [x0, #1284]
	ldr	w9, [x0, #1184]
	ldrsw	x12, [x0, #1272]
	ldrsw	x11, [x0, #1296]
	ldr	w14, [x0, #1504]
	cmp	w14, #1                 // =1
	b.ne	.LBB3_2
// %bb.1:
	mov	w0, wzr
	ret
.LBB3_2:
	ldr	w14, [x0, #1868]
	cmp	w14, #5                 // =5
	b.ne	.LBB3_5
// %bb.3:
	ldrb	w14, [x0, #1232]
	tbnz	w14, #3, .LBB3_5
.LBB3_4:
	mov	w0, #1
	ret
.LBB3_5:
	ldr	x14, [x0, #80]
	tbnz	w14, #8, .LBB3_4
// %bb.6:
	mul	w13, w13, w8
	ldr	x14, [x0, #136]
	sub	x13, x13, #1            // =1
	add	x12, x13, x12
	add	x10, x13, x10
	asr	x12, x12, x9
	asr	x10, x10, x9
	udiv	w12, w12, w8
	add	x11, x13, x11
	ldr	x13, [x14, #8]
	udiv	w10, w10, w8
	asr	x9, x11, x9
	ldr	w15, [x14, #156]
	udiv	w16, w9, w8
	ldr	w11, [x14, #100]
	add	w10, w10, w12, lsl #1
	ldr	w9, [x13, #8]
	add	w10, w10, w16
	add	w10, w10, w15
	cmn	w11, #1                 // =1
	b.eq	.LBB3_8
// %bb.7:
	udiv	w8, w11, w8
	b	.LBB3_9
.LBB3_8:
	mov	w8, #-1
.LBB3_9:
	add	w8, w10, w8
	cmp	w9, w8
	cset	w0, ls
	ret
.Lfunc_end3:
	.size	f2fs_need_SSR, .Lfunc_end3-f2fs_need_SSR
                                        // -- End function
	.globl	get_device_main_seg     // -- Begin function get_device_main_seg
	.p2align	3
	.type	get_device_main_seg,@function
get_device_main_seg:                    // @get_device_main_seg
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	cmp	w1, #1                  // =1
	mov	x29, sp
	b.eq	.LBB4_3
// %bb.1:
	mov	w2, w1
	cbnz	w1, .LBB4_4
// %bb.2:
	ldr	x8, [x0, #136]
	ldr	x9, [x0, #3032]
	ldr	w8, [x8, #96]
	ldr	w9, [x9, #264]
	sub	w0, w8, w9
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.LBB4_3:
	ldr	x8, [x0, #3032]
	ldr	w0, [x8, #264]
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.LBB4_4:
	adrp	x1, .L.str
	add	x1, x1, :lo12:.L.str
	bl	f2fs_printk
	mov	w0, wzr
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end4:
	.size	get_device_main_seg, .Lfunc_end4-get_device_main_seg
                                        // -- End function
	.globl	f2fs_dm_should_change_curseg // -- Begin function f2fs_dm_should_change_curseg
	.p2align	3
	.type	f2fs_dm_should_change_curseg,@function
f2fs_dm_should_change_curseg:           // @f2fs_dm_should_change_curseg
// %bb.0:
	ldr	w8, [x0, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB5_10
// %bb.1:
	ldr	x8, [x0, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB5_10
// %bb.2:
	cmp	w1, #3                  // =3
	b.hs	.LBB5_4
// %bb.3:
	mov	w8, wzr
	b	.LBB5_6
.LBB5_4:
	sub	w8, w1, #6              // =6
	cmp	w8, #2                  // =2
	b.hi	.LBB5_10
// %bb.5:
	mov	w8, #1
.LBB5_6:
	ldr	x9, [x0, #3032]
	mov	w10, #192
	umaddl	x11, w8, w10, x9
	ldr	w11, [x11, #168]
	cbz	w11, .LBB5_11
// %bb.7:
	eor	w11, w8, #0x1
	umaddl	x10, w11, w10, x9
	ldr	w10, [x10, #168]
	cbz	w10, .LBB5_10
// %bb.8:
	cbz	x8, .LBB5_12
// %bb.9:
	ldr	w10, [x9, #264]
	b	.LBB5_13
.LBB5_10:
	mov	w0, wzr
	ret
.LBB5_11:
	mov	w0, #1
	ret
.LBB5_12:
	ldr	x10, [x0, #136]
	ldr	w11, [x9, #264]
	ldr	w10, [x10, #96]
	sub	w10, w10, w11
.LBB5_13:
	mov	w11, #192
	madd	x8, x8, x11, x9
	ldr	w9, [x0, #1188]
	ldr	w11, [x8, #184]
	ldr	w8, [x8, #172]
	neg	w11, w11
	lsr	w8, w8, #1
	madd	w10, w9, w10, w11
	mul	w8, w8, w9
	cmp	w10, w8
	cset	w0, ls
	ret
.Lfunc_end5:
	.size	f2fs_dm_should_change_curseg, .Lfunc_end5-f2fs_dm_should_change_curseg
                                        // -- End function
	.globl	f2fs_register_inmem_page // -- Begin function f2fs_register_inmem_page
	.p2align	3
	.type	f2fs_register_inmem_page,@function
f2fs_register_inmem_page:               // @f2fs_register_inmem_page
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x1
	ldr	x8, [x1]
	mov	x20, x0
	tbnz	w8, #13, .LBB6_2
// %bb.1:
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
.LBB6_2:
	adrp	x9, inmem_entry_slab
	add	x8, x19, #40            // =40
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, 1
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	mov	w23, #64
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, 2
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	movk	w23, #96, lsl #16
	ldr	x22, [x9, :lo12:inmem_entry_slab]
	mov	w1, w23
	mov	x0, x22
	bl	kmem_cache_alloc
	mov	x21, x0
	cbnz	x0, .LBB6_4
// %bb.3:
	add	w1, w23, #2048          // =2048
	mov	x0, x22
	bl	kmem_cache_alloc
	mov	x21, x0
.LBB6_4:
	stp	x21, x19, [x21, #8]
	add	x22, x20, #928          // =928
	str	x21, [x21]
	mov	x0, x22
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
	bl	mutex_lock
	ldr	x23, [x20, #912]
	add	x24, x20, #904          // =904
	mov	x0, x21
	mov	x2, x24
	mov	x1, x23
	bl	__list_add_valid
	tbz	w0, #0, .LBB6_6
// %bb.5:
	str	x21, [x20, #912]
	stp	x24, x23, [x21]
	str	x21, [x23]
.LBB6_6:
	ldr	x8, [x20, #40]
	mov	x0, x22
	ldr	x8, [x8, #1104]
	add	x8, x8, #1292           // =1292
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	mutex_unlock
	adrp	x8, __tracepoint_f2fs_register_inmem_page
	add	x8, x8, :lo12:__tracepoint_f2fs_register_inmem_page
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB6_13
// %bb.7:
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
	tbz	w9, #0, .LBB6_13
// %bb.8:
	//APP
	mrs x21, sp_el0
	//NO_APP
	ldr	w9, [x21, #80]
	add	w9, w9, #1              // =1
	str	w9, [x21, #80]
	//APP
	//NO_APP
	ldr	x22, [x8, #32]
	cbz	x22, .LBB6_11
// %bb.9:
	ldr	x8, [x22], #24
	mov	w20, #5
.LBB6_10:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x22, #-16]
	mov	x1, x19
	mov	w2, w20
	blr	x8
	ldr	x8, [x22], #24
	cbnz	x8, .LBB6_10
.LBB6_11:
	//APP
	//NO_APP
	ldr	w8, [x21, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x21, #80]
	b.ne	.LBB6_13
// %bb.12:
	ldr	x8, [x21]
	tbnz	w8, #1, .LBB6_14
.LBB6_13:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB6_14:
	bl	preempt_schedule_notrace
	b	.LBB6_13
.Lfunc_end6:
	.size	f2fs_register_inmem_page, .Lfunc_end6-f2fs_register_inmem_page
                                        // -- End function
	.globl	f2fs_drop_inmem_pages_all // -- Begin function f2fs_drop_inmem_pages_all
	.p2align	3
	.type	f2fs_drop_inmem_pages_all,@function
f2fs_drop_inmem_pages_all:              // @f2fs_drop_inmem_pages_all
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	mov	w23, w1
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	add	x21, x0, #1000          // =1000
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	add	x20, x0, #1028          // =1028
	mov	x19, x0
	ldr	w26, [x0, #1880]
	mov	x0, x20
	bl	_raw_spin_lock
	ldr	x22, [x19, #1000]
	cmp	x21, x22
	b.eq	.LBB7_14
// %bb.1:
	tbz	w23, #0, .LBB7_16
// %bb.2:
	mov	w27, wzr
	mov	w23, #5
	mov	w28, #536870912
.LBB7_3:                                // =>This Inner Loop Header: Depth=1
	sub	x0, x22, #888           // =888
	bl	igrab
	cbz	x0, .LBB7_11
// %bb.4:                               //   in Loop: Header=BB7_3 Depth=1
	mov	x24, x0
	mov	x0, x22
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB7_6
// %bb.5:                               //   in Loop: Header=BB7_3 Depth=1
	ldp	x9, x8, [x22]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB7_6:                                //   in Loop: Header=BB7_3 Depth=1
	ldr	x25, [x19, #1008]
	mov	x0, x22
	mov	x2, x21
	mov	x1, x25
	bl	__list_add_valid
	tbz	w0, #0, .LBB7_8
// %bb.7:                               //   in Loop: Header=BB7_3 Depth=1
	str	x22, [x19, #1008]
	stp	x21, x25, [x22]
	str	x22, [x25]
.LBB7_8:                                //   in Loop: Header=BB7_3 Depth=1
	mov	x0, x20
	bl	_raw_spin_unlock
	ldur	w8, [x22, #-188]
	cbz	w8, .LBB7_10
// %bb.9:                               //   in Loop: Header=BB7_3 Depth=1
	mov	x0, x24
	add	x8, x24, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, x28
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_drop_inmem_pages
.LBB7_10:                               //   in Loop: Header=BB7_3 Depth=1
	mov	x0, x24
	bl	iput
	b	.LBB7_12
.LBB7_11:                               //   in Loop: Header=BB7_3 Depth=1
	mov	x0, x20
	bl	_raw_spin_unlock
.LBB7_12:                               //   in Loop: Header=BB7_3 Depth=1
	mov	w0, wzr
	mov	x1, x23
	bl	congestion_wait
	add	w27, w27, #1            // =1
	cmp	w27, w26
	b.hs	.LBB7_15
// %bb.13:                              //   in Loop: Header=BB7_3 Depth=1
	mov	x0, x20
	bl	_raw_spin_lock
	ldr	x22, [x21]
	cmp	x21, x22
	b.ne	.LBB7_3
.LBB7_14:
	mov	x0, x20
	bl	_raw_spin_unlock
.LBB7_15:
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB7_16:
	mov	w23, #5
	mov	w26, #536870912
	b	.LBB7_19
.LBB7_17:                               //   in Loop: Header=BB7_19 Depth=1
	mov	x0, x20
	bl	_raw_spin_unlock
	mov	x0, x24
	add	x8, x24, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, x26
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_drop_inmem_pages
	mov	x0, x24
	bl	iput
.LBB7_18:                               //   in Loop: Header=BB7_19 Depth=1
	mov	w0, wzr
	mov	x1, x23
	bl	congestion_wait
	mov	x0, x20
	bl	_raw_spin_lock
	ldr	x22, [x21]
	cmp	x21, x22
	b.eq	.LBB7_14
.LBB7_19:                               // =>This Inner Loop Header: Depth=1
	sub	x0, x22, #888           // =888
	bl	igrab
	cbz	x0, .LBB7_24
// %bb.20:                              //   in Loop: Header=BB7_19 Depth=1
	mov	x24, x0
	mov	x0, x22
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB7_22
// %bb.21:                              //   in Loop: Header=BB7_19 Depth=1
	ldp	x9, x8, [x22]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB7_22:                               //   in Loop: Header=BB7_19 Depth=1
	ldr	x25, [x19, #1008]
	mov	x0, x22
	mov	x2, x21
	mov	x1, x25
	bl	__list_add_valid
	tbz	w0, #0, .LBB7_17
// %bb.23:                              //   in Loop: Header=BB7_19 Depth=1
	str	x22, [x19, #1008]
	stp	x21, x25, [x22]
	str	x22, [x25]
	b	.LBB7_17
.LBB7_24:                               //   in Loop: Header=BB7_19 Depth=1
	mov	x0, x20
	bl	_raw_spin_unlock
	b	.LBB7_18
.Lfunc_end7:
	.size	f2fs_drop_inmem_pages_all, .Lfunc_end7-f2fs_drop_inmem_pages_all
                                        // -- End function
	.globl	f2fs_drop_inmem_pages   // -- Begin function f2fs_drop_inmem_pages
	.p2align	3
	.type	f2fs_drop_inmem_pages,@function
f2fs_drop_inmem_pages:                  // @f2fs_drop_inmem_pages
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	add	x19, x0, #928           // =928
	ldr	x8, [x0, #40]
	mov	x20, x0
	str	x23, [sp, #16]          // 8-byte Folded Spill
	mov	x0, x19
	ldr	x23, [x8, #1104]
	bl	mutex_lock
	ldr	x8, [x20, #904]
	add	x21, x20, #904          // =904
	cmp	x8, x21
	b.eq	.LBB8_2
.LBB8_1:                                // =>This Inner Loop Header: Depth=1
	mov	x0, x20
	mov	x1, x21
	mov	w2, #1
	mov	w3, wzr
	mov	w4, #1
	bl	__revoke_inmem_pages
	mov	x0, x19
	bl	mutex_unlock
	mov	x0, x19
	bl	mutex_lock
	ldr	x8, [x20, #904]
	cmp	x8, x21
	b.ne	.LBB8_1
.LBB8_2:
	add	x21, x23, #1028         // =1028
	str	wzr, [x20, #700]
	mov	x0, x21
	bl	_raw_spin_lock
	ldr	x8, [x20, #888]
	add	x22, x20, #888          // =888
	cmp	x8, x22
	b.eq	.LBB8_6
// %bb.3:
	mov	x0, x22
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB8_5
// %bb.4:
	ldp	x9, x8, [x22]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB8_5:
	str	x22, [x22]
	str	x22, [x22, #8]
.LBB8_6:
	ldr	x8, [x20, #712]
	sxth	w8, w8
	tbz	w8, #31, .LBB8_8
// %bb.7:
	add	x8, x20, #712           // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 32768
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	w8, [x23, #1880]
	sub	w8, w8, #1              // =1
	str	w8, [x23, #1880]
.LBB8_8:
	mov	x0, x21
	bl	_raw_spin_unlock
	mov	x0, x19
	bl	mutex_unlock
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end8:
	.size	f2fs_drop_inmem_pages, .Lfunc_end8-f2fs_drop_inmem_pages
                                        // -- End function
	.p2align	3               // -- Begin function __revoke_inmem_pages
	.type	__revoke_inmem_pages,@function
__revoke_inmem_pages:                   // @__revoke_inmem_pages
// %bb.0:
	sub	sp, sp, #208            // =208
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #112]    // 16-byte Folded Spill
	add	x29, sp, #112           // =112
	stp	x28, x27, [sp, #128]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #144]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #160]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #176]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #192]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	x25, [x1]
	cmp	x25, x1
	b.eq	.LBB9_106
// %bb.1:
	ldr	x8, [x0, #40]
	orr	w10, w2, w3
	add	x9, sp, #48             // =48
	mov	w23, w4
	mov	x22, x1
	mov	x24, x0
	stp	w10, w3, [sp, #20]      // 8-byte Folded Spill
	mov	w28, wzr
	ldr	x8, [x8, #1104]
	add	x26, x9, #8             // =8
	mov	w27, #5
	//APP
	mrs x21, sp_el0
	//NO_APP
	str	w4, [sp, #16]           // 4-byte Folded Spill
	str	w2, [sp, #28]           // 4-byte Folded Spill
	str	x8, [sp, #8]            // 8-byte Folded Spill
	b	.LBB9_5
.LBB9_2:                                //   in Loop: Header=BB9_5 Depth=1
	mov	x9, #256
	mov	x1, x25
	movk	x9, #57005, lsl #48
	add	x8, x9, #256            // =256
	stp	x9, x8, [x25]
	adrp	x8, inmem_entry_slab
	ldr	x0, [x8, :lo12:inmem_entry_slab]
	bl	kmem_cache_free
	ldr	x8, [x24, #40]
	ldr	x8, [x8, #1104]
	add	x8, x8, #1292           // =1292
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB9_3:                                //   in Loop: Header=BB9_5 Depth=1
	ldr	w2, [sp, #28]           // 4-byte Folded Reload
.LBB9_4:                                //   in Loop: Header=BB9_5 Depth=1
	mov	x25, x20
	cmp	x20, x22
	b.eq	.LBB9_107
.LBB9_5:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB9_9 Depth 2
                                        //     Child Loop BB9_22 Depth 2
                                        //     Child Loop BB9_27 Depth 2
	ldr	x20, [x25]
	ldr	x19, [x25, #16]
	tbz	w2, #0, .LBB9_12
// %bb.6:                               //   in Loop: Header=BB9_5 Depth=1
	adrp	x8, __tracepoint_f2fs_commit_inmem_page
	add	x8, x8, :lo12:__tracepoint_f2fs_commit_inmem_page
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB9_12
// %bb.7:                               //   in Loop: Header=BB9_5 Depth=1
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
	tbz	w8, #0, .LBB9_12
// %bb.8:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	w8, [x21, #80]
	add	w8, w8, #1              // =1
	str	w8, [x21, #80]
	adrp	x8, __tracepoint_f2fs_commit_inmem_page
	add	x8, x8, :lo12:__tracepoint_f2fs_commit_inmem_page
	//APP
	//NO_APP
	ldr	x23, [x8, #32]
	cbz	x23, .LBB9_10
.LBB9_9:                                //   Parent Loop BB9_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x8, x0, [x23]
	mov	x1, x19
	mov	w2, #6
	blr	x8
	ldr	x8, [x23, #24]!
	cbnz	x8, .LBB9_9
.LBB9_10:                               //   in Loop: Header=BB9_5 Depth=1
	//APP
	//NO_APP
	ldr	w8, [x21, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x21, #80]
	ldr	w23, [sp, #16]          // 4-byte Folded Reload
	ldr	w2, [sp, #28]           // 4-byte Folded Reload
	b.ne	.LBB9_12
// %bb.11:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x21]
	tbnz	w8, #1, .LBB9_99
.LBB9_12:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	tbz	w23, #0, .LBB9_15
// %bb.13:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	x9, [x8]
	str	x9, [sp, #48]
	ldr	x9, [sp, #48]
	tbnz	w9, #0, .LBB9_4
// %bb.14:                              //   in Loop: Header=BB9_5 Depth=1
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x8]
1:	ldaxr	x9, [x8]
	orr	x10, x9, 1
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	
	//NO_APP
	tbnz	w9, #0, .LBB9_3
	b	.LBB9_18
.LBB9_15:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x9, [x8]
	str	x9, [sp, #48]
	ldr	x9, [sp, #48]
	tbnz	w9, #0, .LBB9_17
// %bb.16:                              //   in Loop: Header=BB9_5 Depth=1
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x8]
1:	ldaxr	x9, [x8]
	orr	x10, x9, 1
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	
	//NO_APP
	tbz	w9, #0, .LBB9_18
.LBB9_17:                               //   in Loop: Header=BB9_5 Depth=1
	mov	x0, x19
	bl	__lock_page
.LBB9_18:                               //   in Loop: Header=BB9_5 Depth=1
	mov	x0, x19
	mov	w1, wzr
	mov	w2, #1
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
	ldr	w8, [sp, #24]           // 4-byte Folded Reload
	tbz	w8, #0, .LBB9_33
// %bb.19:                              //   in Loop: Header=BB9_5 Depth=1
	adrp	x8, __tracepoint_f2fs_commit_inmem_page
	add	x8, x8, :lo12:__tracepoint_f2fs_commit_inmem_page
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB9_27
// %bb.20:                              //   in Loop: Header=BB9_5 Depth=1
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
	tbz	w8, #0, .LBB9_27
// %bb.21:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	w8, [x21, #80]
	add	w8, w8, #1              // =1
	str	w8, [x21, #80]
	adrp	x8, __tracepoint_f2fs_commit_inmem_page
	add	x8, x8, :lo12:__tracepoint_f2fs_commit_inmem_page
	//APP
	//NO_APP
	ldr	x23, [x8, #32]
	cbz	x23, .LBB9_23
.LBB9_22:                               //   Parent Loop BB9_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x8, x0, [x23]
	mov	x1, x19
	mov	w2, #8
	blr	x8
	ldr	x8, [x23, #24]!
	cbnz	x8, .LBB9_22
.LBB9_23:                               //   in Loop: Header=BB9_5 Depth=1
	//APP
	//NO_APP
	ldr	w8, [x21, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x21, #80]
	ldr	w23, [sp, #16]          // 4-byte Folded Reload
	b.ne	.LBB9_27
// %bb.24:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x21]
	tbz	w8, #1, .LBB9_27
// %bb.25:                              //   in Loop: Header=BB9_5 Depth=1
	bl	preempt_schedule_notrace
	b	.LBB9_27
.LBB9_26:                               //   in Loop: Header=BB9_27 Depth=2
	mov	w0, wzr
	mov	x1, x27
	bl	congestion_wait
.LBB9_27:                               //   Parent Loop BB9_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x0, sp, #48             // =48
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	ldr	x1, [x19, #32]
	add	x0, sp, #48             // =48
	mov	w2, #1
	str	x24, [sp, #48]
	stp	xzr, xzr, [x26]
	str	wzr, [x26, #16]
	bl	f2fs_get_dnode_of_data
	cmn	w0, #12                 // =12
	b.eq	.LBB9_26
// %bb.28:                              //   in Loop: Header=BB9_5 Depth=1
	cbnz	w0, .LBB9_32
// %bb.29:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	w1, [sp, #72]
	add	x2, sp, #32             // =32
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	mov	w3, wzr
	bl	get_node_info_ex
	cbnz	w0, .LBB9_109
// %bb.30:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	w28, [x25, #24]
	ldr	w2, [sp, #84]
	cmn	w28, #1                 // =1
	b.eq	.LBB9_38
// %bb.31:                              //   in Loop: Header=BB9_5 Depth=1
	ldp	w8, w9, [sp, #72]
	sub	x1, x29, #16            // =16
	mov	w3, w28
	ldrb	w10, [sp, #44]
	mov	w4, #1
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	mov	w5, #1
	mov	w6, wzr
	stur	w8, [x29, #-16]
	sturh	w9, [x29, #-11]
	sturb	w10, [x29, #-12]
	bl	f2fs_do_replace_block
	add	x0, sp, #48             // =48
	mov	w1, w28
	b	.LBB9_39
.LBB9_32:                               //   in Loop: Header=BB9_5 Depth=1
	mov	w28, #-11
.LBB9_33:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	tbz	w8, #0, .LBB9_69
.LBB9_34:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, 4
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	add	x9, x19, #40            // =40
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x9]
1:	ldxr	x8, [x9]
	bic	x8, x8, 8
	stxr	w10, x8, [x9]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x19, #40]
	cmp	x8, #1                  // =1
	b.ne	.LBB9_69
// %bb.35:                              //   in Loop: Header=BB9_5 Depth=1
	str	xzr, [x19, #40]
	ldr	x8, [x19]
	tbz	w8, #13, .LBB9_69
// %bb.36:                              //   in Loop: Header=BB9_5 Depth=1
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
	cbnz	w9, .LBB9_69
// %bb.37:                              //   in Loop: Header=BB9_5 Depth=1
	bl	__put_page
	b	.LBB9_69
.LBB9_38:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	mov	w1, w2
	bl	f2fs_invalidate_blocks
	add	x0, sp, #48             // =48
	mov	w1, #-1
.LBB9_39:                               //   in Loop: Header=BB9_5 Depth=1
	bl	f2fs_update_data_blkaddr
	ldr	x28, [sp, #64]
	cbz	x28, .LBB9_64
// %bb.40:                              //   in Loop: Header=BB9_5 Depth=1
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
	b.ne	.LBB9_56
// %bb.41:                              //   in Loop: Header=BB9_5 Depth=1
	tbnz	w8, #0, .LBB9_55
// %bb.42:                              //   in Loop: Header=BB9_5 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB9_45
// %bb.43:                              //   in Loop: Header=BB9_5 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB9_45
// %bb.44:                              //   in Loop: Header=BB9_5 Depth=1
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	ldr	w23, [sp, #16]          // 4-byte Folded Reload
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB9_45:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB9_47
// %bb.46:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB9_103
.LBB9_47:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x0, [x28, #24]
.LBB9_48:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB9_50
// %bb.49:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB9_104
.LBB9_50:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x0, [x28, #24]
.LBB9_51:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB9_53
// %bb.52:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB9_105
.LBB9_53:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x0, [x28, #24]
.LBB9_54:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB9_55:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB9_62
	b	.LBB9_145
.LBB9_56:                               //   in Loop: Header=BB9_5 Depth=1
	tbnz	w8, #0, .LBB9_61
// %bb.57:                              //   in Loop: Header=BB9_5 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB9_60
// %bb.58:                              //   in Loop: Header=BB9_5 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB9_60
// %bb.59:                              //   in Loop: Header=BB9_5 Depth=1
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	ldr	w23, [sp, #16]          // 4-byte Folded Reload
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB9_60:                               //   in Loop: Header=BB9_5 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB9_61:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB9_146
.LBB9_62:                               //   in Loop: Header=BB9_5 Depth=1
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
	cbnz	w9, .LBB9_64
// %bb.63:                              //   in Loop: Header=BB9_5 Depth=1
	bl	__put_page
.LBB9_64:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [sp, #56]
	cbz	x8, .LBB9_68
// %bb.65:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	x9, [sp, #64]
	cmp	x9, x8
	b.eq	.LBB9_68
// %bb.66:                              //   in Loop: Header=BB9_5 Depth=1
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
	cbnz	w9, .LBB9_68
// %bb.67:                              //   in Loop: Header=BB9_5 Depth=1
	bl	__put_page
.LBB9_68:                               //   in Loop: Header=BB9_5 Depth=1
	mov	w28, wzr
	stp	xzr, xzr, [x26]
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	tbnz	w8, #0, .LBB9_34
.LBB9_69:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x19]
	tbz	w8, #13, .LBB9_71
// %bb.70:                              //   in Loop: Header=BB9_5 Depth=1
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	bic	x8, x8, 8192
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
	str	xzr, [x19, #40]
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
	cbz	w9, .LBB9_96
.LBB9_71:                               //   in Loop: Header=BB9_5 Depth=1
	str	xzr, [x19, #40]
	cbz	x19, .LBB9_97
.LBB9_72:                               //   in Loop: Header=BB9_5 Depth=1
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
	b.ne	.LBB9_88
// %bb.73:                              //   in Loop: Header=BB9_5 Depth=1
	tbnz	w8, #0, .LBB9_87
// %bb.74:                              //   in Loop: Header=BB9_5 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB9_77
// %bb.75:                              //   in Loop: Header=BB9_5 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB9_77
// %bb.76:                              //   in Loop: Header=BB9_5 Depth=1
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	ldr	w23, [sp, #16]          // 4-byte Folded Reload
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB9_77:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB9_79
// %bb.78:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB9_100
.LBB9_79:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x0, [x19, #24]
.LBB9_80:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB9_82
// %bb.81:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB9_101
.LBB9_82:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x0, [x19, #24]
.LBB9_83:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB9_85
// %bb.84:                              //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB9_102
.LBB9_85:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x0, [x19, #24]
.LBB9_86:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB9_87:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB9_94
	b	.LBB9_143
.LBB9_88:                               //   in Loop: Header=BB9_5 Depth=1
	tbnz	w8, #0, .LBB9_93
// %bb.89:                              //   in Loop: Header=BB9_5 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB9_92
// %bb.90:                              //   in Loop: Header=BB9_5 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB9_92
// %bb.91:                              //   in Loop: Header=BB9_5 Depth=1
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	ldr	w23, [sp, #16]          // 4-byte Folded Reload
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB9_92:                               //   in Loop: Header=BB9_5 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB9_93:                               //   in Loop: Header=BB9_5 Depth=1
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB9_144
.LBB9_94:                               //   in Loop: Header=BB9_5 Depth=1
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
	cbnz	w9, .LBB9_97
// %bb.95:                              //   in Loop: Header=BB9_5 Depth=1
	bl	__put_page
	b	.LBB9_97
.LBB9_96:                               //   in Loop: Header=BB9_5 Depth=1
	bl	__put_page
	str	xzr, [x19, #40]
	cbnz	x19, .LBB9_72
.LBB9_97:                               //   in Loop: Header=BB9_5 Depth=1
	mov	x0, x25
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB9_2
// %bb.98:                              //   in Loop: Header=BB9_5 Depth=1
	ldp	x9, x8, [x25]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB9_2
.LBB9_99:                               //   in Loop: Header=BB9_5 Depth=1
	bl	preempt_schedule_notrace
	ldr	w2, [sp, #28]           // 4-byte Folded Reload
	b	.LBB9_12
.LBB9_100:                              //   in Loop: Header=BB9_5 Depth=1
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB9_80
.LBB9_101:                              //   in Loop: Header=BB9_5 Depth=1
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB9_83
.LBB9_102:                              //   in Loop: Header=BB9_5 Depth=1
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB9_86
.LBB9_103:                              //   in Loop: Header=BB9_5 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB9_48
.LBB9_104:                              //   in Loop: Header=BB9_5 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB9_51
.LBB9_105:                              //   in Loop: Header=BB9_5 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB9_54
.LBB9_106:
	mov	w28, wzr
.LBB9_107:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB9_142
// %bb.108:
	mov	w0, w28
	ldp	x20, x19, [sp, #192]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #176]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #160]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #144]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #128]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #112]    // 16-byte Folded Reload
	add	sp, sp, #208            // =208
	ret
.LBB9_109:
	ldr	x19, [sp, #64]
	mov	w28, w0
	cbz	x19, .LBB9_135
// %bb.110:
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
	b.ne	.LBB9_127
// %bb.111:
	tbnz	w8, #0, .LBB9_125
// %bb.112:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB9_115
// %bb.113:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB9_115
// %bb.114:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB9_115:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB9_117
// %bb.116:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB9_139
.LBB9_117:
	ldr	x0, [x19, #24]
.LBB9_118:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB9_120
// %bb.119:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB9_140
.LBB9_120:
	ldr	x0, [x19, #24]
.LBB9_121:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB9_123
// %bb.122:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB9_141
.LBB9_123:
	ldr	x0, [x19, #24]
.LBB9_124:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB9_125:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB9_133
// %bb.126:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB9_127:
	tbnz	w8, #0, .LBB9_132
// %bb.128:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB9_131
// %bb.129:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB9_131
// %bb.130:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB9_131:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB9_132:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB9_147
.LBB9_133:
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
	cbnz	w9, .LBB9_135
// %bb.134:
	bl	__put_page
.LBB9_135:
	ldr	x8, [sp, #56]
	cbz	x8, .LBB9_107
// %bb.136:
	ldr	x9, [sp, #64]
	cmp	x9, x8
	b.eq	.LBB9_107
// %bb.137:
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
	cbnz	w9, .LBB9_107
// %bb.138:
	bl	__put_page
	b	.LBB9_107
.LBB9_139:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB9_118
.LBB9_140:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB9_121
.LBB9_141:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB9_124
.LBB9_142:
	bl	__stack_chk_fail
.LBB9_143:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB9_144:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB9_145:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB9_146:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB9_147:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end9:
	.size	__revoke_inmem_pages, .Lfunc_end9-__revoke_inmem_pages
                                        // -- End function
	.globl	f2fs_drop_inmem_page    // -- Begin function f2fs_drop_inmem_page
	.p2align	3
	.type	f2fs_drop_inmem_page,@function
f2fs_drop_inmem_page:                   // @f2fs_drop_inmem_page
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	x19, x1
	ldr	x8, [x0, #40]
	str	x25, [sp, #16]          // 8-byte Folded Spill
	ldr	x20, [x8, #1104]
	ldr	x8, [x1]
	tbz	w8, #13, .LBB10_2
// %bb.1:
	ldr	x8, [x19, #40]
	tbnz	w8, #0, .LBB10_6
.LBB10_2:
	bl	print_bdev_access_info
	adrp	x22, f2fs_dclient
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB10_5
// %bb.3:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB10_5
// %bb.4:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_drop_inmem_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #612
	add	x2, x2, :lo12:.L__func__.f2fs_drop_inmem_page
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB10_5:
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	b	.LBB10_7
.LBB10_6:
	ldr	x8, [x19, #40]
	tbz	w8, #1, .LBB10_2
.LBB10_7:
	ldr	x8, [x19]
	tbz	w8, #13, .LBB10_45
// %bb.8:
	ldr	x8, [x19, #40]
	tbz	w8, #0, .LBB10_45
// %bb.9:
	ldr	x8, [x19, #40]
	tbz	w8, #1, .LBB10_45
// %bb.10:
	add	x22, x21, #928          // =928
	add	x24, x21, #904          // =904
	mov	x0, x22
	bl	mutex_lock
	ldr	x21, [x21, #904]
	cmp	x21, x24
	b.eq	.LBB10_15
// %bb.11:
	ldr	x8, [x21, #16]
	cmp	x8, x19
	b.eq	.LBB10_14
.LBB10_12:                              // =>This Inner Loop Header: Depth=1
	ldr	x21, [x21]
	cmp	x21, x24
	b.eq	.LBB10_15
// %bb.13:                              //   in Loop: Header=BB10_12 Depth=1
	ldr	x8, [x21, #16]
	cmp	x8, x19
	b.ne	.LBB10_12
.LBB10_14:
	mov	x23, x21
	b	.LBB10_16
.LBB10_15:
	mov	x23, x24
.LBB10_16:
	ldr	x8, [x24]
	cmp	x8, x24
	b.eq	.LBB10_40
// %bb.17:
	ldr	x8, [x21, #16]
	cmp	x8, x19
	b.ne	.LBB10_40
.LBB10_18:
	ldr	x8, [x24]
	cmp	x8, x24
	b.eq	.LBB10_46
// %bb.19:
	ldr	x8, [x21, #16]
	cmp	x8, x19
	b.ne	.LBB10_46
// %bb.20:
	mov	x0, x23
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB10_22
// %bb.21:
	ldp	x9, x8, [x21]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB10_22:
	mov	x8, #256
	mov	x0, x22
	movk	x8, #57005, lsl #48
	add	x9, x8, #256            // =256
	stp	x8, x9, [x21]
	bl	mutex_unlock
	adrp	x9, inmem_entry_slab
	add	x8, x20, #1292          // =1292
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w10, [x8]
	sub	w10, w10, 1
	stxr	w11, w10, [x8]
	cbnz	w11, 1b
	//NO_APP
	mov	x1, x21
	ldr	x0, [x9, :lo12:inmem_entry_slab]
	bl	kmem_cache_free
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, 4
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	add	x9, x19, #40            // =40
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x9]
1:	ldxr	x8, [x9]
	bic	x8, x8, 2
	stxr	w10, x8, [x9]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x19, #40]
	cmp	x8, #1                  // =1
	b.ne	.LBB10_25
// %bb.23:
	str	xzr, [x19, #40]
	ldr	x8, [x19]
	tbz	w8, #13, .LBB10_25
// %bb.24:
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
	cbz	w9, .LBB10_39
.LBB10_25:
	cbz	x19, .LBB10_27
.LBB10_26:
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
	cbz	w9, .LBB10_30
.LBB10_27:
	ldr	x8, [x19]
	tbz	w8, #13, .LBB10_31
.LBB10_28:
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	bic	x8, x8, 8192
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
	str	xzr, [x19, #40]
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
	cbnz	w9, .LBB10_31
// %bb.29:
	bl	__put_page
	b	.LBB10_31
.LBB10_30:
	bl	__put_page
	ldr	x8, [x19]
	tbnz	w8, #13, .LBB10_28
.LBB10_31:
	adrp	x8, __tracepoint_f2fs_commit_inmem_page
	str	xzr, [x19, #40]
	add	x8, x8, :lo12:__tracepoint_f2fs_commit_inmem_page
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB10_38
// %bb.32:
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
	tbz	w9, #0, .LBB10_38
// %bb.33:
	//APP
	mrs x20, sp_el0
	//NO_APP
	ldr	w9, [x20, #80]
	add	w9, w9, #1              // =1
	str	w9, [x20, #80]
	//APP
	//NO_APP
	ldr	x21, [x8, #32]
	cbz	x21, .LBB10_36
// %bb.34:
	ldr	x8, [x21], #24
.LBB10_35:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x21, #-16]
	mov	x1, x19
	mov	w2, #7
	blr	x8
	ldr	x8, [x21], #24
	cbnz	x8, .LBB10_35
.LBB10_36:
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	b.ne	.LBB10_38
// %bb.37:
	ldr	x8, [x20]
	tbnz	w8, #1, .LBB10_44
.LBB10_38:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB10_39:
	bl	__put_page
	cbnz	x19, .LBB10_26
	b	.LBB10_27
.LBB10_40:
	bl	print_bdev_access_info
	adrp	x25, f2fs_dclient
	ldr	x0, [x25, :lo12:f2fs_dclient]
	cbz	x0, .LBB10_43
// %bb.41:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB10_43
// %bb.42:
	ldr	x0, [x25, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_drop_inmem_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #623
	add	x2, x2, :lo12:.L__func__.f2fs_drop_inmem_page
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB10_43:
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	b	.LBB10_18
.LBB10_44:
	bl	preempt_schedule_notrace
	b	.LBB10_38
.LBB10_45:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 612; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB10_46:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 623; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end10:
	.size	f2fs_drop_inmem_page, .Lfunc_end10-f2fs_drop_inmem_page
                                        // -- End function
	.globl	f2fs_commit_inmem_pages // -- Begin function f2fs_commit_inmem_pages
	.p2align	3
	.type	f2fs_commit_inmem_pages,@function
f2fs_commit_inmem_pages:                // @f2fs_commit_inmem_pages
// %bb.0:
	sub	sp, sp, #320            // =320
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #224]    // 16-byte Folded Spill
	add	x29, sp, #224           // =224
	stp	x28, x27, [sp, #240]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #256]    // 16-byte Folded Spill
	mov	w1, #1
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #272]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #288]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #304]    // 16-byte Folded Spill
	mov	x19, x0
	stur	x8, [x29, #-16]
	mov	w20, #1
	ldr	x8, [x0, #40]
	ldr	x21, [x8, #1104]
	mov	x0, x21
	bl	f2fs_balance_fs
	add	x26, x19, #1016         // =1016
	mov	x0, x26
	bl	down_write
	add	x22, x21, #368          // =368
	mov	x0, x22
	bl	_raw_spin_lock
	ldr	x8, [x21, #352]
	cbz	x8, .LBB11_2
// %bb.1:
	adrp	x23, jiffies
	ldr	x8, [x21, #360]
	ldr	x9, [x23, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB11_45
.LBB11_2:
	mov	x0, x22
	bl	_raw_spin_unlock
	add	x21, x21, #304          // =304
	mov	x0, x21
	bl	down_read
	add	x22, x19, #928          // =928
	add	x8, x19, #712           // =712
	mov	x0, x22
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 65536
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	mutex_lock
	ldr	x8, [x19, #40]
	mov	w9, #10240
	stp	xzr, xzr, [sp, #80]
	add	x10, sp, #48            // =48
	ldr	x23, [x8, #1104]
	stp	xzr, xzr, [sp, #192]
	stp	xzr, xzr, [sp, #176]
	stp	xzr, xzr, [sp, #160]
	stp	xzr, xzr, [sp, #144]
	stp	xzr, xzr, [sp, #128]
	stp	xzr, xzr, [sp, #112]
	stp	xzr, xzr, [sp, #96]
	ldr	x8, [x19, #64]
	stp	w20, w9, [sp, #84]
	mov	w9, #4
	stp	w8, wzr, [sp, #72]
	str	w9, [sp, #164]
	str	x10, [sp, #48]
	ldr	w8, [x23, #3024]
	stp	x10, x23, [sp, #56]
	cmp	w8, #2                  // =2
	b.ne	.LBB11_5
// %bb.3:
	ldr	x8, [x23, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB11_5
// %bb.4:
	str	wzr, [sp, #200]
.LBB11_5:
	ldr	x25, [x19, #904]
	add	x24, x19, #904          // =904
	cmp	x25, x24
	b.eq	.LBB11_41
// %bb.6:
	str	x26, [sp, #24]          // 8-byte Folded Spill
	mov	w26, #5
	mov	w20, #1
	stp	x22, x21, [sp, #8]      // 16-byte Folded Spill
	str	wzr, [sp, #36]          // 4-byte Folded Spill
	//APP
	mrs x21, sp_el0
	//NO_APP
	b	.LBB11_8
.LBB11_7:                               //   in Loop: Header=BB11_8 Depth=1
	mov	x25, x22
	cmp	x22, x24
	b.eq	.LBB11_44
.LBB11_8:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB11_15 Depth 2
                                        //     Child Loop BB11_28 Depth 2
	ldr	x27, [x25, #16]
	ldr	x22, [x25]
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x9, [x8]
	str	x9, [sp, #40]
	ldr	x9, [sp, #40]
	tbnz	w9, #0, .LBB11_10
// %bb.9:                               //   in Loop: Header=BB11_8 Depth=1
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x8]
1:	ldaxr	x9, [x8]
	orr	x10, x9, 1
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	
	//NO_APP
	tbz	w9, #0, .LBB11_11
.LBB11_10:                              //   in Loop: Header=BB11_8 Depth=1
	mov	x0, x27
	bl	__lock_page
.LBB11_11:                              //   in Loop: Header=BB11_8 Depth=1
	ldr	x8, [x27, #24]
	ldr	x9, [x19, #48]
	cmp	x8, x9
	b.ne	.LBB11_31
// %bb.12:                              //   in Loop: Header=BB11_8 Depth=1
	adrp	x8, __tracepoint_f2fs_commit_inmem_page
	add	x8, x8, :lo12:__tracepoint_f2fs_commit_inmem_page
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB11_18
// %bb.13:                              //   in Loop: Header=BB11_8 Depth=1
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
	tbz	w8, #0, .LBB11_18
// %bb.14:                              //   in Loop: Header=BB11_8 Depth=1
	ldr	w8, [x21, #80]
	add	w8, w8, #1              // =1
	str	w8, [x21, #80]
	adrp	x8, __tracepoint_f2fs_commit_inmem_page
	add	x8, x8, :lo12:__tracepoint_f2fs_commit_inmem_page
	//APP
	//NO_APP
	ldr	x28, [x8, #32]
	cbz	x28, .LBB11_16
.LBB11_15:                              //   Parent Loop BB11_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x8, x0, [x28]
	mov	x1, x27
	mov	w2, w26
	blr	x8
	ldr	x8, [x28, #24]!
	cbnz	x8, .LBB11_15
.LBB11_16:                              //   in Loop: Header=BB11_8 Depth=1
	//APP
	//NO_APP
	ldr	w8, [x21, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x21, #80]
	b.ne	.LBB11_18
// %bb.17:                              //   in Loop: Header=BB11_8 Depth=1
	ldr	x8, [x21]
	tbnz	w8, #1, .LBB11_35
.LBB11_18:                              //   in Loop: Header=BB11_8 Depth=1
	mov	x0, x27
	mov	w1, wzr
	mov	w2, #1
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
	mov	x0, x27
	bl	set_page_dirty
	mov	x0, x27
	bl	clear_page_dirty_for_io
	cbz	w0, .LBB11_28
// %bb.19:                              //   in Loop: Header=BB11_8 Depth=1
	ldrh	w8, [x19]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.eq	.LBB11_22
// %bb.20:                              //   in Loop: Header=BB11_8 Depth=1
	cmp	w8, #10, lsl #12        // =40960
	b.eq	.LBB11_22
// %bb.21:                              //   in Loop: Header=BB11_8 Depth=1
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB11_26
.LBB11_22:                              //   in Loop: Header=BB11_8 Depth=1
	add	x8, x19, #768           // =768
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x19, #712]
	tbz	x8, #37, .LBB11_24
// %bb.23:                              //   in Loop: Header=BB11_8 Depth=1
	ldr	x8, [x19, #40]
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
.LBB11_24:                              //   in Loop: Header=BB11_8 Depth=1
	ldr	x8, [x19, #40]
	ldrh	w9, [x19]
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
	ldrb	w8, [x19, #12]
	tbz	w8, #5, .LBB11_26
// %bb.25:                              //   in Loop: Header=BB11_8 Depth=1
	ldr	x8, [x19, #40]
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
.LBB11_26:                              //   in Loop: Header=BB11_8 Depth=1
	mov	x0, x19
	bl	f2fs_remove_dirty_inode
	b	.LBB11_28
.LBB11_27:                              //   in Loop: Header=BB11_28 Depth=2
	mov	w0, wzr
	mov	x1, x26
	bl	congestion_wait
.LBB11_28:                              //   Parent Loop BB11_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x0, sp, #64             // =64
	str	wzr, [sp, #96]
	stp	x27, xzr, [sp, #104]
	str	w20, [sp, #148]
	bl	f2fs_do_write_data_page
	cmn	w0, #12                 // =12
	b.eq	.LBB11_27
// %bb.29:                              //   in Loop: Header=BB11_8 Depth=1
	mov	w28, w0
	cbnz	w0, .LBB11_36
// %bb.30:                              //   in Loop: Header=BB11_8 Depth=1
	ldr	w8, [sp, #96]
	mov	w9, #1
	str	w9, [sp, #36]           // 4-byte Folded Spill
	str	w8, [x25, #24]
.LBB11_31:                              //   in Loop: Header=BB11_8 Depth=1
	mov	x0, x27
	bl	unlock_page
	mov	x0, x25
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB11_33
// %bb.32:                              //   in Loop: Header=BB11_8 Depth=1
	ldp	x9, x8, [x25]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB11_33:                              //   in Loop: Header=BB11_8 Depth=1
	ldr	x27, [sp, #56]
	add	x2, sp, #48             // =48
	mov	x0, x25
	mov	x1, x27
	bl	__list_add_valid
	tbz	w0, #0, .LBB11_7
// %bb.34:                              //   in Loop: Header=BB11_8 Depth=1
	add	x8, sp, #48             // =48
	str	x25, [sp, #56]
	stp	x8, x27, [x25]
	str	x25, [x27]
	b	.LBB11_7
.LBB11_35:                              //   in Loop: Header=BB11_8 Depth=1
	bl	preempt_schedule_notrace
	b	.LBB11_18
.LBB11_36:
	mov	x0, x27
	bl	unlock_page
.LBB11_37:
	ldp	x21, x26, [sp, #16]     // 16-byte Folded Reload
	ldr	x22, [sp, #8]           // 8-byte Folded Reload
	ldr	w8, [sp, #36]           // 4-byte Folded Reload
	tbz	w8, #0, .LBB11_39
// %bb.38:
	mov	x0, x23
	mov	x1, x19
	mov	x2, xzr
	mov	w3, wzr
	mov	w4, wzr
	bl	f2fs_submit_merged_write_cond
.LBB11_39:
	cbz	w28, .LBB11_41
// %bb.40:
	add	x1, sp, #48             // =48
	mov	x0, x19
	mov	w2, wzr
	mov	w3, #1
	mov	w4, wzr
	bl	__revoke_inmem_pages
	mov	w23, w0
	mov	x0, x19
	mov	x1, x24
	mov	w2, #1
	mov	w3, wzr
	mov	w4, wzr
	bl	__revoke_inmem_pages
	b	.LBB11_42
.LBB11_41:
	add	x1, sp, #48             // =48
	mov	x0, x19
	mov	w2, wzr
	mov	w3, wzr
	mov	w4, wzr
	bl	__revoke_inmem_pages
	mov	w23, wzr
.LBB11_42:
	mov	x0, x22
	bl	mutex_unlock
	mov	x0, x21
	add	x8, x19, #712           // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 65536
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	up_read
	mov	x0, x26
	bl	up_write
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB11_46
// %bb.43:
	mov	w0, w23
	ldp	x20, x19, [sp, #304]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #288]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #272]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #256]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #240]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #224]    // 16-byte Folded Reload
	add	sp, sp, #320            // =320
	ret
.LBB11_44:
	mov	w28, wzr
	b	.LBB11_37
.LBB11_45:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x21, #360]
	adrp	x0, .L.str.22
	ldr	x2, [x23, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.22
	bl	printk
	ldr	x0, [x21, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB11_2
.LBB11_46:
	bl	__stack_chk_fail
.Lfunc_end11:
	.size	f2fs_commit_inmem_pages, .Lfunc_end11-f2fs_commit_inmem_pages
                                        // -- End function
	.globl	f2fs_balance_fs         // -- Begin function f2fs_balance_fs
	.p2align	3
	.type	f2fs_balance_fs,@function
f2fs_balance_fs:                        // @f2fs_balance_fs
// %bb.0:
	sub	sp, sp, #176            // =176
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	stp	x26, x25, [sp, #112]    // 16-byte Folded Spill
	stp	x24, x23, [sp, #128]    // 16-byte Folded Spill
	adrp	x9, autoremove_wake_function
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	add	x9, x9, :lo12:autoremove_wake_function
	stp	x22, x21, [sp, #144]    // 16-byte Folded Spill
	//APP
	mrs x22, sp_el0
	//NO_APP
	stp	x20, x19, [sp, #160]    // 16-byte Folded Spill
	mov	x19, x0
	stur	x8, [x29, #-8]
	add	x8, sp, #24             // =24
	add	x8, x8, #24             // =24
	str	wzr, [sp, #24]
	stp	x22, x9, [sp, #32]
	stp	x8, x8, [sp, #48]
	tbz	w1, #0, .LBB12_3
// %bb.1:
	ldr	x8, [x19, #120]
	ldr	w8, [x8, #132]
	lsr	w8, w8, #5
	cmp	w8, #3125               // =3125
	b.lo	.LBB12_3
// %bb.2:
	mov	x0, x19
	mov	w1, wzr
	bl	f2fs_balance_fs_bg
.LBB12_3:
	ldr	x9, [x19, #80]
	ldr	w8, [x19, #1192]
	ldr	w10, [x19, #1188]
	tbnz	w9, #8, .LBB12_64
// %bb.4:
	ldr	w9, [x19, #1184]
.LBB12_5:
	mul	w11, w10, w8
	ldrsw	x15, [x19, #1284]
	ldrsw	x16, [x19, #1272]
	ldrsw	x17, [x19, #1296]
	sub	x11, x11, #1            // =1
	ldr	x12, [x19, #80]
	tbnz	w12, #3, .LBB12_16
// %bb.6:
	ldr	x0, [x19, #136]
	ldr	x12, [x0, #8]
	ldr	w14, [x0, #100]
	ldr	w12, [x12, #8]
	udiv	w13, w14, w8
	cmn	w14, #1                 // =1
	b.eq	.LBB12_8
// %bb.7:
	mov	w18, w13
	cmp	w12, w18
	b.eq	.LBB12_9
	b	.LBB12_13
.LBB12_8:
	mov	w18, #-1
	cmp	w12, w18
	b.ne	.LBB12_13
.LBB12_9:
	ldr	w2, [x19, #1284]
	mov	w5, #48
	ldr	w3, [x19, #1272]
	ldr	w18, [x19, #1272]
	ldr	x1, [x0, #24]
	ldr	x0, [x0]
	add	w2, w3, w2
	ldr	w4, [x1, #460]
	ldr	x0, [x0, #136]
	madd	x4, x4, x5, x0
	ldrh	w4, [x4, #2]
	and	w4, w4, #0x3ff
	sub	w3, w10, w4
	cmp	w3, w2
	b.lo	.LBB12_13
// %bb.10:
	ldr	w3, [x1, #580]
	mov	w4, #48
	madd	x3, x3, x4, x0
	ldrh	w3, [x3, #2]
	and	w3, w3, #0x3ff
	sub	w3, w10, w3
	cmp	w3, w2
	b.lo	.LBB12_13
// %bb.11:
	ldr	w3, [x1, #700]
	mov	w4, #48
	madd	x3, x3, x4, x0
	ldrh	w3, [x3, #2]
	and	w3, w3, #0x3ff
	sub	w3, w10, w3
	cmp	w3, w2
	b.lo	.LBB12_13
// %bb.12:
	ldr	w2, [x1, #100]
	mov	w3, #48
	madd	x2, x2, x3, x0
	ldrh	w2, [x2, #2]
	and	w2, w2, #0x3ff
	sub	w2, w10, w2
	cmp	w2, w18
	b.hs	.LBB12_55
.LBB12_13:
	add	x10, x11, x15
	add	x15, x11, x16
	asr	x15, x15, x9
	add	x16, x11, x17
	asr	x10, x10, x9
	udiv	w15, w15, w8
	asr	x16, x16, x9
	udiv	w10, w10, w8
	udiv	w16, w16, w8
	cmn	w14, #1                 // =1
	add	w10, w10, w15, lsl #1
	add	w10, w10, w16
	b.ne	.LBB12_15
// %bb.14:
	mov	w13, #-1
.LBB12_15:
	add	w10, w10, w13
	cmp	w12, w10
	b.ls	.LBB12_22
.LBB12_16:
	ldrsw	x13, [x19, #1284]
	ldrsw	x12, [x19, #1272]
	ldrsw	x10, [x19, #1296]
	ldr	w14, [x19, #1504]
	cmp	w14, #1                 // =1
	b.eq	.LBB12_44
// %bb.17:
	ldr	w14, [x19, #1868]
	cmp	w14, #5                 // =5
	b.ne	.LBB12_19
// %bb.18:
	ldrb	w14, [x19, #1232]
	tbz	w14, #3, .LBB12_31
.LBB12_19:
	ldr	x14, [x19, #80]
	tbnz	w14, #8, .LBB12_31
// %bb.20:
	mov	w9, w9
	ldr	x14, [x19, #136]
	add	x12, x11, x12
	add	x13, x11, x13
	add	x10, x11, x10
	asr	x12, x12, x9
	asr	x13, x13, x9
	udiv	w12, w12, w8
	ldr	x15, [x14, #8]
	udiv	w13, w13, w8
	asr	x9, x10, x9
	ldr	w10, [x14, #156]
	udiv	w16, w9, w8
	ldr	w11, [x14, #100]
	add	w12, w13, w12, lsl #1
	ldr	w9, [x15, #8]
	add	w12, w12, w16
	add	w10, w12, w10
	cmn	w11, #1                 // =1
	b.eq	.LBB12_29
// %bb.21:
	udiv	w8, w11, w8
	b	.LBB12_30
.LBB12_22:
	ldr	x8, [x19, #1712]
	cbz	x8, .LBB12_27
// %bb.23:
	adrp	x0, f2fs_balance_fs.fg_gc_rs
	adrp	x1, .L__func__.f2fs_balance_fs
	add	x0, x0, :lo12:f2fs_balance_fs.fg_gc_rs
	add	x1, x1, :lo12:.L__func__.f2fs_balance_fs
	bl	___ratelimit
	cbnz	w0, .LBB12_67
.LBB12_24:
	add	x20, x19, #1776         // =1776
	add	x1, sp, #24             // =24
	mov	x0, x20
	mov	w2, #2
	bl	prepare_to_wait
	ldr	x8, [x19, #1712]
	cbz	x8, .LBB12_26
// %bb.25:
	add	x0, x19, #1720          // =1720
	mov	w1, #3
	mov	w2, #1
	mov	x3, xzr
	bl	__wake_up
	bl	schedule
	add	x1, sp, #24             // =24
	mov	x0, x20
	bl	finish_wait
	b	.LBB12_53
.LBB12_26:
	add	x1, sp, #24             // =24
	mov	x0, x20
	bl	finish_wait
.LBB12_27:
	add	x0, x19, #1664          // =1664
	bl	down_write
	ldr	w8, [x22, #108]
	mov	w4, #-1
	mov	x0, x19
	mov	w1, wzr
.LBB12_28:
	orr	w8, w8, #0x2000000
	str	w8, [x22, #108]
	mov	w2, wzr
	mov	w3, wzr
	bl	f2fs_gc
	ldr	w8, [x22, #108]
	and	w8, w8, #0xfdffffff
	str	w8, [x22, #108]
	b	.LBB12_53
.LBB12_29:
	mov	w8, #-1
.LBB12_30:
	add	w8, w10, w8
	cmp	w9, w8
	b.hi	.LBB12_44
.LBB12_31:
	adrp	x9, .L__const.f2fs_bd_balance_decision.ts
	ldr	x8, [x19, #136]
	add	x9, x9, :lo12:.L__const.f2fs_bd_balance_decision.ts
	sub	x0, x29, #24            // =24
	ldp	x10, x9, [x9]
	ldr	x24, [x8, #16]
	stp	x10, x9, [x29, #-24]
	bl	timespec64_to_jiffies
	add	x20, x19, #2192         // =2192
	mov	x21, x0
	ldr	x23, [x19, #2224]
	mov	x0, x20
	bl	mutex_lock
	ldr	x26, [x23, #208]
	mov	x0, x20
	bl	mutex_unlock
	adrp	x25, jiffies
	add	x9, x26, x21
	ldr	x8, [x25, :lo12:jiffies]
	cmp	x9, x8
	b.pl	.LBB12_44
// %bb.32:
	mov	x0, x20
	bl	mutex_lock
	ldp	x8, x9, [x23, #192]
	mov	x0, x20
	ldp	x10, x11, [x23, #176]
	stp	x8, x9, [x23, #176]
	ldr	x12, [x25, :lo12:jiffies]
	sub	x21, x8, x10
	sub	x25, x9, x11
	str	x12, [x23, #208]
	bl	mutex_unlock
	ldr	w23, [x19, #1188]
	cmp	x21, x23
	b.gt	.LBB12_34
// %bb.33:
	cmp	x25, x23
	b.le	.LBB12_44
.LBB12_34:
	ldp	w8, w9, [x24, #112]
	ldp	w10, w11, [x24, #120]
	ldp	w12, w13, [x24, #128]
	add	w8, w9, w8
	add	w26, w8, w10
	add	w9, w12, w11
	add	w24, w9, w13
	adds	w20, w24, w26
	b.eq	.LBB12_44
// %bb.35:
	ldr	x8, [x19, #136]
	ldr	w8, [x8, #100]
	cmp	w26, w8
	b.hs	.LBB12_39
// %bb.36:
	cmp	x25, x23
	b.le	.LBB12_39
// %bb.37:
	sub	x0, x29, #28            // =28
	mov	w1, #4
	bl	get_random_bytes
	ldur	w8, [x29, #-28]
	mov	w9, #34079
	movk	w9, #20971, lsl #16
	mov	w10, #100
	mul	w11, w26, w10
	mul	x9, x8, x9
	lsr	x9, x9, #37
	msub	w8, w9, w10, w8
	udiv	w9, w11, w20
	cmp	w8, w9
	b.hi	.LBB12_42
// %bb.38:
	ldr	x8, [x19, #136]
	ldr	w8, [x8, #100]
.LBB12_39:
	cmp	w24, w8
	b.hs	.LBB12_44
// %bb.40:
	cmp	x21, x23
	b.le	.LBB12_44
// %bb.41:
	sub	x0, x29, #28            // =28
	mov	w1, #4
	bl	get_random_bytes
	ldur	w8, [x29, #-28]
	mov	w9, #34079
	movk	w9, #20971, lsl #16
	mov	w10, #100
	mul	w11, w24, w10
	mul	x9, x8, x9
	lsr	x9, x9, #37
	msub	w8, w9, w10, w8
	udiv	w9, w11, w20
	cmp	w8, w9
	b.ls	.LBB12_44
.LBB12_42:
	ldr	x8, [x19, #136]
	adrp	x11, f2fs_balance_fs.FG_GC_count
	ldr	w9, [x19, #1236]
	ldr	w10, [x19, #1240]
	ldr	w12, [x19, #1168]
	ldr	x13, [x8, #8]
	ldr	w14, [x11, :lo12:f2fs_balance_fs.FG_GC_count]
	sub	w10, w9, w10
	mul	x15, x12, x9
	ldr	w9, [x8, #100]
	mul	x10, x10, x12
	ldr	w5, [x13, #8]
	ldr	w8, [x19, #1192]
	add	w4, w14, #1             // =1
	lsr	x2, x15, #20
	lsr	x3, x10, #20
	cmn	w9, #1                  // =1
	str	w4, [x11, :lo12:f2fs_balance_fs.FG_GC_count]
	b.eq	.LBB12_58
// %bb.43:
	udiv	w6, w9, w8
	b	.LBB12_59
.LBB12_44:
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB12_53
// %bb.45:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB12_53
// %bb.46:
	ldr	x9, [x19, #3032]
	ldp	w8, w10, [x9, #180]
	subs	w10, w8, w10
	mov	w8, #34816
	movk	w8, #19, lsl #16
	csel	w10, wzr, w10, lo
	lsr	w11, w10, #11
	cmp	w11, #625               // =625
	b.lo	.LBB12_48
// %bb.47:
	ldr	w11, [x9, #168]
	lsr	w10, w10, #2
	ldr	w12, [x19, #1188]
	cmp	w10, w8
	csel	w10, w10, w8, lo
	mul	w11, w12, w11
	cmp	w11, w10
	b.lo	.LBB12_50
.LBB12_48:
	ldr	w10, [x9, #372]
	ldr	w11, [x9, #376]
	subs	w10, w10, w11
	csel	w10, wzr, w10, lo
	cmp	w10, w8
	b.lo	.LBB12_53
// %bb.49:
	ldr	w9, [x9, #360]
	lsr	w10, w10, #2
	ldr	w11, [x19, #1188]
	cmp	w10, w8
	csel	w8, w10, w8, lo
	mul	w9, w11, w9
	cmp	w9, w8
	b.hs	.LBB12_53
.LBB12_50:
	adrp	x0, f2fs_balance_fs.fg_gc_rs.7
	adrp	x1, .L__func__.f2fs_balance_fs
	add	x0, x0, :lo12:f2fs_balance_fs.fg_gc_rs.7
	add	x1, x1, :lo12:.L__func__.f2fs_balance_fs
	bl	___ratelimit
	cbnz	w0, .LBB12_82
.LBB12_51:
	add	x8, x19, #2232          // =2232
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x19, #1712]
	cbz	x8, .LBB12_53
.LBB12_52:
	add	x0, x19, #1720          // =1720
	mov	w1, #3
	mov	w2, #1
	mov	x3, xzr
	bl	__wake_up
.LBB12_53:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB12_89
// %bb.54:
	ldp	x20, x19, [sp, #160]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #144]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #128]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #112]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB12_55:
	ldr	w2, [x19, #3024]
	cmp	w2, #2                  // =2
	b.ne	.LBB12_16
// %bb.56:
	ldr	x2, [x19, #16]
	ldr	w2, [x2, #2180]
	tbz	w2, #16, .LBB12_16
// %bb.57:
	ldr	w1, [x1, #820]
	mov	w3, #48
	tst	w2, #0x2
	csel	w10, w10, wzr, eq
	madd	x0, x1, x3, x0
	ldrh	w0, [x0, #2]
	and	w0, w0, #0x3ff
	sub	w10, w10, w0
	cmp	w10, w18
	b.lo	.LBB12_13
	b	.LBB12_16
.LBB12_58:
	mov	w6, #-1
.LBB12_59:
	ldr	w9, [x19, #1188]
	adrp	x1, .L.str.5
	ldrsw	x10, [x19, #1284]
	add	x1, x1, :lo12:.L.str.5
	ldr	w11, [x19, #1184]
	mov	x0, x19
	ldrsw	x12, [x19, #1272]
	ldrsw	x13, [x19, #1296]
	mul	w9, w9, w8
	sub	x9, x9, #1              // =1
	add	x10, x9, x10
	add	x12, x9, x12
	add	x9, x9, x13
	asr	x10, x10, x11
	asr	x12, x12, x11
	asr	x9, x9, x11
	udiv	w7, w10, w8
	udiv	w10, w12, w8
	udiv	w8, w9, w8
	str	w10, [sp]
	str	w8, [sp, #8]
	bl	f2fs_printk
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB12_62
// %bb.60:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB12_62
// %bb.61:
	ldr	x8, [x19, #3032]
	adrp	x1, .L.str.6
	add	x1, x1, :lo12:.L.str.6
	mov	x0, x19
	ldr	w2, [x8, #168]
	ldr	w3, [x8, #360]
	ldr	w5, [x8, #372]
	ldp	w4, w6, [x8, #180]
	ldr	w7, [x8, #376]
	bl	f2fs_printk
.LBB12_62:
	add	x8, x19, #2232          // =2232
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x19, #1712]
	cbnz	x8, .LBB12_52
// %bb.63:
	add	x0, x19, #1664          // =1664
	bl	down_write
	ldr	w8, [x22, #108]
	mov	w4, #-1
	mov	x0, x19
	mov	w1, #1
	b	.LBB12_28
.LBB12_64:
	ldrsw	x14, [x19, #1284]
	ldr	w9, [x19, #1184]
	ldrsw	x15, [x19, #1272]
	ldrsw	x16, [x19, #1296]
	ldr	x11, [x19, #80]
	tbnz	w11, #3, .LBB12_5
// %bb.65:
	ldr	x18, [x19, #136]
	ldr	x11, [x18, #8]
	ldr	w13, [x18, #100]
	ldr	w11, [x11, #8]
	udiv	w12, w13, w8
	cmn	w13, #1                 // =1
	b.eq	.LBB12_69
// %bb.66:
	mov	w17, w12
	b	.LBB12_70
.LBB12_67:
	ldr	x8, [x19, #136]
	adrp	x11, f2fs_balance_fs.FG_GC_count
	ldr	w9, [x19, #1236]
	ldr	w10, [x19, #1240]
	ldr	w12, [x19, #1168]
	ldr	x13, [x8, #8]
	ldr	w14, [x11, :lo12:f2fs_balance_fs.FG_GC_count]
	sub	w10, w9, w10
	mul	x15, x12, x9
	ldr	w9, [x8, #100]
	mul	x10, x10, x12
	ldr	w5, [x13, #8]
	ldr	w8, [x19, #1192]
	add	w4, w14, #1             // =1
	lsr	x2, x15, #20
	lsr	x3, x10, #20
	cmn	w9, #1                  // =1
	str	w4, [x11, :lo12:f2fs_balance_fs.FG_GC_count]
	b.eq	.LBB12_78
// %bb.68:
	udiv	w6, w9, w8
	b	.LBB12_79
.LBB12_69:
	mov	w17, #-1
.LBB12_70:
	cmp	w11, w17
	b.ne	.LBB12_75
// %bb.71:
	ldr	w1, [x19, #1284]
	mov	w4, #48
	ldr	w2, [x19, #1272]
	ldr	w17, [x19, #1272]
	ldr	x0, [x18, #24]
	ldr	x18, [x18]
	add	w1, w2, w1
	ldr	w3, [x0, #460]
	ldr	x18, [x18, #136]
	madd	x3, x3, x4, x18
	ldrh	w3, [x3, #2]
	and	w3, w3, #0x3ff
	sub	w2, w10, w3
	cmp	w2, w1
	b.lo	.LBB12_75
// %bb.72:
	ldr	w2, [x0, #580]
	mov	w3, #48
	madd	x2, x2, x3, x18
	ldrh	w2, [x2, #2]
	and	w2, w2, #0x3ff
	sub	w2, w10, w2
	cmp	w2, w1
	b.lo	.LBB12_75
// %bb.73:
	ldr	w2, [x0, #700]
	mov	w3, #48
	madd	x2, x2, x3, x18
	ldrh	w2, [x2, #2]
	and	w2, w2, #0x3ff
	sub	w2, w10, w2
	cmp	w2, w1
	b.lo	.LBB12_75
// %bb.74:
	ldr	w1, [x0, #100]
	mov	w2, #48
	madd	x1, x1, x2, x18
	ldrh	w1, [x1, #2]
	and	w1, w1, #0x3ff
	sub	w1, w10, w1
	cmp	w1, w17
	b.hs	.LBB12_84
.LBB12_75:
	mul	w17, w10, w8
	cmn	w13, #1                 // =1
	sub	x17, x17, #1            // =1
	add	x15, x17, x15
	add	x14, x17, x14
	asr	x15, x15, x9
	add	x16, x17, x16
	asr	x14, x14, x9
	udiv	w15, w15, w8
	asr	x16, x16, x9
	udiv	w14, w14, w8
	udiv	w16, w16, w8
	add	w14, w14, w15, lsl #1
	add	w14, w14, w16
	b.ne	.LBB12_77
// %bb.76:
	mov	w12, #-1
.LBB12_77:
	add	w12, w14, w12
	cmp	w11, w12
	b.hi	.LBB12_5
	b	.LBB12_53
.LBB12_78:
	mov	w6, #-1
.LBB12_79:
	ldr	w9, [x19, #1188]
	adrp	x1, .L.str.3
	ldrsw	x10, [x19, #1284]
	add	x1, x1, :lo12:.L.str.3
	ldr	w11, [x19, #1184]
	mov	x0, x19
	ldrsw	x12, [x19, #1272]
	ldrsw	x13, [x19, #1296]
	mul	w9, w9, w8
	sub	x9, x9, #1              // =1
	add	x10, x9, x10
	add	x12, x9, x12
	add	x9, x9, x13
	asr	x10, x10, x11
	asr	x12, x12, x11
	asr	x9, x9, x11
	udiv	w7, w10, w8
	udiv	w10, w12, w8
	udiv	w8, w9, w8
	str	w10, [sp]
	str	w8, [sp, #8]
	bl	f2fs_printk
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB12_24
// %bb.80:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB12_24
// %bb.81:
	ldr	x8, [x19, #3032]
	adrp	x1, .L.str.4
	add	x1, x1, :lo12:.L.str.4
	mov	x0, x19
	ldr	w2, [x8, #168]
	ldr	w3, [x8, #360]
	ldr	w5, [x8, #372]
	ldp	w4, w6, [x8, #180]
	ldr	w7, [x8, #376]
	bl	f2fs_printk
	b	.LBB12_24
.LBB12_82:
	ldr	x8, [x19, #136]
	adrp	x12, f2fs_balance_fs.FG_GC_count
	ldr	w10, [x19, #1236]
	ldr	w9, [x19, #1240]
	ldr	w11, [x19, #1168]
	ldr	x13, [x8, #8]
	ldr	w4, [x12, :lo12:f2fs_balance_fs.FG_GC_count]
	sub	w12, w10, w9
	ldr	w9, [x8, #100]
	mul	x10, x11, x10
	ldr	w8, [x19, #1192]
	ldr	w5, [x13, #8]
	mul	x11, x12, x11
	lsr	x2, x10, #20
	lsr	x3, x11, #20
	cmn	w9, #1                  // =1
	b.eq	.LBB12_87
// %bb.83:
	udiv	w6, w9, w8
	b	.LBB12_88
.LBB12_84:
	ldr	w1, [x19, #3024]
	cmp	w1, #2                  // =2
	b.ne	.LBB12_5
// %bb.85:
	ldr	x1, [x19, #16]
	ldr	w1, [x1, #2180]
	tbz	w1, #16, .LBB12_5
// %bb.86:
	ldr	w0, [x0, #820]
	mov	w2, #48
	tst	w1, #0x2
	madd	x18, x0, x2, x18
	csel	w0, w10, wzr, eq
	ldrh	w18, [x18, #2]
	and	w18, w18, #0x3ff
	sub	w18, w0, w18
	cmp	w18, w17
	b.hs	.LBB12_5
	b	.LBB12_75
.LBB12_87:
	mov	w6, #-1
.LBB12_88:
	ldr	w9, [x19, #1188]
	adrp	x1, .L.str.8
	ldrsw	x10, [x19, #1284]
	add	x1, x1, :lo12:.L.str.8
	ldr	w11, [x19, #1184]
	mov	x0, x19
	ldrsw	x12, [x19, #1272]
	ldrsw	x13, [x19, #1296]
	mul	w9, w9, w8
	sub	x9, x9, #1              // =1
	add	x10, x9, x10
	add	x12, x9, x12
	add	x9, x9, x13
	asr	x10, x10, x11
	asr	x12, x12, x11
	asr	x9, x9, x11
	udiv	w7, w10, w8
	udiv	w10, w12, w8
	udiv	w8, w9, w8
	str	w10, [sp]
	str	w8, [sp, #8]
	bl	f2fs_printk
	ldr	x8, [x19, #3032]
	adrp	x1, .L.str.9
	add	x1, x1, :lo12:.L.str.9
	mov	x0, x19
	ldr	w2, [x8, #168]
	ldr	w3, [x8, #360]
	ldr	w5, [x8, #372]
	ldp	w4, w6, [x8, #180]
	ldr	w7, [x8, #376]
	bl	f2fs_printk
	b	.LBB12_51
.LBB12_89:
	bl	__stack_chk_fail
.Lfunc_end12:
	.size	f2fs_balance_fs, .Lfunc_end12-f2fs_balance_fs
                                        // -- End function
	.globl	f2fs_balance_fs_bg      // -- Begin function f2fs_balance_fs_bg
	.p2align	3
	.type	f2fs_balance_fs_bg,@function
f2fs_balance_fs_bg:                     // @f2fs_balance_fs_bg
// %bb.0:
	sub	sp, sp, #96             // =96
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #80]
	tbnz	w8, #3, .LBB13_15
// %bb.1:
	mov	w20, w1
	mov	w1, #4
	mov	x19, x0
	bl	f2fs_available_free_memory
	tbnz	w0, #0, .LBB13_3
// %bb.2:
	mov	x0, x19
	mov	w1, #128
	bl	f2fs_shrink_extent_tree
.LBB13_3:
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_available_free_memory
	tbnz	w0, #0, .LBB13_5
// %bb.4:
	mov	w1, #455
	mov	x0, x19
	bl	f2fs_try_to_free_nats
.LBB13_5:
	mov	x0, x19
	mov	w1, wzr
	bl	f2fs_available_free_memory
	tbz	w0, #0, .LBB13_7
// %bb.6:
	mov	x0, x19
	mov	w1, wzr
	mov	w2, wzr
	bl	f2fs_build_free_nids
	b	.LBB13_8
.LBB13_7:
	mov	w1, #3640
	mov	x0, x19
	bl	f2fs_try_to_free_nids
.LBB13_8:
	ldr	x8, [x19, #120]
	ldr	w9, [x8, #4]
	ldr	w10, [x8, #24]
	ldr	w8, [x8, #136]
	mul	w9, w10, w9
	mov	w10, #34079
	movk	w10, #20971, lsl #16
	umull	x9, w9, w10
	lsr	x9, x9, #37
	cmp	w8, w9
	b.hs	.LBB13_11
// %bb.9:
	ldrsw	x8, [x19, #1284]
	ldr	w9, [x19, #1188]
	lsl	w9, w9, #3
	cmp	x8, x9
	b.ge	.LBB13_11
// %bb.10:
	ldr	x8, [x19, #136]
	ldr	x9, [x8, #16]
	ldr	w10, [x8, #108]
	ldr	w9, [x9, #140]
	cmp	w9, w10
	b.ls	.LBB13_17
.LBB13_11:
	ldrsh	w8, [x19, #1424]
	tbz	w8, #31, .LBB13_14
// %bb.12:
	tbz	w20, #0, .LBB13_14
// %bb.13:
	add	x20, x19, #1032         // =1032
	mov	x0, x20
	bl	mutex_lock
	add	x0, sp, #8              // =8
	bl	blk_start_plug
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_sync_dirty_inodes
	add	x0, sp, #8              // =8
	bl	blk_finish_plug
	mov	x0, x20
	bl	mutex_unlock
.LBB13_14:
	ldr	x0, [x19]
	mov	w1, #1
	bl	f2fs_sync_fs
	ldr	x8, [x19, #2016]
	ldr	w9, [x8, #412]
	add	w9, w9, #1              // =1
	str	w9, [x8, #412]
.LBB13_15:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB13_34
// %bb.16:
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #96             // =96
	ret
.LBB13_17:
	ldr	w9, [x19, #1308]
	cbnz	w9, .LBB13_15
// %bb.18:
	ldr	w9, [x19, #1312]
	cbnz	w9, .LBB13_15
// %bb.19:
	ldr	w9, [x19, #1316]
	cbnz	w9, .LBB13_15
// %bb.20:
	ldr	w9, [x19, #1304]
	cbnz	w9, .LBB13_15
// %bb.21:
	ldr	w9, [x19, #1300]
	cbnz	w9, .LBB13_15
// %bb.22:
	ldr	w9, [x19, #1324]
	cbnz	w9, .LBB13_15
// %bb.23:
	ldr	w9, [x19, #1320]
	cbnz	w9, .LBB13_15
// %bb.24:
	cbz	x8, .LBB13_29
// %bb.25:
	ldr	x9, [x8, #168]
	cbz	x9, .LBB13_27
// %bb.26:
	ldr	w9, [x9, #8336]
	cbnz	w9, .LBB13_15
.LBB13_27:
	ldr	x8, [x8, #160]
	cbz	x8, .LBB13_29
// %bb.28:
	ldr	w8, [x8, #36]
	cbnz	w8, .LBB13_15
.LBB13_29:
	adrp	x8, jiffies
	ldr	x9, [x19, #552]
	ldr	x10, [x19, #504]
	mov	w11, #250
	ldr	x12, [x8, :lo12:jiffies]
	madd	x9, x9, x11, x10
	cmp	x9, x12
	b.mi	.LBB13_31
// %bb.30:
	ldr	x9, [x19, #304]
	cbnz	x9, .LBB13_15
.LBB13_31:
	ldr	x9, [x19, #544]
	mov	w11, #250
	ldr	x10, [x19, #496]
	ldr	x8, [x8, :lo12:jiffies]
	madd	x9, x9, x11, x10
	cmp	x9, x8
	b.mi	.LBB13_11
// %bb.32:
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_available_free_memory
	tbnz	w0, #0, .LBB13_15
// %bb.33:
	mov	x0, x19
	mov	w1, #3
	bl	f2fs_available_free_memory
	tbz	w0, #0, .LBB13_11
	b	.LBB13_15
.LBB13_34:
	bl	__stack_chk_fail
.Lfunc_end13:
	.size	f2fs_balance_fs_bg, .Lfunc_end13-f2fs_balance_fs_bg
                                        // -- End function
	.globl	f2fs_issue_flush        // -- Begin function f2fs_issue_flush
	.p2align	3
	.type	f2fs_issue_flush,@function
f2fs_issue_flush:                       // @f2fs_issue_flush
// %bb.0:
	sub	sp, sp, #144            // =144
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	str	x25, [sp, #80]          // 8-byte Folded Spill
	stp	x24, x23, [sp, #96]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x22, x21, [sp, #112]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	w8, [x0, #1424]
	tbnz	w8, #11, .LBB14_7
// %bb.1:
	ldr	x9, [x0, #136]
	mov	x19, x0
	mov	w20, w1
	ldr	x23, [x9, #160]
	tbnz	w8, #10, .LBB14_8
// %bb.2:
	add	x8, x23, #36            // =36
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.lt	.LBB14_11
// %bb.3:
	mov	x22, xzr
	mov	x21, xzr
	b	.LBB14_5
.LBB14_4:                               //   in Loop: Header=BB14_5 Depth=1
	ldrsw	x8, [x19, #3024]
	add	x21, x21, #1            // =1
	add	x22, x22, #192          // =192
	cmp	x21, x8
	b.ge	.LBB14_17
.LBB14_5:                               // =>This Inner Loop Header: Depth=1
	mov	x0, x19
	mov	w1, w20
	mov	w2, w21
	mov	w3, #4
	bl	f2fs_is_dirty_device
	tbz	w0, #0, .LBB14_4
// %bb.6:                               //   in Loop: Header=BB14_5 Depth=1
	ldr	x8, [x19, #3032]
	mov	x0, x19
	ldr	x1, [x8, x22]
	bl	__submit_flush_wait
	cbz	w0, .LBB14_4
	b	.LBB14_18
.LBB14_7:
	mov	w0, wzr
	b	.LBB14_26
.LBB14_8:
	add	x8, x23, #36            // =36
	//APP
	// atomic_add_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	ldr	w8, [x19, #3024]
	cmp	w9, #1                  // =1
	b.ne	.LBB14_12
// %bb.9:
	cmp	w8, #2                  // =2
	b.ge	.LBB14_13
// %bb.10:
	ldr	x8, [x19]
	mov	x0, x19
	ldr	x1, [x8, #248]
	bl	__submit_flush_wait
	b	.LBB14_20
.LBB14_11:
	ldr	x8, [x19]
	mov	x0, x19
	ldr	x1, [x8, #248]
	bl	__submit_flush_wait
	b	.LBB14_18
.LBB14_12:
	cmp	w8, #1                  // =1
	b.le	.LBB14_21
.LBB14_13:
	mov	x22, xzr
	mov	x21, xzr
	b	.LBB14_15
.LBB14_14:                              //   in Loop: Header=BB14_15 Depth=1
	ldrsw	x8, [x19, #3024]
	add	x21, x21, #1            // =1
	add	x22, x22, #192          // =192
	cmp	x21, x8
	b.ge	.LBB14_19
.LBB14_15:                              // =>This Inner Loop Header: Depth=1
	mov	x0, x19
	mov	w1, w20
	mov	w2, w21
	mov	w3, #4
	bl	f2fs_is_dirty_device
	tbz	w0, #0, .LBB14_14
// %bb.16:                              //   in Loop: Header=BB14_15 Depth=1
	ldr	x8, [x19, #3032]
	mov	x0, x19
	ldr	x1, [x8, x22]
	bl	__submit_flush_wait
	cbz	w0, .LBB14_14
	b	.LBB14_20
.LBB14_17:
	mov	w0, wzr
.LBB14_18:
	add	x8, x23, #36            // =36
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w10, [x8]
	sub	w10, w10, 1
	stxr	w11, w10, [x8]
	cbnz	w11, 1b
	//NO_APP
	add	x9, x23, #32            // =32
	//APP
	// atomic_add
	prfm	pstl1strm, [x9]
1:	ldxr	w8, [x9]
	add	w8, w8, 1
	stxr	w10, w8, [x9]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB14_26
.LBB14_19:
	mov	w0, wzr
.LBB14_20:
	add	x8, x23, #36            // =36
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w10, [x8]
	sub	w10, w10, 1
	stxr	w11, w10, [x8]
	cbnz	w11, 1b
	//NO_APP
	add	x9, x23, #32            // =32
	//APP
	// atomic_add
	prfm	pstl1strm, [x9]
1:	ldxr	w8, [x9]
	add	w8, w8, 1
	stxr	w10, w8, [x9]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB14_26
.LBB14_21:
	add	x21, sp, #8             // =8
	adrp	x1, .L.str.23
	adrp	x2, __init_completion.__key
	add	x0, x21, #8             // =8
	add	x1, x1, :lo12:.L.str.23
	add	x2, x2, :lo12:__init_completion.__key
	str	w20, [sp, #48]
	str	wzr, [sp, #8]
	bl	__init_waitqueue_head
	add	x0, x21, #32            // =32
	add	x21, x23, #40           // =40
	mov	x1, x0
	mov	x2, x21
	bl	llist_add_batch
	mov	x8, x23
	//APP
	dmb ish
	//NO_APP
	ldr	x9, [x8, #16]!
	cmp	x8, x9
	b.eq	.LBB14_23
// %bb.22:
	add	x0, x23, #8             // =8
	mov	w1, #3
	mov	w2, #1
	mov	x3, xzr
	bl	__wake_up
.LBB14_23:
	ldr	x8, [x23]
	cbz	x8, .LBB14_28
// %bb.24:
	add	x0, sp, #8              // =8
	bl	wait_for_completion
	add	x8, x23, #36            // =36
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB14_25:
	ldr	w0, [sp, #52]
.LBB14_26:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB14_44
// %bb.27:
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	ldr	x25, [sp, #80]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #112]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #144            // =144
	ret
.LBB14_28:
	//APP
		prfm	pstl1strm, [x21]
1:	ldxr	x24, [x21]
	stlxr	w9, x8, [x21]
	cbnz	w9, 1b
	dmb ish
	//NO_APP
	cbz	x24, .LBB14_35
// %bb.29:
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.lt	.LBB14_36
// %bb.30:
	mov	x25, xzr
	mov	x22, xzr
	b	.LBB14_32
.LBB14_31:                              //   in Loop: Header=BB14_32 Depth=1
	ldrsw	x8, [x19, #3024]
	add	x22, x22, #1            // =1
	add	x25, x25, #192          // =192
	cmp	x22, x8
	b.ge	.LBB14_37
.LBB14_32:                              // =>This Inner Loop Header: Depth=1
	mov	x0, x19
	mov	w1, w20
	mov	w2, w22
	mov	w3, #4
	bl	f2fs_is_dirty_device
	tbz	w0, #0, .LBB14_31
// %bb.33:                              //   in Loop: Header=BB14_32 Depth=1
	ldr	x8, [x19, #3032]
	mov	x0, x19
	ldr	x1, [x8, x25]
	bl	__submit_flush_wait
	cbz	w0, .LBB14_31
// %bb.34:
	mov	w21, w0
	b	.LBB14_38
.LBB14_35:
	add	x0, sp, #8              // =8
	bl	wait_for_completion
	add	x8, x23, #36            // =36
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB14_25
.LBB14_36:
	ldr	x8, [x19]
	mov	x0, x19
	ldr	x1, [x8, #248]
	bl	__submit_flush_wait
	mov	w21, w0
	b	.LBB14_38
.LBB14_37:
	mov	w21, wzr
.LBB14_38:
	sub	x0, x24, #32            // =32
	cmn	x0, #32                 // =32
	b.eq	.LBB14_25
// %bb.39:
	add	x19, sp, #8             // =8
	b	.LBB14_42
.LBB14_40:                              //   in Loop: Header=BB14_42 Depth=1
	str	w21, [x0, #44]
	bl	complete
.LBB14_41:                              //   in Loop: Header=BB14_42 Depth=1
	mov	x0, x20
	cmn	x20, #32                // =32
	b.eq	.LBB14_25
.LBB14_42:                              // =>This Inner Loop Header: Depth=1
	ldr	x8, [x0, #32]
	cmp	x0, x19
	sub	x20, x8, #32            // =32
	b.ne	.LBB14_40
// %bb.43:                              //   in Loop: Header=BB14_42 Depth=1
	str	w21, [sp, #52]
	add	x8, x23, #36            // =36
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB14_41
.LBB14_44:
	bl	__stack_chk_fail
.Lfunc_end14:
	.size	f2fs_issue_flush, .Lfunc_end14-f2fs_issue_flush
                                        // -- End function
	.globl	f2fs_create_flush_cmd_control // -- Begin function f2fs_create_flush_cmd_control
	.p2align	3
	.type	f2fs_create_flush_cmd_control,@function
f2fs_create_flush_cmd_control:          // @f2fs_create_flush_cmd_control
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0]
	ldr	x9, [x0, #136]
	ldr	x8, [x8, #248]
	ldr	x20, [x9, #160]
	ldr	w22, [x8]
	cbz	x20, .LBB15_3
// %bb.1:
	ldr	x8, [x20]
	cbz	x8, .LBB15_5
// %bb.2:
	mov	w21, wzr
	b	.LBB15_9
.LBB15_3:
	adrp	x8, kmalloc_caches
	mov	w1, #32960
	add	x8, x8, :lo12:kmalloc_caches
	movk	w1, #96, lsl #16
	mov	w2, #56
	ldr	x0, [x8, #48]
	bl	kmem_cache_alloc_trace
	cbz	x0, .LBB15_8
// %bb.4:
	adrp	x1, .L.str.10
	adrp	x2, f2fs_create_flush_cmd_control.__key
	mov	x20, x0
	add	x0, x0, #8              // =8
	add	x1, x1, :lo12:.L.str.10
	add	x2, x2, :lo12:f2fs_create_flush_cmd_control.__key
	str	wzr, [x20, #32]
	str	wzr, [x20, #36]
	bl	__init_waitqueue_head
	ldr	x8, [x19, #136]
	mov	w21, wzr
	str	xzr, [x20, #40]
	str	x20, [x8, #160]
	ldrb	w8, [x19, #1425]
	tbz	w8, #2, .LBB15_9
.LBB15_5:
	adrp	x0, issue_flush_thread
	adrp	x3, .L.str.11
	and	w5, w22, #0xfffff
	add	x0, x0, :lo12:issue_flush_thread
	mov	w2, #-1
	add	x3, x3, :lo12:.L.str.11
	mov	x1, x19
	lsr	w4, w22, #20
	bl	kthread_create_on_node
	mov	x21, x0
	cmn	x0, #1, lsl #12         // =4096
	b.ls	.LBB15_7
// %bb.6:
	mov	x0, x20
	str	x21, [x20]
	bl	kfree
	ldr	x8, [x19, #136]
	str	xzr, [x8, #160]
	b	.LBB15_9
.LBB15_7:
	mov	x0, x21
	bl	wake_up_process
	str	x21, [x20]
	mov	w21, wzr
	b	.LBB15_9
.LBB15_8:
	mov	w21, #-12
.LBB15_9:
	mov	w0, w21
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end15:
	.size	f2fs_create_flush_cmd_control, .Lfunc_end15-f2fs_create_flush_cmd_control
                                        // -- End function
	.p2align	3               // -- Begin function issue_flush_thread
	.type	issue_flush_thread,@function
issue_flush_thread:                     // @issue_flush_thread
// %bb.0:
	sub	sp, sp, #128            // =128
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	str	x25, [sp, #64]          // 8-byte Folded Spill
	stp	x24, x23, [sp, #80]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x22, x21, [sp, #96]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #112]    // 16-byte Folded Spill
	mov	x19, x0
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #136]
	ldr	x24, [x8, #160]
	bl	kthread_should_stop
	tbz	w0, #0, .LBB16_3
.LBB16_1:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB16_25
// %bb.2:
	ldp	x20, x19, [sp, #112]    // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x22, x21, [sp, #96]     // 16-byte Folded Reload
	ldr	x25, [sp, #64]          // 8-byte Folded Reload
	ldp	x24, x23, [sp, #80]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #128            // =128
	ret
.LBB16_3:
	add	x20, x24, #8            // =8
	b	.LBB16_6
.LBB16_4:                               //   in Loop: Header=BB16_6 Depth=1
	mov	x1, sp
	mov	x0, x20
	bl	finish_wait
.LBB16_5:                               //   in Loop: Header=BB16_6 Depth=1
	bl	kthread_should_stop
	tbnz	w0, #0, .LBB16_1
.LBB16_6:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB16_10 Depth 2
                                        //     Child Loop BB16_16 Depth 2
                                        //     Child Loop BB16_21 Depth 2
	ldr	x8, [x24, #40]
	cbz	x8, .LBB16_18
// %bb.7:                               //   in Loop: Header=BB16_6 Depth=1
	mov	x8, xzr
	add	x9, x24, #40            // =40
	//APP
		prfm	pstl1strm, [x9]
1:	ldxr	x0, [x9]
	stlxr	w10, x8, [x9]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	str	x0, [x24, #48]
	bl	llist_reverse_order
	str	x0, [x24, #48]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.lt	.LBB16_13
// %bb.8:                               //   in Loop: Header=BB16_6 Depth=1
	ldr	w22, [x0, #8]
	mov	x25, xzr
	mov	x23, xzr
	b	.LBB16_10
.LBB16_9:                               //   in Loop: Header=BB16_10 Depth=2
	ldrsw	x8, [x19, #3024]
	add	x23, x23, #1            // =1
	add	x25, x25, #192          // =192
	cmp	x23, x8
	b.ge	.LBB16_14
.LBB16_10:                              //   Parent Loop BB16_6 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x0, x19
	mov	w1, w22
	mov	w2, w23
	mov	w3, #4
	bl	f2fs_is_dirty_device
	tbz	w0, #0, .LBB16_9
// %bb.11:                              //   in Loop: Header=BB16_10 Depth=2
	ldr	x8, [x19, #3032]
	mov	x0, x19
	ldr	x1, [x8, x25]
	bl	__submit_flush_wait
	cbz	w0, .LBB16_9
// %bb.12:                              //   in Loop: Header=BB16_6 Depth=1
	mov	w21, w0
	b	.LBB16_15
.LBB16_13:                              //   in Loop: Header=BB16_6 Depth=1
	ldr	x8, [x19]
	mov	x0, x19
	ldr	x1, [x8, #248]
	bl	__submit_flush_wait
	mov	w21, w0
	b	.LBB16_15
.LBB16_14:                              //   in Loop: Header=BB16_6 Depth=1
	mov	w21, wzr
.LBB16_15:                              //   in Loop: Header=BB16_6 Depth=1
	add	x8, x24, #32            // =32
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x24, #48]
	sub	x0, x8, #32             // =32
	cmn	x0, #32                 // =32
	b.eq	.LBB16_17
.LBB16_16:                              //   Parent Loop BB16_6 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x22, [x8]
	str	w21, [x8, #12]
	bl	complete
	sub	x0, x22, #32            // =32
	mov	x8, x22
	cmn	x0, #32                 // =32
	b.ne	.LBB16_16
.LBB16_17:                              //   in Loop: Header=BB16_6 Depth=1
	str	xzr, [x24, #48]
.LBB16_18:                              //   in Loop: Header=BB16_6 Depth=1
	bl	kthread_should_stop
	tbnz	w0, #0, .LBB16_5
// %bb.19:                              //   in Loop: Header=BB16_6 Depth=1
	ldr	x8, [x24, #40]
	cbnz	x8, .LBB16_5
// %bb.20:                              //   in Loop: Header=BB16_6 Depth=1
	mov	x0, sp
	mov	w1, wzr
	bl	init_wait_entry
.LBB16_21:                              //   Parent Loop BB16_6 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x1, sp
	mov	x0, x20
	mov	w2, #1
	bl	prepare_to_wait_event
	mov	x21, x0
	bl	kthread_should_stop
	tbnz	w0, #0, .LBB16_4
// %bb.22:                              //   in Loop: Header=BB16_21 Depth=2
	ldr	x8, [x24, #40]
	cbnz	x8, .LBB16_4
// %bb.23:                              //   in Loop: Header=BB16_21 Depth=2
	cbnz	x21, .LBB16_5
// %bb.24:                              //   in Loop: Header=BB16_21 Depth=2
	bl	schedule
	b	.LBB16_21
.LBB16_25:
	bl	__stack_chk_fail
.Lfunc_end16:
	.size	issue_flush_thread, .Lfunc_end16-issue_flush_thread
                                        // -- End function
	.globl	f2fs_destroy_flush_cmd_control // -- Begin function f2fs_destroy_flush_cmd_control
	.p2align	3
	.type	f2fs_destroy_flush_cmd_control,@function
f2fs_destroy_flush_cmd_control:         // @f2fs_destroy_flush_cmd_control
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #136]
	mov	x29, sp
	str	x21, [sp, #16]          // 8-byte Folded Spill
	mov	w21, w1
	ldr	x20, [x8, #160]
	cbz	x20, .LBB17_3
// %bb.1:
	ldr	x0, [x20]
	cbz	x0, .LBB17_3
// %bb.2:
	str	xzr, [x20]
	bl	kthread_stop
.LBB17_3:
	tbz	w21, #0, .LBB17_5
// %bb.4:
	mov	x0, x20
	bl	kfree
	ldr	x8, [x19, #136]
	str	xzr, [x8, #160]
.LBB17_5:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end17:
	.size	f2fs_destroy_flush_cmd_control, .Lfunc_end17-f2fs_destroy_flush_cmd_control
                                        // -- End function
	.globl	f2fs_flush_device_cache // -- Begin function f2fs_flush_device_cache
	.p2align	3
	.type	f2fs_flush_device_cache,@function
f2fs_flush_device_cache:                // @f2fs_flush_device_cache
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	ldr	w8, [x0, #3024]
	cbz	w8, .LBB18_8
// %bb.1:
	ldrb	w9, [x0, #1425]
	mov	x19, x0
	tbnz	w9, #3, .LBB18_8
// %bb.2:
	cmp	w8, #2                  // =2
	b.lt	.LBB18_8
// %bb.3:
	add	x21, x19, #3040         // =3040
	add	x20, x19, #3044         // =3044
	mov	w22, #1
	mov	w23, #192
	mov	w24, #1
	b	.LBB18_6
.LBB18_4:                               //   in Loop: Header=BB18_6 Depth=1
	mov	x0, x20
	bl	_raw_spin_lock
	ldrb	w8, [x21, x25]
	mov	x0, x20
	bic	w8, w8, w26
	strb	w8, [x21, x25]
	bl	_raw_spin_unlock
	ldr	w8, [x19, #3024]
.LBB18_5:                               //   in Loop: Header=BB18_6 Depth=1
	add	x24, x24, #1            // =1
	add	x23, x23, #192          // =192
	cmp	x24, w8, sxtw
	b.ge	.LBB18_8
.LBB18_6:                               // =>This Inner Loop Header: Depth=1
	ubfx	x25, x24, #3, #29
	mvn	w9, w24
	and	w9, w9, #0x7
	ldrb	w10, [x21, x25]
	lsl	w26, w22, w9
	tst	w26, w10
	b.eq	.LBB18_5
// %bb.7:                               //   in Loop: Header=BB18_6 Depth=1
	ldr	x8, [x19, #3032]
	mov	x0, x19
	ldr	x1, [x8, x23]
	bl	__submit_flush_wait
	cbz	w0, .LBB18_4
	b	.LBB18_9
.LBB18_8:
	mov	w0, wzr
.LBB18_9:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.Lfunc_end18:
	.size	f2fs_flush_device_cache, .Lfunc_end18-f2fs_flush_device_cache
                                        // -- End function
	.p2align	3               // -- Begin function __submit_flush_wait
	.type	__submit_flush_wait,@function
__submit_flush_wait:                    // @__submit_flush_wait
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x1
	mov	w1, wzr
	mov	w2, #1
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x21, x0
	bl	f2fs_bio_alloc
	cbz	x0, .LBB19_4
// %bb.1:
	mov	w8, #2049
	mov	x22, x0
	movk	w8, #4, lsl #16
	str	w8, [x0, #16]
	ldr	x8, [x0, #8]
	ldr	x9, [x19, #128]
	cmp	x8, x9
	b.eq	.LBB19_3
// %bb.2:
	ldrh	w8, [x22, #20]
	and	w8, w8, #0xfffffbff
	strh	w8, [x22, #20]
	ldr	x8, [x19, #128]
.LBB19_3:
	str	x8, [x22, #8]
	mov	x0, x22
	ldrb	w8, [x19, #108]
	strb	w8, [x22, #27]
	bl	submit_bio_wait
	mov	w20, w0
	mov	x0, x22
	bl	bio_put
	b	.LBB19_5
.LBB19_4:
	mov	w20, #-12
.LBB19_5:
	adrp	x9, __tracepoint_f2fs_issue_flush
	ldr	w8, [x21, #1424]
	add	x9, x9, :lo12:__tracepoint_f2fs_issue_flush
	ldr	w10, [x9, #8]
	cmp	w10, #1                 // =1
	b.lt	.LBB19_12
// %bb.6:
	adrp	x11, cpu_number
	//APP
	.if 1 == 1
661:
	mrs x10, tpidr_el1
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
	mrs x10, tpidr_el2
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	add	x11, x11, :lo12:cpu_number
	adrp	x12, __cpu_online_mask
	add	x12, x12, :lo12:__cpu_online_mask
	ldr	w10, [x10, x11]
	add	w11, w10, #63           // =63
	cmp	w10, #0                 // =0
	csel	w11, w11, w10, lt
	asr	w11, w11, #6
	ldr	x11, [x12, w11, sxtw #3]
	lsr	x10, x11, x10
	tbz	w10, #0, .LBB19_12
// %bb.7:
	//APP
	mrs x23, sp_el0
	//NO_APP
	ldr	w10, [x23, #80]
	add	w10, w10, #1            // =1
	str	w10, [x23, #80]
	//APP
	//NO_APP
	ldr	x24, [x9, #32]
	cbz	x24, .LBB19_10
// %bb.8:
	ldr	x9, [x24], #24
	and	w21, w8, #0x800
	and	w22, w8, #0x400
.LBB19_9:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x24, #-16]
	mov	x1, x19
	mov	w2, w21
	mov	w3, w22
	mov	w4, w20
	blr	x9
	ldr	x9, [x24], #24
	cbnz	x9, .LBB19_9
.LBB19_10:
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB19_12
// %bb.11:
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB19_13
.LBB19_12:
	mov	w0, w20
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB19_13:
	bl	preempt_schedule_notrace
	b	.LBB19_12
.Lfunc_end19:
	.size	__submit_flush_wait, .Lfunc_end19-__submit_flush_wait
                                        // -- End function
	.globl	f2fs_dirty_to_prefree   // -- Begin function f2fs_dirty_to_prefree
	.p2align	3
	.type	f2fs_dirty_to_prefree,@function
f2fs_dirty_to_prefree:                  // @f2fs_dirty_to_prefree
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #136]
	str	x23, [sp, #16]          // 8-byte Folded Spill
	ldr	x22, [x8, #16]
	add	x20, x22, #80           // =80
	mov	x0, x20
	bl	mutex_lock
	ldr	x8, [x19, #136]
	mov	x2, xzr
	ldr	x0, [x22, #56]
	ldr	w1, [x8, #96]
	bl	find_next_bit
	ldr	x8, [x19, #136]
	mov	x21, x0
	ldr	w9, [x8, #96]
	cmp	w9, w21
	b.ls	.LBB20_16
// %bb.1:
	mov	w23, #48
	b	.LBB20_3
.LBB20_2:                               //   in Loop: Header=BB20_3 Depth=1
	ldr	x0, [x22, #56]
	add	w2, w21, #1             // =1
	ldr	w1, [x8, #96]
	bl	find_next_bit
	ldr	x8, [x19, #136]
	mov	x21, x0
	ldr	w9, [x8, #96]
	cmp	w9, w21
	b.ls	.LBB20_16
.LBB20_3:                               // =>This Inner Loop Header: Depth=1
	ldr	x9, [x8]
	and	x10, x21, #0xffffffff
	mul	x10, x10, x23
	ldr	x9, [x9, #136]
	ldrh	w9, [x9, x10]
	tst	w9, #0xffc0
	b.ne	.LBB20_2
// %bb.4:                               //   in Loop: Header=BB20_3 Depth=1
	ldr	x9, [x8, #24]
	ldr	w10, [x9, #100]
	cmp	w10, w21
	b.eq	.LBB20_2
// %bb.5:                               //   in Loop: Header=BB20_3 Depth=1
	ldr	w10, [x9, #220]
	cmp	w10, w21
	b.eq	.LBB20_2
// %bb.6:                               //   in Loop: Header=BB20_3 Depth=1
	ldr	w10, [x9, #340]
	cmp	w10, w21
	b.eq	.LBB20_2
// %bb.7:                               //   in Loop: Header=BB20_3 Depth=1
	ldr	w10, [x9, #460]
	cmp	w10, w21
	b.eq	.LBB20_2
// %bb.8:                               //   in Loop: Header=BB20_3 Depth=1
	ldr	w10, [x9, #580]
	cmp	w10, w21
	b.eq	.LBB20_2
// %bb.9:                               //   in Loop: Header=BB20_3 Depth=1
	ldr	w10, [x9, #700]
	cmp	w10, w21
	b.eq	.LBB20_2
// %bb.10:                              //   in Loop: Header=BB20_3 Depth=1
	ldr	w10, [x9, #820]
	cmp	w10, w21
	b.eq	.LBB20_2
// %bb.11:                              //   in Loop: Header=BB20_3 Depth=1
	ldr	w10, [x9, #940]
	cmp	w10, w21
	b.eq	.LBB20_2
// %bb.12:                              //   in Loop: Header=BB20_3 Depth=1
	ldr	w10, [x9, #1060]
	cmp	w10, w21
	b.eq	.LBB20_2
// %bb.13:                              //   in Loop: Header=BB20_3 Depth=1
	ldr	w10, [x9, #1180]
	cmp	w10, w21
	b.eq	.LBB20_2
// %bb.14:                              //   in Loop: Header=BB20_3 Depth=1
	ldr	w9, [x9, #1300]
	cmp	w9, w21
	b.eq	.LBB20_2
// %bb.15:                              //   in Loop: Header=BB20_3 Depth=1
	mov	x0, x19
	mov	w1, w21
	mov	w2, #7
	bl	__locate_dirty_segment
	mov	x0, x19
	mov	w1, w21
	mov	w2, #6
	bl	__remove_dirty_segment
	ldr	x8, [x19, #136]
	b	.LBB20_2
.LBB20_16:
	mov	x0, x20
	bl	mutex_unlock
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end20:
	.size	f2fs_dirty_to_prefree, .Lfunc_end20-f2fs_dirty_to_prefree
                                        // -- End function
	.p2align	3               // -- Begin function __locate_dirty_segment
	.type	__locate_dirty_segment,@function
__locate_dirty_segment:                 // @__locate_dirty_segment
// %bb.0:
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
                                        // kill: def $w1 killed $w1 def $x1
	add	x29, sp, #32            // =32
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	ldr	x8, [x0, #136]
	ldr	x9, [x8, #24]
	ldr	w10, [x9, #100]
	cmp	w10, w1
	b.eq	.LBB21_38
// %bb.1:
	ldr	w10, [x9, #220]
	cmp	w10, w1
	b.eq	.LBB21_38
// %bb.2:
	ldr	w10, [x9, #340]
	cmp	w10, w1
	b.eq	.LBB21_38
// %bb.3:
	ldr	w10, [x9, #460]
	cmp	w10, w1
	b.eq	.LBB21_38
// %bb.4:
	ldr	w10, [x9, #580]
	cmp	w10, w1
	b.eq	.LBB21_38
// %bb.5:
	ldr	w10, [x9, #700]
	cmp	w10, w1
	b.eq	.LBB21_38
// %bb.6:
	ldr	w10, [x9, #820]
	cmp	w10, w1
	b.eq	.LBB21_38
// %bb.7:
	ldr	w10, [x9, #940]
	cmp	w10, w1
	b.eq	.LBB21_38
// %bb.8:
	ldr	w10, [x9, #1060]
	cmp	w10, w1
	b.eq	.LBB21_38
// %bb.9:
	ldr	w10, [x9, #1180]
	cmp	w10, w1
	b.eq	.LBB21_38
// %bb.10:
	ldr	w9, [x9, #1300]
	cmp	w9, w1
	b.eq	.LBB21_38
// %bb.11:
	ldr	x9, [x8, #16]
	mov	x19, x0
	add	x8, x9, w2, uxtw #3
	ldr	x11, [x8, #8]
	lsr	w8, w1, #6
	ldr	x10, [x11, w8, uxtw #3]
	stur	x10, [x29, #-8]
	mov	w10, #1
	ldur	x12, [x29, #-8]
	lsl	x10, x10, x1
	tst	x12, x10
	b.ne	.LBB21_14
// %bb.12:
	add	x11, x11, x8, lsl #3
	//APP
	// atomic64_fetch_or
	prfm	pstl1strm, [x11]
1:	ldxr	x12, [x11]
	orr	x13, x12, x10
	stlxr	w14, x13, [x11]
	cbnz	w14, 1b
	dmb ish
	//NO_APP
	tst	x12, x10
	b.ne	.LBB21_14
// %bb.13:
	mov	w11, w2
	add	x11, x9, x11, lsl #2
	ldr	w12, [x11, #112]
	add	w12, w12, #1            // =1
	str	w12, [x11, #112]
.LBB21_14:
	cmp	w2, #6                  // =6
	b.ne	.LBB21_38
// %bb.15:
	ldr	x11, [x19, #136]
	mov	w12, #48
	umull	x12, w1, w12
	ldr	x11, [x11]
	ldr	x11, [x11, #136]
	ldr	w11, [x11, x12]
	and	x11, x11, #0x3f
	cmp	w11, #6                 // =6
	b.hs	.LBB21_44
// %bb.16:
	add	x12, x9, x11, lsl #3
	ldr	x12, [x12, #8]
	ldr	x13, [x12, x8, lsl #3]
	stur	x13, [x29, #-8]
	ldur	x13, [x29, #-8]
	tst	x13, x10
	b.ne	.LBB21_19
// %bb.17:
	add	x8, x12, x8, lsl #3
	//APP
	// atomic64_fetch_or
	prfm	pstl1strm, [x8]
1:	ldxr	x12, [x8]
	orr	x13, x12, x10
	stlxr	w14, x13, [x8]
	cbnz	w14, 1b
	dmb ish
	//NO_APP
	tst	x12, x10
	b.ne	.LBB21_19
// %bb.18:
	add	x8, x9, x11, lsl #2
	ldr	w10, [x8, #112]
	add	w10, w10, #1            // =1
	str	w10, [x8, #112]
.LBB21_19:
	ldr	w8, [x19, #1192]
	cmp	w8, #2                  // =2
	b.lo	.LBB21_38
// %bb.20:
	cmn	w1, #1                  // =1
	str	x9, [sp, #16]           // 8-byte Folded Spill
	b.eq	.LBB21_22
// %bb.21:
	udiv	w9, w1, w8
	b	.LBB21_23
.LBB21_22:
	mov	w9, #-1
.LBB21_23:
	ldr	x10, [x19, #136]
	str	x9, [sp, #8]            // 8-byte Folded Spill
	ldr	x10, [x10]
	ldr	x10, [x10, #144]
	ldr	w9, [x10, x9, lsl #2]
	cbz	w9, .LBB21_39
// %bb.24:
	ldr	w10, [x19, #1188]
	mul	w11, w10, w8
	cmp	w9, w11
	b.eq	.LBB21_39
.LBB21_25:
	mul	w10, w10, w8
	cmp	w9, w10
	b.eq	.LBB21_48
// %bb.26:
	ldr	x9, [x19, #136]
	ldr	x11, [x9, #24]
	ldr	w9, [x11, #100]
	udiv	w10, w9, w8
	ldr	x9, [sp, #8]            // 8-byte Folded Reload
	cmp	w9, w10
	ldr	x10, [sp, #16]          // 8-byte Folded Reload
	b.eq	.LBB21_38
// %bb.27:
	ldr	w12, [x11, #220]
	udiv	w12, w12, w8
	cmp	w9, w12
	b.eq	.LBB21_38
// %bb.28:
	ldr	w12, [x11, #340]
	udiv	w12, w12, w8
	cmp	w9, w12
	b.eq	.LBB21_38
// %bb.29:
	ldr	w12, [x11, #460]
	udiv	w12, w12, w8
	cmp	w9, w12
	b.eq	.LBB21_38
// %bb.30:
	ldr	w12, [x11, #580]
	udiv	w12, w12, w8
	cmp	w9, w12
	b.eq	.LBB21_38
// %bb.31:
	ldr	w12, [x11, #700]
	udiv	w12, w12, w8
	cmp	w9, w12
	b.eq	.LBB21_38
// %bb.32:
	ldr	w12, [x11, #820]
	udiv	w12, w12, w8
	cmp	w9, w12
	b.eq	.LBB21_38
// %bb.33:
	ldr	w12, [x11, #940]
	udiv	w12, w12, w8
	cmp	w9, w12
	b.eq	.LBB21_38
// %bb.34:
	ldr	w12, [x11, #1060]
	udiv	w12, w12, w8
	cmp	w9, w12
	b.eq	.LBB21_38
// %bb.35:
	ldr	w12, [x11, #1180]
	udiv	w12, w12, w8
	cmp	w9, w12
	b.eq	.LBB21_38
// %bb.36:
	ldr	w11, [x11, #1300]
	udiv	w8, w11, w8
	cmp	w9, w8
	b.eq	.LBB21_38
// %bb.37:
	ldr	x8, [x10, #72]
	lsr	w10, w9, #6
	add	x8, x8, w10, uxtw #3
	mov	w10, #1
	lsl	x9, x10, x9
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
.LBB21_38:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.LBB21_39:
	str	w9, [sp, #4]            // 4-byte Folded Spill
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_42
// %bb.40:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_42
// %bb.41:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__locate_dirty_segment
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #1432
	add	x2, x2, :lo12:.L__func__.__locate_dirty_segment
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_42:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	w8, [sp, #4]            // 4-byte Folded Reload
	cbz	w8, .LBB21_48
// %bb.43:
	ldr	w8, [x19, #1192]
	ldr	w10, [x19, #1188]
	ldr	w9, [sp, #4]            // 4-byte Folded Reload
	b	.LBB21_25
.LBB21_44:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_47
// %bb.45:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_47
// %bb.46:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__locate_dirty_segment
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #1420
	add	x2, x2, :lo12:.L__func__.__locate_dirty_segment
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_47:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 1420; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB21_48:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 1432; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end21:
	.size	__locate_dirty_segment, .Lfunc_end21-__locate_dirty_segment
                                        // -- End function
	.p2align	3               // -- Begin function __remove_dirty_segment
	.type	__remove_dirty_segment,@function
__remove_dirty_segment:                 // @__remove_dirty_segment
// %bb.0:
	sub	sp, sp, #16             // =16
	ldr	x8, [x0, #136]
                                        // kill: def $w1 killed $w1 def $x1
	lsr	w10, w1, #6
	ldr	x8, [x8, #16]
	add	x9, x8, w2, uxtw #3
	ldr	x9, [x9, #8]
	ldr	x11, [x9, w10, uxtw #3]
	str	x11, [sp, #8]
	mov	w11, #1
	ldr	x12, [sp, #8]
	lsl	x11, x11, x1
	tst	x12, x11
	b.eq	.LBB22_3
// %bb.1:
	add	x9, x9, x10, lsl #3
	//APP
	// atomic64_fetch_andnot
	prfm	pstl1strm, [x9]
1:	ldxr	x12, [x9]
	bic	x13, x12, x11
	stlxr	w14, x13, [x9]
	cbnz	w14, 1b
	dmb ish
	//NO_APP
	tst	x12, x11
	b.eq	.LBB22_3
// %bb.2:
	mov	w9, w2
	add	x9, x8, x9, lsl #2
	ldr	w12, [x9, #112]
	sub	w12, w12, #1            // =1
	str	w12, [x9, #112]
.LBB22_3:
	cmp	w2, #6                  // =6
	b.ne	.LBB22_12
// %bb.4:
	ldr	x9, [x0, #136]
	mov	w12, #48
	umull	x12, w1, w12
	ldr	x9, [x9]
	ldr	x9, [x9, #136]
	ldr	w9, [x9, x12]
	and	x9, x9, #0x3f
	add	x12, x8, x9, lsl #3
	ldr	x12, [x12, #8]
	ldr	x13, [x12, x10, lsl #3]
	str	x13, [sp, #8]
	ldr	x13, [sp, #8]
	tst	x13, x11
	b.eq	.LBB22_7
// %bb.5:
	add	x12, x12, x10, lsl #3
	//APP
	// atomic64_fetch_andnot
	prfm	pstl1strm, [x12]
1:	ldxr	x13, [x12]
	bic	x14, x13, x11
	stlxr	w15, x14, [x12]
	cbnz	w15, 1b
	dmb ish
	//NO_APP
	tst	x13, x11
	b.eq	.LBB22_7
// %bb.6:
	add	x9, x8, x9, lsl #2
	ldr	w12, [x9, #112]
	sub	w12, w12, #1            // =1
	str	w12, [x9, #112]
.LBB22_7:
	ldr	x12, [x0, #136]
	ldr	w9, [x0, #1192]
	ldr	x12, [x12]
	cmp	w9, #2                  // =2
	b.lo	.LBB22_10
// %bb.8:
	ldr	x12, [x12, #144]
	cmn	w1, #1                  // =1
	b.eq	.LBB22_13
// %bb.9:
	udiv	w13, w1, w9
	ldr	w12, [x12, x13, lsl #2]
	cbnz	w12, .LBB22_11
	b	.LBB22_14
.LBB22_10:
	mov	w13, w1
	mov	w14, #48
	ldr	x12, [x12, #136]
	mul	x13, x13, x14
	ldr	w12, [x12, x13]
	ubfx	w12, w12, #6, #10
	cbz	w12, .LBB22_14
.LBB22_11:
	cmp	w9, #2                  // =2
	b.hs	.LBB22_18
.LBB22_12:
	add	sp, sp, #16             // =16
	ret
.LBB22_13:
	mov	w13, #-1
	ldr	w12, [x12, x13, lsl #2]
	cbnz	w12, .LBB22_11
.LBB22_14:
	cmn	w1, #1                  // =1
	b.eq	.LBB22_16
// %bb.15:
	udiv	w9, w1, w9
	b	.LBB22_17
.LBB22_16:
	mov	w9, #-1
.LBB22_17:
	ldr	x12, [x8, #144]
	lsr	w13, w9, #6
	add	x12, x12, w13, uxtw #3
	mov	w13, #1
	lsl	x9, x13, x9
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x12]
1:	ldxr	x13, [x12]
	bic	x13, x13, x9
	stxr	w14, x13, [x12]
	cbnz	w14, 1b
	//NO_APP
	ldr	x9, [x0, #136]
	ldr	x9, [x9]
	ldr	x9, [x9, #48]
	add	x9, x9, x10, lsl #3
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x9]
1:	ldxr	x10, [x9]
	bic	x10, x10, x11
	stxr	w12, x10, [x9]
	cbnz	w12, 1b
	//NO_APP
	ldr	w9, [x0, #1192]
	cmp	w9, #2                  // =2
	b.lo	.LBB22_12
.LBB22_18:
	cmn	w1, #1                  // =1
	b.eq	.LBB22_20
// %bb.19:
	udiv	w10, w1, w9
	b	.LBB22_21
.LBB22_20:
	mov	w10, #-1
.LBB22_21:
	ldr	x11, [x0, #136]
	ldr	x11, [x11, #24]
	ldr	w12, [x11, #100]
	udiv	w12, w12, w9
	cmp	w10, w12
	b.eq	.LBB22_12
// %bb.22:
	ldr	w12, [x11, #220]
	udiv	w12, w12, w9
	cmp	w10, w12
	b.eq	.LBB22_12
// %bb.23:
	ldr	w12, [x11, #340]
	udiv	w12, w12, w9
	cmp	w10, w12
	b.eq	.LBB22_12
// %bb.24:
	ldr	w12, [x11, #460]
	udiv	w12, w12, w9
	cmp	w10, w12
	b.eq	.LBB22_12
// %bb.25:
	ldr	w12, [x11, #580]
	udiv	w12, w12, w9
	cmp	w10, w12
	b.eq	.LBB22_12
// %bb.26:
	ldr	w12, [x11, #700]
	udiv	w12, w12, w9
	cmp	w10, w12
	b.eq	.LBB22_12
// %bb.27:
	ldr	w12, [x11, #820]
	udiv	w12, w12, w9
	cmp	w10, w12
	b.eq	.LBB22_12
// %bb.28:
	ldr	w12, [x11, #940]
	udiv	w12, w12, w9
	cmp	w10, w12
	b.eq	.LBB22_12
// %bb.29:
	ldr	w12, [x11, #1060]
	udiv	w12, w12, w9
	cmp	w10, w12
	b.eq	.LBB22_12
// %bb.30:
	ldr	w12, [x11, #1180]
	udiv	w12, w12, w9
	cmp	w10, w12
	b.eq	.LBB22_12
// %bb.31:
	ldr	w11, [x11, #1300]
	udiv	w9, w11, w9
	cmp	w10, w9
	b.eq	.LBB22_12
// %bb.32:
	ldr	x8, [x8, #72]
	lsr	w9, w10, #6
	add	x8, x8, w9, uxtw #3
	mov	w9, #1
	lsl	x9, x9, x10
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	add	sp, sp, #16             // =16
	ret
.Lfunc_end22:
	.size	__remove_dirty_segment, .Lfunc_end22-__remove_dirty_segment
                                        // -- End function
	.globl	f2fs_get_unusable_blocks // -- Begin function f2fs_get_unusable_blocks
	.p2align	3
	.type	f2fs_get_unusable_blocks,@function
f2fs_get_unusable_blocks:               // @f2fs_get_unusable_blocks
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	x20, x0
	ldr	x8, [x0, #136]
	str	x25, [sp, #16]          // 8-byte Folded Spill
	ldr	x22, [x8, #16]
	ldp	w10, w9, [x8, #100]
	ldr	w8, [x0, #1184]
	add	x19, x22, #80           // =80
	mov	x0, x19
	sub	w9, w9, w10
	lsl	w21, w9, w8
	bl	mutex_lock
	ldr	x8, [x20, #136]
	mov	x2, xzr
	ldr	x0, [x22, #56]
	ldr	w1, [x8, #96]
	bl	find_next_bit
	ldr	x8, [x20, #136]
	ldr	w9, [x8, #96]
	cmp	w9, w0
	b.ls	.LBB23_3
// %bb.1:
	mov	w24, wzr
	mov	w23, wzr
	mov	w25, #48
.LBB23_2:                               // =>This Inner Loop Header: Depth=1
	ldr	x8, [x8]
	and	x10, x0, #0xffffffff
	mov	w1, w9
	add	w2, w0, #1              // =1
	mul	x10, x10, x25
	ldr	x8, [x8, #136]
	ldr	w8, [x8, x10]
	ldr	w10, [x20, #1188]
	and	w11, w8, #0x3f
	ubfx	w8, w8, #6, #10
	sub	w10, w10, w8
	ldr	x8, [x22, #56]
	sub	w11, w11, #3            // =3
	cmp	w11, #3                 // =3
	csel	w11, w10, wzr, lo
	csel	w10, wzr, w10, lo
	mov	x0, x8
	add	w23, w11, w23
	add	w24, w10, w24
	bl	find_next_bit
	ldr	x8, [x20, #136]
	ldr	w9, [x8, #96]
	cmp	w9, w0
	b.hi	.LBB23_2
	b	.LBB23_4
.LBB23_3:
	mov	w23, wzr
	mov	w24, wzr
.LBB23_4:
	mov	x0, x19
	bl	mutex_unlock
	cmp	w24, w23
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	csel	w8, w24, w23, hi
	subs	w8, w8, w21
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	csel	w0, wzr, w8, lo
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.Lfunc_end23:
	.size	f2fs_get_unusable_blocks, .Lfunc_end23-f2fs_get_unusable_blocks
                                        // -- End function
	.globl	f2fs_disable_cp_again   // -- Begin function f2fs_disable_cp_again
	.p2align	3
	.type	f2fs_disable_cp_again,@function
f2fs_disable_cp_again:                  // @f2fs_disable_cp_again
// %bb.0:
	ldr	w8, [x0, #1520]
	cmp	w8, w1
	b.hs	.LBB24_2
// %bb.1:
	mov	w0, #-11
	ret
.LBB24_2:
	ldr	x10, [x0, #136]
	ldp	w9, w8, [x10, #100]
	ldr	x11, [x0, #80]
	tbz	w11, #9, .LBB24_5
// %bb.3:
	ldr	x10, [x10, #16]
	sub	w8, w8, w9
	ldp	w11, w12, [x10, #112]
	ldp	w13, w14, [x10, #120]
	ldp	w15, w10, [x10, #128]
	add	w11, w12, w11
	add	w11, w11, w13
	add	w11, w11, w14
	add	w11, w11, w15
	add	w9, w11, w10
	cmp	w9, w8
	b.ls	.LBB24_5
// %bb.4:
	mov	w0, #-11
	ret
.LBB24_5:
	mov	w0, wzr
	ret
.Lfunc_end24:
	.size	f2fs_disable_cp_again, .Lfunc_end24-f2fs_disable_cp_again
                                        // -- End function
	.globl	f2fs_drop_discard_cmd   // -- Begin function f2fs_drop_discard_cmd
	.p2align	3
	.type	f2fs_drop_discard_cmd,@function
f2fs_drop_discard_cmd:                  // @f2fs_drop_discard_cmd
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	x29, sp
	bl	__drop_discard_cmd
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end25:
	.size	f2fs_drop_discard_cmd, .Lfunc_end25-f2fs_drop_discard_cmd
                                        // -- End function
	.p2align	3               // -- Begin function __drop_discard_cmd
	.type	__drop_discard_cmd,@function
__drop_discard_cmd:                     // @__drop_discard_cmd
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #136]
	ldr	x25, [x8, #168]
	mov	w8, #8280
	add	x20, x25, x8
	mov	x0, x20
	bl	mutex_lock
	adrp	x23, .L.str.2
	adrp	x24, .L__func__.__drop_discard_cmd
	mov	w21, wzr
	mov	w8, #511
	adrp	x26, f2fs_dclient
	add	x23, x23, :lo12:.L.str.2
	add	x24, x24, :lo12:.L__func__.__drop_discard_cmd
	b	.LBB26_3
.LBB26_1:                               //   in Loop: Header=BB26_3 Depth=1
	mov	w21, #1
.LBB26_2:                               //   in Loop: Header=BB26_3 Depth=1
	sub	x8, x27, #1             // =1
	cbz	x27, .LBB26_12
.LBB26_3:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB26_5 Depth 2
	add	x28, x25, x8, lsl #4
	mov	x27, x8
	ldr	x22, [x28, #24]!
	cmp	x28, x22
	b.eq	.LBB26_2
// %bb.4:                               //   in Loop: Header=BB26_3 Depth=1
	ldr	x21, [x22]
.LBB26_5:                               //   Parent Loop BB26_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldrb	w8, [x22, #58]
	cbnz	w8, .LBB26_7
.LBB26_6:                               //   in Loop: Header=BB26_5 Depth=2
	sub	x1, x22, #40            // =40
	mov	x0, x19
	bl	__remove_discard_cmd
	ldr	x8, [x21]
	cmp	x28, x21
	mov	x22, x21
	mov	x21, x8
	b.ne	.LBB26_5
	b	.LBB26_1
.LBB26_7:                               //   in Loop: Header=BB26_5 Depth=2
	bl	print_bdev_access_info
	ldr	x0, [x26, :lo12:f2fs_dclient]
	cbz	x0, .LBB26_10
// %bb.8:                               //   in Loop: Header=BB26_5 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB26_10
// %bb.9:                               //   in Loop: Header=BB26_5 Depth=2
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	x1, x23
	mov	x2, x24
	mov	w3, #2277
	bl	dsm_client_record
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB26_10:                              //   in Loop: Header=BB26_5 Depth=2
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldrb	w8, [x22, #58]
	cbz	w8, .LBB26_6
// %bb.11:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 2277; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB26_12:
	mov	x0, x20
	bl	mutex_unlock
	and	w0, w21, #0x1
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end26:
	.size	__drop_discard_cmd, .Lfunc_end26-__drop_discard_cmd
                                        // -- End function
	.globl	f2fs_stop_discard_thread // -- Begin function f2fs_stop_discard_thread
	.p2align	3
	.type	f2fs_stop_discard_thread,@function
f2fs_stop_discard_thread:               // @f2fs_stop_discard_thread
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldr	x8, [x0, #136]
	mov	x29, sp
	ldr	x8, [x8, #168]
	cbz	x8, .LBB27_3
// %bb.1:
	ldr	x0, [x8]
	cbz	x0, .LBB27_3
// %bb.2:
	str	xzr, [x8]
	bl	kthread_stop
.LBB27_3:
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end27:
	.size	f2fs_stop_discard_thread, .Lfunc_end27-f2fs_stop_discard_thread
                                        // -- End function
	.globl	f2fs_issue_discard_timeout // -- Begin function f2fs_issue_discard_timeout
	.p2align	3
	.type	f2fs_issue_discard_timeout,@function
f2fs_issue_discard_timeout:             // @f2fs_issue_discard_timeout
// %bb.0:
	sub	sp, sp, #256            // =256
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #160]    // 16-byte Folded Spill
	add	x29, sp, #160           // =160
	stp	x28, x27, [sp, #176]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #192]    // 16-byte Folded Spill
	add	x1, sp, #24             // =24
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #208]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #224]    // 16-byte Folded Spill
	adrp	x21, dpolicys
	stp	x20, x19, [sp, #240]    // 16-byte Folded Spill
	add	x21, x21, :lo12:dpolicys
	stur	x8, [x29, #-8]
	mov	x19, x0
	ldr	x8, [x0, #136]
	ldr	w23, [x21, #296]
	ldp	x24, x25, [x21, #272]
	ldr	x26, [x21, #288]
	ldr	x8, [x8, #168]
	ldp	x27, x28, [x21, #240]
	str	w23, [sp, #80]
	ldp	x20, x22, [x21, #256]
	stp	x24, x25, [sp, #56]
	str	x26, [sp, #72]
	stp	x8, x27, [sp, #16]      // 8-byte Folded Spill
	stp	x28, x20, [sp, #32]
	str	x22, [sp, #48]
	strb	wzr, [sp, #80]
	bl	__issue_discard_cmd
	mov	x0, x19
	bl	__drop_discard_cmd
	ldr	w8, [x21, #236]
	sub	x1, x29, #72            // =72
	ldur	x9, [x21, #212]
	mov	w2, wzr
	ldur	x10, [x21, #220]
	ldur	x11, [x21, #228]
	stur	w8, [x29, #-16]
	ldur	x8, [x21, #180]
	stp	x9, x10, [x29, #-40]
	stur	x11, [x29, #-24]
	ldur	x9, [x21, #188]
	ldur	x10, [x21, #196]
	ldur	x11, [x21, #204]
	mov	w21, #-1
	str	w0, [sp, #12]           // 4-byte Folded Spill
	mov	x0, x19
	mov	w3, w21
	stp	x8, x9, [x29, #-72]
	sturb	wzr, [x29, #-16]
	stp	x10, x11, [x29, #-56]
	bl	__wait_discard_cmd_range
	stp	x20, x22, [x29, #-56]
	sub	x1, x29, #72            // =72
	ldr	x20, [sp, #16]          // 8-byte Folded Reload
	mov	x0, x19
	mov	w2, wzr
	mov	w3, w21
	stur	w23, [x29, #-16]
	stp	x24, x25, [x29, #-40]
	stur	x26, [x29, #-24]
	stp	x27, x28, [x29, #-72]
	sturb	wzr, [x29, #-16]
	bl	__wait_discard_cmd_range
	ldr	w8, [x20, #8340]
	cbnz	w8, .LBB28_4
// %bb.1:
	ldr	w8, [x20, #8340]
	cbnz	w8, .LBB28_8
.LBB28_2:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB28_9
// %bb.3:
	ldr	w8, [sp, #12]           // 4-byte Folded Reload
	ldp	x20, x19, [sp, #240]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #224]    // 16-byte Folded Reload
	and	w0, w8, #0x1
	ldp	x24, x23, [sp, #208]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #192]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #176]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #160]    // 16-byte Folded Reload
	add	sp, sp, #256            // =256
	ret
.LBB28_4:
	bl	print_bdev_access_info
	adrp	x21, f2fs_dclient
	ldr	x0, [x21, :lo12:f2fs_dclient]
	cbz	x0, .LBB28_7
// %bb.5:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB28_7
// %bb.6:
	ldr	x0, [x21, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_issue_discard_timeout
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #2427
	add	x2, x2, :lo12:.L__func__.f2fs_issue_discard_timeout
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB28_7:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	w8, [x20, #8340]
	cbz	w8, .LBB28_2
.LBB28_8:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 2427; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB28_9:
	bl	__stack_chk_fail
.Lfunc_end28:
	.size	f2fs_issue_discard_timeout, .Lfunc_end28-f2fs_issue_discard_timeout
                                        // -- End function
	.p2align	3               // -- Begin function __issue_discard_cmd
	.type	__issue_discard_cmd,@function
__issue_discard_cmd:                    // @__issue_discard_cmd
// %bb.0:
	sub	sp, sp, #336            // =336
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #240]    // 16-byte Folded Spill
	add	x29, sp, #240           // =240
	stp	x28, x27, [sp, #256]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #272]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #288]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #304]    // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #320]    // 16-byte Folded Spill
	mov	x20, x1
	stur	x8, [x29, #-16]
	ldr	x8, [x0, #136]
	ldrb	w9, [x1, #56]
	ldr	x8, [x8, #168]
	str	x8, [sp, #40]           // 8-byte Folded Spill
	adrp	x8, jiffies
	cbz	w9, .LBB29_2
// %bb.1:
	ldr	x8, [x8, :lo12:jiffies]
	str	x8, [x21, #536]
.LBB29_2:
	ldr	x10, [sp, #40]          // 8-byte Folded Reload
	mov	w8, #8360
	mov	w9, #8344
	mov	x27, xzr
	mov	w19, wzr
	mov	w24, #250
	add	x8, x10, x8
	add	x22, x10, x9
	str	x8, [sp, #32]           // 8-byte Folded Spill
	mov	w8, #8280
	add	x8, x10, x8
	str	x8, [sp, #56]           // 8-byte Folded Spill
	add	x8, x20, #28            // =28
	str	x8, [sp, #24]           // 8-byte Folded Spill
	add	x8, x20, #20            // =20
	str	x8, [sp, #48]           // 8-byte Folded Spill
	add	x8, x20, #36            // =36
	stp	x22, x8, [sp, #8]       // 16-byte Folded Spill
	b	.LBB29_4
.LBB29_3:                               //   in Loop: Header=BB29_4 Depth=1
	mov	x0, x21
	mov	x1, x22
	mov	w2, wzr
	mov	w3, #-1
	bl	__wait_discard_cmd_range
	ldr	x22, [sp, #8]           // 8-byte Folded Reload
.LBB29_4:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB29_6 Depth 2
                                        //       Child Loop BB29_17 Depth 3
	ldr	x8, [sp, #32]           // 8-byte Folded Reload
	str	wzr, [sp, #68]
	ldrb	w8, [x8]
	cbnz	w8, .LBB29_59
.LBB29_5:                               //   in Loop: Header=BB29_4 Depth=1
	add	x0, sp, #72             // =72
	bl	blk_start_plug
	mov	w22, wzr
	mov	w8, #511
.LBB29_6:                               //   Parent Loop BB29_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB29_17 Depth 3
	ldrb	w9, [x20, #56]
	mov	x25, x8
	cbz	w9, .LBB29_8
// %bb.7:                               //   in Loop: Header=BB29_6 Depth=2
	adrp	x10, jiffies
	ldr	x8, [x21, #584]
	ldr	x9, [x21, #536]
	ldr	x10, [x10, :lo12:jiffies]
	madd	x8, x8, x24, x9
	cmp	x8, x10
	b.mi	.LBB29_53
.LBB29_8:                               //   in Loop: Header=BB29_6 Depth=2
	ldr	w8, [x20, #4]
	add	x26, x25, #1            // =1
	cmp	x26, x8
	b.lo	.LBB29_53
// %bb.9:                               //   in Loop: Header=BB29_6 Depth=2
	ldr	w28, [x20]
	ldr	x27, [sp, #48]          // 8-byte Folded Reload
	cmp	w28, #3                 // =3
	b.eq	.LBB29_12
// %bb.10:                              //   in Loop: Header=BB29_6 Depth=2
	ldr	x27, [sp, #48]          // 8-byte Folded Reload
	cmp	x25, #510               // =510
	b.hi	.LBB29_14
// %bb.11:                              //   in Loop: Header=BB29_6 Depth=2
	ldp	x9, x8, [sp, #16]       // 16-byte Folded Reload
	cmp	x25, #14                // =14
	csel	x27, x8, x9, hi
.LBB29_12:                              //   in Loop: Header=BB29_6 Depth=2
	cmp	x25, #15                // =15
	b.hi	.LBB29_14
// %bb.13:                              //   in Loop: Header=BB29_6 Depth=2
	ldrb	w8, [x20, #17]
	cbnz	w8, .LBB29_66
.LBB29_14:                              //   in Loop: Header=BB29_6 Depth=2
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	add	x26, x8, x25, lsl #4
	bl	mutex_lock
	ldr	x23, [x26, #24]!
	cmp	x26, x23
	b.eq	.LBB29_46
// %bb.15:                              //   in Loop: Header=BB29_6 Depth=2
	ldr	x8, [sp, #32]           // 8-byte Folded Reload
	ldrb	w8, [x8]
	cbnz	w8, .LBB29_43
// %bb.16:                              //   in Loop: Header=BB29_6 Depth=2
	cmp	x26, x23
	b.eq	.LBB29_46
.LBB29_17:                              //   Parent Loop BB29_4 Depth=1
                                        //     Parent Loop BB29_6 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldrb	w8, [x23, #58]
	ldr	x28, [x23]
	cbnz	w8, .LBB29_34
.LBB29_18:                              //   in Loop: Header=BB29_17 Depth=3
	ldrb	w8, [x20, #56]
	cbz	w8, .LBB29_20
// %bb.19:                              //   in Loop: Header=BB29_17 Depth=3
	adrp	x10, jiffies
	ldr	x8, [x21, #584]
	ldr	x9, [x21, #536]
	ldr	x10, [x10, :lo12:jiffies]
	madd	x8, x8, x24, x9
	cmp	x8, x10
	b.mi	.LBB29_46
.LBB29_20:                              //   in Loop: Header=BB29_17 Depth=3
	ldrb	w8, [x20, #8]
	cbz	w8, .LBB29_23
// %bb.21:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	w8, [x20, #12]
	cmp	x25, x8
	b.hs	.LBB29_23
// %bb.22:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	w8, [x21, #1868]
	cmp	w8, #5                  // =5
	b.ne	.LBB29_26
.LBB29_23:                              //   in Loop: Header=BB29_17 Depth=3
	sub	x3, x23, #40            // =40
	add	x4, sp, #68             // =68
	mov	x0, x21
	mov	x1, x20
	mov	w2, w25
	bl	__submit_discard_cmd
	ldr	w22, [sp, #68]
.LBB29_24:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	w8, [x27]
	cmp	w22, w8
	b.hs	.LBB29_46
// %bb.25:                              //   in Loop: Header=BB29_17 Depth=3
	mov	x23, x28
	cmp	x26, x28
	b.ne	.LBB29_17
	b	.LBB29_46
.LBB29_26:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	w9, [x21, #1308]
	cbnz	w9, .LBB29_33
// %bb.27:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	w9, [x21, #1312]
	cbnz	w9, .LBB29_33
// %bb.28:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	w9, [x21, #1316]
	cbnz	w9, .LBB29_33
// %bb.29:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	w9, [x21, #1304]
	cbnz	w9, .LBB29_33
// %bb.30:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	w9, [x21, #1300]
	cbnz	w9, .LBB29_33
// %bb.31:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	w9, [x21, #1324]
	cbnz	w9, .LBB29_33
// %bb.32:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	w9, [x21, #1320]
	cbz	w9, .LBB29_38
.LBB29_33:                              //   in Loop: Header=BB29_17 Depth=3
	mov	w19, #1
	b	.LBB29_24
.LBB29_34:                              //   in Loop: Header=BB29_17 Depth=3
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_37
// %bb.35:                              //   in Loop: Header=BB29_17 Depth=3
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_37
// %bb.36:                              //   in Loop: Header=BB29_17 Depth=3
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__issue_discard_cmd
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.__issue_discard_cmd
	mov	w3, #2225
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB29_37:                              //   in Loop: Header=BB29_17 Depth=3
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldrb	w8, [x23, #58]
	cbz	w8, .LBB29_18
	b	.LBB29_102
.LBB29_38:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	x9, [x21, #136]
	cbz	x9, .LBB29_41
// %bb.39:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	x9, [x9, #160]
	cbz	x9, .LBB29_41
// %bb.40:                              //   in Loop: Header=BB29_17 Depth=3
	ldr	w9, [x9, #36]
	cbnz	w9, .LBB29_33
.LBB29_41:                              //   in Loop: Header=BB29_17 Depth=3
	cmp	w8, #6                  // =6
	b.eq	.LBB29_23
// %bb.42:                              //   in Loop: Header=BB29_17 Depth=3
	adrp	x10, jiffies
	ldr	x8, [x21, #560]
	ldr	x9, [x21, #512]
	ldr	x10, [x10, :lo12:jiffies]
	madd	x8, x8, x24, x9
	cmp	x8, x10
	b.pl	.LBB29_33
	b	.LBB29_23
.LBB29_43:                              //   in Loop: Header=BB29_6 Depth=2
	ldr	x23, [sp, #8]           // 8-byte Folded Reload
	mov	x0, x21
	mov	w2, wzr
	mov	x1, x23
	bl	f2fs_check_rb_tree_consistence
	tbz	w0, #0, .LBB29_49
.LBB29_44:                              //   in Loop: Header=BB29_6 Depth=2
	mov	x0, x21
	mov	x1, x23
	mov	w2, wzr
	bl	f2fs_check_rb_tree_consistence
	tbz	w0, #0, .LBB29_103
// %bb.45:                              //   in Loop: Header=BB29_6 Depth=2
	ldr	x23, [x26]
	cmp	x26, x23
	b.ne	.LBB29_17
.LBB29_46:                              //   in Loop: Header=BB29_6 Depth=2
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	bl	mutex_unlock
	tbnz	w19, #0, .LBB29_53
// %bb.47:                              //   in Loop: Header=BB29_6 Depth=2
	ldr	w8, [x27]
	cmp	w22, w8
	b.hs	.LBB29_53
// %bb.48:                              //   in Loop: Header=BB29_6 Depth=2
	sub	x8, x25, #1             // =1
	cbnz	x25, .LBB29_6
	b	.LBB29_53
.LBB29_49:                              //   in Loop: Header=BB29_6 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_52
// %bb.50:                              //   in Loop: Header=BB29_6 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_52
// %bb.51:                              //   in Loop: Header=BB29_6 Depth=2
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__issue_discard_cmd
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.__issue_discard_cmd
	mov	w3, #2219
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_52:                              //   in Loop: Header=BB29_6 Depth=2
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldr	x23, [sp, #8]           // 8-byte Folded Reload
	b	.LBB29_44
.LBB29_53:                              //   in Loop: Header=BB29_4 Depth=1
	add	x0, sp, #72             // =72
	bl	blk_finish_plug
	cbz	x27, .LBB29_55
// %bb.54:                              //   in Loop: Header=BB29_4 Depth=1
	ldr	w8, [x27, #4]
	str	w8, [x20, #44]
.LBB29_55:                              //   in Loop: Header=BB29_4 Depth=1
	cbz	w22, .LBB29_89
// %bb.56:                              //   in Loop: Header=BB29_4 Depth=1
	ldr	w8, [x20]
	cmp	w8, #4                  // =4
	b.ne	.LBB29_89
// %bb.57:                              //   in Loop: Header=BB29_4 Depth=1
	mov	x22, x20
	cbnz	x20, .LBB29_3
// %bb.58:                              //   in Loop: Header=BB29_4 Depth=1
	adrp	x25, dpolicys
	sub	x23, x29, #80           // =80
	add	x25, x25, :lo12:dpolicys
	sub	x1, x29, #80            // =80
	mov	x0, x21
	mov	w2, wzr
	mov	w3, #-1
	sub	x22, x29, #80           // =80
	ldr	w8, [x25, #236]
	ldur	x9, [x25, #212]
	ldur	x10, [x25, #220]
	ldur	x11, [x25, #228]
	stur	w8, [x29, #-24]
	stur	x9, [x29, #-48]
	ldur	x8, [x25, #180]
	stp	x10, x11, [x23, #40]
	ldur	x9, [x25, #188]
	ldur	x10, [x25, #196]
	ldur	x11, [x25, #204]
	sturb	wzr, [x29, #-24]
	stp	x8, x9, [x29, #-80]
	stp	x10, x11, [x29, #-64]
	bl	__wait_discard_cmd_range
	ldr	w8, [x25, #296]
	ldp	x9, x10, [x25, #272]
	ldr	x11, [x25, #288]
	stur	w8, [x29, #-24]
	stur	x9, [x29, #-48]
	stp	x10, x11, [x23, #40]
	ldp	x8, x10, [x25, #240]
	sturb	wzr, [x29, #-24]
	ldp	x9, x11, [x25, #256]
	stp	x8, x10, [x29, #-80]
	stp	x9, x11, [x29, #-64]
	b	.LBB29_3
.LBB29_59:                              //   in Loop: Header=BB29_4 Depth=1
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	bl	mutex_lock
	mov	x0, x21
	mov	x1, x22
	mov	w2, wzr
	bl	f2fs_check_rb_tree_consistence
	tbz	w0, #0, .LBB29_62
.LBB29_60:                              //   in Loop: Header=BB29_4 Depth=1
	mov	x0, x21
	mov	x1, x22
	mov	w2, wzr
	bl	f2fs_check_rb_tree_consistence
	tbz	w0, #0, .LBB29_104
// %bb.61:                              //   in Loop: Header=BB29_4 Depth=1
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	bl	mutex_unlock
	b	.LBB29_5
.LBB29_62:                              //   in Loop: Header=BB29_4 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_65
// %bb.63:                              //   in Loop: Header=BB29_4 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_65
// %bb.64:                              //   in Loop: Header=BB29_4 Depth=1
	adrp	x22, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__issue_discard_cmd
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.__issue_discard_cmd
	mov	w3, #2187
	ldr	x0, [x22, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_65:                              //   in Loop: Header=BB29_4 Depth=1
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldr	x22, [sp, #8]           // 8-byte Folded Reload
	b	.LBB29_60
.LBB29_66:
	ldr	x8, [x21, #136]
	stur	wzr, [x29, #-116]
	ldr	x19, [x8, #168]
	mov	w8, #8280
	stp	xzr, xzr, [x29, #-96]
	add	x23, x19, x8
	ldr	w22, [x19, #8328]
	mov	x0, x23
	stp	xzr, xzr, [x29, #-112]
	bl	mutex_lock
	mov	w8, #8344
	sub	x3, x29, #88            // =88
	add	x0, x19, x8
	sub	x4, x29, #96            // =96
	sub	x5, x29, #104           // =104
	sub	x6, x29, #112           // =112
	mov	x1, xzr
	mov	w2, w22
	mov	w7, #1
	str	xzr, [sp]
	bl	f2fs_lookup_rb_tree_ret
	ldur	x8, [x29, #-96]
	cmp	x0, #0                  // =0
	csel	x24, x8, x0, eq
	sub	x0, x29, #80            // =80
	bl	blk_start_plug
	mov	w22, wzr
	cbz	x24, .LBB29_88
// %bb.67:
	ldp	x9, x8, [sp, #16]       // 16-byte Folded Reload
	cmp	w26, #15                // =15
	csel	x8, x8, x9, gt
	cmp	w26, #511               // =511
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	ccmp	w28, #3, #4, le
	csel	x28, x9, x8, eq
	b	.LBB29_70
.LBB29_68:                              //   in Loop: Header=BB29_70 Depth=1
	mov	x0, x24
	bl	rb_next
	mov	x26, x0
.LBB29_69:                              //   in Loop: Header=BB29_70 Depth=1
	mov	x24, x26
	cbz	x26, .LBB29_88
.LBB29_70:                              // =>This Inner Loop Header: Depth=1
	ldrb	w8, [x24, #98]
	cbnz	w8, .LBB29_68
// %bb.71:                              //   in Loop: Header=BB29_70 Depth=1
	ldrb	w8, [x20, #8]
	cbz	w8, .LBB29_85
// %bb.72:                              //   in Loop: Header=BB29_70 Depth=1
	ldr	w8, [x21, #1868]
	cmp	w8, #5                  // =5
	b.eq	.LBB29_85
// %bb.73:                              //   in Loop: Header=BB29_70 Depth=1
	ldr	w9, [x21, #1308]
	cbnz	w9, .LBB29_92
// %bb.74:                              //   in Loop: Header=BB29_70 Depth=1
	ldr	w9, [x21, #1312]
	cbnz	w9, .LBB29_92
// %bb.75:                              //   in Loop: Header=BB29_70 Depth=1
	ldr	w9, [x21, #1316]
	cbnz	w9, .LBB29_92
// %bb.76:                              //   in Loop: Header=BB29_70 Depth=1
	ldr	w9, [x21, #1304]
	cbnz	w9, .LBB29_92
// %bb.77:                              //   in Loop: Header=BB29_70 Depth=1
	ldr	w9, [x21, #1300]
	cbnz	w9, .LBB29_92
// %bb.78:                              //   in Loop: Header=BB29_70 Depth=1
	ldr	w9, [x21, #1324]
	cbnz	w9, .LBB29_92
// %bb.79:                              //   in Loop: Header=BB29_70 Depth=1
	ldr	w9, [x21, #1320]
	cbnz	w9, .LBB29_92
// %bb.80:                              //   in Loop: Header=BB29_70 Depth=1
	ldr	x9, [x21, #136]
	cbz	x9, .LBB29_83
// %bb.81:                              //   in Loop: Header=BB29_70 Depth=1
	ldr	x9, [x9, #160]
	cbz	x9, .LBB29_83
// %bb.82:                              //   in Loop: Header=BB29_70 Depth=1
	ldr	w9, [x9, #36]
	cbnz	w9, .LBB29_92
.LBB29_83:                              //   in Loop: Header=BB29_70 Depth=1
	cmp	w8, #6                  // =6
	b.eq	.LBB29_85
// %bb.84:                              //   in Loop: Header=BB29_70 Depth=1
	adrp	x10, jiffies
	ldr	x8, [x21, #560]
	ldr	x9, [x21, #512]
	mov	w11, #250
	ldr	x10, [x10, :lo12:jiffies]
	madd	x8, x8, x11, x9
	cmp	x8, x10
	b.pl	.LBB29_92
.LBB29_85:                              //   in Loop: Header=BB29_70 Depth=1
	ldp	w8, w9, [x24, #24]
	sub	x4, x29, #116           // =116
	mov	x0, x21
	mov	x1, x20
	mov	w2, w25
	mov	x3, x24
	add	w8, w9, w8
	str	w8, [x19, #8328]
	bl	__submit_discard_cmd
	ldur	w22, [x29, #-116]
	ldr	w8, [x28]
	cmp	w22, w8
	b.hs	.LBB29_93
// %bb.86:                              //   in Loop: Header=BB29_70 Depth=1
	mov	w27, w0
	mov	x0, x24
	bl	rb_next
	mov	x26, x0
	cbz	w27, .LBB29_69
// %bb.87:                              //   in Loop: Header=BB29_70 Depth=1
	mov	x0, x21
	mov	x1, x24
	bl	__remove_discard_cmd
	b	.LBB29_69
.LBB29_88:
	sub	x0, x29, #80            // =80
	bl	blk_finish_plug
	mov	w20, wzr
	str	wzr, [x19, #8328]
	b	.LBB29_95
.LBB29_89:
	cbnz	w22, .LBB29_99
// %bb.90:
	tbz	w19, #0, .LBB29_99
// %bb.91:
	mov	w8, #-1
	mov	w22, w8
	str	w8, [sp, #68]
	b	.LBB29_99
.LBB29_92:
	mov	w20, #1
	b	.LBB29_94
.LBB29_93:
	mov	w20, wzr
.LBB29_94:
	sub	x0, x29, #80            // =80
	bl	blk_finish_plug
.LBB29_95:
	mov	x0, x23
	bl	mutex_unlock
	cbnz	w22, .LBB29_98
// %bb.96:
	cbz	w20, .LBB29_98
// %bb.97:
	mov	w8, #-1
	mov	w22, w8
	stur	w8, [x29, #-116]
.LBB29_98:
	add	x0, sp, #72             // =72
	str	w22, [sp, #68]
	bl	blk_finish_plug
.LBB29_99:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB29_101
// %bb.100:
	mov	w0, w22
	ldp	x20, x19, [sp, #320]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #304]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #288]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #272]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #256]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #240]    // 16-byte Folded Reload
	add	sp, sp, #336            // =336
	ret
.LBB29_101:
	bl	__stack_chk_fail
.LBB29_102:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 2225; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_103:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 2219; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_104:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 2187; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end29:
	.size	__issue_discard_cmd, .Lfunc_end29-__issue_discard_cmd
                                        // -- End function
	.globl	f2fs_release_discard_addrs // -- Begin function f2fs_release_discard_addrs
	.p2align	3
	.type	f2fs_release_discard_addrs,@function
f2fs_release_discard_addrs:             // @f2fs_release_discard_addrs
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	ldr	x8, [x0, #136]
	str	x23, [sp, #16]          // 8-byte Folded Spill
	ldr	x20, [x8, #168]
	ldr	x19, [x20, #8]!
	cmp	x19, x20
	b.eq	.LBB30_5
// %bb.1:
	ldr	x8, [x19]
	mov	x21, #256
	movk	x21, #57005, lsl #48
	adrp	x22, discard_entry_slab
	b	.LBB30_3
.LBB30_2:                               //   in Loop: Header=BB30_3 Depth=1
	add	x8, x21, #256           // =256
	mov	x1, x19
	stp	x21, x8, [x19]
	ldr	x0, [x22, :lo12:discard_entry_slab]
	bl	kmem_cache_free
	ldr	x8, [x23]
	mov	x19, x23
	cmp	x23, x20
	b.eq	.LBB30_5
.LBB30_3:                               // =>This Inner Loop Header: Depth=1
	mov	x0, x19
	mov	x23, x8
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB30_2
// %bb.4:                               //   in Loop: Header=BB30_3 Depth=1
	ldp	x9, x8, [x19]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB30_2
.LBB30_5:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end30:
	.size	f2fs_release_discard_addrs, .Lfunc_end30-f2fs_release_discard_addrs
                                        // -- End function
	.globl	f2fs_clear_prefree_segments // -- Begin function f2fs_clear_prefree_segments
	.p2align	3
	.type	f2fs_clear_prefree_segments,@function
f2fs_clear_prefree_segments:            // @f2fs_clear_prefree_segments
// %bb.0:
	sub	sp, sp, #144            // =144
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	stp	x28, x27, [sp, #64]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #80]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #96]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #136]
	ldr	w20, [x1]
	stur	x1, [x29, #-16]         // 8-byte Folded Spill
	ldr	x26, [x8, #16]
	ldr	x9, [x8, #168]
	ldr	w8, [x0, #1504]
	ldr	x21, [x26, #64]
	str	x9, [sp, #16]           // 8-byte Folded Spill
	add	x9, x9, #8              // =8
	cmp	w8, #1                  // =1
	str	x9, [sp, #24]           // 8-byte Folded Spill
	b.ne	.LBB31_2
// %bb.1:
	ldr	w8, [x19, #1192]
	cmp	w8, #1                  // =1
	cset	w22, hi
	b	.LBB31_3
.LBB31_2:
	mov	w22, wzr
.LBB31_3:
	add	x0, x26, #80            // =80
	str	x0, [sp, #8]            // 8-byte Folded Spill
	bl	mutex_lock
	ldr	x8, [x19, #136]
	mov	x0, x21
	mov	x2, xzr
	ldr	w1, [x8, #96]
	bl	find_next_bit
	ldr	x8, [x19, #136]
	mov	x24, x0
	ldr	w8, [x8, #96]
	cmp	w8, w24
	b.ls	.LBB31_57
// %bb.4:
	mov	w25, #1
	mov	w28, #-1
	b	.LBB31_8
.LBB31_5:                               //   in Loop: Header=BB31_8 Depth=1
	ldr	x10, [x19, #16]
	add	x10, x10, #72           // =72
.LBB31_6:                               //   in Loop: Header=BB31_8 Depth=1
	ldr	x8, [x8, #8]
	mov	x0, x19
	ldr	w10, [x10]
	ldr	w11, [x19, #1184]
	ldr	w8, [x8]
	lsl	w2, w9, w11
	add	w8, w8, w24
	lsl	w8, w8, w11
	add	w1, w8, w10
	bl	f2fs_issue_discard
.LBB31_7:                               //   in Loop: Header=BB31_8 Depth=1
	ldr	x8, [x19, #136]
	cmn	w23, #1                 // =1
	cset	w9, ne
	mov	x0, x21
	and	w9, w22, w9
	ldr	w1, [x8, #96]
	sub	w8, w23, w9
	add	w2, w8, #1              // =1
	bl	find_next_bit
	ldr	x8, [x19, #136]
	mov	x24, x0
	ldr	w8, [x8, #96]
	cmp	w8, w24
	b.ls	.LBB31_57
.LBB31_8:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB31_13 Depth 2
                                        //     Child Loop BB31_21 Depth 2
                                        //     Child Loop BB31_37 Depth 2
	mov	w1, w8
	add	w2, w24, #1             // =1
	mov	x0, x21
	bl	find_next_zero_bit
	mov	x23, x0
	cbz	w22, .LBB31_10
// %bb.9:                               //   in Loop: Header=BB31_8 Depth=1
	ldr	w8, [x19, #1192]
	add	w9, w23, w8
	udiv	w10, w24, w8
	sub	w9, w9, #1              // =1
	udiv	w9, w9, w8
	mul	w24, w10, w8
	mul	w23, w9, w8
.LBB31_10:                              //   in Loop: Header=BB31_8 Depth=1
	subs	w9, w23, w24
	b.ls	.LBB31_16
// %bb.11:                              //   in Loop: Header=BB31_8 Depth=1
	mov	w8, w24
	b	.LBB31_13
.LBB31_12:                              //   in Loop: Header=BB31_13 Depth=2
	add	w8, w8, #1              // =1
	cmp	w8, w23
	b.eq	.LBB31_16
.LBB31_13:                              //   Parent Loop BB31_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	lsr	w11, w8, #6
	ldr	x10, [x21, w11, uxtw #3]
	stur	x10, [x29, #-8]
	lsl	x10, x25, x8
	ldur	x12, [x29, #-8]
	tst	x12, x10
	b.eq	.LBB31_12
// %bb.14:                              //   in Loop: Header=BB31_13 Depth=2
	add	x11, x21, x11, lsl #3
	//APP
	// atomic64_fetch_andnot
	prfm	pstl1strm, [x11]
1:	ldxr	x12, [x11]
	bic	x13, x12, x10
	stlxr	w14, x13, [x11]
	cbnz	w14, 1b
	dmb ish
	//NO_APP
	tst	x12, x10
	b.eq	.LBB31_12
// %bb.15:                              //   in Loop: Header=BB31_13 Depth=2
	ldr	w10, [x26, #140]
	sub	w10, w10, #1            // =1
	str	w10, [x26, #140]
	b	.LBB31_12
.LBB31_16:                              //   in Loop: Header=BB31_8 Depth=1
	ldrb	w8, [x19, #1424]
	tbnz	w8, #2, .LBB31_18
.LBB31_17:                              //   in Loop: Header=BB31_8 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2180]
	tbz	w8, #1, .LBB31_7
	b	.LBB31_27
.LBB31_18:                              //   in Loop: Header=BB31_8 Depth=1
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.lt	.LBB31_24
// %bb.19:                              //   in Loop: Header=BB31_8 Depth=1
	ldr	x10, [x19, #3032]
	mov	x11, xzr
	b	.LBB31_21
.LBB31_20:                              //   in Loop: Header=BB31_21 Depth=2
	add	x11, x11, #1            // =1
	add	x10, x10, #192          // =192
	cmp	x11, x8
	b.eq	.LBB31_17
.LBB31_21:                              //   Parent Loop BB31_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x12, [x10]
	ldr	x12, [x12, #128]
	ldr	x12, [x12, #1280]
	ldr	x13, [x12, #504]
	tbnz	w13, #11, .LBB31_27
// %bb.22:                              //   in Loop: Header=BB31_21 Depth=2
	cbz	x12, .LBB31_20
// %bb.23:                              //   in Loop: Header=BB31_21 Depth=2
	ldr	w12, [x12, #1740]
	sub	w12, w12, #1            // =1
	cmp	w12, #2                 // =2
	b.hs	.LBB31_20
	b	.LBB31_27
.LBB31_24:                              //   in Loop: Header=BB31_8 Depth=1
	ldr	x8, [x19]
	ldr	x8, [x8, #248]
	ldr	x8, [x8, #128]
	ldr	x8, [x8, #1280]
	ldr	x10, [x8, #504]
	tbnz	w10, #11, .LBB31_27
// %bb.25:                              //   in Loop: Header=BB31_8 Depth=1
	cbz	x8, .LBB31_17
// %bb.26:                              //   in Loop: Header=BB31_8 Depth=1
	ldr	w8, [x8, #1740]
	sub	w8, w8, #1              // =1
	cmp	w8, #2                  // =2
	b.hs	.LBB31_17
.LBB31_27:                              //   in Loop: Header=BB31_8 Depth=1
	tbz	w20, #4, .LBB31_30
// %bb.28:                              //   in Loop: Header=BB31_8 Depth=1
	ldur	x8, [x29, #-16]         // 8-byte Folded Reload
	ldr	x8, [x8, #8]
	cmp	x8, w24, uxtw
	b.hi	.LBB31_30
// %bb.29:                              //   in Loop: Header=BB31_8 Depth=1
	ldur	x8, [x29, #-16]         // 8-byte Folded Reload
	sub	w10, w23, #1            // =1
	ldr	x8, [x8, #16]
	cmp	x8, x10
	b.hs	.LBB31_7
.LBB31_30:                              //   in Loop: Header=BB31_8 Depth=1
	ldr	w8, [x19, #1504]
	cmp	w8, #1                  // =1
	b.ne	.LBB31_32
// %bb.31:                              //   in Loop: Header=BB31_8 Depth=1
	ldr	w8, [x19, #1192]
	cmp	w8, #2                  // =2
	b.hs	.LBB31_37
.LBB31_32:                              //   in Loop: Header=BB31_8 Depth=1
	ldr	x8, [x19, #136]
	cbz	x8, .LBB31_5
// %bb.33:                              //   in Loop: Header=BB31_8 Depth=1
	add	x10, x8, #80            // =80
	b	.LBB31_6
.LBB31_34:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	x10, [x19, #16]
	add	x10, x10, #72           // =72
.LBB31_35:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	x9, [x9, #8]
	mov	x0, x19
	ldr	w10, [x10]
	ldr	w11, [x19, #1184]
	ldr	w9, [x9]
	lsl	w2, w8, w11
	add	w9, w9, w27
	lsl	w9, w9, w11
	add	w1, w9, w10
	bl	f2fs_issue_discard
	ldr	w8, [x19, #1192]
.LBB31_36:                              //   in Loop: Header=BB31_37 Depth=2
	add	w24, w8, w27
	cmp	w24, w23
	b.hs	.LBB31_56
.LBB31_37:                              //   Parent Loop BB31_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x9, [x19, #136]
	udiv	w10, w24, w8
	cmn	w24, #1                 // =1
	csel	w11, w28, w10, eq
	ldr	x12, [x9, #24]
	mul	w27, w11, w8
	ldr	w13, [x12, #100]
	udiv	w13, w13, w8
	cmp	w11, w13
	b.eq	.LBB31_36
// %bb.38:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	w13, [x12, #220]
	udiv	w13, w13, w8
	cmp	w11, w13
	b.eq	.LBB31_36
// %bb.39:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	w13, [x12, #340]
	udiv	w13, w13, w8
	cmp	w11, w13
	b.eq	.LBB31_36
// %bb.40:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	w13, [x12, #460]
	udiv	w13, w13, w8
	cmp	w11, w13
	b.eq	.LBB31_36
// %bb.41:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	w13, [x12, #580]
	udiv	w13, w13, w8
	cmp	w11, w13
	b.eq	.LBB31_36
// %bb.42:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	w13, [x12, #700]
	udiv	w13, w13, w8
	cmp	w11, w13
	b.eq	.LBB31_36
// %bb.43:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	w13, [x12, #820]
	udiv	w13, w13, w8
	cmp	w11, w13
	b.eq	.LBB31_36
// %bb.44:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	w13, [x12, #940]
	udiv	w13, w13, w8
	cmp	w11, w13
	b.eq	.LBB31_36
// %bb.45:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	w13, [x12, #1060]
	udiv	w13, w13, w8
	cmp	w11, w13
	b.eq	.LBB31_36
// %bb.46:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	w13, [x12, #1180]
	udiv	w13, w13, w8
	cmp	w11, w13
	b.eq	.LBB31_36
// %bb.47:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	w12, [x12, #1300]
	udiv	w12, w12, w8
	cmp	w11, w12
	b.eq	.LBB31_36
// %bb.48:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	x11, [x9]
	cmp	w8, #2                  // =2
	b.lo	.LBB31_52
// %bb.49:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	x11, [x11, #144]
	cmn	w24, #1                 // =1
	b.ne	.LBB31_51
// %bb.50:                              //   in Loop: Header=BB31_37 Depth=2
	mov	x10, x28
.LBB31_51:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	w10, [x11, x10, lsl #2]
	b	.LBB31_53
.LBB31_52:                              //   in Loop: Header=BB31_37 Depth=2
	ldr	x10, [x11, #136]
	mov	w11, #48
	umull	x11, w24, w11
	ldr	w10, [x10, x11]
	ubfx	w10, w10, #6, #10
.LBB31_53:                              //   in Loop: Header=BB31_37 Depth=2
	cbnz	w10, .LBB31_36
// %bb.54:                              //   in Loop: Header=BB31_37 Depth=2
	cbz	x9, .LBB31_34
// %bb.55:                              //   in Loop: Header=BB31_37 Depth=2
	add	x10, x9, #80            // =80
	b	.LBB31_35
.LBB31_56:                              //   in Loop: Header=BB31_8 Depth=1
	sub	w23, w24, #1            // =1
	b	.LBB31_7
.LBB31_57:
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	bl	mutex_unlock
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	ldr	x11, [x8]
	cmp	x11, x8
	b.eq	.LBB31_82
// %bb.58:
	tbz	w20, #4, .LBB31_72
// %bb.59:
	mov	x22, x11
	//APP
	mrs x28, sp_el0
	//NO_APP
	b	.LBB31_61
.LBB31_60:                              //   in Loop: Header=BB31_61 Depth=1
	mov	x9, #256
	mov	x1, x21
	movk	x9, #57005, lsl #48
	add	x8, x9, #256            // =256
	stp	x9, x8, [x21]
	adrp	x8, discard_entry_slab
	ldr	x0, [x8, :lo12:discard_entry_slab]
	bl	kmem_cache_free
	ldp	x11, x9, [sp, #8]       // 16-byte Folded Reload
	ldr	x10, [sp, #24]          // 8-byte Folded Reload
	ldr	w8, [x9, #8312]
	mov	x22, x11
	cmp	x11, x10
	sub	w8, w8, w20
	str	w8, [x9, #8312]
	b.eq	.LBB31_82
.LBB31_61:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB31_64 Depth 2
	ldr	x8, [x11]
	mov	x23, x11
	mov	w24, wzr
	mov	w20, wzr
	mov	x21, x11
	str	x8, [sp, #8]            // 8-byte Folded Spill
	ldr	x9, [x23, #20]!
	ldr	w8, [x19, #1188]
	and	w27, w9, #0x1
	b	.LBB31_64
.LBB31_62:                              //   in Loop: Header=BB31_64 Depth=2
	mov	x2, x25
	bl	find_next_bit
	mov	x24, x0
.LBB31_63:                              //   in Loop: Header=BB31_64 Depth=2
	ldr	w8, [x19, #1188]
	eor	w27, w27, #0x1
	cmp	w24, w8
	b.hs	.LBB31_70
.LBB31_64:                              //   Parent Loop BB31_61 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	w1, w8
	mov	w25, w24
	mov	x0, x23
	tbz	w27, #0, .LBB31_62
// %bb.65:                              //   in Loop: Header=BB31_64 Depth=2
	mov	x2, x25
	bl	find_next_zero_bit
	ldr	x8, [x19, #16]
	mov	x24, x0
	ldrb	w8, [x8, #2180]
	tbnz	w8, #1, .LBB31_63
// %bb.66:                              //   in Loop: Header=BB31_64 Depth=2
	ldur	x8, [x29, #-16]         // 8-byte Folded Reload
	sub	w26, w24, w25
	ldr	x8, [x8, #24]
	cmp	x8, w26, uxtw
	b.hi	.LBB31_63
// %bb.67:                              //   in Loop: Header=BB31_64 Depth=2
	ldr	x8, [x28]
	tbz	w8, #0, .LBB31_69
// %bb.68:                              //   in Loop: Header=BB31_64 Depth=2
	ldrb	w8, [x28, #2360]
	tbnz	w8, #1, .LBB31_63
.LBB31_69:                              //   in Loop: Header=BB31_64 Depth=2
	ldr	w8, [x21, #16]
	mov	x0, x19
	mov	w2, w26
	add	w1, w8, w25
	bl	f2fs_issue_discard
	add	w20, w26, w20
	b	.LBB31_63
.LBB31_70:                              //   in Loop: Header=BB31_61 Depth=1
	mov	x0, x22
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB31_60
// %bb.71:                              //   in Loop: Header=BB31_61 Depth=1
	ldp	x9, x8, [x21]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB31_60
.LBB31_72:
	mov	x21, x11
	b	.LBB31_74
.LBB31_73:                              //   in Loop: Header=BB31_74 Depth=1
	mov	x9, #256
	mov	x1, x20
	movk	x9, #57005, lsl #48
	add	x8, x9, #256            // =256
	stp	x9, x8, [x20]
	adrp	x8, discard_entry_slab
	ldr	x0, [x8, :lo12:discard_entry_slab]
	bl	kmem_cache_free
	ldp	x9, x10, [sp, #16]      // 16-byte Folded Reload
	mov	x11, x28
	mov	x21, x28
	ldr	w8, [x9, #8312]
	cmp	x28, x10
	sub	w8, w8, w26
	str	w8, [x9, #8312]
	b.eq	.LBB31_82
.LBB31_74:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB31_77 Depth 2
	mov	x22, x11
	ldr	x28, [x11]
	mov	w23, wzr
	mov	w26, wzr
	mov	x20, x11
	ldr	x9, [x22, #20]!
	ldr	w8, [x19, #1188]
	and	w27, w9, #0x1
	b	.LBB31_77
.LBB31_75:                              //   in Loop: Header=BB31_77 Depth=2
	mov	x2, x24
	bl	find_next_bit
	mov	x23, x0
.LBB31_76:                              //   in Loop: Header=BB31_77 Depth=2
	ldr	w8, [x19, #1188]
	eor	w27, w27, #0x1
	cmp	w23, w8
	b.hs	.LBB31_80
.LBB31_77:                              //   Parent Loop BB31_74 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	w1, w8
	mov	w24, w23
	mov	x0, x22
	tbz	w27, #0, .LBB31_75
// %bb.78:                              //   in Loop: Header=BB31_77 Depth=2
	mov	x2, x24
	bl	find_next_zero_bit
	ldr	x8, [x19, #16]
	mov	x23, x0
	ldrb	w8, [x8, #2180]
	tbnz	w8, #1, .LBB31_76
// %bb.79:                              //   in Loop: Header=BB31_77 Depth=2
	ldr	w8, [x20, #16]
	sub	w25, w23, w24
	mov	x0, x19
	mov	w2, w25
	add	w1, w8, w24
	bl	f2fs_issue_discard
	add	w26, w25, w26
	b	.LBB31_76
.LBB31_80:                              //   in Loop: Header=BB31_74 Depth=1
	mov	x0, x21
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB31_73
// %bb.81:                              //   in Loop: Header=BB31_74 Depth=1
	ldp	x9, x8, [x20]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB31_73
.LBB31_82:
	ldr	x8, [x19, #136]
	ldr	x21, [x8, #168]
	mov	w8, #8280
	add	x20, x21, x8
	mov	x0, x20
	bl	mutex_lock
	ldr	w8, [x21, #8320]
	mov	w10, #511
.LBB31_83:                              // =>This Inner Loop Header: Depth=1
	mov	w9, w10
	add	w10, w10, #1            // =1
	cmp	w10, w8
	b.lo	.LBB31_86
// %bb.84:                              //   in Loop: Header=BB31_83 Depth=1
	add	x10, x21, w9, uxtw #4
	ldr	x11, [x10, #24]!
	cmp	x10, x11
	b.ne	.LBB31_87
// %bb.85:                              //   in Loop: Header=BB31_83 Depth=1
	sub	w10, w9, #1             // =1
	cbnz	w9, .LBB31_83
.LBB31_86:
	mov	x0, x20
	bl	mutex_unlock
	b	.LBB31_96
.LBB31_87:
	mov	x0, x20
	bl	mutex_unlock
	ldr	w8, [x19, #1868]
	cmp	w8, #5                  // =5
	b.ne	.LBB31_89
.LBB31_88:
	mov	w9, #8248
	mov	w8, #1
	add	x0, x21, x9
	mov	w1, #1
	mov	w2, wzr
	mov	x3, xzr
	str	w8, [x21, #8272]
	bl	__wake_up
	b	.LBB31_96
.LBB31_89:
	ldr	w9, [x19, #1308]
	cbnz	w9, .LBB31_96
// %bb.90:
	ldr	w9, [x19, #1312]
	cbnz	w9, .LBB31_96
// %bb.91:
	ldr	w9, [x19, #1316]
	cbnz	w9, .LBB31_96
// %bb.92:
	ldr	w9, [x19, #1304]
	cbnz	w9, .LBB31_96
// %bb.93:
	ldr	w9, [x19, #1300]
	cbnz	w9, .LBB31_96
// %bb.94:
	ldr	w9, [x19, #1324]
	cbnz	w9, .LBB31_96
// %bb.95:
	ldr	w9, [x19, #1320]
	cbz	w9, .LBB31_97
.LBB31_96:
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #144            // =144
	ret
.LBB31_97:
	ldr	x9, [x19, #136]
	cbz	x9, .LBB31_100
// %bb.98:
	ldr	x9, [x9, #160]
	cbz	x9, .LBB31_100
// %bb.99:
	ldr	w9, [x9, #36]
	cbnz	w9, .LBB31_96
.LBB31_100:
	cmp	w8, #6                  // =6
	b.eq	.LBB31_88
// %bb.101:
	adrp	x9, jiffies
	ldr	x8, [x19, #560]
	ldr	x10, [x19, #512]
	mov	w11, #250
	ldr	x9, [x9, :lo12:jiffies]
	madd	x8, x8, x11, x10
	cmp	x8, x9
	b.pl	.LBB31_96
	b	.LBB31_88
.Lfunc_end31:
	.size	f2fs_clear_prefree_segments, .Lfunc_end31-f2fs_clear_prefree_segments
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_issue_discard
	.type	f2fs_issue_discard,@function
f2fs_issue_discard:                     // @f2fs_issue_discard
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	w20, w2
	mov	x2, xzr
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x0
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	mov	w22, w1
	bl	f2fs_target_device
	add	w8, w20, w22
	cmp	w8, w22
	b.ls	.LBB32_28
// %bb.1:
	mov	w22, w22
	mov	x21, x0
	mov	x20, xzr
	mov	w25, w8
	mov	w26, #-1
	mov	w27, #48
	mov	w28, #1
	mov	x23, x22
	b	.LBB32_3
.LBB32_2:                               //   in Loop: Header=BB32_3 Depth=1
	add	x23, x23, #1            // =1
	add	x20, x20, #1            // =1
	cmp	x23, x25
	b.eq	.LBB32_26
.LBB32_3:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB32_12 Depth 2
	cmp	x22, x23
	b.eq	.LBB32_6
// %bb.4:                               //   in Loop: Header=BB32_3 Depth=1
	mov	x0, x19
	mov	w1, w23
	mov	x2, xzr
	bl	f2fs_target_device
	cmp	x0, x21
	b.eq	.LBB32_6
// %bb.5:                               //   in Loop: Header=BB32_3 Depth=1
	mov	x24, x0
	mov	x0, x19
	mov	x1, x21
	mov	w2, w22
	mov	w3, w20
	bl	__issue_discard_async
	mov	x20, xzr
	mov	x21, x24
	mov	x22, x23
.LBB32_6:                               //   in Loop: Header=BB32_3 Depth=1
	add	w8, w23, #3             // =3
	cmp	w8, #3                  // =3
	b.hi	.LBB32_8
// %bb.7:                               //   in Loop: Header=BB32_3 Depth=1
	mov	w9, w26
	cmp	w8, #2                  // =2
	b.ne	.LBB32_21
.LBB32_8:                               //   in Loop: Header=BB32_3 Depth=1
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB32_16
// %bb.9:                               //   in Loop: Header=BB32_3 Depth=1
	ldr	x8, [x19]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB32_15
// %bb.10:                              //   in Loop: Header=BB32_3 Depth=1
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB32_12
.LBB32_11:                              //   in Loop: Header=BB32_12 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB32_15
.LBB32_12:                              //   Parent Loop BB32_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	x23, x12
	b.lo	.LBB32_11
// %bb.13:                              //   in Loop: Header=BB32_12 Depth=2
	ldr	w12, [x11]
	cmp	x23, x12
	b.hi	.LBB32_11
// %bb.14:                              //   in Loop: Header=BB32_3 Depth=1
	ldur	x8, [x11, #-80]
.LBB32_15:                              //   in Loop: Header=BB32_3 Depth=1
	cbz	x8, .LBB32_20
.LBB32_16:                              //   in Loop: Header=BB32_3 Depth=1
	ldr	x8, [x19, #136]
	cbz	x8, .LBB32_18
// %bb.17:                              //   in Loop: Header=BB32_3 Depth=1
	add	x9, x8, #80             // =80
	b	.LBB32_19
.LBB32_18:                              //   in Loop: Header=BB32_3 Depth=1
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB32_19:                              //   in Loop: Header=BB32_3 Depth=1
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	sub	w9, w23, w9
	lsr	w9, w9, w10
	sub	w9, w9, w8
	b	.LBB32_21
.LBB32_20:                              //   in Loop: Header=BB32_3 Depth=1
	mov	w9, w26
.LBB32_21:                              //   in Loop: Header=BB32_3 Depth=1
	ldr	x10, [x19, #136]
	mov	w9, w9
	ldr	x8, [x10]
	ldr	x8, [x8, #136]
	cbz	x10, .LBB32_23
// %bb.22:                              //   in Loop: Header=BB32_3 Depth=1
	add	x10, x10, #80           // =80
	b	.LBB32_24
.LBB32_23:                              //   in Loop: Header=BB32_3 Depth=1
	ldr	x10, [x19, #16]
	add	x10, x10, #72           // =72
.LBB32_24:                              //   in Loop: Header=BB32_3 Depth=1
	ldr	w10, [x10]
	madd	x8, x9, x27, x8
	ldr	w11, [x19, #1188]
	sub	w9, w23, w10
	ldr	x8, [x8, #32]
	sub	w10, w11, #1            // =1
	and	w9, w10, w9
	lsr	x10, x9, #3
	mvn	w9, w9
	and	w9, w9, #0x7
	ldrb	w11, [x8, x10]
	lsl	w9, w28, w9
	orr	w12, w11, w9
	tst	w9, w11
	strb	w12, [x8, x10]
	b.ne	.LBB32_2
// %bb.25:                              //   in Loop: Header=BB32_3 Depth=1
	ldr	w8, [x19, #1244]
	sub	w8, w8, #1              // =1
	str	w8, [x19, #1244]
	b	.LBB32_2
.LBB32_26:
	cbz	x20, .LBB32_28
// %bb.27:
	mov	x0, x19
	mov	x1, x21
	mov	w2, w22
	mov	w3, w20
	bl	__issue_discard_async
.LBB32_28:
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end32:
	.size	f2fs_issue_discard, .Lfunc_end32-f2fs_issue_discard
                                        // -- End function
	.globl	__set_sit_entry_type    // -- Begin function __set_sit_entry_type
	.p2align	3
	.type	__set_sit_entry_type,@function
__set_sit_entry_type:                   // @__set_sit_entry_type
// %bb.0:
	ldr	x9, [x0, #136]
	mov	w8, #48
	umull	x8, w2, w8
	ldr	x9, [x9]
	ldr	x9, [x9, #136]
	ldr	w10, [x9, x8]
	bfxil	w10, w1, #0, #6
	str	w10, [x9, x8]
	cbz	w3, .LBB33_2
// %bb.1:
	ldr	x8, [x0, #136]
	add	w10, w2, #63            // =63
	cmp	w2, #0                  // =0
	mov	w13, #1
	csel	w10, w10, w2, lt
	asr	w11, w10, #6
	and	w10, w10, #0xffffffc0
	ldr	x8, [x8]
	sbfiz	x11, x11, #3, #32
	sub	w10, w2, w10
	ldr	x9, [x8, #72]
	lsl	x10, x13, x10
	ldr	x12, [x9, x11]
	orr	x13, x12, x10
	tst	x12, x10
	str	x13, [x9, x11]
	b.eq	.LBB33_3
.LBB33_2:
	ret
.LBB33_3:
	ldr	w9, [x8, #80]
	add	w9, w9, #1              // =1
	str	w9, [x8, #80]
	ret
.Lfunc_end33:
	.size	__set_sit_entry_type, .Lfunc_end33-__set_sit_entry_type
                                        // -- End function
	.globl	f2fs_invalidate_blocks  // -- Begin function f2fs_invalidate_blocks
	.p2align	3
	.type	f2fs_invalidate_blocks,@function
f2fs_invalidate_blocks:                 // @f2fs_invalidate_blocks
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	w20, w1
	mov	x19, x0
	add	w8, w1, #3              // =3
	cmp	w8, #4                  // =4
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	b.hs	.LBB34_5
.LBB34_1:
	mov	w21, #-1
	cbz	w20, .LBB34_17
.LBB34_2:
	cmn	w20, #3                 // =3
	b.hi	.LBB34_4
// %bb.3:
	ldr	x9, [x19, #248]
	mov	w1, w20
	ldr	x8, [x19, #136]
	mov	x2, x1
	ldr	x0, [x9, #48]
	ldr	x22, [x8]
	bl	invalidate_mapping_pages
	mov	x0, x19
	mov	w1, w20
	bl	f2fs_invalidate_compress_page
	add	x22, x22, #88           // =88
	mov	x0, x22
	bl	down_write
	mov	x0, x19
	mov	w1, w20
	mov	x2, xzr
	bl	update_segment_mtime
	mov	w2, #-1
	mov	x0, x19
	mov	w1, w20
	bl	update_sit_entry
	mov	x0, x19
	mov	w1, w21
	bl	locate_dirty_segment
	mov	x0, x22
	bl	up_write
.LBB34_4:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB34_5:
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB34_13
// %bb.6:
	ldr	x8, [x19]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB34_12
// %bb.7:
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB34_9
.LBB34_8:                               //   in Loop: Header=BB34_9 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB34_12
.LBB34_9:                               // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w20
	b.hi	.LBB34_8
// %bb.10:                              //   in Loop: Header=BB34_9 Depth=1
	ldr	w12, [x11]
	cmp	w12, w20
	b.lo	.LBB34_8
// %bb.11:
	ldur	x8, [x11, #-80]
.LBB34_12:
	cbz	x8, .LBB34_1
.LBB34_13:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB34_15
// %bb.14:
	add	x9, x8, #80             // =80
	b	.LBB34_16
.LBB34_15:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB34_16:
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	sub	w9, w20, w9
	lsr	w9, w9, w10
	sub	w21, w9, w8
	cbnz	w20, .LBB34_2
.LBB34_17:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB34_20
// %bb.18:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB34_20
// %bb.19:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_invalidate_blocks
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3107
	add	x2, x2, :lo12:.L__func__.f2fs_invalidate_blocks
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB34_20:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 3107; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end34:
	.size	f2fs_invalidate_blocks, .Lfunc_end34-f2fs_invalidate_blocks
                                        // -- End function
	.p2align	3               // -- Begin function update_segment_mtime
	.type	update_segment_mtime,@function
update_segment_mtime:                   // @update_segment_mtime
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x20, x2
	mov	x19, x0
	add	w8, w1, #3              // =3
	cmp	w8, #4                  // =4
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	b.hs	.LBB35_2
.LBB35_1:
	mov	w21, #-1
	b	.LBB35_14
.LBB35_2:
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB35_10
// %bb.3:
	ldr	x8, [x19]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB35_9
// %bb.4:
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB35_6
.LBB35_5:                               //   in Loop: Header=BB35_6 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB35_9
.LBB35_6:                               // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w1
	b.hi	.LBB35_5
// %bb.7:                               //   in Loop: Header=BB35_6 Depth=1
	ldr	w12, [x11]
	cmp	w12, w1
	b.lo	.LBB35_5
// %bb.8:
	ldur	x8, [x11, #-80]
.LBB35_9:
	cbz	x8, .LBB35_1
.LBB35_10:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB35_12
// %bb.11:
	add	x9, x8, #80             // =80
	b	.LBB35_13
.LBB35_12:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB35_13:
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	sub	w9, w1, w9
	lsr	w9, w9, w10
	sub	w21, w9, w8
.LBB35_14:
	ldr	x8, [x19, #136]
	mov	w0, #1
	ldr	x22, [x8]
	bl	ktime_get_coarse_with_offset
	mov	x8, #38067
	movk	x8, #9942, lsl #16
	movk	x8, #3048, lsl #32
	movk	x8, #4398, lsl #48
	smulh	x9, x0, x8
	ldr	x8, [x22, #160]
	asr	x10, x9, #26
	add	x9, x10, x9, lsr #63
	subs	x10, x8, x9
	b.ls	.LBB35_16
// %bb.15:
	ldr	x8, [x22, #152]
	subs	x8, x8, x10
	csel	x8, xzr, x8, lo
	b	.LBB35_17
.LBB35_16:
	ldr	x10, [x22, #152]
	sub	x8, x9, x8
	add	x8, x8, x10
.LBB35_17:
	cmp	x20, #0                 // =0
	csel	x9, x8, x20, eq
	cmn	w21, #1                 // =1
	b.eq	.LBB35_22
// %bb.18:
	ldr	x10, [x19, #136]
	ldr	x10, [x10]
	ldr	x11, [x10, #136]
	mov	w10, #48
	umaddl	x10, w21, w10, x11
	ldr	x12, [x10, #40]!
	cbz	x12, .LBB35_20
// %bb.19:
	mov	w13, w21
	mov	w14, #48
	mul	x13, x13, x14
	ldr	w11, [x11, x13]
	ubfx	x11, x11, #6, #10
	madd	x9, x12, x11, x9
	add	w11, w11, #1            // =1
	udiv	x9, x9, x11
.LBB35_20:
	str	x9, [x10]
	ldr	x9, [x19, #136]
	ldr	x9, [x9]
	ldr	x10, [x9, #176]
	cmp	x8, x10
	b.ls	.LBB35_22
// %bb.21:
	str	x8, [x9, #176]
.LBB35_22:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end35:
	.size	update_segment_mtime, .Lfunc_end35-update_segment_mtime
                                        // -- End function
	.p2align	3               // -- Begin function update_sit_entry
	.type	update_sit_entry,@function
update_sit_entry:                       // @update_sit_entry
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	sub	x9, sp, #256            // =256
	str	x28, [sp, #16]          // 8-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	and	sp, x9, #0xffffffffffffffc0
	adrp	x8, __stack_chk_guard
	mov	w3, w2
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	str	x8, [sp, #248]
	mov	w8, w1
	ldr	x9, [x0, #136]
	cbz	x9, .LBB36_2
// %bb.1:
	add	x10, x9, #80            // =80
	add	x11, x9, #92            // =92
	b	.LBB36_3
.LBB36_2:
	ldr	x11, [x0, #16]
	add	x10, x11, #72           // =72
	add	x11, x11, #48           // =48
.LBB36_3:
	ldr	w12, [x10]
	ldr	w11, [x11]
	ldr	w10, [x0, #1184]
	lsl	w11, w11, w10
	add	w11, w11, w12
	cmp	w11, w8
	b.hi	.LBB36_6
// %bb.4:
	ldrb	w11, [x0, #3292]
	cbz	w11, .LBB36_6
// %bb.5:
	adrp	x1, .L.str.29
	adrp	x2, .L__func__.update_sit_entry
	add	x1, x1, :lo12:.L.str.29
	add	x2, x2, :lo12:.L__func__.update_sit_entry
	mov	w3, w8
	bl	f2fs_printk
	b	.LBB36_63
.LBB36_6:
	cbz	x9, .LBB36_8
// %bb.7:
	add	x11, x9, #84            // =84
	b	.LBB36_9
.LBB36_8:
	ldr	x11, [x0, #16]
	add	x11, x11, #92           // =92
.LBB36_9:
	ldr	w11, [x11]
	cmp	w11, w8
	b.hi	.LBB36_68
// %bb.10:
	cbz	x9, .LBB36_12
// %bb.11:
	add	x11, x9, #80            // =80
	add	x12, x9, #92            // =92
	b	.LBB36_13
.LBB36_12:
	ldr	x12, [x0, #16]
	add	x11, x12, #72           // =72
	add	x12, x12, #48           // =48
.LBB36_13:
	ldr	w11, [x11]
	ldr	w12, [x12]
	lsl	w12, w12, w10
	add	w11, w12, w11
	cmp	w11, w8
	b.ls	.LBB36_68
// %bb.14:
	ldr	w11, [x0, #3288]
	cmp	w11, #1                 // =1
	b.eq	.LBB36_75
// %bb.15:
	add	w11, w8, #3             // =3
	cmp	w11, #3                 // =3
	b.hi	.LBB36_33
// %bb.16:
	cmp	w11, #2                 // =2
	b.eq	.LBB36_33
.LBB36_17:
	mov	w13, #-1
.LBB36_18:
	ldr	x10, [x9]
	mov	w20, w13
	ldr	x11, [x10, #136]
	mov	w10, #48
	umaddl	x10, w13, w10, x11
	ldr	w12, [x10]
	ubfx	w13, w12, #6, #10
	add	w13, w13, w3
	sxtw	x2, w13
	cbz	x9, .LBB36_20
// %bb.19:
	add	x9, x9, #80             // =80
	b	.LBB36_21
.LBB36_20:
	ldr	x9, [x0, #16]
	add	x9, x9, #72             // =72
.LBB36_21:
	ldr	w9, [x9]
	ldr	w13, [x0, #1188]
	sub	w9, w8, w9
	sub	w14, w13, #1            // =1
	and	w9, w14, w9
	tbnz	w2, #31, .LBB36_71
// %bb.22:
	cmp	x2, x13
	b.gt	.LBB36_71
// %bb.23:
	mov	w13, #48
	bfi	w12, w2, #6, #10
	mov	w14, w9
	mvn	w9, w9
	madd	x13, x20, x13, x11
	lsr	x21, x14, #3
	str	w12, [x10]
	and	w9, w9, #0x7
	mov	w12, #1
	mov	w15, #48
	cmp	w3, #1                  // =1
	ldr	x13, [x13, #8]
	lsl	w9, w12, w9
	ldrb	w14, [x13, x21]
	and	w12, w9, w14
	b.lt	.LBB36_28
// %bb.24:
	orr	w14, w14, w9
	madd	x15, x20, x15, x11
	cmp	w12, #0                 // =0
	strb	w14, [x13, x21]
	ldr	x13, [x15, #16]
	cset	w15, ne
	ldrb	w14, [x13, x21]
	orr	w16, w14, w9
	tst	w9, w14
	cset	w14, ne
	cmp	w15, w14
	strb	w16, [x13, x21]
	b.ne	.LBB36_79
// %bb.25:
	cbnz	w12, .LBB36_83
// %bb.26:
	mov	w8, #48
	madd	x8, x20, x8, x11
	ldr	x8, [x8, #32]
	ldrb	w12, [x8, x21]
	orr	w13, w12, w9
	tst	w9, w12
	strb	w13, [x8, x21]
	b.eq	.LBB36_43
// %bb.27:
	ldr	x8, [x0, #80]
	tbz	w8, #8, .LBB36_44
	b	.LBB36_46
.LBB36_28:
	bic	w14, w14, w9
	madd	x15, x20, x15, x11
	cmp	w12, #0                 // =0
	strb	w14, [x13, x21]
	ldr	x13, [x15, #16]
	cset	w15, ne
	ldrb	w14, [x13, x21]
	bic	w16, w14, w9
	tst	w9, w14
	cset	w14, ne
	cmp	w15, w14
	strb	w16, [x13, x21]
	b.ne	.LBB36_97
// %bb.29:
	cbz	w12, .LBB36_101
// %bb.30:
	ldr	x12, [x0, #80]
	mvn	w8, w9
	tbnz	w12, #8, .LBB36_65
.LBB36_31:
	mov	w12, #48
	madd	x12, x20, x12, x11
	ldr	x12, [x12, #32]
	ldrb	w13, [x12, x21]
	and	w8, w13, w8
	tst	w9, w13
	strb	w8, [x12, x21]
	b.eq	.LBB36_46
// %bb.32:
	ldr	w8, [x0, #1244]
	add	w8, w8, #1              // =1
	str	w8, [x0, #1244]
	b	.LBB36_46
.LBB36_33:
	ldr	w12, [x0, #3024]
	cbz	w12, .LBB36_41
// %bb.34:
	ldr	x11, [x0]
	cmp	w12, #1                 // =1
	ldr	x11, [x11, #248]
	b.lt	.LBB36_40
// %bb.35:
	ldr	x14, [x0, #3032]
	mov	x13, xzr
	add	x14, x14, #80           // =80
	b	.LBB36_37
.LBB36_36:                              //   in Loop: Header=BB36_37 Depth=1
	add	x13, x13, #1            // =1
	add	x14, x14, #192          // =192
	cmp	x13, x12
	b.eq	.LBB36_40
.LBB36_37:                              // =>This Inner Loop Header: Depth=1
	ldur	w15, [x14, #-4]
	cmp	w15, w8
	b.hi	.LBB36_36
// %bb.38:                              //   in Loop: Header=BB36_37 Depth=1
	ldr	w15, [x14]
	cmp	w15, w8
	b.lo	.LBB36_36
// %bb.39:
	ldur	x11, [x14, #-80]
.LBB36_40:
	cbz	x11, .LBB36_17
.LBB36_41:
	cbz	x9, .LBB36_55
// %bb.42:
	add	x11, x9, #80            // =80
	b	.LBB36_56
.LBB36_43:
	ldr	w8, [x0, #1244]
	sub	w8, w8, #1              // =1
	str	w8, [x0, #1244]
	ldr	x8, [x0, #80]
	tbnz	w8, #8, .LBB36_46
.LBB36_44:
	mov	w8, #48
	madd	x8, x20, x8, x11
	ldr	x8, [x8, #24]
	ldrb	w12, [x8, x21]
	orr	w13, w12, w9
	tst	w9, w12
	strb	w13, [x8, x21]
	b.ne	.LBB36_46
// %bb.45:
	ldr	w8, [x10]
	add	w12, w8, #16, lsl #12   // =65536
	lsr	w12, w12, #16
	bfi	w8, w12, #16, #10
	str	w8, [x10]
.LBB36_46:
	mov	w8, #48
	madd	x8, x20, x8, x11
	ldr	x8, [x8, #24]
	ldrb	w8, [x8, x21]
	tst	w9, w8
	b.ne	.LBB36_48
// %bb.47:
	ldr	w8, [x10]
	add	w9, w8, w3, lsl #16
	lsr	w9, w9, #16
	bfi	w8, w9, #16, #10
	str	w8, [x10]
.LBB36_48:
	ldr	x8, [x0, #136]
	add	w10, w20, #63           // =63
	cmp	w20, #0                 // =0
	mov	w13, #1
	csel	w10, w10, w20, lt
	asr	w11, w10, #6
	and	w10, w10, #0xffffffc0
	ldr	x8, [x8]
	sbfiz	x11, x11, #3, #32
	sub	w10, w20, w10
	ldr	x9, [x8, #72]
	lsl	x10, x13, x10
	ldr	x12, [x9, x11]
	orr	x13, x12, x10
	tst	x12, x10
	str	x13, [x9, x11]
	b.ne	.LBB36_50
// %bb.49:
	ldr	w9, [x8, #80]
	add	w9, w9, #1              // =1
	str	w9, [x8, #80]
.LBB36_50:
	ldr	x8, [x0, #136]
	ldr	x8, [x8]
	ldr	w9, [x8, #16]
	add	w9, w9, w3
	str	w9, [x8, #16]
	ldr	w8, [x0, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB36_58
// %bb.51:
	ldr	x8, [x0, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB36_58
// %bb.52:
	ldr	x8, [x0, #3032]
	ldr	w9, [x8, #84]
	cmp	w9, w20
	b.hi	.LBB36_54
// %bb.53:
	ldr	w9, [x8, #88]
	cmp	w9, w20
	b.hs	.LBB36_57
.LBB36_54:
	ldr	w9, [x8, #376]
	add	w9, w9, w3
	str	w9, [x8, #376]
	b	.LBB36_58
.LBB36_55:
	ldr	x11, [x0, #16]
	add	x11, x11, #72           // =72
.LBB36_56:
	ldr	x12, [x9, #8]
	ldr	w11, [x11]
	ldr	w12, [x12]
	sub	w11, w8, w11
	lsr	w10, w11, w10
	sub	w13, w10, w12
	b	.LBB36_18
.LBB36_57:
	ldr	w9, [x8, #184]
	add	w9, w9, w3
	str	w9, [x8, #184]
.LBB36_58:
	ldr	w9, [x0, #1192]
	cmp	w9, #2                  // =2
	b.lo	.LBB36_63
// %bb.59:
	ldr	x8, [x0, #136]
	cmn	w20, #1                 // =1
	ldr	x8, [x8]
	ldr	x8, [x8, #144]
	b.eq	.LBB36_61
// %bb.60:
	udiv	w9, w20, w9
	b	.LBB36_62
.LBB36_61:
	mov	w9, #-1
.LBB36_62:
	lsl	x9, x9, #2
	ldr	w10, [x8, x9]
	add	w10, w10, w3
	str	w10, [x8, x9]
.LBB36_63:
	adrp	x9, __stack_chk_guard
	ldr	x8, [sp, #248]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB36_67
// %bb.64:
	mov	sp, x29
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x28, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB36_65:
	mov	w12, #48
	madd	x12, x20, x12, x11
	ldr	x12, [x12, #24]
	ldrb	w12, [x12, x21]
	tst	w9, w12
	b.eq	.LBB36_31
// %bb.66:
	add	x22, x0, #2236          // =2236
	mov	x19, x0
	mov	x0, x22
	str	w3, [sp, #60]           // 4-byte Folded Spill
	stp	x11, x10, [sp, #40]     // 16-byte Folded Spill
	stp	w8, w9, [sp, #32]       // 8-byte Folded Spill
	bl	_raw_spin_lock
	ldr	w8, [x19, #1264]
	mov	x0, x22
	add	w8, w8, #1              // =1
	str	w8, [x19, #1264]
	bl	_raw_spin_unlock
	ldp	w8, w9, [sp, #32]       // 8-byte Folded Reload
	mov	x0, x19
	ldp	x11, x10, [sp, #40]     // 16-byte Folded Reload
	ldr	w3, [sp, #60]           // 4-byte Folded Reload
	b	.LBB36_31
.LBB36_67:
	bl	__stack_chk_fail
.LBB36_68:
	adrp	x1, .L.str.30
	mov	w2, w8
	add	x1, x1, :lo12:.L.str.30
	mov	x19, x0
	bl	f2fs_printk
	ldrb	w8, [x19, #3272]
	mov	x20, x19
	cbnz	w8, .LBB36_93
// %bb.69:
	ldr	x9, [x20, #16]
	mov	w3, #8
	ldr	x10, [x20]
	ldr	w8, [x20, #1188]
	ldr	w9, [x9, #76]
	ldr	x0, [x10, #248]
	ldr	w2, [x10, #24]
	add	w8, w9, w8
	sub	w1, w8, #1              // =1
	bl	__bread_gfp
	cbnz	x0, .LBB36_87
// %bb.70:
	adrp	x0, .L.str.39
	add	x0, x0, :lo12:.L.str.39
	bl	printk
	b	.LBB36_93
.LBB36_71:
	mov	w10, #48
	adrp	x12, .L.str.34
	add	x12, x12, :lo12:.L.str.34
	adrp	x1, .L.str.32
	madd	x10, x20, x10, x11
	mov	w11, w9
	lsr	x11, x11, #3
	mvn	w9, w9
	and	w9, w9, #0x7
	add	x1, x1, :lo12:.L.str.32
	mov	w3, w8
	mov	x19, x0
	ldr	x10, [x10, #8]
	ldrb	w10, [x10, x11]
	adrp	x11, .L.str.33
	add	x11, x11, :lo12:.L.str.33
	lsr	w9, w10, w9
	tst	w9, #0x1
	csel	x4, x12, x11, eq
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_74
// %bb.72:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_74
// %bb.73:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.update_sit_entry
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3008
	add	x2, x2, :lo12:.L__func__.update_sit_entry
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_74:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 3008; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_75:
	adrp	x1, .L.str.31
	mov	w2, w8
	add	x1, x1, :lo12:.L.str.31
	mov	x19, x0
	bl	f2fs_printk
	ldr	x0, [x19, #352]
	mov	x1, xzr
	mov	x20, x19
	bl	show_stack
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_78
// %bb.76:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_78
// %bb.77:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.update_sit_entry
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #2994
	add	x2, x2, :lo12:.L__func__.update_sit_entry
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_78:
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 2994; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_79:
	cmp	w12, #0                 // =0
	adrp	x1, .L.str.35
	cset	w3, ne
	add	x1, x1, :lo12:.L.str.35
	mov	w2, w8
	mov	x19, x0
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_82
// %bb.80:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_82
// %bb.81:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.update_sit_entry
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3027
	add	x2, x2, :lo12:.L__func__.update_sit_entry
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_82:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 3027; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_83:
	adrp	x1, .L.str.36
	mov	w2, w8
	add	x1, x1, :lo12:.L.str.36
	mov	x19, x0
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_86
// %bb.84:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_86
// %bb.85:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.update_sit_entry
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3033
	add	x2, x2, :lo12:.L__func__.update_sit_entry
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_86:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 3033; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_87:
	ldr	x8, [x0]
	mov	x19, x0
	str	x8, [sp, #64]
	ldr	x8, [sp, #64]
	tbnz	w8, #2, .LBB36_89
// %bb.88:
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x19]
1:	ldaxr	x8, [x19]
	orr	x9, x8, 4
	stxr	w10, x9, [x19]
	cbnz	w10, 1b
	
	//NO_APP
	tbz	w8, #2, .LBB36_90
.LBB36_89:
	mov	x0, x19
	bl	__lock_buffer
.LBB36_90:
	ldr	x21, [x19, #40]
	mov	w8, #17227
	movk	w8, #18003, lsl #16
	ldr	w9, [x21]
	cmp	w9, w8
	b.ne	.LBB36_105
// %bb.91:
	mov	x0, x19
	bl	unlock_buffer
.LBB36_92:
	mov	x0, x19
	bl	__brelse
.LBB36_93:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_96
// %bb.94:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_96
// %bb.95:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.update_sit_entry
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #2983
	add	x2, x2, :lo12:.L__func__.update_sit_entry
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_96:
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 2983; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_97:
	cmp	w12, #0                 // =0
	adrp	x1, .L.str.37
	cset	w3, ne
	add	x1, x1, :lo12:.L.str.37
	mov	w2, w8
	mov	x19, x0
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_100
// %bb.98:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_100
// %bb.99:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.update_sit_entry
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3057
	add	x2, x2, :lo12:.L__func__.update_sit_entry
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_100:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 3057; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_101:
	adrp	x1, .L.str.38
	mov	w2, w8
	add	x1, x1, :lo12:.L.str.38
	mov	x19, x0
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_104
// %bb.102:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_104
// %bb.103:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.update_sit_entry
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3063
	add	x2, x2, :lo12:.L__func__.update_sit_entry
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_104:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 3063; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_105:
	str	w8, [x21]
	ldr	x8, [x20, #3104]
	ldr	w9, [x8]
	cmp	w9, #4                  // =4
	b.ne	.LBB36_113
// %bb.106:
	mov	w9, #8208
	add	x0, sp, #64             // =64
	movk	w9, #62197, lsl #16
	mov	x1, x21
	mov	w2, #4092
	str	x8, [sp, #64]
	str	w9, [sp, #128]
	bl	crypto_shash_update
	cbnz	w0, .LBB36_114
// %bb.107:
	ldr	w8, [sp, #128]
	str	w8, [x21, #4092]
	ldr	x8, [x19]
	tbnz	w8, #0, .LBB36_109
// %bb.108:
	//APP
	// atomic64_or
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	orr	x8, x8, 1
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
.LBB36_109:
	ldr	x8, [x19]
	tbnz	w8, #1, .LBB36_111
// %bb.110:
	//APP
	// atomic64_or
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	orr	x8, x8, 2
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
.LBB36_111:
	mov	x0, x19
	bl	unlock_buffer
	mov	w1, #2048
	mov	x0, x19
	movk	w1, #6, lsl #16
	bl	__sync_dirty_buffer
	cbnz	w0, .LBB36_92
// %bb.112:
	mov	w8, #1
	strb	w8, [x20, #3272]
	b	.LBB36_92
.LBB36_113:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 2878; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_114:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 2884; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end36:
	.size	update_sit_entry, .Lfunc_end36-update_sit_entry
                                        // -- End function
	.p2align	3               // -- Begin function locate_dirty_segment
	.type	locate_dirty_segment,@function
locate_dirty_segment:                   // @locate_dirty_segment
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	cmn	w1, #1                  // =1
	str	x21, [sp, #16]          // 8-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	b.eq	.LBB37_21
// %bb.1:
	ldr	x8, [x0, #136]
	mov	w19, w1
	mov	x20, x0
	ldr	x9, [x8, #24]
	ldr	w10, [x9, #100]
	cmp	w10, w1
	b.eq	.LBB37_21
// %bb.2:
	ldr	w10, [x9, #220]
	cmp	w10, w19
	b.eq	.LBB37_21
// %bb.3:
	ldr	w10, [x9, #340]
	cmp	w10, w19
	b.eq	.LBB37_21
// %bb.4:
	ldr	w10, [x9, #460]
	cmp	w10, w19
	b.eq	.LBB37_21
// %bb.5:
	ldr	w10, [x9, #580]
	cmp	w10, w19
	b.eq	.LBB37_21
// %bb.6:
	ldr	w10, [x9, #700]
	cmp	w10, w19
	b.eq	.LBB37_21
// %bb.7:
	ldr	w10, [x9, #820]
	cmp	w10, w19
	b.eq	.LBB37_21
// %bb.8:
	ldr	w10, [x9, #940]
	cmp	w10, w19
	b.eq	.LBB37_21
// %bb.9:
	ldr	w10, [x9, #1060]
	cmp	w10, w19
	b.eq	.LBB37_21
// %bb.10:
	ldr	w10, [x9, #1180]
	cmp	w10, w19
	b.eq	.LBB37_21
// %bb.11:
	ldr	w9, [x9, #1300]
	cmp	w9, w19
	b.eq	.LBB37_21
// %bb.12:
	ldr	x8, [x8, #16]
	add	x21, x8, #80            // =80
	mov	x0, x21
	bl	mutex_lock
	ldr	x8, [x20, #136]
	mov	w9, #48
	umull	x9, w19, w9
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	ldr	w10, [x8, x9]
	ubfx	w8, w10, #6, #10
	cbz	w8, .LBB37_16
// %bb.13:
	ldr	w9, [x20, #1188]
.LBB37_14:
	cmp	w8, w9
	b.hs	.LBB37_19
// %bb.15:
	mov	x0, x20
	mov	w1, w19
	mov	w2, #6
	bl	__locate_dirty_segment
	b	.LBB37_20
.LBB37_16:
	ldr	x9, [x20, #80]
	tbz	w9, #8, .LBB37_18
// %bb.17:
	ldr	w9, [x20, #1188]
	ubfx	w10, w10, #16, #10
	cmp	w10, w9
	b.ne	.LBB37_14
.LBB37_18:
	mov	x0, x20
	mov	w1, w19
	mov	w2, #7
	bl	__locate_dirty_segment
.LBB37_19:
	mov	x0, x20
	mov	w1, w19
	mov	w2, #6
	bl	__remove_dirty_segment
.LBB37_20:
	mov	x0, x21
	bl	mutex_unlock
.LBB37_21:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end37:
	.size	locate_dirty_segment, .Lfunc_end37-locate_dirty_segment
                                        // -- End function
	.globl	f2fs_is_checkpointed_data // -- Begin function f2fs_is_checkpointed_data
	.p2align	3
	.type	f2fs_is_checkpointed_data,@function
f2fs_is_checkpointed_data:              // @f2fs_is_checkpointed_data
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	add	w8, w1, #3              // =3
	str	x21, [sp, #16]          // 8-byte Folded Spill
	cmp	w8, #4                  // =4
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	b.hs	.LBB38_2
.LBB38_1:
	mov	w19, #1
	b	.LBB38_27
.LBB38_2:
	ldr	x8, [x0, #136]
	mov	w19, w1
	ldr	w10, [x0, #3024]
	mov	x20, x0
	ldr	x8, [x8]
	cbz	w10, .LBB38_10
// %bb.3:
	ldr	x9, [x20]
	cmp	w10, #1                 // =1
	ldr	x9, [x9, #248]
	b.lt	.LBB38_9
// %bb.4:
	ldr	x12, [x20, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB38_6
.LBB38_5:                               //   in Loop: Header=BB38_6 Depth=1
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB38_9
.LBB38_6:                               // =>This Inner Loop Header: Depth=1
	ldur	w13, [x12, #-4]
	cmp	w13, w19
	b.hi	.LBB38_5
// %bb.7:                               //   in Loop: Header=BB38_6 Depth=1
	ldr	w13, [x12]
	cmp	w13, w19
	b.lo	.LBB38_5
// %bb.8:
	ldur	x9, [x12, #-80]
.LBB38_9:
	cbz	x9, .LBB38_1
.LBB38_10:
	add	x21, x8, #88            // =88
	mov	x0, x21
	bl	down_read
	ldr	w9, [x20, #3024]
	cbz	w9, .LBB38_18
// %bb.11:
	ldr	x8, [x20]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB38_17
// %bb.12:
	ldr	x11, [x20, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB38_14
.LBB38_13:                              //   in Loop: Header=BB38_14 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB38_17
.LBB38_14:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w19
	b.hi	.LBB38_13
// %bb.15:                              //   in Loop: Header=BB38_14 Depth=1
	ldr	w12, [x11]
	cmp	w12, w19
	b.lo	.LBB38_13
// %bb.16:
	ldur	x8, [x11, #-80]
.LBB38_17:
	cbz	x8, .LBB38_22
.LBB38_18:
	ldr	x8, [x20, #136]
	cbz	x8, .LBB38_20
// %bb.19:
	add	x9, x8, #80             // =80
	b	.LBB38_21
.LBB38_20:
	ldr	x9, [x20, #16]
	add	x9, x9, #72             // =72
.LBB38_21:
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x20, #1184]
	ldr	w8, [x8]
	sub	w9, w19, w9
	lsr	w9, w9, w10
	sub	w8, w9, w8
	b	.LBB38_23
.LBB38_22:
	mov	w8, #-1
.LBB38_23:
	ldr	x10, [x20, #136]
	ldr	x9, [x10]
	ldr	x9, [x9, #136]
	cbz	x10, .LBB38_25
// %bb.24:
	add	x10, x10, #80           // =80
	b	.LBB38_26
.LBB38_25:
	ldr	x10, [x20, #16]
	add	x10, x10, #72           // =72
.LBB38_26:
	mov	w11, #48
	ldr	w10, [x10]
	ldr	w12, [x20, #1188]
	mov	x0, x21
	madd	x8, x8, x11, x9
	sub	w9, w19, w10
	sub	w10, w12, #1            // =1
	ldr	x8, [x8, #24]
	and	w9, w10, w9
	lsr	x10, x9, #3
	mvn	w9, w9
	and	w9, w9, #0x7
	ldrb	w8, [x8, x10]
	lsr	w8, w8, w9
	and	w19, w8, #0x1
	bl	up_read
.LBB38_27:
	mov	w0, w19
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end38:
	.size	f2fs_is_checkpointed_data, .Lfunc_end38-f2fs_is_checkpointed_data
                                        // -- End function
	.globl	f2fs_npages_for_summary_flush // -- Begin function f2fs_npages_for_summary_flush
	.p2align	3
	.type	f2fs_npages_for_summary_flush,@function
f2fs_npages_for_summary_flush:          // @f2fs_npages_for_summary_flush
// %bb.0:
	ldr	x8, [x0, #224]
	ldrb	w9, [x8, #176]
	cmp	w9, #1                  // =1
	b.ne	.LBB39_2
// %bb.1:
	ldr	w9, [x0, #1188]
	b	.LBB39_5
.LBB39_2:
	tbz	w1, #0, .LBB39_4
// %bb.3:
	ldrh	w9, [x8, #116]
	b	.LBB39_5
.LBB39_4:
	ldr	x9, [x0, #136]
	ldr	x9, [x9, #24]
	ldrh	w9, [x9, #104]
.LBB39_5:
	ldrb	w10, [x8, #177]
	cmp	w10, #1                 // =1
	b.ne	.LBB39_7
// %bb.6:
	ldr	w10, [x0, #1188]
	b	.LBB39_10
.LBB39_7:
	tbz	w1, #0, .LBB39_9
// %bb.8:
	ldrh	w10, [x8, #118]
	b	.LBB39_10
.LBB39_9:
	ldr	x10, [x0, #136]
	ldr	x10, [x10, #24]
	ldrh	w10, [x10, #224]
.LBB39_10:
	ldrb	w11, [x8, #178]
	add	w9, w10, w9
	cmp	w11, #1                 // =1
	b.ne	.LBB39_12
// %bb.11:
	ldr	w8, [x0, #1188]
	b	.LBB39_15
.LBB39_12:
	tbz	w1, #0, .LBB39_14
// %bb.13:
	ldrh	w8, [x8, #120]
	b	.LBB39_15
.LBB39_14:
	ldr	x8, [x0, #136]
	ldr	x8, [x8, #24]
	ldrh	w8, [x8, #344]
.LBB39_15:
	add	w8, w9, w8
	cmp	w8, #440                // =440
	b.ge	.LBB39_17
// %bb.16:
	mov	w0, #1
	ret
.LBB39_17:
	sub	w8, w8, #439            // =439
	cmp	w8, #585                // =585
	mov	w8, #2
	cinc	w0, w8, hs
	ret
.Lfunc_end39:
	.size	f2fs_npages_for_summary_flush, .Lfunc_end39-f2fs_npages_for_summary_flush
                                        // -- End function
	.globl	f2fs_get_sum_page       // -- Begin function f2fs_get_sum_page
	.p2align	3
	.type	f2fs_get_sum_page,@function
f2fs_get_sum_page:                      // @f2fs_get_sum_page
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldr	x8, [x0, #224]
	mov	x29, sp
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB40_2
// %bb.1:
	ldr	x8, [x0, #136]
	ldr	w8, [x8, #88]
	add	w1, w8, w1
	bl	f2fs_get_meta_page_retry
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.LBB40_2:
	mov	x0, #-5
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end40:
	.size	f2fs_get_sum_page, .Lfunc_end40-f2fs_get_sum_page
                                        // -- End function
	.globl	f2fs_update_meta_page   // -- Begin function f2fs_update_meta_page
	.p2align	3
	.type	f2fs_update_meta_page,@function
f2fs_update_meta_page:                  // @f2fs_update_meta_page
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x20, x1
	mov	w1, w2
	mov	x29, sp
	bl	f2fs_grab_meta_page
	mov	x19, x0
	lsl	x8, x0, #6
	orr	x0, x8, #0xffffffc000000000
	mov	x1, x20
	mov	w2, #4096
	bl	memcpy
	mov	x0, x19
	bl	set_page_dirty
	cbz	x19, .LBB41_26
// %bb.1:
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
	b.ne	.LBB41_18
// %bb.2:
	tbnz	w8, #0, .LBB41_16
// %bb.3:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB41_6
// %bb.4:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB41_6
// %bb.5:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB41_6:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB41_8
// %bb.7:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB41_27
.LBB41_8:
	ldr	x0, [x19, #24]
.LBB41_9:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB41_11
// %bb.10:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB41_28
.LBB41_11:
	ldr	x0, [x19, #24]
.LBB41_12:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB41_14
// %bb.13:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB41_29
.LBB41_14:
	ldr	x0, [x19, #24]
.LBB41_15:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB41_16:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB41_24
// %bb.17:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB41_18:
	tbnz	w8, #0, .LBB41_23
// %bb.19:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB41_22
// %bb.20:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB41_22
// %bb.21:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB41_22:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB41_23:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB41_30
.LBB41_24:
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
	cbnz	w9, .LBB41_26
// %bb.25:
	bl	__put_page
.LBB41_26:
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.LBB41_27:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB41_9
.LBB41_28:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB41_12
.LBB41_29:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB41_15
.LBB41_30:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end41:
	.size	f2fs_update_meta_page, .Lfunc_end41-f2fs_update_meta_page
                                        // -- End function
	.globl	write_sum_page          // -- Begin function write_sum_page
	.p2align	3
	.type	write_sum_page,@function
write_sum_page:                         // @write_sum_page
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	x29, sp
	bl	f2fs_update_meta_page
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end42:
	.size	write_sum_page, .Lfunc_end42-write_sum_page
                                        // -- End function
	.globl	f2fs_segment_has_free_slot // -- Begin function f2fs_segment_has_free_slot
	.p2align	3
	.type	f2fs_segment_has_free_slot,@function
f2fs_segment_has_free_slot:             // @f2fs_segment_has_free_slot
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	ldr	x9, [x0, #136]
	mov	w8, #48
	str	x19, [sp, #16]          // 8-byte Folded Spill
	mov	x2, xzr
	mov	x29, sp
	ldr	x9, [x9]
	ldr	x10, [x9, #136]
	umaddl	x8, w1, w8, x10
	ldr	x10, [x8, #24]
	ldr	x11, [x8, #8]
	ldr	x8, [x9, #64]
	ldr	x12, [x10]
	ldr	x13, [x11]
	orr	x9, x13, x12
	str	x9, [x8]
	ldr	x9, [x10, #8]
	ldr	x12, [x11, #8]
	orr	x9, x12, x9
	str	x9, [x8, #8]
	ldr	x9, [x10, #16]
	ldr	x12, [x11, #16]
	orr	x9, x12, x9
	str	x9, [x8, #16]
	ldr	x9, [x10, #24]
	ldr	x12, [x11, #24]
	orr	x9, x12, x9
	str	x9, [x8, #24]
	ldr	x9, [x10, #32]
	ldr	x12, [x11, #32]
	orr	x9, x12, x9
	str	x9, [x8, #32]
	ldr	x9, [x10, #40]
	ldr	x12, [x11, #40]
	orr	x9, x12, x9
	str	x9, [x8, #40]
	ldr	x9, [x10, #48]
	ldr	x12, [x11, #48]
	orr	x9, x12, x9
	str	x9, [x8, #48]
	ldr	x9, [x10, #56]
	ldr	x10, [x11, #56]
	orr	x9, x10, x9
	str	x9, [x8, #56]
	ldr	w19, [x0, #1188]
	mov	x0, x8
	mov	x1, x19
	bl	__find_rev_next_zero_bit
	cmp	w19, w0
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	cset	w0, hi
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end43:
	.size	f2fs_segment_has_free_slot, .Lfunc_end43-f2fs_segment_has_free_slot
                                        // -- End function
	.globl	f2fs_init_dm_curseg     // -- Begin function f2fs_init_dm_curseg
	.p2align	3
	.type	f2fs_init_dm_curseg,@function
f2fs_init_dm_curseg:                    // @f2fs_init_dm_curseg
// %bb.0:
	sub	sp, sp, #144            // =144
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	stp	x28, x27, [sp, #64]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #80]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #96]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]    // 16-byte Folded Spill
	mov	w21, w1
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #136]
	sxtw	x26, w21
	ldr	x25, [x8, #24]
	add	x0, x8, #32             // =32
	bl	down_read
	mov	w8, #120
	smaddl	x20, w21, w8, x25
	mov	x0, x20
	bl	mutex_lock
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
	add	x0, x8, #88             // =88
	bl	down_write
	mov	x27, x20
	mov	x0, x19
	mov	w1, w21
	ldr	w22, [x27, #100]!
	bl	need_ssr_by_multi_device
	tbz	w0, #0, .LBB44_4
// %bb.1:
	mov	x0, x19
	mov	w1, w21
	mov	w2, #1
	mov	x3, xzr
	bl	get_ssr_segment
	cbz	w0, .LBB44_4
// %bb.2:
	mov	w8, #120
	madd	x8, x26, x8, x25
	ldrb	w8, [x8, #116]
	cbz	w8, .LBB44_9
// %bb.3:
	mov	x0, x19
	mov	w1, w21
	bl	change_curseg
	b	.LBB44_5
.LBB44_4:
	mov	x0, x19
	mov	w1, w21
	mov	w2, #1
	bl	new_curseg
.LBB44_5:
	tbnz	w22, #31, .LBB44_8
// %bb.6:
	ldr	x8, [x19, #136]
	ldr	w8, [x8, #96]
	cmp	w22, w8
	b.hs	.LBB44_8
// %bb.7:
	mov	x0, x19
	mov	w1, w22
	bl	locate_dirty_segment
.LBB44_8:
	ldr	w3, [x27]
	adrp	x1, .L.str.12
	add	x1, x1, :lo12:.L.str.12
	mov	x0, x19
	mov	w2, w21
	bl	f2fs_printk
	mov	w8, #120
	ldr	x10, [x19, #136]
	madd	x8, x26, x8, x25
	ldrb	w8, [x8, #96]
	add	x8, x19, x8, lsl #2
	ldr	w9, [x8, #2040]
	add	w9, w9, #1              // =1
	str	w9, [x8, #2040]
	ldr	x8, [x10]
	add	x0, x8, #88             // =88
	bl	up_write
	mov	x0, x20
	bl	mutex_unlock
	ldr	x8, [x19, #136]
	add	x0, x8, #32             // =32
	bl	up_read
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #144            // =144
	ret
.LBB44_9:
	ldr	x8, [x19, #136]
	mov	w9, #120
	ldr	x10, [x8, #24]
	madd	x9, x26, x9, x10
	ldr	w23, [x9, #112]
	ldp	x24, x9, [x8, #8]
	cmn	w23, #1                 // =1
	stp	x9, x10, [sp, #16]      // 16-byte Folded Spill
	b.eq	.LBB44_11
// %bb.10:
	ldr	w8, [x19, #1192]
	udiv	w8, w23, w8
	b	.LBB44_12
.LBB44_11:
	mov	w8, #-1
.LBB44_12:
	add	x0, x24, #12            // =12
	stp	x8, x0, [sp]            // 16-byte Folded Spill
	bl	_raw_spin_lock
	ldr	x8, [x24, #16]
	lsr	x28, x23, #6
	mov	w10, #1
	ldr	x9, [x8, x28, lsl #3]
	stp	x23, x9, [x29, #-16]    // 8-byte Folded Spill
	lsl	x23, x10, x23
	ldur	x9, [x29, #-8]
	tst	x9, x23
	b.ne	.LBB44_25
// %bb.13:
	add	x8, x8, x28, lsl #3
	//APP
	// atomic64_fetch_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x10, x9, x23
	stlxr	w11, x10, [x8]
	cbnz	w11, 1b
	dmb ish
	//NO_APP
	tst	x9, x23
	b.ne	.LBB44_25
// %bb.14:
	ldr	w8, [x24, #4]
	sub	w8, w8, #1              // =1
	str	w8, [x24, #4]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB44_22
// %bb.15:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB44_22
// %bb.16:
	ldr	x8, [x19, #3032]
	ldur	x10, [x29, #-16]        // 8-byte Folded Reload
	ldr	w9, [x8, #84]
	cmp	w9, w10
	b.hi	.LBB44_19
// %bb.17:
	ldr	w9, [x8, #88]
	cmp	w9, w10
	b.lo	.LBB44_19
// %bb.18:
	ldr	w9, [x8, #168]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #168]
	ldr	x8, [x19, #3032]
.LBB44_19:
	ldr	w9, [x8, #276]
	ldur	x10, [x29, #-16]        // 8-byte Folded Reload
	cmp	w9, w10
	b.hi	.LBB44_22
// %bb.20:
	ldr	w9, [x8, #280]
	ldur	x10, [x29, #-16]        // 8-byte Folded Reload
	cmp	w9, w10
	b.lo	.LBB44_22
// %bb.21:
	ldr	w9, [x8, #360]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #360]
.LBB44_22:
	ldr	x12, [sp]               // 8-byte Folded Reload
	ldr	x8, [x24, #24]
	lsr	w10, w12, #6
	ldr	x9, [x8, w10, uxtw #3]
	stur	x9, [x29, #-8]
	mov	w9, #1
	ldur	x11, [x29, #-8]
	lsl	x9, x9, x12
	tst	x11, x9
	b.ne	.LBB44_25
// %bb.23:
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
	b.ne	.LBB44_25
// %bb.24:
	ldr	w8, [x24, #8]
	sub	w8, w8, #1              // =1
	str	w8, [x24, #8]
.LBB44_25:
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	bl	_raw_spin_unlock
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	add	x24, x8, #80            // =80
	mov	x0, x24
	bl	mutex_lock
	ldr	x8, [x19, #136]
	ldr	x8, [x8, #16]
	ldr	x9, [x8, #64]
	ldr	x10, [x9, x28, lsl #3]
	stur	x10, [x29, #-8]
	ldur	x10, [x29, #-8]
	tst	x10, x23
	b.eq	.LBB44_28
// %bb.26:
	add	x9, x9, x28, lsl #3
	//APP
	// atomic64_fetch_andnot
	prfm	pstl1strm, [x9]
1:	ldxr	x10, [x9]
	bic	x11, x10, x23
	stlxr	w12, x11, [x9]
	cbnz	w12, 1b
	dmb ish
	//NO_APP
	tst	x10, x23
	b.eq	.LBB44_28
// %bb.27:
	ldr	w9, [x8, #140]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #140]
.LBB44_28:
	ldur	x28, [x29, #-16]        // 8-byte Folded Reload
	mov	x0, x19
	mov	w2, #6
	mov	w1, w28
	bl	__remove_dirty_segment
	mov	x0, x24
	bl	mutex_unlock
	mov	x0, x19
	mov	w1, w21
	mov	w2, wzr
	bl	reset_curseg
	ldr	x24, [sp, #24]          // 8-byte Folded Reload
	mov	w8, #120
	mov	w11, #48
	mov	x2, xzr
	madd	x23, x26, x8, x24
	mov	w8, #1
	strb	w8, [x23, #96]
	ldr	x8, [x19, #136]
	ldr	w9, [x23, #100]
	ldr	x8, [x8]
	ldr	x10, [x8, #136]
	ldr	x0, [x8, #64]
	madd	x9, x9, x11, x10
	ldr	x10, [x9, #24]
	ldr	x9, [x9, #8]
	ldr	x11, [x10]
	ldr	x12, [x9]
	orr	x8, x12, x11
	str	x8, [x0]
	ldr	x8, [x10, #8]
	ldr	x11, [x9, #8]
	orr	x8, x11, x8
	str	x8, [x0, #8]
	ldr	x8, [x10, #16]
	ldr	x11, [x9, #16]
	orr	x8, x11, x8
	str	x8, [x0, #16]
	ldr	x8, [x10, #24]
	ldr	x11, [x9, #24]
	orr	x8, x11, x8
	str	x8, [x0, #24]
	ldr	x8, [x10, #32]
	ldr	x11, [x9, #32]
	orr	x8, x11, x8
	str	x8, [x0, #32]
	ldr	x8, [x10, #40]
	ldr	x11, [x9, #40]
	orr	x8, x11, x8
	str	x8, [x0, #40]
	ldr	x8, [x10, #48]
	ldr	x11, [x9, #48]
	orr	x8, x11, x8
	str	x8, [x0, #48]
	ldr	x8, [x10, #56]
	ldr	x9, [x9, #56]
	orr	x8, x9, x8
	str	x8, [x0, #56]
	ldr	w1, [x19, #1188]
	bl	__find_rev_next_zero_bit
	strh	w0, [x23, #104]
	ldr	x8, [x19, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB44_30
// %bb.29:
	ldr	x8, [x19, #136]
	mov	x0, x19
	ldr	w8, [x8, #88]
	add	w1, w8, w28
	bl	f2fs_get_meta_page_retry
	cmn	x0, #4095               // =4095
	b.lo	.LBB44_31
.LBB44_30:
	mov	w8, #120
	mov	w1, wzr
	mov	w2, #3584
	madd	x8, x26, x8, x24
	ldr	x0, [x8, #32]
	bl	memset
	b	.LBB44_5
.LBB44_31:
	mov	w8, #120
	mov	x23, x0
	mov	w2, #3584
	madd	x8, x26, x8, x24
	ldr	x0, [x8, #32]
	lsl	x8, x23, #6
	orr	x1, x8, #0xffffffc000000000
	bl	memcpy
	cbz	x23, .LBB44_5
// %bb.32:
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
	b.ne	.LBB44_49
// %bb.33:
	tbnz	w8, #0, .LBB44_47
// %bb.34:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB44_37
// %bb.35:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB44_37
// %bb.36:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB44_37:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB44_39
// %bb.38:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB44_57
.LBB44_39:
	ldr	x0, [x23, #24]
.LBB44_40:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB44_42
// %bb.41:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB44_58
.LBB44_42:
	ldr	x0, [x23, #24]
.LBB44_43:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB44_45
// %bb.44:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB44_59
.LBB44_45:
	ldr	x0, [x23, #24]
.LBB44_46:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB44_47:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB44_55
// %bb.48:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB44_49:
	tbnz	w8, #0, .LBB44_54
// %bb.50:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB44_53
// %bb.51:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB44_53
// %bb.52:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB44_53:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB44_54:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB44_60
.LBB44_55:
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
	cbnz	w9, .LBB44_5
// %bb.56:
	bl	__put_page
	b	.LBB44_5
.LBB44_57:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB44_40
.LBB44_58:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB44_43
.LBB44_59:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB44_46
.LBB44_60:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end44:
	.size	f2fs_init_dm_curseg, .Lfunc_end44-f2fs_init_dm_curseg
                                        // -- End function
	.p2align	3               // -- Begin function need_ssr_by_multi_device
	.type	need_ssr_by_multi_device,@function
need_ssr_by_multi_device:               // @need_ssr_by_multi_device
// %bb.0:
	ldr	w9, [x0, #1192]
	ldr	w14, [x0, #1188]
	ldrsw	x11, [x0, #1284]
	ldr	w10, [x0, #1184]
	ldrsw	x13, [x0, #1272]
	ldrsw	x12, [x0, #1296]
	ldr	w8, [x0, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB45_5
// %bb.1:
	ldr	x8, [x0, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB45_5
// %bb.2:
	mov	w8, wzr
	cmp	w1, #8                  // =8
	b.hi	.LBB45_11
// %bb.3:
	mov	w15, #1
	mov	w16, #455
	lsl	w15, w15, w1
	tst	w15, w16
	b.eq	.LBB45_11
// %bb.4:
	ldr	w8, [x0, #1504]
	cmp	w8, #1                  // =1
	b.ne	.LBB45_6
.LBB45_5:
	mov	w0, wzr
	ret
.LBB45_6:
	ldr	w8, [x0, #1868]
	cmp	w8, #5                  // =5
	b.ne	.LBB45_9
// %bb.7:
	ldrb	w8, [x0, #1232]
	tbnz	w8, #3, .LBB45_9
.LBB45_8:
	mov	w0, #1
	ret
.LBB45_9:
	ldr	x8, [x0, #80]
	tbnz	w8, #8, .LBB45_8
// %bb.10:
	sub	w8, w1, #6              // =6
	ldr	x15, [x0, #3032]
	cmp	w8, #3                  // =3
	mul	w14, w14, w9
	mov	w8, #192
	cset	w16, lo
	sub	x14, x14, #1            // =1
	umaddl	x8, w16, w8, x15
	ldr	x15, [x0, #136]
	add	x13, x14, x13
	add	x11, x14, x11
	asr	x13, x13, x10
	asr	x11, x11, x10
	udiv	w13, w13, w9
	add	x12, x14, x12
	udiv	w11, w11, w9
	asr	x10, x12, x10
	ldr	w12, [x15, #156]
	udiv	w9, w10, w9
	ldp	w8, w10, [x8, #168]
	add	w11, w11, w13, lsl #1
	add	w9, w11, w9
	add	w9, w9, w12
	add	w9, w9, w10
	cmp	w8, w9
	cset	w8, ls
.LBB45_11:
	mov	w0, w8
	ret
.Lfunc_end45:
	.size	need_ssr_by_multi_device, .Lfunc_end45-need_ssr_by_multi_device
                                        // -- End function
	.p2align	3               // -- Begin function get_ssr_segment
	.type	get_ssr_segment,@function
get_ssr_segment:                        // @get_ssr_segment
// %bb.0:
	sub	sp, sp, #112            // =112
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	stp	x28, x27, [sp, #32]     // 16-byte Folded Spill
	mov	w9, #120
	stp	x26, x25, [sp, #48]     // 16-byte Folded Spill
	mov	w28, #-1
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	add	x29, sp, #16            // =16
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	mov	x19, x0
	str	x8, [sp, #8]
	ldr	x8, [x0, #136]
	ldp	x8, x23, [x8, #16]
	str	w28, [sp, #4]
	smaddl	x9, w1, w9, x23
	ldr	x26, [x8]
	ldrh	w27, [x9, #98]
	cmp	w27, #6                 // =6
	b.hs	.LBB46_32
// %bb.1:
	ldr	w8, [x19, #3024]
	mov	x20, x3
	mov	w22, w1
	mov	w21, w2
	mov	w3, w27
	cmp	w8, #2                  // =2
	b.ne	.LBB46_3
// %bb.2:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tst	w8, #0x1
	csel	w3, w27, w22, eq
.LBB46_3:
	ldr	x8, [x26]
	add	x1, sp, #4              // =4
	mov	x0, x19
	mov	w2, wzr
	mov	w4, w21
	mov	x5, x20
	sxtw	x25, w22
	blr	x8
	cbz	w0, .LBB46_21
// %bb.4:
	subs	w8, w27, #3             // =3
	mov	w9, #3
	mov	w10, #5
	cset	w11, hi
	csel	w9, w10, w9, hi
	cmp	w27, #0                 // =0
	cset	w10, ne
	cmp	w8, #3                  // =3
	lsl	w8, w10, #1
	csel	w10, w11, w10, lo
	csel	w24, w9, w8, lo
	cmp	w10, #0                 // =0
	sub	w22, w22, #6            // =6
	cneg	w28, w28, eq
	cmp	w24, w27
	b.eq	.LBB46_9
// %bb.5:
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB46_7
// %bb.6:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	and	w8, w8, #0x1
	b	.LBB46_8
.LBB46_7:
	mov	w8, wzr
.LBB46_8:
	cmp	w22, #3                 // =3
	add	w10, w24, #6            // =6
	cset	w9, lo
	cmp	w24, #3                 // =3
	and	w8, w9, w8
	cset	w9, lo
	tst	w9, w8
	ldr	x8, [x26]
	csel	w3, w10, w24, ne
	add	x1, sp, #4              // =4
	mov	x0, x19
	mov	w2, wzr
	mov	w4, w21
	mov	x5, x20
	blr	x8
	cbz	w0, .LBB46_21
.LBB46_9:
	add	w24, w28, w24
	cmp	w24, w27
	b.eq	.LBB46_14
// %bb.10:
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB46_12
// %bb.11:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	and	w8, w8, #0x1
	b	.LBB46_13
.LBB46_12:
	mov	w8, wzr
.LBB46_13:
	cmp	w22, #3                 // =3
	add	w9, w24, #6             // =6
	cset	w10, lo
	cmp	w24, #3                 // =3
	csel	w9, w9, w24, lo
	tst	w10, w8
	and	w9, w9, #0xffff
	ldr	x8, [x26]
	csel	w3, w9, w24, ne
	add	x1, sp, #4              // =4
	mov	x0, x19
	mov	w2, wzr
	mov	w4, w21
	mov	x5, x20
	blr	x8
	cbz	w0, .LBB46_21
.LBB46_14:
	add	w8, w24, w28
	cmp	w8, w27
	b.eq	.LBB46_19
// %bb.15:
	ldr	w9, [x19, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB46_17
// %bb.16:
	ldr	x9, [x19, #16]
	ldrb	w9, [x9, #2182]
	and	w9, w9, #0x1
	b	.LBB46_18
.LBB46_17:
	mov	w9, wzr
.LBB46_18:
	cmp	w22, #3                 // =3
	add	w10, w8, #6             // =6
	cset	w11, lo
	cmp	w8, #3                  // =3
	csel	w10, w10, w8, lo
	tst	w11, w9
	and	w10, w10, #0xffff
	ldr	x9, [x26]
	csel	w3, w10, w8, ne
	add	x1, sp, #4              // =4
	mov	x0, x19
	mov	w2, wzr
	mov	w4, w21
	mov	x5, x20
	blr	x9
	cbz	w0, .LBB46_21
.LBB46_19:
	ldr	x8, [x19, #80]
	tbnz	w8, #8, .LBB46_24
// %bb.20:
	mov	w0, wzr
	b	.LBB46_22
.LBB46_21:
	mov	w8, #120
	ldr	w9, [sp, #4]
	mov	w0, #1
	madd	x8, x25, x8, x23
	str	w9, [x8, #112]
.LBB46_22:
	adrp	x9, __stack_chk_guard
	ldr	x8, [sp, #8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB46_31
// %bb.23:
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB46_24:
	ldr	x8, [x19, #136]
	ldr	x22, [x8, #16]
	add	x20, x22, #80           // =80
	mov	x0, x20
	bl	mutex_lock
	ldr	x8, [x19, #136]
	mov	x2, xzr
	ldr	x0, [x22, #56]
	ldr	w1, [x8, #96]
	bl	find_next_bit
	ldr	x9, [x19, #136]
	mov	x21, x0
	ldr	w8, [x9, #96]
	cmp	w8, w21
	b.ls	.LBB46_30
// %bb.25:
	ldr	x9, [x9]
	and	x10, x21, #0xffffffff
	mov	w11, #48
	mul	x10, x10, x11
	ldr	x9, [x9, #136]
	ldr	w9, [x9, x10]
	tst	w9, #0x3ffffc0
	b.eq	.LBB46_29
// %bb.26:
	mov	w24, #48
.LBB46_27:                              // =>This Inner Loop Header: Depth=1
	ldr	x0, [x22, #56]
	mov	w1, w8
	add	w2, w21, #1             // =1
	bl	find_next_bit
	ldr	x9, [x19, #136]
	mov	x21, x0
	ldr	w8, [x9, #96]
	cmp	w8, w21
	b.ls	.LBB46_30
// %bb.28:                              //   in Loop: Header=BB46_27 Depth=1
	ldr	x9, [x9]
	and	x10, x21, #0xffffffff
	mul	x10, x10, x24
	ldr	x9, [x9, #136]
	ldr	w9, [x9, x10]
	tst	w9, #0x3ffffc0
	b.ne	.LBB46_27
.LBB46_29:
	mov	x0, x20
	bl	mutex_unlock
	mov	w8, #120
	mov	w0, #1
	str	w21, [sp, #4]
	mul	x8, x25, x8
	add	x8, x23, x8
	str	w21, [x8, #112]
	b	.LBB46_22
.LBB46_30:
	mov	x0, x20
	bl	mutex_unlock
	mov	w8, #-1
	mov	w0, wzr
	str	w8, [sp, #4]
	b	.LBB46_22
.LBB46_31:
	bl	__stack_chk_fail
.LBB46_32:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB46_35
// %bb.33:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB46_35
// %bb.34:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.sanity_check_seg_type
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #47
	add	x2, x2, :lo12:.L__func__.sanity_check_seg_type
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB46_35:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.h"; .popsection; .long 14472b - 14470b; .short 47; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end46:
	.size	get_ssr_segment, .Lfunc_end46-get_ssr_segment
                                        // -- End function
	.p2align	3               // -- Begin function change_curseg
	.type	change_curseg,@function
change_curseg:                          // @change_curseg
// %bb.0:
	sub	sp, sp, #128            // =128
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	mov	w8, #120
	stp	x28, x27, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	stp	x26, x25, [sp, #64]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #80]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #96]     // 16-byte Folded Spill
	mov	w21, w1
	stp	x20, x19, [sp, #112]    // 16-byte Folded Spill
	mov	x19, x0
	ldr	x9, [x0, #136]
	ldp	x24, x22, [x9, #16]
	smaddl	x23, w1, w8, x22
	ldr	x1, [x23, #32]!
	ldr	w8, [x9, #88]
	mov	x25, x23
	ldr	w20, [x23, #80]
	ldr	w9, [x25, #68]!
	add	w2, w9, w8
	bl	f2fs_update_meta_page
	ldr	x8, [x19, #136]
	cmn	w20, #1                 // =1
	str	x22, [sp, #16]          // 8-byte Folded Spill
	ldr	x27, [x8, #8]
	b.eq	.LBB47_2
// %bb.1:
	ldr	w8, [x19, #1192]
	udiv	w8, w20, w8
	b	.LBB47_3
.LBB47_2:
	mov	w8, #-1
.LBB47_3:
	add	x22, x27, #12           // =12
	str	x8, [sp, #8]            // 8-byte Folded Spill
	mov	x0, x22
	bl	_raw_spin_lock
	ldr	x8, [x27, #16]
	lsr	x28, x20, #6
	mov	w10, #1
	lsl	x26, x10, x20
	ldr	x9, [x8, x28, lsl #3]
	stur	x9, [x29, #-8]
	ldur	x9, [x29, #-8]
	tst	x9, x26
	b.ne	.LBB47_16
// %bb.4:
	add	x8, x8, x28, lsl #3
	//APP
	// atomic64_fetch_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x10, x9, x26
	stlxr	w11, x10, [x8]
	cbnz	w11, 1b
	dmb ish
	//NO_APP
	tst	x9, x26
	b.ne	.LBB47_16
// %bb.5:
	ldr	w8, [x27, #4]
	sub	w8, w8, #1              // =1
	str	w8, [x27, #4]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB47_13
// %bb.6:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB47_13
// %bb.7:
	ldr	x8, [x19, #3032]
	ldr	w9, [x8, #84]
	cmp	w9, w20
	b.hi	.LBB47_10
// %bb.8:
	ldr	w9, [x8, #88]
	cmp	w9, w20
	b.lo	.LBB47_10
// %bb.9:
	ldr	w9, [x8, #168]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #168]
	ldr	x8, [x19, #3032]
.LBB47_10:
	ldr	w9, [x8, #276]
	cmp	w9, w20
	b.hi	.LBB47_13
// %bb.11:
	ldr	w9, [x8, #280]
	cmp	w9, w20
	b.lo	.LBB47_13
// %bb.12:
	ldr	w9, [x8, #360]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #360]
.LBB47_13:
	ldr	x12, [sp, #8]           // 8-byte Folded Reload
	ldr	x8, [x27, #24]
	lsr	w10, w12, #6
	ldr	x9, [x8, w10, uxtw #3]
	stur	x9, [x29, #-8]
	mov	w9, #1
	ldur	x11, [x29, #-8]
	lsl	x9, x9, x12
	tst	x11, x9
	b.ne	.LBB47_16
// %bb.14:
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
	b.ne	.LBB47_16
// %bb.15:
	ldr	w8, [x27, #8]
	sub	w8, w8, #1              // =1
	str	w8, [x27, #8]
.LBB47_16:
	mov	x0, x22
	sxtw	x27, w21
	bl	_raw_spin_unlock
	add	x22, x24, #80           // =80
	mov	x0, x22
	bl	mutex_lock
	ldr	x8, [x19, #136]
	ldr	x8, [x8, #16]
	ldr	x9, [x8, #64]
	ldr	x10, [x9, x28, lsl #3]
	stur	x10, [x29, #-8]
	ldur	x10, [x29, #-8]
	tst	x10, x26
	b.eq	.LBB47_19
// %bb.17:
	add	x9, x9, x28, lsl #3
	//APP
	// atomic64_fetch_andnot
	prfm	pstl1strm, [x9]
1:	ldxr	x10, [x9]
	bic	x11, x10, x26
	stlxr	w12, x11, [x9]
	cbnz	w12, 1b
	dmb ish
	//NO_APP
	tst	x10, x26
	b.eq	.LBB47_19
// %bb.18:
	ldr	w9, [x8, #140]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #140]
.LBB47_19:
	mov	x0, x19
	mov	w1, w20
	mov	w2, #6
	bl	__remove_dirty_segment
	mov	x0, x22
	bl	mutex_unlock
	mov	x0, x19
	mov	w1, w21
	mov	w2, #1
	mov	w21, #1
	bl	reset_curseg
	ldr	x9, [sp, #16]           // 8-byte Folded Reload
	mov	w8, #120
	mov	w11, #48
	mov	x2, xzr
	madd	x22, x27, x8, x9
	ldr	w9, [x25]
	strb	w21, [x22, #96]
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
	ldr	x10, [x8, #136]
	ldr	x0, [x8, #64]
	madd	x9, x9, x11, x10
	ldr	x10, [x9, #24]
	ldr	x9, [x9, #8]
	ldr	x11, [x10]
	ldr	x12, [x9]
	orr	x8, x12, x11
	str	x8, [x0]
	ldr	x8, [x10, #8]
	ldr	x11, [x9, #8]
	orr	x8, x11, x8
	str	x8, [x0, #8]
	ldr	x8, [x10, #16]
	ldr	x11, [x9, #16]
	orr	x8, x11, x8
	str	x8, [x0, #16]
	ldr	x8, [x10, #24]
	ldr	x11, [x9, #24]
	orr	x8, x11, x8
	str	x8, [x0, #24]
	ldr	x8, [x10, #32]
	ldr	x11, [x9, #32]
	orr	x8, x11, x8
	str	x8, [x0, #32]
	ldr	x8, [x10, #40]
	ldr	x11, [x9, #40]
	orr	x8, x11, x8
	str	x8, [x0, #40]
	ldr	x8, [x10, #48]
	ldr	x11, [x9, #48]
	orr	x8, x11, x8
	str	x8, [x0, #48]
	ldr	x8, [x10, #56]
	ldr	x9, [x9, #56]
	orr	x8, x9, x8
	str	x8, [x0, #56]
	ldr	w1, [x19, #1188]
	bl	__find_rev_next_zero_bit
	strh	w0, [x22, #104]
	ldr	x8, [x19, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB47_21
// %bb.20:
	ldr	x8, [x19, #136]
	mov	x0, x19
	ldr	w8, [x8, #88]
	add	w1, w8, w20
	bl	f2fs_get_meta_page_retry
	cmn	x0, #4095               // =4095
	b.lo	.LBB47_22
.LBB47_21:
	ldr	x0, [x23]
	mov	w1, wzr
	mov	w2, #3584
	bl	memset
	b	.LBB47_48
.LBB47_22:
	mov	x19, x0
	ldr	x0, [x23]
	lsl	x8, x19, #6
	orr	x1, x8, #0xffffffc000000000
	mov	w2, #3584
	bl	memcpy
	cbz	x19, .LBB47_48
// %bb.23:
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
	b.ne	.LBB47_40
// %bb.24:
	tbnz	w8, #0, .LBB47_38
// %bb.25:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB47_28
// %bb.26:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB47_28
// %bb.27:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB47_28:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB47_30
// %bb.29:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB47_49
.LBB47_30:
	ldr	x0, [x19, #24]
.LBB47_31:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB47_33
// %bb.32:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB47_50
.LBB47_33:
	ldr	x0, [x19, #24]
.LBB47_34:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB47_36
// %bb.35:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB47_51
.LBB47_36:
	ldr	x0, [x19, #24]
.LBB47_37:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB47_38:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB47_46
// %bb.39:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB47_40:
	tbnz	w8, #0, .LBB47_45
// %bb.41:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB47_44
// %bb.42:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB47_44
// %bb.43:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB47_44:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB47_45:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB47_52
.LBB47_46:
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
	cbnz	w9, .LBB47_48
// %bb.47:
	bl	__put_page
.LBB47_48:
	ldp	x20, x19, [sp, #112]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #128            // =128
	ret
.LBB47_49:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB47_31
.LBB47_50:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB47_34
.LBB47_51:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB47_37
.LBB47_52:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end47:
	.size	change_curseg, .Lfunc_end47-change_curseg
                                        // -- End function
	.p2align	3               // -- Begin function new_curseg
	.type	new_curseg,@function
new_curseg:                             // @new_curseg
// %bb.0:
	sub	sp, sp, #176            // =176
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	mov	w8, #120
	stp	x28, x27, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	stp	x26, x25, [sp, #112]    // 16-byte Folded Spill
	mov	w25, w1
	stp	x24, x23, [sp, #128]    // 16-byte Folded Spill
	sxtw	x28, w25
	stp	x22, x21, [sp, #144]    // 16-byte Folded Spill
	mov	w22, w2
	stp	x20, x19, [sp, #160]    // 16-byte Folded Spill
	mov	x19, x0
	ldr	x9, [x0, #136]
	ldr	x23, [x9, #24]
	smaddl	x8, w1, w8, x23
	ldrb	w10, [x8, #116]
	ldrh	w20, [x8, #98]
	cbz	w10, .LBB48_2
// %bb.1:
	mov	w8, #120
	ldr	w9, [x9, #88]
	mov	x0, x19
	mul	x21, x28, x8
	add	x8, x23, x21
	ldr	w10, [x8, #100]
	ldr	x1, [x8, #32]
	add	w2, w9, w10
	bl	f2fs_update_meta_page
	ldr	x9, [x19, #136]
	ldr	x10, [x9, #24]
	add	x8, x10, x21
	ldrh	w11, [x8, #98]
	b	.LBB48_3
.LBB48_2:
	mov	w11, w20
	mov	x10, x23
.LBB48_3:
	ldr	w12, [x19, #1424]
	sub	w8, w20, #1             // =1
	cmp	w8, #1                  // =1
	cset	w21, hi
	tst	w12, #0x8
	cset	w14, eq
	cmp	w11, #6                 // =6
	b.hs	.LBB48_116
// %bb.4:
	ldr	w8, [x19, #1192]
	str	x23, [sp, #16]          // 8-byte Folded Spill
	stur	w14, [x29, #-32]        // 4-byte Folded Spill
	cmp	w8, #2                  // =2
	b.lo	.LBB48_6
.LBB48_5:
	mov	w11, #120
	madd	x10, x28, x11, x10
	ldr	w24, [x10, #100]
	b	.LBB48_16
.LBB48_6:
	mov	w13, #120
	madd	x13, x28, x13, x10
	ldrb	w13, [x13, #116]
	cbz	w13, .LBB48_15
// %bb.7:
	ldr	x13, [x19, #80]
	tbnz	w13, #8, .LBB48_15
// %bb.8:
	cmp	w11, #5                 // =5
	b.hi	.LBB48_11
// %bb.9:
	tbz	w12, #3, .LBB48_11
// %bb.10:
	mov	w12, #57
	lsr	w11, w12, w11
	tbnz	w11, #0, .LBB48_15
.LBB48_11:
	ldr	w11, [x19, #3024]
	cmp	w11, #2                 // =2
	b.ne	.LBB48_13
// %bb.12:
	ldr	x11, [x19, #16]
	ldrb	w11, [x11, #2182]
	tbnz	w11, #0, .LBB48_14
.LBB48_13:
	ldr	x11, [x9]
	ldr	w24, [x11, #212]
	cbnz	w24, .LBB48_16
.LBB48_14:
	ldr	w11, [x19, #1488]
	cmp	w11, #1                 // =1
	b.ne	.LBB48_5
.LBB48_15:
	mov	w24, wzr
.LBB48_16:
	ldr	x9, [x9, #8]
	cmn	w24, #1                 // =1
	ldr	w23, [x19, #1200]
	ldr	w20, [x19, #1196]
	stur	x9, [x29, #-24]         // 8-byte Folded Spill
	b.eq	.LBB48_19
// %bb.17:
	udiv	w27, w24, w8
	cmn	w27, #1                 // =1
	b.eq	.LBB48_20
// %bb.18:
	udiv	w9, w27, w20
	stur	w9, [x29, #-28]         // 4-byte Folded Spill
	b	.LBB48_21
.LBB48_19:
	mov	w27, #-1
.LBB48_20:
	stur	w27, [x29, #-28]        // 4-byte Folded Spill
.LBB48_21:
	ldr	w9, [x19, #3024]
	str	x25, [sp, #24]          // 8-byte Folded Spill
	str	x28, [sp, #8]           // 8-byte Folded Spill
	cmp	w9, #2                  // =2
	b.ne	.LBB48_23
// %bb.22:
	ldr	x9, [x19, #16]
	ldrb	w9, [x9, #2182]
	tbnz	w9, #0, .LBB48_90
.LBB48_23:
	mov	w26, wzr
	mov	w28, #1
	mov	w25, w23
.LBB48_24:
	ldur	x8, [x29, #-24]         // 8-byte Folded Reload
	add	x0, x8, #12             // =12
	str	x0, [sp]                // 8-byte Folded Spill
	bl	_raw_spin_lock
	tbnz	w22, #0, .LBB48_31
// %bb.25:
	ldr	w9, [x19, #1192]
	add	w8, w24, #1             // =1
	udiv	w10, w8, w9
	msub	w10, w10, w9, w8
	cbz	w10, .LBB48_31
// %bb.26:
	ldur	x10, [x29, #-24]        // 8-byte Folded Reload
	add	w22, w27, #1            // =1
	mov	w2, w8
	mul	w1, w9, w22
	ldr	x0, [x10, #16]
	bl	find_next_zero_bit
	ldr	w8, [x19, #1192]
	mul	w8, w8, w22
	mov	x22, x0
	cmp	w8, w22
	b.ls	.LBB48_31
.LBB48_27:
	ldur	x8, [x29, #-24]         // 8-byte Folded Reload
	add	w9, w22, #63            // =63
	cmp	w22, #0                 // =0
	csel	w9, w9, w22, lt
	asr	w10, w9, #6
	sbfx	x21, x9, #6, #26
	ldr	x8, [x8, #16]
	mov	w9, #1
	lsl	x20, x9, x22
	ldr	x10, [x8, w10, sxtw #3]
	ldr	x24, [sp, #24]          // 8-byte Folded Reload
	ldr	x25, [sp, #8]           // 8-byte Folded Reload
	tst	x20, x10
	b.ne	.LBB48_104
.LBB48_28:
	ldr	x8, [x8, x21, lsl #3]
	tst	x8, x20
	b.ne	.LBB48_120
// %bb.29:
	ldr	x8, [x19, #136]
	cmn	w22, #1                 // =1
	ldr	x8, [x8, #8]
	b.eq	.LBB48_77
// %bb.30:
	ldr	w9, [x19, #1192]
	udiv	w9, w22, w9
	b	.LBB48_78
.LBB48_31:
	ldur	w8, [x29, #-32]         // 4-byte Folded Reload
	stur	wzr, [x29, #-12]        // 4-byte Folded Spill
	and	w21, w21, w8
	udiv	w8, w23, w20
	mov	w23, w25
	mov	w20, w27
	stur	w8, [x29, #-32]         // 4-byte Folded Spill
	mov	w8, w26
	str	x8, [sp, #32]           // 8-byte Folded Spill
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	sub	w8, w8, #3              // =3
	stur	w8, [x29, #-36]         // 4-byte Folded Spill
	b	.LBB48_33
.LBB48_32:                              //   in Loop: Header=BB48_33 Depth=1
	ldur	w10, [x29, #-32]        // 4-byte Folded Reload
	add	w9, w24, #1             // =1
	mul	w8, w8, w9
	cmp	w9, w10
	csel	w27, w8, wzr, lo
.LBB48_33:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB48_34 Depth 2
                                        //       Child Loop BB48_40 Depth 3
	ldur	x22, [x29, #-24]        // 8-byte Folded Reload
.LBB48_34:                              //   Parent Loop BB48_33 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB48_40 Depth 3
	ldr	x0, [x22, #24]
	mov	w2, w27
	mov	x1, x23
	bl	find_next_zero_bit
	cmp	w25, w0
	b.hi	.LBB48_38
// %bb.35:                              //   in Loop: Header=BB48_34 Depth=2
	tbz	w21, #0, .LBB48_37
// %bb.36:                              //   in Loop: Header=BB48_34 Depth=2
	sub	w20, w27, #1            // =1
	mov	w8, #1
	stur	w8, [x29, #-12]         // 4-byte Folded Spill
	b	.LBB48_39
.LBB48_37:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	x0, [x22, #24]
	mov	x1, x23
	ldr	x2, [sp, #32]           // 8-byte Folded Reload
	bl	find_next_zero_bit
	cmp	w25, w0
	b.ls	.LBB48_108
.LBB48_38:                              //   in Loop: Header=BB48_34 Depth=2
	ldur	w8, [x29, #-12]         // 4-byte Folded Reload
	cbz	w8, .LBB48_42
.LBB48_39:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	x8, [x22, #24]
	add	w9, w20, #63            // =63
	cmp	w20, #0                 // =0
	csel	w9, w9, w20, lt
	asr	w9, w9, #6
	ldr	x9, [x8, w9, sxtw #3]
	lsr	x9, x9, x20
	tbz	w9, #0, .LBB48_43
.LBB48_40:                              //   Parent Loop BB48_33 Depth=1
                                        //     Parent Loop BB48_34 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	cmp	w20, w26
	b.ls	.LBB48_45
// %bb.41:                              //   in Loop: Header=BB48_40 Depth=3
	sub	w0, w20, #1             // =1
	add	w9, w20, #62            // =62
	cmp	w0, #0                  // =0
	mov	w20, w0
	csel	w9, w9, w0, lt
	asr	w9, w9, #6
	ldr	x9, [x8, w9, sxtw #3]
	lsr	x9, x9, x0
	tbnz	w9, #0, .LBB48_40
	b	.LBB48_46
.LBB48_42:                              //   in Loop: Header=BB48_34 Depth=2
	mov	w27, #1
	stur	wzr, [x29, #-12]        // 4-byte Folded Spill
	b	.LBB48_47
.LBB48_43:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	w8, [x19, #1192]
	mov	w27, wzr
	cmn	w20, #1                 // =1
	mul	w22, w8, w20
	b.eq	.LBB48_57
// %bb.44:                              //   in Loop: Header=BB48_34 Depth=2
	mov	w0, w20
	b	.LBB48_48
.LBB48_45:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	x2, [sp, #32]           // 8-byte Folded Reload
	mov	x0, x8
	mov	x1, x23
	bl	find_next_zero_bit
	cmp	w25, w0
	b.ls	.LBB48_112
.LBB48_46:                              //   in Loop: Header=BB48_34 Depth=2
	mov	w27, wzr
	mov	w20, w0
.LBB48_47:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	w8, [x19, #1192]
	mul	w22, w8, w0
.LBB48_48:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	w8, [x19, #1196]
	udiv	w24, w0, w8
	tbz	w28, #0, .LBB48_27
.LBB48_49:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB48_58
// %bb.50:                              //   in Loop: Header=BB48_34 Depth=2
	ldur	w8, [x29, #-36]         // 4-byte Folded Reload
	cmp	w8, #2                  // =2
	b.hi	.LBB48_58
// %bb.51:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	x8, [x19, #16]
	ldr	w8, [x8, #2180]
	tbz	w8, #16, .LBB48_58
// %bb.52:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	x8, [x19, #3032]
	ldr	w9, [x8, #84]
	cmp	w9, w22
	b.hi	.LBB48_54
// %bb.53:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	w8, [x8, #88]
	cmp	w8, w22
	b.hs	.LBB48_58
.LBB48_54:                              //   in Loop: Header=BB48_34 Depth=2
	mov	x0, x19
	mov	w1, wzr
	bl	f2fs_dev_has_enough_space
	tbz	w0, #0, .LBB48_58
// %bb.55:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	x8, [x19, #3032]
	mov	w28, wzr
	ldur	x22, [x29, #-24]        // 8-byte Folded Reload
	mov	w27, #-1
	ldr	w8, [x8, #84]
	cmn	w8, #1                  // =1
	b.eq	.LBB48_34
// %bb.56:                              //   in Loop: Header=BB48_34 Depth=2
	ldr	w9, [x19, #1192]
	mov	w28, wzr
	udiv	w27, w8, w9
	b	.LBB48_34
.LBB48_57:                              //   in Loop: Header=BB48_34 Depth=2
	mov	w24, #-1
	mov	w20, w24
	tbnz	w28, #0, .LBB48_49
	b	.LBB48_27
.LBB48_58:                              //   in Loop: Header=BB48_33 Depth=1
	ldur	w8, [x29, #-28]         // 4-byte Folded Reload
	cmp	w24, w8
	b.eq	.LBB48_27
// %bb.59:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	w8, [x19, #1196]
	cmp	w8, #1                  // =1
	b.eq	.LBB48_27
// %bb.60:                              //   in Loop: Header=BB48_33 Depth=1
	cbz	w21, .LBB48_64
// %bb.61:                              //   in Loop: Header=BB48_33 Depth=1
	cbz	w27, .LBB48_63
// %bb.62:                              //   in Loop: Header=BB48_33 Depth=1
	ldur	w10, [x29, #-32]        // 4-byte Folded Reload
	add	w9, w24, #1             // =1
	cmp	w9, w10
	b.lo	.LBB48_64
	b	.LBB48_27
.LBB48_63:                              //   in Loop: Header=BB48_33 Depth=1
	cbz	w24, .LBB48_27
.LBB48_64:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	x9, [x19, #136]
	ldr	x9, [x9, #24]
	ldr	w10, [x9, #108]
	cmp	w10, w24
	b.eq	.LBB48_75
// %bb.65:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	w10, [x9, #228]
	cmp	w10, w24
	b.eq	.LBB48_75
// %bb.66:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	w10, [x9, #348]
	cmp	w10, w24
	b.eq	.LBB48_75
// %bb.67:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	w10, [x9, #468]
	cmp	w10, w24
	b.eq	.LBB48_75
// %bb.68:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	w10, [x9, #588]
	cmp	w10, w24
	b.eq	.LBB48_75
// %bb.69:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	w10, [x9, #708]
	cmp	w10, w24
	b.eq	.LBB48_75
// %bb.70:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	w10, [x9, #828]
	cmp	w10, w24
	b.eq	.LBB48_75
// %bb.71:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	w10, [x9, #948]
	cmp	w10, w24
	b.eq	.LBB48_75
// %bb.72:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	w10, [x9, #1068]
	cmp	w10, w24
	b.eq	.LBB48_75
// %bb.73:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	w10, [x9, #1188]
	cmp	w10, w24
	b.eq	.LBB48_75
// %bb.74:                              //   in Loop: Header=BB48_33 Depth=1
	ldr	w9, [x9, #1308]
	cmp	w9, w24
	b.ne	.LBB48_27
.LBB48_75:                              //   in Loop: Header=BB48_33 Depth=1
	mov	w28, wzr
	tbnz	w27, #0, .LBB48_32
// %bb.76:                              //   in Loop: Header=BB48_33 Depth=1
	mul	w8, w8, w24
	sub	w27, w8, #1             // =1
	b	.LBB48_33
.LBB48_77:
	mov	w9, #-1
.LBB48_78:
	ldr	x10, [x8, #16]
	lsr	w11, w22, #6
	add	x10, x10, w11, uxtw #3
	//APP
	// atomic64_or
	prfm	pstl1strm, [x10]
1:	ldxr	x11, [x10]
	orr	x11, x11, x20
	stxr	w12, x11, [x10]
	cbnz	w12, 1b
	//NO_APP
	ldr	w10, [x8, #4]
	sub	w10, w10, #1            // =1
	str	w10, [x8, #4]
	ldr	w10, [x19, #3024]
	cmp	w10, #2                 // =2
	b.ne	.LBB48_86
// %bb.79:
	ldr	x10, [x19, #16]
	ldrb	w10, [x10, #2182]
	tbz	w10, #0, .LBB48_86
// %bb.80:
	ldr	x10, [x19, #3032]
	ldr	w11, [x10, #84]
	cmp	w11, w22
	b.hi	.LBB48_83
// %bb.81:
	ldr	w11, [x10, #88]
	cmp	w11, w22
	b.lo	.LBB48_83
// %bb.82:
	ldr	w11, [x10, #168]
	sub	w11, w11, #1            // =1
	str	w11, [x10, #168]
	ldr	x10, [x19, #3032]
.LBB48_83:
	ldr	w11, [x10, #276]
	cmp	w11, w22
	b.hi	.LBB48_86
// %bb.84:
	ldr	w11, [x10, #280]
	cmp	w11, w22
	b.lo	.LBB48_86
// %bb.85:
	ldr	w11, [x10, #360]
	sub	w11, w11, #1            // =1
	str	w11, [x10, #360]
.LBB48_86:
	ldr	x10, [x8, #24]
	lsr	w11, w9, #6
	mov	w13, #1
	lsl	x9, x13, x9
	ldr	x12, [x10, w11, uxtw #3]
	stur	x12, [x29, #-8]
	ldur	x12, [x29, #-8]
	tst	x12, x9
	b.ne	.LBB48_89
// %bb.87:
	add	x10, x10, x11, lsl #3
	//APP
	// atomic64_fetch_or
	prfm	pstl1strm, [x10]
1:	ldxr	x11, [x10]
	orr	x12, x11, x9
	stlxr	w13, x12, [x10]
	cbnz	w13, 1b
	dmb ish
	//NO_APP
	tst	x11, x9
	b.ne	.LBB48_89
// %bb.88:
	ldr	w9, [x8, #8]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #8]
.LBB48_89:
	ldr	x0, [sp]                // 8-byte Folded Reload
	bl	_raw_spin_unlock
	mov	w8, #120
	ldr	x9, [sp, #16]           // 8-byte Folded Reload
	mov	x0, x19
	mov	w1, w24
	mul	x8, x25, x8
	mov	w2, #1
	add	x20, x9, x8
	str	w22, [x20, #112]
	bl	reset_curseg
	strb	wzr, [x20, #96]
	ldp	x20, x19, [sp, #160]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #144]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #128]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #112]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #96]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB48_90:
	cmp	w25, #3                 // =3
	b.hs	.LBB48_93
// %bb.91:
	ldr	x9, [x19, #3032]
	ldr	w10, [x9, #84]
	cmn	w10, #1                 // =1
	b.eq	.LBB48_96
// %bb.92:
	udiv	w26, w10, w8
	b	.LBB48_97
.LBB48_93:
	sub	w9, w25, #6             // =6
	cmp	w9, #2                  // =2
	b.hi	.LBB48_23
// %bb.94:
	ldr	x9, [x19, #3032]
	ldr	w10, [x9, #276]
	cmn	w10, #1                 // =1
	b.eq	.LBB48_98
// %bb.95:
	udiv	w26, w10, w8
	b	.LBB48_99
.LBB48_96:
	mov	w26, #-1
.LBB48_97:
	ldr	w9, [x9, #88]
	b	.LBB48_100
.LBB48_98:
	mov	w26, #-1
.LBB48_99:
	ldr	w9, [x9, #280]
.LBB48_100:
	add	w9, w9, #1              // =1
	cmn	w9, #1                  // =1
	b.eq	.LBB48_102
// %bb.101:
	udiv	w25, w9, w8
	b	.LBB48_103
.LBB48_102:
	mov	w25, #-1
.LBB48_103:
	cmp	w27, w25
	mov	w28, wzr
	ccmp	w27, w26, #0, lo
	csel	w27, w26, w27, lo
	b	.LBB48_24
.LBB48_104:
	bl	print_bdev_access_info
	adrp	x23, f2fs_dclient
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_107
// %bb.105:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_107
// %bb.106:
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.get_new_segment
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3422
	add	x2, x2, :lo12:.L__func__.get_new_segment
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_107:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldur	x8, [x29, #-24]         // 8-byte Folded Reload
	ldr	x8, [x8, #16]
	b	.LBB48_28
.LBB48_108:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_111
// %bb.109:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_111
// %bb.110:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.get_new_segment
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3354
	add	x2, x2, :lo12:.L__func__.get_new_segment
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_111:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 3354; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_112:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_115
// %bb.113:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_115
// %bb.114:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.get_new_segment
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3371
	add	x2, x2, :lo12:.L__func__.get_new_segment
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_115:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 3371; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_116:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_119
// %bb.117:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_119
// %bb.118:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.sanity_check_seg_type
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #47
	add	x2, x2, :lo12:.L__func__.sanity_check_seg_type
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_119:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.h"; .popsection; .long 14472b - 14470b; .short 47; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_120:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 3422; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end48:
	.size	new_curseg, .Lfunc_end48-new_curseg
                                        // -- End function
	.globl	f2fs_init_inmem_curseg  // -- Begin function f2fs_init_inmem_curseg
	.p2align	3
	.type	f2fs_init_inmem_curseg,@function
f2fs_init_inmem_curseg:                 // @f2fs_init_inmem_curseg
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	ldrb	w8, [x0, #1800]
	cbz	w8, .LBB49_5
// %bb.1:
	ldr	x8, [x19, #136]
	ldr	x20, [x8, #24]
	add	x0, x8, #32             // =32
	bl	down_read
	add	x20, x20, #1200         // =1200
	mov	x0, x20
	bl	mutex_lock
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
	add	x0, x8, #88             // =88
	bl	down_write
	ldr	x8, [x19, #136]
	mov	w22, #2
	mov	w1, #10
	mov	x0, x19
	mov	w2, #1
	mov	x3, xzr
	ldr	x21, [x8, #24]
	strh	w22, [x21, #1298]
	bl	get_ssr_segment
	cbz	w0, .LBB49_3
// %bb.2:
	ldr	x8, [x19, #136]
	mov	w10, #48
	ldr	w9, [x21, #1312]
	mov	w1, #10
	mov	x0, x19
	ldr	x8, [x8]
	mul	x9, x9, x10
	ldr	x8, [x8, #136]
	ldrh	w8, [x8, x9]
	and	w8, w8, #0x3f
	strh	w8, [x21, #1298]
	bl	change_curseg
	b	.LBB49_4
.LBB49_3:
	mov	w1, #10
	mov	x0, x19
	mov	w2, #1
	strh	w22, [x21, #1298]
	bl	new_curseg
.LBB49_4:
	ldrb	w8, [x21, #1296]
	ldr	x10, [x19, #136]
	add	x8, x19, x8, lsl #2
	ldr	w9, [x8, #2040]
	add	w9, w9, #1              // =1
	str	w9, [x8, #2040]
	ldr	x8, [x10]
	add	x0, x8, #88             // =88
	bl	up_write
	mov	x0, x20
	bl	mutex_unlock
	ldr	x8, [x19, #136]
	add	x0, x8, #32             // =32
	bl	up_read
.LBB49_5:
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB49_10
// %bb.6:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB49_10
// %bb.7:
	ldr	x8, [x19, #136]
	ldr	x8, [x8, #24]
	ldrb	w9, [x8, #836]
	cbz	w9, .LBB49_11
// %bb.8:
	ldrb	w9, [x8, #956]
	cbz	w9, .LBB49_12
.LBB49_9:
	ldrb	w8, [x8, #1076]
	cbz	w8, .LBB49_13
.LBB49_10:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB49_11:
	mov	x0, x19
	mov	w1, #6
	bl	f2fs_init_dm_curseg
	ldr	x8, [x19, #136]
	ldr	x8, [x8, #24]
	ldrb	w9, [x8, #956]
	cbnz	w9, .LBB49_9
.LBB49_12:
	mov	x0, x19
	mov	w1, #7
	bl	f2fs_init_dm_curseg
	ldr	x8, [x19, #136]
	ldr	x8, [x8, #24]
	ldrb	w8, [x8, #1076]
	cbnz	w8, .LBB49_10
.LBB49_13:
	mov	x0, x19
	mov	w1, #8
	bl	f2fs_init_dm_curseg
	b	.LBB49_10
.Lfunc_end49:
	.size	f2fs_init_inmem_curseg, .Lfunc_end49-f2fs_init_inmem_curseg
                                        // -- End function
	.globl	f2fs_save_inmem_curseg  // -- Begin function f2fs_save_inmem_curseg
	.p2align	3
	.type	f2fs_save_inmem_curseg,@function
f2fs_save_inmem_curseg:                 // @f2fs_save_inmem_curseg
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	mov	w1, #9
	str	x19, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	mov	x19, x0
	bl	__f2fs_save_inmem_curseg
	ldrb	w8, [x19, #1800]
	cbz	w8, .LBB50_2
// %bb.1:
	mov	w1, #10
	mov	x0, x19
	bl	__f2fs_save_inmem_curseg
.LBB50_2:
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB50_5
// %bb.3:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB50_5
// %bb.4:
	mov	x0, x19
	mov	w1, #6
	bl	__f2fs_save_inmem_curseg
	mov	x0, x19
	mov	w1, #7
	bl	__f2fs_save_inmem_curseg
	mov	x0, x19
	mov	w1, #8
	bl	__f2fs_save_inmem_curseg
.LBB50_5:
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end50:
	.size	f2fs_save_inmem_curseg, .Lfunc_end50-f2fs_save_inmem_curseg
                                        // -- End function
	.p2align	3               // -- Begin function __f2fs_save_inmem_curseg
	.type	__f2fs_save_inmem_curseg,@function
__f2fs_save_inmem_curseg:               // @__f2fs_save_inmem_curseg
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	mov	w21, w1
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	x20, x0
	ldr	x8, [x0, #136]
	str	x25, [sp, #16]          // 8-byte Folded Spill
	ldr	x22, [x8, #24]
	mov	w8, #120
	smaddl	x19, w1, w8, x22
	mov	x0, x19
	bl	mutex_lock
	ldrb	w8, [x19, #116]
	cbz	w8, .LBB51_21
// %bb.1:
	mov	w9, #120
	sxtw	x8, w21
	mov	w12, #48
	madd	x21, x8, x9, x22
	ldr	w9, [x21, #100]!
	ldr	x10, [x20, #136]
	mul	x12, x9, x12
	ldr	x11, [x10]
	ldr	x11, [x11, #136]
	ldrh	w11, [x11, x12]
	tst	w11, #0xffc0
	b.eq	.LBB51_3
// %bb.2:
	mov	w11, #120
	ldr	w10, [x10, #88]
	mov	x0, x20
	madd	x8, x8, x11, x22
	add	w2, w10, w9
	ldr	x1, [x8, #32]
	bl	f2fs_update_meta_page
	b	.LBB51_21
.LBB51_3:
	ldr	x8, [x10, #16]
	add	x0, x8, #80             // =80
	bl	mutex_lock
	ldr	x8, [x20, #136]
	ldr	w24, [x21]
	ldr	w25, [x20, #1192]
	ldr	x22, [x8, #8]
	cmn	w24, #1                 // =1
	b.eq	.LBB51_5
// %bb.4:
	udiv	w23, w24, w25
	b	.LBB51_6
.LBB51_5:
	mov	w23, #-1
.LBB51_6:
	add	x21, x22, #12           // =12
	mov	x0, x21
	bl	_raw_spin_lock
	ldr	x8, [x22, #16]
	lsr	x10, x24, #6
	ldr	x9, [x8, x10, lsl #3]
	str	x9, [x29, #24]
	mov	w9, #1
	ldr	x11, [x29, #24]
	lsl	x9, x9, x24
	tst	x11, x9
	b.eq	.LBB51_20
// %bb.7:
	add	x8, x8, x10, lsl #3
	//APP
	// atomic64_fetch_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x11, x10, x9
	stlxr	w12, x11, [x8]
	cbnz	w12, 1b
	dmb ish
	//NO_APP
	tst	x10, x9
	b.eq	.LBB51_20
// %bb.8:
	ldr	w8, [x22, #4]
	mul	w25, w25, w23
	add	w8, w8, #1              // =1
	str	w8, [x22, #4]
	ldr	w8, [x20, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB51_16
// %bb.9:
	ldr	x8, [x20, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB51_16
// %bb.10:
	ldr	x8, [x20, #3032]
	ldr	w9, [x8, #84]
	cmp	w9, w24
	b.hi	.LBB51_13
// %bb.11:
	ldr	w9, [x8, #88]
	cmp	w9, w24
	b.lo	.LBB51_13
// %bb.12:
	ldr	w9, [x8, #168]
	add	w9, w9, #1              // =1
	str	w9, [x8, #168]
	ldr	x8, [x20, #3032]
.LBB51_13:
	ldr	w9, [x8, #276]
	cmp	w9, w24
	b.hi	.LBB51_16
// %bb.14:
	ldr	w9, [x8, #280]
	cmp	w9, w24
	b.lo	.LBB51_16
// %bb.15:
	ldr	w9, [x8, #360]
	add	w9, w9, #1              // =1
	str	w9, [x8, #360]
.LBB51_16:
	ldr	w8, [x20, #1192]
	mov	w2, w25
	ldr	x0, [x22, #16]
	add	w1, w8, w25
	bl	find_next_bit
	ldr	w8, [x20, #1192]
	add	w8, w8, w25
	cmp	w8, w0
	b.hi	.LBB51_20
// %bb.17:
	ldr	x8, [x22, #24]
	lsr	w10, w23, #6
	ldr	x9, [x8, w10, uxtw #3]
	str	x9, [x29, #24]
	mov	w9, #1
	ldr	x11, [x29, #24]
	lsl	x9, x9, x23
	tst	x11, x9
	b.eq	.LBB51_20
// %bb.18:
	add	x8, x8, x10, lsl #3
	//APP
	// atomic64_fetch_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x11, x10, x9
	stlxr	w12, x11, [x8]
	cbnz	w12, 1b
	dmb ish
	//NO_APP
	tst	x10, x9
	b.eq	.LBB51_20
// %bb.19:
	ldr	w8, [x22, #8]
	add	w8, w8, #1              // =1
	str	w8, [x22, #8]
.LBB51_20:
	mov	x0, x21
	bl	_raw_spin_unlock
	ldr	x8, [x20, #136]
	ldr	x8, [x8, #16]
	add	x0, x8, #80             // =80
	bl	mutex_unlock
.LBB51_21:
	mov	x0, x19
	bl	mutex_unlock
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.Lfunc_end51:
	.size	__f2fs_save_inmem_curseg, .Lfunc_end51-__f2fs_save_inmem_curseg
                                        // -- End function
	.globl	f2fs_restore_inmem_curseg // -- Begin function f2fs_restore_inmem_curseg
	.p2align	3
	.type	f2fs_restore_inmem_curseg,@function
f2fs_restore_inmem_curseg:              // @f2fs_restore_inmem_curseg
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	mov	w1, #9
	str	x19, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	mov	x19, x0
	bl	__f2fs_restore_inmem_curseg
	ldrb	w8, [x19, #1800]
	cbz	w8, .LBB52_2
// %bb.1:
	mov	w1, #10
	mov	x0, x19
	bl	__f2fs_restore_inmem_curseg
.LBB52_2:
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB52_5
// %bb.3:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB52_5
// %bb.4:
	mov	x0, x19
	mov	w1, #6
	bl	__f2fs_restore_inmem_curseg
	mov	x0, x19
	mov	w1, #7
	bl	__f2fs_restore_inmem_curseg
	mov	x0, x19
	mov	w1, #8
	bl	__f2fs_restore_inmem_curseg
.LBB52_5:
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end52:
	.size	f2fs_restore_inmem_curseg, .Lfunc_end52-f2fs_restore_inmem_curseg
                                        // -- End function
	.p2align	3               // -- Begin function __f2fs_restore_inmem_curseg
	.type	__f2fs_restore_inmem_curseg,@function
__f2fs_restore_inmem_curseg:            // @__f2fs_restore_inmem_curseg
// %bb.0:
	sub	sp, sp, #80             // =80
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	mov	w21, w1
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	x20, x0
	ldr	x8, [x0, #136]
	ldr	x22, [x8, #24]
	mov	w8, #120
	smaddl	x19, w1, w8, x22
	mov	x0, x19
	bl	mutex_lock
	ldrb	w8, [x19, #116]
	cbz	w8, .LBB53_19
// %bb.1:
	mov	w8, #120
	sxtw	x9, w21
	mov	w11, #48
	madd	x21, x9, x8, x22
	ldr	w9, [x21, #100]!
	ldr	x8, [x20, #136]
	mul	x9, x9, x11
	ldr	x10, [x8]
	ldr	x10, [x10, #136]
	ldrh	w9, [x10, x9]
	tst	w9, #0xffc0
	b.ne	.LBB53_19
// %bb.2:
	ldr	x8, [x8, #16]
	add	x0, x8, #80             // =80
	bl	mutex_lock
	ldr	x8, [x20, #136]
	ldr	w24, [x21]
	ldr	x22, [x8, #8]
	cmn	w24, #1                 // =1
	b.eq	.LBB53_4
// %bb.3:
	ldr	w8, [x20, #1192]
	udiv	w23, w24, w8
	b	.LBB53_5
.LBB53_4:
	mov	w23, #-1
.LBB53_5:
	add	x21, x22, #12           // =12
	mov	x0, x21
	bl	_raw_spin_lock
	ldr	x8, [x22, #16]
	lsr	x10, x24, #6
	ldr	x9, [x8, x10, lsl #3]
	str	x9, [sp, #8]
	mov	w9, #1
	ldr	x11, [sp, #8]
	lsl	x9, x9, x24
	tst	x11, x9
	b.ne	.LBB53_18
// %bb.6:
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
	b.ne	.LBB53_18
// %bb.7:
	ldr	w8, [x22, #4]
	sub	w8, w8, #1              // =1
	str	w8, [x22, #4]
	ldr	w8, [x20, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB53_15
// %bb.8:
	ldr	x8, [x20, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB53_15
// %bb.9:
	ldr	x8, [x20, #3032]
	ldr	w9, [x8, #84]
	cmp	w9, w24
	b.hi	.LBB53_12
// %bb.10:
	ldr	w9, [x8, #88]
	cmp	w9, w24
	b.lo	.LBB53_12
// %bb.11:
	ldr	w9, [x8, #168]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #168]
	ldr	x8, [x20, #3032]
.LBB53_12:
	ldr	w9, [x8, #276]
	cmp	w9, w24
	b.hi	.LBB53_15
// %bb.13:
	ldr	w9, [x8, #280]
	cmp	w9, w24
	b.lo	.LBB53_15
// %bb.14:
	ldr	w9, [x8, #360]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #360]
.LBB53_15:
	ldr	x8, [x22, #24]
	lsr	w10, w23, #6
	ldr	x9, [x8, w10, uxtw #3]
	str	x9, [sp, #8]
	mov	w9, #1
	ldr	x11, [sp, #8]
	lsl	x9, x9, x23
	tst	x11, x9
	b.ne	.LBB53_18
// %bb.16:
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
	b.ne	.LBB53_18
// %bb.17:
	ldr	w8, [x22, #8]
	sub	w8, w8, #1              // =1
	str	w8, [x22, #8]
.LBB53_18:
	mov	x0, x21
	bl	_raw_spin_unlock
	ldr	x8, [x20, #136]
	ldr	x8, [x8, #16]
	add	x0, x8, #80             // =80
	bl	mutex_unlock
.LBB53_19:
	mov	x0, x19
	bl	mutex_unlock
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #80             // =80
	ret
.Lfunc_end53:
	.size	__f2fs_restore_inmem_curseg, .Lfunc_end53-__f2fs_restore_inmem_curseg
                                        // -- End function
	.globl	f2fs_allocate_segment_for_resize // -- Begin function f2fs_allocate_segment_for_resize
	.p2align	3
	.type	f2fs_allocate_segment_for_resize,@function
f2fs_allocate_segment_for_resize:       // @f2fs_allocate_segment_for_resize
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	mov	w23, w3
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	mov	w24, w2
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #136]
	mov	w20, w1
	sxtw	x26, w20
	ldr	x25, [x8, #24]
	add	x0, x8, #32             // =32
	bl	down_read
	mov	w22, #120
	smaddl	x21, w20, w22, x25
	mov	x0, x21
	bl	mutex_lock
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
	add	x0, x8, #88             // =88
	bl	down_write
	ldr	x8, [x19, #136]
	ldr	x9, [x8, #24]
	smaddl	x9, w20, w22, x9
	ldr	w22, [x9, #100]
	cmp	w22, w24
	ccmp	w22, w23, #2, hs
	b.hi	.LBB54_13
// %bb.1:
	ldr	w9, [x19, #1192]
	ldr	w14, [x19, #1188]
	ldrsw	x13, [x19, #1284]
	ldr	w10, [x19, #1184]
	ldrsw	x12, [x19, #1272]
	ldrsw	x11, [x19, #1296]
	ldr	w15, [x19, #1504]
	cmp	w15, #1                 // =1
	b.eq	.LBB54_11
// %bb.2:
	ldr	w15, [x19, #1868]
	cmp	w15, #5                 // =5
	b.ne	.LBB54_4
// %bb.3:
	ldrb	w15, [x19, #1232]
	tbz	w15, #3, .LBB54_9
.LBB54_4:
	ldr	x15, [x19, #80]
	tbnz	w15, #8, .LBB54_9
// %bb.5:
	mul	w14, w14, w9
	ldr	w15, [x8, #156]
	sub	x14, x14, #1            // =1
	add	x12, x14, x12
	add	x13, x14, x13
	asr	x12, x12, x10
	asr	x13, x13, x10
	udiv	w12, w12, w9
	add	x11, x14, x11
	ldr	x14, [x8, #8]
	udiv	w13, w13, w9
	asr	x10, x11, x10
	ldr	w11, [x8, #100]
	udiv	w10, w10, w9
	add	w12, w13, w12, lsl #1
	ldr	w8, [x14, #8]
	add	w10, w12, w10
	add	w10, w10, w15
	cmn	w11, #1                 // =1
	b.eq	.LBB54_7
// %bb.6:
	udiv	w9, w11, w9
	b	.LBB54_8
.LBB54_7:
	mov	w9, #-1
.LBB54_8:
	add	w9, w10, w9
	cmp	w8, w9
	b.hi	.LBB54_11
.LBB54_9:
	mov	x0, x19
	mov	w1, w20
	mov	w2, #1
	mov	x3, xzr
	bl	get_ssr_segment
	cbz	w0, .LBB54_11
// %bb.10:
	mov	x0, x19
	mov	w1, w20
	bl	change_curseg
	b	.LBB54_12
.LBB54_11:
	mov	x0, x19
	mov	w1, w20
	mov	w2, #1
	bl	new_curseg
.LBB54_12:
	mov	w8, #120
	mov	x0, x19
	mov	w1, w22
	madd	x8, x26, x8, x25
	ldrb	w8, [x8, #96]
	add	x8, x19, x8, lsl #2
	ldr	w9, [x8, #2040]
	add	w9, w9, #1              // =1
	str	w9, [x8, #2040]
	bl	locate_dirty_segment
	ldr	x8, [x19, #136]
.LBB54_13:
	ldr	x8, [x8]
	add	x0, x8, #88             // =88
	bl	up_write
	mov	w8, #120
	madd	x8, x26, x8, x25
	ldr	w4, [x8, #100]
	cmp	w22, w4
	b.eq	.LBB54_15
// %bb.14:
	adrp	x1, .L.str.13
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.13
	mov	w2, w20
	mov	w3, w22
	bl	f2fs_printk
.LBB54_15:
	mov	x0, x21
	bl	mutex_unlock
	ldr	x8, [x19, #136]
	add	x0, x8, #32             // =32
	bl	up_read
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.Lfunc_end54:
	.size	f2fs_allocate_segment_for_resize, .Lfunc_end54-f2fs_allocate_segment_for_resize
                                        // -- End function
	.globl	f2fs_allocate_new_section // -- Begin function f2fs_allocate_new_section
	.p2align	3
	.type	f2fs_allocate_new_section,@function
f2fs_allocate_new_section:              // @f2fs_allocate_new_section
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	ldr	x8, [x0, #136]
	mov	w19, w2
	str	x21, [sp, #16]          // 8-byte Folded Spill
	mov	x21, x0
	mov	w20, w1
	add	x0, x8, #32             // =32
	bl	down_read
	ldr	x8, [x21, #136]
	ldr	x8, [x8]
	add	x0, x8, #88             // =88
	bl	down_write
	and	w3, w19, #0x1
	mov	x0, x21
	mov	w1, w20
	mov	w2, #1
	bl	__allocate_new_segment
	ldr	x8, [x21, #136]
	ldr	x8, [x8]
	add	x0, x8, #88             // =88
	bl	up_write
	ldr	x8, [x21, #136]
	add	x0, x8, #32             // =32
	bl	up_read
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end55:
	.size	f2fs_allocate_new_section, .Lfunc_end55-f2fs_allocate_new_section
                                        // -- End function
	.globl	f2fs_allocate_new_segments // -- Begin function f2fs_allocate_new_segments
	.p2align	3
	.type	f2fs_allocate_new_segments,@function
f2fs_allocate_new_segments:             // @f2fs_allocate_new_segments
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #136]
	mov	x29, sp
	add	x0, x8, #32             // =32
	bl	down_read
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
	add	x0, x8, #88             // =88
	bl	down_write
	ldr	x8, [x19, #136]
	ldr	x9, [x8, #24]
	ldrb	w10, [x9, #116]
	cbz	w10, .LBB56_3
// %bb.1:
	ldrh	w10, [x9, #104]
	cbnz	w10, .LBB56_3
// %bb.2:
	ldr	w10, [x9, #100]
	mov	w12, #48
	ldr	x11, [x8]
	mul	x10, x10, x12
	ldr	x11, [x11, #136]
	ldr	w10, [x11, x10]
	tst	w10, #0x3ffffc0
	b.eq	.LBB56_4
.LBB56_3:
	ldr	x8, [x8]
	mov	x0, x19
	ldr	w20, [x9, #100]
	mov	w1, wzr
	mov	w2, #1
	mov	w3, wzr
	ldr	x8, [x8]
	ldr	x8, [x8]
	blr	x8
	mov	x0, x19
	mov	w1, w20
	bl	locate_dirty_segment
	ldr	x8, [x19, #136]
	ldr	x9, [x8, #24]
.LBB56_4:
	ldrb	w10, [x9, #236]
	cbz	w10, .LBB56_7
// %bb.5:
	ldrh	w10, [x9, #224]
	cbnz	w10, .LBB56_7
// %bb.6:
	ldr	w10, [x9, #220]
	mov	w12, #48
	ldr	x11, [x8]
	mul	x10, x10, x12
	ldr	x11, [x11, #136]
	ldr	w10, [x11, x10]
	tst	w10, #0x3ffffc0
	b.eq	.LBB56_8
.LBB56_7:
	ldr	x8, [x8]
	mov	x0, x19
	ldr	w20, [x9, #220]
	mov	w1, #1
	mov	w2, #1
	mov	w3, wzr
	ldr	x8, [x8]
	ldr	x8, [x8]
	blr	x8
	mov	x0, x19
	mov	w1, w20
	bl	locate_dirty_segment
	ldr	x8, [x19, #136]
	ldr	x9, [x8, #24]
.LBB56_8:
	ldrb	w10, [x9, #356]
	cbz	w10, .LBB56_11
// %bb.9:
	ldrh	w10, [x9, #344]
	cbnz	w10, .LBB56_11
// %bb.10:
	ldr	w10, [x9, #340]
	mov	w12, #48
	ldr	x11, [x8]
	mul	x10, x10, x12
	ldr	x11, [x11, #136]
	ldr	w10, [x11, x10]
	tst	w10, #0x3ffffc0
	b.eq	.LBB56_12
.LBB56_11:
	ldr	x8, [x8]
	mov	x0, x19
	ldr	w20, [x9, #340]
	mov	w1, #2
	mov	w2, #1
	mov	w3, wzr
	ldr	x8, [x8]
	ldr	x8, [x8]
	blr	x8
	mov	x0, x19
	mov	w1, w20
	bl	locate_dirty_segment
.LBB56_12:
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB56_26
// %bb.13:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB56_26
// %bb.14:
	ldr	x8, [x19, #136]
	ldr	x9, [x8, #24]
	ldrb	w10, [x9, #836]
	cbz	w10, .LBB56_17
// %bb.15:
	ldrh	w10, [x9, #824]
	cbnz	w10, .LBB56_17
// %bb.16:
	ldr	w10, [x9, #820]
	mov	w12, #48
	ldr	x11, [x8]
	mul	x10, x10, x12
	ldr	x11, [x11, #136]
	ldr	w10, [x11, x10]
	tst	w10, #0x3ffffc0
	b.eq	.LBB56_18
.LBB56_17:
	ldr	x8, [x8]
	mov	x0, x19
	ldr	w20, [x9, #820]
	mov	w1, #6
	mov	w2, #1
	mov	w3, wzr
	ldr	x8, [x8]
	ldr	x8, [x8]
	blr	x8
	mov	x0, x19
	mov	w1, w20
	bl	locate_dirty_segment
	ldr	x8, [x19, #136]
	ldr	x9, [x8, #24]
.LBB56_18:
	ldrb	w10, [x9, #956]
	cbz	w10, .LBB56_21
// %bb.19:
	ldrh	w10, [x9, #944]
	cbnz	w10, .LBB56_21
// %bb.20:
	ldr	w10, [x9, #940]
	mov	w12, #48
	ldr	x11, [x8]
	mul	x10, x10, x12
	ldr	x11, [x11, #136]
	ldr	w10, [x11, x10]
	tst	w10, #0x3ffffc0
	b.eq	.LBB56_22
.LBB56_21:
	ldr	x8, [x8]
	mov	x0, x19
	ldr	w20, [x9, #940]
	mov	w1, #7
	mov	w2, #1
	mov	w3, wzr
	ldr	x8, [x8]
	ldr	x8, [x8]
	blr	x8
	mov	x0, x19
	mov	w1, w20
	bl	locate_dirty_segment
	ldr	x8, [x19, #136]
	ldr	x9, [x8, #24]
.LBB56_22:
	ldrb	w10, [x9, #1076]
	cbz	w10, .LBB56_25
// %bb.23:
	ldrh	w10, [x9, #1064]
	cbnz	w10, .LBB56_25
// %bb.24:
	ldr	w10, [x9, #1060]
	mov	w12, #48
	ldr	x11, [x8]
	mul	x10, x10, x12
	ldr	x11, [x11, #136]
	ldr	w10, [x11, x10]
	tst	w10, #0x3ffffc0
	b.eq	.LBB56_26
.LBB56_25:
	ldr	x8, [x8]
	mov	x0, x19
	ldr	w20, [x9, #1060]
	mov	w1, #8
	mov	w2, #1
	mov	w3, wzr
	ldr	x8, [x8]
	ldr	x8, [x8]
	blr	x8
	mov	x0, x19
	mov	w1, w20
	bl	locate_dirty_segment
.LBB56_26:
	ldr	x8, [x19, #136]
	ldr	x8, [x8]
	add	x0, x8, #88             // =88
	bl	up_write
	ldr	x8, [x19, #136]
	add	x0, x8, #32             // =32
	bl	up_read
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end56:
	.size	f2fs_allocate_new_segments, .Lfunc_end56-f2fs_allocate_new_segments
                                        // -- End function
	.p2align	3               // -- Begin function __allocate_new_segment
	.type	__allocate_new_segment,@function
__allocate_new_segment:                 // @__allocate_new_segment
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	w10, #120
	ldr	x8, [x0, #136]
                                        // kill: def $w1 killed $w1 def $x1
	mov	x19, x0
	mov	x29, sp
	ldr	x9, [x8, #24]
	smaddl	x10, w1, w10, x9
	ldrb	w11, [x10, #116]
	sxtw	x10, w1
	cbz	w11, .LBB57_13
// %bb.1:
	tbnz	w3, #0, .LBB57_13
// %bb.2:
	mov	w11, #120
	madd	x11, x10, x11, x9
	ldrh	w11, [x11, #104]
	cbnz	w11, .LBB57_13
// %bb.3:
	mov	w11, #120
	madd	x11, x10, x11, x9
	ldr	w11, [x11, #100]
	tbz	w2, #0, .LBB57_6
// %bb.4:
	ldr	w13, [x19, #1192]
	cmp	w13, #2                 // =2
	b.lo	.LBB57_6
// %bb.5:
	ldr	x12, [x8]
	udiv	w13, w11, w13
	mov	w15, #-1
	cmn	w11, #1                 // =1
	csel	x13, x15, x13, eq
	ldr	x14, [x12, #144]
	ldr	w13, [x14, x13, lsl #2]
	cbnz	w13, .LBB57_13
	b	.LBB57_7
.LBB57_6:
	ldr	x12, [x8]
	mov	w13, #48
	mul	x13, x11, x13
	ldr	x14, [x12, #136]
	ldr	w13, [x14, x13]
	ubfx	w13, w13, #6, #10
	cbnz	w13, .LBB57_13
.LBB57_7:
	tbz	w2, #0, .LBB57_11
// %bb.8:
	ldr	w14, [x19, #1192]
	cmp	w14, #2                 // =2
	b.lo	.LBB57_11
// %bb.9:
	mov	w16, #4767
	ldr	x12, [x12, #136]
	movk	w16, #10724, lsl #16
	mov	w13, wzr
	mov	w15, wzr
	mul	x16, x11, x16
	lsr	x16, x16, #32
	sub	w11, w11, w16
	add	w11, w16, w11, lsr #1
	mov	w16, #55
	lsr	w11, w11, #5
	mul	w11, w11, w16
	mov	w16, #48
.LBB57_10:                              // =>This Inner Loop Header: Depth=1
	umaddl	x17, w11, w16, x12
	add	w15, w15, #1            // =1
	add	w11, w11, #1            // =1
	cmp	w15, w14
	ldrh	w17, [x17, #2]
	and	w17, w17, #0x3ff
	add	w13, w17, w13
	b.ne	.LBB57_10
	b	.LBB57_12
.LBB57_11:
	ldr	x12, [x12, #136]
	mov	w13, #48
	madd	x11, x11, x13, x12
	ldrh	w11, [x11, #2]
	and	w13, w11, #0x3ff
.LBB57_12:
	cbz	w13, .LBB57_14
.LBB57_13:
	ldr	x8, [x8]
	mov	w11, #120
	mov	x0, x19
	mov	w2, #1
	madd	x9, x10, x11, x9
	mov	w3, wzr
                                        // kill: def $w1 killed $w1 killed $x1
	ldr	x8, [x8]
	ldr	w20, [x9, #100]
	ldr	x8, [x8]
	blr	x8
	mov	x0, x19
	mov	w1, w20
	bl	locate_dirty_segment
.LBB57_14:
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end57:
	.size	__allocate_new_segment, .Lfunc_end57-__allocate_new_segment
                                        // -- End function
	.globl	f2fs_exist_trim_candidates // -- Begin function f2fs_exist_trim_candidates
	.p2align	3
	.type	f2fs_exist_trim_candidates,@function
f2fs_exist_trim_candidates:             // @f2fs_exist_trim_candidates
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x20, x0
	ldr	x8, [x0, #136]
	mov	x19, x1
	ldr	x22, [x1, #8]
	ldr	x8, [x8]
	add	x0, x8, #88             // =88
	bl	down_write
	ldp	x8, x9, [x19, #8]
	cmp	x8, x9
	b.hi	.LBB58_4
// %bb.1:
	mov	w21, #1
.LBB58_2:                               // =>This Inner Loop Header: Depth=1
	mov	x0, x20
	mov	x1, x19
	mov	w2, #1
	bl	add_discard_addrs
	tbnz	w0, #0, .LBB58_5
// %bb.3:                               //   in Loop: Header=BB58_2 Depth=1
	ldp	x8, x9, [x19, #8]
	add	x8, x8, #1              // =1
	cmp	x8, x9
	str	x8, [x19, #8]
	b.ls	.LBB58_2
.LBB58_4:
	mov	w21, wzr
.LBB58_5:
	ldr	x8, [x20, #136]
	ldr	x8, [x8]
	add	x0, x8, #88             // =88
	bl	up_write
	str	x22, [x19, #8]
	mov	w0, w21
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end58:
	.size	f2fs_exist_trim_candidates, .Lfunc_end58-f2fs_exist_trim_candidates
                                        // -- End function
	.p2align	3               // -- Begin function add_discard_addrs
	.type	add_discard_addrs,@function
add_discard_addrs:                      // @add_discard_addrs
// %bb.0:
	sub	sp, sp, #112            // =112
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	mov	w9, #48
	stp	x28, x27, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x26, x25, [sp, #48]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	ldr	x14, [x0, #136]
	ldr	w10, [x1, #8]
	ldrsw	x21, [x0, #1188]
	ldr	x8, [x14]
	ldr	x11, [x8, #136]
	madd	x12, x10, x9, x11
	ldr	w11, [x12]
	ubfx	w9, w11, #6, #10
	cmp	w9, w21
	b.ne	.LBB59_3
.LBB59_1:
	mov	w0, wzr
.LBB59_2:
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB59_3:
	ldr	x10, [x12, #8]
	mov	x19, x1
	ldp	x9, x13, [x12, #24]
	mov	x20, x0
	mov	w22, w2
	ldr	w12, [x0, #3024]
	ldr	x23, [x8, #64]
	ldr	w8, [x1]
	ldr	x18, [x14, #168]
	cmp	w12, #2                 // =2
	b.lt	.LBB59_9
// %bb.4:
	ldr	x14, [x20, #3032]
	mov	x15, xzr
	b	.LBB59_6
.LBB59_5:                               //   in Loop: Header=BB59_6 Depth=1
	add	x15, x15, #1            // =1
	add	x14, x14, #192          // =192
	cmp	x15, x12
	b.eq	.LBB59_1
.LBB59_6:                               // =>This Inner Loop Header: Depth=1
	ldr	x16, [x14]
	ldr	x16, [x16, #128]
	ldr	x16, [x16, #1280]
	ldr	x17, [x16, #504]
	tbnz	w17, #11, .LBB59_12
// %bb.7:                               //   in Loop: Header=BB59_6 Depth=1
	cbz	x16, .LBB59_5
// %bb.8:                               //   in Loop: Header=BB59_6 Depth=1
	ldr	w16, [x16, #1740]
	sub	w16, w16, #1            // =1
	cmp	w16, #2                 // =2
	b.hs	.LBB59_5
	b	.LBB59_12
.LBB59_9:
	ldr	x14, [x20]
	ldr	x14, [x14, #248]
	ldr	x14, [x14, #128]
	ldr	x14, [x14, #1280]
	ldr	x15, [x14, #504]
	tbnz	w15, #11, .LBB59_12
// %bb.10:
	cbz	x14, .LBB59_1
// %bb.11:
	ldr	w14, [x14, #1740]
	sub	w14, w14, #1            // =1
	cmp	w14, #2                 // =2
	b.hs	.LBB59_1
.LBB59_12:
	tbz	w8, #4, .LBB59_33
// %bb.13:
	ldr	x10, [x9]
	ldr	x11, [x13]
	orr	x10, x11, x10
	mvn	x10, x10
	str	x10, [x23]
	ldr	x10, [x9, #8]
	ldr	x11, [x13, #8]
	orr	x10, x11, x10
	mvn	x10, x10
	str	x10, [x23, #8]
	ldr	x10, [x9, #16]
	ldr	x11, [x13, #16]
	orr	x10, x11, x10
	mvn	x10, x10
	str	x10, [x23, #16]
	ldr	x10, [x9, #24]
	ldr	x11, [x13, #24]
	orr	x10, x11, x10
	mvn	x10, x10
	str	x10, [x23, #24]
	ldr	x10, [x9, #32]
	ldr	x11, [x13, #32]
	orr	x10, x11, x10
	mvn	x10, x10
	str	x10, [x23, #32]
	ldr	x10, [x9, #40]
	ldr	x11, [x13, #40]
	orr	x10, x11, x10
	mvn	x10, x10
	str	x10, [x23, #40]
	ldr	x10, [x9, #48]
	ldr	x11, [x13, #48]
	orr	x10, x11, x10
	mvn	x10, x10
	str	x10, [x23, #48]
	ldr	x9, [x9, #56]
	ldr	x10, [x13, #56]
	orr	x9, x10, x9
	mvn	x9, x9
.LBB59_14:
	add	x10, x18, #8            // =8
	stp	x18, x10, [sp]          // 16-byte Folded Spill
	str	x9, [x23, #56]
	tbz	w8, #4, .LBB59_35
// %bb.15:
	mov	x26, xzr
	mov	w27, #-1
	mov	w24, #1
	b	.LBB59_17
.LBB59_16:                              //   in Loop: Header=BB59_17 Depth=1
	ldr	x9, [x20, #136]
	ldr	x9, [x9, #168]
	ldr	w10, [x9, #8312]
	add	w8, w8, w10
	str	w8, [x9, #8312]
.LBB59_17:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB59_32 Depth 2
	add	w2, w27, #1             // =1
	mov	x0, x23
	mov	x1, x21
	bl	__find_rev_next_bit
	mov	x28, x0
	cmp	w21, w28
	b.ls	.LBB59_1
// %bb.18:                              //   in Loop: Header=BB59_17 Depth=1
	add	w2, w28, #1             // =1
	mov	x0, x23
	mov	x1, x21
	bl	__find_rev_next_zero_bit
	mov	x27, x0
	cbz	w28, .LBB59_21
// %bb.19:                              //   in Loop: Header=BB59_17 Depth=1
	cmp	w21, w27
	b.eq	.LBB59_21
// %bb.20:                              //   in Loop: Header=BB59_17 Depth=1
	ldr	x8, [x19, #24]
	sub	w9, w27, w28
	cmp	x9, x8
	b.lo	.LBB59_17
.LBB59_21:                              //   in Loop: Header=BB59_17 Depth=1
	tbnz	w22, #0, .LBB59_63
// %bb.22:                              //   in Loop: Header=BB59_17 Depth=1
	cbnz	x26, .LBB59_30
// %bb.23:                              //   in Loop: Header=BB59_17 Depth=1
	adrp	x8, discard_entry_slab
	mov	w1, #32832
	movk	w1, #96, lsl #16
	ldr	x25, [x8, :lo12:discard_entry_slab]
	mov	x0, x25
	bl	kmem_cache_alloc
	mov	x26, x0
	cbnz	x0, .LBB59_25
// %bb.24:                              //   in Loop: Header=BB59_17 Depth=1
	mov	w8, #32832
	mov	x0, x25
	movk	w8, #96, lsl #16
	add	w1, w8, #2048           // =2048
	bl	kmem_cache_alloc
	mov	x26, x0
.LBB59_25:                              //   in Loop: Header=BB59_17 Depth=1
	ldr	x8, [x20, #136]
	cbz	x8, .LBB59_27
// %bb.26:                              //   in Loop: Header=BB59_17 Depth=1
	add	x9, x8, #80             // =80
	b	.LBB59_28
.LBB59_27:                              //   in Loop: Header=BB59_17 Depth=1
	ldr	x9, [x20, #16]
	add	x9, x9, #72             // =72
.LBB59_28:                              //   in Loop: Header=BB59_17 Depth=1
	ldr	x8, [x8, #8]
	mov	x0, x26
	ldr	x10, [x19, #8]
	ldr	w11, [x20, #1184]
	ldr	w9, [x9]
	ldr	w8, [x8]
	ldp	x12, x2, [sp]           // 16-byte Folded Reload
	add	x8, x10, x8
	lsl	x8, x8, x11
	add	w8, w9, w8
	str	w8, [x26, #16]
	ldr	x25, [x12, #16]
	mov	x1, x25
	bl	__list_add_valid
	tbz	w0, #0, .LBB59_30
// %bb.29:                              //   in Loop: Header=BB59_17 Depth=1
	ldr	x8, [sp]                // 8-byte Folded Reload
	str	x26, [x8, #16]
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	stp	x8, x25, [x26]
	str	x26, [x25]
.LBB59_30:                              //   in Loop: Header=BB59_17 Depth=1
	subs	w8, w27, w28
	b.ls	.LBB59_16
// %bb.31:                              //   in Loop: Header=BB59_17 Depth=1
	add	x9, x26, #20            // =20
.LBB59_32:                              //   Parent Loop BB59_17 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	w10, w28, #63           // =63
	cmp	w28, #0                 // =0
	csel	w10, w10, w28, lt
	asr	w11, w10, #6
	and	w10, w10, #0xffffffc0
	sbfiz	x11, x11, #3, #32
	sub	w10, w28, w10
	add	w28, w28, #1            // =1
	ldr	x12, [x9, x11]
	cmp	w28, w27
	lsl	x10, x24, x10
	orr	x10, x10, x12
	str	x10, [x9, x11]
	b.ne	.LBB59_32
	b	.LBB59_16
.LBB59_33:
	ldrb	w13, [x20, #1424]
	tbnz	w13, #2, .LBB59_51
.LBB59_34:
	ldr	x12, [x20, #16]
	ldrb	w12, [x12, #2180]
	tbz	w12, #1, .LBB59_1
	b	.LBB59_60
.LBB59_35:
	ldr	x8, [x20, #136]
	ldr	x8, [x8, #168]
	ldr	w9, [x8, #8312]
	ldr	w8, [x8, #8316]
	cmp	w9, w8
	b.hi	.LBB59_1
// %bb.36:
	mov	x26, xzr
	mov	w27, #-1
	mov	w24, #1
	b	.LBB59_38
.LBB59_37:                              //   in Loop: Header=BB59_38 Depth=1
	ldr	x9, [x20, #136]
	mov	w0, wzr
	ldr	x9, [x9, #168]
	ldr	w10, [x9, #8312]
	add	w8, w8, w10
	str	w8, [x9, #8312]
	ldr	x8, [x20, #136]
	ldr	x8, [x8, #168]
	ldr	w9, [x8, #8312]
	ldr	w8, [x8, #8316]
	cmp	w9, w8
	b.hi	.LBB59_2
.LBB59_38:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB59_50 Depth 2
	add	w2, w27, #1             // =1
	mov	x0, x23
	mov	x1, x21
	bl	__find_rev_next_bit
	mov	x28, x0
	cmp	w21, w28
	b.ls	.LBB59_1
// %bb.39:                              //   in Loop: Header=BB59_38 Depth=1
	add	w2, w28, #1             // =1
	mov	x0, x23
	mov	x1, x21
	bl	__find_rev_next_zero_bit
	tbnz	w22, #0, .LBB59_63
// %bb.40:                              //   in Loop: Header=BB59_38 Depth=1
	mov	x27, x0
	cbnz	x26, .LBB59_48
// %bb.41:                              //   in Loop: Header=BB59_38 Depth=1
	adrp	x8, discard_entry_slab
	mov	w1, #32832
	movk	w1, #96, lsl #16
	ldr	x25, [x8, :lo12:discard_entry_slab]
	mov	x0, x25
	bl	kmem_cache_alloc
	mov	x26, x0
	cbz	x0, .LBB59_44
// %bb.42:                              //   in Loop: Header=BB59_38 Depth=1
	ldr	x8, [x20, #136]
	cbz	x8, .LBB59_45
.LBB59_43:                              //   in Loop: Header=BB59_38 Depth=1
	add	x9, x8, #80             // =80
	b	.LBB59_46
.LBB59_44:                              //   in Loop: Header=BB59_38 Depth=1
	mov	w8, #32832
	mov	x0, x25
	movk	w8, #96, lsl #16
	add	w1, w8, #2048           // =2048
	bl	kmem_cache_alloc
	mov	x26, x0
	ldr	x8, [x20, #136]
	cbnz	x8, .LBB59_43
.LBB59_45:                              //   in Loop: Header=BB59_38 Depth=1
	ldr	x9, [x20, #16]
	add	x9, x9, #72             // =72
.LBB59_46:                              //   in Loop: Header=BB59_38 Depth=1
	ldr	x8, [x8, #8]
	mov	x0, x26
	ldr	x10, [x19, #8]
	ldr	w11, [x20, #1184]
	ldr	w9, [x9]
	ldr	w8, [x8]
	ldp	x12, x2, [sp]           // 16-byte Folded Reload
	add	x8, x10, x8
	lsl	x8, x8, x11
	add	w8, w9, w8
	str	w8, [x26, #16]
	ldr	x25, [x12, #16]
	mov	x1, x25
	bl	__list_add_valid
	tbz	w0, #0, .LBB59_48
// %bb.47:                              //   in Loop: Header=BB59_38 Depth=1
	ldr	x8, [sp]                // 8-byte Folded Reload
	str	x26, [x8, #16]
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	stp	x8, x25, [x26]
	str	x26, [x25]
.LBB59_48:                              //   in Loop: Header=BB59_38 Depth=1
	subs	w8, w27, w28
	b.ls	.LBB59_37
// %bb.49:                              //   in Loop: Header=BB59_38 Depth=1
	add	x9, x26, #20            // =20
.LBB59_50:                              //   Parent Loop BB59_38 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	w10, w28, #63           // =63
	cmp	w28, #0                 // =0
	csel	w10, w10, w28, lt
	asr	w11, w10, #6
	and	w10, w10, #0xffffffc0
	sbfiz	x11, x11, #3, #32
	sub	w10, w28, w10
	add	w28, w28, #1            // =1
	ldr	x12, [x9, x11]
	cmp	w28, w27
	lsl	x10, x24, x10
	orr	x10, x10, x12
	str	x10, [x9, x11]
	b.ne	.LBB59_50
	b	.LBB59_37
.LBB59_51:
	cmp	w12, #2                 // =2
	b.lt	.LBB59_57
// %bb.52:
	ldr	x13, [x20, #3032]
	mov	x14, xzr
	b	.LBB59_54
.LBB59_53:                              //   in Loop: Header=BB59_54 Depth=1
	add	x14, x14, #1            // =1
	add	x13, x13, #192          // =192
	cmp	x14, x12
	b.eq	.LBB59_34
.LBB59_54:                              // =>This Inner Loop Header: Depth=1
	ldr	x15, [x13]
	ldr	x15, [x15, #128]
	ldr	x15, [x15, #1280]
	ldr	x16, [x15, #504]
	tbnz	w16, #11, .LBB59_60
// %bb.55:                              //   in Loop: Header=BB59_54 Depth=1
	cbz	x15, .LBB59_53
// %bb.56:                              //   in Loop: Header=BB59_54 Depth=1
	ldr	w15, [x15, #1740]
	sub	w15, w15, #1            // =1
	cmp	w15, #2                 // =2
	b.hs	.LBB59_53
	b	.LBB59_60
.LBB59_57:
	ldr	x12, [x20]
	ldr	x12, [x12, #248]
	ldr	x12, [x12, #128]
	ldr	x12, [x12, #1280]
	ldr	x13, [x12, #504]
	tbnz	w13, #11, .LBB59_60
// %bb.58:
	cbz	x12, .LBB59_34
// %bb.59:
	ldr	w12, [x12, #1740]
	sub	w12, w12, #1            // =1
	cmp	w12, #2                 // =2
	b.hs	.LBB59_34
.LBB59_60:
	tst	w11, #0xffc0
	b.eq	.LBB59_1
// %bb.61:
	ldr	w11, [x18, #8312]
	ldr	w12, [x18, #8316]
	cmp	w11, w12
	b.hs	.LBB59_1
// %bb.62:
	ldr	x11, [x10]
	ldr	x12, [x9]
	bic	x11, x12, x11
	str	x11, [x23]
	ldr	x11, [x10, #8]
	ldr	x12, [x9, #8]
	bic	x11, x12, x11
	str	x11, [x23, #8]
	ldr	x11, [x10, #16]
	ldr	x12, [x9, #16]
	bic	x11, x12, x11
	str	x11, [x23, #16]
	ldr	x11, [x10, #24]
	ldr	x12, [x9, #24]
	bic	x11, x12, x11
	str	x11, [x23, #24]
	ldr	x11, [x10, #32]
	ldr	x12, [x9, #32]
	bic	x11, x12, x11
	str	x11, [x23, #32]
	ldr	x11, [x10, #40]
	ldr	x12, [x9, #40]
	bic	x11, x12, x11
	str	x11, [x23, #40]
	ldr	x11, [x10, #48]
	ldr	x12, [x9, #48]
	bic	x11, x12, x11
	str	x11, [x23, #48]
	ldr	x10, [x10, #56]
	ldr	x9, [x9, #56]
	bic	x9, x9, x10
	b	.LBB59_14
.LBB59_63:
	mov	w0, #1
	b	.LBB59_2
.Lfunc_end59:
	.size	add_discard_addrs, .Lfunc_end59-add_discard_addrs
                                        // -- End function
	.globl	f2fs_trim_fs            // -- Begin function f2fs_trim_fs
	.p2align	3
	.type	f2fs_trim_fs,@function
f2fs_trim_fs:                           // @f2fs_trim_fs
// %bb.0:
	sub	sp, sp, #480            // =480
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #384]    // 16-byte Folded Spill
	add	x29, sp, #384           // =384
	stp	x28, x27, [sp, #400]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #416]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #432]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #448]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #464]    // 16-byte Folded Spill
	mov	x19, x1
	stur	x8, [x29, #-16]
	mov	x20, x0
	ldr	w8, [x0, #1504]
	ldp	x10, x11, [x1]
	cmp	w8, #1                  // =1
	b.ne	.LBB60_2
// %bb.1:
	ldr	w8, [x20, #1192]
	cmp	w8, #1                  // =1
	cset	w8, hi
	b	.LBB60_3
.LBB60_2:
	mov	w8, wzr
.LBB60_3:
	ldr	x9, [x20, #136]
	lsr	x13, x10, #12
	cbz	x9, .LBB60_5
// %bb.4:
	add	x10, x9, #80            // =80
	add	x12, x9, #92            // =92
	b	.LBB60_6
.LBB60_5:
	ldr	x12, [x20, #16]
	add	x10, x12, #72           // =72
	add	x12, x12, #48           // =48
.LBB60_6:
	ldr	w14, [x10]
	ldr	w12, [x12]
	ldr	w10, [x20, #1184]
	lsl	w12, w12, w10
	add	w12, w12, w14
	cmp	x13, x12
	b.hs	.LBB60_8
// %bb.7:
	ldr	w12, [x20, #1168]
	cmp	x11, x12
	b.hs	.LBB60_11
.LBB60_8:
	mov	w21, #-22
.LBB60_9:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB60_129
// %bb.10:
	mov	w0, w21
	ldp	x20, x19, [sp, #464]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #448]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #432]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #416]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #400]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #384]    // 16-byte Folded Reload
	add	sp, sp, #480            // =480
	ret
.LBB60_11:
	add	x11, x13, x11, lsr #12
	sub	x11, x11, #1            // =1
	cbz	x9, .LBB60_13
// %bb.12:
	add	x12, x9, #84            // =84
	b	.LBB60_14
.LBB60_13:
	ldr	x12, [x20, #16]
	add	x12, x12, #92           // =92
.LBB60_14:
	ldr	w12, [x12]
	cmp	x11, x12
	b.hs	.LBB60_17
.LBB60_15:
	mov	x8, xzr
.LBB60_16:
	mov	w21, wzr
	str	x8, [x19, #8]
	b	.LBB60_9
.LBB60_17:
	ldr	x12, [x20, #80]
	tbnz	w12, #2, .LBB60_25
// %bb.18:
	ldr	w12, [x20, #3024]
	cbz	w12, .LBB60_35
// %bb.19:
	ldr	x14, [x20]
	cmp	w12, #1                 // =1
	ldr	x14, [x14, #248]
	mov	x15, x14
	b.lt	.LBB60_27
// %bb.20:
	ldr	x16, [x20, #3032]
	mov	x15, xzr
	add	x16, x16, #80           // =80
	b	.LBB60_22
.LBB60_21:                              //   in Loop: Header=BB60_22 Depth=1
	add	x15, x15, #1            // =1
	add	x16, x16, #192          // =192
	cmp	x15, x12
	b.eq	.LBB60_26
.LBB60_22:                              // =>This Inner Loop Header: Depth=1
	ldur	w17, [x16, #-4]
	cmp	w17, w13
	b.hi	.LBB60_21
// %bb.23:                              //   in Loop: Header=BB60_22 Depth=1
	ldr	w17, [x16]
	cmp	w17, w13
	b.lo	.LBB60_21
// %bb.24:
	ldur	x15, [x16, #-80]
	b	.LBB60_27
.LBB60_25:
	adrp	x1, .L.str.14
	mov	x0, x20
	add	x1, x1, :lo12:.L.str.14
	bl	f2fs_printk
	mov	w21, #-117
	b	.LBB60_9
.LBB60_26:
	mov	x15, x14
.LBB60_27:
	cbz	x15, .LBB60_15
// %bb.28:
	cmp	w12, #1                 // =1
	b.lt	.LBB60_34
// %bb.29:
	ldr	x16, [x20, #3032]
	mov	x15, xzr
	add	x16, x16, #80           // =80
	b	.LBB60_31
.LBB60_30:                              //   in Loop: Header=BB60_31 Depth=1
	add	x15, x15, #1            // =1
	add	x16, x16, #192          // =192
	cmp	x15, x12
	b.eq	.LBB60_34
.LBB60_31:                              // =>This Inner Loop Header: Depth=1
	ldur	w17, [x16, #-4]
	cmp	w17, w11
	b.hi	.LBB60_30
// %bb.32:                              //   in Loop: Header=BB60_31 Depth=1
	ldr	w17, [x16]
	cmp	w17, w11
	b.lo	.LBB60_30
// %bb.33:
	ldur	x14, [x16, #-80]
.LBB60_34:
	cbz	x14, .LBB60_15
.LBB60_35:
	cbz	x9, .LBB60_37
// %bb.36:
	add	x14, x9, #84            // =84
	b	.LBB60_38
.LBB60_37:
	ldr	x14, [x20, #16]
	add	x14, x14, #92           // =92
.LBB60_38:
	ldr	w14, [x14]
	cmp	x13, x14
	b.ls	.LBB60_41
// %bb.39:
	add	w14, w13, #3            // =3
	cmp	w14, #4                 // =4
	b.hs	.LBB60_42
.LBB60_40:
	mov	w25, #-1
	b	.LBB60_54
.LBB60_41:
	mov	w25, wzr
	b	.LBB60_54
.LBB60_42:
	cbz	w12, .LBB60_50
// %bb.43:
	ldr	x14, [x20]
	cmp	w12, #1                 // =1
	ldr	x14, [x14, #248]
	b.lt	.LBB60_49
// %bb.44:
	ldr	x16, [x20, #3032]
	mov	x15, xzr
	add	x16, x16, #80           // =80
	b	.LBB60_46
.LBB60_45:                              //   in Loop: Header=BB60_46 Depth=1
	add	x15, x15, #1            // =1
	add	x16, x16, #192          // =192
	cmp	x15, x12
	b.eq	.LBB60_49
.LBB60_46:                              // =>This Inner Loop Header: Depth=1
	ldur	w17, [x16, #-4]
	cmp	w17, w13
	b.hi	.LBB60_45
// %bb.47:                              //   in Loop: Header=BB60_46 Depth=1
	ldr	w17, [x16]
	cmp	w17, w13
	b.lo	.LBB60_45
// %bb.48:
	ldur	x14, [x16, #-80]
.LBB60_49:
	cbz	x14, .LBB60_40
.LBB60_50:
	cbz	x9, .LBB60_52
// %bb.51:
	add	x14, x9, #80            // =80
	b	.LBB60_53
.LBB60_52:
	ldr	x14, [x20, #16]
	add	x14, x14, #72           // =72
.LBB60_53:
	ldr	x15, [x9, #8]
	ldr	w14, [x14]
	ldr	w15, [x15]
	sub	x13, x13, x14
	lsr	x13, x13, x10
	sub	w25, w13, w15
.LBB60_54:
	cbz	x9, .LBB60_56
// %bb.55:
	add	x13, x9, #80            // =80
	add	x14, x9, #92            // =92
	b	.LBB60_57
.LBB60_56:
	ldr	x14, [x20, #16]
	add	x13, x14, #72           // =72
	add	x14, x14, #48           // =48
.LBB60_57:
	ldr	w13, [x13]
	ldr	w14, [x14]
	lsl	w14, w14, w10
	add	w13, w14, w13
	cmp	x11, x13
	b.hs	.LBB60_60
// %bb.58:
	add	w13, w11, #3            // =3
	cmp	w13, #4                 // =4
	b.hs	.LBB60_61
.LBB60_59:
	mov	w26, #-1
	b	.LBB60_73
.LBB60_60:
	ldr	w9, [x9, #96]
	sub	w26, w9, #1             // =1
	b	.LBB60_73
.LBB60_61:
	cbz	w12, .LBB60_69
// %bb.62:
	ldr	x13, [x20]
	cmp	w12, #1                 // =1
	ldr	x13, [x13, #248]
	b.lt	.LBB60_68
// %bb.63:
	ldr	x15, [x20, #3032]
	mov	x14, xzr
	add	x15, x15, #80           // =80
	b	.LBB60_65
.LBB60_64:                              //   in Loop: Header=BB60_65 Depth=1
	add	x14, x14, #1            // =1
	add	x15, x15, #192          // =192
	cmp	x14, x12
	b.eq	.LBB60_68
.LBB60_65:                              // =>This Inner Loop Header: Depth=1
	ldur	w16, [x15, #-4]
	cmp	w16, w11
	b.hi	.LBB60_64
// %bb.66:                              //   in Loop: Header=BB60_65 Depth=1
	ldr	w16, [x15]
	cmp	w16, w11
	b.lo	.LBB60_64
// %bb.67:
	ldur	x13, [x15, #-80]
.LBB60_68:
	cbz	x13, .LBB60_59
.LBB60_69:
	cbz	x9, .LBB60_71
// %bb.70:
	add	x12, x9, #80            // =80
	b	.LBB60_72
.LBB60_71:
	ldr	x12, [x20, #16]
	add	x12, x12, #72           // =72
.LBB60_72:
	ldr	x9, [x9, #8]
	ldr	w12, [x12]
	ldr	w9, [x9]
	sub	x11, x11, x12
	lsr	x10, x11, x10
	sub	x26, x10, x9
.LBB60_73:
	cbz	w8, .LBB60_75
// %bb.74:
	ldr	w8, [x20, #1192]
	add	w9, w8, w26
	udiv	w11, w25, w8
	udiv	w10, w9, w8
	mul	w25, w11, w8
	msub	w10, w10, w8, w9
	mvn	w8, w10
	add	w26, w9, w8
.LBB60_75:
	ldr	x8, [x19, #16]
	mov	w9, #16
	ldr	w11, [x20, #1244]
	mov	w10, w25
	mov	w12, w26
	str	w9, [sp, #120]
	lsr	x8, x8, #12
	cmp	x8, #0                  // =0
	csinc	x8, x8, xzr, ne
	str	x10, [sp, #128]
	stp	x12, x8, [sp, #136]
	cbz	w11, .LBB60_15
// %bb.76:
	add	x22, x20, #1664         // =1664
	mov	x0, x22
	bl	down_write
	//APP
	mrs x24, sp_el0
	//NO_APP
	ldr	w8, [x24, #108]
	add	x1, sp, #120            // =120
	mov	x0, x20
	orr	w8, w8, #0x2000000
	str	w8, [x24, #108]
	bl	f2fs_write_checkpoint
	ldr	w8, [x24, #108]
	mov	w21, w0
	mov	x0, x22
	and	w8, w8, #0xfdffffff
	str	w8, [x24, #108]
	bl	up_write
	ldr	x8, [x24]
	tbz	w8, #0, .LBB60_78
// %bb.77:
	ldrb	w8, [x24, #2360]
	tbnz	w8, #1, .LBB60_118
.LBB60_78:
	cbnz	w21, .LBB60_9
// %bb.79:
	ldrb	w8, [x20, #1424]
	tbnz	w8, #2, .LBB60_119
.LBB60_80:
	ldr	x10, [x20, #16]
	ldrb	w8, [x10, #2180]
	tbnz	w8, #1, .LBB60_15
// %bb.81:
	ldr	x8, [x20, #136]
	adrp	x13, dpolicys
	add	x10, x10, #72           // =72
	add	x13, x13, :lo12:dpolicys
	ldr	w9, [sp, #144]
	ldr	w27, [x20, #1184]
	add	x11, x8, #80            // =80
	cmp	x8, #0                  // =0
	csel	x10, x10, x11, eq
	ldur	x14, [x13, #212]
	ldr	x12, [x8, #8]
	cmp	w9, #1                  // =1
	ldur	x11, [x13, #220]
	ldr	w28, [x10]
	ldr	w10, [x13, #236]
	ldur	x15, [x13, #228]
	ldr	w21, [x12]
	stp	x11, x14, [sp, #64]     // 16-byte Folded Spill
	stp	x14, x11, [x29, #-112]
	str	w10, [sp, #52]          // 4-byte Folded Spill
	stur	w10, [x29, #-88]
	ldur	x10, [x13, #180]
	ldur	x11, [x13, #188]
	ldur	x12, [x13, #196]
	ldur	x13, [x13, #204]
	str	x15, [sp, #56]          // 8-byte Folded Spill
	stur	x15, [x29, #-96]
	stp	x11, x10, [sp, #32]     // 16-byte Folded Spill
	stp	x10, x11, [x29, #-144]
	stp	x13, x12, [sp, #16]     // 16-byte Folded Spill
	stp	x12, x13, [x29, #-128]
	b.eq	.LBB60_83
// %bb.82:
	stur	w9, [x29, #-140]
.LBB60_83:
	ldr	x23, [x8, #168]
	mov	w8, #8360
	sturb	wzr, [x29, #-88]
	add	x8, x23, x8
	str	x8, [sp, #104]          // 8-byte Folded Spill
	ldrb	w8, [x8]
	stp	xzr, xzr, [x29, #-160]
	stp	xzr, xzr, [x29, #-176]
	cbz	w8, .LBB60_87
// %bb.84:
	mov	w8, #8280
	add	x0, x23, x8
	str	x0, [sp, #112]          // 8-byte Folded Spill
	bl	mutex_lock
	mov	w8, #8344
	mov	x0, x20
	add	x22, x23, x8
	mov	w2, wzr
	mov	x1, x22
	bl	f2fs_check_rb_tree_consistence
	tbz	w0, #0, .LBB60_130
.LBB60_85:
	mov	x0, x20
	mov	x1, x22
	mov	w2, wzr
	bl	f2fs_check_rb_tree_consistence
	tbz	w0, #0, .LBB60_135
// %bb.86:
	ldr	x0, [sp, #112]          // 8-byte Folded Reload
	bl	mutex_unlock
.LBB60_87:
	add	w8, w26, w21
	add	w9, w21, w25
	add	w8, w8, #1              // =1
	lsl	w9, w9, w27
	lsl	w8, w8, w27
	add	w22, w8, w28
	mov	w8, #8280
	add	w21, w9, w28
	add	x27, x23, x8
	mov	w8, #8344
	add	x26, x23, x8
	mov	w8, #8232
	add	x25, x23, x8
	str	wzr, [sp, #112]         // 4-byte Folded Spill
	str	w21, [sp, #92]          // 4-byte Folded Spill
	str	x26, [sp, #80]          // 8-byte Folded Spill
	str	x27, [sp, #96]          // 8-byte Folded Spill
.LBB60_88:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB60_93 Depth 2
	mov	x0, x27
	str	wzr, [sp, #156]
	bl	mutex_lock
	ldr	x8, [sp, #104]          // 8-byte Folded Reload
	ldrb	w8, [x8]
	cbnz	w8, .LBB60_112
.LBB60_89:                              //   in Loop: Header=BB60_88 Depth=1
	sub	x3, x29, #152           // =152
	sub	x4, x29, #160           // =160
	sub	x5, x29, #168           // =168
	sub	x6, x29, #176           // =176
	mov	x0, x26
	mov	x1, xzr
	mov	w2, w21
	mov	w7, #1
	str	xzr, [sp]
	bl	f2fs_lookup_rb_tree_ret
	ldur	x8, [x29, #-160]
	cmp	x0, #0                  // =0
	csel	x27, x8, x0, eq
	add	x0, sp, #160            // =160
	bl	blk_start_plug
	cbz	x27, .LBB60_125
// %bb.90:                              //   in Loop: Header=BB60_88 Depth=1
	mov	x28, x27
	b	.LBB60_93
.LBB60_91:                              //   in Loop: Header=BB60_93 Depth=2
	cbz	x21, .LBB60_125
.LBB60_92:                              //   in Loop: Header=BB60_93 Depth=2
	mov	x28, x21
	mov	x27, x21
.LBB60_93:                              //   Parent Loop BB60_88 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w8, [x28, #24]!
	cmp	w8, w22
	b.hi	.LBB60_125
// %bb.94:                              //   in Loop: Header=BB60_93 Depth=2
	ldr	w8, [x27, #28]
	ldur	w9, [x29, #-140]
	cmp	w8, w9
	b.lo	.LBB60_100
// %bb.95:                              //   in Loop: Header=BB60_93 Depth=2
	ldrb	w8, [x27, #98]
	cbz	w8, .LBB60_106
// %bb.96:                              //   in Loop: Header=BB60_93 Depth=2
	add	x21, x27, #40           // =40
	mov	x0, x21
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB60_98
// %bb.97:                              //   in Loop: Header=BB60_93 Depth=2
	ldp	x9, x8, [x27, #40]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB60_98:                              //   in Loop: Header=BB60_93 Depth=2
	ldr	x26, [x23, #8240]
	mov	x0, x21
	mov	x2, x25
	mov	x1, x26
	bl	__list_add_valid
	tbz	w0, #0, .LBB60_100
// %bb.99:                              //   in Loop: Header=BB60_93 Depth=2
	str	x21, [x23, #8240]
	stp	x25, x26, [x27, #40]
	str	x21, [x26]
.LBB60_100:                             //   in Loop: Header=BB60_93 Depth=2
	mov	x0, x27
	bl	rb_next
	mov	x21, x0
.LBB60_101:                             //   in Loop: Header=BB60_93 Depth=2
	ldr	x8, [x24]
	tbz	w8, #0, .LBB60_103
// %bb.102:                             //   in Loop: Header=BB60_93 Depth=2
	ldrb	w8, [x24, #2361]
	tbnz	w8, #0, .LBB60_125
.LBB60_103:                             //   in Loop: Header=BB60_93 Depth=2
	ldr	x8, [x24]
	tbz	w8, #0, .LBB60_91
// %bb.104:                             //   in Loop: Header=BB60_93 Depth=2
	cbz	x21, .LBB60_125
// %bb.105:                             //   in Loop: Header=BB60_93 Depth=2
	ldr	x8, [x24, #2360]
	tbz	w8, #1, .LBB60_92
	b	.LBB60_125
.LBB60_106:                             //   in Loop: Header=BB60_93 Depth=2
	sub	x1, x29, #144           // =144
	add	x4, sp, #156            // =156
	mov	x0, x20
	mov	w2, wzr
	mov	x3, x27
	bl	__submit_discard_cmd
	ldr	w8, [sp, #156]
	mov	w26, w0
	ldur	w9, [x29, #-124]
	cmp	w8, w9
	b.hs	.LBB60_109
// %bb.107:                             //   in Loop: Header=BB60_93 Depth=2
	mov	x0, x27
	bl	rb_next
	mov	x21, x0
	cbz	w26, .LBB60_101
// %bb.108:                             //   in Loop: Header=BB60_93 Depth=2
	mov	x0, x20
	mov	x1, x27
	bl	__remove_discard_cmd
	b	.LBB60_101
.LBB60_109:                             //   in Loop: Header=BB60_88 Depth=1
	ldr	w8, [x28]
	ldr	w9, [x27, #28]
	add	w21, w9, w8
	cbz	w26, .LBB60_111
// %bb.110:                             //   in Loop: Header=BB60_88 Depth=1
	mov	x0, x20
	mov	x1, x27
	bl	__remove_discard_cmd
.LBB60_111:                             //   in Loop: Header=BB60_88 Depth=1
	add	x0, sp, #160            // =160
	bl	blk_finish_plug
	ldr	x27, [sp, #96]          // 8-byte Folded Reload
	mov	x0, x27
	bl	mutex_unlock
	ldr	w8, [sp, #52]           // 4-byte Folded Reload
	mov	w28, #-1
	sub	x1, x29, #80            // =80
	mov	x0, x20
	mov	w2, wzr
	mov	w3, w28
	stur	w8, [x29, #-24]
	ldr	x8, [sp, #72]           // 8-byte Folded Reload
	sturb	wzr, [x29, #-24]
	stur	x8, [x29, #-48]
	ldr	x8, [sp, #64]           // 8-byte Folded Reload
	stur	x8, [x29, #-40]
	ldr	x8, [sp, #56]           // 8-byte Folded Reload
	stur	x8, [x29, #-32]
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	stur	x8, [x29, #-80]
	ldr	x8, [sp, #32]           // 8-byte Folded Reload
	stur	x8, [x29, #-72]
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	stur	x8, [x29, #-64]
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	stur	x8, [x29, #-56]
	bl	__wait_discard_cmd_range
	adrp	x12, dpolicys
	mov	w26, w0
	add	x12, x12, :lo12:dpolicys
	sub	x1, x29, #80            // =80
	mov	x0, x20
	mov	w2, wzr
	mov	w3, w28
	ldr	w8, [x12, #296]
	ldp	x9, x10, [x12, #272]
	ldr	x11, [x12, #288]
	stur	w8, [x29, #-24]
	stp	x9, x10, [x29, #-48]
	stur	x11, [x29, #-32]
	ldp	x8, x10, [x12, #240]
	ldp	x9, x11, [x12, #256]
	sturb	wzr, [x29, #-24]
	stp	x8, x10, [x29, #-80]
	stp	x9, x11, [x29, #-64]
	bl	__wait_discard_cmd_range
	ldr	w8, [sp, #112]          // 4-byte Folded Reload
	mov	w1, #5
	add	w8, w26, w8
	add	w8, w8, w0
	mov	w0, wzr
	str	w8, [sp, #112]          // 4-byte Folded Spill
	bl	congestion_wait
	ldr	x26, [sp, #80]          // 8-byte Folded Reload
	b	.LBB60_88
.LBB60_112:                             //   in Loop: Header=BB60_88 Depth=1
	mov	x0, x20
	mov	x1, x26
	mov	w2, wzr
	bl	f2fs_check_rb_tree_consistence
	tbz	w0, #0, .LBB60_114
.LBB60_113:                             //   in Loop: Header=BB60_88 Depth=1
	ldr	x26, [sp, #80]          // 8-byte Folded Reload
	mov	x0, x20
	mov	w2, wzr
	mov	x1, x26
	bl	f2fs_check_rb_tree_consistence
	tbnz	w0, #0, .LBB60_89
	b	.LBB60_134
.LBB60_114:                             //   in Loop: Header=BB60_88 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB60_117
// %bb.115:                             //   in Loop: Header=BB60_88 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB60_117
// %bb.116:                             //   in Loop: Header=BB60_88 Depth=1
	adrp	x26, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__issue_discard_cmd_range
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.__issue_discard_cmd_range
	mov	w3, #4652
	ldr	x0, [x26, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB60_117:                             //   in Loop: Header=BB60_88 Depth=1
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	b	.LBB60_113
.LBB60_118:
	mov	w21, #-4
	b	.LBB60_9
.LBB60_119:
	ldr	w8, [x20, #3024]
	cmp	w8, #2                  // =2
	b.lt	.LBB60_126
// %bb.120:
	ldr	x9, [x20, #3032]
	mov	x10, xzr
	b	.LBB60_122
.LBB60_121:                             //   in Loop: Header=BB60_122 Depth=1
	add	x10, x10, #1            // =1
	add	x9, x9, #192            // =192
	cmp	x10, x8
	b.eq	.LBB60_80
.LBB60_122:                             // =>This Inner Loop Header: Depth=1
	ldr	x11, [x9]
	ldr	x11, [x11, #128]
	ldr	x11, [x11, #1280]
	ldr	x12, [x11, #504]
	tbnz	w12, #11, .LBB60_15
// %bb.123:                             //   in Loop: Header=BB60_122 Depth=1
	cbz	x11, .LBB60_121
// %bb.124:                             //   in Loop: Header=BB60_122 Depth=1
	ldr	w11, [x11, #1740]
	sub	w11, w11, #1            // =1
	cmp	w11, #2                 // =2
	b.hs	.LBB60_121
	b	.LBB60_15
.LBB60_125:
	add	x0, sp, #160            // =160
	bl	blk_finish_plug
	ldr	x0, [sp, #96]           // 8-byte Folded Reload
	bl	mutex_unlock
	ldr	w2, [sp, #92]           // 4-byte Folded Reload
	sub	x1, x29, #144           // =144
	mov	x0, x20
	mov	w3, w22
	bl	__wait_discard_cmd_range
	ldr	w9, [sp, #112]          // 4-byte Folded Reload
	mov	w8, w0
	add	x8, x8, w9, uxtw
	lsl	x8, x8, #12
	b	.LBB60_16
.LBB60_126:
	ldr	x8, [x20]
	ldr	x8, [x8, #248]
	ldr	x8, [x8, #128]
	ldr	x8, [x8, #1280]
	ldr	x9, [x8, #504]
	tbnz	w9, #11, .LBB60_15
// %bb.127:
	cbz	x8, .LBB60_80
// %bb.128:
	ldr	w8, [x8, #1740]
	sub	w8, w8, #1              // =1
	cmp	w8, #2                  // =2
	b.lo	.LBB60_15
	b	.LBB60_80
.LBB60_129:
	bl	__stack_chk_fail
.LBB60_130:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB60_133
// %bb.131:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB60_133
// %bb.132:
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__issue_discard_cmd_range
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #4638
	add	x2, x2, :lo12:.L__func__.__issue_discard_cmd_range
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB60_133:
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	b	.LBB60_85
.LBB60_134:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 4652; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB60_135:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 4638; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end60:
	.size	f2fs_trim_fs, .Lfunc_end60-f2fs_trim_fs
                                        // -- End function
	.p2align	3               // -- Begin function __wait_discard_cmd_range
	.type	__wait_discard_cmd_range,@function
__wait_discard_cmd_range:               // @__wait_discard_cmd_range
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	mov	w10, #8232
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	mov	w11, #8216
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	w19, w3
	ldr	x8, [x0, #136]
	mov	w20, w2
	ldr	w9, [x1]
	mov	x22, x1
	ldr	x8, [x8, #168]
	cmp	w9, #3                  // =3
	mov	w9, #8280
	add	x23, x8, x9
	add	x10, x8, x10
	mov	x0, x23
	add	x11, x8, x11
	csel	x26, x10, x11, eq
	bl	mutex_lock
	ldr	x28, [x26]
	cmp	x26, x28
	b.eq	.LBB61_16
// %bb.1:
	mov	w24, wzr
.LBB61_2:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB61_5 Depth 2
	ldr	x27, [x28]
	b	.LBB61_5
.LBB61_3:                               //   in Loop: Header=BB61_5 Depth=2
	mov	x0, x21
	mov	x1, x25
	bl	__remove_discard_cmd
.LBB61_4:                               //   in Loop: Header=BB61_5 Depth=2
	ldr	x8, [x27]
	cmp	x26, x27
	mov	x28, x27
	mov	x27, x8
	b.eq	.LBB61_17
.LBB61_5:                               //   Parent Loop BB61_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	w9, w8, [x28, #-16]
	add	w10, w8, w9
	cmp	w9, w19
	ccmp	w10, w20, #0, lo
	b.ls	.LBB61_4
// %bb.6:                               //   in Loop: Header=BB61_5 Depth=2
	ldr	w9, [x22, #4]
	cmp	w8, w9
	b.lo	.LBB61_4
// %bb.7:                               //   in Loop: Header=BB61_5 Depth=2
	ldrb	w9, [x28, #58]
	sub	x25, x28, #40           // =40
	ldrh	w8, [x28, #56]
	cmp	w9, #3                  // =3
	b.ne	.LBB61_15
// %bb.8:                               //   in Loop: Header=BB61_5 Depth=2
	cbnz	w8, .LBB61_15
// %bb.9:                               //   in Loop: Header=BB61_5 Depth=2
	add	x0, x28, #16            // =16
	bl	wait_for_completion_io
	ldr	w8, [x28, #60]
	cbnz	w8, .LBB61_11
// %bb.10:                              //   in Loop: Header=BB61_5 Depth=2
	ldur	w8, [x28, #-12]
	add	w24, w8, w24
.LBB61_11:                              //   in Loop: Header=BB61_5 Depth=2
	ldr	w8, [x22]
	cmp	w8, #3                  // =3
	b.eq	.LBB61_3
// %bb.12:                              //   in Loop: Header=BB61_5 Depth=2
	ldur	w8, [x28, #-12]
	cmp	w8, #512                // =512
	b.lo	.LBB61_3
// %bb.13:                              //   in Loop: Header=BB61_5 Depth=2
	ldr	x8, [x28, #64]
	mov	w9, #61568
	movk	w9, #762, lsl #16
	cmp	x8, x9
	b.lo	.LBB61_3
// %bb.14:                              //   in Loop: Header=BB61_5 Depth=2
	mov	w8, #10
	str	w8, [x22, #44]
	b	.LBB61_3
.LBB61_15:                              //   in Loop: Header=BB61_2 Depth=1
	add	w8, w8, #1              // =1
	mov	x0, x23
	strh	w8, [x28, #56]
	bl	mutex_unlock
	mov	x0, x21
	mov	x1, x25
	bl	__wait_one_discard_bio
	add	w24, w0, w24
	mov	x0, x23
	bl	mutex_lock
	ldr	x28, [x26]
	cmp	x26, x28
	b.ne	.LBB61_2
	b	.LBB61_17
.LBB61_16:
	mov	w24, wzr
.LBB61_17:
	mov	x0, x23
	bl	mutex_unlock
	mov	w0, w24
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end61:
	.size	__wait_discard_cmd_range, .Lfunc_end61-__wait_discard_cmd_range
                                        // -- End function
	.globl	f2fs_rw_hint_to_seg_type // -- Begin function f2fs_rw_hint_to_seg_type
	.p2align	3
	.type	f2fs_rw_hint_to_seg_type,@function
f2fs_rw_hint_to_seg_type:               // @f2fs_rw_hint_to_seg_type
// %bb.0:
	mov	w8, #1
	cmp	w0, #5                  // =5
	cinc	w8, w8, eq
	cmp	w0, #2                  // =2
	csel	w0, wzr, w8, eq
	ret
.Lfunc_end62:
	.size	f2fs_rw_hint_to_seg_type, .Lfunc_end62-f2fs_rw_hint_to_seg_type
                                        // -- End function
	.globl	f2fs_io_type_to_rw_hint // -- Begin function f2fs_io_type_to_rw_hint
	.p2align	3
	.type	f2fs_io_type_to_rw_hint,@function
f2fs_io_type_to_rw_hint:                // @f2fs_io_type_to_rw_hint
// %bb.0:
	ldr	w8, [x0, #1484]
	cmp	w8, #2                  // =2
	b.eq	.LBB63_5
// %bb.1:
	cmp	w8, #1                  // =1
	b.ne	.LBB63_14
// %bb.2:
	mov	w0, wzr
	cbnz	w1, .LBB63_13
// %bb.3:
	cmp	w2, #1                  // =1
	b.eq	.LBB63_13
// %bb.4:
	cmp	w2, #2                  // =2
	mov	w8, #5
	csel	w8, w8, wzr, eq
	cmp	w2, #0                  // =0
	mov	w9, #2
	csel	w0, w9, w8, eq
	ret
.LBB63_5:
	cmp	w1, #2                  // =2
	b.eq	.LBB63_10
// %bb.6:
	cmp	w1, #1                  // =1
	b.eq	.LBB63_11
// %bb.7:
	cbnz	w1, .LBB63_14
// %bb.8:
	cmp	w2, #3                  // =3
	b.hs	.LBB63_14
// %bb.9:
	adrp	x8, .Lswitch.table.f2fs_io_type_to_rw_hint
	add	x8, x8, :lo12:.Lswitch.table.f2fs_io_type_to_rw_hint
	ldr	w0, [x8, w2, sxtw #2]
	ret
.LBB63_10:
	mov	w0, #3
	ret
.LBB63_11:
	cmp	w2, #3                  // =3
	b.hs	.LBB63_14
// %bb.12:
	adrp	x8, .Lswitch.table.f2fs_io_type_to_rw_hint.60
	add	x8, x8, :lo12:.Lswitch.table.f2fs_io_type_to_rw_hint.60
	ldr	w0, [x8, w2, sxtw #2]
.LBB63_13:
	ret
.LBB63_14:
	mov	w0, wzr
	ret
.Lfunc_end63:
	.size	f2fs_io_type_to_rw_hint, .Lfunc_end63-f2fs_io_type_to_rw_hint
                                        // -- End function
	.globl	f2fs_allocate_data_block // -- Begin function f2fs_allocate_data_block
	.p2align	3
	.type	f2fs_allocate_data_block,@function
f2fs_allocate_data_block:               // @f2fs_allocate_data_block
// %bb.0:
	sub	sp, sp, #208            // =208
	stp	x29, x30, [sp, #112]    // 16-byte Folded Spill
	add	x29, sp, #112           // =112
	stp	x28, x27, [sp, #128]    // 16-byte Folded Spill
	mov	w10, #120
	stp	x26, x25, [sp, #144]    // 16-byte Folded Spill
	mov	w26, w5
	stp	x24, x23, [sp, #160]    // 16-byte Folded Spill
	mov	w23, w7
	stp	x22, x21, [sp, #176]    // 16-byte Folded Spill
	mov	x22, x6
	stp	x20, x19, [sp, #192]    // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #136]
	mov	w27, w2
	stur	x4, [x29, #-32]         // 8-byte Folded Spill
	mov	x24, x1
	stur	x3, [x29, #-8]          // 8-byte Folded Spill
	ldr	x9, [x8, #24]
	add	x0, x8, #32             // =32
	ldr	x28, [x8]
	smaddl	x21, w5, w10, x9
	bl	down_read
	mov	x0, x21
	bl	mutex_lock
	add	x25, x28, #88           // =88
	mov	x0, x25
	bl	down_write
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB64_2
// %bb.1:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbnz	w8, #0, .LBB64_19
.LBB64_2:
	mov	w8, w26
	stur	x8, [x29, #-16]         // 8-byte Folded Spill
	cmp	w26, #10                // =10
	b.ne	.LBB64_60
.LBB64_3:
	add	w8, w27, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB64_41
.LBB64_4:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB64_7
// %bb.5:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB64_7
// %bb.6:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_allocate_data_block
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #5090
	add	x2, x2, :lo12:.L__func__.f2fs_allocate_data_block
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB64_7:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
.LBB64_8:
	add	w8, w27, #3             // =3
	cmp	w8, #4                  // =4
	b.lo	.LBB64_237
// %bb.9:
	ldr	w8, [x19, #3024]
	cbz	w8, .LBB64_17
// %bb.10:
	ldr	x9, [x19]
	cmp	w8, #1                  // =1
	ldr	x9, [x9, #248]
	b.lt	.LBB64_16
// %bb.11:
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB64_13
.LBB64_12:                              //   in Loop: Header=BB64_13 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x8
	b.eq	.LBB64_16
.LBB64_13:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w27
	b.hi	.LBB64_12
// %bb.14:                              //   in Loop: Header=BB64_13 Depth=1
	ldr	w12, [x11]
	cmp	w12, w27
	b.lo	.LBB64_12
// %bb.15:
	ldur	x9, [x11, #-80]
.LBB64_16:
	cbz	x9, .LBB64_237
.LBB64_17:
	ldr	x9, [x19, #136]
	cbz	x9, .LBB64_21
// %bb.18:
	add	x10, x9, #80            // =80
	b	.LBB64_22
.LBB64_19:
	cmp	w26, #3                 // =3
	b.hs	.LBB64_35
// %bb.20:
	mov	w8, wzr
	b	.LBB64_37
.LBB64_21:
	ldr	x10, [x19, #16]
	add	x10, x10, #72           // =72
.LBB64_22:
	ldr	x12, [x9, #8]
	ldr	w13, [x10]
	ldr	w11, [x19, #1184]
	ldr	w10, [x12]
	sub	w12, w27, w13
	lsr	w12, w12, w11
	sub	w12, w12, w10
	cmn	w12, #1                 // =1
	b.eq	.LBB64_237
// %bb.23:
	add	w12, w27, #3            // =3
	cmp	w12, #4                 // =4
	b.hs	.LBB64_25
.LBB64_24:
	mov	w8, #-1
	b	.LBB64_53
.LBB64_25:
	cbz	w8, .LBB64_33
// %bb.26:
	ldr	x12, [x19]
	cmp	w8, #1                  // =1
	ldr	x12, [x12, #248]
	b.lt	.LBB64_32
// %bb.27:
	ldr	x14, [x19, #3032]
	mov	x13, xzr
	add	x14, x14, #80           // =80
	b	.LBB64_29
.LBB64_28:                              //   in Loop: Header=BB64_29 Depth=1
	add	x13, x13, #1            // =1
	add	x14, x14, #192          // =192
	cmp	x13, x8
	b.eq	.LBB64_32
.LBB64_29:                              // =>This Inner Loop Header: Depth=1
	ldur	w15, [x14, #-4]
	cmp	w15, w27
	b.hi	.LBB64_28
// %bb.30:                              //   in Loop: Header=BB64_29 Depth=1
	ldr	w15, [x14]
	cmp	w15, w27
	b.lo	.LBB64_28
// %bb.31:
	ldur	x12, [x14, #-80]
.LBB64_32:
	cbz	x12, .LBB64_24
.LBB64_33:
	cbz	x9, .LBB64_51
// %bb.34:
	add	x8, x9, #80             // =80
	b	.LBB64_52
.LBB64_35:
	sub	w8, w26, #6             // =6
	cmp	w8, #2                  // =2
	b.hi	.LBB64_2
// %bb.36:
	mov	w8, #1
.LBB64_37:
	ldr	x9, [x19, #3032]
	mov	w10, #192
	umaddl	x11, w8, w10, x9
	ldr	w11, [x11, #168]
	cbz	w11, .LBB64_59
// %bb.38:
	eor	w11, w8, #0x1
	umaddl	x10, w11, w10, x9
	ldr	w10, [x10, #168]
	cbz	w10, .LBB64_2
// %bb.39:
	cbz	x8, .LBB64_57
// %bb.40:
	ldr	w10, [x9, #264]
	b	.LBB64_58
.LBB64_41:
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB64_49
// %bb.42:
	ldr	x8, [x19]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB64_48
// %bb.43:
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB64_45
.LBB64_44:                              //   in Loop: Header=BB64_45 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB64_48
.LBB64_45:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w27
	b.hi	.LBB64_44
// %bb.46:                              //   in Loop: Header=BB64_45 Depth=1
	ldr	w12, [x11]
	cmp	w12, w27
	b.lo	.LBB64_44
// %bb.47:
	ldur	x8, [x11, #-80]
.LBB64_48:
	cbz	x8, .LBB64_4
.LBB64_49:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB64_97
// %bb.50:
	add	x9, x8, #80             // =80
	b	.LBB64_98
.LBB64_51:
	ldr	x8, [x19, #16]
	add	x8, x8, #72             // =72
.LBB64_52:
	ldr	w8, [x8]
	sub	w8, w27, w8
	lsr	w8, w8, w11
	sub	w8, w8, w10
.LBB64_53:
	ldr	x9, [x9]
	mov	w10, #48
	ldr	x9, [x9, #136]
	umaddl	x20, w8, w10, x9
	ldr	w8, [x20]
	and	w9, w8, #0x3e
	cmp	w9, #6                  // =6
	b.hs	.LBB64_238
// %bb.54:
	and	w9, w8, #0x3f
	sub	w9, w9, #3              // =3
	cmp	w9, #2                  // =2
	b.ls	.LBB64_230
.LBB64_55:
	and	w8, w8, #0x3f
	sub	w8, w8, #3              // =3
	cmp	w8, #2                  // =2
	b.ls	.LBB64_242
// %bb.56:
	cbnz	x22, .LBB64_61
	b	.LBB64_66
.LBB64_57:
	ldr	x10, [x19, #136]
	ldr	w11, [x9, #264]
	ldr	w10, [x10, #96]
	sub	w10, w10, w11
.LBB64_58:
	mov	w11, #192
	madd	x8, x8, x11, x9
	ldr	w9, [x19, #1188]
	ldr	w11, [x8, #184]
	ldr	w8, [x8, #172]
	neg	w11, w11
	lsr	w8, w8, #1
	madd	w10, w9, w10, w11
	mul	w8, w8, w9
	cmp	w10, w8
	b.hi	.LBB64_2
.LBB64_59:
	mov	x0, x25
	bl	up_write
	mov	x0, x21
	bl	mutex_unlock
	ldr	x8, [x19, #136]
	sub	w10, w26, #6            // =6
	cmp	w10, #3                 // =3
	add	w9, w26, #6             // =6
	csel	w10, w10, w26, lo
	cmp	w26, #3                 // =3
	csel	w10, w9, w10, lo
	mov	w9, #120
	ldr	x8, [x8, #24]
	stur	x10, [x29, #-16]        // 8-byte Folded Spill
	umaddl	x21, w10, w9, x8
	mov	x0, x21
	bl	mutex_lock
	mov	x0, x25
	bl	down_write
	cmp	w26, #10                // =10
	b.eq	.LBB64_3
.LBB64_60:
	mov	x20, xzr
	cbz	x22, .LBB64_66
.LBB64_61:
	ldr	w8, [x22, #132]
	cbz	w8, .LBB64_66
// %bb.62:
	ldrb	w9, [x21, #96]
	ldrh	w8, [x21, #104]
	cmp	w9, #1                  // =1
	b.ne	.LBB64_64
// %bb.63:
	ldr	x9, [x19, #136]
	mov	w12, #48
	ldr	w10, [x21, #100]
	ldr	x9, [x9]
	ldr	x11, [x9, #136]
	ldr	x9, [x9, #64]
	madd	x10, x10, x12, x11
	ldr	x11, [x10, #24]
	ldr	x10, [x10, #8]
	ldr	x12, [x11]
	ldr	x13, [x10]
	orr	x12, x13, x12
	str	x12, [x9]
	ldr	x12, [x11, #8]
	ldr	x13, [x10, #8]
	orr	x12, x13, x12
	str	x12, [x9, #8]
	ldr	x12, [x11, #16]
	ldr	x13, [x10, #16]
	orr	x12, x13, x12
	str	x12, [x9, #16]
	ldr	x12, [x11, #24]
	ldr	x13, [x10, #24]
	orr	x12, x13, x12
	str	x12, [x9, #24]
	ldr	x12, [x11, #32]
	ldr	x13, [x10, #32]
	orr	x12, x13, x12
	str	x12, [x9, #32]
	ldr	x12, [x11, #40]
	ldr	x13, [x10, #40]
	orr	x12, x13, x12
	str	x12, [x9, #40]
	ldr	x12, [x11, #48]
	ldr	x13, [x10, #48]
	orr	x12, x13, x12
	str	x12, [x9, #48]
	ldr	x11, [x11, #56]
	ldr	x10, [x10, #56]
	orr	x10, x10, x11
	str	x10, [x9, #56]
	ldrh	w9, [x21, #104]
	b	.LBB64_65
.LBB64_64:
	add	w9, w8, #1              // =1
	strh	w9, [x21, #104]
.LBB64_65:
	ldr	w10, [x19, #1188]
	strh	w8, [x21, #104]
	cmp	w10, w9, uxth
	b.ls	.LBB64_73
.LBB64_66:
	ldrb	w8, [x19, #1232]
	tbz	w8, #4, .LBB64_81
// %bb.67:
	cbz	x24, .LBB64_71
// %bb.68:
	ldr	x8, [x22, #40]
	ldr	x9, [x8]
	tbz	w9, #13, .LBB64_75
// %bb.69:
	ldr	x9, [x8, #40]
	tbz	w9, #0, .LBB64_75
// %bb.70:
	ldr	x8, [x8, #40]
	tbz	w8, #3, .LBB64_75
.LBB64_71:
	ldrb	w8, [x21, #96]
	cmp	w8, #1                  // =1
	b.ne	.LBB64_74
// %bb.72:
	ldr	w8, [x19, #2160]
	add	w8, w8, #1              // =1
	str	w8, [x19, #2160]
	cbnz	x24, .LBB64_75
	b	.LBB64_81
.LBB64_73:
	mov	x0, x25
	bl	up_write
	mov	w22, #-12
	b	.LBB64_218
.LBB64_74:
	ldr	w8, [x19, #2156]
	add	w8, w8, #1              // =1
	str	w8, [x19, #2156]
	cbz	x24, .LBB64_81
.LBB64_75:
	ldur	x8, [x29, #-16]         // 8-byte Folded Reload
	sub	w8, w8, #3              // =3
	cmp	w8, #2                  // =2
	b.hi	.LBB64_81
// %bb.76:
	ldr	x8, [x24, #40]
	cmn	x8, #3                  // =3
	b.ne	.LBB64_81
// %bb.77:
	ldrb	w8, [x21, #96]
	cmp	w8, #1                  // =1
	b.ne	.LBB64_79
// %bb.78:
	ldr	w8, [x19, #2168]
	add	w8, w8, #1              // =1
	str	w8, [x19, #2168]
	b	.LBB64_80
.LBB64_79:
	ldr	w8, [x19, #2164]
	add	w8, w8, #1              // =1
	str	w8, [x19, #2164]
.LBB64_80:
	str	xzr, [x24, #40]
.LBB64_81:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB64_83
// %bb.82:
	add	x9, x8, #80             // =80
	b	.LBB64_84
.LBB64_83:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB64_84:
	ldr	x8, [x8, #8]
	ldr	w10, [x21, #100]
	ldr	w11, [x19, #1184]
	ldr	w9, [x9]
	ldr	w8, [x8]
	ldrh	w12, [x21, #104]
	str	x20, [sp, #48]          // 8-byte Folded Spill
	stur	w23, [x29, #-44]        // 4-byte Folded Spill
	add	w8, w8, w10
	stur	x25, [x29, #-40]        // 8-byte Folded Spill
	lsl	w8, w8, w11
	stur	w26, [x29, #-20]        // 4-byte Folded Spill
	add	w8, w8, w9
	ldur	x9, [x29, #-8]          // 8-byte Folded Reload
	add	w8, w8, w12
	str	x28, [sp, #56]          // 8-byte Folded Spill
	str	w8, [x9]
	ldrh	w8, [x21, #104]
	ldr	w9, [x19, #1188]
	cmp	w9, w8
	b.ls	.LBB64_225
// %bb.85:
	cmp	w9, w8
	b.ls	.LBB64_229
.LBB64_86:
	ldr	x8, [x19, #136]
	mov	x26, x22
	mov	x28, x24
	ldr	x20, [x8, #168]
	ldur	x8, [x29, #-8]          // 8-byte Folded Reload
	ldr	w25, [x8]
	mov	w8, #8280
	add	x22, x20, x8
	mov	x0, x22
	bl	mutex_lock
	mov	w8, #8344
	mov	x1, xzr
	add	x0, x20, x8
	mov	w2, w25
	bl	f2fs_lookup_rb_tree
	cbz	x0, .LBB64_108
// %bb.87:
	ldrb	w8, [x0, #98]
	mov	x24, x0
	cbz	w8, .LBB64_89
// %bb.88:
	ldrh	w8, [x24, #96]
	mov	x0, x22
	add	w8, w8, #1              // =1
	strh	w8, [x24, #96]
	bl	mutex_unlock
	mov	x0, x19
	mov	x1, x24
	bl	__wait_one_discard_bio
	b	.LBB64_109
.LBB64_89:
	ldr	w23, [x24, #28]
	cmp	w23, #1                 // =1
	b.ne	.LBB64_91
// %bb.90:
	mov	x0, x19
	mov	x1, x24
	bl	__remove_discard_cmd
	b	.LBB64_108
.LBB64_91:
	ldr	x8, [x19, #136]
	ldr	w12, [x24, #24]
	ldr	w10, [x24, #32]
	ldr	x11, [x8, #168]
	cmp	w12, w25
	ldr	w8, [x11, #8324]
	sub	w8, w8, w23
	str	w8, [x11, #8324]
	b.hs	.LBB64_96
// %bb.92:
	stp	w12, w10, [sp, #16]     // 8-byte Folded Spill
	add	x0, x24, #40            // =40
	ldr	w8, [x24, #24]
	sub	w8, w25, w8
	str	w8, [x24, #28]
	ldr	w9, [x11, #8324]
	add	w8, w9, w8
	str	w8, [x11, #8324]
	ldr	w8, [x24, #28]
	stp	x0, x11, [sp, #32]      // 16-byte Folded Spill
	sub	w9, w8, #1              // =1
	cmp	w8, #511                // =511
	mov	w8, #511
	csel	w20, w8, w9, hi
	add	x8, x11, w20, uxtw #4
	add	x8, x8, #24             // =24
	str	x8, [sp, #24]           // 8-byte Folded Spill
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB64_94
// %bb.93:
	ldp	x9, x8, [x24, #40]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB64_94:
	ldp	x0, x8, [sp, #32]       // 16-byte Folded Reload
	add	x20, x8, x20, lsl #4
	ldr	x1, [x20, #32]!
	ldr	x2, [sp, #24]           // 8-byte Folded Reload
	str	x1, [sp, #8]            // 8-byte Folded Spill
	bl	__list_add_valid
	tbz	w0, #0, .LBB64_99
// %bb.95:
	ldp	x9, x10, [sp, #24]      // 16-byte Folded Reload
	mov	w8, #1
	str	x10, [x20]
	str	x9, [x24, #40]
	ldr	x9, [sp, #8]            // 8-byte Folded Reload
	str	x9, [x24, #48]
	str	x10, [x9]
	b	.LBB64_100
.LBB64_96:
	mov	w8, wzr
	b	.LBB64_101
.LBB64_97:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB64_98:
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	sub	w9, w27, w9
	lsr	w9, w9, w10
	sub	w8, w9, w8
	cmn	w8, #1                  // =1
	b.ne	.LBB64_8
	b	.LBB64_4
.LBB64_99:
	mov	w8, #1
.LBB64_100:
	ldr	x11, [sp, #40]          // 8-byte Folded Reload
	ldp	w12, w10, [sp, #16]     // 8-byte Folded Reload
.LBB64_101:
	add	w9, w12, w23
	sub	w9, w9, #1              // =1
	subs	w4, w9, w25
	b.ls	.LBB64_108
// %bb.102:
	cbz	w8, .LBB64_104
// %bb.103:
	add	w2, w25, #1             // =1
	ldr	x1, [x24, #88]
	sub	w8, w2, w12
	mov	x0, x19
	add	w3, w8, w10
	bl	__insert_discard_tree
	b	.LBB64_108
.LBB64_104:
	ldp	w8, w9, [x24, #24]
	add	x0, x24, #40            // =40
	mov	x23, x11
	ldr	w10, [x24, #32]
	add	w8, w8, #1              // =1
	sub	w9, w9, #1              // =1
	add	w10, w10, #1            // =1
	stp	w8, w9, [x24, #24]
	str	w10, [x24, #32]
	ldr	w8, [x11, #8324]
	add	w8, w8, w9
	str	w8, [x11, #8324]
	ldr	w8, [x24, #28]
	sub	w9, w8, #1              // =1
	cmp	w8, #511                // =511
	mov	w8, #511
	csel	w20, w8, w9, hi
	add	x8, x11, w20, uxtw #4
	add	x8, x8, #24             // =24
	stp	x0, x8, [sp, #32]       // 16-byte Folded Spill
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB64_106
// %bb.105:
	ldp	x9, x8, [x24, #40]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB64_106:
	add	x23, x23, x20, lsl #4
	ldr	x25, [x23, #32]!
	ldp	x20, x2, [sp, #32]      // 16-byte Folded Reload
	mov	x1, x25
	mov	x0, x20
	bl	__list_add_valid
	tbz	w0, #0, .LBB64_108
// %bb.107:
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	str	x20, [x23]
	stp	x8, x25, [x24, #40]
	str	x20, [x25]
.LBB64_108:
	mov	x0, x22
	bl	mutex_unlock
.LBB64_109:
	ldr	x8, [x19, #136]
	mov	w9, #120
	ldur	x25, [x29, #-16]        // 8-byte Folded Reload
	mov	w2, #7
	ldur	x1, [x29, #-32]         // 8-byte Folded Reload
	ldr	x8, [x8, #24]
	smaddl	x8, w25, w9, x8
	ldrh	w9, [x8, #104]
	ldr	x8, [x8, #32]
	lsl	x10, x9, #3
	sub	x9, x10, x9
	add	x0, x8, x9
	bl	memcpy
	ldrb	w8, [x21, #96]
	cmp	w8, #1                  // =1
	b.ne	.LBB64_111
// %bb.110:
	ldr	x8, [x19, #136]
	mov	w11, #48
	ldr	w9, [x21, #100]
	ldr	x8, [x8]
	ldr	x10, [x8, #136]
	ldr	x0, [x8, #64]
	madd	x9, x9, x11, x10
	ldr	x10, [x9, #24]
	ldr	x9, [x9, #8]
	ldr	x11, [x10]
	ldr	x12, [x9]
	orr	x8, x12, x11
	ldrh	w11, [x21, #104]
	str	x8, [x0]
	ldr	x8, [x10, #8]
	add	x2, x11, #1             // =1
	ldr	x12, [x9, #8]
	orr	x8, x12, x8
	str	x8, [x0, #8]
	ldr	x8, [x10, #16]
	ldr	x12, [x9, #16]
	orr	x8, x12, x8
	str	x8, [x0, #16]
	ldr	x8, [x10, #24]
	ldr	x12, [x9, #24]
	orr	x8, x12, x8
	str	x8, [x0, #24]
	ldr	x8, [x10, #32]
	ldr	x12, [x9, #32]
	orr	x8, x12, x8
	str	x8, [x0, #32]
	ldr	x8, [x10, #40]
	ldr	x12, [x9, #40]
	orr	x8, x12, x8
	str	x8, [x0, #40]
	ldr	x8, [x10, #48]
	ldr	x12, [x9, #48]
	orr	x8, x12, x8
	str	x8, [x0, #48]
	ldr	x8, [x10, #56]
	ldr	x9, [x9, #56]
	orr	x8, x9, x8
	str	x8, [x0, #56]
	ldr	w1, [x19, #1188]
	bl	__find_rev_next_zero_bit
	ldrb	w8, [x21, #96]
	b	.LBB64_112
.LBB64_111:
	ldrh	w9, [x21, #104]
	add	w0, w9, #1              // =1
.LBB64_112:
	add	x8, x19, w8, uxtw #2
	strh	w0, [x21, #104]
	ldur	w10, [x29, #-20]        // 4-byte Folded Reload
	ldr	w9, [x8, #2048]
	cmp	w10, #10                // =10
	add	w9, w9, #1              // =1
	str	w9, [x8, #2048]
	b.ne	.LBB64_124
// %bb.113:
	add	w8, w27, #3             // =3
	cmp	w8, #4                  // =4
	b.lo	.LBB64_125
// %bb.114:
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB64_122
// %bb.115:
	ldr	x8, [x19]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB64_121
// %bb.116:
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB64_118
.LBB64_117:                             //   in Loop: Header=BB64_118 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB64_121
.LBB64_118:                             // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w27
	b.hi	.LBB64_117
// %bb.119:                             //   in Loop: Header=BB64_118 Depth=1
	ldr	w12, [x11]
	cmp	w12, w27
	b.lo	.LBB64_117
// %bb.120:
	ldur	x8, [x11, #-80]
.LBB64_121:
	cbz	x8, .LBB64_125
.LBB64_122:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB64_219
// %bb.123:
	add	x9, x8, #80             // =80
	b	.LBB64_220
.LBB64_124:
	mov	x0, x19
	mov	w1, w27
	mov	x2, xzr
	bl	update_segment_mtime
.LBB64_125:
	mov	x2, xzr
.LBB64_126:
	ldur	x8, [x29, #-8]          // 8-byte Folded Reload
	mov	x0, x19
	ldr	w1, [x8]
	bl	update_segment_mtime
	add	x22, x19, #2192         // =2192
	mov	x0, x22
	bl	mutex_lock
	cmp	w25, #2                 // =2
	b.hi	.LBB64_130
// %bb.127:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB64_134
// %bb.128:
	ldrb	w9, [x21, #96]
	add	x8, x8, x9, lsl #2
	ldr	w9, [x8, #160]
	add	w9, w9, #1              // =1
	str	w9, [x8, #160]
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB64_134
// %bb.129:
	ldr	x9, [x8, #200]
	add	x9, x9, #1              // =1
	str	x9, [x8, #200]
	b	.LBB64_134
.LBB64_130:
	sub	w8, w25, #3             // =3
	cmp	w8, #2                  // =2
	b.hi	.LBB64_134
// %bb.131:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB64_134
// %bb.132:
	ldrb	w9, [x21, #96]
	add	x8, x8, x9, lsl #2
	ldr	w9, [x8, #152]
	add	w9, w9, #1              // =1
	str	w9, [x8, #152]
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB64_134
// %bb.133:
	ldr	x9, [x8, #192]
	add	x9, x9, #1              // =1
	str	x9, [x8, #192]
.LBB64_134:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB64_136
// %bb.135:
	add	w9, w25, #1             // =1
	add	x8, x8, w9, sxtw #3
	ldr	x9, [x8, #304]
	add	x9, x9, #1              // =1
	str	x9, [x8, #304]
.LBB64_136:
	mov	x0, x22
	bl	mutex_unlock
	ldur	x8, [x29, #-8]          // 8-byte Folded Reload
	mov	x0, x19
	mov	w2, #1
	ldr	w1, [x8]
	bl	update_sit_entry
	add	w8, w27, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB64_157
.LBB64_137:
	ldr	x8, [x19, #16]
	ldrb	w9, [x8, #2180]
	tbnz	w9, #1, .LBB64_139
// %bb.138:
	ldrh	w9, [x21, #104]
	ldr	w10, [x19, #1188]
	cmp	w10, w9
	b.hi	.LBB64_169
.LBB64_139:
	ldr	w22, [x29, #96]
	cbnz	w22, .LBB64_146
// %bb.140:
	cbz	x28, .LBB64_145
// %bb.141:
	ldr	x9, [x28, #24]
	cbz	x9, .LBB64_145
// %bb.142:
	ldr	x10, [x19, #128]
	ldr	x10, [x10, #48]
	cmp	x9, x10
	b.eq	.LBB64_145
// %bb.143:
	ldr	x10, [x19, #248]
	ldr	x10, [x10, #48]
	cmp	x9, x10
	b.eq	.LBB64_145
// %bb.144:
	ldr	x9, [x9]
	ldr	w9, [x9, #768]
	cmp	w9, #31                 // =31
	cset	w10, gt
	cmp	w9, #255                // =255
	mov	w9, #2
	csel	w22, w9, w10, gt
	b	.LBB64_146
.LBB64_145:
	mov	w22, wzr
.LBB64_146:
	ldr	x9, [x19, #136]
	adrp	x10, __tracepoint_f2fs_grading_ssr_allocate
	add	x10, x10, :lo12:__tracepoint_f2fs_grading_ssr_allocate
	ldr	w8, [x8, #36]
	ldr	x11, [x9, #8]
	ldr	w9, [x19, #1240]
	ldr	w24, [x11, #4]
	ldr	w11, [x10, #8]
	cmp	w11, #1                 // =1
	b.lt	.LBB64_153
// %bb.147:
	adrp	x12, cpu_number
	//APP
	.if 1 == 1
661:
	mrs x11, tpidr_el1
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
	mrs x11, tpidr_el2
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	add	x12, x12, :lo12:cpu_number
	adrp	x13, __cpu_online_mask
	add	x13, x13, :lo12:__cpu_online_mask
	ldr	w11, [x11, x12]
	add	w12, w11, #63           // =63
	cmp	w11, #0                 // =0
	csel	w12, w12, w11, lt
	asr	w12, w12, #6
	ldr	x12, [x13, w12, sxtw #3]
	lsr	x11, x12, x11
	tbz	w11, #0, .LBB64_153
// %bb.148:
	//APP
	mrs x20, sp_el0
	//NO_APP
	ldr	w11, [x20, #80]
	add	w11, w11, #1            // =1
	str	w11, [x20, #80]
	//APP
	//NO_APP
	ldr	x23, [x10, #32]
	cbz	x23, .LBB64_151
// %bb.149:
	ldr	x10, [x23], #24
	sub	w25, w8, w9
.LBB64_150:                             // =>This Inner Loop Header: Depth=1
	ldur	x0, [x23, #-16]
	mov	w1, w25
	mov	w2, w24
	mov	w3, w22
	blr	x10
	ldr	x10, [x23], #24
	cbnz	x10, .LBB64_150
.LBB64_151:
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	ldur	x25, [x29, #-16]        // 8-byte Folded Reload
	b.ne	.LBB64_153
// %bb.152:
	ldr	x8, [x20]
	tbnz	w8, #1, .LBB64_236
.LBB64_153:
	ldur	w8, [x29, #-20]         // 4-byte Folded Reload
	cmp	w8, #10                 // =10
	b.ne	.LBB64_156
// %bb.154:
	ldr	x8, [x19, #136]
	mov	w9, #120
	ldr	x10, [sp, #48]          // 8-byte Folded Reload
	sxtw	x22, w25
	mov	x0, x19
	mov	w1, w25
	mov	w2, #3
	ldr	x20, [x8, #24]
	ldrh	w8, [x10]
	ldr	x3, [x10, #40]
	madd	x23, x22, x9, x20
	and	w8, w8, #0x3f
	strh	w8, [x23, #98]!
	bl	get_ssr_segment
	cbz	w0, .LBB64_167
// %bb.155:
	mov	w8, #120
	ldr	x9, [x19, #136]
	mov	w10, #48
	mov	x0, x19
	madd	x8, x22, x8, x20
	mov	w1, w25
	ldr	x9, [x9]
	ldr	w8, [x8, #112]
	ldr	x9, [x9, #136]
	mul	x8, x8, x10
	ldrh	w8, [x9, x8]
	and	w8, w8, #0x3f
	strh	w8, [x23]
	bl	change_curseg
	b	.LBB64_168
.LBB64_156:
	ldr	x8, [sp, #56]           // 8-byte Folded Reload
	mov	x0, x19
	mov	w1, w25
	mov	w2, wzr
	mov	w3, w22
	ldr	x8, [x8]
	ldr	x8, [x8]
	blr	x8
	b	.LBB64_169
.LBB64_157:
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB64_165
// %bb.158:
	ldr	x8, [x19]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB64_164
// %bb.159:
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB64_161
.LBB64_160:                             //   in Loop: Header=BB64_161 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB64_164
.LBB64_161:                             // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w27
	b.hi	.LBB64_160
// %bb.162:                             //   in Loop: Header=BB64_161 Depth=1
	ldr	w12, [x11]
	cmp	w12, w27
	b.lo	.LBB64_160
// %bb.163:
	ldur	x8, [x11, #-80]
.LBB64_164:
	cbz	x8, .LBB64_137
.LBB64_165:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB64_222
// %bb.166:
	add	x9, x8, #80             // =80
	b	.LBB64_223
.LBB64_167:
	mov	w8, #2
	mov	x0, x19
	mov	w1, w25
	mov	w2, #1
	strh	w8, [x23]
	bl	new_curseg
.LBB64_168:
	mov	w8, #120
	madd	x8, x22, x8, x20
	ldrb	w8, [x8, #96]
	add	x8, x19, x8, lsl #2
	ldr	w9, [x8, #2040]
	add	w9, w9, #1              // =1
	str	w9, [x8, #2040]
.LBB64_169:
	add	w8, w27, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB64_171
.LBB64_170:
	mov	w1, #-1
	b	.LBB64_183
.LBB64_171:
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB64_179
// %bb.172:
	ldr	x8, [x19]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB64_178
// %bb.173:
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB64_175
.LBB64_174:                             //   in Loop: Header=BB64_175 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB64_178
.LBB64_175:                             // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w27
	b.hi	.LBB64_174
// %bb.176:                             //   in Loop: Header=BB64_175 Depth=1
	ldr	w12, [x11]
	cmp	w12, w27
	b.lo	.LBB64_174
// %bb.177:
	ldur	x8, [x11, #-80]
.LBB64_178:
	cbz	x8, .LBB64_170
.LBB64_179:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB64_181
// %bb.180:
	add	x9, x8, #80             // =80
	b	.LBB64_182
.LBB64_181:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB64_182:
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	sub	w9, w27, w9
	lsr	w9, w9, w10
	sub	w1, w9, w8
.LBB64_183:
	mov	x0, x19
	bl	locate_dirty_segment
	ldur	x8, [x29, #-8]          // 8-byte Folded Reload
	ldr	w8, [x8]
	add	w9, w8, #3              // =3
	cmp	w9, #4                  // =4
	b.hs	.LBB64_185
.LBB64_184:
	mov	w1, #-1
	b	.LBB64_197
.LBB64_185:
	ldr	w10, [x19, #3024]
	cbz	w10, .LBB64_193
// %bb.186:
	ldr	x9, [x19]
	cmp	w10, #1                 // =1
	ldr	x9, [x9, #248]
	b.lt	.LBB64_192
// %bb.187:
	ldr	x12, [x19, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB64_189
.LBB64_188:                             //   in Loop: Header=BB64_189 Depth=1
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB64_192
.LBB64_189:                             // =>This Inner Loop Header: Depth=1
	ldur	w13, [x12, #-4]
	cmp	w13, w8
	b.hi	.LBB64_188
// %bb.190:                             //   in Loop: Header=BB64_189 Depth=1
	ldr	w13, [x12]
	cmp	w13, w8
	b.lo	.LBB64_188
// %bb.191:
	ldur	x9, [x12, #-80]
.LBB64_192:
	cbz	x9, .LBB64_184
.LBB64_193:
	ldr	x9, [x19, #136]
	cbz	x9, .LBB64_195
// %bb.194:
	add	x10, x9, #80            // =80
	b	.LBB64_196
.LBB64_195:
	ldr	x10, [x19, #16]
	add	x10, x10, #72           // =72
.LBB64_196:
	ldr	x9, [x9, #8]
	ldr	w10, [x10]
	ldr	w11, [x19, #1184]
	ldr	w9, [x9]
	sub	w8, w8, w10
	lsr	w8, w8, w11
	sub	w1, w8, w9
.LBB64_197:
	mov	x0, x19
	bl	locate_dirty_segment
	ldur	x0, [x29, #-40]         // 8-byte Folded Reload
	bl	up_write
	cbz	x28, .LBB64_211
// %bb.198:
	sub	w8, w25, #3             // =3
	cmp	w8, #2                  // =2
	b.hi	.LBB64_211
// %bb.199:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB64_201
// %bb.200:
	add	x9, x8, #80             // =80
	b	.LBB64_202
.LBB64_201:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB64_202:
	ldr	x8, [x8, #8]
	ldr	w23, [x9]
	ldr	w9, [x21, #100]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	ldrh	w20, [x21, #104]
	ldr	x11, [x28, #8]
	add	w8, w8, w9
	lsl	w24, w8, w10
	sub	x12, x11, #1            // =1
	tst	x11, #0x1
	csel	x11, x28, x12, eq
	ldr	x11, [x11]
	tbz	w11, #19, .LBB64_204
// %bb.203:
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB64_234
.LBB64_204:
	ldr	x0, [x28, #24]
.LBB64_205:
	ldr	x8, [x0]
	add	w23, w24, w23
	ldr	x8, [x8, #40]
	ldr	x22, [x8, #1104]
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB64_207
// %bb.206:
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB64_235
.LBB64_207:
	ldr	x0, [x28, #24]
.LBB64_208:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldr	x9, [x8, #224]
	add	w8, w23, w20
	ldrb	w11, [x9, #132]
	ldr	x10, [x9]
	lsl	x9, x28, #6
	orr	x9, x9, #0xffffffc000000000
	tbz	w11, #6, .LBB64_210
// %bb.209:
	ldr	x11, [x22, #240]
	orr	x10, x10, x11, lsl #32
.LBB64_210:
	add	x11, x9, #4084          // =4084
	mov	x0, x19
	mov	x1, x28
	str	w8, [x9, #4092]
	str	x10, [x11]
	bl	f2fs_inode_chksum_set
.LBB64_211:
	mov	w22, wzr
	cbz	x26, .LBB64_218
// %bb.212:
	ldur	w8, [x29, #-44]         // 4-byte Folded Reload
	tbz	w8, #0, .LBB64_218
// %bb.213:
	ldr	w9, [x19, #1432]
	mov	w8, #1
	lsl	w9, w8, w9
	cmp	w9, #2                  // =2
	b.lt	.LBB64_215
// %bb.214:
	strb	wzr, [x26, #90]
.LBB64_215:
	add	x22, x26, #64           // =64
	str	x22, [x26, #64]
	ldp	w9, w10, [x26, #12]
	str	x22, [x26, #72]
	strb	w8, [x26, #88]
	add	x9, x19, x9, lsl #3
	ldr	x8, [x9, #144]
	mov	w9, #304
	madd	x25, x10, x9, x8
	add	x23, x25, #216          // =216
	mov	x0, x23
	bl	_raw_spin_lock
	ldr	x24, [x25, #232]!
	mov	x0, x22
	mov	x1, x24
	sub	x20, x25, #8            // =8
	mov	x2, x20
	bl	__list_add_valid
	tbz	w0, #0, .LBB64_217
// %bb.216:
	str	x22, [x25]
	stp	x20, x24, [x26, #64]
	str	x22, [x24]
.LBB64_217:
	mov	x0, x23
	bl	_raw_spin_unlock
	mov	w22, wzr
.LBB64_218:
	mov	x0, x21
	bl	mutex_unlock
	ldr	x8, [x19, #136]
	add	x0, x8, #32             // =32
	bl	up_read
	mov	w0, w22
	ldp	x20, x19, [sp, #192]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #176]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #160]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #144]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #128]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #112]    // 16-byte Folded Reload
	add	sp, sp, #208            // =208
	ret
.LBB64_219:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB64_220:
	ldr	x10, [x8, #8]
	ldr	w9, [x9]
	ldr	w11, [x19, #1184]
	ldr	w10, [x10]
	sub	w9, w27, w9
	lsr	w9, w9, w11
	sub	w9, w9, w10
	cmn	w9, #1                  // =1
	b.eq	.LBB64_125
// %bb.221:
	ldr	x8, [x8]
	mov	w10, #48
	ldr	x8, [x8, #136]
	umaddl	x8, w9, w10, x8
	ldr	x2, [x8, #40]
	b	.LBB64_126
.LBB64_222:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB64_223:
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	sub	w9, w27, w9
	lsr	w9, w9, w10
	sub	w8, w9, w8
	cmn	w8, #1                  // =1
	b.eq	.LBB64_137
// %bb.224:
	mov	w2, #-1
	mov	x0, x19
	mov	w1, w27
	bl	update_sit_entry
	b	.LBB64_137
.LBB64_225:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB64_228
// %bb.226:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB64_228
// %bb.227:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_allocate_data_block
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #5158
	add	x2, x2, :lo12:.L__func__.f2fs_allocate_data_block
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB64_228:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldrh	w8, [x21, #104]
	ldr	w9, [x19, #1188]
	cmp	w9, w8
	b.hi	.LBB64_86
.LBB64_229:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 5158; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB64_230:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB64_233
// %bb.231:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB64_233
// %bb.232:
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_allocate_data_block
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #5093
	add	x2, x2, :lo12:.L__func__.f2fs_allocate_data_block
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB64_233:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	w8, [x20]
	b	.LBB64_55
.LBB64_234:
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB64_205
.LBB64_235:
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB64_208
.LBB64_236:
	bl	preempt_schedule_notrace
	b	.LBB64_153
.LBB64_237:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 5090; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB64_238:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB64_241
// %bb.239:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB64_241
// %bb.240:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.sanity_check_seg_type
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #47
	add	x2, x2, :lo12:.L__func__.sanity_check_seg_type
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB64_241:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.h"; .popsection; .long 14472b - 14470b; .short 47; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB64_242:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 5093; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end64:
	.size	f2fs_allocate_data_block, .Lfunc_end64-f2fs_allocate_data_block
                                        // -- End function
	.globl	f2fs_update_device_state // -- Begin function f2fs_update_device_state
	.p2align	3
	.type	f2fs_update_device_state,@function
f2fs_update_device_state:               // @f2fs_update_device_state
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	ldr	w8, [x0, #3024]
	cbz	w8, .LBB65_3
// %bb.1:
	mov	w20, w1
	mov	w1, w2
	mov	x19, x0
	bl	f2fs_target_device_index
	mov	w21, w0
	mvn	w22, w0
	mov	x0, x19
	mov	w1, w20
	mov	w2, w21
	mov	w3, #4
	bl	f2fs_set_dirty_device
	add	x20, x19, #3040         // =3040
	mov	w8, w21
	lsr	x21, x8, #3
	and	w9, w22, #0x7
	mov	w10, #1
	ldrb	w8, [x20, x21]
	lsl	w22, w10, w9
	tst	w22, w8
	b.ne	.LBB65_3
// %bb.2:
	add	x19, x19, #3044         // =3044
	mov	x0, x19
	bl	_raw_spin_lock
	ldrb	w8, [x20, x21]
	mov	x0, x19
	orr	w8, w8, w22
	strb	w8, [x20, x21]
	bl	_raw_spin_unlock
.LBB65_3:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end65:
	.size	f2fs_update_device_state, .Lfunc_end65-f2fs_update_device_state
                                        // -- End function
	.globl	f2fs_do_write_meta_page // -- Begin function f2fs_do_write_meta_page
	.p2align	3
	.type	f2fs_do_write_meta_page,@function
f2fs_do_write_meta_page:                // @f2fs_do_write_meta_page
// %bb.0:
	sub	sp, sp, #208            // =208
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #160]    // 16-byte Folded Spill
	add	x29, sp, #160           // =160
	mov	x9, #8589934592
	str	x21, [sp, #176]         // 8-byte Folded Spill
	mov	x21, x1
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	x10, #4294967296
	stp	x20, x19, [sp, #192]    // 16-byte Folded Spill
	mov	w20, w2
	mov	x19, x0
	stur	x8, [x29, #-8]
	stp	x0, x9, [sp, #8]
	mov	w9, #14336
	ldr	x8, [x1, #32]
	stp	x1, xzr, [sp, #48]
	stp	xzr, xzr, [sp, #64]
	str	x10, [sp, #24]
	stp	w9, w8, [sp, #32]
	ldr	x9, [x0, #136]
	str	wzr, [sp, #100]
	str	w8, [sp, #40]
	strb	wzr, [sp, #104]
	stur	xzr, [sp, #140]
	str	xzr, [sp, #80]
	strb	wzr, [sp, #88]
	stur	wzr, [sp, #95]
	str	wzr, [sp, #92]
	stur	xzr, [sp, #129]
	stur	xzr, [sp, #124]
	stur	xzr, [sp, #116]
	stur	xzr, [sp, #108]
	cbz	x9, .LBB66_2
// %bb.1:
	add	x9, x9, #84             // =84
	b	.LBB66_3
.LBB66_2:
	ldr	x9, [x19, #16]
	add	x9, x9, #92             // =92
.LBB66_3:
	ldr	w9, [x9]
	cmp	x8, x9
	b.hs	.LBB66_33
.LBB66_4:
	mov	x0, x21
	mov	w1, wzr
	bl	__test_set_page_writeback
	ldr	x8, [x21, #8]
	add	x0, sp, #8              // =8
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 256
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_submit_page_write
	ldr	x9, [x19, #136]
	ldr	x8, [x21, #32]
	ldr	x10, [x9]
	ldr	w10, [x10, #8]
	cmp	x8, x10
	b.hs	.LBB66_6
// %bb.5:
	add	x8, x19, #2024          // =2024
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB66_12
.LBB66_6:
	ldr	x10, [x19, #120]
	ldr	w10, [x10]
	cmp	x8, x10
	b.hs	.LBB66_8
// %bb.7:
	add	x8, x19, #2032          // =2032
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB66_12
.LBB66_8:
	ldr	w11, [x9, #88]
	add	x10, x19, #2028         // =2028
	cmp	x8, x11
	b.hs	.LBB66_10
// %bb.9:
	//APP
	// atomic_add
	prfm	pstl1strm, [x10]
1:	ldxr	w8, [x10]
	add	w8, w8, 1
	stxr	w9, w8, [x10]
	cbnz	w9, 1b
	//NO_APP
	b	.LBB66_12
.LBB66_10:
	ldr	w9, [x9, #84]
	cmp	x8, x9
	b.hs	.LBB66_12
// %bb.11:
	add	x8, x10, #8             // =8
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB66_12:
	ldrb	w8, [x19, #2600]
	cbz	w8, .LBB66_18
// %bb.13:
	add	x21, x19, #2240         // =2240
	mov	x0, x21
	bl	_raw_spin_lock
	add	x9, x19, w20, uxtw #3
	ror	w8, w20, #1
	ldr	x10, [x9, #2248]
	sub	w11, w8, #6             // =6
	cmp	w11, #2                 // =2
	add	x10, x10, #1, lsl #12   // =4096
	str	x10, [x9, #2248]
	b.lo	.LBB66_16
// %bb.14:
	cmp	w8, #1                  // =1
	b.hi	.LBB66_17
// %bb.15:
	ldr	x8, [x19, #2264]
	ldr	x9, [x19, #2248]
	sub	x8, x8, x9
	orr	w9, w20, #0x2
	cmp	w9, #14                 // =14
	str	x8, [x19, #2256]
	b.ne	.LBB66_17
.LBB66_16:
	ldr	x8, [x19, #2360]
	ldr	x9, [x19, #2344]
	sub	x8, x8, x9
	str	x8, [x19, #2352]
.LBB66_17:
	mov	x0, x21
	bl	_raw_spin_unlock
	mov	x0, x19
	bl	f2fs_record_iostat
.LBB66_18:
	add	x20, x19, #2192         // =2192
	mov	x0, x20
	bl	mutex_lock
	ldr	x9, [x19, #16]
	ldr	w8, [sp, #36]
	ldr	w10, [x9, #76]
	cmp	w8, w10
	b.lo	.LBB66_22
// %bb.19:
	ldr	w10, [x9, #80]
	cmp	w8, w10
	b.hs	.LBB66_22
// %bb.20:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB66_31
// %bb.21:
	ldr	x9, [x8, #376]
	add	x9, x9, #1              // =1
	str	x9, [x8, #376]
	b	.LBB66_31
.LBB66_22:
	ldr	w10, [x9, #84]
	cmp	w8, w10
	b.hs	.LBB66_25
// %bb.23:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB66_31
// %bb.24:
	ldr	x9, [x8, #384]
	add	x9, x9, #1              // =1
	str	x9, [x8, #384]
	b	.LBB66_31
.LBB66_25:
	ldr	w10, [x9, #88]
	cmp	w8, w10
	b.hs	.LBB66_28
// %bb.26:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB66_31
// %bb.27:
	ldr	x9, [x8, #392]
	add	x9, x9, #1              // =1
	str	x9, [x8, #392]
	b	.LBB66_31
.LBB66_28:
	ldr	w9, [x9, #92]
	cmp	w8, w9
	b.hs	.LBB66_31
// %bb.29:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB66_31
// %bb.30:
	ldr	x9, [x8, #400]
	add	x9, x9, #1              // =1
	str	x9, [x8, #400]
.LBB66_31:
	mov	x0, x20
	bl	mutex_unlock
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB66_34
// %bb.32:
	ldp	x20, x19, [sp, #192]    // 16-byte Folded Reload
	ldr	x21, [sp, #176]         // 8-byte Folded Reload
	ldp	x29, x30, [sp, #160]    // 16-byte Folded Reload
	add	sp, sp, #208            // =208
	ret
.LBB66_33:
	mov	w8, #10240
	str	w8, [sp, #32]
	b	.LBB66_4
.LBB66_34:
	bl	__stack_chk_fail
.Lfunc_end66:
	.size	f2fs_do_write_meta_page, .Lfunc_end66-f2fs_do_write_meta_page
                                        // -- End function
	.globl	f2fs_do_write_node_page // -- Begin function f2fs_do_write_node_page
	.p2align	3
	.type	f2fs_do_write_node_page,@function
f2fs_do_write_node_page:                // @f2fs_do_write_node_page
// %bb.0:
	sub	sp, sp, #64             // =64
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	str	x21, [sp, #32]          // 8-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x20, x1
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	str	x8, [sp, #8]
	str	w0, [sp]
	mov	x0, sp
	sturh	wzr, [sp, #5]
	strb	wzr, [sp, #4]
	bl	do_write_page
	ldr	x19, [x20]
	ldrb	w8, [x19, #2600]
	cbz	w8, .LBB67_6
// %bb.1:
	ldr	w21, [x20, #100]
	add	x20, x19, #2240         // =2240
	mov	x0, x20
	bl	_raw_spin_lock
	add	x9, x19, x21, lsl #3
	ror	w8, w21, #1
	ldr	x10, [x9, #2248]
	sub	w11, w8, #6             // =6
	cmp	w11, #2                 // =2
	add	x10, x10, #1, lsl #12   // =4096
	str	x10, [x9, #2248]
	b.lo	.LBB67_4
// %bb.2:
	cmp	w8, #1                  // =1
	b.hi	.LBB67_5
// %bb.3:
	ldr	x8, [x19, #2264]
	ldr	x9, [x19, #2248]
	sub	x8, x8, x9
	orr	w9, w21, #0x2
	cmp	w9, #14                 // =14
	str	x8, [x19, #2256]
	b.ne	.LBB67_5
.LBB67_4:
	ldr	x8, [x19, #2360]
	ldr	x9, [x19, #2344]
	sub	x8, x8, x9
	str	x8, [x19, #2352]
.LBB67_5:
	mov	x0, x20
	bl	_raw_spin_unlock
	mov	x0, x19
	bl	f2fs_record_iostat
.LBB67_6:
	adrp	x9, __stack_chk_guard
	ldr	x8, [sp, #8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB67_8
// %bb.7:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x21, [sp, #32]          // 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.LBB67_8:
	bl	__stack_chk_fail
.Lfunc_end67:
	.size	f2fs_do_write_node_page, .Lfunc_end67-f2fs_do_write_node_page
                                        // -- End function
	.p2align	3               // -- Begin function do_write_page
	.type	do_write_page,@function
do_write_page:                          // @do_write_page
// %bb.0:
	sub	sp, sp, #96             // =96
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	mov	x22, x0
	mov	x0, x1
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	x20, x1
	bl	__get_segment_type
	mov	w19, w0
	ldr	x0, [x20]
	ldr	w8, [x0, #1504]
	cmp	w8, #1                  // =1
	cset	w8, eq
	cmp	w19, #2                 // =2
	cset	w9, eq
	cmp	w19, #8                 // =8
	cset	w10, eq
	orr	w9, w9, w10
	and	w24, w9, w8
	cmp	w24, #1                 // =1
	b.ne	.LBB68_2
// %bb.1:
	add	x0, x0, #168            // =168
	bl	down_read
	ldr	x0, [x20]
.LBB68_2:
	ldr	x1, [x20, #40]
	add	x23, x20, #28           // =28
	ldr	w2, [x20, #32]
	mov	x3, x23
	mov	x4, x22
	mov	w5, w19
	mov	x6, x20
	mov	w7, #1
	str	wzr, [sp]
	bl	f2fs_allocate_data_block
	mov	w21, #-12
	cbz	w0, .LBB68_29
.LBB68_3:
	cbz	w24, .LBB68_5
.LBB68_4:
	ldr	x8, [x20]
	add	x0, x8, #168            // =168
	bl	up_read
.LBB68_5:
	ldr	x8, [x20]
	ldr	w9, [x8, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB68_14
// %bb.6:
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB68_14
// %bb.7:
	adrp	x8, __tracepoint_f2fs_writepage_type
	ldr	w22, [x20, #136]
	add	x8, x8, :lo12:__tracepoint_f2fs_writepage_type
	ldr	w23, [x20, #8]
	ldp	w20, w24, [x20, #28]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB68_14
// %bb.8:
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
	tbz	w9, #0, .LBB68_14
// %bb.9:
	//APP
	mrs x25, sp_el0
	//NO_APP
	ldr	w9, [x25, #80]
	add	w9, w9, #1              // =1
	str	w9, [x25, #80]
	//APP
	//NO_APP
	ldr	x26, [x8, #32]
	cbz	x26, .LBB68_12
// %bb.10:
	ldr	x8, [x26], #24
.LBB68_11:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x26, #-16]
	mov	w1, w19
	mov	w2, w22
	mov	w3, w23
	mov	w4, w24
	mov	w5, w20
	blr	x8
	ldr	x8, [x26], #24
	cbnz	x8, .LBB68_11
.LBB68_12:
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x25, #80]
	b.ne	.LBB68_14
// %bb.13:
	ldr	x8, [x25]
	tbnz	w8, #1, .LBB68_35
.LBB68_14:
	mov	w0, w21
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #96             // =96
	ret
.LBB68_15:                              //   in Loop: Header=BB68_29 Depth=1
	ldr	w2, [x20, #28]
	mov	x3, x23
	ldr	x0, [x20]
	mov	x4, x22
	ldr	x1, [x20, #40]
	mov	w5, w19
	mov	x6, x20
	mov	w7, #1
	str	w2, [x20, #32]
	str	wzr, [sp]
	bl	f2fs_allocate_data_block
	cbz	w0, .LBB68_29
	b	.LBB68_3
.LBB68_16:                              //   in Loop: Header=BB68_29 Depth=1
	ldr	x8, [x20]
	ldr	w10, [x8, #3024]
	cbz	w10, .LBB68_24
// %bb.17:                              //   in Loop: Header=BB68_29 Depth=1
	ldr	x9, [x8]
	cmp	w10, #1                 // =1
	ldr	x9, [x9, #248]
	b.lt	.LBB68_23
// %bb.18:                              //   in Loop: Header=BB68_29 Depth=1
	ldr	x12, [x8, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB68_20
.LBB68_19:                              //   in Loop: Header=BB68_20 Depth=2
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB68_23
.LBB68_20:                              //   Parent Loop BB68_29 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w13, [x12, #-4]
	cmp	w13, w1
	b.hi	.LBB68_19
// %bb.21:                              //   in Loop: Header=BB68_20 Depth=2
	ldr	w13, [x12]
	cmp	w13, w1
	b.lo	.LBB68_19
// %bb.22:                              //   in Loop: Header=BB68_29 Depth=1
	ldur	x9, [x12, #-80]
.LBB68_23:                              //   in Loop: Header=BB68_29 Depth=1
	cbz	x9, .LBB68_30
.LBB68_24:                              //   in Loop: Header=BB68_29 Depth=1
	ldr	x9, [x8, #136]
	cbz	x9, .LBB68_26
// %bb.25:                              //   in Loop: Header=BB68_29 Depth=1
	add	x10, x9, #80            // =80
	b	.LBB68_27
.LBB68_26:                              //   in Loop: Header=BB68_29 Depth=1
	ldr	x10, [x8, #16]
	add	x10, x10, #72           // =72
.LBB68_27:                              //   in Loop: Header=BB68_29 Depth=1
	ldr	x9, [x9, #8]
	ldr	w10, [x10]
	ldr	w11, [x8, #1184]
	ldr	w9, [x9]
	sub	w10, w1, w10
	lsr	w10, w10, w11
	sub	w9, w10, w9
	cmn	w9, #1                  // =1
	b.eq	.LBB68_30
// %bb.28:                              //   in Loop: Header=BB68_29 Depth=1
	ldr	x8, [x8, #248]
	mov	x2, x1
	ldr	x0, [x8, #48]
	bl	invalidate_mapping_pages
	ldr	x0, [x20]
	ldr	w1, [x20, #32]
	bl	f2fs_invalidate_compress_page
	b	.LBB68_30
.LBB68_29:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB68_20 Depth 2
	ldr	w1, [x20, #32]
	add	w8, w1, #3              // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB68_16
.LBB68_30:                              //   in Loop: Header=BB68_29 Depth=1
	mov	x0, x20
	bl	f2fs_submit_page_write
	ldrb	w8, [x20, #90]
	cbnz	w8, .LBB68_15
// %bb.31:
	ldr	x21, [x20]
	ldr	w8, [x21, #3024]
	cbz	w8, .LBB68_33
// %bb.32:
	ldr	w1, [x20, #28]
	mov	x0, x21
	ldr	w22, [x20, #8]
	bl	f2fs_target_device_index
	mov	w23, w0
	mvn	w25, w0
	mov	x0, x21
	mov	w1, w22
	mov	w2, w23
	mov	w3, #4
	bl	f2fs_set_dirty_device
	add	x22, x21, #3040         // =3040
	mov	w8, w23
	lsr	x23, x8, #3
	and	w9, w25, #0x7
	mov	w10, #1
	ldrb	w8, [x22, x23]
	lsl	w25, w10, w9
	tst	w25, w8
	b.eq	.LBB68_34
.LBB68_33:
	mov	w21, wzr
	cbnz	w24, .LBB68_4
	b	.LBB68_5
.LBB68_34:
	add	x21, x21, #3044         // =3044
	mov	x0, x21
	bl	_raw_spin_lock
	ldrb	w8, [x22, x23]
	mov	x0, x21
	orr	w8, w8, w25
	strb	w8, [x22, x23]
	bl	_raw_spin_unlock
	mov	w21, wzr
	cbnz	w24, .LBB68_4
	b	.LBB68_5
.LBB68_35:
	bl	preempt_schedule_notrace
	b	.LBB68_14
.Lfunc_end68:
	.size	do_write_page, .Lfunc_end68-do_write_page
                                        // -- End function
	.globl	f2fs_outplace_write_data // -- Begin function f2fs_outplace_write_data
	.p2align	3
	.type	f2fs_outplace_write_data,@function
f2fs_outplace_write_data:               // @f2fs_outplace_write_data
// %bb.0:
	sub	sp, sp, #64             // =64
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x20, x1
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	add	x29, sp, #16            // =16
	str	x8, [sp, #8]
	ldr	x19, [x1]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB69_6
// %bb.1:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB69_6
// %bb.2:
	ldr	w2, [x20, #136]
	cmp	w2, #1                  // =1
	b.hi	.LBB69_5
// %bb.3:
	mov	x0, x19
	mov	w1, w2
	bl	f2fs_dev_has_enough_space
	tbnz	w0, #0, .LBB69_6
// %bb.4:
	ldr	w8, [x20, #136]
	mov	w9, #1
	sub	w8, w9, w8
	str	w8, [x20, #136]
	b	.LBB69_6
.LBB69_5:
	adrp	x1, .L.str.15
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.15
	bl	f2fs_printk
.LBB69_6:
	ldr	w8, [x21, #36]
	cbz	w8, .LBB69_18
.LBB69_7:
	ldp	w8, w9, [x21, #24]
	mov	x0, sp
	mov	x1, x20
	ldrb	w10, [x20, #128]
	str	w8, [sp]
	sturh	w9, [sp, #5]
	strb	w10, [sp, #4]
	bl	do_write_page
	cbz	w0, .LBB69_9
// %bb.8:
	mov	w0, #-12
	b	.LBB69_16
.LBB69_9:
	ldr	w1, [x20, #28]
	mov	x0, x21
	bl	f2fs_update_data_blkaddr
	ldrb	w8, [x19, #2600]
	cbz	w8, .LBB69_15
// %bb.10:
	ldr	w21, [x20, #100]
	add	x20, x19, #2240         // =2240
	mov	x0, x20
	bl	_raw_spin_lock
	add	x9, x19, x21, lsl #3
	ror	w8, w21, #1
	ldr	x10, [x9, #2248]
	sub	w11, w8, #6             // =6
	cmp	w11, #2                 // =2
	add	x10, x10, #1, lsl #12   // =4096
	str	x10, [x9, #2248]
	b.lo	.LBB69_13
// %bb.11:
	cmp	w8, #1                  // =1
	b.hi	.LBB69_14
// %bb.12:
	ldr	x8, [x19, #2264]
	ldr	x9, [x19, #2248]
	sub	x8, x8, x9
	orr	w9, w21, #0x2
	cmp	w9, #14                 // =14
	str	x8, [x19, #2256]
	b.ne	.LBB69_14
.LBB69_13:
	ldr	x8, [x19, #2360]
	ldr	x9, [x19, #2344]
	sub	x8, x8, x9
	str	x8, [x19, #2352]
.LBB69_14:
	mov	x0, x20
	bl	_raw_spin_unlock
	mov	x0, x19
	bl	f2fs_record_iostat
.LBB69_15:
	mov	w0, wzr
.LBB69_16:
	adrp	x9, __stack_chk_guard
	ldr	x8, [sp, #8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB69_23
// %bb.17:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.LBB69_18:
	bl	print_bdev_access_info
	adrp	x22, f2fs_dclient
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB69_21
// %bb.19:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB69_21
// %bb.20:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_outplace_write_data
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #5458
	add	x2, x2, :lo12:.L__func__.f2fs_outplace_write_data
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB69_21:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	w8, [x21, #36]
	cbnz	w8, .LBB69_7
// %bb.22:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 5458; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB69_23:
	bl	__stack_chk_fail
.Lfunc_end69:
	.size	f2fs_outplace_write_data, .Lfunc_end69-f2fs_outplace_write_data
                                        // -- End function
	.globl	f2fs_inplace_write_data // -- Begin function f2fs_inplace_write_data
	.p2align	3
	.type	f2fs_inplace_write_data,@function
f2fs_inplace_write_data:                // @f2fs_inplace_write_data
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	w8, [x0, #32]
	ldr	x20, [x0]
	str	x23, [sp, #16]          // 8-byte Folded Spill
	str	w8, [x0, #28]
	bl	__get_segment_type
	ldr	w1, [x19, #28]
	add	w8, w1, #3              // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB70_2
.LBB70_1:
	mov	w3, #-1
	b	.LBB70_14
.LBB70_2:
	ldr	w9, [x20, #3024]
	cbz	w9, .LBB70_10
// %bb.3:
	ldr	x8, [x20]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB70_9
// %bb.4:
	ldr	x11, [x20, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB70_6
.LBB70_5:                               //   in Loop: Header=BB70_6 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB70_9
.LBB70_6:                               // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w1
	b.hi	.LBB70_5
// %bb.7:                               //   in Loop: Header=BB70_6 Depth=1
	ldr	w12, [x11]
	cmp	w12, w1
	b.lo	.LBB70_5
// %bb.8:
	ldur	x8, [x11, #-80]
.LBB70_9:
	cbz	x8, .LBB70_1
.LBB70_10:
	ldr	x8, [x20, #136]
	cbz	x8, .LBB70_12
// %bb.11:
	add	x9, x8, #80             // =80
	b	.LBB70_13
.LBB70_12:
	ldr	x9, [x20, #16]
	add	x9, x9, #72             // =72
.LBB70_13:
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x20, #1184]
	ldr	w8, [x8]
	sub	w9, w1, w9
	lsr	w9, w9, w10
	sub	w3, w9, w8
.LBB70_14:
	ldr	x8, [x20, #136]
	mov	w9, #48
	umull	x9, w3, w9
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	ldr	w9, [x8, x9]
	and	w8, w9, #0x3f
	cmp	w8, #3                  // =3
	b.lo	.LBB70_19
// %bb.15:
	and	w9, w9, #0x3e
	cmp	w9, #6                  // =6
	ccmp	w8, #9, #2, hs
	b.lo	.LBB70_19
// %bb.16:
	cbz	x20, .LBB70_18
// %bb.17:
	add	x8, x20, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB70_18:
	adrp	x1, .L.str.16
	adrp	x2, .L__func__.f2fs_inplace_write_data
	add	x1, x1, :lo12:.L.str.16
	add	x2, x2, :lo12:.L__func__.f2fs_inplace_write_data
	mov	x0, x20
	bl	f2fs_printk
	mov	w20, #-117
	ldr	x8, [x19, #112]
	cbnz	x8, .LBB70_26
	b	.LBB70_39
.LBB70_19:
	ldr	x8, [x20, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB70_25
// %bb.20:
	ldr	x8, [x20, #248]
	mov	x2, x1
	ldr	x0, [x8, #48]
	bl	invalidate_mapping_pages
	ldr	x8, [x19]
	add	x21, x20, #2192         // =2192
	mov	x0, x21
	add	x8, x8, #2064           // =2064
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	mutex_lock
	ldr	x8, [x20, #2224]
	cbz	x8, .LBB70_22
// %bb.21:
	ldr	w9, [x8, #168]
	add	w9, w9, #1              // =1
	str	w9, [x8, #168]
.LBB70_22:
	mov	x0, x21
	bl	mutex_unlock
	ldr	x8, [x19, #112]
	cbz	x8, .LBB70_28
// %bb.23:
	ldr	x8, [x20, #136]
	ldrb	w8, [x8, #136]
	tbnz	w8, #6, .LBB70_28
// %bb.24:
	mov	x0, x19
	bl	f2fs_merge_page_bio
	mov	w20, w0
	cbnz	w0, .LBB70_39
	b	.LBB70_29
.LBB70_25:
	mov	w20, #-5
	ldr	x8, [x19, #112]
	cbz	x8, .LBB70_39
.LBB70_26:
	ldr	x0, [x8]
	cbz	x0, .LBB70_39
// %bb.27:
	mov	w8, #10
	strb	w8, [x0, #26]
	bl	bio_endio
	ldr	x8, [x19, #112]
	str	xzr, [x8]
	b	.LBB70_39
.LBB70_28:
	mov	x0, x19
	bl	f2fs_submit_page_bio
	mov	w20, w0
	cbnz	w0, .LBB70_39
.LBB70_29:
	ldr	x20, [x19]
	ldr	w8, [x20, #3024]
	cbz	w8, .LBB70_32
// %bb.30:
	ldr	w1, [x19, #28]
	mov	x0, x20
	ldr	w21, [x19, #8]
	bl	f2fs_target_device_index
	mov	w22, w0
	mvn	w23, w0
	mov	x0, x20
	mov	w1, w21
	mov	w2, w22
	mov	w3, #4
	bl	f2fs_set_dirty_device
	add	x21, x20, #3040         // =3040
	mov	w8, w22
	lsr	x22, x8, #3
	and	w9, w23, #0x7
	mov	w10, #1
	ldrb	w8, [x21, x22]
	lsl	w23, w10, w9
	tst	w23, w8
	b.ne	.LBB70_32
// %bb.31:
	add	x20, x20, #3044         // =3044
	mov	x0, x20
	bl	_raw_spin_lock
	ldrb	w8, [x21, x22]
	mov	x0, x20
	orr	w8, w8, w23
	strb	w8, [x21, x22]
	bl	_raw_spin_unlock
.LBB70_32:
	ldr	x20, [x19]
	ldrb	w8, [x20, #2600]
	cbz	w8, .LBB70_38
// %bb.33:
	ldr	w21, [x19, #100]
	add	x19, x20, #2240         // =2240
	mov	x0, x19
	bl	_raw_spin_lock
	add	x9, x20, x21, lsl #3
	ror	w8, w21, #1
	ldr	x10, [x9, #2248]
	sub	w11, w8, #6             // =6
	cmp	w11, #2                 // =2
	add	x10, x10, #1, lsl #12   // =4096
	str	x10, [x9, #2248]
	b.lo	.LBB70_36
// %bb.34:
	cmp	w8, #1                  // =1
	b.hi	.LBB70_37
// %bb.35:
	ldr	x8, [x20, #2264]
	ldr	x9, [x20, #2248]
	sub	x8, x8, x9
	orr	w9, w21, #0x2
	cmp	w9, #14                 // =14
	str	x8, [x20, #2256]
	b.ne	.LBB70_37
.LBB70_36:
	ldr	x8, [x20, #2360]
	ldr	x9, [x20, #2344]
	sub	x8, x8, x9
	str	x8, [x20, #2352]
.LBB70_37:
	mov	x0, x19
	bl	_raw_spin_unlock
	mov	x0, x20
	bl	f2fs_record_iostat
.LBB70_38:
	mov	w20, wzr
.LBB70_39:
	mov	w0, w20
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end70:
	.size	f2fs_inplace_write_data, .Lfunc_end70-f2fs_inplace_write_data
                                        // -- End function
	.p2align	3               // -- Begin function __get_segment_type
	.type	__get_segment_type,@function
__get_segment_type:                     // @__get_segment_type
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0]
	mov	x29, sp
	ldr	w8, [x8, #1448]
	cmp	w8, #6                  // =6
	b.eq	.LBB71_8
// %bb.1:
	cmp	w8, #4                  // =4
	b.eq	.LBB71_4
// %bb.2:
	cmp	w8, #2                  // =2
	b.ne	.LBB71_33
// %bb.3:
	ldr	w8, [x19, #12]
	cmp	w8, #0                  // =0
	mov	w8, #3
	csel	w0, wzr, w8, eq
	b	.LBB71_15
.LBB71_4:
	ldr	w9, [x19, #12]
	ldr	x8, [x19, #40]
	cbz	w9, .LBB71_16
// %bb.5:
	lsl	x8, x8, #6
	mov	w0, #5
	orr	x8, x8, #0xffffffc000000000
	ldr	w8, [x8, #4080]
	lsr	w9, w8, #3
	cmp	w9, #2040               // =2040
	b.gt	.LBB71_18
// %bb.6:
	cmp	w9, #3                  // =3
	b.eq	.LBB71_27
// %bb.7:
	cmp	w9, #1022               // =1022
	b.eq	.LBB71_27
	b	.LBB71_20
.LBB71_8:
	mov	x0, x19
	bl	__get_segment_type_6
	mov	x0, x19
	bl	__get_segment_type_6
	ldr	x8, [x19]
	ldr	w9, [x8, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB71_13
// %bb.9:
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB71_13
// %bb.10:
	cmp	w0, #8                  // =8
	b.hi	.LBB71_13
// %bb.11:
	mov	w8, #1
	mov	w9, #455
	lsl	w8, w8, w0
	tst	w8, w9
	b.eq	.LBB71_13
// %bb.12:
	ldr	w8, [x19, #136]
	cmp	w0, #3                  // =3
	ccmp	w8, #1, #0, lo
	add	w8, w0, #6              // =6
	csel	w0, w8, w0, eq
.LBB71_13:
	cmp	w0, #6                  // =6
	b.hi	.LBB71_24
// %bb.14:
	mov	w8, #1
	mov	w9, #73
	lsl	w8, w8, w0
	tst	w8, w9
	b.eq	.LBB71_24
.LBB71_15:
	str	wzr, [x19, #16]
	b	.LBB71_32
.LBB71_16:
	ldr	x8, [x8, #24]
	ldr	x8, [x8]
	ldrh	w8, [x8]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.ne	.LBB71_26
// %bb.17:
	mov	w0, wzr
	b	.LBB71_15
.LBB71_18:
	cmp	w9, #2041               // =2041
	b.eq	.LBB71_27
// %bb.19:
	mov	w10, #536870911
	cmp	w9, w10
	b.eq	.LBB71_22
.LBB71_20:
	lsr	w10, w8, #4
	cmp	w10, #1021              // =1021
	b.lo	.LBB71_22
// %bb.21:
	mov	w10, #36659
	mov	w11, #49970
	movk	w10, #10354, lsl #16
	movk	w11, #24117, lsl #16
	madd	w9, w9, w10, w11
	mov	w10, #20581
	movk	w10, #64, lsl #16
	cmp	w9, w10
	b.lo	.LBB71_23
.LBB71_22:
	tbnz	w8, #0, .LBB71_29
.LBB71_23:
	mov	w0, #5
	b	.LBB71_27
.LBB71_24:
	add	x8, x19, #16            // =16
	cmp	w0, #7                  // =7
	b.hi	.LBB71_28
// %bb.25:
	mov	w9, #1
	mov	w10, #146
	lsl	w9, w9, w0
	tst	w9, w10
	b.ne	.LBB71_30
	b	.LBB71_28
.LBB71_26:
	mov	w0, #2
.LBB71_27:
	add	x8, x19, #16            // =16
.LBB71_28:
	mov	w9, #2
	b	.LBB71_31
.LBB71_29:
	add	x8, x19, #16            // =16
	mov	w0, #4
.LBB71_30:
	mov	w9, #1
.LBB71_31:
	str	w9, [x8]
.LBB71_32:
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.LBB71_33:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB71_36
// %bb.34:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB71_36
// %bb.35:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__get_segment_type
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #5009
	add	x2, x2, :lo12:.L__func__.__get_segment_type
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB71_36:
	ldr	x0, [x19]
	bl	f2fs_print_raw_sb_info
	ldr	x0, [x19]
	bl	f2fs_print_ckpt_info
	ldr	x0, [x19]
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 5009; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end71:
	.size	__get_segment_type, .Lfunc_end71-__get_segment_type
                                        // -- End function
	.globl	f2fs_do_replace_block   // -- Begin function f2fs_do_replace_block
	.p2align	3
	.type	f2fs_do_replace_block,@function
f2fs_do_replace_block:                  // @f2fs_do_replace_block
// %bb.0:
	sub	sp, sp, #160            // =160
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	stp	x28, x27, [sp, #80]     // 16-byte Folded Spill
	add	w14, w3, #3             // =3
	stp	x26, x25, [sp, #96]     // 16-byte Folded Spill
	cmp	w14, #4                 // =4
	stp	x24, x23, [sp, #112]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #128]    // 16-byte Folded Spill
	mov	w21, w3
	stp	x20, x19, [sp, #144]    // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #136]
	mov	w22, w2
	str	w6, [sp, #20]           // 4-byte Folded Spill
	stur	w5, [x29, #-28]         // 4-byte Folded Spill
	stur	x1, [x29, #-16]         // 8-byte Folded Spill
	ldr	x20, [x8]
	stp	w14, w4, [x29, #-8]     // 8-byte Folded Spill
	b.hs	.LBB72_2
.LBB72_1:
	mov	w27, #-1
	b	.LBB72_14
.LBB72_2:
	ldr	w10, [x19, #3024]
	cbz	w10, .LBB72_10
// %bb.3:
	ldr	x9, [x19]
	cmp	w10, #1                 // =1
	ldr	x9, [x9, #248]
	b.lt	.LBB72_9
// %bb.4:
	ldr	x12, [x19, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB72_6
.LBB72_5:                               //   in Loop: Header=BB72_6 Depth=1
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB72_9
.LBB72_6:                               // =>This Inner Loop Header: Depth=1
	ldur	w13, [x12, #-4]
	cmp	w13, w21
	b.hi	.LBB72_5
// %bb.7:                               //   in Loop: Header=BB72_6 Depth=1
	ldr	w13, [x12]
	cmp	w13, w21
	b.lo	.LBB72_5
// %bb.8:
	ldur	x9, [x12, #-80]
.LBB72_9:
	cbz	x9, .LBB72_1
.LBB72_10:
	cbz	x8, .LBB72_12
// %bb.11:
	add	x9, x8, #80             // =80
	b	.LBB72_13
.LBB72_12:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB72_13:
	ldr	x10, [x8, #8]
	ldr	w9, [x9]
	ldr	w11, [x19, #1184]
	ldr	w10, [x10]
	sub	w9, w21, w9
	lsr	w9, w9, w11
	sub	w27, w9, w10
.LBB72_14:
	ldr	x9, [x20, #136]
	mov	w10, #48
	add	x0, x8, #32             // =32
	umaddl	x24, w27, w10, x9
	ldr	w23, [x24]
	bl	down_write
	ldur	w8, [x29, #-4]          // 4-byte Folded Reload
	tbz	w8, #0, .LBB72_17
// %bb.15:
	ldr	x8, [x19, #136]
	ldr	x8, [x8, #24]
	ldr	w9, [x8, #100]
	cmp	w27, w9
	b.ne	.LBB72_32
// %bb.16:
	mov	w8, wzr
	b	.LBB72_55
.LBB72_17:
	ldrh	w8, [x24]
	tst	w8, #0xffc0
	b.ne	.LBB72_29
// %bb.18:
	ldr	x8, [x19, #136]
	ldr	x8, [x8, #24]
	ldr	w9, [x8, #100]
	cmp	w27, w9
	b.eq	.LBB72_29
// %bb.19:
	ldr	w9, [x8, #220]
	cmp	w27, w9
	b.eq	.LBB72_29
// %bb.20:
	ldr	w9, [x8, #340]
	cmp	w27, w9
	b.eq	.LBB72_29
// %bb.21:
	ldr	w9, [x8, #460]
	cmp	w27, w9
	b.eq	.LBB72_29
// %bb.22:
	ldr	w9, [x8, #580]
	cmp	w27, w9
	b.eq	.LBB72_29
// %bb.23:
	ldr	w9, [x8, #700]
	cmp	w27, w9
	b.eq	.LBB72_29
// %bb.24:
	ldr	w9, [x8, #820]
	cmp	w27, w9
	b.eq	.LBB72_29
// %bb.25:
	ldr	w9, [x8, #940]
	cmp	w27, w9
	b.eq	.LBB72_29
// %bb.26:
	ldr	w9, [x8, #1060]
	cmp	w27, w9
	b.eq	.LBB72_29
// %bb.27:
	ldr	w9, [x8, #1180]
	cmp	w27, w9
	b.eq	.LBB72_29
// %bb.28:
	ldr	w8, [x8, #1300]
	cmp	w27, w8
	b.ne	.LBB72_123
.LBB72_29:
	and	x23, x23, #0x3f
	cmp	w23, #9                 // =9
	b.hs	.LBB72_49
// %bb.30:
	mov	w8, #455
	lsr	w8, w8, w23
	tbz	w8, #0, .LBB72_49
// %bb.31:
	adrp	x8, .Lswitch.table.f2fs_do_replace_block.61
	add	x8, x8, :lo12:.Lswitch.table.f2fs_do_replace_block.61
	ldr	w8, [x8, x23, lsl #2]
	b	.LBB72_55
.LBB72_32:
	ldr	w9, [x8, #220]
	cmp	w27, w9
	b.ne	.LBB72_34
.LBB72_33:
	mov	w8, #1
	b	.LBB72_55
.LBB72_34:
	ldr	w9, [x8, #340]
	cmp	w27, w9
	b.ne	.LBB72_36
// %bb.35:
	mov	w8, #2
	b	.LBB72_55
.LBB72_36:
	ldr	w9, [x8, #460]
	cmp	w27, w9
	b.ne	.LBB72_38
// %bb.37:
	mov	w23, #3
	b	.LBB72_49
.LBB72_38:
	ldr	w9, [x8, #580]
	cmp	w27, w9
	b.eq	.LBB72_45
// %bb.39:
	ldr	w9, [x8, #700]
	cmp	w27, w9
	b.eq	.LBB72_45
// %bb.40:
	ldr	w9, [x8, #820]
	cmp	w27, w9
	b.eq	.LBB72_45
// %bb.41:
	ldr	w9, [x8, #940]
	cmp	w27, w9
	b.eq	.LBB72_45
// %bb.42:
	ldr	w9, [x8, #1060]
	cmp	w27, w9
	b.eq	.LBB72_45
// %bb.43:
	ldr	w9, [x8, #1180]
	cmp	w27, w9
	b.eq	.LBB72_45
// %bb.44:
	ldr	w9, [x8, #1300]
	cmp	w27, w9
	b.ne	.LBB72_33
.LBB72_45:
	ldr	w9, [x8, #580]
	cmp	w9, w27
	b.ne	.LBB72_47
// %bb.46:
	mov	w23, #4
	b	.LBB72_49
.LBB72_47:
	ldr	w9, [x8, #700]
	cmp	w9, w27
	b.ne	.LBB72_113
// %bb.48:
	mov	w23, #5
.LBB72_49:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB72_52
// %bb.50:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB72_52
// %bb.51:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_do_replace_block
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #5594
	add	x2, x2, :lo12:.L__func__.f2fs_do_replace_block
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB72_52:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	cmp	w23, #9                 // =9
	b.hs	.LBB72_124
// %bb.53:
	mov	w8, #455
	lsr	w8, w8, w23
	tbz	w8, #0, .LBB72_124
// %bb.54:
	adrp	x8, .Lswitch.table.f2fs_do_replace_block.61
	add	x8, x8, :lo12:.Lswitch.table.f2fs_do_replace_block.61
	ldr	w8, [x8, w23, uxtw #2]
.LBB72_55:
	ldr	x9, [x19, #136]
	mov	w28, w8
	ldr	x10, [x9, #24]
	mov	w9, #120
	umaddl	x26, w8, w9, x10
	str	x10, [sp, #24]          // 8-byte Folded Spill
	mov	x0, x26
	bl	mutex_lock
	add	x0, x20, #88            // =88
	stur	x0, [x29, #-24]         // 8-byte Folded Spill
	bl	down_write
	mov	x24, x26
	mov	x25, x26
	mov	x20, x26
	ldr	w23, [x24, #100]!
	ldrh	w8, [x25, #104]!
	str	w8, [sp, #12]           // 4-byte Folded Spill
	cmp	w27, w23
	ldrb	w8, [x20, #96]!
	str	w8, [sp, #16]           // 4-byte Folded Spill
	b.eq	.LBB72_57
// %bb.56:
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	mov	w8, #120
	mov	x0, x19
	mov	w1, w28
	madd	x8, x28, x8, x9
	str	w27, [x8, #112]
	bl	change_curseg
.LBB72_57:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB72_59
// %bb.58:
	add	x8, x8, #80             // =80
	b	.LBB72_60
.LBB72_59:
	ldr	x8, [x19, #16]
	add	x8, x8, #72             // =72
.LBB72_60:
	ldr	w8, [x8]
	mov	w2, #7
	ldr	w9, [x19, #1188]
	ldur	x1, [x29, #-16]         // 8-byte Folded Reload
	sub	w8, w21, w8
	sub	w9, w9, #1              // =1
	and	w8, w9, w8
	mov	w9, #120
	strh	w8, [x25]
	ldr	x8, [x19, #136]
	ldr	x8, [x8, #24]
	madd	x8, x28, x9, x8
	ldrh	w9, [x8, #104]
	ldr	x8, [x8, #32]
	lsl	x10, x9, #3
	sub	x9, x10, x9
	add	x0, x8, x9
	bl	memcpy
	ldur	w8, [x29, #-4]          // 4-byte Folded Reload
	tbz	w8, #0, .LBB72_62
// %bb.61:
	ldur	w8, [x29, #-28]         // 4-byte Folded Reload
	tbz	w8, #0, .LBB72_65
.LBB72_62:
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	tbnz	w8, #0, .LBB72_64
// %bb.63:
	mov	x0, x19
	mov	w1, w21
	mov	x2, xzr
	bl	update_segment_mtime
.LBB72_64:
	mov	x0, x19
	mov	w1, w21
	mov	w2, #1
	bl	update_sit_entry
.LBB72_65:
	add	w8, w22, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB72_67
.LBB72_66:
	mov	w1, #-1
	b	.LBB72_94
.LBB72_67:
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB72_75
// %bb.68:
	ldr	x8, [x19]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB72_74
// %bb.69:
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB72_71
.LBB72_70:                              //   in Loop: Header=BB72_71 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB72_74
.LBB72_71:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w22
	b.hi	.LBB72_70
// %bb.72:                              //   in Loop: Header=BB72_71 Depth=1
	ldr	w12, [x11]
	cmp	w12, w22
	b.lo	.LBB72_70
// %bb.73:
	ldur	x8, [x11, #-80]
.LBB72_74:
	cbz	x8, .LBB72_82
.LBB72_75:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB72_77
// %bb.76:
	add	x9, x8, #80             // =80
	b	.LBB72_78
.LBB72_77:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB72_78:
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	sub	w9, w22, w9
	lsr	w9, w9, w10
	sub	w8, w9, w8
	cmn	w8, #1                  // =1
	b.eq	.LBB72_82
// %bb.79:
	ldr	x8, [x19, #248]
	mov	w1, w22
	mov	x2, x1
	ldr	x0, [x8, #48]
	bl	invalidate_mapping_pages
	mov	x0, x19
	mov	w1, w22
	bl	f2fs_invalidate_compress_page
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	tbnz	w8, #0, .LBB72_81
// %bb.80:
	mov	x0, x19
	mov	w1, w22
	mov	x2, xzr
	bl	update_segment_mtime
.LBB72_81:
	mov	w2, #-1
	mov	x0, x19
	mov	w1, w22
	bl	update_sit_entry
.LBB72_82:
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB72_90
// %bb.83:
	ldr	x8, [x19]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB72_89
// %bb.84:
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB72_86
.LBB72_85:                              //   in Loop: Header=BB72_86 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB72_89
.LBB72_86:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w22
	b.hi	.LBB72_85
// %bb.87:                              //   in Loop: Header=BB72_86 Depth=1
	ldr	w12, [x11]
	cmp	w12, w22
	b.lo	.LBB72_85
// %bb.88:
	ldur	x8, [x11, #-80]
.LBB72_89:
	cbz	x8, .LBB72_66
.LBB72_90:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB72_92
// %bb.91:
	add	x9, x8, #80             // =80
	b	.LBB72_93
.LBB72_92:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB72_93:
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	sub	w9, w22, w9
	lsr	w9, w9, w10
	sub	w1, w9, w8
.LBB72_94:
	mov	x0, x19
	bl	locate_dirty_segment
	ldur	w8, [x29, #-8]          // 4-byte Folded Reload
	cmp	w8, #4                  // =4
	b.hs	.LBB72_96
.LBB72_95:
	mov	w1, #-1
	b	.LBB72_108
.LBB72_96:
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB72_104
// %bb.97:
	ldr	x8, [x19]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB72_103
// %bb.98:
	ldr	x11, [x19, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB72_100
.LBB72_99:                              //   in Loop: Header=BB72_100 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB72_103
.LBB72_100:                             // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w21
	b.hi	.LBB72_99
// %bb.101:                             //   in Loop: Header=BB72_100 Depth=1
	ldr	w12, [x11]
	cmp	w12, w21
	b.lo	.LBB72_99
// %bb.102:
	ldur	x8, [x11, #-80]
.LBB72_103:
	cbz	x8, .LBB72_95
.LBB72_104:
	ldr	x8, [x19, #136]
	cbz	x8, .LBB72_106
// %bb.105:
	add	x9, x8, #80             // =80
	b	.LBB72_107
.LBB72_106:
	ldr	x9, [x19, #16]
	add	x9, x9, #72             // =72
.LBB72_107:
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	sub	w9, w21, w9
	lsr	w9, w9, w10
	sub	w1, w9, w8
.LBB72_108:
	mov	x0, x19
	bl	locate_dirty_segment
	mov	x0, x19
	mov	w1, w23
	bl	locate_dirty_segment
	ldur	w8, [x29, #-4]          // 4-byte Folded Reload
	tbz	w8, #0, .LBB72_112
// %bb.109:
	ldr	w8, [x24]
	cmp	w23, w8
	b.eq	.LBB72_111
// %bb.110:
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	mov	w8, #120
	mov	x0, x19
	mov	w1, w28
	madd	x8, x28, x8, x9
	str	w23, [x8, #112]
	bl	change_curseg
.LBB72_111:
	ldr	w8, [sp, #12]           // 4-byte Folded Reload
	strh	w8, [x25]
	ldr	w8, [sp, #16]           // 4-byte Folded Reload
	strb	w8, [x20]
.LBB72_112:
	ldur	x0, [x29, #-24]         // 8-byte Folded Reload
	bl	up_write
	mov	x0, x26
	bl	mutex_unlock
	ldr	x8, [x19, #136]
	add	x0, x8, #32             // =32
	bl	up_write
	ldp	x20, x19, [sp, #144]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB72_113:
	ldr	w9, [x8, #820]
	cmp	w9, w27
	b.ne	.LBB72_115
// %bb.114:
	mov	w8, #6
	b	.LBB72_55
.LBB72_115:
	ldr	w9, [x8, #940]
	cmp	w9, w27
	b.ne	.LBB72_117
// %bb.116:
	mov	w8, #7
	b	.LBB72_55
.LBB72_117:
	ldr	w9, [x8, #1060]
	cmp	w9, w27
	b.ne	.LBB72_119
// %bb.118:
	mov	w8, #8
	b	.LBB72_55
.LBB72_119:
	ldr	w9, [x8, #1180]
	cmp	w9, w27
	b.ne	.LBB72_121
// %bb.120:
	mov	w23, #9
	b	.LBB72_49
.LBB72_121:
	ldr	w8, [x8, #1300]
	cmp	w8, w27
	b.ne	.LBB72_125
// %bb.122:
	mov	w23, #10
	b	.LBB72_49
.LBB72_123:
	cmp	w22, #0                 // =0
	mov	w8, #1
	cinc	w8, w8, eq
	b	.LBB72_55
.LBB72_124:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 5594; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB72_125:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB72_128
// %bb.126:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB72_128
// %bb.127:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_do_replace_block
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #5588
	add	x2, x2, :lo12:.L__func__.f2fs_do_replace_block
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB72_128:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 5588; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end72:
	.size	f2fs_do_replace_block, .Lfunc_end72-f2fs_do_replace_block
                                        // -- End function
	.globl	f2fs_replace_block      // -- Begin function f2fs_replace_block
	.p2align	3
	.type	f2fs_replace_block,@function
f2fs_replace_block:                     // @f2fs_replace_block
// %bb.0:
	sub	sp, sp, #48             // =48
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x1
	add	x29, sp, #16            // =16
	mov	w20, w3
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	str	x8, [sp, #8]
	ldp	w8, w9, [x1, #24]
	mov	x1, sp
	strb	w4, [sp, #4]
	and	w4, w5, #0x1
	and	w5, w6, #0x1
	mov	w6, wzr
	str	w8, [sp]
	sturh	w9, [sp, #5]
	bl	f2fs_do_replace_block
	mov	x0, x19
	mov	w1, w20
	bl	f2fs_update_data_blkaddr
	adrp	x9, __stack_chk_guard
	ldr	x8, [sp, #8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB73_2
// %bb.1:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #48             // =48
	ret
.LBB73_2:
	bl	__stack_chk_fail
.Lfunc_end73:
	.size	f2fs_replace_block, .Lfunc_end73-f2fs_replace_block
                                        // -- End function
	.globl	f2fs_wait_on_page_writeback // -- Begin function f2fs_wait_on_page_writeback
	.p2align	3
	.type	f2fs_wait_on_page_writeback,@function
f2fs_wait_on_page_writeback:            // @f2fs_wait_on_page_writeback
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	ldr	x8, [x0, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x0, x9, eq
	ldr	x8, [x8]
	sxth	w8, w8
	tbz	w8, #31, .LBB74_11
// %bb.1:
	ldr	x8, [x0, #8]
	mov	w21, w3
	mov	w22, w2
	mov	x19, x0
	mov	w4, w1
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x0, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB74_3
// %bb.2:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB74_12
.LBB74_3:
	ldr	x0, [x19, #24]
.LBB74_4:
	ldr	x8, [x0]
	mov	x1, xzr
	mov	x2, x19
	mov	w3, wzr
	ldr	x8, [x8, #40]
	ldr	x20, [x8, #1104]
	mov	x0, x20
	bl	f2fs_submit_merged_write_cond
	mov	x0, x20
	mov	x1, xzr
	mov	x2, x19
	bl	f2fs_submit_merged_ipu_write
	tbz	w22, #0, .LBB74_7
// %bb.5:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	sxth	w8, w8
	tbnz	w8, #31, .LBB74_8
// %bb.6:
	tbnz	w21, #0, .LBB74_9
	b	.LBB74_11
.LBB74_7:
	mov	x0, x19
	bl	wait_for_stable_page
	b	.LBB74_11
.LBB74_8:
	mov	x0, x19
	mov	w1, #15
	bl	wait_on_page_bit
	tbz	w21, #0, .LBB74_11
.LBB74_9:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	sxth	w8, w8
	tbnz	w8, #31, .LBB74_13
.LBB74_10:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	sxth	w8, w8
	tbnz	w8, #31, .LBB74_17
.LBB74_11:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB74_12:
	mov	x0, x19
	mov	w20, w4
	bl	__page_file_mapping
	mov	w4, w20
	b	.LBB74_4
.LBB74_13:
	bl	print_bdev_access_info
	adrp	x21, f2fs_dclient
	ldr	x0, [x21, :lo12:f2fs_dclient]
	cbz	x0, .LBB74_16
// %bb.14:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB74_16
// %bb.15:
	ldr	x0, [x21, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_wait_on_page_writeback
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #5705
	add	x2, x2, :lo12:.L__func__.f2fs_wait_on_page_writeback
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB74_16:
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	b	.LBB74_10
.LBB74_17:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 5705; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end74:
	.size	f2fs_wait_on_page_writeback, .Lfunc_end74-f2fs_wait_on_page_writeback
                                        // -- End function
	.globl	f2fs_wait_on_block_writeback // -- Begin function f2fs_wait_on_block_writeback
	.p2align	3
	.type	f2fs_wait_on_block_writeback,@function
f2fs_wait_on_block_writeback:           // @f2fs_wait_on_block_writeback
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	ldr	x8, [x0, #40]
	ldrb	w9, [x0, #13]
	ldr	x8, [x8, #1104]
	tbz	w9, #6, .LBB75_2
// %bb.1:
	ldrh	w9, [x0]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.eq	.LBB75_3
.LBB75_2:
	ldr	x9, [x0, #640]
	cbz	x9, .LBB75_5
.LBB75_3:
	add	w9, w1, #3              // =3
	cmp	w9, #4                  // =4
	b.hs	.LBB75_9
.LBB75_4:
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.LBB75_5:
	ldr	w9, [x8, #1532]
	cbz	w9, .LBB75_35
// %bb.6:
	ldr	w9, [x0, #1256]
	cbnz	w9, .LBB75_3
// %bb.7:
	ldr	x9, [x0, #712]
	tbnz	x9, #35, .LBB75_3
// %bb.8:
	ldr	x9, [x0, #712]
	tbnz	x9, #34, .LBB75_3
	b	.LBB75_4
.LBB75_9:
	ldr	w10, [x8, #3024]
	cbz	w10, .LBB75_17
// %bb.10:
	ldr	x9, [x8]
	cmp	w10, #1                 // =1
	ldr	x9, [x9, #248]
	b.lt	.LBB75_16
// %bb.11:
	ldr	x12, [x8, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB75_13
.LBB75_12:                              //   in Loop: Header=BB75_13 Depth=1
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB75_16
.LBB75_13:                              // =>This Inner Loop Header: Depth=1
	ldur	w13, [x12, #-4]
	cmp	w13, w1
	b.hi	.LBB75_12
// %bb.14:                              //   in Loop: Header=BB75_13 Depth=1
	ldr	w13, [x12]
	cmp	w13, w1
	b.lo	.LBB75_12
// %bb.15:
	ldur	x9, [x12, #-80]
.LBB75_16:
	cbz	x9, .LBB75_4
.LBB75_17:
	ldr	x8, [x8, #248]
	mov	w1, w1
	mov	w2, #2
	mov	w3, wzr
	ldr	x0, [x8, #48]
	bl	pagecache_get_page
	cbz	x0, .LBB75_4
// %bb.18:
	mov	w1, wzr
	mov	w2, #1
	mov	w3, #1
	mov	x19, x0
	bl	f2fs_wait_on_page_writeback
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
	b.ne	.LBB75_37
// %bb.19:
	tbnz	w8, #0, .LBB75_33
// %bb.20:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB75_23
// %bb.21:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB75_23
// %bb.22:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB75_23:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB75_25
// %bb.24:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB75_45
.LBB75_25:
	ldr	x0, [x19, #24]
.LBB75_26:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB75_28
// %bb.27:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB75_46
.LBB75_28:
	ldr	x0, [x19, #24]
.LBB75_29:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB75_31
// %bb.30:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB75_47
.LBB75_31:
	ldr	x0, [x19, #24]
.LBB75_32:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB75_33:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB75_43
// %bb.34:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB75_35:
	ldrh	w9, [x0]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB75_4
// %bb.36:
	ldr	x9, [x0, #712]
	tbz	w9, #31, .LBB75_4
	b	.LBB75_3
.LBB75_37:
	tbnz	w8, #0, .LBB75_42
// %bb.38:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB75_41
// %bb.39:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB75_41
// %bb.40:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB75_41:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB75_42:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB75_48
.LBB75_43:
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
	cbnz	w9, .LBB75_4
// %bb.44:
	bl	__put_page
	b	.LBB75_4
.LBB75_45:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB75_26
.LBB75_46:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB75_29
.LBB75_47:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB75_32
.LBB75_48:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end75:
	.size	f2fs_wait_on_block_writeback, .Lfunc_end75-f2fs_wait_on_block_writeback
                                        // -- End function
	.globl	f2fs_wait_on_block_writeback_range // -- Begin function f2fs_wait_on_block_writeback_range
	.p2align	3
	.type	f2fs_wait_on_block_writeback_range,@function
f2fs_wait_on_block_writeback_range:     // @f2fs_wait_on_block_writeback_range
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	cbz	w2, .LBB76_3
// %bb.1:
	mov	w19, w2
	mov	w20, w1
	mov	x21, x0
	mov	w22, wzr
.LBB76_2:                               // =>This Inner Loop Header: Depth=1
	mov	x0, x21
	mov	w1, w20
	bl	f2fs_wait_on_block_writeback
	add	w22, w22, #1            // =1
	add	w20, w20, #1            // =1
	cmp	w22, w19
	b.ne	.LBB76_2
.LBB76_3:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end76:
	.size	f2fs_wait_on_block_writeback_range, .Lfunc_end76-f2fs_wait_on_block_writeback_range
                                        // -- End function
	.globl	init_virtual_curseg     // -- Begin function init_virtual_curseg
	.p2align	3
	.type	init_virtual_curseg,@function
init_virtual_curseg:                    // @init_virtual_curseg
// %bb.0:
	ret
.Lfunc_end77:
	.size	init_virtual_curseg, .Lfunc_end77-init_virtual_curseg
                                        // -- End function
	.globl	write_append_journal    // -- Begin function write_append_journal
	.p2align	3
	.type	write_append_journal,@function
write_append_journal:                   // @write_append_journal
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #224]
	ldrb	w8, [x8, #133]
	tbnz	w8, #3, .LBB78_2
// %bb.1:
	mov	w21, w1
	b	.LBB78_28
.LBB78_2:
	ldr	x8, [x19, #136]
	add	w21, w1, #1             // =1
	mov	w1, w1
	mov	x0, x19
	ldr	x22, [x8, #24]
	bl	f2fs_grab_meta_page
	ldr	x8, [x22, #88]
	mov	x20, x0
	lsl	x9, x0, #6
	orr	x0, x9, #0xffffffc000000000
	mov	w2, #4095
	add	x1, x8, #496            // =496
	bl	memcpy
	mov	x0, x20
	bl	set_page_dirty
	cbz	x20, .LBB78_28
// %bb.3:
	ldr	x8, [x20, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x20, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x20, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB78_20
// %bb.4:
	tbnz	w8, #0, .LBB78_18
// %bb.5:
	bl	print_bdev_access_info
	adrp	x22, f2fs_dclient
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB78_8
// %bb.6:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB78_8
// %bb.7:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB78_8:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB78_10
// %bb.9:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB78_56
.LBB78_10:
	ldr	x0, [x20, #24]
.LBB78_11:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB78_13
// %bb.12:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB78_57
.LBB78_13:
	ldr	x0, [x20, #24]
.LBB78_14:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB78_16
// %bb.15:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB78_58
.LBB78_16:
	ldr	x0, [x20, #24]
.LBB78_17:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB78_18:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB78_26
// %bb.19:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB78_20:
	tbnz	w8, #0, .LBB78_25
// %bb.21:
	bl	print_bdev_access_info
	adrp	x22, f2fs_dclient
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB78_24
// %bb.22:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB78_24
// %bb.23:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB78_24:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB78_25:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB78_62
.LBB78_26:
	mov	x0, x20
	bl	unlock_page
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
	cbnz	w9, .LBB78_28
// %bb.27:
	bl	__put_page
.LBB78_28:
	ldr	x8, [x19, #224]
	ldrb	w8, [x8, #133]
	tbz	w8, #2, .LBB78_55
// %bb.29:
	ldr	x8, [x19, #136]
	mov	w1, w21
	mov	x0, x19
	ldr	x20, [x8, #24]
	bl	f2fs_grab_meta_page
	ldr	x8, [x20, #328]
	mov	x19, x0
	lsl	x9, x0, #6
	orr	x0, x9, #0xffffffc000000000
	mov	w2, #4056
	add	x1, x8, #470            // =470
	bl	memcpy
	mov	x0, x19
	bl	set_page_dirty
	cbz	x19, .LBB78_55
// %bb.30:
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
	b.ne	.LBB78_47
// %bb.31:
	tbnz	w8, #0, .LBB78_45
// %bb.32:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB78_35
// %bb.33:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB78_35
// %bb.34:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB78_35:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB78_37
// %bb.36:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB78_59
.LBB78_37:
	ldr	x0, [x19, #24]
.LBB78_38:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB78_40
// %bb.39:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB78_60
.LBB78_40:
	ldr	x0, [x19, #24]
.LBB78_41:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB78_43
// %bb.42:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB78_61
.LBB78_43:
	ldr	x0, [x19, #24]
.LBB78_44:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB78_45:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB78_53
// %bb.46:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB78_47:
	tbnz	w8, #0, .LBB78_52
// %bb.48:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB78_51
// %bb.49:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB78_51
// %bb.50:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB78_51:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB78_52:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB78_63
.LBB78_53:
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
	cbnz	w9, .LBB78_55
// %bb.54:
	bl	__put_page
.LBB78_55:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB78_56:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB78_11
.LBB78_57:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB78_14
.LBB78_58:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB78_17
.LBB78_59:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB78_38
.LBB78_60:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB78_41
.LBB78_61:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB78_44
.LBB78_62:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB78_63:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end78:
	.size	write_append_journal, .Lfunc_end78-write_append_journal
                                        // -- End function
	.globl	get_max_reclaimable_segments // -- Begin function get_max_reclaimable_segments
	.p2align	3
	.type	get_max_reclaimable_segments,@function
get_max_reclaimable_segments:           // @get_max_reclaimable_segments
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x2, xzr
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #136]
	mov	x29, sp
	str	x23, [sp, #16]          // 8-byte Folded Spill
	ldr	x21, [x8, #16]
	ldr	w20, [x8, #96]
	ldr	x0, [x21, #56]
	mov	x1, x20
	bl	find_next_bit
	mov	x22, xzr
	cmp	w20, w0
	b.ls	.LBB79_3
// %bb.1:
	mov	x22, xzr
	mov	w23, #48
.LBB79_2:                               // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #136]
	and	x9, x0, #0xffffffff
	add	w2, w0, #1              // =1
	mov	x1, x20
	mul	x9, x9, x23
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	ldr	w9, [x8, x9]
	ldr	x8, [x21, #56]
	ubfx	x9, x9, #6, #10
	add	x22, x22, x9
	mov	x0, x8
	bl	find_next_bit
	cmp	w20, w0
	b.hi	.LBB79_2
.LBB79_3:
	ldr	w8, [x19, #1188]
	ldr	w9, [x21, #136]
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	udiv	x8, x22, x8
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	sub	w0, w9, w8
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end79:
	.size	get_max_reclaimable_segments, .Lfunc_end79-get_max_reclaimable_segments
                                        // -- End function
	.globl	get_dev_max_reclaimable_segments // -- Begin function get_dev_max_reclaimable_segments
	.p2align	3
	.type	get_dev_max_reclaimable_segments,@function
get_dev_max_reclaimable_segments:       // @get_dev_max_reclaimable_segments
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	ldr	w8, [x0, #3024]
	str	x25, [sp, #16]          // 8-byte Folded Spill
	cmp	w8, #2                  // =2
	b.ne	.LBB80_2
// %bb.1:
	ldr	x8, [x0, #16]
	mov	x19, x0
	ldrb	w8, [x8, #2182]
	tbnz	w8, #0, .LBB80_3
.LBB80_2:
	mov	w0, wzr
	b	.LBB80_16
.LBB80_3:
	ldr	x8, [x19, #3032]
	mov	w9, #192
	cmp	w1, #1                  // =1
	umaddl	x10, w1, w9, x8
	ldr	x9, [x19, #136]
	ldr	w10, [x10, #88]
	ldr	x21, [x9, #16]
	add	w24, w10, #1            // =1
	b.eq	.LBB80_8
// %bb.4:
	cbnz	w1, .LBB80_11
// %bb.5:
	ldr	x0, [x21, #56]
	mov	w20, w24
	mov	x1, x20
	mov	x2, xzr
	bl	find_next_bit
	cmp	w24, w0
	b.ls	.LBB80_14
// %bb.6:
	mov	x22, xzr
	mov	w23, wzr
	mov	w25, #48
.LBB80_7:                               // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #136]
	and	x9, x0, #0xffffffff
	add	w2, w0, #1              // =1
	mov	x1, x20
	mul	x9, x9, x25
	add	w23, w23, #1            // =1
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	ldr	w9, [x8, x9]
	ldr	x8, [x21, #56]
	ubfx	x9, x9, #6, #10
	add	x22, x22, x9
	mov	x0, x8
	bl	find_next_bit
	cmp	w24, w0
	b.hi	.LBB80_7
	b	.LBB80_15
.LBB80_8:
	mov	w9, w1
	mov	w10, #192
	ldr	x0, [x21, #56]
	mov	w20, w24
	madd	x8, x9, x10, x8
	mov	x1, x20
	ldr	w2, [x8, #84]
	bl	find_next_bit
	cmp	w24, w0
	b.ls	.LBB80_14
// %bb.9:
	mov	x22, xzr
	mov	w23, wzr
	mov	w25, #48
.LBB80_10:                              // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #136]
	and	x9, x0, #0xffffffff
	add	w2, w0, #1              // =1
	mov	x1, x20
	mul	x9, x9, x25
	add	w23, w23, #1            // =1
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	ldr	w9, [x8, x9]
	ldr	x8, [x21, #56]
	ubfx	x9, x9, #6, #10
	add	x22, x22, x9
	mov	x0, x8
	bl	find_next_bit
	cmp	w24, w0
	b.hi	.LBB80_10
	b	.LBB80_15
.LBB80_11:
	ldr	x0, [x21, #56]
	mov	x2, xzr
	ldr	w1, [x9, #96]
	bl	find_next_bit
	ldr	x8, [x19, #136]
	ldr	w9, [x8, #96]
	cmp	w9, w0
	b.ls	.LBB80_14
// %bb.12:
	mov	x22, xzr
	mov	w23, wzr
	mov	w20, #48
.LBB80_13:                              // =>This Inner Loop Header: Depth=1
	ldr	x8, [x8]
	and	x10, x0, #0xffffffff
	mov	w1, w9
	add	w2, w0, #1              // =1
	mul	x10, x10, x20
	add	w23, w23, #1            // =1
	ldr	x8, [x8, #136]
	ldr	w10, [x8, x10]
	ldr	x8, [x21, #56]
	ubfx	x10, x10, #6, #10
	add	x22, x22, x10
	mov	x0, x8
	bl	find_next_bit
	ldr	x8, [x19, #136]
	ldr	w9, [x8, #96]
	cmp	w9, w0
	b.hi	.LBB80_13
	b	.LBB80_15
.LBB80_14:
	mov	x22, xzr
	mov	w23, wzr
.LBB80_15:
	ldr	w8, [x19, #1188]
	udiv	x8, x22, x8
	sub	w0, w23, w8
.LBB80_16:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.Lfunc_end80:
	.size	get_dev_max_reclaimable_segments, .Lfunc_end80-get_dev_max_reclaimable_segments
                                        // -- End function
	.globl	f2fs_write_data_summaries // -- Begin function f2fs_write_data_summaries
	.p2align	3
	.type	f2fs_write_data_summaries,@function
f2fs_write_data_summaries:              // @f2fs_write_data_summaries
// %bb.0:
	sub	sp, sp, #112            // =112
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x28, x27, [sp, #32]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #48]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	ldr	x8, [x0, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #2, .LBB81_2
// %bb.1:
	mov	x0, x21
	mov	w2, wzr
	bl	write_normal_summaries
	b	.LBB81_68
.LBB81_2:
	add	w23, w1, #1             // =1
	mov	w1, w1
	mov	x0, x21
	bl	f2fs_grab_meta_page
	lsl	x8, x0, #6
	orr	x22, x8, #0xffffffc000000000
	mov	x19, x0
	mov	x0, x22
	mov	w1, wzr
	mov	w2, #4096
	bl	memset
	ldr	x8, [x21, #136]
	mov	w20, #507
	mov	x0, x22
	mov	x2, x20
	ldr	x8, [x8, #24]
	ldr	x1, [x8, #88]
	bl	memcpy
	ldr	x8, [x21, #136]
	add	x0, x22, #507           // =507
	mov	x2, x20
	ldr	x8, [x8, #24]
	ldr	x1, [x8, #328]
	bl	memcpy
	mov	x11, xzr
	mov	w25, #1014
	b	.LBB81_4
.LBB81_3:                               //   in Loop: Header=BB81_4 Depth=1
	ldr	x11, [sp, #8]           // 8-byte Folded Reload
	add	x11, x11, #1            // =1
	cmp	x11, #3                 // =3
	b.eq	.LBB81_42
.LBB81_4:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB81_11 Depth 2
	ldr	x8, [x21, #224]
	ldr	x9, [x21, #136]
	add	x8, x8, x11
	ldrb	w10, [x8, #176]
	ldr	x8, [x9, #24]
	cmp	w10, #1                 // =1
	b.ne	.LBB81_6
// %bb.5:                               //   in Loop: Header=BB81_4 Depth=1
	ldr	w9, [x21, #1188]
	b	.LBB81_7
.LBB81_6:                               //   in Loop: Header=BB81_4 Depth=1
	mov	w9, #120
	madd	x9, x11, x9, x8
	ldrh	w9, [x9, #104]
.LBB81_7:                               //   in Loop: Header=BB81_4 Depth=1
	tst	w9, #0xffff
	str	x11, [sp, #8]           // 8-byte Folded Spill
	b.eq	.LBB81_3
// %bb.8:                               //   in Loop: Header=BB81_4 Depth=1
	mov	w10, #120
	mov	x26, xzr
	mov	x20, xzr
	and	x28, x9, #0xffff
	madd	x8, x11, x10, x8
	add	x27, x8, #32            // =32
	b	.LBB81_11
.LBB81_9:                               //   in Loop: Header=BB81_11 Depth=2
	mov	x19, xzr
.LBB81_10:                              //   in Loop: Header=BB81_11 Depth=2
	add	w25, w25, #7            // =7
	add	x20, x20, #1            // =1
	add	x26, x26, #7            // =7
	cmp	x20, x28
	b.eq	.LBB81_3
.LBB81_11:                              //   Parent Loop BB81_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	cbnz	x19, .LBB81_13
// %bb.12:                              //   in Loop: Header=BB81_11 Depth=2
	mov	w1, w23
	mov	x0, x21
	add	w24, w23, #1            // =1
	bl	f2fs_grab_meta_page
	lsl	x8, x0, #6
	orr	x22, x8, #0xffffffc000000000
	mov	x19, x0
	mov	x0, x22
	mov	w1, wzr
	mov	w2, #4096
	bl	memset
	mov	w25, wzr
	mov	w23, w24
.LBB81_13:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x8, [x27]
	add	x10, x22, w25, sxtw
	add	w11, w25, #14           // =14
	cmp	w11, #4092              // =4092
	add	x8, x8, x26
	ldur	w9, [x8, #3]
	ldr	w8, [x8]
	stur	w9, [x10, #3]
	str	w8, [x10]
	b.lo	.LBB81_10
// %bb.14:                              //   in Loop: Header=BB81_11 Depth=2
	mov	x0, x19
	bl	set_page_dirty
	cbz	x19, .LBB81_10
// %bb.15:                              //   in Loop: Header=BB81_11 Depth=2
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
	b.ne	.LBB81_31
// %bb.16:                              //   in Loop: Header=BB81_11 Depth=2
	tbnz	w8, #0, .LBB81_30
// %bb.17:                              //   in Loop: Header=BB81_11 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB81_20
// %bb.18:                              //   in Loop: Header=BB81_11 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB81_20
// %bb.19:                              //   in Loop: Header=BB81_11 Depth=2
	adrp	x24, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x24, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB81_20:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB81_22
// %bb.21:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB81_39
.LBB81_22:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x0, [x19, #24]
.LBB81_23:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB81_25
// %bb.24:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB81_40
.LBB81_25:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x0, [x19, #24]
.LBB81_26:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB81_28
// %bb.27:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB81_41
.LBB81_28:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x0, [x19, #24]
.LBB81_29:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB81_30:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB81_37
	b	.LBB81_72
.LBB81_31:                              //   in Loop: Header=BB81_11 Depth=2
	tbnz	w8, #0, .LBB81_36
// %bb.32:                              //   in Loop: Header=BB81_11 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB81_35
// %bb.33:                              //   in Loop: Header=BB81_11 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB81_35
// %bb.34:                              //   in Loop: Header=BB81_11 Depth=2
	adrp	x24, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x24, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB81_35:                              //   in Loop: Header=BB81_11 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB81_36:                              //   in Loop: Header=BB81_11 Depth=2
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB81_73
.LBB81_37:                              //   in Loop: Header=BB81_11 Depth=2
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
	cbnz	w9, .LBB81_9
// %bb.38:                              //   in Loop: Header=BB81_11 Depth=2
	bl	__put_page
	b	.LBB81_9
.LBB81_39:                              //   in Loop: Header=BB81_11 Depth=2
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB81_23
.LBB81_40:                              //   in Loop: Header=BB81_11 Depth=2
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB81_26
.LBB81_41:                              //   in Loop: Header=BB81_11 Depth=2
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB81_29
.LBB81_42:
	cbz	x19, .LBB81_68
// %bb.43:
	mov	x0, x19
	bl	set_page_dirty
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
	b.ne	.LBB81_60
// %bb.44:
	tbnz	w8, #0, .LBB81_58
// %bb.45:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB81_48
// %bb.46:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB81_48
// %bb.47:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB81_48:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB81_50
// %bb.49:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB81_69
.LBB81_50:
	ldr	x0, [x19, #24]
.LBB81_51:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB81_53
// %bb.52:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB81_70
.LBB81_53:
	ldr	x0, [x19, #24]
.LBB81_54:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB81_56
// %bb.55:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB81_71
.LBB81_56:
	ldr	x0, [x19, #24]
.LBB81_57:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB81_58:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB81_66
// %bb.59:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB81_60:
	tbnz	w8, #0, .LBB81_65
// %bb.61:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB81_64
// %bb.62:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB81_64
// %bb.63:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB81_64:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB81_65:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB81_74
.LBB81_66:
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
	cbnz	w9, .LBB81_68
// %bb.67:
	bl	__put_page
.LBB81_68:
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB81_69:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB81_51
.LBB81_70:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB81_54
.LBB81_71:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB81_57
.LBB81_72:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB81_73:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB81_74:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end81:
	.size	f2fs_write_data_summaries, .Lfunc_end81-f2fs_write_data_summaries
                                        // -- End function
	.p2align	3               // -- Begin function write_normal_summaries
	.type	write_normal_summaries,@function
write_normal_summaries:                 // @write_normal_summaries
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	mov	w8, #2147483644
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	cmp	w2, w8
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	b.gt	.LBB82_31
// %bb.1:
	mov	w8, #120
	mov	w19, w2
	mov	w20, w1
	mov	x21, x0
	smull	x24, w2, w8
	add	w23, w2, #3             // =3
	b	.LBB82_3
.LBB82_2:                               //   in Loop: Header=BB82_3 Depth=1
	add	w19, w19, #1            // =1
	add	x24, x24, #120          // =120
	add	w20, w20, #1            // =1
	cmp	w19, w23
	b.ge	.LBB82_31
.LBB82_3:                               // =>This Inner Loop Header: Depth=1
	ldr	x8, [x21, #136]
	mov	w1, w20
	mov	x0, x21
	ldr	x22, [x8, #24]
	bl	f2fs_grab_meta_page
	add	x26, x22, x24
	lsl	x8, x0, #6
	orr	x27, x8, #0xffffffc000000000
	mov	x25, x0
	mov	x0, x27
	mov	w1, wzr
	ldr	x22, [x26, #32]
	mov	w2, #4096
	bl	memset
	mov	x0, x26
	bl	mutex_lock
	add	x28, x26, #40           // =40
	mov	x0, x28
	bl	down_read
	ldr	x1, [x26, #88]
	add	x0, x27, #3584          // =3584
	mov	w2, #507
	bl	memcpy
	mov	x0, x28
	bl	up_read
	mov	x0, x27
	mov	x1, x22
	mov	w2, #3584
	bl	memcpy
	add	x0, x27, #4091          // =4091
	add	x1, x22, #4091          // =4091
	mov	w2, #5
	bl	memcpy
	mov	x0, x26
	bl	mutex_unlock
	mov	x0, x25
	bl	set_page_dirty
	cbz	x25, .LBB82_2
// %bb.4:                               //   in Loop: Header=BB82_3 Depth=1
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
	b.ne	.LBB82_20
// %bb.5:                               //   in Loop: Header=BB82_3 Depth=1
	tbnz	w8, #0, .LBB82_19
// %bb.6:                               //   in Loop: Header=BB82_3 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB82_9
// %bb.7:                               //   in Loop: Header=BB82_3 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB82_9
// %bb.8:                               //   in Loop: Header=BB82_3 Depth=1
	adrp	x22, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x22, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB82_9:                               //   in Loop: Header=BB82_3 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB82_11
// %bb.10:                              //   in Loop: Header=BB82_3 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB82_28
.LBB82_11:                              //   in Loop: Header=BB82_3 Depth=1
	ldr	x0, [x25, #24]
.LBB82_12:                              //   in Loop: Header=BB82_3 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB82_14
// %bb.13:                              //   in Loop: Header=BB82_3 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB82_29
.LBB82_14:                              //   in Loop: Header=BB82_3 Depth=1
	ldr	x0, [x25, #24]
.LBB82_15:                              //   in Loop: Header=BB82_3 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB82_17
// %bb.16:                              //   in Loop: Header=BB82_3 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB82_30
.LBB82_17:                              //   in Loop: Header=BB82_3 Depth=1
	ldr	x0, [x25, #24]
.LBB82_18:                              //   in Loop: Header=BB82_3 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB82_19:                              //   in Loop: Header=BB82_3 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB82_26
	b	.LBB82_32
.LBB82_20:                              //   in Loop: Header=BB82_3 Depth=1
	tbnz	w8, #0, .LBB82_25
// %bb.21:                              //   in Loop: Header=BB82_3 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB82_24
// %bb.22:                              //   in Loop: Header=BB82_3 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB82_24
// %bb.23:                              //   in Loop: Header=BB82_3 Depth=1
	adrp	x22, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x22, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB82_24:                              //   in Loop: Header=BB82_3 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB82_25:                              //   in Loop: Header=BB82_3 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB82_33
.LBB82_26:                              //   in Loop: Header=BB82_3 Depth=1
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
	cbnz	w9, .LBB82_2
// %bb.27:                              //   in Loop: Header=BB82_3 Depth=1
	bl	__put_page
	b	.LBB82_2
.LBB82_28:                              //   in Loop: Header=BB82_3 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB82_12
.LBB82_29:                              //   in Loop: Header=BB82_3 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB82_15
.LBB82_30:                              //   in Loop: Header=BB82_3 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB82_18
.LBB82_31:
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB82_32:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB82_33:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end82:
	.size	write_normal_summaries, .Lfunc_end82-write_normal_summaries
                                        // -- End function
	.globl	f2fs_write_node_summaries // -- Begin function f2fs_write_node_summaries
	.p2align	3
	.type	f2fs_write_node_summaries,@function
f2fs_write_node_summaries:              // @f2fs_write_node_summaries
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	w2, #3
	mov	x29, sp
	bl	write_normal_summaries
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end83:
	.size	f2fs_write_node_summaries, .Lfunc_end83-f2fs_write_node_summaries
                                        // -- End function
	.globl	f2fs_lookup_journal_in_cursum // -- Begin function f2fs_lookup_journal_in_cursum
	.p2align	3
	.type	f2fs_lookup_journal_in_cursum,@function
f2fs_lookup_journal_in_cursum:          // @f2fs_lookup_journal_in_cursum
// %bb.0:
	cbz	w1, .LBB84_8
// %bb.1:
	cmp	w1, #1                  // =1
	b.ne	.LBB84_17
// %bb.2:
	ldrh	w9, [x0]
	cbz	w9, .LBB84_6
// %bb.3:
	mov	w8, wzr
	add	x10, x0, #2             // =2
	mov	w11, #78
.LBB84_4:                               // =>This Inner Loop Header: Depth=1
	smull	x12, w8, w11
	ldr	w12, [x10, x12]
	cmp	w12, w2
	b.eq	.LBB84_16
// %bb.5:                               //   in Loop: Header=BB84_4 Depth=1
	add	w8, w8, #1              // =1
	cmp	w8, w9
	b.ne	.LBB84_4
.LBB84_6:
	cbz	w3, .LBB84_17
// %bb.7:
	adrp	x8, write_opt
	mov	w10, #6
	ldr	w8, [x8, :lo12:write_opt]
	cmp	w8, #0                  // =0
	mov	w8, #58
	b	.LBB84_14
.LBB84_8:
	ldrh	w9, [x0]
	cbz	w9, .LBB84_12
// %bb.9:
	mov	w8, wzr
	mov	w10, #13
.LBB84_10:                              // =>This Inner Loop Header: Depth=1
	smaddl	x11, w8, w10, x0
	ldur	w11, [x11, #2]
	cmp	w11, w2
	b.eq	.LBB84_16
// %bb.11:                              //   in Loop: Header=BB84_10 Depth=1
	add	w8, w8, #1              // =1
	cmp	w8, w9
	b.ne	.LBB84_10
.LBB84_12:
	cbz	w3, .LBB84_17
// %bb.13:
	adrp	x8, write_opt
	mov	w10, #38
	ldr	w8, [x8, :lo12:write_opt]
	cmp	w8, #0                  // =0
	mov	w8, #353
.LBB84_14:
	csel	w8, w10, w8, eq
	cmp	w8, w9
	b.ls	.LBB84_17
// %bb.15:
	add	w10, w9, #1             // =1
	mov	w8, w9
	strh	w10, [x0]
.LBB84_16:
	mov	w0, w8
	ret
.LBB84_17:
	mov	w0, #-1
	ret
.Lfunc_end84:
	.size	f2fs_lookup_journal_in_cursum, .Lfunc_end84-f2fs_lookup_journal_in_cursum
                                        // -- End function
	.globl	f2fs_flush_sit_entries  // -- Begin function f2fs_flush_sit_entries
	.p2align	3
	.type	f2fs_flush_sit_entries,@function
f2fs_flush_sit_entries:                 // @f2fs_flush_sit_entries
// %bb.0:
	sub	sp, sp, #240            // =240
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	add	x29, sp, #144           // =144
	stp	x28, x27, [sp, #160]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #176]    // 16-byte Folded Spill
	mov	x26, x1
	stp	x24, x23, [sp, #192]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #208]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #224]    // 16-byte Folded Spill
	mov	x19, x0
	ldr	x23, [x0, #136]
	ldr	x21, [x23]
	ldr	x20, [x23, #24]
	ldr	x8, [x21, #72]
	stur	x8, [x29, #-40]         // 8-byte Folded Spill
	ldr	x8, [x20, #328]
	stur	x8, [x29, #-56]         // 8-byte Folded Spill
	ldr	x22, [x0, #80]
	add	x0, x21, #88            // =88
	str	x0, [sp]                // 8-byte Folded Spill
	tst	x22, #0x2000
	cset	w8, eq
	stur	w8, [x29, #-12]         // 4-byte Folded Spill
	bl	down_write
	ldr	w8, [x21, #80]
	cbz	w8, .LBB85_134
// %bb.1:
	ldr	x25, [x19, #136]
	mov	x2, xzr
	str	x21, [sp, #24]          // 8-byte Folded Spill
	add	x27, x23, #120          // =120
	ldr	x8, [x25]
	ldr	w1, [x25, #96]
	ldr	x21, [x8, #72]
	mov	x0, x21
	bl	find_next_bit
	ldr	x8, [x19, #136]
	mov	x24, x0
	ldr	w9, [x8, #96]
	cmp	w9, w24
	b.ls	.LBB85_4
// %bb.2:
	add	x23, x25, #120          // =120
.LBB85_3:                               // =>This Inner Loop Header: Depth=1
	mov	w0, w24
	mov	x1, x23
	bl	add_sit_entry
	ldr	x8, [x19, #136]
	add	w2, w24, #1             // =1
	mov	x0, x21
	ldr	w1, [x8, #96]
	bl	find_next_bit
	ldr	x8, [x19, #136]
	mov	x24, x0
	ldr	w9, [x8, #96]
	cmp	w9, w24
	b.hi	.LBB85_3
.LBB85_4:
	adrp	x9, write_opt
	mov	w10, #58
	ldr	x23, [sp, #24]          // 8-byte Folded Reload
	stur	x26, [x29, #-48]        // 8-byte Folded Spill
	ldr	w9, [x9, :lo12:write_opt]
	cmp	w9, #0                  // =0
	mov	w9, #6
	csel	w9, w9, w10, eq
	tbnz	w22, #13, .LBB85_6
// %bb.5:
	ldur	x10, [x29, #-56]        // 8-byte Folded Reload
	ldr	w11, [x23, #80]
	ldrh	w10, [x10]
	sub	w9, w9, w10
	cmp	w9, w11
	b.ge	.LBB85_17
.LBB85_6:
	ldr	x8, [x8, #24]
	add	x21, x8, #280           // =280
	ldr	x22, [x8, #328]
	mov	x0, x21
	bl	down_write
	ldrh	w8, [x22]
	cbz	w8, .LBB85_15
// %bb.7:
	adrp	x23, .L.str.41
	mov	x24, xzr
	add	x25, x22, #2            // =2
	mov	w26, #1
	add	x23, x23, :lo12:.L.str.41
	b	.LBB85_11
.LBB85_8:                               //   in Loop: Header=BB85_11 Depth=1
	ldrb	w9, [x19, #3292]
	cbz	w9, .LBB85_12
// %bb.9:                               //   in Loop: Header=BB85_11 Depth=1
	mov	x0, x19
	mov	x1, x23
	bl	f2fs_printk
.LBB85_10:                              //   in Loop: Header=BB85_11 Depth=1
	ldrh	w8, [x22]
	add	x24, x24, #1            // =1
	add	x25, x25, #78           // =78
	cmp	x24, x8
	b.hs	.LBB85_14
.LBB85_11:                              // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #136]
	ldr	w2, [x25]
	ldr	w3, [x8, #96]
	cmp	w2, w3
	b.hs	.LBB85_8
.LBB85_12:                              //   in Loop: Header=BB85_11 Depth=1
	ldr	x8, [x8]
	add	w10, w2, #63            // =63
	cmp	w2, #0                  // =0
	csel	w10, w10, w2, lt
	asr	w11, w10, #6
	and	w10, w10, #0xffffffc0
	ldr	x9, [x8, #72]
	sbfiz	x11, x11, #3, #32
	sub	w10, w2, w10
	ldr	x12, [x9, x11]
	lsl	x10, x26, x10
	orr	x13, x12, x10
	tst	x12, x10
	str	x13, [x9, x11]
	b.ne	.LBB85_10
// %bb.13:                              //   in Loop: Header=BB85_11 Depth=1
	ldr	w9, [x8, #80]
	mov	w0, w2
	add	w9, w9, #1              // =1
	str	w9, [x8, #80]
	ldr	x8, [x19, #136]
	add	x1, x8, #120            // =120
	bl	add_sit_entry
	b	.LBB85_10
.LBB85_14:
	ldur	x26, [x29, #-48]        // 8-byte Folded Reload
	ldr	x23, [sp, #24]          // 8-byte Folded Reload
	b	.LBB85_16
.LBB85_15:
	mov	w24, wzr
.LBB85_16:
	sub	w8, w8, w24
	mov	x0, x21
	strh	w8, [x22]
	bl	up_write
.LBB85_17:
	ldr	x22, [x27]
	cmp	x22, x27
	b.eq	.LBB85_131
// %bb.18:
	add	x8, x20, #280           // =280
	str	x27, [sp, #32]          // 8-byte Folded Spill
	str	x8, [sp, #8]            // 8-byte Folded Spill
	ldur	x8, [x29, #-56]         // 8-byte Folded Reload
	add	x20, x8, #2             // =2
	str	x20, [sp, #16]          // 8-byte Folded Spill
	b	.LBB85_20
.LBB85_19:                              //   in Loop: Header=BB85_20 Depth=1
	mov	x9, #256
	mov	x1, x22
	movk	x9, #57005, lsl #48
	add	x8, x9, #256            // =256
	stp	x9, x8, [x22]
	adrp	x8, sit_entry_set_slab
	ldr	x0, [x8, :lo12:sit_entry_set_slab]
	bl	kmem_cache_free
	ldr	x8, [sp, #64]           // 8-byte Folded Reload
	mov	x22, x8
	cmp	x8, x27
	b.eq	.LBB85_131
.LBB85_20:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB85_41 Depth 2
                                        //     Child Loop BB85_47 Depth 2
                                        //       Child Loop BB85_59 Depth 3
                                        //       Child Loop BB85_71 Depth 3
                                        //       Child Loop BB85_55 Depth 3
	ldr	x8, [x19, #136]
	ldr	w27, [x22, #16]
	ldr	x24, [x22]
	ldr	w9, [x8, #96]
	add	x25, x27, #55           // =55
	str	x24, [sp, #64]          // 8-byte Folded Spill
	cmp	x25, x9
	csel	x9, x25, x9, lo
	stp	x22, x9, [x29, #-32]    // 16-byte Folded Spill
	ldur	w9, [x29, #-12]         // 4-byte Folded Reload
	tbnz	w9, #0, .LBB85_23
.LBB85_21:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	x20, [x8]
	ldr	w23, [x20, #8]
	cbz	x8, .LBB85_25
// %bb.22:                              //   in Loop: Header=BB85_20 Depth=1
	add	x9, x8, #92             // =92
	b	.LBB85_26
.LBB85_23:                              //   in Loop: Header=BB85_20 Depth=1
	adrp	x9, write_opt
	ldur	x10, [x29, #-56]        // 8-byte Folded Reload
	ldr	w11, [x22, #20]
	mov	w12, #6
	ldr	w9, [x9, :lo12:write_opt]
	ldrh	w10, [x10]
	cmp	w9, #0                  // =0
	mov	w9, #58
	csel	w9, w12, w9, eq
	sub	w9, w9, w10
	cmp	w9, w11
	b.ge	.LBB85_29
// %bb.24:                              //   in Loop: Header=BB85_20 Depth=1
	stur	wzr, [x29, #-12]        // 4-byte Folded Spill
	b	.LBB85_21
.LBB85_25:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	x9, [x19, #16]
	add	x9, x9, #48             // =48
.LBB85_26:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	w9, [x9]
	sub	w9, w9, #1              // =1
	cmp	w9, w27
	b.lo	.LBB85_30
// %bb.27:                              //   in Loop: Header=BB85_20 Depth=1
	cbz	x8, .LBB85_34
.LBB85_28:                              //   in Loop: Header=BB85_20 Depth=1
	add	x9, x8, #92             // =92
	b	.LBB85_35
.LBB85_29:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	bl	down_write
	stur	xzr, [x29, #-64]        // 8-byte Folded Spill
	str	xzr, [sp, #72]          // 8-byte Folded Spill
	b	.LBB85_43
.LBB85_30:                              //   in Loop: Header=BB85_20 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB85_33
// %bb.31:                              //   in Loop: Header=BB85_20 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB85_33
// %bb.32:                              //   in Loop: Header=BB85_20 Depth=1
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.check_seg_range
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.check_seg_range
	mov	w3, #1247
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB85_33:                              //   in Loop: Header=BB85_20 Depth=1
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	x8, [x19, #136]
	cbnz	x8, .LBB85_28
.LBB85_34:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	x9, [x19, #16]
	add	x9, x9, #48             // =48
.LBB85_35:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	w9, [x9]
	sub	w9, w9, #1              // =1
	cmp	w9, w27
	b.lo	.LBB85_184
// %bb.36:                              //   in Loop: Header=BB85_20 Depth=1
	mov	w9, #4767
	mov	w13, #1
	movk	w9, #10724, lsl #16
	ldp	x11, x12, [x20, #32]
	mul	x9, x27, x9
	lsr	x9, x9, #32
	sub	w10, w27, w9
	add	w9, w9, w10, lsr #1
	lsr	w9, w9, #5
	lsr	x14, x9, #3
	mvn	w10, w9
	ldrb	w11, [x11, x14]
	and	w10, w10, #0x7
	ldrb	w12, [x12, x14]
	lsl	w13, w13, w10
	and	w10, w13, w11
	and	w11, w13, w12
	cmp	w10, w11
	b.ne	.LBB85_185
// %bb.37:                              //   in Loop: Header=BB85_20 Depth=1
	add	w9, w23, w9
	stp	x14, x20, [sp, #48]     // 16-byte Folded Spill
	str	w13, [sp, #44]          // 4-byte Folded Spill
	cbz	w10, .LBB85_39
// %bb.38:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	w10, [x20, #12]
	add	w9, w10, w9
.LBB85_39:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	x8, [x8]
	mov	w9, w9
	mov	x0, x19
	ldp	w10, w8, [x8, #8]
	sub	x10, x9, x10
	cmp	x10, x8
	cneg	x8, x8, hs
	add	x1, x8, x9
	bl	f2fs_grab_meta_page
	ldr	x8, [x19, #136]
	lsl	x9, x0, #6
	orr	x28, x9, #0xffffffc000000000
	str	x0, [sp, #72]           // 8-byte Folded Spill
	mov	x0, x28
	mov	w1, wzr
	mov	w2, #4096
	ldr	w8, [x8, #96]
	cmp	x25, x8
	csel	w21, w25, w8, lo
	bl	memset
	subs	w8, w21, w27
	mov	w10, #48
	mov	w24, #74
	mov	x20, #4294967296
	b.eq	.LBB85_42
// %bb.40:                              //   in Loop: Header=BB85_20 Depth=1
	mov	x22, xzr
	mov	x25, xzr
	mov	w21, w8
.LBB85_41:                              //   Parent Loop BB85_20 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x8, [x19, #136]
	add	w9, w27, w25
	mov	w2, #64
	ldr	x8, [x8]
	ldr	x8, [x8, #136]
	umaddl	x23, w9, w10, x8
	asr	x9, x22, #32
	madd	x26, x9, x24, x28
	add	x0, x26, #2             // =2
	ldr	w8, [x23]
	lsl	w9, w8, #10
	bfxil	w9, w8, #6, #10
	strh	w9, [x26]
	ldr	x1, [x23, #8]
	bl	memcpy
	ldr	x8, [x23, #40]
	mov	w10, #48
	add	x25, x25, #1            // =1
	add	x22, x22, x20
	cmp	x25, x21
	stur	x8, [x26, #66]
	b.lo	.LBB85_41
.LBB85_42:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	x0, [sp, #72]           // 8-byte Folded Reload
	stur	x28, [x29, #-64]        // 8-byte Folded Spill
	bl	set_page_dirty
	ldp	x11, x10, [sp, #48]     // 16-byte Folded Reload
	ldr	w12, [sp, #44]          // 4-byte Folded Reload
	ldur	x26, [x29, #-48]        // 8-byte Folded Reload
	ldr	x8, [x10, #32]
	ldur	x22, [x29, #-32]        // 8-byte Folded Reload
	ldrb	w9, [x8, x11]
	eor	w9, w9, w12
	strb	w9, [x8, x11]
	ldr	x8, [x10, #40]
	ldrb	w9, [x8, x11]
	eor	w9, w9, w12
	strb	w9, [x8, x11]
	ldp	x20, x23, [sp, #16]     // 16-byte Folded Reload
.LBB85_43:                              //   in Loop: Header=BB85_20 Depth=1
	ldur	x21, [x29, #-24]        // 8-byte Folded Reload
	mov	x2, x27
	ldur	x0, [x29, #-40]         // 8-byte Folded Reload
	mov	x1, x21
	b	.LBB85_47
.LBB85_44:                              //   in Loop: Header=BB85_47 Depth=2
	ldr	x8, [x19, #16]
	add	x8, x8, #48             // =48
.LBB85_45:                              //   in Loop: Header=BB85_47 Depth=2
	ldr	w8, [x8]
	sub	w8, w8, #1              // =1
	cmp	w8, w28
	b.lo	.LBB85_81
.LBB85_46:                              //   in Loop: Header=BB85_47 Depth=2
	add	w8, w28, #63            // =63
	cmp	w28, #0                 // =0
	csel	w8, w8, w28, lt
	ldur	x0, [x29, #-40]         // 8-byte Folded Reload
	asr	w9, w8, #6
	and	w8, w8, #0xffffffc0
	sbfiz	x9, x9, #3, #32
	sub	w8, w28, w8
	mov	w11, #1
	ldur	x21, [x29, #-24]        // 8-byte Folded Reload
	ldr	x10, [x0, x9]
	add	w2, w28, #1             // =1
	lsl	x8, x11, x8
	mov	x1, x21
	bic	x8, x10, x8
	str	x8, [x0, x9]
	ldr	w8, [x23, #80]
	sub	w8, w8, #1              // =1
	str	w8, [x23, #80]
	ldr	w8, [x22, #20]
	sub	w8, w8, #1              // =1
	str	w8, [x22, #20]
.LBB85_47:                              //   Parent Loop BB85_20 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB85_59 Depth 3
                                        //       Child Loop BB85_71 Depth 3
                                        //       Child Loop BB85_55 Depth 3
	bl	find_next_bit
	mov	x28, x0
	cmp	w28, w21
	b.hs	.LBB85_94
// %bb.48:                              //   in Loop: Header=BB85_47 Depth=2
	ldr	x8, [x19, #136]
	and	x24, x28, #0xffffffff
	mov	w2, #64
	ldr	x8, [x8]
	ldr	x21, [x8, #136]
	mov	w8, #48
	madd	x27, x24, x8, x21
	mov	x25, x27
	ldr	x0, [x25, #8]!
	ldr	x1, [x27, #16]
	bl	memcmp
	cbnz	w0, .LBB85_176
// %bb.49:                              //   in Loop: Header=BB85_47 Depth=2
	ldrb	w8, [x26]
	tbnz	w8, #4, .LBB85_51
// %bb.50:                              //   in Loop: Header=BB85_47 Depth=2
	mov	x0, x19
	mov	x1, x26
	mov	w2, wzr
	str	x24, [x26, #8]
	bl	add_discard_addrs
.LBB85_51:                              //   in Loop: Header=BB85_47 Depth=2
	ldur	w8, [x29, #-12]         // 4-byte Folded Reload
	tbnz	w8, #0, .LBB85_57
// %bb.52:                              //   in Loop: Header=BB85_47 Depth=2
	ldr	w8, [x23, #84]
	mov	w10, #74
	ldur	x11, [x29, #-64]        // 8-byte Folded Reload
	mov	w2, #64
	mov	w26, #48
	udiv	w9, w28, w8
	msub	w8, w9, w8, w28
	ldr	w9, [x27]
	smaddl	x22, w8, w10, x11
	lsl	w8, w9, #10
	bfxil	w8, w9, #6, #10
	strh	w8, [x22]
	ldr	x1, [x25]
	add	x25, x22, #2            // =2
	mov	x0, x25
	bl	memcpy
	madd	x8, x24, x26, x21
	mov	x1, x25
	mov	w2, #64
	ldr	x9, [x8, #40]
	stur	x9, [x22, #66]
	ldr	x0, [x8, #24]
	bl	memcpy
	ldr	w8, [x27]
	mov	w21, wzr
	mov	w0, wzr
	lsr	w9, w8, #6
	bfi	w8, w9, #16, #10
	str	w8, [x27]
	ldur	x9, [x22, #2]
	ldr	w8, [x19, #1188]
	and	w24, w9, #0x1
	b	.LBB85_55
.LBB85_53:                              //   in Loop: Header=BB85_55 Depth=3
	mov	x2, x27
	bl	find_next_bit
.LBB85_54:                              //   in Loop: Header=BB85_55 Depth=3
	ldr	w8, [x19, #1188]
	eor	w24, w24, #0x1
	cmp	w0, w8
	b.hs	.LBB85_63
.LBB85_55:                              //   Parent Loop BB85_20 Depth=1
                                        //     Parent Loop BB85_47 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	w1, w8
	sxtw	x27, w0
	mov	x0, x25
	tbz	w24, #0, .LBB85_53
// %bb.56:                              //   in Loop: Header=BB85_55 Depth=3
	mov	x2, x27
	bl	find_next_zero_bit
	sub	w8, w21, w27
	add	w21, w8, w0
	b	.LBB85_54
.LBB85_57:                              //   in Loop: Header=BB85_47 Depth=2
	ldur	x8, [x29, #-56]         // 8-byte Folded Reload
	mov	w11, #78
	ldrh	w8, [x8]
	cbz	w8, .LBB85_61
// %bb.58:                              //   in Loop: Header=BB85_47 Depth=2
	mov	w9, wzr
.LBB85_59:                              //   Parent Loop BB85_20 Depth=1
                                        //     Parent Loop BB85_47 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	smull	x10, w9, w11
	ldr	w10, [x20, x10]
	cmp	w10, w28
	b.eq	.LBB85_67
// %bb.60:                              //   in Loop: Header=BB85_59 Depth=3
	add	w9, w9, #1              // =1
	cmp	w9, w8
	b.ne	.LBB85_59
.LBB85_61:                              //   in Loop: Header=BB85_47 Depth=2
	adrp	x9, write_opt
	mov	w26, #48
	mov	w10, #6
	ldr	w9, [x9, :lo12:write_opt]
	cmp	w9, #0                  // =0
	mov	w9, #58
	csel	w9, w10, w9, eq
	cmp	w9, w8
	b.ls	.LBB85_180
// %bb.62:                              //   in Loop: Header=BB85_47 Depth=2
	add	w10, w8, #1             // =1
	mov	w9, w8
	ldur	x8, [x29, #-56]         // 8-byte Folded Reload
	strh	w10, [x8]
	b	.LBB85_68
.LBB85_63:                              //   in Loop: Header=BB85_47 Depth=2
	ldrh	w9, [x22]
	and	w2, w9, #0x3ff
	cmp	w21, w2
	b.ne	.LBB85_86
// %bb.64:                              //   in Loop: Header=BB85_47 Depth=2
	ldur	x22, [x29, #-32]        // 8-byte Folded Reload
	cmp	w8, w21
	ldur	x26, [x29, #-48]        // 8-byte Folded Reload
	b.lo	.LBB85_81
// %bb.65:                              //   in Loop: Header=BB85_47 Depth=2
	ldr	x8, [x19, #136]
	cbz	x8, .LBB85_44
// %bb.66:                              //   in Loop: Header=BB85_47 Depth=2
	add	x8, x8, #92             // =92
	b	.LBB85_45
.LBB85_67:                              //   in Loop: Header=BB85_47 Depth=2
	mov	w26, #48
	tbnz	w9, #31, .LBB85_180
.LBB85_68:                              //   in Loop: Header=BB85_47 Depth=2
	umaddl	x22, w9, w11, x20
	mov	w2, #64
	str	w28, [x22]
	ldr	w8, [x27]
	lsl	w9, w8, #10
	bfxil	w9, w8, #6, #10
	strh	w9, [x22, #4]!
	ldr	x1, [x25]
	add	x25, x22, #2            // =2
	mov	x0, x25
	bl	memcpy
	madd	x8, x24, x26, x21
	mov	x1, x25
	mov	w2, #64
	ldr	x9, [x8, #40]
	stur	x9, [x22, #66]
	ldr	x0, [x8, #24]
	bl	memcpy
	ldr	w8, [x27]
	mov	w21, wzr
	mov	w0, wzr
	lsr	w9, w8, #6
	bfi	w8, w9, #16, #10
	str	w8, [x27]
	ldur	x9, [x22, #2]
	ldr	w8, [x19, #1188]
	ldur	x26, [x29, #-48]        // 8-byte Folded Reload
	and	w24, w9, #0x1
	b	.LBB85_71
.LBB85_69:                              //   in Loop: Header=BB85_71 Depth=3
	mov	x2, x27
	bl	find_next_bit
.LBB85_70:                              //   in Loop: Header=BB85_71 Depth=3
	ldr	w8, [x19, #1188]
	eor	w24, w24, #0x1
	cmp	w0, w8
	b.hs	.LBB85_73
.LBB85_71:                              //   Parent Loop BB85_20 Depth=1
                                        //     Parent Loop BB85_47 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	w1, w8
	sxtw	x27, w0
	mov	x0, x25
	tbz	w24, #0, .LBB85_69
// %bb.72:                              //   in Loop: Header=BB85_71 Depth=3
	mov	x2, x27
	bl	find_next_zero_bit
	sub	w8, w21, w27
	add	w21, w8, w0
	b	.LBB85_70
.LBB85_73:                              //   in Loop: Header=BB85_47 Depth=2
	ldrh	w9, [x22]
	and	w2, w9, #0x3ff
	cmp	w21, w2
	b.ne	.LBB85_88
// %bb.74:                              //   in Loop: Header=BB85_47 Depth=2
	ldur	x22, [x29, #-32]        // 8-byte Folded Reload
	cmp	w8, w21
	b.lo	.LBB85_79
// %bb.75:                              //   in Loop: Header=BB85_47 Depth=2
	ldr	x8, [x19, #136]
	cbz	x8, .LBB85_77
// %bb.76:                              //   in Loop: Header=BB85_47 Depth=2
	add	x8, x8, #92             // =92
	b	.LBB85_78
.LBB85_77:                              //   in Loop: Header=BB85_47 Depth=2
	ldr	x8, [x19, #16]
	add	x8, x8, #48             // =48
.LBB85_78:                              //   in Loop: Header=BB85_47 Depth=2
	ldr	w8, [x8]
	sub	w8, w8, #1              // =1
	cmp	w8, w28
	b.hs	.LBB85_46
.LBB85_79:                              //   in Loop: Header=BB85_47 Depth=2
	adrp	x1, .L.str.44
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.44
	mov	w2, w21
	mov	w3, w28
	bl	f2fs_printk
	cbz	x19, .LBB85_83
// %bb.80:                              //   in Loop: Header=BB85_47 Depth=2
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB85_83
.LBB85_81:                              //   in Loop: Header=BB85_47 Depth=2
	adrp	x1, .L.str.44
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.44
	mov	w2, w21
	mov	w3, w28
	bl	f2fs_printk
	cbz	x19, .LBB85_83
// %bb.82:                              //   in Loop: Header=BB85_47 Depth=2
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB85_83:                              //   in Loop: Header=BB85_47 Depth=2
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB85_46
// %bb.84:                              //   in Loop: Header=BB85_47 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB85_46
// %bb.85:                              //   in Loop: Header=BB85_47 Depth=2
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.43
	adrp	x2, .L__func__.check_block_count
	add	x1, x1, :lo12:.L.str.43
	add	x2, x2, :lo12:.L__func__.check_block_count
	mov	w3, #1300
	b	.LBB85_93
.LBB85_86:                              //   in Loop: Header=BB85_47 Depth=2
	adrp	x1, .L.str.42
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.42
	mov	w3, w21
	bl	f2fs_printk
	ldur	x22, [x29, #-32]        // 8-byte Folded Reload
	ldur	x26, [x29, #-48]        // 8-byte Folded Reload
	cbz	x19, .LBB85_90
// %bb.87:                              //   in Loop: Header=BB85_47 Depth=2
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB85_90
.LBB85_88:                              //   in Loop: Header=BB85_47 Depth=2
	adrp	x1, .L.str.42
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.42
	mov	w3, w21
	bl	f2fs_printk
	ldur	x22, [x29, #-32]        // 8-byte Folded Reload
	cbz	x19, .LBB85_90
// %bb.89:                              //   in Loop: Header=BB85_47 Depth=2
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB85_90:                              //   in Loop: Header=BB85_47 Depth=2
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB85_46
// %bb.91:                              //   in Loop: Header=BB85_47 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB85_46
// %bb.92:                              //   in Loop: Header=BB85_47 Depth=2
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.43
	adrp	x2, .L__func__.check_block_count
	add	x1, x1, :lo12:.L.str.43
	add	x2, x2, :lo12:.L__func__.check_block_count
	mov	w3, #1290
.LBB85_93:                              //   in Loop: Header=BB85_47 Depth=2
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	mov	w8, #15241
	ldr	x0, [x21, :lo12:f2fs_dclient]
	movk	w8, #14160, lsl #16
	add	w1, w8, #3              // =3
	bl	dsm_client_notify
	b	.LBB85_46
.LBB85_94:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	x27, [sp, #32]          // 8-byte Folded Reload
	ldur	w8, [x29, #-12]         // 4-byte Folded Reload
	tbnz	w8, #0, .LBB85_112
// %bb.95:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	x24, [sp, #72]          // 8-byte Folded Reload
	cbz	x24, .LBB85_121
// %bb.96:                              //   in Loop: Header=BB85_20 Depth=1
	ldr	x8, [x24, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x24, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x24, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB85_113
// %bb.97:                              //   in Loop: Header=BB85_20 Depth=1
	tbnz	w8, #0, .LBB85_111
// %bb.98:                              //   in Loop: Header=BB85_20 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB85_101
// %bb.99:                              //   in Loop: Header=BB85_20 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB85_101
// %bb.100:                             //   in Loop: Header=BB85_20 Depth=1
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB85_101:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB85_103
// %bb.102:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB85_128
.LBB85_103:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x0, [x24, #24]
.LBB85_104:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB85_106
// %bb.105:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB85_129
.LBB85_106:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x0, [x24, #24]
.LBB85_107:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB85_109
// %bb.108:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB85_130
.LBB85_109:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x0, [x24, #24]
.LBB85_110:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB85_111:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB85_119
	b	.LBB85_189
.LBB85_112:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	bl	up_write
	b	.LBB85_121
.LBB85_113:                             //   in Loop: Header=BB85_20 Depth=1
	tbnz	w8, #0, .LBB85_118
// %bb.114:                             //   in Loop: Header=BB85_20 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB85_117
// %bb.115:                             //   in Loop: Header=BB85_20 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB85_117
// %bb.116:                             //   in Loop: Header=BB85_20 Depth=1
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB85_117:                             //   in Loop: Header=BB85_20 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB85_118:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB85_190
.LBB85_119:                             //   in Loop: Header=BB85_20 Depth=1
	mov	x0, x24
	bl	unlock_page
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x24, x9, eq
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
	cbnz	w9, .LBB85_121
// %bb.120:                             //   in Loop: Header=BB85_20 Depth=1
	bl	__put_page
.LBB85_121:                             //   in Loop: Header=BB85_20 Depth=1
	ldr	w8, [x22, #20]
	cbnz	w8, .LBB85_124
.LBB85_122:                             //   in Loop: Header=BB85_20 Depth=1
	mov	x0, x22
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB85_19
// %bb.123:                             //   in Loop: Header=BB85_20 Depth=1
	ldp	x9, x8, [x22]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB85_19
.LBB85_124:                             //   in Loop: Header=BB85_20 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB85_127
// %bb.125:                             //   in Loop: Header=BB85_20 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB85_127
// %bb.126:                             //   in Loop: Header=BB85_20 Depth=1
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_flush_sit_entries
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_flush_sit_entries
	mov	w3, #6442
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB85_127:                             //   in Loop: Header=BB85_20 Depth=1
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	w8, [x22, #20]
	cbz	w8, .LBB85_122
	b	.LBB85_191
.LBB85_128:                             //   in Loop: Header=BB85_20 Depth=1
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB85_104
.LBB85_129:                             //   in Loop: Header=BB85_20 Depth=1
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB85_107
.LBB85_130:                             //   in Loop: Header=BB85_20 Depth=1
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB85_110
.LBB85_131:
	ldr	x8, [x27]
	cmp	x27, x8
	b.ne	.LBB85_167
.LBB85_132:
	ldr	x8, [x27]
	cmp	x27, x8
	b.ne	.LBB85_192
// %bb.133:
	ldr	w8, [x23, #80]
	cbnz	w8, .LBB85_171
.LBB85_134:
	ldrb	w8, [x26]
	tbz	w8, #4, .LBB85_138
// %bb.135:
	ldp	x20, x8, [x26, #8]
	cmp	x20, x8
	b.hi	.LBB85_137
.LBB85_136:                             // =>This Inner Loop Header: Depth=1
	mov	x0, x19
	mov	x1, x26
	mov	w2, wzr
	bl	add_discard_addrs
	ldp	x8, x9, [x26, #8]
	add	x8, x8, #1              // =1
	cmp	x8, x9
	str	x8, [x26, #8]
	b.ls	.LBB85_136
.LBB85_137:
	str	x20, [x26, #8]
.LBB85_138:
	ldr	x0, [sp]                // 8-byte Folded Reload
	bl	up_write
	ldr	x8, [x19, #136]
	ldr	x23, [x8, #16]
	add	x20, x23, #80           // =80
	mov	x0, x20
	bl	mutex_lock
	ldr	x8, [x19, #136]
	mov	x2, xzr
	ldr	x0, [x23, #64]
	ldr	w1, [x8, #96]
	bl	find_next_bit
	ldr	x8, [x19, #136]
	mov	x21, x0
	ldr	w9, [x8, #96]
	cmp	w9, w21
	b.ls	.LBB85_166
// %bb.139:
	mov	w24, #1
	b	.LBB85_141
.LBB85_140:                             //   in Loop: Header=BB85_141 Depth=1
	mov	x0, x22
	bl	_raw_spin_unlock
	ldr	x8, [x19, #136]
	add	w2, w21, #1             // =1
	ldr	x0, [x23, #64]
	ldr	w1, [x8, #96]
	bl	find_next_bit
	ldr	x8, [x19, #136]
	mov	x21, x0
	ldr	w9, [x8, #96]
	cmp	w9, w21
	b.ls	.LBB85_166
.LBB85_141:                             // =>This Inner Loop Header: Depth=1
	ldr	x25, [x8, #8]
	ldr	w26, [x19, #1192]
	add	x22, x25, #12           // =12
	mov	x0, x22
	bl	_raw_spin_lock
	ldr	x8, [x25, #16]
	ubfx	x10, x21, #6, #26
	ldr	x9, [x8, x10, lsl #3]
	stur	x9, [x29, #-8]
	lsl	x9, x24, x21
	ldur	x11, [x29, #-8]
	tst	x11, x9
	b.eq	.LBB85_140
// %bb.142:                             //   in Loop: Header=BB85_141 Depth=1
	add	x8, x8, x10, lsl #3
	//APP
	// atomic64_fetch_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x11, x10, x9
	stlxr	w12, x11, [x8]
	cbnz	w12, 1b
	dmb ish
	//NO_APP
	tst	x10, x9
	b.eq	.LBB85_140
// %bb.143:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w8, [x25, #4]
	udiv	w27, w21, w26
	add	w8, w8, #1              // =1
	str	w8, [x25, #4]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB85_151
// %bb.144:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB85_151
// %bb.145:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	x8, [x19, #3032]
	ldr	w9, [x8, #84]
	cmp	w9, w21
	b.hi	.LBB85_148
// %bb.146:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w9, [x8, #88]
	cmp	w9, w21
	b.lo	.LBB85_148
// %bb.147:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w9, [x8, #168]
	add	w9, w9, #1              // =1
	str	w9, [x8, #168]
	ldr	x8, [x19, #3032]
.LBB85_148:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w9, [x8, #276]
	cmp	w9, w21
	b.hi	.LBB85_151
// %bb.149:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w9, [x8, #280]
	cmp	w9, w21
	b.lo	.LBB85_151
// %bb.150:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w9, [x8, #360]
	add	w9, w9, #1              // =1
	str	w9, [x8, #360]
.LBB85_151:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	x8, [x19, #136]
	ldr	x9, [x8, #24]
	ldr	w8, [x19, #1192]
	ldr	w10, [x9, #100]
	udiv	w10, w10, w8
	cmp	w27, w10
	b.eq	.LBB85_140
// %bb.152:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w10, [x9, #220]
	udiv	w10, w10, w8
	cmp	w27, w10
	b.eq	.LBB85_140
// %bb.153:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w10, [x9, #340]
	udiv	w10, w10, w8
	cmp	w27, w10
	b.eq	.LBB85_140
// %bb.154:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w10, [x9, #460]
	udiv	w10, w10, w8
	cmp	w27, w10
	b.eq	.LBB85_140
// %bb.155:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w10, [x9, #580]
	udiv	w10, w10, w8
	cmp	w27, w10
	b.eq	.LBB85_140
// %bb.156:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w10, [x9, #700]
	udiv	w10, w10, w8
	cmp	w27, w10
	b.eq	.LBB85_140
// %bb.157:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w10, [x9, #820]
	udiv	w10, w10, w8
	cmp	w27, w10
	b.eq	.LBB85_140
// %bb.158:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w10, [x9, #940]
	udiv	w10, w10, w8
	cmp	w27, w10
	b.eq	.LBB85_140
// %bb.159:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w10, [x9, #1060]
	udiv	w10, w10, w8
	cmp	w27, w10
	b.eq	.LBB85_140
// %bb.160:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w10, [x9, #1180]
	udiv	w10, w10, w8
	cmp	w27, w10
	b.eq	.LBB85_140
// %bb.161:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w9, [x9, #1300]
	udiv	w9, w9, w8
	cmp	w27, w9
	b.eq	.LBB85_140
// %bb.162:                             //   in Loop: Header=BB85_141 Depth=1
	mul	w26, w27, w26
	ldr	x0, [x25, #16]
	add	w1, w8, w26
	mov	w2, w26
	bl	find_next_bit
	ldr	w8, [x19, #1192]
	add	w8, w8, w26
	cmp	w8, w0
	b.hi	.LBB85_140
// %bb.163:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	x8, [x25, #24]
	lsr	w10, w27, #6
	ldr	x9, [x8, w10, uxtw #3]
	stur	x9, [x29, #-8]
	lsl	x9, x24, x27
	ldur	x11, [x29, #-8]
	tst	x11, x9
	b.eq	.LBB85_140
// %bb.164:                             //   in Loop: Header=BB85_141 Depth=1
	add	x8, x8, x10, lsl #3
	//APP
	// atomic64_fetch_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x11, x10, x9
	stlxr	w12, x11, [x8]
	cbnz	w12, 1b
	dmb ish
	//NO_APP
	tst	x10, x9
	b.eq	.LBB85_140
// %bb.165:                             //   in Loop: Header=BB85_141 Depth=1
	ldr	w8, [x25, #8]
	add	w8, w8, #1              // =1
	str	w8, [x25, #8]
	b	.LBB85_140
.LBB85_166:
	mov	x0, x20
	bl	mutex_unlock
	ldp	x20, x19, [sp, #224]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #208]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #192]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #176]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #160]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	add	sp, sp, #240            // =240
	ret
.LBB85_167:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB85_170
// %bb.168:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB85_170
// %bb.169:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_flush_sit_entries
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #6446
	add	x2, x2, :lo12:.L__func__.f2fs_flush_sit_entries
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB85_170:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	b	.LBB85_132
.LBB85_171:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB85_174
// %bb.172:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB85_174
// %bb.173:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_flush_sit_entries
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #6447
	add	x2, x2, :lo12:.L__func__.f2fs_flush_sit_entries
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB85_174:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	ldr	w8, [x8, #80]
	cbz	w8, .LBB85_134
// %bb.175:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 6447; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB85_176:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB85_179
// %bb.177:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB85_179
// %bb.178:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_flush_sit_entries
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #6405
	add	x2, x2, :lo12:.L__func__.f2fs_flush_sit_entries
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB85_179:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 6405; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB85_180:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB85_183
// %bb.181:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB85_183
// %bb.182:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_flush_sit_entries
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #6417
	add	x2, x2, :lo12:.L__func__.f2fs_flush_sit_entries
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB85_183:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 6417; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB85_184:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.h"; .popsection; .long 14472b - 14470b; .short 1247; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB85_185:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB85_188
// %bb.186:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB85_188
// %bb.187:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.current_sit_addr
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #1318
	add	x2, x2, :lo12:.L__func__.current_sit_addr
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB85_188:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.h"; .popsection; .long 14472b - 14470b; .short 1318; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB85_189:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB85_190:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB85_191:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 6442; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB85_192:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 6446; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end85:
	.size	f2fs_flush_sit_entries, .Lfunc_end85-f2fs_flush_sit_entries
                                        // -- End function
	.globl	f2fs_fix_curseg_write_pointer // -- Begin function f2fs_fix_curseg_write_pointer
	.p2align	3
	.type	f2fs_fix_curseg_write_pointer,@function
f2fs_fix_curseg_write_pointer:          // @f2fs_fix_curseg_write_pointer
// %bb.0:
	mov	w0, wzr
	ret
.Lfunc_end86:
	.size	f2fs_fix_curseg_write_pointer, .Lfunc_end86-f2fs_fix_curseg_write_pointer
                                        // -- End function
	.globl	f2fs_check_write_pointer // -- Begin function f2fs_check_write_pointer
	.p2align	3
	.type	f2fs_check_write_pointer,@function
f2fs_check_write_pointer:               // @f2fs_check_write_pointer
// %bb.0:
	mov	w0, wzr
	ret
.Lfunc_end87:
	.size	f2fs_check_write_pointer, .Lfunc_end87-f2fs_check_write_pointer
                                        // -- End function
	.globl	f2fs_usable_blks_in_seg // -- Begin function f2fs_usable_blks_in_seg
	.p2align	3
	.type	f2fs_usable_blks_in_seg,@function
f2fs_usable_blks_in_seg:                // @f2fs_usable_blks_in_seg
// %bb.0:
	ldr	x8, [x0, #16]
	ldrb	w8, [x8, #2180]
	tbnz	w8, #1, .LBB88_2
// %bb.1:
	ldr	w0, [x0, #1188]
	ret
.LBB88_2:
	mov	w0, wzr
	ret
.Lfunc_end88:
	.size	f2fs_usable_blks_in_seg, .Lfunc_end88-f2fs_usable_blks_in_seg
                                        // -- End function
	.globl	f2fs_usable_segs_in_sec // -- Begin function f2fs_usable_segs_in_sec
	.p2align	3
	.type	f2fs_usable_segs_in_sec,@function
f2fs_usable_segs_in_sec:                // @f2fs_usable_segs_in_sec
// %bb.0:
	ldr	x8, [x0, #16]
	ldrb	w8, [x8, #2180]
	tbnz	w8, #1, .LBB89_2
// %bb.1:
	ldr	w0, [x0, #1192]
	ret
.LBB89_2:
	mov	w0, wzr
	ret
.Lfunc_end89:
	.size	f2fs_usable_segs_in_sec, .Lfunc_end89-f2fs_usable_segs_in_sec
                                        // -- End function
	.globl	f2fs_build_segment_manager // -- Begin function f2fs_build_segment_manager
	.p2align	3
	.type	f2fs_build_segment_manager,@function
f2fs_build_segment_manager:             // @f2fs_build_segment_manager
// %bb.0:
	sub	sp, sp, #256            // =256
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #160]    // 16-byte Folded Spill
	add	x29, sp, #160           // =160
	stp	x28, x27, [sp, #176]    // 16-byte Folded Spill
	mov	x28, x0
	stp	x26, x25, [sp, #192]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	w2, #176
	stp	x24, x23, [sp, #208]    // 16-byte Folded Spill
	adrp	x24, kmalloc_caches
	stp	x22, x21, [sp, #224]    // 16-byte Folded Spill
	add	x24, x24, :lo12:kmalloc_caches
	stp	x20, x19, [sp, #240]    // 16-byte Folded Spill
	mov	w23, #32960
	stur	x8, [x29, #-8]
	mov	x19, x0
	ldr	x20, [x28, #16]!
	ldr	x0, [x24, #16]
	movk	w23, #96, lsl #16
	mov	w1, w23
	ldr	x21, [x28, #208]
	bl	kmem_cache_alloc_trace
	cbz	x0, .LBB90_575
// %bb.1:
	mov	x27, x19
	mov	w10, #34079
	movk	w10, #20971, lsl #16
	mov	w12, #16483
	movk	w12, #6, lsl #16
	str	x0, [x27, #136]!
	ldr	w8, [x20, #72]
	ldr	w13, [x27, #1368]
	str	w8, [x0, #80]
	ldr	w8, [x20, #92]
	str	w8, [x0, #84]
	ldr	w8, [x20, #48]
	str	w8, [x0, #92]
	ldr	w8, [x21, #24]
	str	w8, [x0, #100]
	ldr	w9, [x21, #28]
	str	w9, [x0, #104]
	ldr	w9, [x20, #68]
	add	w11, w9, w9, lsl #2
	str	w9, [x0, #96]
	ldr	w9, [x20, #88]
	cmp	w11, w12
	umull	x10, w11, w10
	mov	w11, #4096
	lsr	x10, x10, #37
	csel	w10, w11, w10, hi
	cmp	w13, #1                 // =1
	str	w9, [x0, #88]
	str	w10, [x0, #108]
	b.eq	.LBB90_3
// %bb.2:
	mov	w9, #16
	str	w9, [x0, #136]
.LBB90_3:
	ldr	w10, [x19, #1188]
	mov	x11, #70
	ldr	w9, [x19, #1192]
	movk	x11, #8, lsl #32
	mov	w12, #16
	cmn	w8, #1                  // =1
	stur	x11, [x0, #140]
	mul	w10, w9, w10
	stp	w10, w12, [x0, #148]
	b.eq	.LBB90_5
// %bb.4:
	udiv	w8, w8, w9
.LBB90_5:
	add	x9, x0, #120            // =120
	str	w8, [x0, #156]
	add	x8, x0, #32             // =32
	adrp	x1, .L.str.17
	adrp	x2, f2fs_build_segment_manager.__key
	add	x1, x1, :lo12:.L.str.17
	str	x9, [x0, #120]
	add	x2, x2, :lo12:f2fs_build_segment_manager.__key
	str	x9, [x0, #128]
	mov	x0, x8
	bl	__init_rwsem
	ldr	x8, [x19]
	ldrb	w9, [x8, #80]
	tbnz	w9, #0, .LBB90_8
// %bb.6:
	mov	x0, x19
	bl	f2fs_create_flush_cmd_control
	mov	w22, w0
	cbnz	w0, .LBB90_576
// %bb.7:
	ldr	x8, [x19]
.LBB90_8:
	ldr	x9, [x27]
	ldr	x8, [x8, #248]
	ldr	x21, [x9, #168]
	ldr	w22, [x8]
	cbnz	x21, .LBB90_13
// %bb.9:
	mov	w0, #8368
	mov	w1, w23
	mov	w2, #2
	bl	kmalloc_order_trace
	cbz	x0, .LBB90_575
// %bb.10:
	mov	x21, x0
	mov	x8, xzr
	mov	w10, #512
	add	x11, x0, #8             // =8
	add	x9, x0, #24             // =24
	str	w10, [x0, #8320]
	str	x11, [x0, #8]
	str	x11, [x0, #16]
.LBB90_11:                              // =>This Inner Loop Header: Depth=1
	str	x9, [x9]
	add	x8, x8, #1              // =1
	str	x9, [x9, #8]
	add	x9, x9, #16             // =16
	cmp	x8, #512                // =512
	b.ne	.LBB90_11
// %bb.12:
	mov	w8, #8216
	mov	w9, #8232
	mov	w10, #8280
	adrp	x1, .L.str.45
	adrp	x2, create_discard_cmd_control.__key
	add	x8, x21, x8
	add	x9, x21, x9
	add	x0, x21, x10
	add	x1, x1, :lo12:.L.str.45
	add	x2, x2, :lo12:create_discard_cmd_control.__key
	str	x8, [x21, #8216]
	str	x8, [x21, #8224]
	str	x9, [x21, #8232]
	str	x9, [x21, #8240]
	bl	__mutex_init
	str	wzr, [x21, #8332]
	mov	w9, #8324
	str	wzr, [x21, #8336]
	adrp	x1, .L.str.47
	str	wzr, [x21, #8340]
	adrp	x2, create_discard_cmd_control.__key.46
	ldr	x8, [x19, #136]
	mov	w11, #8360
	str	wzr, [x21, #8312]
	add	x1, x1, :lo12:.L.str.47
	ldr	w10, [x19, #1184]
	add	x2, x2, :lo12:create_discard_cmd_control.__key.46
	ldr	w8, [x8, #96]
	str	xzr, [x21, x9]
	mov	w9, #8248
	add	x0, x21, x9
	strb	wzr, [x21, x11]
	str	xzr, [x21, #8344]
	lsl	w8, w8, w10
	str	xzr, [x21, #8352]
	str	w8, [x21, #8316]
	bl	__init_waitqueue_head
	ldr	x8, [x19, #136]
	str	x21, [x8, #168]
.LBB90_13:
	adrp	x0, issue_discard_thread
	adrp	x3, .L.str.48
	and	w5, w22, #0xfffff
	add	x0, x0, :lo12:issue_discard_thread
	mov	w2, #-1
	add	x3, x3, :lo12:.L.str.48
	mov	x1, x19
	lsr	w4, w22, #20
	bl	kthread_create_on_node
	mov	x22, x0
	cmn	x0, #1, lsl #12         // =4096
	b.ls	.LBB90_15
// %bb.14:
	mov	x0, x21
	str	x22, [x21]
	bl	kfree
	ldr	x8, [x27]
	str	xzr, [x8, #168]
	cbnz	w22, .LBB90_576
	b	.LBB90_16
.LBB90_15:
	mov	x0, x22
	bl	wake_up_process
	str	x22, [x21]
.LBB90_16:
	ldr	x0, [x24, #64]
	mov	w1, w23
	ldr	x26, [x28]
	mov	w2, #224
	bl	kmem_cache_alloc_trace
	cbz	x0, .LBB90_575
// %bb.17:
	ldr	x8, [x27]
	mov	w2, #-1
	mov	w1, w23
	mov	x21, x0
	str	x0, [x8]
	ldr	x8, [x27]
	ldr	w8, [x8, #96]
	add	x8, x8, x8, lsl #1
	lsl	x0, x8, #4
	bl	kvmalloc_node
	str	x0, [x21, #136]
	cbz	x0, .LBB90_575
// %bb.18:
	ldr	x8, [x27]
	mov	w2, #-1
	mov	w1, w23
	ldr	w8, [x8, #96]
	add	x8, x8, #63             // =63
	lsr	x8, x8, #3
	and	x22, x8, #0x3ffffff8
	mov	x0, x22
	bl	kvmalloc_node
	str	x0, [x21, #72]
	cbz	x0, .LBB90_575
// %bb.19:
	ldr	x8, [x27]
	mov	w2, #-1
	mov	w1, w23
	ldr	w8, [x8, #96]
	lsl	w0, w8, #8
	bl	kvmalloc_node
	str	x0, [x21, #24]
	cbz	x0, .LBB90_575
// %bb.20:
	ldr	x8, [x27]
	ldr	w8, [x8, #96]
	cbz	w8, .LBB90_23
// %bb.21:
	mov	x8, xzr
	mov	x9, xzr
.LBB90_22:                              // =>This Inner Loop Header: Depth=1
	ldr	x10, [x21, #136]
	add	x11, x0, #64            // =64
	add	x9, x9, #1              // =1
	add	x10, x10, x8
	str	x0, [x10, #8]
	ldr	x10, [x21, #136]
	add	x10, x10, x8
	str	x11, [x10, #24]
	add	x11, x0, #128           // =128
	ldr	x10, [x21, #136]
	add	x10, x10, x8
	str	x11, [x10, #16]
	add	x11, x0, #192           // =192
	ldr	x10, [x21, #136]
	add	x0, x0, #256            // =256
	add	x10, x10, x8
	add	x8, x8, #48             // =48
	str	x11, [x10, #32]
	ldr	x10, [x27]
	ldr	w10, [x10, #96]
	cmp	x9, x10
	b.lo	.LBB90_22
.LBB90_23:
	ldr	x0, [x24, #48]
	mov	w1, w23
	mov	w2, #64
	bl	kmem_cache_alloc_trace
	str	x0, [x21, #64]
	cbz	x0, .LBB90_575
// %bb.24:
	ldr	w8, [x19, #1192]
	cmp	w8, #2                  // =2
	b.lo	.LBB90_26
// %bb.25:
	ldr	w8, [x19, #1200]
	mov	w2, #-1
	mov	w1, w23
	lsl	x0, x8, #2
	bl	kvmalloc_node
	str	x0, [x21, #144]
	cbz	x0, .LBB90_575
.LBB90_26:
	ldr	x8, [x19, #224]
	ldr	w20, [x26, #56]
	ldrb	w9, [x8, #133]
	ldr	w24, [x8, #156]
	tbnz	w9, #5, .LBB90_29
// %bb.27:
	ldr	x9, [x28]
	ldr	w9, [x9, #1664]
	cbz	w9, .LBB90_30
// %bb.28:
	add	x25, x8, #1, lsl #12    // =4096
	b	.LBB90_31
.LBB90_29:
	ldrsw	x9, [x8, #160]
	add	x8, x8, x9
	add	x25, x8, #196           // =196
	b	.LBB90_31
.LBB90_30:
	add	x25, x8, #192           // =192
.LBB90_31:
	sub	w23, w23, #8, lsl #12   // =32768
	mov	x0, x25
	mov	x1, x24
	mov	w2, w23
	bl	kmemdup
	str	x0, [x21, #32]
	cbz	x0, .LBB90_575
// %bb.32:
	mov	x0, x25
	mov	x1, x24
	mov	w2, w23
	bl	kmemdup
	str	x0, [x21, #40]
	cbz	x0, .LBB90_575
// %bb.33:
	mov	x0, x22
	mov	w22, #32960
	movk	w22, #96, lsl #16
	mov	w2, #-1
	mov	w1, w22
	bl	kvmalloc_node
	str	x0, [x21, #48]
	cbz	x0, .LBB90_575
// %bb.34:
	adrp	x8, default_salloc_ops
	lsr	w10, w20, #1
	add	x8, x8, :lo12:default_salloc_ops
	ldr	x11, [x19, #224]
	mov	w0, #1
	str	x8, [x21]
	ldr	w8, [x19, #1184]
	ldr	w9, [x26, #80]
	str	w24, [x21, #56]
	lsl	w8, w10, w8
	mov	x10, #236223201280
	str	w9, [x21, #8]
	stp	w8, wzr, [x21, #12]
	str	x10, [x21, #80]
	ldr	x8, [x11, #168]
	str	x8, [x21, #152]
	bl	ktime_get_coarse_with_offset
	mov	x8, #38067
	adrp	x1, .L.str.49
	movk	x8, #9942, lsl #16
	adrp	x2, build_sit_info.__key
	movk	x8, #3048, lsl #32
	add	x1, x1, :lo12:.L.str.49
	movk	x8, #4398, lsl #48
	add	x2, x2, :lo12:build_sit_info.__key
	smulh	x8, x0, x8
	add	x0, x21, #88            // =88
	asr	x9, x8, #26
	add	x8, x9, x8, lsr #63
	str	x8, [x21, #160]
	bl	__init_rwsem
	adrp	x8, kmalloc_caches
	mov	w1, w22
	add	x8, x8, :lo12:kmalloc_caches
	mov	w2, #32
	ldr	x0, [x8, #48]
	bl	kmem_cache_alloc_trace
	cbz	x0, .LBB90_575
// %bb.35:
	ldr	x8, [x27]
	mov	x22, x0
	mov	w2, #-1
	mov	w1, w23
	str	x0, [x8, #8]
	ldr	x8, [x27]
	ldr	w8, [x8, #96]
	add	x8, x8, #63             // =63
	lsr	x8, x8, #3
	and	x24, x8, #0x3ffffff8
	mov	x0, x24
	bl	kvmalloc_node
	str	x0, [x22, #16]
	cbz	x0, .LBB90_575
// %bb.36:
	ldr	w8, [x19, #1200]
	mov	w2, #-1
	mov	w1, w23
	add	x8, x8, #63             // =63
	lsr	x8, x8, #3
	and	x25, x8, #0x3ffffff8
	mov	x0, x25
	bl	kvmalloc_node
	str	x0, [x22, #24]
	cbz	x0, .LBB90_575
// %bb.37:
	ldr	x0, [x22, #16]
	mov	w1, #255
	mov	x2, x24
	bl	memset
	ldr	x0, [x22, #24]
	mov	w1, #255
	mov	x2, x25
	bl	memset
	ldr	x9, [x27]
	cbz	x9, .LBB90_39
// %bb.38:
	add	x8, x9, #84             // =84
	add	x9, x9, #80             // =80
	b	.LBB90_40
.LBB90_39:
	ldr	x9, [x28]
	add	x8, x9, #92             // =92
	add	x9, x9, #72             // =72
.LBB90_40:
	adrp	x11, kmalloc_caches
	ldr	w8, [x8]
	add	x11, x11, :lo12:kmalloc_caches
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	mov	w1, #32960
	movk	w1, #96, lsl #16
	mov	w2, #1320
	ldr	x0, [x11, #88]
	sub	w8, w8, w9
	stur	xzr, [x22, #4]
	lsr	w8, w8, w10
	str	wzr, [x22, #12]
	str	w8, [x22]
	bl	kmem_cache_alloc_trace
	cbz	x0, .LBB90_575
// %bb.41:
	ldr	x8, [x27]
	adrp	x25, .L.str.52
	adrp	x21, build_curseg.__key.51
	mov	w20, #32960
	mov	x26, xzr
	add	x9, x19, #1188          // =1188
	add	x23, x0, #116           // =116
	mov	w22, #-12
	mov	w24, #4591
	add	x25, x25, :lo12:.L.str.52
	add	x21, x21, :lo12:build_curseg.__key.51
	movk	w20, #96, lsl #16
	str	x9, [sp, #64]           // 8-byte Folded Spill
	str	x0, [x8, #24]
	b	.LBB90_44
.LBB90_42:                              //   in Loop: Header=BB90_44 Depth=1
	sturh	w26, [x23, #-18]
.LBB90_43:                              //   in Loop: Header=BB90_44 Depth=1
	mov	w8, #-1
	add	x26, x26, #1            // =1
	cmp	x26, #11                // =11
	sturh	wzr, [x23, #-12]
	stur	w8, [x23, #-16]
	strb	wzr, [x23], #120
	b.eq	.LBB90_51
.LBB90_44:                              // =>This Inner Loop Header: Depth=1
	adrp	x1, .L.str.50
	adrp	x2, build_curseg.__key
	sub	x0, x23, #116           // =116
	add	x1, x1, :lo12:.L.str.50
	add	x2, x2, :lo12:build_curseg.__key
	bl	__mutex_init
	adrp	x8, kmalloc_caches
	mov	w1, w20
	add	x8, x8, :lo12:kmalloc_caches
	mov	w2, #4096
	ldr	x0, [x8, #96]
	bl	kmem_cache_alloc_trace
	stur	x0, [x23, #-84]
	cbz	x0, .LBB90_576
// %bb.45:                              //   in Loop: Header=BB90_44 Depth=1
	sub	x0, x23, #76            // =76
	mov	x1, x25
	mov	x2, x21
	bl	__init_rwsem
	cmp	x26, #2                 // =2
	mov	w8, #507
	mov	w9, #4526
	mov	w1, w20
	csel	x8, x9, x8, eq
	cmp	x26, #0                 // =0
	csel	x0, x24, x8, eq
	bl	__kmalloc
	stur	x0, [x23, #-28]
	cbz	x0, .LBB90_576
// %bb.46:                              //   in Loop: Header=BB90_44 Depth=1
	cmp	x26, #5                 // =5
	b.ls	.LBB90_42
// %bb.47:                              //   in Loop: Header=BB90_44 Depth=1
	cmp	w26, #10                // =10
	b.eq	.LBB90_49
// %bb.48:                              //   in Loop: Header=BB90_44 Depth=1
	cmp	w26, #9                 // =9
	b.ne	.LBB90_50
.LBB90_49:                              //   in Loop: Header=BB90_44 Depth=1
	mov	w8, #2
	sturh	w8, [x23, #-18]
	b	.LBB90_43
.LBB90_50:                              //   in Loop: Header=BB90_44 Depth=1
	sub	w8, w26, #6             // =6
	sturh	w8, [x23, #-18]
	b	.LBB90_43
.LBB90_51:
	ldr	x8, [x19, #136]
	ldr	x11, [x19, #224]
	ldr	x8, [x8, #24]
	ldrb	w9, [x11, #132]
	ldr	x10, [x8, #328]
	ldr	x8, [x8, #88]
	stp	x8, x10, [sp, #16]      // 16-byte Folded Spill
	tbnz	w9, #2, .LBB90_53
// %bb.52:
	mov	w21, wzr
	b	.LBB90_71
.LBB90_53:
	ldrb	w8, [x11, #176]
	cmp	w8, #1                  // =1
	b.ne	.LBB90_55
// %bb.54:
	ldr	x8, [sp, #64]           // 8-byte Folded Reload
	ldr	w8, [x8]
	b	.LBB90_56
.LBB90_55:
	ldrh	w8, [x11, #116]
.LBB90_56:
	ldrb	w9, [x11, #177]
	cmp	w9, #1                  // =1
	b.ne	.LBB90_58
// %bb.57:
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	ldr	w9, [x9]
	b	.LBB90_59
.LBB90_58:
	ldrh	w9, [x11, #118]
.LBB90_59:
	ldrb	w10, [x11, #178]
	add	w8, w9, w8
	str	x11, [sp, #40]          // 8-byte Folded Spill
	cmp	w10, #1                 // =1
	b.ne	.LBB90_61
// %bb.60:
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	ldr	w9, [x9]
	b	.LBB90_62
.LBB90_61:
	ldrh	w9, [x11, #120]
.LBB90_62:
	add	w8, w8, w9
	sub	w9, w8, #439            // =439
	cmp	w9, #585                // =585
	mov	w9, #2
	cinc	w9, w9, hs
	cmp	w8, #440                // =440
	csinc	w2, w9, wzr, ge
	cmp	w2, #2                  // =2
	b.lo	.LBB90_66
// %bb.63:
	ldr	x8, [x19, #16]
	ldr	w9, [x19, #232]
	ldr	w8, [x8, #76]
	cmp	w9, #2                  // =2
	b.ne	.LBB90_65
// %bb.64:
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	ldr	w9, [x9]
	add	w8, w9, w8
.LBB90_65:
	ldr	x9, [sp, #40]           // 8-byte Folded Reload
	mov	x0, x19
	mov	w3, wzr
	mov	w4, #1
	ldr	w9, [x9, #140]
	add	w1, w9, w8
	bl	f2fs_ra_meta_pages
	ldr	x8, [x19, #224]
	str	x8, [sp, #40]           // 8-byte Folded Spill
.LBB90_66:
	ldr	x8, [x19, #16]
	ldr	w9, [x19, #232]
	ldr	w8, [x8, #76]
	cmp	w9, #2                  // =2
	b.ne	.LBB90_68
// %bb.67:
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	ldr	w9, [x9]
	add	w8, w9, w8
.LBB90_68:
	ldr	x9, [sp, #40]           // 8-byte Folded Reload
	mov	x0, x19
	ldr	w9, [x9, #140]
	add	w23, w9, w8
	mov	x1, x23
	bl	f2fs_get_meta_page
	mov	x22, x0
	cmn	x0, #1, lsl #12         // =4096
	b.ls	.LBB90_148
.LBB90_69:
	cbnz	w22, .LBB90_576
.LBB90_70:
	mov	w21, #3
.LBB90_71:
	ldr	x8, [x19, #224]
	mov	w10, #33
	ldrb	w9, [x8, #132]
	tst	w9, w10
	b.eq	.LBB90_77
// %bb.72:
	ldr	x9, [x19, #16]
	ldr	w10, [x19, #232]
	ldr	w9, [x9, #76]
	cmp	w10, #2                 // =2
	b.ne	.LBB90_74
// %bb.73:
	ldr	x10, [sp, #64]          // 8-byte Folded Reload
	ldr	w10, [x10]
	add	w9, w10, w9
.LBB90_74:
	ldr	w8, [x8, #136]
	add	w9, w21, w9
	mov	x0, x19
	mov	w3, wzr
	mov	w4, #1
	add	w8, w9, w8
	mov	w9, #6
	sub	w1, w8, #7              // =7
	sub	w2, w9, w21
	bl	f2fs_ra_meta_pages
	b	.LBB90_77
.LBB90_75:                              //   in Loop: Header=BB90_77 Depth=1
	mov	w22, w25
	cbnz	w25, .LBB90_576
.LBB90_76:                              //   in Loop: Header=BB90_77 Depth=1
	add	x21, x21, #1            // =1
	cmp	x21, #6                 // =6
	b.eq	.LBB90_125
.LBB90_77:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB90_93 Depth 2
	ldr	x23, [x19, #224]
	cmp	x21, #2                 // =2
	b.hi	.LBB90_82
// %bb.78:                              //   in Loop: Header=BB90_77 Depth=1
	ldr	x10, [x19, #16]
	add	x8, x23, x21, lsl #2
	add	x9, x23, x21, lsl #1
	ldrb	w11, [x23, #132]
	ldr	w20, [x8, #84]
	ldrh	w26, [x9, #116]
	ldr	w8, [x10, #76]
	mov	w10, #33
	ldr	w9, [x19, #232]
	tst	w11, w10
	b.ne	.LBB90_84
// %bb.79:                              //   in Loop: Header=BB90_77 Depth=1
	cmp	w9, #2                  // =2
	b.ne	.LBB90_81
// %bb.80:                              //   in Loop: Header=BB90_77 Depth=1
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	ldr	w9, [x9]
	add	w8, w9, w8
.LBB90_81:                              //   in Loop: Header=BB90_77 Depth=1
	ldr	w9, [x23, #136]
	add	w8, w21, w8
	add	w8, w8, w9
	sub	w8, w8, #4              // =4
	b	.LBB90_88
.LBB90_82:                              //   in Loop: Header=BB90_77 Depth=1
	sub	x8, x21, #3             // =3
	ldrb	w10, [x23, #132]
	add	x9, x23, x8, lsl #2
	add	x8, x23, x8, lsl #1
	ldr	w20, [x9, #36]
	ldrh	w26, [x8, #68]
	mov	w8, #33
	tst	w10, w8
	b.eq	.LBB90_87
// %bb.83:                              //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x19, #16]
	ldr	w9, [x19, #232]
	ldr	w8, [x8, #76]
.LBB90_84:                              //   in Loop: Header=BB90_77 Depth=1
	cmp	w9, #2                  // =2
	b.ne	.LBB90_86
// %bb.85:                              //   in Loop: Header=BB90_77 Depth=1
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	ldr	w9, [x9]
	add	w8, w9, w8
.LBB90_86:                              //   in Loop: Header=BB90_77 Depth=1
	ldr	w9, [x23, #136]
	add	w8, w21, w8
	add	w8, w8, w9
	sub	w8, w8, #7              // =7
	b	.LBB90_88
.LBB90_87:                              //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x27]
	ldr	w8, [x8, #88]
	add	w8, w8, w20
.LBB90_88:                              //   in Loop: Header=BB90_77 Depth=1
	mov	w1, w8
	mov	x0, x19
	bl	f2fs_get_meta_page
	mov	x25, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB90_75
// %bb.89:                              //   in Loop: Header=BB90_77 Depth=1
	lsl	x8, x25, #6
	orr	x24, x8, #0xffffffc000000000
	sub	w8, w21, #3             // =3
	cmp	w8, #2                  // =2
	b.hi	.LBB90_95
// %bb.90:                              //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x19, #224]
	mov	w9, #33
	ldrb	w8, [x8, #132]
	tst	w8, w9
	b.eq	.LBB90_94
// %bb.91:                              //   in Loop: Header=BB90_77 Depth=1
	ldr	x11, [sp, #64]          // 8-byte Folded Reload
	ldr	w8, [x11]
	cbz	w8, .LBB90_95
// %bb.92:                              //   in Loop: Header=BB90_77 Depth=1
	mov	w8, wzr
	add	x9, x24, #5             // =5
.LBB90_93:                              //   Parent Loop BB90_77 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	sturb	wzr, [x9, #-1]
	add	w8, w8, #1              // =1
	strh	wzr, [x9], #7
	ldr	w10, [x11]
	cmp	w8, w10
	b.lo	.LBB90_93
	b	.LBB90_95
.LBB90_94:                              //   in Loop: Header=BB90_77 Depth=1
	mov	x0, x19
	mov	w1, w20
	mov	x2, x24
	bl	f2fs_restore_node_summary
	mov	w22, w0
	cbnz	w0, .LBB90_96
.LBB90_95:                              //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x19, #136]
	mov	w9, #120
	ldr	x8, [x8, #24]
	madd	x22, x21, x9, x8
	mov	x0, x22
	bl	mutex_lock
	str	w26, [sp, #56]          // 4-byte Folded Spill
	mov	w26, w20
	mov	x20, x25
	add	x25, x22, #40           // =40
	mov	x0, x25
	bl	down_write
	ldr	x0, [x22, #88]
	add	x1, x24, #3584          // =3584
	mov	w2, #507
	bl	memcpy
	mov	x0, x25
	mov	x25, x20
	bl	up_write
	ldr	x0, [x22, #32]
	mov	x1, x24
	mov	w2, #3584
	bl	memcpy
	ldr	x8, [x22, #32]
	add	x1, x24, #4091          // =4091
	mov	w2, #5
	add	x0, x8, #4091           // =4091
	bl	memcpy
	mov	x0, x19
	mov	w1, w21
	mov	w2, wzr
	str	w26, [x22, #112]
	bl	reset_curseg
	add	x8, x23, x21
	ldr	w9, [sp, #56]           // 4-byte Folded Reload
	mov	x0, x22
	ldrb	w8, [x8, #176]
	strh	w9, [x22, #104]
	strb	w8, [x22, #96]
	bl	mutex_unlock
	mov	w22, wzr
.LBB90_96:                              //   in Loop: Header=BB90_77 Depth=1
	cbz	x25, .LBB90_121
// %bb.97:                              //   in Loop: Header=BB90_77 Depth=1
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
	b.ne	.LBB90_113
// %bb.98:                              //   in Loop: Header=BB90_77 Depth=1
	tbnz	w8, #0, .LBB90_112
// %bb.99:                              //   in Loop: Header=BB90_77 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_102
// %bb.100:                             //   in Loop: Header=BB90_77 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_102
// %bb.101:                             //   in Loop: Header=BB90_77 Depth=1
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_102:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_104
// %bb.103:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB90_122
.LBB90_104:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x0, [x25, #24]
.LBB90_105:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_107
// %bb.106:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB90_123
.LBB90_107:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x0, [x25, #24]
.LBB90_108:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_110
// %bb.109:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB90_124
.LBB90_110:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x0, [x25, #24]
.LBB90_111:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB90_112:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB90_119
	b	.LBB90_636
.LBB90_113:                             //   in Loop: Header=BB90_77 Depth=1
	tbnz	w8, #0, .LBB90_118
// %bb.114:                             //   in Loop: Header=BB90_77 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_117
// %bb.115:                             //   in Loop: Header=BB90_77 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_117
// %bb.116:                             //   in Loop: Header=BB90_77 Depth=1
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_117:                             //   in Loop: Header=BB90_77 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB90_118:                             //   in Loop: Header=BB90_77 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB90_638
.LBB90_119:                             //   in Loop: Header=BB90_77 Depth=1
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
	cbnz	w9, .LBB90_121
// %bb.120:                             //   in Loop: Header=BB90_77 Depth=1
	bl	__put_page
.LBB90_121:                             //   in Loop: Header=BB90_77 Depth=1
	cbz	w22, .LBB90_76
	b	.LBB90_576
.LBB90_122:                             //   in Loop: Header=BB90_77 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB90_105
.LBB90_123:                             //   in Loop: Header=BB90_77 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB90_108
.LBB90_124:                             //   in Loop: Header=BB90_77 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB90_111
.LBB90_125:
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	ldrh	w2, [x8]
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	cmp	w2, #353                // =353
	ldrh	w3, [x8]
	b.hi	.LBB90_187
// %bb.126:
	cmp	w3, #59                 // =59
	b.hs	.LBB90_187
// %bb.127:
	ldr	x8, [x19, #16]
	ldr	w9, [x19, #232]
	ldr	w8, [x8, #76]
	cmp	w9, #2                  // =2
	b.ne	.LBB90_129
// %bb.128:
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	ldr	w9, [x9]
	add	w8, w9, w8
.LBB90_129:
	ldr	x9, [x19, #224]
	ldr	w10, [x9, #136]
	ldrb	w9, [x9, #133]
	add	w8, w10, w8
	mov	w22, w8
	tbz	w9, #3, .LBB90_196
// %bb.130:
	ldr	x9, [x19, #136]
	mov	w1, w8
	mov	x0, x19
	add	w22, w8, #1             // =1
	ldr	x20, [x9, #24]
	bl	f2fs_get_meta_page
	ldr	x8, [x20, #88]
	mov	x21, x0
	lsl	x9, x0, #6
	orr	x1, x9, #0xffffffc000000000
	mov	w2, #4095
	add	x0, x8, #496            // =496
	bl	memcpy
	cbz	x21, .LBB90_196
// %bb.131:
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
	b.ne	.LBB90_188
// %bb.132:
	tbnz	w8, #0, .LBB90_146
// %bb.133:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_136
// %bb.134:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_136
// %bb.135:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_136:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_138
// %bb.137:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB90_621
.LBB90_138:
	ldr	x0, [x21, #24]
.LBB90_139:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_141
// %bb.140:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB90_622
.LBB90_141:
	ldr	x0, [x21, #24]
.LBB90_142:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_144
// %bb.143:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB90_623
.LBB90_144:
	ldr	x0, [x21, #24]
.LBB90_145:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB90_146:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB90_194
// %bb.147:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_148:
	ldr	x8, [x27]
	add	w9, w23, #1             // =1
	mov	w23, #507
	mov	x2, x23
	str	w9, [sp, #32]           // 4-byte Folded Spill
	ldr	x8, [x8, #24]
	ldr	x0, [x8, #88]
	lsl	x8, x22, #6
	orr	x25, x8, #0xffffffc000000000
	mov	x1, x25
	bl	memcpy
	ldr	x8, [x27]
	add	x1, x25, #507           // =507
	mov	x2, x23
	ldr	x8, [x8, #24]
	ldr	x0, [x8, #328]
	bl	memcpy
	mov	x24, xzr
	mov	w26, #1014
	b	.LBB90_150
.LBB90_149:                             //   in Loop: Header=BB90_150 Depth=1
	str	w24, [sp, #32]          // 4-byte Folded Spill
	ldr	x24, [sp, #48]          // 8-byte Folded Reload
	add	x24, x24, #1            // =1
	cmp	x24, #3                 // =3
	b.eq	.LBB90_355
.LBB90_150:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB90_156 Depth 2
	ldr	x8, [x19, #136]
	mov	w10, #120
	ldr	x23, [sp, #40]          // 8-byte Folded Reload
	mov	x0, x19
	mov	w1, w24
	mov	w2, wzr
	ldr	x11, [x8, #24]
	add	x8, x23, x24, lsl #2
	add	x9, x23, x24, lsl #1
	ldr	w8, [x8, #84]
	madd	x21, x24, x10, x11
	ldrh	w20, [x9, #116]
	str	x11, [sp, #56]          // 8-byte Folded Spill
	str	w8, [x21, #112]
	bl	reset_curseg
	add	x8, x23, x24
	str	x24, [sp, #48]          // 8-byte Folded Spill
	ldrb	w8, [x8, #176]
	strh	w20, [x21, #104]
	cmp	w8, #1                  // =1
	strb	w8, [x21, #96]
	b.ne	.LBB90_152
// %bb.151:                             //   in Loop: Header=BB90_150 Depth=1
	ldr	x8, [sp, #64]           // 8-byte Folded Reload
	ldr	w20, [x8]
.LBB90_152:                             //   in Loop: Header=BB90_150 Depth=1
	ldr	w24, [sp, #32]          // 4-byte Folded Reload
	tst	w20, #0xffff
	b.eq	.LBB90_149
// %bb.153:                             //   in Loop: Header=BB90_150 Depth=1
	ldp	x8, x10, [sp, #48]      // 16-byte Folded Reload
	mov	w9, #120
	mov	x21, xzr
	mov	x23, xzr
	and	x13, x20, #0xffff
	madd	x8, x8, x9, x10
	str	x13, [sp, #56]          // 8-byte Folded Spill
	add	x12, x8, #32            // =32
	b	.LBB90_156
.LBB90_154:                             //   in Loop: Header=BB90_156 Depth=2
	add	w26, w26, #7            // =7
.LBB90_155:                             //   in Loop: Header=BB90_156 Depth=2
	add	x23, x23, #1            // =1
	add	x21, x21, #7            // =7
	cmp	x23, x13
	b.eq	.LBB90_149
.LBB90_156:                             //   Parent Loop BB90_150 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x8, x25, w26, sxtw
	ldr	x9, [x12]
	add	w11, w26, #14           // =14
	cmp	w11, #4092              // =4092
	ldur	w10, [x8, #3]
	ldr	w8, [x8]
	add	x9, x9, x21
	stur	w10, [x9, #3]
	str	w8, [x9]
	b.lo	.LBB90_154
// %bb.157:                             //   in Loop: Header=BB90_156 Depth=2
	mov	x20, x12
	cbz	x22, .LBB90_182
// %bb.158:                             //   in Loop: Header=BB90_156 Depth=2
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
	b.ne	.LBB90_174
// %bb.159:                             //   in Loop: Header=BB90_156 Depth=2
	tbnz	w8, #0, .LBB90_173
// %bb.160:                             //   in Loop: Header=BB90_156 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_163
// %bb.161:                             //   in Loop: Header=BB90_156 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_163
// %bb.162:                             //   in Loop: Header=BB90_156 Depth=2
	adrp	x25, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x25, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_163:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_165
// %bb.164:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB90_184
.LBB90_165:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x0, [x22, #24]
.LBB90_166:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_168
// %bb.167:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB90_185
.LBB90_168:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x0, [x22, #24]
.LBB90_169:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_171
// %bb.170:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB90_186
.LBB90_171:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x0, [x22, #24]
.LBB90_172:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB90_173:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB90_180
	b	.LBB90_635
.LBB90_174:                             //   in Loop: Header=BB90_156 Depth=2
	tbnz	w8, #0, .LBB90_179
// %bb.175:                             //   in Loop: Header=BB90_156 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_178
// %bb.176:                             //   in Loop: Header=BB90_156 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_178
// %bb.177:                             //   in Loop: Header=BB90_156 Depth=2
	adrp	x25, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x25, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_178:                             //   in Loop: Header=BB90_156 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB90_179:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB90_637
.LBB90_180:                             //   in Loop: Header=BB90_156 Depth=2
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
	cbnz	w9, .LBB90_182
// %bb.181:                             //   in Loop: Header=BB90_156 Depth=2
	bl	__put_page
.LBB90_182:                             //   in Loop: Header=BB90_156 Depth=2
	mov	w1, w24
	mov	x0, x19
	bl	f2fs_get_meta_page
	mov	x22, x0
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB90_69
// %bb.183:                             //   in Loop: Header=BB90_156 Depth=2
	ldr	x13, [sp, #56]          // 8-byte Folded Reload
	mov	w26, wzr
	add	w24, w24, #1            // =1
	lsl	x8, x22, #6
	orr	x25, x8, #0xffffffc000000000
	mov	x12, x20
	b	.LBB90_155
.LBB90_184:                             //   in Loop: Header=BB90_156 Depth=2
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB90_166
.LBB90_185:                             //   in Loop: Header=BB90_156 Depth=2
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB90_169
.LBB90_186:                             //   in Loop: Header=BB90_156 Depth=2
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB90_172
.LBB90_187:
	adrp	x1, .L.str.53
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.53
	bl	f2fs_printk
	mov	w22, #-22
	b	.LBB90_576
.LBB90_188:
	tbnz	w8, #0, .LBB90_193
// %bb.189:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_192
// %bb.190:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_192
// %bb.191:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_192:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB90_193:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB90_641
.LBB90_194:
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
	cbnz	w9, .LBB90_196
// %bb.195:
	bl	__put_page
.LBB90_196:
	ldr	x8, [x19, #224]
	ldrb	w8, [x8, #133]
	tbz	w8, #2, .LBB90_223
// %bb.197:
	ldr	x8, [x19, #136]
	mov	w1, w22
	mov	x0, x19
	ldr	x20, [x8, #24]
	bl	f2fs_get_meta_page
	ldr	x8, [x20, #328]
	mov	x21, x0
	lsl	x9, x0, #6
	orr	x1, x9, #0xffffffc000000000
	mov	w2, #4056
	add	x0, x8, #470            // =470
	bl	memcpy
	cbz	x21, .LBB90_223
// %bb.198:
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
	b.ne	.LBB90_215
// %bb.199:
	tbnz	w8, #0, .LBB90_213
// %bb.200:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_203
// %bb.201:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_203
// %bb.202:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_203:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_205
// %bb.204:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB90_624
.LBB90_205:
	ldr	x0, [x21, #24]
.LBB90_206:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_208
// %bb.207:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB90_625
.LBB90_208:
	ldr	x0, [x21, #24]
.LBB90_209:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_211
// %bb.210:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB90_626
.LBB90_211:
	ldr	x0, [x21, #24]
.LBB90_212:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB90_213:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB90_221
// %bb.214:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_215:
	tbnz	w8, #0, .LBB90_220
// %bb.216:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_219
// %bb.217:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_219
// %bb.218:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_219:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB90_220:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB90_642
.LBB90_221:
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
	cbnz	w9, .LBB90_223
// %bb.222:
	bl	__put_page
.LBB90_223:
	ldr	x8, [x19, #136]
	mov	x10, #58387
	movk	x10, #16681, lsl #16
	add	x11, sp, #72            // =72
	movk	x10, #4766, lsl #32
	ldr	x26, [sp, #64]          // 8-byte Folded Reload
	movk	x10, #10724, lsl #48
	mov	w21, wzr
	ldr	w9, [x8, #96]
	orr	x23, x11, #0x2
	ldr	x12, [x8, #24]
	ldr	x20, [x8]
	str	wzr, [sp, #48]          // 4-byte Folded Spill
	add	x9, x9, #54             // =54
	ldr	x8, [x12, #328]
	umulh	x10, x9, x10
	str	x20, [sp, #32]          // 8-byte Folded Spill
	sub	x9, x9, x10
	stp	x12, x8, [sp]           // 16-byte Folded Spill
	add	x8, x10, x9, lsr #1
	lsr	x8, x8, #5
	str	x8, [sp, #16]           // 8-byte Folded Spill
	b	.LBB90_225
.LBB90_224:                             //   in Loop: Header=BB90_225 Depth=1
	ldr	w21, [sp, #24]          // 4-byte Folded Reload
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	cmp	w21, w8
	b.hs	.LBB90_373
.LBB90_225:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB90_229 Depth 2
                                        //       Child Loop BB90_274 Depth 3
	mov	x0, x19
	mov	w1, w21
	mov	w2, #256
	mov	w3, #2
	mov	w4, #1
	bl	f2fs_ra_meta_pages
	ldr	w9, [x20, #84]
	mul	w8, w9, w21
	add	w21, w0, w21
	mul	w9, w21, w9
	str	w21, [sp, #24]          // 4-byte Folded Spill
	cmp	w8, w9
	b.hs	.LBB90_224
// %bb.226:                             //   in Loop: Header=BB90_225 Depth=1
	mov	w25, w8
	mov	w8, w9
	str	x8, [sp, #40]           // 8-byte Folded Spill
	b	.LBB90_229
.LBB90_227:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	w8, [x26]
	madd	x20, x25, x21, x22
	ldr	w9, [x24]
	mov	w1, #255
	mov	w2, #64
	ldr	x0, [x20, #8]
	bfi	w9, w8, #6, #10
	str	w9, [x24]
	ldr	w8, [x26]
	bfi	w9, w8, #16, #10
	str	w9, [x24]
	bl	memset
	ldr	x0, [x20, #24]
	mov	w1, #255
	mov	w2, #64
	bl	memset
	ldr	w8, [x24]
	and	w8, w8, #0xffffffc0
	orr	w8, w8, #0x4
	str	w8, [x24]
	adrp	x8, jiffies
	ldr	x8, [x8, :lo12:jiffies]
	str	x8, [x20, #40]
.LBB90_228:                             //   in Loop: Header=BB90_229 Depth=2
	ldp	x20, x8, [sp, #32]      // 16-byte Folded Reload
	add	x25, x25, #1            // =1
	cmp	x25, x8
	b.eq	.LBB90_224
.LBB90_229:                             //   Parent Loop BB90_225 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB90_274 Depth 3
	ldr	x8, [x27]
	mov	w24, #48
	ldr	w9, [x8, #96]
	cmp	x25, x9
	b.hs	.LBB90_224
// %bb.230:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x21, [x8]
	ldr	x9, [x20, #136]
	ldr	w22, [x21, #8]
	str	x9, [sp, #56]           // 8-byte Folded Spill
	cbz	x8, .LBB90_232
// %bb.231:                             //   in Loop: Header=BB90_229 Depth=2
	add	x9, x8, #92             // =92
	b	.LBB90_233
.LBB90_232:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x9, [x28]
	add	x9, x9, #48             // =48
.LBB90_233:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	w9, [x9]
	sub	w9, w9, #1              // =1
	cmp	x25, x9
	b.hi	.LBB90_236
// %bb.234:                             //   in Loop: Header=BB90_229 Depth=2
	cbz	x8, .LBB90_240
.LBB90_235:                             //   in Loop: Header=BB90_229 Depth=2
	add	x8, x8, #92             // =92
	b	.LBB90_241
.LBB90_236:                             //   in Loop: Header=BB90_229 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_239
// %bb.237:                             //   in Loop: Header=BB90_229 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_239
// %bb.238:                             //   in Loop: Header=BB90_229 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.check_seg_range
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.check_seg_range
	mov	w3, #1247
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_239:                             //   in Loop: Header=BB90_229 Depth=2
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	x8, [x19, #136]
	ldr	x26, [sp, #64]          // 8-byte Folded Reload
	ldr	x20, [sp, #32]          // 8-byte Folded Reload
	cbnz	x8, .LBB90_235
.LBB90_240:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x28]
	add	x8, x8, #48             // =48
.LBB90_241:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	w8, [x8]
	sub	w8, w8, #1              // =1
	cmp	x25, x8
	b.hi	.LBB90_630
// %bb.242:                             //   in Loop: Header=BB90_229 Depth=2
	mov	w9, #4767
	and	x8, x25, #0xffffffff
	movk	w9, #10724, lsl #16
	ldp	x10, x11, [x21, #32]
	mul	x8, x8, x9
	lsr	x8, x8, #32
	sub	w9, w25, w8
	add	w8, w8, w9, lsr #1
	lsr	w8, w8, #5
	lsr	x9, x8, #3
	mvn	w12, w8
	ldrb	w10, [x10, x9]
	and	w12, w12, #0x7
	ldrb	w11, [x11, x9]
	mov	w9, #1
	lsl	w12, w9, w12
	and	w9, w12, w10
	and	w10, w12, w11
	cmp	w9, w10
	b.ne	.LBB90_631
// %bb.243:                             //   in Loop: Header=BB90_229 Depth=2
	add	w8, w22, w8
	cbz	w9, .LBB90_245
// %bb.244:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	w9, [x21, #12]
	add	w8, w9, w8
.LBB90_245:                             //   in Loop: Header=BB90_229 Depth=2
	mov	w1, w8
	mov	x0, x19
	bl	f2fs_get_meta_page
	mov	x22, x0
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB90_297
// %bb.246:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	w8, [x20, #84]
	mov	w10, #74
	udiv	w9, w25, w8
	msub	w8, w9, w8, w25
	lsl	x9, x22, #6
	orr	x9, x9, #0xffffffc000000000
	umaddl	x8, w8, w10, x9
	ldp	x9, x10, [x8]
	stp	x9, x10, [sp, #72]
	ldp	x10, x9, [x8, #32]
	ldp	x11, x12, [x8, #16]
	stp	x10, x9, [sp, #104]
	stp	x11, x12, [sp, #88]
	ldrh	w9, [x8, #72]
	ldr	x11, [x8, #48]
	ldp	x8, x10, [x8, #56]
	strh	w9, [sp, #144]
	str	x11, [sp, #120]
	stp	x8, x10, [sp, #128]
	cbz	x22, .LBB90_271
// %bb.247:                             //   in Loop: Header=BB90_229 Depth=2
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
	b.ne	.LBB90_263
// %bb.248:                             //   in Loop: Header=BB90_229 Depth=2
	tbnz	w8, #0, .LBB90_262
// %bb.249:                             //   in Loop: Header=BB90_229 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_252
// %bb.250:                             //   in Loop: Header=BB90_229 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_252
// %bb.251:                             //   in Loop: Header=BB90_229 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_252:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_254
// %bb.253:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB90_294
.LBB90_254:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x0, [x22, #24]
.LBB90_255:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_257
// %bb.256:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB90_295
.LBB90_257:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x0, [x22, #24]
.LBB90_258:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_260
// %bb.259:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB90_296
.LBB90_260:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x0, [x22, #24]
.LBB90_261:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB90_262:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB90_269
	b	.LBB90_639
.LBB90_263:                             //   in Loop: Header=BB90_229 Depth=2
	tbnz	w8, #0, .LBB90_268
// %bb.264:                             //   in Loop: Header=BB90_229 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_267
// %bb.265:                             //   in Loop: Header=BB90_229 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_267
// %bb.266:                             //   in Loop: Header=BB90_229 Depth=2
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_267:                             //   in Loop: Header=BB90_229 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB90_268:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB90_640
.LBB90_269:                             //   in Loop: Header=BB90_229 Depth=2
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
	cbnz	w9, .LBB90_271
// %bb.270:                             //   in Loop: Header=BB90_229 Depth=2
	bl	__put_page
.LBB90_271:                             //   in Loop: Header=BB90_229 Depth=2
	ldur	x9, [sp, #74]
	mov	w22, wzr
	ldr	x8, [sp, #56]           // 8-byte Folded Reload
	mov	w0, wzr
	and	w20, w9, #0x1
	madd	x24, x25, x24, x8
	ldr	w8, [x26]
	b	.LBB90_274
.LBB90_272:                             //   in Loop: Header=BB90_274 Depth=3
	mov	x2, x21
	bl	find_next_bit
.LBB90_273:                             //   in Loop: Header=BB90_274 Depth=3
	ldr	w8, [x26]
	eor	w20, w20, #0x1
	cmp	w0, w8
	b.hs	.LBB90_276
.LBB90_274:                             //   Parent Loop BB90_225 Depth=1
                                        //     Parent Loop BB90_229 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	w1, w8
	sxtw	x21, w0
	mov	x0, x23
	tbz	w20, #0, .LBB90_272
// %bb.275:                             //   in Loop: Header=BB90_274 Depth=3
	mov	x2, x21
	bl	find_next_zero_bit
	sub	w8, w22, w21
	add	w22, w8, w0
	b	.LBB90_273
.LBB90_276:                             //   in Loop: Header=BB90_229 Depth=2
	ldrh	w9, [sp, #72]
	and	w2, w9, #0x3ff
	cmp	w22, w2
	b.ne	.LBB90_543
// %bb.277:                             //   in Loop: Header=BB90_229 Depth=2
	cmp	w8, w22
	b.lo	.LBB90_538
// %bb.278:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x27]
	cbz	x8, .LBB90_280
// %bb.279:                             //   in Loop: Header=BB90_229 Depth=2
	add	x10, x8, #92            // =92
	b	.LBB90_281
.LBB90_280:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x10, [x28]
	add	x10, x10, #48           // =48
.LBB90_281:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	w10, [x10]
	sub	w10, w10, #1            // =1
	cmp	x25, x10
	b.hi	.LBB90_538
// %bb.282:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	w10, [x19, #3024]
	cmp	w10, #1                 // =1
	b.lt	.LBB90_285
// %bb.283:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x22, [sp, #56]          // 8-byte Folded Reload
	mov	w21, #48
	cbz	x8, .LBB90_286
// %bb.284:                             //   in Loop: Header=BB90_229 Depth=2
	add	x9, x8, #80             // =80
	b	.LBB90_287
.LBB90_285:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	w8, [x24]
	mov	w21, #48
	ldr	x22, [sp, #56]          // 8-byte Folded Reload
	bfi	w8, w9, #6, #10
	madd	x20, x25, x21, x22
	str	w8, [x24]
	ldrh	w9, [sp, #72]
	ldr	x0, [x20, #8]
	and	w9, w9, #0x3ff
	bfi	w8, w9, #16, #10
	str	w8, [x24]
	b	.LBB90_289
.LBB90_286:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x9, [x28]
	add	x9, x9, #72             // =72
.LBB90_287:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x8, [x8, #8]
	mov	x0, x19
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	add	w8, w8, w25
	lsl	w8, w8, w10
	add	w1, w8, w9
	bl	f2fs_target_device_index
	mov	w9, #192
	ldr	x8, [x19, #3032]
	smull	x9, w0, w9
	ldr	x8, [x8, x9]
	cbz	x8, .LBB90_227
// %bb.288:                             //   in Loop: Header=BB90_229 Depth=2
	ldrh	w8, [sp, #72]
	madd	x20, x25, x21, x22
	ldr	w9, [x24]
	ldr	x0, [x20, #8]
	bfi	w9, w8, #6, #10
	str	w9, [x24]
	ldrh	w8, [sp, #72]
	and	w8, w8, #0x3ff
	bfi	w9, w8, #16, #10
	str	w9, [x24]
.LBB90_289:                             //   in Loop: Header=BB90_229 Depth=2
	mov	x1, x23
	mov	w2, #64
	bl	memcpy
	ldr	x0, [x20, #24]
	mov	x1, x23
	mov	w2, #64
	bl	memcpy
	ldr	x0, [x20, #16]
	mov	x1, x23
	mov	w2, #64
	bl	memcpy
	ldr	w8, [x24]
	madd	x10, x25, x21, x22
	ldrh	w9, [sp, #72]
	and	w8, w8, #0xffffffc0
	orr	w8, w8, w9, lsr #10
	and	w11, w8, #0x3f
	sub	w11, w11, #3            // =3
	str	w8, [x24]
	ubfx	w8, w8, #6, #10
	ldur	x9, [sp, #138]
	cmp	w11, #3                 // =3
	csel	w8, w8, wzr, lo
	str	x9, [x20, #40]
	ldr	x9, [x19, #224]
	ldr	x0, [x10, #32]
	ldr	w10, [sp, #48]          // 4-byte Folded Reload
	ldrb	w9, [x9, #133]
	add	w10, w8, w10
	str	w10, [sp, #48]          // 4-byte Folded Spill
	tbnz	w9, #0, .LBB90_291
// %bb.290:                             //   in Loop: Header=BB90_229 Depth=2
	madd	x8, x25, x21, x22
	mov	w2, #64
	ldr	x1, [x8, #8]
	bl	memcpy
	ldr	w8, [x19, #1188]
	ldr	w9, [x19, #1244]
	ldr	w10, [x24]
	add	w8, w9, w8
	ubfx	w9, w10, #6, #10
	sub	w8, w8, w9
	str	w8, [x19, #1244]
	b	.LBB90_292
.LBB90_291:                             //   in Loop: Header=BB90_229 Depth=2
	mov	w1, #255
	mov	w2, #64
	bl	memset
.LBB90_292:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	w8, [x19, #1192]
	cmp	w8, #2                  // =2
	b.lo	.LBB90_228
// %bb.293:                             //   in Loop: Header=BB90_229 Depth=2
	ldr	x9, [x27]
	udiv	w8, w25, w8
	ldr	w10, [x24]
	lsl	x8, x8, #2
	ldr	x9, [x9]
	ubfx	w10, w10, #6, #10
	ldr	x9, [x9, #144]
	ldr	w11, [x9, x8]
	add	w10, w11, w10
	str	w10, [x9, x8]
	b	.LBB90_228
.LBB90_294:                             //   in Loop: Header=BB90_229 Depth=2
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB90_255
.LBB90_295:                             //   in Loop: Header=BB90_229 Depth=2
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB90_258
.LBB90_296:                             //   in Loop: Header=BB90_229 Depth=2
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB90_261
.LBB90_297:
	cbnz	w22, .LBB90_576
.LBB90_298:
	ldr	w9, [x19, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB90_401
// %bb.299:
	ldr	x8, [x28]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB90_400
// %bb.300:
	adrp	x22, .L.str
	mov	x21, xzr
	mov	w8, #3
	mov	w23, #-1
	mov	w24, #192
	add	x22, x22, :lo12:.L.str
	str	w8, [x19, #3308]
	b	.LBB90_303
.LBB90_301:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x8, [x19, #3032]
	ldr	w9, [x8, #264]
.LBB90_302:                             //   in Loop: Header=BB90_303 Depth=1
	add	x8, x8, x20
	ldr	w11, [x19, #1188]
	add	x21, x21, #1            // =1
	cmp	x21, #2                 // =2
	ldr	w10, [x8, #176]
	sub	w9, w9, w10
	mul	w9, w9, w11
	str	w9, [x8, #180]
	ldr	x8, [x19, #3032]
	ldr	w10, [x19, #1188]
	add	x8, x8, x20
	ldr	w9, [x8, #72]
	mul	w9, w10, w9
	str	w9, [x8, #188]
	b.eq	.LBB90_399
.LBB90_303:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB90_309 Depth 2
                                        //     Child Loop BB90_323 Depth 2
                                        //     Child Loop BB90_341 Depth 2
	cbz	x21, .LBB90_315
// %bb.304:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x8, [x19, #3032]
	mov	w10, w23
	madd	x9, x21, x24, x8
	ldr	w9, [x9, #76]
	add	w11, w9, #3             // =3
	cmp	w11, #4                 // =4
	b.lo	.LBB90_332
// %bb.305:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	w11, [x19, #3024]
	cbz	w11, .LBB90_313
// %bb.306:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x10, [x19]
	cmp	w11, #1                 // =1
	ldr	x10, [x10, #248]
	b.lt	.LBB90_312
// %bb.307:                             //   in Loop: Header=BB90_303 Depth=1
	mov	x13, xzr
	add	x12, x8, #80            // =80
	b	.LBB90_309
.LBB90_308:                             //   in Loop: Header=BB90_309 Depth=2
	add	x13, x13, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x13, x11
	b.eq	.LBB90_312
.LBB90_309:                             //   Parent Loop BB90_303 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w14, [x12, #-4]
	cmp	w14, w9
	b.hi	.LBB90_308
// %bb.310:                             //   in Loop: Header=BB90_309 Depth=2
	ldr	w14, [x12]
	cmp	w14, w9
	b.lo	.LBB90_308
// %bb.311:                             //   in Loop: Header=BB90_303 Depth=1
	ldur	x10, [x12, #-80]
.LBB90_312:                             //   in Loop: Header=BB90_303 Depth=1
	cbz	x10, .LBB90_331
.LBB90_313:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x10, [x27]
	cbz	x10, .LBB90_329
// %bb.314:                             //   in Loop: Header=BB90_303 Depth=1
	add	x11, x10, #80           // =80
	b	.LBB90_330
.LBB90_315:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x8, [x27]
	cbz	x8, .LBB90_317
// %bb.316:                             //   in Loop: Header=BB90_303 Depth=1
	add	x9, x8, #84             // =84
	b	.LBB90_318
.LBB90_317:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x9, [x28]
	add	x9, x9, #92             // =92
.LBB90_318:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	w9, [x9]
	mov	w10, w23
	add	w11, w9, #3             // =3
	cmp	w11, #4                 // =4
	b.lo	.LBB90_335
// %bb.319:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	w11, [x19, #3024]
	cbz	w11, .LBB90_327
// %bb.320:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x10, [x19]
	cmp	w11, #1                 // =1
	ldr	x10, [x10, #248]
	b.lt	.LBB90_326
// %bb.321:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x13, [x19, #3032]
	mov	x12, xzr
	add	x13, x13, #80           // =80
	b	.LBB90_323
.LBB90_322:                             //   in Loop: Header=BB90_323 Depth=2
	add	x12, x12, #1            // =1
	add	x13, x13, #192          // =192
	cmp	x12, x11
	b.eq	.LBB90_326
.LBB90_323:                             //   Parent Loop BB90_303 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w14, [x13, #-4]
	cmp	w14, w9
	b.hi	.LBB90_322
// %bb.324:                             //   in Loop: Header=BB90_323 Depth=2
	ldr	w14, [x13]
	cmp	w14, w9
	b.lo	.LBB90_322
// %bb.325:                             //   in Loop: Header=BB90_303 Depth=1
	ldur	x10, [x13, #-80]
.LBB90_326:                             //   in Loop: Header=BB90_303 Depth=1
	cbz	x10, .LBB90_354
.LBB90_327:                             //   in Loop: Header=BB90_303 Depth=1
	cbz	x8, .LBB90_333
// %bb.328:                             //   in Loop: Header=BB90_303 Depth=1
	add	x9, x8, #84             // =84
	add	x10, x8, #80            // =80
	b	.LBB90_334
.LBB90_329:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x11, [x28]
	add	x11, x11, #72           // =72
.LBB90_330:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x10, [x10, #8]
	ldr	w11, [x11]
	ldr	w12, [x19, #1184]
	ldr	w10, [x10]
	sub	w9, w9, w11
	lsr	w9, w9, w12
	sub	w10, w9, w10
	b	.LBB90_332
.LBB90_331:                             //   in Loop: Header=BB90_303 Depth=1
	mov	w10, w23
.LBB90_332:                             //   in Loop: Header=BB90_303 Depth=1
	madd	x8, x21, x24, x8
	b	.LBB90_336
.LBB90_333:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x10, [x28]
	add	x9, x10, #92            // =92
	add	x10, x10, #72           // =72
.LBB90_334:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x10]
	ldr	w11, [x19, #1184]
	ldr	w8, [x8]
	sub	w9, w9, w10
	lsr	w9, w9, w11
	sub	w10, w9, w8
.LBB90_335:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x8, [x19, #3032]
.LBB90_336:                             //   in Loop: Header=BB90_303 Depth=1
	str	w10, [x8, #84]
	mov	w10, w23
	ldr	x8, [x19, #3032]
	madd	x9, x21, x24, x8
	ldr	w9, [x9, #80]
	add	w11, w9, #3             // =3
	cmp	w11, #4                 // =4
	b.lo	.LBB90_350
// %bb.337:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	w11, [x19, #3024]
	cbz	w11, .LBB90_345
// %bb.338:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x10, [x19]
	cmp	w11, #1                 // =1
	ldr	x10, [x10, #248]
	b.lt	.LBB90_344
// %bb.339:                             //   in Loop: Header=BB90_303 Depth=1
	mov	x13, xzr
	add	x12, x8, #80            // =80
	b	.LBB90_341
.LBB90_340:                             //   in Loop: Header=BB90_341 Depth=2
	add	x13, x13, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x13, x11
	b.eq	.LBB90_344
.LBB90_341:                             //   Parent Loop BB90_303 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w14, [x12, #-4]
	cmp	w14, w9
	b.hi	.LBB90_340
// %bb.342:                             //   in Loop: Header=BB90_341 Depth=2
	ldr	w14, [x12]
	cmp	w14, w9
	b.lo	.LBB90_340
// %bb.343:                             //   in Loop: Header=BB90_303 Depth=1
	ldur	x10, [x12, #-80]
.LBB90_344:                             //   in Loop: Header=BB90_303 Depth=1
	cbz	x10, .LBB90_349
.LBB90_345:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x10, [x27]
	cbz	x10, .LBB90_347
// %bb.346:                             //   in Loop: Header=BB90_303 Depth=1
	add	x11, x10, #80           // =80
	b	.LBB90_348
.LBB90_347:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x11, [x28]
	add	x11, x11, #72           // =72
.LBB90_348:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x10, [x10, #8]
	ldr	w11, [x11]
	ldr	w12, [x19, #1184]
	ldr	w10, [x10]
	sub	w9, w9, w11
	lsr	w9, w9, w12
	sub	w10, w9, w10
	b	.LBB90_350
.LBB90_349:                             //   in Loop: Header=BB90_303 Depth=1
	mov	w10, w23
.LBB90_350:                             //   in Loop: Header=BB90_303 Depth=1
	add	x9, x21, x21, lsl #1
	lsl	x20, x9, #6
	add	x8, x8, x20
	str	w10, [x8, #88]
	ldr	x8, [x19, #136]
	ldr	x9, [x19, #3032]
	ldr	w8, [x8, #100]
	add	x9, x9, x20
	lsr	w8, w8, #1
	str	w8, [x9, #172]
	ldr	x8, [x19, #136]
	ldr	x9, [x19, #3032]
	ldr	w8, [x8, #104]
	add	x9, x9, x20
	cmp	w8, #0                  // =0
	cinc	w8, w8, lt
	cmp	w21, #1                 // =1
	asr	w8, w8, #1
	str	w8, [x9, #176]
	b.eq	.LBB90_301
// %bb.351:                             //   in Loop: Header=BB90_303 Depth=1
	cbnz	w21, .LBB90_353
// %bb.352:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x9, [x19, #136]
	ldr	x8, [x19, #3032]
	ldr	w9, [x9, #96]
	ldr	w10, [x8, #264]
	sub	w9, w9, w10
	b	.LBB90_302
.LBB90_353:                             //   in Loop: Header=BB90_303 Depth=1
	mov	x0, x19
	mov	x1, x22
	mov	w2, w21
	bl	f2fs_printk
	ldr	x8, [x19, #3032]
	mov	w9, wzr
	b	.LBB90_302
.LBB90_354:                             //   in Loop: Header=BB90_303 Depth=1
	ldr	x8, [x19, #3032]
	mov	w10, w23
	b	.LBB90_336
.LBB90_355:
	cbz	x22, .LBB90_70
// %bb.356:
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
	b.ne	.LBB90_528
// %bb.357:
	tbnz	w8, #0, .LBB90_371
// %bb.358:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_361
// %bb.359:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_361
// %bb.360:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_361:
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_363
// %bb.362:
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB90_627
.LBB90_363:
	ldr	x0, [x22, #24]
.LBB90_364:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_366
// %bb.365:
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB90_628
.LBB90_366:
	ldr	x0, [x22, #24]
.LBB90_367:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB90_369
// %bb.368:
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB90_629
.LBB90_369:
	ldr	x0, [x22, #24]
.LBB90_370:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB90_371:
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB90_534
// %bb.372:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_373:
	ldr	x8, [sp]                // 8-byte Folded Reload
	add	x0, x8, #280            // =280
	str	x0, [sp]                // 8-byte Folded Spill
	bl	down_read
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	ldrh	w8, [x8]
	cbz	w8, .LBB90_514
// %bb.374:
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	str	xzr, [sp, #56]          // 8-byte Folded Spill
	add	x8, x8, #2              // =2
	str	x8, [sp, #40]           // 8-byte Folded Spill
	b	.LBB90_378
.LBB90_375:                             //   in Loop: Header=BB90_378 Depth=1
	mov	w9, #-1
.LBB90_376:                             //   in Loop: Header=BB90_378 Depth=1
	lsl	x9, x9, #2
	ldr	w10, [x8, x9]
	sub	w10, w10, w21
	str	w10, [x8, x9]
.LBB90_377:                             //   in Loop: Header=BB90_378 Depth=1
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	ldr	x9, [sp, #56]           // 8-byte Folded Reload
	ldrh	w8, [x8]
	add	x9, x9, #1              // =1
	cmp	x9, x8
	str	x9, [sp, #56]           // 8-byte Folded Spill
	b.hs	.LBB90_514
.LBB90_378:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB90_382 Depth 2
	ldr	x8, [sp, #56]           // 8-byte Folded Reload
	mov	w9, #78
	ldr	x10, [sp, #40]          // 8-byte Folded Reload
	mul	x8, x8, x9
	ldr	x9, [x27]
	ldr	w22, [x10, x8]
	ldr	w8, [x9, #96]
	cmp	w22, w8
	b.hs	.LBB90_536
// %bb.379:                             //   in Loop: Header=BB90_378 Depth=1
	ldr	x8, [sp, #56]           // 8-byte Folded Reload
	mov	w10, #78
	ldp	x11, x9, [sp, #32]      // 16-byte Folded Reload
	mov	w25, wzr
	mov	w0, wzr
	madd	x8, x8, x10, x9
	ldr	x13, [x11, #136]
	ldur	x9, [x8, #4]
	ldur	x10, [x8, #12]
	str	x13, [sp, #16]          // 8-byte Folded Spill
	stp	x9, x10, [sp, #72]
	ldur	x9, [x8, #44]
	ldur	x10, [x8, #36]
	ldur	x11, [x8, #20]
	ldur	x12, [x8, #28]
	stp	x10, x9, [sp, #104]
	stp	x11, x12, [sp, #88]
	mov	w12, #48
	ldrh	w9, [x8, #76]
	ldur	x10, [x8, #68]
	madd	x26, x22, x12, x13
	ldur	x11, [x8, #52]
	ldur	x8, [x8, #60]
	strh	w9, [sp, #144]
	str	x11, [sp, #120]
	stp	x8, x10, [sp, #128]
	ldr	w24, [x26]
	ldur	x8, [sp, #74]
	ldr	x10, [sp, #64]          // 8-byte Folded Reload
	and	w9, w24, #0x3f
	sub	w9, w9, #3              // =3
	and	w20, w8, #0x1
	ldr	w10, [x10]
	str	w9, [sp, #24]           // 4-byte Folded Spill
	b	.LBB90_382
.LBB90_380:                             //   in Loop: Header=BB90_382 Depth=2
	mov	x2, x21
	bl	find_next_bit
.LBB90_381:                             //   in Loop: Header=BB90_382 Depth=2
	ldr	x8, [sp, #64]           // 8-byte Folded Reload
	eor	w20, w20, #0x1
	ldr	w10, [x8]
	cmp	w0, w10
	b.hs	.LBB90_384
.LBB90_382:                             //   Parent Loop BB90_378 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	w1, w10
	sxtw	x21, w0
	mov	x0, x23
	tbz	w20, #0, .LBB90_380
// %bb.383:                             //   in Loop: Header=BB90_382 Depth=2
	mov	x2, x21
	bl	find_next_zero_bit
	sub	w8, w25, w21
	add	w25, w8, w0
	b	.LBB90_381
.LBB90_384:                             //   in Loop: Header=BB90_378 Depth=1
	ldr	w8, [sp, #24]           // 4-byte Folded Reload
	ubfx	w21, w24, #6, #10
	ldrh	w9, [sp, #72]
	cmp	w8, #3                  // =3
	csneg	w8, wzr, w21, hs
	and	w2, w9, #0x3ff
	cmp	w25, w2
	b.ne	.LBB90_601
// %bb.385:                             //   in Loop: Header=BB90_378 Depth=1
	cmp	w10, w25
	b.lo	.LBB90_596
// %bb.386:                             //   in Loop: Header=BB90_378 Depth=1
	ldr	x10, [x27]
	cbz	x10, .LBB90_388
// %bb.387:                             //   in Loop: Header=BB90_378 Depth=1
	add	x10, x10, #92           // =92
	b	.LBB90_389
.LBB90_388:                             //   in Loop: Header=BB90_378 Depth=1
	ldr	x10, [x28]
	add	x10, x10, #48           // =48
.LBB90_389:                             //   in Loop: Header=BB90_378 Depth=1
	ldr	w10, [x10]
	sub	w10, w10, #1            // =1
	cmp	w10, w22
	b.lo	.LBB90_596
// %bb.390:                             //   in Loop: Header=BB90_378 Depth=1
	ldr	w10, [x26]
	mov	w11, #48
	mov	x1, x23
	mov	w2, #64
	mul	x11, x22, x11
	bfi	w10, w9, #6, #10
	str	w10, [x26]
	ldrh	w9, [sp, #72]
	and	w9, w9, #0x3ff
	bfi	w10, w9, #16, #10
	ldr	x9, [sp, #16]           // 8-byte Folded Reload
	str	w10, [x26]
	add	x24, x9, x11
	ldr	x0, [x24, #8]!
	ldr	w9, [sp, #48]           // 4-byte Folded Reload
	add	w20, w8, w9
	bl	memcpy
	ldr	x0, [x24, #16]
	mov	x1, x23
	mov	w2, #64
	bl	memcpy
	ldr	x0, [x24, #8]
	mov	x1, x23
	mov	w2, #64
	bl	memcpy
	ldr	w8, [x26]
	ldrh	w9, [sp, #72]
	ldr	x0, [x24, #24]
	and	w10, w8, #0xffffffc0
	ubfx	w8, w8, #6, #10
	orr	w10, w10, w9, lsr #10
	sub	w9, w9, #3072           // =3072
	cmp	w9, #3072               // =3072
	csel	w25, w8, wzr, lo
	str	w10, [x26]
	ldur	x10, [sp, #138]
	str	x10, [x24, #32]
	ldr	x10, [x19, #224]
	ldrb	w10, [x10, #133]
	tbnz	w10, #0, .LBB90_392
// %bb.391:                             //   in Loop: Header=BB90_378 Depth=1
	ldr	x1, [x24]
	mov	w2, #64
	bl	memcpy
	ldr	w8, [x19, #1244]
	add	w8, w8, w21
	str	w8, [x19, #1244]
	ldr	w9, [x26]
	ubfx	w9, w9, #6, #10
	sub	w8, w8, w9
	str	w8, [x19, #1244]
	b	.LBB90_393
.LBB90_392:                             //   in Loop: Header=BB90_378 Depth=1
	mov	w1, #255
	mov	w2, #64
	bl	memset
.LBB90_393:                             //   in Loop: Header=BB90_378 Depth=1
	ldr	w10, [x19, #1192]
	add	w8, w20, w25
	str	w8, [sp, #48]           // 4-byte Folded Spill
	cmp	w10, #2                 // =2
	b.lo	.LBB90_377
// %bb.394:                             //   in Loop: Header=BB90_378 Depth=1
	ldr	x8, [x27]
	cmn	w22, #1                 // =1
	ldr	w9, [x26]
	ldr	x8, [x8]
	ubfx	w9, w9, #6, #10
	ldr	x8, [x8, #144]
	b.eq	.LBB90_396
// %bb.395:                             //   in Loop: Header=BB90_378 Depth=1
	udiv	w10, w22, w10
	b	.LBB90_397
.LBB90_396:                             //   in Loop: Header=BB90_378 Depth=1
	mov	w10, #-1
.LBB90_397:                             //   in Loop: Header=BB90_378 Depth=1
	lsl	x10, x10, #2
	cmn	w22, #1                 // =1
	ldr	w11, [x8, x10]
	add	w9, w11, w9
	str	w9, [x8, x10]
	ldr	x8, [x27]
	ldr	x8, [x8]
	ldr	x8, [x8, #144]
	b.eq	.LBB90_375
// %bb.398:                             //   in Loop: Header=BB90_378 Depth=1
	ldr	w9, [x19, #1192]
	udiv	w9, w22, w9
	b	.LBB90_376
.LBB90_399:
	ldr	w9, [x19, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB90_401
.LBB90_400:
	ldr	x8, [x19, #3032]
	ldr	w9, [x19, #3304]
	ldr	w10, [x8, #88]
	ldr	w8, [x8, #280]
	sub	w20, w10, w9
	str	w10, [sp, #48]          // 4-byte Folded Spill
	str	w8, [sp, #56]           // 4-byte Folded Spill
	sub	w8, w8, w9
	mov	w9, #2
	str	x8, [sp, #8]            // 8-byte Folded Spill
	b	.LBB90_402
.LBB90_401:
                                        // implicit-def: $w8
                                        // kill: killed $w8
                                        // implicit-def: $w20
                                        // implicit-def: $w8
	str	x8, [sp, #8]            // 8-byte Folded Spill
                                        // implicit-def: $w8
                                        // kill: killed $w8
.LBB90_402:
	ldr	x8, [x27]
	ldr	w10, [x8, #96]
	cbz	w10, .LBB90_437
// %bb.403:
	mov	w10, w20
	mov	x23, xzr
	mov	x21, xzr
	str	x10, [sp, #40]          // 8-byte Folded Spill
	ldr	x10, [sp, #8]           // 8-byte Folded Reload
	mov	w10, w10
	str	x10, [sp, #24]          // 8-byte Folded Spill
	ldr	w10, [sp, #48]          // 4-byte Folded Reload
	mov	w10, w10
	str	x10, [sp, #32]          // 8-byte Folded Spill
	ldr	w10, [sp, #56]          // 4-byte Folded Reload
	mov	w10, w10
	str	x10, [sp, #16]          // 8-byte Folded Spill
	cbz	w9, .LBB90_409
.LBB90_404:
	cbz	x8, .LBB90_406
// %bb.405:
	add	x9, x8, #80             // =80
	b	.LBB90_407
.LBB90_406:
	ldr	x9, [x28]
	add	x9, x9, #72             // =72
.LBB90_407:
	ldr	x8, [x8, #8]
	mov	x0, x19
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	add	w8, w21, w8
	lsl	w8, w8, w10
	add	w1, w8, w9
	bl	f2fs_target_device_index
	mov	w9, #192
	ldr	x8, [x19, #3032]
	smull	x9, w0, w9
	ldr	x8, [x8, x9]
	cbz	x8, .LBB90_434
// %bb.408:
	ldr	x8, [x27]
.LBB90_409:
	ldr	x9, [x8]
	ldr	w10, [x19, #3304]
	ldr	x22, [x9, #136]
	cbz	w10, .LBB90_417
// %bb.410:
	ldr	w9, [x19, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB90_417
// %bb.411:
	ldr	x9, [sp, #40]           // 8-byte Folded Reload
	cmp	x21, x9
	b.lo	.LBB90_413
// %bb.412:
	ldr	x9, [sp, #32]           // 8-byte Folded Reload
	cmp	x21, x9
	b.lo	.LBB90_415
.LBB90_413:
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	cmp	x21, x9
	b.lo	.LBB90_417
// %bb.414:
	ldr	x9, [sp, #16]           // 8-byte Folded Reload
	cmp	x21, x9
	b.hs	.LBB90_417
.LBB90_415:
	ldr	w9, [x22, x23]
	ubfx	w3, w9, #6, #10
	cbz	w3, .LBB90_417
// %bb.416:
	adrp	x1, .L.str.56
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.56
	mov	w2, w21
	bl	f2fs_printk
	adrp	x1, .L.str.57
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.57
	bl	f2fs_printk
	ldr	x8, [x19, #136]
	str	wzr, [x19, #3304]
.LBB90_417:
	ldr	w9, [x22, x23]
	ubfx	w9, w9, #6, #10
	cbz	w9, .LBB90_423
// %bb.418:
	ldr	x8, [x8]
	ldr	w10, [x8, #16]
	add	w9, w10, w9
	str	w9, [x8, #16]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB90_434
// %bb.419:
	ldr	x8, [x28]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB90_434
// %bb.420:
	ldr	x8, [x19, #3032]
	ldr	w9, [x22, x23]
	ldr	w10, [x8, #84]
	ubfx	w9, w9, #6, #10
	cmp	x21, x10
	b.lo	.LBB90_422
// %bb.421:
	ldr	w10, [x8, #88]
	cmp	x21, x10
	b.ls	.LBB90_436
.LBB90_422:
	ldr	w10, [x8, #376]
	add	w9, w10, w9
	str	w9, [x8, #376]
	b	.LBB90_434
.LBB90_423:
	ldr	x26, [x8, #8]
	ldr	w9, [x19, #1192]
	add	x24, x26, #12           // =12
	udiv	w22, w21, w9
	mov	x0, x24
	mul	w25, w22, w9
	bl	_raw_spin_lock
	ldr	x8, [x26, #16]
	ubfx	x9, x21, #6, #26
	add	x8, x8, x9, lsl #3
	mov	w9, #1
	lsl	x9, x9, x21
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	w8, [x26, #4]
	add	w8, w8, #1              // =1
	str	w8, [x26, #4]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB90_431
// %bb.424:
	ldr	x8, [x28]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB90_431
// %bb.425:
	ldr	x8, [x19, #3032]
	ldr	w9, [x8, #84]
	cmp	x21, x9
	b.lo	.LBB90_428
// %bb.426:
	ldr	w9, [x8, #88]
	cmp	x21, x9
	b.hi	.LBB90_428
// %bb.427:
	ldr	w9, [x8, #168]
	add	w9, w9, #1              // =1
	str	w9, [x8, #168]
	ldr	x8, [x19, #3032]
.LBB90_428:
	ldr	w9, [x8, #276]
	cmp	x21, x9
	b.lo	.LBB90_431
// %bb.429:
	ldr	w9, [x8, #280]
	cmp	x21, x9
	b.hi	.LBB90_431
// %bb.430:
	ldr	w9, [x8, #360]
	add	w9, w9, #1              // =1
	str	w9, [x8, #360]
.LBB90_431:
	ldr	w8, [x19, #1192]
	mov	w2, w25
	ldr	x0, [x26, #16]
	add	w1, w8, w25
	bl	find_next_bit
	ldr	w8, [x19, #1192]
	add	w8, w8, w25
	cmp	w8, w0
	b.hi	.LBB90_433
// %bb.432:
	ldr	x8, [x26, #24]
	lsr	w9, w22, #6
	add	x8, x8, w9, uxtw #3
	mov	w9, #1
	lsl	x9, x9, x22
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	w8, [x26, #8]
	add	w8, w8, #1              // =1
	str	w8, [x26, #8]
.LBB90_433:
	mov	x0, x24
	bl	_raw_spin_unlock
.LBB90_434:
	ldr	x8, [x27]
	add	x21, x21, #1            // =1
	ldr	w9, [x8, #96]
	cmp	x21, x9
	b.hs	.LBB90_437
// %bb.435:
	ldr	w9, [x19, #3024]
	add	x23, x23, #48           // =48
	cbnz	w9, .LBB90_404
	b	.LBB90_409
.LBB90_436:
	ldr	w10, [x8, #184]
	add	w9, w10, w9
	str	w9, [x8, #184]
	b	.LBB90_434
.LBB90_437:
	ldr	w9, [x19, #3304]
	cbz	w9, .LBB90_482
// %bb.438:
	ldr	w9, [x19, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB90_482
// %bb.439:
	ldr	w9, [sp, #48]           // 4-byte Folded Reload
	cmp	w20, w9
	b.hs	.LBB90_460
// %bb.440:
	mov	w9, #1
.LBB90_441:                             // =>This Inner Loop Header: Depth=1
	ldr	x8, [x8, #8]
	mov	x15, x20
	lsr	w11, w15, #6
	ldr	w12, [x19, #1192]
	ldr	x10, [x8, #16]
	add	x10, x10, w11, uxtw #3
	lsl	x11, x9, x20
	//APP
	// atomic64_or
	prfm	pstl1strm, [x10]
1:	ldxr	x13, [x10]
	orr	x13, x13, x11
	stxr	w14, x13, [x10]
	cbnz	w14, 1b
	//NO_APP
	ldr	w10, [x8, #4]
	sub	w10, w10, #1            // =1
	str	w10, [x8, #4]
	udiv	w10, w15, w12
	ldr	w11, [x19, #3024]
	cmp	w11, #2                 // =2
	b.ne	.LBB90_449
// %bb.442:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	x11, [x28]
	ldrb	w11, [x11, #2182]
	tbz	w11, #0, .LBB90_449
// %bb.443:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	x11, [x19, #3032]
	ldr	w12, [x11, #84]
	cmp	w12, w20
	b.hi	.LBB90_446
// %bb.444:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	w12, [x11, #88]
	cmp	w12, w20
	b.lo	.LBB90_446
// %bb.445:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	w12, [x11, #168]
	sub	w12, w12, #1            // =1
	str	w12, [x11, #168]
	ldr	x11, [x19, #3032]
.LBB90_446:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	w12, [x11, #276]
	cmp	w12, w20
	b.hi	.LBB90_449
// %bb.447:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	w12, [x11, #280]
	cmp	w12, w20
	b.lo	.LBB90_449
// %bb.448:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	w12, [x11, #360]
	sub	w12, w12, #1            // =1
	str	w12, [x11, #360]
.LBB90_449:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	x11, [x8, #24]
	lsr	w12, w10, #6
	lsl	x10, x9, x10
	ldr	x13, [x11, w12, uxtw #3]
	str	x13, [sp, #72]
	ldr	x13, [sp, #72]
	tst	x13, x10
	b.ne	.LBB90_452
// %bb.450:                             //   in Loop: Header=BB90_441 Depth=1
	add	x11, x11, x12, lsl #3
	//APP
	// atomic64_fetch_or
	prfm	pstl1strm, [x11]
1:	ldxr	x12, [x11]
	orr	x13, x12, x10
	stlxr	w14, x13, [x11]
	cbnz	w14, 1b
	dmb ish
	//NO_APP
	tst	x12, x10
	b.ne	.LBB90_452
// %bb.451:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	w10, [x8, #8]
	sub	w10, w10, #1            // =1
	str	w10, [x8, #8]
.LBB90_452:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB90_458
// %bb.453:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	x8, [x28]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB90_458
// %bb.454:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	x8, [x19, #3032]
	ldr	w10, [x19, #1188]
	ldr	w11, [x8, #84]
	cmp	w11, w20
	b.hi	.LBB90_456
// %bb.455:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	w11, [x8, #88]
	cmp	w11, w20
	b.hs	.LBB90_457
.LBB90_456:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	w11, [x8, #376]
	add	w10, w11, w10
	str	w10, [x8, #376]
	b	.LBB90_458
.LBB90_457:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	w11, [x8, #184]
	add	w10, w11, w10
	str	w10, [x8, #184]
.LBB90_458:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	w8, [sp, #48]           // 4-byte Folded Reload
	mov	x10, x20
	add	w10, w10, #1            // =1
	cmp	w10, w8
	b.eq	.LBB90_460
// %bb.459:                             //   in Loop: Header=BB90_441 Depth=1
	ldr	x8, [x27]
	mov	x20, x10
	b	.LBB90_441
.LBB90_460:
	ldr	x16, [sp, #8]           // 8-byte Folded Reload
	ldr	w8, [sp, #56]           // 4-byte Folded Reload
	cmp	w16, w8
	b.hs	.LBB90_480
// %bb.461:
	mov	w8, #1
	b	.LBB90_464
.LBB90_462:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	w11, [x9, #376]
	add	w10, w11, w10
	str	w10, [x9, #376]
.LBB90_463:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	w9, [sp, #56]           // 4-byte Folded Reload
	mov	x16, x15
	add	w16, w16, #1            // =1
	cmp	w16, w9
	b.eq	.LBB90_480
.LBB90_464:                             // =>This Inner Loop Header: Depth=1
	ldr	x9, [x19, #136]
	lsr	w11, w16, #6
	ldr	w12, [x19, #1192]
	mov	x15, x16
	ldr	x9, [x9, #8]
	ldr	x10, [x9, #16]
	add	x10, x10, w11, uxtw #3
	lsl	x11, x8, x16
	//APP
	// atomic64_or
	prfm	pstl1strm, [x10]
1:	ldxr	x13, [x10]
	orr	x13, x13, x11
	stxr	w14, x13, [x10]
	cbnz	w14, 1b
	//NO_APP
	ldr	w10, [x9, #4]
	sub	w10, w10, #1            // =1
	str	w10, [x9, #4]
	udiv	w10, w16, w12
	ldr	w11, [x19, #3024]
	cmp	w11, #2                 // =2
	b.ne	.LBB90_472
// %bb.465:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	x11, [x28]
	ldrb	w11, [x11, #2182]
	tbz	w11, #0, .LBB90_472
// %bb.466:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	x11, [x19, #3032]
	ldr	w12, [x11, #84]
	cmp	w12, w16
	b.hi	.LBB90_469
// %bb.467:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	w12, [x11, #88]
	cmp	w12, w15
	b.lo	.LBB90_469
// %bb.468:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	w12, [x11, #168]
	sub	w12, w12, #1            // =1
	str	w12, [x11, #168]
	ldr	x11, [x19, #3032]
.LBB90_469:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	w12, [x11, #276]
	mov	x13, x15
	cmp	w12, w13
	b.hi	.LBB90_472
// %bb.470:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	w12, [x11, #280]
	cmp	w12, w13
	b.lo	.LBB90_472
// %bb.471:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	w12, [x11, #360]
	sub	w12, w12, #1            // =1
	str	w12, [x11, #360]
.LBB90_472:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	x11, [x9, #24]
	lsr	w12, w10, #6
	lsl	x10, x8, x10
	ldr	x13, [x11, w12, uxtw #3]
	str	x13, [sp, #72]
	ldr	x13, [sp, #72]
	tst	x13, x10
	b.ne	.LBB90_475
// %bb.473:                             //   in Loop: Header=BB90_464 Depth=1
	add	x11, x11, x12, lsl #3
	//APP
	// atomic64_fetch_or
	prfm	pstl1strm, [x11]
1:	ldxr	x12, [x11]
	orr	x13, x12, x10
	stlxr	w14, x13, [x11]
	cbnz	w14, 1b
	dmb ish
	//NO_APP
	tst	x12, x10
	b.ne	.LBB90_475
// %bb.474:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	w10, [x9, #8]
	sub	w10, w10, #1            // =1
	str	w10, [x9, #8]
.LBB90_475:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	w9, [x19, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB90_463
// %bb.476:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	x9, [x28]
	ldrb	w9, [x9, #2182]
	tbz	w9, #0, .LBB90_463
// %bb.477:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	x9, [x19, #3032]
	ldr	w10, [x19, #1188]
	ldr	w11, [x9, #84]
	cmp	w11, w15
	b.hi	.LBB90_462
// %bb.478:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	w11, [x9, #88]
	cmp	w11, w15
	b.lo	.LBB90_462
// %bb.479:                             //   in Loop: Header=BB90_464 Depth=1
	ldr	w11, [x9, #184]
	add	w10, w11, w10
	str	w10, [x9, #184]
	b	.LBB90_463
.LBB90_480:
	ldr	x8, [x19, #224]
	ldrb	w8, [x8, #134]
	tbnz	w8, #1, .LBB90_482
// %bb.481:
	add	x21, x19, #236          // =236
	mov	x0, x21
	bl	_raw_spin_lock_irqsave
	ldr	x8, [x19, #224]
	mov	x1, x0
	mov	x0, x21
	ldr	w9, [x8, #132]
	orr	w9, w9, #0x20000
	str	w9, [x8, #132]
	bl	_raw_spin_unlock_irqrestore
	ldr	w8, [x19, #3304]
	ldr	w9, [x19, #1188]
	ldr	w10, [x19, #1240]
	mul	w8, w8, w9
	add	w8, w10, w8, lsl #1
	str	w8, [x19, #1240]
	str	w8, [x19, #1248]
.LBB90_482:
	mov	x22, xzr
	mov	w23, #100
	mov	w20, #-1
	b	.LBB90_485
.LBB90_483:                             //   in Loop: Header=BB90_485 Depth=1
	ldr	x8, [x26, #24]
	lsr	w10, w24, #6
	ldr	x9, [x8, w10, uxtw #3]
	str	x9, [sp, #72]
	mov	w9, #1
	ldr	x11, [sp, #72]
	lsl	x9, x9, x24
	tst	x11, x9
	b.eq	.LBB90_498
.LBB90_484:                             //   in Loop: Header=BB90_485 Depth=1
	mov	x0, x21
	bl	_raw_spin_unlock
	add	x22, x22, #1            // =1
	add	x23, x23, #120          // =120
	cmp	x22, #6                 // =6
	b.eq	.LBB90_500
.LBB90_485:                             // =>This Inner Loop Header: Depth=1
	ldr	x8, [x27]
	ldr	x9, [x8, #24]
	ldr	x26, [x8, #8]
	ldr	w25, [x9, x23]
	cmn	w25, #1                 // =1
	b.eq	.LBB90_487
// %bb.486:                             //   in Loop: Header=BB90_485 Depth=1
	ldr	w8, [x19, #1192]
	udiv	w24, w25, w8
	b	.LBB90_488
.LBB90_487:                             //   in Loop: Header=BB90_485 Depth=1
	mov	w24, w20
.LBB90_488:                             //   in Loop: Header=BB90_485 Depth=1
	add	x21, x26, #12           // =12
	mov	x0, x21
	bl	_raw_spin_lock
	ldr	x8, [x26, #16]
	lsr	x10, x25, #6
	ldr	x9, [x8, x10, lsl #3]
	str	x9, [sp, #72]
	mov	w9, #1
	ldr	x11, [sp, #72]
	lsl	x9, x9, x25
	tst	x11, x9
	b.ne	.LBB90_484
// %bb.489:                             //   in Loop: Header=BB90_485 Depth=1
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
	b.ne	.LBB90_484
// %bb.490:                             //   in Loop: Header=BB90_485 Depth=1
	ldr	w8, [x26, #4]
	sub	w8, w8, #1              // =1
	str	w8, [x26, #4]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB90_483
// %bb.491:                             //   in Loop: Header=BB90_485 Depth=1
	ldr	x8, [x28]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB90_483
// %bb.492:                             //   in Loop: Header=BB90_485 Depth=1
	ldr	x8, [x19, #3032]
	ldr	w9, [x8, #84]
	cmp	w9, w25
	b.hi	.LBB90_495
// %bb.493:                             //   in Loop: Header=BB90_485 Depth=1
	ldr	w9, [x8, #88]
	cmp	w9, w25
	b.lo	.LBB90_495
// %bb.494:                             //   in Loop: Header=BB90_485 Depth=1
	ldr	w9, [x8, #168]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #168]
	ldr	x8, [x19, #3032]
.LBB90_495:                             //   in Loop: Header=BB90_485 Depth=1
	ldr	w9, [x8, #276]
	cmp	w9, w25
	b.hi	.LBB90_483
// %bb.496:                             //   in Loop: Header=BB90_485 Depth=1
	ldr	w9, [x8, #280]
	cmp	w9, w25
	b.lo	.LBB90_483
// %bb.497:                             //   in Loop: Header=BB90_485 Depth=1
	ldr	w9, [x8, #360]
	sub	w9, w9, #1              // =1
	str	w9, [x8, #360]
	b	.LBB90_483
.LBB90_498:                             //   in Loop: Header=BB90_485 Depth=1
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
	b.ne	.LBB90_484
// %bb.499:                             //   in Loop: Header=BB90_485 Depth=1
	ldr	w8, [x26, #8]
	sub	w8, w8, #1              // =1
	str	w8, [x26, #8]
	b	.LBB90_484
.LBB90_500:
	adrp	x8, kmalloc_caches
	mov	w1, #32960
	add	x8, x8, :lo12:kmalloc_caches
	mov	w2, #152
	movk	w1, #96, lsl #16
	ldr	x0, [x8, #16]
	bl	kmem_cache_alloc_trace
	cbz	x0, .LBB90_575
// %bb.501:
	ldr	x8, [x27]
	adrp	x1, .L.str.58
	adrp	x2, build_dirty_segmap.__key
	mov	x21, x0
	add	x0, x0, #80             // =80
	add	x1, x1, :lo12:.L.str.58
	add	x2, x2, :lo12:build_dirty_segmap.__key
	str	x21, [x8, #16]
	bl	__mutex_init
	ldr	x8, [x27]
	mov	w1, #32960
	mov	w2, #-1
	movk	w1, #96, lsl #16
	ldr	w8, [x8, #96]
	add	x8, x8, #63             // =63
	lsr	x8, x8, #3
	and	x22, x8, #0x3ffffff8
	mov	x0, x22
	bl	kvmalloc_node
	str	x0, [x21, #8]
	cbz	x0, .LBB90_575
// %bb.502:
	mov	w1, #32960
	mov	w2, #-1
	mov	x0, x22
	movk	w1, #96, lsl #16
	bl	kvmalloc_node
	str	x0, [x21, #16]
	cbz	x0, .LBB90_575
// %bb.503:
	mov	w1, #32960
	mov	w2, #-1
	mov	x0, x22
	movk	w1, #96, lsl #16
	bl	kvmalloc_node
	str	x0, [x21, #24]
	cbz	x0, .LBB90_575
// %bb.504:
	mov	w1, #32960
	mov	w2, #-1
	mov	x0, x22
	movk	w1, #96, lsl #16
	bl	kvmalloc_node
	str	x0, [x21, #32]
	cbz	x0, .LBB90_575
// %bb.505:
	mov	w1, #32960
	mov	w2, #-1
	mov	x0, x22
	movk	w1, #96, lsl #16
	bl	kvmalloc_node
	str	x0, [x21, #40]
	cbz	x0, .LBB90_575
// %bb.506:
	mov	w1, #32960
	mov	w2, #-1
	mov	x0, x22
	movk	w1, #96, lsl #16
	bl	kvmalloc_node
	str	x0, [x21, #48]
	cbz	x0, .LBB90_575
// %bb.507:
	mov	w1, #32960
	mov	w2, #-1
	mov	x0, x22
	movk	w1, #96, lsl #16
	bl	kvmalloc_node
	str	x0, [x21, #56]
	cbz	x0, .LBB90_575
// %bb.508:
	mov	w1, #32960
	mov	w2, #-1
	mov	x0, x22
	movk	w1, #96, lsl #16
	bl	kvmalloc_node
	str	x0, [x21, #64]
	cbz	x0, .LBB90_575
// %bb.509:
	ldr	w8, [x19, #1192]
	cmp	w8, #1                  // =1
	str	w8, [sp, #48]           // 4-byte Folded Spill
	b.ls	.LBB90_512
// %bb.510:
	ldr	w8, [x19, #1200]
	mov	w1, #32960
	mov	w2, #-1
	movk	w1, #96, lsl #16
	add	x8, x8, #63             // =63
	lsr	x8, x8, #3
	and	x0, x8, #0x3ffffff8
	bl	kvmalloc_node
	str	x0, [x21, #72]
	cbz	x0, .LBB90_575
// %bb.511:
	ldr	w8, [x19, #1192]
	str	w8, [sp, #48]           // 4-byte Folded Spill
.LBB90_512:
	ldr	x8, [x27]
	ldp	x25, x9, [x8, #8]
	ldr	w22, [x8, #96]
	str	x9, [sp, #56]           // 8-byte Folded Spill
	add	x21, x25, #12           // =12
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	mov	x0, x21
	ldr	w9, [x9]
	str	w9, [sp, #40]           // 4-byte Folded Spill
	bl	_raw_spin_lock
	ldr	x0, [x25, #16]
	mov	x1, x22
	mov	x2, xzr
	bl	find_next_bit
	mov	x22, x0
	mov	x0, x21
	bl	_raw_spin_unlock
	ldr	x8, [x27]
	ldr	w9, [x8, #96]
	cmp	w9, w22
	b.ls	.LBB90_551
// %bb.513:
	ldr	x9, [sp, #56]           // 8-byte Folded Reload
	mov	w26, #48
	add	x23, x9, #80            // =80
	b	.LBB90_519
.LBB90_514:
	ldr	x0, [sp]                // 8-byte Folded Reload
	bl	up_read
	ldr	w3, [x19, #1208]
	ldr	w8, [sp, #48]           // 4-byte Folded Reload
	cmp	w8, w3
	b.eq	.LBB90_298
// %bb.515:
	adrp	x1, .L.str.55
	ldr	w2, [sp, #48]           // 4-byte Folded Reload
	add	x1, x1, :lo12:.L.str.55
	mov	x0, x19
	bl	f2fs_printk
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_550
// %bb.516:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_550
// %bb.517:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.43
	adrp	x2, .L__func__.build_sit_entries
	add	x1, x1, :lo12:.L.str.43
	mov	w3, #6797
	add	x2, x2, :lo12:.L__func__.build_sit_entries
	b	.LBB90_549
.LBB90_518:                             //   in Loop: Header=BB90_519 Depth=1
	ldr	x8, [x27]
	mov	x0, x21
	add	w20, w22, #1            // =1
	ldr	w24, [x8, #96]
	bl	_raw_spin_lock
	ldr	x0, [x25, #16]
	mov	w2, w20
	mov	x1, x24
	bl	find_next_bit
	mov	x22, x0
	mov	x0, x21
	bl	_raw_spin_unlock
	ldr	x8, [x27]
	ldr	w9, [x8, #96]
	cmp	w9, w22
	b.ls	.LBB90_551
.LBB90_519:                             // =>This Inner Loop Header: Depth=1
	ldr	w9, [x19, #3024]
	cbz	w9, .LBB90_525
// %bb.520:                             //   in Loop: Header=BB90_519 Depth=1
	cbz	x8, .LBB90_522
// %bb.521:                             //   in Loop: Header=BB90_519 Depth=1
	add	x9, x8, #80             // =80
	b	.LBB90_523
.LBB90_522:                             //   in Loop: Header=BB90_519 Depth=1
	ldr	x9, [x28]
	add	x9, x9, #72             // =72
.LBB90_523:                             //   in Loop: Header=BB90_519 Depth=1
	ldr	x8, [x8, #8]
	mov	x0, x19
	ldr	w9, [x9]
	ldr	w10, [x19, #1184]
	ldr	w8, [x8]
	add	w8, w8, w22
	lsl	w8, w8, w10
	add	w1, w8, w9
	bl	f2fs_target_device_index
	mov	w9, #192
	ldr	x8, [x19, #3032]
	smull	x9, w0, w9
	ldr	x8, [x8, x9]
	cbz	x8, .LBB90_518
// %bb.524:                             //   in Loop: Header=BB90_519 Depth=1
	ldr	x8, [x27]
.LBB90_525:                             //   in Loop: Header=BB90_519 Depth=1
	ldr	x8, [x8]
	and	x9, x22, #0xffffffff
	mul	x9, x9, x26
	ldr	x8, [x8, #136]
	ldr	w9, [x8, x9]
	ldr	x8, [sp, #64]           // 8-byte Folded Reload
	ubfx	w9, w9, #6, #10
	ldr	w8, [x8]
	cmp	w9, w8
	ccmp	w9, #0, #4, ne
	b.eq	.LBB90_518
// %bb.526:                             //   in Loop: Header=BB90_519 Depth=1
	cmp	w9, w8
	b.hi	.LBB90_644
// %bb.527:                             //   in Loop: Header=BB90_519 Depth=1
	mov	x0, x23
	bl	mutex_lock
	mov	x0, x19
	mov	w1, w22
	mov	w2, #6
	bl	__locate_dirty_segment
	mov	x0, x23
	bl	mutex_unlock
	b	.LBB90_518
.LBB90_528:
	tbnz	w8, #0, .LBB90_533
// %bb.529:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_532
// %bb.530:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_532
// %bb.531:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_532:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB90_533:
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB90_643
.LBB90_534:
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
	cbnz	w9, .LBB90_70
// %bb.535:
	bl	__put_page
	b	.LBB90_70
.LBB90_536:
	adrp	x1, .L.str.54
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.54
	mov	w2, w22
	bl	f2fs_printk
.LBB90_537:
	ldr	x0, [sp]                // 8-byte Folded Reload
	bl	up_read
	mov	w22, #-117
	b	.LBB90_576
.LBB90_538:
	adrp	x1, .L.str.44
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.44
	mov	w2, w22
	mov	w3, w25
	bl	f2fs_printk
	cbz	x19, .LBB90_540
// %bb.539:
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB90_540:
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_550
// %bb.541:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_550
// %bb.542:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.43
	adrp	x2, .L__func__.check_block_count
	add	x1, x1, :lo12:.L.str.43
	mov	w3, #1300
	b	.LBB90_548
.LBB90_543:
	adrp	x1, .L.str.42
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.42
	mov	w3, w22
	bl	f2fs_printk
	cbz	x19, .LBB90_545
// %bb.544:
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB90_545:
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_550
// %bb.546:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_550
// %bb.547:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.43
	adrp	x2, .L__func__.check_block_count
	add	x1, x1, :lo12:.L.str.43
	mov	w3, #1290
.LBB90_548:
	add	x2, x2, :lo12:.L__func__.check_block_count
.LBB90_549:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	mov	w8, #15241
	ldr	x0, [x19, :lo12:f2fs_dclient]
	movk	w8, #14160, lsl #16
	add	w1, w8, #3              // =3
	bl	dsm_client_notify
.LBB90_550:
	mov	w22, #-117
	b	.LBB90_576
.LBB90_551:
	ldr	w9, [x19, #1192]
	cmp	w9, #2                  // =2
	b.lo	.LBB90_572
// %bb.552:
	ldr	x8, [sp, #56]           // 8-byte Folded Reload
	add	x21, x8, #80            // =80
	mov	x0, x21
	bl	mutex_lock
	ldr	x11, [x27]
	ldr	w8, [x11, #96]
	cbz	w8, .LBB90_571
// %bb.553:
	ldr	w9, [sp, #48]           // 4-byte Folded Reload
	mov	w8, wzr
	ldr	w10, [sp, #40]          // 4-byte Folded Reload
	mov	w12, #48
	ldr	w13, [x19, #1192]
	mul	w9, w10, w9
	mov	w10, #1
	b	.LBB90_555
.LBB90_554:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	w14, [x11, #96]
	add	w8, w13, w8
	cmp	w8, w14
	b.hs	.LBB90_571
.LBB90_555:                             // =>This Inner Loop Header: Depth=1
	ldr	x15, [x11]
	udiv	w14, w8, w13
	cmp	w13, #2                 // =2
	b.lo	.LBB90_557
// %bb.556:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	x15, [x15, #144]
	ldr	w15, [x15, w14, uxtw #2]
	b	.LBB90_558
.LBB90_557:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	x15, [x15, #136]
	umull	x16, w8, w12
	ldr	w15, [x15, x16]
	ubfx	w15, w15, #6, #10
.LBB90_558:                             //   in Loop: Header=BB90_555 Depth=1
	cmp	w15, #0                 // =0
	ccmp	w15, w9, #4, ne
	b.eq	.LBB90_554
// %bb.559:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	x15, [x11, #24]
	ldr	w16, [x15, #100]
	udiv	w16, w16, w13
	cmp	w14, w16
	b.eq	.LBB90_554
// %bb.560:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	w16, [x15, #220]
	udiv	w16, w16, w13
	cmp	w14, w16
	b.eq	.LBB90_554
// %bb.561:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	w16, [x15, #340]
	udiv	w16, w16, w13
	cmp	w14, w16
	b.eq	.LBB90_554
// %bb.562:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	w16, [x15, #460]
	udiv	w16, w16, w13
	cmp	w14, w16
	b.eq	.LBB90_554
// %bb.563:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	w16, [x15, #580]
	udiv	w16, w16, w13
	cmp	w14, w16
	b.eq	.LBB90_554
// %bb.564:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	w16, [x15, #700]
	udiv	w16, w16, w13
	cmp	w14, w16
	b.eq	.LBB90_554
// %bb.565:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	w16, [x15, #820]
	udiv	w16, w16, w13
	cmp	w14, w16
	b.eq	.LBB90_554
// %bb.566:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	w16, [x15, #940]
	udiv	w16, w16, w13
	cmp	w14, w16
	b.eq	.LBB90_554
// %bb.567:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	w16, [x15, #1060]
	udiv	w16, w16, w13
	cmp	w14, w16
	b.eq	.LBB90_554
// %bb.568:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	w16, [x15, #1180]
	udiv	w16, w16, w13
	cmp	w14, w16
	b.eq	.LBB90_554
// %bb.569:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	w15, [x15, #1300]
	udiv	w15, w15, w13
	cmp	w14, w15
	b.eq	.LBB90_554
// %bb.570:                             //   in Loop: Header=BB90_555 Depth=1
	ldr	x11, [sp, #56]          // 8-byte Folded Reload
	lsr	w13, w14, #6
	ldr	x11, [x11, #72]
	add	x11, x11, w13, uxtw #3
	lsl	x13, x10, x14
	//APP
	// atomic64_or
	prfm	pstl1strm, [x11]
1:	ldxr	x14, [x11]
	orr	x14, x14, x13
	stxr	w15, x14, [x11]
	cbnz	w15, 1b
	//NO_APP
	ldr	w13, [x19, #1192]
	ldr	x11, [x19, #136]
	b	.LBB90_554
.LBB90_571:
	mov	x0, x21
	bl	mutex_unlock
	ldr	x8, [x27]
.LBB90_572:
	ldr	w9, [x19, #1200]
	mov	w1, #32960
	ldr	x20, [x8, #16]
	mov	w2, #-1
	movk	w1, #96, lsl #16
	add	x8, x9, #63             // =63
	lsr	x8, x8, #3
	and	x0, x8, #0x3ffffff8
	bl	kvmalloc_node
	str	x0, [x20, #144]
	cbz	x0, .LBB90_575
// %bb.573:
	ldr	x8, [x27]
	mov	x2, xzr
	ldr	x9, [x28]
	ldr	x21, [x8]
	ldr	x8, [x8, #24]
	ldrb	w10, [x9, #2181]
	ldr	x9, [x21, #136]
	tbnz	w10, #6, .LBB90_586
// %bb.574:
	mov	w10, #120
	mov	w11, #48
	b	.LBB90_580
.LBB90_575:
	mov	w22, #-12
.LBB90_576:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB90_578
// %bb.577:
	mov	w0, w22
	ldp	x20, x19, [sp, #240]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #224]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #208]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #192]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #176]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #160]    // 16-byte Folded Reload
	add	sp, sp, #256            // =256
	ret
.LBB90_578:
	bl	__stack_chk_fail
.LBB90_579:                             //   in Loop: Header=BB90_580 Depth=1
	add	x2, x2, #1              // =1
	cmp	x2, #6                  // =6
	b.eq	.LBB90_609
.LBB90_580:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB90_584 Depth 2
	madd	x12, x2, x10, x8
	ldrh	w13, [x12, #98]
	cmp	w13, #5                 // =5
	b.hi	.LBB90_648
// %bb.581:                             //   in Loop: Header=BB90_580 Depth=1
	ldr	w3, [x12, #100]
	ldrh	w5, [x12, #104]
	madd	x13, x3, x11, x9
	mvn	w14, w5
	and	w14, w14, #0x7
	ldr	x12, [x13, #8]
	lsr	x13, x5, #3
	ldrb	w13, [x12, x13]
	lsr	w13, w13, w14
	tbnz	w13, #0, .LBB90_607
// %bb.582:                             //   in Loop: Header=BB90_580 Depth=1
	madd	x13, x2, x10, x8
	ldrb	w13, [x13, #96]
	cmp	w13, #1                 // =1
	b.eq	.LBB90_579
// %bb.583:                             //   in Loop: Header=BB90_580 Depth=1
	ldr	x13, [sp, #64]          // 8-byte Folded Reload
	mov	w6, w5
	ldr	w13, [x13]
.LBB90_584:                             //   Parent Loop BB90_580 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	w6, w6, #1              // =1
	cmp	w6, w13
	b.hs	.LBB90_579
// %bb.585:                             //   in Loop: Header=BB90_584 Depth=2
	mov	w14, w6
	mvn	w15, w6
	lsr	x14, x14, #3
	and	w15, w15, #0x7
	ldrb	w14, [x12, x14]
	lsr	w14, w14, w15
	tbz	w14, #0, .LBB90_584
	b	.LBB90_608
.LBB90_586:
	mov	w10, #120
	mov	w11, #48
	b	.LBB90_588
.LBB90_587:                             //   in Loop: Header=BB90_588 Depth=1
	add	x2, x2, #1              // =1
	cmp	x2, #6                  // =6
	b.eq	.LBB90_609
.LBB90_588:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB90_594 Depth 2
	madd	x12, x2, x10, x8
	cmp	w2, #3                  // =3
	ldr	w3, [x12, #100]
	ldrh	w5, [x12, #104]
	b.eq	.LBB90_590
// %bb.589:                             //   in Loop: Header=BB90_588 Depth=1
	cbnz	w2, .LBB90_587
.LBB90_590:                             //   in Loop: Header=BB90_588 Depth=1
	madd	x12, x2, x10, x8
	ldrh	w12, [x12, #98]
	cmp	w12, #6                 // =6
	b.hs	.LBB90_648
// %bb.591:                             //   in Loop: Header=BB90_588 Depth=1
	madd	x12, x3, x11, x9
	lsr	x13, x5, #3
	mvn	w14, w5
	and	w14, w14, #0x7
	ldr	x12, [x12, #8]
	ldrb	w13, [x12, x13]
	lsr	w13, w13, w14
	tbnz	w13, #0, .LBB90_607
// %bb.592:                             //   in Loop: Header=BB90_588 Depth=1
	madd	x13, x2, x10, x8
	ldrb	w13, [x13, #96]
	cmp	w13, #1                 // =1
	b.eq	.LBB90_587
// %bb.593:                             //   in Loop: Header=BB90_588 Depth=1
	ldr	x13, [sp, #64]          // 8-byte Folded Reload
	mov	w6, w5
	ldr	w13, [x13]
.LBB90_594:                             //   Parent Loop BB90_588 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	w6, w6, #1              // =1
	cmp	w6, w13
	b.hs	.LBB90_587
// %bb.595:                             //   in Loop: Header=BB90_594 Depth=2
	mov	w14, w6
	mvn	w15, w6
	lsr	x14, x14, #3
	and	w15, w15, #0x7
	ldrb	w14, [x12, x14]
	lsr	w14, w14, w15
	tbz	w14, #0, .LBB90_594
	b	.LBB90_608
.LBB90_596:
	adrp	x1, .L.str.44
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.44
	mov	w2, w25
	mov	w3, w22
	bl	f2fs_printk
	cbz	x19, .LBB90_598
// %bb.597:
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB90_598:
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_537
// %bb.599:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_537
// %bb.600:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.43
	add	x1, x1, :lo12:.L.str.43
	mov	w3, #1300
	b	.LBB90_606
.LBB90_601:
	adrp	x1, .L.str.42
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.42
	mov	w3, w25
	bl	f2fs_printk
	cbz	x19, .LBB90_603
// %bb.602:
	add	x8, x19, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB90_603:
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_537
// %bb.604:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_537
// %bb.605:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.43
	add	x1, x1, :lo12:.L.str.43
	mov	w3, #1290
.LBB90_606:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x2, .L__func__.check_block_count
	add	x2, x2, :lo12:.L__func__.check_block_count
	bl	dsm_client_record
	mov	w8, #15241
	ldr	x0, [x19, :lo12:f2fs_dclient]
	movk	w8, #14160, lsl #16
	add	w1, w8, #3              // =3
	bl	dsm_client_notify
	b	.LBB90_537
.LBB90_607:
	mov	w6, w5
.LBB90_608:
	mov	w9, #120
	adrp	x1, .L.str.59
	add	x1, x1, :lo12:.L.str.59
	mov	x0, x19
	madd	x8, x2, x9, x8
                                        // kill: def $w2 killed $w2 killed $x2
                                        // kill: def $w3 killed $w3 killed $x3
                                        // kill: def $w5 killed $w5 killed $x5
	ldrb	w4, [x8, #96]
	bl	f2fs_printk
	mov	w22, #-117
	b	.LBB90_576
.LBB90_609:
	add	x20, x21, #88           // =88
	mov	x0, x20
	bl	down_write
	mov	x8, #-1
	str	x8, [x21, #168]
	ldr	x8, [x27]
	ldr	w9, [x8, #96]
	cbz	w9, .LBB90_617
// %bb.610:
	ldr	w10, [x19, #1192]
	mov	w9, wzr
	mov	x12, #-1
	mov	w11, #48
	b	.LBB90_612
.LBB90_611:                             //   in Loop: Header=BB90_612 Depth=1
	ldr	w13, [x8, #96]
	add	w9, w10, w9
	cmp	w9, w13
	b.hs	.LBB90_617
.LBB90_612:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB90_614 Depth 2
	mov	x13, xzr
	cbz	w10, .LBB90_615
// %bb.613:                             //   in Loop: Header=BB90_612 Depth=1
	ldr	x15, [x8]
	mov	x14, xzr
	mov	w16, w10
	mov	w17, w9
	ldr	x15, [x15, #136]
.LBB90_614:                             //   Parent Loop BB90_612 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	umaddl	x18, w17, w11, x15
	add	x14, x14, #1            // =1
	add	w17, w17, #1            // =1
	cmp	x14, x16
	ldr	x18, [x18, #40]
	add	x13, x18, x13
	b.ne	.LBB90_614
.LBB90_615:                             //   in Loop: Header=BB90_612 Depth=1
	mov	w14, w10
	udiv	x13, x13, x14
	cmp	x12, x13
	b.ls	.LBB90_611
// %bb.616:                             //   in Loop: Header=BB90_612 Depth=1
	str	x13, [x21, #168]
	mov	x12, x13
	ldr	w10, [x19, #1192]
	ldr	x8, [x19, #136]
	b	.LBB90_611
.LBB90_617:
	ldr	x19, [x8]
	mov	w0, #1
	bl	ktime_get_coarse_with_offset
	mov	w9, #51712
	ldr	x8, [x19, #160]
	movk	w9, #15258, lsl #16
	sdiv	x9, x0, x9
	subs	x10, x8, x9
	b.ls	.LBB90_619
// %bb.618:
	ldr	x8, [x19, #152]
	subs	x8, x8, x10
	csel	x8, xzr, x8, lo
	b	.LBB90_620
.LBB90_619:
	ldr	x10, [x19, #152]
	sub	x8, x9, x8
	add	x8, x8, x10
.LBB90_620:
	mov	x0, x20
	str	x8, [x21, #176]
	str	xzr, [x21, #192]
	bl	up_write
	mov	w22, wzr
	b	.LBB90_576
.LBB90_621:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB90_139
.LBB90_622:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB90_142
.LBB90_623:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB90_145
.LBB90_624:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB90_206
.LBB90_625:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB90_209
.LBB90_626:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB90_212
.LBB90_627:
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB90_364
.LBB90_628:
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB90_367
.LBB90_629:
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB90_370
.LBB90_630:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.h"; .popsection; .long 14472b - 14470b; .short 1247; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_631:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_634
// %bb.632:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_634
// %bb.633:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.current_sit_addr
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #1318
	add	x2, x2, :lo12:.L__func__.current_sit_addr
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_634:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.h"; .popsection; .long 14472b - 14470b; .short 1318; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_635:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_636:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_637:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_638:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_639:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_640:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_641:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_642:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_643:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_644:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_647
// %bb.645:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_647
// %bb.646:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.init_dirty_segmap
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #6949
	add	x2, x2, :lo12:.L__func__.init_dirty_segmap
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_647:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 6949; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB90_648:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB90_651
// %bb.649:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB90_651
// %bb.650:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.sanity_check_seg_type
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #47
	add	x2, x2, :lo12:.L__func__.sanity_check_seg_type
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB90_651:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.h"; .popsection; .long 14472b - 14470b; .short 47; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end90:
	.size	f2fs_build_segment_manager, .Lfunc_end90-f2fs_build_segment_manager
                                        // -- End function
	.globl	f2fs_destroy_segment_manager // -- Begin function f2fs_destroy_segment_manager
	.p2align	3
	.type	f2fs_destroy_segment_manager,@function
f2fs_destroy_segment_manager:           // @f2fs_destroy_segment_manager
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	ldr	x19, [x0, #136]
	cbz	x19, .LBB91_22
// %bb.1:
	ldr	x21, [x19, #160]
	mov	x20, x0
	cbz	x21, .LBB91_4
// %bb.2:
	ldr	x0, [x21]
	cbz	x0, .LBB91_4
// %bb.3:
	str	xzr, [x21]
	bl	kthread_stop
.LBB91_4:
	mov	x0, x21
	bl	kfree
	ldr	x8, [x20, #136]
	str	xzr, [x8, #160]
	ldr	x8, [x20, #136]
	ldr	x21, [x8, #168]
	cbz	x21, .LBB91_9
// %bb.5:
	ldr	x0, [x21]
	cbz	x0, .LBB91_7
// %bb.6:
	str	xzr, [x21]
	bl	kthread_stop
.LBB91_7:
	ldr	w8, [x21, #8340]
	cbnz	w8, .LBB91_23
.LBB91_8:
	mov	x0, x21
	bl	kfree
	ldr	x8, [x20, #136]
	str	xzr, [x8, #168]
	ldr	x8, [x20, #136]
.LBB91_9:
	ldr	x21, [x8, #16]
	cbz	x21, .LBB91_13
// %bb.10:
	add	x22, x21, #80           // =80
	mov	x0, x22
	bl	mutex_lock
	ldr	x0, [x21, #8]
	bl	kvfree
	mov	x0, x22
	str	wzr, [x21, #112]
	bl	mutex_unlock
	ldr	x8, [x20, #136]
	ldr	x24, [x8, #16]
	add	x23, x24, #80           // =80
	mov	x0, x23
	bl	mutex_lock
	ldr	x0, [x24, #16]
	bl	kvfree
	mov	x0, x23
	str	wzr, [x24, #116]
	bl	mutex_unlock
	ldr	x8, [x20, #136]
	ldr	x24, [x8, #16]
	add	x23, x24, #80           // =80
	mov	x0, x23
	bl	mutex_lock
	ldr	x0, [x24, #24]
	bl	kvfree
	mov	x0, x23
	str	wzr, [x24, #120]
	bl	mutex_unlock
	ldr	x8, [x20, #136]
	ldr	x24, [x8, #16]
	add	x23, x24, #80           // =80
	mov	x0, x23
	bl	mutex_lock
	ldr	x0, [x24, #32]
	bl	kvfree
	mov	x0, x23
	str	wzr, [x24, #124]
	bl	mutex_unlock
	ldr	x8, [x20, #136]
	ldr	x24, [x8, #16]
	add	x23, x24, #80           // =80
	mov	x0, x23
	bl	mutex_lock
	ldr	x0, [x24, #40]
	bl	kvfree
	mov	x0, x23
	str	wzr, [x24, #128]
	bl	mutex_unlock
	ldr	x8, [x20, #136]
	ldr	x24, [x8, #16]
	add	x23, x24, #80           // =80
	mov	x0, x23
	bl	mutex_lock
	ldr	x0, [x24, #48]
	bl	kvfree
	mov	x0, x23
	str	wzr, [x24, #132]
	bl	mutex_unlock
	ldr	x8, [x20, #136]
	ldr	x24, [x8, #16]
	add	x23, x24, #80           // =80
	mov	x0, x23
	bl	mutex_lock
	ldr	x0, [x24, #56]
	bl	kvfree
	mov	x0, x23
	str	wzr, [x24, #136]
	bl	mutex_unlock
	ldr	x8, [x20, #136]
	ldr	x24, [x8, #16]
	add	x23, x24, #80           // =80
	mov	x0, x23
	bl	mutex_lock
	ldr	x0, [x24, #64]
	bl	kvfree
	mov	x0, x23
	str	wzr, [x24, #140]
	bl	mutex_unlock
	ldr	w8, [x20, #1192]
	cmp	w8, #2                  // =2
	b.lo	.LBB91_12
// %bb.11:
	mov	x0, x22
	bl	mutex_lock
	ldr	x0, [x21, #72]
	bl	kvfree
	mov	x0, x22
	bl	mutex_unlock
.LBB91_12:
	ldr	x8, [x20, #136]
	ldr	x8, [x8, #16]
	ldr	x0, [x8, #144]
	bl	kvfree
	ldr	x8, [x20, #136]
	mov	x0, x21
	str	xzr, [x8, #16]
	bl	kfree
	ldr	x8, [x20, #136]
.LBB91_13:
	ldr	x21, [x8, #24]
	cbz	x21, .LBB91_15
// %bb.14:
	str	xzr, [x8, #24]
	ldr	x0, [x21, #32]
	bl	kfree
	ldr	x0, [x21, #88]
	bl	kfree
	ldr	x0, [x21, #152]
	bl	kfree
	ldr	x0, [x21, #208]
	bl	kfree
	ldr	x0, [x21, #272]
	bl	kfree
	ldr	x0, [x21, #328]
	bl	kfree
	ldr	x0, [x21, #392]
	bl	kfree
	ldr	x0, [x21, #448]
	bl	kfree
	ldr	x0, [x21, #512]
	bl	kfree
	ldr	x0, [x21, #568]
	bl	kfree
	ldr	x0, [x21, #632]
	bl	kfree
	ldr	x0, [x21, #688]
	bl	kfree
	ldr	x0, [x21, #752]
	bl	kfree
	ldr	x0, [x21, #808]
	bl	kfree
	ldr	x0, [x21, #872]
	bl	kfree
	ldr	x0, [x21, #928]
	bl	kfree
	ldr	x0, [x21, #992]
	bl	kfree
	ldr	x0, [x21, #1048]
	bl	kfree
	ldr	x0, [x21, #1112]
	bl	kfree
	ldr	x0, [x21, #1168]
	bl	kfree
	ldr	x0, [x21, #1232]
	bl	kfree
	ldr	x0, [x21, #1288]
	bl	kfree
	mov	x0, x21
	bl	kfree
	ldr	x8, [x20, #136]
.LBB91_15:
	ldr	x21, [x8, #8]
	cbz	x21, .LBB91_17
// %bb.16:
	str	xzr, [x8, #8]
	ldr	x0, [x21, #16]
	bl	kvfree
	ldr	x0, [x21, #24]
	bl	kvfree
	mov	x0, x21
	bl	kfree
	ldr	x8, [x20, #136]
.LBB91_17:
	ldr	x21, [x8]
	cbz	x21, .LBB91_21
// %bb.18:
	ldr	x8, [x21, #136]
	cbz	x8, .LBB91_20
// %bb.19:
	ldr	x0, [x21, #24]
	bl	kvfree
.LBB91_20:
	ldr	x0, [x21, #64]
	bl	kfree
	ldr	x0, [x21, #136]
	bl	kvfree
	ldr	x0, [x21, #144]
	bl	kvfree
	ldr	x0, [x21, #72]
	bl	kvfree
	ldr	x8, [x20, #136]
	str	xzr, [x8]
	ldr	x0, [x21, #32]
	bl	kvfree
	ldr	x0, [x21, #40]
	bl	kvfree
	ldr	x0, [x21, #48]
	bl	kvfree
	mov	x0, x21
	bl	kfree
.LBB91_21:
	mov	x0, x19
	str	xzr, [x20, #136]
	bl	kfree
.LBB91_22:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB91_23:
	mov	x0, x20
	bl	f2fs_issue_discard_timeout
	b	.LBB91_8
.Lfunc_end91:
	.size	f2fs_destroy_segment_manager, .Lfunc_end91-f2fs_destroy_segment_manager
                                        // -- End function
	.section	.init.text,"ax",@progbits
	.globl	f2fs_create_segment_manager_caches // -- Begin function f2fs_create_segment_manager_caches
	.p2align	2
	.type	f2fs_create_segment_manager_caches,@function
f2fs_create_segment_manager_caches:     // @f2fs_create_segment_manager_caches
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	adrp	x0, .L.str.18
	mov	w1, #88
	add	x0, x0, :lo12:.L.str.18
	mov	w2, wzr
	mov	w3, #131072
	mov	x4, xzr
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	bl	kmem_cache_create
	adrp	x19, discard_entry_slab
	str	x0, [x19, :lo12:discard_entry_slab]
	cbz	x0, .LBB92_9
// %bb.1:
	adrp	x0, .L.str.19
	mov	w1, #120
	add	x0, x0, :lo12:.L.str.19
	mov	w2, wzr
	mov	w3, #131072
	mov	x4, xzr
	bl	kmem_cache_create
	adrp	x20, discard_cmd_slab
	str	x0, [x20, :lo12:discard_cmd_slab]
	cbz	x0, .LBB92_8
// %bb.2:
	adrp	x0, .L.str.20
	mov	w1, #24
	add	x0, x0, :lo12:.L.str.20
	mov	w2, wzr
	mov	w3, #131072
	mov	x4, xzr
	bl	kmem_cache_create
	adrp	x21, sit_entry_set_slab
	str	x0, [x21, :lo12:sit_entry_set_slab]
	cbz	x0, .LBB92_7
// %bb.3:
	adrp	x0, .L.str.21
	mov	w1, #32
	add	x0, x0, :lo12:.L.str.21
	mov	w2, wzr
	mov	w3, #131072
	mov	x4, xzr
	bl	kmem_cache_create
	adrp	x22, inmem_entry_slab
	str	x0, [x22, :lo12:inmem_entry_slab]
	cbz	x0, .LBB92_6
// %bb.4:
	bl	create_page_info_slab
	cbz	w0, .LBB92_10
// %bb.5:
	ldr	x0, [x22, :lo12:inmem_entry_slab]
	bl	kmem_cache_destroy
.LBB92_6:
	ldr	x0, [x21, :lo12:sit_entry_set_slab]
	bl	kmem_cache_destroy
.LBB92_7:
	ldr	x0, [x20, :lo12:discard_cmd_slab]
	bl	kmem_cache_destroy
.LBB92_8:
	ldr	x0, [x19, :lo12:discard_entry_slab]
	bl	kmem_cache_destroy
.LBB92_9:
	mov	w0, #-12
.LBB92_10:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end92:
	.size	f2fs_create_segment_manager_caches, .Lfunc_end92-f2fs_create_segment_manager_caches
                                        // -- End function
	.text
	.globl	f2fs_destroy_segment_manager_caches // -- Begin function f2fs_destroy_segment_manager_caches
	.p2align	3
	.type	f2fs_destroy_segment_manager_caches,@function
f2fs_destroy_segment_manager_caches:    // @f2fs_destroy_segment_manager_caches
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x8, sit_entry_set_slab
	mov	x29, sp
	ldr	x0, [x8, :lo12:sit_entry_set_slab]
	bl	kmem_cache_destroy
	adrp	x8, discard_cmd_slab
	ldr	x0, [x8, :lo12:discard_cmd_slab]
	bl	kmem_cache_destroy
	adrp	x8, discard_entry_slab
	ldr	x0, [x8, :lo12:discard_entry_slab]
	bl	kmem_cache_destroy
	adrp	x8, inmem_entry_slab
	ldr	x0, [x8, :lo12:inmem_entry_slab]
	bl	kmem_cache_destroy
	bl	destroy_page_info_slab
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end93:
	.size	f2fs_destroy_segment_manager_caches, .Lfunc_end93-f2fs_destroy_segment_manager_caches
                                        // -- End function
	.p2align	3               // -- Begin function __remove_discard_cmd
	.type	__remove_discard_cmd,@function
__remove_discard_cmd:                   // @__remove_discard_cmd
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	adrp	x8, __tracepoint_f2fs_remove_discard
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	add	x8, x8, :lo12:__tracepoint_f2fs_remove_discard
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	x19, x1
	ldr	x9, [x0, #136]
	mov	x20, x0
	ldr	x21, [x1, #88]
	ldp	w23, w22, [x1, #28]
	ldr	x24, [x9, #168]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB94_7
// %bb.1:
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
	tbz	w9, #0, .LBB94_7
// %bb.2:
	//APP
	mrs x25, sp_el0
	//NO_APP
	ldr	w9, [x25, #80]
	add	w9, w9, #1              // =1
	str	w9, [x25, #80]
	//APP
	//NO_APP
	ldr	x26, [x8, #32]
	cbz	x26, .LBB94_5
// %bb.3:
	ldr	x8, [x26], #24
.LBB94_4:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x26, #-16]
	mov	x1, x21
	mov	w2, w22
	mov	w3, w23
	blr	x8
	ldr	x8, [x26], #24
	cbnz	x8, .LBB94_4
.LBB94_5:
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x25, #80]
	b.ne	.LBB94_7
// %bb.6:
	ldr	x8, [x25]
	tbnz	w8, #1, .LBB94_35
.LBB94_7:
	add	x21, x19, #112          // =112
	mov	x0, x21
	bl	_raw_spin_lock_irqsave
	ldrh	w22, [x19, #116]
	mov	x1, x0
	mov	x0, x21
	bl	_raw_spin_unlock_irqrestore
	cbnz	w22, .LBB94_28
// %bb.8:
	ldrh	w8, [x19, #96]
	cbnz	w8, .LBB94_30
.LBB94_9:
	ldrb	w8, [x19, #98]
	cmp	w8, #3                  // =3
	b.ne	.LBB94_19
// %bb.10:
	ldr	w8, [x19, #100]
	cbnz	w8, .LBB94_19
// %bb.11:
	ldr	x8, [x19, #104]
	cbz	x8, .LBB94_19
// %bb.12:
	add	x21, x20, #2192         // =2192
	mov	x0, x21
	bl	mutex_lock
	ldr	x8, [x20, #2224]
	cbz	x8, .LBB94_18
// %bb.13:
	ldr	w9, [x19, #28]
	ldr	w10, [x8, #52]
	add	w9, w10, w9
	str	w9, [x8, #52]
	ldr	x8, [x20, #2224]
	cbz	x8, .LBB94_18
// %bb.14:
	ldr	w9, [x8, #48]
	add	w9, w9, #1              // =1
	str	w9, [x8, #48]
	ldr	x8, [x20, #2224]
	cbz	x8, .LBB94_18
// %bb.15:
	ldr	x9, [x19, #104]
	ldr	x10, [x8, #64]
	add	x9, x10, x9
	str	x9, [x8, #64]
	ldr	x8, [x20, #2224]
	cbz	x8, .LBB94_18
// %bb.16:
	ldr	x10, [x8, #72]
	ldr	x9, [x19, #104]
	cmp	x10, x9
	b.hs	.LBB94_18
// %bb.17:
	str	x9, [x8, #72]
.LBB94_18:
	mov	x0, x21
	bl	mutex_unlock
.LBB94_19:
	ldr	w8, [x19, #100]
	cbz	w8, .LBB94_23
// %bb.20:
	cmn	w8, #95                 // =95
	b.ne	.LBB94_22
// %bb.21:
	str	wzr, [x19, #100]
	b	.LBB94_23
.LBB94_22:
	adrp	x0, __remove_discard_cmd._rs
	adrp	x1, .L__func__.__remove_discard_cmd
	add	x0, x0, :lo12:__remove_discard_cmd._rs
	add	x1, x1, :lo12:.L__func__.__remove_discard_cmd
	bl	___ratelimit
	cbnz	w0, .LBB94_29
.LBB94_23:
	ldrb	w8, [x19, #98]
	cmp	w8, #3                  // =3
	b.ne	.LBB94_25
// %bb.24:
	mov	w9, #8336
	ldrb	w8, [x19, #99]
	add	x9, x24, x9
	//APP
	// atomic_sub
	prfm	pstl1strm, [x9]
1:	ldxr	w10, [x9]
	sub	w10, w10, w8
	stxr	w11, w10, [x9]
	cbnz	w11, 1b
	//NO_APP
.LBB94_25:
	add	x0, x19, #40            // =40
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB94_27
// %bb.26:
	ldp	x9, x8, [x19, #40]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB94_27:
	mov	x8, #256
	mov	w10, #8344
	movk	x8, #57005, lsl #48
	add	x1, x24, x10
	add	x9, x8, #256            // =256
	mov	x0, x19
	stp	x8, x9, [x19, #40]
	bl	rb_erase_cached
	ldr	w8, [x19, #28]
	adrp	x10, discard_cmd_slab
	ldr	w9, [x24, #8324]
	mov	x1, x19
	ldr	x0, [x10, :lo12:discard_cmd_slab]
	sub	w8, w9, w8
	str	w8, [x24, #8324]
	bl	kmem_cache_free
	mov	w8, #8340
	add	x8, x24, x8
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB94_28:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB94_29:
	ldr	x8, [x20]
	adrp	x0, .L.str.24
	ldp	w5, w4, [x19, #28]
	adrp	x1, .L.str.25
	add	x0, x0, :lo12:.L.str.24
	ldr	w3, [x19, #24]
	add	x1, x1, :lo12:.L.str.25
	ldr	w6, [x19, #100]
	add	x2, x8, #1056           // =1056
	bl	printk
	b	.LBB94_23
.LBB94_30:
	bl	print_bdev_access_info
	adrp	x21, f2fs_dclient
	ldr	x0, [x21, :lo12:f2fs_dclient]
	cbz	x0, .LBB94_33
// %bb.31:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB94_33
// %bb.32:
	ldr	x0, [x21, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__remove_discard_cmd
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #1680
	add	x2, x2, :lo12:.L__func__.__remove_discard_cmd
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB94_33:
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	ldrh	w8, [x19, #96]
	cbz	w8, .LBB94_9
// %bb.34:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 1680; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB94_35:
	bl	preempt_schedule_notrace
	b	.LBB94_7
.Lfunc_end94:
	.size	__remove_discard_cmd, .Lfunc_end94-__remove_discard_cmd
                                        // -- End function
	.p2align	3               // -- Begin function __submit_discard_cmd
	.type	__submit_discard_cmd,@function
__submit_discard_cmd:                   // @__submit_discard_cmd
// %bb.0:
	sub	sp, sp, #256            // =256
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #160]    // 16-byte Folded Spill
	add	x29, sp, #160           // =160
	stp	x28, x27, [sp, #176]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #192]    // 16-byte Folded Spill
	mov	w11, #8232
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	w12, #8216
	stp	x24, x23, [sp, #208]    // 16-byte Folded Spill
	mov	x24, x4
	stp	x22, x21, [sp, #224]    // 16-byte Folded Spill
	mov	x23, x3
	stp	x20, x19, [sp, #240]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	x26, [x3, #88]
	ldr	x8, [x0, #136]
	ldr	w10, [x1]
	ldrb	w21, [x1, #16]
	ldr	x9, [x26, #128]
	ldr	x13, [x8, #168]
	cmp	w10, #3                 // =3
	ldr	x9, [x9, #1280]
	add	x11, x13, x11
	add	x12, x13, x12
	csel	x12, x11, x12, eq
	ldr	w22, [x9, #1704]
	b.eq	.LBB95_2
// %bb.1:
	add	w9, w2, #1              // =1
	cmp	w9, #512                // =512
	b.lt	.LBB95_3
.LBB95_2:
	add	x20, x1, #20            // =20
	ldrb	w9, [x23, #98]
	cbnz	w9, .LBB95_65
	b	.LBB95_4
.LBB95_3:
	add	x10, x1, #28            // =28
	add	x11, x1, #36            // =36
	cmp	w9, #15                 // =15
	csel	x20, x10, x11, gt
	ldrb	w9, [x23, #98]
	cbnz	w9, .LBB95_65
.LBB95_4:
	ldr	x9, [x0, #80]
	tbnz	w9, #2, .LBB95_65
// %bb.5:
	ldrb	w9, [x0, #3292]
	str	x12, [sp, #80]          // 8-byte Folded Spill
	stur	x0, [x29, #-24]         // 8-byte Folded Spill
	stur	x23, [x29, #-72]        // 8-byte Folded Spill
	str	x13, [sp]               // 8-byte Folded Spill
	cbnz	w9, .LBB95_71
.LBB95_6:
	adrp	x8, __tracepoint_f2fs_issue_discard
	add	x8, x8, :lo12:__tracepoint_f2fs_issue_discard
	ldp	w27, w28, [x23, #28]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB95_14
// %bb.7:
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
	tbz	w9, #0, .LBB95_13
// %bb.8:
	//APP
	mrs x19, sp_el0
	//NO_APP
	ldr	w9, [x19, #80]
	mov	x25, x20
	add	w9, w9, #1              // =1
	str	w9, [x19, #80]
	//APP
	//NO_APP
	ldr	x20, [x8, #32]
	cbz	x20, .LBB95_11
// %bb.9:
	ldr	x8, [x20], #24
.LBB95_10:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x20, #-16]
	mov	x1, x26
	mov	w2, w28
	mov	w3, w27
	blr	x8
	ldr	x8, [x20], #24
	cbnz	x8, .LBB95_10
.LBB95_11:
	//APP
	//NO_APP
	mov	x20, x25
	ldr	w8, [x19, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x19, #80]
	ldur	x0, [x29, #-24]         // 8-byte Folded Reload
	b.ne	.LBB95_13
// %bb.12:
	ldr	x8, [x19]
	tbnz	w8, #1, .LBB95_82
.LBB95_13:
	ldp	w27, w8, [x23, #28]
	stur	w8, [x29, #-32]         // 4-byte Folded Spill
	b	.LBB95_15
.LBB95_14:
	stur	w28, [x29, #-32]        // 4-byte Folded Spill
.LBB95_15:
	ldr	w28, [x23, #24]
	str	wzr, [x23, #28]
	cbz	w27, .LBB95_65
// %bb.16:
	lsr	w8, w22, #3
	ldr	x9, [sp]                // 8-byte Folded Reload
	add	x25, x23, #40           // =40
	stp	x26, x24, [sp, #56]     // 16-byte Folded Spill
	str	w8, [sp, #76]           // 4-byte Folded Spill
	lsl	w8, w21, #11
	str	x20, [sp, #48]          // 8-byte Folded Spill
	str	w8, [sp, #44]           // 4-byte Folded Spill
	add	x8, x23, #112           // =112
	stur	x8, [x29, #-64]         // 8-byte Folded Spill
	mov	w8, #8332
	add	x8, x9, x8
	stp	x8, x25, [sp, #24]      // 16-byte Folded Spill
	add	x8, x0, #2240           // =2240
	str	x8, [sp, #8]            // 8-byte Folded Spill
	mov	w8, #8336
	add	x8, x9, x8
	str	x8, [sp, #16]           // 8-byte Folded Spill
	b	.LBB95_18
.LBB95_17:                              //   in Loop: Header=BB95_18 Depth=1
	ldp	w9, w8, [x29, #-36]     // 8-byte Folded Reload
	mov	w28, w27
	ldp	x26, x24, [sp, #56]     // 16-byte Folded Reload
	ldr	x20, [sp, #48]          // 8-byte Folded Reload
	add	w8, w9, w8
	ldr	x25, [sp, #32]          // 8-byte Folded Reload
	stur	w8, [x29, #-32]         // 4-byte Folded Spill
	ldur	w8, [x29, #-52]         // 4-byte Folded Reload
	subs	w8, w8, w9
	mov	w27, w8
	b.eq	.LBB95_65
.LBB95_18:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB95_28 Depth 2
                                        //       Child Loop BB95_34 Depth 3
                                        //     Child Loop BB95_43 Depth 2
                                        //       Child Loop BB95_49 Depth 3
	ldr	w8, [x24]
	ldr	w9, [x20]
	cmp	w8, w9
	b.hs	.LBB95_64
// %bb.19:                              //   in Loop: Header=BB95_18 Depth=1
	add	w8, w8, #1              // =1
	ldr	w11, [sp, #76]          // 4-byte Folded Reload
	mov	w3, #64
	sub	x5, x29, #16            // =16
	mov	x0, x26
	movk	w3, #96, lsl #16
	str	w8, [x24]
	mov	w4, wzr
	ldr	w9, [x20]
	cmp	w27, w11
	ldr	w10, [x23, #28]
	cset	w19, ls
	csel	w11, w11, w27, hi
	stur	xzr, [x29, #-16]
	lsl	w2, w11, #3
	cmp	w8, w9
	ldur	w9, [x29, #-32]         // 4-byte Folded Reload
	add	w8, w10, w11
	cset	w20, eq
	stur	w11, [x29, #-36]        // 4-byte Folded Spill
	mov	w9, w9
	str	w8, [x23, #28]
	lsl	x1, x9, #3
	bl	__blkdev_issue_discard
	cbnz	w0, .LBB95_68
// %bb.20:                              //   in Loop: Header=BB95_18 Depth=1
	ldur	x8, [x29, #-16]
	ldr	x22, [sp, #80]          // 8-byte Folded Reload
	cbz	x8, .LBB95_59
.LBB95_21:                              //   in Loop: Header=BB95_18 Depth=1
	orr	w19, w20, w19
	ldur	x20, [x29, #-64]        // 8-byte Folded Reload
	mov	x0, x20
	bl	_raw_spin_lock_irqsave
	ldrh	w8, [x23, #116]
	cmp	w19, #0                 // =0
	mov	w9, #1
	mov	x1, x0
	cinc	w9, w9, ne
	mov	x0, x20
	add	w8, w8, #1              // =1
	strb	w9, [x23, #98]
	strh	w8, [x23, #116]
	bl	_raw_spin_unlock_irqrestore
	bl	ktime_get
	str	x0, [x23, #104]
	mov	x0, x25
	ldr	x10, [sp, #16]          // 8-byte Folded Reload
	//APP
	// atomic_add
	prfm	pstl1strm, [x10]
1:	ldxr	w8, [x10]
	add	w8, w8, 1
	stxr	w9, w8, [x10]
	cbnz	w9, 1b
	//NO_APP
	ldrb	w8, [x23, #99]
	add	w8, w8, #1              // =1
	strb	w8, [x23, #99]
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB95_23
// %bb.22:                              //   in Loop: Header=BB95_18 Depth=1
	ldp	x9, x8, [x23, #40]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB95_23:                              //   in Loop: Header=BB95_18 Depth=1
	ldr	x21, [x22, #8]
	mov	x0, x25
	mov	x2, x22
	stur	w27, [x29, #-52]        // 4-byte Folded Spill
	mov	x1, x21
	bl	__list_add_valid
	tbz	w0, #0, .LBB95_25
// %bb.24:                              //   in Loop: Header=BB95_18 Depth=1
	str	x25, [x22, #8]
	stp	x22, x21, [x23, #40]
	str	x25, [x21]
.LBB95_25:                              //   in Loop: Header=BB95_18 Depth=1
	ldur	w8, [x29, #-36]         // 4-byte Folded Reload
	add	w27, w8, w28
	cmp	w28, w27
	b.hs	.LBB95_57
// %bb.26:                              //   in Loop: Header=BB95_18 Depth=1
	ldur	x10, [x29, #-24]        // 8-byte Folded Reload
	ldr	x11, [x10, #136]
	ldr	w25, [x10, #1188]
	ldr	w24, [x10, #1184]
	ldp	x9, x8, [x11]
	sub	w22, w25, #1            // =1
	ldr	w8, [x8]
	ldr	x26, [x9, #136]
	add	w20, w8, #1             // =1
	stur	w8, [x29, #-28]         // 4-byte Folded Spill
	cbz	x11, .LBB95_42
// %bb.27:                              //   in Loop: Header=BB95_18 Depth=1
	ldr	w19, [x11, #80]
	stur	x11, [x29, #-48]        // 8-byte Folded Spill
	sub	w8, w27, w19
	and	w23, w8, w22
.LBB95_28:                              //   Parent Loop BB95_18 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB95_34 Depth 3
	add	w9, w28, #3             // =3
	cmp	w9, #3                  // =3
	b.hi	.LBB95_30
// %bb.29:                              //   in Loop: Header=BB95_28 Depth=2
	mov	w8, #-1
	cmp	w9, #2                  // =2
	b.ne	.LBB95_40
.LBB95_30:                              //   in Loop: Header=BB95_28 Depth=2
	ldur	x11, [x29, #-24]        // 8-byte Folded Reload
	ldr	w9, [x11, #3024]
	cbz	w9, .LBB95_38
// %bb.31:                              //   in Loop: Header=BB95_28 Depth=2
	ldr	x8, [x11]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB95_37
// %bb.32:                              //   in Loop: Header=BB95_28 Depth=2
	ldr	x11, [x11, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB95_34
.LBB95_33:                              //   in Loop: Header=BB95_34 Depth=3
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB95_37
.LBB95_34:                              //   Parent Loop BB95_18 Depth=1
                                        //     Parent Loop BB95_28 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w12, [x11, #-4]
	cmp	w12, w28
	b.hi	.LBB95_33
// %bb.35:                              //   in Loop: Header=BB95_34 Depth=3
	ldr	w12, [x11]
	cmp	w12, w28
	b.lo	.LBB95_33
// %bb.36:                              //   in Loop: Header=BB95_28 Depth=2
	ldur	x8, [x11, #-80]
.LBB95_37:                              //   in Loop: Header=BB95_28 Depth=2
	cbz	x8, .LBB95_39
.LBB95_38:                              //   in Loop: Header=BB95_28 Depth=2
	ldur	x8, [x29, #-48]         // 8-byte Folded Reload
	ldur	w9, [x29, #-28]         // 4-byte Folded Reload
	ldr	w8, [x8, #80]
	sub	w8, w28, w8
	lsr	w8, w8, w24
	sub	w8, w8, w9
	b	.LBB95_40
.LBB95_39:                              //   in Loop: Header=BB95_28 Depth=2
	mov	w8, #-1
.LBB95_40:                              //   in Loop: Header=BB95_28 Depth=2
	mov	w9, #48
	sub	w10, w28, w19
	and	w2, w10, w22
	umaddl	x9, w8, w9, x26
	add	w8, w20, w8
	lsl	w8, w8, w24
	add	w28, w19, w8
	cmp	w28, w27
	csel	w21, w23, w25, hi
	ldr	x0, [x9, #8]
	mov	x1, x21
	bl	__find_rev_next_bit
	cmp	x0, x21
	b.ne	.LBB95_86
// %bb.41:                              //   in Loop: Header=BB95_28 Depth=2
	cmp	w28, w27
	b.lo	.LBB95_28
	b	.LBB95_57
.LBB95_42:                              //   in Loop: Header=BB95_18 Depth=1
	ldr	x8, [x10, #16]
	ldr	w19, [x8, #72]
	sub	w8, w27, w19
	and	w23, w8, w22
.LBB95_43:                              //   Parent Loop BB95_18 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB95_49 Depth 3
	add	w9, w28, #3             // =3
	cmp	w9, #3                  // =3
	b.hi	.LBB95_45
// %bb.44:                              //   in Loop: Header=BB95_43 Depth=2
	mov	w8, #-1
	cmp	w9, #2                  // =2
	b.ne	.LBB95_55
.LBB95_45:                              //   in Loop: Header=BB95_43 Depth=2
	ldur	x13, [x29, #-24]        // 8-byte Folded Reload
	ldr	w9, [x13, #3024]
	cbz	w9, .LBB95_53
// %bb.46:                              //   in Loop: Header=BB95_43 Depth=2
	ldr	x8, [x13]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB95_52
// %bb.47:                              //   in Loop: Header=BB95_43 Depth=2
	ldr	x11, [x13, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB95_49
.LBB95_48:                              //   in Loop: Header=BB95_49 Depth=3
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB95_52
.LBB95_49:                              //   Parent Loop BB95_18 Depth=1
                                        //     Parent Loop BB95_43 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w12, [x11, #-4]
	cmp	w12, w28
	b.hi	.LBB95_48
// %bb.50:                              //   in Loop: Header=BB95_49 Depth=3
	ldr	w12, [x11]
	cmp	w12, w28
	b.lo	.LBB95_48
// %bb.51:                              //   in Loop: Header=BB95_43 Depth=2
	ldur	x8, [x11, #-80]
.LBB95_52:                              //   in Loop: Header=BB95_43 Depth=2
	cbz	x8, .LBB95_54
.LBB95_53:                              //   in Loop: Header=BB95_43 Depth=2
	ldr	x8, [x13, #16]
	ldur	w9, [x29, #-28]         // 4-byte Folded Reload
	ldr	w8, [x8, #72]
	sub	w8, w28, w8
	lsr	w8, w8, w24
	sub	w8, w8, w9
	b	.LBB95_55
.LBB95_54:                              //   in Loop: Header=BB95_43 Depth=2
	mov	w8, #-1
.LBB95_55:                              //   in Loop: Header=BB95_43 Depth=2
	mov	w9, #48
	sub	w10, w28, w19
	and	w2, w10, w22
	umaddl	x9, w8, w9, x26
	add	w8, w20, w8
	lsl	w8, w8, w24
	add	w28, w19, w8
	cmp	w28, w27
	csel	w21, w23, w25, hi
	ldr	x0, [x9, #8]
	mov	x1, x21
	bl	__find_rev_next_bit
	cmp	x0, x21
	b.ne	.LBB95_86
// %bb.56:                              //   in Loop: Header=BB95_43 Depth=2
	cmp	w28, w27
	b.lo	.LBB95_43
.LBB95_57:                              //   in Loop: Header=BB95_18 Depth=1
	ldur	x0, [x29, #-16]
	ldr	w9, [sp, #44]           // 4-byte Folded Reload
	ldur	x23, [x29, #-72]        // 8-byte Folded Reload
	ldr	w8, [x0, #16]
	orr	w8, w8, w9
	adrp	x9, f2fs_submit_discard_endio
	add	x9, x9, :lo12:f2fs_submit_discard_endio
	str	w8, [x0, #16]
	stp	x9, x23, [x0, #72]
	bl	submit_bio
	ldr	x10, [sp, #24]          // 8-byte Folded Reload
	//APP
	// atomic_add
	prfm	pstl1strm, [x10]
1:	ldxr	w8, [x10]
	add	w8, w8, 1
	stxr	w9, w8, [x10]
	cbnz	w9, 1b
	//NO_APP
	ldur	x0, [x29, #-24]         // 8-byte Folded Reload
	ldrb	w8, [x0, #2600]
	cbz	w8, .LBB95_17
// %bb.58:                              //   in Loop: Header=BB95_18 Depth=1
	ldr	x19, [sp, #8]           // 8-byte Folded Reload
	mov	x0, x19
	bl	_raw_spin_lock
	ldur	x8, [x29, #-24]         // 8-byte Folded Reload
	mov	x0, x19
	ldur	x9, [x29, #-24]         // 8-byte Folded Reload
	ldr	x8, [x8, #2416]
	add	x8, x8, #1              // =1
	str	x8, [x9, #2416]
	bl	_raw_spin_unlock
	ldur	x0, [x29, #-24]         // 8-byte Folded Reload
	bl	f2fs_record_iostat
	ldur	x0, [x29, #-24]         // 8-byte Folded Reload
	b	.LBB95_17
.LBB95_59:                              //   in Loop: Header=BB95_18 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB95_62
// %bb.60:                              //   in Loop: Header=BB95_18 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB95_62
// %bb.61:                              //   in Loop: Header=BB95_18 Depth=1
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__submit_discard_cmd
	add	x1, x1, :lo12:.L.str.2
	add	x2, x2, :lo12:.L__func__.__submit_discard_cmd
	mov	w3, #1881
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB95_62:                              //   in Loop: Header=BB95_18 Depth=1
	ldur	x21, [x29, #-24]        // 8-byte Folded Reload
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldur	x8, [x29, #-16]
	cbnz	x8, .LBB95_21
// %bb.63:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 1881; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB95_64:
	ldr	x9, [sp]                // 8-byte Folded Reload
	mov	x1, x26
	ldur	w3, [x29, #-32]         // 4-byte Folded Reload
	mov	w2, w28
	mov	w4, w27
	ldr	w8, [x9, #8324]
	sub	w8, w8, w27
	str	w8, [x9, #8324]
	bl	__update_discard_tree_range
.LBB95_65:
	mov	w21, wzr
.LBB95_66:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB95_85
// %bb.67:
	mov	w0, w21
	ldp	x20, x19, [sp, #240]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #224]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #208]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #192]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #176]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #160]    // 16-byte Folded Reload
	add	sp, sp, #256            // =256
	ret
.LBB95_68:
	mov	w21, w0
	ldur	x0, [x29, #-64]         // 8-byte Folded Reload
	bl	_raw_spin_lock_irqsave
	ldrb	w8, [x23, #98]
	mov	x1, x0
	cmp	w8, #1                  // =1
	b.ne	.LBB95_70
// %bb.69:
	mov	w8, #2
	strb	w8, [x23, #98]
.LBB95_70:
	ldur	x0, [x29, #-64]         // 8-byte Folded Reload
	bl	_raw_spin_unlock_irqrestore
	b	.LBB95_66
.LBB95_71:
	ldr	w2, [x23, #32]
	mov	x28, x20
	mov	x27, x26
	mov	x25, x24
	cbz	x8, .LBB95_73
// %bb.72:
	add	x9, x8, #80             // =80
	add	x10, x8, #92            // =92
	b	.LBB95_74
.LBB95_73:
	ldr	x10, [x0, #16]
	add	x9, x10, #72            // =72
	add	x10, x10, #48           // =48
.LBB95_74:
	ldur	x20, [x29, #-72]        // 8-byte Folded Reload
	ldr	w11, [x9]
	ldr	w10, [x10]
	ldr	w9, [x0, #1184]
	ldr	w3, [x20, #28]
	lsl	w10, w10, w9
	add	w10, w10, w11
	cmp	w2, w10
	b.hs	.LBB95_77
// %bb.75:
	add	w10, w3, w2
	cbz	x8, .LBB95_78
// %bb.76:
	add	x11, x8, #80            // =80
	add	x12, x8, #92            // =92
	b	.LBB95_79
.LBB95_77:
	adrp	x1, .L.str.26
	mov	x19, x0
	add	x1, x1, :lo12:.L.str.26
	bl	f2fs_printk
	mov	x0, x19
	mov	x1, x20
	bl	__remove_discard_cmd
	b	.LBB95_65
.LBB95_78:
	ldur	x11, [x29, #-24]        // 8-byte Folded Reload
	ldr	x12, [x11, #16]
	add	x11, x12, #72           // =72
	add	x12, x12, #48           // =48
.LBB95_79:
	ldr	w11, [x11]
	mov	x24, x25
	ldr	w12, [x12]
	mov	x26, x27
	ldur	x0, [x29, #-24]         // 8-byte Folded Reload
	mov	x20, x28
	ldur	x23, [x29, #-72]        // 8-byte Folded Reload
	lsl	w12, w12, w9
	add	w11, w12, w11
	cmp	w10, w11
	b.ls	.LBB95_6
// %bb.80:
	cbz	x8, .LBB95_83
// %bb.81:
	add	x10, x8, #80            // =80
	add	x8, x8, #92             // =92
	b	.LBB95_84
.LBB95_82:
	bl	preempt_schedule_notrace
	ldur	x0, [x29, #-24]         // 8-byte Folded Reload
	b	.LBB95_13
.LBB95_83:
	ldur	x8, [x29, #-24]         // 8-byte Folded Reload
	ldr	x8, [x8, #16]
	add	x10, x8, #72            // =72
	add	x8, x8, #48             // =48
.LBB95_84:
	ldr	w10, [x10]
	adrp	x1, .L.str.27
	ldr	w8, [x8]
	add	x1, x1, :lo12:.L.str.27
	ldur	x19, [x29, #-24]        // 8-byte Folded Reload
	ldur	x23, [x29, #-72]        // 8-byte Folded Reload
	sub	w10, w10, w2
	lsl	w8, w8, w9
	add	w2, w8, w10
	mov	x0, x19
	str	w2, [x23, #28]
	bl	f2fs_printk
	mov	x0, x19
	mov	x24, x25
	mov	x26, x27
	mov	x20, x28
	b	.LBB95_6
.LBB95_85:
	bl	__stack_chk_fail
.LBB95_86:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB95_89
// %bb.87:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB95_89
// %bb.88:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__check_sit_bitmap
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #1749
	add	x2, x2, :lo12:.L__func__.__check_sit_bitmap
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB95_89:
	ldur	x19, [x29, #-24]        // 8-byte Folded Reload
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 1749; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end95:
	.size	__submit_discard_cmd, .Lfunc_end95-__submit_discard_cmd
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_submit_discard_endio
	.type	f2fs_submit_discard_endio,@function
f2fs_submit_discard_endio:              // @f2fs_submit_discard_endio
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x22, [x0, #80]
	add	x20, x22, #112          // =112
	mov	x0, x20
	bl	_raw_spin_lock_irqsave
	ldr	w8, [x22, #100]
	mov	x21, x0
	cbnz	w8, .LBB96_2
// %bb.1:
	ldrb	w0, [x19, #26]
	bl	blk_status_to_errno
	str	w0, [x22, #100]
.LBB96_2:
	ldrh	w8, [x22, #116]
	sub	w8, w8, #1              // =1
	tst	w8, #0xffff
	strh	w8, [x22, #116]
	b.ne	.LBB96_7
// %bb.3:
	ldrb	w8, [x22, #98]
	cmp	w8, #2                  // =2
	b.ne	.LBB96_7
// %bb.4:
	ldr	x8, [x22, #104]
	mov	w9, #3
	strb	w9, [x22, #98]
	cbz	x8, .LBB96_6
// %bb.5:
	bl	ktime_get
	ldr	x8, [x22, #104]
	subs	x8, x0, x8
	csel	x8, xzr, x8, lo
	str	x8, [x22, #104]
.LBB96_6:
	add	x0, x22, #56            // =56
	bl	complete_all
.LBB96_7:
	mov	x0, x20
	mov	x1, x21
	bl	_raw_spin_unlock_irqrestore
	mov	x0, x19
	bl	bio_put
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end96:
	.size	f2fs_submit_discard_endio, .Lfunc_end96-f2fs_submit_discard_endio
                                        // -- End function
	.p2align	3               // -- Begin function __update_discard_tree_range
	.type	__update_discard_tree_range,@function
__update_discard_tree_range:            // @__update_discard_tree_range
// %bb.0:
	sub	sp, sp, #192            // =192
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	stp	x28, x27, [sp, #112]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #128]    // 16-byte Folded Spill
	mov	w26, w3
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	add	w27, w4, w2
	stp	x24, x23, [sp, #144]    // 16-byte Folded Spill
	sub	x3, x29, #16            // =16
	stp	x22, x21, [sp, #160]    // 16-byte Folded Spill
	mov	w22, w4
	stp	x20, x19, [sp, #176]    // 16-byte Folded Spill
	mov	x19, x1
	stur	x8, [x29, #-8]
	sub	x4, x29, #24            // =24
	ldr	x8, [x1, #128]
	sub	x5, x29, #32            // =32
	ldr	x9, [x0, #136]
	sub	x6, x29, #40            // =40
	str	x0, [sp, #32]           // 8-byte Folded Spill
	mov	x1, xzr
	mov	w7, #1
	mov	w21, w2
	ldr	x8, [x8, #1280]
	ldr	x9, [x9, #168]
	stp	xzr, xzr, [x29, #-24]
	ldr	w28, [x8, #1704]
	mov	w8, #8344
	add	x0, x9, x8
	str	x9, [sp, #48]           // 8-byte Folded Spill
	stp	xzr, xzr, [x29, #-40]
	str	xzr, [sp]
	bl	f2fs_lookup_rb_tree_ret
	cbz	x0, .LBB97_2
// %bb.1:
	mov	x25, x0
	mov	w22, wzr
	mov	w23, wzr
	mov	w24, wzr
	stur	x0, [x29, #-16]
	b	.LBB97_7
.LBB97_2:
	ldur	x25, [x29, #-16]
	cbz	x25, .LBB97_4
// %bb.3:
	mov	w22, wzr
	mov	w23, wzr
	mov	w24, wzr
	b	.LBB97_7
.LBB97_4:
	ldur	x9, [x29, #-24]
	mov	w8, w22
	cbz	x9, .LBB97_6
// %bb.5:
	ldr	w8, [x9, #24]
	sub	w8, w8, w21
.LBB97_6:
	cmp	w8, w22
	mov	x25, xzr
	csel	w23, w8, w22, lo
	mov	w22, w21
	mov	w24, w26
.LBB97_7:
	lsr	w8, w28, #3
	ldr	x28, [sp, #32]          // 8-byte Folded Reload
	sub	w20, w26, w21
	str	w8, [sp, #44]           // 4-byte Folded Spill
	cbz	x25, .LBB97_12
.LBB97_8:
	ldp	w8, w9, [x25, #24]
	add	w8, w9, w8
	cmp	w8, w21
	csel	w22, w21, w8, lo
	cmp	w27, w22
	b.ls	.LBB97_40
// %bb.9:
	ldur	x9, [x29, #-24]
	mov	w8, w27
	cbz	x9, .LBB97_11
// %bb.10:
	ldr	w8, [x9, #24]
	cmp	w8, w27
	csel	w8, w27, w8, hi
.LBB97_11:
	sub	w23, w8, w22
	add	w24, w20, w22
.LBB97_12:                              // =>This Inner Loop Header: Depth=1
	cbz	w23, .LBB97_24
// %bb.13:                              //   in Loop: Header=BB97_12 Depth=1
	cbz	x25, .LBB97_16
// %bb.14:                              //   in Loop: Header=BB97_12 Depth=1
	ldrb	w8, [x25, #98]
	cbnz	w8, .LBB97_16
// %bb.15:                              //   in Loop: Header=BB97_12 Depth=1
	ldr	x8, [x25, #88]
	cmp	x8, x19
	b.eq	.LBB97_26
.LBB97_16:                              //   in Loop: Header=BB97_12 Depth=1
	mov	x26, xzr
	mov	w8, wzr
.LBB97_17:                              //   in Loop: Header=BB97_12 Depth=1
	ldur	x25, [x29, #-24]
	cbz	x25, .LBB97_22
// %bb.18:                              //   in Loop: Header=BB97_12 Depth=1
	ldrb	w9, [x25, #98]
	cbnz	w9, .LBB97_22
// %bb.19:                              //   in Loop: Header=BB97_12 Depth=1
	ldr	x9, [x25, #88]
	cmp	x9, x19
	b.ne	.LBB97_22
// %bb.20:                              //   in Loop: Header=BB97_12 Depth=1
	ldr	w9, [x25, #24]
	add	w10, w23, w22
	cmp	w10, w9
	b.ne	.LBB97_22
// %bb.21:                              //   in Loop: Header=BB97_12 Depth=1
	ldr	w9, [x25, #28]
	ldr	w10, [sp, #44]          // 4-byte Folded Reload
	add	w9, w9, w23
	cmp	w9, w10
	b.ls	.LBB97_33
.LBB97_22:                              //   in Loop: Header=BB97_12 Depth=1
	tbnz	w8, #0, .LBB97_24
// %bb.23:                              //   in Loop: Header=BB97_12 Depth=1
	mov	x0, x28
	mov	x1, x19
	mov	w2, w22
	mov	w3, w24
	mov	w4, w23
	bl	__insert_discard_tree
.LBB97_24:                              //   in Loop: Header=BB97_12 Depth=1
	ldur	x0, [x29, #-24]
	stur	x0, [x29, #-16]
	cbz	x0, .LBB97_40
// %bb.25:                              //   in Loop: Header=BB97_12 Depth=1
	bl	rb_next
	ldur	x25, [x29, #-16]
	stur	x0, [x29, #-24]
	cbnz	x25, .LBB97_8
	b	.LBB97_12
.LBB97_26:                              //   in Loop: Header=BB97_12 Depth=1
	ldp	w10, w9, [x25, #24]
	mov	w8, wzr
	mov	x26, xzr
	add	w10, w9, w10
	cmp	w10, w22
	b.ne	.LBB97_17
// %bb.27:                              //   in Loop: Header=BB97_12 Depth=1
	ldr	w10, [sp, #44]          // 4-byte Folded Reload
	add	w9, w9, w23
	cmp	w9, w10
	b.hi	.LBB97_17
// %bb.28:                              //   in Loop: Header=BB97_12 Depth=1
	ldr	x10, [sp, #48]          // 8-byte Folded Reload
	add	x22, x25, #40           // =40
	str	w9, [x25, #28]
	mov	x0, x22
	ldr	w8, [x10, #8324]
	add	w8, w8, w23
	str	w8, [x10, #8324]
	ldr	w8, [x25, #28]
	sub	w9, w8, #1              // =1
	cmp	w8, #511                // =511
	mov	w8, #511
	csel	w24, w8, w9, hi
	add	x8, x10, w24, uxtw #4
	add	x23, x8, #24            // =24
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB97_30
// %bb.29:                              //   in Loop: Header=BB97_12 Depth=1
	ldp	x9, x8, [x25, #40]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB97_30:                              //   in Loop: Header=BB97_12 Depth=1
	ldr	x8, [sp, #48]           // 8-byte Folded Reload
	mov	x0, x22
	mov	x2, x23
	add	x26, x8, x24, lsl #4
	ldr	x24, [x26, #32]!
	mov	x1, x24
	bl	__list_add_valid
	tbz	w0, #0, .LBB97_32
// %bb.31:                              //   in Loop: Header=BB97_12 Depth=1
	str	x22, [x26]
	stp	x23, x24, [x25, #40]
	str	x22, [x24]
.LBB97_32:                              //   in Loop: Header=BB97_12 Depth=1
	ldur	x26, [x29, #-16]
	mov	w8, #1
	ldp	w22, w23, [x26, #24]
	ldr	w24, [x26, #32]
	b	.LBB97_17
.LBB97_33:                              //   in Loop: Header=BB97_12 Depth=1
	stp	w22, w9, [x25, #24]
	add	x0, x25, #40            // =40
	ldr	x10, [sp, #48]          // 8-byte Folded Reload
	str	w24, [x25, #32]
	ldr	w8, [x10, #8324]
	add	w8, w8, w23
	str	w8, [x10, #8324]
	ldr	w8, [x25, #28]
	sub	w9, w8, #1              // =1
	cmp	w8, #511                // =511
	mov	w8, #511
	csel	w28, w8, w9, hi
	add	x8, x10, w28, uxtw #4
	add	x8, x8, #24             // =24
	stp	x8, x0, [sp, #16]       // 16-byte Folded Spill
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB97_35
// %bb.34:                              //   in Loop: Header=BB97_12 Depth=1
	ldp	x9, x8, [x25, #40]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB97_35:                              //   in Loop: Header=BB97_12 Depth=1
	ldr	x8, [sp, #48]           // 8-byte Folded Reload
	add	x28, x8, x28, lsl #4
	ldr	x1, [x28, #32]!
	ldp	x2, x0, [sp, #16]       // 16-byte Folded Reload
	str	x1, [sp, #8]            // 8-byte Folded Spill
	bl	__list_add_valid
	tbz	w0, #0, .LBB97_37
// %bb.36:                              //   in Loop: Header=BB97_12 Depth=1
	ldp	x8, x9, [sp, #16]       // 16-byte Folded Reload
	str	x9, [x28]
	str	x8, [x25, #40]
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	str	x8, [x25, #48]
	str	x9, [x8]
.LBB97_37:                              //   in Loop: Header=BB97_12 Depth=1
	cbz	x26, .LBB97_39
// %bb.38:                              //   in Loop: Header=BB97_12 Depth=1
	ldr	x28, [sp, #32]          // 8-byte Folded Reload
	mov	x1, x26
	mov	x0, x28
	bl	__remove_discard_cmd
	b	.LBB97_24
.LBB97_39:                              //   in Loop: Header=BB97_12 Depth=1
	ldr	x28, [sp, #32]          // 8-byte Folded Reload
	b	.LBB97_24
.LBB97_40:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB97_42
// %bb.41:
	ldp	x20, x19, [sp, #176]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #160]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #144]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #128]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #112]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	add	sp, sp, #192            // =192
	ret
.LBB97_42:
	bl	__stack_chk_fail
.Lfunc_end97:
	.size	__update_discard_tree_range, .Lfunc_end97-__update_discard_tree_range
                                        // -- End function
	.p2align	3               // -- Begin function __insert_discard_tree
	.type	__insert_discard_tree,@function
__insert_discard_tree:                  // @__insert_discard_tree
// %bb.0:
	sub	sp, sp, #144            // =144
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	stp	x28, x27, [sp, #64]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #80]     // 16-byte Folded Spill
	mov	w10, #8344
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	w9, #1
	stp	x24, x23, [sp, #96]     // 16-byte Folded Spill
	mov	w24, w2
	stp	x22, x21, [sp, #112]    // 16-byte Folded Spill
	mov	w23, w3
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	mov	w19, w4
	stur	x8, [x29, #-8]
	mov	x22, x1
	ldr	x8, [x0, #136]
	sub	x2, x29, #16            // =16
	sub	x4, x29, #20            // =20
	mov	w3, w24
	mov	x21, x0
	stur	xzr, [x29, #-16]
	sturb	w9, [x29, #-20]
	ldr	x8, [x8, #168]
	add	x1, x8, x10
	bl	f2fs_lookup_rb_tree_for_insert
	str	x0, [sp, #16]           // 8-byte Folded Spill
	cbz	w19, .LBB98_8
// %bb.1:
	ldr	x8, [x21, #136]
	adrp	x10, discard_cmd_slab
	cmp	w19, #511               // =511
	mov	w9, #511
	mov	w27, #64
	ldur	x11, [x29, #-16]
	ldr	x26, [x10, :lo12:discard_cmd_slab]
	movk	w27, #96, lsl #16
	ldr	x28, [x8, #168]
	sub	w8, w19, #1             // =1
	csel	w20, w9, w8, hi
	ldurb	w8, [x29, #-20]
	mov	w1, w27
	str	x11, [sp, #8]           // 8-byte Folded Spill
	mov	x0, x26
	str	w8, [sp, #4]            // 4-byte Folded Spill
	add	x8, x28, w20, uxtw #4
	add	x25, x8, #24            // =24
	bl	kmem_cache_alloc
	mov	x21, x0
	cbnz	x0, .LBB98_3
// %bb.2:
	add	w1, w27, #2048          // =2048
	mov	x0, x26
	bl	kmem_cache_alloc
	mov	x21, x0
.LBB98_3:
	adrp	x1, .L.str.23
	adrp	x2, __init_completion.__key
	add	x26, x21, #40           // =40
	add	x0, x21, #64            // =64
	add	x1, x1, :lo12:.L.str.23
	add	x2, x2, :lo12:__init_completion.__key
	str	x26, [x21, #40]
	str	x26, [x21, #48]
	stp	w19, w23, [x21, #28]
	str	w24, [x21, #24]
	str	wzr, [x21, #56]
	stp	x22, xzr, [x21, #88]
	str	xzr, [x21, #104]
	bl	__init_waitqueue_head
	add	x20, x28, x20, lsl #4
	mov	x0, x26
	mov	x2, x25
	ldr	x22, [x20, #32]!
	mov	x1, x22
	bl	__list_add_valid
	tbz	w0, #0, .LBB98_5
// %bb.4:
	str	x26, [x20]
	stp	x25, x22, [x21, #40]
	str	x26, [x22]
.LBB98_5:
	mov	w8, #8340
	str	wzr, [x21, #112]
	strh	wzr, [x21, #116]
	add	x8, x28, x8
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	mov	x0, x21
	ldr	w8, [x28, #8324]
	ldr	w9, [sp, #4]            // 4-byte Folded Reload
	add	w8, w8, w19
	cmp	w9, #0                  // =0
	mov	w9, #8344
	cset	w2, ne
	add	x1, x28, x9
	str	w8, [x28, #8324]
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	str	xzr, [x21, #16]
	stp	x8, xzr, [x21]
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	str	x21, [x8]
	bl	rb_insert_color_cached
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB98_7
// %bb.6:
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #144            // =144
	ret
.LBB98_7:
	bl	__stack_chk_fail
.LBB98_8:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB98_11
// %bb.9:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB98_11
// %bb.10:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__create_discard_cmd
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #1608
	add	x2, x2, :lo12:.L__func__.__create_discard_cmd
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB98_11:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 1608; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end98:
	.size	__insert_discard_tree, .Lfunc_end98-__insert_discard_tree
                                        // -- End function
	.p2align	3               // -- Begin function __issue_discard_async
	.type	__issue_discard_async,@function
__issue_discard_async:                  // @__issue_discard_async
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x22, x1
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	w19, w3
	ldr	x8, [x1, #128]
	mov	w20, w2
	mov	x21, x0
	ldr	x8, [x8, #1280]
	ldr	x9, [x8, #504]
	tbnz	w9, #11, .LBB99_3
// %bb.1:
	cbz	x8, .LBB99_13
// %bb.2:
	ldr	w8, [x8, #1740]
	sub	w8, w8, #1              // =1
	cmp	w8, #1                  // =1
	b.hi	.LBB99_13
.LBB99_3:
	adrp	x8, __tracepoint_f2fs_queue_discard
	add	x8, x8, :lo12:__tracepoint_f2fs_queue_discard
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB99_10
// %bb.4:
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
	tbz	w9, #0, .LBB99_10
// %bb.5:
	//APP
	mrs x23, sp_el0
	//NO_APP
	ldr	w9, [x23, #80]
	add	w9, w9, #1              // =1
	str	w9, [x23, #80]
	//APP
	//NO_APP
	ldr	x24, [x8, #32]
	cbz	x24, .LBB99_8
// %bb.6:
	ldr	x8, [x24], #24
.LBB99_7:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x24, #-16]
	mov	x1, x22
	mov	w2, w20
	mov	w3, w19
	blr	x8
	ldr	x8, [x24], #24
	cbnz	x8, .LBB99_7
.LBB99_8:
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB99_10
// %bb.9:
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB99_14
.LBB99_10:
	ldr	w8, [x21, #3024]
	mov	w23, w20
	cmp	w8, #1                  // =1
	b.le	.LBB99_12
// %bb.11:
	mov	x0, x21
	mov	w1, w20
	bl	f2fs_target_device_index
	ldr	x8, [x21, #3032]
	mov	w9, #192
	smaddl	x8, w0, w9, x8
	ldr	w8, [x8, #76]
	sub	w23, w20, w8
.LBB99_12:
	ldr	x8, [x21, #136]
	mov	w24, #8280
	ldr	x8, [x8, #168]
	add	x0, x8, x24
	bl	mutex_lock
	mov	x0, x21
	mov	x1, x22
	mov	w2, w20
	mov	w3, w23
	mov	w4, w19
	bl	__update_discard_tree_range
	ldr	x8, [x21, #136]
	ldr	x8, [x8, #168]
	add	x0, x8, x24
	bl	mutex_unlock
.LBB99_13:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB99_14:
	bl	preempt_schedule_notrace
	b	.LBB99_10
.Lfunc_end99:
	.size	__issue_discard_async, .Lfunc_end99-__issue_discard_async
                                        // -- End function
	.p2align	3               // -- Begin function reset_curseg
	.type	reset_curseg,@function
reset_curseg:                           // @reset_curseg
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	mov	w13, #1
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	mov	w10, #-1
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	mov	w21, w1
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	w20, w2
	ldr	x8, [x0, #136]
	mov	x19, x0
	sxtw	x11, w21
	mov	x29, sp
	ldr	x9, [x8, #24]
	mov	w8, #120
	smaddl	x24, w1, w8, x9
	mov	x8, x24
	ldr	w12, [x8, #112]!
	str	w12, [x24, #100]!
	ldurh	w23, [x24, #-2]
	cmn	w12, #1                 // =1
	strb	w13, [x24, #16]
	b.eq	.LBB100_3
// %bb.1:
	ldr	w13, [x19, #1192]
	udiv	w12, w12, w13
	cmn	w12, #1                 // =1
	b.eq	.LBB100_4
// %bb.2:
	ldr	w13, [x19, #1196]
	udiv	w12, w12, w13
	b	.LBB100_4
.LBB100_3:
	mov	w12, w10
.LBB100_4:
	mov	w13, #120
	mov	w2, #5
	mov	w1, wzr
	str	w10, [x8]
	madd	x9, x11, x13, x9
	ldr	x11, [x9, #32]
	str	w12, [x9, #108]
	strh	wzr, [x9, #104]
	add	x22, x11, #4091         // =4091
	mov	x0, x22
	bl	memset
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB100_6
// %bb.5:
	ldr	x9, [x19, #16]
	ldrb	w9, [x9, #2182]
	tst	w9, #0x1
	cset	w9, eq
	b	.LBB100_7
.LBB100_6:
	mov	w9, #1
.LBB100_7:
	sub	w25, w21, #6            // =6
	cmp	w25, #2                 // =2
	b.hi	.LBB100_9
// %bb.8:
	cbnz	w9, .LBB100_11
.LBB100_9:
	cmp	w8, #2                  // =2
	b.ne	.LBB100_15
.LBB100_10:
	ldr	x9, [x19, #16]
	ldrb	w9, [x9, #2182]
	tst	w9, #0x1
	cset	w9, eq
	cmp	w25, #2                 // =2
	b.ls	.LBB100_16
	b	.LBB100_17
.LBB100_11:
	bl	print_bdev_access_info
	adrp	x26, f2fs_dclient
	ldr	x0, [x26, :lo12:f2fs_dclient]
	cbz	x0, .LBB100_14
// %bb.12:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB100_14
// %bb.13:
	ldr	x0, [x26, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.reset_curseg
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #3446
	add	x2, x2, :lo12:.L__func__.reset_curseg
	bl	dsm_client_record
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB100_14:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.eq	.LBB100_10
.LBB100_15:
	mov	w9, #1
	cmp	w25, #2                 // =2
	b.hi	.LBB100_17
.LBB100_16:
	cbnz	w9, .LBB100_32
.LBB100_17:
	cmp	w8, #2                  // =2
	b.ne	.LBB100_27
// %bb.18:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB100_27
// %bb.19:
	ldr	x8, [x19, #80]
	tbnz	w8, #3, .LBB100_27
// %bb.20:
	cmp	w21, #2                 // =2
	b.hi	.LBB100_23
// %bb.21:
	ldr	x8, [x19, #3032]
	ldr	w3, [x24]
	ldr	w9, [x8, #84]
	cmp	w9, w3
	b.hi	.LBB100_26
// %bb.22:
	ldr	w8, [x8, #88]
	cmp	w8, w3
	b.lo	.LBB100_26
	b	.LBB100_27
.LBB100_23:
	cmp	w25, #2                 // =2
	b.hi	.LBB100_27
// %bb.24:
	ldr	x8, [x19, #3032]
	ldr	w3, [x24]
	ldr	w9, [x8, #276]
	cmp	w9, w3
	b.hi	.LBB100_26
// %bb.25:
	ldr	w8, [x8, #280]
	cmp	w8, w3
	b.hs	.LBB100_27
.LBB100_26:
	adrp	x1, .L.str.40
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.40
	mov	w2, w21
	bl	f2fs_printk
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
.LBB100_27:
	cmp	w23, #6                 // =6
	b.hs	.LBB100_33
// %bb.28:
	sub	w8, w23, #3             // =3
	mov	w10, #48
	cmp	w8, #3                  // =3
	cset	w8, lo
	strb	w8, [x22]
	ldr	x9, [x19, #136]
	ldr	w8, [x24]
	ldr	x9, [x9]
	mul	x10, x8, x10
	ldr	x9, [x9, #136]
	ldr	w11, [x9, x10]
	and	w11, w11, #0xffffffc0
	orr	w11, w11, w23
	str	w11, [x9, x10]
	cbz	w20, .LBB100_31
// %bb.29:
	ldr	x9, [x19, #136]
	add	w11, w8, #63            // =63
	cmp	w8, #0                  // =0
	csel	w11, w11, w8, lt
	asr	w12, w11, #6
	and	w11, w11, #0xffffffc0
	ldr	x9, [x9]
	sbfiz	x12, x12, #3, #32
	sub	w8, w8, w11
	mov	w11, #1
	ldr	x10, [x9, #72]
	lsl	x8, x11, x8
	ldr	x13, [x10, x12]
	orr	x11, x13, x8
	tst	x13, x8
	str	x11, [x10, x12]
	b.ne	.LBB100_31
// %bb.30:
	ldr	w8, [x9, #80]
	add	w8, w8, #1              // =1
	str	w8, [x9, #80]
.LBB100_31:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB100_32:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 3446; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB100_33:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB100_36
// %bb.34:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB100_36
// %bb.35:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.sanity_check_seg_type
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #47
	add	x2, x2, :lo12:.L__func__.sanity_check_seg_type
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB100_36:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.h"; .popsection; .long 14472b - 14470b; .short 47; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end100:
	.size	reset_curseg, .Lfunc_end100-reset_curseg
                                        // -- End function
	.p2align	3               // -- Begin function __wait_one_discard_bio
	.type	__wait_one_discard_bio,@function
__wait_one_discard_bio:                 // @__wait_one_discard_bio
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	ldr	x8, [x0, #136]
	add	x0, x1, #56             // =56
	mov	x20, x1
	ldr	x19, [x8, #168]
	bl	wait_for_completion_io
	mov	w8, #8280
	add	x19, x19, x8
	mov	x0, x19
	bl	mutex_lock
	ldrb	w8, [x20, #98]
	cmp	w8, #3                  // =3
	b.ne	.LBB101_8
.LBB101_1:
	ldrh	w8, [x20, #96]
	sub	w8, w8, #1              // =1
	tst	w8, #0xffff
	strh	w8, [x20, #96]
	b.eq	.LBB101_3
// %bb.2:
	mov	w22, wzr
	b	.LBB101_7
.LBB101_3:
	ldr	w8, [x20, #100]
	cbz	w8, .LBB101_5
// %bb.4:
	mov	w22, wzr
	b	.LBB101_6
.LBB101_5:
	ldr	w22, [x20, #28]
.LBB101_6:
	mov	x0, x21
	mov	x1, x20
	bl	__remove_discard_cmd
.LBB101_7:
	mov	x0, x19
	bl	mutex_unlock
	mov	w0, w22
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB101_8:
	bl	print_bdev_access_info
	adrp	x22, f2fs_dclient
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB101_11
// %bb.9:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB101_11
// %bb.10:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.2
	adrp	x2, .L__func__.__wait_one_discard_bio
	add	x1, x1, :lo12:.L.str.2
	mov	w3, #2300
	add	x2, x2, :lo12:.L__func__.__wait_one_discard_bio
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB101_11:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldrb	w8, [x20, #98]
	cmp	w8, #3                  // =3
	b.eq	.LBB101_1
// %bb.12:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/segment.c"; .popsection; .long 14472b - 14470b; .short 2300; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end101:
	.size	__wait_one_discard_bio, .Lfunc_end101-__wait_one_discard_bio
                                        // -- End function
	.p2align	3               // -- Begin function __get_segment_type_6
	.type	__get_segment_type_6,@function
__get_segment_type_6:                   // @__get_segment_type_6
// %bb.0:
	ldr	w8, [x0, #12]
	ldr	x9, [x0, #40]
	cbz	w8, .LBB102_4
// %bb.1:
	lsl	x8, x9, #6
	mov	w0, #5
	orr	x8, x8, #0xffffffc000000000
	ldr	w8, [x8, #4080]
	lsr	w9, w8, #3
	cmp	w9, #2040               // =2040
	b.gt	.LBB102_16
// %bb.2:
	cmp	w9, #3                  // =3
	b.eq	.LBB102_21
// %bb.3:
	cmp	w9, #1022               // =1022
	b.eq	.LBB102_21
	b	.LBB102_18
.LBB102_4:
	ldr	x8, [x9, #24]
	ldr	x8, [x8]
	ldr	x10, [x8, #712]
	tbnz	x10, #36, .LBB102_22
// %bb.5:
	ldr	x10, [x9]
	tbz	w10, #13, .LBB102_8
// %bb.6:
	ldr	x10, [x9, #40]
	tbz	w10, #0, .LBB102_8
// %bb.7:
	ldr	x9, [x9, #40]
	tbnz	w9, #3, .LBB102_24
.LBB102_8:
	ldrb	w9, [x8, #688]
	tbnz	w9, #0, .LBB102_32
// %bb.9:
	ldrh	w10, [x8]
	and	w10, w10, #0xf000
	cmp	w10, #8, lsl #12        // =32768
	b.ne	.LBB102_11
// %bb.10:
	ldr	x10, [x8, #40]
	ldr	x10, [x10, #1104]
	ldr	w10, [x10, #1532]
	ldr	x11, [x8, #712]
	tbnz	w11, #31, .LBB102_29
.LBB102_11:
	tbnz	w9, #5, .LBB102_23
// %bb.12:
	ldr	x9, [x8, #712]
	tbnz	w9, #25, .LBB102_23
// %bb.13:
	ldr	x9, [x8, #712]
	sxth	w9, w9
	tbnz	w9, #31, .LBB102_23
// %bb.14:
	ldr	x9, [x8, #712]
	tbnz	w9, #17, .LBB102_23
// %bb.15:
	ldrb	w8, [x8, #143]
	mov	w9, #1
	cmp	w8, #5                  // =5
	cinc	w9, w9, eq
	cmp	w8, #2                  // =2
	csel	w0, wzr, w9, eq
	ret
.LBB102_16:
	cmp	w9, #2041               // =2041
	b.eq	.LBB102_21
// %bb.17:
	mov	w10, #536870911
	cmp	w9, w10
	b.eq	.LBB102_20
.LBB102_18:
	lsr	w10, w8, #4
	cmp	w10, #1021              // =1021
	b.lo	.LBB102_20
// %bb.19:
	mov	w10, #36659
	mov	w11, #49970
	movk	w10, #10354, lsl #16
	movk	w11, #24117, lsl #16
	madd	w9, w9, w10, w11
	mov	w10, #20581
	movk	w10, #64, lsl #16
	cmp	w9, w10
	b.lo	.LBB102_28
.LBB102_20:
	tst	w8, #0x1
	mov	w8, #3
	cinc	w0, w8, ne
	ret
.LBB102_21:
	ret
.LBB102_22:
	mov	w0, #9
	ret
.LBB102_23:
	mov	w0, wzr
	ret
.LBB102_24:
	ldr	x8, [x0]
	ldrb	w9, [x8, #1800]
	cbz	w9, .LBB102_32
// %bb.25:
	ldr	w9, [x0, #100]
	cmp	w9, #4                  // =4
	b.ne	.LBB102_32
// %bb.26:
	ldr	w8, [x8, #1868]
	cmp	w8, #5                  // =5
	b.eq	.LBB102_32
// %bb.27:
	mov	w0, #10
	ret
.LBB102_28:
	mov	w0, #5
	ret
.LBB102_29:
	cbz	w10, .LBB102_32
// %bb.30:
	cmp	w10, #1                 // =1
	b.ne	.LBB102_11
// %bb.31:
	ldr	x10, [x8, #712]
	tbz	x10, #34, .LBB102_11
.LBB102_32:
	mov	w0, #2
	ret
.Lfunc_end102:
	.size	__get_segment_type_6, .Lfunc_end102-__get_segment_type_6
                                        // -- End function
	.p2align	3               // -- Begin function add_sit_entry
	.type	add_sit_entry,@function
add_sit_entry:                          // @add_sit_entry
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	mov	w8, #4767
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	movk	w8, #10724, lsl #16
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	ldr	x20, [x1]
	mov	x19, x1
	umull	x8, w0, w8
	str	x23, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	lsr	x8, x8, #32
	sub	w9, w0, w8
	cmp	x20, x1
	add	w8, w8, w9, lsr #1
	mov	w9, #55
	lsr	w8, w8, #5
	mul	w23, w8, w9
	b.eq	.LBB103_3
.LBB103_1:                              // =>This Inner Loop Header: Depth=1
	ldr	w8, [x20, #16]
	cmp	w8, w23
	b.eq	.LBB103_7
// %bb.2:                               //   in Loop: Header=BB103_1 Depth=1
	ldr	x20, [x20]
	cmp	x20, x19
	b.ne	.LBB103_1
.LBB103_3:
	adrp	x8, sit_entry_set_slab
	mov	w22, #64
	movk	w22, #96, lsl #16
	mov	w1, w22
	ldr	x21, [x8, :lo12:sit_entry_set_slab]
	mov	x0, x21
	bl	kmem_cache_alloc
	mov	x20, x0
	cbnz	x0, .LBB103_5
// %bb.4:
	add	w1, w22, #2048          // =2048
	mov	x0, x21
	bl	kmem_cache_alloc
	mov	x20, x0
.LBB103_5:
	str	x20, [x20]
	mov	w8, #1
	ldr	x21, [x19]
	mov	x0, x20
	mov	x1, x19
	str	x20, [x20, #8]
	stp	w23, w8, [x20, #16]
	mov	x2, x21
	bl	__list_add_valid
	tbz	w0, #0, .LBB103_16
// %bb.6:
	str	x20, [x21, #8]
	stp	x21, x19, [x20]
	str	x20, [x19]
	b	.LBB103_16
.LBB103_7:
	ldr	w8, [x20, #20]
	ldr	x9, [x20]
	add	w8, w8, #1              // =1
	cmp	x9, x19
	str	w8, [x20, #20]
	b.eq	.LBB103_16
// %bb.8:
	mov	x22, x20
.LBB103_9:                              // =>This Inner Loop Header: Depth=1
	ldr	x22, [x22]
	cmp	x22, x19
	b.eq	.LBB103_12
// %bb.10:                              //   in Loop: Header=BB103_9 Depth=1
	ldr	w9, [x22, #20]
	cmp	w8, w9
	b.hi	.LBB103_9
// %bb.11:
	mov	x19, x22
.LBB103_12:
	mov	x0, x20
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB103_14
// %bb.13:
	ldp	x9, x8, [x20]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB103_14:
	ldr	x21, [x22, #8]
	mov	x0, x20
	mov	x2, x19
	mov	x1, x21
	bl	__list_add_valid
	tbz	w0, #0, .LBB103_16
// %bb.15:
	str	x20, [x22, #8]
	stp	x19, x21, [x20]
	str	x20, [x21]
.LBB103_16:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end103:
	.size	add_sit_entry, .Lfunc_end103-add_sit_entry
                                        // -- End function
	.p2align	3               // -- Begin function issue_discard_thread
	.type	issue_discard_thread,@function
issue_discard_thread:                   // @issue_discard_thread
// %bb.0:
	sub	sp, sp, #240            // =240
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	add	x29, sp, #144           // =144
	stp	x28, x27, [sp, #160]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #176]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #192]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #208]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #224]    // 16-byte Folded Spill
	mov	x19, x0
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #136]
	ldr	x26, [x8, #168]
	mov	w8, #8248
	add	x20, x26, x8
	bl	set_freezable
	mov	w27, #34079
	adrp	x22, dpolicys
	mov	w23, #50
	movk	w27, #20971, lsl #16
	adrp	x28, system_freezing_cnt
	mov	w21, #-1
	add	x22, x22, :lo12:dpolicys
	//APP
	mrs x8, sp_el0
	//NO_APP
	str	x8, [sp]                // 8-byte Folded Spill
	b	.LBB104_3
.LBB104_1:                              //   in Loop: Header=BB104_3 Depth=1
	ldr	w23, [sp, #60]
.LBB104_2:                              //   in Loop: Header=BB104_3 Depth=1
	bl	kthread_should_stop
	tbnz	w0, #0, .LBB104_48
.LBB104_3:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB104_15 Depth 2
	ldr	x8, [x19, #136]
	ldr	w10, [x19, #1188]
	ldr	w9, [x19, #1236]
	ldr	w12, [x19, #1184]
	ldr	w11, [x8, #96]
	ldr	x14, [x8, #168]
	ldr	w13, [x19, #1240]
	ldr	w8, [x8, #104]
	mul	w10, w10, w11
	ldr	w11, [x14, #8324]
	sub	w9, w9, w13
	add	w10, w10, w10, lsl #2
	lsl	w8, w8, w12
	lsl	w12, w10, #2
	lsl	w10, w10, #1
	add	w13, w9, w8
	umull	x9, w10, w27
	umull	x12, w12, w27
	sub	w8, w13, w11
	lsr	x9, x9, #37
	lsr	x10, x12, #37
	cmp	w13, w10
	b.hs	.LBB104_6
// %bb.4:                               //   in Loop: Header=BB104_3 Depth=1
	cmp	w8, w9
	b.hs	.LBB104_7
// %bb.5:                               //   in Loop: Header=BB104_3 Depth=1
	ldp	x8, x9, [x22, #152]
	ldr	x10, [x22, #168]
	ldr	w11, [x22, #176]
	stp	x8, x9, [sp, #40]
	str	x10, [sp, #56]
	ldp	x8, x10, [x22, #120]
	str	w11, [sp, #64]
	ldp	x9, x11, [x22, #136]
	b	.LBB104_9
.LBB104_6:                              //   in Loop: Header=BB104_3 Depth=1
	cmp	w8, w9
	b.hs	.LBB104_8
.LBB104_7:                              //   in Loop: Header=BB104_3 Depth=1
	ldur	x8, [x22, #92]
	ldur	x9, [x22, #100]
	ldur	x10, [x22, #108]
	ldr	w11, [x22, #116]
	stp	x8, x9, [sp, #40]
	str	x10, [sp, #56]
	ldur	x8, [x22, #60]
	ldur	x9, [x22, #68]
	ldur	x10, [x22, #76]
	str	w11, [sp, #64]
	ldur	x11, [x22, #84]
	stp	x8, x9, [sp, #8]
	str	x10, [sp, #24]
	b	.LBB104_10
.LBB104_8:                              //   in Loop: Header=BB104_3 Depth=1
	ldp	x8, x9, [x22, #32]
	ldr	x10, [x22, #48]
	ldr	w11, [x22, #56]
	stp	x8, x9, [sp, #40]
	str	x10, [sp, #56]
	ldp	x8, x10, [x22]
	str	w11, [sp, #64]
	ldp	x9, x11, [x22, #16]
.LBB104_9:                              //   in Loop: Header=BB104_3 Depth=1
	stp	x8, x10, [sp, #8]
	str	x9, [sp, #24]
.LBB104_10:                             //   in Loop: Header=BB104_3 Depth=1
	mov	w0, w23
	str	x11, [sp, #32]
	strb	wzr, [sp, #64]
	bl	__msecs_to_jiffies
	mov	x24, x0
	bl	kthread_should_stop
	tbnz	w0, #0, .LBB104_23
// %bb.11:                              //   in Loop: Header=BB104_3 Depth=1
	ldr	w8, [x28, :lo12:system_freezing_cnt]
	cbnz	w8, .LBB104_47
.LBB104_12:                             //   in Loop: Header=BB104_3 Depth=1
	ldr	w8, [x26, #8272]
	cbz	x24, .LBB104_24
// %bb.13:                              //   in Loop: Header=BB104_3 Depth=1
	cbnz	w8, .LBB104_24
// %bb.14:                              //   in Loop: Header=BB104_3 Depth=1
	mov	w0, w23
	bl	__msecs_to_jiffies
	mov	x24, x0
	add	x0, sp, #72             // =72
	mov	w1, wzr
	bl	init_wait_entry
.LBB104_15:                             //   Parent Loop BB104_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x1, sp, #72             // =72
	mov	x0, x20
	mov	w2, #1
	bl	prepare_to_wait_event
	mov	x25, x0
	bl	kthread_should_stop
	tbnz	w0, #0, .LBB104_22
// %bb.16:                              //   in Loop: Header=BB104_15 Depth=2
	ldr	w8, [x28, :lo12:system_freezing_cnt]
	cbnz	w8, .LBB104_21
.LBB104_17:                             //   in Loop: Header=BB104_15 Depth=2
	ldr	w8, [x26, #8272]
	cmp	w8, #0                  // =0
	ccmp	x24, #0, #0, ne
	csinc	x0, x24, xzr, ne
	cbnz	w8, .LBB104_22
// %bb.18:                              //   in Loop: Header=BB104_15 Depth=2
	cbz	x0, .LBB104_22
// %bb.19:                              //   in Loop: Header=BB104_15 Depth=2
	cbnz	x25, .LBB104_23
// %bb.20:                              //   in Loop: Header=BB104_15 Depth=2
	bl	schedule_timeout
	mov	x24, x0
	b	.LBB104_15
.LBB104_21:                             //   in Loop: Header=BB104_15 Depth=2
	ldr	x0, [sp]                // 8-byte Folded Reload
	bl	freezing_slow_path
	tbz	w0, #0, .LBB104_17
.LBB104_22:                             //   in Loop: Header=BB104_3 Depth=1
	add	x1, sp, #72             // =72
	mov	x0, x20
	bl	finish_wait
.LBB104_23:                             //   in Loop: Header=BB104_3 Depth=1
	ldr	w8, [x26, #8272]
.LBB104_24:                             //   in Loop: Header=BB104_3 Depth=1
	cbz	w8, .LBB104_26
// %bb.25:                              //   in Loop: Header=BB104_3 Depth=1
	str	wzr, [x26, #8272]
.LBB104_26:                             //   in Loop: Header=BB104_3 Depth=1
	ldr	w8, [x26, #8336]
	cbz	w8, .LBB104_28
// %bb.27:                              //   in Loop: Header=BB104_3 Depth=1
	ldr	w8, [x22, #236]
	add	x1, sp, #72             // =72
	ldur	x9, [x22, #212]
	mov	x0, x19
	ldur	x10, [x22, #220]
	mov	w2, wzr
	ldur	x11, [x22, #228]
	mov	w3, w21
	str	w8, [sp, #128]
	ldur	x8, [x22, #180]
	stp	x9, x10, [sp, #104]
	str	x11, [sp, #120]
	ldur	x9, [x22, #188]
	ldur	x10, [x22, #196]
	ldur	x11, [x22, #204]
	strb	wzr, [sp, #128]
	stp	x8, x9, [sp, #72]
	stp	x10, x11, [sp, #88]
	bl	__wait_discard_cmd_range
	ldr	w8, [x22, #296]
	add	x1, sp, #72             // =72
	ldp	x9, x10, [x22, #272]
	mov	x0, x19
	mov	w2, wzr
	ldr	x11, [x22, #288]
	mov	w3, w21
	str	w8, [sp, #128]
	stp	x9, x10, [sp, #104]
	ldp	x8, x10, [x22, #240]
	strb	wzr, [sp, #128]
	str	x11, [sp, #120]
	ldp	x9, x11, [x22, #256]
	stp	x8, x10, [sp, #72]
	stp	x9, x11, [sp, #88]
	bl	__wait_discard_cmd_range
.LBB104_28:                             //   in Loop: Header=BB104_3 Depth=1
	ldr	w8, [x28, :lo12:system_freezing_cnt]
	cbnz	w8, .LBB104_45
.LBB104_29:                             //   in Loop: Header=BB104_3 Depth=1
	ldr	x8, [x19]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB104_2
// %bb.30:                              //   in Loop: Header=BB104_3 Depth=1
	bl	kthread_should_stop
	tbnz	w0, #0, .LBB104_48
// %bb.31:                              //   in Loop: Header=BB104_3 Depth=1
	ldr	x8, [x19, #80]
	tbnz	w8, #2, .LBB104_1
// %bb.32:                              //   in Loop: Header=BB104_3 Depth=1
	ldr	w8, [x26, #8340]
	cbz	w8, .LBB104_2
// %bb.33:                              //   in Loop: Header=BB104_3 Depth=1
	ldr	w8, [x19, #1868]
	cmp	w8, #5                  // =5
	b.eq	.LBB104_35
// %bb.34:                              //   in Loop: Header=BB104_3 Depth=1
	mov	x0, x19
	mov	w1, #6
	bl	f2fs_available_free_memory
	tbnz	w0, #0, .LBB104_37
.LBB104_35:                             //   in Loop: Header=BB104_3 Depth=1
	ldrb	w8, [x19, #1232]
	tbnz	w8, #3, .LBB104_37
// %bb.36:                              //   in Loop: Header=BB104_3 Depth=1
	ldr	w8, [x22, #176]
	ldp	x9, x10, [x22, #152]
	ldr	x11, [x22, #168]
	str	w8, [sp, #64]
	stp	x9, x10, [sp, #40]
	str	x11, [sp, #56]
	ldp	x8, x10, [x22, #120]
	strb	wzr, [sp, #64]
	ldp	x9, x11, [x22, #136]
	stp	x8, x10, [sp, #8]
	stp	x9, x11, [sp, #24]
.LBB104_37:                             //   in Loop: Header=BB104_3 Depth=1
	ldr	x0, [x19]
	mov	w1, #3
	mov	w2, #1
	bl	__sb_start_write
	add	x1, sp, #8              // =8
	mov	x0, x19
	bl	__issue_discard_cmd
	cmp	w0, #1                  // =1
	b.lt	.LBB104_39
// %bb.38:                              //   in Loop: Header=BB104_3 Depth=1
	add	x1, sp, #8              // =8
	mov	x0, x19
	mov	w2, wzr
	mov	w3, w21
	bl	__wait_discard_cmd_range
	ldr	w23, [sp, #52]
	b	.LBB104_44
.LBB104_39:                             //   in Loop: Header=BB104_3 Depth=1
	cmn	w0, #1                  // =1
	b.eq	.LBB104_41
// %bb.40:                              //   in Loop: Header=BB104_3 Depth=1
	ldr	w23, [sp, #60]
	b	.LBB104_44
.LBB104_41:                             //   in Loop: Header=BB104_3 Depth=1
	adrp	x10, jiffies
	ldr	x8, [x19, #560]
	ldr	x9, [x19, #512]
	mov	w11, #250
	ldr	x10, [x10, :lo12:jiffies]
	madd	x8, x8, x11, x9
	sub	x0, x8, x10
	cmp	x0, #1                  // =1
	b.lt	.LBB104_43
// %bb.42:                              //   in Loop: Header=BB104_3 Depth=1
	bl	jiffies_to_msecs
	mov	w23, w0
	cbnz	w0, .LBB104_44
.LBB104_43:                             //   in Loop: Header=BB104_3 Depth=1
	ldr	w23, [sp, #56]
.LBB104_44:                             //   in Loop: Header=BB104_3 Depth=1
	ldr	x0, [x19]
	mov	w1, #3
	bl	__sb_end_write
	b	.LBB104_2
.LBB104_45:                             //   in Loop: Header=BB104_3 Depth=1
	ldr	x0, [sp]                // 8-byte Folded Reload
	bl	freezing_slow_path
	tbz	w0, #0, .LBB104_29
// %bb.46:                              //   in Loop: Header=BB104_3 Depth=1
	mov	w0, wzr
	bl	__refrigerator
	tbnz	w0, #0, .LBB104_2
	b	.LBB104_29
.LBB104_47:                             //   in Loop: Header=BB104_3 Depth=1
	ldr	x0, [sp]                // 8-byte Folded Reload
	bl	freezing_slow_path
	tbz	w0, #0, .LBB104_12
	b	.LBB104_23
.LBB104_48:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB104_50
// %bb.49:
	ldp	x20, x19, [sp, #224]    // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x22, x21, [sp, #208]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #192]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #176]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #160]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	add	sp, sp, #240            // =240
	ret
.LBB104_50:
	bl	__stack_chk_fail
.Lfunc_end104:
	.size	issue_discard_thread, .Lfunc_end104-issue_discard_thread
                                        // -- End function
	.p2align	3               // -- Begin function allocate_segment_by_default
	.type	allocate_segment_by_default,@function
allocate_segment_by_default:            // @allocate_segment_by_default
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	w22, w2
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	w20, w1
	ldr	x8, [x0, #136]
	mov	w2, w20
	mov	w21, w3
	mov	x19, x0
	ldr	x23, [x8, #24]
	mov	w8, #120
	smaddl	x1, w1, w8, x23
	bl	segment_prealloc
	tbnz	w0, #0, .LBB105_45
// %bb.1:
	sxtw	x24, w20
	tbz	w22, #0, .LBB105_3
// %bb.2:
	mov	x0, x19
	mov	w1, w20
	mov	w2, #1
	b	.LBB105_43
.LBB105_3:
	ldr	x8, [x19, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #6, .LBB105_5
// %bb.4:
	mov	w8, #120
	madd	x8, x24, x8, x23
	ldrh	w8, [x8, #98]
	cmp	w8, #4                  // =4
	b.eq	.LBB105_42
.LBB105_5:
	mov	w8, #120
	madd	x8, x24, x8, x23
	ldrb	w8, [x8, #96]
	cbz	w8, .LBB105_7
// %bb.6:
	ldr	x11, [x19, #136]
	ldr	w8, [x11, #96]
	ldr	x14, [x11, #8]
	b	.LBB105_10
.LBB105_7:
	mov	w8, #120
	ldr	x11, [x19, #136]
	madd	x8, x24, x8, x23
	ldr	x14, [x11, #8]
	ldr	w9, [x8, #100]
	ldr	w8, [x11, #96]
	add	w9, w9, #1              // =1
	cmp	w9, w8
	b.hs	.LBB105_10
// %bb.8:
	ldr	w10, [x19, #1192]
	udiv	w12, w9, w10
	msub	w10, w12, w10, w9
	cbz	w10, .LBB105_10
// %bb.9:
	ldr	x10, [x14, #16]
	add	w12, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w12, w12, w9, lt
	asr	w12, w12, #6
	ldr	x10, [x10, w12, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB105_32
.LBB105_10:
	ldr	w16, [x19, #1192]
	ldr	w1, [x19, #1188]
	ldrsw	x18, [x19, #1284]
	ldr	w13, [x19, #1184]
	ldrsw	x0, [x19, #1272]
	ldrsw	x17, [x19, #1296]
	ldr	w15, [x19, #3024]
	ldr	w12, [x19, #1240]
	ldr	w9, [x14, #4]
	ldr	w10, [x11, #104]
	cmp	w15, #2                 // =2
	b.ne	.LBB105_12
// %bb.11:
	ldr	x15, [x19, #16]
	ldrb	w15, [x15, #2182]
	and	w15, w15, #0x1
	b	.LBB105_13
.LBB105_12:
	mov	w15, wzr
.LBB105_13:
	sub	w2, w20, #6             // =6
	ldr	w3, [x19, #1504]
	cmp	w2, #3                  // =3
	cset	w4, lo
	tst	w4, w15
	csel	w15, w2, w20, ne
	cmp	w3, #1                  // =1
	b.eq	.LBB105_39
// %bb.14:
	ldr	w2, [x19, #1868]
	cmp	w2, #3                  // =3
	b.eq	.LBB105_38
// %bb.15:
	mul	w1, w1, w16
	ldr	w14, [x14, #8]
	cmp	w21, #2                 // =2
	sub	x1, x1, #1              // =1
	add	x0, x1, x0
	add	x18, x1, x18
	asr	x0, x0, x13
	asr	x18, x18, x13
	add	x17, x1, x17
	udiv	w0, w0, w16
	asr	x17, x17, x13
	udiv	w18, w18, w16
	udiv	w1, w17, w16
	ldr	w17, [x11, #100]
	add	w18, w18, w0, lsl #1
	add	w11, w18, w1
	b.ne	.LBB105_21
// %bb.16:
	cmp	w15, #1                 // =1
	b.ne	.LBB105_21
// %bb.17:
	cmn	w17, #1                 // =1
	b.eq	.LBB105_19
// %bb.18:
	udiv	w18, w17, w16
	add	w18, w18, w18, lsl #1
	cmp	w18, #0                 // =0
	cinc	w18, w18, lt
	asr	w18, w18, #1
	b	.LBB105_20
.LBB105_19:
	mov	w18, #-1
.LBB105_20:
	add	w18, w18, w11
	cmp	w14, w18
	b.hi	.LBB105_39
.LBB105_21:
	cmn	w17, #1                 // =1
	b.eq	.LBB105_23
// %bb.22:
	udiv	w16, w17, w16
	lsl	w16, w16, #1
	b	.LBB105_24
.LBB105_23:
	mov	w16, #-2
.LBB105_24:
	add	w11, w16, w11
	cmp	w14, w11
	b.ls	.LBB105_38
// %bb.25:
	ldr	w11, [x19, #3236]
	cbz	w11, .LBB105_39
// %bb.26:
	cmp	w21, #0                 // =0
	b.gt	.LBB105_39
// %bb.27:
	lsl	w8, w8, w13
	cmp	w8, #1024, lsl #12      // =4194304
	b.ls	.LBB105_39
// %bb.28:
	sub	x8, x8, x12
	lsl	w11, w10, #11
	lsl	x8, x8, #2
	subs	x8, x8, x11
	b.eq	.LBB105_39
// %bb.29:
	cmp	w15, #4                 // =4
	b.hi	.LBB105_39
// %bb.30:
	adrp	x12, .LJTI105_0
	mov	w11, w15
	add	x12, x12, :lo12:.LJTI105_0
	adr	x13, .LBB105_31
	ldrb	w14, [x12, x11]
	add	x13, x13, x14, lsl #2
	br	x13
.LBB105_31:
	add	x12, x19, #3240         // =3240
	add	x11, x19, #3244         // =3244
	b	.LBB105_36
.LBB105_32:
	ldr	x9, [x19, #80]
	tbz	w9, #8, .LBB105_42
	b	.LBB105_10
.LBB105_33:
	add	x12, x19, #3248         // =3248
	add	x11, x19, #3252         // =3252
	b	.LBB105_36
.LBB105_34:
	add	x12, x19, #3256         // =3256
	add	x11, x19, #3260         // =3260
	b	.LBB105_36
.LBB105_35:
	add	x12, x19, #3264         // =3264
	add	x11, x19, #3268         // =3268
.LBB105_36:
	ldr	w12, [x12]
	cmp	x8, x12
	b.hi	.LBB105_39
// %bb.37:
	sub	w9, w9, w10
	mov	w10, #100
	lsr	x8, x8, #11
	mul	w9, w9, w10
	ldr	w10, [x11]
	udiv	x8, x9, x8
	cmp	x8, x10
	b.hi	.LBB105_39
.LBB105_38:
	mov	x0, x19
	mov	w1, w20
	mov	w2, #1
	mov	x3, xzr
	bl	get_ssr_segment
	cbnz	w0, .LBB105_41
.LBB105_39:
	mov	x0, x19
	mov	w1, w20
	bl	need_ssr_by_multi_device
	tbz	w0, #0, .LBB105_42
// %bb.40:
	mov	x0, x19
	mov	w1, w20
	mov	w2, #1
	mov	x3, xzr
	bl	get_ssr_segment
	cbz	w0, .LBB105_42
.LBB105_41:
	mov	x0, x19
	mov	w1, w20
	bl	change_curseg
	b	.LBB105_44
.LBB105_42:
	mov	x0, x19
	mov	w1, w20
	mov	w2, wzr
.LBB105_43:
	bl	new_curseg
.LBB105_44:
	mov	w8, #120
	madd	x8, x24, x8, x23
	ldrb	w8, [x8, #96]
	add	x8, x19, x8, lsl #2
	ldr	w9, [x8, #2040]
	add	w9, w9, #1              // =1
	str	w9, [x8, #2040]
.LBB105_45:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end105:
	.size	allocate_segment_by_default, .Lfunc_end105-allocate_segment_by_default
	.section	.rodata,"a",@progbits
.LJTI105_0:
	.byte	(.LBB105_31-.LBB105_31)>>2
	.byte	(.LBB105_33-.LBB105_31)>>2
	.byte	(.LBB105_39-.LBB105_31)>>2
	.byte	(.LBB105_34-.LBB105_31)>>2
	.byte	(.LBB105_35-.LBB105_31)>>2
                                        // -- End function
	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\0013device: %d not support"
	.size	.L.str, 25

	.type	inmem_entry_slab,@object // @inmem_entry_slab
	.local	inmem_entry_slab
	.comm	inmem_entry_slab,8,8
	.type	.L.str.2,@object        // @.str.2
.L.str.2:
	.asciz	"F2FS bug: %s:%d\n"
	.size	.L.str.2, 17

	.type	.L__func__.f2fs_drop_inmem_page,@object // @__func__.f2fs_drop_inmem_page
.L__func__.f2fs_drop_inmem_page:
	.asciz	"f2fs_drop_inmem_page"
	.size	.L__func__.f2fs_drop_inmem_page, 21

	.type	f2fs_balance_fs.FG_GC_count,@object // @f2fs_balance_fs.FG_GC_count
	.local	f2fs_balance_fs.FG_GC_count
	.comm	f2fs_balance_fs.FG_GC_count,4,4
	.type	f2fs_balance_fs.fg_gc_rs,@object // @f2fs_balance_fs.fg_gc_rs
	.data
	.p2align	3
f2fs_balance_fs.fg_gc_rs:
	.zero	4
	.word	50000                   // 0xc350
	.word	2                       // 0x2
	.word	0                       // 0x0
	.word	0                       // 0x0
	.zero	4
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.size	f2fs_balance_fs.fg_gc_rs, 40

	.type	.L__func__.f2fs_balance_fs,@object // @__func__.f2fs_balance_fs
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__func__.f2fs_balance_fs:
	.asciz	"f2fs_balance_fs"
	.size	.L__func__.f2fs_balance_fs, 16

	.type	.L.str.3,@object        // @.str.3
.L.str.3:
	.asciz	"\0015FG_GC: Size=%lluMB,Free=%lluMB,count=%d,free_sec=%u, \t\t\t\treserved_sec=%u,node_secs=%d,dent_secs=%d,meta_secs=%d"
	.size	.L.str.3, 114

	.type	.L.str.4,@object        // @.str.4
.L.str.4:
	.asciz	"\0015FG_GC: free_segs: (%u, %u), user_block_count: (%u, %u), written_valid_blocks: (%u, %u)"
	.size	.L.str.4, 89

	.type	.L.str.5,@object        // @.str.5
.L.str.5:
	.asciz	"\0015FG_GC: Size=%lluMB,Free=%lluMB,count=%d,free_sec=%u, \t\t\treserved_sec=%u,node_secs=%d,dent_secs=%d,meta_secs=%d"
	.size	.L.str.5, 113

	.type	.L.str.6,@object        // @.str.6
.L.str.6:
	.asciz	"\0015FG_GC: free_segs: (%u, %u), user_block_count: (%u, %u)written_valid_blocks: (%u, %u)"
	.size	.L.str.6, 87

	.type	f2fs_balance_fs.fg_gc_rs.7,@object // @f2fs_balance_fs.fg_gc_rs.7
	.data
	.p2align	3
f2fs_balance_fs.fg_gc_rs.7:
	.zero	4
	.word	50000                   // 0xc350
	.word	2                       // 0x2
	.word	0                       // 0x0
	.word	0                       // 0x0
	.zero	4
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.size	f2fs_balance_fs.fg_gc_rs.7, 40

	.type	.L.str.8,@object        // @.str.8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.8:
	.asciz	"\0015Size=%lluMB,Free=%lluMB,count=%d,free_sec=%u, \t\t\t\treserved_sec=%u,node_secs=%d,dent_secs=%d,meta_secs=%d"
	.size	.L.str.8, 107

	.type	.L.str.9,@object        // @.str.9
.L.str.9:
	.asciz	"\0015free_segs: (%u, %u), user_block_count: (%u, %u), written_valid_blocks: (%u, %u)"
	.size	.L.str.9, 82

	.type	f2fs_create_flush_cmd_control.__key,@object // @f2fs_create_flush_cmd_control.__key
	.local	f2fs_create_flush_cmd_control.__key
	.comm	f2fs_create_flush_cmd_control.__key,1,1
	.type	.L.str.10,@object       // @.str.10
.L.str.10:
	.asciz	"&fcc->flush_wait_queue"
	.size	.L.str.10, 23

	.type	.L.str.11,@object       // @.str.11
.L.str.11:
	.asciz	"f2fs_flush-%u:%u"
	.size	.L.str.11, 17

	.type	.L__func__.f2fs_issue_discard_timeout,@object // @__func__.f2fs_issue_discard_timeout
.L__func__.f2fs_issue_discard_timeout:
	.asciz	"f2fs_issue_discard_timeout"
	.size	.L__func__.f2fs_issue_discard_timeout, 27

	.type	.L__func__.f2fs_invalidate_blocks,@object // @__func__.f2fs_invalidate_blocks
.L__func__.f2fs_invalidate_blocks:
	.asciz	"f2fs_invalidate_blocks"
	.size	.L__func__.f2fs_invalidate_blocks, 23

	.type	.L.str.12,@object       // @.str.12
.L.str.12:
	.asciz	"\0015curseg of type %d: %u"
	.size	.L.str.12, 24

	.type	.L.str.13,@object       // @.str.13
.L.str.13:
	.asciz	"\0015For resize: curseg of type %d: %u ==> %u"
	.size	.L.str.13, 43

	.type	.L.str.14,@object       // @.str.14
.L.str.14:
	.asciz	"\0015Found FS corruption, run fsck to fix."
	.size	.L.str.14, 40

	.type	.L__func__.f2fs_allocate_data_block,@object // @__func__.f2fs_allocate_data_block
.L__func__.f2fs_allocate_data_block:
	.asciz	"f2fs_allocate_data_block"
	.size	.L__func__.f2fs_allocate_data_block, 25

	.type	.L.str.15,@object       // @.str.15
.L.str.15:
	.asciz	"\0013dm has invalid device = %d"
	.size	.L.str.15, 29

	.type	.L__func__.f2fs_outplace_write_data,@object // @__func__.f2fs_outplace_write_data
.L__func__.f2fs_outplace_write_data:
	.asciz	"f2fs_outplace_write_data"
	.size	.L__func__.f2fs_outplace_write_data, 25

	.type	.L.str.16,@object       // @.str.16
.L.str.16:
	.asciz	"\0014%s: incorrect segment(%u) type, run fsck to fix."
	.size	.L.str.16, 51

	.type	.L__func__.f2fs_inplace_write_data,@object // @__func__.f2fs_inplace_write_data
.L__func__.f2fs_inplace_write_data:
	.asciz	"f2fs_inplace_write_data"
	.size	.L__func__.f2fs_inplace_write_data, 24

	.type	.L__func__.f2fs_do_replace_block,@object // @__func__.f2fs_do_replace_block
.L__func__.f2fs_do_replace_block:
	.asciz	"f2fs_do_replace_block"
	.size	.L__func__.f2fs_do_replace_block, 22

	.type	.L__func__.f2fs_wait_on_page_writeback,@object // @__func__.f2fs_wait_on_page_writeback
.L__func__.f2fs_wait_on_page_writeback:
	.asciz	"f2fs_wait_on_page_writeback"
	.size	.L__func__.f2fs_wait_on_page_writeback, 28

	.type	.L__func__.f2fs_flush_sit_entries,@object // @__func__.f2fs_flush_sit_entries
.L__func__.f2fs_flush_sit_entries:
	.asciz	"f2fs_flush_sit_entries"
	.size	.L__func__.f2fs_flush_sit_entries, 23

	.type	f2fs_build_segment_manager.__key,@object // @f2fs_build_segment_manager.__key
	.local	f2fs_build_segment_manager.__key
	.comm	f2fs_build_segment_manager.__key,1,1
	.type	.L.str.17,@object       // @.str.17
.L.str.17:
	.asciz	"&sm_info->curseg_lock"
	.size	.L.str.17, 22

	.type	.L.str.18,@object       // @.str.18
.L.str.18:
	.asciz	"f2fs_discard_entry"
	.size	.L.str.18, 19

	.type	discard_entry_slab,@object // @discard_entry_slab
	.local	discard_entry_slab
	.comm	discard_entry_slab,8,8
	.type	.L.str.19,@object       // @.str.19
.L.str.19:
	.asciz	"f2fs_discard_cmd"
	.size	.L.str.19, 17

	.type	discard_cmd_slab,@object // @discard_cmd_slab
	.local	discard_cmd_slab
	.comm	discard_cmd_slab,8,8
	.type	.L.str.20,@object       // @.str.20
.L.str.20:
	.asciz	"f2fs_sit_entry_set"
	.size	.L.str.20, 19

	.type	sit_entry_set_slab,@object // @sit_entry_set_slab
	.local	sit_entry_set_slab
	.comm	sit_entry_set_slab,8,8
	.type	.L.str.21,@object       // @.str.21
.L.str.21:
	.asciz	"f2fs_inmem_page_entry"
	.size	.L.str.21, 22

	.type	.L__func__.f2fs_put_page,@object // @__func__.f2fs_put_page
.L__func__.f2fs_put_page:
	.asciz	"f2fs_put_page"
	.size	.L__func__.f2fs_put_page, 14

	.type	.L.str.22,@object       // @.str.22
.L.str.22:
	.asciz	"\0013cp_rwsem_timeout: start: %lu now: %lu\n"
	.size	.L.str.22, 41

	.type	.L__const.f2fs_bd_balance_decision.ts,@object // @__const.f2fs_bd_balance_decision.ts
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	3
.L__const.f2fs_bd_balance_decision.ts:
	.xword	15                      // 0xf
	.xword	0                       // 0x0
	.size	.L__const.f2fs_bd_balance_decision.ts, 16

	.type	__init_completion.__key,@object // @__init_completion.__key
	.local	__init_completion.__key
	.comm	__init_completion.__key,1,1
	.type	.L.str.23,@object       // @.str.23
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.23:
	.asciz	"&x->wait"
	.size	.L.str.23, 9

	.type	.L__func__.__locate_dirty_segment,@object // @__func__.__locate_dirty_segment
.L__func__.__locate_dirty_segment:
	.asciz	"__locate_dirty_segment"
	.size	.L__func__.__locate_dirty_segment, 23

	.type	.L__func__.__drop_discard_cmd,@object // @__func__.__drop_discard_cmd
.L__func__.__drop_discard_cmd:
	.asciz	"__drop_discard_cmd"
	.size	.L__func__.__drop_discard_cmd, 19

	.type	.L__func__.__remove_discard_cmd,@object // @__func__.__remove_discard_cmd
.L__func__.__remove_discard_cmd:
	.asciz	"__remove_discard_cmd"
	.size	.L__func__.__remove_discard_cmd, 21

	.type	__remove_discard_cmd._rs,@object // @__remove_discard_cmd._rs
	.data
	.p2align	3
__remove_discard_cmd._rs:
	.zero	4
	.word	1250                    // 0x4e2
	.word	10                      // 0xa
	.word	0                       // 0x0
	.word	0                       // 0x0
	.zero	4
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.size	__remove_discard_cmd._rs, 40

	.type	.L.str.24,@object       // @.str.24
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.24:
	.asciz	"%sF2FS-fs (%s): Issue discard(%u, %u, %u) failed, ret: %d"
	.size	.L.str.24, 58

	.type	.L.str.25,@object       // @.str.25
.L.str.25:
	.asciz	"\0016"
	.size	.L.str.25, 3

	.type	dpolicys,@object        // @dpolicys
	.section	.rodata,"a",@progbits
	.p2align	2
dpolicys:
	.word	0                       // 0x0
	.word	512                     // 0x200
	.byte	0                       // 0x0
	.zero	3
	.word	512                     // 0x200
	.byte	1                       // 0x1
	.byte	0                       // 0x0
	.zero	2
	.word	1                       // 0x1
	.word	0                       // 0x0
	.zero	8
	.zero	8
	.word	0                       // 0x0
	.word	500                     // 0x1f4
	.word	60000                   // 0xea60
	.byte	0                       // 0x0
	.zero	3
	.word	1                       // 0x1
	.word	16                      // 0x10
	.byte	1                       // 0x1
	.zero	3
	.word	511                     // 0x1ff
	.byte	1                       // 0x1
	.byte	0                       // 0x0
	.zero	2
	.word	1                       // 0x1
	.word	0                       // 0x0
	.word	2                       // 0x2
	.word	50                      // 0x32
	.zero	8
	.word	0                       // 0x0
	.word	500                     // 0x1f4
	.word	60000                   // 0xea60
	.byte	0                       // 0x0
	.zero	3
	.word	2                       // 0x2
	.word	1                       // 0x1
	.byte	1                       // 0x1
	.zero	3
	.word	511                     // 0x1ff
	.byte	1                       // 0x1
	.byte	0                       // 0x0
	.zero	2
	.word	1                       // 0x1
	.word	0                       // 0x0
	.word	2                       // 0x2
	.word	50                      // 0x32
	.word	4                       // 0x4
	.word	2000                    // 0x7d0
	.word	0                       // 0x0
	.word	500                     // 0x1f4
	.word	60000                   // 0xea60
	.byte	0                       // 0x0
	.zero	3
	.word	3                       // 0x3
	.word	1                       // 0x1
	.byte	0                       // 0x0
	.zero	3
	.word	512                     // 0x200
	.byte	1                       // 0x1
	.byte	0                       // 0x0
	.zero	2
	.word	8                       // 0x8
	.word	0                       // 0x0
	.word	8                       // 0x8
	.word	0                       // 0x0
	.word	8                       // 0x8
	.word	0                       // 0x0
	.word	0                       // 0x0
	.word	500                     // 0x1f4
	.word	60000                   // 0xea60
	.byte	0                       // 0x0
	.zero	3
	.word	4                       // 0x4
	.word	1                       // 0x1
	.byte	0                       // 0x0
	.zero	3
	.word	512                     // 0x200
	.byte	1                       // 0x1
	.byte	0                       // 0x0
	.zero	2
	.zero	24
	.word	0                       // 0x0
	.word	500                     // 0x1f4
	.word	60000                   // 0xea60
	.byte	0                       // 0x0
	.zero	3
	.size	dpolicys, 300

	.type	.L__func__.__issue_discard_cmd,@object // @__func__.__issue_discard_cmd
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__func__.__issue_discard_cmd:
	.asciz	"__issue_discard_cmd"
	.size	.L__func__.__issue_discard_cmd, 20

	.type	.L.str.26,@object       // @.str.26
.L.str.26:
	.asciz	"\0015RESIZE: Remove dc: start %u, len %u"
	.size	.L.str.26, 38

	.type	.L.str.27,@object       // @.str.27
.L.str.27:
	.asciz	"\0015RESIZE: dc len truncated to %u"
	.size	.L.str.27, 33

	.type	.L__func__.__submit_discard_cmd,@object // @__func__.__submit_discard_cmd
.L__func__.__submit_discard_cmd:
	.asciz	"__submit_discard_cmd"
	.size	.L__func__.__submit_discard_cmd, 21

	.type	.L__func__.__check_sit_bitmap,@object // @__func__.__check_sit_bitmap
.L__func__.__check_sit_bitmap:
	.asciz	"__check_sit_bitmap"
	.size	.L__func__.__check_sit_bitmap, 19

	.type	.L__func__.__create_discard_cmd,@object // @__func__.__create_discard_cmd
.L__func__.__create_discard_cmd:
	.asciz	"__create_discard_cmd"
	.size	.L__func__.__create_discard_cmd, 21

	.type	.L.str.29,@object       // @.str.29
.L.str.29:
	.asciz	"\0015RESIZE: skip %s at blkaddr %u"
	.size	.L.str.29, 32

	.type	.L__func__.update_sit_entry,@object // @__func__.update_sit_entry
.L__func__.update_sit_entry:
	.asciz	"update_sit_entry"
	.size	.L__func__.update_sit_entry, 17

	.type	.L.str.30,@object       // @.str.30
.L.str.30:
	.asciz	"\0013Invalid blkaddr 0x%x"
	.size	.L.str.30, 23

	.type	.L.str.31,@object       // @.str.31
.L.str.31:
	.asciz	"\0013blkaddr %#x del %d"
	.size	.L.str.31, 21

	.type	.L.str.32,@object       // @.str.32
.L.str.32:
	.asciz	"\0013Invalid blk count %ld, blkaddr = 0x%x, bitmap is %s"
	.size	.L.str.32, 54

	.type	.L.str.33,@object       // @.str.33
.L.str.33:
	.asciz	"set"
	.size	.L.str.33, 4

	.type	.L.str.34,@object       // @.str.34
.L.str.34:
	.asciz	"not set"
	.size	.L.str.34, 8

	.type	.L.str.35,@object       // @.str.35
.L.str.35:
	.asciz	"\0013Inconsistent error when setting bitmap, blk:%u, old bit:%d"
	.size	.L.str.35, 61

	.type	.L.str.36,@object       // @.str.36
.L.str.36:
	.asciz	"\0013Bitmap was wrongly set, blk:%u"
	.size	.L.str.36, 33

	.type	.L.str.37,@object       // @.str.37
.L.str.37:
	.asciz	"\0013Inconsistent error when clearing bitmap, blk:%u, old bit:%d"
	.size	.L.str.37, 62

	.type	.L.str.38,@object       // @.str.38
.L.str.38:
	.asciz	"\0013Bitmap was wrongly cleared, blk:%u"
	.size	.L.str.38, 37

	.type	.L.str.39,@object       // @.str.39
.L.str.39:
	.asciz	"\0013Cannot get buffer_head of extra_flags_block\n"
	.size	.L.str.39, 47

	.type	.L__func__.reset_curseg,@object // @__func__.reset_curseg
.L__func__.reset_curseg:
	.asciz	"reset_curseg"
	.size	.L__func__.reset_curseg, 13

	.type	.L.str.40,@object       // @.str.40
.L.str.40:
	.asciz	"\0013type: %d, segno: %u do not match\n"
	.size	.L.str.40, 36

	.type	.L__func__.get_new_segment,@object // @__func__.get_new_segment
.L__func__.get_new_segment:
	.asciz	"get_new_segment"
	.size	.L__func__.get_new_segment, 16

	.type	.L__func__.__issue_discard_cmd_range,@object // @__func__.__issue_discard_cmd_range
.L__func__.__issue_discard_cmd_range:
	.asciz	"__issue_discard_cmd_range"
	.size	.L__func__.__issue_discard_cmd_range, 26

	.type	.L__func__.__wait_one_discard_bio,@object // @__func__.__wait_one_discard_bio
.L__func__.__wait_one_discard_bio:
	.asciz	"__wait_one_discard_bio"
	.size	.L__func__.__wait_one_discard_bio, 23

	.type	.L__func__.sanity_check_seg_type,@object // @__func__.sanity_check_seg_type
.L__func__.sanity_check_seg_type:
	.asciz	"sanity_check_seg_type"
	.size	.L__func__.sanity_check_seg_type, 22

	.type	.L__func__.__get_segment_type,@object // @__func__.__get_segment_type
.L__func__.__get_segment_type:
	.asciz	"__get_segment_type"
	.size	.L__func__.__get_segment_type, 19

	.type	.L.str.41,@object       // @.str.41
.L.str.41:
	.asciz	"\0015RESIZE: Skip segno %u / %u in jnl!"
	.size	.L.str.41, 37

	.type	.L__func__.current_sit_addr,@object // @__func__.current_sit_addr
.L__func__.current_sit_addr:
	.asciz	"current_sit_addr"
	.size	.L__func__.current_sit_addr, 17

	.type	.L__func__.check_seg_range,@object // @__func__.check_seg_range
.L__func__.check_seg_range:
	.asciz	"check_seg_range"
	.size	.L__func__.check_seg_range, 16

	.type	.L.str.42,@object       // @.str.42
.L.str.42:
	.asciz	"\0013Mismatch valid blocks %d vs. %d"
	.size	.L.str.42, 34

	.type	.L.str.43,@object       // @.str.43
.L.str.43:
	.asciz	"SBI_NEED_FSCK:%s:%d\n"
	.size	.L.str.43, 21

	.type	.L__func__.check_block_count,@object // @__func__.check_block_count
.L__func__.check_block_count:
	.asciz	"check_block_count"
	.size	.L__func__.check_block_count, 18

	.type	.L.str.44,@object       // @.str.44
.L.str.44:
	.asciz	"\0013Wrong valid blocks %d or segno %u"
	.size	.L.str.44, 36

	.type	create_discard_cmd_control.__key,@object // @create_discard_cmd_control.__key
	.local	create_discard_cmd_control.__key
	.comm	create_discard_cmd_control.__key,1,1
	.type	.L.str.45,@object       // @.str.45
.L.str.45:
	.asciz	"&dcc->cmd_lock"
	.size	.L.str.45, 15

	.type	create_discard_cmd_control.__key.46,@object // @create_discard_cmd_control.__key.46
	.local	create_discard_cmd_control.__key.46
	.comm	create_discard_cmd_control.__key.46,1,1
	.type	.L.str.47,@object       // @.str.47
.L.str.47:
	.asciz	"&dcc->discard_wait_queue"
	.size	.L.str.47, 25

	.type	.L.str.48,@object       // @.str.48
.L.str.48:
	.asciz	"f2fs_discard-%u:%u"
	.size	.L.str.48, 19

	.type	default_salloc_ops,@object // @default_salloc_ops
	.section	.rodata,"a",@progbits
	.p2align	3
default_salloc_ops:
	.xword	allocate_segment_by_default
	.size	default_salloc_ops, 8

	.type	build_sit_info.__key,@object // @build_sit_info.__key
	.local	build_sit_info.__key
	.comm	build_sit_info.__key,1,1
	.type	.L.str.49,@object       // @.str.49
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.49:
	.asciz	"&sit_i->sentry_lock"
	.size	.L.str.49, 20

	.type	build_curseg.__key,@object // @build_curseg.__key
	.local	build_curseg.__key
	.comm	build_curseg.__key,1,1
	.type	.L.str.50,@object       // @.str.50
.L.str.50:
	.asciz	"&array[i].curseg_mutex"
	.size	.L.str.50, 23

	.type	build_curseg.__key.51,@object // @build_curseg.__key.51
	.local	build_curseg.__key.51
	.comm	build_curseg.__key.51,1,1
	.type	.L.str.52,@object       // @.str.52
.L.str.52:
	.asciz	"&array[i].journal_rwsem"
	.size	.L.str.52, 24

	.type	.L.str.53,@object       // @.str.53
.L.str.53:
	.asciz	"\0013invalid journal entries nats %u sits %u\n"
	.size	.L.str.53, 43

	.type	.L.str.54,@object       // @.str.54
.L.str.54:
	.asciz	"\0013Wrong journal entry on segno %u"
	.size	.L.str.54, 34

	.type	.L.str.55,@object       // @.str.55
.L.str.55:
	.asciz	"\0013SIT is corrupted node# %u vs %u"
	.size	.L.str.55, 34

	.type	.L__func__.build_sit_entries,@object // @__func__.build_sit_entries
.L__func__.build_sit_entries:
	.asciz	"build_sit_entries"
	.size	.L__func__.build_sit_entries, 18

	.type	.L.str.56,@object       // @.str.56
.L.str.56:
	.asciz	"\0014segment %u has %u valid blocks\n"
	.size	.L.str.56, 34

	.type	.L.str.57,@object       // @.str.57
.L.str.57:
	.asciz	"\0014disabling mirror space\n"
	.size	.L.str.57, 26

	.type	build_dirty_segmap.__key,@object // @build_dirty_segmap.__key
	.local	build_dirty_segmap.__key
	.comm	build_dirty_segmap.__key,1,1
	.type	.L.str.58,@object       // @.str.58
.L.str.58:
	.asciz	"&dirty_i->seglist_lock"
	.size	.L.str.58, 23

	.type	.L__func__.init_dirty_segmap,@object // @__func__.init_dirty_segmap
.L__func__.init_dirty_segmap:
	.asciz	"init_dirty_segmap"
	.size	.L__func__.init_dirty_segmap, 18

	.type	.L.str.59,@object       // @.str.59
.L.str.59:
	.asciz	"\0013Current segment's next free block offset is inconsistent with bitmap, logtype:%u, segno:%u, type:%u, next_blkoff:%u, blkofs:%u"
	.size	.L.str.59, 129

	.type	.Lswitch.table.f2fs_io_type_to_rw_hint,@object // @switch.table.f2fs_io_type_to_rw_hint
	.section	.rodata,"a",@progbits
	.p2align	2
.Lswitch.table.f2fs_io_type_to_rw_hint:
	.word	2                       // 0x2
	.word	4                       // 0x4
	.word	5                       // 0x5
	.size	.Lswitch.table.f2fs_io_type_to_rw_hint, 12

	.type	.Lswitch.table.f2fs_io_type_to_rw_hint.60,@object // @switch.table.f2fs_io_type_to_rw_hint.60
	.p2align	2
.Lswitch.table.f2fs_io_type_to_rw_hint.60:
	.word	0                       // 0x0
	.word	0                       // 0x0
	.word	1                       // 0x1
	.size	.Lswitch.table.f2fs_io_type_to_rw_hint.60, 12

	.type	.Lswitch.table.f2fs_do_replace_block.61,@object // @switch.table.f2fs_do_replace_block.61
	.p2align	2
.Lswitch.table.f2fs_do_replace_block.61:
	.word	0                       // 0x0
	.word	1                       // 0x1
	.word	2                       // 0x2
	.word	8                       // 0x8
	.word	8                       // 0x8
	.word	8                       // 0x8
	.word	6                       // 0x6
	.word	7                       // 0x7
	.word	8                       // 0x8
	.size	.Lswitch.table.f2fs_do_replace_block.61, 36

	.ident	"Snapdragon LLVM ARM Compiler 10.0.7 for Android NDK"
	.section	".note.GNU-stack","",@progbits
