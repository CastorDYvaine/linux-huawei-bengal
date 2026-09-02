	.text
	.file	"file.c"
	.globl	create_page_info_slab   // -- Begin function create_page_info_slab
	.p2align	3
	.type	create_page_info_slab,@function
create_page_info_slab:                  // @create_page_info_slab
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x0, .L.str
	mov	w1, #24
	add	x0, x0, :lo12:.L.str
	mov	w2, wzr
	mov	w3, #131072
	mov	x4, xzr
	mov	x29, sp
	bl	kmem_cache_create
	mov	w9, #-12
	cmp	x0, #0                  // =0
	mov	x8, x0
	csel	w0, w9, wzr, eq
	adrp	x9, page_info_slab
	str	x8, [x9, :lo12:page_info_slab]
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	create_page_info_slab, .Lfunc_end0-create_page_info_slab
                                        // -- End function
	.globl	destroy_page_info_slab  // -- Begin function destroy_page_info_slab
	.p2align	3
	.type	destroy_page_info_slab,@function
destroy_page_info_slab:                 // @destroy_page_info_slab
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x8, page_info_slab
	mov	x29, sp
	ldr	x0, [x8, :lo12:page_info_slab]
	cbz	x0, .LBB1_2
// %bb.1:
	bl	kmem_cache_destroy
.LBB1_2:
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	destroy_page_info_slab, .Lfunc_end1-destroy_page_info_slab
                                        // -- End function
	.globl	f2fs_drop_deduped_link  // -- Begin function f2fs_drop_deduped_link
	.p2align	3
	.type	f2fs_drop_deduped_link,@function
f2fs_drop_deduped_link:                 // @f2fs_drop_deduped_link
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #40]
	mov	x29, sp
	str	x21, [sp, #16]          // 8-byte Folded Spill
	add	x21, x0, #720           // =720
	mov	x0, x21
	ldr	x20, [x8, #1104]
	bl	down_write
	mov	x0, x19
	bl	drop_nlink
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x21
	bl	up_write
	ldr	w8, [x19, #72]
	cbz	w8, .LBB2_2
// %bb.1:
	mov	x0, x20
	bl	f2fs_release_orphan_inode
	b	.LBB2_3
.LBB2_2:
	mov	x0, x19
	bl	f2fs_add_orphan_inode
.LBB2_3:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end2:
	.size	f2fs_drop_deduped_link, .Lfunc_end2-f2fs_drop_deduped_link
                                        // -- End function
	.globl	f2fs_set_inode_addr     // -- Begin function f2fs_set_inode_addr
	.p2align	3
	.type	f2fs_set_inode_addr,@function
f2fs_set_inode_addr:                    // @f2fs_set_inode_addr
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	w22, w1
	ldr	x8, [x0, #40]
	ldr	x20, [x8, #1104]
	ldr	x8, [x0, #64]
	mov	x0, x20
	mov	x1, x8
	bl	f2fs_get_node_page
	mov	x19, x0
	cmn	x0, #12                 // =12
	b.eq	.LBB3_3
// %bb.1:
	cmn	x19, #4095              // =4095
	b.lo	.LBB3_8
.LBB3_2:
	adrp	x1, .L.str.3
	adrp	x2, .L__func__.f2fs_set_inode_addr
	add	x1, x1, :lo12:.L.str.3
	add	x2, x2, :lo12:.L__func__.f2fs_set_inode_addr
	mov	x0, x20
	bl	f2fs_printk
	b	.LBB3_66
.LBB3_3:
	mov	w26, #32401
	mov	w27, #61231
	mov	w28, #36280
	adrp	x24, .L.str.1
	adrp	x25, .L__func__.f2fs_set_inode_addr
	mov	w23, #2
	movk	w26, #15099, lsl #16
	movk	w27, #50488, lsl #16
	movk	w28, #6, lsl #16
	add	x24, x24, :lo12:.L.str.1
	add	x25, x25, :lo12:.L__func__.f2fs_set_inode_addr
	b	.LBB3_5
.LBB3_4:                                //   in Loop: Header=BB3_5 Depth=1
	ldr	x1, [x21, #64]
	mov	x0, x20
	bl	f2fs_get_node_page
	add	w23, w23, #1            // =1
	cmn	x0, #12                 // =12
	b.ne	.LBB3_7
.LBB3_5:                                // =>This Inner Loop Header: Depth=1
	madd	w8, w23, w26, w27
	ror	w8, w8, #4
	cmp	w8, w28
	b.hi	.LBB3_4
// %bb.6:                               //   in Loop: Header=BB3_5 Depth=1
	mov	x0, x20
	mov	x1, x24
	mov	x2, x25
	mov	w3, w23
	bl	f2fs_printk
	b	.LBB3_4
.LBB3_7:
	mov	x19, x0
	cmn	x19, #4095              // =4095
	b.hs	.LBB3_2
.LBB3_8:
	mov	x0, x19
	mov	w1, #1
	mov	w2, #1
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
	ldr	x8, [x21, #712]
	lsl	x9, x19, #6
	orr	x26, x9, #0xffffffc000000000
	tbnz	w8, #26, .LBB3_10
// %bb.9:
	mov	w27, wzr
	b	.LBB3_11
.LBB3_10:
	ldr	w8, [x21, #1160]
	asr	w27, w8, #2
.LBB3_11:
	mov	w28, wzr
	mov	w23, #923
	b	.LBB3_13
.LBB3_12:                               //   in Loop: Header=BB3_13 Depth=1
	str	w22, [x24]
	add	w28, w28, #1            // =1
.LBB3_13:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB3_22 Depth 2
	ldr	w8, [x21, #1160]
	ldr	w9, [x21, #1168]
	ldrh	w10, [x21]
	add	w8, w9, w8, asr #2
	sub	w8, w23, w8
	and	w9, w10, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB3_16
// %bb.14:                              //   in Loop: Header=BB3_13 Depth=1
	ldr	x9, [x21, #712]
	tbz	w9, #31, .LBB3_16
// %bb.15:                              //   in Loop: Header=BB3_13 Depth=1
	ldr	w9, [x21, #1268]
	neg	w9, w9
	and	w8, w8, w9
.LBB3_16:                               //   in Loop: Header=BB3_13 Depth=1
	cmp	w28, w8
	b.hs	.LBB3_28
// %bb.17:                              //   in Loop: Header=BB3_13 Depth=1
	add	w25, w28, w27
	add	x8, x26, w25, sxtw #2
	add	x24, x8, #360           // =360
	ldr	w1, [x8, #360]
	add	w8, w1, #3              // =3
	cmp	w8, #4                  // =4
	b.lo	.LBB3_12
// %bb.18:                              //   in Loop: Header=BB3_13 Depth=1
	ldr	w9, [x20, #3024]
	cbz	w9, .LBB3_26
// %bb.19:                              //   in Loop: Header=BB3_13 Depth=1
	ldr	x8, [x20]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB3_25
// %bb.20:                              //   in Loop: Header=BB3_13 Depth=1
	ldr	x11, [x20, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB3_22
.LBB3_21:                               //   in Loop: Header=BB3_22 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB3_25
.LBB3_22:                               //   Parent Loop BB3_13 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w1
	b.hi	.LBB3_21
// %bb.23:                              //   in Loop: Header=BB3_22 Depth=2
	ldr	w12, [x11]
	cmp	w12, w1
	b.lo	.LBB3_21
// %bb.24:                              //   in Loop: Header=BB3_13 Depth=1
	ldur	x8, [x11, #-80]
.LBB3_25:                               //   in Loop: Header=BB3_13 Depth=1
	cbz	x8, .LBB3_12
.LBB3_26:                               //   in Loop: Header=BB3_13 Depth=1
	mov	x0, x20
	mov	w2, #7
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB3_12
// %bb.27:                              //   in Loop: Header=BB3_13 Depth=1
	ldr	x3, [x21, #64]
	adrp	x1, .L.str.4
	ldr	w5, [x24]
	adrp	x2, .L__func__.f2fs_set_inode_addr
	mov	x0, x20
	add	x1, x1, :lo12:.L.str.4
	add	x2, x2, :lo12:.L__func__.f2fs_set_inode_addr
	mov	w4, w25
	bl	f2fs_printk
	add	w28, w28, #1            // =1
	b	.LBB3_13
.LBB3_28:
	ldr	w5, [x26, #4052]
	cbz	w5, .LBB3_34
// %bb.29:
	ldr	x3, [x21, #64]
	adrp	x1, .L.str.5
	adrp	x2, .L__func__.f2fs_set_inode_addr
	add	x1, x1, :lo12:.L.str.5
	add	x2, x2, :lo12:.L__func__.f2fs_set_inode_addr
	mov	x0, x20
	mov	w4, wzr
	bl	f2fs_printk
	ldr	w5, [x26, #4056]
	cbz	w5, .LBB3_35
.LBB3_30:
	ldr	x3, [x21, #64]
	adrp	x1, .L.str.5
	adrp	x2, .L__func__.f2fs_set_inode_addr
	add	x1, x1, :lo12:.L.str.5
	add	x2, x2, :lo12:.L__func__.f2fs_set_inode_addr
	mov	x0, x20
	mov	w4, #1
	bl	f2fs_printk
	ldr	w5, [x26, #4060]
	cbz	w5, .LBB3_36
.LBB3_31:
	ldr	x3, [x21, #64]
	adrp	x1, .L.str.5
	adrp	x2, .L__func__.f2fs_set_inode_addr
	add	x1, x1, :lo12:.L.str.5
	add	x2, x2, :lo12:.L__func__.f2fs_set_inode_addr
	mov	x0, x20
	mov	w4, #2
	bl	f2fs_printk
	ldr	w5, [x26, #4064]
	cbz	w5, .LBB3_37
.LBB3_32:
	ldr	x3, [x21, #64]
	adrp	x1, .L.str.5
	adrp	x2, .L__func__.f2fs_set_inode_addr
	add	x1, x1, :lo12:.L.str.5
	add	x2, x2, :lo12:.L__func__.f2fs_set_inode_addr
	mov	x0, x20
	mov	w4, #3
	bl	f2fs_printk
	ldr	w5, [x26, #4068]
	cbz	w5, .LBB3_38
.LBB3_33:
	ldr	x3, [x21, #64]
	adrp	x1, .L.str.5
	adrp	x2, .L__func__.f2fs_set_inode_addr
	add	x1, x1, :lo12:.L.str.5
	add	x2, x2, :lo12:.L__func__.f2fs_set_inode_addr
	mov	x0, x20
	mov	w4, #4
	bl	f2fs_printk
	b	.LBB3_39
.LBB3_34:
	str	wzr, [x26, #4052]
	ldr	w5, [x26, #4056]
	cbnz	w5, .LBB3_30
.LBB3_35:
	str	wzr, [x26, #4056]
	ldr	w5, [x26, #4060]
	cbnz	w5, .LBB3_31
.LBB3_36:
	str	wzr, [x26, #4060]
	ldr	w5, [x26, #4064]
	cbnz	w5, .LBB3_32
.LBB3_37:
	str	wzr, [x26, #4064]
	ldr	w5, [x26, #4068]
	cbnz	w5, .LBB3_33
.LBB3_38:
	str	wzr, [x26, #4068]
.LBB3_39:
	mov	x0, x19
	bl	set_page_dirty
	cbz	x19, .LBB3_66
// %bb.40:
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
	b.ne	.LBB3_57
// %bb.41:
	tbnz	w8, #0, .LBB3_55
// %bb.42:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB3_45
// %bb.43:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB3_45
// %bb.44:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB3_45:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB3_47
// %bb.46:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB3_67
.LBB3_47:
	ldr	x0, [x19, #24]
.LBB3_48:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB3_50
// %bb.49:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB3_68
.LBB3_50:
	ldr	x0, [x19, #24]
.LBB3_51:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB3_53
// %bb.52:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB3_69
.LBB3_53:
	ldr	x0, [x19, #24]
.LBB3_54:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB3_55:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB3_63
// %bb.56:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB3_57:
	tbnz	w8, #0, .LBB3_62
// %bb.58:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB3_61
// %bb.59:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB3_61
// %bb.60:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB3_61:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB3_62:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB3_70
.LBB3_63:
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
	cbnz	w9, .LBB3_65
// %bb.64:
	bl	__put_page
.LBB3_65:
	mov	w19, wzr
.LBB3_66:
	mov	w0, w19
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB3_67:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB3_48
.LBB3_68:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB3_51
.LBB3_69:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB3_54
.LBB3_70:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end3:
	.size	f2fs_set_inode_addr, .Lfunc_end3-f2fs_set_inode_addr
                                        // -- End function
	.globl	f2fs_is_hole_blkaddr    // -- Begin function f2fs_is_hole_blkaddr
	.p2align	3
	.type	f2fs_is_hole_blkaddr,@function
f2fs_is_hole_blkaddr:                   // @f2fs_is_hole_blkaddr
// %bb.0:
	sub	sp, sp, #128            // =128
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	str	x23, [sp, #80]          // 8-byte Folded Spill
	stp	x22, x21, [sp, #96]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x20, x19, [sp, #112]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #712]
	tbnz	w8, #10, .LBB4_54
// %bb.1:
	ldr	x8, [x0, #712]
	mov	x19, x0
	tbnz	w8, #11, .LBB4_54
// %bb.2:
	mov	x20, x1
	add	x0, sp, #8              // =8
	mov	w1, wzr
	mov	w2, #48
	add	x22, sp, #8             // =8
	bl	memset
	add	x0, sp, #8              // =8
	mov	x1, x20
	mov	w2, #1
	stp	x19, xzr, [sp, #8]
	str	xzr, [sp, #24]
	str	wzr, [sp, #32]
	bl	f2fs_get_dnode_of_data
	cmn	w0, #2                  // =2
	b.eq	.LBB4_8
// %bb.3:
	mov	w8, w0
	mov	w0, wzr
	cbnz	w8, .LBB4_55
// %bb.4:
	ldr	x21, [sp, #24]
	ldr	w9, [sp, #36]
	lsl	x8, x21, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w10, [x8, #4072]
	ldr	w11, [x8, #4076]
	cmp	w10, w11
	b.ne	.LBB4_10
// %bb.5:
	ldr	x12, [sp, #8]
	cbz	x12, .LBB4_9
// %bb.6:
	ldr	x13, [x12, #712]
	tbz	w13, #26, .LBB4_10
// %bb.7:
	ldr	w12, [x12, #1160]
	asr	w12, w12, #2
	b	.LBB4_11
.LBB4_8:
	mov	w0, #1
	b	.LBB4_55
.LBB4_9:
	ldrb	w12, [x8, #3]
	tbnz	w12, #5, .LBB4_57
.LBB4_10:
	mov	w12, wzr
.LBB4_11:
	add	x13, x8, #360           // =360
	cmp	w10, w11
	csel	x8, x13, x8, eq
	add	w9, w12, w9
	ldr	w20, [x8, w9, uxtw #2]
	cbz	x21, .LBB4_37
// %bb.12:
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
	b.ne	.LBB4_29
// %bb.13:
	tbnz	w8, #0, .LBB4_27
// %bb.14:
	bl	print_bdev_access_info
	adrp	x23, f2fs_dclient
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB4_17
// %bb.15:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB4_17
// %bb.16:
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB4_17:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB4_19
// %bb.18:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB4_58
.LBB4_19:
	ldr	x0, [x21, #24]
.LBB4_20:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB4_22
// %bb.21:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB4_59
.LBB4_22:
	ldr	x0, [x21, #24]
.LBB4_23:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB4_25
// %bb.24:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB4_60
.LBB4_25:
	ldr	x0, [x21, #24]
.LBB4_26:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB4_27:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB4_35
// %bb.28:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB4_29:
	tbnz	w8, #0, .LBB4_34
// %bb.30:
	bl	print_bdev_access_info
	adrp	x23, f2fs_dclient
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB4_33
// %bb.31:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB4_33
// %bb.32:
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB4_33:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB4_34:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB4_62
.LBB4_35:
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
	cbnz	w9, .LBB4_37
// %bb.36:
	bl	__put_page
.LBB4_37:
	ldr	x8, [sp, #16]
	add	x21, x22, #8            // =8
	cbz	x8, .LBB4_41
// %bb.38:
	ldr	x9, [sp, #24]
	cmp	x9, x8
	b.eq	.LBB4_41
// %bb.39:
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
	cbnz	w9, .LBB4_41
// %bb.40:
	bl	__put_page
.LBB4_41:
	add	w8, w20, #3             // =3
	stp	xzr, xzr, [x21]
	cmp	w8, #4                  // =4
	b.hs	.LBB4_43
// %bb.42:
	and	w8, w8, #0xf
	cmp	w8, #3                  // =3
	b	.LBB4_53
.LBB4_43:
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	ldr	w9, [x0, #3024]
	cbz	w9, .LBB4_51
// %bb.44:
	ldr	x8, [x0]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB4_50
// %bb.45:
	ldr	x11, [x0, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB4_47
.LBB4_46:                               //   in Loop: Header=BB4_47 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB4_50
.LBB4_47:                               // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w20
	b.hi	.LBB4_46
// %bb.48:                              //   in Loop: Header=BB4_47 Depth=1
	ldr	w12, [x11]
	cmp	w12, w20
	b.lo	.LBB4_46
// %bb.49:
	ldur	x8, [x11, #-80]
.LBB4_50:
	cbz	x8, .LBB4_52
.LBB4_51:
	mov	w1, w20
	mov	w2, #6
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB4_54
.LBB4_52:
	cmp	w20, #0                 // =0
.LBB4_53:
	cset	w0, eq
	b	.LBB4_55
.LBB4_54:
	mov	w0, wzr
.LBB4_55:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB4_61
// %bb.56:
	ldp	x20, x19, [sp, #112]    // 16-byte Folded Reload
	ldr	x23, [sp, #80]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #96]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #128            // =128
	ret
.LBB4_57:
	ldrh	w12, [x8, #360]
	lsr	w12, w12, #2
	b	.LBB4_11
.LBB4_58:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB4_20
.LBB4_59:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB4_23
.LBB4_60:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB4_26
.LBB4_61:
	bl	__stack_chk_fail
.LBB4_62:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end4:
	.size	f2fs_is_hole_blkaddr, .Lfunc_end4-f2fs_is_hole_blkaddr
                                        // -- End function
	.globl	f2fs_revoke_deduped_inode // -- Begin function f2fs_revoke_deduped_inode
	.p2align	3
	.type	f2fs_revoke_deduped_inode,@function
f2fs_revoke_deduped_inode:              // @f2fs_revoke_deduped_inode
// %bb.0:
	sub	sp, sp, #352            // =352
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #256]    // 16-byte Folded Spill
	add	x29, sp, #256           // =256
	stp	x28, x27, [sp, #272]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #288]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #304]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #320]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #336]    // 16-byte Folded Spill
	stur	x8, [x29, #-16]
	ldr	x8, [x0, #40]
	ldr	x21, [x8, #1104]
	ldr	x8, [x21, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB5_179
// %bb.1:
	ldr	x8, [x0, #712]
	mov	x25, x0
	tbnz	x8, #43, .LBB5_5
.LBB5_2:
	mov	w20, #-22
.LBB5_3:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB5_181
// %bb.4:
	mov	w0, w20
	ldp	x20, x19, [sp, #336]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #320]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #304]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #288]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #272]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #256]    // 16-byte Folded Reload
	add	sp, sp, #352            // =352
	ret
.LBB5_5:
	ldr	x8, [x25, #712]
	mov	x26, x1
	tbz	x8, #43, .LBB5_7
// %bb.6:
	ldr	x8, [x25, #712]
	tbnz	x8, #44, .LBB5_2
.LBB5_7:
	mov	x0, x25
	bl	dquot_initialize
	mov	w20, w0
	add	w8, w0, #28             // =28
	cmp	w8, #28                 // =28
	b.hi	.LBB5_9
// %bb.8:
	mov	w10, #1
	mov	w9, #1
	movk	w10, #4224, lsl #16
	lsl	w8, w9, w8
	tst	w8, w10
	b.ne	.LBB5_10
.LBB5_9:
	cmn	w20, #122               // =122
	b.ne	.LBB5_3
.LBB5_10:
	mov	x0, x21
	mov	w1, #1
	bl	f2fs_balance_fs
	ldr	x22, [x25, #1280]
	cbz	x22, .LBB5_18
// %bb.11:
	ldrb	w8, [x22, #13]
	ldr	w27, [x22, #64]
	tbnz	w8, #6, .LBB5_19
.LBB5_12:
	ldr	x8, [x25, #40]
	ldr	x21, [x8, #1104]
	add	x20, x21, #368          // =368
	mov	x0, x20
	bl	_raw_spin_lock
	ldr	x8, [x21, #352]
	cbz	x8, .LBB5_14
// %bb.13:
	adrp	x19, jiffies
	ldr	x8, [x21, #360]
	ldr	x9, [x19, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB5_160
.LBB5_14:
	mov	x0, x20
	bl	_raw_spin_unlock
	add	x22, x21, #304          // =304
	mov	x0, x22
	bl	down_read
	mov	x0, x21
	bl	f2fs_acquire_orphan_inode
	cbz	w0, .LBB5_22
// %bb.15:
	mov	w20, w0
	mov	x0, x22
	bl	up_read
	ldr	x2, [x25, #64]
	adrp	x1, .L.str.15
	add	x1, x1, :lo12:.L.str.15
	mov	x0, x21
	mov	w3, w20
	bl	f2fs_printk
.LBB5_16:
	adrp	x0, f2fs_revoke_deduped_inode.revoke_bigdata_rs
	adrp	x1, .L__func__.f2fs_revoke_deduped_inode
	add	x0, x0, :lo12:f2fs_revoke_deduped_inode.revoke_bigdata_rs
	add	x1, x1, :lo12:.L__func__.f2fs_revoke_deduped_inode
	bl	___ratelimit
	cbz	w0, .LBB5_3
// %bb.17:
	ldr	x8, [x25, #40]
	adrp	x1, .L.str.19
	ldr	x4, [x25, #64]
	add	x1, x1, :lo12:.L.str.19
	mov	x2, x26
	mov	w3, w20
	mov	w5, w27
	ldr	x0, [x8, #1104]
	bl	f2fs_printk
	adrp	x2, .L.str.20
	add	x0, sp, #112            // =112
	add	x2, x2, :lo12:.L.str.20
	mov	w1, #128
	mov	w3, w20
	bl	snprintf
	add	x3, sp, #112            // =112
	mov	x0, x25
	mov	w1, w27
	mov	x2, x26
	bl	f2fs_dedup_imonitor_send
	b	.LBB5_3
.LBB5_18:
	ldr	x2, [x25, #64]
	adrp	x1, .L.str.6
	add	x1, x1, :lo12:.L.str.6
	mov	x0, x21
	bl	f2fs_printk
	b	.LBB5_2
.LBB5_19:
	mov	x0, x22
	bl	fscrypt_get_encryption_info
	mov	w20, w0
	cbnz	w0, .LBB5_3
// %bb.20:
	ldr	x8, [x22, #632]
	cbnz	x8, .LBB5_12
// %bb.21:
	mov	w20, #-126
	b	.LBB5_3
.LBB5_22:
	mov	x0, x25
	str	w27, [sp, #20]          // 4-byte Folded Spill
	str	x26, [sp, #24]          // 8-byte Folded Spill
	bl	f2fs_add_orphan_inode
	mov	x0, x25
	mov	w1, #1
	add	x8, x25, #712           // =712
	mov	x9, #70368744177664
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x22
	bl	up_read
	ldr	x8, [x25, #40]
	mov	x0, x25
	mov	w1, wzr
	ldr	x8, [x8, #1104]
	str	x8, [sp, #8]            // 8-byte Folded Spill
	ldr	w8, [x8, #1188]
	str	w8, [sp, #44]           // 4-byte Folded Spill
	bl	f2fs_set_inode_addr
	ldr	x8, [x25, #80]
	add	x8, x8, #4095           // =4095
	lsr	x10, x8, #12
	cbz	w10, .LBB5_135
// %bb.23:
	mov	x27, #256
	add	x8, sp, #112            // =112
	mov	x23, xzr
	movk	x27, #57005, lsl #48
	add	x8, x8, #8              // =8
	add	x26, sp, #96            // =96
	adrp	x19, page_info_slab
	str	x25, [sp, #32]          // 8-byte Folded Spill
	str	x8, [sp, #72]           // 8-byte Folded Spill
.LBB5_24:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB5_27 Depth 2
                                        //     Child Loop BB5_36 Depth 2
                                        //     Child Loop BB5_130 Depth 2
	ldp	x8, x24, [x25, #40]
	mov	x1, xzr
	mov	x2, x23
	mov	x4, xzr
	str	x10, [sp, #48]          // 8-byte Folded Spill
	ldr	x8, [x8, #1104]
	mov	x0, x24
	ldr	x9, [x24, #120]
	stp	x26, x26, [sp, #96]
	str	x8, [sp, #80]           // 8-byte Folded Spill
	ldr	w8, [sp, #44]           // 4-byte Folded Reload
	ldr	x21, [x9, #8]
	cmp	w8, w10
	csel	w20, w8, w10, lt
	sxtw	x3, w20
	str	x3, [sp, #88]           // 8-byte Folded Spill
	bl	__do_page_cache_readahead
	cmp	w20, #1                 // =1
	str	x23, [sp, #56]          // 8-byte Folded Spill
	b.lt	.LBB5_124
// %bb.25:                              //   in Loop: Header=BB5_24 Depth=1
	add	x22, sp, #96            // =96
	mov	w25, wzr
	b	.LBB5_27
.LBB5_26:                               //   in Loop: Header=BB5_27 Depth=2
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	add	x23, x23, #1            // =1
	cmp	w25, w8
	b.eq	.LBB5_33
.LBB5_27:                               //   Parent Loop BB5_24 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x0, x24
	mov	x1, x23
	mov	x2, x21
	mov	x3, xzr
	bl	read_cache_page
	mov	x20, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB5_32
// %bb.28:                              //   in Loop: Header=BB5_27 Depth=2
	ldr	x28, [x19, :lo12:page_info_slab]
	mov	w1, #64
	movk	w1, #96, lsl #16
	mov	x0, x28
	bl	kmem_cache_alloc
	mov	x26, x0
	cbnz	x0, .LBB5_30
// %bb.29:                              //   in Loop: Header=BB5_27 Depth=2
	mov	w8, #64
	mov	x0, x28
	movk	w8, #96, lsl #16
	add	w1, w8, #2048           // =2048
	bl	kmem_cache_alloc
	mov	x26, x0
.LBB5_30:                               //   in Loop: Header=BB5_27 Depth=2
	stp	x26, x20, [x26, #8]
	add	x2, sp, #96             // =96
	str	x26, [x26]
	mov	x0, x26
	ldr	x20, [sp, #104]
	add	w25, w25, #1            // =1
	mov	x1, x20
	bl	__list_add_valid
	tbz	w0, #0, .LBB5_26
// %bb.31:                              //   in Loop: Header=BB5_27 Depth=2
	str	x26, [sp, #104]
	stp	x22, x20, [x26]
	str	x26, [x20]
	b	.LBB5_26
.LBB5_32:                               //   in Loop: Header=BB5_24 Depth=1
	ldr	x25, [sp, #32]          // 8-byte Folded Reload
	b	.LBB5_126
.LBB5_33:                               //   in Loop: Header=BB5_24 Depth=1
	ldr	x23, [sp, #56]          // 8-byte Folded Reload
	mov	w28, wzr
	ldr	x25, [sp, #32]          // 8-byte Folded Reload
	adrp	x22, f2fs_dclient
	b	.LBB5_36
.LBB5_34:                               //   in Loop: Header=BB5_36 Depth=2
	cbnz	w20, .LBB5_126
.LBB5_35:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	add	w28, w28, #1            // =1
	add	x23, x23, #1            // =1
	cmp	w28, w8
	b.eq	.LBB5_124
.LBB5_36:                               //   Parent Loop BB5_24 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x0, x24
	mov	x1, x23
	mov	w2, #2
	mov	w3, wzr
	bl	pagecache_get_page
	cbz	x0, .LBB5_125
// %bb.37:                              //   in Loop: Header=BB5_36 Depth=2
	mov	x21, x0
	ldr	x0, [x25, #1280]
	mov	x1, x23
	bl	f2fs_is_hole_blkaddr
	tbz	w0, #0, .LBB5_54
// %bb.38:                              //   in Loop: Header=BB5_36 Depth=2
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
	b.ne	.LBB5_71
// %bb.39:                              //   in Loop: Header=BB5_36 Depth=2
	tbnz	w8, #0, .LBB5_53
// %bb.40:                              //   in Loop: Header=BB5_36 Depth=2
	bl	print_bdev_access_info
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB5_43
// %bb.41:                              //   in Loop: Header=BB5_36 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB5_43
// %bb.42:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB5_43:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB5_45
// %bb.44:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB5_115
.LBB5_45:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x21, #24]
.LBB5_46:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB5_48
// %bb.47:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB5_116
.LBB5_48:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x21, #24]
.LBB5_49:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB5_51
// %bb.50:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB5_117
.LBB5_51:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x21, #24]
.LBB5_52:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB5_53:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB5_77
	b	.LBB5_182
.LBB5_54:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	mov	w1, #5
	mov	w2, #1
	mov	w3, wzr
	bl	__do_map_lock
	str	w0, [sp, #68]           // 4-byte Folded Spill
	add	x0, sp, #112            // =112
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	ldr	x8, [sp, #72]           // 8-byte Folded Reload
	add	x0, sp, #112            // =112
	mov	x1, x23
	str	x25, [sp, #112]
	stp	xzr, xzr, [x8]
	str	wzr, [x8, #16]
	bl	f2fs_get_block
	ldr	x26, [sp, #128]
	mov	w20, w0
	cbz	x26, .LBB5_87
// %bb.55:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x26, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x26, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x26, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB5_79
// %bb.56:                              //   in Loop: Header=BB5_36 Depth=2
	tbnz	w8, #0, .LBB5_70
// %bb.57:                              //   in Loop: Header=BB5_36 Depth=2
	bl	print_bdev_access_info
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB5_60
// %bb.58:                              //   in Loop: Header=BB5_36 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB5_60
// %bb.59:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB5_60:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB5_62
// %bb.61:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB5_121
.LBB5_62:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x26, #24]
.LBB5_63:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB5_65
// %bb.64:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB5_122
.LBB5_65:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x26, #24]
.LBB5_66:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB5_68
// %bb.67:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB5_123
.LBB5_68:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x26, #24]
.LBB5_69:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB5_70:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB5_85
	b	.LBB5_186
.LBB5_71:                               //   in Loop: Header=BB5_36 Depth=2
	tbnz	w8, #0, .LBB5_76
// %bb.72:                              //   in Loop: Header=BB5_36 Depth=2
	bl	print_bdev_access_info
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB5_75
// %bb.73:                              //   in Loop: Header=BB5_36 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB5_75
// %bb.74:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB5_75:                               //   in Loop: Header=BB5_36 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB5_76:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB5_183
.LBB5_77:                               //   in Loop: Header=BB5_36 Depth=2
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
	cbnz	w9, .LBB5_35
// %bb.78:                              //   in Loop: Header=BB5_36 Depth=2
	bl	__put_page
	b	.LBB5_35
.LBB5_79:                               //   in Loop: Header=BB5_36 Depth=2
	tbnz	w8, #0, .LBB5_84
// %bb.80:                              //   in Loop: Header=BB5_36 Depth=2
	bl	print_bdev_access_info
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB5_83
// %bb.81:                              //   in Loop: Header=BB5_36 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB5_83
// %bb.82:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB5_83:                               //   in Loop: Header=BB5_36 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB5_84:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB5_187
.LBB5_85:                               //   in Loop: Header=BB5_36 Depth=2
	mov	x0, x26
	bl	unlock_page
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x26, x9, eq
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
	cbnz	w9, .LBB5_87
// %bb.86:                              //   in Loop: Header=BB5_36 Depth=2
	bl	__put_page
.LBB5_87:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [sp, #120]
	cbz	x8, .LBB5_91
// %bb.88:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x9, [sp, #128]
	cmp	x9, x8
	b.eq	.LBB5_91
// %bb.89:                              //   in Loop: Header=BB5_36 Depth=2
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
	cbnz	w9, .LBB5_91
// %bb.90:                              //   in Loop: Header=BB5_36 Depth=2
	bl	__put_page
.LBB5_91:                               //   in Loop: Header=BB5_36 Depth=2
	ldp	x8, x0, [sp, #72]       // 16-byte Folded Reload
	mov	w1, #5
	mov	w2, wzr
	stp	xzr, xzr, [x8]
	ldr	w8, [sp, #68]           // 4-byte Folded Reload
	and	w3, w8, #0x1
	bl	__do_map_lock
	mov	x0, x21
	bl	set_page_dirty
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
	b.ne	.LBB5_107
// %bb.92:                              //   in Loop: Header=BB5_36 Depth=2
	tbnz	w8, #0, .LBB5_106
// %bb.93:                              //   in Loop: Header=BB5_36 Depth=2
	bl	print_bdev_access_info
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB5_96
// %bb.94:                              //   in Loop: Header=BB5_36 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB5_96
// %bb.95:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB5_96:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB5_98
// %bb.97:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB5_118
.LBB5_98:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x21, #24]
.LBB5_99:                               //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB5_101
// %bb.100:                             //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB5_119
.LBB5_101:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x21, #24]
.LBB5_102:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB5_104
// %bb.103:                             //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB5_120
.LBB5_104:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x21, #24]
.LBB5_105:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB5_106:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB5_113
	b	.LBB5_184
.LBB5_107:                              //   in Loop: Header=BB5_36 Depth=2
	tbnz	w8, #0, .LBB5_112
// %bb.108:                             //   in Loop: Header=BB5_36 Depth=2
	bl	print_bdev_access_info
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB5_111
// %bb.109:                             //   in Loop: Header=BB5_36 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB5_111
// %bb.110:                             //   in Loop: Header=BB5_36 Depth=2
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB5_111:                              //   in Loop: Header=BB5_36 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB5_112:                              //   in Loop: Header=BB5_36 Depth=2
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB5_185
.LBB5_113:                              //   in Loop: Header=BB5_36 Depth=2
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
	cbnz	w9, .LBB5_34
// %bb.114:                             //   in Loop: Header=BB5_36 Depth=2
	bl	__put_page
	b	.LBB5_34
.LBB5_115:                              //   in Loop: Header=BB5_36 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB5_46
.LBB5_116:                              //   in Loop: Header=BB5_36 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB5_49
.LBB5_117:                              //   in Loop: Header=BB5_36 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB5_52
.LBB5_118:                              //   in Loop: Header=BB5_36 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB5_99
.LBB5_119:                              //   in Loop: Header=BB5_36 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB5_102
.LBB5_120:                              //   in Loop: Header=BB5_36 Depth=2
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB5_105
.LBB5_121:                              //   in Loop: Header=BB5_36 Depth=2
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB5_63
.LBB5_122:                              //   in Loop: Header=BB5_36 Depth=2
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB5_66
.LBB5_123:                              //   in Loop: Header=BB5_36 Depth=2
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB5_69
.LBB5_124:                              //   in Loop: Header=BB5_24 Depth=1
	mov	w20, wzr
	b	.LBB5_126
.LBB5_125:                              //   in Loop: Header=BB5_24 Depth=1
	mov	w8, #-12
	mov	w20, w8
.LBB5_126:                              //   in Loop: Header=BB5_24 Depth=1
	ldr	x21, [sp, #96]
	add	x26, sp, #96            // =96
	ldr	x23, [sp, #56]          // 8-byte Folded Reload
	cmp	x26, x21
	b.ne	.LBB5_130
.LBB5_127:                              //   in Loop: Header=BB5_24 Depth=1
	tbnz	w20, #31, .LBB5_136
// %bb.128:                             //   in Loop: Header=BB5_24 Depth=1
	ldr	x0, [x25, #48]
	bl	filemap_fdatawrite
	ldr	x10, [sp, #48]          // 8-byte Folded Reload
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	subs	w10, w10, w8
	add	x23, x23, x8
	b.ne	.LBB5_24
	b	.LBB5_136
.LBB5_129:                              //   in Loop: Header=BB5_130 Depth=2
	add	x8, x27, #256           // =256
	mov	x1, x21
	stp	x27, x8, [x21]
	ldr	x0, [x19, :lo12:page_info_slab]
	bl	kmem_cache_free
	ldr	x21, [sp, #96]
	cmp	x26, x21
	b.eq	.LBB5_127
.LBB5_130:                              //   Parent Loop BB5_24 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x8, [x21, #16]
	cbz	x8, .LBB5_133
// %bb.131:                             //   in Loop: Header=BB5_130 Depth=2
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
	cbnz	w9, .LBB5_133
// %bb.132:                             //   in Loop: Header=BB5_130 Depth=2
	bl	__put_page
.LBB5_133:                              //   in Loop: Header=BB5_130 Depth=2
	mov	x0, x21
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB5_129
// %bb.134:                             //   in Loop: Header=BB5_130 Depth=2
	ldp	x9, x8, [x21]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB5_129
.LBB5_135:
	mov	w20, wzr
.LBB5_136:
	ldr	x0, [x25, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w21, w0
	orr	w8, w0, w20
	cbz	w8, .LBB5_138
// %bb.137:
	ldr	x3, [x25, #64]
	adrp	x1, .L.str.16
	adrp	x2, .L__func__.__revoke_deduped_data
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	add	x1, x1, :lo12:.L.str.16
	add	x2, x2, :lo12:.L__func__.__revoke_deduped_data
	mov	w4, w20
	mov	w5, w21
	bl	f2fs_printk
.LBB5_138:
	ldr	x8, [x25, #40]
	cmp	w20, #0                 // =0
	csel	w20, w21, w20, eq
	ldr	x22, [x8, #1104]
	add	x21, x22, #368          // =368
	mov	x0, x21
	bl	_raw_spin_lock
	ldr	x8, [x22, #352]
	ldr	x26, [sp, #24]          // 8-byte Folded Reload
	ldr	w27, [sp, #20]          // 4-byte Folded Reload
	cbz	w20, .LBB5_149
// %bb.139:
	cbz	x8, .LBB5_141
// %bb.140:
	adrp	x19, jiffies
	ldr	x8, [x22, #360]
	ldr	x9, [x19, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB5_177
.LBB5_141:
	mov	x0, x21
	bl	_raw_spin_unlock
	add	x21, x22, #304          // =304
	mov	x0, x21
	bl	down_read
	mov	w1, #46
	mov	x0, x25
	bl	f2fs_truncate_dedup_inode
	ldr	w1, [x25, #64]
	mov	x0, x22
	bl	f2fs_remove_orphan_inode
	ldr	x8, [x22, #224]
	mov	x0, x21
	ldr	x8, [x8]
	str	x8, [x25, #1320]
	bl	up_read
	adrp	x8, __tracepoint_f2fs_dedup_revoke_fail
	ldr	x21, [x25, #1280]
	add	x8, x8, :lo12:__tracepoint_f2fs_dedup_revoke_fail
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB5_16
// %bb.142:
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
	tbz	w9, #0, .LBB5_16
// %bb.143:
	//APP
	mrs x19, sp_el0
	//NO_APP
	ldr	w9, [x19, #80]
	add	w9, w9, #1              // =1
	str	w9, [x19, #80]
	//APP
	//NO_APP
	ldr	x22, [x8, #32]
	cbz	x22, .LBB5_146
// %bb.144:
	ldr	x8, [x22], #24
.LBB5_145:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x22, #-16]
	mov	x1, x25
	mov	x2, x21
	blr	x8
	ldr	x8, [x22], #24
	cbnz	x8, .LBB5_145
.LBB5_146:
	//APP
	//NO_APP
	ldr	w8, [x19, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x19, #80]
	b.ne	.LBB5_16
// %bb.147:
	ldr	x8, [x19]
	tbz	w8, #1, .LBB5_16
// %bb.148:
	bl	preempt_schedule_notrace
	b	.LBB5_16
.LBB5_149:
	cbz	x8, .LBB5_151
// %bb.150:
	adrp	x19, jiffies
	ldr	x8, [x22, #360]
	ldr	x9, [x19, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB5_178
.LBB5_151:
	mov	x0, x21
	bl	_raw_spin_unlock
	add	x23, x22, #304          // =304
	mov	x0, x23
	bl	down_read
	ldr	w1, [x25, #64]
	mov	x0, x22
	bl	f2fs_remove_orphan_inode
	add	x20, x25, #720          // =720
	mov	x0, x20
	bl	down_write
	mov	x0, x25
	mov	w1, #1
	add	x19, x25, #712          // =712
	mov	x8, #70368744177664
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x19]
1:	ldxr	x9, [x19]
	bic	x9, x9, x8
	stxr	w10, x9, [x19]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x25
	mov	w1, #1
	mov	x8, #8796093022208
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x19]
1:	ldxr	x9, [x19]
	bic	x9, x9, x8
	stxr	w10, x9, [x19]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x25
	mov	w1, #1
	mov	x8, #281474976710656
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x19]
1:	ldxr	x9, [x19]
	bic	x9, x9, x8
	stxr	w10, x9, [x19]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x25
	mov	w1, #1
	mov	x8, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x19]
1:	ldxr	x9, [x19]
	bic	x9, x9, x8
	stxr	w10, x9, [x19]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	ldr	x21, [x25, #1280]
	mov	x0, x20
	str	xzr, [x25, #1280]
	ldr	x8, [x22, #224]
	ldr	x8, [x8]
	str	x8, [x25, #1320]
	bl	up_write
	mov	x0, x22
	bl	f2fs_acquire_orphan_inode
	mov	w20, w0
	cbz	w0, .LBB5_158
// %bb.152:
	cbz	x22, .LBB5_154
// %bb.153:
	add	x8, x22, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB5_154:
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB5_157
// %bb.155:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB5_157
// %bb.156:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str.17
	adrp	x2, .L__func__.__revoke_deduped_inode_end
	add	x1, x1, :lo12:.L.str.17
	mov	w3, #336
	add	x2, x2, :lo12:.L__func__.__revoke_deduped_inode_end
	bl	dsm_client_record
	mov	w8, #15241
	ldr	x0, [x19, :lo12:f2fs_dclient]
	movk	w8, #14160, lsl #16
	add	w1, w8, #3              // =3
	bl	dsm_client_notify
.LBB5_157:
	ldr	x3, [x21, #64]
	adrp	x1, .L.str.18
	adrp	x2, .L__func__.__revoke_deduped_inode_end
	add	x1, x1, :lo12:.L.str.18
	add	x2, x2, :lo12:.L__func__.__revoke_deduped_inode_end
	mov	x0, x22
	bl	f2fs_printk
	b	.LBB5_162
.LBB5_158:
	ldr	x8, [x21, #40]
	add	x24, x21, #720          // =720
	mov	x0, x24
	ldr	x22, [x8, #1104]
	bl	down_write
	mov	x0, x21
	bl	drop_nlink
	mov	x0, x21
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x24
	bl	up_write
	ldr	w8, [x21, #72]
	cbz	w8, .LBB5_161
// %bb.159:
	mov	x0, x22
	bl	f2fs_release_orphan_inode
	b	.LBB5_162
.LBB5_160:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x21, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x19, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x21, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB5_14
.LBB5_161:
	mov	x0, x21
	bl	f2fs_add_orphan_inode
.LBB5_162:
	mov	x0, x23
	bl	up_read
	adrp	x8, __tracepoint_f2fs_dedup_revoke_inode
	add	x8, x8, :lo12:__tracepoint_f2fs_dedup_revoke_inode
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB5_169
// %bb.163:
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
	tbz	w9, #0, .LBB5_169
// %bb.164:
	//APP
	mrs x19, sp_el0
	//NO_APP
	ldr	w9, [x19, #80]
	add	w9, w9, #1              // =1
	str	w9, [x19, #80]
	//APP
	//NO_APP
	ldr	x22, [x8, #32]
	cbz	x22, .LBB5_167
// %bb.165:
	ldr	x8, [x22], #24
.LBB5_166:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x22, #-16]
	mov	x1, x25
	mov	x2, x21
	blr	x8
	ldr	x8, [x22], #24
	cbnz	x8, .LBB5_166
.LBB5_167:
	//APP
	//NO_APP
	ldr	w8, [x19, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x19, #80]
	b.ne	.LBB5_169
// %bb.168:
	ldr	x8, [x19]
	tbnz	w8, #1, .LBB5_180
.LBB5_169:
	ldr	w8, [x21, #72]
	cbnz	w8, .LBB5_176
.LBB5_170:
	ldr	x8, [x21, #680]
	mov	x0, x21
	and	x8, x8, #0xffffffffffffffef
	str	x8, [x21, #680]
	bl	f2fs_set_inode_flags
	mov	x0, x21
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	ldr	w8, [x21, #1288]
	cbz	w8, .LBB5_175
// %bb.171:
	add	x0, sp, #112            // =112
	mov	w1, wzr
	bl	init_wait_entry
	add	x22, x21, #1296         // =1296
.LBB5_172:                              // =>This Inner Loop Header: Depth=1
	add	x1, sp, #112            // =112
	mov	x0, x22
	mov	w2, #2
	bl	prepare_to_wait_event
	ldr	w8, [x21, #1288]
	cbz	w8, .LBB5_174
// %bb.173:                             //   in Loop: Header=BB5_172 Depth=1
	bl	schedule
	b	.LBB5_172
.LBB5_174:
	add	x1, sp, #112            // =112
	mov	x0, x22
	bl	finish_wait
.LBB5_175:
	add	x22, x25, #968          // =968
	mov	x0, x22
	bl	down_write
	mov	x0, x25
	bl	inode_dio_wait
	mov	x0, x22
	bl	up_write
.LBB5_176:
	mov	x0, x21
	bl	iput
	b	.LBB5_16
.LBB5_177:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x22, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x19, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x22, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB5_141
.LBB5_178:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x22, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x19, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x22, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB5_151
.LBB5_179:
	mov	w20, #-5
	b	.LBB5_3
.LBB5_180:
	bl	preempt_schedule_notrace
	ldr	w8, [x21, #72]
	cbnz	w8, .LBB5_176
	b	.LBB5_170
.LBB5_181:
	bl	__stack_chk_fail
.LBB5_182:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB5_183:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB5_184:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB5_185:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB5_186:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB5_187:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end5:
	.size	f2fs_revoke_deduped_inode, .Lfunc_end5-f2fs_revoke_deduped_inode
                                        // -- End function
	.globl	f2fs_inode_support_dedup // -- Begin function f2fs_inode_support_dedup
	.p2align	3
	.type	f2fs_inode_support_dedup,@function
f2fs_inode_support_dedup:               // @f2fs_inode_support_dedup
// %bb.0:
	ldr	x8, [x0, #16]
	ldrsh	w8, [x8, #2180]
	tbnz	w8, #31, .LBB6_2
// %bb.1:
	mov	w0, wzr
	ret
.LBB6_2:
	ldr	x8, [x1, #712]
	tbnz	w8, #26, .LBB6_4
// %bb.3:
	mov	w0, wzr
	ret
.LBB6_4:
	ldrsw	x8, [x1, #1160]
	add	x8, x8, #360            // =360
	cmp	x8, #399                // =399
	cset	w0, hi
	ret
.Lfunc_end6:
	.size	f2fs_inode_support_dedup, .Lfunc_end6-f2fs_inode_support_dedup
                                        // -- End function
	.globl	f2fs_truncate_dedup_inode // -- Begin function f2fs_truncate_dedup_inode
	.p2align	3
	.type	f2fs_truncate_dedup_inode,@function
f2fs_truncate_dedup_inode:              // @f2fs_truncate_dedup_inode
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	str	x21, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #712]
                                        // kill: def $w1 killed $w1 def $x1
	tbz	x8, #43, .LBB7_20
// %bb.1:
	ldr	x8, [x19, #712]
	tbz	x8, #43, .LBB7_3
// %bb.2:
	ldr	x8, [x19, #712]
	tbnz	x8, #44, .LBB7_20
.LBB7_3:
	add	x8, x19, #712           // =712
	lsr	w9, w1, #6
	add	x8, x8, w9, uxtw #3
	mov	w9, #1
	lsl	x9, x9, x1
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	cmp	w1, #49                 // =49
	b.hi	.LBB7_6
// %bb.4:
	mov	x10, #3585
	mov	w8, w1
	movk	x10, #4144, lsl #16
	mov	w9, #1
	movk	x10, #55304, lsl #32
	movk	x10, #3, lsl #48
	lsl	x8, x9, x8
	tst	x8, x10
	b.eq	.LBB7_6
// %bb.5:
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
.LBB7_6:
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB7_9
// %bb.7:
	ldr	w8, [x19, #1256]
	cbnz	w8, .LBB7_11
// %bb.8:
	ldr	x8, [x19, #712]
	tbz	x8, #35, .LBB7_10
	b	.LBB7_11
.LBB7_9:
	ldrh	w8, [x19]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB7_11
.LBB7_10:
	ldr	xzr, [x19, #712]
.LBB7_11:
	mov	x0, x19
	mov	x1, xzr
	mov	w2, wzr
	bl	f2fs_do_truncate_blocks
	mov	w20, w0
	cbnz	w0, .LBB7_13
// %bb.12:
	mov	x0, x19
	mov	w1, #-3
	bl	f2fs_set_inode_addr
	mov	w20, w0
	cbz	w0, .LBB7_19
.LBB7_13:
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	cbz	x8, .LBB7_15
// %bb.14:
	add	x8, x8, #80             // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB7_15:
	adrp	x21, f2fs_dclient
	ldr	x0, [x21, :lo12:f2fs_dclient]
	cbz	x0, .LBB7_18
// %bb.16:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB7_18
// %bb.17:
	ldr	x0, [x21, :lo12:f2fs_dclient]
	adrp	x1, .L.str.17
	adrp	x2, .L__func__._truncate_error_handle
	add	x1, x1, :lo12:.L.str.17
	mov	w3, #1085
	add	x2, x2, :lo12:.L__func__._truncate_error_handle
	bl	dsm_client_record
	mov	w8, #15241
	ldr	x0, [x21, :lo12:f2fs_dclient]
	movk	w8, #14160, lsl #16
	add	w1, w8, #3              // =3
	bl	dsm_client_notify
.LBB7_18:
	ldr	x8, [x19, #40]
	adrp	x1, .L.str.28
	ldr	x2, [x19, #64]
	add	x1, x1, :lo12:.L.str.28
	mov	w3, w20
	ldr	x0, [x8, #1104]
	bl	f2fs_printk
.LBB7_19:
	mov	w0, w20
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB7_20:
	ldr	x8, [x19, #40]
	adrp	x1, .L.str.7
	ldr	x2, [x19, #64]
	add	x1, x1, :lo12:.L.str.7
	ldr	x0, [x8, #1104]
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB7_23
// %bb.21:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB7_23
// %bb.22:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_truncate_dedup_inode
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #1098
	add	x2, x2, :lo12:.L__func__.f2fs_truncate_dedup_inode
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB7_23:
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/file.c"; .popsection; .long 14472b - 14470b; .short 1098; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end7:
	.size	f2fs_truncate_dedup_inode, .Lfunc_end7-f2fs_truncate_dedup_inode
                                        // -- End function
	.globl	f2fs_truncate_blocks    // -- Begin function f2fs_truncate_blocks
	.p2align	3
	.type	f2fs_truncate_blocks,@function
f2fs_truncate_blocks:                   // @f2fs_truncate_blocks
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x21, x1
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	w19, w2
	ldr	x8, [x0, #40]
	mov	x20, x0
	mov	x29, sp
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB8_4
// %bb.1:
	ldr	w8, [x20, #1256]
	cbnz	w8, .LBB8_6
// %bb.2:
	ldr	x8, [x20, #712]
	tbnz	x8, #35, .LBB8_6
// %bb.3:
	ldr	x8, [x20, #712]
	mov	x22, x21
	tbnz	x8, #34, .LBB8_6
	b	.LBB8_7
.LBB8_4:
	ldrh	w8, [x20]
	mov	x22, x21
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB8_7
// %bb.5:
	ldr	x8, [x20, #712]
	mov	x22, x21
	tbz	w8, #31, .LBB8_7
.LBB8_6:
	ldr	w8, [x20, #1268]
	sub	x9, x21, #1             // =1
	lsl	w8, w8, #12
	sub	w8, w8, #1              // =1
	orr	x8, x9, x8
	add	x22, x8, #1             // =1
.LBB8_7:
	and	w2, w19, #0x1
	mov	x0, x20
	mov	x1, x22
	bl	f2fs_do_truncate_blocks
	cmp	x22, x21
	b.eq	.LBB8_10
// %bb.8:
	cbnz	w0, .LBB8_10
// %bb.9:
	and	w2, w19, #0x1
	mov	x0, x20
	mov	x1, x21
	bl	f2fs_truncate_partial_cluster
.LBB8_10:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end8:
	.size	f2fs_truncate_blocks, .Lfunc_end8-f2fs_truncate_blocks
                                        // -- End function
	.globl	should_file_migrate     // -- Begin function should_file_migrate
	.p2align	3
	.type	should_file_migrate,@function
should_file_migrate:                    // @should_file_migrate
// %bb.0:
	ldr	x9, [x0, #40]
	mov	w8, #192
	ldr	x10, [x0, #80]
	ldr	x9, [x9, #1104]
	ldr	x9, [x9, #3032]
	smaddl	x8, w1, w8, x9
	ldp	w9, w8, [x8, #180]
	subs	w8, w9, w8
	add	x9, x10, #4095          // =4095
	csel	w8, wzr, w8, lo
	lsr	x9, x9, #12
	subs	w8, w8, w9
	cset	w9, hi
	lsr	w8, w8, #12
	cmp	w8, #124                // =124
	cset	w8, hi
	and	w0, w9, w8
	ret
.Lfunc_end9:
	.size	should_file_migrate, .Lfunc_end9-should_file_migrate
                                        // -- End function
	.globl	f2fs_set_file_lable     // -- Begin function f2fs_set_file_lable
	.p2align	3
	.type	f2fs_set_file_lable,@function
f2fs_set_file_lable:                    // @f2fs_set_file_lable
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	cmp	w1, #4                  // =4
	mov	x29, sp
	b.eq	.LBB10_11
// %bb.1:
	cmp	w1, #2                  // =2
	b.ne	.LBB10_13
// %bb.2:
	ldr	x8, [x0, #40]
	ldr	x9, [x0, #80]
	ldr	x8, [x8, #1104]
	add	x9, x9, #4095           // =4095
	lsr	x9, x9, #12
	ldr	x8, [x8, #3032]
	ldp	w10, w8, [x8, #180]
	subs	w8, w10, w8
	csel	w8, wzr, w8, lo
	subs	w8, w8, w9
	mov	w9, #53247
	movk	w9, #7, lsl #16
	ccmp	w8, w9, #0, hi
	b.ls	.LBB10_12
// %bb.3:
	ldr	x8, [x0, #712]
	tbnz	x8, #40, .LBB10_23
// %bb.4:
	ldr	x8, [x0, #712]
	tbnz	x8, #38, .LBB10_24
// %bb.5:
	ldr	x8, [x0, #712]
	tbnz	x8, #39, .LBB10_25
.LBB10_6:
	ldr	x8, [x0, #712]
	tbnz	x8, #40, .LBB10_26
.LBB10_7:
	ldr	x8, [x0, #712]
	tbnz	x8, #41, .LBB10_27
.LBB10_8:
	ldr	x8, [x0, #712]
	tbz	x8, #42, .LBB10_10
.LBB10_9:
	add	x8, x0, #712            // =712
	mov	x9, #4398046511104
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
.LBB10_10:
	add	x8, x0, #712            // =712
	mov	x9, #1099511627776
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	b	.LBB10_22
.LBB10_11:
	ldr	x8, [x0, #40]
	ldr	x9, [x0, #80]
	ldr	x8, [x8, #1104]
	add	x9, x9, #4095           // =4095
	lsr	x9, x9, #12
	ldr	x8, [x8, #3032]
	ldr	w10, [x8, #372]
	ldr	w8, [x8, #376]
	subs	w8, w10, w8
	csel	w8, wzr, w8, lo
	subs	w8, w8, w9
	mov	w9, #53247
	movk	w9, #7, lsl #16
	ccmp	w8, w9, #0, hi
	b.hi	.LBB10_14
.LBB10_12:
	mov	w0, #-28
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.LBB10_13:
	mov	w0, #-22
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.LBB10_14:
	ldr	x8, [x0, #712]
	tbnz	x8, #42, .LBB10_23
// %bb.15:
	ldr	x8, [x0, #712]
	tbnz	x8, #38, .LBB10_28
// %bb.16:
	ldr	x8, [x0, #712]
	tbnz	x8, #39, .LBB10_29
.LBB10_17:
	ldr	x8, [x0, #712]
	tbnz	x8, #40, .LBB10_30
.LBB10_18:
	ldr	x8, [x0, #712]
	tbnz	x8, #41, .LBB10_31
.LBB10_19:
	ldr	x8, [x0, #712]
	tbz	x8, #42, .LBB10_21
.LBB10_20:
	add	x8, x0, #712            // =712
	mov	x9, #4398046511104
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
.LBB10_21:
	add	x8, x0, #712            // =712
	mov	x9, #4398046511104
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
.LBB10_22:
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
.LBB10_23:
	mov	w0, wzr
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.LBB10_24:
	add	x8, x0, #712            // =712
	mov	x9, #274877906944
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	x8, [x0, #712]
	tbz	x8, #39, .LBB10_6
.LBB10_25:
	add	x8, x0, #712            // =712
	mov	x9, #549755813888
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	x8, [x0, #712]
	tbz	x8, #40, .LBB10_7
.LBB10_26:
	add	x8, x0, #712            // =712
	mov	x9, #1099511627776
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	x8, [x0, #712]
	tbz	x8, #41, .LBB10_8
.LBB10_27:
	add	x8, x0, #712            // =712
	mov	x9, #2199023255552
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	x8, [x0, #712]
	tbnz	x8, #42, .LBB10_9
	b	.LBB10_10
.LBB10_28:
	add	x8, x0, #712            // =712
	mov	x9, #274877906944
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	x8, [x0, #712]
	tbz	x8, #39, .LBB10_17
.LBB10_29:
	add	x8, x0, #712            // =712
	mov	x9, #549755813888
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	x8, [x0, #712]
	tbz	x8, #40, .LBB10_18
.LBB10_30:
	add	x8, x0, #712            // =712
	mov	x9, #1099511627776
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	x8, [x0, #712]
	tbz	x8, #41, .LBB10_19
.LBB10_31:
	add	x8, x0, #712            // =712
	mov	x9, #2199023255552
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	x8, [x0, #712]
	tbnz	x8, #42, .LBB10_20
	b	.LBB10_21
.Lfunc_end10:
	.size	f2fs_set_file_lable, .Lfunc_end10-f2fs_set_file_lable
                                        // -- End function
	.globl	f2fs_sync_file          // -- Begin function f2fs_sync_file
	.p2align	3
	.type	f2fs_sync_file,@function
f2fs_sync_file:                         // @f2fs_sync_file
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	ldr	x8, [x0, #32]
	str	x23, [sp, #16]          // 8-byte Folded Spill
	ldr	x9, [x8, #40]
	ldr	x9, [x9, #1104]
	ldr	x9, [x9, #224]
	ldrb	w9, [x9, #132]
	tbnz	w9, #3, .LBB11_3
// %bb.1:
	add	x23, x8, #160           // =160
	mov	x21, x0
	mov	x0, x23
	mov	w19, w3
	mov	x20, x2
	mov	x22, x1
	bl	down_write
	mov	x0, x21
	mov	x1, x22
	mov	x2, x20
	mov	w3, w19
	mov	w4, wzr
	bl	f2fs_do_sync_file
	mov	w19, w0
	mov	x0, x23
	bl	up_write
.LBB11_2:
	mov	w0, w19
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB11_3:
	mov	w19, #-5
	b	.LBB11_2
.Lfunc_end11:
	.size	f2fs_sync_file, .Lfunc_end11-f2fs_sync_file
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_do_sync_file
	.type	f2fs_do_sync_file,@function
f2fs_do_sync_file:                      // @f2fs_do_sync_file
// %bb.0:
	sub	sp, sp, #256            // =256
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #160]    // 16-byte Folded Spill
	add	x29, sp, #160           // =160
	stp	x28, x27, [sp, #176]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #192]    // 16-byte Folded Spill
	mov	x9, #9223372036854775807
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	w11, #1
	stp	x24, x23, [sp, #208]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #224]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #240]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #240]
	str	wzr, [sp, #44]
	ldr	x20, [x8]
	str	xzr, [sp, #64]
	ldr	x8, [x20, #40]
	ldr	x24, [x20, #64]
	stp	xzr, xzr, [sp, #136]
	stp	xzr, xzr, [sp, #120]
	stp	xzr, xzr, [sp, #104]
	stp	xzr, xzr, [sp, #88]
	ldr	x10, [x20, #40]
	stp	x9, xzr, [sp, #48]
	stp	xzr, xzr, [sp, #72]
	ldr	x19, [x8, #1104]
	ldrb	w9, [x10, #80]
	str	w11, [sp, #80]
	tbnz	w9, #0, .LBB12_100
// %bb.1:
	ldr	x8, [x19, #80]
	tbnz	w8, #8, .LBB12_100
// %bb.2:
	adrp	x8, __tracepoint_f2fs_sync_file_enter
	mov	w25, w4
	add	x8, x8, :lo12:__tracepoint_f2fs_sync_file_enter
	mov	w21, w3
	mov	x22, x2
	mov	x23, x1
	mov	x26, x0
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB12_9
// %bb.3:
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
	tbz	w9, #0, .LBB12_9
// %bb.4:
	//APP
	mrs x27, sp_el0
	//NO_APP
	ldr	w9, [x27, #80]
	add	w9, w9, #1              // =1
	str	w9, [x27, #80]
	//APP
	//NO_APP
	ldr	x28, [x8, #32]
	cbz	x28, .LBB12_7
// %bb.5:
	ldr	x8, [x28], #24
.LBB12_6:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x28, #-16]
	mov	x1, x20
	blr	x8
	ldr	x8, [x28], #24
	cbnz	x8, .LBB12_6
.LBB12_7:
	//APP
	//NO_APP
	ldr	w8, [x27, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x27, #80]
	b.ne	.LBB12_9
// %bb.8:
	ldr	x8, [x27]
	tbnz	w8, #1, .LBB12_149
.LBB12_9:
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.ne	.LBB12_11
// %bb.10:
	mov	x27, xzr
	str	xzr, [sp, #32]          // 8-byte Folded Spill
	b	.LBB12_50
.LBB12_11:
	bl	sched_clock
	str	x0, [sp, #32]           // 8-byte Folded Spill
	cbz	w21, .LBB12_22
.LBB12_12:
	add	x8, x20, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 16384
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB12_13:
	mov	x0, x26
	mov	x1, x23
	mov	x2, x22
	bl	file_write_and_wait_range
	mov	w28, w0
	bl	sched_clock
	add	x8, x20, #712           // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 16384
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	cbz	w28, .LBB12_28
// %bb.14:
	adrp	x11, __tracepoint_f2fs_sync_file_exit
	add	x11, x11, :lo12:__tracepoint_f2fs_sync_file_exit
	ldr	w8, [x11, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB12_101
// %bb.15:
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
	tbz	w8, #0, .LBB12_101
// %bb.16:
	//APP
	mrs x19, sp_el0
	//NO_APP
	ldr	w8, [x19, #80]
	add	w8, w8, #1              // =1
	str	w8, [x19, #80]
	//APP
	//NO_APP
	ldr	x22, [x11, #32]
	cbz	x22, .LBB12_19
// %bb.17:
	ldr	x8, [x22], #24
.LBB12_18:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x22, #-16]
	mov	x1, x20
	mov	w2, wzr
	mov	w3, w21
	mov	w4, w28
	blr	x8
	ldr	x8, [x22], #24
	cbnz	x8, .LBB12_18
.LBB12_19:
	//APP
	//NO_APP
	ldr	w8, [x19, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x19, #80]
	b.ne	.LBB12_101
// %bb.20:
	ldr	x8, [x19]
	tbz	w8, #1, .LBB12_101
// %bb.21:
	bl	preempt_schedule_notrace
	b	.LBB12_101
.LBB12_22:
	ldr	w8, [x20, #768]
	ldr	x9, [x19, #136]
	ldr	w9, [x9, #144]
	cmp	w8, w9
	b.hi	.LBB12_13
// %bb.23:
	adrp	x8, write_opt
	ldr	w8, [x8, :lo12:write_opt]
	cbz	w8, .LBB12_12
// %bb.24:
	ldr	w9, [x20, #1160]
	ldr	w10, [x20, #1168]
	ldrh	w11, [x20]
	ldr	x8, [x20, #80]
	add	w9, w10, w9, asr #2
	mov	w10, #923
	sub	w9, w10, w9
	and	w10, w11, #0xf000
	cmp	w10, #8, lsl #12        // =32768
	b.ne	.LBB12_27
// %bb.25:
	ldr	x10, [x20, #712]
	tbz	w10, #31, .LBB12_27
// %bb.26:
	ldr	w10, [x20, #1268]
	neg	w10, w10
	and	w9, w9, w10
.LBB12_27:
	mov	w9, w9
	cmp	x8, x9, lsl #12
	b.gt	.LBB12_12
	b	.LBB12_13
.LBB12_28:
	mov	x27, x0
	cbz	w21, .LBB12_37
// %bb.29:
	ldr	x8, [x20, #40]
	ldr	x8, [x8, #1104]
	add	x22, x8, #1024          // =1024
	mov	x0, x22
	bl	_raw_spin_lock
	ldr	x23, [x20, #872]
	add	x26, x20, #872          // =872
.LBB12_30:
	mov	x0, x22
	bl	_raw_spin_unlock
	cmp	x23, x26
	b.ne	.LBB12_49
// %bb.31:
	ldr	x8, [x20, #712]
	tbnz	w8, #12, .LBB12_50
// %bb.32:
	mov	x0, x19
	mov	w1, w24
	mov	w2, #1
	bl	f2fs_exist_written_data
	tbnz	w0, #0, .LBB12_50
// %bb.33:
	ldr	x8, [x19, #128]
	and	x1, x24, #0xffffffff
	mov	w2, wzr
	mov	w3, wzr
	ldr	x0, [x8, #48]
	bl	pagecache_get_page
	mov	x22, x0
	cbz	x0, .LBB12_35
// %bb.34:
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #3, .LBB12_36
.LBB12_35:
	mov	x0, x19
	mov	w1, w24
	bl	f2fs_need_inode_block_update
	tbz	w0, #0, .LBB12_114
.LBB12_36:
	mov	w23, #1
	b	.LBB12_115
.LBB12_37:
	ldr	x8, [x20, #712]
	tbz	w8, #2, .LBB12_49
// %bb.38:
	ldrb	w8, [x20, #688]
	tbnz	w8, #4, .LBB12_49
// %bb.39:
	ldrh	w8, [x20, #80]
	tst	w8, #0xfff
	b.ne	.LBB12_49
// %bb.40:
	ldr	x8, [x20, #1192]
	ldr	x9, [x20, #88]
	cmp	x8, x9
	b.ne	.LBB12_49
// %bb.41:
	ldr	x8, [x20, #1200]
	ldr	x9, [x20, #96]
	cmp	x8, x9
	b.ne	.LBB12_49
// %bb.42:
	ldr	x8, [x20, #1208]
	ldr	x9, [x20, #120]
	cmp	x8, x9
	b.ne	.LBB12_49
// %bb.43:
	ldr	x8, [x20, #1216]
	ldr	x9, [x20, #128]
	cmp	x8, x9
	b.ne	.LBB12_49
// %bb.44:
	ldr	x8, [x20, #1224]
	ldr	x9, [x20, #104]
	cmp	x8, x9
	b.ne	.LBB12_49
// %bb.45:
	ldr	x8, [x20, #1232]
	ldr	x9, [x20, #112]
	cmp	x8, x9
	b.ne	.LBB12_49
// %bb.46:
	ldr	x8, [x20, #1240]
	ldr	x9, [x20, #1176]
	cmp	x8, x9
	b.ne	.LBB12_49
// %bb.47:
	ldr	x8, [x20, #1248]
	ldr	x9, [x20, #1184]
	cmp	x8, x9
	b.ne	.LBB12_49
// %bb.48:
	add	x22, x20, #816          // =816
	mov	x0, x22
	bl	_raw_spin_lock
	ldr	x23, [x20, #808]
	ldr	x26, [x20, #80]
	b	.LBB12_30
.LBB12_49:
	mov	x0, x20
	mov	x1, xzr
	bl	f2fs_write_inode
.LBB12_50:
	add	x23, x20, #720          // =720
	mov	x0, x23
	bl	down_read
	ldrh	w8, [x20]
	str	x27, [sp, #8]           // 8-byte Folded Spill
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB12_56
// %bb.51:
	ldr	x8, [x20, #40]
	ldr	x22, [x8, #1104]
	ldr	w8, [x22, #1532]
	cbz	w8, .LBB12_75
// %bb.52:
	ldr	w8, [x20, #1256]
	cbnz	w8, .LBB12_55
// %bb.53:
	ldr	x8, [x20, #712]
	tbnz	x8, #35, .LBB12_55
// %bb.54:
	ldr	x8, [x20, #712]
	tbz	x8, #34, .LBB12_76
.LBB12_55:
	mov	w22, #2
	b	.LBB12_57
.LBB12_56:
	mov	w22, #1
.LBB12_57:
	mov	x0, x23
	bl	up_read
	bl	sched_clock
	ldr	x8, [x20, #40]
	mov	w1, #1
	str	x0, [sp]                // 8-byte Folded Spill
	mov	x0, x8
	bl	f2fs_sync_fs
	mov	w28, w0
	bl	sched_clock
	mov	x26, x0
	mov	x0, x23
	bl	down_write
	ldrb	w8, [x20, #688]
	tbz	w8, #1, .LBB12_61
// %bb.58:
	ldr	w8, [x20, #72]
	cmp	w8, #1                  // =1
	b.ne	.LBB12_61
// %bb.59:
	mov	x0, x20
	bl	d_find_alias
	cbz	x0, .LBB12_61
// %bb.60:
	add	x27, x0, #88            // =88
	mov	x25, x0
	mov	x0, x27
	bl	_raw_spin_lock
	ldr	x8, [x25, #24]
	mov	x0, x27
	ldr	x8, [x8, #48]
	ldr	x24, [x8, #64]
	bl	_raw_spin_unlock
	mov	x0, x25
	bl	dput
	mov	x0, x20
	mov	w1, #1
	str	w24, [x20, #704]
	bl	f2fs_mark_inode_dirty_sync
	ldrb	w8, [x20, #688]
	mov	x0, x20
	mov	w1, #1
	and	w8, w8, #0xfffffffd
	strb	w8, [x20, #688]
	bl	f2fs_mark_inode_dirty_sync
.LBB12_61:
	mov	x0, x23
	bl	up_write
	stp	xzr, xzr, [sp, #16]     // 16-byte Folded Spill
	add	x8, x20, #712           // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 4096
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	adrp	x11, __tracepoint_f2fs_sync_file_exit
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 8192
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	mov	x27, xzr
	mov	x24, xzr
.LBB12_62:
	add	x11, x11, :lo12:__tracepoint_f2fs_sync_file_exit
	ldr	w8, [x11, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB12_69
// %bb.63:
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
	tbz	w8, #0, .LBB12_69
// %bb.64:
	//APP
	mrs x25, sp_el0
	//NO_APP
	ldr	w8, [x25, #80]
	add	w8, w8, #1              // =1
	str	w8, [x25, #80]
	//APP
	//NO_APP
	ldr	x23, [x11, #32]
	cbz	x23, .LBB12_67
// %bb.65:
	ldr	x8, [x23], #24
.LBB12_66:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x23, #-16]
	mov	x1, x20
	mov	w2, w22
	mov	w3, w21
	mov	w4, w28
	blr	x8
	ldr	x8, [x23], #24
	cbnz	x8, .LBB12_66
.LBB12_67:
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x25, #80]
	b.ne	.LBB12_69
// %bb.68:
	ldr	x8, [x25]
	tbnz	w8, #1, .LBB12_150
.LBB12_69:
	ldr	x23, [sp, #32]          // 8-byte Folded Reload
	cbz	x23, .LBB12_101
.LBB12_70:
	cbnz	w28, .LBB12_101
// %bb.71:
	bl	sched_clock
	add	x21, x19, #2192         // =2192
	mov	x22, x0
	mov	x0, x21
	bl	mutex_lock
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.eq	.LBB12_78
// %bb.72:
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB12_80
// %bb.73:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB12_80
// %bb.74:
	ldr	w9, [x8, #216]
	add	w9, w9, #1              // =1
	str	w9, [x8, #216]
	b	.LBB12_80
.LBB12_75:
	ldr	x8, [x20, #712]
	tbnz	w8, #31, .LBB12_55
.LBB12_76:
	ldr	x8, [x22, #224]
	ldr	x9, [x20, #1320]
	ldr	x8, [x8]
	cmp	x9, x8
	b.ne	.LBB12_103
// %bb.77:
	mov	w22, #11
	b	.LBB12_57
.LBB12_78:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB12_80
// %bb.79:
	ldr	w9, [x8, #220]
	add	w9, w9, #1              // =1
	str	w9, [x8, #220]
.LBB12_80:
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB12_90
// %bb.81:
	ldr	x10, [x8, #224]
	sub	x9, x22, x23
	add	x10, x10, x9
	str	x10, [x8, #224]
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB12_90
// %bb.82:
	ldr	x10, [x8, #232]
	cmp	x10, x9
	b.hs	.LBB12_84
// %bb.83:
	str	x9, [x8, #232]
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB12_90
.LBB12_84:
	ldr	x9, [sp, #8]            // 8-byte Folded Reload
	ldr	x10, [x8, #256]
	sub	x9, x9, x23
	add	x10, x10, x9
	str	x10, [x8, #256]
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB12_90
// %bb.85:
	ldr	x10, [x8, #264]
	cmp	x10, x9
	b.hs	.LBB12_87
// %bb.86:
	str	x9, [x8, #264]
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB12_90
.LBB12_87:
	ldr	x9, [sp]                // 8-byte Folded Reload
	ldr	x10, [x8, #240]
	sub	x9, x26, x9
	add	x10, x10, x9
	str	x10, [x8, #240]
	ldr	x8, [x19, #2224]
	cbz	x8, .LBB12_90
// %bb.88:
	ldr	x10, [x8, #248]
	cmp	x10, x9
	b.hs	.LBB12_90
// %bb.89:
	str	x9, [x8, #248]
.LBB12_90:
	cbz	x27, .LBB12_95
// %bb.91:
	ldr	x9, [x19, #2224]
	cbz	x9, .LBB12_99
// %bb.92:
	ldr	x10, [x9, #272]
	sub	x8, x27, x24
	add	x10, x10, x8
	str	x10, [x9, #272]
	ldr	x9, [x19, #2224]
	cbz	x9, .LBB12_99
// %bb.93:
	ldr	x10, [x9, #280]
	cmp	x10, x8
	b.hs	.LBB12_95
// %bb.94:
	str	x8, [x9, #280]
.LBB12_95:
	ldr	x9, [x19, #2224]
	cbz	x9, .LBB12_99
// %bb.96:
	ldp	x11, x8, [sp, #16]      // 16-byte Folded Reload
	ldr	x10, [x9, #288]
	sub	x8, x11, x8
	add	x10, x10, x8
	str	x10, [x9, #288]
	ldr	x9, [x19, #2224]
	cbz	x9, .LBB12_99
// %bb.97:
	ldr	x10, [x9, #296]
	cmp	x10, x8
	b.hs	.LBB12_99
// %bb.98:
	str	x8, [x9, #296]
.LBB12_99:
	mov	x0, x21
	bl	mutex_unlock
.LBB12_100:
	mov	w28, wzr
.LBB12_101:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB12_152
// %bb.102:
	mov	w0, w28
	ldp	x20, x19, [sp, #240]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #224]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #208]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #192]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #176]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #160]    // 16-byte Folded Reload
	add	sp, sp, #256            // =256
	ret
.LBB12_103:
	ldr	w8, [x20, #72]
	cmp	w8, #1                  // =1
	b.ne	.LBB12_111
// %bb.104:
	ldr	x8, [x22, #80]
	tbnz	w8, #5, .LBB12_112
// %bb.105:
	ldrb	w8, [x20, #688]
	tbnz	w8, #1, .LBB12_113
// %bb.106:
	mov	x0, x22
	bl	f2fs_space_for_roll_forward
	tbz	w0, #0, .LBB12_122
// %bb.107:
	ldr	w1, [x20, #704]
	mov	x0, x22
	bl	f2fs_is_checkpointed_node
	tbz	w0, #0, .LBB12_128
// %bb.108:
	ldrb	w8, [x22, #1425]
	tbnz	w8, #4, .LBB12_135
// %bb.109:
	ldr	w8, [x22, #1448]
	cmp	w8, #2                  // =2
	b.ne	.LBB12_136
// %bb.110:
	mov	w22, #9
	b	.LBB12_57
.LBB12_111:
	mov	w22, #3
	b	.LBB12_57
.LBB12_112:
	mov	w22, #4
	b	.LBB12_57
.LBB12_113:
	mov	w22, #5
	b	.LBB12_57
.LBB12_114:
	mov	w23, wzr
.LBB12_115:
	cbz	x22, .LBB12_118
// %bb.116:
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
	cbnz	w9, .LBB12_118
// %bb.117:
	bl	__put_page
.LBB12_118:
	tbnz	w23, #0, .LBB12_50
// %bb.119:
	ldr	x8, [x20, #712]
	str	x27, [sp, #8]           // 8-byte Folded Spill
	tbnz	w8, #13, .LBB12_123
// %bb.120:
	mov	x0, x19
	mov	w1, w24
	mov	w2, #2
	bl	f2fs_exist_written_data
	mov	x23, xzr
	tbz	w0, #0, .LBB12_129
// %bb.121:
	mov	x27, x23
	tbz	w25, #0, .LBB12_124
	b	.LBB12_125
.LBB12_122:
	mov	w22, #6
	b	.LBB12_57
.LBB12_123:
	mov	x27, xzr
	mov	x23, xzr
	tbnz	w25, #0, .LBB12_125
.LBB12_124:
	ldr	w8, [x19, #1492]
	cmp	w8, #2                  // =2
	b.ne	.LBB12_130
.LBB12_125:
	adrp	x22, delayflush
	adrp	x8, current_flush_merge
	ldr	w9, [x22, :lo12:delayflush]
	ldr	x8, [x8, :lo12:current_flush_merge]
	add	w9, w9, #1              // =1
	sub	x8, x8, #1              // =1
	cmp	x8, w9, sxtw
	str	w9, [x22, :lo12:delayflush]
	b.hs	.LBB12_127
// %bb.126:
	bl	sched_clock
	ldr	w1, [x20, #64]
	str	x0, [sp, #24]           // 8-byte Folded Spill
	mov	x0, x19
	bl	f2fs_issue_flush
	mov	w28, w0
	bl	sched_clock
	mov	w8, #1
	str	x0, [sp, #16]           // 8-byte Folded Spill
	str	w8, [x22, :lo12:delayflush]
	b	.LBB12_131
.LBB12_127:
	stp	xzr, xzr, [sp, #16]     // 16-byte Folded Spill
	b	.LBB12_132
.LBB12_128:
	mov	w22, #7
	b	.LBB12_57
.LBB12_129:
	adrp	x11, __tracepoint_f2fs_sync_file_exit
	mov	w22, wzr
	mov	w28, wzr
	stp	x23, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x27, x23
	mov	x24, x23
	mov	x26, x23
	str	x23, [sp]               // 8-byte Folded Spill
	b	.LBB12_62
.LBB12_130:
	bl	sched_clock
	ldr	w1, [x20, #64]
	str	x0, [sp, #24]           // 8-byte Folded Spill
	mov	x0, x19
	bl	f2fs_issue_flush
	mov	w28, w0
	bl	sched_clock
	str	x0, [sp, #16]           // 8-byte Folded Spill
.LBB12_131:
	cbnz	w28, .LBB12_133
.LBB12_132:
	mov	x0, x19
	mov	w1, w24
	mov	w2, #2
	bl	f2fs_remove_ino_entry
	mov	x0, x19
	mov	w1, w24
	mov	w2, #4
	add	x8, x20, #712           // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 8192
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_remove_ino_entry
	mov	w28, wzr
.LBB12_133:
	adrp	x8, jiffies
	str	xzr, [sp]               // 8-byte Folded Spill
	mov	x26, xzr
	mov	w22, wzr
	ldr	x8, [x8, :lo12:jiffies]
	stp	x8, x8, [x19, #504]
	str	x8, [x19, #520]
.LBB12_134:
	adrp	x11, __tracepoint_f2fs_sync_file_exit
	mov	x24, x23
	b	.LBB12_62
.LBB12_135:
	mov	w22, #8
	b	.LBB12_57
.LBB12_136:
	ldr	w8, [x22, #1492]
	cmp	w8, #1                  // =1
	b.ne	.LBB12_140
// %bb.137:
	ldr	w1, [x20, #64]
	mov	x0, x22
	bl	f2fs_need_dentry_mark
	cbz	w0, .LBB12_140
// %bb.138:
	ldr	w1, [x20, #704]
	mov	x0, x22
	mov	w2, #3
	bl	f2fs_exist_written_data
	tbz	w0, #0, .LBB12_140
// %bb.139:
	mov	w22, #10
	b	.LBB12_57
.LBB12_140:
	mov	x0, x23
	bl	up_read
	add	x22, x19, #1380         // =1380
.LBB12_141:                             // =>This Inner Loop Header: Depth=1
	bl	sched_clock
	mov	x23, x0
	and	w3, w25, #0x1
	add	x2, sp, #48             // =48
	add	x4, sp, #44             // =44
	mov	x0, x19
	mov	x1, x20
	//APP
	// atomic_add
	prfm	pstl1strm, [x22]
1:	ldxr	w8, [x22]
	add	w8, w8, 1
	stxr	w9, w8, [x22]
	cbnz	w9, 1b
	//NO_APP
	bl	f2fs_fsync_node_pages
	//APP
	// atomic_sub
	prfm	pstl1strm, [x22]
1:	ldxr	w8, [x22]
	sub	w8, w8, 1
	stxr	w9, w8, [x22]
	cbnz	w9, 1b
	//NO_APP
	cbnz	w0, .LBB12_147
// %bb.142:                             //   in Loop: Header=BB12_141 Depth=1
	ldr	x8, [x19, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB12_151
// %bb.143:                             //   in Loop: Header=BB12_141 Depth=1
	mov	x0, x19
	mov	w1, w24
	bl	f2fs_need_inode_block_update
	tbz	w0, #0, .LBB12_145
// %bb.144:                             //   in Loop: Header=BB12_141 Depth=1
	mov	x0, x20
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x20
	mov	x1, xzr
	bl	f2fs_write_inode
	b	.LBB12_141
.LBB12_145:
	tbnz	w25, #0, .LBB12_148
// %bb.146:
	ldr	w1, [sp, #44]
	mov	x0, x19
	bl	f2fs_wait_on_node_pages_writeback
	cbz	w0, .LBB12_148
.LBB12_147:
	mov	w28, w0
	stp	xzr, xzr, [sp, #16]     // 16-byte Folded Spill
	mov	x27, xzr
	mov	x26, xzr
	str	xzr, [sp]               // 8-byte Folded Spill
	mov	w22, wzr
	b	.LBB12_134
.LBB12_148:
	mov	x0, x19
	mov	w1, w24
	mov	w2, #1
	bl	f2fs_remove_ino_entry
	add	x8, x20, #712           // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 4096
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	sched_clock
	mov	x27, x0
	tbz	w25, #0, .LBB12_124
	b	.LBB12_125
.LBB12_149:
	bl	preempt_schedule_notrace
	b	.LBB12_9
.LBB12_150:
	bl	preempt_schedule_notrace
	ldr	x23, [sp, #32]          // 8-byte Folded Reload
	cbnz	x23, .LBB12_70
	b	.LBB12_101
.LBB12_151:
	stp	xzr, xzr, [sp, #16]     // 16-byte Folded Spill
	mov	x27, xzr
	mov	x26, xzr
	str	xzr, [sp]               // 8-byte Folded Spill
	mov	w22, wzr
	mov	w28, #-5
	b	.LBB12_134
.LBB12_152:
	bl	__stack_chk_fail
.Lfunc_end12:
	.size	f2fs_do_sync_file, .Lfunc_end12-f2fs_do_sync_file
                                        // -- End function
	.globl	f2fs_truncate_data_blocks_range // -- Begin function f2fs_truncate_data_blocks_range
	.p2align	3
	.type	f2fs_truncate_data_blocks_range,@function
f2fs_truncate_data_blocks_range:        // @f2fs_truncate_data_blocks_range
// %bb.0:
	sub	sp, sp, #112            // =112
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x28, x27, [sp, #32]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #48]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	mov	w22, w1
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	mov	x20, x0
	ldr	x26, [x0]
	ldr	w25, [x0, #28]
	ldr	x9, [x26, #40]
	ldr	w8, [x26, #1268]
	ldr	x21, [x9, #1104]
	ldr	w9, [x26, #1256]
	str	w9, [sp, #8]            // 4-byte Folded Spill
	ldr	x9, [x0, #16]
	lsl	x9, x9, #6
	orr	x9, x9, #0xffffffc000000000
	ldr	w10, [x9, #4072]
	ldr	w11, [x9, #4076]
	cmp	w10, w11
	b.ne	.LBB13_2
// %bb.1:
	ldr	x12, [x26, #712]
	tbnz	w12, #26, .LBB13_51
.LBB13_2:
	mov	x12, xzr
	cmp	w22, #1                 // =1
	b.lt	.LBB13_52
.LBB13_3:
	add	x13, x9, #360           // =360
	cmp	w10, w11
	csel	x9, x13, x9, eq
	sxtw	x10, w25
	add	x9, x9, x12, lsl #2
	mov	w19, wzr
	mov	w27, wzr
	mov	w24, wzr
	add	x28, x9, x10, lsl #2
	sub	w23, w8, #1             // =1
	mov	x0, x21
	stur	wzr, [x29, #-4]         // 4-byte Folded Spill
	str	x25, [sp]               // 8-byte Folded Spill
.LBB13_4:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB13_22 Depth 2
	ldr	w8, [x0, #1532]
	ldr	w25, [x28]
	cbz	w8, .LBB13_8
// %bb.5:                               //   in Loop: Header=BB13_4 Depth=1
	ldr	w8, [x26, #1256]
	cbnz	w8, .LBB13_10
// %bb.6:                               //   in Loop: Header=BB13_4 Depth=1
	ldr	x8, [x26, #712]
	tbnz	x8, #35, .LBB13_10
// %bb.7:                               //   in Loop: Header=BB13_4 Depth=1
	ldr	x8, [x26, #712]
	tbnz	x8, #34, .LBB13_10
	b	.LBB13_11
.LBB13_8:                               //   in Loop: Header=BB13_4 Depth=1
	ldrh	w8, [x26]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB13_11
// %bb.9:                               //   in Loop: Header=BB13_4 Depth=1
	ldr	x8, [x26, #712]
	tbz	w8, #31, .LBB13_11
.LBB13_10:                              //   in Loop: Header=BB13_4 Depth=1
	tst	w24, w23
	b.eq	.LBB13_28
.LBB13_11:                              //   in Loop: Header=BB13_4 Depth=1
	cbz	w25, .LBB13_34
.LBB13_12:                              //   in Loop: Header=BB13_4 Depth=1
	mov	x0, x20
	str	wzr, [x20, #36]
	bl	f2fs_set_data_blkaddr
	add	w8, w25, #2             // =2
	cmp	w8, #2                  // =2
	b.hs	.LBB13_17
.LBB13_13:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	w8, [x20, #28]
	cbnz	w8, .LBB13_16
// %bb.14:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	x8, [x20, #16]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w9, w8
	b.ne	.LBB13_16
// %bb.15:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	x8, [x20]
	add	x8, x8, #712            // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 262144
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB13_16:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	w8, [sp, #8]            // 4-byte Folded Reload
	mov	x0, x21
	mov	w1, w25
	cmp	w8, #0                  // =0
	cset	w26, ne
	bl	f2fs_invalidate_blocks
	cmn	w25, #2                 // =2
	cset	w8, ne
	orr	w8, w26, w8
	add	w19, w19, w8
	b	.LBB13_34
.LBB13_17:                              //   in Loop: Header=BB13_4 Depth=1
	cmn	w25, #3                 // =3
	b.eq	.LBB13_34
// %bb.18:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	w9, [x21, #3024]
	cbz	w9, .LBB13_26
// %bb.19:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	x8, [x21]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB13_25
// %bb.20:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	x11, [x21, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB13_22
.LBB13_21:                              //   in Loop: Header=BB13_22 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB13_25
.LBB13_22:                              //   Parent Loop BB13_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w25
	b.hi	.LBB13_21
// %bb.23:                              //   in Loop: Header=BB13_22 Depth=2
	ldr	w12, [x11]
	cmp	w12, w25
	b.lo	.LBB13_21
// %bb.24:                              //   in Loop: Header=BB13_4 Depth=1
	ldur	x8, [x11, #-80]
.LBB13_25:                              //   in Loop: Header=BB13_4 Depth=1
	cbz	x8, .LBB13_13
.LBB13_26:                              //   in Loop: Header=BB13_4 Depth=1
	mov	x0, x21
	mov	w1, w25
	mov	w2, #7
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB13_34
// %bb.27:                              //   in Loop: Header=BB13_4 Depth=1
	ldur	w9, [x29, #-4]          // 4-byte Folded Reload
	and	w8, w27, #0x1
	add	w9, w9, w8
	stur	w9, [x29, #-4]          // 4-byte Folded Spill
	b	.LBB13_13
.LBB13_28:                              //   in Loop: Header=BB13_4 Depth=1
	tbz	w27, #0, .LBB13_33
// %bb.29:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	w8, [x26, #1268]
	ldr	w9, [x26, #1256]
	cbz	w9, .LBB13_33
// %bb.30:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	w9, [x26, #1256]
	ldur	w10, [x29, #-4]         // 4-byte Folded Reload
	sub	w27, w8, w10
	cmp	w27, w9
	b.le	.LBB13_32
// %bb.31:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	w4, [x26, #1256]
	adrp	x1, .L.str.29
	ldr	x5, [x26, #64]
	adrp	x2, .L__func__.f2fs_i_compr_blocks_update
	add	x1, x1, :lo12:.L.str.29
	add	x2, x2, :lo12:.L__func__.f2fs_i_compr_blocks_update
	mov	w3, w27
	bl	f2fs_printk
.LBB13_32:                              //   in Loop: Header=BB13_4 Depth=1
	add	x8, x26, #1256          // =1256
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, w27
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x26, #40]
	mov	x0, x26
	mov	w1, #1
	sxtw	x9, w27
	ldr	x8, [x8, #1104]
	add	x8, x8, #2120           // =2120
	//APP
	// atomic64_sub
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	sub	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB13_33:                              //   in Loop: Header=BB13_4 Depth=1
	cmn	w25, #2                 // =2
	stur	wzr, [x29, #-4]         // 4-byte Folded Spill
	cset	w27, eq
	cbnz	w25, .LBB13_12
.LBB13_34:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	w8, [x20, #28]
	add	w24, w24, #1            // =1
	cmp	w24, w22
	add	w8, w8, #1              // =1
	str	w8, [x20, #28]
	b.eq	.LBB13_36
// %bb.35:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	x26, [x20]
	add	x28, x28, #4            // =4
	ldr	x8, [x26, #40]
	ldr	x0, [x8, #1104]
	b	.LBB13_4
.LBB13_36:
	ldr	x25, [sp]               // 8-byte Folded Reload
	tbz	w27, #0, .LBB13_41
// %bb.37:
	ldr	x23, [x20]
	ldr	w8, [x23, #1268]
	ldr	w9, [x23, #1256]
	cbz	w9, .LBB13_41
// %bb.38:
	ldr	w9, [x23, #1256]
	ldur	w10, [x29, #-4]         // 4-byte Folded Reload
	sub	w24, w8, w10
	cmp	w24, w9
	b.le	.LBB13_40
// %bb.39:
	ldr	x8, [x23, #40]
	adrp	x1, .L.str.29
	adrp	x2, .L__func__.f2fs_i_compr_blocks_update
	add	x1, x1, :lo12:.L.str.29
	add	x2, x2, :lo12:.L__func__.f2fs_i_compr_blocks_update
	mov	w3, w24
	ldr	x0, [x8, #1104]
	ldr	w4, [x23, #1256]
	ldr	x5, [x23, #64]
	bl	f2fs_printk
.LBB13_40:
	add	x8, x23, #1256          // =1256
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, w24
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x23, #40]
	mov	x0, x23
	mov	w1, #1
	sxtw	x9, w24
	ldr	x8, [x8, #1104]
	add	x8, x8, #2120           // =2120
	//APP
	// atomic64_sub
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	sub	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB13_41:
	cbz	w19, .LBB13_53
// %bb.42:
	ldr	x8, [x20, #16]
	ldr	x1, [x20]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w8, [x8, #4080]
	lsr	w0, w8, #3
	bl	f2fs_start_bidx_of_node
	add	w1, w0, w25
	mov	x0, x20
	mov	w2, wzr
	mov	w3, w22
	bl	f2fs_update_extent_cache_range
	add	x23, x21, #2236         // =2236
	ldr	x22, [x20]
	mov	x0, x23
	bl	_raw_spin_lock
	ldr	w8, [x21, #1240]
	cmp	w8, w19
	b.lo	.LBB13_61
// %bb.43:
	subs	w9, w8, w19
	b.lo	.LBB13_65
.LBB13_44:
	ldr	w8, [x21, #1252]
	lsl	w24, w19, #3
	str	w9, [x21, #1240]
	cbz	w8, .LBB13_47
// %bb.45:
	ldr	w9, [x21, #1256]
	cmp	w9, w8
	b.hs	.LBB13_47
// %bb.46:
	add	w9, w9, w19
	cmp	w8, w9
	csel	w8, w8, w9, lo
	str	w8, [x21, #1256]
.LBB13_47:
	mov	x0, x23
	bl	_raw_spin_unlock
	ldr	x3, [x22, #144]
	cmp	x3, x24
	b.lo	.LBB13_66
// %bb.48:
	ldr	x24, [x22, #712]
	mov	w9, w19
	ldr	x23, [x22, #712]
	mov	x0, x22
	ldrb	w8, [x22, #142]
	mov	w2, wzr
	lsl	x1, x9, x8
	bl	__dquot_free_space
	mov	x0, x22
	mov	w1, #1
	bl	__mark_inode_dirty
	mov	x0, x22
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	tbz	w24, #1, .LBB13_50
// %bb.49:
	tbz	w23, #2, .LBB13_53
.LBB13_50:
	add	x8, x22, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB13_53
.LBB13_51:
	ldr	w12, [x26, #1160]
	sbfx	x12, x12, #2, #30
	cmp	w22, #1                 // =1
	b.ge	.LBB13_3
.LBB13_52:
	mov	w19, wzr
.LBB13_53:
	adrp	x8, jiffies
	str	w25, [x20, #28]
	ldr	x9, [x8, :lo12:jiffies]
	adrp	x8, __tracepoint_f2fs_truncate_data_blocks_range
	add	x8, x8, :lo12:__tracepoint_f2fs_truncate_data_blocks_range
	stp	x9, x9, [x21, #504]
	str	x9, [x21, #520]
	ldr	x21, [x20]
	ldp	w22, w20, [x20, #24]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB13_60
// %bb.54:
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
	tbz	w9, #0, .LBB13_60
// %bb.55:
	//APP
	mrs x23, sp_el0
	//NO_APP
	ldr	w9, [x23, #80]
	add	w9, w9, #1              // =1
	str	w9, [x23, #80]
	//APP
	//NO_APP
	ldr	x24, [x8, #32]
	cbz	x24, .LBB13_58
// %bb.56:
	ldr	x8, [x24], #24
.LBB13_57:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x24, #-16]
	mov	x1, x21
	mov	w2, w22
	mov	w3, w20
	mov	w4, w19
	blr	x8
	ldr	x8, [x24], #24
	cbnz	x8, .LBB13_57
.LBB13_58:
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB13_60
// %bb.59:
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB13_68
.LBB13_60:
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB13_61:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB13_64
// %bb.62:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB13_64
// %bb.63:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.dec_valid_block_count
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3406
	add	x2, x2, :lo12:.L__func__.dec_valid_block_count
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB13_64:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldr	w8, [x21, #1240]
	subs	w9, w8, w19
	b.hs	.LBB13_44
.LBB13_65:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3406; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB13_66:
	ldr	x2, [x22, #64]
	adrp	x1, .L.str.30
	add	x1, x1, :lo12:.L.str.30
	mov	x0, x21
	mov	x4, x24
	bl	f2fs_printk
	cbz	x21, .LBB13_53
// %bb.67:
	add	x8, x21, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB13_53
.LBB13_68:
	bl	preempt_schedule_notrace
	b	.LBB13_60
.Lfunc_end13:
	.size	f2fs_truncate_data_blocks_range, .Lfunc_end13-f2fs_truncate_data_blocks_range
                                        // -- End function
	.globl	f2fs_truncate_data_blocks // -- Begin function f2fs_truncate_data_blocks
	.p2align	3
	.type	f2fs_truncate_data_blocks,@function
f2fs_truncate_data_blocks:              // @f2fs_truncate_data_blocks
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldr	x8, [x0]
	mov	x29, sp
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB14_3
// %bb.1:
	ldr	x9, [x8, #712]
	mov	w1, #1018
	tbz	w9, #31, .LBB14_4
// %bb.2:
	ldr	w8, [x8, #1268]
	neg	w8, w8
	and	w1, w8, w1
	b	.LBB14_4
.LBB14_3:
	mov	w1, #1018
.LBB14_4:
	bl	f2fs_truncate_data_blocks_range
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end14:
	.size	f2fs_truncate_data_blocks, .Lfunc_end14-f2fs_truncate_data_blocks
                                        // -- End function
	.globl	f2fs_do_truncate_blocks // -- Begin function f2fs_do_truncate_blocks
	.p2align	3
	.type	f2fs_do_truncate_blocks,@function
f2fs_do_truncate_blocks:                // @f2fs_do_truncate_blocks
// %bb.0:
	sub	sp, sp, #160            // =160
	adrp	x9, __stack_chk_guard
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	stp	x28, x27, [sp, #80]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #96]     // 16-byte Folded Spill
	adrp	x8, __tracepoint_f2fs_truncate_blocks_enter
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	add	x8, x8, :lo12:__tracepoint_f2fs_truncate_blocks_enter
	stp	x24, x23, [sp, #112]    // 16-byte Folded Spill
	adrp	x27, cpu_number
	stp	x22, x21, [sp, #128]    // 16-byte Folded Spill
	adrp	x26, __cpu_online_mask
	stp	x20, x19, [sp, #144]    // 16-byte Folded Spill
	mov	w22, w2
	stur	x9, [x29, #-8]
	mov	x21, x1
	ldr	x9, [x0, #40]
	mov	x19, x0
	add	x27, x27, :lo12:cpu_number
	add	x26, x26, :lo12:__cpu_online_mask
	ldr	x20, [x9, #1104]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB15_7
// %bb.1:
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
	ldr	w9, [x9, x27]
	add	w10, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w10, w10, w9, lt
	asr	w10, w10, #6
	ldr	x10, [x26, w10, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB15_7
// %bb.2:
	//APP
	mrs x23, sp_el0
	//NO_APP
	ldr	w9, [x23, #80]
	add	w9, w9, #1              // =1
	str	w9, [x23, #80]
	//APP
	//NO_APP
	ldr	x24, [x8, #32]
	cbz	x24, .LBB15_5
// %bb.3:
	ldr	x8, [x24], #24
.LBB15_4:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x24, #-16]
	mov	x1, x19
	mov	x2, x21
	blr	x8
	ldr	x8, [x24], #24
	cbnz	x8, .LBB15_4
.LBB15_5:
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB15_7
// %bb.6:
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB15_104
.LBB15_7:
	mov	x0, x19
	add	x8, x21, #4095          // =4095
	lsr	x23, x8, #12
	bl	max_file_blocks
	cmp	x23, x0
	b.hs	.LBB15_20
// %bb.8:
	tbz	w22, #0, .LBB15_12
// %bb.9:
	add	x24, x20, #368          // =368
	mov	x0, x24
	bl	_raw_spin_lock
	ldr	x8, [x20, #352]
	cbz	x8, .LBB15_11
// %bb.10:
	adrp	x25, jiffies
	ldr	x8, [x20, #360]
	ldr	x9, [x25, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB15_103
.LBB15_11:
	mov	x0, x24
	bl	_raw_spin_unlock
	add	x0, x20, #304           // =304
	bl	down_read
.LBB15_12:
	ldr	x1, [x19, #64]
	mov	x0, x20
	bl	f2fs_get_node_page
	mov	x24, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB15_89
// %bb.13:
	ldr	x8, [x19, #712]
	tbnz	w8, #10, .LBB15_21
// %bb.14:
	add	x0, sp, #8              // =8
	mov	w1, wzr
	mov	w2, #48
	add	x28, sp, #8             // =8
	bl	memset
	add	x0, sp, #8              // =8
	mov	x1, x23
	mov	w2, #2
	stp	x19, x24, [sp, #8]
	str	xzr, [sp, #24]
	str	wzr, [sp, #32]
	bl	f2fs_get_dnode_of_data
	cmn	w0, #2                  // =2
	b.eq	.LBB15_88
// %bb.15:
	mov	w24, w0
	mov	w25, wzr
	cbnz	w0, .LBB15_90
// %bb.16:
	ldr	x24, [sp, #24]
	lsl	x8, x24, #6
	orr	x9, x8, #0xffffffc000000000
	ldr	w8, [x9, #4072]
	ldr	w9, [x9, #4076]
	cmp	w8, w9
	b.ne	.LBB15_49
// %bb.17:
	ldr	w10, [x19, #1160]
	ldr	w11, [x19, #1168]
	ldrh	w12, [x19]
	add	w10, w11, w10, asr #2
	mov	w11, #923
	sub	w10, w11, w10
	and	w11, w12, #0xf000
	cmp	w11, #8, lsl #12        // =32768
	b.ne	.LBB15_53
// %bb.18:
	ldr	x11, [x19, #712]
	tbz	w11, #31, .LBB15_53
// %bb.19:
	ldr	w11, [x19, #1268]
	neg	w11, w11
	and	w10, w10, w11
	b	.LBB15_53
.LBB15_20:
	mov	w25, wzr
	b	.LBB15_93
.LBB15_21:
	mov	x0, x19
	mov	x1, x24
	mov	x2, x21
	bl	f2fs_truncate_inline_inode
	cbz	x24, .LBB15_39
// %bb.22:
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
	b.ne	.LBB15_40
// %bb.23:
	tbnz	w8, #0, .LBB15_37
// %bb.24:
	bl	print_bdev_access_info
	adrp	x23, f2fs_dclient
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB15_27
// %bb.25:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_27
// %bb.26:
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_27:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB15_29
// %bb.28:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB15_106
.LBB15_29:
	ldr	x0, [x24, #24]
.LBB15_30:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB15_32
// %bb.31:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB15_107
.LBB15_32:
	ldr	x0, [x24, #24]
.LBB15_33:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB15_35
// %bb.34:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB15_108
.LBB15_35:
	ldr	x0, [x24, #24]
.LBB15_36:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB15_37:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB15_46
// %bb.38:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB15_39:
	mov	w25, #1
	b	.LBB15_90
.LBB15_40:
	tbnz	w8, #0, .LBB15_45
// %bb.41:
	bl	print_bdev_access_info
	adrp	x23, f2fs_dclient
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB15_44
// %bb.42:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_44
// %bb.43:
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_44:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB15_45:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB15_117
.LBB15_46:
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
	cbnz	w9, .LBB15_48
// %bb.47:
	bl	__put_page
.LBB15_48:
	mov	w24, wzr
	mov	w25, #1
	b	.LBB15_90
.LBB15_49:
	ldrh	w10, [x19]
	and	w10, w10, #0xf000
	cmp	w10, #8, lsl #12        // =32768
	b.ne	.LBB15_52
// %bb.50:
	ldr	x11, [x19, #712]
	mov	w10, #1018
	tbz	w11, #31, .LBB15_53
// %bb.51:
	ldr	w11, [x19, #1268]
	neg	w11, w11
	and	w10, w11, w10
	b	.LBB15_53
.LBB15_52:
	mov	w10, #1018
.LBB15_53:
	ldr	w11, [sp, #36]
	subs	w25, w10, w11
	b.mi	.LBB15_113
// %bb.54:
	cmp	w8, w9
	b.eq	.LBB15_56
// %bb.55:
	cbz	w11, .LBB15_57
.LBB15_56:
	add	x0, sp, #8              // =8
	mov	w1, w25
	bl	f2fs_truncate_data_blocks_range
	ldr	x24, [sp, #24]
	add	x23, x23, w25, uxtw
.LBB15_57:
	cbz	x24, .LBB15_83
// %bb.58:
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
	b.ne	.LBB15_75
// %bb.59:
	tbnz	w8, #0, .LBB15_73
// %bb.60:
	bl	print_bdev_access_info
	adrp	x25, f2fs_dclient
	ldr	x0, [x25, :lo12:f2fs_dclient]
	cbz	x0, .LBB15_63
// %bb.61:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_63
// %bb.62:
	ldr	x0, [x25, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_63:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB15_65
// %bb.64:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB15_109
.LBB15_65:
	ldr	x0, [x24, #24]
.LBB15_66:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB15_68
// %bb.67:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB15_110
.LBB15_68:
	ldr	x0, [x24, #24]
.LBB15_69:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB15_71
// %bb.70:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB15_111
.LBB15_71:
	ldr	x0, [x24, #24]
.LBB15_72:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB15_73:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB15_81
// %bb.74:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB15_75:
	tbnz	w8, #0, .LBB15_80
// %bb.76:
	bl	print_bdev_access_info
	adrp	x25, f2fs_dclient
	ldr	x0, [x25, :lo12:f2fs_dclient]
	cbz	x0, .LBB15_79
// %bb.77:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_79
// %bb.78:
	ldr	x0, [x25, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_79:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB15_80:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB15_118
.LBB15_81:
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
	cbnz	w9, .LBB15_83
// %bb.82:
	bl	__put_page
.LBB15_83:
	ldr	x8, [sp, #16]
	add	x24, x28, #8            // =8
	cbz	x8, .LBB15_87
// %bb.84:
	ldr	x9, [sp, #24]
	cmp	x9, x8
	b.eq	.LBB15_87
// %bb.85:
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
	cbnz	w9, .LBB15_87
// %bb.86:
	bl	__put_page
.LBB15_87:
	stp	xzr, xzr, [x24]
.LBB15_88:
	mov	x0, x19
	mov	x1, x23
	bl	f2fs_truncate_inode_blocks
	mov	w24, w0
.LBB15_89:
	mov	w25, wzr
.LBB15_90:
	tbz	w22, #0, .LBB15_92
// %bb.91:
	add	x0, x20, #304           // =304
	bl	up_read
.LBB15_92:
	cbnz	w24, .LBB15_94
.LBB15_93:
	mov	x0, x19
	mov	x1, x21
	mov	w2, w25
	bl	truncate_partial_data_page
	mov	w24, w0
.LBB15_94:
	adrp	x8, __tracepoint_f2fs_truncate_blocks_exit
	add	x8, x8, :lo12:__tracepoint_f2fs_truncate_blocks_exit
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB15_101
// %bb.95:
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
	ldr	w9, [x9, x27]
	add	w10, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w10, w10, w9, lt
	asr	w10, w10, #6
	ldr	x10, [x26, w10, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB15_101
// %bb.96:
	//APP
	mrs x20, sp_el0
	//NO_APP
	ldr	w9, [x20, #80]
	add	w9, w9, #1              // =1
	str	w9, [x20, #80]
	//APP
	//NO_APP
	ldr	x21, [x8, #32]
	cbz	x21, .LBB15_99
// %bb.97:
	ldr	x8, [x21], #24
.LBB15_98:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x21, #-16]
	mov	x1, x19
	mov	w2, w24
	blr	x8
	ldr	x8, [x21], #24
	cbnz	x8, .LBB15_98
.LBB15_99:
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	b.ne	.LBB15_101
// %bb.100:
	ldr	x8, [x20]
	tbnz	w8, #1, .LBB15_105
.LBB15_101:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB15_112
// %bb.102:
	mov	w0, w24
	ldp	x20, x19, [sp, #144]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB15_103:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x20, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x25, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x20, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB15_11
.LBB15_104:
	bl	preempt_schedule_notrace
	b	.LBB15_7
.LBB15_105:
	bl	preempt_schedule_notrace
	b	.LBB15_101
.LBB15_106:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB15_30
.LBB15_107:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB15_33
.LBB15_108:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB15_36
.LBB15_109:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB15_66
.LBB15_110:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB15_69
.LBB15_111:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB15_72
.LBB15_112:
	bl	__stack_chk_fail
.LBB15_113:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB15_116
// %bb.114:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_116
// %bb.115:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_do_truncate_blocks
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #2900
	add	x2, x2, :lo12:.L__func__.f2fs_do_truncate_blocks
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_116:
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/file.c"; .popsection; .long 14472b - 14470b; .short 2900; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB15_117:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB15_118:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end15:
	.size	f2fs_do_truncate_blocks, .Lfunc_end15-f2fs_do_truncate_blocks
                                        // -- End function
	.p2align	3               // -- Begin function truncate_partial_data_page
	.type	truncate_partial_data_page,@function
truncate_partial_data_page:             // @truncate_partial_data_page
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	w21, w2
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x20, x0
	ldr	x0, [x0, #48]
	ands	x22, x1, #0xfff
	str	x23, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	b.ne	.LBB16_4
// %bb.1:
	tbnz	w21, #0, .LBB16_4
.LBB16_2:
	mov	w19, wzr
.LBB16_3:
	mov	w0, w19
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB16_4:
	lsr	x1, x1, #12
	tbz	w21, #0, .LBB16_24
// %bb.5:
	mov	w2, #2
	mov	w3, wzr
	bl	pagecache_get_page
	mov	x19, x0
	cbz	x0, .LBB16_3
// %bb.6:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB16_26
// %bb.7:
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
	b.ne	.LBB16_58
// %bb.8:
	tbnz	w8, #0, .LBB16_22
// %bb.9:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB16_12
// %bb.10:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB16_12
// %bb.11:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB16_12:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB16_14
// %bb.13:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB16_75
.LBB16_14:
	ldr	x0, [x19, #24]
.LBB16_15:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB16_17
// %bb.16:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB16_76
.LBB16_17:
	ldr	x0, [x19, #24]
.LBB16_18:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB16_20
// %bb.19:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB16_77
.LBB16_20:
	ldr	x0, [x19, #24]
.LBB16_21:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB16_22:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB16_64
// %bb.23:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB16_24:
	mov	x0, x20
	mov	w2, #1
	bl	f2fs_get_lock_data_page
	mov	x19, x0
	cmn	x0, #4095               // =4095
	b.lo	.LBB16_27
// %bb.25:
	cmn	x19, #2                 // =2
	b.ne	.LBB16_3
	b	.LBB16_2
.LBB16_26:
	//APP
	dmb ishld
	//NO_APP
.LBB16_27:
	mov	x0, x19
	mov	w1, wzr
	mov	w2, #1
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
	//APP
	mrs x23, sp_el0
	//NO_APP
	ldr	w8, [x23, #80]
	lsl	x9, x19, #6
	mov	w1, wzr
	orr	x9, x9, #0xffffffc000000000
	add	x0, x9, x22
	add	w8, w8, #1              // =1
	str	w8, [x23, #80]
	//APP
	//NO_APP
	ldr	w8, [x23, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x23, #2984]
	mov	w8, #4096
	sub	x2, x8, x22
	//APP
	//NO_APP
	bl	memset
	//APP
	//NO_APP
	ldr	w8, [x23, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x23, #2984]
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB16_29
// %bb.28:
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB16_71
.LBB16_29:
	mov	x0, x19
	bl	flush_dcache_page
	tbz	w21, #0, .LBB16_33
// %bb.30:
	ldr	w8, [x20, #12]
	tbnz	w8, #14, .LBB16_66
// %bb.31:
	tbnz	w8, #14, .LBB16_70
.LBB16_32:
	cbnz	x19, .LBB16_34
	b	.LBB16_3
.LBB16_33:
	mov	x0, x19
	bl	set_page_dirty
	cbz	x19, .LBB16_3
.LBB16_34:
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
	b.ne	.LBB16_51
// %bb.35:
	tbnz	w8, #0, .LBB16_49
// %bb.36:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB16_39
// %bb.37:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB16_39
// %bb.38:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB16_39:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB16_41
// %bb.40:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB16_72
.LBB16_41:
	ldr	x0, [x19, #24]
.LBB16_42:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB16_44
// %bb.43:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB16_73
.LBB16_44:
	ldr	x0, [x19, #24]
.LBB16_45:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB16_47
// %bb.46:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB16_74
.LBB16_47:
	ldr	x0, [x19, #24]
.LBB16_48:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB16_49:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB16_57
// %bb.50:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB16_51:
	tbnz	w8, #0, .LBB16_56
// %bb.52:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB16_55
// %bb.53:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB16_55
// %bb.54:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB16_55:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB16_56:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB16_78
.LBB16_57:
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
	cbnz	w9, .LBB16_2
	b	.LBB16_65
.LBB16_58:
	tbnz	w8, #0, .LBB16_63
// %bb.59:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB16_62
// %bb.60:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB16_62
// %bb.61:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB16_62:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB16_63:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB16_79
.LBB16_64:
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
	cbnz	w9, .LBB16_2
.LBB16_65:
	bl	__put_page
	b	.LBB16_2
.LBB16_66:
	bl	print_bdev_access_info
	adrp	x21, f2fs_dclient
	ldr	x0, [x21, :lo12:f2fs_dclient]
	cbz	x0, .LBB16_69
// %bb.67:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB16_69
// %bb.68:
	ldr	x0, [x21, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.truncate_partial_data_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #2842
	add	x2, x2, :lo12:.L__func__.truncate_partial_data_page
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB16_69:
	ldr	x8, [x20, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x20, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x20, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	ldr	w8, [x20, #12]
	tbz	w8, #14, .LBB16_32
.LBB16_70:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/file.c"; .popsection; .long 14472b - 14470b; .short 2842; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB16_71:
	bl	preempt_schedule
	b	.LBB16_29
.LBB16_72:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB16_42
.LBB16_73:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB16_45
.LBB16_74:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB16_48
.LBB16_75:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB16_15
.LBB16_76:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB16_18
.LBB16_77:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB16_21
.LBB16_78:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB16_79:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end16:
	.size	truncate_partial_data_page, .Lfunc_end16-truncate_partial_data_page
                                        // -- End function
	.globl	f2fs_truncate           // -- Begin function f2fs_truncate
	.p2align	3
	.type	f2fs_truncate,@function
f2fs_truncate:                          // @f2fs_truncate
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	ldr	x8, [x0, #40]
	str	x21, [sp, #16]          // 8-byte Folded Spill
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB17_30
// %bb.1:
	ldrh	w8, [x0]
	mov	x19, x0
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.eq	.LBB17_4
// %bb.2:
	cmp	w8, #10, lsl #12        // =40960
	b.eq	.LBB17_4
// %bb.3:
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB17_28
.LBB17_4:
	adrp	x8, __tracepoint_f2fs_truncate
	add	x8, x8, :lo12:__tracepoint_f2fs_truncate
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB17_11
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
	tbz	w9, #0, .LBB17_11
// %bb.6:
	//APP
	mrs x20, sp_el0
	//NO_APP
	ldr	w9, [x20, #80]
	add	w9, w9, #1              // =1
	str	w9, [x20, #80]
	//APP
	//NO_APP
	ldr	x21, [x8, #32]
	cbz	x21, .LBB17_9
// %bb.7:
	ldr	x8, [x21], #24
.LBB17_8:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x21, #-16]
	mov	x1, x19
	blr	x8
	ldr	x8, [x21], #24
	cbnz	x8, .LBB17_8
.LBB17_9:
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	b.ne	.LBB17_11
// %bb.10:
	ldr	x8, [x20]
	tbnz	w8, #1, .LBB17_31
.LBB17_11:
	mov	x0, x19
	bl	dquot_initialize
	add	w8, w0, #28             // =28
	cmp	w8, #28                 // =28
	b.hi	.LBB17_13
// %bb.12:
	mov	w10, #1
	mov	w9, #1
	movk	w10, #4224, lsl #16
	lsl	w8, w9, w8
	tst	w8, w10
	b.ne	.LBB17_14
.LBB17_13:
	cmn	w0, #122                // =122
	b.ne	.LBB17_29
.LBB17_14:
	mov	x0, x19
	bl	f2fs_may_inline_data
	tbnz	w0, #0, .LBB17_16
// %bb.15:
	mov	x0, x19
	bl	f2fs_convert_inline_inode
	cbnz	w0, .LBB17_29
.LBB17_16:
	ldr	x8, [x19, #40]
	ldr	x20, [x19, #80]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB17_20
// %bb.17:
	ldr	w8, [x19, #1256]
	cbnz	w8, .LBB17_22
// %bb.18:
	ldr	x8, [x19, #712]
	tbnz	x8, #35, .LBB17_22
// %bb.19:
	ldr	x8, [x19, #712]
	mov	x21, x20
	tbnz	x8, #34, .LBB17_22
	b	.LBB17_23
.LBB17_20:
	ldrh	w8, [x19]
	mov	x21, x20
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB17_23
// %bb.21:
	ldr	x8, [x19, #712]
	mov	x21, x20
	tbz	w8, #31, .LBB17_23
.LBB17_22:
	ldr	w8, [x19, #1268]
	sub	x9, x20, #1             // =1
	lsl	w8, w8, #12
	sub	w8, w8, #1              // =1
	orr	x8, x9, x8
	add	x21, x8, #1             // =1
.LBB17_23:
	mov	x0, x19
	mov	x1, x21
	mov	w2, #1
	bl	f2fs_do_truncate_blocks
	cmp	x21, x20
	b.eq	.LBB17_26
// %bb.24:
	cbnz	w0, .LBB17_26
// %bb.25:
	mov	x0, x19
	mov	x1, x20
	mov	w2, #1
	bl	f2fs_truncate_partial_cluster
.LBB17_26:
	cbnz	w0, .LBB17_29
// %bb.27:
	mov	x0, x19
	bl	current_time
	stp	x0, x1, [x19, #120]
	stp	x0, x1, [x19, #104]
	mov	x0, x19
	mov	w1, wzr
	bl	f2fs_mark_inode_dirty_sync
.LBB17_28:
	mov	w0, wzr
.LBB17_29:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB17_30:
	mov	w0, #-5
	b	.LBB17_29
.LBB17_31:
	bl	preempt_schedule_notrace
	b	.LBB17_11
.Lfunc_end17:
	.size	f2fs_truncate, .Lfunc_end17-f2fs_truncate
                                        // -- End function
	.globl	f2fs_getattr            // -- Begin function f2fs_getattr
	.p2align	3
	.type	f2fs_getattr,@function
f2fs_getattr:                           // @f2fs_getattr
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x20, x1
	ldr	x8, [x0, #8]
	ldr	x19, [x8, #48]
	ldr	x8, [x19, #712]
	tbz	w8, #26, .LBB18_4
// %bb.1:
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2181]
	tbz	w8, #0, .LBB18_4
// %bb.2:
	ldrsw	x8, [x19, #1160]
	add	x8, x8, #360            // =360
	cmp	x8, #380                // =380
	b.lo	.LBB18_4
// %bb.3:
	ldr	w8, [x20]
	orr	w8, w8, #0x800
	str	w8, [x20]
	ldr	x8, [x19, #1176]
	str	x8, [x20, #112]
	ldr	x8, [x19, #1184]
	str	x8, [x20, #120]
.LBB18_4:
	ldr	w8, [x19, #680]
	tbnz	w8, #2, .LBB18_13
// %bb.5:
	tbnz	w8, #5, .LBB18_14
.LBB18_6:
	ldrb	w9, [x19, #13]
	tbnz	w9, #6, .LBB18_15
.LBB18_7:
	tbnz	w8, #4, .LBB18_16
.LBB18_8:
	tbnz	w8, #6, .LBB18_17
.LBB18_9:
	ldrb	w8, [x19, #14]
	tbz	w8, #0, .LBB18_11
.LBB18_10:
	ldr	x8, [x20, #16]
	orr	x8, x8, #0x100000
	str	x8, [x20, #16]
.LBB18_11:
	ldr	x8, [x20, #24]
	mov	w9, #2164
	movk	w9, #16, lsl #16
	mov	x0, x19
	mov	x1, x20
	orr	x8, x8, x9
	str	x8, [x20, #24]
	bl	generic_fillattr
	add	x22, x19, #720          // =720
	mov	x0, x22
	bl	down_read
	ldr	x8, [x19, #712]
	tbnz	x8, #43, .LBB18_18
.LBB18_12:
	mov	x0, x22
	bl	up_read
	b	.LBB18_31
.LBB18_13:
	ldr	x9, [x20, #16]
	orr	x9, x9, #0x4
	str	x9, [x20, #16]
	tbz	w8, #5, .LBB18_6
.LBB18_14:
	ldr	x9, [x20, #16]
	orr	x9, x9, #0x20
	str	x9, [x20, #16]
	ldrb	w9, [x19, #13]
	tbz	w9, #6, .LBB18_7
.LBB18_15:
	ldr	x9, [x20, #16]
	orr	x9, x9, #0x800
	str	x9, [x20, #16]
	tbz	w8, #4, .LBB18_8
.LBB18_16:
	ldr	x9, [x20, #16]
	orr	x9, x9, #0x10
	str	x9, [x20, #16]
	tbz	w8, #6, .LBB18_9
.LBB18_17:
	ldr	x8, [x20, #16]
	orr	x8, x8, #0x40
	str	x8, [x20, #16]
	ldrb	w8, [x19, #14]
	tbnz	w8, #0, .LBB18_10
	b	.LBB18_11
.LBB18_18:
	ldr	x8, [x19, #712]
	tbz	x8, #43, .LBB18_20
// %bb.19:
	ldr	x8, [x19, #712]
	tbnz	x8, #44, .LBB18_12
.LBB18_20:
	ldr	x0, [x19, #1280]
	bl	igrab
	mov	x21, x0
	mov	x0, x22
	bl	up_read
	cbz	x21, .LBB18_31
// %bb.21:
	add	x22, x21, #720          // =720
	mov	x0, x22
	bl	down_read
	ldr	w8, [x21, #72]
	cbz	w8, .LBB18_37
// %bb.22:
	ldr	x9, [x21, #144]
	mov	x0, x22
	udiv	x8, x9, x8
	str	x8, [x20, #128]
	bl	up_read
	ldr	x8, [x21, #712]
	tbnz	x8, #43, .LBB18_27
.LBB18_23:
	bl	print_bdev_access_info
	adrp	x22, f2fs_dclient
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_26
// %bb.24:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_26
// %bb.25:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.put_inner_inode
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #4511
	add	x2, x2, :lo12:.L__func__.put_inner_inode
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_26:
	ldr	x8, [x21, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	b	.LBB18_28
.LBB18_27:
	ldr	x8, [x21, #712]
	tbz	x8, #44, .LBB18_23
.LBB18_28:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB18_36
// %bb.29:
	ldr	x8, [x21, #712]
	tbz	x8, #44, .LBB18_36
// %bb.30:
	mov	x0, x21
	bl	iput
.LBB18_31:
	ldrh	w8, [x19]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB18_33
// %bb.32:
	ldr	x8, [x19, #712]
	tbnz	w8, #10, .LBB18_34
.LBB18_33:
	ldr	x8, [x19, #712]
	tbz	w8, #11, .LBB18_35
.LBB18_34:
	ldr	x8, [x20, #56]
	ldr	x9, [x20, #128]
	add	x8, x8, #511            // =511
	add	x8, x9, x8, asr #9
	str	x8, [x20, #128]
.LBB18_35:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB18_36:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 4511; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB18_37:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB18_40
// %bb.38:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB18_40
// %bb.39:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_getattr
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3051
	add	x2, x2, :lo12:.L__func__.f2fs_getattr
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB18_40:
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/file.c"; .popsection; .long 14472b - 14470b; .short 3051; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end18:
	.size	f2fs_getattr, .Lfunc_end18-f2fs_getattr
                                        // -- End function
	.globl	f2fs_setattr            // -- Begin function f2fs_setattr
	.p2align	3
	.type	f2fs_setattr,@function
f2fs_setattr:                           // @f2fs_setattr
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	ldr	x19, [x0, #48]
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB19_83
// %bb.1:
	ldr	w9, [x19, #12]
	tbnz	w9, #3, .LBB19_82
// %bb.2:
	ldr	w8, [x1]
	mov	x22, x0
	mov	x20, x1
	tbz	w9, #2, .LBB19_4
// %bb.3:
	mov	w9, #7
	movk	w9, #1, lsl #16
	and	w9, w8, w9
	cbnz	w9, .LBB19_82
.LBB19_4:
	tbz	w8, #3, .LBB19_6
// %bb.5:
	mov	x0, x19
	bl	f2fs_is_compress_backend_ready
	tbz	w0, #0, .LBB19_14
.LBB19_6:
	mov	x0, x22
	mov	x1, x20
	bl	setattr_prepare
	mov	w21, w0
	cbnz	w0, .LBB19_76
// %bb.7:
	ldr	w8, [x20]
	tbz	w8, #3, .LBB19_9
// %bb.8:
	ldr	x22, [x22, #48]
	ldrb	w9, [x22, #13]
	tbnz	w9, #6, .LBB19_15
.LBB19_9:
	tbnz	w8, #3, .LBB19_18
.LBB19_10:
	tbz	w8, #1, .LBB19_12
// %bb.11:
	ldr	w9, [x20, #8]
	ldr	w10, [x19, #4]
	cmp	w9, w10
	b.ne	.LBB19_18
.LBB19_12:
	tbz	w8, #2, .LBB19_21
// %bb.13:
	ldr	w8, [x20, #12]
	ldr	w9, [x19, #8]
	cmp	w8, w9
	b.ne	.LBB19_18
	b	.LBB19_21
.LBB19_14:
	mov	w21, #-95
	b	.LBB19_76
.LBB19_15:
	mov	x0, x22
	bl	fscrypt_get_encryption_info
	mov	w21, w0
	cbnz	w0, .LBB19_76
// %bb.16:
	ldr	x8, [x22, #632]
	cbz	x8, .LBB19_80
// %bb.17:
	ldr	w8, [x20]
	tbz	w8, #3, .LBB19_10
.LBB19_18:
	mov	x0, x19
	bl	dquot_initialize
	mov	w21, w0
	add	w8, w0, #28             // =28
	cmp	w8, #28                 // =28
	b.hi	.LBB19_20
// %bb.19:
	mov	w10, #1
	mov	w9, #1
	movk	w10, #4224, lsl #16
	lsl	w8, w9, w8
	tst	w8, w10
	b.ne	.LBB19_21
.LBB19_20:
	cmn	w21, #122               // =122
	b.ne	.LBB19_76
.LBB19_21:
	ldr	w8, [x20]
	tbz	w8, #1, .LBB19_23
// %bb.22:
	ldr	w9, [x20, #8]
	ldr	w10, [x19, #4]
	cmp	w9, w10
	b.ne	.LBB19_25
.LBB19_23:
	tbz	w8, #2, .LBB19_35
// %bb.24:
	ldr	w9, [x20, #12]
	ldr	w10, [x19, #8]
	cmp	w9, w10
	b.eq	.LBB19_35
.LBB19_25:
	ldr	x8, [x19, #40]
	ldr	x22, [x8, #1104]
	add	x21, x22, #368          // =368
	mov	x0, x21
	bl	_raw_spin_lock
	ldr	x8, [x22, #352]
	cbz	x8, .LBB19_27
// %bb.26:
	adrp	x23, jiffies
	ldr	x8, [x22, #360]
	ldr	x9, [x23, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB19_81
.LBB19_27:
	mov	x0, x21
	bl	_raw_spin_unlock
	add	x0, x22, #304           // =304
	bl	down_read
	mov	x0, x19
	mov	x1, x20
	bl	dquot_transfer
	mov	w21, w0
	add	w8, w0, #28             // =28
	cmp	w8, #28                 // =28
	b.hi	.LBB19_29
// %bb.28:
	mov	w10, #1
	mov	w9, #1
	movk	w10, #4224, lsl #16
	lsl	w8, w9, w8
	tst	w8, w10
	b.ne	.LBB19_30
.LBB19_29:
	cmn	w21, #122               // =122
	b.ne	.LBB19_77
.LBB19_30:
	ldr	w8, [x20]
	tbz	w8, #1, .LBB19_32
// %bb.31:
	ldr	w8, [x20, #8]
	str	w8, [x19, #4]
	ldr	w8, [x20]
.LBB19_32:
	tbz	w8, #2, .LBB19_34
// %bb.33:
	ldr	w8, [x20, #12]
	str	w8, [x19, #8]
.LBB19_34:
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	add	x0, x8, #304            // =304
	bl	up_read
	ldr	w8, [x20]
.LBB19_35:
	tbnz	w8, #3, .LBB19_44
// %bb.36:
	tbnz	w8, #1, .LBB19_63
.LBB19_37:
	tbnz	w8, #2, .LBB19_64
.LBB19_38:
	tbnz	w8, #4, .LBB19_65
.LBB19_39:
	tbnz	w8, #5, .LBB19_66
.LBB19_40:
	tbnz	w8, #6, .LBB19_67
.LBB19_41:
	tbnz	w8, #0, .LBB19_68
.LBB19_42:
	ldrb	w8, [x20]
	tbnz	w8, #0, .LBB19_71
.LBB19_43:
	mov	w21, wzr
	b	.LBB19_75
.LBB19_44:
	ldr	w9, [x19, #1168]
	ldr	w10, [x19, #1160]
	ldr	x8, [x20, #16]
	ldr	x24, [x19, #80]
	mvn	w9, w9
	sub	w9, w9, w10, asr #2
	add	w9, w9, #923            // =923
	cmp	x8, w9, sxtw #2
	b.ls	.LBB19_47
// %bb.45:
	mov	x0, x19
	bl	f2fs_convert_inline_inode
	mov	w21, w0
	cbnz	w0, .LBB19_76
// %bb.46:
	ldr	x8, [x20, #16]
.LBB19_47:
	cmp	x8, x24
	b.gt	.LBB19_51
// %bb.48:
	ldr	x9, [x19, #712]
	tbz	x9, #35, .LBB19_51
// %bb.49:
	mov	w1, #10
	mov	x0, x19
	bl	f2fs_reserve_compress_blocks_internal
	mov	w21, w0
	cbnz	w0, .LBB19_76
// %bb.50:
	ldr	x8, [x20, #16]
.LBB19_51:
	cmp	x8, x24
	b.gt	.LBB19_58
// %bb.52:
	ldr	x8, [x19, #712]
	tbz	x8, #43, .LBB19_58
// %bb.53:
	ldr	x8, [x19, #712]
	tbz	x8, #43, .LBB19_55
// %bb.54:
	ldr	x8, [x19, #712]
	tbnz	x8, #44, .LBB19_58
.LBB19_55:
	ldr	x8, [x19, #712]
	tbz	x8, #49, .LBB19_57
// %bb.56:
	mov	x0, x19
	mov	w1, #1
	add	x8, x19, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB19_57:
	adrp	x1, .L__func__.f2fs_setattr
	mov	x0, x19
	add	x1, x1, :lo12:.L__func__.f2fs_setattr
	bl	f2fs_revoke_deduped_inode
	mov	w21, w0
	cbnz	w0, .LBB19_76
.LBB19_58:
	add	x22, x19, #1016         // =1016
	mov	x0, x22
	bl	down_write
	add	x23, x19, #1064         // =1064
	mov	x0, x23
	bl	down_write
	ldr	x1, [x20, #16]
	mov	x0, x19
	bl	truncate_setsize
	ldr	x8, [x20, #16]
	cmp	x8, x24
	b.le	.LBB19_60
// %bb.59:
	mov	w21, wzr
	b	.LBB19_61
.LBB19_60:
	mov	x0, x19
	bl	f2fs_truncate
	mov	w21, w0
.LBB19_61:
	mov	x0, x23
	bl	up_write
	mov	x0, x22
	bl	up_write
	cbnz	w21, .LBB19_76
// %bb.62:
	add	x21, x19, #816          // =816
	mov	x0, x21
	bl	_raw_spin_lock
	mov	x0, x19
	bl	current_time
	ldr	x8, [x19, #80]
	stp	x0, x1, [x19, #120]
	stp	x0, x1, [x19, #104]
	mov	x0, x21
	str	x8, [x19, #808]
	bl	_raw_spin_unlock
	ldr	w8, [x20]
	tbz	w8, #1, .LBB19_37
.LBB19_63:
	ldr	w9, [x20, #8]
	str	w9, [x19, #4]
	tbz	w8, #2, .LBB19_38
.LBB19_64:
	ldr	w9, [x20, #12]
	str	w9, [x19, #8]
	tbz	w8, #4, .LBB19_39
.LBB19_65:
	ldp	x10, x9, [x20, #24]
	stp	x10, x9, [x19, #88]
	tbz	w8, #5, .LBB19_40
.LBB19_66:
	ldp	x10, x9, [x20, #40]
	stp	x10, x9, [x19, #104]
	tbz	w8, #6, .LBB19_41
.LBB19_67:
	ldp	x10, x9, [x20, #56]
	stp	x10, x9, [x19, #120]
	tbz	w8, #0, .LBB19_42
.LBB19_68:
	ldr	w0, [x19, #8]
	ldrh	w21, [x20, #4]
	bl	in_group_p
	cbnz	w0, .LBB19_70
// %bb.69:
	mov	x0, x19
	mov	w1, #4
	bl	capable_wrt_inode_uidgid
	and	w8, w21, #0xfffffbff
	tst	w0, #0x1
	csel	w21, w21, w8, ne
.LBB19_70:
	strh	w21, [x19, #708]
	mov	x0, x19
	mov	w1, wzr
	add	x8, x19, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 32
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	ldrb	w8, [x20]
	tbz	w8, #0, .LBB19_43
.LBB19_71:
	ldr	x8, [x19, #712]
	mov	w9, #708
	mov	x0, x19
	lsl	x8, x8, #58
	and	x8, x9, x8, asr #63
	ldrh	w1, [x19, x8]
	bl	posix_acl_chmod
	ldr	x8, [x19, #712]
	mov	w21, w0
	tbz	w8, #5, .LBB19_75
// %bb.72:
	cbnz	w21, .LBB19_74
// %bb.73:
	ldrh	w8, [x19, #708]
	strh	w8, [x19]
.LBB19_74:
	add	x8, x19, #712           // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 32
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB19_75:
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	ldr	x8, [x19, #40]
	mov	w1, #1
	ldr	x0, [x8, #1104]
	bl	f2fs_balance_fs
.LBB19_76:
	mov	w0, w21
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB19_77:
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	cbz	x8, .LBB19_79
// %bb.78:
	add	x8, x8, #80             // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4096
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
.LBB19_79:
	add	x0, x8, #304            // =304
	bl	up_read
	b	.LBB19_76
.LBB19_80:
	mov	w21, #-126
	b	.LBB19_76
.LBB19_81:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x22, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x23, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x22, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB19_27
.LBB19_82:
	mov	w21, #-1
	b	.LBB19_76
.LBB19_83:
	mov	w21, #-5
	b	.LBB19_76
.Lfunc_end19:
	.size	f2fs_setattr, .Lfunc_end19-f2fs_setattr
                                        // -- End function
	.globl	f2fs_reserve_compress_blocks_internal // -- Begin function f2fs_reserve_compress_blocks_internal
	.p2align	3
	.type	f2fs_reserve_compress_blocks_internal,@function
f2fs_reserve_compress_blocks_internal:  // @f2fs_reserve_compress_blocks_internal
// %bb.0:
	sub	sp, sp, #176            // =176
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	stp	x28, x27, [sp, #96]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #112]    // 16-byte Folded Spill
	mov	w26, w1
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #128]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #144]    // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #160]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #40]
	ldr	x20, [x8, #1104]
	bl	dquot_initialize
	mov	w25, w0
	add	w8, w0, #28             // =28
	cmp	w8, #28                 // =28
	b.hi	.LBB20_2
// %bb.1:
	mov	w10, #1
	mov	w9, #1
	movk	w10, #4224, lsl #16
	lsl	w8, w9, w8
	tst	w8, w10
	b.ne	.LBB20_3
.LBB20_2:
	cmn	w25, #122               // =122
	b.ne	.LBB20_62
.LBB20_3:
	ldr	x8, [x21, #40]
	mov	w1, #1
	str	w26, [sp, #20]          // 4-byte Folded Spill
	str	x20, [sp, #8]           // 8-byte Folded Spill
	ldr	x0, [x8, #1104]
	bl	f2fs_balance_fs
	add	x23, x21, #1016         // =1016
	mov	x0, x23
	bl	down_write
	add	x24, x21, #1064         // =1064
	mov	x0, x24
	bl	down_write
	ldr	x8, [x21, #80]
	add	x8, x8, #4095           // =4095
	lsr	x19, x8, #12
	cbz	x19, .LBB20_55
// %bb.4:
	add	x8, sp, #24             // =24
	mov	x26, xzr
	mov	w22, wzr
	add	x20, x8, #8             // =8
	b	.LBB20_6
.LBB20_5:                               //   in Loop: Header=BB20_6 Depth=1
	cmp	x26, x19
	b.hs	.LBB20_56
.LBB20_6:                               // =>This Inner Loop Header: Depth=1
	add	x0, sp, #24             // =24
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	add	x0, sp, #24             // =24
	mov	x1, x26
	mov	w2, #1
	str	x21, [sp, #24]
	stp	xzr, xzr, [x20]
	str	wzr, [x20, #16]
	bl	f2fs_get_dnode_of_data
	cbz	w0, .LBB20_9
// %bb.7:                               //   in Loop: Header=BB20_6 Depth=1
	mov	w25, w0
	cmn	w0, #2                  // =2
	b.ne	.LBB20_51
// %bb.8:                               //   in Loop: Header=BB20_6 Depth=1
	add	x0, sp, #24             // =24
	mov	x1, x26
	bl	f2fs_get_next_page_offset
	mov	x26, x0
	mov	w25, wzr
	b	.LBB20_5
.LBB20_9:                               //   in Loop: Header=BB20_6 Depth=1
	ldr	x8, [sp, #40]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w9, w8
	b.ne	.LBB20_13
// %bb.10:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	w8, [x21, #1160]
	ldr	w9, [x21, #1168]
	ldrh	w10, [x21]
	add	w8, w9, w8, asr #2
	mov	w9, #923
	sub	w8, w9, w8
	and	w9, w10, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB20_17
// %bb.11:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x9, [x21, #712]
	tbz	w9, #31, .LBB20_17
// %bb.12:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	w9, [x21, #1268]
	neg	w9, w9
	b	.LBB20_16
.LBB20_13:                              //   in Loop: Header=BB20_6 Depth=1
	ldrh	w8, [x21]
	and	w9, w8, #0xf000
	mov	w8, #1018
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB20_17
// %bb.14:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x9, [x21, #712]
	mov	w8, #1018
	tbz	w9, #31, .LBB20_17
// %bb.15:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	w8, [x21, #1268]
	mov	w9, #1018
	neg	w8, w8
.LBB20_16:                              //   in Loop: Header=BB20_6 Depth=1
	and	w8, w8, w9
.LBB20_17:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	w9, [sp, #52]
	mov	w8, w8
	ldr	w10, [x21, #1268]
	add	x0, sp, #24             // =24
	sub	x8, x8, x9
	sub	x9, x19, x26
	cmp	x8, x9
	csel	x8, x8, x9, lo
	sub	w9, w10, #1             // =1
	sub	x8, x8, #1              // =1
	orr	x8, x8, x9
	add	x27, x8, #1             // =1
	mov	x1, x27
	bl	reserve_compress_blocks
	ldr	x28, [sp, #40]
	mov	w25, w0
	cbz	x28, .LBB20_42
// %bb.18:                              //   in Loop: Header=BB20_6 Depth=1
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
	b.ne	.LBB20_34
// %bb.19:                              //   in Loop: Header=BB20_6 Depth=1
	tbnz	w8, #0, .LBB20_33
// %bb.20:                              //   in Loop: Header=BB20_6 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB20_23
// %bb.21:                              //   in Loop: Header=BB20_6 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB20_23
// %bb.22:                              //   in Loop: Header=BB20_6 Depth=1
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB20_23:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB20_25
// %bb.24:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB20_48
.LBB20_25:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x0, [x28, #24]
.LBB20_26:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB20_28
// %bb.27:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB20_49
.LBB20_28:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x0, [x28, #24]
.LBB20_29:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB20_31
// %bb.30:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB20_50
.LBB20_31:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x0, [x28, #24]
.LBB20_32:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB20_33:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB20_40
	b	.LBB20_72
.LBB20_34:                              //   in Loop: Header=BB20_6 Depth=1
	tbnz	w8, #0, .LBB20_39
// %bb.35:                              //   in Loop: Header=BB20_6 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB20_38
// %bb.36:                              //   in Loop: Header=BB20_6 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB20_38
// %bb.37:                              //   in Loop: Header=BB20_6 Depth=1
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB20_38:                              //   in Loop: Header=BB20_6 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB20_39:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB20_73
.LBB20_40:                              //   in Loop: Header=BB20_6 Depth=1
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
	cbnz	w9, .LBB20_42
// %bb.41:                              //   in Loop: Header=BB20_6 Depth=1
	bl	__put_page
.LBB20_42:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x8, [sp, #32]
	cbz	x8, .LBB20_46
// %bb.43:                              //   in Loop: Header=BB20_6 Depth=1
	ldr	x9, [sp, #40]
	cmp	x9, x8
	b.eq	.LBB20_46
// %bb.44:                              //   in Loop: Header=BB20_6 Depth=1
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
	cbnz	w9, .LBB20_46
// %bb.45:                              //   in Loop: Header=BB20_6 Depth=1
	bl	__put_page
.LBB20_46:                              //   in Loop: Header=BB20_6 Depth=1
	stp	xzr, xzr, [x20]
	tbnz	w25, #31, .LBB20_51
// %bb.47:                              //   in Loop: Header=BB20_6 Depth=1
	add	x26, x27, x26
	add	w22, w25, w22
	b	.LBB20_5
.LBB20_48:                              //   in Loop: Header=BB20_6 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB20_26
.LBB20_49:                              //   in Loop: Header=BB20_6 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB20_29
.LBB20_50:                              //   in Loop: Header=BB20_6 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB20_32
.LBB20_51:
	cbz	w22, .LBB20_56
// %bb.52:
	tbz	w25, #31, .LBB20_56
// %bb.53:
	ldr	w8, [x21, #1256]
	cbz	w8, .LBB20_56
// %bb.54:
	mov	x0, x21
	mov	x1, x26
	bl	f2fs_release_reserved_blocks
	sub	w22, w22, w0
	b	.LBB20_56
.LBB20_55:
	mov	w25, wzr
	mov	w22, wzr
.LBB20_56:
	mov	x0, x23
	bl	up_write
	mov	x0, x24
	bl	up_write
	ldr	w26, [sp, #20]          // 4-byte Folded Reload
	tbnz	w25, #31, .LBB20_58
// %bb.57:
	mov	x0, x21
	mov	w1, #1
	add	x8, x21, #712           // =712
	mov	x9, #34359738368
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x21
	bl	current_time
	stp	x0, x1, [x21, #120]
	mov	x0, x21
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	ldr	x20, [sp, #8]           // 8-byte Folded Reload
	b	.LBB20_63
.LBB20_58:
	ldr	x4, [x21, #64]
	adrp	x1, .L.str.10
	ldr	x5, [x21, #144]
	adrp	x2, .L__func__.f2fs_reserve_compress_blocks_internal
	ldr	w7, [x21, #1256]
	add	x1, x1, :lo12:.L.str.10
	ldr	x20, [sp, #8]           // 8-byte Folded Reload
	add	x2, x2, :lo12:.L__func__.f2fs_reserve_compress_blocks_internal
	mov	w3, w25
	mov	w6, w22
	mov	x0, x20
	bl	f2fs_printk
	cbz	w22, .LBB20_63
// %bb.59:
	ldr	w8, [x21, #1256]
	cbz	x20, .LBB20_63
// %bb.60:
	cbz	w8, .LBB20_63
// %bb.61:
	add	x8, x20, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB20_63
.LBB20_62:
	mov	w22, wzr
.LBB20_63:
	and	w23, w25, w25, asr #31
	cmp	w26, #9                 // =9
	b.eq	.LBB20_69
// %bb.64:
	mov	w0, #42678
	movk	w0, #15148, lsl #16
	bl	hiview_hievent_create
	cbz	x0, .LBB20_68
// %bb.65:
	adrp	x1, .L.str.32
	mov	w2, w26
	add	x1, x1, :lo12:.L.str.32
	mov	x24, x0
	bl	hiview_hievent_put_integral
	ldr	x2, [x21, #64]
	adrp	x1, .L.str.33
	mov	w21, w0
	add	x1, x1, :lo12:.L.str.33
	mov	x0, x24
	bl	hiview_hievent_put_integral
	adrp	x1, .L.str.34
	mov	w2, w22
	orr	w19, w0, w21
	add	x1, x1, :lo12:.L.str.34
	mov	x0, x24
	bl	hiview_hievent_put_integral
	adrp	x1, .L.str.35
	orr	w19, w19, w0
	add	x1, x1, :lo12:.L.str.35
	mov	x0, x24
	sxtw	x2, w23
	bl	hiview_hievent_put_integral
	orr	w8, w19, w0
	cbnz	w8, .LBB20_67
// %bb.66:
	mov	x0, x24
	bl	hiview_hievent_report
.LBB20_67:
	adrp	x1, .L.str.37
	adrp	x2, .L__func__.f2fs_compress_imonitor_send
	add	x1, x1, :lo12:.L.str.37
	add	x2, x2, :lo12:.L__func__.f2fs_compress_imonitor_send
	mov	x0, x20
	mov	w3, w26
	bl	f2fs_printk
	mov	x0, x24
	bl	hiview_hievent_destroy
	b	.LBB20_69
.LBB20_68:
	adrp	x1, .L.str.21
	adrp	x2, .L__func__.f2fs_compress_imonitor_send
	add	x1, x1, :lo12:.L.str.21
	add	x2, x2, :lo12:.L__func__.f2fs_compress_imonitor_send
	mov	x0, x20
	bl	f2fs_printk
.LBB20_69:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB20_71
// %bb.70:
	mov	w0, w23
	ldp	x20, x19, [sp, #160]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #144]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #128]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #112]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #96]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB20_71:
	bl	__stack_chk_fail
.LBB20_72:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB20_73:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end20:
	.size	f2fs_reserve_compress_blocks_internal, .Lfunc_end20-f2fs_reserve_compress_blocks_internal
                                        // -- End function
	.globl	f2fs_truncate_hole      // -- Begin function f2fs_truncate_hole
	.p2align	3
	.type	f2fs_truncate_hole,@function
f2fs_truncate_hole:                     // @f2fs_truncate_hole
// %bb.0:
	sub	sp, sp, #160            // =160
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	cmp	x1, x2
	stp	x28, x27, [sp, #80]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x26, x25, [sp, #96]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #112]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #128]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #144]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	b.hs	.LBB21_46
// %bb.1:
	add	x8, sp, #8              // =8
	mov	w23, #8208
	mov	x20, x2
	mov	x21, x1
	mov	x19, x0
	mov	w24, #923
	movk	w23, #62197, lsl #16
	add	x25, x8, #8             // =8
	adrp	x22, f2fs_dclient
	mov	w26, #1018
	b	.LBB21_3
.LBB21_2:                               //   in Loop: Header=BB21_3 Depth=1
	add	x0, sp, #8              // =8
	mov	x1, x21
	bl	f2fs_get_next_page_offset
	mov	x21, x0
	cmp	x21, x20
	b.hs	.LBB21_46
.LBB21_3:                               // =>This Inner Loop Header: Depth=1
	add	x0, sp, #8              // =8
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	add	x0, sp, #8              // =8
	mov	x1, x21
	mov	w2, #1
	str	x19, [sp, #8]
	stp	xzr, xzr, [x25]
	str	wzr, [x25, #16]
	bl	f2fs_get_dnode_of_data
	cmn	w0, #2                  // =2
	b.eq	.LBB21_2
// %bb.4:                               //   in Loop: Header=BB21_3 Depth=1
	cbnz	w0, .LBB21_47
// %bb.5:                               //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [sp, #24]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w9, w8
	b.ne	.LBB21_9
// %bb.6:                               //   in Loop: Header=BB21_3 Depth=1
	ldr	w8, [x19, #1160]
	ldr	w9, [x19, #1168]
	ldrh	w10, [x19]
	add	w8, w9, w8, asr #2
	sub	w8, w24, w8
	and	w9, w10, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB21_12
// %bb.7:                               //   in Loop: Header=BB21_3 Depth=1
	ldr	x9, [x19, #712]
	tbz	w9, #31, .LBB21_12
// %bb.8:                               //   in Loop: Header=BB21_3 Depth=1
	ldr	w9, [x19, #1268]
	neg	w9, w9
	and	w8, w8, w9
	b	.LBB21_12
.LBB21_9:                               //   in Loop: Header=BB21_3 Depth=1
	ldrh	w8, [x19]
	and	w9, w8, #0xf000
	mov	w8, w26
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB21_12
// %bb.10:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x9, [x19, #712]
	mov	w8, w26
	tbz	w9, #31, .LBB21_12
// %bb.11:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	w8, [x19, #1268]
	neg	w8, w8
	and	w8, w8, w26
.LBB21_12:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	w9, [sp, #36]
	mov	w8, w8
	sub	x10, x20, x21
	sub	x9, x8, x9
	cmp	x9, x10
	csel	x27, x9, x10, lo
	sub	x9, x27, #1             // =1
	cmp	x9, x8
	b.hs	.LBB21_50
// %bb.13:                              //   in Loop: Header=BB21_3 Depth=1
	add	x0, sp, #8              // =8
	mov	w1, w27
	bl	f2fs_truncate_data_blocks_range
	ldr	x28, [sp, #24]
	cbz	x28, .LBB21_38
// %bb.14:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [x28, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x28, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x28, x10, eq
	cmp	x9, x23
	ldr	x8, [x8]
	b.ne	.LBB21_30
// %bb.15:                              //   in Loop: Header=BB21_3 Depth=1
	tbnz	w8, #0, .LBB21_29
// %bb.16:                              //   in Loop: Header=BB21_3 Depth=1
	bl	print_bdev_access_info
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_19
// %bb.17:                              //   in Loop: Header=BB21_3 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_19
// %bb.18:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_19:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB21_21
// %bb.20:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB21_43
.LBB21_21:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x0, [x28, #24]
.LBB21_22:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB21_24
// %bb.23:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB21_44
.LBB21_24:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x0, [x28, #24]
.LBB21_25:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB21_27
// %bb.26:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB21_45
.LBB21_27:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x0, [x28, #24]
.LBB21_28:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB21_29:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB21_36
	b	.LBB21_54
.LBB21_30:                              //   in Loop: Header=BB21_3 Depth=1
	tbnz	w8, #0, .LBB21_35
// %bb.31:                              //   in Loop: Header=BB21_3 Depth=1
	bl	print_bdev_access_info
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_34
// %bb.32:                              //   in Loop: Header=BB21_3 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_34
// %bb.33:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_34:                              //   in Loop: Header=BB21_3 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB21_35:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB21_55
.LBB21_36:                              //   in Loop: Header=BB21_3 Depth=1
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
	cbnz	w9, .LBB21_38
// %bb.37:                              //   in Loop: Header=BB21_3 Depth=1
	bl	__put_page
.LBB21_38:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x8, [sp, #16]
	cbz	x8, .LBB21_42
// %bb.39:                              //   in Loop: Header=BB21_3 Depth=1
	ldr	x9, [sp, #24]
	cmp	x9, x8
	b.eq	.LBB21_42
// %bb.40:                              //   in Loop: Header=BB21_3 Depth=1
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
	cbnz	w9, .LBB21_42
// %bb.41:                              //   in Loop: Header=BB21_3 Depth=1
	bl	__put_page
.LBB21_42:                              //   in Loop: Header=BB21_3 Depth=1
	add	x21, x27, x21
	stp	xzr, xzr, [x25]
	cmp	x21, x20
	b.lo	.LBB21_3
	b	.LBB21_46
.LBB21_43:                              //   in Loop: Header=BB21_3 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB21_22
.LBB21_44:                              //   in Loop: Header=BB21_3 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB21_25
.LBB21_45:                              //   in Loop: Header=BB21_3 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB21_28
.LBB21_46:
	mov	w0, wzr
.LBB21_47:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB21_49
// %bb.48:
	ldp	x20, x19, [sp, #144]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB21_49:
	bl	__stack_chk_fail
.LBB21_50:
	bl	print_bdev_access_info
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB21_53
// %bb.51:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB21_53
// %bb.52:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_truncate_hole
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3320
	add	x2, x2, :lo12:.L__func__.f2fs_truncate_hole
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB21_53:
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/file.c"; .popsection; .long 14472b - 14470b; .short 3320; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB21_54:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB21_55:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end21:
	.size	f2fs_truncate_hole, .Lfunc_end21-f2fs_truncate_hole
                                        // -- End function
	.globl	f2fs_transfer_project_quota // -- Begin function f2fs_transfer_project_quota
	.p2align	3
	.type	f2fs_transfer_project_quota,@function
f2fs_transfer_project_quota:            // @f2fs_transfer_project_quota
// %bb.0:
	sub	sp, sp, #64             // =64
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #40]
	str	xzr, [sp]
	ldr	x20, [x8, #1104]
	mov	x8, #8589934592
	stp	xzr, xzr, [sp, #8]
	bfxil	x8, x1, #0, #32
	mov	x1, x8
	ldr	x0, [x20]
	bl	dqget
	cmn	x0, #1, lsl #12         // =4096
	str	x0, [sp, #16]
	b.ls	.LBB22_2
// %bb.1:
	mov	w19, wzr
	b	.LBB22_6
.LBB22_2:
	mov	x1, sp
	mov	x0, x19
	bl	__dquot_transfer
	mov	w19, w0
	cbz	x20, .LBB22_5
// %bb.3:
	cbz	w19, .LBB22_5
// %bb.4:
	add	x8, x20, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4096
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB22_5:
	ldr	x0, [sp, #16]
	bl	dqput
.LBB22_6:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB22_8
// %bb.7:
	mov	w0, w19
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.LBB22_8:
	bl	__stack_chk_fail
.Lfunc_end22:
	.size	f2fs_transfer_project_quota, .Lfunc_end22-f2fs_transfer_project_quota
                                        // -- End function
	.globl	f2fs_pin_file_control   // -- Begin function f2fs_pin_file_control
	.p2align	3
	.type	f2fs_pin_file_control,@function
f2fs_pin_file_control:                  // @f2fs_pin_file_control
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #40]
	mov	x29, sp
	ldr	x20, [x8, #1104]
	tbz	w1, #0, .LBB23_2
// %bb.1:
	ldr	w8, [x19, #696]
	mov	x0, x19
	mov	w1, #1
	add	w8, w8, #1              // =1
	str	w8, [x19, #696]
	bl	f2fs_mark_inode_dirty_sync
.LBB23_2:
	ldr	w4, [x19, #696]
	ldr	x8, [x20, #1912]
	cmp	x8, x4
	b.hs	.LBB23_4
// %bb.3:
	ldr	x3, [x19, #64]
	adrp	x1, .L.str.9
	adrp	x2, .L__func__.f2fs_pin_file_control
	add	x1, x1, :lo12:.L.str.9
	add	x2, x2, :lo12:.L__func__.f2fs_pin_file_control
	mov	x0, x20
                                        // kill: def $w4 killed $w4 killed $x4
	bl	f2fs_printk
	mov	x0, x19
	mov	w1, #1
	add	x8, x19, #712           // =712
	mov	w9, #268435456
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	w0, #-11
	b	.LBB23_5
.LBB23_4:
	mov	w0, wzr
.LBB23_5:
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end23:
	.size	f2fs_pin_file_control, .Lfunc_end23-f2fs_pin_file_control
                                        // -- End function
	.globl	f2fs_precache_extents   // -- Begin function f2fs_precache_extents
	.p2align	3
	.type	f2fs_precache_extents,@function
f2fs_precache_extents:                  // @f2fs_precache_extents
// %bb.0:
	sub	sp, sp, #112            // =112
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #712]
	tbnz	w8, #8, .LBB24_6
// %bb.1:
	add	x8, sp, #8              // =8
	mov	w9, #11
	mov	x19, x0
	str	wzr, [sp, #20]
	strb	wzr, [sp, #52]
	stp	xzr, x8, [sp, #32]
	str	w9, [sp, #48]
	bl	max_file_blocks
	cmp	x0, #1                  // =1
	b.lt	.LBB24_5
// %bb.2:
	mov	x20, x0
	mov	w8, wzr
	add	x21, x19, #1016         // =1016
.LBB24_3:                               // =>This Inner Loop Header: Depth=1
	sub	w8, w20, w8
	mov	x0, x21
	str	w8, [sp, #24]
	bl	down_write
	add	x1, sp, #16             // =16
	mov	x0, x19
	mov	w2, wzr
	mov	w3, #6
	bl	f2fs_map_blocks
	mov	w22, w0
	mov	x0, x21
	bl	up_write
	cbnz	w22, .LBB24_7
// %bb.4:                               //   in Loop: Header=BB24_3 Depth=1
	ldr	x8, [sp, #8]
	cmp	x20, w8, uxtw
	str	w8, [sp, #20]
	b.gt	.LBB24_3
.LBB24_5:
	mov	w22, wzr
	b	.LBB24_7
.LBB24_6:
	mov	w22, #-95
.LBB24_7:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB24_9
// %bb.8:
	mov	w0, w22
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB24_9:
	bl	__stack_chk_fail
.Lfunc_end24:
	.size	f2fs_precache_extents, .Lfunc_end24-f2fs_precache_extents
                                        // -- End function
	.globl	f2fs_recycle_mirror_space // -- Begin function f2fs_recycle_mirror_space
	.p2align	3
	.type	f2fs_recycle_mirror_space,@function
f2fs_recycle_mirror_space:              // @f2fs_recycle_mirror_space
// %bb.0:
	sub	sp, sp, #112            // =112
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x28, x27, [sp, #32]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #48]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	add	x20, x0, #368           // =368
	ldr	x8, [x0, #3032]
	mov	x19, x0
	ldr	w21, [x0, #3304]
	mov	x0, x20
	ldr	w24, [x8, #88]
	ldr	w22, [x8, #280]
	sub	w25, w24, w21
	bl	_raw_spin_lock
	ldr	x8, [x19, #352]
	cbz	x8, .LBB25_2
// %bb.1:
	adrp	x23, jiffies
	ldr	x8, [x19, #360]
	ldr	x9, [x23, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB25_29
.LBB25_2:
	mov	x0, x20
	sub	w23, w22, w21
	bl	_raw_spin_unlock
	add	x0, x19, #304           // =304
	str	x0, [sp, #8]            // 8-byte Folded Spill
	bl	down_read
	cmp	w25, w24
	b.hs	.LBB25_15
// %bb.3:
	mov	w26, #1
	b	.LBB25_5
.LBB25_4:                               //   in Loop: Header=BB25_5 Depth=1
	mov	x0, x21
	bl	_raw_spin_unlock
	add	w25, w25, #1            // =1
	cmp	w25, w24
	b.eq	.LBB25_15
.LBB25_5:                               // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #136]
	ldr	w9, [x19, #1192]
	ldr	x27, [x8, #8]
	udiv	w28, w25, w9
	add	x21, x27, #12           // =12
	mul	w20, w28, w9
	mov	x0, x21
	bl	_raw_spin_lock
	ldr	x8, [x27, #16]
	lsr	w9, w25, #6
	add	x8, x8, w9, uxtw #3
	lsl	x9, x26, x25
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	w8, [x27, #4]
	add	w8, w8, #1              // =1
	str	w8, [x27, #4]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB25_13
// %bb.6:                               //   in Loop: Header=BB25_5 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB25_13
// %bb.7:                               //   in Loop: Header=BB25_5 Depth=1
	ldr	x8, [x19, #3032]
	ldr	w9, [x8, #84]
	cmp	w9, w25
	b.hi	.LBB25_10
// %bb.8:                               //   in Loop: Header=BB25_5 Depth=1
	ldr	w9, [x8, #88]
	cmp	w9, w25
	b.lo	.LBB25_10
// %bb.9:                               //   in Loop: Header=BB25_5 Depth=1
	ldr	w9, [x8, #168]
	add	w9, w9, #1              // =1
	str	w9, [x8, #168]
	ldr	x8, [x19, #3032]
.LBB25_10:                              //   in Loop: Header=BB25_5 Depth=1
	ldr	w9, [x8, #276]
	cmp	w9, w25
	b.hi	.LBB25_13
// %bb.11:                              //   in Loop: Header=BB25_5 Depth=1
	ldr	w9, [x8, #280]
	cmp	w9, w25
	b.lo	.LBB25_13
// %bb.12:                              //   in Loop: Header=BB25_5 Depth=1
	ldr	w9, [x8, #360]
	add	w9, w9, #1              // =1
	str	w9, [x8, #360]
.LBB25_13:                              //   in Loop: Header=BB25_5 Depth=1
	ldr	w8, [x19, #1192]
	mov	w2, w20
	ldr	x0, [x27, #16]
	add	w1, w8, w20
	bl	find_next_bit
	ldr	w8, [x19, #1192]
	add	w8, w8, w20
	cmp	w8, w0
	b.hi	.LBB25_4
// %bb.14:                              //   in Loop: Header=BB25_5 Depth=1
	ldr	x8, [x27, #24]
	lsr	w9, w28, #6
	add	x8, x8, w9, uxtw #3
	lsl	x9, x26, x28
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	w8, [x27, #8]
	add	w8, w8, #1              // =1
	str	w8, [x27, #8]
	b	.LBB25_4
.LBB25_15:
	cmp	w23, w22
	b.hs	.LBB25_28
// %bb.16:
	mov	w24, #1
	b	.LBB25_18
.LBB25_17:                              //   in Loop: Header=BB25_18 Depth=1
	mov	x0, x21
	bl	_raw_spin_unlock
	add	w23, w23, #1            // =1
	cmp	w23, w22
	b.eq	.LBB25_28
.LBB25_18:                              // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #136]
	ldr	w9, [x19, #1192]
	ldr	x25, [x8, #8]
	udiv	w26, w23, w9
	add	x21, x25, #12           // =12
	mul	w20, w26, w9
	mov	x0, x21
	bl	_raw_spin_lock
	ldr	x8, [x25, #16]
	lsr	w9, w23, #6
	add	x8, x8, w9, uxtw #3
	lsl	x9, x24, x23
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	w8, [x25, #4]
	add	w8, w8, #1              // =1
	str	w8, [x25, #4]
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB25_26
// %bb.19:                              //   in Loop: Header=BB25_18 Depth=1
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB25_26
// %bb.20:                              //   in Loop: Header=BB25_18 Depth=1
	ldr	x8, [x19, #3032]
	ldr	w9, [x8, #84]
	cmp	w9, w23
	b.hi	.LBB25_23
// %bb.21:                              //   in Loop: Header=BB25_18 Depth=1
	ldr	w9, [x8, #88]
	cmp	w9, w23
	b.lo	.LBB25_23
// %bb.22:                              //   in Loop: Header=BB25_18 Depth=1
	ldr	w9, [x8, #168]
	add	w9, w9, #1              // =1
	str	w9, [x8, #168]
	ldr	x8, [x19, #3032]
.LBB25_23:                              //   in Loop: Header=BB25_18 Depth=1
	ldr	w9, [x8, #276]
	cmp	w9, w23
	b.hi	.LBB25_26
// %bb.24:                              //   in Loop: Header=BB25_18 Depth=1
	ldr	w9, [x8, #280]
	cmp	w9, w23
	b.lo	.LBB25_26
// %bb.25:                              //   in Loop: Header=BB25_18 Depth=1
	ldr	w9, [x8, #360]
	add	w9, w9, #1              // =1
	str	w9, [x8, #360]
.LBB25_26:                              //   in Loop: Header=BB25_18 Depth=1
	ldr	w8, [x19, #1192]
	mov	w2, w20
	ldr	x0, [x25, #16]
	add	w1, w8, w20
	bl	find_next_bit
	ldr	w8, [x19, #1192]
	add	w8, w8, w20
	cmp	w8, w0
	b.hi	.LBB25_17
// %bb.27:                              //   in Loop: Header=BB25_18 Depth=1
	ldr	x8, [x25, #24]
	lsr	w9, w26, #6
	add	x8, x8, w9, uxtw #3
	lsl	x9, x24, x26
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	w8, [x25, #8]
	add	w8, w8, #1              // =1
	str	w8, [x25, #8]
	b	.LBB25_17
.LBB25_28:
	add	x21, x19, #236          // =236
	mov	x0, x21
	bl	_raw_spin_lock_irqsave
	ldr	x8, [x19, #224]
	mov	x1, x0
	mov	x0, x21
	ldr	w9, [x8, #132]
	and	w9, w9, #0xfffdffff
	str	w9, [x8, #132]
	bl	_raw_spin_unlock_irqrestore
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	bl	up_read
	str	wzr, [x19, #3304]
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB25_29:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x19, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x23, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x19, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB25_2
.Lfunc_end25:
	.size	f2fs_recycle_mirror_space, .Lfunc_end25-f2fs_recycle_mirror_space
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_release_reserved_blocks
	.type	f2fs_release_reserved_blocks,@function
f2fs_release_reserved_blocks:           // @f2fs_release_reserved_blocks
// %bb.0:
	sub	sp, sp, #160            // =160
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	stp	x28, x27, [sp, #80]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #96]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #112]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #128]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #144]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	cbz	x1, .LBB26_47
// %bb.1:
	ldr	x8, [x0, #40]
	add	x9, sp, #8              // =8
	mov	w28, #8208
	mov	x21, x1
	mov	x22, x0
	mov	w20, wzr
	mov	x23, xzr
	mov	w19, #923
	ldr	x8, [x8, #1104]
	movk	w28, #62197, lsl #16
	add	x27, x9, #8             // =8
	str	x8, [sp]                // 8-byte Folded Spill
	b	.LBB26_3
.LBB26_2:                               //   in Loop: Header=BB26_3 Depth=1
	add	x0, sp, #8              // =8
	mov	x1, x23
	bl	f2fs_get_next_page_offset
	mov	x23, x0
	cmp	x23, x21
	b.hs	.LBB26_48
.LBB26_3:                               // =>This Inner Loop Header: Depth=1
	add	x0, sp, #8              // =8
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	add	x0, sp, #8              // =8
	mov	x1, x23
	mov	w2, #1
	str	x22, [sp, #8]
	stp	xzr, xzr, [x27]
	str	wzr, [x27, #16]
	bl	f2fs_get_dnode_of_data
	cmn	w0, #2                  // =2
	b.eq	.LBB26_2
// %bb.4:                               //   in Loop: Header=BB26_3 Depth=1
	cbnz	w0, .LBB26_48
// %bb.5:                               //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [sp, #24]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w9, w8
	b.ne	.LBB26_9
// %bb.6:                               //   in Loop: Header=BB26_3 Depth=1
	ldr	w8, [x22, #1160]
	ldr	w9, [x22, #1168]
	ldrh	w10, [x22]
	add	w8, w9, w8, asr #2
	sub	w8, w19, w8
	and	w9, w10, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB26_13
// %bb.7:                               //   in Loop: Header=BB26_3 Depth=1
	ldr	x9, [x22, #712]
	tbz	w9, #31, .LBB26_13
// %bb.8:                               //   in Loop: Header=BB26_3 Depth=1
	ldr	w9, [x22, #1268]
	neg	w9, w9
	b	.LBB26_12
.LBB26_9:                               //   in Loop: Header=BB26_3 Depth=1
	ldrh	w8, [x22]
	and	w9, w8, #0xf000
	mov	w8, #1018
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB26_13
// %bb.10:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x9, [x22, #712]
	mov	w8, #1018
	tbz	w9, #31, .LBB26_13
// %bb.11:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	w8, [x22, #1268]
	mov	w9, #1018
	neg	w8, w8
.LBB26_12:                              //   in Loop: Header=BB26_3 Depth=1
	and	w8, w8, w9
.LBB26_13:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	w9, [sp, #36]
	mov	w8, w8
	ldr	w10, [x22, #1268]
	add	x0, sp, #8              // =8
	sub	x8, x8, x9
	sub	x9, x21, x23
	cmp	x8, x9
	csel	x8, x8, x9, lo
	sub	w9, w10, #1             // =1
	sub	x8, x8, #1              // =1
	orr	x8, x8, x9
	add	x24, x8, #1             // =1
	mov	x1, x24
	bl	release_compress_blocks
	ldr	x25, [sp, #24]
	mov	w26, w0
	cbz	x25, .LBB26_38
// %bb.14:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [x25, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x25, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x25, x10, eq
	cmp	x9, x28
	ldr	x8, [x8]
	b.ne	.LBB26_30
// %bb.15:                              //   in Loop: Header=BB26_3 Depth=1
	tbnz	w8, #0, .LBB26_29
// %bb.16:                              //   in Loop: Header=BB26_3 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB26_19
// %bb.17:                              //   in Loop: Header=BB26_3 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB26_19
// %bb.18:                              //   in Loop: Header=BB26_3 Depth=1
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB26_19:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB26_21
// %bb.20:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB26_44
.LBB26_21:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x0, [x25, #24]
.LBB26_22:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB26_24
// %bb.23:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB26_45
.LBB26_24:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x0, [x25, #24]
.LBB26_25:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB26_27
// %bb.26:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB26_46
.LBB26_27:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x0, [x25, #24]
.LBB26_28:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB26_29:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB26_36
	b	.LBB26_55
.LBB26_30:                              //   in Loop: Header=BB26_3 Depth=1
	tbnz	w8, #0, .LBB26_35
// %bb.31:                              //   in Loop: Header=BB26_3 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB26_34
// %bb.32:                              //   in Loop: Header=BB26_3 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB26_34
// %bb.33:                              //   in Loop: Header=BB26_3 Depth=1
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB26_34:                              //   in Loop: Header=BB26_3 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB26_35:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB26_56
.LBB26_36:                              //   in Loop: Header=BB26_3 Depth=1
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
	cbnz	w9, .LBB26_38
// %bb.37:                              //   in Loop: Header=BB26_3 Depth=1
	bl	__put_page
.LBB26_38:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x8, [sp, #16]
	cbz	x8, .LBB26_42
// %bb.39:                              //   in Loop: Header=BB26_3 Depth=1
	ldr	x9, [sp, #24]
	cmp	x9, x8
	b.eq	.LBB26_42
// %bb.40:                              //   in Loop: Header=BB26_3 Depth=1
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
	cbnz	w9, .LBB26_42
// %bb.41:                              //   in Loop: Header=BB26_3 Depth=1
	bl	__put_page
.LBB26_42:                              //   in Loop: Header=BB26_3 Depth=1
	stp	xzr, xzr, [x27]
	tbnz	w26, #31, .LBB26_51
// %bb.43:                              //   in Loop: Header=BB26_3 Depth=1
	add	x23, x24, x23
	add	w20, w26, w20
	cmp	x23, x21
	b.lo	.LBB26_3
	b	.LBB26_48
.LBB26_44:                              //   in Loop: Header=BB26_3 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB26_22
.LBB26_45:                              //   in Loop: Header=BB26_3 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB26_25
.LBB26_46:                              //   in Loop: Header=BB26_3 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB26_28
.LBB26_47:
	mov	w20, wzr
.LBB26_48:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB26_50
// %bb.49:
	mov	w0, w20
	ldp	x20, x19, [sp, #144]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #96]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #80]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB26_50:
	bl	__stack_chk_fail
.LBB26_51:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB26_54
// %bb.52:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB26_54
// %bb.53:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_release_reserved_blocks
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #6632
	add	x2, x2, :lo12:.L__func__.f2fs_release_reserved_blocks
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB26_54:
	ldr	x19, [sp]               // 8-byte Folded Reload
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/file.c"; .popsection; .long 14472b - 14470b; .short 6632; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB26_55:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB26_56:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end26:
	.size	f2fs_release_reserved_blocks, .Lfunc_end26-f2fs_release_reserved_blocks
                                        // -- End function
	.globl	f2fs_decompress_file_internal // -- Begin function f2fs_decompress_file_internal
	.p2align	3
	.type	f2fs_decompress_file_internal,@function
f2fs_decompress_file_internal:          // @f2fs_decompress_file_internal
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	ldrb	w8, [x0, #68]
	str	x27, [sp, #16]          // 8-byte Folded Spill
	tbnz	w8, #1, .LBB27_2
// %bb.1:
	mov	x21, #-9
	b	.LBB27_17
.LBB27_2:
	ldr	x21, [x0, #32]
	mov	w19, w2
	mov	w22, w1
	ldr	x8, [x21, #40]
	mov	x0, x21
	ldr	x20, [x8, #1104]
	bl	dquot_initialize
                                        // kill: def $w0 killed $w0 def $x0
	cmn	w0, #122                // =122
	b.eq	.LBB27_7
// %bb.3:
	cmn	w0, #28                 // =28
	b.eq	.LBB27_7
// %bb.4:
	cmn	w0, #5                  // =5
	b.eq	.LBB27_7
// %bb.5:
	cbz	w0, .LBB27_7
// %bb.6:
	sxtw	x21, w0
	b	.LBB27_17
.LBB27_7:
	ldr	x8, [x21, #40]
	mov	w1, #1
	ldr	x0, [x8, #1104]
	bl	f2fs_balance_fs
	ldr	x8, [x21, #712]
	tbz	x8, #35, .LBB27_10
// %bb.8:
	mov	x0, x21
	mov	w1, w22
	bl	f2fs_reserve_compress_blocks_internal
                                        // kill: def $w0 killed $w0 def $x0
	cbz	w0, .LBB27_10
// %bb.9:
	adrp	x1, .L.str.11
	sxtw	x21, w0
	add	x1, x1, :lo12:.L.str.11
	b	.LBB27_14
.LBB27_10:
	ldr	x8, [x21, #712]
	tbnz	x8, #43, .LBB27_15
// %bb.11:
	ldr	x8, [x21, #712]
	tbnz	x8, #33, .LBB27_16
// %bb.12:
	ldp	x8, x0, [x21, #40]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	ldr	w26, [x21, #1268]
	ldr	x8, [x8, #1104]
	ldr	w25, [x8, #1188]
	bl	filemap_write_and_wait_range
	mov	w22, w0
	cbz	w0, .LBB27_18
.LBB27_13:
	adrp	x1, .L.str.13
	sxtw	x21, w22
	add	x1, x1, :lo12:.L.str.13
.LBB27_14:
	adrp	x2, .L__func__.f2fs_decompress_file_internal
	mov	x0, x20
	add	x2, x2, :lo12:.L__func__.f2fs_decompress_file_internal
	mov	w3, w19
	mov	x4, x21
	bl	f2fs_printk
	b	.LBB27_17
.LBB27_15:
	adrp	x1, .L.str.12
	adrp	x2, .L__func__.f2fs_decompress_file_internal
	add	x1, x1, :lo12:.L.str.12
	add	x2, x2, :lo12:.L__func__.f2fs_decompress_file_internal
	mov	x0, x20
	bl	f2fs_printk
	mov	x21, #-13
	b	.LBB27_17
.LBB27_16:
	mov	x21, #-16
.LBB27_17:
	mov	x0, x21
	ldr	x27, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB27_18:
	ldr	w8, [x21, #1256]
	cbz	w8, .LBB27_27
// %bb.19:
	ldr	x8, [x21, #80]
	add	x8, x8, #4095           // =4095
	lsr	x27, x8, #12
	cbz	w27, .LBB27_26
// %bb.20:
	mov	x23, xzr
	b	.LBB27_22
.LBB27_21:                              //   in Loop: Header=BB27_22 Depth=1
	subs	w27, w27, w24
	add	x23, x23, w24, sxtw
	b.eq	.LBB27_25
.LBB27_22:                              // =>This Inner Loop Header: Depth=1
	cmp	w26, w27
	mov	x0, x21
	csel	w24, w26, w27, lt
	mov	x1, x23
	mov	w2, w24
	bl	redirty_blocks
	mov	w22, w0
	tbnz	w0, #31, .LBB27_13
// %bb.23:                              //   in Loop: Header=BB27_22 Depth=1
	ldr	w8, [x21, #768]
	cmp	w8, w25
	b.lo	.LBB27_21
// %bb.24:                              //   in Loop: Header=BB27_22 Depth=1
	ldr	x0, [x21, #48]
	bl	filemap_fdatawrite
	b	.LBB27_21
.LBB27_25:
	cbnz	w22, .LBB27_13
.LBB27_26:
	ldr	x0, [x21, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w22, w0
	cbnz	w0, .LBB27_13
.LBB27_27:
	adrp	x1, .L.str.14
	adrp	x2, .L__func__.f2fs_decompress_file_internal
	add	x1, x1, :lo12:.L.str.14
	add	x2, x2, :lo12:.L__func__.f2fs_decompress_file_internal
	mov	x0, x20
	mov	w3, w19
	bl	f2fs_printk
	mov	x21, xzr
	b	.LBB27_17
.Lfunc_end27:
	.size	f2fs_decompress_file_internal, .Lfunc_end27-f2fs_decompress_file_internal
                                        // -- End function
	.globl	f2fs_ioctl              // -- Begin function f2fs_ioctl
	.p2align	3
	.type	f2fs_ioctl,@function
f2fs_ioctl:                             // @f2fs_ioctl
// %bb.0:
	sub	sp, sp, #112            // =112
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	ldr	x8, [x0, #32]
	str	x25, [sp, #48]          // 8-byte Folded Spill
	ldr	x8, [x8, #40]
	ldr	x22, [x8, #1104]
	ldr	x9, [x22, #224]
	ldrb	w9, [x9, #132]
	tbnz	w9, #3, .LBB28_4
// %bb.1:
	ldr	x9, [x22, #80]
	tbnz	w9, #8, .LBB28_5
.LBB28_2:
	bl	__f2fs_ioctl
.LBB28_3:
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldr	x25, [sp, #48]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB28_4:
	mov	x0, #-5
	b	.LBB28_3
.LBB28_5:
	ldr	w9, [x22, #1192]
	ldr	w24, [x22, #1188]
	ldrsw	x21, [x22, #1284]
	ldr	w11, [x22, #1184]
	ldrsw	x23, [x22, #1272]
	ldrsw	x14, [x22, #1296]
	ldr	x15, [x22, #80]
	tbnz	w15, #3, .LBB28_2
// %bb.6:
	ldr	x18, [x22, #136]
	mov	w3, #-1
	ldr	x15, [x18, #8]
	ldr	w16, [x18, #100]
	ldr	w15, [x15, #8]
	udiv	w17, w16, w9
	cmn	w16, #1                 // =1
	csel	w17, w3, w17, eq
	cmp	w15, w17
	b.ne	.LBB28_11
// %bb.7:
	ldr	w3, [x22, #1284]
	mov	w6, #48
	ldr	w4, [x22, #1272]
	ldr	w19, [x22, #1272]
	ldr	x17, [x18, #24]
	ldr	x18, [x18]
	add	w3, w4, w3
	ldr	w5, [x17, #460]
	ldr	x18, [x18, #136]
	madd	x5, x5, x6, x18
	ldrh	w5, [x5, #2]
	and	w5, w5, #0x3ff
	sub	w4, w24, w5
	cmp	w4, w3
	b.lo	.LBB28_11
// %bb.8:
	ldr	w4, [x17, #580]
	mov	w5, #48
	madd	x4, x4, x5, x18
	ldrh	w4, [x4, #2]
	and	w4, w4, #0x3ff
	sub	w4, w24, w4
	cmp	w4, w3
	b.lo	.LBB28_11
// %bb.9:
	ldr	w4, [x17, #700]
	mov	w5, #48
	madd	x4, x4, x5, x18
	ldrh	w4, [x4, #2]
	and	w4, w4, #0x3ff
	sub	w4, w24, w4
	cmp	w4, w3
	b.lo	.LBB28_11
// %bb.10:
	ldr	w3, [x17, #100]
	mov	w4, #48
	madd	x18, x3, x4, x18
	ldrh	w18, [x18, #2]
	and	w18, w18, #0x3ff
	sub	w18, w24, w18
	cmp	w18, w19
	b.hs	.LBB28_16
.LBB28_11:
	mul	w13, w24, w9
	cmn	w16, #1                 // =1
	sub	x13, x13, #1            // =1
	add	x12, x13, x21
	add	x10, x13, x23
	add	x13, x13, x14
	asr	x12, x12, x11
	asr	x14, x10, x11
	asr	x11, x13, x11
	udiv	w10, w12, w9
	udiv	w12, w14, w9
	udiv	w9, w11, w9
	lsl	w11, w12, #1
	b.eq	.LBB28_13
// %bb.12:
	ldr	w8, [x22, #1192]
	udiv	w8, w16, w8
	b	.LBB28_14
.LBB28_13:
	mov	w8, #-1
.LBB28_14:
	add	w10, w11, w10
	add	w9, w10, w9
	add	w8, w9, w8
	cmp	w15, w8
	b.hi	.LBB28_2
// %bb.15:
	mov	x0, #-28
	b	.LBB28_3
.LBB28_16:
	ldr	w15, [x22, #3024]
	cmp	w15, #2                 // =2
	b.ne	.LBB28_2
// %bb.17:
	ldr	x15, [x22, #16]
	ldrb	w15, [x15, #2182]
	tbz	w15, #0, .LBB28_2
// %bb.18:
	ldr	w25, [x17, #820]
	mov	x20, x2
	str	x0, [sp, #8]            // 8-byte Folded Spill
	mov	x0, x22
	stp	w1, w9, [x29, #24]      // 8-byte Folded Spill
	stur	x11, [x29, #-8]         // 8-byte Folded Spill
	mov	w1, w25
	str	x14, [sp, #16]          // 8-byte Folded Spill
	bl	f2fs_usable_blks_in_seg
	ldr	x16, [x22, #136]
	mov	w14, #48
	mov	w9, w0
	mov	x2, x20
	ldr	x11, [x16]
	ldr	x11, [x11, #136]
	madd	x11, x25, x14, x11
	ldp	x0, x14, [sp, #8]       // 16-byte Folded Reload
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w15, w9, w11
	ldur	x11, [x29, #-8]         // 8-byte Folded Reload
	ldp	w1, w9, [x29, #24]      // 8-byte Folded Reload
	cmp	w15, w19
	b.hs	.LBB28_2
// %bb.19:
	ldr	x15, [x16, #8]
	ldr	w16, [x16, #100]
	ldr	w15, [x15, #8]
	b	.LBB28_11
.Lfunc_end28:
	.size	f2fs_ioctl, .Lfunc_end28-f2fs_ioctl
                                        // -- End function
	.p2align	3               // -- Begin function __f2fs_ioctl
	.type	__f2fs_ioctl,@function
__f2fs_ioctl:                           // @__f2fs_ioctl
// %bb.0:
	sub	sp, sp, #400            // =400
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #304]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #368]    // 16-byte Folded Spill
	add	x29, sp, #304           // =304
	stp	x20, x19, [sp, #384]    // 16-byte Folded Spill
	mov	x20, x2
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	x19, x0
	mov	x21, #-25
	mov	w9, #26134
	movk	w9, #49232, lsl #16
	stp	x28, x27, [sp, #320]    // 16-byte Folded Spill
	cmp	w1, w9
	stp	x26, x25, [sp, #336]    // 16-byte Folded Spill
	stp	x24, x23, [sp, #352]    // 16-byte Folded Spill
	stur	x8, [x29, #-16]
	b.gt	.LBB29_15
// %bb.1:
	mov	w8, #26130
	movk	w8, #32780, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_52
// %bb.2:
	mov	w8, #26112
	movk	w8, #32776, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_81
// %bb.3:
	mov	w8, #62731
	movk	w8, #32772, lsl #16
	cmp	w1, w8
	b.le	.LBB29_96
// %bb.4:
	mov	w8, #62789
	movk	w8, #32772, lsl #16
	cmp	w1, w8
	b.le	.LBB29_175
// %bb.5:
	mov	w8, #62790
	movk	w8, #32772, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_372
// %bb.6:
	mov	w8, #62791
	movk	w8, #32772, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_483
// %bb.7:
	mov	w8, #62794
	movk	w8, #32772, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.8:
	ldr	x8, [x19, #32]
	ldr	x9, [x8, #40]
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x11, [x9, #1104]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_10
// %bb.9:
	ldr	x12, [x8]
	mov	x10, x20
	tbz	w12, #26, .LBB29_11
.LBB29_10:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_11:
	//APP
		adds	x10, x10, 4
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_597
// %bb.12:
	lsl	x9, x20, #8
	ldr	x12, [x8, #64]
	and	x13, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x13, x12
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w11, [x11, #3304]
	ldr	w12, [x9, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB29_1343
// %bb.13:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB29_1344
.LBB29_14:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1345
.LBB29_15:
	mov	w8, #62732
	movk	w8, #16388, lsl #16
	cmp	w1, w8
	b.le	.LBB29_35
// %bb.16:
	mov	w8, #62792
	movk	w8, #16392, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_75
// %bb.17:
	mov	w8, #26113
	movk	w8, #16392, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_112
// %bb.18:
	mov	w8, #62771
	movk	w8, #16388, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_210
// %bb.19:
	mov	w8, #62733
	movk	w8, #16388, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_423
// %bb.20:
	mov	w8, #62770
	movk	w8, #16388, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.21:
	ldr	x23, [x19, #32]
	ldr	x8, [x23, #40]
	ldr	x26, [x8, #1104]
	ldr	x8, [x26, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB29_1075
// %bb.22:
	ldr	x8, [x26]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_493
// %bb.23:
	mov	x0, x23
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_579
// %bb.24:
	ldr	x8, [x26, #16]
	ldrsh	w8, [x8, #2180]
	tbz	w8, #31, .LBB29_584
// %bb.25:
	ldr	x8, [x23, #712]
	tbz	w8, #26, .LBB29_584
// %bb.26:
	ldrsw	x8, [x23, #1160]
	add	x8, x8, #360            // =360
	cmp	x8, #400                // =400
	b.lo	.LBB29_584
// %bb.27:
	//APP
	mrs x24, sp_el0
	//NO_APP
	ldrb	w9, [x24, #110]
	ldr	x8, [x24, #64]
	tbnz	w9, #5, .LBB29_29
// %bb.28:
	ldr	x10, [x24]
	mov	x9, x20
	tbz	w10, #26, .LBB29_30
.LBB29_29:
	lsl	x9, x20, #8
	and	x9, x20, x9, asr #8
.LBB29_30:
	//APP
		adds	x9, x9, 4
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_1877
// %bb.31:
	lsl	x9, x20, #8
	add	x0, sp, #104            // =104
	mov	w2, #4
	ldr	x8, [x24, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1879
// %bb.32:
	ldr	w0, [sp, #104]
	bl	__fdget_pos
	ands	x20, x0, #0xfffffffffffffffc
	b.eq	.LBB29_748
// %bb.33:
	mov	x21, x0
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w28, w0
	cbz	w0, .LBB29_917
// %bb.34:
	tbnz	w21, #1, .LBB29_962
	b	.LBB29_1186
.LBB29_35:
	mov	w8, #62720
	cmp	w1, w8
	b.le	.LBB29_152
// %bb.36:
	mov	w8, #-62721
	add	w8, w1, w8
	cmp	w8, #63                 // =63
	b.hi	.LBB29_156
// %bb.37:
	adrp	x9, .LJTI29_1
	add	x9, x9, :lo12:.LJTI29_1
	adr	x10, .LBB29_38
	ldrh	w11, [x9, x8, lsl #1]
	add	x10, x10, x11, lsl #2
	br	x10
.LBB29_38:
	ldr	x21, [x19, #32]
	ldr	x8, [x21, #40]
	mov	x0, x21
	ldr	x27, [x8, #1104]
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_537
// %bb.39:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_598
// %bb.40:
	mov	w22, #-22
	ldrb	w8, [x19, #66]
	mov	w23, w22
	tbnz	w8, #0, .LBB29_907
// %bb.41:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w23, w0
	cbnz	w0, .LBB29_907
// %bb.42:
	add	x20, x21, #160          // =160
	mov	x0, x20
	bl	down_write
	ldr	x8, [x21, #712]
	tbz	x8, #49, .LBB29_44
// %bb.43:
	mov	x0, x21
	mov	w1, #1
	add	x8, x21, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB29_44:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB29_48
// %bb.45:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB29_47
// %bb.46:
	ldr	x8, [x21, #712]
	tbnz	x8, #44, .LBB29_48
.LBB29_47:
	adrp	x1, .L__func__.f2fs_ioc_start_atomic_write
	mov	x0, x21
	add	x1, x1, :lo12:.L__func__.f2fs_ioc_start_atomic_write
	bl	f2fs_revoke_deduped_inode
	mov	w23, w0
	cbnz	w0, .LBB29_905
.LBB29_48:
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB29_749
// %bb.49:
	ldr	w8, [x21, #1256]
	cbnz	w8, .LBB29_751
// %bb.50:
	ldr	x8, [x21, #712]
	tbnz	x8, #35, .LBB29_751
// %bb.51:
	ldr	x8, [x21, #712]
	tbnz	x8, #34, .LBB29_751
	b	.LBB29_752
.LBB29_52:
	mov	w8, #62735
	movk	w8, #49160, lsl #16
	cmp	w1, w8
	b.le	.LBB29_85
// %bb.53:
	mov	w8, #22648
	movk	w8, #49176, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_103
// %bb.54:
	mov	w8, #26133
	movk	w8, #49161, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_189
// %bb.55:
	mov	w8, #62736
	movk	w8, #49160, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_393
// %bb.56:
	mov	w8, #62776
	movk	w8, #49160, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.57:
	ldr	x21, [x19, #32]
	ldr	x8, [x21, #40]
	ldr	x23, [x8, #1104]
	ldr	x8, [x23, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB29_1190
// %bb.58:
	ldr	x8, [x23]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_1321
// %bb.59:
	mov	x0, x21
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_613
// %bb.60:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_1322
// %bb.61:
	ldr	x8, [x23, #16]
	ldrsh	w8, [x8, #2180]
	tbz	w8, #31, .LBB29_638
// %bb.62:
	ldr	x8, [x21, #712]
	tbz	w8, #26, .LBB29_638
// %bb.63:
	ldrsw	x8, [x21, #1160]
	add	x8, x8, #360            // =360
	cmp	x8, #400                // =400
	b.lo	.LBB29_638
// %bb.64:
	ldr	x8, [x21, #712]
	tbnz	w8, #10, .LBB29_1322
// %bb.65:
	//APP
	mrs x26, sp_el0
	//NO_APP
	ldrb	w9, [x26, #110]
	ldr	x8, [x26, #64]
	tbnz	w9, #5, .LBB29_67
// %bb.66:
	ldr	x10, [x26]
	mov	x9, x20
	tbz	w10, #26, .LBB29_68
.LBB29_67:
	lsl	x9, x20, #8
	and	x9, x20, x9, asr #8
.LBB29_68:
	//APP
		adds	x9, x9, 8
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_1926
// %bb.69:
	lsl	x9, x20, #8
	add	x0, sp, #104            // =104
	mov	w2, #8
	ldr	x8, [x26, #64]
	and	x27, x20, x9, asr #8
	//APP
		bics	xzr, x27, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1927
// %bb.70:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w22, w0
	cbnz	w0, .LBB29_703
// %bb.71:
	add	x22, x21, #160          // =160
	mov	x0, x22
	bl	down_write
	ldr	w8, [sp, #108]
	tbnz	w8, #2, .LBB29_1056
// %bb.72:
	tbnz	w8, #3, .LBB29_1166
// %bb.73:
	tbnz	w8, #4, .LBB29_1367
// %bb.74:
	mov	w24, #-22
	b	.LBB29_1377
.LBB29_75:
	mov	w8, #62730
	movk	w8, #16408, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_130
// %bb.76:
	mov	w8, #62791
	movk	w8, #16396, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_220
// %bb.77:
	mov	w8, #62793
	movk	w8, #16392, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_151
// %bb.78:
	mov	w8, #26133
	movk	w8, #16396, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.79:
	ldr	x8, [x19, #32]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2180]
	tbz	w8, #0, .LBB29_492
// %bb.80:
	mov	x0, x19
	mov	x1, x20
	bl	fscrypt_ioctl_get_policy
	b	.LBB29_576
.LBB29_81:
	mov	w8, #2799
	movk	w8, #32759, lsl #16
	add	w8, w1, w8
	cmp	w8, #45                 // =45
	b.hi	.LBB29_166
// %bb.82:
	adrp	x9, .LJTI29_0
	add	x9, x9, :lo12:.LJTI29_0
	adr	x10, .LBB29_83
	ldrh	w11, [x9, x8, lsl #1]
	add	x10, x10, x11, lsl #2
	br	x10
.LBB29_83:
	ldr	x8, [x19, #32]
	ldr	x9, [x8, #40]
	ldr	x9, [x9, #1104]
	ldr	x9, [x9, #16]
	ldrb	w9, [x9, #2181]
	tbnz	w9, #5, .LBB29_513
// %bb.84:
	mov	w9, #-95
	sxtw	x21, w9
	b	.LBB29_577
.LBB29_85:
	mov	w8, #22558
	movk	w8, #32796, lsl #16
	cmp	w1, w8
	b.le	.LBB29_148
// %bb.86:
	mov	w8, #26245
	movk	w8, #49156, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_207
// %bb.87:
	mov	w8, #22559
	movk	w8, #32796, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_413
// %bb.88:
	mov	w8, #37937
	movk	w8, #33024, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.89:
	ldr	x8, [x19, #32]
	adrp	x9, kmalloc_caches
	add	x9, x9, :lo12:kmalloc_caches
	mov	w1, #32960
	movk	w1, #96, lsl #16
	mov	w2, #512
	ldr	x8, [x8, #40]
	ldr	x0, [x9, #72]
	ldr	x22, [x8, #1104]
	bl	kmem_cache_alloc_trace
	cbz	x0, .LBB29_588
// %bb.90:
	add	x21, x22, #24           // =24
	mov	x19, x0
	mov	x0, x21
	bl	down_read
	ldr	x8, [x22, #16]
	mov	w1, #512
	mov	w2, #1
	mov	x3, x19
	mov	w4, #512
	add	x0, x8, #124            // =124
	bl	utf16s_to_utf8s
	mov	w22, w0
	mov	x0, x21
	bl	up_read
	cmp	w22, #256               // =256
	mov	w8, #256
	csel	w8, w22, w8, lt
	mov	x0, x19
	sxtw	x21, w8
	mov	x1, x21
	mov	w2, #1
	bl	__check_object_size
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_92
// %bb.91:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_93
.LBB29_92:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_93:
	//APP
		adds	x10, x10, x21
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_95
// %bb.94:
	lsl	x9, x20, #8
	mov	x1, x19
	mov	x2, x21
	ldr	x8, [x8, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x0, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_to_user
	mov	x21, x0
.LBB29_95:
	mov	x0, x19
	bl	kfree
	cmp	x21, #0                 // =0
	mov	x8, #-14
	csel	x21, xzr, x8, eq
	b	.LBB29_577
.LBB29_96:
	mov	w8, #62740
	movk	w8, #32770, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_179
// %bb.97:
	mov	w8, #62781
	movk	w8, #32769, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_379
// %bb.98:
	mov	w8, #62783
	movk	w8, #32769, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.99:
	ldr	x21, [x19, #32]
	add	x19, x21, #160          // =160
	mov	x0, x19
	bl	down_write
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB29_586
// %bb.100:
	ldr	w8, [x21, #1256]
	cbnz	w8, .LBB29_102
// %bb.101:
	ldr	x8, [x21, #712]
	tbz	x8, #35, .LBB29_589
.LBB29_102:
	mov	w21, #1
	b	.LBB29_590
.LBB29_103:
	mov	w8, #26135
	movk	w8, #49216, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_203
// %bb.104:
	mov	w8, #22649
	movk	w8, #49176, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_401
// %bb.105:
	mov	w8, #62729
	movk	w8, #49184, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.106:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_108
// %bb.107:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_109
.LBB29_108:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_109:
	//APP
		adds	x10, x10, 32
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1189
// %bb.110:
	lsl	x9, x20, #8
	sub	x0, x29, #144           // =144
	mov	w2, #32
	ldr	x8, [x8, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1195
// %bb.111:
	sub	x1, x29, #144           // =144
	mov	x0, x19
	bl	__f2fs_ioc_move_range
	b	.LBB29_576
.LBB29_112:
	mov	w8, #62770
	movk	w8, #16392, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_224
// %bb.113:
	mov	w8, #26114
	movk	w8, #16392, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_430
// %bb.114:
	mov	w8, #62730
	movk	w8, #16392, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.115:
	ldr	x8, [x19, #32]
	mov	w0, #21
	ldr	x8, [x8, #40]
	ldr	x21, [x8, #1104]
	ldr	x8, [x21, #136]
	ldr	x24, [x8]
	bl	capable
	tbz	w0, #0, .LBB29_392
// %bb.116:
	ldr	x8, [x21]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_1321
// %bb.117:
	ldr	x8, [x21, #80]
	tbnz	w8, #8, .LBB29_1322
// %bb.118:
	//APP
	mrs x25, sp_el0
	//NO_APP
	ldrb	w9, [x25, #110]
	ldr	x8, [x25, #64]
	tbnz	w9, #5, .LBB29_120
// %bb.119:
	ldr	x10, [x25]
	mov	x9, x20
	tbz	w10, #26, .LBB29_121
.LBB29_120:
	lsl	x9, x20, #8
	and	x9, x20, x9, asr #8
.LBB29_121:
	//APP
		adds	x9, x9, 8
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_1498
// %bb.122:
	lsl	x9, x20, #8
	sub	x0, x29, #144           // =144
	mov	w2, #8
	ldr	x8, [x25, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1502
// %bb.123:
	ldr	w3, [x21, #3024]
	subs	w8, w3, #1              // =1
	b.le	.LBB29_628
// %bb.124:
	ldur	w2, [x29, #-144]
	cmp	w8, w2
	b.ls	.LBB29_629
// %bb.125:
	ldr	w8, [x21, #1192]
	cmp	w8, #2                  // =2
	b.hs	.LBB29_629
// %bb.126:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w22, w0
	cbnz	w0, .LBB29_703
// %bb.127:
	ldur	w10, [x29, #-144]
	ldr	x8, [x21, #3032]
	cbz	w10, .LBB29_948
// %bb.128:
	mov	w9, #192
	madd	x9, x10, x9, x8
	ldr	w9, [x9, #76]
	add	w11, w9, #3             // =3
	cmp	w11, #4                 // =4
	b.hs	.LBB29_1044
.LBB29_129:
	mov	w9, #-1
	b	.LBB29_1206
.LBB29_130:
	mov	w8, #26244
	movk	w8, #16512, lsl #16
	cmp	w1, w8
	b.gt	.LBB29_237
// %bb.131:
	mov	w8, #62731
	movk	w8, #16408, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_439
// %bb.132:
	mov	w8, #22560
	movk	w8, #16412, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.133:
	ldr	x22, [x19, #32]
	//APP
	mrs x21, sp_el0
	//NO_APP
	ldrb	w10, [x21, #110]
	lsl	x8, x20, #8
	ldr	x9, [x21, #64]
	tbnz	w10, #5, .LBB29_135
// %bb.134:
	ldr	x11, [x21]
	mov	x10, x20
	tbz	w11, #26, .LBB29_136
.LBB29_135:
	and	x10, x20, x8, asr #8
.LBB29_136:
	//APP
		adds	x10, x10, 28
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1191
// %bb.137:
	sub	x0, x29, #144           // =144
	mov	w2, #28
	ldr	x9, [x21, #64]
	and	x8, x20, x8, asr #8
	//APP
		bics	xzr, x8, x9
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1197
// %bb.138:
	mov	x0, x22
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_508
// %bb.139:
	ldur	w8, [x29, #-144]
	mov	w9, #-761
	tst	w8, w9
	b.ne	.LBB29_259
// %bb.140:
	lsr	w11, w8, #3
	lsr	w12, w8, #2
	ldrh	w13, [x22]
	and	w12, w12, #0x8
	lsr	w9, w8, #9
	lsr	w10, w8, #6
	bfi	w12, w11, #4, #1
	lsr	w11, w8, #4
	lsr	w8, w8, #1
	mov	w26, #-95
	and	w8, w8, #0x40
	bfi	w12, w11, #5, #1
	orr	w23, w12, w8
	and	w8, w13, #0xf000
	bfi	w23, w10, #7, #1
	cmp	w8, #8, lsl #12         // =32768
	mov	w10, #192
	mov	w11, #-1610678273
	csel	w10, w11, w10, eq
	cmp	w8, #4, lsl #12         // =16384
	mov	w25, w26
	csinv	w8, w10, wzr, ne
	bfi	w23, w9, #29, #1
	bics	wzr, w23, w8
	b.ne	.LBB29_1352
// %bb.141:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w25, w0
	cbnz	w0, .LBB29_1352
// %bb.142:
	add	x20, x22, #160          // =160
	mov	x0, x20
	bl	down_write
	ldr	w8, [x22, #680]
	add	x0, sp, #104            // =104
	mov	w1, wzr
	mov	w2, #28
	lsr	w10, w8, #3
	lsr	w9, w8, #6
	lsr	w11, w8, #1
	and	w12, w11, #0x8
	and	w13, w11, #0x10
	and	w11, w11, #0x40
	bfi	w12, w10, #5, #1
	orr	w10, w12, w13
	lsr	w8, w8, #20
	bfi	w10, w9, #7, #1
	orr	w9, w10, w11
	and	w8, w8, #0x200
	orr	w24, w9, w8
	bl	memset
	ldr	x8, [x22, #40]
	str	w24, [sp, #104]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2180]
	tbz	w8, #4, .LBB29_144
// %bb.143:
	ldr	w1, [x22, #1164]
	adrp	x0, init_user_ns
	add	x0, x0, :lo12:init_user_ns
	bl	from_kprojid
	str	w0, [sp, #116]
.LBB29_144:
	add	x1, sp, #104            // =104
	sub	x2, x29, #144           // =144
	mov	x0, x22
	bl	vfs_ioc_fssetxattr_check
	mov	w25, w0
	cbnz	w0, .LBB29_1351
// %bb.145:
	mov	w2, #248
	mov	x0, x22
	movk	w2, #8192, lsl #16
	mov	w1, w23
	bl	f2fs_setflags_common
	mov	w25, w0
	cbnz	w0, .LBB29_1351
// %bb.146:
	ldr	x22, [x19, #32]
	ldur	w1, [x29, #-132]
	ldr	x8, [x22, #40]
	ldr	x24, [x8, #1104]
	ldr	x8, [x24, #16]
	ldrb	w8, [x8, #2180]
	tbnz	w8, #4, .LBB29_1011
// %bb.147:
	cmp	w1, #0                  // =0
	csel	w25, wzr, w26, eq
	b	.LBB29_1351
.LBB29_148:
	mov	w8, #26131
	movk	w8, #32780, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_491
// %bb.149:
	mov	w8, #26139
	movk	w8, #32784, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_390
// %bb.150:
	mov	w8, #62774
	movk	w8, #32784, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
.LBB29_151:
	mov	x21, xzr
	b	.LBB29_577
.LBB29_152:
	mov	w8, #26135
	movk	w8, #49232, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_370
// %bb.153:
	mov	w8, #26138
	movk	w8, #49280, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.154:
	ldr	x8, [x19, #32]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2180]
	tbz	w8, #0, .LBB29_492
// %bb.155:
	mov	x0, x19
	mov	x1, x20
	bl	fscrypt_ioctl_get_key_status
	b	.LBB29_576
.LBB29_156:
	mov	w8, #62742
	movk	w8, #16386, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_494
// %bb.157:
	mov	w8, #62726
	movk	w8, #16388, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.158:
	ldr	x8, [x19, #32]
	mov	w0, #21
	ldr	x8, [x8, #40]
	ldr	x21, [x8, #1104]
	bl	capable
	tbz	w0, #0, .LBB29_581
// %bb.159:
	//APP
	mrs x23, sp_el0
	//NO_APP
	ldrb	w9, [x23, #110]
	ldr	x8, [x23, #64]
	tbnz	w9, #5, .LBB29_161
// %bb.160:
	ldr	x10, [x23]
	mov	x9, x20
	tbz	w10, #26, .LBB29_162
.LBB29_161:
	lsl	x9, x20, #8
	and	x9, x20, x9, asr #8
.LBB29_162:
	//APP
		adds	x9, x9, 4
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_1487
// %bb.163:
	lsl	x8, x20, #8
	ldr	x10, [x23, #64]
	and	x11, x20, x8, asr #8
	adrp	x8, arm64_const_caps_ready
	//APP
		bics	xzr, x11, x10
	csel	x9, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w10, [x8, :lo12:arm64_const_caps_ready]
	cmp	w10, #1                 // =1
	b.lt	.LBB29_1479
// %bb.164:
	adrp	x10, cpu_hwcap_keys
	add	x10, x10, :lo12:cpu_hwcap_keys
	ldr	w10, [x10, #16]
	cmp	w10, #0                 // =0
	b.le	.LBB29_1480
.LBB29_165:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1481
.LBB29_166:
	mov	w8, #26113
	movk	w8, #32776, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_496
// %bb.167:
	mov	w8, #30209
	movk	w8, #32776, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.168:
	ldr	x10, [x19, #32]
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w11, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w11, #5, .LBB29_170
// %bb.169:
	ldr	x12, [x8]
	mov	x11, x20
	tbz	w12, #26, .LBB29_171
.LBB29_170:
	lsl	x11, x20, #8
	and	x11, x20, x11, asr #8
.LBB29_171:
	//APP
		adds	x11, x11, 4
	csel	x9, xzr, x9, hi
	csinv	x11, x11, xzr, cc
	sbcs	xzr, x11, x9
	cset	x11, ls

	//NO_APP
	cbz	x11, .LBB29_509
// %bb.172:
	lsl	x9, x20, #8
	ldr	x12, [x8, #64]
	and	x13, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x13, x12
	csel	x11, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w10, [x10, #616]
	ldr	w12, [x9, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB29_1353
// %bb.173:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB29_1354
.LBB29_174:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1355
.LBB29_175:
	mov	w8, #62732
	movk	w8, #32772, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_363
// %bb.176:
	mov	w8, #62734
	movk	w8, #32772, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.177:
	ldr	x8, [x19, #32]
	ldr	x9, [x8, #712]
	tbnz	w9, #28, .LBB29_538
// %bb.178:
	mov	w8, wzr
	b	.LBB29_539
.LBB29_179:
	mov	w8, #62741
	movk	w8, #32770, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_386
// %bb.180:
	mov	w8, #22653
	movk	w8, #32772, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.181:
	ldr	x8, [x19, #32]
	mov	w0, #21
	ldr	x8, [x8, #40]
	ldr	x21, [x8, #1104]
	ldr	x22, [x21]
	bl	capable
	tbz	w0, #0, .LBB29_546
// %bb.182:
	//APP
	mrs x24, sp_el0
	//NO_APP
	ldrb	w9, [x24, #110]
	ldr	x8, [x24, #64]
	tbnz	w9, #5, .LBB29_184
// %bb.183:
	ldr	x10, [x24]
	mov	x9, x20
	tbz	w10, #26, .LBB29_185
.LBB29_184:
	lsl	x9, x20, #8
	and	x9, x20, x9, asr #8
.LBB29_185:
	//APP
		adds	x9, x9, 4
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_1404
// %bb.186:
	lsl	x8, x20, #8
	ldr	x10, [x24, #64]
	and	x11, x20, x8, asr #8
	adrp	x8, arm64_const_caps_ready
	//APP
		bics	xzr, x11, x10
	csel	x9, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w10, [x8, :lo12:arm64_const_caps_ready]
	cmp	w10, #1                 // =1
	b.lt	.LBB29_1396
// %bb.187:
	adrp	x10, cpu_hwcap_keys
	add	x10, x10, :lo12:cpu_hwcap_keys
	ldr	w10, [x10, #16]
	cmp	w10, #0                 // =0
	b.le	.LBB29_1397
.LBB29_188:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1398
.LBB29_189:
	mov	w8, #26134
	movk	w8, #49161, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_409
// %bb.190:
	mov	w8, #62728
	movk	w8, #49168, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.191:
	ldr	x22, [x19, #32]
	mov	w0, #21
	ldr	x8, [x22, #40]
	ldr	x21, [x8, #1104]
	bl	capable
	tbz	w0, #0, .LBB29_547
// %bb.192:
	ldrh	w8, [x22]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_202
// %bb.193:
	ldr	x8, [x22, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB29_202
// %bb.194:
	ldr	x8, [x21]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_672
// %bb.195:
	//APP
	mrs x25, sp_el0
	//NO_APP
	ldrb	w9, [x25, #110]
	ldr	x8, [x25, #64]
	tbnz	w9, #5, .LBB29_197
// %bb.196:
	ldr	x10, [x25]
	mov	x9, x20
	tbz	w10, #26, .LBB29_198
.LBB29_197:
	lsl	x9, x20, #8
	and	x9, x20, x9, asr #8
.LBB29_198:
	//APP
		adds	x9, x9, 16
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_1552
// %bb.199:
	lsl	x9, x20, #8
	add	x0, sp, #104            // =104
	mov	w2, #16
	ldr	x8, [x25, #64]
	and	x27, x20, x9, asr #8
	//APP
		bics	xzr, x27, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1553
// %bb.200:
	ldr	x8, [sp, #104]
	tst	x8, #0xfff
	b.ne	.LBB29_202
// %bb.201:
	ldr	x9, [sp, #112]
	tst	x9, #0xfff
	b.eq	.LBB29_766
.LBB29_202:
	mov	w26, #-22
	sxtw	x21, w26
	b	.LBB29_577
.LBB29_203:
	mov	w8, #26136
	movk	w8, #49216, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_411
// %bb.204:
	mov	w8, #26137
	movk	w8, #49216, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.205:
	ldr	x8, [x19, #32]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2180]
	tbz	w8, #0, .LBB29_492
// %bb.206:
	mov	x0, x19
	mov	x1, x20
	bl	fscrypt_ioctl_remove_key_all_users
	b	.LBB29_576
.LBB29_207:
	mov	w8, #26246
	movk	w8, #49156, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_421
// %bb.208:
	mov	w8, #62751
	movk	w8, #49156, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.209:
	mov	x0, x19
	mov	x1, x20
	bl	f2fs_ioc_set_hp_file
	b	.LBB29_576
.LBB29_210:
	mov	w8, #62772
	movk	w8, #16388, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_445
// %bb.211:
	mov	w8, #62795
	movk	w8, #16388, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.212:
	ldr	x0, [x19, #32]
	ldr	x8, [x0, #40]
	ldr	x19, [x8, #1104]
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_507
// %bb.213:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_215
// %bb.214:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_216
.LBB29_215:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_216:
	//APP
		adds	x10, x10, 4
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1443
// %bb.217:
	lsl	x9, x20, #8
	ldr	x11, [x8, #64]
	and	x12, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x12, x11
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w11, [x9, :lo12:arm64_const_caps_ready]
	cmp	w11, #1                 // =1
	b.lt	.LBB29_1435
// %bb.218:
	adrp	x11, cpu_hwcap_keys
	add	x11, x11, :lo12:cpu_hwcap_keys
	ldr	w11, [x11, #16]
	cmp	w11, #0                 // =0
	b.le	.LBB29_1436
.LBB29_219:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1437
.LBB29_220:
	mov	w8, #62792
	movk	w8, #16396, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_454
// %bb.221:
	mov	w8, #26132
	movk	w8, #16400, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.222:
	ldr	x8, [x19, #32]
	ldr	x8, [x8, #40]
	ldr	x22, [x8, #1104]
	ldr	x8, [x22, #16]
	ldrb	w8, [x8, #2180]
	tbnz	w8, #0, .LBB29_548
// %bb.223:
	mov	w23, #-95
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_224:
	mov	w8, #62771
	movk	w8, #16392, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_466
// %bb.225:
	mov	w8, #62775
	movk	w8, #16392, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.226:
	ldr	x22, [x19, #32]
	ldr	x8, [x22, #40]
	ldr	x24, [x8, #1104]
	ldr	x8, [x24, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB29_1192
// %bb.227:
	ldr	x8, [x24]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_536
// %bb.228:
	mov	x0, x22
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_508
// %bb.229:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_231
// %bb.230:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_232
.LBB29_231:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_232:
	//APP
		adds	x10, x10, 8
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1499
// %bb.233:
	lsl	x9, x20, #8
	add	x0, sp, #136            // =136
	mov	w2, #8
	ldr	x8, [x8, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1505
// %bb.234:
	ldr	w0, [sp, #136]
	bl	__fdget_pos
	ands	x20, x0, #0xfffffffffffffffc
	b.eq	.LBB29_247
// %bb.235:
	ldr	x8, [x20, #32]
	mov	x21, x0
	ldr	x9, [x22, #40]
	ldr	x10, [x8, #40]
	cmp	x9, x10
	b.eq	.LBB29_673
// %bb.236:
	ldr	x3, [x22, #64]
	adrp	x1, .L.str.86
	ldr	x4, [x8, #64]
	adrp	x2, .L__func__.f2fs_ioc_clone_file
	add	x1, x1, :lo12:.L.str.86
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_clone_file
	mov	x0, x24
	bl	f2fs_printk
	mov	w25, #-22
	tbz	w21, #1, .LBB29_686
	b	.LBB29_685
.LBB29_237:
	mov	w8, #26245
	movk	w8, #16512, lsl #16
	cmp	w1, w8
	b.eq	.LBB29_481
// %bb.238:
	mov	w8, #37938
	movk	w8, #16640, lsl #16
	cmp	w1, w8
	b.ne	.LBB29_577
// %bb.239:
	ldr	x8, [x19, #32]
	mov	w0, #21
	ldr	x8, [x8, #40]
	ldr	x21, [x8, #1104]
	bl	capable
	tbz	w0, #0, .LBB29_392
// %bb.240:
	mov	x0, x20
	mov	w1, #256
	bl	strndup_user
	mov	x20, x0
	cmn	x0, #4095               // =4095
	b.lo	.LBB29_600
// %bb.241:
	mov	w22, w20
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_242:
	ldr	x27, [x19, #32]
	ldr	x8, [x27, #40]
	ldr	x21, [x8, #1104]
	ldr	x8, [x21, #16]
	ldrb	w8, [x8, #2181]
	tbnz	w8, #5, .LBB29_510
// %bb.243:
	mov	w24, #-95
	sxtw	x21, w24
	b	.LBB29_577
.LBB29_244:
	ldr	x22, [x19, #32]
	ldr	x8, [x22, #40]
	ldr	x21, [x8, #1104]
	ldr	x8, [x21, #16]
	ldrb	w8, [x8, #2181]
	tbz	w8, #5, .LBB29_259
// %bb.245:
	ldr	w8, [x21, #1532]
	cmp	w8, #1                  // =1
	b.ne	.LBB29_259
// %bb.246:
	ldrb	w8, [x19, #68]
	tbnz	w8, #1, .LBB29_624
.LBB29_247:
	mov	w25, #-9
	sxtw	x21, w25
	b	.LBB29_577
.LBB29_248:
	ldr	x22, [x19, #32]
	ldr	x8, [x22, #40]
	ldr	x21, [x8, #1104]
	ldr	x8, [x21, #16]
	ldrb	w8, [x8, #2181]
	tbz	w8, #5, .LBB29_259
// %bb.249:
	ldrh	w8, [x22]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_626
// %bb.250:
	ldr	x8, [x22, #712]
	tbz	w8, #31, .LBB29_626
// %bb.251:
	ldr	x8, [x21]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_536
// %bb.252:
	mov	x0, x22
	bl	dquot_initialize
	mov	w25, w0
	add	w8, w0, #28             // =28
	cmp	w8, #28                 // =28
	b.hi	.LBB29_254
// %bb.253:
	mov	w10, #1
	mov	w9, #1
	movk	w10, #4224, lsl #16
	lsl	w8, w9, w8
	tst	w8, w10
	b.ne	.LBB29_255
.LBB29_254:
	cmn	w25, #122               // =122
	b.ne	.LBB29_1352
.LBB29_255:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w25, w0
	cbnz	w0, .LBB29_1352
// %bb.256:
	ldr	w8, [x22, #1256]
	cbz	w8, .LBB29_924
// %bb.257:
	mov	x0, x19
	bl	mnt_drop_write_file
	mov	w13, wzr
	b	.LBB29_1081
.LBB29_258:
	ldr	x22, [x19, #32]
	ldr	x8, [x22, #40]
	ldr	x21, [x8, #1104]
	ldr	x8, [x21, #16]
	ldrb	w8, [x8, #2181]
	tbnz	w8, #5, .LBB29_516
.LBB29_259:
	mov	w25, #-95
	sxtw	x21, w25
	b	.LBB29_577
.LBB29_260:
	ldr	x21, [x19, #32]
	stur	xzr, [x29, #-144]
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	x9, [x8, #224]
	ldrb	w9, [x9, #132]
	tbnz	w9, #3, .LBB29_1074
// %bb.261:
	ldr	x8, [x8, #16]
	ldrsh	w8, [x8, #2180]
	tbz	w8, #31, .LBB29_492
// %bb.262:
	ldr	x8, [x21, #712]
	tbz	w8, #26, .LBB29_492
// %bb.263:
	ldrsw	x8, [x21, #1160]
	add	x8, x8, #360            // =360
	cmp	x8, #400                // =400
	b.lo	.LBB29_492
// %bb.264:
	add	x19, x21, #160          // =160
	mov	x0, x19
	bl	down_write
	ldr	x8, [x21, #712]
	tbnz	x8, #43, .LBB29_689
// %bb.265:
	sturh	wzr, [x29, #-144]
	b	.LBB29_693
.LBB29_266:
	ldr	x21, [x19, #32]
	ldr	x8, [x21, #40]
	ldr	x20, [x8, #1104]
	ldr	x8, [x20, #16]
	ldrb	w8, [x8, #2181]
	tbz	w8, #5, .LBB29_495
// %bb.267:
	ldr	w8, [x20, #1532]
	cmp	w8, #1                  // =1
	b.ne	.LBB29_495
// %bb.268:
	ldrb	w8, [x19, #68]
	tbz	w8, #1, .LBB29_583
// %bb.269:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_622
// %bb.270:
	ldr	w26, [x20, #1188]
	ldr	w27, [x21, #1268]
	ldr	x8, [x21, #712]
	tbz	w8, #31, .LBB29_622
// %bb.271:
	ldr	x8, [x21, #712]
	tbnz	w8, #10, .LBB29_760
// %bb.272:
	mov	x0, x21
	bl	dquot_initialize
	mov	w23, w0
	add	w8, w0, #28             // =28
	cmp	w8, #28                 // =28
	b.hi	.LBB29_274
// %bb.273:
	mov	w10, #1
	mov	w9, #1
	movk	w10, #4224, lsl #16
	lsl	w8, w9, w8
	tst	w8, w10
	b.ne	.LBB29_275
.LBB29_274:
	cmn	w23, #122               // =122
	b.ne	.LBB29_907
.LBB29_275:
	ldr	x8, [x21, #40]
	mov	w1, #1
	ldr	x0, [x8, #1104]
	bl	f2fs_balance_fs
	ldr	x8, [x19, #32]
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_277
// %bb.276:
	ldr	x0, [x8, #40]
	mov	w1, #1
	mov	w2, #1
	bl	__sb_start_write
.LBB29_277:
	add	x22, x21, #160          // =160
	mov	x0, x22
	bl	down_write
	ldr	x8, [x21, #712]
	tbnz	x8, #43, .LBB29_932
// %bb.278:
	ldr	x8, [x21, #712]
	tbz	x8, #35, .LBB29_280
// %bb.279:
	mov	w1, #9
	mov	x0, x21
	bl	f2fs_reserve_compress_blocks_internal
	mov	w23, w0
	cbnz	w0, .LBB29_1096
.LBB29_280:
	mov	x0, x21
	bl	f2fs_is_compress_backend_ready
	tbz	w0, #0, .LBB29_1040
// %bb.281:
	ldr	x8, [x21, #712]
	tbnz	x8, #33, .LBB29_1095
// %bb.282:
	ldr	x0, [x21, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w23, w0
	cbnz	w0, .LBB29_1096
// %bb.283:
	ldr	w8, [x21, #1256]
	cbz	w8, .LBB29_1511
// %bb.284:
	ldr	x8, [x21, #80]
	add	x8, x8, #4095           // =4095
	lsr	x28, x8, #12
	cbz	w28, .LBB29_1520
// %bb.285:
	mov	x24, xzr
	b	.LBB29_1036
.LBB29_286:
	ldr	x0, [x19, #32]
	bl	f2fs_precache_extents
	b	.LBB29_576
.LBB29_287:
	ldr	x20, [x19, #32]
	mov	x0, x20
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_438
// %bb.288:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w22, w0
	cbnz	w0, .LBB29_703
// %bb.289:
	add	x21, x20, #160          // =160
	mov	x0, x21
	bl	down_write
	ldr	x8, [x20, #712]
	sxth	w8, w8
	tbz	w8, #31, .LBB29_291
// %bb.290:
	mov	x0, x20
	bl	f2fs_drop_inmem_pages
.LBB29_291:
	ldr	x8, [x20, #712]
	tbnz	w8, #17, .LBB29_658
// %bb.292:
	mov	w22, wzr
	b	.LBB29_659
.LBB29_293:
	ldr	x20, [x19, #32]
	mov	x0, x20
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_438
// %bb.294:
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_585
// %bb.295:
	ldrb	w8, [x19, #66]
	tbnz	w8, #0, .LBB29_585
// %bb.296:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w22, w0
	cbnz	w0, .LBB29_703
// %bb.297:
	add	x21, x20, #160          // =160
	mov	x0, x21
	bl	down_write
	ldr	x8, [x20, #712]
	tbz	x8, #35, .LBB29_299
// %bb.298:
	mov	x0, x20
	mov	w1, #3
	bl	f2fs_reserve_compress_blocks_internal
	mov	w22, w0
	cbnz	w0, .LBB29_665
.LBB29_299:
	ldr	x8, [x20, #712]
	tbz	x8, #49, .LBB29_301
// %bb.300:
	mov	x0, x20
	mov	w1, #1
	add	x8, x20, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB29_301:
	ldr	x8, [x20, #712]
	tbz	x8, #43, .LBB29_305
// %bb.302:
	ldr	x8, [x20, #712]
	tbz	x8, #43, .LBB29_304
// %bb.303:
	ldr	x8, [x20, #712]
	tbnz	x8, #44, .LBB29_305
.LBB29_304:
	adrp	x1, .L__func__.f2fs_ioc_start_volatile_write
	mov	x0, x20
	add	x1, x1, :lo12:.L__func__.f2fs_ioc_start_volatile_write
	bl	f2fs_revoke_deduped_inode
	mov	w22, w0
	cbnz	w0, .LBB29_665
.LBB29_305:
	ldr	x8, [x20, #712]
	tbnz	w8, #17, .LBB29_758
// %bb.306:
	mov	x0, x20
	bl	f2fs_convert_inline_inode
	mov	w22, w0
	cbnz	w0, .LBB29_665
// %bb.307:
	ldr	x8, [x20, #40]
	ldr	x8, [x8, #1104]
	add	x8, x8, #2128           // =2128
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x20, #40]
	ldr	x8, [x8, #1104]
	ldr	w9, [x8, #2128]
	ldr	w10, [x8, #2136]
	cmp	w9, w10
	b.le	.LBB29_309
// %bb.308:
	str	w9, [x8, #2136]
.LBB29_309:
	add	x8, x20, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 131072
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x20, #40]
	adrp	x9, jiffies
	mov	w22, wzr
	ldr	x8, [x8, #1104]
	ldr	x9, [x9, :lo12:jiffies]
	stp	x9, x9, [x8, #504]
	str	x9, [x8, #520]
	b	.LBB29_665
.LBB29_310:
	ldr	x21, [x19, #32]
	mov	x0, x21
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_438
// %bb.311:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w22, w0
	cbnz	w0, .LBB29_703
// %bb.312:
	add	x20, x21, #160          // =160
	mov	x0, x20
	bl	down_write
	ldr	x8, [x21, #712]
	tbnz	w8, #17, .LBB29_660
// %bb.313:
	mov	w22, wzr
	b	.LBB29_700
.LBB29_314:
	ldr	x20, [x19, #32]
	mov	x0, x20
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_438
// %bb.315:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w22, w0
	cbnz	w0, .LBB29_703
// %bb.316:
	ldr	x8, [x20, #40]
	mov	w1, #1
	ldr	x0, [x8, #1104]
	bl	f2fs_balance_fs
	add	x21, x20, #160          // =160
	mov	x0, x21
	bl	down_write
	ldr	x8, [x20, #712]
	tbnz	w8, #17, .LBB29_662
// %bb.317:
	ldr	x8, [x20, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB29_719
// %bb.318:
	mov	x0, x19
	mov	x1, xzr
	mov	x2, #9223372036854775807
	mov	w3, #1
	mov	w4, wzr
	bl	f2fs_do_sync_file
	mov	w22, w0
	b	.LBB29_663
.LBB29_319:
	ldr	x22, [x19, #32]
	ldr	x8, [x22, #40]
	ldr	x20, [x8, #1104]
	ldr	x8, [x20, #16]
	ldrb	w8, [x8, #2181]
	tbz	w8, #5, .LBB29_495
// %bb.320:
	ldr	w8, [x20, #1532]
	cmp	w8, #1                  // =1
	b.ne	.LBB29_495
// %bb.321:
	ldrb	w8, [x19, #68]
	tbz	w8, #1, .LBB29_583
// %bb.322:
	ldrh	w8, [x22]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_622
// %bb.323:
	ldr	w26, [x20, #1188]
	ldr	w27, [x22, #1268]
	ldr	x8, [x22, #712]
	tbz	w8, #31, .LBB29_622
// %bb.324:
	mov	x0, x20
	mov	w1, #1
	bl	f2fs_balance_fs
	ldr	x8, [x19, #32]
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_326
// %bb.325:
	ldr	x0, [x8, #40]
	mov	w1, #1
	mov	w2, #1
	bl	__sb_start_write
.LBB29_326:
	add	x21, x22, #160          // =160
	mov	x0, x21
	bl	down_write
	add	x23, x20, #368          // =368
	mov	x0, x23
	bl	_raw_spin_lock
	ldr	x8, [x20, #352]
	cbz	x8, .LBB29_328
// %bb.327:
	adrp	x24, jiffies
	ldr	x8, [x20, #360]
	ldr	x9, [x24, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB29_1094
.LBB29_328:
	mov	x0, x23
	bl	_raw_spin_unlock
	add	x23, x20, #304          // =304
	mov	x0, x23
	bl	down_read
	mov	x0, x22
	bl	f2fs_drop_extent_tree
	mov	x0, x23
	bl	up_read
	ldr	x8, [x22, #712]
	tbnz	x8, #43, .LBB29_739
// %bb.329:
	mov	x0, x22
	bl	f2fs_is_compress_backend_ready
	tbz	w0, #0, .LBB29_761
// %bb.330:
	ldr	x8, [x22, #712]
	tbnz	x8, #33, .LBB29_913
// %bb.331:
	ldr	x0, [x22, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w23, w0
	cbnz	w0, .LBB29_914
// %bb.332:
	add	x11, x22, #712          // =712
	mov	x8, #17179869184
	str	x11, [sp, #88]          // 8-byte Folded Spill
	//APP
	// atomic64_or
	prfm	pstl1strm, [x11]
1:	ldxr	x9, [x11]
	orr	x9, x9, x8
	stxr	w10, x9, [x11]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x22, #80]
	add	x8, x8, #4095           // =4095
	lsr	x28, x8, #12
	cbz	w28, .LBB29_1270
// %bb.333:
	mov	x24, xzr
	b	.LBB29_770
.LBB29_334:
	ldr	x22, [x19, #32]
	ldr	x8, [x22, #40]
	ldr	x20, [x8, #1104]
	ldr	x8, [x20, #16]
	ldrb	w8, [x8, #2181]
	tbz	w8, #5, .LBB29_495
// %bb.335:
	ldr	w8, [x20, #1532]
	cmp	w8, #1                  // =1
	b.ne	.LBB29_495
// %bb.336:
	ldrb	w8, [x19, #68]
	tbz	w8, #1, .LBB29_583
// %bb.337:
	ldrh	w8, [x22]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_622
// %bb.338:
	ldr	w26, [x20, #1188]
	ldr	w27, [x22, #1268]
	ldr	x8, [x22, #712]
	tbz	w8, #31, .LBB29_622
// %bb.339:
	mov	x0, x20
	mov	w1, #1
	bl	f2fs_balance_fs
	ldr	x8, [x19, #32]
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_341
// %bb.340:
	ldr	x0, [x8, #40]
	mov	w1, #1
	mov	w2, #1
	bl	__sb_start_write
.LBB29_341:
	add	x21, x22, #160          // =160
	mov	x0, x21
	bl	down_write
	ldr	x8, [x22, #712]
	tbnz	x8, #43, .LBB29_739
// %bb.342:
	mov	x0, x22
	bl	f2fs_is_compress_backend_ready
	tbz	w0, #0, .LBB29_761
// %bb.343:
	ldr	x8, [x22, #712]
	tbnz	x8, #33, .LBB29_913
// %bb.344:
	ldr	x0, [x22, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w23, w0
	cbnz	w0, .LBB29_914
// %bb.345:
	ldr	w8, [x22, #1256]
	cbz	w8, .LBB29_1228
// %bb.346:
	ldr	x8, [x22, #80]
	add	x8, x8, #4095           // =4095
	lsr	x28, x8, #12
	cbz	w28, .LBB29_1387
// %bb.347:
	mov	x24, xzr
	b	.LBB29_910
.LBB29_348:
	ldr	x19, [x19, #32]
	ldr	x8, [x19, #40]
	ldr	x20, [x8, #1104]
	ldr	x8, [x20, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB29_1074
// %bb.349:
	ldr	x8, [x20]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_506
// %bb.350:
	mov	x0, x19
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_507
// %bb.351:
	ldrh	w8, [x19]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_623
// %bb.352:
	ldr	x8, [x20, #16]
	ldrsh	w8, [x8, #2180]
	tbz	w8, #31, .LBB29_492
// %bb.353:
	ldr	x8, [x19, #712]
	tbz	w8, #26, .LBB29_492
// %bb.354:
	ldrsw	x8, [x19, #1160]
	add	x8, x8, #360            // =360
	cmp	x8, #400                // =400
	b.lo	.LBB29_492
// %bb.355:
	ldr	x8, [x19, #712]
	tbnz	w8, #10, .LBB29_623
// %bb.356:
	mov	x0, x20
	mov	x1, x19
	mov	w2, #1
	bl	f2fs_inode_param_check
	b	.LBB29_576
.LBB29_357:
	ldr	x8, [x19, #32]
	mov	w0, #21
	ldr	x8, [x8, #40]
	ldr	x20, [x8, #1104]
	bl	capable
	tbz	w0, #0, .LBB29_408
// %bb.358:
	ldr	x8, [x20]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_599
// %bb.359:
	ldr	x8, [x20, #80]
	tbnz	w8, #8, .LBB29_1496
// %bb.360:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w21, w0
	cbnz	w0, .LBB29_612
// %bb.361:
	ldr	x0, [x20]
	mov	w1, #1
	bl	f2fs_sync_fs
	mov	w21, w0
.LBB29_362:
	mov	x0, x19
	bl	mnt_drop_write_file
	b	.LBB29_612
.LBB29_363:
	ldr	x8, [x19, #32]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldr	x9, [x8, #16]
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	w11, [x9, #2180]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_365
// %bb.364:
	ldr	x12, [x8]
	mov	x10, x20
	tbz	w12, #26, .LBB29_366
.LBB29_365:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_366:
	//APP
		adds	x10, x10, 4
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_597
// %bb.367:
	lsl	x9, x20, #8
	ldr	x12, [x8, #64]
	and	x13, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x13, x12
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	orr	w11, w11, #0x4
	ldr	w12, [x9, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB29_1279
// %bb.368:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB29_1280
.LBB29_369:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1281
.LBB29_370:
	ldr	x8, [x19, #32]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2180]
	tbz	w8, #0, .LBB29_492
// %bb.371:
	mov	x0, x19
	mov	x1, x20
	bl	fscrypt_ioctl_add_key
	b	.LBB29_576
.LBB29_372:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_374
// %bb.373:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_375
.LBB29_374:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_375:
	//APP
		adds	x10, x10, 4
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_597
// %bb.376:
	lsl	x9, x20, #8
	ldr	x11, [x8, #64]
	and	x12, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x12, x11
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w11, [x9, :lo12:arm64_const_caps_ready]
	cmp	w11, #1                 // =1
	b.lt	.LBB29_1286
// %bb.377:
	adrp	x11, cpu_hwcap_keys
	add	x11, x11, :lo12:cpu_hwcap_keys
	ldr	w11, [x11, #16]
	cmp	w11, #0                 // =0
	b.le	.LBB29_1287
.LBB29_378:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1288
.LBB29_379:
	ldr	x21, [x19, #32]
	add	x19, x21, #160          // =160
	mov	x0, x19
	bl	down_write
	ldr	x21, [x21, #712]
	mov	x0, x19
	bl	up_write
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_381
// %bb.380:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_382
.LBB29_381:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_382:
	//APP
		adds	x10, x10, 1
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_597
// %bb.383:
	lsl	x9, x20, #8
	ldr	x11, [x8, #64]
	and	x12, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x12, x11
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ubfx	x11, x21, #35, #1
	ldr	w12, [x9, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB29_1300
// %bb.384:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB29_1301
.LBB29_385:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1302
.LBB29_386:
	ldr	x21, [x19, #32]
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2181]
	tbz	w8, #5, .LBB29_492
// %bb.387:
	add	x19, x21, #160          // =160
	mov	x0, x19
	bl	down_read
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_389
// %bb.388:
	ldr	x8, [x21, #712]
	tbnz	w8, #31, .LBB29_666
.LBB29_389:
	mov	x0, x19
	bl	up_read
	mov	x21, #-61
	b	.LBB29_577
.LBB29_390:
	ldr	x8, [x19, #32]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2180]
	tbz	w8, #0, .LBB29_492
// %bb.391:
	mov	x0, x19
	mov	x1, x20
	bl	fscrypt_ioctl_get_nonce
	b	.LBB29_576
.LBB29_392:
	mov	w22, #-1
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_393:
	ldr	x8, [x19, #32]
	mov	w0, #21
	ldr	x8, [x8, #40]
	ldr	x19, [x8, #1104]
	bl	capable
	tbz	w0, #0, .LBB29_571
// %bb.394:
	ldr	x8, [x19]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_506
// %bb.395:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_397
// %bb.396:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_398
.LBB29_397:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_398:
	//APP
		adds	x10, x10, 8
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1497
// %bb.399:
	lsl	x9, x20, #8
	sub	x0, x29, #144           // =144
	mov	w2, #8
	ldr	x8, [x8, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1500
// %bb.400:
	ldur	x1, [x29, #-144]
	mov	x0, x19
	bl	f2fs_resize_fs
	b	.LBB29_576
.LBB29_401:
	ldr	x22, [x19, #32]
	mov	w0, #21
	ldr	x23, [x22, #40]
	ldr	x8, [x23, #248]
	ldr	x8, [x8, #128]
	ldr	x24, [x8, #1280]
	bl	capable
	tbz	w0, #0, .LBB29_408
// %bb.402:
	ldr	x10, [x23, #1104]
	ldr	w8, [x10, #3024]
	cmp	w8, #2                  // =2
	b.lt	.LBB29_603
// %bb.403:
	ldr	x10, [x10, #3032]
	mov	x9, xzr
	mov	w21, #-95
	b	.LBB29_405
.LBB29_404:                             //   in Loop: Header=BB29_405 Depth=1
	add	x9, x9, #1              // =1
	add	x10, x10, #192          // =192
	cmp	x9, x8
	b.eq	.LBB29_612
.LBB29_405:                             // =>This Inner Loop Header: Depth=1
	ldr	x11, [x10]
	ldr	x11, [x11, #128]
	ldr	x11, [x11, #1280]
	ldr	x12, [x11, #504]
	tbnz	w12, #11, .LBB29_606
// %bb.406:                             //   in Loop: Header=BB29_405 Depth=1
	cbz	x11, .LBB29_404
// %bb.407:                             //   in Loop: Header=BB29_405 Depth=1
	ldr	w11, [x11, #1740]
	sub	w11, w11, #1            // =1
	cmp	w11, #2                 // =2
	b.hs	.LBB29_404
	b	.LBB29_606
.LBB29_408:
	mov	w21, #-1
	sxtw	x21, w21
	b	.LBB29_577
.LBB29_409:
	ldr	x8, [x19, #32]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2180]
	tbz	w8, #0, .LBB29_492
// %bb.410:
	mov	x0, x19
	mov	x1, x20
	bl	fscrypt_ioctl_get_policy_ex
	b	.LBB29_576
.LBB29_411:
	ldr	x8, [x19, #32]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2180]
	tbz	w8, #0, .LBB29_492
// %bb.412:
	mov	x0, x19
	mov	x1, x20
	bl	fscrypt_ioctl_remove_key
	b	.LBB29_576
.LBB29_413:
	ldr	x19, [x19, #32]
	sub	x0, x29, #144           // =144
	mov	w1, wzr
	mov	w2, #28
	ldr	w8, [x19, #680]
	lsr	w10, w8, #3
	lsr	w9, w8, #6
	lsr	w11, w8, #1
	and	w12, w11, #0x8
	and	w13, w11, #0x10
	and	w11, w11, #0x40
	bfi	w12, w10, #5, #1
	orr	w10, w12, w13
	lsr	w8, w8, #20
	bfi	w10, w9, #7, #1
	orr	w9, w10, w11
	and	w8, w8, #0x200
	orr	w21, w9, w8
	bl	memset
	ldr	x8, [x19, #40]
	stur	w21, [x29, #-144]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2180]
	tbz	w8, #4, .LBB29_415
// %bb.414:
	ldr	w1, [x19, #1164]
	adrp	x0, init_user_ns
	add	x0, x0, :lo12:init_user_ns
	bl	from_kprojid
	stur	w0, [x29, #-132]
.LBB29_415:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_417
// %bb.416:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_418
.LBB29_417:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_418:
	mov	x21, #-14
	//APP
		adds	x10, x10, 28
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_577
// %bb.419:
	lsl	x9, x20, #8
	sub	x1, x29, #144           // =144
	mov	w2, #28
	ldr	x8, [x8, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x0, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
.LBB29_420:
	bl	__arch_copy_to_user
	cmp	x0, #0                  // =0
	csel	x21, xzr, x21, eq
	b	.LBB29_577
.LBB29_421:
	ldr	x8, [x19, #32]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2181]
	tbz	w8, #2, .LBB29_492
// %bb.422:
	mov	x0, x19
	mov	x1, x20
	bl	fsverity_ioctl_measure
	b	.LBB29_576
.LBB29_423:
	ldr	x21, [x19, #32]
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_425
// %bb.424:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_426
.LBB29_425:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_426:
	//APP
		adds	x10, x10, 4
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1315
// %bb.427:
	lsl	x9, x20, #8
	ldr	x11, [x8, #64]
	and	x12, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x12, x11
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w11, [x9, :lo12:arm64_const_caps_ready]
	cmp	w11, #1                 // =1
	b.lt	.LBB29_1307
// %bb.428:
	adrp	x11, cpu_hwcap_keys
	add	x11, x11, :lo12:cpu_hwcap_keys
	ldr	w11, [x11, #16]
	cmp	w11, #0                 // =0
	b.le	.LBB29_1308
.LBB29_429:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1309
.LBB29_430:
	ldr	x21, [x19, #32]
	mov	x0, x21
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_438
// %bb.431:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_433
// %bb.432:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_434
.LBB29_433:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_434:
	//APP
		adds	x10, x10, 4
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1487
// %bb.435:
	lsl	x10, x20, #8
	ldr	x9, [x8, #64]
	and	x12, x20, x10, asr #8
	adrp	x10, arm64_const_caps_ready
	//APP
		bics	xzr, x12, x9
	csel	x11, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w9, [x10, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	adrp	x9, cpu_hwcap_keys
	add	x9, x9, :lo12:cpu_hwcap_keys
	b.lt	.LBB29_1448
// %bb.436:
	ldr	w12, [x9, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB29_1449
.LBB29_437:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1450
.LBB29_438:
	mov	w22, #-13
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_439:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_441
// %bb.440:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_442
.LBB29_441:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_442:
	//APP
		adds	x10, x10, 24
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1193
// %bb.443:
	lsl	x9, x20, #8
	sub	x0, x29, #144           // =144
	mov	w2, #24
	ldr	x8, [x8, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1200
// %bb.444:
	sub	x1, x29, #144           // =144
	mov	x0, x19
	bl	__f2fs_ioc_gc_range
	b	.LBB29_576
.LBB29_445:
	ldr	x20, [x19, #32]
	ldr	x8, [x20, #40]
	ldr	x21, [x8, #1104]
	ldr	x8, [x21, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB29_1194
// %bb.446:
	ldr	x8, [x21]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_580
// %bb.447:
	mov	x0, x20
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_614
// %bb.448:
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_627
// %bb.449:
	ldr	x8, [x21, #16]
	ldrsh	w8, [x8, #2180]
	tbz	w8, #31, .LBB29_639
// %bb.450:
	ldr	x8, [x20, #712]
	tbz	w8, #26, .LBB29_639
// %bb.451:
	ldrsw	x8, [x20, #1160]
	add	x8, x8, #360            // =360
	cmp	x8, #400                // =400
	b.lo	.LBB29_639
// %bb.452:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w21, w0
	cbnz	w0, .LBB29_612
// %bb.453:
	add	x22, x20, #160          // =160
	mov	x0, x22
	bl	down_write
	adrp	x1, .L__func__.f2fs_ioc_dedup_revoke
	mov	x0, x20
	add	x1, x1, :lo12:.L__func__.f2fs_ioc_dedup_revoke
	bl	f2fs_revoke_deduped_inode
	mov	w21, w0
	mov	x0, x22
	bl	up_write
	b	.LBB29_362
.LBB29_454:
	ldr	x21, [x19, #32]
	ldr	x8, [x21, #40]
	mov	x0, x21
	ldr	x22, [x8, #1104]
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_572
// %bb.455:
	//APP
	mrs x25, sp_el0
	//NO_APP
	ldrb	w9, [x25, #110]
	ldr	x8, [x25, #64]
	tbnz	w9, #5, .LBB29_457
// %bb.456:
	ldr	x10, [x25]
	mov	x9, x20
	tbz	w10, #26, .LBB29_458
.LBB29_457:
	lsl	x9, x20, #8
	and	x9, x20, x9, asr #8
.LBB29_458:
	//APP
		adds	x9, x9, 12
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_1382
// %bb.459:
	lsl	x9, x20, #8
	sub	x0, x29, #144           // =144
	mov	w2, #12
	ldr	x8, [x25, #64]
	and	x26, x20, x9, asr #8
	//APP
		bics	xzr, x26, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1383
// %bb.460:
	ldr	w8, [x22, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB29_495
// %bb.461:
	ldr	x8, [x22, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB29_495
// %bb.462:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_622
// %bb.463:
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_722
// %bb.464:
	mov	x0, x19
	bl	mnt_want_write_file
	cbz	w0, .LBB29_762
// %bb.465:
	mov	w23, w0
	adrp	x1, .L.str.45
	add	x1, x1, :lo12:.L.str.45
	mov	x0, x22
	mov	w2, w23
	bl	f2fs_printk
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_466:
	ldr	x24, [x19, #32]
	ldr	x8, [x24, #40]
	ldr	x27, [x8, #1104]
	ldr	x8, [x27, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB29_1075
// %bb.467:
	ldr	x8, [x27]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_493
// %bb.468:
	mov	x0, x24
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_579
// %bb.469:
	ldr	x8, [x27, #16]
	ldrsh	w8, [x8, #2180]
	tbz	w8, #31, .LBB29_584
// %bb.470:
	ldr	x8, [x24, #712]
	tbz	w8, #26, .LBB29_584
// %bb.471:
	ldrsw	x8, [x24, #1160]
	add	x8, x8, #360            // =360
	cmp	x8, #400                // =400
	b.lo	.LBB29_584
// %bb.472:
	//APP
	mrs x25, sp_el0
	//NO_APP
	ldrb	w9, [x25, #110]
	ldr	x8, [x25, #64]
	tbnz	w9, #5, .LBB29_474
// %bb.473:
	ldr	x10, [x25]
	mov	x9, x20
	tbz	w10, #26, .LBB29_475
.LBB29_474:
	lsl	x9, x20, #8
	and	x9, x20, x9, asr #8
.LBB29_475:
	//APP
		adds	x9, x9, 8
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_1878
// %bb.476:
	lsl	x9, x20, #8
	add	x0, sp, #104            // =104
	mov	w2, #8
	ldr	x8, [x25, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1881
// %bb.477:
	ldr	w0, [sp, #104]
	bl	__fdget_pos
	ands	x20, x0, #0xfffffffffffffffc
	b.eq	.LBB29_748
// %bb.478:
	ldr	x26, [x20, #32]
	mov	x21, x0
	ldr	x8, [x24, #40]
	ldr	x9, [x26, #40]
	cmp	x8, x9
	b.eq	.LBB29_921
// %bb.479:
	ldr	x3, [x24, #64]
	adrp	x1, .L.str.76
	ldr	x4, [x26, #64]
	adrp	x2, .L__func__.f2fs_ioc_dedup_file
	add	x1, x1, :lo12:.L.str.76
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_dedup_file
	mov	x0, x27
.LBB29_480:
	bl	f2fs_printk
	mov	w28, #-22
	tbz	w21, #1, .LBB29_1186
	b	.LBB29_1185
.LBB29_481:
	ldr	x8, [x19, #32]
	adrp	x10, jiffies
	ldr	x9, [x8, #40]
	ldr	x9, [x9, #1104]
	ldr	x10, [x10, :lo12:jiffies]
	stp	x10, x10, [x9, #504]
	str	x10, [x9, #520]
	ldr	x9, [x8, #40]
	ldr	x0, [x9, #1104]
	ldr	x9, [x0, #16]
	ldrb	w9, [x9, #2181]
	tbnz	w9, #2, .LBB29_573
// %bb.482:
	ldr	x2, [x8, #64]
	adrp	x1, .L.str.44
	add	x1, x1, :lo12:.L.str.44
	bl	f2fs_printk
	mov	x21, #-95
	b	.LBB29_577
.LBB29_483:
	ldr	x21, [x19, #32]
	mov	x0, x21
	bl	inode_owner_or_capable
	tbz	w0, #0, .LBB29_574
// %bb.484:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_486
// %bb.485:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_487
.LBB29_486:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_487:
	//APP
		adds	x10, x10, 4
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1471
// %bb.488:
	lsl	x9, x20, #8
	ldr	x11, [x8, #64]
	and	x12, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x12, x11
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w11, [x9, :lo12:arm64_const_caps_ready]
	cmp	w11, #1                 // =1
	b.lt	.LBB29_1463
// %bb.489:
	adrp	x11, cpu_hwcap_keys
	add	x11, x11, :lo12:cpu_hwcap_keys
	ldr	w11, [x11, #16]
	cmp	w11, #0                 // =0
	b.le	.LBB29_1464
.LBB29_490:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1465
.LBB29_491:
	ldr	x8, [x19, #32]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldr	x9, [x8, #16]
	ldrb	w9, [x9, #2180]
	tbnz	w9, #0, .LBB29_575
.LBB29_492:
	mov	x21, #-95
	b	.LBB29_577
.LBB29_493:
	mov	w28, #-30
	sxtw	x21, w28
	b	.LBB29_577
.LBB29_494:
	ldr	x22, [x19, #32]
	ldr	x8, [x22, #40]
	ldr	x21, [x8, #1104]
	ldr	x8, [x21, #16]
	ldrb	w8, [x8, #2181]
	tbnz	w8, #5, .LBB29_582
.LBB29_495:
	mov	w23, #-95
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_496:
	ldr	x8, [x19, #32]
	mov	w11, #1276
	movk	w11, #24577, lsl #16
	orr	w11, w11, #0x1000
	ldr	w9, [x8, #680]
	ldr	w10, [x8, #12]
	ldr	x12, [x8, #712]
	and	w9, w9, w11
	lsr	w11, w10, #16
	lsr	w10, w10, #3
	and	w10, w10, #0x800
	orr	w9, w10, w9
	bfi	w9, w11, #20, #1
	tbnz	w12, #10, .LBB29_498
// %bb.497:
	ldr	x10, [x8, #712]
	tbz	w10, #11, .LBB29_499
.LBB29_498:
	orr	w9, w9, #0x10000000
.LBB29_499:
	ldr	x10, [x8, #712]
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w12, [x8, #110]
	ldr	x11, [x8, #64]
	tbnz	w12, #5, .LBB29_501
// %bb.500:
	ldr	x13, [x8]
	mov	x12, x20
	tbz	w13, #26, .LBB29_502
.LBB29_501:
	lsl	x12, x20, #8
	and	x12, x20, x12, asr #8
.LBB29_502:
	//APP
		adds	x12, x12, 4
	csel	x11, xzr, x11, hi
	csinv	x12, x12, xzr, cc
	sbcs	xzr, x12, x11
	cset	x12, ls

	//NO_APP
	cbz	x12, .LBB29_509
// %bb.503:
	lsl	x11, x20, #8
	ldr	x13, [x8, #64]
	and	x14, x20, x11, asr #8
	adrp	x11, arm64_const_caps_ready
	//APP
		bics	xzr, x14, x13
	csel	x12, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	mov	w14, #7422
	ubfx	x10, x10, #5, #27
	ldr	w13, [x11, :lo12:arm64_const_caps_ready]
	movk	w14, #30353, lsl #16
	and	w10, w10, #0x800000
	and	w9, w9, w14
	orr	w9, w10, w9
	cmp	w13, #1                 // =1
	b.lt	.LBB29_1360
// %bb.504:
	adrp	x10, cpu_hwcap_keys
	add	x10, x10, :lo12:cpu_hwcap_keys
	ldr	w10, [x10, #16]
	cmp	w10, #0                 // =0
	b.le	.LBB29_1361
.LBB29_505:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1362
.LBB29_506:
	mov	x21, #-30
	b	.LBB29_577
.LBB29_507:
	mov	x21, #-13
	b	.LBB29_577
.LBB29_508:
	mov	w25, #-13
	sxtw	x21, w25
	b	.LBB29_577
.LBB29_509:
	mov	w8, #-14
	sxtw	x21, w8
	b	.LBB29_577
.LBB29_510:
	ldrh	w8, [x27]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_512
// %bb.511:
	ldr	x8, [x27, #712]
	tbnz	w8, #31, .LBB29_640
.LBB29_512:
	mov	w24, #-22
	sxtw	x21, w24
	b	.LBB29_577
.LBB29_513:
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_515
// %bb.514:
	ldr	x9, [x8, #712]
	tbnz	w9, #31, .LBB29_650
.LBB29_515:
	mov	w9, #-22
	sxtw	x21, w9
	b	.LBB29_577
.LBB29_516:
	ldrh	w8, [x22]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_626
// %bb.517:
	ldr	x8, [x22, #712]
	tbz	w8, #31, .LBB29_626
// %bb.518:
	ldr	x8, [x21]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_536
// %bb.519:
	mov	x0, x22
	bl	dquot_initialize
	mov	w25, w0
	add	w8, w0, #28             // =28
	cmp	w8, #28                 // =28
	b.hi	.LBB29_521
// %bb.520:
	mov	w10, #1
	mov	w9, #1
	movk	w10, #4224, lsl #16
	lsl	w8, w9, w8
	tst	w8, w10
	b.ne	.LBB29_522
.LBB29_521:
	cmn	w25, #122               // =122
	b.ne	.LBB29_1352
.LBB29_522:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w25, w0
	cbnz	w0, .LBB29_1352
// %bb.523:
	ldr	x8, [x22, #40]
	mov	w1, #1
	ldr	x0, [x8, #1104]
	bl	f2fs_balance_fs
	add	x23, x22, #160          // =160
	mov	x0, x23
	bl	down_write
	ldr	w9, [x22, #360]
	ldr	w8, [x19, #68]
	cmp	w9, #1                  // =1
	and	w8, w8, #0x2
	b.eq	.LBB29_525
// %bb.524:
	cbnz	w8, .LBB29_527
.LBB29_525:
	cbz	w9, .LBB29_955
// %bb.526:
	cbnz	w8, .LBB29_955
.LBB29_527:
	mov	w24, wzr
	mov	w25, #-16
.LBB29_528:
	mov	x0, x23
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
	tbnz	w25, #31, .LBB29_926
// %bb.529:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_531
// %bb.530:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_532
.LBB29_531:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_532:
	//APP
		adds	x10, x10, 8
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1260
// %bb.533:
	lsl	x9, x20, #8
	ldr	x11, [x8, #64]
	and	x12, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x12, x11
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	mov	w11, w24
	ldr	w12, [x9, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB29_1929
// %bb.534:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB29_1930
.LBB29_535:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1931
.LBB29_536:
	mov	w25, #-30
	sxtw	x21, w25
	b	.LBB29_577
.LBB29_537:
	mov	w23, #-13
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_538:
	ldr	w8, [x8, #696]
.LBB29_539:
	//APP
	mrs x9, sp_el0
	//NO_APP
	ldrb	w11, [x9, #110]
	ldr	x10, [x9, #64]
	tbnz	w11, #5, .LBB29_541
// %bb.540:
	ldr	x12, [x9]
	mov	x11, x20
	tbz	w12, #26, .LBB29_542
.LBB29_541:
	lsl	x11, x20, #8
	and	x11, x20, x11, asr #8
.LBB29_542:
	//APP
		adds	x11, x11, 4
	csel	x10, xzr, x10, hi
	csinv	x11, x11, xzr, cc
	sbcs	xzr, x11, x10
	cset	x11, ls

	//NO_APP
	cbz	x11, .LBB29_657
// %bb.543:
	lsl	x10, x20, #8
	ldr	x12, [x9, #64]
	and	x13, x20, x10, asr #8
	adrp	x10, arm64_const_caps_ready
	//APP
		bics	xzr, x13, x12
	csel	x11, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w12, [x10, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB29_1272
// %bb.544:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB29_1273
.LBB29_545:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1274
.LBB29_546:
	mov	w23, #-1
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_547:
	mov	w26, #-1
	sxtw	x21, w26
	b	.LBB29_577
.LBB29_548:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w23, w0
	cbnz	w0, .LBB29_907
// %bb.549:
	add	x21, x22, #24           // =24
	mov	x0, x21
	bl	down_write
	ldr	x8, [x22, #16]
	ldrb	w9, [x8, #2185]
	cbnz	w9, .LBB29_565
// %bb.550:
	ldrb	w9, [x8, #2186]
	cbnz	w9, .LBB29_565
// %bb.551:
	ldrb	w9, [x8, #2187]
	cbnz	w9, .LBB29_565
// %bb.552:
	ldrb	w9, [x8, #2188]
	cbnz	w9, .LBB29_565
// %bb.553:
	ldrb	w9, [x8, #2189]
	cbnz	w9, .LBB29_565
// %bb.554:
	ldrb	w9, [x8, #2190]
	cbnz	w9, .LBB29_565
// %bb.555:
	ldrb	w9, [x8, #2191]
	cbnz	w9, .LBB29_565
// %bb.556:
	ldrb	w9, [x8, #2192]
	cbnz	w9, .LBB29_565
// %bb.557:
	ldrb	w9, [x8, #2193]
	cbnz	w9, .LBB29_565
// %bb.558:
	ldrb	w9, [x8, #2194]
	cbnz	w9, .LBB29_565
// %bb.559:
	ldrb	w9, [x8, #2195]
	cbnz	w9, .LBB29_565
// %bb.560:
	ldrb	w9, [x8, #2196]
	cbnz	w9, .LBB29_565
// %bb.561:
	ldrb	w9, [x8, #2197]
	cbnz	w9, .LBB29_565
// %bb.562:
	ldrb	w9, [x8, #2198]
	cbnz	w9, .LBB29_565
// %bb.563:
	ldrb	w9, [x8, #2199]
	cbnz	w9, .LBB29_565
// %bb.564:
	ldrb	w9, [x8, #2200]
	cbz	w9, .LBB29_2001
.LBB29_565:
	//APP
	mrs x9, sp_el0
	//NO_APP
	ldrb	w11, [x9, #110]
	ldr	x10, [x9, #64]
	tbnz	w11, #5, .LBB29_567
// %bb.566:
	ldr	x12, [x9]
	mov	x11, x20
	tbz	w12, #26, .LBB29_568
.LBB29_567:
	lsl	x11, x20, #8
	and	x11, x20, x11, asr #8
.LBB29_568:
	mov	w23, #-14
	//APP
		adds	x11, x11, 16
	csel	x10, xzr, x10, hi
	csinv	x11, x11, xzr, cc
	sbcs	xzr, x11, x10
	cset	x11, ls

	//NO_APP
	cbz	x11, .LBB29_570
// %bb.569:
	lsl	x10, x20, #8
	add	x1, x8, #2185           // =2185
	mov	w2, #16
	ldr	x9, [x9, #64]
	and	x10, x20, x10, asr #8
	//APP
		bics	xzr, x10, x9
	csel	x0, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_to_user
	cmp	x0, #0                  // =0
	csel	w23, wzr, w23, eq
.LBB29_570:
	mov	x0, x21
	b	.LBB29_906
.LBB29_571:
	mov	x21, #-1
	b	.LBB29_577
.LBB29_572:
	mov	w23, #-13
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_573:
	mov	x0, x19
	mov	x1, x20
	bl	fsverity_ioctl_enable
	b	.LBB29_576
.LBB29_574:
	mov	w0, #-13
	sxtw	x21, w0
	b	.LBB29_577
.LBB29_575:
	adrp	x9, jiffies
	mov	x0, x19
	mov	x1, x20
	ldr	x9, [x9, :lo12:jiffies]
	stp	x9, x9, [x8, #504]
	str	x9, [x8, #520]
	bl	fscrypt_ioctl_set_policy
.LBB29_576:
                                        // kill: def $w0 killed $w0 def $x0
	sxtw	x21, w0
.LBB29_577:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB29_1518
// %bb.578:
	mov	x0, x21
	ldp	x20, x19, [sp, #384]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #368]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #352]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #336]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #320]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #304]    // 16-byte Folded Reload
	add	sp, sp, #400            // =400
	ret
.LBB29_579:
	mov	w28, #-13
	sxtw	x21, w28
	b	.LBB29_577
.LBB29_580:
	mov	w21, #-30
	sxtw	x21, w21
	b	.LBB29_577
.LBB29_581:
	mov	w22, #-1
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_582:
	ldrb	w8, [x19, #68]
	tbnz	w8, #1, .LBB29_615
.LBB29_583:
	mov	w23, #-9
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_584:
	mov	w28, #-95
	sxtw	x21, w28
	b	.LBB29_577
.LBB29_585:
	mov	w22, #-22
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_586:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_589
// %bb.587:
	ldr	x8, [x21, #712]
	ubfx	x21, x8, #31, #1
	b	.LBB29_590
.LBB29_588:
	mov	x21, #-12
	b	.LBB29_577
.LBB29_589:
	mov	w21, wzr
.LBB29_590:
	mov	x0, x19
	bl	up_write
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_592
// %bb.591:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_593
.LBB29_592:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_593:
	//APP
		adds	x10, x10, 1
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_597
// %bb.594:
	lsl	x9, x20, #8
	ldr	x11, [x8, #64]
	and	x12, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x12, x11
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w11, [x9, :lo12:arm64_const_caps_ready]
	cmp	w11, #1                 // =1
	b.lt	.LBB29_1293
// %bb.595:
	adrp	x11, cpu_hwcap_keys
	add	x11, x11, :lo12:cpu_hwcap_keys
	ldr	w11, [x11, #16]
	cmp	w11, #0                 // =0
	b.le	.LBB29_1294
.LBB29_596:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1295
.LBB29_597:
	mov	w8, #-14
	sxtw	x21, w8
	b	.LBB29_577
.LBB29_598:
	mov	w23, #-22
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_599:
	mov	w21, #-30
	sxtw	x21, w21
	b	.LBB29_577
.LBB29_600:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w22, w0
	cbnz	w0, .LBB29_602
// %bb.601:
	add	x23, x21, #24           // =24
	mov	x0, x23
	bl	down_write
	ldr	x8, [x21, #16]
	mov	w1, wzr
	mov	w2, #1024
	add	x0, x8, #124            // =124
	bl	memset
	mov	x0, x20
	bl	strlen
	ldr	x8, [x21, #16]
	mov	x1, x0
	mov	x0, x20
	mov	w2, #1
	mov	w4, #512
                                        // kill: def $w1 killed $w1 killed $x1
	add	x3, x8, #124            // =124
	bl	utf8s_to_utf16s
	mov	x0, x21
	mov	w1, wzr
	bl	f2fs_commit_super
	mov	w22, w0
	mov	x0, x23
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
.LBB29_602:
	mov	x0, x20
	bl	kfree
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_603:
	ldr	x8, [x10]
	ldr	x8, [x8, #248]
	ldr	x8, [x8, #128]
	ldr	x8, [x8, #1280]
	ldr	x9, [x8, #504]
	tbnz	w9, #11, .LBB29_606
// %bb.604:
	cbz	x8, .LBB29_671
// %bb.605:
	ldr	w8, [x8, #1740]
	sub	w8, w8, #1              // =1
	cmp	w8, #2                  // =2
	b.hs	.LBB29_671
.LBB29_606:
	//APP
	mrs x25, sp_el0
	//NO_APP
	ldrb	w9, [x25, #110]
	ldr	x8, [x25, #64]
	tbnz	w9, #5, .LBB29_608
// %bb.607:
	ldr	x10, [x25]
	mov	x9, x20
	tbz	w10, #26, .LBB29_609
.LBB29_608:
	lsl	x9, x20, #8
	and	x9, x20, x9, asr #8
.LBB29_609:
	//APP
		adds	x9, x9, 24
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_1393
// %bb.610:
	lsl	x9, x20, #8
	sub	x0, x29, #144           // =144
	mov	w2, #24
	ldr	x8, [x25, #64]
	and	x26, x20, x9, asr #8
	//APP
		bics	xzr, x26, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1394
// %bb.611:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w21, w0
	cbz	w0, .LBB29_630
.LBB29_612:
	sxtw	x21, w21
	b	.LBB29_577
.LBB29_613:
	mov	w22, #-13
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_614:
	mov	w21, #-13
	sxtw	x21, w21
	b	.LBB29_577
.LBB29_615:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_617
// %bb.616:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_618
.LBB29_617:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_618:
	//APP
		adds	x10, x10, 2
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1507
// %bb.619:
	lsl	x9, x20, #8
	sub	x0, x29, #144           // =144
	mov	w2, #2
	ldr	x8, [x8, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x1, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_from_user
	cbnz	x0, .LBB29_1508
// %bb.620:
	ldrh	w8, [x22]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_622
// %bb.621:
	ldr	x8, [x22, #712]
	tbnz	w8, #31, .LBB29_704
.LBB29_622:
	mov	w23, #-22
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_623:
	mov	x21, #-22
	b	.LBB29_577
.LBB29_624:
	ldrh	w8, [x22]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_626
// %bb.625:
	ldr	w27, [x21, #1188]
	ldr	w28, [x22, #1268]
	ldr	x8, [x22, #712]
	tbnz	w8, #31, .LBB29_723
.LBB29_626:
	mov	w25, #-22
	sxtw	x21, w25
	b	.LBB29_577
.LBB29_627:
	mov	w21, #-22
	sxtw	x21, w21
	b	.LBB29_577
.LBB29_628:
	ldur	w2, [x29, #-144]
.LBB29_629:
	ldr	w4, [x21, #1192]
	adrp	x1, .L.str.43
	add	x1, x1, :lo12:.L.str.43
	mov	x0, x21
	bl	f2fs_printk
	b	.LBB29_1322
.LBB29_630:
	ldur	w8, [x29, #-128]
	adrp	x0, f2fs_ioc_fitrim._rs
	ldr	w9, [x24, #1720]
	adrp	x1, .L__func__.f2fs_ioc_fitrim
	add	x0, x0, :lo12:f2fs_ioc_fitrim._rs
	add	x1, x1, :lo12:.L__func__.f2fs_ioc_fitrim
	cmp	w9, w8
	csel	w8, w8, w9, lo
	stur	x8, [x29, #-128]
	bl	___ratelimit
	cbnz	w0, .LBB29_908
.LBB29_631:
	ldr	x0, [x23, #1104]
	sub	x1, x29, #144           // =144
	bl	f2fs_trim_fs
	mov	w21, w0
	mov	x0, x19
	bl	mnt_drop_write_file
	tbnz	w21, #31, .LBB29_612
// %bb.632:
	ldrb	w9, [x25, #110]
	ldr	x8, [x25, #64]
	tbnz	w9, #5, .LBB29_634
// %bb.633:
	ldr	x10, [x25]
	mov	x9, x20
	tbz	w10, #26, .LBB29_635
.LBB29_634:
	mov	x9, x26
.LBB29_635:
	//APP
		adds	x9, x9, 24
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_637
// %bb.636:
	sub	x1, x29, #144           // =144
	mov	w2, #24
	ldr	x8, [x25, #64]
	//APP
		bics	xzr, x26, x8
	csel	x0, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_to_user
	cbz	x0, .LBB29_747
.LBB29_637:
	mov	w21, #-14
	sxtw	x21, w21
	b	.LBB29_577
.LBB29_638:
	mov	w22, #-95
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_639:
	mov	w21, #-95
	sxtw	x21, w21
	b	.LBB29_577
.LBB29_640:
	ldr	x8, [x21]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_688
// %bb.641:
	add	x25, x27, #160          // =160
	mov	x0, x25
	bl	down_write
	ldr	w8, [x27, #1256]
	cbnz	w8, .LBB29_712
// %bb.642:
	ldr	x8, [x27, #712]
	tbnz	x8, #35, .LBB29_712
// %bb.643:
	mov	x0, x25
	bl	up_write
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_645
// %bb.644:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_646
.LBB29_645:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_646:
	//APP
		adds	x10, x10, 8
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_773
// %bb.647:
	lsl	x9, x20, #8
	ldr	x11, [x8, #64]
	and	x12, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x12, x11
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w11, [x9, :lo12:arm64_const_caps_ready]
	cmp	w11, #1                 // =1
	b.lt	.LBB29_1936
// %bb.648:
	adrp	x11, cpu_hwcap_keys
	add	x11, x11, :lo12:cpu_hwcap_keys
	ldr	w11, [x11, #16]
	cmp	w11, #0                 // =0
	b.le	.LBB29_1937
.LBB29_649:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1938
.LBB29_650:
	ldrsw	x8, [x8, #1256]
	//APP
	mrs x9, sp_el0
	//NO_APP
	ldrb	w11, [x9, #110]
	ldr	x10, [x9, #64]
	tbnz	w11, #5, .LBB29_652
// %bb.651:
	ldr	x12, [x9]
	mov	x11, x20
	tbz	w12, #26, .LBB29_653
.LBB29_652:
	lsl	x11, x20, #8
	and	x11, x20, x11, asr #8
.LBB29_653:
	//APP
		adds	x11, x11, 8
	csel	x10, xzr, x10, hi
	csinv	x11, x11, xzr, cc
	sbcs	xzr, x11, x10
	cset	x11, ls

	//NO_APP
	cbz	x11, .LBB29_657
// %bb.654:
	lsl	x10, x20, #8
	ldr	x12, [x9, #64]
	and	x13, x20, x10, asr #8
	adrp	x10, arm64_const_caps_ready
	//APP
		bics	xzr, x13, x12
	csel	x11, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w12, [x10, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB29_1563
// %bb.655:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB29_1564
.LBB29_656:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1565
.LBB29_657:
	mov	w9, #-14
	sxtw	x21, w9
	b	.LBB29_577
.LBB29_658:
	add	x8, x20, #712           // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 131072
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x20, #40]
	mov	x0, x19
	mov	x1, xzr
	mov	x2, #9223372036854775807
	mov	w3, wzr
	mov	w4, #1
	ldr	x8, [x8, #1104]
	add	x8, x8, #2128           // =2128
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_do_sync_file
	mov	w22, w0
.LBB29_659:
	mov	x0, x21
	add	x8, x20, #712           // =712
	mov	w9, #536870912
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
	ldr	x8, [x20, #40]
	adrp	x9, jiffies
	ldr	x8, [x8, #1104]
	ldr	x9, [x9, :lo12:jiffies]
	stp	x9, x9, [x8, #504]
	str	x9, [x8, #520]
	b	.LBB29_703
.LBB29_660:
	ldr	x8, [x21, #712]
	tbnz	w8, #18, .LBB29_698
// %bb.661:
	mov	x0, x21
	mov	x1, xzr
	mov	w2, #1
	bl	truncate_partial_data_page
	b	.LBB29_699
.LBB29_662:
	mov	w22, #-22
.LBB29_663:
	ldr	x8, [x20, #712]
	tbz	w8, #29, .LBB29_665
// %bb.664:
	mov	w22, #-22
	add	x8, x20, #712           // =712
	mov	w9, #536870912
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
.LBB29_665:
	mov	x0, x21
	b	.LBB29_701
.LBB29_666:
	ldrh	w8, [x21, #1260]
	mov	x0, x19
	sturh	w8, [x29, #-144]
	bl	up_read
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_668
// %bb.667:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_669
.LBB29_668:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_669:
	mov	x21, #-14
	//APP
		adds	x10, x10, 2
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_577
// %bb.670:
	lsl	x9, x20, #8
	ldr	x8, [x8, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x0, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	sub	x1, x29, #144           // =144
	mov	w2, #2
	b	.LBB29_420
.LBB29_671:
	mov	w21, #-95
	sxtw	x21, w21
	b	.LBB29_577
.LBB29_672:
	mov	w26, #-30
	sxtw	x21, w26
	b	.LBB29_577
.LBB29_673:
	ldr	x9, [x24, #16]
	ldrsh	w9, [x9, #2180]
	tbz	w9, #31, .LBB29_683
// %bb.674:
	ldr	x9, [x8, #712]
	tbz	w9, #26, .LBB29_683
// %bb.675:
	ldrsw	x9, [x8, #1160]
	add	x9, x9, #360            // =360
	cmp	x9, #400                // =400
	b.lo	.LBB29_683
// %bb.676:
	mov	x0, x19
	str	x8, [sp, #88]           // 8-byte Folded Spill
	bl	mnt_want_write_file
	mov	w25, w0
	cbnz	w0, .LBB29_684
// %bb.677:
	add	x0, x22, #160           // =160
	str	x0, [sp, #72]           // 8-byte Folded Spill
	bl	down_write
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	cmp	x8, x22
	b.eq	.LBB29_1058
// %bb.678:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x9, [x22, #40]
	ldr	x8, [x8, #40]
	cmp	x8, x9
	b.ne	.LBB29_1058
// %bb.679:
	ldr	x1, [sp, #88]           // 8-byte Folded Reload
	mov	x0, x24
	mov	w2, #1
	bl	f2fs_inode_param_check
	mov	w25, w0
	cbnz	w0, .LBB29_1059
// %bb.680:
	mov	x0, x24
	mov	x1, x22
	mov	w2, #2
	bl	f2fs_inode_param_check
	mov	w25, w0
	cbnz	w0, .LBB29_1059
// %bb.681:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	mov	x0, x22
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	str	x8, [sp]                // 8-byte Folded Spill
	bl	f2fs_convert_inline_inode
	cbz	w0, .LBB29_1522
// %bb.682:
	mov	w25, w0
	ldr	x2, [x22, #64]
	adrp	x1, .L.str.87
	ldr	x0, [sp]                // 8-byte Folded Reload
	add	x1, x1, :lo12:.L.str.87
	mov	w3, w25
	bl	f2fs_printk
	b	.LBB29_1059
.LBB29_683:
	mov	w25, #-95
.LBB29_684:
	tbz	w21, #1, .LBB29_686
.LBB29_685:
	mov	x0, x20
	bl	__f_unlock_pos
.LBB29_686:
	tbz	w21, #0, .LBB29_1352
// %bb.687:
	mov	x0, x20
	bl	fput
	b	.LBB29_1352
.LBB29_688:
	mov	w24, #-30
	sxtw	x21, w24
	b	.LBB29_577
.LBB29_689:
	ldr	x22, [x21, #1280]
	mov	w8, #1
	sturb	w8, [x29, #-143]
	cbz	x22, .LBB29_693
// %bb.690:
	add	x21, x22, #720          // =720
	mov	x0, x21
	bl	down_write
	ldr	w8, [x22, #72]
	cmp	w8, #2                  // =2
	b.lo	.LBB29_692
// %bb.691:
	mov	w8, #1
	sturb	w8, [x29, #-144]
.LBB29_692:
	ldr	x8, [x22, #64]
	mov	x0, x21
	stur	w8, [x29, #-140]
	bl	up_write
.LBB29_693:
	mov	x0, x19
	bl	up_write
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_695
// %bb.694:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_696
.LBB29_695:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_696:
	mov	x21, #-14
	//APP
		adds	x10, x10, 8
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_577
// %bb.697:
	lsl	x9, x20, #8
	ldr	x8, [x8, #64]
	and	x9, x20, x9, asr #8
	//APP
		bics	xzr, x9, x8
	csel	x0, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	sub	x1, x29, #144           // =144
	mov	w2, #8
	b	.LBB29_420
.LBB29_698:
	mov	x0, x21
	mov	x1, xzr
	mov	w2, #4096
	bl	punch_hole
.LBB29_699:
	mov	w22, w0
.LBB29_700:
	mov	x0, x20
.LBB29_701:
	bl	up_write
.LBB29_702:
	mov	x0, x19
	bl	mnt_drop_write_file
.LBB29_703:
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_704:
	ldurb	w8, [x29, #-143]
	mov	w23, #-22
	sub	w8, w8, #3              // =3
	cmp	w8, #5                  // =5
	b.hi	.LBB29_907
// %bb.705:
	ldurb	w8, [x29, #-144]
	cmp	w8, #3                  // =3
	b.hi	.LBB29_907
// %bb.706:
	ldr	x8, [x19, #32]
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_708
// %bb.707:
	ldr	x0, [x8, #40]
	mov	w1, #1
	mov	w2, #1
	bl	__sb_start_write
.LBB29_708:
	add	x20, x22, #160          // =160
	mov	x0, x20
	bl	down_write
	ldr	x8, [x22, #712]
	tbnz	x8, #33, .LBB29_710
// %bb.709:
	ldr	w8, [x22, #768]
	cbz	w8, .LBB29_949
.LBB29_710:
	mov	w23, #-16
.LBB29_711:
	mov	x0, x20
	b	.LBB29_915
.LBB29_712:
	ldr	w9, [x27, #360]
	ldr	w8, [x19, #68]
	cmp	w9, #1                  // =1
	and	w8, w8, #0x2
	b.eq	.LBB29_714
// %bb.713:
	cbnz	w8, .LBB29_716
.LBB29_714:
	cbz	w9, .LBB29_774
// %bb.715:
	cbnz	w8, .LBB29_774
.LBB29_716:
	mov	x19, xzr
	mov	w24, #-16
.LBB29_717:
	mov	x0, x25
	bl	up_write
	ldr	x8, [x27, #80]
	add	x8, x8, #4095           // =4095
	lsr	x3, x8, #12
	subs	x8, x3, x19
	b.hs	.LBB29_740
// %bb.718:
	adrp	x1, .L.str.49
	adrp	x2, .L__func__.f2fs_ioc_get_saved_blocks
	add	x1, x1, :lo12:.L.str.49
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_get_saved_blocks
	mov	x0, x21
	mov	x4, x19
	bl	f2fs_printk
	sxtw	x21, w24
	b	.LBB29_577
.LBB29_719:
	mov	x0, x20
	bl	f2fs_commit_inmem_pages
	mov	w22, w0
	cbnz	w0, .LBB29_663
// %bb.720:
	mov	x0, x19
	mov	x1, xzr
	mov	x2, #9223372036854775807
	mov	w3, wzr
	mov	w4, #1
	bl	f2fs_do_sync_file
	mov	w22, w0
	cbnz	w0, .LBB29_663
// %bb.721:
	mov	x0, x20
	bl	f2fs_drop_inmem_pages
	b	.LBB29_663
.LBB29_722:
	mov	w23, #-30
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_723:
	ldr	x8, [x22, #712]
	tbnz	w8, #10, .LBB29_759
// %bb.724:
	mov	x0, x22
	bl	dquot_initialize
	mov	w25, w0
	add	w8, w0, #28             // =28
	cmp	w8, #28                 // =28
	b.hi	.LBB29_726
// %bb.725:
	mov	w10, #1
	mov	w9, #1
	movk	w10, #4224, lsl #16
	lsl	w8, w9, w8
	tst	w8, w10
	b.ne	.LBB29_727
.LBB29_726:
	cmn	w25, #122               // =122
	b.ne	.LBB29_1352
.LBB29_727:
	ldr	x8, [x22, #40]
	mov	w1, #1
	ldr	x0, [x8, #1104]
	bl	f2fs_balance_fs
	ldr	x8, [x19, #32]
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_729
// %bb.728:
	ldr	x0, [x8, #40]
	mov	w1, #1
	mov	w2, #1
	bl	__sb_start_write
.LBB29_729:
	add	x26, x22, #160          // =160
	mov	x0, x26
	bl	down_write
	add	x24, x21, #368          // =368
	mov	x0, x24
	bl	_raw_spin_lock
	ldr	x8, [x21, #352]
	cbz	x8, .LBB29_731
// %bb.730:
	adrp	x23, jiffies
	ldr	x8, [x21, #360]
	ldr	x9, [x23, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB29_1267
.LBB29_731:
	mov	x0, x24
	bl	_raw_spin_unlock
	add	x24, x21, #304          // =304
	mov	x0, x24
	bl	down_read
	mov	x0, x22
	bl	f2fs_drop_extent_tree
	mov	x0, x24
	bl	up_read
	ldr	x8, [x22, #712]
	tbnz	x8, #35, .LBB29_931
// %bb.732:
	str	x26, [sp, #88]          // 8-byte Folded Spill
	ldr	x8, [x22, #712]
	tbnz	x8, #43, .LBB29_1013
// %bb.733:
	mov	x0, x22
	bl	f2fs_is_compress_backend_ready
	tbz	w0, #0, .LBB29_1247
// %bb.734:
	ldr	x8, [x22, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB29_1203
// %bb.735:
	ldr	x8, [x22, #712]
	tbnz	w8, #28, .LBB29_1245
// %bb.736:
	ldr	x8, [x22, #712]
	tbnz	x8, #33, .LBB29_1392
// %bb.737:
	ldr	x0, [x22, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	cbz	w0, .LBB29_1512
// %bb.738:
	mov	w25, w0
	b	.LBB29_1767
.LBB29_739:
	mov	w23, #-13
	b	.LBB29_914
.LBB29_740:
	//APP
	mrs x9, sp_el0
	//NO_APP
	ldrb	w11, [x9, #110]
	ldr	x10, [x9, #64]
	tbnz	w11, #5, .LBB29_742
// %bb.741:
	ldr	x12, [x9]
	mov	x11, x20
	tbz	w12, #26, .LBB29_743
.LBB29_742:
	lsl	x11, x20, #8
	and	x11, x20, x11, asr #8
.LBB29_743:
	//APP
		adds	x11, x11, 8
	csel	x10, xzr, x10, hi
	csinv	x11, x11, xzr, cc
	sbcs	xzr, x11, x10
	cset	x11, ls

	//NO_APP
	cbz	x11, .LBB29_773
// %bb.744:
	lsl	x10, x20, #8
	ldr	x12, [x9, #64]
	and	x13, x20, x10, asr #8
	adrp	x10, arm64_const_caps_ready
	//APP
		bics	xzr, x13, x12
	csel	x11, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w12, [x10, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB29_1892
// %bb.745:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB29_1893
.LBB29_746:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1894
.LBB29_747:
	ldr	x8, [x22, #40]
	adrp	x9, jiffies
	mov	w21, wzr
	ldr	x8, [x8, #1104]
	ldr	x9, [x9, :lo12:jiffies]
	stp	x9, x9, [x8, #504]
	str	x9, [x8, #520]
	b	.LBB29_612
.LBB29_748:
	mov	w28, #-9
	sxtw	x21, w28
	b	.LBB29_577
.LBB29_749:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_752
// %bb.750:
	ldr	x8, [x21, #712]
	tbz	w8, #31, .LBB29_752
.LBB29_751:
	mov	w1, #11
	mov	x0, x19
	mov	w2, wzr
	bl	f2fs_decompress_file_internal
	mov	x23, x0
	cbnz	w23, .LBB29_905
.LBB29_752:
	ldr	x8, [x21, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB29_904
// %bb.753:
	mov	x0, x21
	bl	f2fs_convert_inline_inode
	mov	w23, w0
	cbnz	w0, .LBB29_905
// %bb.754:
	add	x22, x21, #1016         // =1016
	mov	x0, x22
	bl	down_write
	ldr	w8, [x21, #768]
	cbz	w8, .LBB29_756
// %bb.755:
	ldr	x8, [x21, #40]
	adrp	x1, .L.str.38
	ldr	x2, [x21, #64]
	add	x1, x1, :lo12:.L.str.38
	ldr	x0, [x8, #1104]
	ldr	w3, [x21, #768]
	bl	f2fs_printk
.LBB29_756:
	ldr	x0, [x21, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	cbz	w0, .LBB29_1030
// %bb.757:
	mov	w23, w0
	mov	x0, x22
	bl	up_write
	b	.LBB29_905
.LBB29_758:
	mov	w22, wzr
	b	.LBB29_665
.LBB29_759:
	ldr	x2, [x22, #64]
	adrp	x1, .L.str.50
	ldr	x3, [x22, #144]
	add	x1, x1, :lo12:.L.str.50
	mov	x0, x21
	bl	f2fs_printk
	b	.LBB29_259
.LBB29_760:
	ldr	x2, [x21, #64]
	adrp	x1, .L.str.50
	ldr	x3, [x21, #144]
	add	x1, x1, :lo12:.L.str.50
	mov	x0, x20
	bl	f2fs_printk
	b	.LBB29_495
.LBB29_761:
	mov	w23, #-95
	b	.LBB29_914
.LBB29_762:
	add	x23, x21, #160          // =160
	mov	x0, x23
	bl	down_write
	adrp	x8, jiffies
	ldr	x24, [x8, :lo12:jiffies]
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB29_933
// %bb.763:
	ldr	w8, [x21, #1256]
	cbnz	w8, .LBB29_942
// %bb.764:
	ldr	x8, [x21, #712]
	tbnz	x8, #35, .LBB29_942
// %bb.765:
	ldr	x8, [x21, #712]
	tbz	x8, #34, .LBB29_935
	b	.LBB29_942
.LBB29_766:
	mov	x0, x22
	add	x23, x9, x8
	bl	max_file_blocks
	cmp	x0, x23, lsr #12
	b.lo	.LBB29_202
// %bb.767:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w26, w0
	cbz	w0, .LBB29_951
.LBB29_768:
	sxtw	x21, w26
	b	.LBB29_577
.LBB29_769:                             //   in Loop: Header=BB29_770 Depth=1
	subs	w28, w28, w25
	add	x24, x24, w25, sxtw
	b.eq	.LBB29_1268
.LBB29_770:                             // =>This Inner Loop Header: Depth=1
	cmp	w27, w28
	mov	x0, x22
	csel	w25, w27, w28, lt
	mov	x1, x24
	mov	w2, w25
	bl	redirty_blocks
	mov	w23, w0
	tbnz	w0, #31, .LBB29_1269
// %bb.771:                             //   in Loop: Header=BB29_770 Depth=1
	ldr	w8, [x22, #768]
	cmp	w8, w26
	b.lo	.LBB29_769
// %bb.772:                             //   in Loop: Header=BB29_770 Depth=1
	ldr	x0, [x22, #48]
	bl	filemap_fdatawrite
	b	.LBB29_769
.LBB29_773:
	mov	w24, #-14
	sxtw	x21, w24
	b	.LBB29_577
.LBB29_774:
	ldr	x8, [x27, #80]
	mov	x19, xzr
	add	x8, x8, #4095           // =4095
	lsr	x22, x8, #12
	cbz	x22, .LBB29_954
// %bb.775:
	sub	x8, x29, #144           // =144
	mov	x23, xzr
	add	x28, x8, #8             // =8
	stp	x25, x22, [sp, #72]     // 16-byte Folded Spill
.LBB29_776:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB29_788 Depth 2
                                        //       Child Loop BB29_801 Depth 3
                                        //     Child Loop BB29_865 Depth 2
                                        //     Child Loop BB29_810 Depth 2
                                        //       Child Loop BB29_850 Depth 3
                                        //         Child Loop BB29_857 Depth 4
                                        //       Child Loop BB29_814 Depth 3
                                        //         Child Loop BB29_823 Depth 4
                                        //       Child Loop BB29_831 Depth 3
                                        //         Child Loop BB29_840 Depth 4
	sub	x0, x29, #144           // =144
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	sub	x0, x29, #144           // =144
	mov	x1, x23
	mov	w2, #1
	stur	x27, [x29, #-144]
	stp	xzr, xzr, [x28]
	str	wzr, [x28, #16]
	bl	f2fs_get_dnode_of_data
	cbz	w0, .LBB29_779
// %bb.777:                             //   in Loop: Header=BB29_776 Depth=1
	mov	w24, w0
	cmn	w0, #2                  // =2
	b.ne	.LBB29_953
// %bb.778:                             //   in Loop: Header=BB29_776 Depth=1
	sub	x0, x29, #144           // =144
	mov	x1, x23
	bl	f2fs_get_next_page_offset
	mov	x23, x0
	mov	w24, wzr
	cmp	x22, x23
	b.hi	.LBB29_776
	b	.LBB29_717
.LBB29_779:                             //   in Loop: Header=BB29_776 Depth=1
	ldur	x26, [x29, #-128]
	lsl	x8, x26, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w9, w8
	b.ne	.LBB29_783
// %bb.780:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	w8, [x27, #1160]
	ldr	w9, [x27, #1168]
	ldrh	w10, [x27]
	add	w8, w9, w8, asr #2
	mov	w9, #923
	sub	w9, w9, w8
	and	w8, w10, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_786
// %bb.781:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x27, #712]
	tbz	w8, #31, .LBB29_786
// %bb.782:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	w8, [x27, #1268]
	neg	w8, w8
	and	w9, w9, w8
	b	.LBB29_786
.LBB29_783:                             //   in Loop: Header=BB29_776 Depth=1
	ldrh	w8, [x27]
	mov	w9, #1018
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_786
// %bb.784:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x27, #712]
	mov	w9, #1018
	tbz	w8, #31, .LBB29_786
// %bb.785:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	w8, [x27, #1268]
	mov	w9, #1018
	neg	w8, w8
	and	w9, w8, w9
.LBB29_786:                             //   in Loop: Header=BB29_776 Depth=1
	ldur	w8, [x29, #-116]
	mov	w9, w9
	ldr	w10, [x27, #1268]
	sub	x11, x22, x23
	sub	x9, x9, x8
	cmp	x9, x11
	csel	x9, x9, x11, lo
	sub	w11, w10, #1            // =1
	add	x9, x9, x11
	udiv	x9, x9, x10
	mul	x22, x9, x10
	cbz	x22, .LBB29_863
// %bb.787:                             //   in Loop: Header=BB29_776 Depth=1
	ldur	x10, [x29, #-144]
	mov	w24, wzr
	str	x19, [sp, #88]          // 8-byte Folded Spill
	ldr	x9, [x10, #40]
	ldrsw	x19, [x10, #1268]
	ldr	x25, [x9, #1104]
.LBB29_788:                             //   Parent Loop BB29_776 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB29_801 Depth 3
	lsl	x9, x26, #6
	add	w8, w8, w24
	orr	x9, x9, #0xffffffc000000000
	ldr	w11, [x9, #4072]
	ldr	w12, [x9, #4076]
	cmp	w11, w12
	b.ne	.LBB29_793
// %bb.789:                             //   in Loop: Header=BB29_788 Depth=2
	cbz	x10, .LBB29_792
// %bb.790:                             //   in Loop: Header=BB29_788 Depth=2
	ldr	x13, [x10, #712]
	tbz	w13, #26, .LBB29_793
// %bb.791:                             //   in Loop: Header=BB29_788 Depth=2
	ldr	w10, [x10, #1160]
	asr	w10, w10, #2
	b	.LBB29_794
.LBB29_792:                             //   in Loop: Header=BB29_788 Depth=2
	ldrb	w10, [x9, #3]
	tbnz	w10, #5, .LBB29_806
.LBB29_793:                             //   in Loop: Header=BB29_788 Depth=2
	mov	w10, wzr
.LBB29_794:                             //   in Loop: Header=BB29_788 Depth=2
	add	x13, x9, #360           // =360
	cmp	w11, w12
	csel	x9, x13, x9, eq
	add	w8, w8, w10
	ldr	w1, [x9, w8, uxtw #2]
	add	w8, w1, #3              // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB29_797
.LBB29_795:                             //   in Loop: Header=BB29_788 Depth=2
	add	w24, w24, #1            // =1
	cmp	x22, w24, sxtw
	b.ls	.LBB29_807
// %bb.796:                             //   in Loop: Header=BB29_788 Depth=2
	ldur	x10, [x29, #-144]
	ldur	x26, [x29, #-128]
	ldur	w8, [x29, #-116]
	b	.LBB29_788
.LBB29_797:                             //   in Loop: Header=BB29_788 Depth=2
	ldr	w9, [x25, #3024]
	cbz	w9, .LBB29_805
// %bb.798:                             //   in Loop: Header=BB29_788 Depth=2
	ldr	x8, [x25]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB29_804
// %bb.799:                             //   in Loop: Header=BB29_788 Depth=2
	ldr	x11, [x25, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB29_801
.LBB29_800:                             //   in Loop: Header=BB29_801 Depth=3
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB29_804
.LBB29_801:                             //   Parent Loop BB29_776 Depth=1
                                        //     Parent Loop BB29_788 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w12, [x11, #-4]
	cmp	w12, w1
	b.hi	.LBB29_800
// %bb.802:                             //   in Loop: Header=BB29_801 Depth=3
	ldr	w12, [x11]
	cmp	w12, w1
	b.lo	.LBB29_800
// %bb.803:                             //   in Loop: Header=BB29_788 Depth=2
	ldur	x8, [x11, #-80]
.LBB29_804:                             //   in Loop: Header=BB29_788 Depth=2
	cbz	x8, .LBB29_795
.LBB29_805:                             //   in Loop: Header=BB29_788 Depth=2
	mov	x0, x25
	mov	w2, #6
	bl	f2fs_is_valid_blkaddr
	tbnz	w0, #0, .LBB29_795
	b	.LBB29_867
.LBB29_806:                             //   in Loop: Header=BB29_788 Depth=2
	ldrh	w10, [x9, #360]
	lsr	w10, w10, #2
	b	.LBB29_794
.LBB29_807:                             //   in Loop: Header=BB29_776 Depth=1
	ldur	x26, [x29, #-128]
	cmp	w19, #0                 // =0
	b.le	.LBB29_864
// %bb.808:                             //   in Loop: Header=BB29_776 Depth=1
	lsl	x8, x26, #6
	ldur	x11, [x29, #-144]
	orr	x8, x8, #0xffffffc000000000
	mov	w24, wzr
	add	x12, x8, #360           // =360
	mov	x13, x22
	ldr	w9, [x8, #4072]
	ldr	w10, [x8, #4076]
	cmp	w9, w10
	csel	x12, x12, x8, eq
	b	.LBB29_810
.LBB29_809:                             //   in Loop: Header=BB29_810 Depth=2
	add	w24, w15, w24
	subs	x13, x13, x19
	b.eq	.LBB29_868
.LBB29_810:                             //   Parent Loop BB29_776 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB29_850 Depth 3
                                        //         Child Loop BB29_857 Depth 4
                                        //       Child Loop BB29_814 Depth 3
                                        //         Child Loop BB29_823 Depth 4
                                        //       Child Loop BB29_831 Depth 3
                                        //         Child Loop BB29_840 Depth 4
	ldur	w14, [x29, #-116]
	cmp	w9, w10
	b.ne	.LBB29_847
// %bb.811:                             //   in Loop: Header=BB29_810 Depth=2
	mov	w15, wzr
	mov	w16, wzr
	cbnz	x11, .LBB29_814
	b	.LBB29_831
.LBB29_812:                             //   in Loop: Header=BB29_814 Depth=3
	mov	w17, wzr
	add	w15, wzr, w15
.LBB29_813:                             //   in Loop: Header=BB29_814 Depth=3
	add	w14, w14, #1            // =1
	add	w16, w16, #1            // =1
	cmp	w16, w19
	stur	w14, [x29, #-116]
	b.eq	.LBB29_809
.LBB29_814:                             //   Parent Loop BB29_776 Depth=1
                                        //     Parent Loop BB29_810 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB29_823 Depth 4
	ldr	x17, [x11, #712]
	tbnz	w17, #26, .LBB29_816
// %bb.815:                             //   in Loop: Header=BB29_814 Depth=3
	mov	w17, wzr
	b	.LBB29_817
.LBB29_816:                             //   in Loop: Header=BB29_814 Depth=3
	ldr	w17, [x11, #1160]
	asr	w17, w17, #2
.LBB29_817:                             //   in Loop: Header=BB29_814 Depth=3
	add	w17, w17, w14
	ldr	w17, [x12, w17, uxtw #2]
	cbz	w16, .LBB29_828
// %bb.818:                             //   in Loop: Header=BB29_814 Depth=3
	add	w18, w17, #3            // =3
	cmp	w18, #4                 // =4
	b.lo	.LBB29_812
// %bb.819:                             //   in Loop: Header=BB29_814 Depth=3
	ldr	w0, [x25, #3024]
	cbz	w0, .LBB29_827
// %bb.820:                             //   in Loop: Header=BB29_814 Depth=3
	ldr	x18, [x25]
	cmp	w0, #1                  // =1
	ldr	x18, [x18, #248]
	b.lt	.LBB29_826
// %bb.821:                             //   in Loop: Header=BB29_814 Depth=3
	ldr	x2, [x25, #3032]
	mov	x1, xzr
	add	x2, x2, #80             // =80
	b	.LBB29_823
.LBB29_822:                             //   in Loop: Header=BB29_823 Depth=4
	add	x1, x1, #1              // =1
	add	x2, x2, #192            // =192
	cmp	x1, x0
	b.eq	.LBB29_826
.LBB29_823:                             //   Parent Loop BB29_776 Depth=1
                                        //     Parent Loop BB29_810 Depth=2
                                        //       Parent Loop BB29_814 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldur	w3, [x2, #-4]
	cmp	w3, w17
	b.hi	.LBB29_822
// %bb.824:                             //   in Loop: Header=BB29_823 Depth=4
	ldr	w3, [x2]
	cmp	w3, w17
	b.lo	.LBB29_822
// %bb.825:                             //   in Loop: Header=BB29_814 Depth=3
	ldur	x18, [x2, #-80]
.LBB29_826:                             //   in Loop: Header=BB29_814 Depth=3
	cbz	x18, .LBB29_812
.LBB29_827:                             //   in Loop: Header=BB29_814 Depth=3
	mov	w17, #1
	add	w15, w17, w15
	b	.LBB29_813
.LBB29_828:                             //   in Loop: Header=BB29_814 Depth=3
	cmn	w17, #2                 // =2
	b.eq	.LBB29_813
	b	.LBB29_846
.LBB29_829:                             //   in Loop: Header=BB29_831 Depth=3
	mov	w17, wzr
	add	w15, wzr, w15
.LBB29_830:                             //   in Loop: Header=BB29_831 Depth=3
	add	w14, w14, #1            // =1
	add	w16, w16, #1            // =1
	cmp	w16, w19
	stur	w14, [x29, #-116]
	b.eq	.LBB29_809
.LBB29_831:                             //   Parent Loop BB29_776 Depth=1
                                        //     Parent Loop BB29_810 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB29_840 Depth 4
	ldrb	w17, [x8, #3]
	tbnz	w17, #5, .LBB29_833
// %bb.832:                             //   in Loop: Header=BB29_831 Depth=3
	mov	w17, wzr
	b	.LBB29_834
.LBB29_833:                             //   in Loop: Header=BB29_831 Depth=3
	ldrh	w17, [x8, #360]
	lsr	w17, w17, #2
.LBB29_834:                             //   in Loop: Header=BB29_831 Depth=3
	add	w17, w17, w14
	ldr	w17, [x12, w17, uxtw #2]
	cbz	w16, .LBB29_845
// %bb.835:                             //   in Loop: Header=BB29_831 Depth=3
	add	w18, w17, #3            // =3
	cmp	w18, #4                 // =4
	b.lo	.LBB29_829
// %bb.836:                             //   in Loop: Header=BB29_831 Depth=3
	ldr	w0, [x25, #3024]
	cbz	w0, .LBB29_844
// %bb.837:                             //   in Loop: Header=BB29_831 Depth=3
	ldr	x18, [x25]
	cmp	w0, #1                  // =1
	ldr	x18, [x18, #248]
	b.lt	.LBB29_843
// %bb.838:                             //   in Loop: Header=BB29_831 Depth=3
	ldr	x2, [x25, #3032]
	mov	x1, xzr
	add	x2, x2, #80             // =80
	b	.LBB29_840
.LBB29_839:                             //   in Loop: Header=BB29_840 Depth=4
	add	x1, x1, #1              // =1
	add	x2, x2, #192            // =192
	cmp	x1, x0
	b.eq	.LBB29_843
.LBB29_840:                             //   Parent Loop BB29_776 Depth=1
                                        //     Parent Loop BB29_810 Depth=2
                                        //       Parent Loop BB29_831 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldur	w3, [x2, #-4]
	cmp	w3, w17
	b.hi	.LBB29_839
// %bb.841:                             //   in Loop: Header=BB29_840 Depth=4
	ldr	w3, [x2]
	cmp	w3, w17
	b.lo	.LBB29_839
// %bb.842:                             //   in Loop: Header=BB29_831 Depth=3
	ldur	x18, [x2, #-80]
.LBB29_843:                             //   in Loop: Header=BB29_831 Depth=3
	cbz	x18, .LBB29_829
.LBB29_844:                             //   in Loop: Header=BB29_831 Depth=3
	mov	w17, #1
	add	w15, w17, w15
	b	.LBB29_830
.LBB29_845:                             //   in Loop: Header=BB29_831 Depth=3
	cmn	w17, #2                 // =2
	b.eq	.LBB29_830
.LBB29_846:                             //   in Loop: Header=BB29_810 Depth=2
	add	w14, w14, w19
	stur	w14, [x29, #-116]
	subs	x13, x13, x19
	b.ne	.LBB29_810
	b	.LBB29_868
.LBB29_847:                             //   in Loop: Header=BB29_810 Depth=2
	mov	w15, wzr
	mov	w16, wzr
	b	.LBB29_850
.LBB29_848:                             //   in Loop: Header=BB29_850 Depth=3
	cmn	w17, #2                 // =2
	b.ne	.LBB29_846
.LBB29_849:                             //   in Loop: Header=BB29_850 Depth=3
	add	w14, w14, #1            // =1
	add	w16, w16, #1            // =1
	cmp	w16, w19
	stur	w14, [x29, #-116]
	b.eq	.LBB29_809
.LBB29_850:                             //   Parent Loop BB29_776 Depth=1
                                        //     Parent Loop BB29_810 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB29_857 Depth 4
	ldr	w17, [x12, w14, uxtw #2]
	cbz	w16, .LBB29_848
// %bb.851:                             //   in Loop: Header=BB29_850 Depth=3
	add	w18, w17, #3            // =3
	cmp	w18, #4                 // =4
	b.hs	.LBB29_853
.LBB29_852:                             //   in Loop: Header=BB29_850 Depth=3
	mov	w17, wzr
	b	.LBB29_862
.LBB29_853:                             //   in Loop: Header=BB29_850 Depth=3
	ldr	w0, [x25, #3024]
	cbz	w0, .LBB29_861
// %bb.854:                             //   in Loop: Header=BB29_850 Depth=3
	ldr	x18, [x25]
	cmp	w0, #1                  // =1
	ldr	x18, [x18, #248]
	b.lt	.LBB29_860
// %bb.855:                             //   in Loop: Header=BB29_850 Depth=3
	ldr	x2, [x25, #3032]
	mov	x1, xzr
	add	x2, x2, #80             // =80
	b	.LBB29_857
.LBB29_856:                             //   in Loop: Header=BB29_857 Depth=4
	add	x1, x1, #1              // =1
	add	x2, x2, #192            // =192
	cmp	x1, x0
	b.eq	.LBB29_860
.LBB29_857:                             //   Parent Loop BB29_776 Depth=1
                                        //     Parent Loop BB29_810 Depth=2
                                        //       Parent Loop BB29_850 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldur	w3, [x2, #-4]
	cmp	w3, w17
	b.hi	.LBB29_856
// %bb.858:                             //   in Loop: Header=BB29_857 Depth=4
	ldr	w3, [x2]
	cmp	w3, w17
	b.lo	.LBB29_856
// %bb.859:                             //   in Loop: Header=BB29_850 Depth=3
	ldur	x18, [x2, #-80]
.LBB29_860:                             //   in Loop: Header=BB29_850 Depth=3
	cbz	x18, .LBB29_852
.LBB29_861:                             //   in Loop: Header=BB29_850 Depth=3
	mov	w17, #1
.LBB29_862:                             //   in Loop: Header=BB29_850 Depth=3
	add	w15, w17, w15
	b	.LBB29_849
.LBB29_863:                             //   in Loop: Header=BB29_776 Depth=1
	mov	w24, wzr
	b	.LBB29_870
.LBB29_864:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x25, [sp, #72]          // 8-byte Folded Reload
	mov	x8, x22
.LBB29_865:                             //   Parent Loop BB29_776 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	subs	x8, x8, x19
	b.ne	.LBB29_865
// %bb.866:                             //   in Loop: Header=BB29_776 Depth=1
	mov	w24, wzr
	b	.LBB29_869
.LBB29_867:                             //   in Loop: Header=BB29_776 Depth=1
	ldur	x26, [x29, #-128]
	mov	w8, #-117
	mov	w24, w8
.LBB29_868:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x25, [sp, #72]          // 8-byte Folded Reload
.LBB29_869:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x19, [sp, #88]          // 8-byte Folded Reload
.LBB29_870:                             //   in Loop: Header=BB29_776 Depth=1
	cbz	x26, .LBB29_895
// %bb.871:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x26, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x26, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x26, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB29_887
// %bb.872:                             //   in Loop: Header=BB29_776 Depth=1
	tbnz	w8, #0, .LBB29_886
// %bb.873:                             //   in Loop: Header=BB29_776 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_876
// %bb.874:                             //   in Loop: Header=BB29_776 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_876
// %bb.875:                             //   in Loop: Header=BB29_776 Depth=1
	adrp	x25, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x25, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_876:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_878
// %bb.877:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB29_901
.LBB29_878:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x0, [x26, #24]
.LBB29_879:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_881
// %bb.880:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB29_902
.LBB29_881:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x0, [x26, #24]
.LBB29_882:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_884
// %bb.883:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB29_903
.LBB29_884:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x0, [x26, #24]
.LBB29_885:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	ldr	x25, [sp, #72]          // 8-byte Folded Reload
.LBB29_886:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_893
	b	.LBB29_2059
.LBB29_887:                             //   in Loop: Header=BB29_776 Depth=1
	tbnz	w8, #0, .LBB29_892
// %bb.888:                             //   in Loop: Header=BB29_776 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_891
// %bb.889:                             //   in Loop: Header=BB29_776 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_891
// %bb.890:                             //   in Loop: Header=BB29_776 Depth=1
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB29_891:                             //   in Loop: Header=BB29_776 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_892:                             //   in Loop: Header=BB29_776 Depth=1
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2060
.LBB29_893:                             //   in Loop: Header=BB29_776 Depth=1
	mov	x0, x26
	bl	unlock_page
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x26, x9, eq
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
	cbnz	w9, .LBB29_895
// %bb.894:                             //   in Loop: Header=BB29_776 Depth=1
	bl	__put_page
.LBB29_895:                             //   in Loop: Header=BB29_776 Depth=1
	ldur	x8, [x29, #-136]
	cbz	x8, .LBB29_899
// %bb.896:                             //   in Loop: Header=BB29_776 Depth=1
	ldur	x9, [x29, #-128]
	cmp	x9, x8
	b.eq	.LBB29_899
// %bb.897:                             //   in Loop: Header=BB29_776 Depth=1
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
	cbnz	w9, .LBB29_899
// %bb.898:                             //   in Loop: Header=BB29_776 Depth=1
	bl	__put_page
.LBB29_899:                             //   in Loop: Header=BB29_776 Depth=1
	stp	xzr, xzr, [x28]
	tbnz	w24, #31, .LBB29_953
// %bb.900:                             //   in Loop: Header=BB29_776 Depth=1
	add	x23, x22, x23
	ldr	x22, [sp, #80]          // 8-byte Folded Reload
	add	x19, x19, w24, uxtw
	cmp	x22, x23
	b.hi	.LBB29_776
	b	.LBB29_717
.LBB29_901:                             //   in Loop: Header=BB29_776 Depth=1
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB29_879
.LBB29_902:                             //   in Loop: Header=BB29_776 Depth=1
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB29_882
.LBB29_903:                             //   in Loop: Header=BB29_776 Depth=1
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB29_885
.LBB29_904:
	ldr	x8, [x21, #712]
	tst	x8, #0x20000000
	csel	w23, wzr, w22, eq
.LBB29_905:
	mov	x0, x20
.LBB29_906:
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
.LBB29_907:
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_908:
	adrp	x0, .L.str.39
	adrp	x1, .L__func__.f2fs_ioc_fitrim
	add	x0, x0, :lo12:.L.str.39
	add	x1, x1, :lo12:.L__func__.f2fs_ioc_fitrim
	bl	printk
	b	.LBB29_631
.LBB29_909:                             //   in Loop: Header=BB29_910 Depth=1
	subs	w28, w28, w25
	add	x24, x24, w25, sxtw
	b.eq	.LBB29_1386
.LBB29_910:                             // =>This Inner Loop Header: Depth=1
	cmp	w27, w28
	mov	x0, x22
	csel	w25, w27, w28, lt
	mov	x1, x24
	mov	w2, w25
	bl	redirty_blocks
	mov	w23, w0
	tbnz	w0, #31, .LBB29_1388
// %bb.911:                             //   in Loop: Header=BB29_910 Depth=1
	ldr	w8, [x22, #768]
	cmp	w8, w26
	b.lo	.LBB29_909
// %bb.912:                             //   in Loop: Header=BB29_910 Depth=1
	ldr	x0, [x22, #48]
	bl	filemap_fdatawrite
	b	.LBB29_909
.LBB29_913:
	mov	w23, #-16
.LBB29_914:
	mov	x0, x21
.LBB29_915:
	bl	up_write
	ldr	x8, [x19, #32]
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_907
// %bb.916:
	ldr	x0, [x8, #40]
	mov	w1, #1
	bl	__sb_end_write
	b	.LBB29_907
.LBB29_917:
	add	x22, x23, #160          // =160
	mov	x0, x22
	bl	down_write
	ldr	x8, [x23, #712]
	tbnz	x8, #43, .LBB29_958
// %bb.918:
	ldr	x25, [x20, #32]
	ldr	x8, [x23, #40]
	ldr	x9, [x25, #40]
	cmp	x8, x9
	b.eq	.LBB29_1060
// %bb.919:
	ldr	x3, [x23, #64]
	adrp	x1, .L.str.59
	ldr	x4, [x25, #64]
	adrp	x2, .L__func__.f2fs_ioc_create_layered_inode
	add	x1, x1, :lo12:.L.str.59
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_create_layered_inode
	mov	x0, x26
.LBB29_920:
	bl	f2fs_printk
	b	.LBB29_960
.LBB29_921:
	ldr	x8, [x27, #16]
	ldrsh	w8, [x8, #2180]
	tbz	w8, #31, .LBB29_923
// %bb.922:
	ldr	x8, [x26, #712]
	tbnz	w8, #26, .LBB29_1062
.LBB29_923:
	mov	w28, #-95
	tbz	w21, #1, .LBB29_1186
	b	.LBB29_1185
.LBB29_924:
	ldr	x8, [x22, #40]
	mov	w1, #1
	ldr	x0, [x8, #1104]
	bl	f2fs_balance_fs
	add	x0, x22, #160           // =160
	str	x0, [sp, #80]           // 8-byte Folded Spill
	bl	down_write
	ldr	x8, [x22, #712]
	tbnz	x8, #35, .LBB29_963
// %bb.925:
	str	wzr, [sp, #88]          // 4-byte Folded Spill
	mov	w25, #-22
	b	.LBB29_1079
.LBB29_926:
	cbz	w24, .LBB29_1352
// %bb.927:
	ldr	w8, [x22, #1256]
	cbz	w8, .LBB29_1352
// %bb.928:
	cbz	x21, .LBB29_930
// %bb.929:
	add	x8, x21, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB29_930:
	ldr	x3, [x22, #64]
	adrp	x1, .L.str.47
	ldr	x4, [x22, #144]
	adrp	x2, .L__func__.f2fs_release_compress_blocks
	ldr	w6, [x22, #1256]
	add	x1, x1, :lo12:.L.str.47
	add	x2, x2, :lo12:.L__func__.f2fs_release_compress_blocks
	mov	x0, x21
	mov	w5, w24
	bl	f2fs_printk
	b	.LBB29_1352
.LBB29_931:
	mov	w27, wzr
	mov	w24, wzr
	mov	w25, wzr
	b	.LBB29_1249
.LBB29_932:
	mov	w23, #-13
	b	.LBB29_1096
.LBB29_933:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_935
// %bb.934:
	ldr	x8, [x21, #712]
	tbnz	w8, #31, .LBB29_942
.LBB29_935:
	ldr	x8, [x21, #712]
	tbz	x8, #49, .LBB29_937
// %bb.936:
	mov	x0, x21
	mov	w1, #1
	add	x8, x21, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB29_937:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB29_941
// %bb.938:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB29_940
// %bb.939:
	ldr	x8, [x21, #712]
	tbnz	x8, #44, .LBB29_941
.LBB29_940:
	adrp	x1, .L__func__.f2fs_ioc_set_file_tag
	mov	x0, x21
	add	x1, x1, :lo12:.L__func__.f2fs_ioc_set_file_tag
	bl	f2fs_revoke_deduped_inode
	mov	w22, w0
	cbnz	w0, .LBB29_943
.LBB29_941:
	sub	x1, x29, #144           // =144
	mov	x0, x21
	mov	x2, x24
	bl	f2fs_migrate_dm_file
	mov	w22, w0
	b	.LBB29_943
.LBB29_942:
	adrp	x1, .L.str.46
	adrp	x2, .L__func__.f2fs_ioc_set_file_tag
	add	x1, x1, :lo12:.L.str.46
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_set_file_tag
	mov	x0, x22
	bl	f2fs_printk
	mov	w22, #-95
.LBB29_943:
	mov	x0, x23
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
	ldrb	w9, [x25, #110]
	ldr	x8, [x25, #64]
	tbnz	w9, #5, .LBB29_945
// %bb.944:
	ldr	x10, [x25]
	mov	x9, x20
	tbz	w10, #26, .LBB29_946
.LBB29_945:
	mov	x9, x26
.LBB29_946:
	mov	w23, #-14
	//APP
		adds	x9, x9, 12
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_907
// %bb.947:
	sub	x1, x29, #144           // =144
	mov	w2, #12
	ldr	x8, [x25, #64]
	//APP
		bics	xzr, x26, x8
	csel	x0, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_to_user
	cmp	x0, #0                  // =0
	csel	w23, w22, w23, eq
	b	.LBB29_907
.LBB29_948:
	mov	x10, xzr
	mov	w9, wzr
	b	.LBB29_1206
.LBB29_949:
	ldr	x8, [x22, #80]
	cbz	x8, .LBB29_1041
// %bb.950:
	mov	w23, #-27
	b	.LBB29_711
.LBB29_951:
	ldr	x22, [x19, #32]
	mov	w8, #11
	stp	xzr, xzr, [x29, #-120]
	mov	x1, xzr
	stp	xzr, xzr, [x29, #-136]
	ldr	w9, [x21, #1188]
	mov	x0, x22
	stur	xzr, [x29, #-144]
	stur	w8, [x29, #-112]
	str	wzr, [sp, #144]
	str	w9, [sp, #88]           // 4-byte Folded Spill
	str	xzr, [sp, #136]
	bl	f2fs_should_update_inplace
	tbz	w0, #0, .LBB29_1014
// %bb.952:
	mov	w26, #-22
	b	.LBB29_1024
.LBB29_953:
	ldr	x25, [sp, #72]          // 8-byte Folded Reload
	b	.LBB29_717
.LBB29_954:
                                        // implicit-def: $w24
	b	.LBB29_717
.LBB29_955:
	ldr	x8, [x22, #712]
	tbnz	x8, #35, .LBB29_1039
// %bb.956:
	ldr	x0, [x22, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	cbz	w0, .LBB29_1097
// %bb.957:
	mov	w25, w0
	mov	w24, wzr
	b	.LBB29_528
.LBB29_958:
	ldr	x2, [x23, #64]
	adrp	x1, .L.str.58
	add	x1, x1, :lo12:.L.str.58
.LBB29_959:
	mov	x0, x26
	bl	f2fs_printk
.LBB29_960:
	mov	w28, #-22
.LBB29_961:
	mov	x0, x22
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
	tbz	w21, #1, .LBB29_1186
.LBB29_962:
	mov	x0, x20
	bl	__f_unlock_pos
	tbnz	w21, #0, .LBB29_1187
	b	.LBB29_1188
.LBB29_963:
	add	x0, x22, #1016          // =1016
	str	x0, [sp, #72]           // 8-byte Folded Spill
	bl	down_write
	add	x0, x22, #1064          // =1064
	str	x0, [sp, #64]           // 8-byte Folded Spill
	bl	down_write
	ldr	x8, [x22, #80]
	add	x8, x8, #4095           // =4095
	lsr	x24, x8, #12
	cbz	x24, .LBB29_1076
// %bb.964:
	sub	x8, x29, #144           // =144
	mov	x28, xzr
	add	x23, x8, #8             // =8
	str	wzr, [sp, #88]          // 4-byte Folded Spill
	b	.LBB29_966
.LBB29_965:                             //   in Loop: Header=BB29_966 Depth=1
	cmp	x24, x28
	b.ls	.LBB29_1077
.LBB29_966:                             // =>This Inner Loop Header: Depth=1
	sub	x0, x29, #144           // =144
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	sub	x0, x29, #144           // =144
	mov	x1, x28
	mov	w2, #1
	stur	x22, [x29, #-144]
	stp	xzr, xzr, [x23]
	str	wzr, [x23, #16]
	bl	f2fs_get_dnode_of_data
	cbz	w0, .LBB29_969
// %bb.967:                             //   in Loop: Header=BB29_966 Depth=1
	mov	w25, w0
	cmn	w0, #2                  // =2
	b.ne	.LBB29_1070
// %bb.968:                             //   in Loop: Header=BB29_966 Depth=1
	sub	x0, x29, #144           // =144
	mov	x1, x28
	bl	f2fs_get_next_page_offset
	mov	x28, x0
	mov	w25, wzr
	b	.LBB29_965
.LBB29_969:                             //   in Loop: Header=BB29_966 Depth=1
	ldur	x8, [x29, #-128]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w9, w8
	b.ne	.LBB29_973
// %bb.970:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	w8, [x22, #1160]
	ldr	w9, [x22, #1168]
	ldrh	w10, [x22]
	add	w8, w9, w8, asr #2
	mov	w9, #923
	sub	w8, w9, w8
	and	w9, w10, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_977
// %bb.971:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x9, [x22, #712]
	tbz	w9, #31, .LBB29_977
// %bb.972:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	w9, [x22, #1268]
	neg	w9, w9
	b	.LBB29_976
.LBB29_973:                             //   in Loop: Header=BB29_966 Depth=1
	ldrh	w8, [x22]
	and	w9, w8, #0xf000
	mov	w8, #1018
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_977
// %bb.974:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x9, [x22, #712]
	mov	w8, #1018
	tbz	w9, #31, .LBB29_977
// %bb.975:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	w8, [x22, #1268]
	mov	w9, #1018
	neg	w8, w8
.LBB29_976:                             //   in Loop: Header=BB29_966 Depth=1
	and	w8, w8, w9
.LBB29_977:                             //   in Loop: Header=BB29_966 Depth=1
	ldur	w9, [x29, #-116]
	mov	w8, w8
	ldr	w10, [x22, #1268]
	sub	x0, x29, #144           // =144
	sub	x8, x8, x9
	sub	x9, x24, x28
	cmp	x8, x9
	csel	x8, x8, x9, lo
	sub	w9, w10, #1             // =1
	sub	x8, x8, #1              // =1
	orr	x8, x8, x9
	add	x26, x8, #1             // =1
	mov	x1, x26
	bl	reserve_compress_blocks
	ldur	x27, [x29, #-128]
	mov	w25, w0
	cbz	x27, .LBB29_1002
// %bb.978:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x8, [x27, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x27, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x27, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB29_994
// %bb.979:                             //   in Loop: Header=BB29_966 Depth=1
	tbnz	w8, #0, .LBB29_993
// %bb.980:                             //   in Loop: Header=BB29_966 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_983
// %bb.981:                             //   in Loop: Header=BB29_966 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_983
// %bb.982:                             //   in Loop: Header=BB29_966 Depth=1
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB29_983:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_985
// %bb.984:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1008
.LBB29_985:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x0, [x27, #24]
.LBB29_986:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_988
// %bb.987:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1009
.LBB29_988:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x0, [x27, #24]
.LBB29_989:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_991
// %bb.990:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1010
.LBB29_991:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x0, [x27, #24]
.LBB29_992:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB29_993:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_1000
	b	.LBB29_2061
.LBB29_994:                             //   in Loop: Header=BB29_966 Depth=1
	tbnz	w8, #0, .LBB29_999
// %bb.995:                             //   in Loop: Header=BB29_966 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_998
// %bb.996:                             //   in Loop: Header=BB29_966 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_998
// %bb.997:                             //   in Loop: Header=BB29_966 Depth=1
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB29_998:                             //   in Loop: Header=BB29_966 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_999:                             //   in Loop: Header=BB29_966 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2062
.LBB29_1000:                            //   in Loop: Header=BB29_966 Depth=1
	mov	x0, x27
	bl	unlock_page
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
	cbnz	w9, .LBB29_1002
// %bb.1001:                            //   in Loop: Header=BB29_966 Depth=1
	bl	__put_page
.LBB29_1002:                            //   in Loop: Header=BB29_966 Depth=1
	ldur	x8, [x29, #-136]
	cbz	x8, .LBB29_1006
// %bb.1003:                            //   in Loop: Header=BB29_966 Depth=1
	ldur	x9, [x29, #-128]
	cmp	x9, x8
	b.eq	.LBB29_1006
// %bb.1004:                            //   in Loop: Header=BB29_966 Depth=1
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
	cbnz	w9, .LBB29_1006
// %bb.1005:                            //   in Loop: Header=BB29_966 Depth=1
	bl	__put_page
.LBB29_1006:                            //   in Loop: Header=BB29_966 Depth=1
	stp	xzr, xzr, [x23]
	tbnz	w25, #31, .LBB29_1070
// %bb.1007:                            //   in Loop: Header=BB29_966 Depth=1
	ldr	w8, [sp, #88]           // 4-byte Folded Reload
	add	x28, x26, x28
	add	w8, w25, w8
	str	w8, [sp, #88]           // 4-byte Folded Spill
	b	.LBB29_965
.LBB29_1008:                            //   in Loop: Header=BB29_966 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_986
.LBB29_1009:                            //   in Loop: Header=BB29_966 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_989
.LBB29_1010:                            //   in Loop: Header=BB29_966 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_992
.LBB29_1011:
	ldr	x8, [x22, #712]
	tbnz	w8, #26, .LBB29_1054
// %bb.1012:
	mov	w25, #-95
	b	.LBB29_1351
.LBB29_1013:
	mov	w27, wzr
	mov	w24, wzr
	mov	w25, #-13
	b	.LBB29_1248
.LBB29_1014:
	ldp	x23, x24, [sp, #104]
	mov	x0, x21
	mov	w1, #1
	bl	f2fs_balance_fs
	add	x0, x22, #160           // =160
	str	x0, [sp, #80]           // 8-byte Folded Spill
	bl	down_write
	ldr	x8, [x22, #712]
	tbz	x8, #35, .LBB29_1016
// %bb.1015:
	mov	x0, x22
	mov	w1, #4
	bl	f2fs_reserve_compress_blocks_internal
	mov	w26, w0
	cbnz	w0, .LBB29_1023
.LBB29_1016:
	ldr	x8, [x22, #712]
	tbz	x8, #49, .LBB29_1018
// %bb.1017:
	mov	x0, x22
	mov	w1, #1
	add	x8, x22, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB29_1018:
	ldr	x8, [x22, #712]
	tbz	x8, #43, .LBB29_1022
// %bb.1019:
	ldr	x8, [x22, #712]
	tbz	x8, #43, .LBB29_1021
// %bb.1020:
	ldr	x8, [x22, #712]
	tbnz	x8, #44, .LBB29_1022
.LBB29_1021:
	adrp	x1, .L__func__.f2fs_defragment_range
	mov	x0, x22
	add	x1, x1, :lo12:.L__func__.f2fs_defragment_range
	bl	f2fs_revoke_deduped_inode
	mov	w26, w0
	cbnz	w0, .LBB29_1023
.LBB29_1022:
	ldp	x1, x8, [sp, #104]
	ldr	x0, [x22, #48]
	add	x8, x1, x8
	sub	x2, x8, #1              // =1
	bl	filemap_write_and_wait_range
	mov	w26, w0
	cbz	w0, .LBB29_1234
.LBB29_1023:
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	up_write
.LBB29_1024:
	mov	x0, x19
	bl	mnt_drop_write_file
	adrp	x8, jiffies
	ldr	x8, [x8, :lo12:jiffies]
	stp	x8, x8, [x21, #504]
	str	x8, [x21, #520]
	tbnz	w26, #31, .LBB29_768
// %bb.1025:
	ldrb	w9, [x25, #110]
	ldr	x8, [x25, #64]
	tbnz	w9, #5, .LBB29_1027
// %bb.1026:
	ldr	x10, [x25]
	mov	x9, x20
	tbz	w10, #26, .LBB29_1028
.LBB29_1027:
	mov	x9, x27
.LBB29_1028:
	mov	w26, #-14
	//APP
		adds	x9, x9, 16
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_768
// %bb.1029:
	add	x1, sp, #104            // =104
	mov	w2, #16
	ldr	x8, [x25, #64]
	//APP
		bics	xzr, x27, x8
	csel	x0, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_to_user
	cmp	x0, #0                  // =0
	csel	w26, wzr, w26, eq
	b	.LBB29_768
.LBB29_1030:
	add	x23, x27, #1028         // =1028
	mov	x0, x23
	bl	_raw_spin_lock
	ldr	x8, [x21, #888]
	add	x24, x21, #888          // =888
	cmp	x8, x24
	b.ne	.LBB29_1033
// %bb.1031:
	ldr	x25, [x27, #1008]
	add	x26, x27, #1000         // =1000
	mov	x0, x24
	mov	x2, x26
	mov	x1, x25
	bl	__list_add_valid
	tbz	w0, #0, .LBB29_1033
// %bb.1032:
	str	x24, [x27, #1008]
	stp	x26, x25, [x24]
	str	x24, [x25]
.LBB29_1033:
	ldr	w8, [x27, #1880]
	mov	x0, x23
	add	w8, w8, #1              // =1
	str	w8, [x27, #1880]
	bl	_raw_spin_unlock
	add	x8, x21, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, 32768
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	mov	x0, x22
	mov	w9, #536870912
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	up_write
	ldr	x8, [x21, #40]
	adrp	x9, jiffies
	ldr	x8, [x8, #1104]
	ldr	x9, [x9, :lo12:jiffies]
	stp	x9, x9, [x8, #504]
	str	x9, [x8, #520]
	//APP
	mrs x9, sp_el0
	//NO_APP
	ldr	x8, [x21, #40]
	str	x9, [x21, #920]
	ldr	x8, [x8, #1104]
	ldr	w9, [x8, #1880]
	ldr	w10, [x8, #2132]
	cmp	w9, w10
	b.le	.LBB29_1093
// %bb.1034:
	mov	w23, wzr
	str	w9, [x8, #2132]
	b	.LBB29_905
.LBB29_1035:                            //   in Loop: Header=BB29_1036 Depth=1
	subs	w28, w28, w25
	add	x24, x24, w25, sxtw
	b.eq	.LBB29_1519
.LBB29_1036:                            // =>This Inner Loop Header: Depth=1
	cmp	w27, w28
	mov	x0, x21
	csel	w25, w27, w28, lt
	mov	x1, x24
	mov	w2, w25
	bl	redirty_blocks
	mov	w23, w0
	tbnz	w0, #31, .LBB29_1521
// %bb.1037:                            //   in Loop: Header=BB29_1036 Depth=1
	ldr	w8, [x21, #768]
	cmp	w8, w26
	b.lo	.LBB29_1035
// %bb.1038:                            //   in Loop: Header=BB29_1036 Depth=1
	ldr	x0, [x21, #48]
	bl	filemap_fdatawrite
	b	.LBB29_1035
.LBB29_1039:
	mov	w24, wzr
	mov	w25, #-22
	b	.LBB29_528
.LBB29_1040:
	mov	w23, #-95
	b	.LBB29_1096
.LBB29_1041:
	ldurb	w8, [x29, #-144]
	mov	w10, #1
	ldurb	w9, [x29, #-143]
	mov	x0, x22
	mov	w1, #1
	strb	w8, [x22, #1260]
	lsl	w8, w10, w9
	strb	w9, [x22, #1261]
	str	w8, [x22, #1268]
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x22
	bl	f2fs_is_compress_backend_ready
	tbnz	w0, #0, .LBB29_1043
// %bb.1042:
	adrp	x1, .L.str.56
	mov	x0, x21
	add	x1, x1, :lo12:.L.str.56
	bl	f2fs_printk
.LBB29_1043:
	mov	w23, wzr
	b	.LBB29_711
.LBB29_1044:
	ldr	w12, [x21, #3024]
	cbz	w12, .LBB29_1052
// %bb.1045:
	ldr	x11, [x21]
	cmp	w12, #1                 // =1
	ldr	x11, [x11, #248]
	b.lt	.LBB29_1051
// %bb.1046:
	mov	x14, xzr
	add	x13, x8, #80            // =80
	b	.LBB29_1048
.LBB29_1047:                            //   in Loop: Header=BB29_1048 Depth=1
	add	x14, x14, #1            // =1
	add	x13, x13, #192          // =192
	cmp	x14, x12
	b.eq	.LBB29_1051
.LBB29_1048:                            // =>This Inner Loop Header: Depth=1
	ldur	w15, [x13, #-4]
	cmp	w15, w9
	b.hi	.LBB29_1047
// %bb.1049:                            //   in Loop: Header=BB29_1048 Depth=1
	ldr	w15, [x13]
	cmp	w15, w9
	b.lo	.LBB29_1047
// %bb.1050:
	ldur	x11, [x13, #-80]
.LBB29_1051:
	cbz	x11, .LBB29_129
.LBB29_1052:
	ldr	x11, [x21, #136]
	cbz	x11, .LBB29_1204
// %bb.1053:
	add	x12, x11, #80           // =80
	b	.LBB29_1205
.LBB29_1054:
	adrp	x0, init_user_ns
	add	x0, x0, :lo12:init_user_ns
	bl	make_kprojid
	ldr	w8, [x22, #1164]
	mov	x23, x0
	cmp	w8, w23
	b.ne	.LBB29_1146
// %bb.1055:
	mov	w25, wzr
	b	.LBB29_1351
.LBB29_1056:
	ldr	x25, [x21, #48]
	ldr	x8, [x25, #32]
	cbz	x8, .LBB29_1229
// %bb.1057:
	ldr	x2, [x21, #64]
	adrp	x1, .L.str.89
	add	x1, x1, :lo12:.L.str.89
	mov	x0, x23
	bl	f2fs_printk
	mov	w24, #-16
	b	.LBB29_1377
.LBB29_1058:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	adrp	x1, .L.str.62
	ldr	x4, [x22, #64]
	adrp	x2, .L__func__.f2fs_dedup_param_check
	add	x1, x1, :lo12:.L.str.62
	add	x2, x2, :lo12:.L__func__.f2fs_dedup_param_check
	mov	x0, x24
	ldr	x3, [x8, #64]
	bl	f2fs_printk
	mov	w25, #-22
.LBB29_1059:
	ldr	x0, [sp, #72]           // 8-byte Folded Reload
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
	tbz	w21, #1, .LBB29_686
	b	.LBB29_685
.LBB29_1060:
	ldrb	w8, [x25, #12]
	tbnz	w8, #3, .LBB29_1170
// %bb.1061:
	ldr	x2, [x25, #64]
	adrp	x1, .L.str.60
	add	x1, x1, :lo12:.L.str.60
	b	.LBB29_959
.LBB29_1062:
	ldrsw	x8, [x26, #1160]
	add	x8, x8, #360            // =360
	cmp	x8, #400                // =400
	b.lo	.LBB29_1183
// %bb.1063:
	cmp	x26, x24
	b.eq	.LBB29_1391
// %bb.1064:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w28, w0
	cbnz	w0, .LBB29_1184
// %bb.1065:
	add	x22, x24, #160          // =160
	mov	x0, x22
	bl	down_write
	add	x23, x26, #160          // =160
	mov	x0, x23
	bl	down_write_trylock
	cbz	w0, .LBB29_1548
// %bb.1066:
	ldr	x8, [x24, #712]
	tbnz	x8, #43, .LBB29_1555
// %bb.1067:
	ldr	w8, [x24, #72]
	cbz	w8, .LBB29_1769
// %bb.1068:
	ldr	x8, [x26, #712]
	tbnz	x8, #43, .LBB29_1873
.LBB29_1069:
	ldr	x2, [x26, #64]
	adrp	x1, .L.str.81
	add	x1, x1, :lo12:.L.str.81
	b	.LBB29_1556
.LBB29_1070:
	ldr	w8, [sp, #88]           // 4-byte Folded Reload
	cbz	w8, .LBB29_1077
// %bb.1071:
	tbz	w25, #31, .LBB29_1077
// %bb.1072:
	ldr	w8, [x22, #1256]
	cbz	w8, .LBB29_1077
// %bb.1073:
	mov	x0, x22
	mov	x1, x28
	bl	f2fs_release_reserved_blocks
	ldr	w8, [sp, #88]           // 4-byte Folded Reload
	sub	w8, w8, w0
	str	w8, [sp, #88]           // 4-byte Folded Spill
	b	.LBB29_1077
.LBB29_1074:
	mov	x21, #-5
	b	.LBB29_577
.LBB29_1075:
	mov	w28, #-5
	sxtw	x21, w28
	b	.LBB29_577
.LBB29_1076:
	mov	w25, wzr
	str	wzr, [sp, #88]          // 4-byte Folded Spill
.LBB29_1077:
	ldr	x0, [sp, #72]           // 8-byte Folded Reload
	bl	up_write
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	bl	up_write
	tbnz	w25, #31, .LBB29_1079
// %bb.1078:
	mov	x0, x22
	mov	w1, #1
	add	x8, x22, #712           // =712
	mov	x9, #34359738368
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x22
	bl	current_time
	stp	x0, x1, [x22, #120]
	mov	x0, x22
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
.LBB29_1079:
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
	tbnz	w25, #31, .LBB29_1088
// %bb.1080:
	ldr	w13, [sp, #88]          // 4-byte Folded Reload
.LBB29_1081:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_1083
// %bb.1082:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_1084
.LBB29_1083:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_1084:
	//APP
		adds	x10, x10, 8
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1260
// %bb.1085:
	lsl	x9, x20, #8
	ldr	x11, [x8, #64]
	and	x12, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x12, x11
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	mov	w11, w13
	ldr	w12, [x9, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB29_1902
// %bb.1086:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB29_1903
.LBB29_1087:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1904
.LBB29_1088:
	ldr	w8, [sp, #88]           // 4-byte Folded Reload
	cbz	w8, .LBB29_1352
// %bb.1089:
	ldr	w8, [x22, #1256]
	cbz	w8, .LBB29_1352
// %bb.1090:
	cbz	x21, .LBB29_1092
// %bb.1091:
	add	x8, x21, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB29_1092:
	ldr	x3, [x22, #64]
	adrp	x1, .L.str.48
	ldr	x4, [x22, #144]
	adrp	x2, .L__func__.f2fs_reserve_compress_blocks
	ldr	w6, [x22, #1256]
	add	x1, x1, :lo12:.L.str.48
	ldr	w5, [sp, #88]           // 4-byte Folded Reload
	add	x2, x2, :lo12:.L__func__.f2fs_reserve_compress_blocks
	mov	x0, x21
	bl	f2fs_printk
	b	.LBB29_1352
.LBB29_1093:
	mov	w23, wzr
	b	.LBB29_905
.LBB29_1094:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x20, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x24, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x20, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB29_328
.LBB29_1095:
	mov	w23, #-16
.LBB29_1096:
	mov	x0, x22
	b	.LBB29_915
.LBB29_1097:
	mov	x0, x22
	mov	w1, #1
	add	x8, x22, #712           // =712
	mov	x9, #34359738368
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x22
	bl	current_time
	stp	x0, x1, [x22, #120]
	mov	x0, x22
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	ldr	w8, [x22, #1256]
	cbz	w8, .LBB29_1385
// %bb.1098:
	add	x0, x22, #1016          // =1016
	str	x0, [sp, #72]           // 8-byte Folded Spill
	bl	down_write
	add	x0, x22, #1064          // =1064
	str	x0, [sp, #64]           // 8-byte Folded Spill
	bl	down_write
	ldr	x8, [x22, #80]
	add	x8, x8, #4095           // =4095
	lsr	x8, x8, #12
	str	x8, [sp, #88]           // 8-byte Folded Spill
	cbz	x8, .LBB29_1477
// %bb.1099:
	sub	x8, x29, #144           // =144
	mov	x28, xzr
	mov	w24, wzr
	add	x26, x8, #8             // =8
	b	.LBB29_1103
.LBB29_1100:                            //   in Loop: Header=BB29_1103 Depth=1
	stp	xzr, xzr, [x26]
	tbnz	w25, #31, .LBB29_1478
// %bb.1101:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	add	w24, w25, w24
	add	x28, x8, x28
.LBB29_1102:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	cmp	x8, x28
	b.ls	.LBB29_1478
.LBB29_1103:                            // =>This Inner Loop Header: Depth=1
	sub	x0, x29, #144           // =144
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	sub	x0, x29, #144           // =144
	mov	x1, x28
	mov	w2, #1
	stur	x22, [x29, #-144]
	stp	xzr, xzr, [x26]
	str	wzr, [x26, #16]
	bl	f2fs_get_dnode_of_data
	cbz	w0, .LBB29_1106
// %bb.1104:                            //   in Loop: Header=BB29_1103 Depth=1
	mov	w25, w0
	cmn	w0, #2                  // =2
	b.ne	.LBB29_1478
// %bb.1105:                            //   in Loop: Header=BB29_1103 Depth=1
	sub	x0, x29, #144           // =144
	mov	x1, x28
	bl	f2fs_get_next_page_offset
	mov	x28, x0
	mov	w25, wzr
	b	.LBB29_1102
.LBB29_1106:                            //   in Loop: Header=BB29_1103 Depth=1
	ldur	x8, [x29, #-128]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w9, w8
	b.ne	.LBB29_1110
// %bb.1107:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	w8, [x22, #1160]
	ldr	w9, [x22, #1168]
	ldrh	w10, [x22]
	add	w8, w9, w8, asr #2
	mov	w9, #923
	sub	w8, w9, w8
	and	w9, w10, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_1114
// %bb.1108:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x9, [x22, #712]
	tbz	w9, #31, .LBB29_1114
// %bb.1109:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	w9, [x22, #1268]
	neg	w9, w9
	b	.LBB29_1113
.LBB29_1110:                            //   in Loop: Header=BB29_1103 Depth=1
	ldrh	w8, [x22]
	and	w9, w8, #0xf000
	mov	w8, #1018
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_1114
// %bb.1111:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x9, [x22, #712]
	mov	w8, #1018
	tbz	w9, #31, .LBB29_1114
// %bb.1112:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	w8, [x22, #1268]
	mov	w9, #1018
	neg	w8, w8
.LBB29_1113:                            //   in Loop: Header=BB29_1103 Depth=1
	and	w8, w8, w9
.LBB29_1114:                            //   in Loop: Header=BB29_1103 Depth=1
	ldur	w9, [x29, #-116]
	mov	w8, w8
	ldr	w10, [x22, #1268]
	sub	x0, x29, #144           // =144
	sub	x8, x8, x9
	ldr	x9, [sp, #88]           // 8-byte Folded Reload
	sub	x9, x9, x28
	cmp	x8, x9
	csel	x8, x8, x9, lo
	sub	w9, w10, #1             // =1
	sub	x8, x8, #1              // =1
	orr	x8, x8, x9
	add	x1, x8, #1              // =1
	str	x1, [sp, #80]           // 8-byte Folded Spill
	bl	release_compress_blocks
	ldur	x27, [x29, #-128]
	mov	w25, w0
	cbz	x27, .LBB29_1139
// %bb.1115:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [x27, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x27, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x27, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB29_1131
// %bb.1116:                            //   in Loop: Header=BB29_1103 Depth=1
	tbnz	w8, #0, .LBB29_1130
// %bb.1117:                            //   in Loop: Header=BB29_1103 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1120
// %bb.1118:                            //   in Loop: Header=BB29_1103 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1120
// %bb.1119:                            //   in Loop: Header=BB29_1103 Depth=1
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB29_1120:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1122
// %bb.1121:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1143
.LBB29_1122:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x0, [x27, #24]
.LBB29_1123:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1125
// %bb.1124:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1144
.LBB29_1125:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x0, [x27, #24]
.LBB29_1126:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1128
// %bb.1127:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1145
.LBB29_1128:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x0, [x27, #24]
.LBB29_1129:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB29_1130:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_1137
	b	.LBB29_2063
.LBB29_1131:                            //   in Loop: Header=BB29_1103 Depth=1
	tbnz	w8, #0, .LBB29_1136
// %bb.1132:                            //   in Loop: Header=BB29_1103 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1135
// %bb.1133:                            //   in Loop: Header=BB29_1103 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1135
// %bb.1134:                            //   in Loop: Header=BB29_1103 Depth=1
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB29_1135:                            //   in Loop: Header=BB29_1103 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_1136:                            //   in Loop: Header=BB29_1103 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2064
.LBB29_1137:                            //   in Loop: Header=BB29_1103 Depth=1
	mov	x0, x27
	bl	unlock_page
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
	cbnz	w9, .LBB29_1139
// %bb.1138:                            //   in Loop: Header=BB29_1103 Depth=1
	bl	__put_page
.LBB29_1139:                            //   in Loop: Header=BB29_1103 Depth=1
	ldur	x8, [x29, #-136]
	cbz	x8, .LBB29_1100
// %bb.1140:                            //   in Loop: Header=BB29_1103 Depth=1
	ldur	x9, [x29, #-128]
	cmp	x9, x8
	b.eq	.LBB29_1100
// %bb.1141:                            //   in Loop: Header=BB29_1103 Depth=1
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
	cbnz	w9, .LBB29_1100
// %bb.1142:                            //   in Loop: Header=BB29_1103 Depth=1
	bl	__put_page
	b	.LBB29_1100
.LBB29_1143:                            //   in Loop: Header=BB29_1103 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1123
.LBB29_1144:                            //   in Loop: Header=BB29_1103 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1126
.LBB29_1145:                            //   in Loop: Header=BB29_1103 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1129
.LBB29_1146:
	ldrb	w8, [x22, #12]
	tbnz	w8, #5, .LBB29_1350
// %bb.1147:
	ldr	x1, [x22, #64]
	mov	x0, x24
	bl	f2fs_get_node_page
	mov	x25, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB29_1351
// %bb.1148:
	ldrsw	x26, [x22, #1160]
	cbz	x25, .LBB29_1536
// %bb.1149:
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
	b.ne	.LBB29_1528
// %bb.1150:
	tbnz	w8, #0, .LBB29_1164
// %bb.1151:
	bl	print_bdev_access_info
	adrp	x27, f2fs_dclient
	ldr	x0, [x27, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1154
// %bb.1152:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1154
// %bb.1153:
	ldr	x0, [x27, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x27, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1154:
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1156
// %bb.1155:
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB29_2020
.LBB29_1156:
	ldr	x0, [x25, #24]
.LBB29_1157:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1159
// %bb.1158:
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB29_2021
.LBB29_1159:
	ldr	x0, [x25, #24]
.LBB29_1160:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1162
// %bb.1161:
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB29_2022
.LBB29_1162:
	ldr	x0, [x25, #24]
.LBB29_1163:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB29_1164:
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_1534
// %bb.1165:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_1166:
	add	x0, sp, #104            // =104
	mov	w1, wzr
	mov	w2, #4
	bl	memset
	ldr	x8, [x21, #712]
	tbz	x8, #48, .LBB29_1168
// %bb.1167:
	ldr	w8, [sp, #104]
	orr	w8, w8, #0x1
	str	w8, [sp, #104]
.LBB29_1168:
	ldr	x8, [x21, #712]
	tbz	x8, #49, .LBB29_1376
// %bb.1169:
	ldr	w8, [sp, #104]
	mov	w24, wzr
	orr	w8, w8, #0x2
	str	w8, [sp, #104]
	b	.LBB29_1377
.LBB29_1170:
	cmp	x23, x25
	b.eq	.LBB29_1390
// %bb.1171:
	mov	x0, x26
	mov	x1, x23
	mov	w2, #1
	bl	f2fs_inode_param_check
	mov	w28, w0
	cbnz	w0, .LBB29_961
// %bb.1172:
	mov	x0, x26
	mov	x1, x25
	mov	w2, #2
	bl	f2fs_inode_param_check
	mov	w28, w0
	cbnz	w0, .LBB29_961
// %bb.1173:
	ldr	w8, [x23, #72]
	cbz	w8, .LBB29_1768
// %bb.1174:
	ldr	x0, [x19, #24]
	ldrb	w8, [x0, #3]
	tbnz	w8, #2, .LBB29_2005
.LBB29_1175:
	bl	dget_parent
	mov	x26, x0
	ldr	x0, [x0, #48]
	ldrb	w8, [x0, #13]
	tbz	w8, #6, .LBB29_1177
// %bb.1176:
	ldr	x8, [x25, #40]
	mov	x1, x25
	ldr	x27, [x8, #1104]
	bl	fscrypt_has_permitted_context
	cbz	w0, .LBB29_1899
.LBB29_1177:
	mov	x0, x26
	bl	dput
	ldr	x0, [x23, #48]
	bl	filemap_fdatawrite
	ldr	x0, [x23, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w28, w0
	cbnz	w0, .LBB29_961
// %bb.1178:
	ldr	x8, [x23, #40]
	mov	x0, x23
	mov	x1, x25
	ldr	x26, [x8, #1104]
	bl	dedup_file_is_same
	tbz	w0, #0, .LBB29_1901
// %bb.1179:
	add	x0, x26, #368           // =368
	str	x0, [sp, #88]           // 8-byte Folded Spill
	bl	_raw_spin_lock
	ldr	x8, [x26, #352]
	cbz	x8, .LBB29_1181
// %bb.1180:
	adrp	x27, jiffies
	ldr	x8, [x26, #360]
	ldr	x9, [x27, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB29_1973
.LBB29_1181:
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	bl	_raw_spin_unlock
	add	x0, x26, #304           // =304
	str	x0, [sp, #80]           // 8-byte Folded Spill
	bl	down_read
	mov	x0, x26
	bl	f2fs_acquire_orphan_inode
	cbz	w0, .LBB29_1944
// %bb.1182:
	ldr	x2, [x23, #64]
	adrp	x1, .L.str.73
	ldr	x3, [x25, #64]
	mov	w28, w0
	add	x1, x1, :lo12:.L.str.73
	mov	x0, x26
	bl	f2fs_printk
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	up_read
	b	.LBB29_961
.LBB29_1183:
	mov	w28, #-95
.LBB29_1184:
	tbz	w21, #1, .LBB29_1186
.LBB29_1185:
	mov	x0, x20
	bl	__f_unlock_pos
.LBB29_1186:
	tbz	w21, #0, .LBB29_1188
.LBB29_1187:
	mov	x0, x20
	bl	fput
.LBB29_1188:
	sxtw	x21, w28
	b	.LBB29_577
.LBB29_1189:
	mov	w2, #32
	b	.LBB29_1196
.LBB29_1190:
	mov	w22, #-5
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_1191:
	mov	w2, #28
	b	.LBB29_1198
.LBB29_1192:
	mov	w25, #-5
	sxtw	x21, w25
	b	.LBB29_577
.LBB29_1193:
	mov	w2, #24
	b	.LBB29_1201
.LBB29_1194:
	mov	w21, #-5
	sxtw	x21, w21
	b	.LBB29_577
.LBB29_1195:
	mov	x2, x0
.LBB29_1196:
	sub	x8, x29, #144           // =144
	sub	x8, x8, x2
	add	x0, x8, #32             // =32
	b	.LBB29_1202
.LBB29_1197:
	mov	x2, x0
.LBB29_1198:
	sub	x8, x29, #144           // =144
	mov	w1, wzr
	sub	x8, x8, x2
	add	x0, x8, #28             // =28
.LBB29_1199:
	bl	memset
	b	.LBB29_1260
.LBB29_1200:
	mov	x2, x0
.LBB29_1201:
	sub	x8, x29, #144           // =144
	sub	x8, x8, x2
	add	x0, x8, #24             // =24
.LBB29_1202:
	mov	w1, wzr
	bl	memset
	mov	x21, #-14
	b	.LBB29_577
.LBB29_1203:
	ldr	x2, [x22, #64]
	adrp	x1, .L.str.51
	add	x1, x1, :lo12:.L.str.51
	b	.LBB29_1246
.LBB29_1204:
	ldr	x12, [x21, #16]
	add	x12, x12, #72           // =72
.LBB29_1205:
	ldr	x11, [x11, #8]
	ldr	w12, [x12]
	ldr	w13, [x21, #1184]
	ldr	w11, [x11]
	sub	w9, w9, w12
	lsr	w9, w9, w13
	sub	w9, w9, w11
.LBB29_1206:
	mov	w11, #192
	mul	x10, x10, x11
	add	x10, x8, x10
	ldr	w10, [x10, #80]
	add	w11, w10, #3            // =3
	cmp	w11, #4                 // =4
	b.hs	.LBB29_1208
.LBB29_1207:
	mov	w8, #-1
	b	.LBB29_1220
.LBB29_1208:
	ldr	w12, [x21, #3024]
	cbz	w12, .LBB29_1216
// %bb.1209:
	ldr	x11, [x21]
	cmp	w12, #1                 // =1
	ldr	x11, [x11, #248]
	b.lt	.LBB29_1215
// %bb.1210:
	mov	x13, xzr
	add	x8, x8, #80             // =80
	b	.LBB29_1212
.LBB29_1211:                            //   in Loop: Header=BB29_1212 Depth=1
	add	x13, x13, #1            // =1
	add	x8, x8, #192            // =192
	cmp	x13, x12
	b.eq	.LBB29_1215
.LBB29_1212:                            // =>This Inner Loop Header: Depth=1
	ldur	w14, [x8, #-4]
	cmp	w14, w10
	b.hi	.LBB29_1211
// %bb.1213:                            //   in Loop: Header=BB29_1212 Depth=1
	ldr	w14, [x8]
	cmp	w14, w10
	b.lo	.LBB29_1211
// %bb.1214:
	ldur	x11, [x8, #-80]
.LBB29_1215:
	cbz	x11, .LBB29_1207
.LBB29_1216:
	ldr	x8, [x21, #136]
	cbz	x8, .LBB29_1218
// %bb.1217:
	add	x11, x8, #80            // =80
	b	.LBB29_1219
.LBB29_1218:
	ldr	x11, [x21, #16]
	add	x11, x11, #72           // =72
.LBB29_1219:
	ldr	x8, [x8, #8]
	ldr	w11, [x11]
	ldr	w12, [x21, #1184]
	ldr	w8, [x8]
	sub	w10, w10, w11
	lsr	w10, w10, w12
	sub	w8, w10, w8
.LBB29_1220:
	ldr	w10, [x24, #216]
	ldur	w11, [x29, #-140]
	cmp	w10, w8
	ccmp	w10, w9, #0, lo
	csel	w20, w9, w10, lo
	add	w9, w20, w11
	cmp	w9, w8
	csel	w26, w9, w8, lo
	cmp	w20, w26
	b.hs	.LBB29_1227
// %bb.1221:
	add	x23, x21, #1664         // =1664
	add	w27, w26, #1            // =1
	b	.LBB29_1224
.LBB29_1222:                            //   in Loop: Header=BB29_1224 Depth=1
	mov	w22, wzr
.LBB29_1223:                            //   in Loop: Header=BB29_1224 Depth=1
	add	w20, w20, #1            // =1
	cmp	w20, w26
	b.hs	.LBB29_702
.LBB29_1224:                            // =>This Inner Loop Header: Depth=1
	mov	x0, x23
	bl	down_write_trylock
	cbz	w0, .LBB29_1495
// %bb.1225:                            //   in Loop: Header=BB29_1224 Depth=1
	stp	w27, w27, [x24, #200]
	mov	x0, x21
	str	w27, [x24, #212]
	mov	w1, #1
	ldr	w8, [x25, #108]
	mov	w2, #1
	mov	w3, #1
	mov	w4, w20
	orr	w8, w8, #0x2000000
	str	w8, [x25, #108]
	bl	f2fs_gc
	ldr	w8, [x25, #108]
	cmn	w0, #11                 // =11
	and	w8, w8, #0xfdffffff
	str	w8, [x25, #108]
	b.eq	.LBB29_1222
// %bb.1226:                            //   in Loop: Header=BB29_1224 Depth=1
	mov	w22, w0
	tbz	w0, #31, .LBB29_1223
	b	.LBB29_702
.LBB29_1227:
	mov	w22, wzr
	b	.LBB29_702
.LBB29_1228:
	mov	w23, wzr
	b	.LBB29_914
.LBB29_1229:
	mov	x0, x23
	mov	x1, x21
	mov	w2, #3
	bl	f2fs_inode_param_check
	mov	w24, w0
	cbnz	w0, .LBB29_1377
// %bb.1230:
	mov	x0, x25
	mov	w1, wzr
	bl	mapping_tagged
	cbnz	w0, .LBB29_1232
// %bb.1231:
	mov	x0, x25
	mov	w1, #1
	bl	mapping_tagged
	cbz	w0, .LBB29_1549
.LBB29_1232:
	ldr	w3, [x21, #768]
	ldrsb	w8, [sp, #104]
	tbnz	w8, #31, .LBB29_1526
// %bb.1233:
	ldr	x2, [x21, #64]
	adrp	x1, .L.str.91
	add	x1, x1, :lo12:.L.str.91
	mov	x0, x23
	bl	f2fs_printk
	mov	w24, #-22
	b	.LBB29_1377
.LBB29_1234:
	add	x8, x24, x23
	lsr	x24, x23, #12
	add	x2, sp, #136            // =136
	mov	x0, x22
	mov	x1, x24
	lsr	x28, x8, #12
	bl	f2fs_lookup_extent_cache
	tbz	w0, #0, .LBB29_1236
// %bb.1235:
	ldp	w8, w9, [sp, #136]
	add	w8, w9, w8
	cmp	x28, x8
	b.ls	.LBB29_1243
.LBB29_1236:
	add	x8, sp, #96             // =96
	cmp	x28, w24, uxtw
	stur	w24, [x29, #-140]
	stur	x8, [x29, #-128]
	b.ls	.LBB29_1243
// %bb.1237:
	mov	w23, wzr
	mov	w8, w24
	str	wzr, [sp, #64]          // 4-byte Folded Spill
	str	wzr, [sp, #72]          // 4-byte Folded Spill
.LBB29_1238:                            // =>This Inner Loop Header: Depth=1
	sub	w8, w28, w8
	sub	x1, x29, #144           // =144
	mov	x0, x22
	mov	w2, wzr
	mov	w3, wzr
	stur	w8, [x29, #-136]
	bl	f2fs_map_blocks
	cbnz	w0, .LBB29_1822
// %bb.1239:                            //   in Loop: Header=BB29_1238 Depth=1
	ldurh	w8, [x29, #-132]
	mov	w9, #4192
	tst	w8, w9
	b.ne	.LBB29_1241
// %bb.1240:                            //   in Loop: Header=BB29_1238 Depth=1
	ldr	x8, [sp, #96]
	cmp	x28, w8, uxtw
	stur	w8, [x29, #-140]
	b.hi	.LBB29_1238
	b	.LBB29_1242
.LBB29_1241:                            //   in Loop: Header=BB29_1238 Depth=1
	ldp	w9, w8, [x29, #-144]
	ldr	w11, [sp, #64]          // 4-byte Folded Reload
	ldur	w10, [x29, #-136]
	cmp	w11, w9
	ccmp	w11, #0, #4, ne
	ldr	w11, [sp, #72]          // 4-byte Folded Reload
	add	w9, w10, w9
	add	w8, w8, w10
	csinc	w23, w23, wzr, eq
	cmp	x28, x8
	add	w11, w10, w11
	str	w9, [sp, #64]           // 4-byte Folded Spill
	str	w11, [sp, #72]          // 4-byte Folded Spill
	stur	w8, [x29, #-140]
	b.hi	.LBB29_1238
.LBB29_1242:
	tbnz	w23, #0, .LBB29_1560
.LBB29_1243:
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	up_write
	str	wzr, [sp, #72]          // 4-byte Folded Spill
.LBB29_1244:
	ldr	w8, [sp, #72]           // 4-byte Folded Reload
	mov	w26, wzr
	mov	w8, w8
	lsl	x8, x8, #12
	str	x8, [sp, #112]
	b	.LBB29_1024
.LBB29_1245:
	ldr	x2, [x22, #64]
	adrp	x1, .L.str.52
	add	x1, x1, :lo12:.L.str.52
.LBB29_1246:
	mov	x0, x21
	bl	f2fs_printk
.LBB29_1247:
	mov	w27, wzr
	mov	w24, wzr
	mov	w25, #-95
.LBB29_1248:
	ldr	x26, [sp, #88]          // 8-byte Folded Reload
.LBB29_1249:
	mov	x0, x26
	bl	up_write
	ldr	x8, [x19, #32]
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_1251
// %bb.1250:
	ldr	x0, [x8, #40]
	mov	w1, #1
	bl	__sb_end_write
.LBB29_1251:
	cbnz	w25, .LBB29_1352
// %bb.1252:
	tbnz	w27, #31, .LBB29_1261
// %bb.1253:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w10, [x8, #110]
	ldr	x9, [x8, #64]
	tbnz	w10, #5, .LBB29_1255
// %bb.1254:
	ldr	x11, [x8]
	mov	x10, x20
	tbz	w11, #26, .LBB29_1256
.LBB29_1255:
	lsl	x10, x20, #8
	and	x10, x20, x10, asr #8
.LBB29_1256:
	//APP
		adds	x10, x10, 8
	csel	x9, xzr, x9, hi
	csinv	x10, x10, xzr, cc
	sbcs	xzr, x10, x9
	cset	x10, ls

	//NO_APP
	cbz	x10, .LBB29_1260
// %bb.1257:
	lsl	x9, x20, #8
	ldr	x11, [x8, #64]
	and	x12, x20, x9, asr #8
	adrp	x9, arm64_const_caps_ready
	//APP
		bics	xzr, x12, x11
	csel	x10, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	mov	w11, w24
	ldr	w12, [x9, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB29_1966
// %bb.1258:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB29_1967
.LBB29_1259:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1968
.LBB29_1260:
	mov	w25, #-14
	sxtw	x21, w25
	b	.LBB29_577
.LBB29_1261:
	cbz	w24, .LBB29_1266
// %bb.1262:
	ldr	w8, [x22, #1256]
	cbz	w8, .LBB29_1266
// %bb.1263:
	cbz	x21, .LBB29_1265
// %bb.1264:
	add	x8, x21, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB29_1265:
	ldr	x3, [x22, #64]
	adrp	x1, .L.str.47
	ldr	x4, [x22, #144]
	adrp	x2, .L__func__.f2fs_ioc_compress_release_file
	ldr	w6, [x22, #1256]
	add	x1, x1, :lo12:.L.str.47
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_compress_release_file
	mov	x0, x21
	mov	w5, w24
	bl	f2fs_printk
.LBB29_1266:
	mov	w25, w27
	b	.LBB29_1352
.LBB29_1267:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x21, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x23, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x21, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB29_731
.LBB29_1268:
	cbz	w23, .LBB29_1270
.LBB29_1269:
	add	x8, x22, #712           // =712
	mov	x9, #17179869184
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	b	.LBB29_1271
.LBB29_1270:
	ldr	x0, [x22, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w23, w0
	mov	x8, #17179869184
	ldr	x11, [sp, #88]          // 8-byte Folded Reload
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x11]
1:	ldxr	x9, [x11]
	bic	x9, x9, x8
	stxr	w10, x9, [x11]
	cbnz	w10, 1b
	//NO_APP
	cbz	w0, .LBB29_914
.LBB29_1271:
	adrp	x1, .L.str.53
	adrp	x2, .L__func__.f2fs_ioc_compress_file
	add	x1, x1, :lo12:.L.str.53
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_compress_file
	b	.LBB29_1389
.LBB29_1272:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB29_545
.LBB29_1273:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x9, [x9, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x9
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x9
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB29_1274:
	mov	w9, wzr
	//APP
	1:.if 1 == 1
661:
	str     w8, [x11]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr w8, [x11]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w9, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w8, [x10, :lo12:arm64_const_caps_ready]
	cmp	w8, #1                  // =1
	b.lt	.LBB29_1277
// %bb.1275:
	adrp	x8, cpu_hwcap_keys
	add	x8, x8, :lo12:cpu_hwcap_keys
	ldr	w8, [x8, #16]
	cmp	w8, #0                  // =0
	b.le	.LBB29_1278
.LBB29_1276:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w9
	b	.LBB29_577
.LBB29_1277:
	adrp	x8, cpu_hwcaps
	ldr	x8, [x8, :lo12:cpu_hwcaps]
	tbnz	w8, #4, .LBB29_1276
.LBB29_1278:
	//APP
	mrs	x8, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sxtw	x21, w9
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x8		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1279:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB29_369
.LBB29_1280:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x8
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB29_1281:
	mov	w8, wzr
	//APP
	1:.if 1 == 1
661:
	str     w11, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr w11, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w8, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w9, [x9, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_1284
// %bb.1282:
	adrp	x9, cpu_hwcap_keys
	add	x9, x9, :lo12:cpu_hwcap_keys
	ldr	w9, [x9, #16]
	cmp	w9, #0                  // =0
	b.le	.LBB29_1285
.LBB29_1283:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w8
	b	.LBB29_577
.LBB29_1284:
	adrp	x9, cpu_hwcaps
	ldr	x9, [x9, :lo12:cpu_hwcaps]
	tbnz	w9, #4, .LBB29_1283
.LBB29_1285:
	//APP
	mrs	x9, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sxtw	x21, w8
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x9		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1286:
	adrp	x11, cpu_hwcaps
	ldr	x11, [x11, :lo12:cpu_hwcaps]
	tbnz	w11, #4, .LBB29_378
.LBB29_1287:
	//APP
	mrs	x11, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x12, ttbr1_el1
	//NO_APP
	mov	x13, x8
	bfxil	x13, x12, #0, #48
	//APP
	msr ttbr1_el1, x13
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x11		// arch_local_irq_restore
	//NO_APP
.LBB29_1288:
	mov	w8, wzr
	//APP
	1:.if 1 == 1
661:
	str     w8, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr w8, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w8, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w9, [x9, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_1291
// %bb.1289:
	adrp	x9, cpu_hwcap_keys
	add	x9, x9, :lo12:cpu_hwcap_keys
	ldr	w9, [x9, #16]
	cmp	w9, #0                  // =0
	b.le	.LBB29_1292
.LBB29_1290:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w8
	b	.LBB29_577
.LBB29_1291:
	adrp	x9, cpu_hwcaps
	ldr	x9, [x9, :lo12:cpu_hwcaps]
	tbnz	w9, #4, .LBB29_1290
.LBB29_1292:
	//APP
	mrs	x9, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sxtw	x21, w8
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x9		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1293:
	adrp	x11, cpu_hwcaps
	ldr	x11, [x11, :lo12:cpu_hwcaps]
	tbnz	w11, #4, .LBB29_596
.LBB29_1294:
	//APP
	mrs	x11, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x12, ttbr1_el1
	//NO_APP
	mov	x13, x8
	bfxil	x13, x12, #0, #48
	//APP
	msr ttbr1_el1, x13
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x11		// arch_local_irq_restore
	//NO_APP
.LBB29_1295:
	mov	w8, wzr
	//APP
	1:.if 1 == 1
661:
	strb     w21, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttrb w21, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w8, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w9, [x9, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_1298
// %bb.1296:
	adrp	x9, cpu_hwcap_keys
	add	x9, x9, :lo12:cpu_hwcap_keys
	ldr	w9, [x9, #16]
	cmp	w9, #0                  // =0
	b.le	.LBB29_1299
.LBB29_1297:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w8
	b	.LBB29_577
.LBB29_1298:
	adrp	x9, cpu_hwcaps
	ldr	x9, [x9, :lo12:cpu_hwcaps]
	tbnz	w9, #4, .LBB29_1297
.LBB29_1299:
	//APP
	mrs	x9, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sxtw	x21, w8
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x9		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1300:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB29_385
.LBB29_1301:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x8
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB29_1302:
	mov	w8, wzr
	//APP
	1:.if 1 == 1
661:
	strb     w11, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttrb w11, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w8, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w9, [x9, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_1305
// %bb.1303:
	adrp	x9, cpu_hwcap_keys
	add	x9, x9, :lo12:cpu_hwcap_keys
	ldr	w9, [x9, #16]
	cmp	w9, #0                  // =0
	b.le	.LBB29_1306
.LBB29_1304:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w8
	b	.LBB29_577
.LBB29_1305:
	adrp	x9, cpu_hwcaps
	ldr	x9, [x9, :lo12:cpu_hwcaps]
	tbnz	w9, #4, .LBB29_1304
.LBB29_1306:
	//APP
	mrs	x9, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sxtw	x21, w8
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x9		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1307:
	adrp	x11, cpu_hwcaps
	ldr	x11, [x11, :lo12:cpu_hwcaps]
	tbnz	w11, #4, .LBB29_429
.LBB29_1308:
	//APP
	mrs	x11, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x12, ttbr1_el1
	//NO_APP
	mov	x13, x8
	bfxil	x13, x12, #0, #48
	//APP
	msr ttbr1_el1, x13
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x11		// arch_local_irq_restore
	//NO_APP
.LBB29_1309:
	mov	w8, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     w23, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr w23, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w8, -14
	mov	x23, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w9, [x9, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_1312
// %bb.1310:
	adrp	x9, cpu_hwcap_keys
	add	x9, x9, :lo12:cpu_hwcap_keys
	ldr	w9, [x9, #16]
	cmp	w9, #0                  // =0
	b.le	.LBB29_1313
.LBB29_1311:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1314
.LBB29_1312:
	adrp	x9, cpu_hwcaps
	ldr	x9, [x9, :lo12:cpu_hwcaps]
	tbnz	w9, #4, .LBB29_1311
.LBB29_1313:
	//APP
	mrs	x9, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x9		// arch_local_irq_restore
	//NO_APP
.LBB29_1314:
	cbz	w8, .LBB29_1316
.LBB29_1315:
	mov	w22, #-14
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_1316:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_1322
// %bb.1317:
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_1321
// %bb.1318:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w22, w0
	cbnz	w0, .LBB29_703
// %bb.1319:
	add	x20, x21, #160          // =160
	mov	x0, x20
	bl	down_write
	mov	x0, x21
	mov	x1, xzr
	bl	f2fs_should_update_outplace
	tbz	w0, #0, .LBB29_1323
// %bb.1320:
	mov	w22, #-22
	b	.LBB29_700
.LBB29_1321:
	mov	w22, #-30
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_1322:
	mov	w22, #-22
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_1323:
	ldr	x8, [x21, #712]
	tbz	x8, #49, .LBB29_1325
// %bb.1324:
	mov	x0, x21
	mov	w1, #1
	add	x8, x21, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB29_1325:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB29_1329
// %bb.1326:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB29_1328
// %bb.1327:
	ldr	x8, [x21, #712]
	tbnz	x8, #44, .LBB29_1329
.LBB29_1328:
	adrp	x1, .L__func__.f2fs_ioc_set_pin_file
	mov	x0, x21
	add	x1, x1, :lo12:.L__func__.f2fs_ioc_set_pin_file
	bl	f2fs_revoke_deduped_inode
	mov	w22, w0
	cbnz	w0, .LBB29_700
.LBB29_1329:
	cbz	w23, .LBB29_1332
// %bb.1330:
	ldr	x8, [x21, #40]
	ldr	w4, [x21, #696]
	ldr	x0, [x8, #1104]
	ldr	x8, [x0, #1912]
	cmp	x8, x4
	b.hs	.LBB29_1334
// %bb.1331:
	ldr	x3, [x21, #64]
	adrp	x1, .L.str.9
	adrp	x2, .L__func__.f2fs_pin_file_control
	add	x1, x1, :lo12:.L.str.9
	add	x2, x2, :lo12:.L__func__.f2fs_pin_file_control
                                        // kill: def $w4 killed $w4 killed $x4
	bl	f2fs_printk
	mov	x0, x21
	mov	w1, #1
	add	x8, x21, #712           // =712
	mov	w9, #268435456
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	w22, #-11
	b	.LBB29_700
.LBB29_1332:
	mov	x0, x21
	mov	w1, #1
	add	x8, x21, #712           // =712
	mov	w9, #268435456
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x21
	mov	w1, #1
	str	wzr, [x21, #696]
	bl	f2fs_mark_inode_dirty_sync
	mov	w22, wzr
.LBB29_1333:
	ldr	x8, [x21, #40]
	adrp	x9, jiffies
	ldr	x8, [x8, #1104]
	ldr	x9, [x9, :lo12:jiffies]
	stp	x9, x9, [x8, #504]
	str	x9, [x8, #520]
	b	.LBB29_700
.LBB29_1334:
	mov	x0, x21
	bl	f2fs_convert_inline_inode
	mov	w22, w0
	cbnz	w0, .LBB29_700
// %bb.1335:
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB29_1339
// %bb.1336:
	ldr	w8, [x21, #1256]
	cbnz	w8, .LBB29_1341
// %bb.1337:
	ldr	x8, [x21, #712]
	tbnz	x8, #35, .LBB29_1341
// %bb.1338:
	ldr	x8, [x21, #712]
	tbnz	x8, #34, .LBB29_1341
	b	.LBB29_1342
.LBB29_1339:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB29_1342
// %bb.1340:
	ldr	x8, [x21, #712]
	tbz	w8, #31, .LBB29_1342
.LBB29_1341:
	mov	x0, x19
	mov	w1, #12
	mov	w2, wzr
	bl	f2fs_decompress_file_internal
	mov	x22, x0
	cbnz	w22, .LBB29_700
.LBB29_1342:
	mov	x0, x21
	mov	w1, #1
	add	x8, x21, #712           // =712
	mov	w9, #268435456
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	ldr	w22, [x21, #696]
	b	.LBB29_1333
.LBB29_1343:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB29_14
.LBB29_1344:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x8
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB29_1345:
	mov	w8, wzr
	//APP
	1:.if 1 == 1
661:
	str     w11, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr w11, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w8, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w9, [x9, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_1348
// %bb.1346:
	adrp	x9, cpu_hwcap_keys
	add	x9, x9, :lo12:cpu_hwcap_keys
	ldr	w9, [x9, #16]
	cmp	w9, #0                  // =0
	b.le	.LBB29_1349
.LBB29_1347:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w8
	b	.LBB29_577
.LBB29_1348:
	adrp	x9, cpu_hwcaps
	ldr	x9, [x9, :lo12:cpu_hwcaps]
	tbnz	w9, #4, .LBB29_1347
.LBB29_1349:
	//APP
	mrs	x9, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sxtw	x21, w8
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x9		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1350:
	mov	w25, #-1
.LBB29_1351:
	mov	x0, x20
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
.LBB29_1352:
	sxtw	x21, w25
	b	.LBB29_577
.LBB29_1353:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB29_174
.LBB29_1354:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x8
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB29_1355:
	mov	w8, wzr
	//APP
	1:.if 1 == 1
661:
	str     w10, [x11]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr w10, [x11]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w8, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w9, [x9, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_1358
// %bb.1356:
	adrp	x9, cpu_hwcap_keys
	add	x9, x9, :lo12:cpu_hwcap_keys
	ldr	w9, [x9, #16]
	cmp	w9, #0                  // =0
	b.le	.LBB29_1359
.LBB29_1357:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w8
	b	.LBB29_577
.LBB29_1358:
	adrp	x9, cpu_hwcaps
	ldr	x9, [x9, :lo12:cpu_hwcaps]
	tbnz	w9, #4, .LBB29_1357
.LBB29_1359:
	//APP
	mrs	x9, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sxtw	x21, w8
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x9		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1360:
	adrp	x10, cpu_hwcaps
	ldr	x10, [x10, :lo12:cpu_hwcaps]
	tbnz	w10, #4, .LBB29_505
.LBB29_1361:
	//APP
	mrs	x10, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x8
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x10		// arch_local_irq_restore
	//NO_APP
.LBB29_1362:
	mov	w8, wzr
	//APP
	1:.if 1 == 1
661:
	str     w9, [x12]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr w9, [x12]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w8, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w9, [x11, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_1365
// %bb.1363:
	adrp	x9, cpu_hwcap_keys
	add	x9, x9, :lo12:cpu_hwcap_keys
	ldr	w9, [x9, #16]
	cmp	w9, #0                  // =0
	b.le	.LBB29_1366
.LBB29_1364:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w8
	b	.LBB29_577
.LBB29_1365:
	adrp	x9, cpu_hwcaps
	ldr	x9, [x9, :lo12:cpu_hwcaps]
	tbnz	w9, #4, .LBB29_1364
.LBB29_1366:
	//APP
	mrs	x9, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sxtw	x21, w8
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x9		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1367:
	ldr	x9, [x21, #40]
	ldr	w8, [sp, #104]
	ldr	x23, [x9, #1104]
	tbz	w8, #0, .LBB29_1371
// %bb.1368:
	ldr	x8, [x21, #712]
	tbnz	x8, #48, .LBB29_1370
// %bb.1369:
	ldr	x2, [x21, #64]
	adrp	x1, .L.str.95
	add	x1, x1, :lo12:.L.str.95
	mov	x0, x23
	bl	f2fs_printk
.LBB29_1370:
	mov	x0, x21
	mov	w1, #1
	add	x8, x21, #712           // =712
	mov	x9, #281474976710656
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	ldr	w8, [sp, #104]
.LBB29_1371:
	tbz	w8, #1, .LBB29_1375
// %bb.1372:
	ldr	x8, [x21, #712]
	tbnz	x8, #49, .LBB29_1374
// %bb.1373:
	ldr	x2, [x21, #64]
	adrp	x1, .L.str.96
	add	x1, x1, :lo12:.L.str.96
	mov	x0, x23
	bl	f2fs_printk
.LBB29_1374:
	mov	x0, x21
	mov	w1, #1
	add	x8, x21, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB29_1375:
	mov	x0, x21
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
.LBB29_1376:
	mov	w24, wzr
.LBB29_1377:
	mov	x0, x22
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
	ldrb	w9, [x26, #110]
	ldr	x8, [x26, #64]
	tbnz	w9, #5, .LBB29_1379
// %bb.1378:
	ldr	x10, [x26]
	mov	x9, x20
	tbz	w10, #26, .LBB29_1380
.LBB29_1379:
	mov	x9, x27
.LBB29_1380:
	mov	w22, #-14
	//APP
		adds	x9, x9, 8
	csel	x8, xzr, x8, hi
	csinv	x9, x9, xzr, cc
	sbcs	xzr, x9, x8
	cset	x9, ls

	//NO_APP
	cbz	x9, .LBB29_703
// %bb.1381:
	add	x1, sp, #104            // =104
	mov	w2, #8
	ldr	x8, [x26, #64]
	//APP
		bics	xzr, x27, x8
	csel	x0, x20, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	bl	__arch_copy_to_user
	cmp	x0, #0                  // =0
	csel	w22, w24, w22, eq
	b	.LBB29_703
.LBB29_1382:
	mov	w2, #12
	b	.LBB29_1384
.LBB29_1383:
	mov	x2, x0
.LBB29_1384:
	sub	x8, x29, #144           // =144
	mov	w1, wzr
	sub	x8, x8, x2
	add	x0, x8, #12             // =12
	b	.LBB29_1510
.LBB29_1385:
	mov	w25, wzr
	mov	w24, wzr
	b	.LBB29_528
.LBB29_1386:
	cbnz	w23, .LBB29_1388
.LBB29_1387:
	ldr	x0, [x22, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w23, w0
	cbz	w0, .LBB29_914
.LBB29_1388:
	adrp	x1, .L.str.57
	adrp	x2, .L__func__.f2fs_ioc_decompress_file
	add	x1, x1, :lo12:.L.str.57
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_decompress_file
.LBB29_1389:
	mov	x0, x20
	mov	w3, w23
	bl	f2fs_printk
	b	.LBB29_914
.LBB29_1390:
	ldr	x3, [x23, #64]
	adrp	x1, .L.str.62
	adrp	x2, .L__func__.f2fs_dedup_param_check
	add	x1, x1, :lo12:.L.str.62
	add	x2, x2, :lo12:.L__func__.f2fs_dedup_param_check
	mov	x0, x26
	mov	x4, x3
	b	.LBB29_920
.LBB29_1391:
	ldr	x3, [x24, #64]
	adrp	x1, .L.str.77
	adrp	x2, .L__func__.f2fs_ioc_dedup_file
	add	x1, x1, :lo12:.L.str.77
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_dedup_file
	mov	x0, x27
	mov	x4, x3
	b	.LBB29_480
.LBB29_1392:
	mov	w27, wzr
	mov	w24, wzr
	mov	w25, #-16
	b	.LBB29_1248
.LBB29_1393:
	mov	w2, #24
	b	.LBB29_1395
.LBB29_1394:
	mov	x2, x0
.LBB29_1395:
	sub	x8, x29, #144           // =144
	mov	w1, wzr
	sub	x8, x8, x2
	add	x0, x8, #24             // =24
	bl	memset
	b	.LBB29_637
.LBB29_1396:
	adrp	x10, cpu_hwcaps
	ldr	x10, [x10, :lo12:cpu_hwcaps]
	tbnz	w10, #4, .LBB29_188
.LBB29_1397:
	//APP
	mrs	x10, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x11, [x24, #72]
	//APP
	mrs x12, ttbr1_el1
	//NO_APP
	mov	x13, x11
	bfxil	x13, x12, #0, #48
	//APP
	msr ttbr1_el1, x13
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x10		// arch_local_irq_restore
	//NO_APP
.LBB29_1398:
	mov	w10, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     w20, [x9]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr w20, [x9]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w10, -14
	mov	x20, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w8, [x8, :lo12:arm64_const_caps_ready]
	cmp	w8, #1                  // =1
	b.lt	.LBB29_1401
// %bb.1399:
	adrp	x8, cpu_hwcap_keys
	add	x8, x8, :lo12:cpu_hwcap_keys
	ldr	w8, [x8, #16]
	cmp	w8, #0                  // =0
	b.le	.LBB29_1402
.LBB29_1400:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1403
.LBB29_1401:
	adrp	x8, cpu_hwcaps
	ldr	x8, [x8, :lo12:cpu_hwcaps]
	tbnz	w8, #4, .LBB29_1400
.LBB29_1402:
	//APP
	mrs	x8, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x9, ttbr1_el1
	//NO_APP
	and	x9, x9, #0xffffffffffff
	sub	x11, x9, #1, lsl #12    // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x9
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x8		// arch_local_irq_restore
	//NO_APP
.LBB29_1403:
	cbz	w10, .LBB29_1405
.LBB29_1404:
	mov	w23, #-14
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_1405:
	cbz	w20, .LBB29_1412
// %bb.1406:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w23, w0
	cbnz	w0, .LBB29_907
// %bb.1407:
	sub	w8, w20, #1             // =1
	cmp	w8, #3                  // =3
	b.hi	.LBB29_1425
// %bb.1408:
	adrp	x9, .LJTI29_2
	add	x9, x9, :lo12:.LJTI29_2
	adr	x10, .LBB29_1409
	ldrb	w11, [x9, x8]
	add	x10, x10, x11, lsl #2
	br	x10
.LBB29_1409:
	mov	x0, x22
	mov	w1, #1
	bl	f2fs_sync_fs
	mov	w22, w0
	cbnz	w0, .LBB29_1426
// %bb.1410:
	mov	x0, x21
	mov	w1, wzr
	bl	f2fs_stop_checkpoint
	cbz	x21, .LBB29_1424
// %bb.1411:
	add	x8, x21, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 64
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB29_1424
.LBB29_1412:
	ldr	x0, [x22, #248]
	bl	freeze_bdev
	mov	x23, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB29_1427
// %bb.1413:
	cbz	x23, .LBB29_1424
// %bb.1414:
	mov	x0, x21
	mov	w1, wzr
	bl	f2fs_stop_checkpoint
	cbz	x21, .LBB29_1416
// %bb.1415:
	add	x8, x21, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 64
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB29_1416:
	ldr	x0, [x23, #248]
	mov	x1, x23
	bl	thaw_bdev
	b	.LBB29_1424
.LBB29_1417:
	mov	x0, x21
	mov	w1, #2
	mov	x2, #9223372036854775807
	mov	w3, #6
	bl	f2fs_sync_meta_pages
	mov	x0, x21
	mov	w1, wzr
	bl	f2fs_stop_checkpoint
	cbz	x21, .LBB29_1424
// %bb.1418:
	add	x8, x21, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 64
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB29_1424
.LBB29_1419:
	cbz	x21, .LBB29_1421
// %bb.1420:
	add	x8, x21, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 512
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB29_1421:
	mov	x0, x22
	mov	w1, #1
	bl	f2fs_sync_fs
	mov	w22, w0
	b	.LBB29_1426
.LBB29_1422:
	mov	x0, x21
	mov	w1, wzr
	bl	f2fs_stop_checkpoint
	cbz	x21, .LBB29_1424
// %bb.1423:
	add	x8, x21, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 64
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB29_1424:
	mov	x0, x21
	bl	f2fs_stop_gc_thread
	mov	x0, x21
	bl	f2fs_stop_discard_thread
	mov	x0, x21
	bl	f2fs_drop_discard_cmd
	ldr	w8, [x21, #1424]
	adrp	x9, jiffies
	mov	w22, wzr
	mov	w23, wzr
	and	w8, w8, #0xfffffffb
	str	w8, [x21, #1424]
	ldr	x8, [x9, :lo12:jiffies]
	stp	x8, x8, [x21, #504]
	str	x8, [x21, #520]
	cbnz	w20, .LBB29_1426
	b	.LBB29_1427
.LBB29_1425:
	mov	w22, #-22
.LBB29_1426:
	mov	x0, x19
	bl	mnt_drop_write_file
	mov	w23, w22
.LBB29_1427:
	adrp	x8, __tracepoint_f2fs_shutdown
	add	x8, x8, :lo12:__tracepoint_f2fs_shutdown
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_907
// %bb.1428:
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
	tbz	w9, #0, .LBB29_907
// %bb.1429:
	ldr	w9, [x24, #80]
	add	w9, w9, #1              // =1
	str	w9, [x24, #80]
	//APP
	//NO_APP
	ldr	x19, [x8, #32]
	cbz	x19, .LBB29_1432
// %bb.1430:
	ldr	x8, [x19], #24
.LBB29_1431:                            // =>This Inner Loop Header: Depth=1
	ldur	x0, [x19, #-16]
	mov	x1, x21
	mov	w2, w20
	mov	w3, w23
	blr	x8
	ldr	x8, [x19], #24
	cbnz	x8, .LBB29_1431
.LBB29_1432:
	//APP
	//NO_APP
	ldr	w8, [x24, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x24, #80]
	b.ne	.LBB29_907
// %bb.1433:
	ldr	x8, [x24]
	tbz	w8, #1, .LBB29_907
// %bb.1434:
	bl	preempt_schedule_notrace
	b	.LBB29_907
.LBB29_1435:
	adrp	x11, cpu_hwcaps
	ldr	x11, [x11, :lo12:cpu_hwcaps]
	tbnz	w11, #4, .LBB29_219
.LBB29_1436:
	//APP
	mrs	x11, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x12, ttbr1_el1
	//NO_APP
	mov	x13, x8
	bfxil	x13, x12, #0, #48
	//APP
	msr ttbr1_el1, x13
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x11		// arch_local_irq_restore
	//NO_APP
.LBB29_1437:
	mov	w8, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     w20, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr w20, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w8, -14
	mov	x20, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w9, [x9, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_1440
// %bb.1438:
	adrp	x9, cpu_hwcap_keys
	add	x9, x9, :lo12:cpu_hwcap_keys
	ldr	w9, [x9, #16]
	cmp	w9, #0                  // =0
	b.le	.LBB29_1441
.LBB29_1439:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1442
.LBB29_1440:
	adrp	x9, cpu_hwcaps
	ldr	x9, [x9, :lo12:cpu_hwcaps]
	tbnz	w9, #4, .LBB29_1439
.LBB29_1441:
	//APP
	mrs	x9, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x9		// arch_local_irq_restore
	//NO_APP
.LBB29_1442:
	cbz	w8, .LBB29_1444
.LBB29_1443:
	mov	x21, #-14
	b	.LBB29_577
.LBB29_1444:
	ldr	w2, [x19, #3304]
	adrp	x0, .L.str.97
	add	x0, x0, :lo12:.L.str.97
	mov	w1, w20
	bl	printk
	mov	x21, #-95
	cbnz	w20, .LBB29_577
// %bb.1445:
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB29_577
// %bb.1446:
	ldr	w8, [x19, #3304]
	cbz	w8, .LBB29_151
// %bb.1447:
	mov	x0, x19
	bl	f2fs_recycle_mirror_space
	b	.LBB29_151
.LBB29_1448:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB29_437
.LBB29_1449:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x8
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB29_1450:
	mov	w8, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     w24, [x11]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr w24, [x11]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w8, -14
	mov	x24, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w10, [x10, :lo12:arm64_const_caps_ready]
	cmp	w10, #1                 // =1
	b.lt	.LBB29_1453
// %bb.1451:
	ldr	w9, [x9, #16]
	cmp	w9, #0                  // =0
	b.le	.LBB29_1454
.LBB29_1452:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1455
.LBB29_1453:
	adrp	x9, cpu_hwcaps
	ldr	x9, [x9, :lo12:cpu_hwcaps]
	tbnz	w9, #4, .LBB29_1452
.LBB29_1454:
	//APP
	mrs	x9, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x9		// arch_local_irq_restore
	//NO_APP
.LBB29_1455:
	cbnz	w8, .LBB29_1487
// %bb.1456:
	mov	w8, #58113
	movk	w8, #35182, lsl #16
	tst	w24, w8
	b.ne	.LBB29_1462
// %bb.1457:
	ldrh	w8, [x21]
	mov	w20, #1276
	mov	w9, #192
	mov	w10, #1276
	movk	w20, #24577, lsl #16
	and	w23, w24, w20
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	csel	w9, w10, w9, eq
	cmp	w8, #4, lsl #12         // =16384
	csel	w8, w20, w9, eq
	and	w8, w8, w24
	cmp	w8, w23
	b.ne	.LBB29_1462
// %bb.1458:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w22, w0
	cbnz	w0, .LBB29_703
// %bb.1459:
	mov	w8, #1278
	movk	w8, #26129, lsl #16
	and	w22, w24, w8
	add	x24, x21, #160          // =160
	mov	x0, x24
	bl	down_write
	ldr	w8, [x21, #680]
	add	w9, w20, #1, lsl #12    // =4096
	mov	x0, x21
	mov	w2, w22
	and	w1, w8, w9
	bl	vfs_ioc_setflags_prepare
	mov	w22, w0
	cbnz	w0, .LBB29_1461
// %bb.1460:
	mov	x0, x21
	mov	w1, w23
	mov	w2, w20
	bl	f2fs_setflags_common
	mov	w22, w0
.LBB29_1461:
	mov	x0, x24
	b	.LBB29_701
.LBB29_1462:
	mov	w22, #-95
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_1463:
	adrp	x11, cpu_hwcaps
	ldr	x11, [x11, :lo12:cpu_hwcaps]
	tbnz	w11, #4, .LBB29_490
.LBB29_1464:
	//APP
	mrs	x11, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x12, ttbr1_el1
	//NO_APP
	mov	x13, x8
	bfxil	x13, x12, #0, #48
	//APP
	msr ttbr1_el1, x13
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x11		// arch_local_irq_restore
	//NO_APP
.LBB29_1465:
	mov	w11, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     w8, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr w8, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w11, -14
	mov	x8, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w9, [x9, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_1468
// %bb.1466:
	adrp	x9, cpu_hwcap_keys
	add	x9, x9, :lo12:cpu_hwcap_keys
	ldr	w9, [x9, #16]
	cmp	w9, #0                  // =0
	b.le	.LBB29_1469
.LBB29_1467:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1470
.LBB29_1468:
	adrp	x9, cpu_hwcaps
	ldr	x9, [x9, :lo12:cpu_hwcaps]
	tbnz	w9, #4, .LBB29_1467
.LBB29_1469:
	//APP
	mrs	x9, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sub	x12, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x12
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x9		// arch_local_irq_restore
	//NO_APP
.LBB29_1470:
	cbz	w11, .LBB29_1472
.LBB29_1471:
	mov	w0, #-14
	sxtw	x21, w0
	b	.LBB29_577
.LBB29_1472:
	cbz	w8, .LBB29_1474
// %bb.1473:
	mov	w0, #-95
	sxtw	x21, w0
	b	.LBB29_577
.LBB29_1474:
	mov	x0, x19
	bl	mnt_want_write_file
                                        // kill: def $w0 killed $w0 def $x0
	cbnz	w0, .LBB29_1476
// %bb.1475:
	add	x20, x21, #160          // =160
	mov	x0, x20
	bl	down_write
	ldr	w8, [x21, #680]
	mov	x0, x21
	str	x8, [x21, #680]
	bl	current_time
	stp	x0, x1, [x21, #120]
	mov	x0, x21
	bl	f2fs_set_inode_flags
	mov	x0, x21
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x20
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
	mov	w0, wzr
.LBB29_1476:
	sxtw	x21, w0
	b	.LBB29_577
.LBB29_1477:
	mov	w24, wzr
	mov	w25, wzr
.LBB29_1478:
	ldr	x0, [sp, #72]           // 8-byte Folded Reload
	bl	up_write
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	bl	up_write
	b	.LBB29_528
.LBB29_1479:
	adrp	x10, cpu_hwcaps
	ldr	x10, [x10, :lo12:cpu_hwcaps]
	tbnz	w10, #4, .LBB29_165
.LBB29_1480:
	//APP
	mrs	x10, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x11, [x23, #72]
	//APP
	mrs x12, ttbr1_el1
	//NO_APP
	mov	x13, x11
	bfxil	x13, x12, #0, #48
	//APP
	msr ttbr1_el1, x13
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x10		// arch_local_irq_restore
	//NO_APP
.LBB29_1481:
	mov	w10, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     w20, [x9]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr w20, [x9]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w10, -14
	mov	x20, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w8, [x8, :lo12:arm64_const_caps_ready]
	cmp	w8, #1                  // =1
	b.lt	.LBB29_1484
// %bb.1482:
	adrp	x8, cpu_hwcap_keys
	add	x8, x8, :lo12:cpu_hwcap_keys
	ldr	w8, [x8, #16]
	cmp	w8, #0                  // =0
	b.le	.LBB29_1485
.LBB29_1483:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB29_1486
.LBB29_1484:
	adrp	x8, cpu_hwcaps
	ldr	x8, [x8, :lo12:cpu_hwcaps]
	tbnz	w8, #4, .LBB29_1483
.LBB29_1485:
	//APP
	mrs	x8, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x9, ttbr1_el1
	//NO_APP
	and	x9, x9, #0xffffffffffff
	sub	x11, x9, #1, lsl #12    // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x9
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x8		// arch_local_irq_restore
	//NO_APP
.LBB29_1486:
	cbz	w10, .LBB29_1488
.LBB29_1487:
	mov	w22, #-14
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_1488:
	ldr	x8, [x21]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB29_1492
// %bb.1489:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w22, w0
	cbnz	w0, .LBB29_703
// %bb.1490:
	add	x0, x21, #1664          // =1664
	cbz	w20, .LBB29_1493
// %bb.1491:
	bl	down_write
	b	.LBB29_1494
.LBB29_1492:
	mov	w22, #-30
	sxtw	x21, w22
	b	.LBB29_577
.LBB29_1493:
	bl	down_write_trylock
	cbz	w0, .LBB29_1495
.LBB29_1494:
	ldr	w8, [x21, #1236]
	adrp	x9, IOC_GC_count
	ldr	w10, [x21, #1240]
	adrp	x1, .L.str.41
	ldr	w11, [x21, #1168]
	add	x1, x1, :lo12:.L.str.41
	ldr	w4, [x9, :lo12:IOC_GC_count]
	mov	x0, x21
	mov	w5, w20
	cmp	w20, #0                 // =0
	sub	w10, w8, w10
	cset	w22, ne
	mul	x8, x11, x8
	mul	x10, x10, x11
	add	w11, w4, #1             // =1
	lsr	x2, x8, #20
	lsr	x3, x10, #20
	str	w11, [x9, :lo12:IOC_GC_count]
	bl	f2fs_printk
	ldr	w8, [x23, #108]
	mov	w4, #-1
	mov	x0, x21
	mov	w1, w22
	mov	w2, #1
	mov	w3, wzr
	orr	w8, w8, #0x2000000
	str	w8, [x23, #108]
	bl	f2fs_gc
	ldr	w8, [x23, #108]
	mov	w22, w0
	and	w8, w8, #0xfdffffff
	str	w8, [x23, #108]
	b	.LBB29_702
.LBB29_1495:
	mov	w22, #-16
	b	.LBB29_702
.LBB29_1496:
	adrp	x1, .L.str.42
	mov	x0, x20
	add	x1, x1, :lo12:.L.str.42
	bl	f2fs_printk
	mov	w21, #-22
	sxtw	x21, w21
	b	.LBB29_577
.LBB29_1497:
	mov	w2, #8
	b	.LBB29_1501
.LBB29_1498:
	mov	w2, #8
	b	.LBB29_1503
.LBB29_1499:
	mov	w2, #8
	b	.LBB29_1506
.LBB29_1500:
	mov	x2, x0
.LBB29_1501:
	sub	x8, x29, #144           // =144
	sub	x8, x8, x2
	add	x0, x8, #8              // =8
	b	.LBB29_1202
.LBB29_1502:
	mov	x2, x0
.LBB29_1503:
	sub	x8, x29, #144           // =144
.LBB29_1504:
	mov	w1, wzr
	sub	x8, x8, x2
	add	x0, x8, #8              // =8
	bl	memset
	b	.LBB29_1315
.LBB29_1505:
	mov	x2, x0
.LBB29_1506:
	add	x8, sp, #136            // =136
	mov	w1, wzr
	sub	x8, x8, x2
	add	x0, x8, #8              // =8
	b	.LBB29_1199
.LBB29_1507:
	mov	w2, #2
	b	.LBB29_1509
.LBB29_1508:
	mov	x2, x0
.LBB29_1509:
	sub	x8, x29, #144           // =144
	mov	w1, wzr
	sub	x8, x8, x2
	add	x0, x8, #2              // =2
.LBB29_1510:
	bl	memset
	mov	w23, #-14
	sxtw	x21, w23
	b	.LBB29_577
.LBB29_1511:
	mov	w23, wzr
	b	.LBB29_1096
.LBB29_1512:
	add	x11, x22, #712          // =712
	add	x24, x22, #968          // =968
	mov	x0, x24
	mov	x8, #17179869184
	str	x11, [sp, #72]          // 8-byte Folded Spill
	//APP
	// atomic64_or
	prfm	pstl1strm, [x11]
1:	ldxr	x9, [x11]
	orr	x9, x9, x8
	stxr	w10, x9, [x11]
	cbnz	w10, 1b
	//NO_APP
	bl	down_write
	mov	x0, x22
	bl	inode_dio_wait
	mov	x0, x24
	bl	up_write
	ldr	x8, [x22, #80]
	add	x8, x8, #4095           // =4095
	lsr	x8, x8, #12
	str	x8, [sp, #80]           // 8-byte Folded Spill
	cbz	w8, .LBB29_1765
// %bb.1513:
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	mov	x24, xzr
	mov	w23, w8
	b	.LBB29_1515
.LBB29_1514:                            //   in Loop: Header=BB29_1515 Depth=1
	subs	w23, w23, w26
	add	x24, x24, w26, sxtw
	b.eq	.LBB29_1763
.LBB29_1515:                            // =>This Inner Loop Header: Depth=1
	cmp	w28, w23
	mov	x0, x22
	csel	w26, w28, w23, lt
	mov	x1, x24
	mov	w2, w26
	bl	redirty_blocks
	mov	w25, w0
	tbnz	w0, #31, .LBB29_1764
// %bb.1516:                            //   in Loop: Header=BB29_1515 Depth=1
	ldr	w8, [x22, #768]
	cmp	w8, w27
	b.lo	.LBB29_1514
// %bb.1517:                            //   in Loop: Header=BB29_1515 Depth=1
	ldr	x0, [x22, #48]
	bl	filemap_fdatawrite
	b	.LBB29_1514
.LBB29_1518:
	bl	__stack_chk_fail
.LBB29_1519:
	cbnz	w23, .LBB29_1521
.LBB29_1520:
	ldr	x0, [x21, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w23, w0
	cbz	w0, .LBB29_1096
.LBB29_1521:
	ldr	x3, [x21, #64]
	adrp	x1, .L.str.55
	adrp	x2, .L__func__.f2fs_ioc_reserve_decompress_file
	add	x1, x1, :lo12:.L.str.55
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_reserve_decompress_file
	mov	x0, x20
	mov	w4, w23
	bl	f2fs_printk
	b	.LBB29_1096
.LBB29_1522:
	ldr	w8, [sp, #140]
	tbz	w8, #5, .LBB29_1524
// %bb.1523:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	w9, [x8, #4]
	str	w9, [x22, #4]
	ldr	w9, [x8, #8]
	str	w9, [x22, #8]
	ldr	x9, [x8, #80]
	ldr	w8, [sp, #140]
	str	x9, [x22, #80]
.LBB29_1524:
	tbnz	w8, #6, .LBB29_1570
.LBB29_1525:
	mov	x0, x22
	mov	w1, #1
	add	x8, x22, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	ldr	x8, [x22, #680]
	mov	x0, x22
	orr	x8, x8, #0x10
	str	x8, [x22, #680]
	bl	f2fs_set_inode_flags
	mov	x0, x22
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	mov	w25, wzr
	b	.LBB29_1059
.LBB29_1526:
	adrp	x2, .L.str.92
	sub	x0, x29, #144           // =144
	add	x2, x2, :lo12:.L.str.92
	mov	w1, #128
	bl	snprintf
	adrp	x2, .L__func__.f2fs_ioc_modify_check
	sub	x3, x29, #144           // =144
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_modify_check
	mov	x0, x21
	mov	w1, wzr
	bl	f2fs_dedup_imonitor_send
	mov	x0, x25
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	cbz	w0, .LBB29_1549
// %bb.1527:
	mov	w24, w0
	ldr	x2, [x21, #64]
	adrp	x1, .L.str.90
	mov	x0, x23
	add	x1, x1, :lo12:.L.str.90
	mov	w3, w24
	bl	f2fs_printk
	b	.LBB29_1377
.LBB29_1528:
	tbnz	w8, #0, .LBB29_1533
// %bb.1529:
	bl	print_bdev_access_info
	adrp	x27, f2fs_dclient
	ldr	x0, [x27, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1532
// %bb.1530:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1532
// %bb.1531:
	ldr	x0, [x27, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x27, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1532:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_1533:
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2075
.LBB29_1534:
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
	cbnz	w9, .LBB29_1536
// %bb.1535:
	bl	__put_page
.LBB29_1536:
	add	x8, x26, #360           // =360
	cmp	x8, #368                // =368
	b.lo	.LBB29_1547
// %bb.1537:
	mov	x0, x22
	bl	dquot_initialize
	mov	w25, w0
	cbnz	w0, .LBB29_1351
// %bb.1538:
	add	x25, x24, #368          // =368
	and	x26, x23, #0xffffffff
	mov	x0, x25
	bl	_raw_spin_lock
	ldr	x8, [x24, #352]
	cbz	x8, .LBB29_1540
// %bb.1539:
	adrp	x27, jiffies
	ldr	x8, [x24, #360]
	ldr	x9, [x27, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB29_1952
.LBB29_1540:
	mov	x0, x25
	bl	_raw_spin_unlock
	add	x21, x24, #304          // =304
	mov	x0, x21
	bl	down_read
	ldr	x8, [x22, #40]
	orr	x1, x26, #0x200000000
	str	xzr, [sp, #136]
	ldr	x24, [x8, #1104]
	stp	xzr, xzr, [sp, #144]
	ldr	x0, [x24]
	bl	dqget
	cmn	x0, #4095               // =4095
	str	x0, [sp, #152]
	b.hs	.LBB29_1545
// %bb.1541:
	add	x1, sp, #136            // =136
	mov	x0, x22
	bl	__dquot_transfer
	mov	w25, w0
	cbz	x24, .LBB29_1544
// %bb.1542:
	cbz	w25, .LBB29_1544
// %bb.1543:
	add	x8, x24, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4096
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB29_1544:
	ldr	x0, [sp, #152]
	bl	dqput
	cbnz	w25, .LBB29_1546
.LBB29_1545:
	mov	x0, x22
	str	w23, [x22, #1164]
	bl	current_time
	stp	x0, x1, [x22, #120]
	mov	x0, x22
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	mov	w25, wzr
.LBB29_1546:
	mov	x0, x21
	bl	up_read
	b	.LBB29_1351
.LBB29_1547:
	mov	w25, #-75
	b	.LBB29_1351
.LBB29_1548:
	ldr	x2, [x26, #64]
	adrp	x1, .L.str.78
	add	x1, x1, :lo12:.L.str.78
	mov	x0, x27
	bl	f2fs_printk
	mov	w28, #-11
	b	.LBB29_1559
.LBB29_1549:
	ldr	x8, [x21, #40]
	ldrb	w9, [sp, #104]
	ldr	x23, [x8, #1104]
	tbz	w9, #0, .LBB29_1885
// %bb.1550:
	ldr	x8, [x21, #712]
	tbnz	x8, #48, .LBB29_1884
// %bb.1551:
	mov	x0, x21
	mov	w1, #1
	add	x8, x21, #712           // =712
	mov	x9, #281474976710656
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	b	.LBB29_1885
.LBB29_1552:
	mov	w2, #16
	b	.LBB29_1554
.LBB29_1553:
	mov	x2, x0
.LBB29_1554:
	add	x8, sp, #104            // =104
	mov	w1, wzr
	sub	x8, x8, x2
	add	x0, x8, #16             // =16
	bl	memset
	mov	w26, #-14
	sxtw	x21, w26
	b	.LBB29_577
.LBB29_1555:
	ldr	x2, [x24, #64]
	adrp	x1, .L.str.79
	add	x1, x1, :lo12:.L.str.79
.LBB29_1556:
	mov	x0, x27
	bl	f2fs_printk
.LBB29_1557:
	mov	w28, #-22
.LBB29_1558:
	mov	x0, x23
	bl	up_write
.LBB29_1559:
	mov	x0, x22
	bl	up_write
	mov	x0, x19
	bl	mnt_drop_write_file
	tbz	w21, #1, .LBB29_1186
	b	.LBB29_1185
.LBB29_1560:
	ldr	w26, [x21, #1192]
	ldr	w10, [x21, #1188]
	ldrsw	x8, [x21, #1284]
	str	x8, [sp, #64]           // 8-byte Folded Spill
	ldr	w8, [x21, #1184]
	str	x8, [sp, #40]           // 8-byte Folded Spill
	ldrsw	x8, [x21, #1272]
	str	x8, [sp, #56]           // 8-byte Folded Spill
	ldrsw	x8, [x21, #1296]
	str	x8, [sp, #48]           // 8-byte Folded Spill
	ldr	x8, [x21, #80]
	tbnz	w8, #3, .LBB29_1779
// %bb.1561:
	ldr	x12, [x21, #136]
	mul	w13, w10, w26
	ldr	w9, [sp, #72]           // 4-byte Folded Reload
	mov	x23, x13
	ldr	x8, [x12, #8]
	add	w9, w9, w13
	sub	w11, w9, #1             // =1
	ldr	w9, [x12, #100]
	udiv	w11, w11, w13
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	str	w11, [sp, #72]          // 4-byte Folded Spill
	b.eq	.LBB29_1770
// %bb.1562:
	udiv	w11, w9, w26
	b	.LBB29_1771
.LBB29_1563:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB29_656
.LBB29_1564:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x9, [x9, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x9
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x9
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB29_1565:
	mov	w9, wzr
	//APP
	1:.if 1 == 1
661:
	str     x8, [x11]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr x8, [x11]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w9, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w8, [x10, :lo12:arm64_const_caps_ready]
	cmp	w8, #1                  // =1
	b.lt	.LBB29_1568
// %bb.1566:
	adrp	x8, cpu_hwcap_keys
	add	x8, x8, :lo12:cpu_hwcap_keys
	ldr	w8, [x8, #16]
	cmp	w8, #0                  // =0
	b.le	.LBB29_1569
.LBB29_1567:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w9
	b	.LBB29_577
.LBB29_1568:
	adrp	x8, cpu_hwcaps
	ldr	x8, [x8, :lo12:cpu_hwcaps]
	tbnz	w8, #4, .LBB29_1567
.LBB29_1569:
	//APP
	mrs	x8, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x10, ttbr1_el1
	//NO_APP
	and	x10, x10, #0xffffffffffff
	sxtw	x21, w9
	sub	x11, x10, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x8		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1570:
	ldr	x23, [sp, #88]          // 8-byte Folded Reload
	mov	w1, #1
	ldr	x8, [x23, #80]
	str	x8, [x22, #80]
	ldr	x8, [x23, #40]
	ldr	x0, [x8, #1104]
	ldr	w8, [x0, #1188]
	str	w8, [sp, #12]           // 4-byte Folded Spill
	bl	f2fs_balance_fs
	ldr	x8, [x23, #80]
	add	x8, x8, #4095           // =4095
	lsr	x8, x8, #12
	str	x8, [sp, #24]           // 8-byte Folded Spill
	cbz	w8, .LBB29_1890
// %bb.1571:
	sub	x8, x29, #144           // =144
	add	x8, x8, #8              // =8
	stp	x8, xzr, [sp, #40]      // 16-byte Folded Spill
.LBB29_1572:                            // =>This Loop Header: Depth=1
                                        //     Child Loop BB29_1575 Depth 2
                                        //     Child Loop BB29_1583 Depth 2
                                        //     Child Loop BB29_1749 Depth 2
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	add	x11, sp, #104           // =104
	ldr	x2, [sp, #48]           // 8-byte Folded Reload
	mov	x1, xzr
	mov	x4, xzr
	ldr	x0, [x8, #48]
	ldp	x8, x10, [x22, #40]
	ldr	x9, [x0, #120]
	ldr	x8, [x8, #1104]
	str	x10, [sp, #16]          // 8-byte Folded Spill
	ldr	x10, [sp, #24]          // 8-byte Folded Reload
	stp	x11, x11, [sp, #104]
	stp	x8, x0, [sp, #56]       // 16-byte Folded Spill
	ldr	w8, [sp, #12]           // 4-byte Folded Reload
	ldr	x24, [x9, #8]
	cmp	w8, w10
	csel	w23, w8, w10, lt
	sxtw	x3, w23
	str	x3, [sp, #80]           // 8-byte Folded Spill
	bl	__do_page_cache_readahead
	cmp	w23, #1                 // =1
	b.lt	.LBB29_1698
// %bb.1573:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x26, [sp, #48]          // 8-byte Folded Reload
	mov	w23, wzr
	b	.LBB29_1575
.LBB29_1574:                            //   in Loop: Header=BB29_1575 Depth=2
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	add	x26, x26, #1            // =1
	cmp	w23, w8
	b.eq	.LBB29_1580
.LBB29_1575:                            //   Parent Loop BB29_1572 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	mov	x1, x26
	mov	x2, x24
	mov	x3, xzr
	bl	read_cache_page
	mov	x25, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB29_1749
// %bb.1576:                            //   in Loop: Header=BB29_1575 Depth=2
	adrp	x8, page_info_slab
	mov	w1, #64
	movk	w1, #96, lsl #16
	ldr	x28, [x8, :lo12:page_info_slab]
	mov	x0, x28
	bl	kmem_cache_alloc
	mov	x27, x0
	cbnz	x0, .LBB29_1578
// %bb.1577:                            //   in Loop: Header=BB29_1575 Depth=2
	mov	w8, #64
	mov	x0, x28
	movk	w8, #96, lsl #16
	add	w1, w8, #2048           // =2048
	bl	kmem_cache_alloc
	mov	x27, x0
.LBB29_1578:                            //   in Loop: Header=BB29_1575 Depth=2
	stp	x27, x25, [x27, #8]
	add	x2, sp, #104            // =104
	str	x27, [x27]
	mov	x0, x27
	ldr	x25, [sp, #112]
	add	w23, w23, #1            // =1
	mov	x1, x25
	bl	__list_add_valid
	tbz	w0, #0, .LBB29_1574
// %bb.1579:                            //   in Loop: Header=BB29_1575 Depth=2
	add	x8, sp, #104            // =104
	str	x27, [sp, #112]
	stp	x8, x25, [x27]
	str	x27, [x25]
	b	.LBB29_1574
.LBB29_1580:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x26, [sp, #48]          // 8-byte Folded Reload
	mov	w28, wzr
	b	.LBB29_1583
.LBB29_1581:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	__put_page
.LBB29_1582:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	add	w28, w28, #1            // =1
	add	x26, x26, #1            // =1
	cmp	w28, w8
	b.eq	.LBB29_1698
.LBB29_1583:                            //   Parent Loop BB29_1572 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	mov	x1, x26
	mov	w2, #2
	mov	w3, wzr
	bl	pagecache_get_page
	cbz	x0, .LBB29_1747
// %bb.1584:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x27, x0
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	mov	x1, x26
	bl	f2fs_is_hole_blkaddr
	tbz	w0, #0, .LBB29_1601
// %bb.1585:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x27, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x27, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB29_1618
// %bb.1586:                            //   in Loop: Header=BB29_1583 Depth=2
	tbnz	w8, #0, .LBB29_1600
// %bb.1587:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1590
// %bb.1588:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1590
// %bb.1589:                            //   in Loop: Header=BB29_1583 Depth=2
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1590:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1592
// %bb.1591:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1686
.LBB29_1592:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x27, #24]
.LBB29_1593:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1595
// %bb.1594:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1687
.LBB29_1595:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x27, #24]
.LBB29_1596:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1598
// %bb.1597:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1688
.LBB29_1598:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x27, #24]
.LBB29_1599:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB29_1600:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_1624
	b	.LBB29_2065
.LBB29_1601:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	mov	w1, #5
	mov	w2, #1
	mov	w3, wzr
	bl	__do_map_lock
	str	w0, [sp, #36]           // 4-byte Folded Spill
	sub	x0, x29, #144           // =144
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	sub	x0, x29, #144           // =144
	mov	x1, x26
	stur	x22, [x29, #-144]
	stp	xzr, xzr, [x8]
	str	wzr, [x8, #16]
	bl	f2fs_get_block
	ldur	x24, [x29, #-128]
	mov	w25, w0
	cbz	x24, .LBB29_1633
// %bb.1602:                            //   in Loop: Header=BB29_1583 Depth=2
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
	b.ne	.LBB29_1625
// %bb.1603:                            //   in Loop: Header=BB29_1583 Depth=2
	tbnz	w8, #0, .LBB29_1617
// %bb.1604:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1607
// %bb.1605:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1607
// %bb.1606:                            //   in Loop: Header=BB29_1583 Depth=2
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1607:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1609
// %bb.1608:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB29_1695
.LBB29_1609:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x24, #24]
.LBB29_1610:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1612
// %bb.1611:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB29_1696
.LBB29_1612:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x24, #24]
.LBB29_1613:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1615
// %bb.1614:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB29_1697
.LBB29_1615:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x24, #24]
.LBB29_1616:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB29_1617:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_1631
	b	.LBB29_2073
.LBB29_1618:                            //   in Loop: Header=BB29_1583 Depth=2
	tbnz	w8, #0, .LBB29_1623
// %bb.1619:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1622
// %bb.1620:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1622
// %bb.1621:                            //   in Loop: Header=BB29_1583 Depth=2
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1622:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_1623:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2066
.LBB29_1624:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x27
	bl	unlock_page
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
	cbnz	w9, .LBB29_1582
	b	.LBB29_1581
.LBB29_1625:                            //   in Loop: Header=BB29_1583 Depth=2
	tbnz	w8, #0, .LBB29_1630
// %bb.1626:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1629
// %bb.1627:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1629
// %bb.1628:                            //   in Loop: Header=BB29_1583 Depth=2
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1629:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_1630:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2074
.LBB29_1631:                            //   in Loop: Header=BB29_1583 Depth=2
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
	cbnz	w9, .LBB29_1633
// %bb.1632:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	__put_page
.LBB29_1633:                            //   in Loop: Header=BB29_1583 Depth=2
	ldur	x8, [x29, #-136]
	cbz	x8, .LBB29_1637
// %bb.1634:                            //   in Loop: Header=BB29_1583 Depth=2
	ldur	x9, [x29, #-128]
	cmp	x9, x8
	b.eq	.LBB29_1637
// %bb.1635:                            //   in Loop: Header=BB29_1583 Depth=2
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
	cbnz	w9, .LBB29_1637
// %bb.1636:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	__put_page
.LBB29_1637:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	mov	w1, #5
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	mov	w2, wzr
	stp	xzr, xzr, [x8]
	ldr	w8, [sp, #36]           // 4-byte Folded Reload
	and	w3, w8, #0x1
	bl	__do_map_lock
	cbnz	w25, .LBB29_1699
// %bb.1638:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	mov	x1, x26
	mov	w2, #2
	bl	grab_cache_page_write_begin
	cbz	x0, .LBB29_1715
// %bb.1639:                            //   in Loop: Header=BB29_1583 Depth=2
	lsl	x8, x27, #6
	mov	x25, x0
	orr	x1, x8, #0xffffffc000000000
	lsl	x8, x0, #6
	orr	x0, x8, #0xffffffc000000000
	mov	w2, #4096
	bl	memcpy
	mov	x0, x25
	bl	set_page_dirty
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
	b.ne	.LBB29_1655
// %bb.1640:                            //   in Loop: Header=BB29_1583 Depth=2
	tbnz	w8, #0, .LBB29_1654
// %bb.1641:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1644
// %bb.1642:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1644
// %bb.1643:                            //   in Loop: Header=BB29_1583 Depth=2
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1644:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1646
// %bb.1645:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB29_1689
.LBB29_1646:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x25, #24]
.LBB29_1647:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1649
// %bb.1648:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB29_1690
.LBB29_1649:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x25, #24]
.LBB29_1650:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1652
// %bb.1651:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB29_1691
.LBB29_1652:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x25, #24]
.LBB29_1653:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB29_1654:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_1661
	b	.LBB29_2067
.LBB29_1655:                            //   in Loop: Header=BB29_1583 Depth=2
	tbnz	w8, #0, .LBB29_1660
// %bb.1656:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1659
// %bb.1657:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1659
// %bb.1658:                            //   in Loop: Header=BB29_1583 Depth=2
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1659:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_1660:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2068
.LBB29_1661:                            //   in Loop: Header=BB29_1583 Depth=2
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
	cbnz	w9, .LBB29_1663
// %bb.1662:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	__put_page
.LBB29_1663:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x27, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x27, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB29_1679
// %bb.1664:                            //   in Loop: Header=BB29_1583 Depth=2
	tbnz	w8, #0, .LBB29_1678
// %bb.1665:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1668
// %bb.1666:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1668
// %bb.1667:                            //   in Loop: Header=BB29_1583 Depth=2
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1668:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1670
// %bb.1669:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1692
.LBB29_1670:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x27, #24]
.LBB29_1671:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1673
// %bb.1672:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1693
.LBB29_1673:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x27, #24]
.LBB29_1674:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1676
// %bb.1675:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1694
.LBB29_1676:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x0, [x27, #24]
.LBB29_1677:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB29_1678:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_1685
	b	.LBB29_2069
.LBB29_1679:                            //   in Loop: Header=BB29_1583 Depth=2
	tbnz	w8, #0, .LBB29_1684
// %bb.1680:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1683
// %bb.1681:                            //   in Loop: Header=BB29_1583 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1683
// %bb.1682:                            //   in Loop: Header=BB29_1583 Depth=2
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1683:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_1684:                            //   in Loop: Header=BB29_1583 Depth=2
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2070
.LBB29_1685:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x27
	bl	unlock_page
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
	cbnz	w9, .LBB29_1582
	b	.LBB29_1581
.LBB29_1686:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1593
.LBB29_1687:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1596
.LBB29_1688:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1599
.LBB29_1689:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB29_1647
.LBB29_1690:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB29_1650
.LBB29_1691:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB29_1653
.LBB29_1692:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1671
.LBB29_1693:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1674
.LBB29_1694:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1677
.LBB29_1695:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB29_1610
.LBB29_1696:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB29_1613
.LBB29_1697:                            //   in Loop: Header=BB29_1583 Depth=2
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB29_1616
.LBB29_1698:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	w25, wzr
	b	.LBB29_1749
.LBB29_1699:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x27, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x27, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB29_1731
// %bb.1700:                            //   in Loop: Header=BB29_1572 Depth=1
	tbnz	w8, #0, .LBB29_1714
// %bb.1701:                            //   in Loop: Header=BB29_1572 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1704
// %bb.1702:                            //   in Loop: Header=BB29_1572 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1704
// %bb.1703:                            //   in Loop: Header=BB29_1572 Depth=1
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1704:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1706
// %bb.1705:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1757
.LBB29_1706:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x0, [x27, #24]
.LBB29_1707:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1709
// %bb.1708:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1758
.LBB29_1709:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x0, [x27, #24]
.LBB29_1710:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1712
// %bb.1711:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1759
.LBB29_1712:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x0, [x27, #24]
.LBB29_1713:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB29_1714:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_1737
	b	.LBB29_2076
.LBB29_1715:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x27, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x27, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB29_1739
// %bb.1716:                            //   in Loop: Header=BB29_1572 Depth=1
	tbnz	w8, #0, .LBB29_1730
// %bb.1717:                            //   in Loop: Header=BB29_1572 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1720
// %bb.1718:                            //   in Loop: Header=BB29_1572 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1720
// %bb.1719:                            //   in Loop: Header=BB29_1572 Depth=1
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1720:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1722
// %bb.1721:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1760
.LBB29_1722:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x0, [x27, #24]
.LBB29_1723:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1725
// %bb.1724:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1761
.LBB29_1725:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x0, [x27, #24]
.LBB29_1726:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1728
// %bb.1727:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB29_1762
.LBB29_1728:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x0, [x27, #24]
.LBB29_1729:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB29_1730:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_1745
	b	.LBB29_2077
.LBB29_1731:                            //   in Loop: Header=BB29_1572 Depth=1
	tbnz	w8, #0, .LBB29_1736
// %bb.1732:                            //   in Loop: Header=BB29_1572 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1735
// %bb.1733:                            //   in Loop: Header=BB29_1572 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1735
// %bb.1734:                            //   in Loop: Header=BB29_1572 Depth=1
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1735:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_1736:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2078
.LBB29_1737:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	x0, x27
	bl	unlock_page
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
	cbnz	w9, .LBB29_1749
// %bb.1738:                            //   in Loop: Header=BB29_1572 Depth=1
	bl	__put_page
	b	.LBB29_1749
.LBB29_1739:                            //   in Loop: Header=BB29_1572 Depth=1
	tbnz	w8, #0, .LBB29_1744
// %bb.1740:                            //   in Loop: Header=BB29_1572 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1743
// %bb.1741:                            //   in Loop: Header=BB29_1572 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1743
// %bb.1742:                            //   in Loop: Header=BB29_1572 Depth=1
	adrp	x23, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x23, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_1743:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_1744:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2079
.LBB29_1745:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	x0, x27
	bl	unlock_page
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
	mov	w8, #-12
	mov	w25, w8
	cbnz	w9, .LBB29_1749
// %bb.1746:                            //   in Loop: Header=BB29_1572 Depth=1
	bl	__put_page
.LBB29_1747:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	w8, #-12
	mov	w25, w8
	b	.LBB29_1749
.LBB29_1748:                            //   in Loop: Header=BB29_1749 Depth=2
	mov	x9, #256
	mov	x1, x24
	movk	x9, #57005, lsl #48
	add	x8, x9, #256            // =256
	stp	x9, x8, [x24]
	adrp	x8, page_info_slab
	ldr	x0, [x8, :lo12:page_info_slab]
	bl	kmem_cache_free
.LBB29_1749:                            //   Parent Loop BB29_1572 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x24, [sp, #104]
	add	x8, sp, #104            // =104
	cmp	x8, x24
	b.eq	.LBB29_1755
// %bb.1750:                            //   in Loop: Header=BB29_1749 Depth=2
	ldr	x8, [x24, #16]
	cbz	x8, .LBB29_1753
// %bb.1751:                            //   in Loop: Header=BB29_1749 Depth=2
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
	cbnz	w9, .LBB29_1753
// %bb.1752:                            //   in Loop: Header=BB29_1749 Depth=2
	bl	__put_page
.LBB29_1753:                            //   in Loop: Header=BB29_1749 Depth=2
	mov	x0, x24
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB29_1748
// %bb.1754:                            //   in Loop: Header=BB29_1749 Depth=2
	ldp	x9, x8, [x24]
	str	x8, [x9, #8]
	str	x9, [x8]
	b	.LBB29_1748
.LBB29_1755:                            //   in Loop: Header=BB29_1572 Depth=1
	tbnz	w25, #31, .LBB29_1891
// %bb.1756:                            //   in Loop: Header=BB29_1572 Depth=1
	ldr	x0, [x22, #48]
	bl	filemap_fdatawrite
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	ldr	x9, [sp, #80]           // 8-byte Folded Reload
	subs	w8, w8, w9
	str	x8, [sp, #24]           // 8-byte Folded Spill
	ldr	x8, [sp, #48]           // 8-byte Folded Reload
	add	x8, x8, x9
	str	x8, [sp, #48]           // 8-byte Folded Spill
	b.ne	.LBB29_1572
	b	.LBB29_1889
.LBB29_1757:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1707
.LBB29_1758:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1710
.LBB29_1759:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1713
.LBB29_1760:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1723
.LBB29_1761:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1726
.LBB29_1762:                            //   in Loop: Header=BB29_1572 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB29_1729
.LBB29_1763:
	cbz	w25, .LBB29_1765
.LBB29_1764:
	add	x8, x22, #712           // =712
	mov	x9, #17179869184
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	b	.LBB29_1766
.LBB29_1765:
	ldr	x0, [x22, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w25, w0
	mov	x8, #17179869184
	ldr	x11, [sp, #72]          // 8-byte Folded Reload
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x11]
1:	ldxr	x9, [x11]
	bic	x9, x9, x8
	stxr	w10, x9, [x11]
	cbnz	w10, 1b
	//NO_APP
	cbz	w0, .LBB29_1824
.LBB29_1766:
	adrp	x1, .L.str.53
	adrp	x2, .L__func__.f2fs_ioc_compress_release_file
	add	x1, x1, :lo12:.L.str.53
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_compress_release_file
	mov	x0, x21
	mov	w3, w25
	bl	f2fs_printk
.LBB29_1767:
	mov	w27, wzr
	mov	w24, wzr
	b	.LBB29_1248
.LBB29_1768:
	ldr	x2, [x23, #64]
	adrp	x1, .L.str.61
	add	x1, x1, :lo12:.L.str.61
	mov	x0, x26
	bl	f2fs_printk
	mov	w28, #-2
	b	.LBB29_961
.LBB29_1769:
	ldr	x2, [x24, #64]
	adrp	x1, .L.str.80
	add	x1, x1, :lo12:.L.str.80
	mov	x0, x27
	bl	f2fs_printk
	mov	w28, #-2
	b	.LBB29_1558
.LBB29_1770:
	mov	w11, #-1
.LBB29_1771:
	ldr	w13, [sp, #72]          // 4-byte Folded Reload
	add	w11, w11, w13
	cmp	w8, w11
	b.ne	.LBB29_1776
// %bb.1772:
	ldr	w13, [x21, #1284]
	mov	w16, #48
	ldr	w14, [x21, #1272]
	ldr	w11, [x21, #1272]
	add	w13, w14, w13
	str	w11, [sp, #36]          // 4-byte Folded Spill
	ldr	x11, [x12, #24]
	ldr	x12, [x12]
	ldr	w15, [x11, #460]
	ldr	x12, [x12, #136]
	madd	x15, x15, x16, x12
	ldrh	w15, [x15, #2]
	and	w15, w15, #0x3ff
	sub	w14, w10, w15
	cmp	w14, w13
	b.lo	.LBB29_1776
// %bb.1773:
	ldr	w14, [x11, #580]
	mov	w15, #48
	madd	x14, x14, x15, x12
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w14, w10, w14
	cmp	w14, w13
	b.lo	.LBB29_1776
// %bb.1774:
	ldr	w14, [x11, #700]
	mov	w15, #48
	madd	x14, x14, x15, x12
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w14, w10, w14
	cmp	w14, w13
	b.lo	.LBB29_1776
// %bb.1775:
	ldr	w13, [x11, #100]
	mov	w14, #48
	madd	x12, x13, x14, x12
	ldrh	w12, [x12, #2]
	and	w12, w12, #0x3ff
	sub	w10, w10, w12
	ldr	w12, [sp, #36]          // 4-byte Folded Reload
	cmp	w10, w12
	b.hs	.LBB29_1948
.LBB29_1776:
	sub	x10, x23, #1            // =1
	cmn	w9, #1                  // =1
	ldp	x12, x11, [sp, #56]     // 16-byte Folded Reload
	ldp	x23, x13, [sp, #40]     // 16-byte Folded Reload
	add	x11, x10, x11
	add	x12, x10, x12
	add	x13, x10, x13
	asr	x10, x11, x23
	asr	x11, x12, x23
	asr	x12, x13, x23
	udiv	w10, w10, w26
	udiv	w13, w11, w26
	udiv	w11, w12, w26
	lsl	w12, w13, #1
	b.eq	.LBB29_1778
// %bb.1777:
	ldr	w13, [x21, #1192]
	udiv	w9, w9, w13
.LBB29_1778:
	ldr	w13, [sp, #72]          // 4-byte Folded Reload
	add	w10, w10, w13
	add	w10, w10, w12
	add	w10, w10, w11
	add	w9, w10, w9
	cmp	w8, w9
	b.ls	.LBB29_1823
.LBB29_1779:
	sub	w8, w28, w24
	str	wzr, [sp, #72]          // 4-byte Folded Spill
	stp	w24, w8, [x29, #-140]
	cmp	x28, w24, uxtw
	b.ls	.LBB29_1821
.LBB29_1780:                            // =>This Loop Header: Depth=1
                                        //     Child Loop BB29_1781 Depth 2
                                        //       Child Loop BB29_1785 Depth 3
	mov	w23, wzr
.LBB29_1781:                            //   Parent Loop BB29_1780 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB29_1785 Depth 3
	sub	w8, w28, w24
	sub	x1, x29, #144           // =144
	mov	x0, x22
	mov	w2, wzr
	mov	w3, wzr
	stur	w8, [x29, #-136]
	bl	f2fs_map_blocks
	cbnz	w0, .LBB29_1915
// %bb.1782:                            //   in Loop: Header=BB29_1781 Depth=2
	ldurh	w8, [x29, #-132]
	mov	w9, #4192
	tst	w8, w9
	b.eq	.LBB29_1816
// %bb.1783:                            //   in Loop: Header=BB29_1781 Depth=2
	add	x8, x22, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4194304
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	w8, [sp, #88]           // 4-byte Folded Reload
	ldur	w24, [x29, #-140]
	cmp	w23, w8
	b.hs	.LBB29_1817
// %bb.1784:                            //   in Loop: Header=BB29_1781 Depth=2
	ldur	w8, [x29, #-136]
	add	w8, w8, w24
	cmp	w24, w8
	b.hs	.LBB29_1817
.LBB29_1785:                            //   Parent Loop BB29_1780 Depth=1
                                        //     Parent Loop BB29_1781 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	x0, x22
	mov	x1, x24
	mov	w2, #1
	bl	f2fs_get_lock_data_page
	mov	x26, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB29_1916
// %bb.1786:                            //   in Loop: Header=BB29_1785 Depth=3
	mov	x0, x26
	bl	set_page_dirty
	cbz	x26, .LBB29_1811
// %bb.1787:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x8, [x26, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x26, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x26, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB29_1803
// %bb.1788:                            //   in Loop: Header=BB29_1785 Depth=3
	tbnz	w8, #0, .LBB29_1802
// %bb.1789:                            //   in Loop: Header=BB29_1785 Depth=3
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1792
// %bb.1790:                            //   in Loop: Header=BB29_1785 Depth=3
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1792
// %bb.1791:                            //   in Loop: Header=BB29_1785 Depth=3
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB29_1792:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1794
// %bb.1793:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB29_1813
.LBB29_1794:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x0, [x26, #24]
.LBB29_1795:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1797
// %bb.1796:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB29_1814
.LBB29_1797:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x0, [x26, #24]
.LBB29_1798:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1800
// %bb.1799:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB29_1815
.LBB29_1800:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x0, [x26, #24]
.LBB29_1801:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB29_1802:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_1809
	b	.LBB29_2071
.LBB29_1803:                            //   in Loop: Header=BB29_1785 Depth=3
	tbnz	w8, #0, .LBB29_1808
// %bb.1804:                            //   in Loop: Header=BB29_1785 Depth=3
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1807
// %bb.1805:                            //   in Loop: Header=BB29_1785 Depth=3
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1807
// %bb.1806:                            //   in Loop: Header=BB29_1785 Depth=3
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB29_1807:                            //   in Loop: Header=BB29_1785 Depth=3
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_1808:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2072
.LBB29_1809:                            //   in Loop: Header=BB29_1785 Depth=3
	mov	x0, x26
	bl	unlock_page
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x26, x9, eq
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
	cbnz	w9, .LBB29_1811
// %bb.1810:                            //   in Loop: Header=BB29_1785 Depth=3
	bl	__put_page
.LBB29_1811:                            //   in Loop: Header=BB29_1785 Depth=3
	ldr	w8, [sp, #72]           // 4-byte Folded Reload
	add	x24, x24, #1            // =1
	add	w23, w23, #1            // =1
	add	w8, w8, #1              // =1
	str	w8, [sp, #72]           // 4-byte Folded Spill
	ldr	w8, [sp, #88]           // 4-byte Folded Reload
	cmp	w23, w8
	b.hs	.LBB29_1817
// %bb.1812:                            //   in Loop: Header=BB29_1785 Depth=3
	ldp	w8, w9, [x29, #-140]
	add	w8, w9, w8
	cmp	x24, x8
	b.lo	.LBB29_1785
	b	.LBB29_1817
.LBB29_1813:                            //   in Loop: Header=BB29_1785 Depth=3
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB29_1795
.LBB29_1814:                            //   in Loop: Header=BB29_1785 Depth=3
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB29_1798
.LBB29_1815:                            //   in Loop: Header=BB29_1785 Depth=3
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB29_1801
.LBB29_1816:                            //   in Loop: Header=BB29_1781 Depth=2
	ldr	w24, [sp, #96]
.LBB29_1817:                            //   in Loop: Header=BB29_1781 Depth=2
	cmp	x28, w24, uxtw
	stur	w24, [x29, #-140]
	b.ls	.LBB29_1819
// %bb.1818:                            //   in Loop: Header=BB29_1781 Depth=2
	ldr	w8, [sp, #88]           // 4-byte Folded Reload
	cmp	w23, w8
	b.lo	.LBB29_1781
.LBB29_1819:                            //   in Loop: Header=BB29_1780 Depth=1
	add	x8, x22, #712           // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 4194304
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x0, [x22, #48]
	bl	filemap_fdatawrite
	cbnz	w0, .LBB29_1822
// %bb.1820:                            //   in Loop: Header=BB29_1780 Depth=1
	ldur	w24, [x29, #-140]
	cmp	x28, w24, uxtw
	b.hi	.LBB29_1780
.LBB29_1821:
	mov	w26, wzr
	b	.LBB29_1916
.LBB29_1822:
	mov	w26, w0
	b	.LBB29_1023
.LBB29_1823:
	mov	w26, #-11
	b	.LBB29_1023
.LBB29_1824:
	mov	x0, x22
	mov	w1, #1
	add	x8, x22, #712           // =712
	mov	x9, #34359738368
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x22
	bl	current_time
	stp	x0, x1, [x22, #120]
	mov	x0, x22
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	ldr	w8, [x22, #1256]
	cbz	w8, .LBB29_1900
// %bb.1825:
	add	x0, x22, #1016          // =1016
	str	x0, [sp, #72]           // 8-byte Folded Spill
	bl	down_write
	add	x0, x22, #1064          // =1064
	str	x0, [sp, #64]           // 8-byte Folded Spill
	bl	down_write
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	cbz	x8, .LBB29_1917
// %bb.1826:
	sub	x8, x29, #144           // =144
	mov	x28, xzr
	mov	w24, wzr
	add	x25, x8, #8             // =8
	b	.LBB29_1830
.LBB29_1827:                            //   in Loop: Header=BB29_1830 Depth=1
	mov	w27, w0
	cmn	w0, #2                  // =2
	b.ne	.LBB29_1918
// %bb.1828:                            //   in Loop: Header=BB29_1830 Depth=1
	sub	x0, x29, #144           // =144
	mov	x1, x28
	bl	f2fs_get_next_page_offset
	mov	x28, x0
	mov	w27, wzr
.LBB29_1829:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	cmp	x8, x28
	b.ls	.LBB29_1918
.LBB29_1830:                            // =>This Inner Loop Header: Depth=1
	sub	x0, x29, #144           // =144
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	sub	x0, x29, #144           // =144
	mov	x1, x28
	mov	w2, #1
	stur	x22, [x29, #-144]
	stp	xzr, xzr, [x25]
	str	wzr, [x25, #16]
	bl	f2fs_get_dnode_of_data
	cbnz	w0, .LBB29_1827
// %bb.1831:                            //   in Loop: Header=BB29_1830 Depth=1
	ldur	x8, [x29, #-128]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w9, w8
	b.ne	.LBB29_1835
// %bb.1832:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	w8, [x22, #1160]
	ldr	w9, [x22, #1168]
	ldrh	w10, [x22]
	add	w8, w9, w8, asr #2
	mov	w9, #923
	sub	w8, w9, w8
	and	w9, w10, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_1839
// %bb.1833:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x9, [x22, #712]
	tbz	w9, #31, .LBB29_1839
// %bb.1834:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	w9, [x22, #1268]
	neg	w9, w9
	b	.LBB29_1838
.LBB29_1835:                            //   in Loop: Header=BB29_1830 Depth=1
	ldrh	w8, [x22]
	and	w9, w8, #0xf000
	mov	w8, #1018
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB29_1839
// %bb.1836:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x9, [x22, #712]
	mov	w8, #1018
	tbz	w9, #31, .LBB29_1839
// %bb.1837:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	w8, [x22, #1268]
	mov	w9, #1018
	neg	w8, w8
.LBB29_1838:                            //   in Loop: Header=BB29_1830 Depth=1
	and	w8, w8, w9
.LBB29_1839:                            //   in Loop: Header=BB29_1830 Depth=1
	ldur	w9, [x29, #-116]
	mov	w8, w8
	ldr	w10, [x22, #1268]
	sub	x0, x29, #144           // =144
	sub	x8, x8, x9
	ldr	x9, [sp, #80]           // 8-byte Folded Reload
	sub	x9, x9, x28
	cmp	x8, x9
	csel	x8, x8, x9, lo
	sub	w9, w10, #1             // =1
	sub	x8, x8, #1              // =1
	orr	x8, x8, x9
	add	x1, x8, #1              // =1
	mov	x23, x1
	bl	release_compress_blocks
	ldur	x26, [x29, #-128]
	mov	w27, w0
	cbz	x26, .LBB29_1864
// %bb.1840:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x8, [x26, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x26, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x26, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB29_1856
// %bb.1841:                            //   in Loop: Header=BB29_1830 Depth=1
	tbnz	w8, #0, .LBB29_1855
// %bb.1842:                            //   in Loop: Header=BB29_1830 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1845
// %bb.1843:                            //   in Loop: Header=BB29_1830 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1845
// %bb.1844:                            //   in Loop: Header=BB29_1830 Depth=1
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB29_1845:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1847
// %bb.1846:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB29_1870
.LBB29_1847:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x0, [x26, #24]
.LBB29_1848:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1850
// %bb.1849:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB29_1871
.LBB29_1850:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x0, [x26, #24]
.LBB29_1851:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB29_1853
// %bb.1852:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB29_1872
.LBB29_1853:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x0, [x26, #24]
.LBB29_1854:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB29_1855:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB29_1862
	b	.LBB29_2080
.LBB29_1856:                            //   in Loop: Header=BB29_1830 Depth=1
	tbnz	w8, #0, .LBB29_1861
// %bb.1857:                            //   in Loop: Header=BB29_1830 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1860
// %bb.1858:                            //   in Loop: Header=BB29_1830 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1860
// %bb.1859:                            //   in Loop: Header=BB29_1830 Depth=1
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB29_1860:                            //   in Loop: Header=BB29_1830 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB29_1861:                            //   in Loop: Header=BB29_1830 Depth=1
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB29_2081
.LBB29_1862:                            //   in Loop: Header=BB29_1830 Depth=1
	mov	x0, x26
	bl	unlock_page
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x26, x9, eq
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
	cbnz	w9, .LBB29_1864
// %bb.1863:                            //   in Loop: Header=BB29_1830 Depth=1
	bl	__put_page
.LBB29_1864:                            //   in Loop: Header=BB29_1830 Depth=1
	ldur	x8, [x29, #-136]
	cbz	x8, .LBB29_1868
// %bb.1865:                            //   in Loop: Header=BB29_1830 Depth=1
	ldur	x9, [x29, #-128]
	cmp	x9, x8
	b.eq	.LBB29_1868
// %bb.1866:                            //   in Loop: Header=BB29_1830 Depth=1
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
	cbnz	w9, .LBB29_1868
// %bb.1867:                            //   in Loop: Header=BB29_1830 Depth=1
	bl	__put_page
.LBB29_1868:                            //   in Loop: Header=BB29_1830 Depth=1
	stp	xzr, xzr, [x25]
	tbnz	w27, #31, .LBB29_1918
// %bb.1869:                            //   in Loop: Header=BB29_1830 Depth=1
	add	x28, x23, x28
	add	w24, w27, w24
	b	.LBB29_1829
.LBB29_1870:                            //   in Loop: Header=BB29_1830 Depth=1
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB29_1848
.LBB29_1871:                            //   in Loop: Header=BB29_1830 Depth=1
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB29_1851
.LBB29_1872:                            //   in Loop: Header=BB29_1830 Depth=1
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB29_1854
.LBB29_1873:
	ldr	x8, [x26, #712]
	tbz	x8, #43, .LBB29_1875
// %bb.1874:
	ldr	x8, [x26, #712]
	tbnz	x8, #44, .LBB29_1069
.LBB29_1875:
	ldr	x8, [x26, #40]
	ldr	x9, [x24, #40]
	cmp	x8, x9
	b.eq	.LBB29_1909
// %bb.1876:
	ldr	x3, [x26, #64]
	adrp	x1, .L.str.62
	ldr	x4, [x24, #64]
	adrp	x2, .L__func__.f2fs_dedup_param_check
	add	x1, x1, :lo12:.L.str.62
	add	x2, x2, :lo12:.L__func__.f2fs_dedup_param_check
	mov	x0, x27
	bl	f2fs_printk
	b	.LBB29_1557
.LBB29_1877:
	mov	w2, #4
	b	.LBB29_1880
.LBB29_1878:
	mov	w2, #8
	b	.LBB29_1882
.LBB29_1879:
	mov	x2, x0
.LBB29_1880:
	add	x8, sp, #104            // =104
	mov	w1, wzr
	sub	x8, x8, x2
	add	x0, x8, #4              // =4
	b	.LBB29_1883
.LBB29_1881:
	mov	x2, x0
.LBB29_1882:
	add	x8, sp, #104            // =104
	mov	w1, wzr
	sub	x8, x8, x2
	add	x0, x8, #8              // =8
.LBB29_1883:
	bl	memset
	mov	w28, #-14
	sxtw	x21, w28
	b	.LBB29_577
.LBB29_1884:
	ldr	x2, [x21, #64]
	adrp	x1, .L.str.93
	add	x1, x1, :lo12:.L.str.93
	mov	x0, x23
	bl	f2fs_printk
.LBB29_1885:
	ldrb	w8, [sp, #104]
	tbz	w8, #1, .LBB29_1376
// %bb.1886:
	ldr	x8, [x21, #712]
	tbnz	x8, #49, .LBB29_1888
// %bb.1887:
	add	x8, x21, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	b	.LBB29_1375
.LBB29_1888:
	ldr	x2, [x21, #64]
	adrp	x1, .L.str.94
	add	x1, x1, :lo12:.L.str.94
	mov	x0, x23
	bl	f2fs_printk
	b	.LBB29_1376
.LBB29_1889:
	cbnz	w25, .LBB29_1891
.LBB29_1890:
	ldr	x0, [x22, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w25, w0
	cbz	w0, .LBB29_1525
.LBB29_1891:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	adrp	x1, .L.str.88
	ldr	x3, [x22, #64]
	add	x1, x1, :lo12:.L.str.88
	ldr	x0, [sp]                // 8-byte Folded Reload
	mov	w4, w25
	ldr	x2, [x8, #64]
	bl	f2fs_printk
	b	.LBB29_1059
.LBB29_1892:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB29_746
.LBB29_1893:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x9, [x9, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x9
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x9
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB29_1894:
	mov	w24, wzr
	//APP
	1:.if 1 == 1
661:
	str     x8, [x11]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr x8, [x11]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w24, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w8, [x10, :lo12:arm64_const_caps_ready]
	cmp	w8, #1                  // =1
	b.lt	.LBB29_1897
// %bb.1895:
	adrp	x8, cpu_hwcap_keys
	add	x8, x8, :lo12:cpu_hwcap_keys
	ldr	w8, [x8, #16]
	cmp	w8, #0                  // =0
	b.le	.LBB29_1898
.LBB29_1896:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w24
	b	.LBB29_577
.LBB29_1897:
	adrp	x8, cpu_hwcaps
	ldr	x8, [x8, :lo12:cpu_hwcaps]
	tbnz	w8, #4, .LBB29_1896
.LBB29_1898:
	//APP
	mrs	x8, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x9, ttbr1_el1
	//NO_APP
	and	x9, x9, #0xffffffffffff
	sxtw	x21, w24
	sub	x10, x9, #1, lsl #12    // =4096
	//APP
	msr ttbr0_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x9
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x8		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1899:
	ldr	x8, [x26, #48]
	adrp	x1, .L.str.72
	ldr	x2, [x25, #64]
	add	x1, x1, :lo12:.L.str.72
	mov	x0, x27
	ldr	x3, [x8, #64]
	bl	f2fs_printk
	mov	x0, x26
	bl	dput
	mov	w28, #-1
	b	.LBB29_961
.LBB29_1900:
	mov	w27, wzr
	mov	w24, wzr
	b	.LBB29_1925
.LBB29_1901:
	mov	w28, #-116
	b	.LBB29_961
.LBB29_1902:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB29_1087
.LBB29_1903:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x8
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB29_1904:
	mov	w25, wzr
	//APP
	1:.if 1 == 1
661:
	str     x11, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr x11, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w25, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w8, [x9, :lo12:arm64_const_caps_ready]
	cmp	w8, #1                  // =1
	b.lt	.LBB29_1907
// %bb.1905:
	adrp	x8, cpu_hwcap_keys
	add	x8, x8, :lo12:cpu_hwcap_keys
	ldr	w8, [x8, #16]
	cmp	w8, #0                  // =0
	b.le	.LBB29_1908
.LBB29_1906:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w25
	b	.LBB29_577
.LBB29_1907:
	adrp	x8, cpu_hwcaps
	ldr	x8, [x8, :lo12:cpu_hwcaps]
	tbnz	w8, #4, .LBB29_1906
.LBB29_1908:
	//APP
	mrs	x8, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x9, ttbr1_el1
	//NO_APP
	and	x9, x9, #0xffffffffffff
	sxtw	x21, w25
	sub	x10, x9, #1, lsl #12    // =4096
	//APP
	msr ttbr0_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x9
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x8		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1909:
	ldr	x3, [x26, #80]
	ldr	x5, [x24, #80]
	cmp	x3, x5
	b.ne	.LBB29_1943
// %bb.1910:
	mov	x0, x27
	mov	x1, x26
	mov	w2, #1
	bl	f2fs_inode_param_check
	mov	w28, w0
	cbnz	w0, .LBB29_1558
// %bb.1911:
	mov	x0, x27
	mov	x1, x24
	mov	w2, #1
	bl	f2fs_inode_param_check
	mov	w28, w0
	cbnz	w0, .LBB29_1558
// %bb.1912:
	ldr	x0, [x19, #24]
	ldrb	w8, [x0, #3]
	tbnz	w8, #2, .LBB29_2054
.LBB29_1913:
	bl	dget_parent
	str	x0, [sp, #88]           // 8-byte Folded Spill
	add	x0, x26, #720           // =720
	str	x0, [sp, #80]           // 8-byte Folded Spill
	bl	down_read
	ldr	x8, [x26, #712]
	tbnz	x8, #43, .LBB29_1974
.LBB29_1914:
	mov	x27, xzr
	b	.LBB29_1977
.LBB29_1915:
	mov	w26, w0
.LBB29_1916:
	add	x8, x22, #712           // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 4194304
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	up_write
	cbnz	w26, .LBB29_1024
	b	.LBB29_1244
.LBB29_1917:
	mov	w24, wzr
	mov	w27, wzr
.LBB29_1918:
	ldr	w8, [x22, #1256]
	cbz	w8, .LBB29_1924
// %bb.1919:
	ldr	w3, [x22, #1256]
	adrp	x1, .L.str.54
	ldr	x4, [x22, #64]
	adrp	x2, .L__func__.f2fs_ioc_compress_release_file
	add	x1, x1, :lo12:.L.str.54
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_compress_release_file
	mov	x0, x21
	bl	f2fs_printk
	str	wzr, [x22, #1256]
	cbz	x21, .LBB29_1921
// %bb.1920:
	add	x8, x21, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB29_1921:
	adrp	x23, f2fs_dclient
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1924
// %bb.1922:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1924
// %bb.1923:
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str.17
	adrp	x2, .L__func__.f2fs_ioc_compress_release_file
	add	x1, x1, :lo12:.L.str.17
	mov	w3, #7779
	add	x2, x2, :lo12:.L__func__.f2fs_ioc_compress_release_file
	bl	dsm_client_record
	mov	w8, #15241
	ldr	x0, [x23, :lo12:f2fs_dclient]
	movk	w8, #14160, lsl #16
	add	w1, w8, #3              // =3
	bl	dsm_client_notify
.LBB29_1924:
	ldr	x0, [sp, #72]           // 8-byte Folded Reload
	bl	up_write
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	bl	up_write
.LBB29_1925:
	mov	w25, wzr
	b	.LBB29_1248
.LBB29_1926:
	mov	w2, #8
	b	.LBB29_1928
.LBB29_1927:
	mov	x2, x0
.LBB29_1928:
	add	x8, sp, #104            // =104
	b	.LBB29_1504
.LBB29_1929:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB29_535
.LBB29_1930:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x8
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB29_1931:
	mov	w25, wzr
	//APP
	1:.if 1 == 1
661:
	str     x11, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr x11, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w25, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w8, [x9, :lo12:arm64_const_caps_ready]
	cmp	w8, #1                  // =1
	b.lt	.LBB29_1934
// %bb.1932:
	adrp	x8, cpu_hwcap_keys
	add	x8, x8, :lo12:cpu_hwcap_keys
	ldr	w8, [x8, #16]
	cmp	w8, #0                  // =0
	b.le	.LBB29_1935
.LBB29_1933:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w25
	b	.LBB29_577
.LBB29_1934:
	adrp	x8, cpu_hwcaps
	ldr	x8, [x8, :lo12:cpu_hwcaps]
	tbnz	w8, #4, .LBB29_1933
.LBB29_1935:
	//APP
	mrs	x8, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x9, ttbr1_el1
	//NO_APP
	and	x9, x9, #0xffffffffffff
	sxtw	x21, w25
	sub	x10, x9, #1, lsl #12    // =4096
	//APP
	msr ttbr0_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x9
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x8		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1936:
	adrp	x11, cpu_hwcaps
	ldr	x11, [x11, :lo12:cpu_hwcaps]
	tbnz	w11, #4, .LBB29_649
.LBB29_1937:
	//APP
	mrs	x11, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x12, ttbr1_el1
	//NO_APP
	mov	x13, x8
	bfxil	x13, x12, #0, #48
	//APP
	msr ttbr1_el1, x13
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x11		// arch_local_irq_restore
	//NO_APP
.LBB29_1938:
	mov	x8, xzr
	mov	w24, wzr
	//APP
	1:.if 1 == 1
661:
	str     x8, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr x8, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w24, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w8, [x9, :lo12:arm64_const_caps_ready]
	cmp	w8, #1                  // =1
	b.lt	.LBB29_1941
// %bb.1939:
	adrp	x8, cpu_hwcap_keys
	add	x8, x8, :lo12:cpu_hwcap_keys
	ldr	w8, [x8, #16]
	cmp	w8, #0                  // =0
	b.le	.LBB29_1942
.LBB29_1940:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w24
	b	.LBB29_577
.LBB29_1941:
	adrp	x8, cpu_hwcaps
	ldr	x8, [x8, :lo12:cpu_hwcaps]
	tbnz	w8, #4, .LBB29_1940
.LBB29_1942:
	//APP
	mrs	x8, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x9, ttbr1_el1
	//NO_APP
	and	x9, x9, #0xffffffffffff
	sxtw	x21, w24
	sub	x10, x9, #1, lsl #12    // =4096
	//APP
	msr ttbr0_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x9
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x8		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1943:
	ldr	x2, [x26, #64]
	adrp	x1, .L.str.63
	ldr	x4, [x24, #64]
	add	x1, x1, :lo12:.L.str.63
	mov	x0, x27
	bl	f2fs_printk
	b	.LBB29_1557
.LBB29_1944:
	mov	x0, x23
	bl	f2fs_add_orphan_inode
	add	x28, x25, #720          // =720
	mov	x0, x28
	bl	down_write
	mov	x0, x25
	bl	igrab
	mov	x0, x25
	mov	w1, #1
	add	x27, x25, #712          // =712
	mov	x8, #17592186044416
	//APP
	// atomic64_or
	prfm	pstl1strm, [x27]
1:	ldxr	x9, [x27]
	orr	x9, x9, x8
	stxr	w10, x9, [x27]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x25
	mov	w1, #1
	mov	x10, #8796093022208
	//APP
	// atomic64_or
	prfm	pstl1strm, [x27]
1:	ldxr	x8, [x27]
	orr	x8, x8, x10
	stxr	w9, x8, [x27]
	cbnz	w9, 1b
	//NO_APP
	mov	x27, #8796093022208
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x25
	bl	inc_nlink
	mov	x0, x25
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x28
	bl	up_write
	add	x28, x23, #720          // =720
	mov	x0, x28
	bl	down_write
	str	x25, [x23, #1280]
	mov	x0, x23
	mov	w1, #1
	add	x8, x23, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, x27
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x28
	bl	up_write
	ldr	w1, [x25, #64]
	mov	x0, x26
	bl	f2fs_remove_orphan_inode
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	up_read
	ldr	w8, [x23, #1288]
	cbz	w8, .LBB29_1954
// %bb.1945:
	sub	x0, x29, #144           // =144
	mov	w1, wzr
	bl	init_wait_entry
	add	x28, x23, #1296         // =1296
.LBB29_1946:                            // =>This Inner Loop Header: Depth=1
	sub	x1, x29, #144           // =144
	mov	x0, x28
	mov	w2, #2
	bl	prepare_to_wait_event
	ldr	w8, [x23, #1288]
	cbz	w8, .LBB29_1953
// %bb.1947:                            //   in Loop: Header=BB29_1946 Depth=1
	bl	schedule
	b	.LBB29_1946
.LBB29_1948:
	ldr	w8, [x21, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB29_1779
// %bb.1949:
	ldr	x8, [x21, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB29_1779
// %bb.1950:
	ldr	w1, [x11, #820]
	mov	x0, x21
	str	x1, [sp, #24]           // 8-byte Folded Spill
                                        // kill: def $w1 killed $w1 killed $x1
	bl	f2fs_usable_blks_in_seg
	ldr	x9, [x21, #136]
	mov	w10, #48
	ldr	x11, [sp, #24]          // 8-byte Folded Reload
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x11, x10, x8
	ldr	w10, [sp, #36]          // 4-byte Folded Reload
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w10
	b.hs	.LBB29_1779
// %bb.1951:
	ldr	x8, [x9, #8]
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB29_1776
.LBB29_1952:
	mov	x0, x21
	mov	x1, xzr
	bl	show_stack
	ldr	x1, [x24, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x27, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x24, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB29_1540
.LBB29_1953:
	sub	x1, x29, #144           // =144
	mov	x0, x28
	bl	finish_wait
.LBB29_1954:
	add	x28, x23, #968          // =968
	mov	x0, x28
	bl	down_write
	mov	x0, x23
	bl	inode_dio_wait
	mov	x0, x28
	bl	up_write
	add	x0, x23, #1016          // =1016
	str	x0, [sp, #72]           // 8-byte Folded Spill
	bl	down_write
	ldr	x0, [x23, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w28, w0
	cbnz	w0, .LBB29_1958
// %bb.1955:
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	bl	_raw_spin_lock
	ldr	x8, [x26, #352]
	cbz	x8, .LBB29_1957
// %bb.1956:
	adrp	x28, jiffies
	ldr	x8, [x26, #360]
	ldr	x9, [x28, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB29_2003
.LBB29_1957:
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	bl	_raw_spin_unlock
	ldr	x27, [sp, #80]          // 8-byte Folded Reload
	mov	x0, x27
	bl	down_read
	ldr	w1, [x23, #64]
	mov	x0, x26
	bl	f2fs_remove_orphan_inode
	mov	w1, #47
	mov	x0, x23
	bl	f2fs_truncate_dedup_inode
	ldr	x8, [x26, #224]
	mov	w28, w0
	mov	x0, x27
	ldr	x8, [x8]
	str	x8, [x23, #1320]
	bl	up_read
.LBB29_1958:
	ldr	x0, [sp, #72]           // 8-byte Folded Reload
	bl	up_write
	ldr	x2, [x23, #64]
	adrp	x1, .L.str.74
	ldr	x3, [x25, #64]
	add	x1, x1, :lo12:.L.str.74
	mov	x0, x26
	mov	w4, w28
	bl	f2fs_printk
	adrp	x8, __tracepoint_f2fs_dedup_ioc_create_layered_inode
	add	x8, x8, :lo12:__tracepoint_f2fs_dedup_ioc_create_layered_inode
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_961
// %bb.1959:
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
	tbz	w9, #0, .LBB29_961
// %bb.1960:
	ldr	w9, [x24, #80]
	add	w9, w9, #1              // =1
	str	w9, [x24, #80]
	//APP
	//NO_APP
	ldr	x26, [x8, #32]
	cbz	x26, .LBB29_1963
// %bb.1961:
	ldr	x8, [x26], #24
.LBB29_1962:                            // =>This Inner Loop Header: Depth=1
	ldur	x0, [x26, #-16]
	mov	x1, x23
	mov	x2, x25
	blr	x8
	ldr	x8, [x26], #24
	cbnz	x8, .LBB29_1962
.LBB29_1963:
	//APP
	//NO_APP
	ldr	w8, [x24, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x24, #80]
	b.ne	.LBB29_961
// %bb.1964:
	ldr	x8, [x24]
	tbz	w8, #1, .LBB29_961
// %bb.1965:
	bl	preempt_schedule_notrace
	b	.LBB29_961
.LBB29_1966:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB29_1259
.LBB29_1967:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x8
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB29_1968:
	mov	w25, wzr
	//APP
	1:.if 1 == 1
661:
	str     x11, [x10]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	sttr x11, [x10]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup,"ax"
	.align	2
3:	mov	w25, -14
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w8, [x9, :lo12:arm64_const_caps_ready]
	cmp	w8, #1                  // =1
	b.lt	.LBB29_1971
// %bb.1969:
	adrp	x8, cpu_hwcap_keys
	add	x8, x8, :lo12:cpu_hwcap_keys
	ldr	w8, [x8, #16]
	cmp	w8, #0                  // =0
	b.le	.LBB29_1972
.LBB29_1970:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	sxtw	x21, w25
	b	.LBB29_577
.LBB29_1971:
	adrp	x8, cpu_hwcaps
	ldr	x8, [x8, :lo12:cpu_hwcaps]
	tbnz	w8, #4, .LBB29_1970
.LBB29_1972:
	//APP
	mrs	x8, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x9, ttbr1_el1
	//NO_APP
	and	x9, x9, #0xffffffffffff
	sxtw	x21, w25
	sub	x10, x9, #1, lsl #12    // =4096
	//APP
	msr ttbr0_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x9
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x8		// arch_local_irq_restore
	//NO_APP
	b	.LBB29_577
.LBB29_1973:
	mov	x0, x24
	mov	x1, xzr
	bl	show_stack
	ldr	x1, [x26, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x27, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x26, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB29_1181
.LBB29_1974:
	ldr	x8, [x26, #712]
	tbz	x8, #43, .LBB29_1976
// %bb.1975:
	ldr	x8, [x26, #712]
	tbnz	x8, #44, .LBB29_1914
.LBB29_1976:
	ldr	x0, [x26, #1280]
	bl	igrab
	mov	x27, x0
.LBB29_1977:
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	up_read
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x0, [x8, #48]
	ldrb	w8, [x0, #13]
	tbz	w8, #6, .LBB29_1979
// %bb.1978:
	ldr	x8, [x27, #40]
	mov	x1, x27
	ldr	x28, [x8, #1104]
	bl	fscrypt_has_permitted_context
	cbz	w0, .LBB29_2000
.LBB29_1979:
	mov	w28, wzr
	cbz	x27, .LBB29_1989
.LBB29_1980:
	ldr	x8, [x27, #712]
	tbnz	x8, #43, .LBB29_1985
.LBB29_1981:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_1984
// %bb.1982:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_1984
// %bb.1983:
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.put_inner_inode
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #4511
	add	x2, x2, :lo12:.L__func__.put_inner_inode
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB29_1984:
	ldr	x8, [x27, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x27, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x27, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	b	.LBB29_1986
.LBB29_1985:
	ldr	x8, [x27, #712]
	tbz	x8, #44, .LBB29_1981
.LBB29_1986:
	ldr	x8, [x27, #712]
	tbz	x8, #43, .LBB29_2082
// %bb.1987:
	ldr	x8, [x27, #712]
	tbz	x8, #44, .LBB29_2082
// %bb.1988:
	mov	x0, x27
	bl	iput
.LBB29_1989:
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	bl	dput
	cbz	w28, .LBB29_1991
// %bb.1990:
	mov	w28, #-1
	b	.LBB29_1558
.LBB29_1991:
	ldr	x0, [x19, #24]
	ldrb	w8, [x0, #3]
	tbnz	w8, #2, .LBB29_2056
.LBB29_1992:
	bl	dget_parent
	ldr	x8, [x20, #24]
	str	x0, [sp, #88]           // 8-byte Folded Spill
	ldrb	w9, [x8, #3]
	tbnz	w9, #2, .LBB29_2057
.LBB29_1993:
	mov	x0, x8
	bl	dget_parent
	ldr	x27, [x19, #32]
	mov	x28, x0
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x10, [x20, #32]
	ldr	x9, [x27, #40]
	ldr	x8, [x8, #48]
	str	x10, [sp, #72]          // 8-byte Folded Spill
	ldr	x9, [x9, #1104]
	ldrb	w10, [x8, #13]
	str	x9, [sp, #64]           // 8-byte Folded Spill
	tbz	w10, #6, .LBB29_1995
// %bb.1994:
	ldr	x1, [sp, #72]           // 8-byte Folded Reload
	mov	x0, x8
	bl	fscrypt_has_permitted_context
	cbz	w0, .LBB29_2004
.LBB29_1995:
	ldr	x0, [x28, #48]
	ldrb	w8, [x0, #13]
	tbz	w8, #6, .LBB29_1997
// %bb.1996:
	mov	x1, x27
	bl	fscrypt_has_permitted_context
	cbz	w0, .LBB29_2006
.LBB29_1997:
	mov	x0, x28
	bl	dput
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	bl	dput
	ldr	x0, [x24, #48]
	bl	filemap_fdatawrite
	ldr	x0, [x24, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w28, w0
	cbnz	w0, .LBB29_1558
// %bb.1998:
	ldr	x8, [x24, #40]
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	ldr	x27, [x8, #1104]
	bl	down_read
	ldr	x8, [x26, #712]
	tbnz	x8, #43, .LBB29_2008
.LBB29_1999:
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	up_read
	mov	w28, #-9
	b	.LBB29_1558
.LBB29_2000:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	adrp	x1, .L.str.72
	ldr	x2, [x27, #64]
	add	x1, x1, :lo12:.L.str.72
	mov	x0, x28
	ldr	x8, [x8, #48]
	ldr	x3, [x8, #64]
	bl	f2fs_printk
	mov	w28, #-1
	cbnz	x27, .LBB29_1980
	b	.LBB29_1989
.LBB29_2001:
	add	x0, x8, #2185           // =2185
	bl	generate_random_uuid
	mov	x0, x22
	mov	w1, wzr
	bl	f2fs_commit_super
	ldr	x8, [x22, #16]
	cbz	w0, .LBB29_565
// %bb.2002:
	mov	w23, w0
	add	x0, x8, #2185           // =2185
	mov	w1, wzr
	mov	w2, #16
	bl	memset
	b	.LBB29_570
.LBB29_2003:
	mov	x0, x24
	mov	x1, xzr
	bl	show_stack
	ldr	x1, [x26, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x28, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x26, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB29_1957
.LBB29_2004:
	ldr	x24, [sp, #88]          // 8-byte Folded Reload
	adrp	x1, .L.str.82
	ldr	x3, [x27, #64]
	add	x1, x1, :lo12:.L.str.82
	ldr	x8, [x24, #48]
	ldr	x2, [x8, #64]
	ldp	x0, x8, [sp, #64]       // 16-byte Folded Reload
	ldr	x4, [x8, #64]
	bl	f2fs_printk
	mov	x0, x28
	bl	dput
	mov	x0, x24
	b	.LBB29_2007
.LBB29_2005:
	ldr	x8, [x0, #96]
	ldr	x1, [x19, #32]
	ldr	x8, [x8, #96]
	blr	x8
	b	.LBB29_1175
.LBB29_2006:
	ldr	x8, [x28, #48]
	adrp	x1, .L.str.83
	ldr	x2, [x27, #64]
	add	x1, x1, :lo12:.L.str.83
	ldr	x3, [x8, #64]
	ldp	x0, x8, [sp, #64]       // 16-byte Folded Reload
	ldr	x4, [x8, #64]
	bl	f2fs_printk
	mov	x0, x28
	bl	dput
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
.LBB29_2007:
	bl	dput
	mov	w28, #-1
	b	.LBB29_1558
.LBB29_2008:
	ldr	x8, [x26, #712]
	tbz	x8, #43, .LBB29_2010
// %bb.2009:
	ldr	x8, [x26, #712]
	tbnz	x8, #44, .LBB29_1999
.LBB29_2010:
	ldr	x0, [x26, #1280]
	bl	igrab
	mov	x28, x0
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	up_read
	str	x28, [sp, #88]          // 8-byte Folded Spill
	cbz	x28, .LBB29_2023
// %bb.2011:
	mov	x0, x26
	mov	x1, x24
	bl	dedup_file_is_same
	tbz	w0, #0, .LBB29_2024
// %bb.2012:
	add	x0, x27, #368           // =368
	mov	x28, x27
	str	x0, [sp, #80]           // 8-byte Folded Spill
	bl	_raw_spin_lock
	ldr	x8, [x27, #352]
	cbz	x8, .LBB29_2014
// %bb.2013:
	adrp	x28, jiffies
	ldr	x8, [x27, #360]
	ldr	x9, [x28, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB29_2055
.LBB29_2014:
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	_raw_spin_unlock
	add	x0, x27, #304           // =304
	mov	x28, x27
	str	x0, [sp, #72]           // 8-byte Folded Spill
	bl	down_read
	mov	x0, x27
	bl	f2fs_acquire_orphan_inode
	cbz	w0, .LBB29_2033
// %bb.2015:
	mov	w28, w0
	ldr	x0, [sp, #72]           // 8-byte Folded Reload
	bl	up_read
	ldr	x2, [x24, #64]
	adrp	x1, .L.str.84
	ldr	x3, [x26, #64]
	add	x1, x1, :lo12:.L.str.84
	mov	x0, x27
	bl	f2fs_printk
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x8, [x8, #712]
	tbnz	x8, #43, .LBB29_2037
.LBB29_2016:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_2019
// %bb.2017:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_2019
// %bb.2018:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.put_inner_inode
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #4511
	add	x2, x2, :lo12:.L__func__.put_inner_inode
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_2019:
	ldr	x24, [sp, #88]          // 8-byte Folded Reload
	ldr	x8, [x24, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x24, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x24, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	b	.LBB29_2038
.LBB29_2020:
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB29_1157
.LBB29_2021:
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB29_1160
.LBB29_2022:
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB29_1163
.LBB29_2023:
	mov	w28, #-9
	b	.LBB29_1558
.LBB29_2024:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x8, [x8, #712]
	tbnz	x8, #43, .LBB29_2029
.LBB29_2025:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB29_2028
// %bb.2026:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB29_2028
// %bb.2027:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.put_inner_inode
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #4511
	add	x2, x2, :lo12:.L__func__.put_inner_inode
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB29_2028:
	ldr	x24, [sp, #88]          // 8-byte Folded Reload
	ldr	x8, [x24, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x24, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x24, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	b	.LBB29_2030
.LBB29_2029:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x8, [x8, #712]
	tbz	x8, #44, .LBB29_2025
.LBB29_2030:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x8, [x8, #712]
	tbz	x8, #43, .LBB29_2083
// %bb.2031:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x8, [x8, #712]
	tbz	x8, #44, .LBB29_2083
// %bb.2032:
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	bl	iput
	mov	w28, #-116
	b	.LBB29_1558
.LBB29_2033:
	mov	x0, x24
	bl	f2fs_add_orphan_inode
	add	x0, x24, #720           // =720
	str	x0, [sp, #64]           // 8-byte Folded Spill
	bl	down_write
	ldr	x26, [sp, #88]          // 8-byte Folded Reload
	mov	x0, x24
	mov	w1, #1
	add	x28, x24, #712          // =712
	mov	x8, #8796093022208
	str	x26, [x24, #1280]
	//APP
	// atomic64_or
	prfm	pstl1strm, [x28]
1:	ldxr	x9, [x28]
	orr	x9, x9, x8
	stxr	w10, x9, [x28]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x24
	mov	w1, #1
	mov	x8, #140737488355328
	//APP
	// atomic64_or
	prfm	pstl1strm, [x28]
1:	ldxr	x9, [x28]
	orr	x9, x9, x8
	stxr	w10, x9, [x28]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	bl	up_write
	add	x28, x26, #720          // =720
	mov	x0, x28
	bl	down_write
	mov	x0, x26
	bl	inc_nlink
	mov	x0, x26
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	mov	x0, x28
	bl	up_write
	ldr	x0, [sp, #72]           // 8-byte Folded Reload
	bl	up_read
	ldr	w8, [x24, #1288]
	cbz	w8, .LBB29_2042
// %bb.2034:
	sub	x0, x29, #144           // =144
	mov	w1, wzr
	bl	init_wait_entry
	add	x26, x24, #1296         // =1296
.LBB29_2035:                            // =>This Inner Loop Header: Depth=1
	sub	x1, x29, #144           // =144
	mov	x0, x26
	mov	w2, #2
	bl	prepare_to_wait_event
	ldr	w8, [x24, #1288]
	cbz	w8, .LBB29_2041
// %bb.2036:                            //   in Loop: Header=BB29_2035 Depth=1
	bl	schedule
	b	.LBB29_2035
.LBB29_2037:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x8, [x8, #712]
	tbz	x8, #44, .LBB29_2016
.LBB29_2038:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x8, [x8, #712]
	tbz	x8, #43, .LBB29_2084
// %bb.2039:
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	ldr	x8, [x8, #712]
	tbz	x8, #44, .LBB29_2084
// %bb.2040:
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	bl	iput
	b	.LBB29_1558
.LBB29_2041:
	sub	x1, x29, #144           // =144
	mov	x0, x26
	bl	finish_wait
.LBB29_2042:
	add	x26, x24, #968          // =968
	mov	x0, x26
	bl	down_write
	mov	x0, x24
	bl	inode_dio_wait
	mov	x0, x26
	bl	up_write
	add	x26, x24, #1016         // =1016
	mov	x0, x26
	bl	down_write
	ldr	x0, [x24, #48]
	mov	x1, xzr
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w28, w0
	cbnz	w0, .LBB29_2046
// %bb.2043:
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	_raw_spin_lock
	ldr	x8, [x27, #352]
	cbz	x8, .LBB29_2045
// %bb.2044:
	adrp	x28, jiffies
	ldr	x8, [x27, #360]
	ldr	x9, [x28, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB29_2058
.LBB29_2045:
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	_raw_spin_unlock
	ldr	x0, [sp, #72]           // 8-byte Folded Reload
	bl	down_read
	ldr	w1, [x24, #64]
	mov	x0, x27
	mov	x28, x27
	bl	f2fs_remove_orphan_inode
	mov	w1, #47
	mov	x0, x24
	bl	f2fs_truncate_dedup_inode
	ldr	x8, [x27, #224]
	mov	w28, w0
	ldr	x0, [sp, #72]           // 8-byte Folded Reload
	ldr	x8, [x8]
	str	x8, [x24, #1320]
	bl	up_read
.LBB29_2046:
	mov	x0, x26
	bl	up_write
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	adrp	x1, .L.str.85
	ldr	x3, [x24, #64]
	adrp	x2, .L__func__.__f2fs_ioc_dedup_file
	add	x1, x1, :lo12:.L.str.85
	add	x2, x2, :lo12:.L__func__.__f2fs_ioc_dedup_file
	mov	x0, x27
	mov	w5, w28
	ldr	x4, [x8, #64]
	bl	f2fs_printk
	adrp	x8, __tracepoint_f2fs_dedup_ioc_dedup_inode
	add	x8, x8, :lo12:__tracepoint_f2fs_dedup_ioc_dedup_inode
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB29_1558
// %bb.2047:
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
	tbz	w9, #0, .LBB29_1558
// %bb.2048:
	ldr	w9, [x25, #80]
	add	w9, w9, #1              // =1
	str	w9, [x25, #80]
	//APP
	//NO_APP
	ldr	x26, [x8, #32]
	cbz	x26, .LBB29_2051
// %bb.2049:
	ldr	x8, [x26], #24
.LBB29_2050:                            // =>This Inner Loop Header: Depth=1
	ldur	x0, [x26, #-16]
	mov	x1, x24
	ldr	x2, [sp, #88]           // 8-byte Folded Reload
	blr	x8
	ldr	x8, [x26], #24
	cbnz	x8, .LBB29_2050
.LBB29_2051:
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x25, #80]
	b.ne	.LBB29_1558
// %bb.2052:
	ldr	x8, [x25]
	tbz	w8, #1, .LBB29_1558
// %bb.2053:
	bl	preempt_schedule_notrace
	b	.LBB29_1558
.LBB29_2054:
	ldr	x8, [x0, #96]
	ldr	x1, [x19, #32]
	ldr	x8, [x8, #96]
	blr	x8
	b	.LBB29_1913
.LBB29_2055:
	mov	x0, x25
	mov	x1, xzr
	bl	show_stack
	str	x27, [sp, #56]          // 8-byte Folded Spill
	adrp	x0, .L.str.31
	ldr	x1, [x27, #360]
	add	x0, x0, :lo12:.L.str.31
	ldr	x2, [x28, :lo12:jiffies]
	bl	printk
	ldr	x8, [sp, #56]           // 8-byte Folded Reload
	mov	x1, xzr
	ldr	x0, [x8, #352]
	bl	show_stack
	b	.LBB29_2014
.LBB29_2056:
	ldr	x8, [x0, #96]
	ldr	x1, [x19, #32]
	ldr	x8, [x8, #96]
	blr	x8
	b	.LBB29_1992
.LBB29_2057:
	ldr	x9, [x8, #96]
	mov	x0, x8
	ldr	x1, [x20, #32]
	ldr	x9, [x9, #96]
	blr	x9
	mov	x8, x0
	b	.LBB29_1993
.LBB29_2058:
	mov	x0, x25
	mov	x1, xzr
	bl	show_stack
	str	x27, [sp, #56]          // 8-byte Folded Spill
	adrp	x0, .L.str.31
	ldr	x1, [x27, #360]
	add	x0, x0, :lo12:.L.str.31
	ldr	x2, [x28, :lo12:jiffies]
	bl	printk
	ldr	x8, [sp, #56]           // 8-byte Folded Reload
	mov	x1, xzr
	ldr	x0, [x8, #352]
	bl	show_stack
	b	.LBB29_2045
.LBB29_2059:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2060:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2061:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2062:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2063:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2064:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2065:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2066:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2067:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2068:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2069:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2070:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2071:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2072:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2073:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2074:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2075:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2076:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2077:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2078:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2079:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2080:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2081:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2082:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 4511; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2083:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 4511; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB29_2084:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 4511; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end29:
	.size	__f2fs_ioctl, .Lfunc_end29-__f2fs_ioctl
	.section	.rodata,"a",@progbits
	.p2align	1
.LJTI29_0:
	.hword	(.LBB29_83-.LBB29_83)>>2
	.hword	(.LBB29_258-.LBB29_83)>>2
	.hword	(.LBB29_248-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_260-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_242-.LBB29_83)>>2
	.hword	(.LBB29_577-.LBB29_83)>>2
	.hword	(.LBB29_244-.LBB29_83)>>2
	.p2align	1
.LJTI29_1:
	.hword	(.LBB29_38-.LBB29_38)>>2
	.hword	(.LBB29_314-.LBB29_38)>>2
	.hword	(.LBB29_293-.LBB29_38)>>2
	.hword	(.LBB29_310-.LBB29_38)>>2
	.hword	(.LBB29_287-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_357-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_286-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_334-.LBB29_38)>>2
	.hword	(.LBB29_319-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_348-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_577-.LBB29_38)>>2
	.hword	(.LBB29_266-.LBB29_38)>>2
.LJTI29_2:
	.byte	(.LBB29_1409-.LBB29_1409)>>2
	.byte	(.LBB29_1422-.LBB29_1409)>>2
	.byte	(.LBB29_1417-.LBB29_1409)>>2
	.byte	(.LBB29_1419-.LBB29_1409)>>2
                                        // -- End function
	.text
	.globl	f2fs_compat_ioctl       // -- Begin function f2fs_compat_ioctl
	.p2align	3
	.type	f2fs_compat_ioctl,@function
f2fs_compat_ioctl:                      // @f2fs_compat_ioctl
// %bb.0:
	sub	sp, sp, #160            // =160
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	str	x23, [sp, #112]         // 8-byte Folded Spill
	stp	x22, x21, [sp, #128]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x20, x19, [sp, #144]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #32]
	ldr	x8, [x8, #40]
	ldr	x20, [x8, #1104]
	ldr	x9, [x20, #224]
	ldrb	w9, [x9, #132]
	tbnz	w9, #3, .LBB30_71
// %bb.1:
	ldr	x9, [x20, #80]
	tbnz	w9, #8, .LBB30_72
.LBB30_2:
	mov	x8, #-515
	mov	w9, #26134
	movk	w9, #49232, lsl #16
	cmp	w1, w9
	b.gt	.LBB30_9
// %bb.3:
	mov	w9, #26130
	movk	w9, #32780, lsl #16
	cmp	w1, w9
	b.gt	.LBB30_14
// %bb.4:
	mov	w9, #62731
	movk	w9, #32772, lsl #16
	cmp	w1, w9
	b.le	.LBB30_24
// %bb.5:
	mov	w9, #2799
	movk	w9, #32759, lsl #16
	add	w9, w1, w9
	cmp	w9, #45                 // =45
	b.hi	.LBB30_7
// %bb.6:
	mov	x11, #7
	mov	w10, #1
	movk	x11, #10240, lsl #32
	lsl	x9, x10, x9
	tst	x9, x11
	b.ne	.LBB30_58
.LBB30_7:
	mov	w9, #62732
	movk	w9, #32772, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.8:
	mov	w9, #62734
	movk	w9, #32772, lsl #16
	b	.LBB30_57
.LBB30_9:
	mov	w9, #62741
	movk	w9, #16386, lsl #16
	cmp	w1, w9
	b.gt	.LBB30_19
// %bb.10:
	mov	w9, #-62721
	add	w9, w1, w9
	cmp	w9, #63                 // =63
	b.hi	.LBB30_12
// %bb.11:
	mov	x11, #16479
	mov	w10, #1
	movk	x11, #192, lsl #16
	lsl	x9, x10, x9
	movk	x11, #32768, lsl #48
	tst	x9, x11
	b.ne	.LBB30_58
.LBB30_12:
	mov	w9, #26135
	movk	w9, #49232, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.13:
	mov	w9, #26138
	movk	w9, #49280, lsl #16
	b	.LBB30_57
.LBB30_14:
	mov	w9, #26133
	movk	w9, #49161, lsl #16
	cmp	w1, w9
	b.gt	.LBB30_28
// %bb.15:
	mov	w9, #37936
	movk	w9, #33024, lsl #16
	cmp	w1, w9
	b.gt	.LBB30_36
// %bb.16:
	mov	w9, #26131
	movk	w9, #32780, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.17:
	mov	w9, #26139
	movk	w9, #32784, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.18:
	mov	w9, #22559
	movk	w9, #32796, lsl #16
	b	.LBB30_57
.LBB30_19:
	mov	w9, #26131
	movk	w9, #16400, lsl #16
	cmp	w1, w9
	b.gt	.LBB30_32
// %bb.20:
	mov	w9, #62732
	movk	w9, #16388, lsl #16
	cmp	w1, w9
	b.gt	.LBB30_39
// %bb.21:
	mov	w9, #62742
	movk	w9, #16386, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.22:
	mov	w9, #26114
	movk	w9, #16388, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_61
// %bb.23:
	mov	w9, #62726
	movk	w9, #16388, lsl #16
	b	.LBB30_57
.LBB30_24:
	mov	w9, #22652
	movk	w9, #32772, lsl #16
	cmp	w1, w9
	b.gt	.LBB30_42
// %bb.25:
	mov	w9, #62781
	movk	w9, #32769, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.26:
	mov	w9, #62783
	movk	w9, #32769, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.27:
	mov	w9, #62741
	movk	w9, #32770, lsl #16
	b	.LBB30_57
.LBB30_28:
	mov	w9, #62728
	movk	w9, #49184, lsl #16
	cmp	w1, w9
	b.gt	.LBB30_46
// %bb.29:
	mov	w9, #26134
	movk	w9, #49161, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.30:
	mov	w9, #62728
	movk	w9, #49168, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.31:
	mov	w9, #22649
	movk	w9, #49176, lsl #16
	b	.LBB30_57
.LBB30_32:
	mov	w9, #22559
	movk	w9, #16412, lsl #16
	cmp	w1, w9
	b.gt	.LBB30_54
// %bb.33:
	mov	w9, #26132
	movk	w9, #16400, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.34:
	mov	w9, #62731
	movk	w9, #16408, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_62
// %bb.35:
	mov	w9, #62740
	movk	w9, #16408, lsl #16
	b	.LBB30_57
.LBB30_36:
	mov	w9, #37937
	movk	w9, #33024, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.37:
	mov	w9, #26246
	movk	w9, #49156, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.38:
	mov	w9, #62736
	movk	w9, #49160, lsl #16
	b	.LBB30_57
.LBB30_39:
	mov	w9, #62733
	movk	w9, #16388, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.40:
	mov	w9, #62730
	movk	w9, #16392, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.41:
	mov	w9, #26133
	movk	w9, #16396, lsl #16
	b	.LBB30_57
.LBB30_42:
	mov	w9, #22653
	movk	w9, #32772, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.43:
	mov	w9, #26113
	movk	w9, #32772, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_68
// %bb.44:
	mov	w9, #30209
	movk	w9, #32772, lsl #16
	cmp	w1, w9
	b.ne	.LBB30_59
// %bb.45:
	mov	w8, #26113
	movk	w8, #32776, lsl #16
	orr	w1, w8, #0x1000
	b	.LBB30_58
.LBB30_46:
	mov	w9, #39400
	movk	w9, #16319, lsl #16
	add	w9, w1, w9
	cmp	w9, #2                  // =2
	b.lo	.LBB30_58
// %bb.47:
	mov	w9, #62729
	movk	w9, #49184, lsl #16
	cmp	w1, w9
	b.ne	.LBB30_59
// %bb.48:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldrb	w11, [x8, #110]
	ldr	x10, [x8, #64]
	and	x9, x2, #0xffffffff
	tbnz	w11, #5, .LBB30_50
// %bb.49:
	ldr	xzr, [x8]
.LBB30_50:
	mov	x11, x9
	//APP
		adds	x11, x11, 4
	csel	x10, xzr, x10, hi
	csinv	x11, x11, xzr, cc
	sbcs	xzr, x11, x10
	cset	x11, ls

	//NO_APP
	cbz	x11, .LBB30_69
// %bb.51:
	adrp	x11, arm64_const_caps_ready
	ldr	x10, [x8, #64]
	//APP
		bics	xzr, x9, x10
	csel	x12, x9, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w10, [x11, :lo12:arm64_const_caps_ready]
	cmp	w10, #1                 // =1
	b.lt	.LBB30_90
// %bb.52:
	adrp	x10, cpu_hwcap_keys
	add	x10, x10, :lo12:cpu_hwcap_keys
	ldr	w10, [x10, #16]
	cmp	w10, #0                 // =0
	b.le	.LBB30_91
.LBB30_53:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_92
.LBB30_54:
	mov	w9, #22560
	movk	w9, #16412, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.55:
	mov	w9, #26245
	movk	w9, #16512, lsl #16
	cmp	w1, w9
	b.eq	.LBB30_58
// %bb.56:
	mov	w9, #37938
	movk	w9, #16640, lsl #16
.LBB30_57:
	cmp	w1, w9
	b.ne	.LBB30_59
.LBB30_58:
	and	x2, x2, #0xffffffff
	bl	__f2fs_ioctl
	mov	x8, x0
.LBB30_59:
	adrp	x10, __stack_chk_guard
	ldur	x9, [x29, #-8]
	ldr	x10, [x10, :lo12:__stack_chk_guard]
	cmp	x10, x9
	b.ne	.LBB30_187
// %bb.60:
	ldp	x20, x19, [sp, #144]    // 16-byte Folded Reload
	mov	x0, x8
	ldp	x22, x21, [sp, #128]    // 16-byte Folded Reload
	ldr	x23, [sp, #112]         // 8-byte Folded Reload
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB30_61:
	mov	w1, #26114
	movk	w1, #16392, lsl #16
	b	.LBB30_58
.LBB30_62:
	//APP
	mrs x10, sp_el0
	//NO_APP
	ldrb	w9, [x10, #110]
	ldr	x8, [x10, #64]
	and	x11, x2, #0xffffffff
	tbnz	w9, #5, .LBB30_64
// %bb.63:
	ldr	xzr, [x10]
.LBB30_64:
	mov	x12, x11
	adrp	x9, arm64_const_caps_ready
	//APP
		adds	x12, x12, 4
	csel	x8, xzr, x8, hi
	csinv	x12, x12, xzr, cc
	sbcs	xzr, x12, x8
	cset	x12, ls

	//NO_APP
	adrp	x8, cpu_hwcap_keys
	add	x8, x8, :lo12:cpu_hwcap_keys
	cbz	x12, .LBB30_70
// %bb.65:
	ldr	x12, [x10, #64]
	//APP
		bics	xzr, x11, x12
	csel	x13, x11, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w12, [x9, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB30_95
// %bb.66:
	ldr	w12, [x8, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB30_96
.LBB30_67:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_97
.LBB30_68:
	mov	w1, #26113
	movk	w1, #32776, lsl #16
	b	.LBB30_58
.LBB30_69:
	mov	w10, #-14
	stur	wzr, [x29, #-40]
	b	.LBB30_103
.LBB30_70:
	mov	w12, #-14
	stur	wzr, [x29, #-40]
	b	.LBB30_113
.LBB30_71:
	mov	x8, #-5
	b	.LBB30_59
.LBB30_72:
	ldr	w9, [x20, #1192]
	ldr	w22, [x20, #1188]
	ldrsw	x11, [x20, #1284]
	ldr	w13, [x20, #1184]
	ldrsw	x21, [x20, #1272]
	ldrsw	x12, [x20, #1296]
	ldr	x15, [x20, #80]
	tbnz	w15, #3, .LBB30_2
// %bb.73:
	ldr	x18, [x20, #136]
	ldr	x15, [x18, #8]
	ldr	w16, [x18, #100]
	ldr	w15, [x15, #8]
	cmn	w16, #1                 // =1
	b.eq	.LBB30_75
// %bb.74:
	udiv	w17, w16, w9
	b	.LBB30_76
.LBB30_75:
	mov	w17, #-1
.LBB30_76:
	cmp	w15, w17
	b.ne	.LBB30_81
// %bb.77:
	ldr	w3, [x20, #1284]
	mov	w6, #48
	ldr	w4, [x20, #1272]
	ldr	w19, [x20, #1272]
	ldr	x17, [x18, #24]
	ldr	x18, [x18]
	add	w3, w4, w3
	ldr	w5, [x17, #460]
	ldr	x18, [x18, #136]
	madd	x5, x5, x6, x18
	ldrh	w5, [x5, #2]
	and	w5, w5, #0x3ff
	sub	w4, w22, w5
	cmp	w4, w3
	b.lo	.LBB30_81
// %bb.78:
	ldr	w4, [x17, #580]
	mov	w5, #48
	madd	x4, x4, x5, x18
	ldrh	w4, [x4, #2]
	and	w4, w4, #0x3ff
	sub	w4, w22, w4
	cmp	w4, w3
	b.lo	.LBB30_81
// %bb.79:
	ldr	w4, [x17, #700]
	mov	w5, #48
	madd	x4, x4, x5, x18
	ldrh	w4, [x4, #2]
	and	w4, w4, #0x3ff
	sub	w4, w22, w4
	cmp	w4, w3
	b.lo	.LBB30_81
// %bb.80:
	ldr	w3, [x17, #100]
	mov	w4, #48
	madd	x18, x3, x4, x18
	ldrh	w18, [x18, #2]
	and	w18, w18, #0x3ff
	sub	w18, w22, w18
	cmp	w18, w19
	b.hs	.LBB30_86
.LBB30_81:
	mul	w14, w22, w9
	cmn	w16, #1                 // =1
	sub	x14, x14, #1            // =1
	add	x11, x14, x11
	add	x10, x14, x21
	add	x12, x14, x12
	asr	x11, x11, x13
	asr	x14, x10, x13
	udiv	w10, w11, w9
	asr	x11, x12, x13
	udiv	w12, w14, w9
	udiv	w9, w11, w9
	lsl	w11, w12, #1
	b.eq	.LBB30_83
// %bb.82:
	ldr	w8, [x20, #1192]
	udiv	w8, w16, w8
	b	.LBB30_84
.LBB30_83:
	mov	w8, #-1
.LBB30_84:
	add	w10, w11, w10
	add	w9, w10, w9
	add	w8, w9, w8
	cmp	w15, w8
	b.hi	.LBB30_2
// %bb.85:
	mov	x8, #-28
	b	.LBB30_59
.LBB30_86:
	ldr	w15, [x20, #3024]
	cmp	w15, #2                 // =2
	b.ne	.LBB30_2
// %bb.87:
	ldr	x15, [x20, #16]
	ldrb	w15, [x15, #2182]
	tbz	w15, #0, .LBB30_2
// %bb.88:
	ldr	w23, [x17, #820]
	str	x0, [sp, #32]           // 8-byte Folded Spill
	mov	x0, x20
	str	w1, [sp, #28]           // 4-byte Folded Spill
	str	x2, [sp, #16]           // 8-byte Folded Spill
	mov	w1, w23
	stur	w9, [x29, #-44]         // 4-byte Folded Spill
	str	x13, [sp, #40]          // 8-byte Folded Spill
	stp	x12, x11, [sp]          // 16-byte Folded Spill
	bl	f2fs_usable_blks_in_seg
	ldr	x16, [x20, #136]
	mov	w15, #48
	mov	w9, w0
	ldr	w1, [sp, #28]           // 4-byte Folded Reload
	ldp	x12, x11, [sp]          // 16-byte Folded Reload
	ldr	x2, [sp, #16]           // 8-byte Folded Reload
	ldr	x13, [x16]
	ldr	x13, [x13, #136]
	madd	x13, x23, x15, x13
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w15, w9, w13
	ldur	w9, [x29, #-44]         // 4-byte Folded Reload
	ldp	x0, x13, [sp, #32]      // 16-byte Folded Reload
	cmp	w15, w19
	b.hs	.LBB30_2
// %bb.89:
	ldr	x15, [x16, #8]
	ldr	w16, [x16, #100]
	ldr	w15, [x15, #8]
	b	.LBB30_81
.LBB30_90:
	adrp	x10, cpu_hwcaps
	ldr	x10, [x10, :lo12:cpu_hwcaps]
	tbnz	w10, #4, .LBB30_53
.LBB30_91:
	//APP
	mrs	x10, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x13, [x8, #72]
	//APP
	mrs x14, ttbr1_el1
	//NO_APP
	mov	x15, x13
	bfxil	x15, x14, #0, #48
	//APP
	msr ttbr1_el1, x15
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x13
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x10		// arch_local_irq_restore
	//NO_APP
.LBB30_92:
	mov	w10, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     w13, [x12]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr w13, [x12]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w10, -14
	mov	x13, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w11, [x11, :lo12:arm64_const_caps_ready]
	cmp	w11, #1                 // =1
	b.lt	.LBB30_100
// %bb.93:
	adrp	x11, cpu_hwcap_keys
	add	x11, x11, :lo12:cpu_hwcap_keys
	ldr	w11, [x11, #16]
	cmp	w11, #0                 // =0
	b.le	.LBB30_101
.LBB30_94:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_102
.LBB30_95:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB30_67
.LBB30_96:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x14, [x10, #72]
	//APP
	mrs x15, ttbr1_el1
	//NO_APP
	mov	x16, x14
	bfxil	x16, x15, #0, #48
	//APP
	msr ttbr1_el1, x16
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB30_97:
	mov	w12, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     w14, [x13]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr w14, [x13]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w12, -14
	mov	x14, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w13, [x9, :lo12:arm64_const_caps_ready]
	cmp	w13, #1                 // =1
	b.lt	.LBB30_110
// %bb.98:
	ldr	w13, [x8, #16]
	cmp	w13, #0                 // =0
	b.le	.LBB30_111
.LBB30_99:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_112
.LBB30_100:
	adrp	x11, cpu_hwcaps
	ldr	x11, [x11, :lo12:cpu_hwcaps]
	tbnz	w11, #4, .LBB30_94
.LBB30_101:
	//APP
	mrs	x11, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x12, ttbr1_el1
	//NO_APP
	and	x12, x12, #0xffffffffffff
	sub	x14, x12, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x12
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x11		// arch_local_irq_restore
	//NO_APP
.LBB30_102:
	stur	w13, [x29, #-40]
.LBB30_103:
	ldrb	w13, [x8, #110]
	add	x11, x9, #8             // =8
	ldr	x12, [x8, #64]
	tbnz	w13, #5, .LBB30_105
// %bb.104:
	ldr	x13, [x8]
.LBB30_105:
	mov	x13, x11
	//APP
		adds	x13, x13, 8
	csel	x12, xzr, x12, hi
	csinv	x13, x13, xzr, cc
	sbcs	xzr, x13, x12
	cset	x13, ls

	//NO_APP
	cbz	x13, .LBB30_109
// %bb.106:
	adrp	x12, arm64_const_caps_ready
	ldr	x14, [x8, #64]
	//APP
		bics	xzr, x11, x14
	csel	x13, x11, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w11, [x12, :lo12:arm64_const_caps_ready]
	cmp	w11, #1                 // =1
	b.lt	.LBB30_120
// %bb.107:
	adrp	x11, cpu_hwcap_keys
	add	x11, x11, :lo12:cpu_hwcap_keys
	ldr	w11, [x11, #16]
	cmp	w11, #0                 // =0
	b.le	.LBB30_121
.LBB30_108:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_122
.LBB30_109:
	mov	w11, #-14
	stur	xzr, [x29, #-32]
	b	.LBB30_133
.LBB30_110:
	adrp	x13, cpu_hwcaps
	ldr	x13, [x13, :lo12:cpu_hwcaps]
	tbnz	w13, #4, .LBB30_99
.LBB30_111:
	//APP
	mrs	x13, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x15, ttbr1_el1
	//NO_APP
	and	x15, x15, #0xffffffffffff
	sub	x16, x15, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x16
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x15
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x13		// arch_local_irq_restore
	//NO_APP
.LBB30_112:
	stur	w14, [x29, #-40]
.LBB30_113:
	ldrb	w15, [x10, #110]
	add	x13, x11, #8            // =8
	ldr	x14, [x10, #64]
	tbnz	w15, #5, .LBB30_115
// %bb.114:
	ldr	x15, [x10]
.LBB30_115:
	mov	x15, x13
	//APP
		adds	x15, x15, 8
	csel	x14, xzr, x14, hi
	csinv	x15, x15, xzr, cc
	sbcs	xzr, x15, x14
	cset	x15, ls

	//NO_APP
	cbz	x15, .LBB30_119
// %bb.116:
	ldr	x15, [x10, #64]
	//APP
		bics	xzr, x13, x15
	csel	x14, x13, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w13, [x9, :lo12:arm64_const_caps_ready]
	cmp	w13, #1                 // =1
	b.lt	.LBB30_125
// %bb.117:
	ldr	w13, [x8, #16]
	cmp	w13, #0                 // =0
	b.le	.LBB30_126
.LBB30_118:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_127
.LBB30_119:
	mov	w13, #-14
	stur	xzr, [x29, #-32]
	b	.LBB30_143
.LBB30_120:
	adrp	x11, cpu_hwcaps
	ldr	x11, [x11, :lo12:cpu_hwcaps]
	tbnz	w11, #4, .LBB30_108
.LBB30_121:
	//APP
	mrs	x11, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x14, [x8, #72]
	//APP
	mrs x15, ttbr1_el1
	//NO_APP
	mov	x16, x14
	bfxil	x16, x15, #0, #48
	//APP
	msr ttbr1_el1, x16
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x11		// arch_local_irq_restore
	//NO_APP
.LBB30_122:
	mov	w11, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     x14, [x13]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr x14, [x13]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w11, -14
	mov	x14, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w12, [x12, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB30_130
// %bb.123:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB30_131
.LBB30_124:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_132
.LBB30_125:
	adrp	x13, cpu_hwcaps
	ldr	x13, [x13, :lo12:cpu_hwcaps]
	tbnz	w13, #4, .LBB30_118
.LBB30_126:
	//APP
	mrs	x13, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x15, [x10, #72]
	//APP
	mrs x16, ttbr1_el1
	//NO_APP
	mov	x17, x15
	bfxil	x17, x16, #0, #48
	//APP
	msr ttbr1_el1, x17
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x15
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x13		// arch_local_irq_restore
	//NO_APP
.LBB30_127:
	mov	w13, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     x15, [x14]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr x15, [x14]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w13, -14
	mov	x15, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w14, [x9, :lo12:arm64_const_caps_ready]
	cmp	w14, #1                 // =1
	b.lt	.LBB30_140
// %bb.128:
	ldr	w14, [x8, #16]
	cmp	w14, #0                 // =0
	b.le	.LBB30_141
.LBB30_129:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_142
.LBB30_130:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB30_124
.LBB30_131:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	and	x13, x13, #0xffffffffffff
	sub	x15, x13, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x15
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x13
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB30_132:
	stur	x14, [x29, #-32]
.LBB30_133:
	ldrb	w14, [x8, #110]
	add	x12, x9, #16            // =16
	ldr	x13, [x8, #64]
	tbnz	w14, #5, .LBB30_135
// %bb.134:
	ldr	x14, [x8]
.LBB30_135:
	mov	x14, x12
	//APP
		adds	x14, x14, 8
	csel	x13, xzr, x13, hi
	csinv	x14, x14, xzr, cc
	sbcs	xzr, x14, x13
	cset	x14, ls

	//NO_APP
	cbz	x14, .LBB30_139
// %bb.136:
	adrp	x13, arm64_const_caps_ready
	ldr	x15, [x8, #64]
	//APP
		bics	xzr, x12, x15
	csel	x14, x12, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w12, [x13, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB30_150
// %bb.137:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB30_151
.LBB30_138:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_152
.LBB30_139:
	mov	w12, #-14
	stur	xzr, [x29, #-24]
	b	.LBB30_163
.LBB30_140:
	adrp	x14, cpu_hwcaps
	ldr	x14, [x14, :lo12:cpu_hwcaps]
	tbnz	w14, #4, .LBB30_129
.LBB30_141:
	//APP
	mrs	x14, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x16, ttbr1_el1
	//NO_APP
	and	x16, x16, #0xffffffffffff
	sub	x17, x16, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x17
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x16
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x14		// arch_local_irq_restore
	//NO_APP
.LBB30_142:
	stur	x15, [x29, #-32]
.LBB30_143:
	ldrb	w16, [x10, #110]
	add	x14, x11, #16           // =16
	ldr	x15, [x10, #64]
	tbnz	w16, #5, .LBB30_145
// %bb.144:
	ldr	x11, [x10]
.LBB30_145:
	orr	w11, w13, w12
	mov	x16, x14
	//APP
		adds	x16, x16, 8
	csel	x15, xzr, x15, hi
	csinv	x16, x16, xzr, cc
	sbcs	xzr, x16, x15
	cset	x16, ls

	//NO_APP
	cbz	x16, .LBB30_149
// %bb.146:
	ldr	x13, [x10, #64]
	//APP
		bics	xzr, x14, x13
	csel	x12, x14, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w13, [x9, :lo12:arm64_const_caps_ready]
	cmp	w13, #1                 // =1
	b.lt	.LBB30_155
// %bb.147:
	ldr	w13, [x8, #16]
	cmp	w13, #0                 // =0
	b.le	.LBB30_156
.LBB30_148:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_157
.LBB30_149:
	mov	w10, #-14
	stur	xzr, [x29, #-24]
	b	.LBB30_173
.LBB30_150:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB30_138
.LBB30_151:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x15, [x8, #72]
	//APP
	mrs x16, ttbr1_el1
	//NO_APP
	mov	x17, x15
	bfxil	x17, x16, #0, #48
	//APP
	msr ttbr1_el1, x17
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x15
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB30_152:
	mov	w12, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     x15, [x14]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr x15, [x14]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w12, -14
	mov	x15, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w13, [x13, :lo12:arm64_const_caps_ready]
	cmp	w13, #1                 // =1
	b.lt	.LBB30_160
// %bb.153:
	adrp	x13, cpu_hwcap_keys
	add	x13, x13, :lo12:cpu_hwcap_keys
	ldr	w13, [x13, #16]
	cmp	w13, #0                 // =0
	b.le	.LBB30_161
.LBB30_154:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_162
.LBB30_155:
	adrp	x13, cpu_hwcaps
	ldr	x13, [x13, :lo12:cpu_hwcaps]
	tbnz	w13, #4, .LBB30_148
.LBB30_156:
	//APP
	mrs	x13, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x10, [x10, #72]
	//APP
	mrs x14, ttbr1_el1
	//NO_APP
	mov	x15, x10
	bfxil	x15, x14, #0, #48
	//APP
	msr ttbr1_el1, x15
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x10
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x13		// arch_local_irq_restore
	//NO_APP
.LBB30_157:
	mov	w10, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     x13, [x12]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr x13, [x12]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w10, -14
	mov	x13, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w9, [x9, :lo12:arm64_const_caps_ready]
	cmp	w9, #1                  // =1
	b.lt	.LBB30_170
// %bb.158:
	ldr	w8, [x8, #16]
	cmp	w8, #0                  // =0
	b.le	.LBB30_171
.LBB30_159:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_172
.LBB30_160:
	adrp	x13, cpu_hwcaps
	ldr	x13, [x13, :lo12:cpu_hwcaps]
	tbnz	w13, #4, .LBB30_154
.LBB30_161:
	//APP
	mrs	x13, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x14, ttbr1_el1
	//NO_APP
	and	x14, x14, #0xffffffffffff
	sub	x16, x14, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x16
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x13		// arch_local_irq_restore
	//NO_APP
.LBB30_162:
	stur	x15, [x29, #-24]
.LBB30_163:
	ldrb	w15, [x8, #110]
	orr	w10, w11, w10
	ldr	x14, [x8, #64]
	add	x13, x9, #24            // =24
	tbnz	w15, #5, .LBB30_165
// %bb.164:
	ldr	x9, [x8]
.LBB30_165:
	orr	w9, w10, w12
	mov	x11, x13
	//APP
		adds	x11, x11, 8
	csel	x14, xzr, x14, hi
	csinv	x11, x11, xzr, cc
	sbcs	xzr, x11, x14
	cset	x11, ls

	//NO_APP
	cbz	x11, .LBB30_169
// %bb.166:
	adrp	x10, arm64_const_caps_ready
	ldr	x12, [x8, #64]
	//APP
		bics	xzr, x13, x12
	csel	x11, x13, xzr, eq

	//NO_APP
	//APP
	hint #20
	//NO_APP
	ldr	w12, [x10, :lo12:arm64_const_caps_ready]
	cmp	w12, #1                 // =1
	b.lt	.LBB30_175
// %bb.167:
	adrp	x12, cpu_hwcap_keys
	add	x12, x12, :lo12:cpu_hwcap_keys
	ldr	w12, [x12, #16]
	cmp	w12, #0                 // =0
	b.le	.LBB30_176
.LBB30_168:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!0) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_177
.LBB30_169:
	mov	w8, #-14
	stur	xzr, [x29, #-16]
	b	.LBB30_183
.LBB30_170:
	adrp	x8, cpu_hwcaps
	ldr	x8, [x8, :lo12:cpu_hwcaps]
	tbnz	w8, #4, .LBB30_159
.LBB30_171:
	//APP
	mrs	x8, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x9, ttbr1_el1
	//NO_APP
	and	x9, x9, #0xffffffffffff
	sub	x12, x9, #1, lsl #12    // =4096
	//APP
	msr ttbr0_el1, x12
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x9
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x8		// arch_local_irq_restore
	//NO_APP
.LBB30_172:
	stur	x13, [x29, #-24]
.LBB30_173:
	orr	w8, w11, w10
	cbnz	w8, .LBB30_184
// %bb.174:
	sub	x1, x29, #40            // =40
	bl	__f2fs_ioc_gc_range
	b	.LBB30_186
.LBB30_175:
	adrp	x12, cpu_hwcaps
	ldr	x12, [x12, :lo12:cpu_hwcaps]
	tbnz	w12, #4, .LBB30_168
.LBB30_176:
	//APP
	mrs	x12, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	ldr	x8, [x8, #72]
	//APP
	mrs x13, ttbr1_el1
	//NO_APP
	mov	x14, x8
	bfxil	x14, x13, #0, #48
	//APP
	msr ttbr1_el1, x14
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr0_el1, x8
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x12		// arch_local_irq_restore
	//NO_APP
.LBB30_177:
	mov	w8, wzr
	//APP
	1:.if 1 == 1
661:
	ldr     x12, [x11]

662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 9
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	ldtr x12, [x11]

664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif
2:
	.section .fixup, "ax"
	.align	2
3:	mov	w8, -14
	mov	x12, #0
	b	2b
	.previous
	.pushsection	__ex_table, "a"
	.align		3
	.long		(1b - .), (3b - .)
	.popsection

	//NO_APP
	ldr	w10, [x10, :lo12:arm64_const_caps_ready]
	cmp	w10, #1                 // =1
	b.lt	.LBB30_180
// %bb.178:
	adrp	x10, cpu_hwcap_keys
	add	x10, x10, :lo12:cpu_hwcap_keys
	ldr	w10, [x10, #16]
	cmp	w10, #0                 // =0
	b.le	.LBB30_181
.LBB30_179:
	//APP
	.if 1 == 1
661:
	nop
662:
.pushsection .altinstructions,"a"
 .word 661b - .
 .word 663f - .
 .hword 10
 .byte 662b-661b
 .byte 664f-663f
.popsection
.pushsection .altinstr_replacement, "a"
663:
	.inst (0xd500401f | ((0) << 16 | (4) << 5) | ((!!1) << 8))
	
664:
	.popsection
	.org	. - (664b-663b) + (662b-661b)
	.org	. - (662b-661b) + (664b-663b)
.endif

	//NO_APP
	b	.LBB30_182
.LBB30_180:
	adrp	x10, cpu_hwcaps
	ldr	x10, [x10, :lo12:cpu_hwcaps]
	tbnz	w10, #4, .LBB30_179
.LBB30_181:
	//APP
	mrs	x10, daif		// arch_local_irq_save
msr	daifset, #2
	//NO_APP
	//APP
	mrs x11, ttbr1_el1
	//NO_APP
	and	x11, x11, #0xffffffffffff
	sub	x13, x11, #1, lsl #12   // =4096
	//APP
	msr ttbr0_el1, x13
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr ttbr1_el1, x11
	//NO_APP
	//APP
	isb
	//NO_APP
	//APP
	msr	daif, x10		// arch_local_irq_restore
	//NO_APP
.LBB30_182:
	stur	x12, [x29, #-16]
.LBB30_183:
	orr	w8, w9, w8
	cbz	w8, .LBB30_185
.LBB30_184:
	mov	x8, #-14
	b	.LBB30_59
.LBB30_185:
	sub	x1, x29, #40            // =40
	bl	__f2fs_ioc_move_range
.LBB30_186:
                                        // kill: def $w0 killed $w0 def $x0
	sxtw	x8, w0
	b	.LBB30_59
.LBB30_187:
	bl	__stack_chk_fail
.Lfunc_end30:
	.size	f2fs_compat_ioctl, .Lfunc_end30-f2fs_compat_ioctl
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_llseek
	.type	f2fs_llseek,@function
f2fs_llseek:                            // @f2fs_llseek
// %bb.0:
	sub	sp, sp, #192            // =192
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	stp	x28, x27, [sp, #112]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #128]    // 16-byte Folded Spill
	mov	x25, x1
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #144]    // 16-byte Folded Spill
	mov	w24, w2
	stp	x22, x21, [sp, #160]    // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #176]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #240]
	ldr	x19, [x8]
	ldr	x8, [x19, #40]
	ldrh	w9, [x19]
	ldr	x3, [x8, #32]
	and	w8, w9, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB31_2
// %bb.1:
	ldr	x8, [x19, #712]
	tbnz	w8, #31, .LBB31_4
.LBB31_2:
	subs	w8, w24, #3             // =3
	b.hs	.LBB31_5
.LBB31_3:
	ldr	x4, [x19, #80]
	mov	x0, x21
	mov	x1, x25
	mov	w2, w24
	bl	generic_file_llseek_size
	b	.LBB31_210
.LBB31_4:
	mov	x0, x19
	bl	max_file_blocks
	lsl	x3, x0, #12
	subs	w8, w24, #3             // =3
	b.lo	.LBB31_3
.LBB31_5:
	cmp	w8, #2                  // =2
	b.hs	.LBB31_16
// %bb.6:
	tbnz	x25, #63, .LBB31_209
// %bb.7:
	ldr	x8, [x21, #240]
	ldr	x19, [x8]
	ldr	x8, [x19, #40]
	add	x20, x19, #160          // =160
	mov	x0, x20
	ldr	x26, [x8, #32]
	bl	down_write
	ldr	x23, [x19, #80]
	cmp	x23, x25
	b.le	.LBB31_208
// %bb.8:
	ldr	x8, [x19, #712]
	tbz	w8, #10, .LBB31_11
// %bb.9:
	cmp	w24, #3                 // =3
	b.eq	.LBB31_140
// %bb.10:
	cmp	w24, #4                 // =4
	b.eq	.LBB31_165
.LBB31_11:
	ldr	x0, [x19, #48]
	cmp	w24, #3                 // =3
	str	x26, [sp, #8]           // 8-byte Folded Spill
	lsr	x26, x25, #12
	str	x26, [sp, #32]
	b.ne	.LBB31_17
// %bb.12:
	mov	x27, #-1
	add	x1, sp, #32             // =32
	sub	x5, x29, #16            // =16
	mov	x2, x27
	mov	w3, wzr
	mov	w4, #1
	bl	find_get_pages_range_tag
	cbz	w0, .LBB31_18
// %bb.13:
	ldur	x8, [x29, #-16]
	ldr	x9, [x8, #32]
	str	x9, [sp, #32]
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
	cbnz	w9, .LBB31_15
// %bb.14:
	bl	__put_page
.LBB31_15:
	ldr	x27, [sp, #32]
	b	.LBB31_18
.LBB31_16:
	mov	x0, #-22
	b	.LBB31_210
.LBB31_17:
	mov	x27, xzr
.LBB31_18:
	add	x28, x19, #720          // =720
	mov	x0, x28
	bl	down_read
	ldr	x8, [x19, #712]
	str	x20, [sp, #24]          // 8-byte Folded Spill
	tbnz	x8, #43, .LBB31_20
.LBB31_19:
	mov	x20, xzr
	b	.LBB31_23
.LBB31_20:
	ldr	x8, [x19, #712]
	tbz	x8, #43, .LBB31_22
// %bb.21:
	ldr	x8, [x19, #712]
	tbnz	x8, #44, .LBB31_19
.LBB31_22:
	ldr	x0, [x19, #1280]
	bl	igrab
	mov	x20, x0
.LBB31_23:
	mov	x0, x28
	bl	up_read
	cmp	x20, #0                 // =0
	add	x8, sp, #32             // =32
	str	x20, [sp, #16]          // 8-byte Folded Spill
	csel	x20, x20, x19, ne
	add	x22, x8, #8             // =8
	b	.LBB31_26
.LBB31_24:                              //   in Loop: Header=BB31_26 Depth=1
	stp	xzr, xzr, [x22]
.LBB31_25:                              //   in Loop: Header=BB31_26 Depth=1
	lsl	x25, x26, #12
	cmp	x25, x23
	b.ge	.LBB31_166
.LBB31_26:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB31_69 Depth 2
                                        //       Child Loop BB31_84 Depth 3
                                        //     Child Loop BB31_39 Depth 2
                                        //       Child Loop BB31_55 Depth 3
                                        //       Child Loop BB31_64 Depth 3
	add	x0, sp, #32             // =32
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	add	x0, sp, #32             // =32
	mov	x1, x26
	mov	w2, #1
	str	x20, [sp, #32]
	stp	xzr, xzr, [x22]
	str	wzr, [x22, #16]
	bl	f2fs_get_dnode_of_data
	cbz	w0, .LBB31_30
// %bb.27:                              //   in Loop: Header=BB31_26 Depth=1
	cmn	w0, #2                  // =2
	b.ne	.LBB31_198
// %bb.28:                              //   in Loop: Header=BB31_26 Depth=1
	cmp	w24, #3                 // =3
	b.ne	.LBB31_154
// %bb.29:                              //   in Loop: Header=BB31_26 Depth=1
	add	x0, sp, #32             // =32
	mov	x1, x26
	bl	f2fs_get_next_page_offset
	mov	x26, x0
	b	.LBB31_25
.LBB31_30:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	x9, [sp, #48]
	lsl	x8, x9, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w10, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w10, w8
	b.ne	.LBB31_34
// %bb.31:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	w8, [x20, #1160]
	ldr	w10, [x20, #1168]
	ldrh	w11, [x20]
	add	w8, w10, w8, asr #2
	mov	w10, #923
	sub	w19, w10, w8
	and	w8, w11, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB31_37
// %bb.32:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [x20, #712]
	tbz	w8, #31, .LBB31_37
// %bb.33:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	w8, [x20, #1268]
	neg	w8, w8
	and	w19, w19, w8
	b	.LBB31_37
.LBB31_34:                              //   in Loop: Header=BB31_26 Depth=1
	ldrh	w8, [x20]
	mov	w19, #1018
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB31_37
// %bb.35:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [x20, #712]
	mov	w19, #1018
	tbz	w8, #31, .LBB31_37
// %bb.36:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	w8, [x20, #1268]
	mov	w10, #1018
	neg	w8, w8
	and	w19, w8, w10
.LBB31_37:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	w8, [sp, #60]
	cmp	w8, w19
	b.hs	.LBB31_90
// %bb.38:                              //   in Loop: Header=BB31_26 Depth=1
	cmp	w24, #3                 // =3
	b.ne	.LBB31_69
.LBB31_39:                              //   Parent Loop BB31_26 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB31_55 Depth 3
                                        //       Child Loop BB31_64 Depth 3
	lsl	x9, x9, #6
	orr	x9, x9, #0xffffffc000000000
	ldr	w10, [x9, #4072]
	ldr	w11, [x9, #4076]
	cmp	w10, w11
	b.ne	.LBB31_44
// %bb.40:                              //   in Loop: Header=BB31_39 Depth=2
	ldr	x12, [sp, #32]
	cbz	x12, .LBB31_43
// %bb.41:                              //   in Loop: Header=BB31_39 Depth=2
	ldr	x13, [x12, #712]
	tbz	w13, #26, .LBB31_44
// %bb.42:                              //   in Loop: Header=BB31_39 Depth=2
	ldr	w12, [x12, #1160]
	asr	w12, w12, #2
	b	.LBB31_45
.LBB31_43:                              //   in Loop: Header=BB31_39 Depth=2
	ldrb	w12, [x9, #3]
	tbnz	w12, #5, .LBB31_68
.LBB31_44:                              //   in Loop: Header=BB31_39 Depth=2
	mov	w12, wzr
.LBB31_45:                              //   in Loop: Header=BB31_39 Depth=2
	add	x13, x9, #360           // =360
	cmp	w10, w11
	csel	x9, x13, x9, eq
	add	w8, w12, w8
	ldr	w28, [x9, w8, uxtw #2]
	add	w8, w28, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB31_51
.LBB31_46:                              //   in Loop: Header=BB31_39 Depth=2
	cmp	x27, x26
	b.ne	.LBB31_48
// %bb.47:                              //   in Loop: Header=BB31_39 Depth=2
	cmn	w28, #1                 // =1
	b.eq	.LBB31_122
.LBB31_48:                              //   in Loop: Header=BB31_39 Depth=2
	add	w8, w28, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB31_60
.LBB31_49:                              //   in Loop: Header=BB31_39 Depth=2
	ldr	w8, [sp, #60]
	add	x26, x26, #1            // =1
	add	w8, w8, #1              // =1
	cmp	w8, w19
	str	w8, [sp, #60]
	b.hs	.LBB31_90
// %bb.50:                              //   in Loop: Header=BB31_39 Depth=2
	ldr	x9, [sp, #48]
	lsl	x25, x26, #12
	b	.LBB31_39
.LBB31_51:                              //   in Loop: Header=BB31_39 Depth=2
	ldr	x8, [x20, #40]
	ldr	x0, [x8, #1104]
	ldr	w9, [x0, #3024]
	cbz	w9, .LBB31_59
// %bb.52:                              //   in Loop: Header=BB31_39 Depth=2
	ldr	x8, [x0]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB31_58
// %bb.53:                              //   in Loop: Header=BB31_39 Depth=2
	ldr	x11, [x0, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB31_55
.LBB31_54:                              //   in Loop: Header=BB31_55 Depth=3
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB31_58
.LBB31_55:                              //   Parent Loop BB31_26 Depth=1
                                        //     Parent Loop BB31_39 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w12, [x11, #-4]
	cmp	w12, w28
	b.hi	.LBB31_54
// %bb.56:                              //   in Loop: Header=BB31_55 Depth=3
	ldr	w12, [x11]
	cmp	w12, w28
	b.lo	.LBB31_54
// %bb.57:                              //   in Loop: Header=BB31_39 Depth=2
	ldur	x8, [x11, #-80]
.LBB31_58:                              //   in Loop: Header=BB31_39 Depth=2
	cbz	x8, .LBB31_46
.LBB31_59:                              //   in Loop: Header=BB31_39 Depth=2
	mov	w1, w28
	mov	w2, #7
	bl	f2fs_is_valid_blkaddr
	tbnz	w0, #0, .LBB31_46
	b	.LBB31_167
.LBB31_60:                              //   in Loop: Header=BB31_39 Depth=2
	ldr	x8, [x21, #240]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x11, [x8, #1104]
	ldr	w9, [x11, #3024]
	cbz	w9, .LBB31_122
// %bb.61:                              //   in Loop: Header=BB31_39 Depth=2
	ldr	x8, [x11]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB31_67
// %bb.62:                              //   in Loop: Header=BB31_39 Depth=2
	ldr	x11, [x11, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB31_64
.LBB31_63:                              //   in Loop: Header=BB31_64 Depth=3
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB31_67
.LBB31_64:                              //   Parent Loop BB31_26 Depth=1
                                        //     Parent Loop BB31_39 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w12, [x11, #-4]
	cmp	w12, w28
	b.hi	.LBB31_63
// %bb.65:                              //   in Loop: Header=BB31_64 Depth=3
	ldr	w12, [x11]
	cmp	w12, w28
	b.lo	.LBB31_63
// %bb.66:                              //   in Loop: Header=BB31_39 Depth=2
	ldur	x8, [x11, #-80]
.LBB31_67:                              //   in Loop: Header=BB31_39 Depth=2
	cbz	x8, .LBB31_49
	b	.LBB31_122
.LBB31_68:                              //   in Loop: Header=BB31_39 Depth=2
	ldrh	w12, [x9, #360]
	lsr	w12, w12, #2
	b	.LBB31_45
.LBB31_69:                              //   Parent Loop BB31_26 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB31_84 Depth 3
	lsl	x9, x9, #6
	orr	x9, x9, #0xffffffc000000000
	ldr	w10, [x9, #4072]
	ldr	w11, [x9, #4076]
	cmp	w10, w11
	b.ne	.LBB31_74
// %bb.70:                              //   in Loop: Header=BB31_69 Depth=2
	ldr	x12, [sp, #32]
	cbz	x12, .LBB31_73
// %bb.71:                              //   in Loop: Header=BB31_69 Depth=2
	ldr	x13, [x12, #712]
	tbz	w13, #26, .LBB31_74
// %bb.72:                              //   in Loop: Header=BB31_69 Depth=2
	ldr	w12, [x12, #1160]
	asr	w12, w12, #2
	b	.LBB31_75
.LBB31_73:                              //   in Loop: Header=BB31_69 Depth=2
	ldrb	w12, [x9, #3]
	tbnz	w12, #5, .LBB31_89
.LBB31_74:                              //   in Loop: Header=BB31_69 Depth=2
	mov	w12, wzr
.LBB31_75:                              //   in Loop: Header=BB31_69 Depth=2
	add	x13, x9, #360           // =360
	cmp	w10, w11
	csel	x9, x13, x9, eq
	add	w8, w12, w8
	ldr	w28, [x9, w8, uxtw #2]
	add	w8, w28, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB31_80
.LBB31_76:                              //   in Loop: Header=BB31_69 Depth=2
	cmp	w24, #4                 // =4
	b.ne	.LBB31_78
// %bb.77:                              //   in Loop: Header=BB31_69 Depth=2
	cbz	w28, .LBB31_122
.LBB31_78:                              //   in Loop: Header=BB31_69 Depth=2
	ldr	w8, [sp, #60]
	add	x26, x26, #1            // =1
	add	w8, w8, #1              // =1
	cmp	w8, w19
	str	w8, [sp, #60]
	b.hs	.LBB31_90
// %bb.79:                              //   in Loop: Header=BB31_69 Depth=2
	ldr	x9, [sp, #48]
	lsl	x25, x26, #12
	b	.LBB31_69
.LBB31_80:                              //   in Loop: Header=BB31_69 Depth=2
	ldr	x8, [x20, #40]
	ldr	x0, [x8, #1104]
	ldr	w9, [x0, #3024]
	cbz	w9, .LBB31_88
// %bb.81:                              //   in Loop: Header=BB31_69 Depth=2
	ldr	x8, [x0]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB31_87
// %bb.82:                              //   in Loop: Header=BB31_69 Depth=2
	ldr	x11, [x0, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB31_84
.LBB31_83:                              //   in Loop: Header=BB31_84 Depth=3
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB31_87
.LBB31_84:                              //   Parent Loop BB31_26 Depth=1
                                        //     Parent Loop BB31_69 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w12, [x11, #-4]
	cmp	w12, w28
	b.hi	.LBB31_83
// %bb.85:                              //   in Loop: Header=BB31_84 Depth=3
	ldr	w12, [x11]
	cmp	w12, w28
	b.lo	.LBB31_83
// %bb.86:                              //   in Loop: Header=BB31_69 Depth=2
	ldur	x8, [x11, #-80]
.LBB31_87:                              //   in Loop: Header=BB31_69 Depth=2
	cbz	x8, .LBB31_76
.LBB31_88:                              //   in Loop: Header=BB31_69 Depth=2
	mov	w1, w28
	mov	w2, #7
	bl	f2fs_is_valid_blkaddr
	tbnz	w0, #0, .LBB31_76
	b	.LBB31_167
.LBB31_89:                              //   in Loop: Header=BB31_69 Depth=2
	ldrh	w12, [x9, #360]
	lsr	w12, w12, #2
	b	.LBB31_75
.LBB31_90:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	x25, [sp, #48]
	cbz	x25, .LBB31_115
// %bb.91:                              //   in Loop: Header=BB31_26 Depth=1
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
	b.ne	.LBB31_107
// %bb.92:                              //   in Loop: Header=BB31_26 Depth=1
	tbnz	w8, #0, .LBB31_106
// %bb.93:                              //   in Loop: Header=BB31_26 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB31_96
// %bb.94:                              //   in Loop: Header=BB31_26 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB31_96
// %bb.95:                              //   in Loop: Header=BB31_26 Depth=1
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB31_96:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB31_98
// %bb.97:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB31_119
.LBB31_98:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	x0, [x25, #24]
.LBB31_99:                              //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB31_101
// %bb.100:                             //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB31_120
.LBB31_101:                             //   in Loop: Header=BB31_26 Depth=1
	ldr	x0, [x25, #24]
.LBB31_102:                             //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB31_104
// %bb.103:                             //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB31_121
.LBB31_104:                             //   in Loop: Header=BB31_26 Depth=1
	ldr	x0, [x25, #24]
.LBB31_105:                             //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB31_106:                             //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB31_113
	b	.LBB31_219
.LBB31_107:                             //   in Loop: Header=BB31_26 Depth=1
	tbnz	w8, #0, .LBB31_112
// %bb.108:                             //   in Loop: Header=BB31_26 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB31_111
// %bb.109:                             //   in Loop: Header=BB31_26 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB31_111
// %bb.110:                             //   in Loop: Header=BB31_26 Depth=1
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB31_111:                             //   in Loop: Header=BB31_26 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB31_112:                             //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB31_220
.LBB31_113:                             //   in Loop: Header=BB31_26 Depth=1
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
	cbnz	w9, .LBB31_115
// %bb.114:                             //   in Loop: Header=BB31_26 Depth=1
	bl	__put_page
.LBB31_115:                             //   in Loop: Header=BB31_26 Depth=1
	ldr	x8, [sp, #40]
	cbz	x8, .LBB31_24
// %bb.116:                             //   in Loop: Header=BB31_26 Depth=1
	ldr	x9, [sp, #48]
	cmp	x9, x8
	b.eq	.LBB31_24
// %bb.117:                             //   in Loop: Header=BB31_26 Depth=1
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
	cbnz	w9, .LBB31_24
// %bb.118:                             //   in Loop: Header=BB31_26 Depth=1
	bl	__put_page
	b	.LBB31_24
.LBB31_119:                             //   in Loop: Header=BB31_26 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB31_99
.LBB31_120:                             //   in Loop: Header=BB31_26 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB31_102
.LBB31_121:                             //   in Loop: Header=BB31_26 Depth=1
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB31_105
.LBB31_122:
	ldr	x26, [sp, #48]
	cbz	x26, .LBB31_149
// %bb.123:
	ldr	x8, [x26, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x26, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x26, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB31_141
// %bb.124:
	tbnz	w8, #0, .LBB31_138
// %bb.125:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB31_128
// %bb.126:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB31_128
// %bb.127:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB31_128:
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB31_130
// %bb.129:
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB31_212
.LBB31_130:
	ldr	x0, [x26, #24]
.LBB31_131:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB31_133
// %bb.132:
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB31_213
.LBB31_133:
	ldr	x0, [x26, #24]
.LBB31_134:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB31_136
// %bb.135:
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB31_214
.LBB31_136:
	ldr	x0, [x26, #24]
.LBB31_137:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB31_138:
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB31_147
// %bb.139:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB31_140:
	mov	x23, x25
	b	.LBB31_165
.LBB31_141:
	tbnz	w8, #0, .LBB31_146
// %bb.142:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB31_145
// %bb.143:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB31_145
// %bb.144:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB31_145:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB31_146:
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB31_223
.LBB31_147:
	mov	x0, x26
	bl	unlock_page
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x26, x9, eq
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
	cbnz	w9, .LBB31_149
// %bb.148:
	bl	__put_page
.LBB31_149:
	ldr	x8, [sp, #40]
	cbz	x8, .LBB31_153
// %bb.150:
	ldr	x9, [sp, #48]
	cmp	x9, x8
	b.eq	.LBB31_153
// %bb.151:
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
	cbnz	w9, .LBB31_153
// %bb.152:
	bl	__put_page
.LBB31_153:
	stp	xzr, xzr, [x22]
.LBB31_154:
	cmp	x25, x23
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ccmp	w24, #4, #0, gt
	csel	x23, x23, x25, eq
	cbz	x19, .LBB31_160
// %bb.155:
	ldr	x8, [x19, #712]
	ldr	x20, [sp, #24]          // 8-byte Folded Reload
	ldr	x26, [sp, #8]           // 8-byte Folded Reload
	tbnz	x8, #43, .LBB31_161
.LBB31_156:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB31_159
// %bb.157:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB31_159
// %bb.158:
	adrp	x22, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.put_inner_inode
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #4511
	add	x2, x2, :lo12:.L__func__.put_inner_inode
	ldr	x0, [x22, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB31_159:
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	b	.LBB31_162
.LBB31_160:
	ldr	x20, [sp, #24]          // 8-byte Folded Reload
	ldr	x26, [sp, #8]           // 8-byte Folded Reload
	b	.LBB31_165
.LBB31_161:
	ldr	x8, [x19, #712]
	tbz	x8, #44, .LBB31_156
.LBB31_162:
	ldr	x8, [x19, #712]
	tbz	x8, #43, .LBB31_221
// %bb.163:
	ldr	x8, [x19, #712]
	tbz	x8, #44, .LBB31_221
// %bb.164:
	mov	x0, x19
	bl	iput
.LBB31_165:
	mov	x0, x20
	bl	up_write
	mov	x0, x21
	mov	x1, x23
	mov	x2, x26
	bl	vfs_setpos
	b	.LBB31_210
.LBB31_166:
	cmp	w24, #3                 // =3
	b.ne	.LBB31_154
	b	.LBB31_198
.LBB31_167:
	ldr	x21, [sp, #48]
	cbz	x21, .LBB31_193
// %bb.168:
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
	b.ne	.LBB31_185
// %bb.169:
	tbnz	w8, #0, .LBB31_183
// %bb.170:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB31_173
// %bb.171:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB31_173
// %bb.172:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB31_173:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB31_175
// %bb.174:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB31_216
.LBB31_175:
	ldr	x0, [x21, #24]
.LBB31_176:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB31_178
// %bb.177:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB31_217
.LBB31_178:
	ldr	x0, [x21, #24]
.LBB31_179:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB31_181
// %bb.180:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB31_218
.LBB31_181:
	ldr	x0, [x21, #24]
.LBB31_182:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB31_183:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB31_191
// %bb.184:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB31_185:
	tbnz	w8, #0, .LBB31_190
// %bb.186:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB31_189
// %bb.187:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB31_189
// %bb.188:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB31_189:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB31_190:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB31_224
.LBB31_191:
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
	cbnz	w9, .LBB31_193
// %bb.192:
	bl	__put_page
.LBB31_193:
	ldr	x8, [sp, #40]
	cbz	x8, .LBB31_197
// %bb.194:
	ldr	x9, [sp, #48]
	cmp	x9, x8
	b.eq	.LBB31_197
// %bb.195:
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
	cbnz	w9, .LBB31_197
// %bb.196:
	bl	__put_page
.LBB31_197:
	stp	xzr, xzr, [x22]
.LBB31_198:
	ldp	x19, x20, [sp, #16]     // 16-byte Folded Reload
	cbz	x19, .LBB31_208
// %bb.199:
	ldr	x8, [x19, #712]
	tbnz	x8, #43, .LBB31_204
.LBB31_200:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB31_203
// %bb.201:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB31_203
// %bb.202:
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.put_inner_inode
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #4511
	add	x2, x2, :lo12:.L__func__.put_inner_inode
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB31_203:
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	b	.LBB31_205
.LBB31_204:
	ldr	x8, [x19, #712]
	tbz	x8, #44, .LBB31_200
.LBB31_205:
	ldr	x8, [x19, #712]
	tbz	x8, #43, .LBB31_222
// %bb.206:
	ldr	x8, [x19, #712]
	tbz	x8, #44, .LBB31_222
// %bb.207:
	mov	x0, x19
	bl	iput
.LBB31_208:
	mov	x0, x20
	bl	up_write
.LBB31_209:
	mov	x0, #-6
.LBB31_210:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB31_215
// %bb.211:
	ldp	x20, x19, [sp, #176]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #160]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #144]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #128]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #112]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	add	sp, sp, #192            // =192
	ret
.LBB31_212:
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB31_131
.LBB31_213:
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB31_134
.LBB31_214:
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB31_137
.LBB31_215:
	bl	__stack_chk_fail
.LBB31_216:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB31_176
.LBB31_217:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB31_179
.LBB31_218:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB31_182
.LBB31_219:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB31_220:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB31_221:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 4511; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB31_222:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 4511; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB31_223:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB31_224:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end31:
	.size	f2fs_llseek, .Lfunc_end31-f2fs_llseek
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_file_read_iter
	.type	f2fs_file_read_iter,@function
f2fs_file_read_iter:                    // @f2fs_file_read_iter
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
	mov	x22, x1
	ldp	x8, x19, [x0]
	ldr	x20, [x8, #32]
	mov	x0, x20
	bl	f2fs_is_compress_backend_ready
	tbz	w0, #0, .LBB32_24
// %bb.1:
	adrp	x27, __tracepoint_f2fs_dataread_start
	add	x27, x27, :lo12:__tracepoint_f2fs_dataread_start
	ldr	w8, [x27, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB32_13
// %bb.2:
	adrp	x8, kmalloc_caches
	mov	w1, #192
	add	x8, x8, :lo12:kmalloc_caches
	movk	w1, #96, lsl #16
	mov	w2, #4096
	ldr	x0, [x8, #96]
	bl	kmem_cache_alloc_trace
	cbz	x0, .LBB32_13
// %bb.3:
	ldr	x8, [x21]
	mov	x23, x0
	ldr	x0, [x8, #24]
	ldrb	w9, [x0, #3]
	tbnz	w9, #2, .LBB32_26
.LBB32_4:
	mov	x1, x23
	mov	w2, #4096
	bl	dentry_path_raw
	cmn	x0, #4095               // =4095
	b.hs	.LBB32_12
// %bb.5:
	ldr	w25, [x22, #16]
	//APP
	mrs x12, sp_el0
	//NO_APP
	ldr	w26, [x12, #1784]
	ldr	x8, [x12, #1848]
	ldr	w9, [x27, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB32_12
// %bb.6:
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
	tbz	w9, #0, .LBB32_12
// %bb.7:
	ldr	w9, [x12, #80]
	str	x12, [sp, #8]           // 8-byte Folded Spill
	add	w9, w9, #1              // =1
	str	w9, [x12, #80]
	//APP
	//NO_APP
	ldr	x28, [x27, #32]
	cbz	x28, .LBB32_10
// %bb.8:
	ldr	x9, [x28], #24
	mov	x24, x0
	add	x27, x8, #2232          // =2232
.LBB32_9:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x28, #-16]
	mov	x1, x20
	mov	x2, x19
	mov	w3, w25
	mov	w4, w26
	mov	x5, x24
	mov	x6, x27
	blr	x9
	ldr	x9, [x28], #24
	cbnz	x9, .LBB32_9
.LBB32_10:
	//APP
	//NO_APP
	ldr	x9, [sp, #8]            // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	b.ne	.LBB32_12
// %bb.11:
	ldr	x8, [x9]
	tbnz	w8, #1, .LBB32_28
.LBB32_12:
	mov	x0, x23
	bl	kfree
.LBB32_13:
	mov	x0, x21
	mov	x1, x22
	bl	generic_file_read_iter
	mov	x21, x0
	cmp	w21, #1                 // =1
	b.lt	.LBB32_16
// %bb.14:
	ldr	x8, [x20, #40]
	ldr	x22, [x8, #1104]
	ldrb	w8, [x22, #2600]
	cbz	w8, .LBB32_16
// %bb.15:
	add	x23, x22, #2240         // =2240
	mov	x0, x23
	bl	_raw_spin_lock
	ldr	x8, [x22, #2360]
	mov	x0, x23
	ldr	x9, [x22, #2344]
	add	x8, x8, w21, sxtw
	sub	x9, x8, x9
	str	x8, [x22, #2360]
	str	x9, [x22, #2352]
	bl	_raw_spin_unlock
	mov	x0, x22
	bl	f2fs_record_iostat
.LBB32_16:
	adrp	x8, __tracepoint_f2fs_dataread_end
	add	x8, x8, :lo12:__tracepoint_f2fs_dataread_end
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB32_23
// %bb.17:
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
	tbz	w9, #0, .LBB32_23
// %bb.18:
	//APP
	mrs x22, sp_el0
	//NO_APP
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x23, [x8, #32]
	cbz	x23, .LBB32_21
// %bb.19:
	ldr	x8, [x23], #24
.LBB32_20:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x23, #-16]
	mov	x1, x20
	mov	x2, x19
	mov	w3, w21
	blr	x8
	ldr	x8, [x23], #24
	cbnz	x8, .LBB32_20
.LBB32_21:
	//APP
	//NO_APP
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB32_23
// %bb.22:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB32_27
.LBB32_23:
	sxtw	x0, w21
	b	.LBB32_25
.LBB32_24:
	mov	x0, #-95
.LBB32_25:
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB32_26:
	ldr	x9, [x0, #96]
	ldr	x1, [x8, #32]
	ldr	x8, [x9, #96]
	blr	x8
	b	.LBB32_4
.LBB32_27:
	bl	preempt_schedule_notrace
	b	.LBB32_23
.LBB32_28:
	bl	preempt_schedule_notrace
	b	.LBB32_12
.Lfunc_end32:
	.size	f2fs_file_read_iter, .Lfunc_end32-f2fs_file_read_iter
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_file_write_iter
	.type	f2fs_file_write_iter,@function
f2fs_file_write_iter:                   // @f2fs_file_write_iter
// %bb.0:
	sub	sp, sp, #128            // =128
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	stp	x28, x27, [sp, #48]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #64]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #80]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #96]     // 16-byte Folded Spill
	mov	x21, x1
	stp	x20, x19, [sp, #112]    // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0]
	ldr	x20, [x8, #32]
	ldr	x8, [x20, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB33_90
// %bb.1:
	ldr	x23, [x19, #8]
	mov	x0, x20
	ldr	x24, [x21, #16]
	bl	f2fs_is_compress_backend_ready
	tbz	w0, #0, .LBB33_4
// %bb.2:
	ldrb	w8, [x19, #32]
	add	x22, x20, #160          // =160
	mov	x0, x22
	tbnz	w8, #3, .LBB33_5
// %bb.3:
	bl	down_write
	b	.LBB33_6
.LBB33_4:
	mov	x25, #-95
	b	.LBB33_39
.LBB33_5:
	bl	down_write_trylock
	cbz	w0, .LBB33_36
.LBB33_6:
	ldrb	w8, [x20, #12]
	tbnz	w8, #3, .LBB33_103
// %bb.7:
	ldr	x8, [x20, #712]
	tbz	x8, #35, .LBB33_9
// %bb.8:
	mov	x0, x20
	mov	w1, #8
	bl	f2fs_reserve_compress_blocks_internal
                                        // kill: def $w0 killed $w0 def $x0
	cbnz	w0, .LBB33_15
.LBB33_9:
	ldr	x8, [x20, #712]
	tbz	x8, #49, .LBB33_11
// %bb.10:
	mov	x0, x20
	mov	w1, #1
	add	x8, x20, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB33_11:
	ldr	x8, [x20, #712]
	tbz	x8, #43, .LBB33_16
// %bb.12:
	ldr	x8, [x20, #712]
	tbz	x8, #43, .LBB33_14
// %bb.13:
	ldr	x8, [x20, #712]
	tbnz	x8, #44, .LBB33_16
.LBB33_14:
	adrp	x1, .L__func__.f2fs_file_write_iter
	mov	x0, x20
	add	x1, x1, :lo12:.L__func__.f2fs_file_write_iter
	bl	f2fs_revoke_deduped_inode
                                        // kill: def $w0 killed $w0 def $x0
	cbz	w0, .LBB33_16
.LBB33_15:
	sxtw	x25, w0
	b	.LBB33_38
.LBB33_16:
	mov	x0, x19
	mov	x1, x21
	bl	generic_write_checks
	cmp	x0, #1                  // =1
	b.lt	.LBB33_37
// %bb.17:
	ldr	x1, [x21, #16]
	mov	x0, x21
	bl	iov_iter_fault_in_readable
	cbz	w0, .LBB33_19
// %bb.18:
	add	x8, x20, #712           // =712
	mov	w9, #16777216
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
.LBB33_19:
	ldr	w8, [x19, #32]
	tbnz	w8, #3, .LBB33_50
// %bb.20:
	ldr	x9, [x20, #712]
	tbnz	w9, #24, .LBB33_76
// %bb.21:
	tbnz	w8, #17, .LBB33_55
.LBB33_22:
	ldr	x26, [x19, #8]
	mov	x0, x19
	ldr	x27, [x21, #16]
	mov	x1, x21
	bl	f2fs_preallocate_blocks
	mov	w25, w0
	cbnz	w0, .LBB33_56
// %bb.23:
	adrp	x28, __tracepoint_f2fs_datawrite_start
	add	x27, x27, x26
	add	x28, x28, :lo12:__tracepoint_f2fs_datawrite_start
	ldr	w8, [x28, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB33_35
// %bb.24:
	adrp	x8, kmalloc_caches
	mov	w1, #192
	add	x8, x8, :lo12:kmalloc_caches
	movk	w1, #96, lsl #16
	mov	w2, #4096
	ldr	x0, [x8, #96]
	bl	kmem_cache_alloc_trace
	cbz	x0, .LBB33_35
// %bb.25:
	ldr	x8, [x19]
	mov	x25, x0
	ldr	x0, [x8, #24]
	ldrb	w9, [x0, #3]
	tbnz	w9, #2, .LBB33_106
.LBB33_26:
	mov	x1, x25
	mov	w2, #4096
	bl	dentry_path_raw
	cmn	x0, #4095               // =4095
	b.hs	.LBB33_34
// %bb.27:
	//APP
	mrs x12, sp_el0
	//NO_APP
	ldr	w26, [x12, #1784]
	ldr	x8, [x12, #1848]
	ldr	w9, [x28, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB33_34
// %bb.28:
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
	tbz	w9, #0, .LBB33_34
// %bb.29:
	str	x27, [sp, #8]           // 8-byte Folded Spill
	stur	x25, [x29, #-8]         // 8-byte Folded Spill
	ldr	w9, [x12, #80]
	str	x12, [sp, #16]          // 8-byte Folded Spill
	add	w9, w9, #1              // =1
	str	w9, [x12, #80]
	//APP
	//NO_APP
	ldr	x25, [x28, #32]
	cbz	x25, .LBB33_32
// %bb.30:
	ldr	x9, [x25], #24
	mov	x13, x0
	add	x28, x8, #2232          // =2232
.LBB33_31:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x25, #-16]
	mov	x1, x20
	mov	x2, x23
	mov	w3, w24
	mov	w4, w26
	mov	x5, x13
	mov	x6, x28
	mov	x27, x13
	blr	x9
	ldr	x9, [x25], #24
	mov	x13, x27
	cbnz	x9, .LBB33_31
.LBB33_32:
	//APP
	//NO_APP
	ldp	x27, x9, [sp, #8]       // 16-byte Folded Reload
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	ldur	x25, [x29, #-8]         // 8-byte Folded Reload
	b.ne	.LBB33_34
// %bb.33:
	ldr	x8, [x9]
	tbnz	w8, #1, .LBB33_107
.LBB33_34:
	mov	x0, x25
	bl	kfree
.LBB33_35:
	mov	w24, #1
	b	.LBB33_77
.LBB33_36:
	mov	x25, #-11
	b	.LBB33_39
.LBB33_37:
	mov	x25, x0
.LBB33_38:
	mov	x0, x22
	bl	up_write
.LBB33_39:
	adrp	x8, __tracepoint_f2fs_file_write_iter
	ldr	x22, [x19, #8]
	add	x8, x8, :lo12:__tracepoint_f2fs_file_write_iter
	ldr	x21, [x21, #16]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB33_46
// %bb.40:
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
	tbz	w9, #0, .LBB33_46
// %bb.41:
	//APP
	mrs x23, sp_el0
	//NO_APP
	ldr	w9, [x23, #80]
	add	w9, w9, #1              // =1
	str	w9, [x23, #80]
	//APP
	//NO_APP
	ldr	x24, [x8, #32]
	cbz	x24, .LBB33_44
// %bb.42:
	ldr	x8, [x24], #24
.LBB33_43:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x24, #-16]
	mov	x1, x20
	mov	x2, x22
	mov	x3, x21
	mov	w4, w25
	blr	x8
	ldr	x8, [x24], #24
	cbnz	x8, .LBB33_43
.LBB33_44:
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB33_46
// %bb.45:
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB33_104
.LBB33_46:
	cmp	x25, #1                 // =1
	b.lt	.LBB33_49
.LBB33_47:
	ldr	w8, [x19, #32]
	tbz	w8, #1, .LBB33_49
// %bb.48:
	ldp	x0, x9, [x19]
	mov	w10, #1
	bic	w3, w10, w8, lsr #2
	sub	x1, x9, x25
	sub	x2, x9, #1              // =1
	bl	vfs_fsync_range
                                        // kill: def $w0 killed $w0 def $x0
	cmp	w0, #0                  // =0
	sxtw	x8, w0
	csel	x25, x25, x8, eq
.LBB33_49:
	mov	x0, x25
	ldp	x20, x19, [sp, #112]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #128            // =128
	ret
.LBB33_50:
	ldr	x1, [x19, #8]
	mov	x0, x20
	ldr	x2, [x21, #16]
	bl	f2fs_overwrite_io
	tbz	w0, #0, .LBB33_54
// %bb.51:
	ldr	x8, [x20, #712]
	tbnz	w8, #10, .LBB33_54
// %bb.52:
	ldr	x8, [x20, #40]
	mov	x0, x19
	ldr	w25, [x21]
	mov	x1, x21
	ldr	x24, [x8, #1104]
	bl	fscrypt_dio_supported
	tbz	w0, #0, .LBB33_54
// %bb.53:
	ldr	x8, [x20, #640]
	cbz	x8, .LBB33_63
.LBB33_54:
	mov	x0, x22
	add	x8, x20, #712           // =712
	mov	w9, #16777216
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	up_write
	mov	x25, #-11
	b	.LBB33_39
.LBB33_55:
	mov	x0, x20
	bl	f2fs_convert_inline_inode
	mov	w25, w0
	cbz	w0, .LBB33_57
.LBB33_56:
	mov	x0, x22
	add	x8, x20, #712           // =712
	mov	w9, #16777216
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	up_write
	sxtw	x25, w25
	b	.LBB33_39
.LBB33_57:
	ldr	x8, [x20, #40]
	mov	x0, x19
	ldr	w26, [x21]
	mov	x1, x21
	ldr	x25, [x8, #1104]
	bl	fscrypt_dio_supported
	tbz	w0, #0, .LBB33_22
// %bb.58:
	ldr	x8, [x20, #640]
	cbnz	x8, .LBB33_22
// %bb.59:
	ldr	x8, [x20, #40]
	ldr	x8, [x8, #1104]
	ldr	w9, [x8, #1532]
	cbz	w9, .LBB33_91
// %bb.60:
	ldr	w9, [x20, #1256]
	cbnz	w9, .LBB33_22
// %bb.61:
	ldr	x9, [x20, #712]
	tbnz	x9, #35, .LBB33_22
// %bb.62:
	ldr	x9, [x20, #712]
	tbnz	x9, #34, .LBB33_22
	b	.LBB33_93
.LBB33_63:
	ldr	x8, [x20, #40]
	ldr	x8, [x8, #1104]
	ldr	w9, [x8, #1532]
	cbz	w9, .LBB33_67
// %bb.64:
	ldr	w9, [x20, #1256]
	cbnz	w9, .LBB33_54
// %bb.65:
	ldr	x9, [x20, #712]
	tbnz	x9, #35, .LBB33_54
// %bb.66:
	ldr	x9, [x20, #712]
	tbnz	x9, #34, .LBB33_54
	b	.LBB33_69
.LBB33_67:
	ldrh	w9, [x20]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB33_69
// %bb.68:
	ldr	x9, [x20, #712]
	tbnz	w9, #31, .LBB33_54
.LBB33_69:
	ldr	x9, [x24, #16]
	ldrb	w9, [x9, #2180]
	tbnz	w9, #1, .LBB33_54
// %bb.70:
	tbz	w25, #0, .LBB33_75
// %bb.71:
	ldr	w9, [x24, #1504]
	cmp	w9, #1                  // =1
	b.ne	.LBB33_75
// %bb.72:
	ldrb	w8, [x20, #142]
	mov	x0, x21
	ldr	w25, [x19, #8]
	mov	w9, #-1
	lsl	w26, w9, w8
	bl	iov_iter_alignment
	orr	w8, w0, w25
	bics	wzr, w8, w26
	b.ne	.LBB33_54
// %bb.73:
	ldr	w8, [x24, #1432]
	mov	w9, #1
	lsl	w8, w9, w8
	cmp	w8, #1                  // =1
	b.gt	.LBB33_54
// %bb.74:
	ldr	x8, [x20, #40]
	ldr	x8, [x8, #1104]
.LBB33_75:
	ldr	x8, [x8, #80]
	tbnz	w8, #8, .LBB33_54
.LBB33_76:
	mov	w24, wzr
	mov	x27, xzr
.LBB33_77:
	mov	x0, x19
	mov	x1, x21
	bl	__generic_file_write_iter
	adrp	x8, __tracepoint_f2fs_datawrite_end
	mov	x25, x0
	add	x8, x8, :lo12:__tracepoint_f2fs_datawrite_end
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB33_84
// %bb.78:
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
	tbz	w9, #0, .LBB33_84
// %bb.79:
	//APP
	mrs x26, sp_el0
	//NO_APP
	ldr	w9, [x26, #80]
	add	w9, w9, #1              // =1
	str	w9, [x26, #80]
	//APP
	//NO_APP
	ldr	x28, [x8, #32]
	cbz	x28, .LBB33_82
// %bb.80:
	ldr	x8, [x28], #24
.LBB33_81:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x28, #-16]
	mov	x1, x20
	mov	x2, x23
	mov	w3, w25
	blr	x8
	ldr	x8, [x28], #24
	cbnz	x8, .LBB33_81
.LBB33_82:
	//APP
	//NO_APP
	ldr	w8, [x26, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x26, #80]
	b.ne	.LBB33_84
// %bb.83:
	ldr	x8, [x26]
	tbnz	w8, #1, .LBB33_105
.LBB33_84:
	add	x8, x20, #712           // =712
	mov	w9, #16777216
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	cbz	w24, .LBB33_87
// %bb.85:
	ldr	x8, [x20, #80]
	cmp	x8, x27
	b.hs	.LBB33_87
// %bb.86:
	add	x23, x20, #1016         // =1016
	mov	x0, x23
	bl	down_write
	add	x24, x20, #1064         // =1064
	mov	x0, x24
	bl	down_write
	mov	x0, x20
	bl	f2fs_truncate
	mov	x0, x24
	bl	up_write
	mov	x0, x23
	bl	up_write
.LBB33_87:
	cmp	x25, #1                 // =1
	b.lt	.LBB33_38
// %bb.88:
	ldr	x8, [x20, #40]
	ldr	x23, [x8, #1104]
	ldrb	w8, [x23, #2600]
	cbz	w8, .LBB33_38
// %bb.89:
	add	x24, x23, #2240         // =2240
	mov	x0, x24
	bl	_raw_spin_lock
	ldr	x8, [x23, #2264]
	mov	x0, x24
	ldr	x9, [x23, #2248]
	add	x8, x8, x25
	sub	x9, x8, x9
	str	x8, [x23, #2264]
	str	x9, [x23, #2256]
	bl	_raw_spin_unlock
	mov	x0, x23
	bl	f2fs_record_iostat
	b	.LBB33_38
.LBB33_90:
	mov	x25, #-5
	b	.LBB33_39
.LBB33_91:
	ldrh	w9, [x20]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB33_93
// %bb.92:
	ldr	x9, [x20, #712]
	tbnz	w9, #31, .LBB33_22
.LBB33_93:
	ldr	x9, [x25, #16]
	ldrb	w9, [x9, #2180]
	tbnz	w9, #1, .LBB33_22
// %bb.94:
	tbz	w26, #0, .LBB33_99
// %bb.95:
	ldr	w9, [x25, #1504]
	cmp	w9, #1                  // =1
	b.ne	.LBB33_99
// %bb.96:
	ldrb	w8, [x20, #142]
	mov	x0, x21
	ldr	w26, [x19, #8]
	mov	w9, #-1
	lsl	w27, w9, w8
	bl	iov_iter_alignment
	orr	w8, w0, w26
	bics	wzr, w8, w27
	b.ne	.LBB33_22
// %bb.97:
	ldr	w8, [x25, #1432]
	mov	w9, #1
	lsl	w8, w9, w8
	cmp	w8, #1                  // =1
	b.gt	.LBB33_22
// %bb.98:
	ldr	x8, [x20, #40]
	ldr	x8, [x8, #1104]
.LBB33_99:
	ldr	x9, [x8, #80]
	tbnz	w9, #8, .LBB33_22
// %bb.100:
	ldr	w8, [x8, #1504]
	cmp	w8, #1                  // =1
	b.ne	.LBB33_22
// %bb.101:
	ldr	w8, [x21]
	tbz	w8, #0, .LBB33_22
// %bb.102:
	ldrb	w8, [x20, #142]
	mov	x0, x21
	ldr	w25, [x19, #8]
	mov	w9, #-1
	lsl	w26, w9, w8
	bl	iov_iter_alignment
	orr	w8, w0, w25
	bics	wzr, w8, w26
	b.ne	.LBB33_22
	b	.LBB33_76
.LBB33_103:
	mov	x25, #-1
	b	.LBB33_38
.LBB33_104:
	bl	preempt_schedule_notrace
	cmp	x25, #1                 // =1
	b.ge	.LBB33_47
	b	.LBB33_49
.LBB33_105:
	bl	preempt_schedule_notrace
	b	.LBB33_84
.LBB33_106:
	ldr	x9, [x0, #96]
	ldr	x1, [x8, #32]
	ldr	x8, [x9, #96]
	blr	x8
	b	.LBB33_26
.LBB33_107:
	bl	preempt_schedule_notrace
	b	.LBB33_34
.Lfunc_end33:
	.size	f2fs_file_write_iter, .Lfunc_end33-f2fs_file_write_iter
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_file_mmap
	.type	f2fs_file_mmap,@function
f2fs_file_mmap:                         // @f2fs_file_mmap
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	ldr	x19, [x0, #32]
	str	x21, [sp, #16]          // 8-byte Folded Spill
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB34_7
// %bb.1:
	mov	x21, x0
	mov	x0, x19
	mov	x20, x1
	bl	f2fs_is_compress_backend_ready
	tbz	w0, #0, .LBB34_5
// %bb.2:
	ldrb	w8, [x21, #66]
	tbnz	w8, #2, .LBB34_4
// %bb.3:
	add	x0, x21, #16            // =16
	bl	touch_atime
.LBB34_4:
	adrp	x10, f2fs_file_vm_ops
	mov	w0, wzr
	add	x10, x10, :lo12:f2fs_file_vm_ops
	add	x8, x19, #712           // =712
	mov	x9, #8589934592
	str	x10, [x20, #144]
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	b	.LBB34_6
.LBB34_5:
	mov	w0, #-95
.LBB34_6:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB34_7:
	mov	w0, #-5
	b	.LBB34_6
.Lfunc_end34:
	.size	f2fs_file_mmap, .Lfunc_end34-f2fs_file_mmap
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_file_open
	.type	f2fs_file_open,@function
f2fs_file_open:                         // @f2fs_file_open
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	str	x21, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x20, x1
	mov	x21, x0
	bl	fscrypt_file_open
	mov	w19, w0
	cbnz	w0, .LBB35_7
// %bb.1:
	mov	x0, x21
	bl	f2fs_is_compress_backend_ready
	tbz	w0, #0, .LBB35_6
// %bb.2:
	mov	x0, x21
	mov	x1, x20
	bl	fsverity_file_open
	mov	w19, w0
	cbnz	w0, .LBB35_7
// %bb.3:
	ldr	w8, [x20, #68]
	mov	x0, x21
	mov	x1, x20
	orr	w8, w8, #0x8000000
	str	w8, [x20, #68]
	bl	dquot_file_open
	mov	w19, w0
	cbnz	w0, .LBB35_7
// %bb.4:
	ldr	x8, [x21, #712]
	tbnz	x8, #43, .LBB35_8
.LBB35_5:
	mov	w19, wzr
	b	.LBB35_7
.LBB35_6:
	mov	w19, #-95
.LBB35_7:
	mov	w0, w19
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB35_8:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB35_10
// %bb.9:
	ldr	x8, [x21, #712]
	tbnz	x8, #44, .LBB35_5
.LBB35_10:
	add	x19, x21, #720          // =720
	mov	x0, x19
	bl	down_read
	ldr	x8, [x21, #712]
	tbnz	x8, #43, .LBB35_12
.LBB35_11:
	mov	x0, x19
	bl	up_read
	mov	w19, wzr
	b	.LBB35_7
.LBB35_12:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB35_14
// %bb.13:
	ldr	x8, [x21, #712]
	tbnz	x8, #44, .LBB35_11
.LBB35_14:
	ldr	x0, [x21, #1280]
	bl	igrab
	mov	x21, x0
	mov	x0, x19
	bl	up_read
	cbz	x21, .LBB35_5
// %bb.15:
	mov	x0, x21
	mov	x1, x20
	bl	f2fs_file_open
	ldr	x8, [x21, #712]
	mov	w19, w0
	tbnz	x8, #43, .LBB35_20
.LBB35_16:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB35_19
// %bb.17:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB35_19
// %bb.18:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.put_inner_inode
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #4511
	add	x2, x2, :lo12:.L__func__.put_inner_inode
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB35_19:
	ldr	x8, [x21, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	b	.LBB35_21
.LBB35_20:
	ldr	x8, [x21, #712]
	tbz	x8, #44, .LBB35_16
.LBB35_21:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB35_24
// %bb.22:
	ldr	x8, [x21, #712]
	tbz	x8, #44, .LBB35_24
// %bb.23:
	mov	x0, x21
	bl	iput
	b	.LBB35_7
.LBB35_24:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 4511; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end35:
	.size	f2fs_file_open, .Lfunc_end35-f2fs_file_open
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_file_flush
	.type	f2fs_file_flush,@function
f2fs_file_flush:                        // @f2fs_file_flush
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldr	x0, [x0, #32]
	mov	x29, sp
	ldr	x8, [x0, #712]
	sxth	w8, w8
	tbz	w8, #31, .LBB36_3
// %bb.1:
	ldr	x8, [x0, #920]
	//APP
	mrs x9, sp_el0
	//NO_APP
	cmp	x8, x9
	b.ne	.LBB36_3
// %bb.2:
	bl	f2fs_drop_inmem_pages
.LBB36_3:
	mov	w0, wzr
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end36:
	.size	f2fs_file_flush, .Lfunc_end36-f2fs_file_flush
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_release_file
	.type	f2fs_release_file,@function
f2fs_release_file:                      // @f2fs_release_file
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	ldrb	w8, [x1, #68]
	tbz	w8, #1, .LBB37_5
// %bb.1:
	ldr	w8, [x0, #360]
	mov	x19, x0
	cmp	w8, #1                  // =1
	b.ne	.LBB37_5
// %bb.2:
	ldr	x8, [x19, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB37_6
// %bb.3:
	ldr	x8, [x19, #712]
	tbz	w8, #17, .LBB37_5
.LBB37_4:
	add	x20, x19, #712          // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x20]
1:	ldxr	x8, [x20]
	orr	x8, x8, 524288
	stxr	w9, x8, [x20]
	cbnz	w9, 1b
	//NO_APP
	ldr	x0, [x19, #48]
	bl	filemap_fdatawrite
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x20]
1:	ldxr	x8, [x20]
	bic	x8, x8, 524288
	stxr	w9, x8, [x20]
	cbnz	w9, 1b
	//NO_APP
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x20]
1:	ldxr	x8, [x20]
	bic	x8, x8, 131072
	stxr	w9, x8, [x20]
	cbnz	w9, 1b
	//NO_APP
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	add	x8, x8, #2128           // =2128
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB37_5:
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.LBB37_6:
	mov	x0, x19
	bl	f2fs_drop_inmem_pages
	ldr	x8, [x19, #712]
	tbnz	w8, #17, .LBB37_4
	b	.LBB37_5
.Lfunc_end37:
	.size	f2fs_release_file, .Lfunc_end37-f2fs_release_file
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_fallocate
	.type	f2fs_fallocate,@function
f2fs_fallocate:                         // @f2fs_fallocate
// %bb.0:
	sub	sp, sp, #304            // =304
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #208]    // 16-byte Folded Spill
	add	x29, sp, #208           // =208
	stp	x28, x27, [sp, #224]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #240]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #256]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #272]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #288]    // 16-byte Folded Spill
	stur	x8, [x29, #-16]
	ldr	x21, [x0, #32]
	ldr	x8, [x21, #40]
	ldr	x24, [x8, #1104]
	ldr	x8, [x24, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB38_81
// %bb.1:
	ldr	x8, [x24, #80]
	mov	x19, x3
	mov	x20, x2
	mov	x23, x0
	mov	w22, w1
	tbnz	w8, #8, .LBB38_82
.LBB38_2:
	mov	x0, x21
	bl	f2fs_is_compress_backend_ready
	tbz	w0, #0, .LBB38_6
// %bb.3:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB38_7
// %bb.4:
	mov	w8, #40
	tst	w22, w8
	b.eq	.LBB38_10
// %bb.5:
	ldr	w8, [x21, #12]
	tbz	w8, #14, .LBB38_10
.LBB38_6:
	mov	x25, #-95
	b	.LBB38_8
.LBB38_7:
	mov	x25, #-22
.LBB38_8:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB38_275
// %bb.9:
	mov	x0, x25
	ldp	x20, x19, [sp, #288]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #272]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #256]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #240]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #224]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #208]    // 16-byte Folded Reload
	add	sp, sp, #304            // =304
	ret
.LBB38_10:
	ldr	x8, [x23, #32]
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB38_12
// %bb.11:
	ldr	x0, [x8, #40]
	mov	w1, #1
	mov	w2, #1
	bl	__sb_start_write
.LBB38_12:
	add	x24, x21, #160          // =160
	mov	x0, x24
	bl	down_write
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB38_17
// %bb.13:
	ldr	w8, [x21, #1256]
	cbnz	w8, .LBB38_16
// %bb.14:
	ldr	x8, [x21, #712]
	tbnz	x8, #35, .LBB38_16
// %bb.15:
	ldr	x8, [x21, #712]
	ubfx	x8, x8, #34, #1
	b	.LBB38_19
.LBB38_16:
	mov	w8, #1
	b	.LBB38_19
.LBB38_17:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB38_22
// %bb.18:
	ldr	x8, [x21, #712]
	ubfx	x8, x8, #31, #1
.LBB38_19:
	mov	w9, #58
	tst	w22, w9
	b.eq	.LBB38_22
// %bb.20:
	cbz	w8, .LBB38_22
// %bb.21:
	mov	x0, x23
	mov	w1, #2
	mov	w2, w22
	bl	f2fs_decompress_file_internal
	mov	x25, x0
	cbnz	x0, .LBB38_64
.LBB38_22:
	mov	w8, #-60
	tst	w22, w8
	b.eq	.LBB38_24
// %bb.23:
	mov	x25, #-95
	b	.LBB38_64
.LBB38_24:
	ldr	x8, [x21, #712]
	tbz	x8, #49, .LBB38_26
// %bb.25:
	mov	x0, x21
	mov	w1, #1
	add	x8, x21, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB38_26:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB38_31
// %bb.27:
	ldr	x8, [x21, #712]
	tbz	x8, #43, .LBB38_29
// %bb.28:
	ldr	x8, [x21, #712]
	tbnz	x8, #44, .LBB38_31
.LBB38_29:
	adrp	x1, .L__func__.f2fs_fallocate
	mov	x0, x21
	add	x1, x1, :lo12:.L__func__.f2fs_fallocate
	bl	f2fs_revoke_deduped_inode
	cbz	w0, .LBB38_31
// %bb.30:
	mov	x25, #-5
	b	.LBB38_64
.LBB38_31:
	tbnz	w22, #1, .LBB38_40
// %bb.32:
	tbnz	w22, #3, .LBB38_44
// %bb.33:
	tbnz	w22, #4, .LBB38_56
// %bb.34:
	ldr	x8, [x21, #40]
	ldr	x25, [x8, #1104]
	tbnz	w22, #5, .LBB38_62
// %bb.35:
	add	x26, x19, x20
	mov	w8, #11
	mov	w9, #1
	mov	x0, x21
	mov	x1, x26
	stp	xzr, xzr, [x29, #-40]
	stp	xzr, xzr, [x29, #-56]
	stur	xzr, [x29, #-64]
	stur	w8, [x29, #-32]
	sturb	w9, [x29, #-28]
	bl	inode_newsize_ok
	mov	w28, w0
	cbnz	w0, .LBB38_42
// %bb.36:
	mov	x0, x21
	bl	f2fs_convert_inline_inode
	mov	w28, w0
	cbnz	w0, .LBB38_42
// %bb.37:
	mov	x0, x25
	mov	w1, #1
	bl	f2fs_balance_fs
	lsr	x10, x20, #12
	lsr	x9, x26, #12
	sub	w8, w9, w10
	tst	x26, #0xfff
	cinc	w8, w8, ne
	stp	w10, w8, [x29, #-60]
	cbz	w8, .LBB38_95
// %bb.38:
	stp	x10, x9, [sp, #80]      // 16-byte Folded Spill
	ldr	x9, [x21, #712]
	str	x26, [sp, #72]          // 8-byte Folded Spill
	tbnz	w9, #28, .LBB38_99
// %bb.39:
	mov	w3, #5
	sub	x1, x29, #64            // =64
	mov	x0, x21
	mov	w2, #1
	bl	f2fs_map_blocks
	ldur	w9, [x29, #-56]
	mov	w28, w0
	str	x19, [sp, #64]          // 8-byte Folded Spill
	b	.LBB38_144
.LBB38_40:
	ldr	x8, [x21, #80]
	cmp	x8, x20
	b.le	.LBB38_55
// %bb.41:
	mov	x0, x21
	mov	x1, x20
	mov	x2, x19
	bl	punch_hole
	mov	w28, w0
.LBB38_42:
	cbnz	w28, .LBB38_63
.LBB38_43:
	mov	x0, x21
	bl	current_time
	stp	x0, x1, [x21, #120]
	stp	x0, x1, [x21, #104]
	mov	x0, x21
	mov	w1, wzr
	bl	f2fs_mark_inode_dirty_sync
	ldr	x8, [x21, #40]
	adrp	x9, jiffies
	mov	x25, xzr
	ldr	x8, [x8, #1104]
	ldr	x9, [x9, :lo12:jiffies]
	stp	x9, x9, [x8, #504]
	str	x9, [x8, #520]
	b	.LBB38_64
.LBB38_44:
	mov	w28, #-22
	orr	w8, w19, w20
	tst	x8, #0xfff
	b.ne	.LBB38_63
// %bb.45:
	ldr	x8, [x21, #80]
	add	x26, x19, x20
	cmp	x26, x8
	b.ge	.LBB38_63
// %bb.46:
	mov	x0, x21
	bl	f2fs_convert_inline_inode
	mov	w28, w0
	cbnz	w0, .LBB38_63
// %bb.47:
	ldr	x0, [x21, #48]
	mov	x1, x20
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w28, w0
	cbnz	w0, .LBB38_63
// %bb.48:
	ldr	x8, [x21, #40]
	mov	w1, #1
	ldr	x9, [x21, #80]
	asr	x28, x26, #12
	ldr	x25, [x8, #1104]
	add	x8, x9, #4095           // =4095
	lsr	x8, x8, #12
	mov	x0, x25
	stur	x8, [x29, #-88]         // 8-byte Folded Spill
	asr	x8, x20, #12
	stur	x8, [x29, #-80]         // 8-byte Folded Spill
	bl	f2fs_balance_fs
	add	x26, x21, #1016         // =1016
	mov	x0, x26
	bl	down_write
	add	x0, x21, #1064          // =1064
	stur	x0, [x29, #-72]         // 8-byte Folded Spill
	bl	down_write
	add	x27, x25, #368          // =368
	mov	x0, x27
	bl	_raw_spin_lock
	ldr	x8, [x25, #352]
	cbz	x8, .LBB38_50
// %bb.49:
	adrp	x9, jiffies
	ldr	x8, [x25, #360]
	ldr	x9, [x9, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB38_256
.LBB38_50:
	mov	x0, x27
	bl	_raw_spin_unlock
	add	x25, x25, #304          // =304
	mov	x0, x25
	bl	down_read
	mov	x0, x21
	bl	f2fs_drop_extent_tree
	mov	x0, x21
	mov	x1, x20
	bl	truncate_pagecache
	ldp	x8, x3, [x29, #-88]     // 16-byte Folded Reload
	mov	x0, x21
	mov	x1, x21
	mov	x2, x28
	mov	w5, #1
	sub	x4, x8, x28
	bl	__exchange_data_block
	mov	w28, w0
	mov	x0, x25
	bl	up_read
	ldur	x27, [x29, #-72]        // 8-byte Folded Reload
	mov	x0, x27
	bl	up_write
	mov	x0, x26
	bl	up_write
	cbnz	w28, .LBB38_63
// %bb.51:
	mov	x0, x27
	bl	down_write
	ldr	x0, [x21, #48]
	mov	x1, x20
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	x0, x21
	mov	x1, x20
	bl	truncate_pagecache
	ldr	x8, [x21, #40]
	ldr	x9, [x21, #80]
	ldr	x8, [x8, #1104]
	sub	x26, x9, x19
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB38_132
// %bb.52:
	ldr	w8, [x21, #1256]
	cbnz	w8, .LBB38_134
// %bb.53:
	ldr	x8, [x21, #712]
	tbnz	x8, #35, .LBB38_134
// %bb.54:
	ldr	x8, [x21, #712]
	mov	x25, x26
	tbnz	x8, #34, .LBB38_134
	b	.LBB38_135
.LBB38_55:
	mov	x25, xzr
	b	.LBB38_64
.LBB38_56:
	ldp	x8, x27, [x21, #40]
	add	x26, x19, x20
	mov	x0, x21
	ldr	x25, [x21, #80]
	mov	x1, x26
	ldr	x8, [x8, #1104]
	stur	x8, [x29, #-72]         // 8-byte Folded Spill
	bl	inode_newsize_ok
	mov	w28, w0
	cbnz	w0, .LBB38_63
// %bb.57:
	mov	x0, x21
	bl	f2fs_convert_inline_inode
	mov	w28, w0
	cbnz	w0, .LBB38_63
// %bb.58:
	sub	x2, x26, #1             // =1
	mov	x0, x27
	mov	x1, x20
	bl	filemap_write_and_wait_range
	mov	w28, w0
	cbnz	w0, .LBB38_63
// %bb.59:
	and	x2, x20, #0xfff
	and	x8, x26, #0xfff
	lsr	x1, x20, #12
	lsr	x9, x26, #12
	cmp	x1, x9
	stur	x9, [x29, #-80]         // 8-byte Folded Spill
	b.ne	.LBB38_96
// %bb.60:
	sub	x3, x8, x2
	mov	x0, x21
	bl	fill_zero
	mov	w28, w0
	cbnz	w0, .LBB38_63
// %bb.61:
	cmp	x25, x26
	csel	x25, x25, x26, gt
	stur	x25, [x29, #-96]        // 8-byte Folded Spill
	b	.LBB38_263
.LBB38_62:
	ldr	x8, [x21, #80]
	mov	x0, x21
	add	x26, x8, x19
	mov	x1, x26
	bl	inode_newsize_ok
	mov	w28, w0
	cbz	w0, .LBB38_74
.LBB38_63:
	sxtw	x25, w28
.LBB38_64:
	mov	x0, x24
	bl	up_write
	ldr	x8, [x23, #32]
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB38_66
// %bb.65:
	ldr	x0, [x8, #40]
	mov	w1, #1
	bl	__sb_end_write
.LBB38_66:
	adrp	x8, __tracepoint_f2fs_fallocate
	add	x8, x8, :lo12:__tracepoint_f2fs_fallocate
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB38_8
// %bb.67:
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
	tbz	w9, #0, .LBB38_8
// %bb.68:
	//APP
	mrs x23, sp_el0
	//NO_APP
	ldr	w9, [x23, #80]
	add	w9, w9, #1              // =1
	str	w9, [x23, #80]
	//APP
	//NO_APP
	ldr	x24, [x8, #32]
	cbz	x24, .LBB38_71
// %bb.69:
	ldr	x8, [x24], #24
.LBB38_70:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x24, #-16]
	mov	x1, x21
	mov	w2, w22
	mov	x3, x20
	mov	x4, x19
	mov	w5, w25
	blr	x8
	ldr	x8, [x24], #24
	cbnz	x8, .LBB38_70
.LBB38_71:
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB38_8
// %bb.72:
	ldr	x8, [x23]
	tbz	w8, #1, .LBB38_8
// %bb.73:
	bl	preempt_schedule_notrace
	b	.LBB38_8
.LBB38_74:
	mov	w28, #-22
	orr	w8, w19, w20
	tst	x8, #0xfff
	b.ne	.LBB38_63
// %bb.75:
	ldr	x8, [x21, #80]
	cmp	x8, x20
	b.le	.LBB38_63
// %bb.76:
	mov	x0, x21
	bl	f2fs_convert_inline_inode
	mov	w28, w0
	cbnz	w0, .LBB38_63
// %bb.77:
	mov	x0, x25
	mov	w1, #1
	str	x26, [sp, #96]          // 8-byte Folded Spill
	bl	f2fs_balance_fs
	add	x0, x21, #1064          // =1064
	str	x0, [sp, #104]          // 8-byte Folded Spill
	bl	down_write
	ldr	x8, [x21, #40]
	ldr	x26, [x21, #80]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB38_146
// %bb.78:
	ldr	w8, [x21, #1256]
	cbnz	w8, .LBB38_148
// %bb.79:
	ldr	x8, [x21, #712]
	tbnz	x8, #35, .LBB38_148
// %bb.80:
	ldr	x8, [x21, #712]
	mov	x27, x26
	tbnz	x8, #34, .LBB38_148
	b	.LBB38_149
.LBB38_81:
	mov	x25, #-5
	b	.LBB38_8
.LBB38_82:
	ldr	w26, [x24, #1192]
	ldr	w25, [x24, #1188]
	ldrsw	x28, [x24, #1284]
	ldr	w27, [x24, #1184]
	ldrsw	x16, [x24, #1272]
	ldrsw	x17, [x24, #1296]
	ldr	x8, [x24, #80]
	tbnz	w8, #3, .LBB38_2
// %bb.83:
	ldr	x11, [x24, #136]
	ldr	x8, [x11, #8]
	ldr	w9, [x11, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	b.eq	.LBB38_85
// %bb.84:
	udiv	w10, w9, w26
	b	.LBB38_86
.LBB38_85:
	mov	w10, #-1
.LBB38_86:
	cmp	w8, w10
	b.ne	.LBB38_91
// %bb.87:
	ldr	w12, [x24, #1284]
	mov	w15, #48
	ldr	w13, [x24, #1272]
	ldr	w18, [x24, #1272]
	ldr	x10, [x11, #24]
	ldr	x11, [x11]
	add	w12, w13, w12
	ldr	w14, [x10, #460]
	ldr	x11, [x11, #136]
	madd	x14, x14, x15, x11
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w13, w25, w14
	cmp	w13, w12
	b.lo	.LBB38_91
// %bb.88:
	ldr	w13, [x10, #580]
	mov	w14, #48
	madd	x13, x13, x14, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w25, w13
	cmp	w13, w12
	b.lo	.LBB38_91
// %bb.89:
	ldr	w13, [x10, #700]
	mov	w14, #48
	stur	w18, [x29, #-72]        // 4-byte Folded Spill
	madd	x13, x13, x14, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w25, w13
	cmp	w13, w12
	b.lo	.LBB38_91
// %bb.90:
	ldr	w12, [x10, #100]
	mov	w13, #48
	madd	x11, x12, x13, x11
	ldur	w12, [x29, #-72]        // 4-byte Folded Reload
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w11, w25, w11
	cmp	w11, w12
	b.hs	.LBB38_257
.LBB38_91:
	mul	w10, w25, w26
	cmn	w9, #1                  // =1
	sub	x10, x10, #1            // =1
	add	x11, x10, x28
	add	x12, x10, x16
	add	x13, x10, x17
	asr	x10, x11, x27
	asr	x11, x12, x27
	asr	x12, x13, x27
	udiv	w10, w10, w26
	udiv	w13, w11, w26
	udiv	w11, w12, w26
	lsl	w12, w13, #1
	b.eq	.LBB38_93
// %bb.92:
	ldr	w13, [x24, #1192]
	udiv	w9, w9, w13
.LBB38_93:
	add	w10, w12, w10
	add	w10, w10, w11
	add	w9, w10, w9
	cmp	w8, w9
	b.hi	.LBB38_2
// %bb.94:
	mov	x25, #-28
	b	.LBB38_8
.LBB38_95:
	mov	w28, wzr
	b	.LBB38_42
.LBB38_96:
	str	x8, [sp, #40]           // 8-byte Folded Spill
	cbz	x2, .LBB38_161
// %bb.97:
	mov	w8, #4096
	mov	x0, x21
	sub	x3, x8, x2
	mov	x27, x1
	bl	fill_zero
	mov	w28, w0
	cbnz	w0, .LBB38_63
// %bb.98:
	add	x27, x27, #1            // =1
	str	x26, [sp, #32]          // 8-byte Folded Spill
	lsl	x8, x27, #12
	cmp	x25, x8
	mov	x1, x27
	csel	x25, x25, x8, gt
	b	.LBB38_162
.LBB38_99:
	ldr	w10, [x25, #1188]
	add	x12, x25, #1664         // =1664
	ldr	w9, [x25, #1192]
	add	x13, x25, #1920         // =1920
	stur	wzr, [x29, #-72]        // 4-byte Folded Spill
	str	x12, [sp, #104]         // 8-byte Folded Spill
	udiv	w11, w8, w10
	stur	x13, [x29, #-80]        // 8-byte Folded Spill
	mul	w9, w10, w9
	add	x13, x25, #368          // =368
	add	w12, w8, w9
	msub	w8, w11, w10, w8
	add	x11, x25, #304          // =304
	sub	w12, w12, #1            // =1
	cmp	w8, #0                  // =0
	stur	w9, [x29, #-56]
	csel	w8, wzr, w10, eq
	stp	x11, x13, [x29, #-96]   // 16-byte Folded Spill
	udiv	w11, w12, w9
	add	x8, x8, x19
	mul	w27, w11, w9
	str	x8, [sp, #64]           // 8-byte Folded Spill
	//APP
	mrs x8, sp_el0
	//NO_APP
	str	x8, [sp, #96]           // 8-byte Folded Spill
.LBB38_100:                             // =>This Inner Loop Header: Depth=1
	ldr	x11, [x25, #136]
	mov	w15, #48
	ldr	w26, [x25, #1192]
	ldr	w8, [x11, #104]
	cmn	w8, #1                  // =1
	b.eq	.LBB38_102
// %bb.101:                             //   in Loop: Header=BB38_100 Depth=1
	udiv	w16, w8, w26
	b	.LBB38_103
.LBB38_102:                             //   in Loop: Header=BB38_100 Depth=1
	mov	w16, #-1
.LBB38_103:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	w3, [x25, #1188]
	ldrsw	x17, [x25, #1284]
	ldr	w28, [x25, #1184]
	ldrsw	x18, [x25, #1272]
	ldrsw	x0, [x25, #1296]
	ldr	x8, [x25, #80]
	tbnz	w8, #3, .LBB38_123
// %bb.104:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	x8, [x11, #8]
	ldr	w9, [x11, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	b.eq	.LBB38_106
// %bb.105:                             //   in Loop: Header=BB38_100 Depth=1
	udiv	w10, w9, w26
	b	.LBB38_107
.LBB38_106:                             //   in Loop: Header=BB38_100 Depth=1
	mov	w10, #-1
.LBB38_107:                             //   in Loop: Header=BB38_100 Depth=1
	add	w10, w10, w16
	cmp	w8, w10
	b.ne	.LBB38_112
// %bb.108:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	w12, [x25, #1284]
	ldr	w13, [x25, #1272]
	ldr	w2, [x25, #1272]
	ldr	x10, [x11, #24]
	ldr	x11, [x11]
	add	w12, w13, w12
	ldr	w14, [x10, #460]
	ldr	x11, [x11, #136]
	madd	x14, x14, x15, x11
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w13, w3, w14
	cmp	w13, w12
	b.lo	.LBB38_112
// %bb.109:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	w13, [x10, #580]
	madd	x13, x13, x15, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w3, w13
	cmp	w13, w12
	b.lo	.LBB38_112
// %bb.110:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	w13, [x10, #700]
	madd	x13, x13, x15, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w3, w13
	cmp	w13, w12
	b.lo	.LBB38_112
// %bb.111:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	w12, [x10, #100]
	str	w2, [sp, #56]           // 4-byte Folded Spill
	madd	x11, x12, x15, x11
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w11, w3, w11
	cmp	w11, w2
	b.hs	.LBB38_128
.LBB38_112:                             //   in Loop: Header=BB38_100 Depth=1
	mul	w10, w3, w26
	cmn	w9, #1                  // =1
	sub	x10, x10, #1            // =1
	add	x11, x10, x17
	add	x12, x10, x18
	add	x13, x10, x0
	asr	x10, x11, x28
	asr	x11, x12, x28
	asr	x12, x13, x28
	udiv	w10, w10, w26
	udiv	w13, w11, w26
	udiv	w11, w12, w26
	lsl	w12, w13, #1
	b.eq	.LBB38_114
// %bb.113:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	w13, [x25, #1192]
	udiv	w9, w9, w13
.LBB38_114:                             //   in Loop: Header=BB38_100 Depth=1
	add	w10, w10, w16
	add	w10, w10, w12
	add	w10, w10, w11
	add	w9, w10, w9
	cmp	w8, w9
	b.hi	.LBB38_123
// %bb.115:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	x0, [sp, #104]          // 8-byte Folded Reload
	bl	down_write
	ldr	w8, [x25, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB38_118
// %bb.116:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	x8, [x25, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB38_118
// %bb.117:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	x9, [sp, #96]           // 8-byte Folded Reload
	ldr	w8, [x9, #108]
	orr	w8, w8, #0x2000000
	str	w8, [x9, #108]
.LBB38_118:                             //   in Loop: Header=BB38_100 Depth=1
	mov	x0, x25
	mov	w1, #1
	mov	w2, wzr
	mov	w3, wzr
	mov	w4, #-1
	bl	f2fs_gc
	ldr	w8, [x25, #3024]
	mov	w28, w0
	cmp	w8, #2                  // =2
	b.ne	.LBB38_121
// %bb.119:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	x8, [x25, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB38_121
// %bb.120:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	x9, [sp, #96]           // 8-byte Folded Reload
	ldr	w8, [x9, #108]
	and	w8, w8, #0xfdffffff
	str	w8, [x9, #108]
.LBB38_121:                             //   in Loop: Header=BB38_100 Depth=1
	add	w8, w28, #61            // =61
	cmp	w8, #61                 // =61
	b.hi	.LBB38_246
// %bb.122:                             //   in Loop: Header=BB38_100 Depth=1
	mov	w9, #1
	lsl	x8, x9, x8
	mov	x9, #1
	movk	x9, #8196, lsl #48
	tst	x8, x9
	b.eq	.LBB38_246
.LBB38_123:                             //   in Loop: Header=BB38_100 Depth=1
	ldur	x0, [x29, #-80]         // 8-byte Folded Reload
	bl	down_write
	ldur	x0, [x29, #-88]         // 8-byte Folded Reload
	bl	_raw_spin_lock
	ldr	x8, [x25, #352]
	cbz	x8, .LBB38_125
// %bb.124:                             //   in Loop: Header=BB38_100 Depth=1
	adrp	x9, jiffies
	ldr	x8, [x25, #360]
	ldr	x9, [x9, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB38_127
.LBB38_125:                             //   in Loop: Header=BB38_100 Depth=1
	ldur	x0, [x29, #-88]         // 8-byte Folded Reload
	bl	_raw_spin_unlock
	ldur	x26, [x29, #-96]        // 8-byte Folded Reload
	mov	x0, x26
	bl	down_read
	mov	w28, #9
	mov	x0, x25
	mov	w1, w28
	mov	w2, wzr
	bl	f2fs_allocate_new_section
	mov	x0, x26
	bl	up_read
	sub	x1, x29, #64            // =64
	mov	x0, x21
	mov	w2, #1
	mov	w3, #4
	stur	w28, [x29, #-32]
	bl	f2fs_map_blocks
	mov	w28, w0
	ldur	x0, [x29, #-80]         // 8-byte Folded Reload
	bl	up_write
	ldp	w9, w8, [x29, #-60]
	ldur	w10, [x29, #-72]        // 4-byte Folded Reload
	add	w9, w9, w8
	add	w10, w8, w10
	stur	w9, [x29, #-60]
	stur	w10, [x29, #-72]        // 4-byte Folded Spill
	cbnz	w28, .LBB38_143
// %bb.126:                             //   in Loop: Header=BB38_100 Depth=1
	sub	w27, w27, w8
	cbnz	w27, .LBB38_100
	b	.LBB38_143
.LBB38_127:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	x0, [sp, #96]           // 8-byte Folded Reload
	mov	x1, xzr
	bl	show_stack
	adrp	x8, jiffies
	ldr	x1, [x25, #360]
	adrp	x0, .L.str.31
	add	x0, x0, :lo12:.L.str.31
	ldr	x2, [x8, :lo12:jiffies]
	bl	printk
	ldr	x0, [x25, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB38_125
.LBB38_128:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	w8, [x25, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB38_123
// %bb.129:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	x8, [x25, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB38_123
// %bb.130:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	w1, [x10, #820]
	stp	x0, x18, [sp, #24]      // 16-byte Folded Spill
	mov	x0, x25
	str	w3, [sp, #20]           // 4-byte Folded Spill
	str	w16, [sp, #48]          // 4-byte Folded Spill
	str	x1, [sp, #8]            // 8-byte Folded Spill
                                        // kill: def $w1 killed $w1 killed $x1
	str	x17, [sp, #40]          // 8-byte Folded Spill
	bl	f2fs_usable_blks_in_seg
	ldr	x9, [x25, #136]
	mov	w10, #48
	ldr	x11, [sp, #8]           // 8-byte Folded Reload
	ldr	w3, [sp, #20]           // 4-byte Folded Reload
	ldp	x18, x17, [sp, #32]     // 16-byte Folded Reload
	ldr	w16, [sp, #48]          // 4-byte Folded Reload
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x11, x10, x8
	ldr	w10, [sp, #56]          // 4-byte Folded Reload
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	ldr	x0, [sp, #24]           // 8-byte Folded Reload
	cmp	w8, w10
	b.hs	.LBB38_123
// %bb.131:                             //   in Loop: Header=BB38_100 Depth=1
	ldr	x8, [x9, #8]
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB38_112
.LBB38_132:
	ldrh	w8, [x21]
	mov	x25, x26
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB38_135
// %bb.133:
	ldr	x8, [x21, #712]
	mov	x25, x26
	tbz	w8, #31, .LBB38_135
.LBB38_134:
	ldr	w8, [x21, #1268]
	sub	x9, x26, #1             // =1
	lsl	w8, w8, #12
	sub	w8, w8, #1              // =1
	orr	x8, x9, x8
	add	x25, x8, #1             // =1
.LBB38_135:
	mov	x0, x21
	mov	x1, x25
	mov	w2, #1
	bl	f2fs_do_truncate_blocks
	mov	w28, w0
	cmp	x25, x26
	b.eq	.LBB38_138
// %bb.136:
	cbnz	w28, .LBB38_138
// %bb.137:
	mov	x0, x21
	mov	x1, x26
	mov	w2, #1
	bl	f2fs_truncate_partial_cluster
	mov	w28, w0
.LBB38_138:
	mov	x0, x27
	bl	up_write
	cbnz	w28, .LBB38_63
// %bb.139:
	ldr	x27, [x21, #712]
	ldr	x25, [x21, #712]
	ldr	x8, [x21, #80]
	cmp	x8, x26
	b.eq	.LBB38_43
// %bb.140:
	mov	x0, x21
	mov	w1, #1
	str	x26, [x21, #80]
	bl	f2fs_mark_inode_dirty_sync
	tbz	w27, #1, .LBB38_142
// %bb.141:
	tbz	w25, #2, .LBB38_43
.LBB38_142:
	add	x8, x21, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB38_43
.LBB38_143:
	ldur	w9, [x29, #-72]         // 4-byte Folded Reload
	stur	w9, [x29, #-56]
.LBB38_144:
	cbnz	w28, .LBB38_247
// %bb.145:
	ldr	x9, [sp, #72]           // 8-byte Folded Reload
	b	.LBB38_251
.LBB38_146:
	ldrh	w8, [x21]
	mov	x27, x26
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB38_149
// %bb.147:
	ldr	x8, [x21, #712]
	mov	x27, x26
	tbz	w8, #31, .LBB38_149
.LBB38_148:
	ldr	w8, [x21, #1268]
	sub	x9, x26, #1             // =1
	lsl	w8, w8, #12
	sub	w8, w8, #1              // =1
	orr	x8, x9, x8
	add	x27, x8, #1             // =1
.LBB38_149:
	mov	x0, x21
	mov	x1, x27
	mov	w2, #1
	bl	f2fs_do_truncate_blocks
	mov	w28, w0
	cmp	x27, x26
	b.eq	.LBB38_152
// %bb.150:
	cbnz	w28, .LBB38_152
// %bb.151:
	mov	x0, x21
	mov	x1, x26
	mov	w2, #1
	bl	f2fs_truncate_partial_cluster
	mov	w28, w0
.LBB38_152:
	ldr	x0, [sp, #104]          // 8-byte Folded Reload
	bl	up_write
	cbnz	w28, .LBB38_63
// %bb.153:
	ldr	x0, [x21, #48]
	mov	x1, x20
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	w28, w0
	cbnz	w0, .LBB38_63
// %bb.154:
	ldr	x8, [x21, #80]
	add	x0, x21, #1016          // =1016
	asr	x26, x20, #12
	str	x0, [sp, #88]           // 8-byte Folded Spill
	add	x8, x8, #4095           // =4095
	lsr	x27, x8, #12
	bl	down_write
	ldr	x0, [sp, #104]          // 8-byte Folded Reload
	bl	down_write
	mov	x0, x21
	mov	x1, x20
	bl	truncate_pagecache
	cmp	x27, x26
	stur	x26, [x29, #-72]        // 8-byte Folded Spill
	b.ls	.LBB38_269
// %bb.155:
	add	x9, x25, #368           // =368
	add	x8, x19, x20
	asr	x8, x8, #12
	stur	x9, [x29, #-80]         // 8-byte Folded Spill
	ldur	x9, [x29, #-72]         // 8-byte Folded Reload
	sub	x8, x8, x9
	stur	x8, [x29, #-88]         // 8-byte Folded Spill
	add	x8, x25, #304           // =304
	stur	x8, [x29, #-96]         // 8-byte Folded Spill
	//APP
	mrs x8, sp_el0
	//NO_APP
	str	x8, [sp, #80]           // 8-byte Folded Spill
.LBB38_156:                             // =>This Inner Loop Header: Depth=1
	ldp	x0, x8, [x29, #-80]     // 16-byte Folded Reload
	ldur	x9, [x29, #-88]         // 8-byte Folded Reload
	sub	x8, x27, x8
	cmp	x8, x9
	csel	x28, x9, x8, hi
	sub	x27, x27, x28
	bl	_raw_spin_lock
	ldr	x8, [x25, #352]
	cbz	x8, .LBB38_158
// %bb.157:                             //   in Loop: Header=BB38_156 Depth=1
	adrp	x9, jiffies
	ldr	x8, [x25, #360]
	ldr	x9, [x9, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB38_160
.LBB38_158:                             //   in Loop: Header=BB38_156 Depth=1
	ldur	x0, [x29, #-80]         // 8-byte Folded Reload
	bl	_raw_spin_unlock
	ldur	x26, [x29, #-96]        // 8-byte Folded Reload
	mov	x0, x26
	bl	down_read
	mov	x0, x21
	bl	f2fs_drop_extent_tree
	ldur	x8, [x29, #-88]         // 8-byte Folded Reload
	mov	x0, x21
	mov	x1, x21
	mov	x2, x27
	mov	x4, x28
	mov	w5, wzr
	add	x3, x27, x8
	bl	__exchange_data_block
	mov	w28, w0
	mov	x0, x26
	bl	up_read
	ldur	x8, [x29, #-72]         // 8-byte Folded Reload
	cmp	w28, #0                 // =0
	cset	w26, ne
	cmp	x27, x8
	b.ls	.LBB38_270
// %bb.159:                             //   in Loop: Header=BB38_156 Depth=1
	cbz	w28, .LBB38_156
	b	.LBB38_270
.LBB38_160:                             //   in Loop: Header=BB38_156 Depth=1
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	mov	x1, xzr
	bl	show_stack
	adrp	x8, jiffies
	ldr	x1, [x25, #360]
	adrp	x0, .L.str.31
	add	x0, x0, :lo12:.L.str.31
	ldr	x2, [x8, :lo12:jiffies]
	bl	printk
	ldr	x0, [x25, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB38_158
.LBB38_161:
	str	x26, [sp, #32]          // 8-byte Folded Spill
.LBB38_162:
	ldur	x8, [x29, #-80]         // 8-byte Folded Reload
	stur	x25, [x29, #-96]        // 8-byte Folded Spill
	cmp	x1, x8
	b.hs	.LBB38_243
// %bb.163:
	ldr	x8, [sp, #32]           // 8-byte Folded Reload
	add	x26, x21, #1016         // =1016
	ldur	x27, [x29, #-72]        // 8-byte Folded Reload
	add	x9, x21, #1064          // =1064
	mov	x28, x1
	and	x8, x8, #0xfffffffffffff000
	str	x9, [sp, #96]           // 8-byte Folded Spill
	sub	x8, x8, #1              // =1
	add	x9, x27, #304           // =304
	str	x8, [sp, #64]           // 8-byte Folded Spill
	add	x8, x27, #368           // =368
	stp	x26, x8, [sp, #48]      // 16-byte Folded Spill
	sub	x8, x29, #64            // =64
	add	x8, x8, #8              // =8
	stp	x8, x9, [sp, #80]       // 16-byte Folded Spill
	//APP
	mrs x8, sp_el0
	//NO_APP
	str	x8, [sp, #24]           // 8-byte Folded Spill
.LBB38_164:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB38_184 Depth 2
                                        //     Child Loop BB38_180 Depth 2
                                        //     Child Loop BB38_204 Depth 2
                                        //     Child Loop BB38_189 Depth 2
	mov	x0, x26
	bl	down_write
	ldr	x0, [sp, #96]           // 8-byte Folded Reload
	bl	down_write
	ldr	x2, [sp, #64]           // 8-byte Folded Reload
	mov	x0, x21
	lsl	x1, x28, #12
	bl	truncate_pagecache_range
	ldr	x25, [sp, #56]          // 8-byte Folded Reload
	mov	x0, x25
	bl	_raw_spin_lock
	ldr	x8, [x27, #352]
	cbz	x8, .LBB38_166
// %bb.165:                             //   in Loop: Header=BB38_164 Depth=1
	adrp	x9, jiffies
	ldr	x8, [x27, #360]
	ldr	x9, [x9, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB38_239
.LBB38_166:                             //   in Loop: Header=BB38_164 Depth=1
	mov	x0, x25
	bl	_raw_spin_unlock
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	bl	down_read
	sub	x0, x29, #64            // =64
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	sub	x0, x29, #64            // =64
	mov	x1, x28
	mov	w2, wzr
	stur	x21, [x29, #-64]
	stur	x28, [x29, #-88]        // 8-byte Folded Spill
	stp	xzr, xzr, [x8]
	str	wzr, [x8, #16]
	bl	f2fs_get_dnode_of_data
	cbnz	w0, .LBB38_262
// %bb.167:                             //   in Loop: Header=BB38_164 Depth=1
	ldur	x8, [x29, #-48]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w10, [x8, #4076]
	cmp	w9, w10
	b.ne	.LBB38_171
// %bb.168:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	w11, [x21, #1160]
	ldr	w12, [x21, #1168]
	ldrh	w13, [x21]
	ldur	x15, [x29, #-88]        // 8-byte Folded Reload
	add	w11, w12, w11, asr #2
	mov	w12, #923
	sub	w12, w12, w11
	and	w11, w13, #0xf000
	cmp	w11, #8, lsl #12        // =32768
	b.ne	.LBB38_174
// %bb.169:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x11, [x21, #712]
	tbz	w11, #31, .LBB38_174
// %bb.170:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	w11, [x21, #1268]
	neg	w11, w11
	and	w12, w12, w11
	b	.LBB38_174
.LBB38_171:                             //   in Loop: Header=BB38_164 Depth=1
	ldrh	w11, [x21]
	mov	w12, #1018
	ldur	x15, [x29, #-88]        // 8-byte Folded Reload
	and	w11, w11, #0xf000
	cmp	w11, #8, lsl #12        // =32768
	b.ne	.LBB38_174
// %bb.172:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x11, [x21, #712]
	mov	w12, #1018
	tbz	w11, #31, .LBB38_174
// %bb.173:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	w11, [x21, #1268]
	mov	w12, #1018
	neg	w11, w11
	and	w12, w11, w12
.LBB38_174:                             //   in Loop: Header=BB38_164 Depth=1
	ldur	w26, [x29, #-36]
	ldur	x11, [x29, #-64]
	sub	w12, w12, w26
	ldr	x13, [x11, #40]
	add	x14, x15, x12
	ldur	x12, [x29, #-80]        // 8-byte Folded Reload
	str	x14, [sp, #72]          // 8-byte Folded Spill
	ldr	x13, [x13, #1104]
	cmp	x12, x14
	csel	x25, x12, x14, lo
	cmp	x15, x25
	str	x13, [sp, #104]         // 8-byte Folded Spill
	b.hs	.LBB38_182
// %bb.175:                             //   in Loop: Header=BB38_164 Depth=1
	add	x12, x8, #360           // =360
	cmp	w9, w10
	csel	x9, x12, x8, eq
	mov	x1, xzr
	b.ne	.LBB38_183
// %bb.176:                             //   in Loop: Header=BB38_164 Depth=1
	cbz	x11, .LBB38_201
// %bb.177:                             //   in Loop: Header=BB38_164 Depth=1
	mov	w8, w26
	mov	x10, x15
	b	.LBB38_180
.LBB38_178:                             //   in Loop: Header=BB38_180 Depth=2
	ldr	w12, [x11, #1160]
	asr	w12, w12, #2
.LBB38_179:                             //   in Loop: Header=BB38_180 Depth=2
	add	w12, w8, w12
	add	w8, w8, #1              // =1
	add	x10, x10, #1            // =1
	ldr	w12, [x9, w12, uxtw #2]
	stur	w8, [x29, #-36]
	cmp	w12, #0                 // =0
	cinc	x1, x1, eq
	cmp	x10, x25
	b.eq	.LBB38_185
.LBB38_180:                             //   Parent Loop BB38_164 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x12, [x11, #712]
	tbnz	w12, #26, .LBB38_178
// %bb.181:                             //   in Loop: Header=BB38_180 Depth=2
	mov	w12, wzr
	b	.LBB38_179
.LBB38_182:                             //   in Loop: Header=BB38_164 Depth=1
	mov	x1, xzr
	b	.LBB38_185
.LBB38_183:                             //   in Loop: Header=BB38_164 Depth=1
	mov	w8, w26
	mov	x10, x15
.LBB38_184:                             //   Parent Loop BB38_164 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	w11, [x9, w8, uxtw #2]
	add	w8, w8, #1              // =1
	add	x10, x10, #1            // =1
	stur	w8, [x29, #-36]
	cmp	w11, #0                 // =0
	cinc	x1, x1, eq
	cmp	x10, x25
	b.ne	.LBB38_184
.LBB38_185:                             //   in Loop: Header=BB38_164 Depth=1
	sub	x0, x29, #64            // =64
	stur	w26, [x29, #-36]
	bl	f2fs_reserve_new_blocks
	mov	w28, w0
	cbnz	w0, .LBB38_208
// %bb.186:                             //   in Loop: Header=BB38_164 Depth=1
	ldur	x27, [x29, #-88]        // 8-byte Folded Reload
	stur	w26, [x29, #-36]
	cmp	x27, x25
	b.hs	.LBB38_199
// %bb.187:                             //   in Loop: Header=BB38_164 Depth=1
	mov	w28, #-1
	b	.LBB38_189
.LBB38_188:                             //   in Loop: Header=BB38_189 Depth=2
	add	w26, w26, #1            // =1
	add	x27, x27, #1            // =1
	cmp	x27, x25
	stur	w26, [x29, #-36]
	b.eq	.LBB38_206
.LBB38_189:                             //   Parent Loop BB38_164 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	x8, [x29, #-48]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w10, [x8, #4076]
	cmp	w9, w10
	b.ne	.LBB38_194
// %bb.190:                             //   in Loop: Header=BB38_189 Depth=2
	ldur	x11, [x29, #-64]
	cbz	x11, .LBB38_193
// %bb.191:                             //   in Loop: Header=BB38_189 Depth=2
	ldr	x12, [x11, #712]
	tbz	w12, #26, .LBB38_194
// %bb.192:                             //   in Loop: Header=BB38_189 Depth=2
	ldr	w11, [x11, #1160]
	asr	w11, w11, #2
	b	.LBB38_195
.LBB38_193:                             //   in Loop: Header=BB38_189 Depth=2
	ldrb	w11, [x8, #3]
	tbnz	w11, #5, .LBB38_198
.LBB38_194:                             //   in Loop: Header=BB38_189 Depth=2
	mov	w11, wzr
.LBB38_195:                             //   in Loop: Header=BB38_189 Depth=2
	add	x12, x8, #360           // =360
	cmp	w9, w10
	csel	x8, x12, x8, eq
	add	w9, w11, w26
	ldr	w1, [x8, w9, uxtw #2]
	cmn	w1, #1                  // =1
	stur	w1, [x29, #-28]
	b.eq	.LBB38_188
// %bb.196:                             //   in Loop: Header=BB38_189 Depth=2
	cbz	w1, .LBB38_200
// %bb.197:                             //   in Loop: Header=BB38_189 Depth=2
	ldr	x0, [sp, #104]          // 8-byte Folded Reload
	bl	f2fs_invalidate_blocks
	sub	x0, x29, #64            // =64
	stur	w28, [x29, #-28]
	bl	f2fs_set_data_blkaddr
	ldur	w26, [x29, #-36]
	b	.LBB38_188
.LBB38_198:                             //   in Loop: Header=BB38_189 Depth=2
	ldrh	w11, [x8, #360]
	lsr	w11, w11, #2
	b	.LBB38_195
.LBB38_199:                             //   in Loop: Header=BB38_164 Depth=1
	mov	w28, wzr
	b	.LBB38_207
.LBB38_200:                             //   in Loop: Header=BB38_164 Depth=1
	mov	w8, #-28
	mov	w28, w8
	b	.LBB38_207
.LBB38_201:                             //   in Loop: Header=BB38_164 Depth=1
	mov	w10, w26
	mov	x11, x15
	b	.LBB38_204
.LBB38_202:                             //   in Loop: Header=BB38_204 Depth=2
	ldrh	w12, [x8, #360]
	lsr	w12, w12, #2
.LBB38_203:                             //   in Loop: Header=BB38_204 Depth=2
	add	w12, w10, w12
	add	w10, w10, #1            // =1
	add	x11, x11, #1            // =1
	ldr	w12, [x9, w12, uxtw #2]
	stur	w10, [x29, #-36]
	cmp	w12, #0                 // =0
	cinc	x1, x1, eq
	cmp	x11, x25
	b.eq	.LBB38_185
.LBB38_204:                             //   Parent Loop BB38_164 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldrb	w12, [x8, #3]
	tbnz	w12, #5, .LBB38_202
// %bb.205:                             //   in Loop: Header=BB38_204 Depth=2
	mov	w12, wzr
	b	.LBB38_203
.LBB38_206:                             //   in Loop: Header=BB38_164 Depth=1
	mov	w28, wzr
	mov	x27, x25
.LBB38_207:                             //   in Loop: Header=BB38_164 Depth=1
	ldur	x1, [x29, #-88]         // 8-byte Folded Reload
	sub	x0, x29, #64            // =64
	mov	w2, wzr
	sub	w3, w27, w1
	bl	f2fs_update_extent_cache_range
	ldur	x27, [x29, #-72]        // 8-byte Folded Reload
.LBB38_208:                             //   in Loop: Header=BB38_164 Depth=1
	ldur	x26, [x29, #-48]
	cbz	x26, .LBB38_233
// %bb.209:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x8, [x26, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x26, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x26, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB38_225
// %bb.210:                             //   in Loop: Header=BB38_164 Depth=1
	tbnz	w8, #0, .LBB38_224
// %bb.211:                             //   in Loop: Header=BB38_164 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB38_214
// %bb.212:                             //   in Loop: Header=BB38_164 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB38_214
// %bb.213:                             //   in Loop: Header=BB38_164 Depth=1
	adrp	x27, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x27, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x27, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB38_214:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB38_216
// %bb.215:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB38_240
.LBB38_216:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x0, [x26, #24]
.LBB38_217:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB38_219
// %bb.218:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB38_241
.LBB38_219:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x0, [x26, #24]
.LBB38_220:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB38_222
// %bb.221:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB38_242
.LBB38_222:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x0, [x26, #24]
.LBB38_223:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	ldur	x27, [x29, #-72]        // 8-byte Folded Reload
.LBB38_224:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB38_231
	b	.LBB38_276
.LBB38_225:                             //   in Loop: Header=BB38_164 Depth=1
	tbnz	w8, #0, .LBB38_230
// %bb.226:                             //   in Loop: Header=BB38_164 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB38_229
// %bb.227:                             //   in Loop: Header=BB38_164 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB38_229
// %bb.228:                             //   in Loop: Header=BB38_164 Depth=1
	adrp	x27, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x27, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x27, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB38_229:                             //   in Loop: Header=BB38_164 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
	ldur	x27, [x29, #-72]        // 8-byte Folded Reload
.LBB38_230:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB38_277
.LBB38_231:                             //   in Loop: Header=BB38_164 Depth=1
	mov	x0, x26
	bl	unlock_page
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x26, x9, eq
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
	cbnz	w9, .LBB38_233
// %bb.232:                             //   in Loop: Header=BB38_164 Depth=1
	bl	__put_page
.LBB38_233:                             //   in Loop: Header=BB38_164 Depth=1
	ldur	x8, [x29, #-56]
	cbz	x8, .LBB38_237
// %bb.234:                             //   in Loop: Header=BB38_164 Depth=1
	ldur	x9, [x29, #-48]
	cmp	x9, x8
	b.eq	.LBB38_237
// %bb.235:                             //   in Loop: Header=BB38_164 Depth=1
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
	cbnz	w9, .LBB38_237
// %bb.236:                             //   in Loop: Header=BB38_164 Depth=1
	bl	__put_page
.LBB38_237:                             //   in Loop: Header=BB38_164 Depth=1
	ldp	x8, x0, [sp, #80]       // 16-byte Folded Reload
	stp	xzr, xzr, [x8]
	bl	up_read
	ldr	x0, [sp, #96]           // 8-byte Folded Reload
	bl	up_write
	ldr	x26, [sp, #48]          // 8-byte Folded Reload
	mov	x0, x26
	bl	up_write
	ldurb	w1, [x29, #-31]
	mov	x0, x27
	bl	f2fs_balance_fs
	cbnz	w28, .LBB38_263
// %bb.238:                             //   in Loop: Header=BB38_164 Depth=1
	ldur	x9, [x29, #-96]         // 8-byte Folded Reload
	lsl	x8, x25, #12
	mov	x28, x25
	cmp	x9, x8
	csel	x9, x9, x8, gt
	ldur	x8, [x29, #-80]         // 8-byte Folded Reload
	stur	x9, [x29, #-96]         // 8-byte Folded Spill
	ldr	x9, [sp, #72]           // 8-byte Folded Reload
	cmp	x8, x9
	b.hi	.LBB38_164
	b	.LBB38_243
.LBB38_239:                             //   in Loop: Header=BB38_164 Depth=1
	ldr	x0, [sp, #24]           // 8-byte Folded Reload
	mov	x1, xzr
	bl	show_stack
	adrp	x8, jiffies
	ldr	x1, [x27, #360]
	adrp	x0, .L.str.31
	add	x0, x0, :lo12:.L.str.31
	ldr	x2, [x8, :lo12:jiffies]
	bl	printk
	ldr	x0, [x27, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB38_166
.LBB38_240:                             //   in Loop: Header=BB38_164 Depth=1
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB38_217
.LBB38_241:                             //   in Loop: Header=BB38_164 Depth=1
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB38_220
.LBB38_242:                             //   in Loop: Header=BB38_164 Depth=1
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB38_223
.LBB38_243:
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	cbz	x8, .LBB38_261
// %bb.244:
	ldur	x1, [x29, #-80]         // 8-byte Folded Reload
	mov	x0, x21
	ldr	x3, [sp, #40]           // 8-byte Folded Reload
	mov	x2, xzr
	bl	fill_zero
	mov	w28, w0
	cbnz	w0, .LBB38_263
// %bb.245:
	ldur	x8, [x29, #-96]         // 8-byte Folded Reload
	ldr	x9, [sp, #32]           // 8-byte Folded Reload
	cmp	x8, x9
	csel	x8, x8, x9, gt
	stur	x8, [x29, #-96]         // 8-byte Folded Spill
	b	.LBB38_263
.LBB38_246:
	ldur	w9, [x29, #-72]         // 4-byte Folded Reload
.LBB38_247:
	cbz	w9, .LBB38_42
// %bb.248:
	ldp	x8, x10, [sp, #80]      // 16-byte Folded Reload
	add	x8, x8, w9, uxtw
	sub	x9, x8, #1              // =1
	cmp	x9, x10
	b.ne	.LBB38_250
// %bb.249:
	ldr	x8, [sp, #64]           // 8-byte Folded Reload
	add	x9, x8, x20
	b	.LBB38_251
.LBB38_250:
	lsl	x9, x8, #12
.LBB38_251:
	ldr	x8, [x21, #80]
	cmp	x9, x8
	b.le	.LBB38_42
// %bb.252:
	tbnz	w22, #0, .LBB38_268
// %bb.253:
	ldr	x26, [x21, #712]
	mov	x0, x21
	ldr	x25, [x21, #712]
	mov	w1, #1
	str	x9, [x21, #80]
	bl	f2fs_mark_inode_dirty_sync
	tbz	w26, #1, .LBB38_255
// %bb.254:
	tbz	w25, #2, .LBB38_42
.LBB38_255:
	add	x8, x21, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB38_42
.LBB38_256:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	adrp	x8, jiffies
	ldr	x1, [x25, #360]
	adrp	x0, .L.str.31
	add	x0, x0, :lo12:.L.str.31
	ldr	x2, [x8, :lo12:jiffies]
	bl	printk
	ldr	x0, [x25, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB38_50
.LBB38_257:
	ldr	w8, [x24, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB38_2
// %bb.258:
	ldr	x8, [x24, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB38_2
// %bb.259:
	ldr	w1, [x10, #820]
	mov	x0, x24
	stur	x16, [x29, #-80]        // 8-byte Folded Spill
	stp	x1, x17, [x29, #-96]    // 16-byte Folded Spill
                                        // kill: def $w1 killed $w1 killed $x1
	bl	f2fs_usable_blks_in_seg
	ldr	x9, [x24, #136]
	mov	w10, #48
	ldur	x11, [x29, #-96]        // 8-byte Folded Reload
	ldp	x17, x16, [x29, #-88]   // 16-byte Folded Reload
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x11, x10, x8
	ldur	w10, [x29, #-72]        // 4-byte Folded Reload
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w10
	b.hs	.LBB38_2
// %bb.260:
	ldr	x8, [x9, #8]
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB38_91
.LBB38_261:
	mov	w28, wzr
	b	.LBB38_263
.LBB38_262:
	mov	w28, w0
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	bl	up_read
	ldr	x0, [sp, #96]           // 8-byte Folded Reload
	bl	up_write
	mov	x0, x26
	bl	up_write
.LBB38_263:
	ldr	x8, [x21, #80]
	ldur	x9, [x29, #-96]         // 8-byte Folded Reload
	cmp	x9, x8
	b.le	.LBB38_42
// %bb.264:
	tbnz	w22, #0, .LBB38_268
// %bb.265:
	ldr	x26, [x21, #712]
	mov	x0, x21
	ldr	x25, [x21, #712]
	mov	w1, #1
	ldur	x8, [x29, #-96]         // 8-byte Folded Reload
	str	x8, [x21, #80]
	bl	f2fs_mark_inode_dirty_sync
	tbz	w26, #1, .LBB38_267
// %bb.266:
	tbz	w25, #2, .LBB38_42
.LBB38_267:
	add	x8, x21, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB38_42
.LBB38_268:
	ldrb	w8, [x21, #688]
	mov	x0, x21
	mov	w1, #1
	orr	w8, w8, #0x10
	strb	w8, [x21, #688]
	bl	f2fs_mark_inode_dirty_sync
	b	.LBB38_42
.LBB38_269:
	mov	w28, wzr
	mov	w26, wzr
.LBB38_270:
	ldr	x25, [sp, #104]         // 8-byte Folded Reload
	mov	x0, x25
	bl	up_write
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	bl	up_write
	mov	x0, x25
	bl	down_write
	ldr	x0, [x21, #48]
	mov	x1, x20
	mov	x2, #9223372036854775807
	bl	filemap_write_and_wait_range
	mov	x0, x21
	mov	x1, x20
	bl	truncate_pagecache
	mov	x0, x25
	bl	up_write
	tbnz	w26, #0, .LBB38_42
// %bb.271:
	ldr	x26, [x21, #712]
	ldr	x25, [x21, #712]
	ldr	x8, [x21, #80]
	ldr	x9, [sp, #96]           // 8-byte Folded Reload
	cmp	x8, x9
	b.eq	.LBB38_43
// %bb.272:
	ldr	x8, [sp, #96]           // 8-byte Folded Reload
	mov	x0, x21
	mov	w1, #1
	str	x8, [x21, #80]
	bl	f2fs_mark_inode_dirty_sync
	tbz	w26, #1, .LBB38_274
// %bb.273:
	tbz	w25, #2, .LBB38_43
.LBB38_274:
	add	x8, x21, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB38_43
.LBB38_275:
	bl	__stack_chk_fail
.LBB38_276:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB38_277:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end38:
	.size	f2fs_fallocate, .Lfunc_end38-f2fs_fallocate
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_dedup_imonitor_send
	.type	f2fs_dedup_imonitor_send,@function
f2fs_dedup_imonitor_send:               // @f2fs_dedup_imonitor_send
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	mov	x24, x0
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	x21, x3
	ldr	x8, [x0, #40]
	mov	w0, #42677
	movk	w0, #15148, lsl #16
	str	x25, [sp, #16]          // 8-byte Folded Spill
	mov	x22, x2
	mov	w23, w1
	ldr	x19, [x8, #1104]
	bl	hiview_hievent_create
	cbz	x0, .LBB39_5
// %bb.1:
	ldr	x8, [x24, #80]
	adrp	x1, .L.str.22
	ldr	x2, [x24, #64]
	add	x1, x1, :lo12:.L.str.22
	mov	w9, #2147483647
	mov	x20, x0
	asr	x8, x8, #10
	cmp	x8, x9
	csel	x24, x8, x9, lo
	bl	hiview_hievent_put_integral
	adrp	x1, .L.str.23
	mov	w25, w0
	mov	w2, w23
	add	x1, x1, :lo12:.L.str.23
	mov	x0, x20
	bl	hiview_hievent_put_integral
	adrp	x1, .L.str.24
	orr	w23, w0, w25
	add	x1, x1, :lo12:.L.str.24
	mov	x0, x20
	mov	x2, x24
	bl	hiview_hievent_put_integral
	adrp	x1, .L.str.25
	orr	w23, w23, w0
	add	x1, x1, :lo12:.L.str.25
	mov	x0, x20
	mov	x2, x22
	bl	hiview_hievent_put_string
	adrp	x1, .L.str.26
	orr	w22, w23, w0
	add	x1, x1, :lo12:.L.str.26
	mov	x0, x20
	mov	x2, x21
	bl	hiview_hievent_put_string
	orr	w3, w22, w0
	cbnz	w3, .LBB39_3
// %bb.2:
	mov	x0, x20
	bl	hiview_hievent_report
	mov	w3, w0
	cbz	w0, .LBB39_4
.LBB39_3:
	adrp	x1, .L.str.27
	adrp	x2, .L__func__.f2fs_dedup_imonitor_send
	add	x1, x1, :lo12:.L.str.27
	add	x2, x2, :lo12:.L__func__.f2fs_dedup_imonitor_send
	mov	x0, x19
	bl	f2fs_printk
.LBB39_4:
	mov	x0, x20
	bl	hiview_hievent_destroy
	b	.LBB39_6
.LBB39_5:
	adrp	x1, .L.str.21
	adrp	x2, .L__func__.f2fs_dedup_imonitor_send
	add	x1, x1, :lo12:.L.str.21
	add	x2, x2, :lo12:.L__func__.f2fs_dedup_imonitor_send
	mov	x0, x19
	bl	f2fs_printk
.LBB39_6:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.Lfunc_end39:
	.size	f2fs_dedup_imonitor_send, .Lfunc_end39-f2fs_dedup_imonitor_send
                                        // -- End function
	.p2align	3               // -- Begin function reserve_compress_blocks
	.type	reserve_compress_blocks,@function
reserve_compress_blocks:                // @reserve_compress_blocks
// %bb.0:
	sub	sp, sp, #144            // =144
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	stp	x28, x27, [sp, #64]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #80]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #96]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	cbz	x1, .LBB40_113
// %bb.1:
	ldr	x12, [x0]
	mov	x28, x1
	mov	x21, x0
	mov	w19, wzr
	mov	w20, #-117
	ldr	x8, [x12, #40]
	ldrsw	x27, [x12, #1268]
	ldr	x22, [x8, #1104]
.LBB40_2:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB40_15 Depth 2
	ldr	x8, [x21, #16]
	ldr	w9, [x21, #28]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	add	w9, w9, w19
	ldr	w10, [x8, #4072]
	ldr	w11, [x8, #4076]
	cmp	w10, w11
	b.ne	.LBB40_7
// %bb.3:                               //   in Loop: Header=BB40_2 Depth=1
	cbz	x12, .LBB40_6
// %bb.4:                               //   in Loop: Header=BB40_2 Depth=1
	ldr	x13, [x12, #712]
	tbz	w13, #26, .LBB40_7
// %bb.5:                               //   in Loop: Header=BB40_2 Depth=1
	ldr	w12, [x12, #1160]
	asr	w12, w12, #2
	b	.LBB40_8
.LBB40_6:                               //   in Loop: Header=BB40_2 Depth=1
	ldrb	w12, [x8, #3]
	tbnz	w12, #5, .LBB40_20
.LBB40_7:                               //   in Loop: Header=BB40_2 Depth=1
	mov	w12, wzr
.LBB40_8:                               //   in Loop: Header=BB40_2 Depth=1
	add	x13, x8, #360           // =360
	cmp	w10, w11
	csel	x8, x13, x8, eq
	add	w9, w9, w12
	ldr	w1, [x8, w9, uxtw #2]
	add	w8, w1, #3              // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB40_11
.LBB40_9:                               //   in Loop: Header=BB40_2 Depth=1
	add	w19, w19, #1            // =1
	sxtw	x8, w19
	cmp	x8, x28
	b.hs	.LBB40_21
// %bb.10:                              //   in Loop: Header=BB40_2 Depth=1
	ldr	x12, [x21]
	b	.LBB40_2
.LBB40_11:                              //   in Loop: Header=BB40_2 Depth=1
	ldr	w9, [x22, #3024]
	cbz	w9, .LBB40_19
// %bb.12:                              //   in Loop: Header=BB40_2 Depth=1
	ldr	x8, [x22]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB40_18
// %bb.13:                              //   in Loop: Header=BB40_2 Depth=1
	ldr	x11, [x22, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB40_15
.LBB40_14:                              //   in Loop: Header=BB40_15 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB40_18
.LBB40_15:                              //   Parent Loop BB40_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w1
	b.hi	.LBB40_14
// %bb.16:                              //   in Loop: Header=BB40_15 Depth=2
	ldr	w12, [x11]
	cmp	w12, w1
	b.lo	.LBB40_14
// %bb.17:                              //   in Loop: Header=BB40_2 Depth=1
	ldur	x8, [x11, #-80]
.LBB40_18:                              //   in Loop: Header=BB40_2 Depth=1
	cbz	x8, .LBB40_9
.LBB40_19:                              //   in Loop: Header=BB40_2 Depth=1
	mov	x0, x22
	mov	w2, #7
	bl	f2fs_is_valid_blkaddr
	tbnz	w0, #0, .LBB40_9
	b	.LBB40_117
.LBB40_20:                              //   in Loop: Header=BB40_2 Depth=1
	ldrh	w12, [x8, #360]
	lsr	w12, w12, #2
	b	.LBB40_8
.LBB40_21:
	add	x8, x22, #1336          // =1336
	ldr	w23, [x21, #28]
	mov	w20, wzr
	str	x8, [sp, #16]           // 8-byte Folded Spill
	add	x8, x22, #2236          // =2236
	stur	x8, [x29, #-8]          // 8-byte Folded Spill
	//APP
	mrs x8, sp_el0
	//NO_APP
	str	x8, [sp, #8]            // 8-byte Folded Spill
	b	.LBB40_25
.LBB40_22:                              //   in Loop: Header=BB40_25 Depth=1
	ldur	w20, [x29, #-12]        // 4-byte Folded Reload
	ldr	x28, [sp, #24]          // 8-byte Folded Reload
.LBB40_23:                              //   in Loop: Header=BB40_25 Depth=1
	add	w20, w24, w20
.LBB40_24:                              //   in Loop: Header=BB40_25 Depth=1
	subs	x28, x28, x27
	b.eq	.LBB40_117
.LBB40_25:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB40_29 Depth 2
                                        //       Child Loop BB40_40 Depth 3
                                        //     Child Loop BB40_48 Depth 2
                                        //       Child Loop BB40_58 Depth 3
                                        //     Child Loop BB40_90 Depth 2
                                        //       Child Loop BB40_103 Depth 3
	ldr	x26, [x21]
	cmp	w27, #1                 // =1
	b.lt	.LBB40_65
// %bb.26:                              //   in Loop: Header=BB40_25 Depth=1
	ldr	x8, [x21, #16]
	mov	w19, wzr
	mov	w11, wzr
	mov	w10, w23
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	add	x9, x8, #360            // =360
	cbnz	x26, .LBB40_29
	b	.LBB40_48
.LBB40_27:                              //   in Loop: Header=BB40_29 Depth=2
	cmn	w12, #2                 // =2
	b.ne	.LBB40_64
.LBB40_28:                              //   in Loop: Header=BB40_29 Depth=2
	add	w10, w10, #1            // =1
	add	w11, w11, #1            // =1
	cmp	w11, w27
	str	w10, [x21, #28]
	b.eq	.LBB40_67
.LBB40_29:                              //   Parent Loop BB40_25 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB40_40 Depth 3
	ldr	w12, [x8, #4072]
	ldr	w13, [x8, #4076]
	cmp	w12, w13
	b.ne	.LBB40_31
// %bb.30:                              //   in Loop: Header=BB40_29 Depth=2
	ldr	x14, [x26, #712]
	tbnz	w14, #26, .LBB40_32
.LBB40_31:                              //   in Loop: Header=BB40_29 Depth=2
	mov	w14, wzr
	b	.LBB40_33
.LBB40_32:                              //   in Loop: Header=BB40_29 Depth=2
	ldr	w14, [x26, #1160]
	asr	w14, w14, #2
.LBB40_33:                              //   in Loop: Header=BB40_29 Depth=2
	cmp	w12, w13
	add	w13, w14, w10
	csel	x12, x9, x8, eq
	ldr	w12, [x12, w13, uxtw #2]
	cbz	w11, .LBB40_27
// %bb.34:                              //   in Loop: Header=BB40_29 Depth=2
	add	w13, w12, #3            // =3
	cmp	w13, #4                 // =4
	b.hs	.LBB40_36
.LBB40_35:                              //   in Loop: Header=BB40_29 Depth=2
	mov	w12, wzr
	b	.LBB40_45
.LBB40_36:                              //   in Loop: Header=BB40_29 Depth=2
	ldr	w14, [x22, #3024]
	cbz	w14, .LBB40_44
// %bb.37:                              //   in Loop: Header=BB40_29 Depth=2
	ldr	x13, [x22]
	cmp	w14, #1                 // =1
	ldr	x13, [x13, #248]
	b.lt	.LBB40_43
// %bb.38:                              //   in Loop: Header=BB40_29 Depth=2
	ldr	x16, [x22, #3032]
	mov	x15, xzr
	add	x16, x16, #80           // =80
	b	.LBB40_40
.LBB40_39:                              //   in Loop: Header=BB40_40 Depth=3
	add	x15, x15, #1            // =1
	add	x16, x16, #192          // =192
	cmp	x15, x14
	b.eq	.LBB40_43
.LBB40_40:                              //   Parent Loop BB40_25 Depth=1
                                        //     Parent Loop BB40_29 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w17, [x16, #-4]
	cmp	w17, w12
	b.hi	.LBB40_39
// %bb.41:                              //   in Loop: Header=BB40_40 Depth=3
	ldr	w17, [x16]
	cmp	w17, w12
	b.lo	.LBB40_39
// %bb.42:                              //   in Loop: Header=BB40_29 Depth=2
	ldur	x13, [x16, #-80]
.LBB40_43:                              //   in Loop: Header=BB40_29 Depth=2
	cbz	x13, .LBB40_35
.LBB40_44:                              //   in Loop: Header=BB40_29 Depth=2
	mov	w12, #1
.LBB40_45:                              //   in Loop: Header=BB40_29 Depth=2
	add	w19, w12, w19
	b	.LBB40_28
.LBB40_46:                              //   in Loop: Header=BB40_48 Depth=2
	mov	w12, wzr
	add	w19, wzr, w19
.LBB40_47:                              //   in Loop: Header=BB40_48 Depth=2
	add	w10, w10, #1            // =1
	add	w11, w11, #1            // =1
	cmp	w11, w27
	str	w10, [x21, #28]
	b.eq	.LBB40_66
.LBB40_48:                              //   Parent Loop BB40_25 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB40_58 Depth 3
	ldr	w12, [x8, #4072]
	ldr	w13, [x8, #4076]
	cmp	w12, w13
	b.ne	.LBB40_50
// %bb.49:                              //   in Loop: Header=BB40_48 Depth=2
	ldrb	w14, [x8, #3]
	tbnz	w14, #5, .LBB40_51
.LBB40_50:                              //   in Loop: Header=BB40_48 Depth=2
	mov	w14, wzr
	b	.LBB40_52
.LBB40_51:                              //   in Loop: Header=BB40_48 Depth=2
	ldrh	w14, [x8, #360]
	lsr	w14, w14, #2
.LBB40_52:                              //   in Loop: Header=BB40_48 Depth=2
	cmp	w12, w13
	add	w13, w14, w10
	csel	x12, x9, x8, eq
	ldr	w12, [x12, w13, uxtw #2]
	cbz	w11, .LBB40_63
// %bb.53:                              //   in Loop: Header=BB40_48 Depth=2
	add	w13, w12, #3            // =3
	cmp	w13, #4                 // =4
	b.lo	.LBB40_46
// %bb.54:                              //   in Loop: Header=BB40_48 Depth=2
	ldr	w14, [x22, #3024]
	cbz	w14, .LBB40_62
// %bb.55:                              //   in Loop: Header=BB40_48 Depth=2
	ldr	x13, [x22]
	cmp	w14, #1                 // =1
	ldr	x13, [x13, #248]
	b.lt	.LBB40_61
// %bb.56:                              //   in Loop: Header=BB40_48 Depth=2
	ldr	x16, [x22, #3032]
	mov	x15, xzr
	add	x16, x16, #80           // =80
	b	.LBB40_58
.LBB40_57:                              //   in Loop: Header=BB40_58 Depth=3
	add	x15, x15, #1            // =1
	add	x16, x16, #192          // =192
	cmp	x15, x14
	b.eq	.LBB40_61
.LBB40_58:                              //   Parent Loop BB40_25 Depth=1
                                        //     Parent Loop BB40_48 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w17, [x16, #-4]
	cmp	w17, w12
	b.hi	.LBB40_57
// %bb.59:                              //   in Loop: Header=BB40_58 Depth=3
	ldr	w17, [x16]
	cmp	w17, w12
	b.lo	.LBB40_57
// %bb.60:                              //   in Loop: Header=BB40_48 Depth=2
	ldur	x13, [x16, #-80]
.LBB40_61:                              //   in Loop: Header=BB40_48 Depth=2
	cbz	x13, .LBB40_46
.LBB40_62:                              //   in Loop: Header=BB40_48 Depth=2
	mov	w12, #1
	add	w19, w12, w19
	b	.LBB40_47
.LBB40_63:                              //   in Loop: Header=BB40_48 Depth=2
	cmn	w12, #2                 // =2
	b.eq	.LBB40_47
.LBB40_64:                              //   in Loop: Header=BB40_25 Depth=1
	add	w23, w10, w27
	str	w23, [x21, #28]
	b	.LBB40_24
.LBB40_65:                              //   in Loop: Header=BB40_25 Depth=1
	mov	w19, wzr
	b	.LBB40_67
.LBB40_66:                              //   in Loop: Header=BB40_25 Depth=1
	mov	x26, xzr
.LBB40_67:                              //   in Loop: Header=BB40_25 Depth=1
	ldrb	w8, [x26, #142]
	sub	w9, w27, w19
	mov	x0, x26
	mov	w2, #3
	sxtw	x24, w9
	lsl	x1, x24, x8
	bl	__dquot_alloc_space
	add	w8, w0, #28             // =28
	mov	w9, #1
	cmp	w8, #28                 // =28
	lsl	w8, w9, w8
	mov	w9, #1
	movk	w9, #4224, lsl #16
	and	w8, w8, w9
	ccmp	w8, #0, #4, ls
	b.ne	.LBB40_69
// %bb.68:                              //   in Loop: Header=BB40_25 Depth=1
	cmn	w0, #122                // =122
	b.ne	.LBB40_114
.LBB40_69:                              //   in Loop: Header=BB40_25 Depth=1
	adrp	x8, percpu_counter_batch
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	mov	x1, x24
	ldr	w2, [x8, :lo12:percpu_counter_batch]
	bl	percpu_counter_add_batch
	ldur	x0, [x29, #-8]          // 8-byte Folded Reload
	bl	_raw_spin_lock
	ldr	w8, [x22, #1240]
	ldr	w9, [x22, #1236]
	ldr	w10, [x22, #1256]
	add	w8, w8, w24
	sub	w25, w9, w10
	str	w8, [x22, #1240]
	cbz	x26, .LBB40_77
// %bb.70:                              //   in Loop: Header=BB40_25 Depth=1
	ldrb	w8, [x22, #1427]
	tbnz	w8, #0, .LBB40_72
.LBB40_71:                              //   in Loop: Header=BB40_25 Depth=1
	ldr	w8, [x22, #1436]
	sub	w25, w25, w8
	b	.LBB40_77
.LBB40_72:                              //   in Loop: Header=BB40_25 Depth=1
	ldrb	w8, [x26, #12]
	tbnz	w8, #5, .LBB40_77
// %bb.73:                              //   in Loop: Header=BB40_25 Depth=1
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	ldr	w9, [x22, #1440]
	ldr	x8, [x8, #2224]
	ldr	w8, [x8, #28]
	cmp	w9, w8
	b.eq	.LBB40_77
// %bb.74:                              //   in Loop: Header=BB40_25 Depth=1
	ldr	w0, [x22, #1444]
	cbz	w0, .LBB40_76
// %bb.75:                              //   in Loop: Header=BB40_25 Depth=1
	bl	in_group_p
	cbnz	w0, .LBB40_77
.LBB40_76:                              //   in Loop: Header=BB40_25 Depth=1
	mov	w0, #24
	bl	capable
	tbz	w0, #0, .LBB40_71
.LBB40_77:                              //   in Loop: Header=BB40_25 Depth=1
	ldr	x8, [x22, #80]
	tbnz	w8, #8, .LBB40_109
.LBB40_78:                              //   in Loop: Header=BB40_25 Depth=1
	ldr	w8, [x22, #1240]
	stur	w20, [x29, #-12]        // 4-byte Folded Spill
	str	x28, [sp, #24]          // 8-byte Folded Spill
	subs	w9, w8, w25
	b.hi	.LBB40_110
// %bb.79:                              //   in Loop: Header=BB40_25 Depth=1
	ldur	x0, [x29, #-8]          // 8-byte Folded Reload
	bl	_raw_spin_unlock
	mov	x25, x24
.LBB40_80:                              //   in Loop: Header=BB40_25 Depth=1
	ldr	x20, [x26, #712]
	and	x9, x25, #0xffffffff
	ldr	x28, [x26, #712]
	mov	x0, x26
	ldrb	w8, [x26, #142]
	lsl	x1, x9, x8
	bl	dquot_claim_space_nodirty
	cbnz	w0, .LBB40_82
// %bb.81:                              //   in Loop: Header=BB40_25 Depth=1
	mov	x0, x26
	mov	w1, #1
	bl	__mark_inode_dirty
.LBB40_82:                              //   in Loop: Header=BB40_25 Depth=1
	mov	x0, x26
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	tbz	w20, #1, .LBB40_84
// %bb.83:                              //   in Loop: Header=BB40_25 Depth=1
	tbz	w28, #2, .LBB40_85
.LBB40_84:                              //   in Loop: Header=BB40_25 Depth=1
	add	x8, x26, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB40_85:                              //   in Loop: Header=BB40_25 Depth=1
	cmp	x25, x24
	b.ne	.LBB40_116
// %bb.86:                              //   in Loop: Header=BB40_25 Depth=1
	ldr	x0, [x21]
	mov	w1, #1
	ldr	w8, [x0, #1268]
	add	x9, x0, #1256           // =1256
	sub	w8, w8, w19
	//APP
	// atomic_add
	prfm	pstl1strm, [x9]
1:	ldxr	w10, [x9]
	add	w10, w10, w8
	stxr	w11, w10, [x9]
	cbnz	w11, 1b
	//NO_APP
	ldr	x9, [x0, #40]
	sxtw	x8, w8
	ldr	x9, [x9, #1104]
	add	x9, x9, #2120           // =2120
	//APP
	// atomic64_add
	prfm	pstl1strm, [x9]
1:	ldxr	x10, [x9]
	add	x10, x10, x8
	stxr	w11, x10, [x9]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	cmp	w27, #1                 // =1
	str	w23, [x21, #28]
	b.lt	.LBB40_22
// %bb.87:                              //   in Loop: Header=BB40_25 Depth=1
	ldur	w20, [x29, #-12]        // 4-byte Folded Reload
	mov	w19, wzr
	ldr	x28, [sp, #24]          // 8-byte Folded Reload
	mov	w25, #-1
	b	.LBB40_90
.LBB40_88:                              //   in Loop: Header=BB40_90 Depth=2
	cmn	w8, #2                  // =2
	b.ne	.LBB40_108
.LBB40_89:                              //   in Loop: Header=BB40_90 Depth=2
	add	w23, w23, #1            // =1
	add	w19, w19, #1            // =1
	cmp	w19, w27
	str	w23, [x21, #28]
	b.eq	.LBB40_23
.LBB40_90:                              //   Parent Loop BB40_25 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB40_103 Depth 3
	ldr	x8, [x21, #16]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w10, [x8, #4076]
	cmp	w9, w10
	b.ne	.LBB40_95
// %bb.91:                              //   in Loop: Header=BB40_90 Depth=2
	ldr	x11, [x21]
	cbz	x11, .LBB40_94
// %bb.92:                              //   in Loop: Header=BB40_90 Depth=2
	ldr	x12, [x11, #712]
	tbz	w12, #26, .LBB40_95
// %bb.93:                              //   in Loop: Header=BB40_90 Depth=2
	ldr	w11, [x11, #1160]
	asr	w11, w11, #2
	b	.LBB40_96
.LBB40_94:                              //   in Loop: Header=BB40_90 Depth=2
	ldrb	w11, [x8, #3]
	tbnz	w11, #5, .LBB40_107
.LBB40_95:                              //   in Loop: Header=BB40_90 Depth=2
	mov	w11, wzr
.LBB40_96:                              //   in Loop: Header=BB40_90 Depth=2
	add	x12, x8, #360           // =360
	cmp	w9, w10
	csel	x8, x12, x8, eq
	add	w9, w11, w23
	ldr	w8, [x8, w9, uxtw #2]
	cbz	w19, .LBB40_88
// %bb.97:                              //   in Loop: Header=BB40_90 Depth=2
	add	w9, w8, #3              // =3
	cmp	w9, #4                  // =4
	b.hs	.LBB40_99
.LBB40_98:                              //   in Loop: Header=BB40_90 Depth=2
	mov	x0, x21
	str	w25, [x21, #36]
	bl	f2fs_set_data_blkaddr
	ldr	w23, [x21, #28]
	b	.LBB40_89
.LBB40_99:                              //   in Loop: Header=BB40_90 Depth=2
	ldr	w10, [x22, #3024]
	cbz	w10, .LBB40_89
// %bb.100:                             //   in Loop: Header=BB40_90 Depth=2
	ldr	x9, [x22]
	cmp	w10, #1                 // =1
	ldr	x9, [x9, #248]
	b.lt	.LBB40_106
// %bb.101:                             //   in Loop: Header=BB40_90 Depth=2
	ldr	x12, [x22, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB40_103
.LBB40_102:                             //   in Loop: Header=BB40_103 Depth=3
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB40_106
.LBB40_103:                             //   Parent Loop BB40_25 Depth=1
                                        //     Parent Loop BB40_90 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w13, [x12, #-4]
	cmp	w13, w8
	b.hi	.LBB40_102
// %bb.104:                             //   in Loop: Header=BB40_103 Depth=3
	ldr	w13, [x12]
	cmp	w13, w8
	b.lo	.LBB40_102
// %bb.105:                             //   in Loop: Header=BB40_90 Depth=2
	ldur	x9, [x12, #-80]
.LBB40_106:                             //   in Loop: Header=BB40_90 Depth=2
	cbnz	x9, .LBB40_89
	b	.LBB40_98
.LBB40_107:                             //   in Loop: Header=BB40_90 Depth=2
	ldrh	w11, [x8, #360]
	lsr	w11, w11, #2
	b	.LBB40_96
.LBB40_108:                             //   in Loop: Header=BB40_25 Depth=1
	add	w23, w23, w27
	str	w23, [x21, #28]
	b	.LBB40_24
.LBB40_109:                             //   in Loop: Header=BB40_25 Depth=1
	ldr	w8, [x22, #1264]
	subs	w8, w25, w8
	csel	w25, wzr, w8, lo
	b	.LBB40_78
.LBB40_110:                             //   in Loop: Header=BB40_25 Depth=1
	cmp	x24, x9
	ldur	x0, [x29, #-8]          // 8-byte Folded Reload
	csel	x9, x24, x9, lo
	sub	w8, w8, w9
	sub	x25, x24, x9
	str	x9, [sp]                // 8-byte Folded Spill
	str	w8, [x22, #1240]
	bl	_raw_spin_unlock
	cbz	x25, .LBB40_115
// %bb.111:                             //   in Loop: Header=BB40_25 Depth=1
	ldr	x8, [sp]                // 8-byte Folded Reload
	cbz	x8, .LBB40_80
// %bb.112:                             //   in Loop: Header=BB40_25 Depth=1
	adrp	x8, percpu_counter_batch
	ldr	x20, [sp]               // 8-byte Folded Reload
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	ldr	w2, [x8, :lo12:percpu_counter_batch]
	neg	x1, x20
	bl	percpu_counter_add_batch
	ldrb	w8, [x26, #142]
	mov	x0, x26
	mov	w2, #2
	lsl	x1, x20, x8
	bl	__dquot_free_space
	b	.LBB40_80
.LBB40_113:
	mov	w20, wzr
	b	.LBB40_117
.LBB40_114:
	mov	w20, w0
	b	.LBB40_117
.LBB40_115:
	adrp	x8, percpu_counter_batch
	ldr	x19, [sp]               // 8-byte Folded Reload
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	ldr	w2, [x8, :lo12:percpu_counter_batch]
	neg	x1, x19
	bl	percpu_counter_add_batch
	ldrb	w8, [x26, #142]
	mov	x0, x26
	mov	w2, #2
	lsl	x1, x19, x8
	bl	__dquot_free_space
.LBB40_116:
	mov	w20, #-28
.LBB40_117:
	mov	w0, w20
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #144            // =144
	ret
.Lfunc_end40:
	.size	reserve_compress_blocks, .Lfunc_end40-reserve_compress_blocks
                                        // -- End function
	.p2align	3               // -- Begin function release_compress_blocks
	.type	release_compress_blocks,@function
release_compress_blocks:                // @release_compress_blocks
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	cbz	x1, .LBB41_69
// %bb.1:
	ldr	x12, [x0]
	mov	x19, x1
	mov	x20, x0
	mov	w23, wzr
	mov	w21, #-117
	ldr	x8, [x12, #40]
	ldrsw	x28, [x12, #1268]
	ldr	x22, [x8, #1104]
.LBB41_2:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB41_15 Depth 2
	ldr	x8, [x20, #16]
	ldr	w9, [x20, #28]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	add	w9, w9, w23
	ldr	w10, [x8, #4072]
	ldr	w11, [x8, #4076]
	cmp	w10, w11
	b.ne	.LBB41_7
// %bb.3:                               //   in Loop: Header=BB41_2 Depth=1
	cbz	x12, .LBB41_6
// %bb.4:                               //   in Loop: Header=BB41_2 Depth=1
	ldr	x13, [x12, #712]
	tbz	w13, #26, .LBB41_7
// %bb.5:                               //   in Loop: Header=BB41_2 Depth=1
	ldr	w12, [x12, #1160]
	asr	w12, w12, #2
	b	.LBB41_8
.LBB41_6:                               //   in Loop: Header=BB41_2 Depth=1
	ldrb	w12, [x8, #3]
	tbnz	w12, #5, .LBB41_20
.LBB41_7:                               //   in Loop: Header=BB41_2 Depth=1
	mov	w12, wzr
.LBB41_8:                               //   in Loop: Header=BB41_2 Depth=1
	add	x13, x8, #360           // =360
	cmp	w10, w11
	csel	x8, x13, x8, eq
	add	w9, w9, w12
	ldr	w1, [x8, w9, uxtw #2]
	add	w8, w1, #3              // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB41_11
.LBB41_9:                               //   in Loop: Header=BB41_2 Depth=1
	add	w23, w23, #1            // =1
	sxtw	x8, w23
	cmp	x8, x19
	b.hs	.LBB41_21
// %bb.10:                              //   in Loop: Header=BB41_2 Depth=1
	ldr	x12, [x20]
	b	.LBB41_2
.LBB41_11:                              //   in Loop: Header=BB41_2 Depth=1
	ldr	w9, [x22, #3024]
	cbz	w9, .LBB41_19
// %bb.12:                              //   in Loop: Header=BB41_2 Depth=1
	ldr	x8, [x22]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB41_18
// %bb.13:                              //   in Loop: Header=BB41_2 Depth=1
	ldr	x11, [x22, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB41_15
.LBB41_14:                              //   in Loop: Header=BB41_15 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB41_18
.LBB41_15:                              //   Parent Loop BB41_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w1
	b.hi	.LBB41_14
// %bb.16:                              //   in Loop: Header=BB41_15 Depth=2
	ldr	w12, [x11]
	cmp	w12, w1
	b.lo	.LBB41_14
// %bb.17:                              //   in Loop: Header=BB41_2 Depth=1
	ldur	x8, [x11, #-80]
.LBB41_18:                              //   in Loop: Header=BB41_2 Depth=1
	cbz	x8, .LBB41_9
.LBB41_19:                              //   in Loop: Header=BB41_2 Depth=1
	mov	x0, x22
	mov	w2, #7
	bl	f2fs_is_valid_blkaddr
	tbnz	w0, #0, .LBB41_9
	b	.LBB41_70
.LBB41_20:                              //   in Loop: Header=BB41_2 Depth=1
	ldrh	w12, [x8, #360]
	lsr	w12, w12, #2
	b	.LBB41_8
.LBB41_21:
	mov	w21, wzr
	add	x23, x22, #2236         // =2236
	b	.LBB41_24
.LBB41_22:                              //   in Loop: Header=BB41_24 Depth=1
	add	x8, x26, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB41_23:                              //   in Loop: Header=BB41_24 Depth=1
	add	w21, w24, w21
	subs	x19, x19, x28
	b.eq	.LBB41_70
.LBB41_24:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB41_28 Depth 2
                                        //       Child Loop BB41_41 Depth 3
	ldr	x26, [x20]
	cmp	w28, #1                 // =1
	b.lt	.LBB41_49
// %bb.25:                              //   in Loop: Header=BB41_24 Depth=1
	ldr	w8, [x20, #28]
	mov	w24, wzr
	mov	w27, wzr
	b	.LBB41_28
.LBB41_26:                              //   in Loop: Header=BB41_28 Depth=2
	cmn	w9, #2                  // =2
	b.ne	.LBB41_62
.LBB41_27:                              //   in Loop: Header=BB41_28 Depth=2
	add	w8, w8, #1              // =1
	add	w27, w27, #1            // =1
	cmp	w27, w28
	str	w8, [x20, #28]
	b.eq	.LBB41_50
.LBB41_28:                              //   Parent Loop BB41_24 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB41_41 Depth 3
	ldr	x9, [x20, #16]
	lsl	x9, x9, #6
	orr	x9, x9, #0xffffffc000000000
	ldr	w10, [x9, #4072]
	ldr	w11, [x9, #4076]
	cmp	w10, w11
	b.ne	.LBB41_33
// %bb.29:                              //   in Loop: Header=BB41_28 Depth=2
	cbz	x26, .LBB41_32
// %bb.30:                              //   in Loop: Header=BB41_28 Depth=2
	ldr	x12, [x26, #712]
	tbz	w12, #26, .LBB41_33
// %bb.31:                              //   in Loop: Header=BB41_28 Depth=2
	ldr	w12, [x26, #1160]
	asr	w12, w12, #2
	b	.LBB41_34
.LBB41_32:                              //   in Loop: Header=BB41_28 Depth=2
	ldrb	w12, [x9, #3]
	tbnz	w12, #5, .LBB41_48
.LBB41_33:                              //   in Loop: Header=BB41_28 Depth=2
	mov	w12, wzr
.LBB41_34:                              //   in Loop: Header=BB41_28 Depth=2
	add	x13, x9, #360           // =360
	cmp	w10, w11
	csel	x9, x13, x9, eq
	add	w10, w12, w8
	ldr	w9, [x9, w10, uxtw #2]
	cbz	w27, .LBB41_26
// %bb.35:                              //   in Loop: Header=BB41_28 Depth=2
	add	w10, w9, #3             // =3
	cmp	w10, #4                 // =4
	b.hs	.LBB41_37
// %bb.36:                              //   in Loop: Header=BB41_28 Depth=2
	mov	w10, wzr
	b	.LBB41_46
.LBB41_37:                              //   in Loop: Header=BB41_28 Depth=2
	ldr	w11, [x22, #3024]
	cbz	w11, .LBB41_45
// %bb.38:                              //   in Loop: Header=BB41_28 Depth=2
	ldr	x10, [x22]
	cmp	w11, #1                 // =1
	ldr	x10, [x10, #248]
	b.lt	.LBB41_44
// %bb.39:                              //   in Loop: Header=BB41_28 Depth=2
	ldr	x13, [x22, #3032]
	mov	x12, xzr
	add	x13, x13, #80           // =80
	b	.LBB41_41
.LBB41_40:                              //   in Loop: Header=BB41_41 Depth=3
	add	x12, x12, #1            // =1
	add	x13, x13, #192          // =192
	cmp	x12, x11
	b.eq	.LBB41_44
.LBB41_41:                              //   Parent Loop BB41_24 Depth=1
                                        //     Parent Loop BB41_28 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldur	w14, [x13, #-4]
	cmp	w14, w9
	b.hi	.LBB41_40
// %bb.42:                              //   in Loop: Header=BB41_41 Depth=3
	ldr	w14, [x13]
	cmp	w14, w9
	b.lo	.LBB41_40
// %bb.43:                              //   in Loop: Header=BB41_28 Depth=2
	ldur	x10, [x13, #-80]
.LBB41_44:                              //   in Loop: Header=BB41_28 Depth=2
	cbz	x10, .LBB41_46
.LBB41_45:                              //   in Loop: Header=BB41_28 Depth=2
	mov	w10, #1
.LBB41_46:                              //   in Loop: Header=BB41_28 Depth=2
	add	w24, w10, w24
	cmn	w9, #1                  // =1
	b.ne	.LBB41_27
// %bb.47:                              //   in Loop: Header=BB41_28 Depth=2
	mov	x0, x20
	str	wzr, [x20, #36]
	bl	f2fs_set_data_blkaddr
	ldr	w8, [x20, #28]
	ldr	x26, [x20]
	b	.LBB41_27
.LBB41_48:                              //   in Loop: Header=BB41_28 Depth=2
	ldrh	w12, [x9, #360]
	lsr	w12, w12, #2
	b	.LBB41_34
.LBB41_49:                              //   in Loop: Header=BB41_24 Depth=1
	mov	w24, wzr
.LBB41_50:                              //   in Loop: Header=BB41_24 Depth=1
	ldr	w8, [x26, #1268]
	ldr	w9, [x26, #1256]
	cbz	w9, .LBB41_54
// %bb.51:                              //   in Loop: Header=BB41_24 Depth=1
	ldr	w9, [x26, #1256]
	sub	w27, w8, w24
	cmp	w27, w9
	b.le	.LBB41_53
// %bb.52:                              //   in Loop: Header=BB41_24 Depth=1
	ldr	x8, [x26, #40]
	adrp	x1, .L.str.29
	adrp	x2, .L__func__.f2fs_i_compr_blocks_update
	add	x1, x1, :lo12:.L.str.29
	add	x2, x2, :lo12:.L__func__.f2fs_i_compr_blocks_update
	mov	w3, w27
	ldr	x0, [x8, #1104]
	ldr	w4, [x26, #1256]
	ldr	x5, [x26, #64]
	bl	f2fs_printk
.LBB41_53:                              //   in Loop: Header=BB41_24 Depth=1
	add	x8, x26, #1256          // =1256
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, w27
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x26, #40]
	mov	x0, x26
	mov	w1, #1
	sxtw	x9, w27
	ldr	x8, [x8, #1104]
	add	x8, x8, #2120           // =2120
	//APP
	// atomic64_sub
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	sub	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	ldr	x26, [x20]
.LBB41_54:                              //   in Loop: Header=BB41_24 Depth=1
	mov	x0, x23
	sub	w24, w28, w24
	bl	_raw_spin_lock
	ldr	w8, [x22, #1240]
	cmp	w8, w24
	b.lo	.LBB41_63
// %bb.55:                              //   in Loop: Header=BB41_24 Depth=1
	subs	w9, w8, w24
	b.lo	.LBB41_71
.LBB41_56:                              //   in Loop: Header=BB41_24 Depth=1
	ldr	w8, [x22, #1252]
	lsl	w27, w24, #3
	str	w9, [x22, #1240]
	cbz	w8, .LBB41_59
// %bb.57:                              //   in Loop: Header=BB41_24 Depth=1
	ldr	w9, [x22, #1256]
	cmp	w9, w8
	b.hs	.LBB41_59
// %bb.58:                              //   in Loop: Header=BB41_24 Depth=1
	add	w9, w9, w24
	cmp	w8, w9
	csel	w8, w8, w9, lo
	str	w8, [x22, #1256]
.LBB41_59:                              //   in Loop: Header=BB41_24 Depth=1
	mov	x0, x23
	bl	_raw_spin_unlock
	ldr	x3, [x26, #144]
	cmp	x3, x27
	b.lo	.LBB41_67
// %bb.60:                              //   in Loop: Header=BB41_24 Depth=1
	ldr	x25, [x26, #712]
	mov	w9, w24
	ldr	x27, [x26, #712]
	mov	x0, x26
	ldrb	w8, [x26, #142]
	mov	w2, wzr
	lsl	x1, x9, x8
	bl	__dquot_free_space
	mov	x0, x26
	mov	w1, #1
	bl	__mark_inode_dirty
	mov	x0, x26
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	tbz	w25, #1, .LBB41_22
// %bb.61:                              //   in Loop: Header=BB41_24 Depth=1
	tbz	w27, #2, .LBB41_23
	b	.LBB41_22
.LBB41_62:                              //   in Loop: Header=BB41_24 Depth=1
	add	w8, w8, w28
	str	w8, [x20, #28]
	subs	x19, x19, x28
	b.ne	.LBB41_24
	b	.LBB41_70
.LBB41_63:                              //   in Loop: Header=BB41_24 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB41_66
// %bb.64:                              //   in Loop: Header=BB41_24 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB41_66
// %bb.65:                              //   in Loop: Header=BB41_24 Depth=1
	adrp	x25, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.dec_valid_block_count
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.dec_valid_block_count
	mov	w3, #3406
	ldr	x0, [x25, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB41_66:                              //   in Loop: Header=BB41_24 Depth=1
	mov	x0, x22
	bl	f2fs_print_raw_sb_info
	mov	x0, x22
	bl	f2fs_print_ckpt_info
	mov	x0, x22
	bl	f2fs_print_sbi_info
	ldr	w8, [x22, #1240]
	subs	w9, w8, w24
	b.hs	.LBB41_56
	b	.LBB41_71
.LBB41_67:                              //   in Loop: Header=BB41_24 Depth=1
	ldr	x2, [x26, #64]
	adrp	x1, .L.str.30
	mov	x0, x22
	add	x1, x1, :lo12:.L.str.30
	mov	x4, x27
	bl	f2fs_printk
	cbz	x22, .LBB41_23
// %bb.68:                              //   in Loop: Header=BB41_24 Depth=1
	add	x8, x22, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB41_23
.LBB41_69:
	mov	w21, wzr
.LBB41_70:
	mov	w0, w21
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB41_71:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3406; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end41:
	.size	release_compress_blocks, .Lfunc_end41-release_compress_blocks
                                        // -- End function
	.p2align	3               // -- Begin function redirty_blocks
	.type	redirty_blocks,@function
redirty_blocks:                         // @redirty_blocks
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	cmp	w2, #1                  // =1
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	b.lt	.LBB42_5
// %bb.1:
	ldr	x21, [x0, #48]
	mov	w20, w2
	mov	x19, x1
	mov	x23, xzr
.LBB42_2:                               // =>This Inner Loop Header: Depth=1
	add	x1, x19, x23
	mov	x0, x21
	mov	x2, xzr
	mov	x3, xzr
	bl	read_cache_page
	cmn	x0, #4095               // =4095
	b.hs	.LBB42_6
// %bb.3:                               //   in Loop: Header=BB42_2 Depth=1
	add	x23, x23, #1            // =1
	cmp	w23, w20
	b.ne	.LBB42_2
// %bb.4:
	mov	w22, wzr
	cmp	w20, #1                 // =1
	b.ge	.LBB42_7
	b	.LBB42_40
.LBB42_5:
	mov	w22, wzr
	b	.LBB42_40
.LBB42_6:
	mov	x22, x0
	mov	w20, w23
	cmp	w20, #1                 // =1
	b.lt	.LBB42_40
.LBB42_7:
	mov	w25, #8208
	adrp	x26, .L.str.8
	adrp	x27, .L__func__.f2fs_put_page
	mov	w24, wzr
	movk	w25, #62197, lsl #16
	adrp	x23, f2fs_dclient
	add	x26, x26, :lo12:.L.str.8
	add	x27, x27, :lo12:.L__func__.f2fs_put_page
	b	.LBB42_9
.LBB42_8:                               //   in Loop: Header=BB42_9 Depth=1
	add	w24, w24, #1            // =1
	add	x19, x19, #1            // =1
	cmp	w24, w20
	b.eq	.LBB42_40
.LBB42_9:                               // =>This Inner Loop Header: Depth=1
	mov	x0, x21
	mov	x1, x19
	mov	w2, #2
	mov	w3, wzr
	bl	pagecache_get_page
	cbz	x0, .LBB42_39
// %bb.10:                              //   in Loop: Header=BB42_9 Depth=1
	mov	x28, x0
	bl	set_page_dirty
	ldr	x8, [x28, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x28, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x28, x10, eq
	cmp	x9, x25
	ldr	x8, [x8]
	b.ne	.LBB42_26
// %bb.11:                              //   in Loop: Header=BB42_9 Depth=1
	tbnz	w8, #0, .LBB42_25
// %bb.12:                              //   in Loop: Header=BB42_9 Depth=1
	bl	print_bdev_access_info
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB42_15
// %bb.13:                              //   in Loop: Header=BB42_9 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB42_15
// %bb.14:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	x1, x26
	mov	x2, x27
	mov	w3, #3734
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB42_15:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB42_17
// %bb.16:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB42_36
.LBB42_17:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x0, [x28, #24]
.LBB42_18:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB42_20
// %bb.19:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB42_37
.LBB42_20:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x0, [x28, #24]
.LBB42_21:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB42_23
// %bb.22:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x8, [x28]
	tbnz	w8, #10, .LBB42_38
.LBB42_23:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x0, [x28, #24]
.LBB42_24:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB42_25:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB42_32
	b	.LBB42_41
.LBB42_26:                              //   in Loop: Header=BB42_9 Depth=1
	tbnz	w8, #0, .LBB42_31
// %bb.27:                              //   in Loop: Header=BB42_9 Depth=1
	bl	print_bdev_access_info
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB42_30
// %bb.28:                              //   in Loop: Header=BB42_9 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB42_30
// %bb.29:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	x1, x26
	mov	x2, x27
	mov	w3, #3736
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB42_30:                              //   in Loop: Header=BB42_9 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB42_31:                              //   in Loop: Header=BB42_9 Depth=1
	ldr	x8, [x28, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x28, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB42_42
.LBB42_32:                              //   in Loop: Header=BB42_9 Depth=1
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
	cbnz	w9, .LBB42_34
// %bb.33:                              //   in Loop: Header=BB42_9 Depth=1
	bl	__put_page
.LBB42_34:                              //   in Loop: Header=BB42_9 Depth=1
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
	cbnz	w9, .LBB42_8
// %bb.35:                              //   in Loop: Header=BB42_9 Depth=1
	bl	__put_page
	b	.LBB42_8
.LBB42_36:                              //   in Loop: Header=BB42_9 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB42_18
.LBB42_37:                              //   in Loop: Header=BB42_9 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB42_21
.LBB42_38:                              //   in Loop: Header=BB42_9 Depth=1
	mov	x0, x28
	bl	__page_file_mapping
	b	.LBB42_24
.LBB42_39:
	mov	w8, #-12
	mov	w22, w8
.LBB42_40:
	mov	w0, w22
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB42_41:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB42_42:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end42:
	.size	redirty_blocks, .Lfunc_end42-redirty_blocks
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_setflags_common
	.type	f2fs_setflags_common,@function
f2fs_setflags_common:                   // @f2fs_setflags_common
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	ldrb	w8, [x0, #12]
	str	x23, [sp, #16]          // 8-byte Folded Spill
	tbnz	w8, #5, .LBB43_12
// %bb.1:
	ldr	w8, [x0, #680]
	and	w21, w2, w1
	mov	w20, w2
	mov	x19, x0
	and	w23, w8, w2
	eor	w22, w23, w21
	tbnz	w22, #30, .LBB43_13
.LBB43_2:
	mov	w8, #1028
	ands	w8, w21, w8
	b.eq	.LBB43_5
// %bb.3:
	ldr	x9, [x19, #40]
	ldr	x9, [x9, #1104]
	ldr	x9, [x9, #16]
	ldrb	w9, [x9, #2181]
	tbz	w9, #5, .LBB43_14
// %bb.4:
	cmp	w8, #1028               // =1028
	b.eq	.LBB43_33
.LBB43_5:
	tbnz	w22, #2, .LBB43_17
.LBB43_6:
	tbz	w23, #2, .LBB43_8
// %bb.7:
	tbnz	w22, #10, .LBB43_33
.LBB43_8:
	ldr	x8, [x19, #680]
	mvn	w9, w20
	mov	w10, w21
	and	x8, x8, x9
	orr	x8, x8, x10
	mov	w10, #1028
	mvn	w9, w8
	tst	x9, x10
	str	x8, [x19, #680]
	b.eq	.LBB43_44
.LBB43_9:
	mvn	w9, w8
	mov	w10, #1028
	tst	x9, x10
	b.eq	.LBB43_48
// %bb.10:
	tbnz	w8, #29, .LBB43_34
// %bb.11:
	add	x8, x19, #712           // =712
	mov	w9, #134217728
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	b	.LBB43_35
.LBB43_12:
	mov	w0, #-1
	b	.LBB43_36
.LBB43_13:
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2181]
	tbnz	w8, #4, .LBB43_15
.LBB43_14:
	mov	w0, #-95
	b	.LBB43_36
.LBB43_15:
	mov	x0, x19
	bl	f2fs_empty_dir
	tbnz	w0, #0, .LBB43_2
// %bb.16:
	mov	w0, #-39
	b	.LBB43_36
.LBB43_17:
	tbz	w23, #2, .LBB43_24
// %bb.18:
	ldrh	w8, [x19]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB43_24
// %bb.19:
	ldr	x8, [x19, #712]
	tbz	w8, #31, .LBB43_24
// %bb.20:
	ldr	w8, [x19, #800]
	ldr	x9, [x19, #144]
	cmp	w8, #0                  // =0
	cset	w8, ne
	cmp	x8, x9, lsr #3
	b.lo	.LBB43_33
// %bb.21:
	ldr	x8, [x19, #680]
	and	x8, x8, #0xfffffffffffffffb
	str	x8, [x19, #680]
	ldr	x8, [x19, #712]
	tbz	w8, #31, .LBB43_23
// %bb.22:
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	add	x8, x8, #2116           // =2116
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB43_23:
	mov	x0, x19
	mov	w1, #1
	add	x8, x19, #712           // =712
	mov	w9, #-2147483648
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB43_24:
	tbnz	w21, #10, .LBB43_33
// %bb.25:
	tbz	w21, #2, .LBB43_6
// %bb.26:
	ldrb	w8, [x19, #13]
	tbnz	w8, #0, .LBB43_33
// %bb.27:
	ldr	x8, [x19, #712]
	tbnz	w8, #28, .LBB43_33
// %bb.28:
	ldr	x8, [x19, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB43_33
// %bb.29:
	ldr	x8, [x19, #712]
	tbnz	w8, #17, .LBB43_33
// %bb.30:
	ldrh	w8, [x19]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.eq	.LBB43_37
// %bb.31:
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB43_33
// %bb.32:
	ldr	x8, [x19, #80]
	cbz	x8, .LBB43_37
.LBB43_33:
	mov	w0, #-22
	b	.LBB43_36
.LBB43_34:
	add	x8, x19, #712           // =712
	mov	w9, #134217728
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
.LBB43_35:
	mov	x0, x19
	bl	current_time
	stp	x0, x1, [x19, #120]
	mov	x0, x19
	bl	f2fs_set_inode_flags
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	mov	w0, wzr
.LBB43_36:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB43_37:
	ldr	x8, [x19, #40]
	mov	w12, #1
	ldr	x8, [x8, #1104]
	ldrb	w10, [x8, #1524]
	strb	w10, [x19, #1260]
	cmp	w10, #1                 // =1
	ldrb	w11, [x8, #1525]
	strb	w11, [x19, #1261]
	lsl	w11, w12, w11
	ldrb	w9, [x8, #1527]
	str	w11, [x19, #1268]
	strh	w9, [x19, #1264]
	b.ne	.LBB43_40
// %bb.38:
	ldrb	w8, [x8, #1526]
	cbz	w8, .LBB43_40
// %bb.39:
	bfi	w9, w8, #8, #8
	strh	w9, [x19, #1264]
.LBB43_40:
	ldr	x8, [x19, #680]
	add	x9, x19, #712           // =712
	mov	w10, #-2147483648
	orr	x8, x8, #0x4
	str	x8, [x19, #680]
	//APP
	// atomic64_or
	prfm	pstl1strm, [x9]
1:	ldxr	x8, [x9]
	orr	x8, x8, x10
	stxr	w11, x8, [x9]
	cbnz	w11, 1b
	//NO_APP
	ldrh	w8, [x19]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB43_43
// %bb.41:
	ldr	x8, [x19, #712]
	tbz	w8, #31, .LBB43_43
// %bb.42:
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	add	x8, x8, #2116           // =2116
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB43_43:
	ldr	x8, [x19, #40]
	mov	x0, x19
	mov	w1, #1
	ldr	x8, [x8, #1104]
	ldr	w9, [x8, #3208]
	add	w9, w9, #1              // =1
	str	w9, [x8, #3208]
	bl	f2fs_mark_inode_dirty_sync
	b	.LBB43_6
.LBB43_44:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB43_47
// %bb.45:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB43_47
// %bb.46:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_setflags_common
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #4310
	add	x2, x2, :lo12:.L__func__.f2fs_setflags_common
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB43_47:
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	ldr	x8, [x19, #680]
	b	.LBB43_9
.LBB43_48:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/file.c"; .popsection; .long 14472b - 14470b; .short 4310; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end43:
	.size	f2fs_setflags_common, .Lfunc_end43-f2fs_setflags_common
                                        // -- End function
	.p2align	3               // -- Begin function punch_hole
	.type	punch_hole,@function
punch_hole:                             // @punch_hole
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	str	x27, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	mov	x22, x2
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	x21, x1
	mov	x19, x0
	bl	f2fs_convert_inline_inode
	mov	w24, w0
	cbnz	w0, .LBB44_13
// %bb.1:
	add	x23, x22, x21
	and	x2, x21, #0xfff
	and	x22, x23, #0xfff
	lsr	x20, x21, #12
	lsr	x21, x23, #12
	cmp	x20, x21
	b.ne	.LBB44_3
// %bb.2:
	sub	x3, x22, x2
	mov	x0, x19
	mov	x1, x20
	bl	fill_zero
	mov	w24, w0
	b	.LBB44_13
.LBB44_3:
	cbz	x2, .LBB44_6
// %bb.4:
	mov	w8, #4096
	mov	x0, x19
	sub	x3, x8, x2
	mov	x1, x20
	bl	fill_zero
	mov	w24, w0
	cbnz	w0, .LBB44_13
// %bb.5:
	add	x20, x20, #1            // =1
.LBB44_6:
	cbz	x22, .LBB44_8
// %bb.7:
	mov	x0, x19
	mov	x1, x21
	mov	x2, xzr
	mov	x3, x22
	bl	fill_zero
	mov	w24, w0
	cbnz	w0, .LBB44_13
.LBB44_8:
	cmp	x20, x21
	b.hs	.LBB44_12
// %bb.9:
	ldp	x8, x25, [x19, #40]
	mov	w1, #1
	ldr	x24, [x8, #1104]
	mov	x0, x24
	bl	f2fs_balance_fs
	add	x22, x19, #1016         // =1016
	and	x27, x23, #0xfffffffffffff000
	mov	x0, x22
	lsl	x26, x20, #12
	bl	down_write
	add	x23, x19, #1064         // =1064
	mov	x0, x23
	bl	down_write
	sub	x2, x27, #1             // =1
	mov	x0, x25
	mov	x1, x26
	bl	truncate_inode_pages_range
	add	x25, x24, #368          // =368
	mov	x0, x25
	bl	_raw_spin_lock
	ldr	x8, [x24, #352]
	cbz	x8, .LBB44_11
// %bb.10:
	adrp	x26, jiffies
	ldr	x8, [x24, #360]
	ldr	x9, [x26, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB44_14
.LBB44_11:
	mov	x0, x25
	bl	_raw_spin_unlock
	add	x25, x24, #304          // =304
	mov	x0, x25
	bl	down_read
	mov	x0, x19
	mov	x1, x20
	mov	x2, x21
	bl	f2fs_truncate_hole
	mov	w24, w0
	mov	x0, x25
	bl	up_read
	mov	x0, x23
	bl	up_write
	mov	x0, x22
	bl	up_write
	b	.LBB44_13
.LBB44_12:
	mov	w24, wzr
.LBB44_13:
	mov	w0, w24
	ldr	x27, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB44_14:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x24, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x26, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x24, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB44_11
.Lfunc_end44:
	.size	punch_hole, .Lfunc_end44-punch_hole
                                        // -- End function
	.p2align	3               // -- Begin function fill_zero
	.type	fill_zero,@function
fill_zero:                              // @fill_zero
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	str	x25, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	cbz	x3, .LBB45_35
// %bb.1:
	ldr	x8, [x0, #40]
	mov	x19, x1
	mov	x22, x0
	mov	w1, #1
	mov	x20, x3
	mov	x21, x2
	ldr	x23, [x8, #1104]
	mov	x0, x23
	bl	f2fs_balance_fs
	add	x24, x23, #368          // =368
	mov	x0, x24
	bl	_raw_spin_lock
	ldr	x8, [x23, #352]
	cbz	x8, .LBB45_3
// %bb.2:
	adrp	x25, jiffies
	ldr	x8, [x23, #360]
	ldr	x9, [x25, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB45_37
.LBB45_3:
	mov	x0, x24
	bl	_raw_spin_unlock
	add	x23, x23, #304          // =304
	mov	x0, x23
	bl	down_read
	mov	x0, x22
	mov	x1, xzr
	mov	x2, x19
	mov	w3, wzr
	bl	f2fs_get_new_data_page
	mov	x19, x0
	mov	x0, x23
	bl	up_read
	cmn	x19, #4095              // =4095
	b.hs	.LBB45_36
// %bb.4:
	mov	x0, x19
	mov	w1, wzr
	mov	w2, #1
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
	//APP
	mrs x22, sp_el0
	//NO_APP
	ldr	w8, [x22, #80]
	add	w8, w8, #1              // =1
	str	w8, [x22, #80]
	//APP
	//NO_APP
	ldr	w8, [x22, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x22, #2984]
	add	w8, w20, w21
	//APP
	//NO_APP
	cmp	w8, #1, lsl #12         // =4096
	b.hi	.LBB45_42
// %bb.5:
	cmp	w8, w21
	b.ls	.LBB45_7
// %bb.6:
	lsl	x8, x19, #6
	and	x2, x20, #0xffffffff
	orr	x8, x8, #0xffffffc000000000
	mov	w1, wzr
	add	x0, x8, w21, uxtw
	bl	memset
.LBB45_7:
	//APP
	//NO_APP
	ldr	w8, [x22, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x22, #2984]
	//APP
	//NO_APP
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB45_9
// %bb.8:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB45_38
.LBB45_9:
	mov	x0, x19
	bl	flush_dcache_page
	mov	x0, x19
	bl	set_page_dirty
	cbz	x19, .LBB45_36
// %bb.10:
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
	b.ne	.LBB45_27
// %bb.11:
	tbnz	w8, #0, .LBB45_25
// %bb.12:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB45_15
// %bb.13:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB45_15
// %bb.14:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB45_15:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB45_17
// %bb.16:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB45_39
.LBB45_17:
	ldr	x0, [x19, #24]
.LBB45_18:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB45_20
// %bb.19:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB45_40
.LBB45_20:
	ldr	x0, [x19, #24]
.LBB45_21:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB45_23
// %bb.22:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB45_41
.LBB45_23:
	ldr	x0, [x19, #24]
.LBB45_24:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB45_25:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB45_33
// %bb.26:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB45_27:
	tbnz	w8, #0, .LBB45_32
// %bb.28:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB45_31
// %bb.29:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB45_31
// %bb.30:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB45_31:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB45_32:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB45_43
.LBB45_33:
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
	cbnz	w9, .LBB45_35
// %bb.34:
	bl	__put_page
.LBB45_35:
	mov	w19, wzr
.LBB45_36:
	mov	w0, w19
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB45_37:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldr	x1, [x23, #360]
	adrp	x0, .L.str.31
	ldr	x2, [x25, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.31
	bl	printk
	ldr	x0, [x23, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB45_3
.LBB45_38:
	bl	preempt_schedule
	b	.LBB45_9
.LBB45_39:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB45_18
.LBB45_40:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB45_21
.LBB45_41:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB45_24
.LBB45_42:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "include/linux/highmem.h"; .popsection; .long 14472b - 14470b; .short 212; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB45_43:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end45:
	.size	fill_zero, .Lfunc_end45-fill_zero
                                        // -- End function
	.p2align	3               // -- Begin function __f2fs_ioc_gc_range
	.type	__f2fs_ioc_gc_range,@function
__f2fs_ioc_gc_range:                    // @__f2fs_ioc_gc_range
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	mov	x21, x1
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #32]
	mov	w0, #21
	ldr	x8, [x8, #40]
	ldr	x20, [x8, #1104]
	bl	capable
	tbz	w0, #0, .LBB46_5
// %bb.1:
	ldr	x8, [x20]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB46_6
// %bb.2:
	ldp	x9, x8, [x21, #8]
	adds	x24, x8, x9
	b.hs	.LBB46_35
// %bb.3:
	ldr	x8, [x20, #136]
	cbz	x8, .LBB46_7
// %bb.4:
	add	x10, x8, #84            // =84
	b	.LBB46_8
.LBB46_5:
	mov	w23, #-1
	b	.LBB46_36
.LBB46_6:
	mov	w23, #-30
	b	.LBB46_36
.LBB46_7:
	ldr	x10, [x20, #16]
	add	x10, x10, #92           // =92
.LBB46_8:
	ldr	w10, [x10]
	cmp	x9, x10
	b.lo	.LBB46_35
// %bb.9:
	cbz	x8, .LBB46_11
// %bb.10:
	add	x9, x8, #80             // =80
	add	x8, x8, #92             // =92
	b	.LBB46_12
.LBB46_11:
	ldr	x8, [x20, #16]
	add	x9, x8, #72             // =72
	add	x8, x8, #48             // =48
.LBB46_12:
	ldr	w8, [x8]
	ldr	w10, [x20, #1184]
	ldr	w9, [x9]
	lsl	w8, w8, w10
	add	w8, w8, w9
	cmp	x24, x8
	b.hs	.LBB46_35
// %bb.13:
	mov	x0, x19
	bl	mnt_want_write_file
	mov	w23, w0
	cbnz	w0, .LBB46_36
// %bb.14:
	add	x22, x20, #1664         // =1664
	mov	w25, #-1
	//APP
	mrs x26, sp_el0
	//NO_APP
.LBB46_15:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB46_24 Depth 2
	ldr	w8, [x21]
	cbz	w8, .LBB46_17
// %bb.16:                              //   in Loop: Header=BB46_15 Depth=1
	mov	x0, x22
	bl	down_write
	b	.LBB46_18
.LBB46_17:                              //   in Loop: Header=BB46_15 Depth=1
	mov	x0, x22
	bl	down_write_trylock
	cbz	w0, .LBB46_39
.LBB46_18:                              //   in Loop: Header=BB46_15 Depth=1
	ldr	w8, [x26, #108]
	orr	w8, w8, #0x2000000
	str	w8, [x26, #108]
	ldr	x9, [x21, #8]
	ldr	w8, [x21]
	add	w10, w9, #3             // =3
	cmp	w10, #4                 // =4
	b.hs	.LBB46_20
.LBB46_19:                              //   in Loop: Header=BB46_15 Depth=1
	mov	x4, x25
	b	.LBB46_32
.LBB46_20:                              //   in Loop: Header=BB46_15 Depth=1
	ldr	w11, [x20, #3024]
	cbz	w11, .LBB46_28
// %bb.21:                              //   in Loop: Header=BB46_15 Depth=1
	ldr	x10, [x20]
	cmp	w11, #1                 // =1
	ldr	x10, [x10, #248]
	b.lt	.LBB46_27
// %bb.22:                              //   in Loop: Header=BB46_15 Depth=1
	ldr	x13, [x20, #3032]
	mov	x12, xzr
	add	x13, x13, #80           // =80
	b	.LBB46_24
.LBB46_23:                              //   in Loop: Header=BB46_24 Depth=2
	add	x12, x12, #1            // =1
	add	x13, x13, #192          // =192
	cmp	x12, x11
	b.eq	.LBB46_27
.LBB46_24:                              //   Parent Loop BB46_15 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w14, [x13, #-4]
	cmp	w14, w9
	b.hi	.LBB46_23
// %bb.25:                              //   in Loop: Header=BB46_24 Depth=2
	ldr	w14, [x13]
	cmp	w14, w9
	b.lo	.LBB46_23
// %bb.26:                              //   in Loop: Header=BB46_15 Depth=1
	ldur	x10, [x13, #-80]
.LBB46_27:                              //   in Loop: Header=BB46_15 Depth=1
	cbz	x10, .LBB46_19
.LBB46_28:                              //   in Loop: Header=BB46_15 Depth=1
	ldr	x10, [x20, #136]
	cbz	x10, .LBB46_30
// %bb.29:                              //   in Loop: Header=BB46_15 Depth=1
	add	x11, x10, #80           // =80
	b	.LBB46_31
.LBB46_30:                              //   in Loop: Header=BB46_15 Depth=1
	ldr	x11, [x20, #16]
	add	x11, x11, #72           // =72
.LBB46_31:                              //   in Loop: Header=BB46_15 Depth=1
	ldr	x10, [x10, #8]
	ldr	w11, [x11]
	ldr	w12, [x20, #1184]
	ldr	w10, [x10]
	sub	x9, x9, x11
	lsr	x9, x9, x12
	sub	x4, x9, x10
.LBB46_32:                              //   in Loop: Header=BB46_15 Depth=1
	cmp	w8, #0                  // =0
	mov	x0, x20
	cset	w1, ne
	mov	w2, #1
	mov	w3, wzr
                                        // kill: def $w4 killed $w4 killed $x4
	bl	f2fs_gc
	cbnz	w0, .LBB46_37
// %bb.33:                              //   in Loop: Header=BB46_15 Depth=1
	ldr	w8, [x26, #108]
	and	w8, w8, #0xfdffffff
	str	w8, [x26, #108]
	ldr	w8, [x20, #1192]
	ldr	w9, [x20, #1188]
	ldr	x10, [x21, #8]
	mul	w8, w9, w8
	add	x8, x10, x8
	cmp	x8, x24
	str	x8, [x21, #8]
	b.ls	.LBB46_15
// %bb.34:
	mov	w23, wzr
	b	.LBB46_40
.LBB46_35:
	mov	w23, #-22
.LBB46_36:
	mov	w0, w23
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB46_37:
	mov	w23, w0
	cmn	w0, #16                 // =16
	b.ne	.LBB46_40
// %bb.38:
	mov	w23, #-11
	b	.LBB46_40
.LBB46_39:
	mov	w23, #-16
.LBB46_40:
	mov	x0, x19
	bl	mnt_drop_write_file
	b	.LBB46_36
.Lfunc_end46:
	.size	__f2fs_ioc_gc_range, .Lfunc_end46-__f2fs_ioc_gc_range
                                        // -- End function
	.p2align	3               // -- Begin function __f2fs_ioc_move_range
	.type	__f2fs_ioc_move_range,@function
__f2fs_ioc_move_range:                  // @__f2fs_ioc_move_range
// %bb.0:
	sub	sp, sp, #144            // =144
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	stp	x28, x27, [sp, #64]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #80]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #96]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	ldr	w8, [x0, #68]
	mvn	w8, w8
	tst	w8, #0x3
	b.ne	.LBB47_4
// %bb.1:
	mov	x21, x0
	ldr	w0, [x1]
	mov	x24, x1
	bl	__fdget
	ands	x19, x0, #0xfffffffffffffffc
	b.eq	.LBB47_4
// %bb.2:
	ldrb	w8, [x19, #68]
	mov	x20, x0
	tbnz	w8, #1, .LBB47_6
// %bb.3:
	mov	w26, #-9
	b	.LBB47_11
.LBB47_4:
	mov	w26, #-9
.LBB47_5:
	mov	w0, w26
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #144            // =144
	ret
.LBB47_6:
	mov	x0, x21
	bl	mnt_want_write_file
	mov	w26, w0
	cbnz	w0, .LBB47_11
// %bb.7:
	ldr	x8, [x21, #16]
	ldr	x9, [x19, #16]
	cmp	x8, x9
	b.ne	.LBB47_9
// %bb.8:
	ldr	x23, [x21, #32]
	ldr	x22, [x19, #32]
	ldr	x8, [x23, #40]
	ldr	x9, [x22, #40]
	cmp	x8, x9
	b.eq	.LBB47_13
.LBB47_9:
	mov	w26, #-18
.LBB47_10:
	mov	x0, x21
	bl	mnt_drop_write_file
.LBB47_11:
	tbz	w20, #0, .LBB47_5
// %bb.12:
	mov	x0, x19
	bl	fput
	b	.LBB47_5
.LBB47_13:
	ldrb	w9, [x8, #80]
	tbnz	w9, #0, .LBB47_55
// %bb.14:
	ldrh	w9, [x23]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB47_49
// %bb.15:
	ldrh	w9, [x22]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB47_49
// %bb.16:
	ldrb	w9, [x23, #13]
	tbnz	w9, #6, .LBB47_44
// %bb.17:
	ldrb	w9, [x22, #13]
	tbnz	w9, #6, .LBB47_44
// %bb.18:
	ldp	x25, x28, [x24, #8]
	orr	x9, x28, x25
	tbnz	x9, #63, .LBB47_49
// %bb.19:
	ldr	x27, [x24, #24]
	cmp	x23, x22
	ldr	x8, [x8, #1104]
	b.eq	.LBB47_45
.LBB47_20:
	add	x24, x23, #160          // =160
	stur	x8, [x29, #-8]          // 8-byte Folded Spill
	mov	x0, x24
	bl	down_write
	cmp	x23, x22
	b.eq	.LBB47_22
// %bb.21:
	add	x0, x22, #160           // =160
	bl	down_write_trylock
	cbz	w0, .LBB47_50
.LBB47_22:
	ldr	x8, [x23, #712]
	tbz	x8, #35, .LBB47_24
// %bb.23:
	mov	w1, #5
	mov	x0, x23
	bl	f2fs_reserve_compress_blocks_internal
	mov	w26, w0
	cbnz	w0, .LBB47_52
.LBB47_24:
	ldr	x8, [x22, #712]
	tbz	x8, #35, .LBB47_26
// %bb.25:
	mov	x0, x22
	mov	w1, #6
	bl	f2fs_reserve_compress_blocks_internal
	mov	w26, w0
	cbnz	w0, .LBB47_52
.LBB47_26:
	ldr	x8, [x23, #712]
	tbz	x8, #49, .LBB47_28
// %bb.27:
	mov	x0, x23
	mov	w1, #1
	add	x8, x23, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB47_28:
	ldr	x8, [x23, #712]
	tbz	x8, #43, .LBB47_32
// %bb.29:
	ldr	x8, [x23, #712]
	tbz	x8, #43, .LBB47_31
// %bb.30:
	ldr	x8, [x23, #712]
	tbnz	x8, #44, .LBB47_32
.LBB47_31:
	adrp	x1, .L__func__.f2fs_move_file_range
	mov	x0, x23
	add	x1, x1, :lo12:.L__func__.f2fs_move_file_range
	bl	f2fs_revoke_deduped_inode
	mov	w26, w0
	cbnz	w0, .LBB47_52
.LBB47_32:
	ldr	x8, [x22, #712]
	tbz	x8, #49, .LBB47_34
// %bb.33:
	mov	x0, x22
	mov	w1, #1
	add	x8, x22, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB47_34:
	ldr	x8, [x22, #712]
	tbz	x8, #43, .LBB47_38
// %bb.35:
	ldr	x8, [x22, #712]
	tbz	x8, #43, .LBB47_37
// %bb.36:
	ldr	x8, [x22, #712]
	tbnz	x8, #44, .LBB47_38
.LBB47_37:
	adrp	x1, .L__func__.f2fs_move_file_range
	mov	x0, x22
	add	x1, x1, :lo12:.L__func__.f2fs_move_file_range
	bl	f2fs_revoke_deduped_inode
	mov	w26, w0
	cbnz	w0, .LBB47_52
.LBB47_38:
	adds	x9, x27, x25
	mov	w26, #-22
	b.hs	.LBB47_52
// %bb.39:
	ldr	x8, [x23, #80]
	cmp	x9, x8
	b.hi	.LBB47_52
// %bb.40:
	sub	x9, x8, x25
	cmp	x27, #0                 // =0
	csel	x9, x9, x27, eq
	add	x10, x8, #4095          // =4095
	add	x11, x9, x25
	and	x10, x10, #0xfffffffffffff000
	sub	x10, x10, x25
	cmp	x11, x8
	csel	x27, x10, x9, eq
	cbz	x27, .LBB47_51
// %bb.41:
	ldr	x10, [x22, #80]
	add	x8, x9, x28
	cmp	x8, x10
	str	x10, [sp, #24]          // 8-byte Folded Spill
	csel	x8, x8, xzr, hi
	tst	x25, #0xfff
	stur	x8, [x29, #-16]         // 8-byte Folded Spill
	b.ne	.LBB47_43
// %bb.42:
	add	x8, x27, x25
	str	x8, [sp, #16]           // 8-byte Folded Spill
	orr	w8, w8, w28
	tst	x8, #0xfff
	b.eq	.LBB47_56
.LBB47_43:
	mov	w26, #-22
	b	.LBB47_52
.LBB47_44:
	mov	w26, #-95
	b	.LBB47_10
.LBB47_45:
	cmp	x25, x28
	b.ne	.LBB47_47
// %bb.46:
	mov	w26, wzr
	b	.LBB47_10
.LBB47_47:
	cmp	x28, x25
	b.le	.LBB47_20
// %bb.48:
	add	x9, x27, x25
	cmp	x9, x28
	b.ls	.LBB47_20
.LBB47_49:
	mov	w26, #-22
	b	.LBB47_10
.LBB47_50:
	mov	w26, #-16
	b	.LBB47_54
.LBB47_51:
	mov	w26, wzr
.LBB47_52:
	cmp	x23, x22
	b.eq	.LBB47_54
// %bb.53:
	add	x0, x22, #160           // =160
	bl	up_write
.LBB47_54:
	mov	x0, x24
	bl	up_write
	b	.LBB47_10
.LBB47_55:
	mov	w26, #-30
	b	.LBB47_10
.LBB47_56:
	mov	x0, x23
	bl	f2fs_convert_inline_inode
	mov	w26, w0
	cbnz	w0, .LBB47_52
// %bb.57:
	mov	x0, x22
	bl	f2fs_convert_inline_inode
	mov	w26, w0
	cbnz	w0, .LBB47_52
// %bb.58:
	ldr	x0, [x23, #48]
	mov	x1, x25
	ldr	x2, [sp, #16]           // 8-byte Folded Reload
	bl	filemap_write_and_wait_range
	mov	w26, w0
	cbnz	w0, .LBB47_52
// %bb.59:
	ldr	x0, [x22, #48]
	mov	x1, x28
	add	x2, x27, x28
	bl	filemap_write_and_wait_range
	mov	w26, w0
	cbnz	w0, .LBB47_52
// %bb.60:
	ldur	x0, [x29, #-8]          // 8-byte Folded Reload
	mov	w1, #1
	bl	f2fs_balance_fs
	add	x0, x23, #1016          // =1016
	str	x0, [sp, #16]           // 8-byte Folded Spill
	bl	down_write
	cmp	x23, x22
	b.eq	.LBB47_62
// %bb.61:
	add	x0, x22, #1016          // =1016
	bl	down_write_trylock
	cbz	w0, .LBB47_72
.LBB47_62:
	ldur	x26, [x29, #-8]         // 8-byte Folded Reload
	add	x0, x26, #368           // =368
	str	x0, [sp, #8]            // 8-byte Folded Spill
	bl	_raw_spin_lock
	ldr	x8, [x26, #352]
	cbz	x8, .LBB47_64
// %bb.63:
	ldur	x8, [x29, #-8]          // 8-byte Folded Reload
	adrp	x9, jiffies
	mov	x26, x9
	ldr	x8, [x8, #360]
	ldr	x9, [x9, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB47_78
.LBB47_64:
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	bl	_raw_spin_unlock
	ldur	x8, [x29, #-8]          // 8-byte Folded Reload
	add	x0, x8, #304            // =304
	stur	x0, [x29, #-8]          // 8-byte Folded Spill
	bl	down_read
	mov	x0, x23
	mov	x1, x22
	mov	w5, wzr
	asr	x2, x25, #12
	asr	x3, x28, #12
	lsr	x4, x27, #12
	bl	__exchange_data_block
	mov	w26, w0
	cbz	w0, .LBB47_67
.LBB47_65:
	ldur	x0, [x29, #-8]          // 8-byte Folded Reload
	bl	up_read
	cmp	x23, x22
	b.eq	.LBB47_73
// %bb.66:
	add	x0, x22, #1016          // =1016
	bl	up_write
	b	.LBB47_73
.LBB47_67:
	ldur	x8, [x29, #-16]         // 8-byte Folded Reload
	cbz	x8, .LBB47_74
// %bb.68:
	ldr	x27, [x22, #712]
	ldr	x25, [x22, #712]
	ldr	x8, [x22, #80]
	ldur	x9, [x29, #-16]         // 8-byte Folded Reload
	cmp	x8, x9
	b.eq	.LBB47_65
// %bb.69:
	ldur	x8, [x29, #-16]         // 8-byte Folded Reload
	mov	x0, x22
	mov	w1, #1
	str	x8, [x22, #80]
	bl	f2fs_mark_inode_dirty_sync
	tbz	w27, #1, .LBB47_71
// %bb.70:
	tbz	w25, #2, .LBB47_65
.LBB47_71:
	add	x8, x22, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB47_65
.LBB47_72:
	mov	w26, #-16
.LBB47_73:
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	bl	up_write
	b	.LBB47_52
.LBB47_74:
	ldr	x8, [x22, #80]
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	cmp	x9, x8
	b.eq	.LBB47_65
// %bb.75:
	ldr	x27, [x22, #712]
	mov	x0, x22
	ldr	x25, [x22, #712]
	mov	w1, #1
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	str	x8, [x22, #80]
	bl	f2fs_mark_inode_dirty_sync
	tbz	w27, #1, .LBB47_77
// %bb.76:
	tbz	w25, #2, .LBB47_65
.LBB47_77:
	add	x8, x22, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB47_65
.LBB47_78:
	mov	x1, xzr
	//APP
	mrs x0, sp_el0
	//NO_APP
	bl	show_stack
	ldur	x8, [x29, #-8]          // 8-byte Folded Reload
	adrp	x0, .L.str.31
	add	x0, x0, :lo12:.L.str.31
	ldr	x1, [x8, #360]
	ldr	x2, [x26, :lo12:jiffies]
	bl	printk
	ldur	x8, [x29, #-8]          // 8-byte Folded Reload
	mov	x1, xzr
	ldr	x0, [x8, #352]
	bl	show_stack
	b	.LBB47_64
.Lfunc_end47:
	.size	__f2fs_ioc_move_range, .Lfunc_end47-__f2fs_ioc_move_range
                                        // -- End function
	.p2align	3               // -- Begin function __exchange_data_block
	.type	__exchange_data_block,@function
__exchange_data_block:                  // @__exchange_data_block
// %bb.0:
	sub	sp, sp, #272            // =272
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #176]    // 16-byte Folded Spill
	add	x29, sp, #176           // =176
	stp	x28, x27, [sp, #192]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #208]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #224]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #240]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #256]    // 16-byte Folded Spill
	str	x3, [sp, #40]           // 8-byte Folded Spill
	str	x1, [sp, #88]           // 8-byte Folded Spill
	stur	x8, [x29, #-16]
	cbz	x4, .LBB48_251
// %bb.1:
	sub	x8, x29, #64            // =64
	mov	w26, #32832
	mov	x24, x4
	mov	x19, x2
	mov	x20, x0
	movk	w26, #96, lsl #16
	add	x8, x8, #8              // =8
	mov	w28, #1018
	mov	w27, #-1
	mov	w23, w5
	str	w5, [sp, #28]           // 4-byte Folded Spill
	str	x8, [sp, #72]           // 8-byte Folded Spill
.LBB48_2:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB48_10 Depth 2
                                        //       Child Loop BB48_25 Depth 3
                                        //         Child Loop BB48_36 Depth 4
                                        //     Child Loop BB48_86 Depth 2
                                        //       Child Loop BB48_120 Depth 3
	ldrh	w8, [x20]
	and	w9, w8, #0xf000
	mov	w8, w28
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB48_5
// %bb.3:                               //   in Loop: Header=BB48_2 Depth=1
	ldr	x9, [x20, #712]
	mov	w8, w28
	tbz	w9, #31, .LBB48_5
// %bb.4:                               //   in Loop: Header=BB48_2 Depth=1
	ldr	w8, [x20, #1268]
	neg	w8, w8
	and	w8, w8, w28
.LBB48_5:                               //   in Loop: Header=BB48_2 Depth=1
	lsl	w8, w8, #2
	cmp	x24, x8
	csel	x21, x8, x24, hi
	mov	w1, w26
	lsl	x22, x21, #2
	mov	x0, x22
	mov	w2, w27
	bl	kvmalloc_node
	str	x0, [sp, #64]           // 8-byte Folded Spill
	cbz	x0, .LBB48_373
// %bb.6:                               //   in Loop: Header=BB48_2 Depth=1
	mov	x0, x22
	mov	w1, w26
	mov	w2, w27
	bl	kvmalloc_node
	cbz	x0, .LBB48_374
// %bb.7:                               //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x20, #40]
	mov	x22, x21
	str	x21, [sp, #80]          // 8-byte Folded Spill
	mov	x27, x19
	ldr	x21, [sp, #64]          // 8-byte Folded Reload
	str	x24, [sp, #16]          // 8-byte Folded Spill
	mov	x24, x0
	ldr	x23, [x8, #1104]
	str	x0, [sp, #48]           // 8-byte Folded Spill
	b	.LBB48_10
.LBB48_8:                               //   in Loop: Header=BB48_10 Depth=2
	ldur	w9, [x29, #-36]
	sub	x8, x8, x9
	cmp	x8, x22
	csel	x28, x8, x22, lo
	sbfiz	x8, x28, #2, #32
	add	x21, x21, x8
	add	x24, x24, x8
.LBB48_9:                               //   in Loop: Header=BB48_10 Depth=2
	sxtw	x8, w28
	subs	x22, x22, x8
	add	x27, x8, x27
	mov	w28, #1018
	b.eq	.LBB48_82
.LBB48_10:                              //   Parent Loop BB48_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB48_25 Depth 3
                                        //         Child Loop BB48_36 Depth 4
	sub	x0, x29, #64            // =64
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	ldr	x8, [sp, #72]           // 8-byte Folded Reload
	sub	x0, x29, #64            // =64
	mov	x1, x27
	mov	w2, #2
	stur	x20, [x29, #-64]
	stp	xzr, xzr, [x8]
	str	wzr, [x8, #16]
	bl	f2fs_get_dnode_of_data
                                        // kill: def $w0 killed $w0 def $x0
	cbz	w0, .LBB48_16
// %bb.11:                              //   in Loop: Header=BB48_10 Depth=2
	cmn	w0, #2                  // =2
	b.ne	.LBB48_369
// %bb.12:                              //   in Loop: Header=BB48_10 Depth=2
	ldurb	w8, [x29, #-29]
	cbz	w8, .LBB48_368
// %bb.13:                              //   in Loop: Header=BB48_10 Depth=2
	ldrh	w8, [x20]
	and	w9, w8, #0xf000
	mov	w8, w28
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB48_8
// %bb.14:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x9, [x20, #712]
	mov	w8, w28
	tbz	w9, #31, .LBB48_8
// %bb.15:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	w8, [x20, #1268]
	neg	w8, w8
	and	w8, w8, w28
	b	.LBB48_8
.LBB48_16:                              //   in Loop: Header=BB48_10 Depth=2
	ldur	x25, [x29, #-48]
	lsl	x8, x25, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w9, w8
	b.ne	.LBB48_20
// %bb.17:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	w8, [x20, #1160]
	ldr	w9, [x20, #1168]
	ldrh	w10, [x20]
	add	w8, w9, w8, asr #2
	mov	w9, #923
	sub	w9, w9, w8
	and	w8, w10, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB48_23
// %bb.18:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [x20, #712]
	tbz	w8, #31, .LBB48_23
// %bb.19:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	w8, [x20, #1268]
	neg	w8, w8
	and	w9, w9, w8
	b	.LBB48_23
.LBB48_20:                              //   in Loop: Header=BB48_10 Depth=2
	ldrh	w8, [x20]
	mov	w9, w28
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB48_23
// %bb.21:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [x20, #712]
	mov	w9, w28
	tbz	w8, #31, .LBB48_23
// %bb.22:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	w8, [x20, #1268]
	neg	w8, w8
	and	w9, w8, w28
.LBB48_23:                              //   in Loop: Header=BB48_10 Depth=2
	ldur	w8, [x29, #-36]
	mov	w9, w9
	sub	x9, x9, x8
	cmp	x9, x22
	csel	x28, x9, x22, lo
	cmp	w28, #1                 // =1
	b.lt	.LBB48_49
// %bb.24:                              //   in Loop: Header=BB48_10 Depth=2
	sub	w9, w28, #1             // =1
	mov	w26, wzr
	lsl	x9, x9, #2
	add	x10, x21, x9
	add	x9, x24, x9
	add	x10, x10, #4            // =4
	add	x9, x9, #4              // =4
	str	x10, [sp, #56]          // 8-byte Folded Spill
	str	x9, [sp, #32]           // 8-byte Folded Spill
.LBB48_25:                              //   Parent Loop BB48_2 Depth=1
                                        //     Parent Loop BB48_10 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB48_36 Depth 4
	lsl	x9, x25, #6
	orr	x9, x9, #0xffffffc000000000
	ldr	w10, [x9, #4072]
	ldr	w11, [x9, #4076]
	cmp	w10, w11
	b.ne	.LBB48_30
// %bb.26:                              //   in Loop: Header=BB48_25 Depth=3
	ldur	x12, [x29, #-64]
	cbz	x12, .LBB48_29
// %bb.27:                              //   in Loop: Header=BB48_25 Depth=3
	ldr	x13, [x12, #712]
	tbz	w13, #26, .LBB48_30
// %bb.28:                              //   in Loop: Header=BB48_25 Depth=3
	ldr	w12, [x12, #1160]
	asr	w12, w12, #2
	b	.LBB48_31
.LBB48_29:                              //   in Loop: Header=BB48_25 Depth=3
	ldrb	w12, [x9, #3]
	tbnz	w12, #5, .LBB48_47
.LBB48_30:                              //   in Loop: Header=BB48_25 Depth=3
	mov	w12, wzr
.LBB48_31:                              //   in Loop: Header=BB48_25 Depth=3
	add	x13, x9, #360           // =360
	cmp	w10, w11
	csel	x9, x13, x9, eq
	add	w8, w12, w8
	ldr	w1, [x9, w8, uxtw #2]
	add	w8, w1, #3              // =3
	str	w1, [x21]
	cmp	w8, #4                  // =4
	b.lo	.LBB48_42
// %bb.32:                              //   in Loop: Header=BB48_25 Depth=3
	ldr	w9, [x23, #3024]
	cbz	w9, .LBB48_40
// %bb.33:                              //   in Loop: Header=BB48_25 Depth=3
	ldr	x8, [x23]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB48_39
// %bb.34:                              //   in Loop: Header=BB48_25 Depth=3
	ldr	x11, [x23, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB48_36
.LBB48_35:                              //   in Loop: Header=BB48_36 Depth=4
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB48_39
.LBB48_36:                              //   Parent Loop BB48_2 Depth=1
                                        //     Parent Loop BB48_10 Depth=2
                                        //       Parent Loop BB48_25 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldur	w12, [x11, #-4]
	cmp	w12, w1
	b.hi	.LBB48_35
// %bb.37:                              //   in Loop: Header=BB48_36 Depth=4
	ldr	w12, [x11]
	cmp	w12, w1
	b.lo	.LBB48_35
// %bb.38:                              //   in Loop: Header=BB48_25 Depth=3
	ldur	x8, [x11, #-80]
.LBB48_39:                              //   in Loop: Header=BB48_25 Depth=3
	cbz	x8, .LBB48_42
.LBB48_40:                              //   in Loop: Header=BB48_25 Depth=3
	mov	x0, x23
	mov	w2, #7
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB48_270
// %bb.41:                              //   in Loop: Header=BB48_25 Depth=3
	ldr	w1, [x21]
.LBB48_42:                              //   in Loop: Header=BB48_25 Depth=3
	mov	x0, x23
	bl	f2fs_is_checkpointed_data
	tbnz	w0, #0, .LBB48_45
// %bb.43:                              //   in Loop: Header=BB48_25 Depth=3
	ldr	w8, [x23, #1504]
	cmp	w8, #1                  // =1
	b.eq	.LBB48_252
// %bb.44:                              //   in Loop: Header=BB48_25 Depth=3
	sub	x0, x29, #64            // =64
	mov	w1, wzr
	bl	f2fs_update_data_blkaddr
	mov	w8, #1
	str	w8, [x24]
.LBB48_45:                              //   in Loop: Header=BB48_25 Depth=3
	ldur	w8, [x29, #-36]
	add	w26, w26, #1            // =1
	cmp	w26, w28
	add	w8, w8, #1              // =1
	stur	w8, [x29, #-36]
	b.ge	.LBB48_48
// %bb.46:                              //   in Loop: Header=BB48_25 Depth=3
	ldur	x25, [x29, #-48]
	add	x24, x24, #4            // =4
	add	x21, x21, #4            // =4
	b	.LBB48_25
.LBB48_47:                              //   in Loop: Header=BB48_25 Depth=3
	ldrh	w12, [x9, #360]
	lsr	w12, w12, #2
	b	.LBB48_31
.LBB48_48:                              //   in Loop: Header=BB48_10 Depth=2
	ldur	x25, [x29, #-48]
	ldr	x24, [sp, #32]          // 8-byte Folded Reload
	ldr	x21, [sp, #56]          // 8-byte Folded Reload
.LBB48_49:                              //   in Loop: Header=BB48_10 Depth=2
	cbz	x25, .LBB48_74
// %bb.50:                              //   in Loop: Header=BB48_10 Depth=2
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
	b.ne	.LBB48_66
// %bb.51:                              //   in Loop: Header=BB48_10 Depth=2
	tbnz	w8, #0, .LBB48_65
// %bb.52:                              //   in Loop: Header=BB48_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_55
// %bb.53:                              //   in Loop: Header=BB48_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_55
// %bb.54:                              //   in Loop: Header=BB48_10 Depth=2
	adrp	x26, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x26, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_55:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_57
// %bb.56:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB48_79
.LBB48_57:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x0, [x25, #24]
.LBB48_58:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_60
// %bb.59:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB48_80
.LBB48_60:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x0, [x25, #24]
.LBB48_61:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_63
// %bb.62:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB48_81
.LBB48_63:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x0, [x25, #24]
.LBB48_64:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB48_65:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB48_72
	b	.LBB48_422
.LBB48_66:                              //   in Loop: Header=BB48_10 Depth=2
	tbnz	w8, #0, .LBB48_71
// %bb.67:                              //   in Loop: Header=BB48_10 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_70
// %bb.68:                              //   in Loop: Header=BB48_10 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_70
// %bb.69:                              //   in Loop: Header=BB48_10 Depth=2
	adrp	x26, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x26, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_70:                              //   in Loop: Header=BB48_10 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB48_71:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB48_423
.LBB48_72:                              //   in Loop: Header=BB48_10 Depth=2
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
	cbnz	w9, .LBB48_74
// %bb.73:                              //   in Loop: Header=BB48_10 Depth=2
	bl	__put_page
.LBB48_74:                              //   in Loop: Header=BB48_10 Depth=2
	ldur	x8, [x29, #-56]
	cbz	x8, .LBB48_78
// %bb.75:                              //   in Loop: Header=BB48_10 Depth=2
	ldur	x9, [x29, #-48]
	cmp	x9, x8
	b.eq	.LBB48_78
// %bb.76:                              //   in Loop: Header=BB48_10 Depth=2
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
	cbnz	w9, .LBB48_78
// %bb.77:                              //   in Loop: Header=BB48_10 Depth=2
	bl	__put_page
.LBB48_78:                              //   in Loop: Header=BB48_10 Depth=2
	ldr	x8, [sp, #72]           // 8-byte Folded Reload
	stp	xzr, xzr, [x8]
	b	.LBB48_9
.LBB48_79:                              //   in Loop: Header=BB48_10 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB48_58
.LBB48_80:                              //   in Loop: Header=BB48_10 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB48_61
.LBB48_81:                              //   in Loop: Header=BB48_10 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB48_64
.LBB48_82:                              //   in Loop: Header=BB48_2 Depth=1
	ldr	x24, [sp, #80]          // 8-byte Folded Reload
	mov	w26, #32832
	ldr	w23, [sp, #28]          // 4-byte Folded Reload
	movk	w26, #96, lsl #16
	mov	w27, #-1
	cbz	x24, .LBB48_247
// %bb.83:                              //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x20, #40]
	mov	x22, xzr
	ldr	x8, [x8, #1104]
	str	x8, [sp, #56]           // 8-byte Folded Spill
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	add	x8, x8, #1              // =1
	str	x8, [sp, #8]            // 8-byte Folded Spill
	ldr	x8, [sp, #64]           // 8-byte Folded Reload
	add	x8, x8, #4              // =4
	str	x8, [sp]                // 8-byte Folded Spill
	b	.LBB48_86
.LBB48_84:                              //   in Loop: Header=BB48_86 Depth=2
	add	x8, x22, #1             // =1
.LBB48_85:                              //   in Loop: Header=BB48_86 Depth=2
	mov	x22, x8
	cmp	x8, x24
	b.hs	.LBB48_247
.LBB48_86:                              //   Parent Loop BB48_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB48_120 Depth 3
	ldr	x8, [sp, #64]           // 8-byte Folded Reload
	ldr	w8, [x8, x22, lsl #2]
	cbnz	w8, .LBB48_88
// %bb.87:                              //   in Loop: Header=BB48_86 Depth=2
	tbz	w23, #0, .LBB48_84
.LBB48_88:                              //   in Loop: Header=BB48_86 Depth=2
	cbz	w8, .LBB48_109
// %bb.89:                              //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [sp, #48]           // 8-byte Folded Reload
	ldr	w8, [x8, x22, lsl #2]
	cbnz	w8, .LBB48_109
// %bb.90:                              //   in Loop: Header=BB48_86 Depth=2
	add	x25, x22, x19
	mov	x0, x20
	mov	x1, x25
	mov	w2, #1
	bl	f2fs_get_lock_data_page
	mov	x27, x0
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB48_217
// %bb.91:                              //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	mov	x1, xzr
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	mov	w3, #1
	add	x2, x22, x8
	bl	f2fs_get_new_data_page
	mov	x26, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB48_218
// %bb.92:                              //   in Loop: Header=BB48_86 Depth=2
	lsl	x8, x27, #6
	orr	x1, x8, #0xffffffc000000000
	lsl	x8, x26, #6
	orr	x0, x8, #0xffffffc000000000
	mov	w2, #4096
	bl	memcpy
	mov	x0, x26
	bl	set_page_dirty
	cbz	x26, .LBB48_150
// %bb.93:                              //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x26, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x26, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x26, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB48_142
// %bb.94:                              //   in Loop: Header=BB48_86 Depth=2
	tbnz	w8, #0, .LBB48_108
// %bb.95:                              //   in Loop: Header=BB48_86 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_98
// %bb.96:                              //   in Loop: Header=BB48_86 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_98
// %bb.97:                              //   in Loop: Header=BB48_86 Depth=2
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_98:                              //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_100
// %bb.99:                              //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB48_208
.LBB48_100:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x0, [x26, #24]
.LBB48_101:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_103
// %bb.102:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB48_209
.LBB48_103:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x0, [x26, #24]
.LBB48_104:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_106
// %bb.105:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB48_210
.LBB48_106:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x0, [x26, #24]
.LBB48_107:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB48_108:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB48_148
	b	.LBB48_424
.LBB48_109:                             //   in Loop: Header=BB48_86 Depth=2
	sub	x0, x29, #64            // =64
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	sub	x0, x29, #64            // =64
	ldr	x21, [sp, #88]          // 8-byte Folded Reload
	mov	w2, wzr
	add	x1, x22, x8
	ldr	x8, [sp, #72]           // 8-byte Folded Reload
	stur	x21, [x29, #-64]
	stp	xzr, xzr, [x8]
	str	wzr, [x8, #16]
	bl	f2fs_get_dnode_of_data
	cbnz	w0, .LBB48_375
// %bb.110:                             //   in Loop: Header=BB48_86 Depth=2
	ldur	w1, [x29, #-40]
	sub	x2, x29, #80            // =80
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	mov	w3, wzr
	bl	get_node_info_ex
	ldur	x25, [x29, #-48]
	cbnz	w0, .LBB48_376
// %bb.111:                             //   in Loop: Header=BB48_86 Depth=2
	lsl	x8, x25, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w9, w8
	b.ne	.LBB48_115
// %bb.112:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	w8, [x21, #1160]
	ldr	w9, [x21, #1168]
	ldrh	w10, [x21]
	add	w8, w9, w8, asr #2
	mov	w9, #923
	sub	w9, w9, w8
	and	w8, w10, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB48_118
// %bb.113:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x21, #712]
	tbz	w8, #31, .LBB48_118
// %bb.114:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	w8, [x21, #1268]
	neg	w8, w8
	and	w9, w9, w8
	b	.LBB48_118
.LBB48_115:                             //   in Loop: Header=BB48_86 Depth=2
	ldrh	w8, [x21]
	mov	w9, w28
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB48_118
// %bb.116:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x21, #712]
	mov	w9, w28
	tbz	w8, #31, .LBB48_118
// %bb.117:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	w8, [x21, #1268]
	neg	w8, w8
	and	w9, w8, w28
.LBB48_118:                             //   in Loop: Header=BB48_86 Depth=2
	ldur	w8, [x29, #-36]
	mov	w9, w9
	sub	x10, x24, x22
	ldr	x11, [sp, #8]           // 8-byte Folded Reload
	add	x24, x22, #1            // =1
	sub	x9, x9, x8
	cmp	x9, x10
	add	x11, x11, x22
	csel	x27, x9, x10, lo
	lsl	x9, x22, #2
	add	x10, x27, x22
	lsl	x23, x11, #12
	str	x10, [sp, #32]          // 8-byte Folded Spill
	ldr	x10, [sp]               // 8-byte Folded Reload
	add	x22, x10, x9
	ldr	x10, [sp, #48]          // 8-byte Folded Reload
	add	x28, x10, x9
	b	.LBB48_120
.LBB48_119:                             //   in Loop: Header=BB48_120 Depth=3
	ldur	x25, [x29, #-48]
	add	x24, x24, #1            // =1
	ldur	w8, [x29, #-36]
	add	x23, x23, #1, lsl #12   // =4096
	add	x22, x22, #4            // =4
	add	x28, x28, #4            // =4
.LBB48_120:                             //   Parent Loop BB48_2 Depth=1
                                        //     Parent Loop BB48_86 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	lsl	x9, x25, #6
	orr	x9, x9, #0xffffffc000000000
	ldr	w10, [x9, #4072]
	ldr	w11, [x9, #4076]
	cmp	w10, w11
	b.ne	.LBB48_125
// %bb.121:                             //   in Loop: Header=BB48_120 Depth=3
	ldur	x12, [x29, #-64]
	cbz	x12, .LBB48_124
// %bb.122:                             //   in Loop: Header=BB48_120 Depth=3
	ldr	x13, [x12, #712]
	tbz	w13, #26, .LBB48_125
// %bb.123:                             //   in Loop: Header=BB48_120 Depth=3
	ldr	w12, [x12, #1160]
	asr	w12, w12, #2
	b	.LBB48_126
.LBB48_124:                             //   in Loop: Header=BB48_120 Depth=3
	ldrb	w12, [x9, #3]
	tbnz	w12, #5, .LBB48_141
.LBB48_125:                             //   in Loop: Header=BB48_120 Depth=3
	mov	w12, wzr
.LBB48_126:                             //   in Loop: Header=BB48_120 Depth=3
	add	x13, x9, #360           // =360
	cmp	w10, w11
	csel	x9, x13, x9, eq
	add	w8, w12, w8
	sub	x0, x29, #64            // =64
	mov	w1, #1
	ldr	w8, [x9, w8, uxtw #2]
	stur	w8, [x29, #-28]
	bl	f2fs_truncate_data_blocks_range
	ldr	w8, [x28]
	cbz	w8, .LBB48_134
// %bb.127:                             //   in Loop: Header=BB48_120 Depth=3
	ldr	x26, [x20, #712]
	mov	w9, #1
	ldr	x25, [x20, #712]
	mov	x0, x20
	ldrb	w8, [x20, #142]
	mov	w2, wzr
	lsl	x1, x9, x8
	bl	__dquot_free_space
	mov	x0, x20
	mov	w1, #1
	bl	__mark_inode_dirty
	mov	x0, x20
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	tbz	w26, #1, .LBB48_129
// %bb.128:                             //   in Loop: Header=BB48_120 Depth=3
	tbz	w25, #2, .LBB48_130
.LBB48_129:                             //   in Loop: Header=BB48_120 Depth=3
	add	x8, x20, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB48_130:                             //   in Loop: Header=BB48_120 Depth=3
	ldr	x21, [sp, #88]          // 8-byte Folded Reload
	mov	w9, #1
	mov	w2, #5
	ldr	x26, [x21, #712]
	mov	x0, x21
	ldr	x25, [x21, #712]
	ldrb	w8, [x21, #142]
	lsl	x1, x9, x8
	bl	__dquot_alloc_space
	mov	x0, x21
	mov	w1, #1
	bl	__mark_inode_dirty
	mov	x0, x21
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	tbz	w26, #1, .LBB48_132
// %bb.131:                             //   in Loop: Header=BB48_120 Depth=3
	tbz	w25, #2, .LBB48_133
.LBB48_132:                             //   in Loop: Header=BB48_120 Depth=3
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	add	x8, x8, #712            // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB48_133:                             //   in Loop: Header=BB48_120 Depth=3
	ldur	w2, [x29, #-28]
	sub	x1, x29, #64            // =64
	ldur	w3, [x22, #-4]
	mov	w5, #1
	ldurb	w4, [x29, #-68]
	mov	w6, wzr
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	bl	f2fs_replace_block
	str	wzr, [x28]
.LBB48_134:                             //   in Loop: Header=BB48_120 Depth=3
	ldr	x9, [sp, #88]           // 8-byte Folded Reload
	ldur	w8, [x29, #-36]
	ldr	x9, [x9, #80]
	add	w8, w8, #1              // =1
	cmp	x9, x23
	stur	w8, [x29, #-36]
	b.hs	.LBB48_138
// %bb.135:                             //   in Loop: Header=BB48_120 Depth=3
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	mov	w1, #1
	ldr	x26, [x0, #712]
	ldr	x25, [x0, #712]
	str	x23, [x0, #80]
	bl	f2fs_mark_inode_dirty_sync
	tbz	w26, #1, .LBB48_137
// %bb.136:                             //   in Loop: Header=BB48_120 Depth=3
	tbz	w25, #2, .LBB48_138
.LBB48_137:                             //   in Loop: Header=BB48_120 Depth=3
	ldr	x8, [sp, #88]           // 8-byte Folded Reload
	add	x8, x8, #712            // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB48_138:                             //   in Loop: Header=BB48_120 Depth=3
	subs	x27, x27, #1            // =1
	b.eq	.LBB48_178
// %bb.139:                             //   in Loop: Header=BB48_120 Depth=3
	ldr	w8, [x28, #4]
	cbnz	w8, .LBB48_119
// %bb.140:                             //   in Loop: Header=BB48_120 Depth=3
	ldr	w8, [x22]
	cbz	w8, .LBB48_119
	b	.LBB48_177
.LBB48_141:                             //   in Loop: Header=BB48_120 Depth=3
	ldrh	w12, [x9, #360]
	lsr	w12, w12, #2
	b	.LBB48_126
.LBB48_142:                             //   in Loop: Header=BB48_86 Depth=2
	tbnz	w8, #0, .LBB48_147
// %bb.143:                             //   in Loop: Header=BB48_86 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_146
// %bb.144:                             //   in Loop: Header=BB48_86 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_146
// %bb.145:                             //   in Loop: Header=BB48_86 Depth=2
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_146:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB48_147:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB48_425
.LBB48_148:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, x26
	bl	unlock_page
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x26, x9, eq
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
	cbnz	w9, .LBB48_150
// %bb.149:                             //   in Loop: Header=BB48_86 Depth=2
	bl	__put_page
.LBB48_150:                             //   in Loop: Header=BB48_86 Depth=2
	cbz	x27, .LBB48_175
// %bb.151:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x27, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x27, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x27, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB48_167
// %bb.152:                             //   in Loop: Header=BB48_86 Depth=2
	tbnz	w8, #0, .LBB48_166
// %bb.153:                             //   in Loop: Header=BB48_86 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_156
// %bb.154:                             //   in Loop: Header=BB48_86 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_156
// %bb.155:                             //   in Loop: Header=BB48_86 Depth=2
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_156:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_158
// %bb.157:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB48_211
.LBB48_158:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x0, [x27, #24]
.LBB48_159:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_161
// %bb.160:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB48_212
.LBB48_161:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x0, [x27, #24]
.LBB48_162:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_164
// %bb.163:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB48_213
.LBB48_164:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x0, [x27, #24]
.LBB48_165:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB48_166:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB48_173
	b	.LBB48_426
.LBB48_167:                             //   in Loop: Header=BB48_86 Depth=2
	tbnz	w8, #0, .LBB48_172
// %bb.168:                             //   in Loop: Header=BB48_86 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_171
// %bb.169:                             //   in Loop: Header=BB48_86 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_171
// %bb.170:                             //   in Loop: Header=BB48_86 Depth=2
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_171:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB48_172:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB48_427
.LBB48_173:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, x27
	bl	unlock_page
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
	cbnz	w9, .LBB48_175
// %bb.174:                             //   in Loop: Header=BB48_86 Depth=2
	bl	__put_page
.LBB48_175:                             //   in Loop: Header=BB48_86 Depth=2
	add	x2, x25, #1             // =1
	mov	x0, x20
	mov	x1, x25
	bl	f2fs_truncate_hole
                                        // kill: def $w0 killed $w0 def $x0
	cbnz	w0, .LBB48_315
// %bb.176:                             //   in Loop: Header=BB48_86 Depth=2
	mov	w26, #32832
	add	x8, x22, #1             // =1
	movk	w26, #96, lsl #16
	mov	w27, #-1
	b	.LBB48_85
.LBB48_177:                             //   in Loop: Header=BB48_86 Depth=2
	str	x24, [sp, #32]          // 8-byte Folded Spill
.LBB48_178:                             //   in Loop: Header=BB48_86 Depth=2
	ldur	x25, [x29, #-48]
	mov	w26, #32832
	ldr	x24, [sp, #80]          // 8-byte Folded Reload
	movk	w26, #96, lsl #16
	ldr	w23, [sp, #28]          // 4-byte Folded Reload
	mov	w28, #1018
	mov	w27, #-1
	cbz	x25, .LBB48_203
// %bb.179:                             //   in Loop: Header=BB48_86 Depth=2
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
	b.ne	.LBB48_195
// %bb.180:                             //   in Loop: Header=BB48_86 Depth=2
	tbnz	w8, #0, .LBB48_194
// %bb.181:                             //   in Loop: Header=BB48_86 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_184
// %bb.182:                             //   in Loop: Header=BB48_86 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_184
// %bb.183:                             //   in Loop: Header=BB48_86 Depth=2
	adrp	x22, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x22, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_184:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_186
// %bb.185:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB48_214
.LBB48_186:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x0, [x25, #24]
.LBB48_187:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_189
// %bb.188:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB48_215
.LBB48_189:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x0, [x25, #24]
.LBB48_190:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_192
// %bb.191:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB48_216
.LBB48_192:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x0, [x25, #24]
.LBB48_193:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB48_194:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB48_201
	b	.LBB48_420
.LBB48_195:                             //   in Loop: Header=BB48_86 Depth=2
	tbnz	w8, #0, .LBB48_200
// %bb.196:                             //   in Loop: Header=BB48_86 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_199
// %bb.197:                             //   in Loop: Header=BB48_86 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_199
// %bb.198:                             //   in Loop: Header=BB48_86 Depth=2
	adrp	x22, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x22, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_199:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB48_200:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB48_421
.LBB48_201:                             //   in Loop: Header=BB48_86 Depth=2
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
	cbnz	w9, .LBB48_203
// %bb.202:                             //   in Loop: Header=BB48_86 Depth=2
	bl	__put_page
.LBB48_203:                             //   in Loop: Header=BB48_86 Depth=2
	ldur	x8, [x29, #-56]
	cbz	x8, .LBB48_207
// %bb.204:                             //   in Loop: Header=BB48_86 Depth=2
	ldur	x9, [x29, #-48]
	cmp	x9, x8
	b.eq	.LBB48_207
// %bb.205:                             //   in Loop: Header=BB48_86 Depth=2
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
	cbnz	w9, .LBB48_207
// %bb.206:                             //   in Loop: Header=BB48_86 Depth=2
	bl	__put_page
.LBB48_207:                             //   in Loop: Header=BB48_86 Depth=2
	ldr	x8, [sp, #32]           // 8-byte Folded Reload
	b	.LBB48_85
.LBB48_208:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB48_101
.LBB48_209:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB48_104
.LBB48_210:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB48_107
.LBB48_211:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB48_159
.LBB48_212:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB48_162
.LBB48_213:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB48_165
.LBB48_214:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB48_187
.LBB48_215:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB48_190
.LBB48_216:                             //   in Loop: Header=BB48_86 Depth=2
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB48_193
.LBB48_217:                             //   in Loop: Header=BB48_2 Depth=1
	mov	x0, x27
	b	.LBB48_236
.LBB48_218:                             //   in Loop: Header=BB48_2 Depth=1
	cbz	x27, .LBB48_235
// %bb.219:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x27, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x27, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x27, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB48_237
// %bb.220:                             //   in Loop: Header=BB48_2 Depth=1
	tbnz	w8, #0, .LBB48_234
// %bb.221:                             //   in Loop: Header=BB48_2 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_224
// %bb.222:                             //   in Loop: Header=BB48_2 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_224
// %bb.223:                             //   in Loop: Header=BB48_2 Depth=1
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_224:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_226
// %bb.225:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB48_248
.LBB48_226:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x0, [x27, #24]
.LBB48_227:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_229
// %bb.228:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB48_249
.LBB48_229:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x0, [x27, #24]
.LBB48_230:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_232
// %bb.231:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB48_250
.LBB48_232:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x0, [x27, #24]
.LBB48_233:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB48_234:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB48_243
	b	.LBB48_428
.LBB48_235:                             //   in Loop: Header=BB48_2 Depth=1
	mov	x0, x26
.LBB48_236:                             //   in Loop: Header=BB48_2 Depth=1
	mov	w26, #32832
	mov	w27, #-1
	movk	w26, #96, lsl #16
	b	.LBB48_246
.LBB48_237:                             //   in Loop: Header=BB48_2 Depth=1
	tbnz	w8, #0, .LBB48_242
// %bb.238:                             //   in Loop: Header=BB48_2 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_241
// %bb.239:                             //   in Loop: Header=BB48_2 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_241
// %bb.240:                             //   in Loop: Header=BB48_2 Depth=1
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_241:                             //   in Loop: Header=BB48_2 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB48_242:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB48_429
.LBB48_243:                             //   in Loop: Header=BB48_2 Depth=1
	mov	x0, x27
	mov	x21, x26
	bl	unlock_page
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
	cbnz	w9, .LBB48_245
// %bb.244:                             //   in Loop: Header=BB48_2 Depth=1
	bl	__put_page
.LBB48_245:                             //   in Loop: Header=BB48_2 Depth=1
	mov	w26, #32832
	mov	w27, #-1
	movk	w26, #96, lsl #16
	mov	x0, x21
.LBB48_246:                             //   in Loop: Header=BB48_2 Depth=1
	cbnz	w0, .LBB48_315
.LBB48_247:                             //   in Loop: Header=BB48_2 Depth=1
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	add	x19, x24, x19
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	add	x8, x24, x8
	str	x8, [sp, #40]           // 8-byte Folded Spill
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	sub	x24, x8, x24
	bl	kvfree
	ldr	x0, [sp, #48]           // 8-byte Folded Reload
	bl	kvfree
	str	xzr, [sp, #56]          // 8-byte Folded Spill
	cbnz	x24, .LBB48_2
	b	.LBB48_371
.LBB48_248:                             //   in Loop: Header=BB48_2 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB48_227
.LBB48_249:                             //   in Loop: Header=BB48_2 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB48_230
.LBB48_250:                             //   in Loop: Header=BB48_2 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB48_233
.LBB48_251:
	str	xzr, [sp, #56]          // 8-byte Folded Spill
	b	.LBB48_371
.LBB48_252:
	ldur	x23, [x29, #-48]
	ldr	x24, [sp, #80]          // 8-byte Folded Reload
	cbz	x23, .LBB48_296
// %bb.253:
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
	b.ne	.LBB48_288
// %bb.254:
	tbnz	w8, #0, .LBB48_268
// %bb.255:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_258
// %bb.256:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_258
// %bb.257:
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_258:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_260
// %bb.259:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB48_407
.LBB48_260:
	ldr	x0, [x23, #24]
.LBB48_261:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_263
// %bb.262:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB48_408
.LBB48_263:
	ldr	x0, [x23, #24]
.LBB48_264:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_266
// %bb.265:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB48_409
.LBB48_266:
	ldr	x0, [x23, #24]
.LBB48_267:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB48_268:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB48_294
// %bb.269:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_270:
	ldur	x23, [x29, #-48]
	ldr	x24, [sp, #80]          // 8-byte Folded Reload
	cbz	x23, .LBB48_309
// %bb.271:
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
	b.ne	.LBB48_301
// %bb.272:
	tbnz	w8, #0, .LBB48_286
// %bb.273:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_276
// %bb.274:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_276
// %bb.275:
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_276:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_278
// %bb.277:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB48_410
.LBB48_278:
	ldr	x0, [x23, #24]
.LBB48_279:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_281
// %bb.280:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB48_411
.LBB48_281:
	ldr	x0, [x23, #24]
.LBB48_282:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_284
// %bb.283:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB48_412
.LBB48_284:
	ldr	x0, [x23, #24]
.LBB48_285:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB48_286:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB48_307
// %bb.287:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_288:
	tbnz	w8, #0, .LBB48_293
// %bb.289:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_292
// %bb.290:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_292
// %bb.291:
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_292:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB48_293:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB48_430
.LBB48_294:
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
	cbnz	w9, .LBB48_296
// %bb.295:
	bl	__put_page
.LBB48_296:
	ldur	x8, [x29, #-56]
	cbz	x8, .LBB48_300
// %bb.297:
	ldur	x9, [x29, #-48]
	cmp	x9, x8
	b.eq	.LBB48_300
// %bb.298:
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
	cbnz	w9, .LBB48_300
// %bb.299:
	bl	__put_page
.LBB48_300:
	mov	w0, #-95
	b	.LBB48_314
.LBB48_301:
	tbnz	w8, #0, .LBB48_306
// %bb.302:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_305
// %bb.303:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_305
// %bb.304:
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_305:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB48_306:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB48_431
.LBB48_307:
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
	cbnz	w9, .LBB48_309
// %bb.308:
	bl	__put_page
.LBB48_309:
	ldur	x8, [x29, #-56]
	cbz	x8, .LBB48_313
// %bb.310:
	ldur	x9, [x29, #-48]
	cmp	x9, x8
	b.eq	.LBB48_313
// %bb.311:
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
	cbnz	w9, .LBB48_313
// %bb.312:
	bl	__put_page
.LBB48_313:
	mov	w0, #-117
.LBB48_314:
	ldr	x8, [sp, #72]           // 8-byte Folded Reload
	stp	xzr, xzr, [x8]
.LBB48_315:
	str	x0, [sp, #56]           // 8-byte Folded Spill
	cbz	x24, .LBB48_370
.LBB48_316:
	ldr	x8, [x20, #40]
	mov	x21, xzr
	ldr	x25, [sp, #64]          // 8-byte Folded Reload
	ldr	x28, [sp, #48]          // 8-byte Folded Reload
	ldr	x23, [x8, #1104]
	sub	x8, x29, #64            // =64
	str	x8, [sp, #88]           // 8-byte Folded Spill
	sub	x8, x29, #64            // =64
	add	x22, x8, #8             // =8
	add	x26, x23, #2236         // =2236
	b	.LBB48_319
.LBB48_317:                             //   in Loop: Header=BB48_319 Depth=1
	stp	xzr, xzr, [x22]
.LBB48_318:                             //   in Loop: Header=BB48_319 Depth=1
	add	x21, x21, #1            // =1
	add	x28, x28, #4            // =4
	add	x25, x25, #4            // =4
	add	x19, x19, #1            // =1
	cmp	x21, x24
	b.eq	.LBB48_370
.LBB48_319:                             // =>This Inner Loop Header: Depth=1
	ldr	w8, [x28]
	cbz	w8, .LBB48_318
// %bb.320:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x0, [sp, #88]           // 8-byte Folded Reload
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	sub	x0, x29, #64            // =64
	mov	x1, x19
	mov	w2, #2
	stur	x20, [x29, #-64]
	stp	xzr, xzr, [x22]
	str	wzr, [x22, #16]
	bl	f2fs_get_dnode_of_data
	cbz	w0, .LBB48_330
// %bb.321:                             //   in Loop: Header=BB48_319 Depth=1
	mov	x0, x26
	bl	_raw_spin_lock
	ldr	w8, [x23, #1240]
	cbz	w8, .LBB48_359
.LBB48_322:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	w9, [x23, #1252]
	sub	w8, w8, #1              // =1
	str	w8, [x23, #1240]
	cbz	w9, .LBB48_325
// %bb.323:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	w8, [x23, #1256]
	cmp	w8, w9
	b.hs	.LBB48_325
// %bb.324:                             //   in Loop: Header=BB48_319 Depth=1
	add	w8, w8, #1              // =1
	str	w8, [x23, #1256]
.LBB48_325:                             //   in Loop: Header=BB48_319 Depth=1
	mov	x0, x26
	bl	_raw_spin_unlock
	ldr	x3, [x20, #144]
	cmp	x3, #7                  // =7
	b.ls	.LBB48_363
// %bb.326:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x24, [x20, #712]
	mov	w9, #1
	ldr	x27, [x20, #712]
	mov	x0, x20
	ldrb	w8, [x20, #142]
	mov	w2, wzr
	lsl	x1, x9, x8
	bl	__dquot_free_space
	mov	x0, x20
	mov	w1, #1
	bl	__mark_inode_dirty
	mov	x0, x20
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	tbz	w24, #1, .LBB48_328
// %bb.327:                             //   in Loop: Header=BB48_319 Depth=1
	tbz	w27, #2, .LBB48_329
.LBB48_328:                             //   in Loop: Header=BB48_319 Depth=1
	add	x8, x20, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB48_329:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	w1, [x25]
	mov	x0, x23
	bl	f2fs_invalidate_blocks
	ldr	x24, [sp, #80]          // 8-byte Folded Reload
	ldur	x27, [x29, #-48]
	cbnz	x27, .LBB48_331
	b	.LBB48_355
.LBB48_330:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	w1, [x25]
	sub	x0, x29, #64            // =64
	bl	f2fs_update_data_blkaddr
	ldur	x27, [x29, #-48]
	cbz	x27, .LBB48_355
.LBB48_331:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x8, [x27, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x27, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x27, x10, eq
	mov	w10, #8208
	movk	w10, #62197, lsl #16
	cmp	x9, x10
	ldr	x8, [x8]
	b.ne	.LBB48_347
// %bb.332:                             //   in Loop: Header=BB48_319 Depth=1
	tbnz	w8, #0, .LBB48_346
// %bb.333:                             //   in Loop: Header=BB48_319 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_336
// %bb.334:                             //   in Loop: Header=BB48_319 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_336
// %bb.335:                             //   in Loop: Header=BB48_319 Depth=1
	adrp	x24, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x24, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	ldr	x24, [sp, #80]          // 8-byte Folded Reload
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_336:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_338
// %bb.337:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB48_365
.LBB48_338:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x0, [x27, #24]
.LBB48_339:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_341
// %bb.340:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB48_366
.LBB48_341:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x0, [x27, #24]
.LBB48_342:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_344
// %bb.343:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x8, [x27]
	tbnz	w8, #10, .LBB48_367
.LBB48_344:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x0, [x27, #24]
.LBB48_345:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB48_346:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB48_353
	b	.LBB48_417
.LBB48_347:                             //   in Loop: Header=BB48_319 Depth=1
	tbnz	w8, #0, .LBB48_352
// %bb.348:                             //   in Loop: Header=BB48_319 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_351
// %bb.349:                             //   in Loop: Header=BB48_319 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_351
// %bb.350:                             //   in Loop: Header=BB48_319 Depth=1
	adrp	x24, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x24, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	ldr	x24, [sp, #80]          // 8-byte Folded Reload
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_351:                             //   in Loop: Header=BB48_319 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB48_352:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x8, [x27, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x27, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB48_418
.LBB48_353:                             //   in Loop: Header=BB48_319 Depth=1
	mov	x0, x27
	bl	unlock_page
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
	cbnz	w9, .LBB48_355
// %bb.354:                             //   in Loop: Header=BB48_319 Depth=1
	bl	__put_page
.LBB48_355:                             //   in Loop: Header=BB48_319 Depth=1
	ldur	x8, [x29, #-56]
	cbz	x8, .LBB48_317
// %bb.356:                             //   in Loop: Header=BB48_319 Depth=1
	ldur	x9, [x29, #-48]
	cmp	x9, x8
	b.eq	.LBB48_317
// %bb.357:                             //   in Loop: Header=BB48_319 Depth=1
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
	cbnz	w9, .LBB48_317
// %bb.358:                             //   in Loop: Header=BB48_319 Depth=1
	bl	__put_page
	b	.LBB48_317
.LBB48_359:                             //   in Loop: Header=BB48_319 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_362
// %bb.360:                             //   in Loop: Header=BB48_319 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_362
// %bb.361:                             //   in Loop: Header=BB48_319 Depth=1
	adrp	x24, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.dec_valid_block_count
	add	x1, x1, :lo12:.L.str.8
	add	x2, x2, :lo12:.L__func__.dec_valid_block_count
	mov	w3, #3406
	ldr	x0, [x24, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_362:                             //   in Loop: Header=BB48_319 Depth=1
	mov	x0, x23
	bl	f2fs_print_raw_sb_info
	mov	x0, x23
	bl	f2fs_print_ckpt_info
	mov	x0, x23
	bl	f2fs_print_sbi_info
	ldr	w8, [x23, #1240]
	cbnz	w8, .LBB48_322
	b	.LBB48_419
.LBB48_363:                             //   in Loop: Header=BB48_319 Depth=1
	ldr	x2, [x20, #64]
	adrp	x1, .L.str.30
	mov	x0, x23
	add	x1, x1, :lo12:.L.str.30
	mov	w4, #8
	bl	f2fs_printk
	cbz	x23, .LBB48_329
// %bb.364:                             //   in Loop: Header=BB48_319 Depth=1
	add	x8, x23, #80            // =80
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB48_329
.LBB48_365:                             //   in Loop: Header=BB48_319 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB48_339
.LBB48_366:                             //   in Loop: Header=BB48_319 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB48_342
.LBB48_367:                             //   in Loop: Header=BB48_319 Depth=1
	mov	x0, x27
	bl	__page_file_mapping
	b	.LBB48_345
.LBB48_368:
	mov	w0, #-2
.LBB48_369:
	ldr	x24, [sp, #80]          // 8-byte Folded Reload
	str	x0, [sp, #56]           // 8-byte Folded Spill
	cbnz	x24, .LBB48_316
.LBB48_370:
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	bl	kvfree
	ldr	x0, [sp, #48]           // 8-byte Folded Reload
	bl	kvfree
.LBB48_371:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB48_413
// %bb.372:
	ldp	x20, x19, [sp, #256]    // 16-byte Folded Reload
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
                                        // kill: def $w0 killed $w0 killed $x0
	ldp	x22, x21, [sp, #240]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #224]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #208]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #192]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #176]    // 16-byte Folded Reload
	add	sp, sp, #272            // =272
	ret
.LBB48_373:
	mov	w8, #-12
                                        // kill: def $w8 killed $w8 def $x8
	str	x8, [sp, #56]           // 8-byte Folded Spill
	b	.LBB48_371
.LBB48_374:
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	bl	kvfree
	mov	w8, #-12
	str	x8, [sp, #56]           // 8-byte Folded Spill
	b	.LBB48_371
.LBB48_375:
	mov	w23, w0
	str	x23, [sp, #56]          // 8-byte Folded Spill
	b	.LBB48_316
.LBB48_376:
	mov	w23, w0
	cbz	x25, .LBB48_402
// %bb.377:
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
	b.ne	.LBB48_394
// %bb.378:
	tbnz	w8, #0, .LBB48_392
// %bb.379:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_382
// %bb.380:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_382
// %bb.381:
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_382:
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_384
// %bb.383:
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB48_414
.LBB48_384:
	ldr	x0, [x25, #24]
.LBB48_385:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_387
// %bb.386:
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB48_415
.LBB48_387:
	ldr	x0, [x25, #24]
.LBB48_388:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB48_390
// %bb.389:
	ldr	x8, [x25]
	tbnz	w8, #10, .LBB48_416
.LBB48_390:
	ldr	x0, [x25, #24]
.LBB48_391:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB48_392:
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB48_400
// %bb.393:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_394:
	tbnz	w8, #0, .LBB48_399
// %bb.395:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB48_398
// %bb.396:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB48_398
// %bb.397:
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB48_398:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB48_399:
	ldr	x8, [x25, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x25, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB48_432
.LBB48_400:
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
	cbnz	w9, .LBB48_402
// %bb.401:
	bl	__put_page
.LBB48_402:
	ldur	x8, [x29, #-56]
	cbz	x8, .LBB48_406
// %bb.403:
	ldur	x9, [x29, #-48]
	cmp	x9, x8
	b.eq	.LBB48_406
// %bb.404:
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
	cbnz	w9, .LBB48_406
// %bb.405:
	bl	__put_page
.LBB48_406:
	ldr	x8, [sp, #72]           // 8-byte Folded Reload
	str	x23, [sp, #56]          // 8-byte Folded Spill
	stp	xzr, xzr, [x8]
	b	.LBB48_316
.LBB48_407:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB48_261
.LBB48_408:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB48_264
.LBB48_409:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB48_267
.LBB48_410:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB48_279
.LBB48_411:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB48_282
.LBB48_412:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB48_285
.LBB48_413:
	bl	__stack_chk_fail
.LBB48_414:
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB48_385
.LBB48_415:
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB48_388
.LBB48_416:
	mov	x0, x25
	bl	__page_file_mapping
	b	.LBB48_391
.LBB48_417:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_418:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_419:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3406; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_420:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_421:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_422:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_423:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_424:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_425:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_426:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_427:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_428:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_429:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_430:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_431:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB48_432:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end48:
	.size	__exchange_data_block, .Lfunc_end48-__exchange_data_block
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_inode_param_check
	.type	f2fs_inode_param_check,@function
f2fs_inode_param_check:                 // @f2fs_inode_param_check
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldrh	w8, [x1]
	mov	x29, sp
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB49_4
// %bb.1:
	cmp	w2, #2                  // =2
	b.eq	.LBB49_8
// %bb.2:
	ldr	x8, [x1, #80]
	cmp	x8, #16, lsl #12        // =65536
	b.ge	.LBB49_5
// %bb.3:
	ldr	x2, [x1, #64]
	adrp	x1, .L.str.64
	add	x1, x1, :lo12:.L.str.64
	mov	w3, #65536
	bl	f2fs_printk
.LBB49_4:
	mov	w8, #-22
	b	.LBB49_14
.LBB49_5:
	cmp	w2, #1                  // =1
	b.ne	.LBB49_8
// %bb.6:
	ldr	x8, [x1, #712]
	tbnz	x8, #49, .LBB49_8
// %bb.7:
	ldr	x2, [x1, #64]
	adrp	x1, .L.str.65
	add	x1, x1, :lo12:.L.str.65
	bl	f2fs_printk
	mov	w8, #-22
	b	.LBB49_14
.LBB49_8:
	ldr	x8, [x1, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB49_15
// %bb.9:
	ldr	w8, [x1, #1256]
	cbnz	w8, .LBB49_12
// %bb.10:
	ldr	x8, [x1, #712]
	tbnz	x8, #35, .LBB49_12
// %bb.11:
	ldr	x8, [x1, #712]
	tbz	x8, #34, .LBB49_16
.LBB49_12:
	ldr	x2, [x1, #64]
	adrp	x1, .L.str.66
	add	x1, x1, :lo12:.L.str.66
.LBB49_13:
	bl	f2fs_printk
	mov	w8, #-13
.LBB49_14:
	mov	w0, w8
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.LBB49_15:
	ldr	x8, [x1, #712]
	tbnz	w8, #31, .LBB49_12
.LBB49_16:
	ldr	w9, [x1, #12]
	tbnz	w9, #16, .LBB49_23
// %bb.17:
	ldr	x8, [x1, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB49_24
// %bb.18:
	ldr	x8, [x1, #712]
	tbnz	w8, #17, .LBB49_25
// %bb.19:
	ldr	x8, [x1, #712]
	tbnz	w8, #28, .LBB49_26
// %bb.20:
	mov	w8, wzr
	tbz	w9, #3, .LBB49_14
// %bb.21:
	cmp	w2, #2                  // =2
	b.eq	.LBB49_14
// %bb.22:
	ldr	x2, [x1, #64]
	adrp	x1, .L.str.71
	add	x1, x1, :lo12:.L.str.71
	b	.LBB49_13
.LBB49_23:
	ldr	x2, [x1, #64]
	adrp	x1, .L.str.67
	add	x1, x1, :lo12:.L.str.67
	b	.LBB49_13
.LBB49_24:
	ldr	x2, [x1, #64]
	adrp	x1, .L.str.68
	add	x1, x1, :lo12:.L.str.68
	b	.LBB49_13
.LBB49_25:
	ldr	x2, [x1, #64]
	adrp	x1, .L.str.69
	add	x1, x1, :lo12:.L.str.69
	b	.LBB49_13
.LBB49_26:
	ldr	x2, [x1, #64]
	adrp	x1, .L.str.70
	add	x1, x1, :lo12:.L.str.70
	b	.LBB49_13
.Lfunc_end49:
	.size	f2fs_inode_param_check, .Lfunc_end49-f2fs_inode_param_check
                                        // -- End function
	.p2align	3               // -- Begin function dedup_file_is_same
	.type	dedup_file_is_same,@function
dedup_file_is_same:                     // @dedup_file_is_same
// %bb.0:
	sub	sp, sp, #112            // =112
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x28, x27, [sp, #32]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #48]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	ldr	x8, [x0, #80]
	ldr	x9, [x1, #80]
	cmp	x8, x9
	b.ne	.LBB50_31
// %bb.1:
	add	x8, x8, #4095           // =4095
	mov	x19, x1
	mov	x20, x0
	mov	w27, wzr
	mov	w26, #1
	lsr	x28, x8, #12
	//APP
	mrs x25, sp_el0
	//NO_APP
.LBB50_2:                               // =>This Inner Loop Header: Depth=1
	bl	get_random_u32
	mov	w9, w0
	ldr	x8, [x20, #48]
	mov	x2, xzr
	mov	x3, xzr
	udiv	x10, x9, x28
	mov	x0, x8
	msub	x21, x10, x28, x9
	mov	x1, x21
	bl	read_cache_page
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB50_34
// %bb.3:                               //   in Loop: Header=BB50_2 Depth=1
	mov	x22, x0
	ldr	x0, [x19, #48]
	mov	x1, x21
	mov	x2, xzr
	mov	x3, xzr
	bl	read_cache_page
	ldr	x8, [x22, #8]
	mov	x23, x0
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x22, x9, eq
	cmn	x23, #4095              // =4095
	b.hs	.LBB50_32
// %bb.4:                               //   in Loop: Header=BB50_2 Depth=1
	ldr	x8, [x0]
	str	x8, [sp, #8]
	ldr	x8, [sp, #8]
	tbnz	w8, #0, .LBB50_6
// %bb.5:                               //   in Loop: Header=BB50_2 Depth=1
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x0]
1:	ldaxr	x8, [x0]
	orr	x9, x8, 1
	stxr	w10, x9, [x0]
	cbnz	w10, 1b
	
	//NO_APP
	tbz	w8, #0, .LBB50_7
.LBB50_6:                               //   in Loop: Header=BB50_2 Depth=1
	mov	x0, x22
	bl	__lock_page
.LBB50_7:                               //   in Loop: Header=BB50_2 Depth=1
	cmp	x22, x23
	b.eq	.LBB50_11
// %bb.8:                               //   in Loop: Header=BB50_2 Depth=1
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x9, [x8]
	str	x9, [sp, #8]
	ldr	x9, [sp, #8]
	tbnz	w9, #0, .LBB50_10
// %bb.9:                               //   in Loop: Header=BB50_2 Depth=1
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x8]
1:	ldaxr	x9, [x8]
	orr	x10, x9, 1
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	
	//NO_APP
	tbz	w9, #0, .LBB50_11
.LBB50_10:                              //   in Loop: Header=BB50_2 Depth=1
	mov	x0, x23
	bl	__lock_page
.LBB50_11:                              //   in Loop: Header=BB50_2 Depth=1
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #2, .LBB50_15
// %bb.12:                              //   in Loop: Header=BB50_2 Depth=1
	//APP
	dmb ishld
	//NO_APP
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #2, .LBB50_15
// %bb.13:                              //   in Loop: Header=BB50_2 Depth=1
	//APP
	dmb ishld
	//NO_APP
	ldr	x8, [x22, #24]
	ldr	x9, [x20, #48]
	cmp	x8, x9
	b.ne	.LBB50_15
// %bb.14:                              //   in Loop: Header=BB50_2 Depth=1
	ldr	x8, [x23, #24]
	ldr	x9, [x19, #48]
	cmp	x8, x9
	b.eq	.LBB50_24
.LBB50_15:                              //   in Loop: Header=BB50_2 Depth=1
	mov	w26, wzr
	mov	w24, #-22
.LBB50_16:                              //   in Loop: Header=BB50_2 Depth=1
	mov	x0, x22
	bl	unlock_page
	cmp	x22, x23
	b.eq	.LBB50_18
// %bb.17:                              //   in Loop: Header=BB50_2 Depth=1
	mov	x0, x23
	bl	unlock_page
.LBB50_18:                              //   in Loop: Header=BB50_2 Depth=1
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
	cbnz	w9, .LBB50_20
// %bb.19:                              //   in Loop: Header=BB50_2 Depth=1
	bl	__put_page
.LBB50_20:                              //   in Loop: Header=BB50_2 Depth=1
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
	cbnz	w9, .LBB50_22
// %bb.21:                              //   in Loop: Header=BB50_2 Depth=1
	bl	__put_page
.LBB50_22:                              //   in Loop: Header=BB50_2 Depth=1
	tbz	w26, #0, .LBB50_35
// %bb.23:                              //   in Loop: Header=BB50_2 Depth=1
	add	w27, w27, #1            // =1
	cmp	w27, #10                // =10
	b.ne	.LBB50_2
	b	.LBB50_36
.LBB50_24:                              //   in Loop: Header=BB50_2 Depth=1
	ldr	w8, [x25, #80]
	lsl	x9, x22, #6
	mov	x0, x22
	add	w8, w8, #1              // =1
	str	w8, [x25, #80]
	//APP
	//NO_APP
	ldr	w8, [x25, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x25, #2984]
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	add	w8, w8, #1              // =1
	str	w8, [x25, #80]
	//APP
	//NO_APP
	ldr	w8, [x25, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x25, #2984]
	orr	x8, x9, #0xffffffc000000000
	str	x8, [sp]                // 8-byte Folded Spill
	lsl	x8, x23, #6
	//APP
	//NO_APP
	orr	x24, x8, #0xffffffc000000000
	bl	flush_dcache_page
	mov	x0, x23
	bl	flush_dcache_page
	ldr	x1, [sp]                // 8-byte Folded Reload
	mov	x0, x24
	mov	w2, #4096
	bl	memcmp
	//APP
	//NO_APP
	mov	w24, w0
	ldr	w8, [x25, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x25, #2984]
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x25, #80]
	b.ne	.LBB50_26
// %bb.25:                              //   in Loop: Header=BB50_2 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #1, .LBB50_29
.LBB50_26:                              //   in Loop: Header=BB50_2 Depth=1
	//APP
	//NO_APP
	ldr	w8, [x25, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x25, #2984]
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x25, #80]
	b.ne	.LBB50_28
// %bb.27:                              //   in Loop: Header=BB50_2 Depth=1
	ldr	x8, [x25]
	tbnz	w8, #1, .LBB50_30
.LBB50_28:                              //   in Loop: Header=BB50_2 Depth=1
	cmp	w24, #0                 // =0
	csel	w26, w26, wzr, eq
	b	.LBB50_16
.LBB50_29:                              //   in Loop: Header=BB50_2 Depth=1
	bl	preempt_schedule
	b	.LBB50_26
.LBB50_30:                              //   in Loop: Header=BB50_2 Depth=1
	bl	preempt_schedule
	b	.LBB50_28
.LBB50_31:
	mov	w0, wzr
	b	.LBB50_37
.LBB50_32:
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
	cbnz	w9, .LBB50_34
// %bb.33:
	bl	__put_page
.LBB50_34:
	mov	w26, wzr
	b	.LBB50_36
.LBB50_35:
	ldr	x8, [x20, #40]
	adrp	x1, .L.str.75
	ldr	x2, [x20, #64]
	add	x1, x1, :lo12:.L.str.75
	ldr	x3, [x19, #64]
	mov	x4, x21
	mov	w5, w24
	ldr	x0, [x8, #1104]
	bl	f2fs_printk
.LBB50_36:
	and	w0, w26, #0x1
.LBB50_37:
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.Lfunc_end50:
	.size	dedup_file_is_same, .Lfunc_end50-dedup_file_is_same
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_filemap_fault
	.type	f2fs_filemap_fault,@function
f2fs_filemap_fault:                     // @f2fs_filemap_fault
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	ldr	x8, [x0]
	ldr	x8, [x8, #160]
	ldr	x20, [x8, #32]
	add	x22, x20, #1064         // =1064
	mov	x0, x22
	bl	down_read
	mov	x0, x21
	bl	filemap_fault
	mov	w19, w0
	mov	x0, x22
	bl	up_read
	cbnz	w19, .LBB51_3
// %bb.1:
	ldr	x8, [x20, #40]
	ldr	x22, [x8, #1104]
	ldrb	w8, [x22, #2600]
	cbz	w8, .LBB51_3
// %bb.2:
	add	x23, x22, #2240         // =2240
	mov	x0, x23
	bl	_raw_spin_lock
	ldr	x8, [x22, #2368]
	mov	x0, x23
	add	x8, x8, #1, lsl #12     // =4096
	str	x8, [x22, #2368]
	bl	_raw_spin_unlock
	mov	x0, x22
	bl	f2fs_record_iostat
.LBB51_3:
	adrp	x8, __tracepoint_f2fs_filemap_fault
	ldr	x21, [x21, #16]
	add	x8, x8, :lo12:__tracepoint_f2fs_filemap_fault
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB51_10
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
	tbz	w9, #0, .LBB51_10
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
	cbz	x24, .LBB51_8
// %bb.6:
	ldr	x8, [x24], #24
	sxtw	x22, w19
.LBB51_7:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x24, #-16]
	mov	x1, x20
	mov	x2, x21
	mov	x3, x22
	blr	x8
	ldr	x8, [x24], #24
	cbnz	x8, .LBB51_7
.LBB51_8:
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB51_10
// %bb.9:
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB51_11
.LBB51_10:
	mov	w0, w19
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB51_11:
	bl	preempt_schedule_notrace
	b	.LBB51_10
.Lfunc_end51:
	.size	f2fs_filemap_fault, .Lfunc_end51-f2fs_filemap_fault
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_vm_page_mkwrite
	.type	f2fs_vm_page_mkwrite,@function
f2fs_vm_page_mkwrite:                   // @f2fs_vm_page_mkwrite
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
	ldr	x8, [x0]
	ldr	x8, [x8, #160]
	ldr	x19, [x8, #32]
	ldrb	w8, [x19, #12]
	tbnz	w8, #3, .LBB52_107
// %bb.1:
	ldr	x8, [x19, #40]
	add	x24, x19, #160          // =160
	mov	x22, x0
	ldr	x20, [x0, #88]
	mov	x0, x24
	ldr	x21, [x8, #1104]
	bl	down_write
	ldr	x8, [x19, #712]
	tbz	x8, #35, .LBB52_4
// %bb.2:
	mov	x0, x19
	mov	w1, wzr
	bl	f2fs_reserve_compress_blocks_internal
	cbz	w0, .LBB52_4
.LBB52_3:
	mov	w23, w0
	mov	x0, x24
	bl	up_write
	b	.LBB52_85
.LBB52_4:
	mov	x0, x24
	bl	up_write
	ldr	x8, [x21, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB52_107
// %bb.5:
	ldr	x8, [x21, #80]
	tbnz	w8, #8, .LBB52_89
.LBB52_6:
	mov	x0, x19
	bl	f2fs_convert_inline_inode
	mov	w23, w0
	cbnz	w0, .LBB52_85
// %bb.7:
	mov	x0, x24
	bl	down_write
	ldr	x8, [x19, #712]
	tbz	x8, #49, .LBB52_9
// %bb.8:
	mov	x0, x19
	mov	w1, #1
	add	x8, x19, #712           // =712
	mov	x9, #562949953421312
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
.LBB52_9:
	ldr	x8, [x19, #712]
	tbz	x8, #43, .LBB52_13
// %bb.10:
	ldr	x8, [x19, #712]
	tbz	x8, #43, .LBB52_12
// %bb.11:
	ldr	x8, [x19, #712]
	tbnz	x8, #44, .LBB52_13
.LBB52_12:
	adrp	x1, .L__func__.f2fs_vm_page_mkwrite
	mov	x0, x19
	add	x1, x1, :lo12:.L__func__.f2fs_vm_page_mkwrite
	bl	f2fs_revoke_deduped_inode
	cbnz	w0, .LBB52_3
.LBB52_13:
	mov	x0, x24
	bl	up_write
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB52_17
// %bb.14:
	ldr	w8, [x19, #1256]
	cbnz	w8, .LBB52_19
// %bb.15:
	ldr	x8, [x19, #712]
	tbnz	x8, #35, .LBB52_19
// %bb.16:
	ldr	x8, [x19, #712]
	tbnz	x8, #34, .LBB52_19
	b	.LBB52_22
.LBB52_17:
	ldrh	w8, [x19]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB52_22
// %bb.18:
	ldr	x8, [x19, #712]
	tbz	w8, #31, .LBB52_22
.LBB52_19:
	ldr	x1, [x20, #32]
	mov	x0, x19
	bl	f2fs_is_compressed_cluster
	mov	w23, w0
	tbnz	w0, #31, .LBB52_85
// %bb.20:
	cbz	w23, .LBB52_22
// %bb.21:
	mov	w23, wzr
	b	.LBB52_23
.LBB52_22:
	mov	x0, x21
	mov	w1, #1
	mov	w23, #1
	bl	f2fs_balance_fs
.LBB52_23:
	ldr	x0, [x19, #40]
	mov	w1, #2
	mov	w2, #1
	bl	__sb_start_write
	ldr	x8, [x19, #712]
	tbnz	w8, #10, .LBB52_98
// %bb.24:
	ldr	x8, [x19, #712]
	tbnz	w8, #10, .LBB52_102
.LBB52_25:
	ldr	x8, [x22]
	ldr	x0, [x8, #160]
	bl	file_update_time
	add	x22, x19, #1064         // =1064
	mov	x0, x22
	bl	down_read
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x9, [x8]
	str	x9, [sp, #24]
	ldr	x9, [sp, #24]
	tbnz	w9, #0, .LBB52_27
// %bb.26:
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x8]
1:	ldaxr	x9, [x8]
	orr	x10, x9, 1
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	
	//NO_APP
	tbz	w9, #0, .LBB52_28
.LBB52_27:
	mov	x0, x20
	bl	__lock_page
.LBB52_28:
	ldr	x8, [x20, #24]
	ldr	x9, [x19, #48]
	cmp	x8, x9
	b.ne	.LBB52_31
// %bb.29:
	ldr	x8, [x20, #32]
	ldr	x9, [x19, #80]
	cmp	x9, x8, lsl #12
	b.lt	.LBB52_31
// %bb.30:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB52_32
.LBB52_31:
	mov	x0, x20
	bl	unlock_page
	mov	w23, #-14
	b	.LBB52_84
.LBB52_32:
	//APP
	dmb ishld
	//NO_APP
	tbz	w23, #0, .LBB52_35
// %bb.33:
	mov	w24, #5
	mov	x0, x21
	mov	w1, w24
	mov	w2, #1
	mov	w3, wzr
	bl	__do_map_lock
	mov	w25, w0
	add	x0, sp, #24             // =24
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	ldr	x1, [x20, #32]
	add	x0, sp, #24             // =24
	stp	x19, xzr, [sp, #24]
	str	xzr, [sp, #40]
	str	wzr, [sp, #48]
	bl	f2fs_get_block
	mov	w23, w0
	and	w3, w25, #0x1
	mov	x0, x21
	mov	w1, w24
	mov	w2, wzr
	bl	__do_map_lock
	cbz	w23, .LBB52_66
.LBB52_34:
	mov	x0, x20
	bl	unlock_page
	b	.LBB52_84
.LBB52_35:
	add	x0, sp, #24             // =24
	mov	w1, wzr
	mov	w2, #48
	add	x25, sp, #24            // =24
	bl	memset
	ldr	x1, [x20, #32]
	add	x0, sp, #24             // =24
	mov	w2, #1
	stp	x19, xzr, [sp, #24]
	str	xzr, [sp, #40]
	str	wzr, [sp, #48]
	bl	f2fs_get_dnode_of_data
	ldr	x24, [sp, #40]
	mov	w23, w0
	cbz	x24, .LBB52_61
// %bb.36:
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
	b.ne	.LBB52_53
// %bb.37:
	tbnz	w8, #0, .LBB52_51
// %bb.38:
	bl	print_bdev_access_info
	adrp	x26, f2fs_dclient
	ldr	x0, [x26, :lo12:f2fs_dclient]
	cbz	x0, .LBB52_41
// %bb.39:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB52_41
// %bb.40:
	ldr	x0, [x26, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB52_41:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB52_43
// %bb.42:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB52_114
.LBB52_43:
	ldr	x0, [x24, #24]
.LBB52_44:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB52_46
// %bb.45:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB52_115
.LBB52_46:
	ldr	x0, [x24, #24]
.LBB52_47:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB52_49
// %bb.48:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB52_116
.LBB52_49:
	ldr	x0, [x24, #24]
.LBB52_50:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB52_51:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB52_59
// %bb.52:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB52_53:
	tbnz	w8, #0, .LBB52_58
// %bb.54:
	bl	print_bdev_access_info
	adrp	x26, f2fs_dclient
	ldr	x0, [x26, :lo12:f2fs_dclient]
	cbz	x0, .LBB52_57
// %bb.55:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB52_57
// %bb.56:
	ldr	x0, [x26, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB52_57:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB52_58:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB52_120
.LBB52_59:
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
	cbnz	w9, .LBB52_61
// %bb.60:
	bl	__put_page
.LBB52_61:
	ldr	x8, [sp, #32]
	add	x24, x25, #8            // =8
	cbz	x8, .LBB52_65
// %bb.62:
	ldr	x9, [sp, #40]
	cmp	x9, x8
	b.eq	.LBB52_65
// %bb.63:
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
	cbnz	w9, .LBB52_65
// %bb.64:
	bl	__put_page
.LBB52_65:
	stp	xzr, xzr, [x24]
	cbnz	w23, .LBB52_34
.LBB52_66:
	mov	x0, x20
	mov	w1, wzr
	mov	w2, wzr
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
	ldr	w1, [sp, #60]
	mov	x0, x19
	bl	f2fs_wait_on_block_writeback
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #17, .LBB52_84
// %bb.67:
	ldr	x9, [x20, #32]
	ldr	x8, [x19, #80]
	lsl	x9, x9, #12
	add	x9, x9, #1, lsl #12     // =4096
	cmp	x9, x8
	b.le	.LBB52_71
// %bb.68:
	//APP
	mrs x23, sp_el0
	//NO_APP
	ldr	w9, [x23, #80]
	lsl	x10, x20, #6
	and	w8, w8, #0xfff
	orr	x10, x10, #0xffffffc000000000
	mov	w1, wzr
	add	x0, x10, x8
	add	w9, w9, #1              // =1
	str	w9, [x23, #80]
	//APP
	//NO_APP
	ldr	w9, [x23, #2984]
	add	w9, w9, #1              // =1
	str	w9, [x23, #2984]
	mov	w9, #4096
	sub	w2, w9, w8
	//APP
	//NO_APP
	bl	memset
	//APP
	//NO_APP
	ldr	w8, [x23, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x23, #2984]
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB52_70
// %bb.69:
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB52_117
.LBB52_70:
	mov	x0, x20
	bl	flush_dcache_page
.LBB52_71:
	mov	x0, x20
	bl	set_page_dirty
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB52_73
// %bb.72:
	//APP
	dmb ishst
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x20]
1:	ldxr	x8, [x20]
	orr	x8, x8, 4
	stxr	w9, x8, [x20]
	cbnz	w9, 1b
	//NO_APP
	b	.LBB52_74
.LBB52_73:
	//APP
	dmb ishld
	//NO_APP
.LBB52_74:
	ldrb	w8, [x21, #2600]
	cbz	w8, .LBB52_76
// %bb.75:
	add	x23, x21, #2240         // =2240
	mov	x0, x23
	bl	_raw_spin_lock
	ldr	x8, [x21, #2272]
	mov	x0, x23
	add	x8, x8, #1, lsl #12     // =4096
	str	x8, [x21, #2272]
	bl	_raw_spin_unlock
	mov	x0, x21
	bl	f2fs_record_iostat
.LBB52_76:
	adrp	x8, jiffies
	ldr	x8, [x8, :lo12:jiffies]
	stp	x8, x8, [x21, #504]
	str	x8, [x21, #520]
	adrp	x8, __tracepoint_f2fs_vm_page_mkwrite
	add	x8, x8, :lo12:__tracepoint_f2fs_vm_page_mkwrite
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB52_83
// %bb.77:
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
	tbz	w9, #0, .LBB52_83
// %bb.78:
	//APP
	mrs x21, sp_el0
	//NO_APP
	ldr	w9, [x21, #80]
	add	w9, w9, #1              // =1
	str	w9, [x21, #80]
	//APP
	//NO_APP
	ldr	x23, [x8, #32]
	cbz	x23, .LBB52_81
// %bb.79:
	ldr	x8, [x23], #24
.LBB52_80:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x23, #-16]
	mov	x1, x20
	mov	w2, wzr
	blr	x8
	ldr	x8, [x23], #24
	cbnz	x8, .LBB52_80
.LBB52_81:
	//APP
	//NO_APP
	ldr	w8, [x21, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x21, #80]
	b.ne	.LBB52_83
// %bb.82:
	ldr	x8, [x21]
	tbnz	w8, #1, .LBB52_118
.LBB52_83:
	mov	w23, wzr
.LBB52_84:
	mov	x0, x22
	bl	up_read
	ldr	x0, [x19, #40]
	mov	w1, #2
	bl	__sb_end_write
.LBB52_85:
	add	w8, w23, #14            // =14
	cmp	w8, #14                 // =14
	b.hi	.LBB52_107
// %bb.86:
	adrp	x9, .LJTI52_0
	mov	w0, #512
	add	x9, x9, :lo12:.LJTI52_0
	adr	x10, .LBB52_87
	ldrb	w11, [x9, x8]
	add	x10, x10, x11, lsl #2
	br	x10
.LBB52_87:
	mov	w0, #256
	b	.LBB52_108
.LBB52_88:
	mov	w0, #1
	b	.LBB52_108
.LBB52_89:
	ldr	w25, [x21, #1192]
	ldr	w11, [x21, #1188]
	ldrsw	x12, [x21, #1284]
	ldr	w10, [x21, #1184]
	ldrsw	x13, [x21, #1272]
	ldrsw	x14, [x21, #1296]
	ldr	x8, [x21, #80]
	tbnz	w8, #3, .LBB52_6
// %bb.90:
	ldr	x16, [x21, #136]
	ldr	x8, [x16, #8]
	ldr	w9, [x16, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	b.eq	.LBB52_92
// %bb.91:
	udiv	w15, w9, w25
	b	.LBB52_93
.LBB52_92:
	mov	w15, #-1
.LBB52_93:
	cmp	w8, w15
	b.ne	.LBB52_104
// %bb.94:
	ldr	w17, [x21, #1284]
	mov	w2, #48
	ldr	w0, [x21, #1272]
	ldr	w18, [x21, #1272]
	ldr	x15, [x16, #24]
	ldr	x16, [x16]
	add	w17, w0, w17
	ldr	w1, [x15, #460]
	ldr	x16, [x16, #136]
	madd	x1, x1, x2, x16
	ldrh	w1, [x1, #2]
	and	w1, w1, #0x3ff
	sub	w0, w11, w1
	cmp	w0, w17
	b.lo	.LBB52_104
// %bb.95:
	str	w18, [sp, #20]          // 4-byte Folded Spill
	mov	w0, #48
	ldr	w18, [x15, #580]
	madd	x18, x18, x0, x16
	ldrh	w18, [x18, #2]
	and	w18, w18, #0x3ff
	sub	w18, w11, w18
	cmp	w18, w17
	b.lo	.LBB52_104
// %bb.96:
	mov	x23, x10
	ldr	w10, [x15, #700]
	mov	x28, x12
	mov	w12, #48
	mov	x27, x13
	mov	w26, w11
	str	x14, [sp, #8]           // 8-byte Folded Spill
	madd	x10, x10, x12, x16
	ldrh	w10, [x10, #2]
	and	w10, w10, #0x3ff
	sub	w10, w11, w10
	cmp	w10, w17
	b.hs	.LBB52_103
// %bb.97:
	ldr	x14, [sp, #8]           // 8-byte Folded Reload
	mov	x10, x23
	mov	x12, x28
	mov	x13, x27
	mov	w11, w26
	b	.LBB52_104
.LBB52_98:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB52_101
// %bb.99:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB52_101
// %bb.100:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str.8
	adrp	x2, .L__func__.f2fs_vm_page_mkwrite
	add	x1, x1, :lo12:.L.str.8
	mov	w3, #1927
	add	x2, x2, :lo12:.L__func__.f2fs_vm_page_mkwrite
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB52_101:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldr	x8, [x19, #712]
	tbz	w8, #10, .LBB52_25
.LBB52_102:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/file.c"; .popsection; .long 14472b - 14470b; .short 1927; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB52_103:
	ldr	w10, [x15, #100]
	mov	w11, #48
	ldr	x14, [sp, #8]           // 8-byte Folded Reload
	mov	x13, x27
	madd	x10, x10, x11, x16
	mov	w11, w26
	ldrh	w10, [x10, #2]
	and	w10, w10, #0x3ff
	sub	w12, w26, w10
	ldr	w10, [sp, #20]          // 4-byte Folded Reload
	cmp	w12, w10
	mov	x10, x23
	mov	x12, x28
	b.hs	.LBB52_110
.LBB52_104:
	mul	w11, w11, w25
	cmn	w9, #1                  // =1
	sub	x11, x11, #1            // =1
	add	x12, x11, x12
	add	x13, x11, x13
	add	x14, x11, x14
	asr	x11, x12, x10
	asr	x12, x13, x10
	asr	x10, x14, x10
	udiv	w11, w11, w25
	udiv	w12, w12, w25
	udiv	w10, w10, w25
	lsl	w12, w12, #1
	b.eq	.LBB52_106
// %bb.105:
	ldr	w13, [x21, #1192]
	udiv	w9, w9, w13
.LBB52_106:
	add	w11, w12, w11
	add	w10, w11, w10
	add	w9, w10, w9
	cmp	w8, w9
	b.hi	.LBB52_6
.LBB52_107:
	mov	w0, #2
.LBB52_108:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB52_119
// %bb.109:
	ldp	x20, x19, [sp, #160]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #144]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #128]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #112]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #96]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB52_110:
	ldr	w8, [x21, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB52_6
// %bb.111:
	ldr	x8, [x21, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB52_6
// %bb.112:
	ldr	w1, [x15, #820]
	mov	x0, x21
	str	x1, [sp]                // 8-byte Folded Spill
                                        // kill: def $w1 killed $w1 killed $x1
	bl	f2fs_usable_blks_in_seg
	ldr	x9, [x21, #136]
	mov	w15, #48
	ldp	x16, x14, [sp]          // 16-byte Folded Reload
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x16, x15, x8
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w15, w0, w8
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	cmp	w15, w8
	b.hs	.LBB52_6
// %bb.113:
	ldr	x8, [x9, #8]
	mov	w11, w26
	ldr	w9, [x9, #100]
	mov	x13, x27
	mov	x12, x28
	mov	x10, x23
	ldr	w8, [x8, #8]
	b	.LBB52_104
.LBB52_114:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB52_44
.LBB52_115:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB52_47
.LBB52_116:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB52_50
.LBB52_117:
	bl	preempt_schedule
	b	.LBB52_70
.LBB52_118:
	bl	preempt_schedule_notrace
	b	.LBB52_83
.LBB52_119:
	bl	__stack_chk_fail
.LBB52_120:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end52:
	.size	f2fs_vm_page_mkwrite, .Lfunc_end52-f2fs_vm_page_mkwrite
	.section	.rodata,"a",@progbits
.LJTI52_0:
	.byte	(.LBB52_87-.LBB52_87)>>2
	.byte	(.LBB52_107-.LBB52_87)>>2
	.byte	(.LBB52_88-.LBB52_87)>>2
	.byte	(.LBB52_87-.LBB52_87)>>2
	.byte	(.LBB52_107-.LBB52_87)>>2
	.byte	(.LBB52_107-.LBB52_87)>>2
	.byte	(.LBB52_107-.LBB52_87)>>2
	.byte	(.LBB52_107-.LBB52_87)>>2
	.byte	(.LBB52_107-.LBB52_87)>>2
	.byte	(.LBB52_107-.LBB52_87)>>2
	.byte	(.LBB52_107-.LBB52_87)>>2
	.byte	(.LBB52_107-.LBB52_87)>>2
	.byte	(.LBB52_107-.LBB52_87)>>2
	.byte	(.LBB52_107-.LBB52_87)>>2
	.byte	(.LBB52_108-.LBB52_87)>>2
                                        // -- End function
	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"f2fs_page_info_entry"
	.size	.L.str, 21

	.type	page_info_slab,@object  // @page_info_slab
	.local	page_info_slab
	.comm	page_info_slab,8,8
	.type	.L.str.1,@object        // @.str.1
.L.str.1:
	.asciz	"\0013%s: try to get node page %d"
	.size	.L.str.1, 30

	.type	.L__func__.f2fs_set_inode_addr,@object // @__func__.f2fs_set_inode_addr
.L__func__.f2fs_set_inode_addr:
	.asciz	"f2fs_set_inode_addr"
	.size	.L__func__.f2fs_set_inode_addr, 20

	.type	.L.str.3,@object        // @.str.3
.L.str.3:
	.asciz	"\0013%s: get node page fail"
	.size	.L.str.3, 25

	.type	.L.str.4,@object        // @.str.4
.L.str.4:
	.asciz	"\0013%s: inode[%lu] leak data addr[%d:%u]"
	.size	.L.str.4, 39

	.type	.L.str.5,@object        // @.str.5
.L.str.5:
	.asciz	"\0013%s: inode[%lu] leak node addr[%d:%u]"
	.size	.L.str.5, 39

	.type	f2fs_revoke_deduped_inode.revoke_bigdata_rs,@object // @f2fs_revoke_deduped_inode.revoke_bigdata_rs
	.data
	.p2align	3
f2fs_revoke_deduped_inode.revoke_bigdata_rs:
	.zero	4
	.word	250                     // 0xfa
	.word	10                      // 0xa
	.word	0                       // 0x0
	.word	0                       // 0x0
	.zero	4
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.size	f2fs_revoke_deduped_inode.revoke_bigdata_rs, 40

	.type	.L.str.6,@object        // @.str.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6:
	.asciz	"\0013dedup ino[%lu] inner_inode is NULL"
	.size	.L.str.6, 37

	.type	.L__func__.f2fs_revoke_deduped_inode,@object // @__func__.f2fs_revoke_deduped_inode
.L__func__.f2fs_revoke_deduped_inode:
	.asciz	"f2fs_revoke_deduped_inode"
	.size	.L__func__.f2fs_revoke_deduped_inode, 26

	.type	.L.str.7,@object        // @.str.7
.L.str.7:
	.asciz	"\0013inode:%lu is not dedup inode"
	.size	.L.str.7, 31

	.type	.L.str.8,@object        // @.str.8
.L.str.8:
	.asciz	"F2FS bug: %s:%d\n"
	.size	.L.str.8, 17

	.type	.L__func__.f2fs_truncate_dedup_inode,@object // @__func__.f2fs_truncate_dedup_inode
.L__func__.f2fs_truncate_dedup_inode:
	.asciz	"f2fs_truncate_dedup_inode"
	.size	.L__func__.f2fs_truncate_dedup_inode, 26

	.type	.L__func__.f2fs_do_truncate_blocks,@object // @__func__.f2fs_do_truncate_blocks
.L__func__.f2fs_do_truncate_blocks:
	.asciz	"f2fs_do_truncate_blocks"
	.size	.L__func__.f2fs_do_truncate_blocks, 24

	.type	.L__func__.f2fs_getattr,@object // @__func__.f2fs_getattr
.L__func__.f2fs_getattr:
	.asciz	"f2fs_getattr"
	.size	.L__func__.f2fs_getattr, 13

	.type	.L__func__.f2fs_setattr,@object // @__func__.f2fs_setattr
.L__func__.f2fs_setattr:
	.asciz	"f2fs_setattr"
	.size	.L__func__.f2fs_setattr, 13

	.type	f2fs_file_inode_operations,@object // @f2fs_file_inode_operations
	.section	.rodata,"a",@progbits
	.globl	f2fs_file_inode_operations
	.p2align	6
f2fs_file_inode_operations:
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	f2fs_get_acl
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	f2fs_setattr
	.xword	0
	.xword	f2fs_getattr
	.xword	f2fs_listxattr
	.xword	f2fs_fiemap
	.xword	0
	.xword	0
	.xword	0
	.xword	f2fs_set_acl
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.zero	40
	.size	f2fs_file_inode_operations, 256

	.type	.L__func__.f2fs_truncate_hole,@object // @__func__.f2fs_truncate_hole
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__func__.f2fs_truncate_hole:
	.asciz	"f2fs_truncate_hole"
	.size	.L__func__.f2fs_truncate_hole, 19

	.type	.L.str.9,@object        // @.str.9
.L.str.9:
	.asciz	"\0014%s: Enable GC = ino %lx after %x GC trials"
	.size	.L.str.9, 45

	.type	.L__func__.f2fs_pin_file_control,@object // @__func__.f2fs_pin_file_control
.L__func__.f2fs_pin_file_control:
	.asciz	"f2fs_pin_file_control"
	.size	.L__func__.f2fs_pin_file_control, 22

	.type	.L.str.10,@object       // @.str.10
.L.str.10:
	.asciz	"\0014%s: reserve released blocks failed ret=%d, i_ino=%lx, iblocks=%llu, reserved=%u, compr_blocks=%u\n"
	.size	.L.str.10, 100

	.type	.L__func__.f2fs_reserve_compress_blocks_internal,@object // @__func__.f2fs_reserve_compress_blocks_internal
.L__func__.f2fs_reserve_compress_blocks_internal:
	.asciz	"f2fs_reserve_compress_blocks_internal"
	.size	.L__func__.f2fs_reserve_compress_blocks_internal, 38

	.type	.L.str.11,@object       // @.str.11
.L.str.11:
	.asciz	"\0014%s mode:%d, reserve failed:%d"
	.size	.L.str.11, 32

	.type	.L__func__.f2fs_decompress_file_internal,@object // @__func__.f2fs_decompress_file_internal
.L__func__.f2fs_decompress_file_internal:
	.asciz	"f2fs_decompress_file_internal"
	.size	.L__func__.f2fs_decompress_file_internal, 30

	.type	.L.str.12,@object       // @.str.12
.L.str.12:
	.asciz	"\0014%s dedup file"
	.size	.L.str.12, 16

	.type	.L.str.13,@object       // @.str.13
.L.str.13:
	.asciz	"\0014%s mode:%d decompressed err:%d"
	.size	.L.str.13, 33

	.type	.L.str.14,@object       // @.str.14
.L.str.14:
	.asciz	"\0016%s mode:%d decompressed succ"
	.size	.L.str.14, 31

	.type	f2fs_file_operations,@object // @f2fs_file_operations
	.section	.rodata,"a",@progbits
	.globl	f2fs_file_operations
	.p2align	3
f2fs_file_operations:
	.xword	0
	.xword	f2fs_llseek
	.xword	0
	.xword	0
	.xword	f2fs_file_read_iter
	.xword	f2fs_file_write_iter
	.xword	0
	.xword	0
	.xword	0
	.xword	f2fs_ioctl
	.xword	f2fs_compat_ioctl
	.xword	f2fs_file_mmap
	.xword	0                       // 0x0
	.xword	f2fs_file_open
	.xword	f2fs_file_flush
	.xword	f2fs_release_file
	.xword	f2fs_sync_file
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	iter_file_splice_write
	.xword	generic_file_splice_read
	.xword	0
	.xword	f2fs_fallocate
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.size	f2fs_file_operations, 288

	.type	current_flush_merge,@object // @current_flush_merge
	.bss
	.globl	current_flush_merge
	.p2align	3
current_flush_merge:
	.xword	0                       // 0x0
	.size	current_flush_merge, 8

	.type	.L__func__.f2fs_put_page,@object // @__func__.f2fs_put_page
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__func__.f2fs_put_page:
	.asciz	"f2fs_put_page"
	.size	.L__func__.f2fs_put_page, 14

	.type	.L.str.15,@object       // @.str.15
.L.str.15:
	.asciz	"\0013revoke inode[%lu] begin fail, ret:%d"
	.size	.L.str.15, 39

	.type	.L.str.16,@object       // @.str.16
.L.str.16:
	.asciz	"\0014%s: The deduped inode[%lu] revoked fail(errno=%d,%d)."
	.size	.L.str.16, 56

	.type	.L__func__.__revoke_deduped_data,@object // @__func__.__revoke_deduped_data
.L__func__.__revoke_deduped_data:
	.asciz	"__revoke_deduped_data"
	.size	.L__func__.__revoke_deduped_data, 22

	.type	.L.str.17,@object       // @.str.17
.L.str.17:
	.asciz	"SBI_NEED_FSCK:%s:%d\n"
	.size	.L.str.17, 21

	.type	.L__func__.__revoke_deduped_inode_end,@object // @__func__.__revoke_deduped_inode_end
.L__func__.__revoke_deduped_inode_end:
	.asciz	"__revoke_deduped_inode_end"
	.size	.L__func__.__revoke_deduped_inode_end, 27

	.type	.L.str.18,@object       // @.str.18
.L.str.18:
	.asciz	"\0014%s: orphan failed (ino=%lx), run fsck to fix."
	.size	.L.str.18, 48

	.type	.L.str.19,@object       // @.str.19
.L.str.19:
	.asciz	"\0016%s trigger revoke ret[%d], inode[%lu], inner ino[%lu]"
	.size	.L.str.19, 56

	.type	.L.str.20,@object       // @.str.20
.L.str.20:
	.asciz	"%d"
	.size	.L.str.20, 3

	.type	.L.str.21,@object       // @.str.21
.L.str.21:
	.asciz	"\0014%s:create eventobj failed"
	.size	.L.str.21, 28

	.type	.L__func__.f2fs_dedup_imonitor_send,@object // @__func__.f2fs_dedup_imonitor_send
.L__func__.f2fs_dedup_imonitor_send:
	.asciz	"f2fs_dedup_imonitor_send"
	.size	.L__func__.f2fs_dedup_imonitor_send, 25

	.type	.L.str.22,@object       // @.str.22
.L.str.22:
	.asciz	"ReDedupFileIno"
	.size	.L.str.22, 15

	.type	.L.str.23,@object       // @.str.23
.L.str.23:
	.asciz	"ReDedupInnerIno"
	.size	.L.str.23, 16

	.type	.L.str.24,@object       // @.str.24
.L.str.24:
	.asciz	"ReDedupSize"
	.size	.L.str.24, 12

	.type	.L.str.25,@object       // @.str.25
.L.str.25:
	.asciz	"ReDedupReason"
	.size	.L.str.25, 14

	.type	.L.str.26,@object       // @.str.26
.L.str.26:
	.asciz	"ReDedupFailedReason"
	.size	.L.str.26, 20

	.type	.L.str.27,@object       // @.str.27
.L.str.27:
	.asciz	"\0014%s send hievent failed, err: %d"
	.size	.L.str.27, 34

	.type	.L__func__._truncate_error_handle,@object // @__func__._truncate_error_handle
.L__func__._truncate_error_handle:
	.asciz	"_truncate_error_handle"
	.size	.L__func__._truncate_error_handle, 23

	.type	.L.str.28,@object       // @.str.28
.L.str.28:
	.asciz	"\0013truncate data failed, inode:%lu ret:%d"
	.size	.L.str.28, 41

	.type	delayflush,@object      // @delayflush
	.local	delayflush
	.comm	delayflush,4,4
	.type	.L.str.29,@object       // @.str.29
.L.str.29:
	.asciz	"\0014%s, potential error with diff:%d, i_compr_blocks:%d, i_ino:%lu"
	.size	.L.str.29, 65

	.type	.L__func__.f2fs_i_compr_blocks_update,@object // @__func__.f2fs_i_compr_blocks_update
.L__func__.f2fs_i_compr_blocks_update:
	.asciz	"f2fs_i_compr_blocks_update"
	.size	.L__func__.f2fs_i_compr_blocks_update, 27

	.type	.L__func__.dec_valid_block_count,@object // @__func__.dec_valid_block_count
.L__func__.dec_valid_block_count:
	.asciz	"dec_valid_block_count"
	.size	.L__func__.dec_valid_block_count, 22

	.type	.L.str.30,@object       // @.str.30
.L.str.30:
	.asciz	"\0014Inconsistent i_blocks, ino:%lu, iblocks:%llu, sectors:%llu"
	.size	.L.str.30, 61

	.type	.L.str.31,@object       // @.str.31
.L.str.31:
	.asciz	"\0013cp_rwsem_timeout: start: %lu now: %lu\n"
	.size	.L.str.31, 41

	.type	.L__func__.truncate_partial_data_page,@object // @__func__.truncate_partial_data_page
.L__func__.truncate_partial_data_page:
	.asciz	"truncate_partial_data_page"
	.size	.L__func__.truncate_partial_data_page, 27

	.type	.L__func__.put_inner_inode,@object // @__func__.put_inner_inode
.L__func__.put_inner_inode:
	.asciz	"put_inner_inode"
	.size	.L__func__.put_inner_inode, 16

	.type	.L__func__.f2fs_release_reserved_blocks,@object // @__func__.f2fs_release_reserved_blocks
.L__func__.f2fs_release_reserved_blocks:
	.asciz	"f2fs_release_reserved_blocks"
	.size	.L__func__.f2fs_release_reserved_blocks, 29

	.type	.L__func__.f2fs_compress_imonitor_send,@object // @__func__.f2fs_compress_imonitor_send
.L__func__.f2fs_compress_imonitor_send:
	.asciz	"f2fs_compress_imonitor_send"
	.size	.L__func__.f2fs_compress_imonitor_send, 28

	.type	.L.str.32,@object       // @.str.32
.L.str.32:
	.asciz	"RevExeScence"
	.size	.L.str.32, 13

	.type	.L.str.33,@object       // @.str.33
.L.str.33:
	.asciz	"RevExeFileIno"
	.size	.L.str.33, 14

	.type	.L.str.34,@object       // @.str.34
.L.str.34:
	.asciz	"RevAppliedSize"
	.size	.L.str.34, 15

	.type	.L.str.35,@object       // @.str.35
.L.str.35:
	.asciz	"RevExeResult"
	.size	.L.str.35, 13

	.type	.L.str.37,@object       // @.str.37
.L.str.37:
	.asciz	"\0016%s scene[%u] send hievent ok"
	.size	.L.str.37, 31

	.type	.L__func__.f2fs_setflags_common,@object // @__func__.f2fs_setflags_common
.L__func__.f2fs_setflags_common:
	.asciz	"f2fs_setflags_common"
	.size	.L__func__.f2fs_setflags_common, 21

	.type	.L__func__.f2fs_ioc_start_atomic_write,@object // @__func__.f2fs_ioc_start_atomic_write
.L__func__.f2fs_ioc_start_atomic_write:
	.asciz	"f2fs_ioc_start_atomic_write"
	.size	.L__func__.f2fs_ioc_start_atomic_write, 28

	.type	.L.str.38,@object       // @.str.38
.L.str.38:
	.asciz	"\0014Unexpected flush for atomic writes: ino=%lu, npages=%u"
	.size	.L.str.38, 57

	.type	.L__func__.f2fs_ioc_start_volatile_write,@object // @__func__.f2fs_ioc_start_volatile_write
.L__func__.f2fs_ioc_start_volatile_write:
	.asciz	"f2fs_ioc_start_volatile_write"
	.size	.L__func__.f2fs_ioc_start_volatile_write, 30

	.type	f2fs_ioc_fitrim._rs,@object // @f2fs_ioc_fitrim._rs
	.data
	.p2align	3
f2fs_ioc_fitrim._rs:
	.zero	4
	.word	1250                    // 0x4e2
	.word	10                      // 0xa
	.word	0                       // 0x0
	.word	0                       // 0x0
	.zero	4
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.size	f2fs_ioc_fitrim._rs, 40

	.type	.L__func__.f2fs_ioc_fitrim,@object // @__func__.f2fs_ioc_fitrim
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__func__.f2fs_ioc_fitrim:
	.asciz	"f2fs_ioc_fitrim"
	.size	.L__func__.f2fs_ioc_fitrim, 16

	.type	.L.str.39,@object       // @.str.39
.L.str.39:
	.asciz	"\0016%s: Recive fstrim command from userspace!\n"
	.size	.L.str.39, 45

	.type	.L.str.41,@object       // @.str.41
.L.str.41:
	.asciz	"\0016IOC_GC: Size=%lldMB,Free=%lldMB,count=%d,sync=%d\n"
	.size	.L.str.41, 52

	.type	IOC_GC_count,@object    // @IOC_GC_count
	.local	IOC_GC_count
	.comm	IOC_GC_count,4,4
	.type	.L.str.42,@object       // @.str.42
.L.str.42:
	.asciz	"\0016Skipping Checkpoint. Checkpoints currently disabled."
	.size	.L.str.42, 55

	.type	.L__func__.f2fs_defragment_range,@object // @__func__.f2fs_defragment_range
.L__func__.f2fs_defragment_range:
	.asciz	"f2fs_defragment_range"
	.size	.L__func__.f2fs_defragment_range, 22

	.type	.L__func__.f2fs_move_file_range,@object // @__func__.f2fs_move_file_range
.L__func__.f2fs_move_file_range:
	.asciz	"f2fs_move_file_range"
	.size	.L__func__.f2fs_move_file_range, 21

	.type	.L.str.43,@object       // @.str.43
.L.str.43:
	.asciz	"\0014Can't flush %u in %d for segs_per_sec %u != 1"
	.size	.L.str.43, 48

	.type	.L__func__.f2fs_ioc_set_pin_file,@object // @__func__.f2fs_ioc_set_pin_file
.L__func__.f2fs_ioc_set_pin_file:
	.asciz	"f2fs_ioc_set_pin_file"
	.size	.L__func__.f2fs_ioc_set_pin_file, 22

	.type	.L.str.44,@object       // @.str.44
.L.str.44:
	.asciz	"\0014Can't enable fs-verity on inode %lu: the verity feature is not enabled on this filesystem.\n"
	.size	.L.str.44, 94

	.type	.L.str.45,@object       // @.str.45
.L.str.45:
	.asciz	"\0014mnt_want_write_file err, ret %d"
	.size	.L.str.45, 34

	.type	.L.str.46,@object       // @.str.46
.L.str.46:
	.asciz	"\0013%s: file migrate not support compressed file"
	.size	.L.str.46, 47

	.type	.L__func__.f2fs_ioc_set_file_tag,@object // @__func__.f2fs_ioc_set_file_tag
.L__func__.f2fs_ioc_set_file_tag:
	.asciz	"f2fs_ioc_set_file_tag"
	.size	.L__func__.f2fs_ioc_set_file_tag, 22

	.type	.L.str.47,@object       // @.str.47
.L.str.47:
	.asciz	"\0014%s: partial blocks were released i_ino=%lx iblocks=%llu, released=%u, compr_blocks=%u, run fsck to fix."
	.size	.L.str.47, 106

	.type	.L__func__.f2fs_release_compress_blocks,@object // @__func__.f2fs_release_compress_blocks
.L__func__.f2fs_release_compress_blocks:
	.asciz	"f2fs_release_compress_blocks"
	.size	.L__func__.f2fs_release_compress_blocks, 29

	.type	.L.str.48,@object       // @.str.48
.L.str.48:
	.asciz	"\0014%s: partial blocks were released i_ino=%lx iblocks=%llu, reserved=%u, compr_blocks=%u, run fsck to fix."
	.size	.L.str.48, 106

	.type	.L__func__.f2fs_reserve_compress_blocks,@object // @__func__.f2fs_reserve_compress_blocks
.L__func__.f2fs_reserve_compress_blocks:
	.asciz	"f2fs_reserve_compress_blocks"
	.size	.L__func__.f2fs_reserve_compress_blocks, 29

	.type	.L.str.49,@object       // @.str.49
.L.str.49:
	.asciz	"\0014%s: decompressed blocks=%u or valid blocks=%u errror."
	.size	.L.str.49, 56

	.type	.L__func__.f2fs_ioc_get_saved_blocks,@object // @__func__.f2fs_ioc_get_saved_blocks
.L__func__.f2fs_ioc_get_saved_blocks:
	.asciz	"f2fs_ioc_get_saved_blocks"
	.size	.L__func__.f2fs_ioc_get_saved_blocks, 26

	.type	.L.str.50,@object       // @.str.50
.L.str.50:
	.asciz	"\0014inline data [%lu], size:%lu."
	.size	.L.str.50, 31

	.type	.L.str.51,@object       // @.str.51
.L.str.51:
	.asciz	"\0013compress fails, atomic file [%lu]."
	.size	.L.str.51, 37

	.type	.L.str.52,@object       // @.str.52
.L.str.52:
	.asciz	"\0013compress fails, pin file [%lu]."
	.size	.L.str.52, 34

	.type	.L.str.53,@object       // @.str.53
.L.str.53:
	.asciz	"\0014%s: The file might be partially compressed (errno=%d). Please delete the file."
	.size	.L.str.53, 81

	.type	.L__func__.f2fs_ioc_compress_release_file,@object // @__func__.f2fs_ioc_compress_release_file
.L__func__.f2fs_ioc_compress_release_file:
	.asciz	"f2fs_ioc_compress_release_file"
	.size	.L__func__.f2fs_ioc_compress_release_file, 31

	.type	.L.str.54,@object       // @.str.54
.L.str.54:
	.asciz	"\0014%s, potential error with i_compr_blocks:%d, ino:%lu"
	.size	.L.str.54, 54

	.type	.L.str.55,@object       // @.str.55
.L.str.55:
	.asciz	"\0014%s: i_ino:%d decompress err:%d."
	.size	.L.str.55, 34

	.type	.L__func__.f2fs_ioc_reserve_decompress_file,@object // @__func__.f2fs_ioc_reserve_decompress_file
.L__func__.f2fs_ioc_reserve_decompress_file:
	.asciz	"f2fs_ioc_reserve_decompress_file"
	.size	.L__func__.f2fs_ioc_reserve_decompress_file, 33

	.type	.L.str.56,@object       // @.str.56
.L.str.56:
	.asciz	"\0014compression algorithm is successfully set, but current kernel doesn't support this algorithm."
	.size	.L.str.56, 96

	.type	.L.str.57,@object       // @.str.57
.L.str.57:
	.asciz	"\0014%s: The file might be partially decompressed (errno=%d). Please delete the file."
	.size	.L.str.57, 83

	.type	.L__func__.f2fs_ioc_decompress_file,@object // @__func__.f2fs_ioc_decompress_file
.L__func__.f2fs_ioc_decompress_file:
	.asciz	"f2fs_ioc_decompress_file"
	.size	.L__func__.f2fs_ioc_decompress_file, 25

	.type	.L__func__.f2fs_ioc_compress_file,@object // @__func__.f2fs_ioc_compress_file
.L__func__.f2fs_ioc_compress_file:
	.asciz	"f2fs_ioc_compress_file"
	.size	.L__func__.f2fs_ioc_compress_file, 23

	.type	.L.str.58,@object       // @.str.58
.L.str.58:
	.asciz	"\0013The inode[%lu] has been two layer file."
	.size	.L.str.58, 42

	.type	.L.str.59,@object       // @.str.59
.L.str.59:
	.asciz	"\0013%s files should be in same FS ino:%lu, inner_ino:%lu"
	.size	.L.str.59, 55

	.type	.L__func__.f2fs_ioc_create_layered_inode,@object // @__func__.f2fs_ioc_create_layered_inode
.L__func__.f2fs_ioc_create_layered_inode:
	.asciz	"f2fs_ioc_create_layered_inode"
	.size	.L__func__.f2fs_ioc_create_layered_inode, 30

	.type	.L.str.60,@object       // @.str.60
.L.str.60:
	.asciz	"\0013create layer fail inner[%lu] is not immutable."
	.size	.L.str.60, 49

	.type	.L.str.61,@object       // @.str.61
.L.str.61:
	.asciz	"\0013The inode[%lu] has been removed."
	.size	.L.str.61, 35

	.type	.L.str.62,@object       // @.str.62
.L.str.62:
	.asciz	"\0013%s: input inode[%lu] and [%lu] are illegal."
	.size	.L.str.62, 46

	.type	.L__func__.f2fs_dedup_param_check,@object // @__func__.f2fs_dedup_param_check
.L__func__.f2fs_dedup_param_check:
	.asciz	"f2fs_dedup_param_check"
	.size	.L__func__.f2fs_dedup_param_check, 23

	.type	.L.str.63,@object       // @.str.63
.L.str.63:
	.asciz	"\0013dedup file size not match inode1[%lu] %u, inode2[%lu] %u"
	.size	.L.str.63, 59

	.type	.L.str.64,@object       // @.str.64
.L.str.64:
	.asciz	"\0013dedup fails, inode[%lu] size < %lu bytes."
	.size	.L.str.64, 44

	.type	.L.str.65,@object       // @.str.65
.L.str.65:
	.asciz	"\0013dedup fails, inode[%lu] has been modified."
	.size	.L.str.65, 45

	.type	.L.str.66,@object       // @.str.66
.L.str.66:
	.asciz	"\0013dedup fails, inode[%lu] has been compressed."
	.size	.L.str.66, 47

	.type	.L.str.67,@object       // @.str.67
.L.str.67:
	.asciz	"\0013dedup fails, inode[%lu] enable verity."
	.size	.L.str.67, 41

	.type	.L.str.68,@object       // @.str.68
.L.str.68:
	.asciz	"\0013dedup fails, inode[%lu] is atomic file."
	.size	.L.str.68, 42

	.type	.L.str.69,@object       // @.str.69
.L.str.69:
	.asciz	"\0013dedup fails, inode[%lu] is volatile file."
	.size	.L.str.69, 44

	.type	.L.str.70,@object       // @.str.70
.L.str.70:
	.asciz	"\0013dedup fails, inode[%lu] is pinned file."
	.size	.L.str.70, 42

	.type	.L.str.71,@object       // @.str.71
.L.str.71:
	.asciz	"\0013dedup fails, inode[%lu] is immutable."
	.size	.L.str.71, 40

	.type	.L.str.72,@object       // @.str.72
.L.str.72:
	.asciz	"\0013inode[%lu] not match dir[%lu] fscrypt policy"
	.size	.L.str.72, 47

	.type	.L.str.73,@object       // @.str.73
.L.str.73:
	.asciz	"\0013create layer file acquire orphan fail, ino[%lu], inner[%lu]"
	.size	.L.str.73, 62

	.type	.L.str.74,@object       // @.str.74
.L.str.74:
	.asciz	"\0016inode[%lu] create layered success, inner[%lu] ret: %d"
	.size	.L.str.74, 56

	.type	.L.str.75,@object       // @.str.75
.L.str.75:
	.asciz	"\0013src: %lu, dst: %lu page index: %lu is diff ret[%d]"
	.size	.L.str.75, 53

	.type	.L.str.76,@object       // @.str.76
.L.str.76:
	.asciz	"\0013%s: files should be in same FS ino:%lu, base_ino:%lu"
	.size	.L.str.76, 55

	.type	.L__func__.f2fs_ioc_dedup_file,@object // @__func__.f2fs_ioc_dedup_file
.L__func__.f2fs_ioc_dedup_file:
	.asciz	"f2fs_ioc_dedup_file"
	.size	.L__func__.f2fs_ioc_dedup_file, 20

	.type	.L.str.77,@object       // @.str.77
.L.str.77:
	.asciz	"\0013%s: input inode[%lu] and [%lu] are same."
	.size	.L.str.77, 43

	.type	.L.str.78,@object       // @.str.78
.L.str.78:
	.asciz	"\0013inode[%lu] can't get lock"
	.size	.L.str.78, 28

	.type	.L.str.79,@object       // @.str.79
.L.str.79:
	.asciz	"\0013dedup inode[%lu] has been two layer inode"
	.size	.L.str.79, 44

	.type	.L.str.80,@object       // @.str.80
.L.str.80:
	.asciz	"\0013dedup inode[%lu] has been removed."
	.size	.L.str.80, 37

	.type	.L.str.81,@object       // @.str.81
.L.str.81:
	.asciz	"\0013base inode[%lu] is not outer inode"
	.size	.L.str.81, 37

	.type	.L.str.82,@object       // @.str.82
.L.str.82:
	.asciz	"\0013dir[%lu] inode[%lu] and inode[%lu] fscrypt policy not match."
	.size	.L.str.82, 63

	.type	.L.str.83,@object       // @.str.83
.L.str.83:
	.asciz	"\0013inode[%lu] and dir[%lu] inode[%lu] fscrypt policy not match."
	.size	.L.str.83, 63

	.type	.L.str.84,@object       // @.str.84
.L.str.84:
	.asciz	"\0013dedup file acquire orphan fail, ino[%lu], base ino[%lu]"
	.size	.L.str.84, 58

	.type	.L.str.85,@object       // @.str.85
.L.str.85:
	.asciz	"\0016%s inode[%lu] dedup success, inner[%lu], ret[%d]"
	.size	.L.str.85, 51

	.type	.L__func__.__f2fs_ioc_dedup_file,@object // @__func__.__f2fs_ioc_dedup_file
.L__func__.__f2fs_ioc_dedup_file:
	.asciz	"__f2fs_ioc_dedup_file"
	.size	.L__func__.__f2fs_ioc_dedup_file, 22

	.type	.L__func__.f2fs_ioc_dedup_revoke,@object // @__func__.f2fs_ioc_dedup_revoke
.L__func__.f2fs_ioc_dedup_revoke:
	.asciz	"f2fs_ioc_dedup_revoke"
	.size	.L__func__.f2fs_ioc_dedup_revoke, 22

	.type	.L.str.86,@object       // @.str.86
.L.str.86:
	.asciz	"\0013%s: files should be in same FS ino:%lu, src_ino:%lu"
	.size	.L.str.86, 54

	.type	.L__func__.f2fs_ioc_clone_file,@object // @__func__.f2fs_ioc_clone_file
.L__func__.f2fs_ioc_clone_file:
	.asciz	"f2fs_ioc_clone_file"
	.size	.L__func__.f2fs_ioc_clone_file, 20

	.type	.L.str.87,@object       // @.str.87
.L.str.87:
	.asciz	"\0013inode[%lu] convert inline inode failed, ret:%d"
	.size	.L.str.87, 49

	.type	.L.str.88,@object       // @.str.88
.L.str.88:
	.asciz	"\0013src inode[%lu] dst inode[%lu] ioc clone failed. ret=%d"
	.size	.L.str.88, 57

	.type	.L.str.89,@object       // @.str.89
.L.str.89:
	.asciz	"\0013inode[%lu] has mapped vma"
	.size	.L.str.89, 28

	.type	.L__func__.f2fs_ioc_modify_check,@object // @__func__.f2fs_ioc_modify_check
.L__func__.f2fs_ioc_modify_check:
	.asciz	"f2fs_ioc_modify_check"
	.size	.L__func__.f2fs_ioc_modify_check, 22

	.type	.L.str.90,@object       // @.str.90
.L.str.90:
	.asciz	"\0013inode[%lu] write data fail(%d)\n"
	.size	.L.str.90, 34

	.type	.L.str.91,@object       // @.str.91
.L.str.91:
	.asciz	"\0013inode[%lu] have dirty page[%d]\n"
	.size	.L.str.91, 34

	.type	.L.str.92,@object       // @.str.92
.L.str.92:
	.asciz	"set unmodify, dirty pages: %d"
	.size	.L.str.92, 30

	.type	.L.str.93,@object       // @.str.93
.L.str.93:
	.asciz	"\0013inode[%lu] had set meta unmodified flag"
	.size	.L.str.93, 42

	.type	.L.str.94,@object       // @.str.94
.L.str.94:
	.asciz	"\0013inode[%lu] had set data unmodified flag"
	.size	.L.str.94, 42

	.type	.L.str.95,@object       // @.str.95
.L.str.95:
	.asciz	"\0013inode[%lu] had clear unmodified meta flag"
	.size	.L.str.95, 44

	.type	.L.str.96,@object       // @.str.96
.L.str.96:
	.asciz	"\0013inode[%lu] had clear unmodified data flag"
	.size	.L.str.96, 44

	.type	.L.str.97,@object       // @.str.97
.L.str.97:
	.asciz	"\0016f2fs: setting mirror space to %u, origin %u\n"
	.size	.L.str.97, 47

	.type	.L__func__.f2fs_file_write_iter,@object // @__func__.f2fs_file_write_iter
.L__func__.f2fs_file_write_iter:
	.asciz	"f2fs_file_write_iter"
	.size	.L__func__.f2fs_file_write_iter, 21

	.type	f2fs_file_vm_ops,@object // @f2fs_file_vm_ops
	.section	.rodata,"a",@progbits
	.p2align	3
f2fs_file_vm_ops:
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	f2fs_filemap_fault
	.xword	0
	.xword	filemap_map_pages
	.xword	0
	.xword	f2fs_vm_page_mkwrite
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.size	f2fs_file_vm_ops, 136

	.type	.L__func__.f2fs_vm_page_mkwrite,@object // @__func__.f2fs_vm_page_mkwrite
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__func__.f2fs_vm_page_mkwrite:
	.asciz	"f2fs_vm_page_mkwrite"
	.size	.L__func__.f2fs_vm_page_mkwrite, 21

	.type	.L__func__.f2fs_fallocate,@object // @__func__.f2fs_fallocate
.L__func__.f2fs_fallocate:
	.asciz	"f2fs_fallocate"
	.size	.L__func__.f2fs_fallocate, 15

	.ident	"Snapdragon LLVM ARM Compiler 10.0.7 for Android NDK"
	.section	".note.GNU-stack","",@progbits
