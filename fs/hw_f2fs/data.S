	.text
	.file	"data.c"
	.section	.init.text,"ax",@progbits
	.globl	f2fs_init_bioset        // -- Begin function f2fs_init_bioset
	.p2align	2
	.type	f2fs_init_bioset,@function
f2fs_init_bioset:                       // @f2fs_init_bioset
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x0, f2fs_bioset
	mov	w1, #11
	add	x0, x0, :lo12:f2fs_bioset
	mov	w2, wzr
	mov	w3, #1
	mov	x29, sp
	bl	bioset_init
	mov	w8, #-12
	cmp	w0, #0                  // =0
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	f2fs_init_bioset, .Lfunc_end0-f2fs_init_bioset
                                        // -- End function
	.text
	.globl	f2fs_destroy_bioset     // -- Begin function f2fs_destroy_bioset
	.p2align	3
	.type	f2fs_destroy_bioset,@function
f2fs_destroy_bioset:                    // @f2fs_destroy_bioset
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x0, f2fs_bioset
	mov	x29, sp
	add	x0, x0, :lo12:f2fs_bioset
	bl	bioset_exit
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end1:
	.size	f2fs_destroy_bioset, .Lfunc_end1-f2fs_destroy_bioset
                                        // -- End function
	.globl	f2fs_bio_alloc          // -- Begin function f2fs_bio_alloc
	.p2align	3
	.type	f2fs_bio_alloc,@function
f2fs_bio_alloc:                         // @f2fs_bio_alloc
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	w8, #192
	tst	w2, #0x1
	movk	w8, #96, lsl #16
	mov	w9, #6291456
	adrp	x2, f2fs_bioset
	csel	w0, w9, w8, ne
	add	x2, x2, :lo12:f2fs_bioset
	mov	x29, sp
	bl	bio_alloc_bioset
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end2:
	.size	f2fs_bio_alloc, .Lfunc_end2-f2fs_bio_alloc
                                        // -- End function
	.globl	f2fs_target_device      // -- Begin function f2fs_target_device
	.p2align	3
	.type	f2fs_target_device,@function
f2fs_target_device:                     // @f2fs_target_device
// %bb.0:
	ldr	x9, [x0]
	mov	x8, x0
	ldr	x0, [x9, #248]
	cbz	x2, .LBB3_2
// %bb.1:
	str	w1, [x2, #88]
.LBB3_2:
	ldr	w9, [x8, #3024]
	cmp	w9, #2                  // =2
	b.lt	.LBB3_8
// %bb.3:
	ldr	x8, [x8, #3032]
	mov	x10, xzr
	add	x8, x8, #80             // =80
	b	.LBB3_5
.LBB3_4:                                //   in Loop: Header=BB3_5 Depth=1
	add	x10, x10, #1            // =1
	add	x8, x8, #192            // =192
	cmp	x10, x9
	b.eq	.LBB3_8
.LBB3_5:                                // =>This Inner Loop Header: Depth=1
	ldur	w11, [x8, #-4]
	cmp	w11, w1
	b.hi	.LBB3_4
// %bb.6:                               //   in Loop: Header=BB3_5 Depth=1
	ldr	w12, [x8]
	cmp	w12, w1
	b.lo	.LBB3_4
// %bb.7:
	ldur	x0, [x8, #-80]
	sub	w1, w1, w11
.LBB3_8:
	cbz	x2, .LBB3_12
// %bb.9:
	ldr	x8, [x2, #8]
	ldr	x9, [x0, #128]
	cmp	x8, x9
	b.eq	.LBB3_11
// %bb.10:
	ldrh	w8, [x2, #20]
	and	w8, w8, #0xfffffbff
	strh	w8, [x2, #20]
	ldr	x8, [x0, #128]
.LBB3_11:
	str	x8, [x2, #8]
	mov	w9, w1
	ldrb	w8, [x0, #108]
	lsl	x9, x9, #3
	str	x9, [x2, #40]
	strb	w8, [x2, #27]
.LBB3_12:
	ret
.Lfunc_end3:
	.size	f2fs_target_device, .Lfunc_end3-f2fs_target_device
                                        // -- End function
	.globl	f2fs_target_device_index // -- Begin function f2fs_target_device_index
	.p2align	3
	.type	f2fs_target_device_index,@function
f2fs_target_device_index:               // @f2fs_target_device_index
// %bb.0:
	ldr	w9, [x0, #3024]
	cmp	w9, #2                  // =2
	b.lt	.LBB4_6
// %bb.1:
	mov	x8, x0
	mov	x0, xzr
	ldr	x8, [x8, #3032]
	add	x8, x8, #80             // =80
	b	.LBB4_3
.LBB4_2:                                //   in Loop: Header=BB4_3 Depth=1
	add	x0, x0, #1              // =1
	add	x8, x8, #192            // =192
	cmp	x0, x9
	b.eq	.LBB4_6
.LBB4_3:                                // =>This Inner Loop Header: Depth=1
	ldur	w10, [x8, #-4]
	cmp	w10, w1
	b.hi	.LBB4_2
// %bb.4:                               //   in Loop: Header=BB4_3 Depth=1
	ldr	w10, [x8]
	cmp	w10, w1
	b.lo	.LBB4_2
// %bb.5:
                                        // kill: def $w0 killed $w0 killed $x0
	ret
.LBB4_6:
	mov	w0, wzr
                                        // kill: def $w0 killed $w0 killed $x0
	ret
.Lfunc_end4:
	.size	f2fs_target_device_index, .Lfunc_end4-f2fs_target_device_index
                                        // -- End function
	.globl	f2fs_submit_bio         // -- Begin function f2fs_submit_bio
	.p2align	3
	.type	f2fs_submit_bio,@function
f2fs_submit_bio:                        // @f2fs_submit_bio
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	//APP
	mrs x22, sp_el0
	//NO_APP
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	w20, w2
	ldrb	w8, [x22, #111]
	mov	x19, x1
	mov	x21, x0
	str	x25, [sp, #16]          // 8-byte Folded Spill
	tbnz	w8, #1, .LBB5_2
// %bb.1:
	ldr	w8, [x22, #2512]
	add	w8, w8, #1              // =1
	str	w8, [x22, #2512]
.LBB5_2:
	ldrb	w8, [x19, #16]
	cbz	w8, .LBB5_10
// %bb.3:
	cmp	w20, #1                 // =1
	b.hi	.LBB5_10
// %bb.4:
	ldr	w8, [x21, #1504]
	ldr	w23, [x19, #88]
	cmp	w8, #1                  // =1
	b.ne	.LBB5_7
// %bb.5:
	ldr	x0, [x22, #2504]
	cbz	x0, .LBB5_7
// %bb.6:
	bl	blk_finish_plug
.LBB5_7:
	add	w8, w23, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB5_28
.LBB5_8:
	ldr	w8, [x21, #1432]
	mov	w9, #1
	lsl	w8, w9, w8
	cmp	w8, #2                  // =2
	b.lt	.LBB5_10
// %bb.9:
	ldr	w9, [x19, #48]
	sub	w8, w8, #1              // =1
	tst	w8, w9, lsr #12
	b.ne	.LBB5_60
.LBB5_10:
	ldrb	w8, [x19, #16]
	ldr	x21, [x21]
	cbz	w8, .LBB5_18
// %bb.11:
	adrp	x8, __tracepoint_f2fs_submit_write_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_write_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB5_27
// %bb.12:
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
	cbz	x19, .LBB5_27
// %bb.13:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB5_27
// %bb.14:
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x23, [x8, #32]
	cbz	x23, .LBB5_17
// %bb.15:
	ldr	x8, [x23], #24
.LBB5_16:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x23, #-16]
	mov	x1, x21
	mov	w2, w20
	mov	x3, x19
	blr	x8
	ldr	x8, [x23], #24
	cbnz	x8, .LBB5_16
.LBB5_17:
	//APP
	//NO_APP
	b	.LBB5_25
.LBB5_18:
	adrp	x8, __tracepoint_f2fs_submit_read_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_read_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB5_27
// %bb.19:
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
	cbz	x19, .LBB5_27
// %bb.20:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB5_27
// %bb.21:
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x23, [x8, #32]
	cbz	x23, .LBB5_24
// %bb.22:
	ldr	x8, [x23], #24
.LBB5_23:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x23, #-16]
	mov	x1, x21
	mov	w2, w20
	mov	x3, x19
	blr	x8
	ldr	x8, [x23], #24
	cbnz	x8, .LBB5_23
.LBB5_24:
	//APP
	//NO_APP
.LBB5_25:
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB5_27
// %bb.26:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB5_55
.LBB5_27:
	mov	x0, x19
	bl	submit_bio
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB5_28:
	ldr	w9, [x21, #3024]
	cbz	w9, .LBB5_36
// %bb.29:
	ldr	x8, [x21]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB5_35
// %bb.30:
	ldr	x11, [x21, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB5_32
.LBB5_31:                               //   in Loop: Header=BB5_32 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB5_35
.LBB5_32:                               // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w23
	b.hi	.LBB5_31
// %bb.33:                              //   in Loop: Header=BB5_32 Depth=1
	ldr	w12, [x11]
	cmp	w12, w23
	b.lo	.LBB5_31
// %bb.34:
	ldur	x8, [x11, #-80]
.LBB5_35:
	cbz	x8, .LBB5_8
.LBB5_36:
	ldr	x8, [x21, #136]
	cbz	x8, .LBB5_38
// %bb.37:
	add	x9, x8, #80             // =80
	b	.LBB5_39
.LBB5_38:
	ldr	x9, [x21, #16]
	add	x9, x9, #72             // =72
.LBB5_39:
	ldr	x10, [x8, #8]
	ldr	w9, [x9]
	ldr	w11, [x21, #1184]
	ldr	w10, [x10]
	sub	w9, w23, w9
	lsr	w9, w9, w11
	sub	w9, w9, w10
	cmn	w9, #1                  // =1
	b.eq	.LBB5_8
// %bb.40:
	ldr	x8, [x8]
	mov	w10, #48
	ldr	x8, [x8, #136]
	umaddl	x23, w9, w10, x8
	cbnz	w20, .LBB5_46
// %bb.41:
	cbz	x23, .LBB5_46
// %bb.42:
	ldr	w8, [x23]
	mov	w10, #1
	mov	w24, #455
	and	w9, w8, #0x3f
	cmp	w9, #8                  // =8
	lsl	w9, w10, w9
	and	w9, w9, w24
	ccmp	w9, #0, #4, ls
	b.eq	.LBB5_51
.LBB5_43:
	and	w8, w8, #0x3f
	cmp	w8, #8                  // =8
	b.hi	.LBB5_45
// %bb.44:
	mov	w9, #1
	lsl	w8, w9, w8
	tst	w8, w24
	b.ne	.LBB5_8
.LBB5_45:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 892; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB5_46:
	cmp	w20, #1                 // =1
	b.ne	.LBB5_8
// %bb.47:
	cbz	x23, .LBB5_8
// %bb.48:
	ldr	w8, [x23]
	and	w9, w8, #0x3f
	sub	w9, w9, #3              // =3
	cmp	w9, #3                  // =3
	b.hs	.LBB5_56
.LBB5_49:
	and	w8, w8, #0x3f
	sub	w8, w8, #3              // =3
	cmp	w8, #3                  // =3
	b.lo	.LBB5_8
// %bb.50:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 894; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB5_51:
	bl	print_bdev_access_info
	adrp	x25, f2fs_dclient
	ldr	x0, [x25, :lo12:f2fs_dclient]
	cbz	x0, .LBB5_54
// %bb.52:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB5_54
// %bb.53:
	ldr	x0, [x25, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #892
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB5_54:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldr	w8, [x23]
	b	.LBB5_43
.LBB5_55:
	bl	preempt_schedule_notrace
	b	.LBB5_27
.LBB5_56:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB5_59
// %bb.57:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB5_59
// %bb.58:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #894
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB5_59:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldr	w8, [x23]
	b	.LBB5_49
.LBB5_60:
	ldr	x0, [x21, #216]
	mov	w1, #2048
	movk	w1, #96, lsl #16
	bl	mempool_alloc
	mov	x19, x0
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbnz	x19, .LBB5_65
// %bb.61:
	cbz	x0, .LBB5_64
// %bb.62:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB5_64
// %bb.63:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #913
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB5_64:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 913; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB5_65:
	cbz	x0, .LBB5_68
// %bb.66:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB5_68
// %bb.67:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #917
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB5_68:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 917; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end5:
	.size	f2fs_submit_bio, .Lfunc_end5-f2fs_submit_bio
                                        // -- End function
	.globl	f2fs_submit_merged_write // -- Begin function f2fs_submit_merged_write
	.p2align	3
	.type	f2fs_submit_merged_write,@function
f2fs_submit_merged_write:               // @f2fs_submit_merged_write
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	w4, w1
	mov	x1, xzr
	mov	x2, xzr
	mov	w3, wzr
	mov	w5, #1
	mov	x29, sp
	bl	__submit_merged_write_cond
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end6:
	.size	f2fs_submit_merged_write, .Lfunc_end6-f2fs_submit_merged_write
                                        // -- End function
	.p2align	3               // -- Begin function __submit_merged_write_cond
	.type	__submit_merged_write_cond,@function
__submit_merged_write_cond:             // @__submit_merged_write_cond
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	cmp	w4, #2                  // =2
	mov	w8, #2
	csel	w8, w4, w8, lo
	str	x27, [sp, #16]          // 8-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	mov	w23, w4
	add	x8, x0, w8, uxtw #3
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	w22, w5
	mov	w19, w3
	mov	x20, x2
	mov	x24, x0
	mov	x21, x1
	add	x27, x8, #144           // =144
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	tbnz	w5, #0, .LBB7_2
// %bb.1:
	ldr	x26, [x27]
	add	x25, x26, #168          // =168
	mov	x0, x25
	bl	down_read
	ldr	x0, [x26, #8]
	mov	x1, x21
	mov	x2, x20
	mov	w3, w19
	bl	__has_merged_page
	mov	w26, w0
	mov	x0, x25
	bl	up_read
	tbz	w26, #0, .LBB7_5
.LBB7_2:
	ldr	x26, [x27]
	add	x25, x26, #168          // =168
	mov	x0, x25
	bl	down_write
	cmp	w23, #4                 // =4
	b.lo	.LBB7_4
// %bb.3:
	mov	x9, #1
	mov	w8, #4
	movk	x9, #14336, lsl #32
	str	w8, [x26, #36]
	stur	x9, [x26, #44]
	mov	w9, #14336
	ldr	w8, [x24, #1424]
	movk	w9, #6, lsl #16
	tst	w8, #0x800
	mov	w8, #14336
	csel	w8, w9, w8, eq
	str	w8, [x26, #48]
.LBB7_4:
	mov	x0, x26
	bl	__submit_merged_bio
	mov	x0, x25
	bl	up_write
	mov	w25, #1
	cmp	w23, #2                 // =2
	b.lo	.LBB7_6
	b	.LBB7_14
.LBB7_5:
	mov	w25, wzr
	cmp	w23, #2                 // =2
	b.hs	.LBB7_14
.LBB7_6:
	tbnz	w22, #0, .LBB7_8
// %bb.7:
	ldr	x24, [x27]
	add	x23, x24, #472          // =472
	mov	x0, x23
	bl	down_read
	ldr	x0, [x24, #312]
	mov	x1, x21
	mov	x2, x20
	mov	w3, w19
	bl	__has_merged_page
	and	w25, w0, #0x1
	mov	x0, x23
	bl	up_read
.LBB7_8:
	cbz	w25, .LBB7_10
// %bb.9:
	ldr	x8, [x27]
	add	x24, x8, #472           // =472
	add	x23, x8, #304           // =304
	mov	x0, x24
	bl	down_write
	mov	x0, x23
	bl	__submit_merged_bio
	mov	x0, x24
	bl	up_write
.LBB7_10:
	tbnz	w22, #0, .LBB7_12
// %bb.11:
	ldr	x23, [x27]
	add	x22, x23, #776          // =776
	mov	x0, x22
	bl	down_read
	ldr	x0, [x23, #616]
	mov	x1, x21
	mov	x2, x20
	mov	w3, w19
	bl	__has_merged_page
	and	w25, w0, #0x1
	mov	x0, x22
	bl	up_read
.LBB7_12:
	cbz	w25, .LBB7_14
// %bb.13:
	ldr	x8, [x27]
	add	x20, x8, #776           // =776
	add	x19, x8, #608           // =608
	mov	x0, x20
	bl	down_write
	mov	x0, x19
	bl	__submit_merged_bio
	mov	x0, x20
	bl	up_write
.LBB7_14:
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldr	x27, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end7:
	.size	__submit_merged_write_cond, .Lfunc_end7-__submit_merged_write_cond
                                        // -- End function
	.globl	f2fs_submit_merged_write_cond // -- Begin function f2fs_submit_merged_write_cond
	.p2align	3
	.type	f2fs_submit_merged_write_cond,@function
f2fs_submit_merged_write_cond:          // @f2fs_submit_merged_write_cond
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	w5, wzr
	mov	x29, sp
	bl	__submit_merged_write_cond
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end8:
	.size	f2fs_submit_merged_write_cond, .Lfunc_end8-f2fs_submit_merged_write_cond
                                        // -- End function
	.globl	f2fs_flush_merged_writes // -- Begin function f2fs_flush_merged_writes
	.p2align	3
	.type	f2fs_flush_merged_writes,@function
f2fs_flush_merged_writes:               // @f2fs_flush_merged_writes
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x20, [x0, #144]
	mov	x29, sp
	str	x21, [sp, #16]          // 8-byte Folded Spill
	add	x21, x20, #168          // =168
	mov	x0, x21
	bl	down_write
	mov	x0, x20
	bl	__submit_merged_bio
	mov	x0, x21
	bl	up_write
	ldr	x8, [x19, #144]
	add	x21, x8, #472           // =472
	add	x20, x8, #304           // =304
	mov	x0, x21
	bl	down_write
	mov	x0, x20
	bl	__submit_merged_bio
	mov	x0, x21
	bl	up_write
	ldr	x8, [x19, #144]
	add	x21, x8, #776           // =776
	add	x20, x8, #608           // =608
	mov	x0, x21
	bl	down_write
	mov	x0, x20
	bl	__submit_merged_bio
	mov	x0, x21
	bl	up_write
	ldr	x20, [x19, #152]
	add	x21, x20, #168          // =168
	mov	x0, x21
	bl	down_write
	mov	x0, x20
	bl	__submit_merged_bio
	mov	x0, x21
	bl	up_write
	ldr	x8, [x19, #152]
	add	x21, x8, #472           // =472
	add	x20, x8, #304           // =304
	mov	x0, x21
	bl	down_write
	mov	x0, x20
	bl	__submit_merged_bio
	mov	x0, x21
	bl	up_write
	ldr	x8, [x19, #152]
	add	x21, x8, #776           // =776
	add	x20, x8, #608           // =608
	mov	x0, x21
	bl	down_write
	mov	x0, x20
	bl	__submit_merged_bio
	mov	x0, x21
	bl	up_write
	ldr	x19, [x19, #160]
	add	x20, x19, #168          // =168
	mov	x0, x20
	bl	down_write
	mov	x0, x19
	bl	__submit_merged_bio
	mov	x0, x20
	bl	up_write
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end9:
	.size	f2fs_flush_merged_writes, .Lfunc_end9-f2fs_flush_merged_writes
                                        // -- End function
	.globl	f2fs_submit_page_bio    // -- Begin function f2fs_submit_page_bio
	.p2align	3
	.type	f2fs_submit_page_bio,@function
f2fs_submit_page_bio:                   // @f2fs_submit_page_bio
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x21, [x0, #48]
	str	x23, [sp, #16]          // 8-byte Folded Spill
	cbnz	x21, .LBB10_2
// %bb.1:
	ldr	x21, [x19, #40]
.LBB10_2:
	ldr	x0, [x19]
	ldrb	w8, [x19, #89]
	ldr	w1, [x19, #28]
	cbz	w8, .LBB10_17
// %bb.3:
	mov	w2, #5
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB10_18
.LBB10_4:
	adrp	x8, __tracepoint_f2fs_submit_page_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_page_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB10_12
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
	tbz	w9, #0, .LBB10_12
// %bb.6:
	ldr	x9, [x21, #24]
	cbz	x9, .LBB10_12
// %bb.7:
	//APP
	mrs x20, sp_el0
	//NO_APP
	ldr	w9, [x20, #80]
	add	w9, w9, #1              // =1
	str	w9, [x20, #80]
	//APP
	//NO_APP
	ldr	x22, [x8, #32]
	cbz	x22, .LBB10_10
// %bb.8:
	ldr	x8, [x22], #24
.LBB10_9:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x22, #-16]
	mov	x1, x21
	mov	x2, x19
	blr	x8
	ldr	x8, [x22], #24
	cbnz	x8, .LBB10_9
.LBB10_10:
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	b.ne	.LBB10_12
// %bb.11:
	ldr	x8, [x20]
	tbnz	w8, #1, .LBB10_52
.LBB10_12:
	mov	x0, x19
	mov	w1, #1
	bl	__bio_alloc
	ldr	x8, [x19, #40]
	mov	x20, x0
	ldp	x9, x2, [x8, #24]
	ldr	x1, [x9]
	cbz	x19, .LBB10_19
// %bb.13:
	ldr	x8, [x19, #48]
	cbz	x8, .LBB10_19
// %bb.14:
	ldrb	w8, [x1, #13]
	tbz	w8, #6, .LBB10_20
// %bb.15:
	ldrh	w8, [x1]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB10_20
// %bb.16:
	mov	w8, #1
	strb	w8, [x20, #136]
	b	.LBB10_20
.LBB10_17:
	ldr	w8, [x19, #12]
	mov	w9, #7
	cmp	w8, #2                  // =2
	mov	w8, #9
	csel	w2, w9, w8, lo
	bl	f2fs_is_valid_blkaddr
	tbnz	w0, #0, .LBB10_4
.LBB10_18:
	mov	w0, #-117
	b	.LBB10_57
.LBB10_19:
	mov	x0, x20
	mov	w3, #6291456
	bl	fscrypt_set_bio_crypt_ctx
.LBB10_20:
	mov	x0, x20
	mov	x1, x21
	mov	w2, #4096
	mov	w3, wzr
	bl	bio_add_page
	cmp	w0, #4095               // =4095
	b.hi	.LBB10_22
// %bb.21:
	mov	x0, x20
	bl	bio_put
	mov	w0, #-14
	b	.LBB10_57
.LBB10_22:
	ldr	x0, [x19, #104]
	cbz	x0, .LBB10_25
// %bb.23:
	ldr	w8, [x19, #20]
	cbz	w8, .LBB10_25
// %bb.24:
	mov	x1, x21
	mov	w2, #4096
	bl	wbc_account_io
.LBB10_25:
	ldr	w8, [x19, #12]
	cbnz	w8, .LBB10_30
// %bb.26:
	ldr	x8, [x19]
	mov	w10, #1
	ldr	w9, [x19, #16]
	ldr	w8, [x8, #2620]
	lsl	w9, w10, w9
	and	w9, w9, #0x7
	tst	w9, w8, lsr #3
	b.eq	.LBB10_28
// %bb.27:
	ldr	w10, [x19, #24]
	orr	w10, w10, #0x1000
	str	w10, [x19, #24]
.LBB10_28:
	tst	w9, w8
	b.eq	.LBB10_30
// %bb.29:
	ldr	w8, [x19, #24]
	orr	w8, w8, #0x20000
	str	w8, [x19, #24]
.LBB10_30:
	ldp	w8, w9, [x19, #20]
	orr	w8, w9, w8
	str	w8, [x20, #16]
	ldr	w8, [x19, #20]
	ldr	x22, [x19]
	cbz	w8, .LBB10_36
// %bb.31:
	ldr	x21, [x19, #40]
	ldr	x8, [x21, #24]
	cbz	x8, .LBB10_50
// %bb.32:
	ldr	x23, [x8]
	ldr	x8, [x23, #40]
	ldr	x9, [x8, #1104]
	ldr	x8, [x23, #64]
	ldr	w10, [x9, #1180]
	cmp	x8, x10
	b.eq	.LBB10_35
// %bb.33:
	ldr	w9, [x9, #1176]
	cmp	x8, x9
	b.eq	.LBB10_35
// %bb.34:
	ldrh	w8, [x23]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.ne	.LBB10_44
.LBB10_35:
	mov	w8, #7
	b	.LBB10_55
.LBB10_36:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB10_38
// %bb.37:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB10_53
.LBB10_38:
	ldr	x0, [x21, #24]
	cbz	x0, .LBB10_54
.LBB10_39:
	ldr	x8, [x0]
	ldr	x9, [x8, #40]
	ldr	x8, [x8, #64]
	ldr	x9, [x9, #1104]
	ldr	w10, [x9, #1180]
	cmp	x8, x10
	b.ne	.LBB10_41
// %bb.40:
	mov	w8, #11
	b	.LBB10_43
.LBB10_41:
	ldr	w9, [x9, #1176]
	cmp	x8, x9
	b.ne	.LBB10_54
// %bb.42:
	mov	w8, #10
.LBB10_43:
	add	x8, x22, x8, lsl #2
	add	x8, x8, #1272           // =1272
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB10_56
.LBB10_44:
	mov	x0, x21
	bl	f2fs_is_compressed_page
	tbnz	w0, #0, .LBB10_50
// %bb.45:
	ldrh	w8, [x23]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB10_48
// %bb.46:
	ldr	x8, [x23, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB10_35
// %bb.47:
	ldrb	w8, [x23, #12]
	tbnz	w8, #5, .LBB10_35
.LBB10_48:
	ldr	x8, [x21]
	tbz	w8, #13, .LBB10_50
// %bb.49:
	ldr	x8, [x21, #40]
	tbnz	w8, #0, .LBB10_51
.LBB10_50:
	mov	w8, #8
	b	.LBB10_55
.LBB10_51:
	ldr	x8, [x21, #40]
	tst	x8, #0x8
	mov	w8, #7
	cinc	x8, x8, eq
	b	.LBB10_55
.LBB10_52:
	bl	preempt_schedule_notrace
	b	.LBB10_12
.LBB10_53:
	mov	x0, x21
	bl	__page_file_mapping
	cbnz	x0, .LBB10_39
.LBB10_54:
	mov	w8, #9
.LBB10_55:
	add	x8, x22, x8, lsl #2
	add	x8, x8, #1272           // =1272
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB10_56:
	ldr	x0, [x19]
	mov	x1, x20
	ldr	w2, [x19, #12]
	bl	__f2fs_submit_read_bio
	mov	w0, wzr
.LBB10_57:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end10:
	.size	f2fs_submit_page_bio, .Lfunc_end10-f2fs_submit_page_bio
                                        // -- End function
	.p2align	3               // -- Begin function __bio_alloc
	.type	__bio_alloc,@function
__bio_alloc:                            // @__bio_alloc
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	adrp	x2, f2fs_bioset
	str	x21, [sp, #16]          // 8-byte Folded Spill
	mov	x20, x0
	ldr	x21, [x0]
	add	x2, x2, :lo12:f2fs_bioset
	mov	w0, #6291456
	mov	x29, sp
	bl	bio_alloc_bioset
	ldr	x9, [x21]
	mov	x19, x0
	ldr	w8, [x20, #28]
	ldr	x9, [x9, #248]
	cbz	x0, .LBB11_2
// %bb.1:
	str	w8, [x19, #88]
.LBB11_2:
	ldr	w10, [x21, #3024]
	cmp	w10, #2                 // =2
	b.lt	.LBB11_8
// %bb.3:
	ldr	x11, [x21, #3032]
	mov	x12, xzr
	add	x11, x11, #80           // =80
	b	.LBB11_5
.LBB11_4:                               //   in Loop: Header=BB11_5 Depth=1
	add	x12, x12, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x12, x10
	b.eq	.LBB11_8
.LBB11_5:                               // =>This Inner Loop Header: Depth=1
	ldur	w13, [x11, #-4]
	subs	w13, w8, w13
	b.lo	.LBB11_4
// %bb.6:                               //   in Loop: Header=BB11_5 Depth=1
	ldr	w14, [x11]
	cmp	w14, w8
	b.lo	.LBB11_4
// %bb.7:
	ldur	x9, [x11, #-80]
	mov	w8, w13
.LBB11_8:
	cbz	x19, .LBB11_12
// %bb.9:
	ldr	x10, [x19, #8]
	ldr	x11, [x9, #128]
	cmp	x10, x11
	b.eq	.LBB11_11
// %bb.10:
	ldrh	w10, [x19, #20]
	and	w10, w10, #0xfffffbff
	strh	w10, [x19, #20]
	ldr	x10, [x9, #128]
.LBB11_11:
	str	x10, [x19, #8]
	mov	w8, w8
	ldrb	w9, [x9, #108]
	lsl	x8, x8, #3
	str	x8, [x19, #40]
	strb	w9, [x19, #27]
.LBB11_12:
	ldr	w8, [x20, #20]
	cbz	w8, .LBB11_14
// %bb.13:
	adrp	x8, f2fs_write_end_io
	mov	x0, x21
	add	x8, x8, :lo12:f2fs_write_end_io
	stp	x8, x21, [x19, #72]
	ldp	w1, w2, [x20, #12]
	bl	f2fs_io_type_to_rw_hint
	strh	w0, [x19, #24]
	ldr	x8, [x20, #104]
	cbnz	x8, .LBB11_15
	b	.LBB11_17
.LBB11_14:
	adrp	x8, f2fs_read_end_io
	add	x8, x8, :lo12:f2fs_read_end_io
	stp	x8, xzr, [x19, #72]
	ldr	x8, [x20, #104]
	cbz	x8, .LBB11_17
.LBB11_15:
	ldr	x8, [x8, #40]
	cbz	x8, .LBB11_17
// %bb.16:
	ldr	x1, [x8, #672]
	mov	x0, x19
	bl	bio_associate_blkcg
.LBB11_17:
	mov	x0, x19
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end11:
	.size	__bio_alloc, .Lfunc_end11-__bio_alloc
                                        // -- End function
	.p2align	3               // -- Begin function __f2fs_submit_read_bio
	.type	__f2fs_submit_read_bio,@function
__f2fs_submit_read_bio:                 // @__f2fs_submit_read_bio
// %bb.0:
	sub	sp, sp, #384            // =384
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #288]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #320]    // 16-byte Folded Spill
	add	x29, sp, #288           // =288
	adrp	x26, __tracepoint_android_fs_dataread_start
	stp	x28, x27, [sp, #304]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	add	x26, x26, :lo12:__tracepoint_android_fs_dataread_start
	stp	x24, x23, [sp, #336]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #352]    // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #368]    // 16-byte Folded Spill
	mov	w20, w2
	stur	x8, [x29, #-16]
	mov	x19, x1
	ldr	w8, [x26, #8]
	cbnz	w2, .LBB12_18
// %bb.1:
	cmp	w8, #1                  // =1
	b.lt	.LBB12_18
// %bb.2:
	ldr	x8, [x19, #152]
	ldr	x22, [x8]
	cbz	x22, .LBB12_18
// %bb.3:
	ldr	x0, [x22, #24]
	cbz	x0, .LBB12_18
// %bb.4:
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB12_6
// %bb.5:
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB12_75
.LBB12_6:
	ldr	x8, [x0]
	ldr	x9, [x8, #40]
	ldr	x8, [x8, #64]
	ldr	x9, [x9, #1104]
	ldr	w10, [x9, #1180]
	cmp	x8, x10
	b.eq	.LBB12_18
// %bb.7:
	ldr	w9, [x9, #1176]
	cmp	x8, x9
	b.eq	.LBB12_18
.LBB12_8:
	ldr	x8, [x22, #24]
	ldr	x23, [x8]
	mov	x0, x23
	bl	ihold
	mov	x0, x23
	bl	d_obtain_alias
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB12_76
// %bb.9:
	add	x1, sp, #16             // =16
	mov	w2, #256
	mov	x24, x0
	bl	dentry_path_raw
	mov	x23, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB12_77
.LBB12_10:
	mov	x0, x24
	bl	dput
.LBB12_11:
	ldp	x9, x8, [x22, #24]
	//APP
	mrs x12, sp_el0
	//NO_APP
	ldr	w22, [x19, #48]
	ldr	w24, [x12, #1784]
	ldr	x25, [x9]
	ldr	w9, [x26, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB12_18
// %bb.12:
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
	tbz	w9, #0, .LBB12_18
// %bb.13:
	ldr	w9, [x12, #80]
	str	x12, [sp, #8]           // 8-byte Folded Spill
	add	w9, w9, #1              // =1
	str	w9, [x12, #80]
	//APP
	//NO_APP
	ldr	x28, [x26, #32]
	cbz	x28, .LBB12_16
// %bb.14:
	ldr	x9, [x28], #24
	ldr	x10, [sp, #8]           // 8-byte Folded Reload
	lsl	x27, x8, #12
	add	x26, x10, #2232         // =2232
.LBB12_15:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x28, #-16]
	mov	x1, x25
	mov	x2, x27
	mov	w3, w22
	mov	w4, w24
	mov	x5, x23
	mov	x6, x26
	blr	x9
	ldr	x9, [x28], #24
	cbnz	x9, .LBB12_15
.LBB12_16:
	//APP
	//NO_APP
	ldr	x9, [sp, #8]            // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	b.ne	.LBB12_18
// %bb.17:
	ldr	x8, [x9]
	tbnz	w8, #1, .LBB12_82
.LBB12_18:
	//APP
	mrs x22, sp_el0
	//NO_APP
	ldrb	w8, [x22, #111]
	tbnz	w8, #1, .LBB12_20
// %bb.19:
	ldr	w8, [x22, #2512]
	add	w8, w8, #1              // =1
	str	w8, [x22, #2512]
.LBB12_20:
	ldrb	w8, [x19, #16]
	cbz	w8, .LBB12_28
// %bb.21:
	cmp	w20, #1                 // =1
	b.hi	.LBB12_28
// %bb.22:
	ldr	w8, [x21, #1504]
	ldr	w23, [x19, #88]
	cmp	w8, #1                  // =1
	b.ne	.LBB12_25
// %bb.23:
	ldr	x0, [x22, #2504]
	cbz	x0, .LBB12_25
// %bb.24:
	bl	blk_finish_plug
.LBB12_25:
	add	w8, w23, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB12_47
.LBB12_26:
	ldr	w8, [x21, #1432]
	mov	w9, #1
	lsl	w8, w9, w8
	cmp	w8, #2                  // =2
	b.lt	.LBB12_28
// %bb.27:
	ldr	w9, [x19, #48]
	sub	w8, w8, #1              // =1
	tst	w8, w9, lsr #12
	b.ne	.LBB12_84
.LBB12_28:
	ldrb	w8, [x19, #16]
	ldr	x21, [x21]
	cbz	w8, .LBB12_36
// %bb.29:
	adrp	x8, __tracepoint_f2fs_submit_write_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_write_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB12_45
// %bb.30:
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
	cbz	x19, .LBB12_45
// %bb.31:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB12_45
// %bb.32:
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x23, [x8, #32]
	cbz	x23, .LBB12_35
// %bb.33:
	ldr	x8, [x23], #24
.LBB12_34:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x23, #-16]
	mov	x1, x21
	mov	w2, w20
	mov	x3, x19
	blr	x8
	ldr	x8, [x23], #24
	cbnz	x8, .LBB12_34
.LBB12_35:
	//APP
	//NO_APP
	b	.LBB12_43
.LBB12_36:
	adrp	x8, __tracepoint_f2fs_submit_read_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_read_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB12_45
// %bb.37:
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
	cbz	x19, .LBB12_45
// %bb.38:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB12_45
// %bb.39:
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x23, [x8, #32]
	cbz	x23, .LBB12_42
// %bb.40:
	ldr	x8, [x23], #24
.LBB12_41:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x23, #-16]
	mov	x1, x21
	mov	w2, w20
	mov	x3, x19
	blr	x8
	ldr	x8, [x23], #24
	cbnz	x8, .LBB12_41
.LBB12_42:
	//APP
	//NO_APP
.LBB12_43:
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB12_45
// %bb.44:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB12_74
.LBB12_45:
	mov	x0, x19
	bl	submit_bio
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB12_83
// %bb.46:
	ldp	x20, x19, [sp, #368]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #352]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #336]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #320]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #304]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #288]    // 16-byte Folded Reload
	add	sp, sp, #384            // =384
	ret
.LBB12_47:
	ldr	w9, [x21, #3024]
	cbz	w9, .LBB12_55
// %bb.48:
	ldr	x8, [x21]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB12_54
// %bb.49:
	ldr	x11, [x21, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB12_51
.LBB12_50:                              //   in Loop: Header=BB12_51 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB12_54
.LBB12_51:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w23
	b.hi	.LBB12_50
// %bb.52:                              //   in Loop: Header=BB12_51 Depth=1
	ldr	w12, [x11]
	cmp	w12, w23
	b.lo	.LBB12_50
// %bb.53:
	ldur	x8, [x11, #-80]
.LBB12_54:
	cbz	x8, .LBB12_26
.LBB12_55:
	ldr	x8, [x21, #136]
	cbz	x8, .LBB12_57
// %bb.56:
	add	x9, x8, #80             // =80
	b	.LBB12_58
.LBB12_57:
	ldr	x9, [x21, #16]
	add	x9, x9, #72             // =72
.LBB12_58:
	ldr	x10, [x8, #8]
	ldr	w9, [x9]
	ldr	w11, [x21, #1184]
	ldr	w10, [x10]
	sub	w9, w23, w9
	lsr	w9, w9, w11
	sub	w9, w9, w10
	cmn	w9, #1                  // =1
	b.eq	.LBB12_26
// %bb.59:
	ldr	x8, [x8]
	mov	w10, #48
	ldr	x8, [x8, #136]
	umaddl	x23, w9, w10, x8
	cbnz	w20, .LBB12_65
// %bb.60:
	cbz	x23, .LBB12_65
// %bb.61:
	ldr	w8, [x23]
	mov	w10, #1
	mov	w24, #455
	and	w9, w8, #0x3f
	cmp	w9, #8                  // =8
	lsl	w9, w10, w9
	and	w9, w9, w24
	ccmp	w9, #0, #4, ls
	b.eq	.LBB12_70
.LBB12_62:
	and	w8, w8, #0x3f
	cmp	w8, #8                  // =8
	b.hi	.LBB12_64
// %bb.63:
	mov	w9, #1
	lsl	w8, w9, w8
	tst	w8, w24
	b.ne	.LBB12_26
.LBB12_64:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 892; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB12_65:
	cmp	w20, #1                 // =1
	b.ne	.LBB12_26
// %bb.66:
	cbz	x23, .LBB12_26
// %bb.67:
	ldr	w8, [x23]
	and	w9, w8, #0x3f
	sub	w9, w9, #3              // =3
	cmp	w9, #3                  // =3
	b.hs	.LBB12_78
.LBB12_68:
	and	w8, w8, #0x3f
	sub	w8, w8, #3              // =3
	cmp	w8, #3                  // =3
	b.lo	.LBB12_26
// %bb.69:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 894; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB12_70:
	bl	print_bdev_access_info
	adrp	x25, f2fs_dclient
	ldr	x0, [x25, :lo12:f2fs_dclient]
	cbz	x0, .LBB12_73
// %bb.71:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB12_73
// %bb.72:
	ldr	x0, [x25, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #892
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB12_73:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldr	w8, [x23]
	b	.LBB12_62
.LBB12_74:
	bl	preempt_schedule_notrace
	b	.LBB12_45
.LBB12_75:
	mov	x0, x22
	bl	__page_file_mapping
	cbnz	x0, .LBB12_6
	b	.LBB12_8
.LBB12_76:
	adrp	x1, .L.str.14
	add	x0, sp, #16             // =16
	add	x1, x1, :lo12:.L.str.14
	add	x23, sp, #16            // =16
	bl	strcpy
	b	.LBB12_11
.LBB12_77:
	adrp	x1, .L.str.14
	add	x0, sp, #16             // =16
	add	x1, x1, :lo12:.L.str.14
	add	x23, sp, #16            // =16
	bl	strcpy
	b	.LBB12_10
.LBB12_78:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB12_81
// %bb.79:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB12_81
// %bb.80:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #894
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB12_81:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldr	w8, [x23]
	b	.LBB12_68
.LBB12_82:
	bl	preempt_schedule_notrace
	b	.LBB12_18
.LBB12_83:
	bl	__stack_chk_fail
.LBB12_84:
	ldr	x0, [x21, #216]
	mov	w1, #2048
	movk	w1, #96, lsl #16
	bl	mempool_alloc
	mov	x19, x0
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbnz	x19, .LBB12_89
// %bb.85:
	cbz	x0, .LBB12_88
// %bb.86:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB12_88
// %bb.87:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #913
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB12_88:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 913; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB12_89:
	cbz	x0, .LBB12_92
// %bb.90:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB12_92
// %bb.91:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #917
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB12_92:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 917; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end12:
	.size	__f2fs_submit_read_bio, .Lfunc_end12-__f2fs_submit_read_bio
                                        // -- End function
	.globl	f2fs_submit_merged_ipu_write // -- Begin function f2fs_submit_merged_ipu_write
	.p2align	3
	.type	f2fs_submit_merged_ipu_write,@function
f2fs_submit_merged_ipu_write:           // @f2fs_submit_merged_ipu_write
// %bb.0:
	sub	sp, sp, #112            // =112
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	mov	x22, x2
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	mov	x20, x0
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x28, x27, [sp, #32]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #48]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	str	x1, [sp]                // 8-byte Folded Spill
	cbz	x1, .LBB13_2
// %bb.1:
	ldr	x21, [x1]
	b	.LBB13_3
.LBB13_2:
	mov	x21, xzr
.LBB13_3:
	mov	w27, wzr
	mov	x26, xzr
	mov	w10, #304
	str	x20, [sp, #8]           // 8-byte Folded Spill
.LBB13_4:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB13_7 Depth 2
                                        //     Child Loop BB13_15 Depth 2
                                        //       Child Loop BB13_20 Depth 3
                                        //     Child Loop BB13_12 Depth 2
                                        //     Child Loop BB13_27 Depth 2
                                        //     Child Loop BB13_35 Depth 2
                                        //       Child Loop BB13_40 Depth 3
                                        //     Child Loop BB13_31 Depth 2
	ldr	x8, [x20, #144]
	madd	x19, x26, x10, x8
	ldr	x9, [x19, #240]!
	cmp	x19, x9
	b.eq	.LBB13_50
// %bb.5:                               //   in Loop: Header=BB13_4 Depth=1
	madd	x8, x26, x10, x8
	add	x23, x8, #256           // =256
	mov	x0, x23
	bl	down_read
	ldr	x25, [x19]
	cmp	x19, x25
	b.eq	.LBB13_10
// %bb.6:                               //   in Loop: Header=BB13_4 Depth=1
	cbz	x21, .LBB13_11
.LBB13_7:                               //   Parent Loop BB13_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	x8, [x25, #-8]
	cmp	x21, x8
	b.eq	.LBB13_24
// %bb.8:                               //   in Loop: Header=BB13_7 Depth=2
	ldr	x25, [x25]
	cmp	x19, x25
	b.ne	.LBB13_7
.LBB13_9:                               //   in Loop: Header=BB13_4 Depth=1
	mov	x0, x23
	bl	up_read
	mov	w27, wzr
	b	.LBB13_49
.LBB13_10:                              //   in Loop: Header=BB13_4 Depth=1
	mov	x0, x23
	bl	up_read
	tbz	w27, #0, .LBB13_49
	b	.LBB13_25
.LBB13_11:                              //   in Loop: Header=BB13_4 Depth=1
	cbnz	x22, .LBB13_15
.LBB13_12:                              //   Parent Loop BB13_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	x8, [x25, #-8]
	cbnz	x8, .LBB13_24
// %bb.13:                              //   in Loop: Header=BB13_12 Depth=2
	ldr	x25, [x25]
	cmp	x19, x25
	b.ne	.LBB13_12
	b	.LBB13_9
.LBB13_14:                              //   in Loop: Header=BB13_15 Depth=2
	ldr	x25, [x25]
	cmp	x19, x25
	b.eq	.LBB13_9
.LBB13_15:                              //   Parent Loop BB13_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB13_20 Depth 3
	ldur	x27, [x25, #-8]
	cbz	x27, .LBB13_14
// %bb.16:                              //   in Loop: Header=BB13_15 Depth=2
	ldrh	w8, [x27, #138]
	cbz	w8, .LBB13_14
// %bb.17:                              //   in Loop: Header=BB13_15 Depth=2
	ldr	x20, [x27, #152]
	mov	w28, wzr
	b	.LBB13_20
.LBB13_18:                              //   in Loop: Header=BB13_20 Depth=3
	cmp	x24, x22
	b.eq	.LBB13_24
.LBB13_19:                              //   in Loop: Header=BB13_20 Depth=3
	ldrh	w8, [x27, #138]
	add	w28, w28, #1            // =1
	add	x20, x20, #16           // =16
	cmp	w28, w8
	b.hs	.LBB13_14
.LBB13_20:                              //   Parent Loop BB13_4 Depth=1
                                        //     Parent Loop BB13_15 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x24, [x20]
	ldr	x8, [x24, #24]
	cbnz	x8, .LBB13_22
// %bb.21:                              //   in Loop: Header=BB13_20 Depth=3
	ldr	x24, [x24, #40]
	cmn	x24, #1, lsl #12        // =4096
	b.hi	.LBB13_19
.LBB13_22:                              //   in Loop: Header=BB13_20 Depth=3
	mov	x0, x24
	bl	f2fs_is_compressed_page
	tbz	w0, #0, .LBB13_18
// %bb.23:                              //   in Loop: Header=BB13_20 Depth=3
	mov	x0, x24
	bl	f2fs_compress_control_page
	mov	x24, x0
	cmn	x0, #1, lsl #12         // =4096
	b.ls	.LBB13_18
	b	.LBB13_19
.LBB13_24:                              //   in Loop: Header=BB13_4 Depth=1
	mov	x0, x23
	bl	up_read
.LBB13_25:                              //   in Loop: Header=BB13_4 Depth=1
	mov	x0, x23
	bl	down_write
	ldr	x24, [x19]
	cmp	x19, x24
	b.eq	.LBB13_29
// %bb.26:                              //   in Loop: Header=BB13_4 Depth=1
	cbz	x21, .LBB13_30
.LBB13_27:                              //   Parent Loop BB13_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x25, x24
	ldr	x8, [x25, #-8]!
	cmp	x21, x8
	b.eq	.LBB13_45
// %bb.28:                              //   in Loop: Header=BB13_27 Depth=2
	ldr	x24, [x24]
	cmp	x19, x24
	b.ne	.LBB13_27
.LBB13_29:                              //   in Loop: Header=BB13_4 Depth=1
	mov	w27, wzr
	b	.LBB13_48
.LBB13_30:                              //   in Loop: Header=BB13_4 Depth=1
	cbnz	x22, .LBB13_35
.LBB13_31:                              //   Parent Loop BB13_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x25, x24
	ldr	x21, [x25, #-8]!
	cbnz	x21, .LBB13_45
// %bb.32:                              //   in Loop: Header=BB13_31 Depth=2
	ldr	x24, [x24]
	cmp	x19, x24
	b.ne	.LBB13_31
// %bb.33:                              //   in Loop: Header=BB13_4 Depth=1
	mov	x21, xzr
	mov	w27, wzr
	b	.LBB13_48
.LBB13_34:                              //   in Loop: Header=BB13_35 Depth=2
	ldr	x24, [x24]
	mov	x21, xzr
	mov	w27, wzr
	cmp	x19, x24
	b.eq	.LBB13_48
.LBB13_35:                              //   Parent Loop BB13_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB13_40 Depth 3
	mov	x25, x24
	ldr	x27, [x25, #-8]!
	cbz	x27, .LBB13_34
// %bb.36:                              //   in Loop: Header=BB13_35 Depth=2
	ldrh	w8, [x27, #138]
	cbz	w8, .LBB13_34
// %bb.37:                              //   in Loop: Header=BB13_35 Depth=2
	ldr	x20, [x27, #152]
	mov	w28, wzr
	b	.LBB13_40
.LBB13_38:                              //   in Loop: Header=BB13_40 Depth=3
	cmp	x21, x22
	b.eq	.LBB13_44
.LBB13_39:                              //   in Loop: Header=BB13_40 Depth=3
	ldrh	w8, [x27, #138]
	add	w28, w28, #1            // =1
	add	x20, x20, #16           // =16
	cmp	w28, w8
	b.hs	.LBB13_34
.LBB13_40:                              //   Parent Loop BB13_4 Depth=1
                                        //     Parent Loop BB13_35 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x21, [x20]
	ldr	x8, [x21, #24]
	cbnz	x8, .LBB13_42
// %bb.41:                              //   in Loop: Header=BB13_40 Depth=3
	ldr	x21, [x21, #40]
	cmn	x21, #1, lsl #12        // =4096
	b.hi	.LBB13_39
.LBB13_42:                              //   in Loop: Header=BB13_40 Depth=3
	mov	x0, x21
	bl	f2fs_is_compressed_page
	tbz	w0, #0, .LBB13_38
// %bb.43:                              //   in Loop: Header=BB13_40 Depth=3
	mov	x0, x21
	bl	f2fs_compress_control_page
	mov	x21, x0
	cmn	x0, #1, lsl #12         // =4096
	b.ls	.LBB13_38
	b	.LBB13_39
.LBB13_44:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	x21, [x25]
.LBB13_45:                              //   in Loop: Header=BB13_4 Depth=1
	mov	x0, x24
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB13_47
// %bb.46:                              //   in Loop: Header=BB13_4 Depth=1
	ldp	x9, x8, [x24]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB13_47:                              //   in Loop: Header=BB13_4 Depth=1
	mov	x9, #256
	mov	x1, x25
	movk	x9, #57005, lsl #48
	add	x8, x9, #256            // =256
	stp	x9, x8, [x24]
	adrp	x8, bio_entry_slab
	ldr	x0, [x8, :lo12:bio_entry_slab]
	bl	kmem_cache_free
	mov	w27, #1
.LBB13_48:                              //   in Loop: Header=BB13_4 Depth=1
	mov	x0, x23
	bl	up_write
.LBB13_49:                              //   in Loop: Header=BB13_4 Depth=1
	ldr	x20, [sp, #8]           // 8-byte Folded Reload
	mov	w10, #304
.LBB13_50:                              //   in Loop: Header=BB13_4 Depth=1
	cmp	x26, #1                 // =1
	b.hi	.LBB13_52
// %bb.51:                              //   in Loop: Header=BB13_4 Depth=1
	add	x26, x26, #1            // =1
	tbz	w27, #0, .LBB13_4
.LBB13_52:
	tbz	w27, #0, .LBB13_80
// %bb.53:
	//APP
	mrs x22, sp_el0
	//NO_APP
	ldrb	w8, [x22, #111]
	tbnz	w8, #1, .LBB13_55
// %bb.54:
	ldr	w8, [x22, #2512]
	add	w8, w8, #1              // =1
	str	w8, [x22, #2512]
.LBB13_55:
	ldrb	w8, [x21, #16]
	cbz	w8, .LBB13_62
// %bb.56:
	ldr	w8, [x20, #1504]
	ldr	w19, [x21, #88]
	cmp	w8, #1                  // =1
	b.ne	.LBB13_59
// %bb.57:
	ldr	x0, [x22, #2504]
	cbz	x0, .LBB13_59
// %bb.58:
	bl	blk_finish_plug
.LBB13_59:
	add	w8, w19, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB13_84
.LBB13_60:
	ldr	w8, [x20, #1432]
	mov	w9, #1
	lsl	w8, w9, w8
	cmp	w8, #2                  // =2
	b.lt	.LBB13_62
// %bb.61:
	ldr	w9, [x21, #48]
	sub	w8, w8, #1              // =1
	tst	w8, w9, lsr #12
	b.ne	.LBB13_105
.LBB13_62:
	ldrb	w8, [x21, #16]
	ldr	x20, [x20]
	cbz	w8, .LBB13_70
// %bb.63:
	adrp	x8, __tracepoint_f2fs_submit_write_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_write_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB13_79
// %bb.64:
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
	cbz	x21, .LBB13_79
// %bb.65:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB13_79
// %bb.66:
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x19, [x8, #32]
	cbz	x19, .LBB13_69
// %bb.67:
	ldr	x8, [x19], #24
.LBB13_68:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x19, #-16]
	mov	x1, x20
	mov	w2, wzr
	mov	x3, x21
	blr	x8
	ldr	x8, [x19], #24
	cbnz	x8, .LBB13_68
.LBB13_69:
	//APP
	//NO_APP
	b	.LBB13_77
.LBB13_70:
	adrp	x8, __tracepoint_f2fs_submit_read_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_read_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB13_79
// %bb.71:
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
	cbz	x21, .LBB13_79
// %bb.72:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB13_79
// %bb.73:
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x19, [x8, #32]
	cbz	x19, .LBB13_76
// %bb.74:
	ldr	x8, [x19], #24
.LBB13_75:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x19, #-16]
	mov	x1, x20
	mov	w2, wzr
	mov	x3, x21
	blr	x8
	ldr	x8, [x19], #24
	cbnz	x8, .LBB13_75
.LBB13_76:
	//APP
	//NO_APP
.LBB13_77:
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB13_79
// %bb.78:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB13_104
.LBB13_79:
	mov	x0, x21
	bl	submit_bio
.LBB13_80:
	ldr	x19, [sp]               // 8-byte Folded Reload
	cbz	x19, .LBB13_83
// %bb.81:
	ldr	x0, [x19]
	cbz	x0, .LBB13_83
// %bb.82:
	bl	bio_put
	str	xzr, [x19]
.LBB13_83:
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB13_84:
	ldr	w9, [x20, #3024]
	cbz	w9, .LBB13_92
// %bb.85:
	ldr	x8, [x20]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB13_91
// %bb.86:
	ldr	x11, [x20, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB13_88
.LBB13_87:                              //   in Loop: Header=BB13_88 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB13_91
.LBB13_88:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w19
	b.hi	.LBB13_87
// %bb.89:                              //   in Loop: Header=BB13_88 Depth=1
	ldr	w12, [x11]
	cmp	w12, w19
	b.lo	.LBB13_87
// %bb.90:
	ldur	x8, [x11, #-80]
.LBB13_91:
	cbz	x8, .LBB13_60
.LBB13_92:
	ldr	x8, [x20, #136]
	cbz	x8, .LBB13_94
// %bb.93:
	add	x9, x8, #80             // =80
	b	.LBB13_95
.LBB13_94:
	ldr	x9, [x20, #16]
	add	x9, x9, #72             // =72
.LBB13_95:
	ldr	x10, [x8, #8]
	ldr	w9, [x9]
	ldr	w11, [x20, #1184]
	ldr	w10, [x10]
	sub	w9, w19, w9
	lsr	w9, w9, w11
	sub	w9, w9, w10
	cmn	w9, #1                  // =1
	b.eq	.LBB13_60
// %bb.96:
	ldr	x8, [x8]
	mov	w10, #48
	ldr	x8, [x8, #136]
	umaddl	x19, w9, w10, x8
	cbz	x19, .LBB13_60
// %bb.97:
	ldr	w8, [x19]
	mov	w23, #1
	mov	w24, #455
	and	w9, w8, #0x3f
	cmp	w9, #8                  // =8
	lsl	w9, w23, w9
	and	w9, w9, w24
	ccmp	w9, #0, #4, ls
	b.eq	.LBB13_100
.LBB13_98:
	and	w8, w8, #0x3f
	ldr	x20, [sp, #8]           // 8-byte Folded Reload
	cmp	w8, #8                  // =8
	lsl	w8, w23, w8
	and	w8, w8, w24
	ccmp	w8, #0, #4, ls
	b.ne	.LBB13_60
// %bb.99:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 892; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB13_100:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB13_103
// %bb.101:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB13_103
// %bb.102:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #892
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB13_103:
	ldr	x20, [sp, #8]           // 8-byte Folded Reload
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	ldr	w8, [x19]
	b	.LBB13_98
.LBB13_104:
	bl	preempt_schedule_notrace
	b	.LBB13_79
.LBB13_105:
	ldr	x0, [x20, #216]
	mov	w1, #2048
	movk	w1, #96, lsl #16
	bl	mempool_alloc
	mov	x19, x0
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbnz	x19, .LBB13_110
// %bb.106:
	cbz	x0, .LBB13_109
// %bb.107:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB13_109
// %bb.108:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #913
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB13_109:
	ldr	x19, [sp, #8]           // 8-byte Folded Reload
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 913; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB13_110:
	cbz	x0, .LBB13_113
// %bb.111:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB13_113
// %bb.112:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #917
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB13_113:
	ldr	x19, [sp, #8]           // 8-byte Folded Reload
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 917; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end13:
	.size	f2fs_submit_merged_ipu_write, .Lfunc_end13-f2fs_submit_merged_ipu_write
                                        // -- End function
	.p2align	3               // -- Begin function __has_merged_page
	.type	__has_merged_page,@function
__has_merged_page:                      // @__has_merged_page
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	str	x25, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	cbz	x0, .LBB14_18
// %bb.1:
	mov	w20, w3
	mov	x21, x2
	mov	x19, x0
	mov	x22, x1
	cbnz	x1, .LBB14_5
// %bb.2:
	cbnz	x21, .LBB14_5
// %bb.3:
	cbnz	w20, .LBB14_5
.LBB14_4:
	mov	w0, #1
	b	.LBB14_18
.LBB14_5:
	ldrh	w8, [x19, #138]
	cbz	w8, .LBB14_17
// %bb.6:
	ldr	x24, [x19, #152]
	cbz	x22, .LBB14_19
// %bb.7:
	mov	w25, wzr
	b	.LBB14_9
.LBB14_8:                               //   in Loop: Header=BB14_9 Depth=1
	ldrh	w8, [x19, #138]
	add	w25, w25, #1            // =1
	add	x24, x24, #16           // =16
	cmp	w25, w8
	b.hs	.LBB14_17
.LBB14_9:                               // =>This Inner Loop Header: Depth=1
	ldr	x23, [x24]
	ldr	x8, [x23, #24]
	cbnz	x8, .LBB14_11
// %bb.10:                              //   in Loop: Header=BB14_9 Depth=1
	ldr	x23, [x23, #40]
	cmn	x23, #1, lsl #12        // =4096
	b.hi	.LBB14_8
.LBB14_11:                              //   in Loop: Header=BB14_9 Depth=1
	mov	x0, x23
	bl	f2fs_is_compressed_page
	tbz	w0, #0, .LBB14_13
// %bb.12:                              //   in Loop: Header=BB14_9 Depth=1
	mov	x0, x23
	bl	f2fs_compress_control_page
	mov	x23, x0
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB14_8
.LBB14_13:                              //   in Loop: Header=BB14_9 Depth=1
	ldr	x8, [x23, #24]
	cmp	x21, #0                 // =0
	mov	w0, #1
	ldr	x10, [x8]
	cset	w8, ne
	cmp	x23, x21
	cset	w9, eq
	cmp	x10, x22
	b.eq	.LBB14_18
// %bb.14:                              //   in Loop: Header=BB14_9 Depth=1
	and	w8, w8, w9
	tbnz	w8, #0, .LBB14_18
// %bb.15:                              //   in Loop: Header=BB14_9 Depth=1
	cbz	w20, .LBB14_8
// %bb.16:                              //   in Loop: Header=BB14_9 Depth=1
	lsl	x8, x23, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w8, [x8, #4076]
	cmp	w8, w20
	b.ne	.LBB14_8
	b	.LBB14_4
.LBB14_17:
	mov	w0, wzr
.LBB14_18:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB14_19:
	cbz	x21, .LBB14_29
// %bb.20:
	mov	w23, wzr
	b	.LBB14_22
.LBB14_21:                              //   in Loop: Header=BB14_22 Depth=1
	ldrh	w8, [x19, #138]
	mov	w0, wzr
	add	w23, w23, #1            // =1
	add	x24, x24, #16           // =16
	cmp	w23, w8
	b.hs	.LBB14_18
.LBB14_22:                              // =>This Inner Loop Header: Depth=1
	ldr	x22, [x24]
	ldr	x8, [x22, #24]
	cbnz	x8, .LBB14_24
// %bb.23:                              //   in Loop: Header=BB14_22 Depth=1
	ldr	x22, [x22, #40]
	cmn	x22, #1, lsl #12        // =4096
	b.hi	.LBB14_21
.LBB14_24:                              //   in Loop: Header=BB14_22 Depth=1
	mov	x0, x22
	bl	f2fs_is_compressed_page
	tbz	w0, #0, .LBB14_26
// %bb.25:                              //   in Loop: Header=BB14_22 Depth=1
	mov	x0, x22
	bl	f2fs_compress_control_page
	mov	x22, x0
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB14_21
.LBB14_26:                              //   in Loop: Header=BB14_22 Depth=1
	cmp	x22, x21
	b.eq	.LBB14_4
// %bb.27:                              //   in Loop: Header=BB14_22 Depth=1
	cbz	w20, .LBB14_21
// %bb.28:                              //   in Loop: Header=BB14_22 Depth=1
	lsl	x8, x22, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w8, [x8, #4076]
	cmp	w8, w20
	b.ne	.LBB14_21
	b	.LBB14_4
.LBB14_29:
	cbz	w20, .LBB14_37
// %bb.30:
	mov	w22, wzr
	b	.LBB14_33
.LBB14_31:                              //   in Loop: Header=BB14_33 Depth=1
	lsl	x8, x21, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w8, [x8, #4076]
	cmp	w8, w20
	b.eq	.LBB14_4
.LBB14_32:                              //   in Loop: Header=BB14_33 Depth=1
	ldrh	w8, [x19, #138]
	mov	w0, wzr
	add	w22, w22, #1            // =1
	add	x24, x24, #16           // =16
	cmp	w22, w8
	b.hs	.LBB14_18
.LBB14_33:                              // =>This Inner Loop Header: Depth=1
	ldr	x21, [x24]
	ldr	x8, [x21, #24]
	cbnz	x8, .LBB14_35
// %bb.34:                              //   in Loop: Header=BB14_33 Depth=1
	ldr	x21, [x21, #40]
	cmn	x21, #1, lsl #12        // =4096
	b.hi	.LBB14_32
.LBB14_35:                              //   in Loop: Header=BB14_33 Depth=1
	mov	x0, x21
	bl	f2fs_is_compressed_page
	tbz	w0, #0, .LBB14_31
// %bb.36:                              //   in Loop: Header=BB14_33 Depth=1
	mov	x0, x21
	bl	f2fs_compress_control_page
	mov	x21, x0
	cmn	x0, #1, lsl #12         // =4096
	b.ls	.LBB14_31
	b	.LBB14_32
.LBB14_37:
	mov	w21, wzr
	b	.LBB14_39
.LBB14_38:                              //   in Loop: Header=BB14_39 Depth=1
	ldrh	w8, [x19, #138]
	mov	w0, wzr
	add	w21, w21, #1            // =1
	add	x24, x24, #16           // =16
	cmp	w21, w8
	b.hs	.LBB14_18
.LBB14_39:                              // =>This Inner Loop Header: Depth=1
	ldr	x20, [x24]
	ldr	x8, [x20, #24]
	cbnz	x8, .LBB14_41
// %bb.40:                              //   in Loop: Header=BB14_39 Depth=1
	ldr	x20, [x20, #40]
	cmn	x20, #1, lsl #12        // =4096
	b.hi	.LBB14_38
.LBB14_41:                              //   in Loop: Header=BB14_39 Depth=1
	mov	x0, x20
	bl	f2fs_is_compressed_page
	tbz	w0, #0, .LBB14_38
// %bb.42:                              //   in Loop: Header=BB14_39 Depth=1
	mov	x0, x20
	bl	f2fs_compress_control_page
	b	.LBB14_38
.Lfunc_end14:
	.size	__has_merged_page, .Lfunc_end14-__has_merged_page
                                        // -- End function
	.globl	f2fs_merge_page_bio     // -- Begin function f2fs_merge_page_bio
	.p2align	3
	.type	f2fs_merge_page_bio,@function
f2fs_merge_page_bio:                    // @f2fs_merge_page_bio
// %bb.0:
	sub	sp, sp, #128            // =128
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	stp	x28, x27, [sp, #48]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #64]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #80]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #96]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #112]    // 16-byte Folded Spill
	mov	x19, x0
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #112]
	ldr	x20, [x0, #48]
	ldr	x8, [x8]
	str	x8, [sp, #16]
	cbnz	x20, .LBB15_2
// %bb.1:
	ldr	x20, [x19, #40]
.LBB15_2:
	ldr	w8, [x19, #12]
	mov	w9, #6
	ldr	x0, [x19]
	ldr	w1, [x19, #28]
	cmp	w8, #2                  // =2
	mov	w8, #9
	csel	w2, w9, w8, lo
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB15_120
// %bb.3:
	adrp	x8, __tracepoint_f2fs_submit_page_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_page_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB15_11
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
	tbz	w9, #0, .LBB15_11
// %bb.5:
	ldr	x9, [x20, #24]
	cbz	x9, .LBB15_11
// %bb.6:
	//APP
	mrs x21, sp_el0
	//NO_APP
	ldr	w9, [x21, #80]
	add	w9, w9, #1              // =1
	str	w9, [x21, #80]
	//APP
	//NO_APP
	ldr	x22, [x8, #32]
	cbz	x22, .LBB15_9
// %bb.7:
	ldr	x8, [x22], #24
.LBB15_8:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x22, #-16]
	mov	x1, x20
	mov	x2, x19
	blr	x8
	ldr	x8, [x22], #24
	cbnz	x8, .LBB15_8
.LBB15_9:
	//APP
	//NO_APP
	ldr	w8, [x21, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x21, #80]
	b.ne	.LBB15_11
// %bb.10:
	ldr	x8, [x21]
	tbnz	w8, #1, .LBB15_158
.LBB15_11:
	ldr	x8, [sp, #16]
	cbz	x8, .LBB15_123
.LBB15_12:
	ldr	x9, [x19, #120]
	ldr	x0, [x19]
	ldr	w10, [x9]
	ldr	x11, [x0, #1224]
	ldr	w9, [x19, #28]
	cbz	x11, .LBB15_14
// %bb.13:
	ldr	w12, [x8, #48]
	cmp	x11, x12
	cset	w11, ls
.LBB15_14:
	add	w10, w10, #1            // =1
	cmp	w10, w9
	b.ne	.LBB15_24
// %bb.15:
	tbnz	w11, #0, .LBB15_24
// %bb.16:
	ldr	x10, [x0]
	ldr	w11, [x0, #3024]
	ldr	x10, [x10, #248]
	cmp	w11, #2                 // =2
	b.lt	.LBB15_22
// %bb.17:
	ldr	x13, [x0, #3032]
	mov	x12, xzr
	add	x13, x13, #80           // =80
	b	.LBB15_19
.LBB15_18:                              //   in Loop: Header=BB15_19 Depth=1
	add	x12, x12, #1            // =1
	add	x13, x13, #192          // =192
	cmp	x12, x11
	b.eq	.LBB15_22
.LBB15_19:                              // =>This Inner Loop Header: Depth=1
	ldur	w14, [x13, #-4]
	cmp	w14, w9
	b.hi	.LBB15_18
// %bb.20:                              //   in Loop: Header=BB15_19 Depth=1
	ldr	w14, [x13]
	cmp	w14, w9
	b.lo	.LBB15_18
// %bb.21:
	ldur	x10, [x13, #-80]
.LBB15_22:
	ldr	x9, [x8, #8]
	ldr	x11, [x10, #128]
	cmp	x9, x11
	b.ne	.LBB15_24
// %bb.23:
	ldrb	w9, [x8, #27]
	ldrb	w10, [x10, #108]
	cmp	w9, w10
	b.eq	.LBB15_25
.LBB15_24:
	add	x1, sp, #16             // =16
	mov	x2, xzr
	bl	f2fs_submit_merged_ipu_write
	ldr	x8, [sp, #16]
.LBB15_25:
	cbz	x8, .LBB15_123
// %bb.26:
	ldr	x21, [x19]
	mov	w25, wzr
	mov	x22, xzr
	mov	w8, #-11
	//APP
	mrs x23, sp_el0
	//NO_APP
	str	w8, [sp, #12]           // 4-byte Folded Spill
.LBB15_27:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB15_29 Depth 2
                                        //     Child Loop BB15_39 Depth 2
                                        //     Child Loop BB15_54 Depth 2
                                        //     Child Loop BB15_104 Depth 2
                                        //     Child Loop BB15_86 Depth 2
                                        //     Child Loop BB15_92 Depth 2
	ldr	x8, [x21, #144]
	mov	w9, #304
	madd	x24, x22, x9, x8
	add	x28, x24, #256          // =256
	mov	x0, x28
	bl	down_write
	ldr	x27, [x24, #240]!
	cmp	x24, x27
	b.eq	.LBB15_98
// %bb.28:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x0, [sp, #16]
.LBB15_29:                              //   Parent Loop BB15_27 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x26, x27
	ldr	x8, [x26, #-8]!
	cmp	x8, x0
	b.eq	.LBB15_31
// %bb.30:                              //   in Loop: Header=BB15_29 Depth=2
	ldr	x27, [x27]
	cmp	x24, x27
	b.ne	.LBB15_29
	b	.LBB15_98
.LBB15_31:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x8, [x19, #120]
	ldr	x10, [x21, #1224]
	ldr	x9, [x8]
	ldr	w8, [x19, #28]
	cbz	x10, .LBB15_33
// %bb.32:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	w11, [x0, #48]
	cmp	x10, x11
	cset	w11, ls
	b	.LBB15_34
.LBB15_33:                              //   in Loop: Header=BB15_27 Depth=1
	mov	w11, wzr
.LBB15_34:                              //   in Loop: Header=BB15_27 Depth=1
	add	w12, w9, #1             // =1
	cmp	w12, w8
	b.ne	.LBB15_43
// %bb.35:                              //   in Loop: Header=BB15_27 Depth=1
	tbnz	w11, #0, .LBB15_43
// %bb.36:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x11, [x21]
	ldr	w12, [x21, #3024]
	ldr	x11, [x11, #248]
	cmp	w12, #2                 // =2
	b.lt	.LBB15_42
// %bb.37:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x14, [x21, #3032]
	mov	x13, xzr
	add	x14, x14, #80           // =80
	b	.LBB15_39
.LBB15_38:                              //   in Loop: Header=BB15_39 Depth=2
	add	x13, x13, #1            // =1
	add	x14, x14, #192          // =192
	cmp	x13, x12
	b.eq	.LBB15_42
.LBB15_39:                              //   Parent Loop BB15_27 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w15, [x14, #-4]
	cmp	w15, w8
	b.hi	.LBB15_38
// %bb.40:                              //   in Loop: Header=BB15_39 Depth=2
	ldr	w15, [x14]
	cmp	w15, w8
	b.lo	.LBB15_38
// %bb.41:                              //   in Loop: Header=BB15_27 Depth=1
	ldur	x11, [x14, #-80]
.LBB15_42:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x12, [x0, #8]
	ldr	x13, [x11, #128]
	cmp	x12, x13
	b.eq	.LBB15_68
.LBB15_43:                              //   in Loop: Header=BB15_27 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB15_46
// %bb.44:                              //   in Loop: Header=BB15_27 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_46
// %bb.45:                              //   in Loop: Header=BB15_27 Depth=1
	adrp	x24, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.add_ipu_page
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.add_ipu_page
	mov	w3, #1363
	ldr	x0, [x24, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_46:                              //   in Loop: Header=BB15_27 Depth=1
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldr	x9, [x19, #120]
	ldr	x0, [sp, #16]
	ldr	w8, [x19, #28]
	ldr	x10, [x21, #1224]
	ldr	x9, [x9]
.LBB15_47:                              //   in Loop: Header=BB15_27 Depth=1
	cbz	x10, .LBB15_49
// %bb.48:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	w11, [x0, #48]
	cmp	x10, x11
	cset	w10, ls
.LBB15_49:                              //   in Loop: Header=BB15_27 Depth=1
	add	w9, w9, #1              // =1
	cmp	w9, w8
	b.ne	.LBB15_160
// %bb.50:                              //   in Loop: Header=BB15_27 Depth=1
	tbnz	w10, #0, .LBB15_160
// %bb.51:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x9, [x21]
	ldr	w10, [x21, #3024]
	ldr	x9, [x9, #248]
	cmp	w10, #2                 // =2
	b.lt	.LBB15_57
// %bb.52:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x12, [x21, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB15_54
.LBB15_53:                              //   in Loop: Header=BB15_54 Depth=2
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB15_57
.LBB15_54:                              //   Parent Loop BB15_27 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w13, [x12, #-4]
	cmp	w13, w8
	b.hi	.LBB15_53
// %bb.55:                              //   in Loop: Header=BB15_54 Depth=2
	ldr	w13, [x12]
	cmp	w13, w8
	b.lo	.LBB15_53
// %bb.56:                              //   in Loop: Header=BB15_27 Depth=1
	ldur	x9, [x12, #-80]
.LBB15_57:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x8, [x0, #8]
	ldr	x10, [x9, #128]
	cmp	x8, x10
	b.ne	.LBB15_160
// %bb.58:                              //   in Loop: Header=BB15_27 Depth=1
	ldrb	w8, [x0, #27]
	ldrb	w9, [x9, #108]
	cmp	w8, w9
	b.ne	.LBB15_160
// %bb.59:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x8, [x19, #40]
	ldp	x9, x2, [x8, #24]
	ldr	x1, [x9]
	cbz	x19, .LBB15_64
// %bb.60:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x8, [x19, #48]
	cbz	x8, .LBB15_64
// %bb.61:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x8, [x0, #128]
	cbnz	x8, .LBB15_70
// %bb.62:                              //   in Loop: Header=BB15_27 Depth=1
	ldrb	w9, [x1, #13]
	ldrb	w8, [x0, #136]
	tbnz	w9, #6, .LBB15_69
// %bb.63:                              //   in Loop: Header=BB15_27 Depth=1
	cbnz	w8, .LBB15_70
	b	.LBB15_66
.LBB15_64:                              //   in Loop: Header=BB15_27 Depth=1
	bl	fscrypt_mergeable_bio
	tbz	w0, #0, .LBB15_70
// %bb.65:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x0, [sp, #16]
.LBB15_66:                              //   in Loop: Header=BB15_27 Depth=1
	mov	x1, x20
	mov	w2, #4096
	mov	w3, wzr
	bl	bio_add_page
	cmp	w0, #1, lsl #12         // =4096
	b.ne	.LBB15_70
// %bb.67:                              //   in Loop: Header=BB15_27 Depth=1
	str	wzr, [sp, #12]          // 4-byte Folded Spill
	b	.LBB15_97
.LBB15_68:                              //   in Loop: Header=BB15_27 Depth=1
	ldrb	w12, [x0, #27]
	ldrb	w11, [x11, #108]
	cmp	w12, w11
	b.eq	.LBB15_47
	b	.LBB15_43
.LBB15_69:                              //   in Loop: Header=BB15_27 Depth=1
	ldrh	w9, [x1]
	cmp	w8, #0                  // =0
	and	w8, w9, #0xf000
	cset	w9, eq
	cmp	w8, #8, lsl #12         // =32768
	cset	w8, eq
	cmp	w9, w8
	b.ne	.LBB15_66
.LBB15_70:                              //   in Loop: Header=BB15_27 Depth=1
	mov	x0, x27
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB15_72
// %bb.71:                              //   in Loop: Header=BB15_27 Depth=1
	ldp	x9, x8, [x27]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB15_72:                              //   in Loop: Header=BB15_27 Depth=1
	mov	x9, #256
	mov	x1, x26
	movk	x9, #57005, lsl #48
	add	x8, x9, #256            // =256
	stp	x9, x8, [x27]
	adrp	x8, bio_entry_slab
	ldr	x0, [x8, :lo12:bio_entry_slab]
	bl	kmem_cache_free
	ldrb	w8, [x23, #111]
	ldr	x26, [sp, #16]
	tbnz	w8, #1, .LBB15_74
// %bb.73:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	w8, [x23, #2512]
	add	w8, w8, #1              // =1
	str	w8, [x23, #2512]
.LBB15_74:                              //   in Loop: Header=BB15_27 Depth=1
	ldrb	w8, [x26, #16]
	mov	w27, #1
	cbz	w8, .LBB15_81
// %bb.75:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	w8, [x21, #1504]
	ldr	w25, [x26, #88]
	cmp	w8, #1                  // =1
	b.ne	.LBB15_78
// %bb.76:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x0, [x23, #2504]
	cbz	x0, .LBB15_78
// %bb.77:                              //   in Loop: Header=BB15_27 Depth=1
	bl	blk_finish_plug
.LBB15_78:                              //   in Loop: Header=BB15_27 Depth=1
	add	w8, w25, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB15_100
.LBB15_79:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	w8, [x21, #1432]
	lsl	w8, w27, w8
	cmp	w8, #2                  // =2
	b.lt	.LBB15_81
// %bb.80:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	w9, [x26, #48]
	sub	w8, w8, #1              // =1
	tst	w8, w9, lsr #12
	b.ne	.LBB15_161
.LBB15_81:                              //   in Loop: Header=BB15_27 Depth=1
	ldrb	w8, [x26, #16]
	mov	w11, #1
	ldr	x27, [x21]
	cbz	w8, .LBB15_88
// %bb.82:                              //   in Loop: Header=BB15_27 Depth=1
	adrp	x8, __tracepoint_f2fs_submit_write_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_write_bio
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB15_96
// %bb.83:                              //   in Loop: Header=BB15_27 Depth=1
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
	cbz	x26, .LBB15_96
// %bb.84:                              //   in Loop: Header=BB15_27 Depth=1
	lsl	x8, x11, x8
	and	x8, x8, x9
	cbz	x8, .LBB15_96
// %bb.85:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	w8, [x23, #80]
	add	w8, w8, #1              // =1
	str	w8, [x23, #80]
	adrp	x8, __tracepoint_f2fs_submit_write_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_write_bio
	//APP
	//NO_APP
	ldr	x24, [x8, #32]
	cbz	x24, .LBB15_87
.LBB15_86:                              //   Parent Loop BB15_27 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x8, x0, [x24]
	mov	x1, x27
	mov	w2, wzr
	mov	x3, x26
	blr	x8
	ldr	x8, [x24, #24]!
	cbnz	x8, .LBB15_86
.LBB15_87:                              //   in Loop: Header=BB15_27 Depth=1
	//APP
	//NO_APP
	b	.LBB15_94
.LBB15_88:                              //   in Loop: Header=BB15_27 Depth=1
	adrp	x8, __tracepoint_f2fs_submit_read_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_read_bio
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB15_96
// %bb.89:                              //   in Loop: Header=BB15_27 Depth=1
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
	cbz	x26, .LBB15_96
// %bb.90:                              //   in Loop: Header=BB15_27 Depth=1
	lsl	x8, x11, x8
	and	x8, x8, x9
	cbz	x8, .LBB15_96
// %bb.91:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	w8, [x23, #80]
	add	w8, w8, #1              // =1
	str	w8, [x23, #80]
	adrp	x8, __tracepoint_f2fs_submit_read_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_read_bio
	//APP
	//NO_APP
	ldr	x24, [x8, #32]
	cbz	x24, .LBB15_93
.LBB15_92:                              //   Parent Loop BB15_27 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x8, x0, [x24]
	mov	x1, x27
	mov	w2, wzr
	mov	x3, x26
	blr	x8
	ldr	x8, [x24, #24]!
	cbnz	x8, .LBB15_92
.LBB15_93:                              //   in Loop: Header=BB15_27 Depth=1
	//APP
	//NO_APP
.LBB15_94:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB15_96
// %bb.95:                              //   in Loop: Header=BB15_27 Depth=1
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB15_119
.LBB15_96:                              //   in Loop: Header=BB15_27 Depth=1
	mov	x0, x26
	bl	submit_bio
.LBB15_97:                              //   in Loop: Header=BB15_27 Depth=1
	mov	w25, #1
.LBB15_98:                              //   in Loop: Header=BB15_27 Depth=1
	mov	x0, x28
	bl	up_write
	cmp	x22, #1                 // =1
	b.hi	.LBB15_121
// %bb.99:                              //   in Loop: Header=BB15_27 Depth=1
	add	x22, x22, #1            // =1
	tbz	w25, #0, .LBB15_27
	b	.LBB15_121
.LBB15_100:                             //   in Loop: Header=BB15_27 Depth=1
	ldr	w9, [x21, #3024]
	cbz	w9, .LBB15_108
// %bb.101:                             //   in Loop: Header=BB15_27 Depth=1
	ldr	x8, [x21]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB15_107
// %bb.102:                             //   in Loop: Header=BB15_27 Depth=1
	ldr	x11, [x21, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB15_104
.LBB15_103:                             //   in Loop: Header=BB15_104 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB15_107
.LBB15_104:                             //   Parent Loop BB15_27 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w25
	b.hi	.LBB15_103
// %bb.105:                             //   in Loop: Header=BB15_104 Depth=2
	ldr	w12, [x11]
	cmp	w12, w25
	b.lo	.LBB15_103
// %bb.106:                             //   in Loop: Header=BB15_27 Depth=1
	ldur	x8, [x11, #-80]
.LBB15_107:                             //   in Loop: Header=BB15_27 Depth=1
	cbz	x8, .LBB15_79
.LBB15_108:                             //   in Loop: Header=BB15_27 Depth=1
	ldr	x8, [x21, #136]
	cbz	x8, .LBB15_110
// %bb.109:                             //   in Loop: Header=BB15_27 Depth=1
	add	x9, x8, #80             // =80
	b	.LBB15_111
.LBB15_110:                             //   in Loop: Header=BB15_27 Depth=1
	ldr	x9, [x21, #16]
	add	x9, x9, #72             // =72
.LBB15_111:                             //   in Loop: Header=BB15_27 Depth=1
	ldr	x10, [x8, #8]
	ldr	w9, [x9]
	ldr	w11, [x21, #1184]
	ldr	w10, [x10]
	sub	w9, w25, w9
	lsr	w9, w9, w11
	sub	w9, w9, w10
	cmn	w9, #1                  // =1
	b.eq	.LBB15_79
// %bb.112:                             //   in Loop: Header=BB15_27 Depth=1
	ldr	x8, [x8]
	mov	w10, #48
	ldr	x8, [x8, #136]
	umaddl	x25, w9, w10, x8
	cbz	x25, .LBB15_79
// %bb.113:                             //   in Loop: Header=BB15_27 Depth=1
	ldr	w8, [x25]
	mov	w10, #455
	and	w9, w8, #0x3f
	cmp	w9, #8                  // =8
	lsl	w9, w27, w9
	and	w9, w9, w10
	ccmp	w9, #0, #4, ls
	b.eq	.LBB15_115
.LBB15_114:                             //   in Loop: Header=BB15_27 Depth=1
	and	w8, w8, #0x3f
	cmp	w8, #8                  // =8
	lsl	w8, w27, w8
	and	w8, w8, w10
	ccmp	w8, #0, #4, ls
	b.ne	.LBB15_79
	b	.LBB15_170
.LBB15_115:                             //   in Loop: Header=BB15_27 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB15_118
// %bb.116:                             //   in Loop: Header=BB15_27 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_118
// %bb.117:                             //   in Loop: Header=BB15_27 Depth=1
	adrp	x24, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.__submit_bio
	mov	w3, #892
	ldr	x0, [x24, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_118:                             //   in Loop: Header=BB15_27 Depth=1
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	ldr	w8, [x25]
	mov	w10, #455
	b	.LBB15_114
.LBB15_119:                             //   in Loop: Header=BB15_27 Depth=1
	bl	preempt_schedule_notrace
	b	.LBB15_96
.LBB15_120:
	mov	w0, #-117
	b	.LBB15_155
.LBB15_121:
	ldr	w8, [sp, #12]           // 4-byte Folded Reload
	cbz	w8, .LBB15_140
// %bb.122:
	ldr	x0, [sp, #16]
	bl	bio_put
	str	xzr, [sp, #16]
.LBB15_123:
	mov	x0, x19
	mov	w1, #256
	bl	__bio_alloc
	ldr	w8, [x19, #12]
	mov	x21, x0
	str	x0, [sp, #16]
	cbnz	w8, .LBB15_128
// %bb.124:
	ldr	x8, [x19]
	mov	w10, #1
	ldr	w9, [x19, #16]
	ldr	w8, [x8, #2620]
	lsl	w9, w10, w9
	and	w9, w9, #0x7
	tst	w9, w8, lsr #3
	b.eq	.LBB15_126
// %bb.125:
	ldr	w10, [x19, #24]
	orr	w10, w10, #0x1000
	str	w10, [x19, #24]
.LBB15_126:
	tst	w9, w8
	b.eq	.LBB15_128
// %bb.127:
	ldr	w8, [x19, #24]
	orr	w8, w8, #0x20000
	str	w8, [x19, #24]
.LBB15_128:
	ldr	x8, [x19, #40]
	ldp	x9, x2, [x8, #24]
	ldr	x1, [x9]
	cbz	x19, .LBB15_133
// %bb.129:
	ldr	x8, [x19, #48]
	cbz	x8, .LBB15_133
// %bb.130:
	ldrb	w8, [x1, #13]
	tbz	w8, #6, .LBB15_134
// %bb.131:
	ldrh	w8, [x1]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB15_134
// %bb.132:
	mov	w8, #1
	strb	w8, [x21, #136]
	b	.LBB15_134
.LBB15_133:
	mov	x0, x21
	mov	w3, #6291456
	bl	fscrypt_set_bio_crypt_ctx
	ldr	x21, [sp, #16]
.LBB15_134:
	ldp	w8, w9, [x19, #20]
	mov	w25, #64
	movk	w25, #96, lsl #16
	mov	w1, w25
	orr	w8, w9, w8
	str	w8, [x21, #16]
	adrp	x8, bio_entry_slab
	ldr	x22, [x19]
	ldr	w26, [x19, #16]
	ldr	x24, [x8, :lo12:bio_entry_slab]
	ldr	x27, [x22, #144]
	mov	x0, x24
	bl	kmem_cache_alloc
	mov	x23, x0
	cbnz	x0, .LBB15_136
// %bb.135:
	add	w1, w25, #2048          // =2048
	mov	x0, x24
	bl	kmem_cache_alloc
	mov	x23, x0
.LBB15_136:
	str	x21, [x23]
	mov	x0, x21
	ldrh	w8, [x21, #20]
	mov	x1, x20
	mov	w2, #4096
	mov	w3, wzr
	add	x9, x21, #144           // =144
	orr	w8, w8, #0x200
	strh	w8, [x21, #20]
	//APP
	dmb ish
	//NO_APP
	//APP
	// atomic_add
	prfm	pstl1strm, [x9]
1:	ldxr	w8, [x9]
	add	w8, w8, 1
	stxr	w10, w8, [x9]
	cbnz	w10, 1b
	//NO_APP
	bl	bio_add_page
	cmp	w0, #1, lsl #12         // =4096
	b.ne	.LBB15_166
// %bb.137:
	mov	w8, #304
	madd	x26, x26, x8, x27
	add	x21, x26, #256          // =256
	mov	x0, x21
	bl	down_write
	ldr	x22, [x26, #248]!
	add	x24, x23, #8            // =8
	mov	x1, x22
	mov	x0, x24
	sub	x25, x26, #8            // =8
	mov	x2, x25
	bl	__list_add_valid
	tbz	w0, #0, .LBB15_139
// %bb.138:
	str	x24, [x26]
	stp	x25, x22, [x23, #8]
	str	x24, [x22]
.LBB15_139:
	mov	x0, x21
	bl	up_write
.LBB15_140:
	ldr	x0, [x19, #104]
	cbz	x0, .LBB15_142
// %bb.141:
	mov	x1, x20
	mov	w2, #4096
	bl	wbc_account_io
.LBB15_142:
	ldr	x8, [x20, #24]
	ldr	x21, [x19]
	cbz	x8, .LBB15_153
// %bb.143:
	ldr	x22, [x8]
	ldr	x8, [x22, #40]
	ldr	x9, [x8, #1104]
	ldr	x8, [x22, #64]
	ldr	w10, [x9, #1180]
	cmp	x8, x10
	b.eq	.LBB15_146
// %bb.144:
	ldr	w9, [x9, #1176]
	cmp	x8, x9
	b.eq	.LBB15_146
// %bb.145:
	ldrh	w8, [x22]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.ne	.LBB15_147
.LBB15_146:
	mov	w8, #7
	b	.LBB15_154
.LBB15_147:
	mov	x0, x20
	bl	f2fs_is_compressed_page
	tbnz	w0, #0, .LBB15_153
// %bb.148:
	ldrh	w8, [x22]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB15_151
// %bb.149:
	ldr	x8, [x22, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB15_146
// %bb.150:
	ldrb	w8, [x22, #12]
	tbnz	w8, #5, .LBB15_146
.LBB15_151:
	ldr	x8, [x20]
	tbz	w8, #13, .LBB15_153
// %bb.152:
	ldr	x8, [x20, #40]
	tbnz	w8, #0, .LBB15_157
.LBB15_153:
	mov	w8, #8
.LBB15_154:
	add	x8, x21, x8, lsl #2
	mov	w0, wzr
	add	x8, x8, #1272           // =1272
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	w8, [x19, #28]
	ldr	x9, [x19, #120]
	str	x8, [x9]
	ldr	x8, [sp, #16]
	ldr	x9, [x19, #112]
	str	x8, [x9]
.LBB15_155:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB15_159
// %bb.156:
	ldp	x20, x19, [sp, #112]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #128            // =128
	ret
.LBB15_157:
	ldr	x8, [x20, #40]
	tst	x8, #0x8
	mov	w8, #7
	cinc	x8, x8, eq
	b	.LBB15_154
.LBB15_158:
	bl	preempt_schedule_notrace
	ldr	x8, [sp, #16]
	cbnz	x8, .LBB15_12
	b	.LBB15_123
.LBB15_159:
	bl	__stack_chk_fail
.LBB15_160:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 1363; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB15_161:
	mov	w8, #64
	ldr	x0, [x21, #216]
	movk	w8, #96, lsl #16
	add	w1, w8, #1984           // =1984
	bl	mempool_alloc
	mov	x19, x0
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbnz	x19, .LBB15_171
// %bb.162:
	cbz	x0, .LBB15_165
// %bb.163:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_165
// %bb.164:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #913
	add	x2, x2, :lo12:.L__func__.__submit_bio
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_165:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 913; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB15_166:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB15_169
// %bb.167:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_169
// %bb.168:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.add_bio_entry
	add	x1, x1, :lo12:.L.str
	mov	w3, #1328
	add	x2, x2, :lo12:.L__func__.add_bio_entry
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_169:
	mov	x0, x22
	bl	f2fs_print_raw_sb_info
	mov	x0, x22
	bl	f2fs_print_ckpt_info
	mov	x0, x22
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 1328; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB15_170:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 892; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB15_171:
	cbz	x0, .LBB15_174
// %bb.172:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB15_174
// %bb.173:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #917
	add	x2, x2, :lo12:.L__func__.__submit_bio
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB15_174:
	mov	x0, x21
	bl	f2fs_print_raw_sb_info
	mov	x0, x21
	bl	f2fs_print_ckpt_info
	mov	x0, x21
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 917; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end15:
	.size	f2fs_merge_page_bio, .Lfunc_end15-f2fs_merge_page_bio
                                        // -- End function
	.globl	f2fs_submit_page_write  // -- Begin function f2fs_submit_page_write
	.p2align	3
	.type	f2fs_submit_page_write,@function
f2fs_submit_page_write:                 // @f2fs_submit_page_write
// %bb.0:
	sub	sp, sp, #176            // =176
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	stp	x28, x27, [sp, #96]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #112]    // 16-byte Folded Spill
	mov	w9, #2
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #128]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #144]    // 16-byte Folded Spill
	mov	x22, x0
	stp	x20, x19, [sp, #160]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldp	w8, w20, [x0, #12]
	ldr	x19, [x0]
	ldr	w10, [x0, #20]
	cmp	w8, #2                  // =2
	csel	w8, w8, w9, lo
	ldr	x9, [x19]
	add	x8, x19, w8, uxtw #3
	ldr	x23, [x9, #248]
	ldr	x21, [x8, #144]
	cbz	w10, .LBB16_122
.LBB16_1:
	mov	w8, #304
	mov	w9, #304
	madd	x26, x20, x8, x21
	madd	x21, x20, x9, x21
	add	x0, x26, #168           // =168
	str	x0, [sp, #8]            // 8-byte Folded Spill
	bl	down_write
	add	x9, x26, #224           // =224
	add	x8, x26, #216           // =216
	add	x24, x26, #8            // =8
	add	x25, x26, #24           // =24
	mov	w28, #-1
	str	x9, [sp, #24]           // 8-byte Folded Spill
	add	x9, x26, #16            // =16
	stur	x8, [x29, #-32]         // 8-byte Folded Spill
	ldrb	w8, [x22, #88]
	stur	x9, [x29, #-24]         // 8-byte Folded Spill
	add	x9, x26, #44            // =44
	cmp	w8, #0                  // =0
	str	x9, [sp, #16]           // 8-byte Folded Spill
	add	x9, x26, #48            // =48
	cset	w8, eq
	mov	w26, #144
	str	x9, [sp]                // 8-byte Folded Spill
	//APP
	mrs x9, sp_el0
	//NO_APP
	stp	x9, x19, [sp, #32]      // 16-byte Folded Spill
	b	.LBB16_5
.LBB16_2:                               //   in Loop: Header=BB16_5 Depth=1
	mov	w8, #8
.LBB16_3:                               //   in Loop: Header=BB16_5 Depth=1
	add	x8, x19, x8, lsl #2
	add	x8, x8, #1272           // =1272
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	strb	w20, [x22, #90]
.LBB16_4:                               //   in Loop: Header=BB16_5 Depth=1
	ldrb	w9, [x22, #88]
	mov	w8, wzr
	cbz	w9, .LBB16_117
.LBB16_5:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB16_49 Depth 2
                                        //     Child Loop BB16_33 Depth 2
                                        //     Child Loop BB16_65 Depth 2
                                        //     Child Loop BB16_82 Depth 2
                                        //     Child Loop BB16_97 Depth 2
	tbnz	w8, #0, .LBB16_10
// %bb.6:                               //   in Loop: Header=BB16_5 Depth=1
	ldur	x0, [x29, #-32]         // 8-byte Folded Reload
	bl	_raw_spin_lock
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	ldr	x27, [x8]
	cmp	x8, x27
	b.eq	.LBB16_116
// %bb.7:                               //   in Loop: Header=BB16_5 Depth=1
	mov	x0, x27
	sub	x22, x27, #64           // =64
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB16_9
// %bb.8:                               //   in Loop: Header=BB16_5 Depth=1
	ldp	x9, x8, [x27]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB16_9:                               //   in Loop: Header=BB16_5 Depth=1
	mov	x9, #256
	movk	x9, #57005, lsl #48
	add	x8, x9, #256            // =256
	stp	x9, x8, [x27]
	ldur	x0, [x29, #-32]         // 8-byte Folded Reload
	bl	_raw_spin_unlock
.LBB16_10:                              //   in Loop: Header=BB16_5 Depth=1
	mov	x19, x23
	mov	x23, x26
	mov	w26, w28
	ldr	w28, [x22, #32]
	ldr	x27, [x22]
	add	w8, w28, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB16_45
.LBB16_11:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	w8, [x22, #12]
	mov	w9, #7
	ldr	w28, [x22, #28]
	mov	x0, x27
	cmp	w8, #2                  // =2
	mov	w8, #9
	csel	w20, w9, w8, lo
	mov	w1, w28
	mov	w2, w20
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB16_145
// %bb.12:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x27, [x22, #48]
	cbnz	x27, .LBB16_14
// %bb.13:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x22, #56]
	ldr	x9, [x22, #40]
	cmp	x8, #0                  // =0
	csel	x27, x9, x8, eq
.LBB16_14:                              //   in Loop: Header=BB16_5 Depth=1
	mov	w20, #1
	mov	w28, w26
	strb	w20, [x22, #80]
	ldr	x8, [x27, #24]
	cbz	x8, .LBB16_20
// %bb.15:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x20, [x8]
	mov	x26, x23
	mov	x23, x19
	ldr	x19, [sp, #40]          // 8-byte Folded Reload
	ldr	x8, [x20, #40]
	ldr	x9, [x8, #1104]
	ldr	x8, [x20, #64]
	ldr	w10, [x9, #1180]
	cmp	x8, x10
	b.eq	.LBB16_18
// %bb.16:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	w9, [x9, #1176]
	cmp	x8, x9
	b.eq	.LBB16_18
// %bb.17:                              //   in Loop: Header=BB16_5 Depth=1
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.ne	.LBB16_54
.LBB16_18:                              //   in Loop: Header=BB16_5 Depth=1
	mov	w8, #7
.LBB16_19:                              //   in Loop: Header=BB16_5 Depth=1
	mov	w20, #1
	b	.LBB16_21
.LBB16_20:                              //   in Loop: Header=BB16_5 Depth=1
	mov	x26, x23
	mov	x23, x19
	ldr	x19, [sp, #40]          // 8-byte Folded Reload
	mov	w8, #8
.LBB16_21:                              //   in Loop: Header=BB16_5 Depth=1
	add	x8, x19, x8, lsl #2
	add	x8, x8, #1272           // =1272
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x0, [x24]
	cbz	x0, .LBB16_64
// %bb.22:                              //   in Loop: Header=BB16_5 Depth=1
	ldur	x8, [x29, #-24]         // 8-byte Folded Reload
	ldr	w10, [x19, #1432]
	ldr	w9, [x8]
	ldr	w8, [x22, #28]
	lsl	w10, w20, w10
	cmp	w10, #2                 // =2
	b.lt	.LBB16_26
// %bb.23:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	w11, [x22, #12]
	cmp	w11, #1                 // =1
	b.hi	.LBB16_26
// %bb.24:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	w11, [x0, #48]
	sub	w12, w10, #1            // =1
	tst	w12, w11, lsr #12
	b.ne	.LBB16_26
// %bb.25:                              //   in Loop: Header=BB16_5 Depth=1
	ldrh	w11, [x0, #140]
	ldrh	w12, [x0, #138]
	sub	w11, w11, w12
	cmp	w11, w10
	b.lo	.LBB16_63
.LBB16_26:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x10, [x19, #1224]
	cbz	x10, .LBB16_28
// %bb.27:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	w11, [x0, #48]
	cmp	x10, x11
	cset	w10, ls
.LBB16_28:                              //   in Loop: Header=BB16_5 Depth=1
	add	w9, w9, #1              // =1
	cmp	w9, w8
	b.ne	.LBB16_63
// %bb.29:                              //   in Loop: Header=BB16_5 Depth=1
	tbnz	w10, #0, .LBB16_63
// %bb.30:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x9, [x19]
	ldr	w10, [x19, #3024]
	ldr	x9, [x9, #248]
	cmp	w10, #2                 // =2
	b.lt	.LBB16_36
// %bb.31:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x12, [x19, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB16_33
.LBB16_32:                              //   in Loop: Header=BB16_33 Depth=2
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB16_36
.LBB16_33:                              //   Parent Loop BB16_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w13, [x12, #-4]
	cmp	w13, w8
	b.hi	.LBB16_32
// %bb.34:                              //   in Loop: Header=BB16_33 Depth=2
	ldr	w13, [x12]
	cmp	w13, w8
	b.lo	.LBB16_32
// %bb.35:                              //   in Loop: Header=BB16_5 Depth=1
	ldur	x9, [x12, #-80]
.LBB16_36:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x0, #8]
	ldr	x10, [x9, #128]
	cmp	x8, x10
	b.ne	.LBB16_63
// %bb.37:                              //   in Loop: Header=BB16_5 Depth=1
	ldrb	w8, [x0, #27]
	ldrb	w9, [x9, #108]
	cmp	w8, w9
	b.ne	.LBB16_63
// %bb.38:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [sp, #16]           // 8-byte Folded Reload
	ldr	w9, [x22, #20]
	ldr	w8, [x8]
	cmp	w8, w9
	b.ne	.LBB16_63
// %bb.39:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [sp]                // 8-byte Folded Reload
	ldr	w9, [x22, #24]
	ldr	w8, [x8]
	cmp	w8, w9
	b.ne	.LBB16_63
// %bb.40:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x22, #40]
	ldp	x9, x2, [x8, #24]
	ldr	x1, [x9]
	cbz	x22, .LBB16_62
// %bb.41:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x22, #48]
	cbz	x8, .LBB16_62
// %bb.42:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x0, #128]
	cbnz	x8, .LBB16_63
// %bb.43:                              //   in Loop: Header=BB16_5 Depth=1
	ldrb	w9, [x1, #13]
	ldrb	w8, [x0, #136]
	tbnz	w9, #6, .LBB16_115
// %bb.44:                              //   in Loop: Header=BB16_5 Depth=1
	cbnz	w8, .LBB16_63
	b	.LBB16_65
.LBB16_45:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	w9, [x27, #3024]
	cbz	w9, .LBB16_53
// %bb.46:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x27]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB16_52
// %bb.47:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x11, [x27, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB16_49
.LBB16_48:                              //   in Loop: Header=BB16_49 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB16_52
.LBB16_49:                              //   Parent Loop BB16_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w28
	b.hi	.LBB16_48
// %bb.50:                              //   in Loop: Header=BB16_49 Depth=2
	ldr	w12, [x11]
	cmp	w12, w28
	b.lo	.LBB16_48
// %bb.51:                              //   in Loop: Header=BB16_5 Depth=1
	ldur	x8, [x11, #-80]
.LBB16_52:                              //   in Loop: Header=BB16_5 Depth=1
	cbz	x8, .LBB16_11
.LBB16_53:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	w8, [x22, #12]
	mov	w9, #6
	mov	x0, x27
	mov	w1, w28
	cmp	w8, #2                  // =2
	mov	w8, #9
	csel	w20, w9, w8, lo
	mov	w2, w20
	bl	f2fs_is_valid_blkaddr
	tbnz	w0, #0, .LBB16_11
	b	.LBB16_149
.LBB16_54:                              //   in Loop: Header=BB16_5 Depth=1
	mov	x0, x27
	bl	f2fs_is_compressed_page
	tbnz	w0, #0, .LBB16_61
// %bb.55:                              //   in Loop: Header=BB16_5 Depth=1
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB16_58
// %bb.56:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x20, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB16_18
// %bb.57:                              //   in Loop: Header=BB16_5 Depth=1
	ldrb	w8, [x20, #12]
	tbnz	w8, #5, .LBB16_18
.LBB16_58:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x27]
	tbz	w8, #13, .LBB16_61
// %bb.59:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x27, #40]
	tbz	w8, #0, .LBB16_61
// %bb.60:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x27, #40]
	tbnz	w8, #3, .LBB16_18
.LBB16_61:                              //   in Loop: Header=BB16_5 Depth=1
	mov	w8, #8
	b	.LBB16_19
.LBB16_62:                              //   in Loop: Header=BB16_5 Depth=1
	bl	fscrypt_mergeable_bio
	tbnz	w0, #0, .LBB16_64
.LBB16_63:                              //   in Loop: Header=BB16_5 Depth=1
	mov	x0, x21
	bl	__submit_merged_bio
.LBB16_64:                              //   in Loop: Header=BB16_5 Depth=1
	cbz	x22, .LBB16_82
.LBB16_65:                              //   Parent Loop BB16_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x0, [x24]
	cbnz	x0, .LBB16_77
// %bb.66:                              //   in Loop: Header=BB16_65 Depth=2
	ldr	w8, [x19, #1432]
	sturb	wzr, [x29, #-12]
	lsl	w9, w20, w8
	cmp	w9, #2                  // =2
	b.lt	.LBB16_69
// %bb.67:                              //   in Loop: Header=BB16_65 Depth=2
	ldr	w9, [x22, #12]
	cmp	w9, #1                  // =1
	b.hi	.LBB16_69
// %bb.68:                              //   in Loop: Header=BB16_65 Depth=2
	ldr	w9, [x22, #28]
	lsl	w8, w28, w8
	bics	wzr, w9, w8
	b.ne	.LBB16_101
.LBB16_69:                              //   in Loop: Header=BB16_65 Depth=2
	ldp	w8, w9, [x22, #20]
	sub	x3, x29, #12            // =12
	mov	x0, x23
	mov	w2, #256
	orr	w1, w9, w8
	bl	wbt_max_bio_blocks
	mov	w1, w0
	mov	x0, x22
	bl	__bio_alloc
	str	x0, [x24]
	ldp	x8, x9, [x22, #40]
	ldr	x10, [x8, #24]
	ldr	x1, [x10]
	cbz	x9, .LBB16_73
// %bb.70:                              //   in Loop: Header=BB16_65 Depth=2
	ldrb	w8, [x1, #13]
	tbz	w8, #6, .LBB16_74
// %bb.71:                              //   in Loop: Header=BB16_65 Depth=2
	ldrh	w8, [x1]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB16_74
// %bb.72:                              //   in Loop: Header=BB16_65 Depth=2
	strb	w20, [x0, #136]
	b	.LBB16_74
.LBB16_73:                              //   in Loop: Header=BB16_65 Depth=2
	ldr	x2, [x8, #32]
	mov	w3, #6291456
	bl	fscrypt_set_bio_crypt_ctx
.LBB16_74:                              //   in Loop: Header=BB16_65 Depth=2
	ldurb	w8, [x29, #-12]
	cbz	w8, .LBB16_76
// %bb.75:                              //   in Loop: Header=BB16_65 Depth=2
	ldr	x8, [x24]
	ldr	w9, [x8, #16]
	orr	w9, w9, #0x4000
	str	w9, [x8, #16]
.LBB16_76:                              //   in Loop: Header=BB16_65 Depth=2
	mov	x0, x25
	mov	x1, x22
	mov	x2, x26
	bl	memcpy
	ldr	x0, [x24]
.LBB16_77:                              //   in Loop: Header=BB16_65 Depth=2
	mov	x1, x27
	mov	w2, #4096
	mov	w3, wzr
	bl	bio_add_page
	cmp	w0, #4095               // =4095
	b.hi	.LBB16_88
// %bb.78:                              //   in Loop: Header=BB16_65 Depth=2
	mov	x0, x21
	bl	__submit_merged_bio
	b	.LBB16_65
.LBB16_79:                              //   in Loop: Header=BB16_82 Depth=2
	mov	x0, x25
	mov	x1, x22
	mov	x2, x26
	bl	memcpy
	ldr	x0, [x24]
.LBB16_80:                              //   in Loop: Header=BB16_82 Depth=2
	mov	x1, x27
	mov	w2, #4096
	mov	w3, wzr
	bl	bio_add_page
	cmp	w0, #4095               // =4095
	b.hi	.LBB16_88
// %bb.81:                              //   in Loop: Header=BB16_82 Depth=2
	mov	x0, x21
	bl	__submit_merged_bio
.LBB16_82:                              //   Parent Loop BB16_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x0, [x24]
	cbnz	x0, .LBB16_80
// %bb.83:                              //   in Loop: Header=BB16_82 Depth=2
	ldr	w8, [x19, #1432]
	sturb	wzr, [x29, #-12]
	lsl	w9, w20, w8
	cmp	w9, #2                  // =2
	b.lt	.LBB16_86
// %bb.84:                              //   in Loop: Header=BB16_82 Depth=2
	ldr	w9, [x22, #12]
	cmp	w9, #1                  // =1
	b.hi	.LBB16_86
// %bb.85:                              //   in Loop: Header=BB16_82 Depth=2
	ldr	w9, [x22, #28]
	lsl	w8, w28, w8
	bics	wzr, w9, w8
	b.ne	.LBB16_101
.LBB16_86:                              //   in Loop: Header=BB16_82 Depth=2
	ldp	w8, w9, [x22, #20]
	sub	x3, x29, #12            // =12
	mov	x0, x23
	mov	w2, #256
	orr	w1, w9, w8
	bl	wbt_max_bio_blocks
	mov	w1, w0
	mov	x0, xzr
	bl	__bio_alloc
	str	x0, [x24]
	mov	w3, #6291456
	ldr	x8, [x22, #40]
	ldp	x9, x2, [x8, #24]
	ldr	x1, [x9]
	bl	fscrypt_set_bio_crypt_ctx
	ldurb	w8, [x29, #-12]
	cbz	w8, .LBB16_79
// %bb.87:                              //   in Loop: Header=BB16_82 Depth=2
	ldr	x8, [x24]
	ldr	w9, [x8, #16]
	orr	w9, w9, #0x4000
	str	w9, [x8, #16]
	b	.LBB16_79
.LBB16_88:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x0, [x24]
	ldrb	w8, [x0, #17]
	tbz	w8, #6, .LBB16_91
// %bb.89:                              //   in Loop: Header=BB16_5 Depth=1
	bl	wbt_need_kick_bio
	tbz	w0, #0, .LBB16_91
// %bb.90:                              //   in Loop: Header=BB16_5 Depth=1
	mov	x0, x21
	bl	__submit_merged_bio
.LBB16_91:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x0, [x22, #104]
	cbz	x0, .LBB16_93
// %bb.92:                              //   in Loop: Header=BB16_5 Depth=1
	mov	x1, x27
	mov	w2, #4096
	bl	wbc_account_io
.LBB16_93:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	w8, [x22, #28]
	ldur	x9, [x29, #-24]         // 8-byte Folded Reload
	str	x8, [x9]
	adrp	x8, __tracepoint_f2fs_submit_page_write
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_page_write
	ldr	x27, [x22, #40]
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB16_4
// %bb.94:                              //   in Loop: Header=BB16_5 Depth=1
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
	tbz	w8, #0, .LBB16_4
// %bb.95:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x27, #24]
	cbz	x8, .LBB16_4
// %bb.96:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x9, [sp, #32]           // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	add	w8, w8, #1              // =1
	str	w8, [x9, #80]
	adrp	x8, __tracepoint_f2fs_submit_page_write
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_page_write
	//APP
	//NO_APP
	ldr	x20, [x8, #32]
	cbz	x20, .LBB16_98
.LBB16_97:                              //   Parent Loop BB16_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x8, x0, [x20]
	mov	x1, x27
	mov	x2, x22
	blr	x8
	ldr	x8, [x20, #24]!
	cbnz	x8, .LBB16_97
.LBB16_98:                              //   in Loop: Header=BB16_5 Depth=1
	//APP
	//NO_APP
	ldr	x9, [sp, #32]           // 8-byte Folded Reload
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	b.ne	.LBB16_4
// %bb.99:                              //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [sp, #32]           // 8-byte Folded Reload
	ldr	x8, [x8]
	tbz	w8, #1, .LBB16_4
// %bb.100:                             //   in Loop: Header=BB16_5 Depth=1
	bl	preempt_schedule_notrace
	b	.LBB16_4
.LBB16_101:                             //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x27, #24]
	cbz	x8, .LBB16_2
// %bb.102:                             //   in Loop: Header=BB16_5 Depth=1
	ldr	x20, [x8]
	ldr	x8, [x20, #40]
	ldr	x9, [x8, #1104]
	ldr	x8, [x20, #64]
	ldr	w10, [x9, #1180]
	cmp	x8, x10
	b.eq	.LBB16_105
// %bb.103:                             //   in Loop: Header=BB16_5 Depth=1
	ldr	w9, [x9, #1176]
	cmp	x8, x9
	b.eq	.LBB16_105
// %bb.104:                             //   in Loop: Header=BB16_5 Depth=1
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.ne	.LBB16_107
.LBB16_105:                             //   in Loop: Header=BB16_5 Depth=1
	mov	w8, #7
.LBB16_106:                             //   in Loop: Header=BB16_5 Depth=1
	mov	w20, #1
	b	.LBB16_3
.LBB16_107:                             //   in Loop: Header=BB16_5 Depth=1
	mov	x0, x27
	bl	f2fs_is_compressed_page
	tbnz	w0, #0, .LBB16_114
// %bb.108:                             //   in Loop: Header=BB16_5 Depth=1
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB16_111
// %bb.109:                             //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x20, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB16_105
// %bb.110:                             //   in Loop: Header=BB16_5 Depth=1
	ldrb	w8, [x20, #12]
	tbnz	w8, #5, .LBB16_105
.LBB16_111:                             //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x27]
	tbz	w8, #13, .LBB16_114
// %bb.112:                             //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x27, #40]
	tbz	w8, #0, .LBB16_114
// %bb.113:                             //   in Loop: Header=BB16_5 Depth=1
	ldr	x8, [x27, #40]
	tbnz	w8, #3, .LBB16_105
.LBB16_114:                             //   in Loop: Header=BB16_5 Depth=1
	mov	w8, #8
	b	.LBB16_106
.LBB16_115:                             //   in Loop: Header=BB16_5 Depth=1
	ldrh	w9, [x1]
	cmp	w8, #0                  // =0
	and	w8, w9, #0xf000
	cset	w9, eq
	cmp	w8, #8, lsl #12         // =32768
	cset	w8, eq
	eor	w8, w9, w8
	tbnz	w8, #0, .LBB16_65
	b	.LBB16_63
.LBB16_116:
	ldur	x0, [x29, #-32]         // 8-byte Folded Reload
	bl	_raw_spin_unlock
.LBB16_117:
	ldr	x8, [x19, #80]
	tbnz	w8, #6, .LBB16_136
// %bb.118:
	ldr	x8, [x19, #80]
	tbz	w8, #8, .LBB16_137
// %bb.119:
	ldr	w22, [x19, #1192]
	ldr	w27, [x19, #1188]
	ldrsw	x24, [x19, #1284]
	ldr	w23, [x19, #1184]
	ldrsw	x25, [x19, #1272]
	ldrsw	x26, [x19, #1296]
	ldr	x8, [x19, #80]
	tbnz	w8, #3, .LBB16_137
// %bb.120:
	ldr	x11, [x19, #136]
	ldr	x8, [x11, #8]
	ldr	w9, [x11, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	b.eq	.LBB16_127
// %bb.121:
	udiv	w10, w9, w22
	b	.LBB16_128
.LBB16_122:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB16_125
// %bb.123:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB16_125
// %bb.124:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_submit_page_write
	add	x1, x1, :lo12:.L.str
	mov	w3, #1515
	add	x2, x2, :lo12:.L__func__.f2fs_submit_page_write
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB16_125:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	ldr	w8, [x22, #20]
	cbnz	w8, .LBB16_1
// %bb.126:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 1515; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB16_127:
	mov	w10, #-1
.LBB16_128:
	cmp	w8, w10
	b.ne	.LBB16_133
// %bb.129:
	ldr	w12, [x19, #1284]
	mov	w15, #48
	ldr	w13, [x19, #1272]
	ldr	w28, [x19, #1272]
	ldr	x10, [x11, #24]
	ldr	x11, [x11]
	add	w12, w13, w12
	ldr	w14, [x10, #460]
	ldr	x11, [x11, #136]
	madd	x14, x14, x15, x11
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w13, w27, w14
	cmp	w13, w12
	b.lo	.LBB16_133
// %bb.130:
	ldr	w13, [x10, #580]
	mov	w14, #48
	madd	x13, x13, x14, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w27, w13
	cmp	w13, w12
	b.lo	.LBB16_132
// %bb.131:
	ldr	w13, [x10, #700]
	mov	w14, #48
	madd	x13, x13, x14, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w27, w13
	cmp	w13, w12
	b.hs	.LBB16_139
.LBB16_132:
	ldr	x19, [sp, #40]          // 8-byte Folded Reload
.LBB16_133:
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
	b.eq	.LBB16_135
// %bb.134:
	ldr	w11, [x19, #1192]
	udiv	w9, w9, w11
.LBB16_135:
	add	w9, w10, w9
	cmp	w8, w9
	b.hi	.LBB16_137
.LBB16_136:
	mov	x0, x21
	bl	__submit_merged_bio
.LBB16_137:
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	bl	up_write
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB16_144
// %bb.138:
	ldp	x20, x19, [sp, #160]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #144]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #128]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #112]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #96]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB16_139:
	ldr	w12, [x10, #100]
	mov	w13, #48
	ldr	x19, [sp, #40]          // 8-byte Folded Reload
	madd	x11, x12, x13, x11
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w11, w27, w11
	cmp	w11, w28
	b.lo	.LBB16_133
// %bb.140:
	ldr	w8, [x19, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB16_137
// %bb.141:
	ldr	x8, [x19, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB16_137
// %bb.142:
	ldr	w20, [x10, #820]
	mov	x0, x19
	mov	w1, w20
	bl	f2fs_usable_blks_in_seg
	ldr	x9, [x19, #136]
	mov	w10, #48
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x20, x10, x8
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w28
	b.hs	.LBB16_137
// %bb.143:
	ldr	x8, [x9, #8]
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB16_133
.LBB16_144:
	bl	__stack_chk_fail
.LBB16_145:
	adrp	x1, .L.str.15
	mov	x0, x27
	add	x1, x1, :lo12:.L.str.15
	mov	w2, w28
	mov	w3, w20
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB16_148
// %bb.146:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB16_148
// %bb.147:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.verify_blkaddr
	add	x1, x1, :lo12:.L.str
	mov	w3, #4794
	add	x2, x2, :lo12:.L__func__.verify_blkaddr
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB16_148:
	mov	x0, x27
	bl	f2fs_print_raw_sb_info
	mov	x0, x27
	bl	f2fs_print_ckpt_info
	mov	x0, x27
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 4794; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB16_149:
	adrp	x1, .L.str.15
	mov	x0, x27
	add	x1, x1, :lo12:.L.str.15
	mov	w2, w28
	mov	w3, w20
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB16_152
// %bb.150:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB16_152
// %bb.151:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.verify_blkaddr
	add	x1, x1, :lo12:.L.str
	mov	w3, #4794
	add	x2, x2, :lo12:.L__func__.verify_blkaddr
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB16_152:
	mov	x0, x27
	bl	f2fs_print_raw_sb_info
	mov	x0, x27
	bl	f2fs_print_ckpt_info
	mov	x0, x27
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 4794; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end16:
	.size	f2fs_submit_page_write, .Lfunc_end16-f2fs_submit_page_write
                                        // -- End function
	.p2align	3               // -- Begin function __submit_merged_bio
	.type	__submit_merged_bio,@function
__submit_merged_bio:                    // @__submit_merged_bio
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	ldr	x8, [x0, #8]
	cbz	x8, .LBB17_52
// %bb.1:
	ldr	w9, [x0, #36]
	mov	x19, x0
	cbnz	w9, .LBB17_6
// %bb.2:
	ldr	x9, [x19, #24]
	mov	w11, #1
	ldr	w10, [x19, #40]
	ldr	w9, [x9, #2620]
	lsl	w10, w11, w10
	and	w10, w10, #0x7
	tst	w10, w9, lsr #3
	b.eq	.LBB17_4
// %bb.3:
	ldr	w11, [x19, #48]
	orr	w11, w11, #0x1000
	str	w11, [x19, #48]
.LBB17_4:
	tst	w10, w9
	b.eq	.LBB17_6
// %bb.5:
	ldr	w9, [x19, #48]
	orr	w9, w9, #0x20000
	str	w9, [x19, #48]
.LBB17_6:
	ldp	w9, w10, [x19, #44]
	orr	w9, w10, w9
	str	w9, [x8, #16]
	ldp	x22, x20, [x19]
	ldr	w8, [x19, #44]
	ldr	w21, [x19, #36]
	ldr	x23, [x22]
	cbz	w8, .LBB17_14
// %bb.7:
	adrp	x8, __tracepoint_f2fs_prepare_write_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_prepare_write_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB17_24
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
	cbz	x20, .LBB17_23
// %bb.9:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB17_23
// %bb.10:
	//APP
	mrs x22, sp_el0
	//NO_APP
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x24, [x8, #32]
	cbz	x24, .LBB17_13
// %bb.11:
	ldr	x8, [x24], #24
.LBB17_12:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x24, #-16]
	mov	x1, x23
	mov	w2, w21
	mov	x3, x20
	blr	x8
	ldr	x8, [x24], #24
	cbnz	x8, .LBB17_12
.LBB17_13:
	//APP
	//NO_APP
	b	.LBB17_21
.LBB17_14:
	adrp	x8, __tracepoint_f2fs_prepare_read_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_prepare_read_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB17_24
// %bb.15:
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
	cbz	x20, .LBB17_23
// %bb.16:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB17_23
// %bb.17:
	//APP
	mrs x22, sp_el0
	//NO_APP
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x24, [x8, #32]
	cbz	x24, .LBB17_20
// %bb.18:
	ldr	x8, [x24], #24
.LBB17_19:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x24, #-16]
	mov	x1, x23
	mov	w2, w21
	mov	x3, x20
	blr	x8
	ldr	x8, [x24], #24
	cbnz	x8, .LBB17_19
.LBB17_20:
	//APP
	//NO_APP
.LBB17_21:
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB17_23
// %bb.22:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB17_80
.LBB17_23:
	ldr	w21, [x19, #36]
	ldp	x22, x20, [x19]
.LBB17_24:
	//APP
	mrs x23, sp_el0
	//NO_APP
	ldrb	w8, [x23, #111]
	tbnz	w8, #1, .LBB17_26
// %bb.25:
	ldr	w8, [x23, #2512]
	add	w8, w8, #1              // =1
	str	w8, [x23, #2512]
.LBB17_26:
	ldrb	w8, [x20, #16]
	cbz	w8, .LBB17_34
// %bb.27:
	cmp	w21, #1                 // =1
	b.hi	.LBB17_34
// %bb.28:
	ldr	w8, [x22, #1504]
	ldr	w24, [x20, #88]
	cmp	w8, #1                  // =1
	b.ne	.LBB17_31
// %bb.29:
	ldr	x0, [x23, #2504]
	cbz	x0, .LBB17_31
// %bb.30:
	bl	blk_finish_plug
.LBB17_31:
	add	w8, w24, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB17_53
.LBB17_32:
	ldr	w8, [x22, #1432]
	mov	w9, #1
	lsl	w8, w9, w8
	cmp	w8, #2                  // =2
	b.lt	.LBB17_34
// %bb.33:
	ldr	w9, [x20, #48]
	sub	w8, w8, #1              // =1
	tst	w8, w9, lsr #12
	b.ne	.LBB17_86
.LBB17_34:
	ldrb	w8, [x20, #16]
	ldr	x22, [x22]
	cbz	w8, .LBB17_42
// %bb.35:
	adrp	x8, __tracepoint_f2fs_submit_write_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_write_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB17_51
// %bb.36:
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
	cbz	x20, .LBB17_51
// %bb.37:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB17_51
// %bb.38:
	ldr	w9, [x23, #80]
	add	w9, w9, #1              // =1
	str	w9, [x23, #80]
	//APP
	//NO_APP
	ldr	x24, [x8, #32]
	cbz	x24, .LBB17_41
// %bb.39:
	ldr	x8, [x24], #24
.LBB17_40:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x24, #-16]
	mov	x1, x22
	mov	w2, w21
	mov	x3, x20
	blr	x8
	ldr	x8, [x24], #24
	cbnz	x8, .LBB17_40
.LBB17_41:
	//APP
	//NO_APP
	b	.LBB17_49
.LBB17_42:
	adrp	x8, __tracepoint_f2fs_submit_read_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_read_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB17_51
// %bb.43:
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
	cbz	x20, .LBB17_51
// %bb.44:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB17_51
// %bb.45:
	ldr	w9, [x23, #80]
	add	w9, w9, #1              // =1
	str	w9, [x23, #80]
	//APP
	//NO_APP
	ldr	x24, [x8, #32]
	cbz	x24, .LBB17_48
// %bb.46:
	ldr	x8, [x24], #24
.LBB17_47:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x24, #-16]
	mov	x1, x22
	mov	w2, w21
	mov	x3, x20
	blr	x8
	ldr	x8, [x24], #24
	cbnz	x8, .LBB17_47
.LBB17_48:
	//APP
	//NO_APP
.LBB17_49:
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB17_51
// %bb.50:
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB17_81
.LBB17_51:
	mov	x0, x20
	bl	submit_bio
	str	xzr, [x19, #8]
.LBB17_52:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB17_53:
	ldr	w9, [x22, #3024]
	cbz	w9, .LBB17_61
// %bb.54:
	ldr	x8, [x22]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB17_60
// %bb.55:
	ldr	x11, [x22, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB17_57
.LBB17_56:                              //   in Loop: Header=BB17_57 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB17_60
.LBB17_57:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w24
	b.hi	.LBB17_56
// %bb.58:                              //   in Loop: Header=BB17_57 Depth=1
	ldr	w12, [x11]
	cmp	w12, w24
	b.lo	.LBB17_56
// %bb.59:
	ldur	x8, [x11, #-80]
.LBB17_60:
	cbz	x8, .LBB17_32
.LBB17_61:
	ldr	x8, [x22, #136]
	cbz	x8, .LBB17_63
// %bb.62:
	add	x9, x8, #80             // =80
	b	.LBB17_64
.LBB17_63:
	ldr	x9, [x22, #16]
	add	x9, x9, #72             // =72
.LBB17_64:
	ldr	x10, [x8, #8]
	ldr	w9, [x9]
	ldr	w11, [x22, #1184]
	ldr	w10, [x10]
	sub	w9, w24, w9
	lsr	w9, w9, w11
	sub	w9, w9, w10
	cmn	w9, #1                  // =1
	b.eq	.LBB17_32
// %bb.65:
	ldr	x8, [x8]
	mov	w10, #48
	ldr	x8, [x8, #136]
	umaddl	x24, w9, w10, x8
	cbnz	w21, .LBB17_71
// %bb.66:
	cbz	x24, .LBB17_71
// %bb.67:
	ldr	w8, [x24]
	mov	w10, #1
	mov	w25, #455
	and	w9, w8, #0x3f
	cmp	w9, #8                  // =8
	lsl	w9, w10, w9
	and	w9, w9, w25
	ccmp	w9, #0, #4, ls
	b.eq	.LBB17_76
.LBB17_68:
	and	w8, w8, #0x3f
	cmp	w8, #8                  // =8
	b.hi	.LBB17_70
// %bb.69:
	mov	w9, #1
	lsl	w8, w9, w8
	tst	w8, w25
	b.ne	.LBB17_32
.LBB17_70:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 892; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB17_71:
	cmp	w21, #1                 // =1
	b.ne	.LBB17_32
// %bb.72:
	cbz	x24, .LBB17_32
// %bb.73:
	ldr	w8, [x24]
	and	w9, w8, #0x3f
	sub	w9, w9, #3              // =3
	cmp	w9, #3                  // =3
	b.hs	.LBB17_82
.LBB17_74:
	and	w8, w8, #0x3f
	sub	w8, w8, #3              // =3
	cmp	w8, #3                  // =3
	b.lo	.LBB17_32
// %bb.75:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 894; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB17_76:
	bl	print_bdev_access_info
	adrp	x26, f2fs_dclient
	ldr	x0, [x26, :lo12:f2fs_dclient]
	cbz	x0, .LBB17_79
// %bb.77:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB17_79
// %bb.78:
	ldr	x0, [x26, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #892
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB17_79:
	mov	x0, x22
	bl	f2fs_print_raw_sb_info
	mov	x0, x22
	bl	f2fs_print_ckpt_info
	mov	x0, x22
	bl	f2fs_print_sbi_info
	ldr	w8, [x24]
	b	.LBB17_68
.LBB17_80:
	bl	preempt_schedule_notrace
	b	.LBB17_23
.LBB17_81:
	bl	preempt_schedule_notrace
	b	.LBB17_51
.LBB17_82:
	bl	print_bdev_access_info
	adrp	x25, f2fs_dclient
	ldr	x0, [x25, :lo12:f2fs_dclient]
	cbz	x0, .LBB17_85
// %bb.83:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB17_85
// %bb.84:
	ldr	x0, [x25, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #894
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB17_85:
	mov	x0, x22
	bl	f2fs_print_raw_sb_info
	mov	x0, x22
	bl	f2fs_print_ckpt_info
	mov	x0, x22
	bl	f2fs_print_sbi_info
	ldr	w8, [x24]
	b	.LBB17_74
.LBB17_86:
	ldr	x0, [x22, #216]
	mov	w1, #2048
	movk	w1, #96, lsl #16
	bl	mempool_alloc
	mov	x19, x0
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbnz	x19, .LBB17_91
// %bb.87:
	cbz	x0, .LBB17_90
// %bb.88:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB17_90
// %bb.89:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #913
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB17_90:
	mov	x0, x22
	bl	f2fs_print_raw_sb_info
	mov	x0, x22
	bl	f2fs_print_ckpt_info
	mov	x0, x22
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 913; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB17_91:
	cbz	x0, .LBB17_94
// %bb.92:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB17_94
// %bb.93:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #917
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB17_94:
	mov	x0, x22
	bl	f2fs_print_raw_sb_info
	mov	x0, x22
	bl	f2fs_print_ckpt_info
	mov	x0, x22
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 917; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end17:
	.size	__submit_merged_bio, .Lfunc_end17-__submit_merged_bio
                                        // -- End function
	.globl	f2fs_set_data_blkaddr   // -- Begin function f2fs_set_data_blkaddr
	.p2align	3
	.type	f2fs_set_data_blkaddr,@function
f2fs_set_data_blkaddr:                  // @f2fs_set_data_blkaddr
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	str	x19, [sp, #16]          // 8-byte Folded Spill
	mov	x19, x0
	ldr	x0, [x0, #16]
	mov	w1, #1
	mov	w2, #1
	mov	w3, #1
	mov	x29, sp
	bl	f2fs_wait_on_page_writeback
	ldr	x8, [x19, #16]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w10, [x8, #4076]
	cmp	w9, w10
	b.ne	.LBB18_2
// %bb.1:
	ldr	x11, [x19]
	ldr	x12, [x11, #712]
	tbnz	w12, #26, .LBB18_3
.LBB18_2:
	mov	w11, wzr
	b	.LBB18_4
.LBB18_3:
	ldr	w11, [x11, #1160]
	asr	w11, w11, #2
.LBB18_4:
	ldr	w12, [x19, #28]
	add	x13, x8, #360           // =360
	cmp	w9, w10
	ldr	w9, [x19, #36]
	csel	x8, x13, x8, eq
	add	w10, w12, w11
	str	w9, [x8, w10, uxtw #2]
	ldr	x0, [x19, #16]
	bl	set_page_dirty
	cbz	w0, .LBB18_6
// %bb.5:
	mov	w8, #1
	strb	w8, [x19, #33]
.LBB18_6:
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end18:
	.size	f2fs_set_data_blkaddr, .Lfunc_end18-f2fs_set_data_blkaddr
                                        // -- End function
	.globl	f2fs_update_data_blkaddr // -- Begin function f2fs_update_data_blkaddr
	.p2align	3
	.type	f2fs_update_data_blkaddr,@function
f2fs_update_data_blkaddr:               // @f2fs_update_data_blkaddr
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	str	x19, [sp, #16]          // 8-byte Folded Spill
	mov	x19, x0
	ldr	x0, [x0, #16]
	mov	w2, #1
	mov	w3, #1
	mov	x29, sp
	str	w1, [x19, #36]
	mov	w1, #1
	bl	f2fs_wait_on_page_writeback
	ldr	x8, [x19, #16]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w10, [x8, #4076]
	cmp	w9, w10
	b.ne	.LBB19_2
// %bb.1:
	ldr	x11, [x19]
	ldr	x12, [x11, #712]
	tbnz	w12, #26, .LBB19_3
.LBB19_2:
	mov	w11, wzr
	b	.LBB19_4
.LBB19_3:
	ldr	w11, [x11, #1160]
	asr	w11, w11, #2
.LBB19_4:
	ldr	w12, [x19, #28]
	add	x13, x8, #360           // =360
	cmp	w9, w10
	ldr	w9, [x19, #36]
	csel	x8, x13, x8, eq
	add	w10, w12, w11
	str	w9, [x8, w10, uxtw #2]
	ldr	x0, [x19, #16]
	bl	set_page_dirty
	cbz	w0, .LBB19_6
// %bb.5:
	mov	w8, #1
	strb	w8, [x19, #33]
.LBB19_6:
	mov	x0, x19
	bl	f2fs_update_extent_cache
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end19:
	.size	f2fs_update_data_blkaddr, .Lfunc_end19-f2fs_update_data_blkaddr
                                        // -- End function
	.globl	f2fs_reserve_new_blocks // -- Begin function f2fs_reserve_new_blocks
	.p2align	3
	.type	f2fs_reserve_new_blocks,@function
f2fs_reserve_new_blocks:                // @f2fs_reserve_new_blocks
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	str	x27, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	cbz	x1, .LBB20_7
// %bb.1:
	ldr	x21, [x0]
	mov	x19, x0
	mov	w24, #-1
	ldr	x8, [x21, #40]
	ldr	x25, [x8, #1104]
	ldr	x8, [x21, #712]
	tbnz	w8, #6, .LBB20_46
// %bb.2:
	ldrb	w8, [x21, #142]
	mov	x0, x21
	mov	w2, #3
	mov	x20, x1
	lsl	x1, x1, x8
	bl	__dquot_alloc_space
	add	w9, w0, #28             // =28
	mov	w8, #1
	mov	w10, #1
	cmp	w9, #28                 // =28
	movk	w10, #4224, lsl #16
	lsl	w8, w8, w9
	and	w8, w8, w10
	ccmp	w8, #0, #4, ls
	b.ne	.LBB20_4
// %bb.3:
	cmn	w0, #122                // =122
	b.ne	.LBB20_45
.LBB20_4:
	adrp	x26, percpu_counter_batch
	add	x22, x25, #1336         // =1336
	mov	x0, x22
	mov	x1, x20
	ldr	w2, [x26, :lo12:percpu_counter_batch]
	bl	percpu_counter_add_batch
	add	x23, x25, #2236         // =2236
	mov	x0, x23
	bl	_raw_spin_lock
	ldr	w8, [x25, #1240]
	ldr	w9, [x25, #1236]
	ldr	w10, [x25, #1256]
	add	w8, w8, w20
	sub	w27, w9, w10
	str	w8, [x25, #1240]
	cbz	x21, .LBB20_13
// %bb.5:
	ldrb	w8, [x25, #1427]
	tbnz	w8, #0, .LBB20_8
.LBB20_6:
	ldr	w8, [x25, #1436]
	sub	w27, w27, w8
	b	.LBB20_13
.LBB20_7:
	mov	w0, wzr
	b	.LBB20_45
.LBB20_8:
	ldrb	w8, [x21, #12]
	tbnz	w8, #5, .LBB20_13
// %bb.9:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldr	w9, [x25, #1440]
	ldr	x8, [x8, #2224]
	ldr	w8, [x8, #28]
	cmp	w9, w8
	b.eq	.LBB20_13
// %bb.10:
	ldr	w0, [x25, #1444]
	cbz	w0, .LBB20_12
// %bb.11:
	bl	in_group_p
	cbnz	w0, .LBB20_13
.LBB20_12:
	mov	w0, #24
	bl	capable
	tbz	w0, #0, .LBB20_6
.LBB20_13:
	ldr	x8, [x25, #80]
	tbnz	w8, #8, .LBB20_47
.LBB20_14:
	ldr	w8, [x25, #1240]
	subs	w9, w8, w27
	b.hi	.LBB20_48
// %bb.15:
	mov	x0, x23
	bl	_raw_spin_unlock
.LBB20_16:
	ldr	x23, [x21, #712]
	and	x9, x20, #0xffffffff
	ldr	x22, [x21, #712]
	mov	x0, x21
	ldrb	w8, [x21, #142]
	lsl	x1, x9, x8
	bl	dquot_claim_space_nodirty
	cbnz	w0, .LBB20_18
// %bb.17:
	mov	x0, x21
	mov	w1, #1
	bl	__mark_inode_dirty
.LBB20_18:
	mov	x0, x21
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	tbz	w23, #1, .LBB20_20
// %bb.19:
	tbz	w22, #2, .LBB20_21
.LBB20_20:
	add	x8, x21, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB20_21:
	adrp	x8, __tracepoint_f2fs_reserve_new_blocks
	ldr	x21, [x19]
	add	x8, x8, :lo12:__tracepoint_f2fs_reserve_new_blocks
	ldp	w22, w23, [x19, #24]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB20_28
// %bb.22:
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
	tbz	w9, #0, .LBB20_28
// %bb.23:
	//APP
	mrs x25, sp_el0
	//NO_APP
	ldr	w9, [x25, #80]
	add	w9, w9, #1              // =1
	str	w9, [x25, #80]
	//APP
	//NO_APP
	ldr	x26, [x8, #32]
	cbz	x26, .LBB20_26
// %bb.24:
	ldr	x8, [x26], #24
.LBB20_25:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x26, #-16]
	mov	x1, x21
	mov	w2, w22
	mov	w3, w23
	mov	x4, x20
	blr	x8
	ldr	x8, [x26], #24
	cbnz	x8, .LBB20_25
.LBB20_26:
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x25, #80]
	b.ne	.LBB20_28
// %bb.27:
	ldr	x8, [x25]
	tbnz	w8, #1, .LBB20_52
.LBB20_28:
	ldr	x0, [x19, #16]
	mov	w1, #1
	mov	w2, #1
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
	ldr	w8, [x19, #28]
	b	.LBB20_32
.LBB20_29:                              //   in Loop: Header=BB20_32 Depth=1
	mov	w10, wzr
.LBB20_30:                              //   in Loop: Header=BB20_32 Depth=1
	cmp	w11, w12
	add	w8, w10, w8
	csel	x9, x13, x9, eq
	sub	x20, x20, #1            // =1
	str	w24, [x9, w8, uxtw #2]
	ldr	w8, [x19, #28]
.LBB20_31:                              //   in Loop: Header=BB20_32 Depth=1
	add	w8, w8, #1              // =1
	str	w8, [x19, #28]
	cbz	x20, .LBB20_43
.LBB20_32:                              // =>This Inner Loop Header: Depth=1
	ldr	x9, [x19, #16]
	ldr	x10, [x19]
	lsl	x9, x9, #6
	orr	x9, x9, #0xffffffc000000000
	ldr	w11, [x9, #4072]
	ldr	w12, [x9, #4076]
	cmp	w11, w12
	b.ne	.LBB20_37
// %bb.33:                              //   in Loop: Header=BB20_32 Depth=1
	cbz	x10, .LBB20_36
// %bb.34:                              //   in Loop: Header=BB20_32 Depth=1
	ldr	x13, [x10, #712]
	tbz	w13, #26, .LBB20_37
// %bb.35:                              //   in Loop: Header=BB20_32 Depth=1
	ldr	w13, [x10, #1160]
	asr	w14, w13, #2
	b	.LBB20_38
.LBB20_36:                              //   in Loop: Header=BB20_32 Depth=1
	ldrb	w13, [x9, #3]
	tbnz	w13, #5, .LBB20_42
.LBB20_37:                              //   in Loop: Header=BB20_32 Depth=1
	mov	w14, wzr
.LBB20_38:                              //   in Loop: Header=BB20_32 Depth=1
	add	x13, x9, #360           // =360
	cmp	w11, w12
	csel	x11, x13, x9, eq
	add	w12, w14, w8
	ldr	w11, [x11, w12, uxtw #2]
	cbnz	w11, .LBB20_31
// %bb.39:                              //   in Loop: Header=BB20_32 Depth=1
	str	w24, [x19, #36]
	ldr	w11, [x9, #4072]
	ldr	w12, [x9, #4076]
	cmp	w11, w12
	b.ne	.LBB20_29
// %bb.40:                              //   in Loop: Header=BB20_32 Depth=1
	ldr	x14, [x10, #712]
	tbz	w14, #26, .LBB20_29
// %bb.41:                              //   in Loop: Header=BB20_32 Depth=1
	ldr	w10, [x10, #1160]
	asr	w10, w10, #2
	b	.LBB20_30
.LBB20_42:                              //   in Loop: Header=BB20_32 Depth=1
	ldrh	w13, [x9, #360]
	lsr	w14, w13, #2
	b	.LBB20_38
.LBB20_43:
	ldr	x0, [x19, #16]
	bl	set_page_dirty
	cbz	w0, .LBB20_45
// %bb.44:
	mov	w8, #1
	mov	w0, wzr
	strb	w8, [x19, #33]
.LBB20_45:
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldr	x27, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB20_46:
	mov	w0, w24
	b	.LBB20_45
.LBB20_47:
	ldr	w8, [x25, #1264]
	subs	w8, w27, w8
	csel	w27, wzr, w8, lo
	b	.LBB20_14
.LBB20_48:
	cmp	x9, x20
	mov	x0, x23
	csel	x27, x20, x9, hi
	sub	w8, w8, w27
	sub	x20, x20, x27
	str	w8, [x25, #1240]
	bl	_raw_spin_unlock
	cbz	x20, .LBB20_51
// %bb.49:
	cbz	x27, .LBB20_16
// %bb.50:
	ldr	w2, [x26, :lo12:percpu_counter_batch]
	neg	x1, x27
	mov	x0, x22
	bl	percpu_counter_add_batch
	ldrb	w8, [x21, #142]
	mov	x0, x21
	mov	w2, #2
	lsl	x1, x27, x8
	bl	__dquot_free_space
	b	.LBB20_16
.LBB20_51:
	ldr	w2, [x26, :lo12:percpu_counter_batch]
	neg	x1, x27
	mov	x0, x22
	bl	percpu_counter_add_batch
	ldrb	w8, [x21, #142]
	mov	x0, x21
	mov	w2, #2
	lsl	x1, x27, x8
	bl	__dquot_free_space
	mov	w0, #-28
	b	.LBB20_45
.LBB20_52:
	bl	preempt_schedule_notrace
	b	.LBB20_28
.Lfunc_end20:
	.size	f2fs_reserve_new_blocks, .Lfunc_end20-f2fs_reserve_new_blocks
                                        // -- End function
	.globl	f2fs_reserve_new_block  // -- Begin function f2fs_reserve_new_block
	.p2align	3
	.type	f2fs_reserve_new_block,@function
f2fs_reserve_new_block:                 // @f2fs_reserve_new_block
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	w1, #1
	ldr	w20, [x0, #28]
	mov	x29, sp
	mov	x19, x0
	bl	f2fs_reserve_new_blocks
	str	w20, [x19, #28]
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end21:
	.size	f2fs_reserve_new_block, .Lfunc_end21-f2fs_reserve_new_block
                                        // -- End function
	.globl	f2fs_reserve_block      // -- Begin function f2fs_reserve_block
	.p2align	3
	.type	f2fs_reserve_block,@function
f2fs_reserve_block:                     // @f2fs_reserve_block
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	x22, x0
	str	x23, [sp, #16]          // 8-byte Folded Spill
	mov	w2, wzr
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x29, sp
	ldr	x21, [x22, #8]!
	mov	x20, x0
	bl	f2fs_get_dnode_of_data
	mov	w19, w0
	cbnz	w0, .LBB22_36
// %bb.1:
	ldr	w8, [x20, #36]
	cbz	w8, .LBB22_3
// %bb.2:
	mov	w19, wzr
	cbnz	x21, .LBB22_36
	b	.LBB22_5
.LBB22_3:
	ldr	w23, [x20, #28]
	mov	x0, x20
	mov	w1, #1
	bl	f2fs_reserve_new_blocks
	mov	w19, w0
	str	w23, [x20, #28]
	cbz	x21, .LBB22_5
// %bb.4:
	cbz	w19, .LBB22_36
.LBB22_5:
	ldr	x21, [x20, #16]
	cbz	x21, .LBB22_31
// %bb.6:
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
	b.ne	.LBB22_23
// %bb.7:
	tbnz	w8, #0, .LBB22_21
// %bb.8:
	bl	print_bdev_access_info
	adrp	x23, f2fs_dclient
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB22_11
// %bb.9:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB22_11
// %bb.10:
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB22_11:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB22_13
// %bb.12:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB22_37
.LBB22_13:
	ldr	x0, [x21, #24]
.LBB22_14:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB22_16
// %bb.15:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB22_38
.LBB22_16:
	ldr	x0, [x21, #24]
.LBB22_17:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB22_19
// %bb.18:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB22_39
.LBB22_19:
	ldr	x0, [x21, #24]
.LBB22_20:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB22_21:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB22_29
// %bb.22:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB22_23:
	tbnz	w8, #0, .LBB22_28
// %bb.24:
	bl	print_bdev_access_info
	adrp	x23, f2fs_dclient
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB22_27
// %bb.25:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB22_27
// %bb.26:
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB22_27:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB22_28:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB22_40
.LBB22_29:
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
	cbnz	w9, .LBB22_31
// %bb.30:
	bl	__put_page
.LBB22_31:
	ldr	x8, [x22]
	cbz	x8, .LBB22_35
// %bb.32:
	ldr	x9, [x20, #16]
	cmp	x9, x8
	b.eq	.LBB22_35
// %bb.33:
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
	cbnz	w9, .LBB22_35
// %bb.34:
	bl	__put_page
.LBB22_35:
	stp	xzr, xzr, [x22]
.LBB22_36:
	mov	w0, w19
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB22_37:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB22_14
.LBB22_38:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB22_17
.LBB22_39:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB22_20
.LBB22_40:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end22:
	.size	f2fs_reserve_block, .Lfunc_end22-f2fs_reserve_block
                                        // -- End function
	.globl	f2fs_get_block          // -- Begin function f2fs_get_block
	.p2align	3
	.type	f2fs_get_block,@function
f2fs_get_block:                         // @f2fs_get_block
// %bb.0:
	sub	sp, sp, #64             // =64
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x0
	add	x2, sp, #8              // =8
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	x20, x1
	stur	x8, [x29, #-8]
	ldr	x0, [x0]
	str	wzr, [sp, #16]
	str	xzr, [sp, #8]
	bl	f2fs_lookup_extent_cache
	tbz	w0, #0, .LBB23_2
// %bb.1:
	ldr	w8, [sp, #16]
	mov	w0, wzr
	ldr	w9, [sp, #8]
	add	w8, w8, w20
	sub	w8, w8, w9
	str	w8, [x19, #36]
	b	.LBB23_3
.LBB23_2:
	mov	x0, x19
	mov	x1, x20
	bl	f2fs_reserve_block
.LBB23_3:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB23_5
// %bb.4:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.LBB23_5:
	bl	__stack_chk_fail
.Lfunc_end23:
	.size	f2fs_get_block, .Lfunc_end23-f2fs_get_block
                                        // -- End function
	.globl	f2fs_get_read_data_page // -- Begin function f2fs_get_read_data_page
	.p2align	3
	.type	f2fs_get_read_data_page,@function
f2fs_get_read_data_page:                // @f2fs_get_read_data_page
// %bb.0:
	sub	sp, sp, #160            // =160
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	str	x25, [sp, #96]          // 8-byte Folded Spill
	stp	x24, x23, [sp, #112]    // 16-byte Folded Spill
	mov	x23, x1
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x22, x21, [sp, #128]    // 16-byte Folded Spill
	mov	x22, x0
	stp	x20, x19, [sp, #144]    // 16-byte Folded Spill
	mov	w21, w3
	mov	w20, w2
	stur	x8, [x29, #-8]
	ldr	x0, [x0, #48]
	str	wzr, [sp, #16]
	str	xzr, [sp, #8]
	tbz	w3, #0, .LBB24_5
// %bb.1:
	mov	x1, x23
	mov	w2, #2
	bl	grab_cache_page_write_begin
	mov	x19, x0
	cbz	x0, .LBB24_6
.LBB24_2:
	add	x2, sp, #8              // =8
	mov	x0, x22
	mov	x1, x23
	bl	f2fs_lookup_extent_cache
	tbz	w0, #0, .LBB24_7
// %bb.3:
	ldr	w8, [sp, #16]
	mov	w2, #8
	ldr	x10, [x22, #40]
	ldr	w9, [sp, #8]
	add	w8, w8, w23
	ldr	x0, [x10, #1104]
	sub	w1, w8, w9
	str	w1, [sp, #60]
	bl	f2fs_is_valid_blkaddr
	tbnz	w0, #0, .LBB24_67
.LBB24_4:
	mov	w23, #-117
	b	.LBB24_8
.LBB24_5:
	ldr	w3, [x0, #140]
	mov	x1, x23
	mov	w2, #7
	bl	pagecache_get_page
	mov	x19, x0
	cbnz	x0, .LBB24_2
.LBB24_6:
	mov	x19, #-12
	b	.LBB24_72
.LBB24_7:
	add	x0, sp, #24             // =24
	mov	w1, wzr
	mov	w2, #48
	add	x24, sp, #24            // =24
	bl	memset
	add	x0, sp, #24             // =24
	mov	x1, x23
	mov	w2, #1
	stp	x22, xzr, [sp, #24]
	str	xzr, [sp, #40]
	str	wzr, [sp, #48]
	bl	f2fs_get_dnode_of_data
	mov	w23, w0
	cbz	w0, .LBB24_34
.LBB24_8:
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
	b.ne	.LBB24_25
// %bb.9:
	tbnz	w8, #0, .LBB24_23
// %bb.10:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB24_13
// %bb.11:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB24_13
// %bb.12:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB24_13:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB24_15
// %bb.14:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB24_80
.LBB24_15:
	ldr	x0, [x19, #24]
.LBB24_16:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB24_18
// %bb.17:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB24_81
.LBB24_18:
	ldr	x0, [x19, #24]
.LBB24_19:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB24_21
// %bb.20:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB24_82
.LBB24_21:
	ldr	x0, [x19, #24]
.LBB24_22:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB24_23:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB24_31
// %bb.24:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB24_25:
	tbnz	w8, #0, .LBB24_30
// %bb.26:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB24_29
// %bb.27:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB24_29
// %bb.28:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB24_29:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB24_30:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB24_88
.LBB24_31:
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
	cbnz	w9, .LBB24_33
// %bb.32:
	bl	__put_page
.LBB24_33:
	sxtw	x19, w23
	b	.LBB24_72
.LBB24_34:
	ldr	x23, [sp, #40]
	cbz	x23, .LBB24_60
// %bb.35:
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
	b.ne	.LBB24_52
// %bb.36:
	tbnz	w8, #0, .LBB24_50
// %bb.37:
	bl	print_bdev_access_info
	adrp	x25, f2fs_dclient
	ldr	x0, [x25, :lo12:f2fs_dclient]
	cbz	x0, .LBB24_40
// %bb.38:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB24_40
// %bb.39:
	ldr	x0, [x25, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB24_40:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB24_42
// %bb.41:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB24_84
.LBB24_42:
	ldr	x0, [x23, #24]
.LBB24_43:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB24_45
// %bb.44:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB24_85
.LBB24_45:
	ldr	x0, [x23, #24]
.LBB24_46:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB24_48
// %bb.47:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB24_86
.LBB24_48:
	ldr	x0, [x23, #24]
.LBB24_49:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB24_50:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB24_58
// %bb.51:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB24_52:
	tbnz	w8, #0, .LBB24_57
// %bb.53:
	bl	print_bdev_access_info
	adrp	x25, f2fs_dclient
	ldr	x0, [x25, :lo12:f2fs_dclient]
	cbz	x0, .LBB24_56
// %bb.54:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB24_56
// %bb.55:
	ldr	x0, [x25, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB24_56:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB24_57:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB24_89
.LBB24_58:
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
	cbnz	w9, .LBB24_60
// %bb.59:
	bl	__put_page
.LBB24_60:
	ldr	x8, [sp, #32]
	add	x23, x24, #8            // =8
	cbz	x8, .LBB24_64
// %bb.61:
	ldr	x9, [sp, #40]
	cmp	x9, x8
	b.eq	.LBB24_64
// %bb.62:
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
	cbnz	w9, .LBB24_64
// %bb.63:
	bl	__put_page
.LBB24_64:
	ldr	w1, [sp, #60]
	stp	xzr, xzr, [x23]
	cmn	w1, #1                  // =1
	b.eq	.LBB24_67
// %bb.65:
	cbz	w1, .LBB24_79
// %bb.66:
	ldr	x8, [x22, #40]
	mov	w2, #7
	ldr	x0, [x8, #1104]
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB24_4
.LBB24_67:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB24_70
// %bb.68:
	ldr	w2, [sp, #60]
	cmn	w2, #1                  // =1
	b.eq	.LBB24_74
// %bb.69:
	and	w4, w21, #0x1
	mov	x0, x22
	mov	x1, x19
	mov	w3, w20
	bl	f2fs_submit_page_read
	mov	w23, w0
	cbnz	w0, .LBB24_8
	b	.LBB24_72
.LBB24_70:
	//APP
	dmb ishld
	//NO_APP
.LBB24_71:
	mov	x0, x19
	bl	unlock_page
.LBB24_72:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB24_87
// %bb.73:
	mov	x0, x19
	ldr	x25, [sp, #96]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #144]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #112]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB24_74:
	//APP
	mrs x20, sp_el0
	//NO_APP
	ldr	w8, [x20, #80]
	mov	w1, wzr
	mov	w2, #4096
	add	w8, w8, #1              // =1
	str	w8, [x20, #80]
	//APP
	//NO_APP
	ldr	w8, [x20, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x20, #2984]
	lsl	x8, x19, #6
	orr	x0, x8, #0xffffffc000000000
	//APP
	//NO_APP
	bl	memset
	//APP
	//NO_APP
	ldr	w8, [x20, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x20, #2984]
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	b.ne	.LBB24_76
// %bb.75:
	ldr	x8, [x20]
	tbnz	w8, #1, .LBB24_83
.LBB24_76:
	mov	x0, x19
	bl	flush_dcache_page
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB24_78
// %bb.77:
	//APP
	dmb ishst
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	orr	x8, x8, 4
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
	b	.LBB24_71
.LBB24_78:
	//APP
	dmb ishld
	//NO_APP
	b	.LBB24_71
.LBB24_79:
	mov	w23, #-2
	b	.LBB24_8
.LBB24_80:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB24_16
.LBB24_81:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB24_19
.LBB24_82:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB24_22
.LBB24_83:
	bl	preempt_schedule
	b	.LBB24_76
.LBB24_84:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB24_43
.LBB24_85:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB24_46
.LBB24_86:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB24_49
.LBB24_87:
	bl	__stack_chk_fail
.LBB24_88:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB24_89:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end24:
	.size	f2fs_get_read_data_page, .Lfunc_end24-f2fs_get_read_data_page
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_submit_page_read
	.type	f2fs_submit_page_read,@function
f2fs_submit_page_read:                  // @f2fs_submit_page_read
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	mov	w23, w2
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	mov	x21, x1
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	and	w5, w4, #0x1
	ldr	x8, [x0, #40]
	mov	x29, sp
	str	x25, [sp, #16]          // 8-byte Folded Spill
	mov	x22, x0
	ldr	x20, [x8, #1104]
	ldr	x8, [x1, #32]
	mov	w1, w2
	mov	w2, #1
	mov	x4, x8
	bl	f2fs_grab_read_bio
	mov	x19, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB25_32
// %bb.1:
	mov	x0, x22
	mov	w1, w23
	bl	f2fs_wait_on_block_writeback
	mov	x0, x19
	mov	x1, x21
	mov	w2, #4096
	mov	w3, wzr
	bl	bio_add_page
	cmp	w0, #4095               // =4095
	b.hi	.LBB25_3
// %bb.2:
	mov	x0, x19
	bl	bio_put
	mov	w19, #-14
	b	.LBB25_32
.LBB25_3:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, 256
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	add	x9, x20, #1308          // =1308
	//APP
	// atomic_add
	prfm	pstl1strm, [x9]
1:	ldxr	w8, [x9]
	add	w8, w8, 1
	stxr	w10, w8, [x9]
	cbnz	w10, 1b
	//NO_APP
	ldrb	w8, [x20, #2600]
	cbz	w8, .LBB25_5
// %bb.4:
	add	x21, x20, #2240         // =2240
	mov	x0, x21
	bl	_raw_spin_lock
	ldr	x8, [x20, #2376]
	mov	x0, x21
	add	x8, x8, #1, lsl #12     // =4096
	str	x8, [x20, #2376]
	bl	_raw_spin_unlock
	mov	x0, x20
	bl	f2fs_record_iostat
.LBB25_5:
	//APP
	mrs x21, sp_el0
	//NO_APP
	ldrb	w8, [x21, #111]
	tbnz	w8, #1, .LBB25_7
// %bb.6:
	ldr	w8, [x21, #2512]
	add	w8, w8, #1              // =1
	str	w8, [x21, #2512]
.LBB25_7:
	ldrb	w8, [x19, #16]
	cbz	w8, .LBB25_14
// %bb.8:
	ldr	w8, [x20, #1504]
	ldr	w22, [x19, #88]
	cmp	w8, #1                  // =1
	b.ne	.LBB25_11
// %bb.9:
	ldr	x0, [x21, #2504]
	cbz	x0, .LBB25_11
// %bb.10:
	bl	blk_finish_plug
.LBB25_11:
	add	w8, w22, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB25_33
.LBB25_12:
	ldr	w8, [x20, #1432]
	mov	w9, #1
	lsl	w8, w9, w8
	cmp	w8, #2                  // =2
	b.lt	.LBB25_14
// %bb.13:
	ldr	w9, [x19, #48]
	sub	w8, w8, #1              // =1
	tst	w8, w9, lsr #12
	b.ne	.LBB25_54
.LBB25_14:
	ldrb	w8, [x19, #16]
	ldr	x20, [x20]
	cbz	w8, .LBB25_22
// %bb.15:
	adrp	x8, __tracepoint_f2fs_submit_write_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_write_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB25_31
// %bb.16:
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
	cbz	x19, .LBB25_31
// %bb.17:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB25_31
// %bb.18:
	ldr	w9, [x21, #80]
	add	w9, w9, #1              // =1
	str	w9, [x21, #80]
	//APP
	//NO_APP
	ldr	x22, [x8, #32]
	cbz	x22, .LBB25_21
// %bb.19:
	ldr	x8, [x22], #24
.LBB25_20:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x22, #-16]
	mov	x1, x20
	mov	w2, wzr
	mov	x3, x19
	blr	x8
	ldr	x8, [x22], #24
	cbnz	x8, .LBB25_20
.LBB25_21:
	//APP
	//NO_APP
	b	.LBB25_29
.LBB25_22:
	adrp	x8, __tracepoint_f2fs_submit_read_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_read_bio
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB25_31
// %bb.23:
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
	cbz	x19, .LBB25_31
// %bb.24:
	mov	w11, #1
	lsl	x9, x11, x9
	and	x9, x9, x10
	cbz	x9, .LBB25_31
// %bb.25:
	ldr	w9, [x21, #80]
	add	w9, w9, #1              // =1
	str	w9, [x21, #80]
	//APP
	//NO_APP
	ldr	x22, [x8, #32]
	cbz	x22, .LBB25_28
// %bb.26:
	ldr	x8, [x22], #24
.LBB25_27:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x22, #-16]
	mov	x1, x20
	mov	w2, wzr
	mov	x3, x19
	blr	x8
	ldr	x8, [x22], #24
	cbnz	x8, .LBB25_27
.LBB25_28:
	//APP
	//NO_APP
.LBB25_29:
	ldr	w8, [x21, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x21, #80]
	b.ne	.LBB25_31
// %bb.30:
	ldr	x8, [x21]
	tbnz	w8, #1, .LBB25_53
.LBB25_31:
	mov	x0, x19
	bl	submit_bio
	mov	w19, wzr
.LBB25_32:
	mov	w0, w19
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB25_33:
	ldr	w9, [x20, #3024]
	cbz	w9, .LBB25_41
// %bb.34:
	ldr	x8, [x20]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB25_40
// %bb.35:
	ldr	x11, [x20, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB25_37
.LBB25_36:                              //   in Loop: Header=BB25_37 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB25_40
.LBB25_37:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w22
	b.hi	.LBB25_36
// %bb.38:                              //   in Loop: Header=BB25_37 Depth=1
	ldr	w12, [x11]
	cmp	w12, w22
	b.lo	.LBB25_36
// %bb.39:
	ldur	x8, [x11, #-80]
.LBB25_40:
	cbz	x8, .LBB25_12
.LBB25_41:
	ldr	x8, [x20, #136]
	cbz	x8, .LBB25_43
// %bb.42:
	add	x9, x8, #80             // =80
	b	.LBB25_44
.LBB25_43:
	ldr	x9, [x20, #16]
	add	x9, x9, #72             // =72
.LBB25_44:
	ldr	x10, [x8, #8]
	ldr	w9, [x9]
	ldr	w11, [x20, #1184]
	ldr	w10, [x10]
	sub	w9, w22, w9
	lsr	w9, w9, w11
	sub	w9, w9, w10
	cmn	w9, #1                  // =1
	b.eq	.LBB25_12
// %bb.45:
	ldr	x8, [x8]
	mov	w10, #48
	ldr	x8, [x8, #136]
	umaddl	x22, w9, w10, x8
	cbz	x22, .LBB25_12
// %bb.46:
	ldr	w8, [x22]
	mov	w23, #1
	mov	w24, #455
	and	w9, w8, #0x3f
	cmp	w9, #8                  // =8
	lsl	w9, w23, w9
	and	w9, w9, w24
	ccmp	w9, #0, #4, ls
	b.eq	.LBB25_49
.LBB25_47:
	and	w8, w8, #0x3f
	cmp	w8, #8                  // =8
	lsl	w8, w23, w8
	and	w8, w8, w24
	ccmp	w8, #0, #4, ls
	b.ne	.LBB25_12
// %bb.48:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 892; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB25_49:
	bl	print_bdev_access_info
	adrp	x25, f2fs_dclient
	ldr	x0, [x25, :lo12:f2fs_dclient]
	cbz	x0, .LBB25_52
// %bb.50:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB25_52
// %bb.51:
	ldr	x0, [x25, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #892
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x25, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB25_52:
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	ldr	w8, [x22]
	b	.LBB25_47
.LBB25_53:
	bl	preempt_schedule_notrace
	b	.LBB25_31
.LBB25_54:
	ldr	x0, [x20, #216]
	mov	w1, #2048
	movk	w1, #96, lsl #16
	bl	mempool_alloc
	mov	x19, x0
	bl	print_bdev_access_info
	adrp	x21, f2fs_dclient
	ldr	x0, [x21, :lo12:f2fs_dclient]
	cbnz	x19, .LBB25_59
// %bb.55:
	cbz	x0, .LBB25_58
// %bb.56:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB25_58
// %bb.57:
	ldr	x0, [x21, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #913
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB25_58:
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 913; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB25_59:
	cbz	x0, .LBB25_62
// %bb.60:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB25_62
// %bb.61:
	ldr	x0, [x21, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #917
	add	x2, x2, :lo12:.L__func__.__submit_bio
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB25_62:
	mov	x0, x20
	bl	f2fs_print_raw_sb_info
	mov	x0, x20
	bl	f2fs_print_ckpt_info
	mov	x0, x20
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 917; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end25:
	.size	f2fs_submit_page_read, .Lfunc_end25-f2fs_submit_page_read
                                        // -- End function
	.globl	f2fs_find_data_page     // -- Begin function f2fs_find_data_page
	.p2align	3
	.type	f2fs_find_data_page,@function
f2fs_find_data_page:                    // @f2fs_find_data_page
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x20, x0
	ldr	x0, [x0, #48]
	mov	w2, wzr
	mov	w3, wzr
	str	x21, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	mov	x21, x1
	bl	pagecache_get_page
	cbz	x0, .LBB26_4
// %bb.1:
	ldr	x8, [x0, #8]
	mov	x19, x0
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x0, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB26_13
// %bb.2:
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
	cbnz	w9, .LBB26_4
// %bb.3:
	bl	__put_page
.LBB26_4:
	mov	x0, x20
	mov	x1, x21
	mov	w2, wzr
	mov	w3, wzr
	bl	f2fs_get_read_data_page
	mov	x19, x0
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB26_16
// %bb.5:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB26_14
// %bb.6:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB26_8
// %bb.7:
	ldr	x8, [x19, #8]
	mov	w1, wzr
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x19, x9, eq
	bl	wait_on_page_bit
.LBB26_8:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB26_15
// %bb.9:
	cbz	x19, .LBB26_12
// %bb.10:
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
	cbnz	w9, .LBB26_12
// %bb.11:
	bl	__put_page
.LBB26_12:
	mov	x19, #-5
	b	.LBB26_16
.LBB26_13:
	//APP
	dmb ishld
	//NO_APP
	b	.LBB26_16
.LBB26_14:
	//APP
	dmb ishld
	//NO_APP
	b	.LBB26_16
.LBB26_15:
	//APP
	dmb ishld
	//NO_APP
.LBB26_16:
	mov	x0, x19
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end26:
	.size	f2fs_find_data_page, .Lfunc_end26-f2fs_find_data_page
                                        // -- End function
	.globl	f2fs_get_lock_data_page // -- Begin function f2fs_get_lock_data_page
	.p2align	3
	.type	f2fs_get_lock_data_page,@function
f2fs_get_lock_data_page:                // @f2fs_get_lock_data_page
// %bb.0:
	sub	sp, sp, #112            // =112
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x28, x27, [sp, #32]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #48]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	and	w22, w2, #0x1
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	mov	w2, wzr
	ldr	x28, [x0, #48]
	mov	w3, w22
	mov	x20, x0
	mov	x21, x1
	bl	f2fs_get_read_data_page
	mov	x19, x0
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB27_64
// %bb.1:
	mov	w24, #15241
	adrp	x26, .L.str
	adrp	x27, .L__func__.f2fs_put_page
	mov	w23, #3734
	movk	w24, #14160, lsl #16
	mov	w25, #3736
	add	x26, x26, :lo12:.L.str
	add	x27, x27, :lo12:.L__func__.f2fs_put_page
.LBB27_2:                               // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x9, [x8]
	str	x9, [sp, #8]
	ldr	x9, [sp, #8]
	tbnz	w9, #0, .LBB27_4
// %bb.3:                               //   in Loop: Header=BB27_2 Depth=1
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x8]
1:	ldaxr	x9, [x8]
	orr	x10, x9, 1
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	
	//NO_APP
	tbz	w9, #0, .LBB27_5
.LBB27_4:                               //   in Loop: Header=BB27_2 Depth=1
	mov	x0, x19
	bl	__lock_page
.LBB27_5:                               //   in Loop: Header=BB27_2 Depth=1
	ldr	x8, [x19, #24]
	cmp	x8, x28
	b.eq	.LBB27_35
// %bb.6:                               //   in Loop: Header=BB27_2 Depth=1
	cbz	x19, .LBB27_31
// %bb.7:                               //   in Loop: Header=BB27_2 Depth=1
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
	b.ne	.LBB27_23
// %bb.8:                               //   in Loop: Header=BB27_2 Depth=1
	tbnz	w8, #0, .LBB27_22
// %bb.9:                               //   in Loop: Header=BB27_2 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB27_12
// %bb.10:                              //   in Loop: Header=BB27_2 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB27_12
// %bb.11:                              //   in Loop: Header=BB27_2 Depth=1
	adrp	x8, f2fs_dclient
	mov	x1, x26
	mov	x2, x27
	mov	w3, w23
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, w24
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB27_12:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB27_14
// %bb.13:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB27_32
.LBB27_14:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x0, [x19, #24]
.LBB27_15:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB27_17
// %bb.16:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB27_33
.LBB27_17:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x0, [x19, #24]
.LBB27_18:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB27_20
// %bb.19:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB27_34
.LBB27_20:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x0, [x19, #24]
.LBB27_21:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB27_22:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB27_29
	b	.LBB27_68
.LBB27_23:                              //   in Loop: Header=BB27_2 Depth=1
	tbnz	w8, #0, .LBB27_28
// %bb.24:                              //   in Loop: Header=BB27_2 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB27_27
// %bb.25:                              //   in Loop: Header=BB27_2 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB27_27
// %bb.26:                              //   in Loop: Header=BB27_2 Depth=1
	adrp	x8, f2fs_dclient
	mov	x1, x26
	mov	x2, x27
	mov	w3, w25
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, w24
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB27_27:                              //   in Loop: Header=BB27_2 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB27_28:                              //   in Loop: Header=BB27_2 Depth=1
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB27_69
.LBB27_29:                              //   in Loop: Header=BB27_2 Depth=1
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
	cbnz	w9, .LBB27_31
// %bb.30:                              //   in Loop: Header=BB27_2 Depth=1
	bl	__put_page
.LBB27_31:                              //   in Loop: Header=BB27_2 Depth=1
	mov	x0, x20
	mov	x1, x21
	mov	w2, wzr
	mov	w3, w22
	bl	f2fs_get_read_data_page
	mov	x19, x0
	cmn	x0, #1, lsl #12         // =4096
	b.ls	.LBB27_2
	b	.LBB27_64
.LBB27_32:                              //   in Loop: Header=BB27_2 Depth=1
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB27_15
.LBB27_33:                              //   in Loop: Header=BB27_2 Depth=1
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB27_18
.LBB27_34:                              //   in Loop: Header=BB27_2 Depth=1
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB27_21
.LBB27_35:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB27_54
// %bb.36:
	cbz	x19, .LBB27_63
// %bb.37:
	ldr	x8, [x28]
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
	b.ne	.LBB27_55
// %bb.38:
	tbnz	w8, #0, .LBB27_52
// %bb.39:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB27_42
// %bb.40:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB27_42
// %bb.41:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB27_42:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB27_44
// %bb.43:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB27_65
.LBB27_44:
	ldr	x0, [x19, #24]
.LBB27_45:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB27_47
// %bb.46:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB27_66
.LBB27_47:
	ldr	x0, [x19, #24]
.LBB27_48:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB27_50
// %bb.49:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB27_67
.LBB27_50:
	ldr	x0, [x19, #24]
.LBB27_51:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB27_52:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB27_61
// %bb.53:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB27_54:
	//APP
	dmb ishld
	//NO_APP
	b	.LBB27_64
.LBB27_55:
	tbnz	w8, #0, .LBB27_60
// %bb.56:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB27_59
// %bb.57:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB27_59
// %bb.58:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB27_59:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB27_60:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB27_70
.LBB27_61:
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
	cbnz	w9, .LBB27_63
// %bb.62:
	bl	__put_page
.LBB27_63:
	mov	x19, #-5
.LBB27_64:
	mov	x0, x19
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB27_65:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB27_45
.LBB27_66:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB27_48
.LBB27_67:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB27_51
.LBB27_68:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB27_69:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB27_70:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end27:
	.size	f2fs_get_lock_data_page, .Lfunc_end27-f2fs_get_lock_data_page
                                        // -- End function
	.globl	f2fs_get_new_data_page  // -- Begin function f2fs_get_new_data_page
	.p2align	3
	.type	f2fs_get_new_data_page,@function
f2fs_get_new_data_page:                 // @f2fs_get_new_data_page
// %bb.0:
	sub	sp, sp, #144            // =144
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	stp	x26, x25, [sp, #80]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #96]     // 16-byte Folded Spill
	mov	w23, w3
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x22, x21, [sp, #112]    // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	mov	x22, x2
	mov	x20, x1
	mov	x1, x2
	stur	x8, [x29, #-8]
	mov	w2, #2
	ldr	x0, [x0, #48]
	bl	grab_cache_page_write_begin
	cbz	x0, .LBB28_19
// %bb.1:
	mov	x19, x0
	add	x0, sp, #8              // =8
	mov	w1, wzr
	mov	w2, #48
	add	x25, sp, #8             // =8
	bl	memset
	add	x0, sp, #8              // =8
	mov	x1, x22
	stp	x21, x20, [sp, #8]
	str	xzr, [sp, #24]
	str	wzr, [sp, #32]
	bl	f2fs_reserve_block
	cbz	w0, .LBB28_37
// %bb.2:
	ldr	x8, [x19, #24]
	mov	w24, w0
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
	b.ne	.LBB28_56
// %bb.3:
	tbnz	w8, #0, .LBB28_17
// %bb.4:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB28_7
// %bb.5:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB28_7
// %bb.6:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB28_7:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_9
// %bb.8:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB28_129
.LBB28_9:
	ldr	x0, [x19, #24]
.LBB28_10:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_12
// %bb.11:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB28_130
.LBB28_12:
	ldr	x0, [x19, #24]
.LBB28_13:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_15
// %bb.14:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB28_131
.LBB28_15:
	ldr	x0, [x19, #24]
.LBB28_16:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB28_17:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB28_62
// %bb.18:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB28_19:
	cbz	x20, .LBB28_72
// %bb.20:
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
	b.ne	.LBB28_65
// %bb.21:
	tbnz	w8, #0, .LBB28_35
// %bb.22:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB28_25
// %bb.23:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB28_25
// %bb.24:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB28_25:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_27
// %bb.26:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB28_132
.LBB28_27:
	ldr	x0, [x20, #24]
.LBB28_28:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_30
// %bb.29:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB28_133
.LBB28_30:
	ldr	x0, [x20, #24]
.LBB28_31:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_33
// %bb.32:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB28_134
.LBB28_33:
	ldr	x0, [x20, #24]
.LBB28_34:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB28_35:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB28_71
// %bb.36:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB28_37:
	cbnz	x20, .LBB28_87
// %bb.38:
	ldr	x24, [sp, #24]
	cbz	x24, .LBB28_82
// %bb.39:
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
	b.ne	.LBB28_74
// %bb.40:
	tbnz	w8, #0, .LBB28_54
// %bb.41:
	bl	print_bdev_access_info
	adrp	x26, f2fs_dclient
	ldr	x0, [x26, :lo12:f2fs_dclient]
	cbz	x0, .LBB28_44
// %bb.42:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB28_44
// %bb.43:
	ldr	x0, [x26, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB28_44:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_46
// %bb.45:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB28_139
.LBB28_46:
	ldr	x0, [x24, #24]
.LBB28_47:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_49
// %bb.48:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB28_140
.LBB28_49:
	ldr	x0, [x24, #24]
.LBB28_50:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_52
// %bb.51:
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB28_141
.LBB28_52:
	ldr	x0, [x24, #24]
.LBB28_53:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB28_54:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB28_80
// %bb.55:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB28_56:
	tbnz	w8, #0, .LBB28_61
// %bb.57:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB28_60
// %bb.58:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB28_60
// %bb.59:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB28_60:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB28_61:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB28_143
.LBB28_62:
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
	cbnz	w9, .LBB28_64
// %bb.63:
	bl	__put_page
.LBB28_64:
	sxtw	x19, w24
	b	.LBB28_127
.LBB28_65:
	tbnz	w8, #0, .LBB28_70
// %bb.66:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB28_69
// %bb.67:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB28_69
// %bb.68:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB28_69:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB28_70:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB28_144
.LBB28_71:
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
	cbz	w9, .LBB28_73
.LBB28_72:
	mov	x19, #-12
	b	.LBB28_127
.LBB28_73:
	bl	__put_page
	mov	x19, #-12
	b	.LBB28_127
.LBB28_74:
	tbnz	w8, #0, .LBB28_79
// %bb.75:
	bl	print_bdev_access_info
	adrp	x26, f2fs_dclient
	ldr	x0, [x26, :lo12:f2fs_dclient]
	cbz	x0, .LBB28_78
// %bb.76:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB28_78
// %bb.77:
	ldr	x0, [x26, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB28_78:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB28_79:
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB28_150
.LBB28_80:
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
	cbnz	w9, .LBB28_82
// %bb.81:
	bl	__put_page
.LBB28_82:
	ldr	x8, [sp, #16]
	add	x24, x25, #8            // =8
	cbz	x8, .LBB28_86
// %bb.83:
	ldr	x9, [sp, #24]
	cmp	x9, x8
	b.eq	.LBB28_86
// %bb.84:
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
	cbnz	w9, .LBB28_86
// %bb.85:
	bl	__put_page
.LBB28_86:
	stp	xzr, xzr, [x24]
.LBB28_87:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB28_106
// %bb.88:
	ldr	w8, [sp, #44]
	cmn	w8, #1                  // =1
	b.eq	.LBB28_107
// %bb.89:
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
	b.ne	.LBB28_111
// %bb.90:
	tbnz	w8, #0, .LBB28_104
// %bb.91:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB28_94
// %bb.92:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB28_94
// %bb.93:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB28_94:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_96
// %bb.95:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB28_136
.LBB28_96:
	ldr	x0, [x19, #24]
.LBB28_97:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_99
// %bb.98:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB28_137
.LBB28_99:
	ldr	x0, [x19, #24]
.LBB28_100:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB28_102
// %bb.101:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB28_138
.LBB28_102:
	ldr	x0, [x19, #24]
.LBB28_103:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB28_104:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB28_117
// %bb.105:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB28_106:
	//APP
	dmb ishld
	//NO_APP
	tbnz	w23, #0, .LBB28_122
	b	.LBB28_127
.LBB28_107:
	//APP
	mrs x20, sp_el0
	//NO_APP
	ldr	w8, [x20, #80]
	mov	w1, wzr
	mov	w2, #4096
	add	w8, w8, #1              // =1
	str	w8, [x20, #80]
	//APP
	//NO_APP
	ldr	w8, [x20, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x20, #2984]
	lsl	x8, x19, #6
	orr	x0, x8, #0xffffffc000000000
	//APP
	//NO_APP
	bl	memset
	//APP
	//NO_APP
	ldr	w8, [x20, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x20, #2984]
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	b.ne	.LBB28_109
// %bb.108:
	ldr	x8, [x20]
	tbnz	w8, #1, .LBB28_135
.LBB28_109:
	mov	x0, x19
	bl	flush_dcache_page
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB28_126
// %bb.110:
	//APP
	dmb ishst
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	orr	x8, x8, 4
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
	tbnz	w23, #0, .LBB28_122
	b	.LBB28_127
.LBB28_111:
	tbnz	w8, #0, .LBB28_116
// %bb.112:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB28_115
// %bb.113:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB28_115
// %bb.114:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB28_115:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB28_116:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB28_149
.LBB28_117:
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
	cbnz	w9, .LBB28_119
// %bb.118:
	bl	__put_page
.LBB28_119:
	cbnz	x20, .LBB28_145
// %bb.120:
	mov	x0, x21
	mov	x1, x22
	mov	w2, #1
	bl	f2fs_get_lock_data_page
	mov	x19, x0
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB28_127
// %bb.121:
	tbz	w23, #0, .LBB28_127
.LBB28_122:
	ldr	x9, [x21, #80]
	lsl	x8, x22, #12
	add	x8, x8, #1, lsl #12     // =4096
	cmp	x9, x8
	b.ge	.LBB28_127
// %bb.123:
	ldr	x22, [x21, #712]
	mov	x0, x21
	ldr	x20, [x21, #712]
	mov	w1, #1
	str	x8, [x21, #80]
	bl	f2fs_mark_inode_dirty_sync
	tbz	w22, #1, .LBB28_125
// %bb.124:
	tbz	w20, #2, .LBB28_127
.LBB28_125:
	add	x8, x21, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB28_127
.LBB28_126:
	//APP
	dmb ishld
	//NO_APP
	tbnz	w23, #0, .LBB28_122
.LBB28_127:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB28_142
// %bb.128:
	mov	x0, x19
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #144            // =144
	ret
.LBB28_129:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB28_10
.LBB28_130:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB28_13
.LBB28_131:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB28_16
.LBB28_132:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB28_28
.LBB28_133:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB28_31
.LBB28_134:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB28_34
.LBB28_135:
	bl	preempt_schedule
	b	.LBB28_109
.LBB28_136:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB28_97
.LBB28_137:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB28_100
.LBB28_138:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB28_103
.LBB28_139:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB28_47
.LBB28_140:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB28_50
.LBB28_141:
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB28_53
.LBB28_142:
	bl	__stack_chk_fail
.LBB28_143:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB28_144:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB28_145:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB28_148
// %bb.146:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB28_148
// %bb.147:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_get_new_data_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #2135
	add	x2, x2, :lo12:.L__func__.f2fs_get_new_data_page
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB28_148:
	ldr	x8, [x21, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 2135; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB28_149:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB28_150:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end28:
	.size	f2fs_get_new_data_page, .Lfunc_end28-f2fs_get_new_data_page
                                        // -- End function
	.globl	f2fs_get_dm_target_device_dio // -- Begin function f2fs_get_dm_target_device_dio
	.p2align	3
	.type	f2fs_get_dm_target_device_dio,@function
f2fs_get_dm_target_device_dio:          // @f2fs_get_dm_target_device_dio
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	ldr	w8, [x1, #4]
	mov	x29, sp
	str	x19, [sp, #16]          // 8-byte Folded Spill
	cmp	w8, #1                  // =1
	b.eq	.LBB29_3
// %bb.1:
	cmp	w8, #2                  // =2
	b.ne	.LBB29_4
// %bb.2:
	ldr	w19, [x1, #12]
	b	.LBB29_5
.LBB29_3:
	mov	w19, #1
	b	.LBB29_5
.LBB29_4:
	mov	w19, wzr
.LBB29_5:
	mov	w1, w19
	bl	f2fs_dev_has_enough_space
	mov	w8, #1
	tst	w0, #0x1
	sub	w8, w8, w19
	csel	w0, w19, w8, ne
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end29:
	.size	f2fs_get_dm_target_device_dio, .Lfunc_end29-f2fs_get_dm_target_device_dio
                                        // -- End function
	.globl	f2fs_dev_has_enough_space // -- Begin function f2fs_dev_has_enough_space
	.p2align	3
	.type	f2fs_dev_has_enough_space,@function
f2fs_dev_has_enough_space:              // @f2fs_dev_has_enough_space
// %bb.0:
	sub	sp, sp, #96             // =96
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	x19, x0
	mov	w20, w1
	str	x8, [sp, #8]
	ldr	w3, [x0, #3024]
	cmp	w3, #2                  // =2
	b.ne	.LBB30_19
// %bb.1:
	cmp	w20, #1                 // =1
	b.gt	.LBB30_19
// %bb.2:
	ldr	x8, [x19, #16]
	ldr	w8, [x8, #2180]
	tbz	w8, #16, .LBB30_19
// %bb.3:
	ldr	x8, [x19, #3032]
	ldp	w9, w10, [x8, #180]
	ldr	w11, [x8, #372]
	ldr	w12, [x8, #376]
	subs	w9, w9, w10
	ldr	w22, [x8, #168]
	csel	w21, wzr, w9, lo
	ldr	w24, [x8, #360]
	adrp	x8, __tracepoint_f2fs_dev_has_space
	subs	w9, w11, w12
	add	x8, x8, :lo12:__tracepoint_f2fs_dev_has_space
	csel	w23, wzr, w9, lo
	stp	w21, w23, [sp]
	ldr	w9, [x8, #8]
	cmp	w9, #0                  // =0
	b.le	.LBB30_10
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
	tbz	w9, #0, .LBB30_10
// %bb.5:
	//APP
	mrs x25, sp_el0
	//NO_APP
	ldr	w9, [x25, #80]
	add	w9, w9, #1              // =1
	str	w9, [x25, #80]
	//APP
	//NO_APP
	ldr	x26, [x8, #32]
	cbz	x26, .LBB30_8
// %bb.6:
	ldr	x8, [x26], #24
.LBB30_7:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x26, #-16]
	mov	w1, w20
	mov	w2, w21
	mov	w3, w23
	mov	w4, w22
	mov	w5, w24
	blr	x8
	ldr	x8, [x26], #24
	cbnz	x8, .LBB30_7
.LBB30_8:
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x25, #80]
	b.ne	.LBB30_10
// %bb.9:
	ldr	x8, [x25]
	tbnz	w8, #1, .LBB30_17
.LBB30_10:
	mov	x8, sp
	ldr	w9, [x8, w20, sxtw #2]
	lsr	w10, w9, #12
	cmp	w10, #124               // =124
	b.hi	.LBB30_12
// %bb.11:
	mov	w10, #1
	sub	w10, w10, w20
	ldr	w8, [x8, w10, sxtw #2]
	cmp	w9, w8
	b.lo	.LBB30_14
.LBB30_12:
	ldr	x8, [x19, #3032]
	mov	w9, #192
	sxtw	x10, w20
	madd	x8, x10, x9, x8
	ldp	w9, w8, [x8, #168]
	cmp	w9, w8
	b.ls	.LBB30_14
// %bb.13:
	mov	w0, #1
	b	.LBB30_15
.LBB30_14:
	mov	w0, wzr
.LBB30_15:
	adrp	x9, __stack_chk_guard
	ldr	x8, [sp, #8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB30_18
// %bb.16:
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #96             // =96
	ret
.LBB30_17:
	bl	preempt_schedule_notrace
	b	.LBB30_10
.LBB30_18:
	bl	__stack_chk_fail
.LBB30_19:
	adrp	x1, .L.str.4
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.4
	mov	w2, w20
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB30_22
// %bb.20:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB30_22
// %bb.21:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_dev_has_enough_space
	add	x1, x1, :lo12:.L.str
	mov	w3, #4466
	add	x2, x2, :lo12:.L__func__.f2fs_dev_has_enough_space
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB30_22:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 4466; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end30:
	.size	f2fs_dev_has_enough_space, .Lfunc_end30-f2fs_dev_has_enough_space
                                        // -- End function
	.globl	f2fs_preallocate_blocks // -- Begin function f2fs_preallocate_blocks
	.p2align	3
	.type	f2fs_preallocate_blocks,@function
f2fs_preallocate_blocks:                // @f2fs_preallocate_blocks
// %bb.0:
	sub	sp, sp, #192            // =192
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #112]    // 16-byte Folded Spill
	add	x29, sp, #112           // =112
	str	x25, [sp, #128]         // 8-byte Folded Spill
	stp	x24, x23, [sp, #144]    // 16-byte Folded Spill
	mov	w11, #11
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x22, x21, [sp, #160]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #176]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldp	x8, x9, [x0]
	ldr	x10, [x1, #16]
	ldr	w23, [x0, #32]
	ldr	x19, [x8, #32]
	add	x12, x9, #4095          // =4095
	add	x8, x10, x9
	lsr	x9, x12, #12
	lsr	x10, x8, #12
	str	w11, [sp, #40]
	subs	w10, w10, w9
	mov	w11, #1
	csel	w10, wzr, w10, lo
	stp	xzr, xzr, [sp, #24]
	strb	w11, [sp, #44]
	stp	w9, w10, [sp, #12]
	tbz	w23, #17, .LBB31_7
// %bb.1:
	mov	x21, x0
	ldrh	w0, [x0, #36]
	mov	x20, x1
	bl	f2fs_rw_hint_to_seg_type
	ldr	x8, [x19, #40]
	mov	x1, x20
	ldr	w24, [x20]
	str	w0, [sp, #40]
	mov	x0, x21
	ldr	x22, [x8, #1104]
	bl	fscrypt_dio_supported
	tbz	w0, #0, .LBB31_10
// %bb.2:
	ldr	x8, [x19, #640]
	cbnz	x8, .LBB31_10
// %bb.3:
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
	ldr	w9, [x8, #1532]
	cbz	w9, .LBB31_34
// %bb.4:
	ldr	w9, [x19, #1256]
	cbnz	w9, .LBB31_10
// %bb.5:
	ldr	x9, [x19, #712]
	tbnz	x9, #35, .LBB31_10
// %bb.6:
	ldr	x9, [x19, #712]
	tbnz	x9, #34, .LBB31_10
	b	.LBB31_36
.LBB31_7:
	ldr	w9, [x19, #1168]
	ldr	w10, [x19, #1160]
	mvn	w9, w9
	sub	w9, w9, w10, asr #2
	add	w9, w9, #923            // =923
	cmp	x8, w9, sxtw #2
	b.ls	.LBB31_9
// %bb.8:
	mov	x0, x19
	bl	f2fs_convert_inline_inode
	cbnz	w0, .LBB31_22
.LBB31_9:
	ldr	x8, [x19, #712]
	tbnz	w8, #10, .LBB31_21
.LBB31_10:
	mov	w3, #5
.LBB31_11:
	ldr	x8, [x19, #40]
	ldr	w24, [sp, #40]
	ldr	x21, [x8, #1104]
	add	w9, w24, #6             // =6
	cmp	w24, #3                 // =3
	csel	w25, w9, w24, lo
	ldr	w8, [x21, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB31_17
// %bb.12:
	cmp	w3, #4                  // =4
	b.ne	.LBB31_17
// %bb.13:
	ldr	x8, [x21, #16]
	ldr	w8, [x8, #2180]
	tbz	w8, #16, .LBB31_17
// %bb.14:
	ldr	w20, [sp, #16]
	add	x1, sp, #48             // =48
	mov	x0, x19
	mov	x2, x20
	bl	f2fs_dio_dm_control_init
	ldr	w8, [sp, #52]
	cmp	w8, #1                  // =1
	b.eq	.LBB31_24
// %bb.15:
	cmp	w8, #2                  // =2
	b.ne	.LBB31_25
// %bb.16:
	ldr	w22, [sp, #60]
	b	.LBB31_26
.LBB31_17:
	add	x1, sp, #8              // =8
	mov	x0, x19
	mov	w2, #1
	bl	f2fs_map_blocks
	ldr	w8, [sp, #16]
.LBB31_18:
	cmp	w8, #0                  // =0
	cset	w8, eq
	cmn	w0, #28                 // =28
	cset	w9, ne
	orr	w8, w9, w8
	cmp	w8, #0                  // =0
	csel	w0, w0, wzr, ne
	tbnz	w23, #17, .LBB31_22
// %bb.19:
	tbnz	w8, #0, .LBB31_22
// %bb.20:
	mov	w0, wzr
	add	x8, x19, #712           // =712
	mov	w9, #16777216
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	b	.LBB31_22
.LBB31_21:
	mov	w0, wzr
.LBB31_22:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB31_43
// %bb.23:
	ldp	x20, x19, [sp, #176]    // 16-byte Folded Reload
	ldr	x25, [sp, #128]         // 8-byte Folded Reload
	ldp	x22, x21, [sp, #160]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #144]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #112]    // 16-byte Folded Reload
	add	sp, sp, #192            // =192
	ret
.LBB31_24:
	mov	w22, #1
	b	.LBB31_26
.LBB31_25:
	mov	w22, wzr
.LBB31_26:
	mov	x0, x21
	mov	w1, w22
	and	w25, w25, #0xffff
	bl	f2fs_dev_has_enough_space
	mov	w21, #1
	tst	w0, #0x1
	sub	w8, w21, w22
	csel	w8, w22, w8, ne
	add	x22, sp, #48            // =48
.LBB31_27:                              // =>This Inner Loop Header: Depth=1
	ldr	w9, [sp, #52]
	str	w8, [sp, #60]
	cmp	w9, #2                  // =2
	b.ne	.LBB31_29
// %bb.28:                              //   in Loop: Header=BB31_27 Depth=1
	add	x9, x22, w8, uxtw #2
	ldr	w9, [x9, #24]
	cmp	w20, w9
	csel	w9, w20, w9, lo
	str	w9, [sp, #16]
.LBB31_29:                              //   in Loop: Header=BB31_27 Depth=1
	cmp	w8, #0                  // =0
	add	x1, sp, #8              // =8
	csel	w8, w24, w25, eq
	mov	x0, x19
	mov	w2, #1
	mov	w3, #4
	str	w8, [sp, #40]
	bl	f2fs_map_blocks
	ldr	w8, [sp, #16]
	cbnz	w0, .LBB31_32
// %bb.30:                              //   in Loop: Header=BB31_27 Depth=1
	ldr	w9, [sp, #12]
	subs	w20, w20, w8
	add	w9, w9, w8
	str	w9, [sp, #12]
	b.eq	.LBB31_33
// %bb.31:                              //   in Loop: Header=BB31_27 Depth=1
	ldr	w8, [sp, #60]
	sub	w8, w21, w8
	b	.LBB31_27
.LBB31_32:
	cmp	w8, #0                  // =0
	mov	w9, #-28
	ccmp	w0, w9, #0, ne
	csel	w0, wzr, w0, eq
	b	.LBB31_18
.LBB31_33:
	mov	w0, wzr
	b	.LBB31_18
.LBB31_34:
	ldrh	w9, [x19]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB31_36
// %bb.35:
	ldr	x9, [x19, #712]
	tbnz	w9, #31, .LBB31_10
.LBB31_36:
	ldr	x9, [x22, #16]
	ldrb	w9, [x9, #2180]
	tbnz	w9, #1, .LBB31_10
// %bb.37:
	tbz	w24, #0, .LBB31_42
// %bb.38:
	ldr	w9, [x22, #1504]
	cmp	w9, #1                  // =1
	b.ne	.LBB31_42
// %bb.39:
	ldrb	w8, [x19, #142]
	mov	x0, x20
	ldr	w21, [x21, #8]
	mov	w9, #-1
	lsl	w24, w9, w8
	bl	iov_iter_alignment
	orr	w8, w0, w21
	bics	wzr, w8, w24
	b.ne	.LBB31_10
// %bb.40:
	ldr	w8, [x22, #1432]
	mov	w9, #1
	lsl	w8, w9, w8
	cmp	w8, #1                  // =1
	b.gt	.LBB31_10
// %bb.41:
	ldr	x8, [x19, #40]
	ldr	x8, [x8, #1104]
.LBB31_42:
	ldr	x8, [x8, #80]
	tst	x8, #0x100
	mov	w8, #4
	cinc	w3, w8, ne
	b	.LBB31_11
.LBB31_43:
	bl	__stack_chk_fail
.Lfunc_end31:
	.size	f2fs_preallocate_blocks, .Lfunc_end31-f2fs_preallocate_blocks
                                        // -- End function
	.globl	__do_map_lock           // -- Begin function __do_map_lock
	.p2align	3
	.type	__do_map_lock,@function
__do_map_lock:                          // @__do_map_lock
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	cmp	w1, #5                  // =5
	str	x21, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	b.ne	.LBB32_9
// %bb.1:
	tbz	w2, #0, .LBB32_13
// %bb.2:
	ldr	x8, [x19, #352]
	cbnz	x8, .LBB32_6
// %bb.3:
	add	x20, x19, #424          // =424
.LBB32_4:                               // =>This Inner Loop Header: Depth=1
	mov	x0, x20
	bl	down_read
	ldr	x8, [x19, #352]
	cbz	x8, .LBB32_19
// %bb.5:                               //   in Loop: Header=BB32_4 Depth=1
	mov	x0, x20
	bl	up_read
	ldr	x8, [x19, #352]
	cbz	x8, .LBB32_4
.LBB32_6:
	add	x20, x19, #368          // =368
	mov	x0, x20
	bl	_raw_spin_lock
	ldr	x8, [x19, #352]
	cbz	x8, .LBB32_12
// %bb.7:
	adrp	x21, jiffies
	ldr	x8, [x19, #360]
	ldr	x9, [x21, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.pl	.LBB32_12
// %bb.8:
	//APP
	mrs x0, sp_el0
	//NO_APP
	b	.LBB32_21
.LBB32_9:
	tbz	w2, #0, .LBB32_15
// %bb.10:
	add	x20, x19, #368          // =368
	mov	x0, x20
	bl	_raw_spin_lock
	ldr	x8, [x19, #352]
	cbz	x8, .LBB32_12
// %bb.11:
	adrp	x21, jiffies
	ldr	x8, [x19, #360]
	ldr	x9, [x21, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB32_20
.LBB32_12:
	mov	x0, x20
	bl	_raw_spin_unlock
	add	x0, x19, #304           // =304
	bl	down_read
	b	.LBB32_17
.LBB32_13:
	tbz	w3, #0, .LBB32_15
// %bb.14:
	add	x0, x19, #424           // =424
	b	.LBB32_16
.LBB32_15:
	add	x0, x19, #304           // =304
.LBB32_16:
	bl	up_read
.LBB32_17:
	mov	w0, wzr
.LBB32_18:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB32_19:
	mov	w0, #1
	b	.LBB32_18
.LBB32_20:
	//APP
	mrs x0, sp_el0
	//NO_APP
.LBB32_21:
	mov	x1, xzr
	bl	show_stack
	ldr	x1, [x19, #360]
	adrp	x0, .L.str.18
	ldr	x2, [x21, :lo12:jiffies]
	add	x0, x0, :lo12:.L.str.18
	bl	printk
	ldr	x0, [x19, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB32_12
.Lfunc_end32:
	.size	__do_map_lock, .Lfunc_end32-__do_map_lock
                                        // -- End function
	.globl	f2fs_map_blocks         // -- Begin function f2fs_map_blocks
	.p2align	3
	.type	f2fs_map_blocks,@function
f2fs_map_blocks:                        // @f2fs_map_blocks
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
	stur	w2, [x29, #-84]         // 4-byte Folded Spill
	stur	x8, [x29, #-16]
	ldr	x8, [x0, #40]
	ldr	w23, [x1, #8]
	ldrb	w28, [x1, #36]
	stur	wzr, [x29, #-72]
	ldr	x8, [x8, #1104]
	stur	xzr, [x29, #-80]
	cbz	w23, .LBB33_4
// %bb.1:
	mov	w24, w3
	mov	x22, x0
	mov	x19, x1
	str	x8, [sp, #80]           // 8-byte Folded Spill
	cbz	w3, .LBB33_3
// %bb.2:
	ldr	x8, [x22, #712]
	tbnz	x8, #43, .LBB33_5
.LBB33_3:
	mov	x27, xzr
	str	xzr, [sp, #32]          // 8-byte Folded Spill
	b	.LBB33_14
.LBB33_4:
	mov	w25, wzr
	b	.LBB33_250
.LBB33_5:
	ldr	x8, [x22, #712]
	tbz	x8, #43, .LBB33_7
// %bb.6:
	ldr	x8, [x22, #712]
	tbnz	x8, #44, .LBB33_3
.LBB33_7:
	ldur	w8, [x29, #-84]         // 4-byte Folded Reload
	cbnz	w8, .LBB33_27
// %bb.8:
	add	x21, x22, #720          // =720
	mov	x0, x21
	bl	down_read
	ldr	x8, [x22, #712]
	tbnz	x8, #43, .LBB33_10
.LBB33_9:
	mov	x27, xzr
	b	.LBB33_13
.LBB33_10:
	ldr	x8, [x22, #712]
	tbz	x8, #43, .LBB33_12
// %bb.11:
	ldr	x8, [x22, #712]
	tbnz	x8, #44, .LBB33_9
.LBB33_12:
	ldr	x0, [x22, #1280]
	bl	igrab
	mov	x27, x0
.LBB33_13:
	mov	x0, x21
	bl	up_read
	cmp	x27, #0                 // =0
	csel	x8, x22, xzr, ne
	csel	x22, x27, x22, ne
	str	x8, [sp, #32]           // 8-byte Folded Spill
.LBB33_14:
	cmp	w23, #31                // =31
	mov	w9, #2
	cset	w8, gt
	cmp	w23, #255               // =255
	csel	w8, w9, w8, gt
	ldr	w20, [x19, #4]
	str	xzr, [x19, #8]
	str	x27, [sp, #40]          // 8-byte Folded Spill
	str	w8, [sp, #72]           // 4-byte Folded Spill
	ldur	w8, [x29, #-84]         // 4-byte Folded Reload
	str	x23, [sp, #8]           // 8-byte Folded Spill
	str	w28, [sp, #4]           // 4-byte Folded Spill
	cbnz	w8, .LBB33_20
// %bb.15:
	sub	x2, x29, #80            // =80
	mov	x0, x22
	mov	x1, x20
	bl	f2fs_lookup_extent_cache
	tbz	w0, #0, .LBB33_20
// %bb.16:
	ldr	x12, [sp, #80]          // 8-byte Folded Reload
	cmp	w24, #3                 // =3
	b.ne	.LBB33_22
// %bb.17:
	ldr	w8, [x12, #1504]
	cmp	w8, #1                  // =1
	b.ne	.LBB33_22
// %bb.18:
	ldrb	w8, [x19, #36]
	cbz	w8, .LBB33_22
// %bb.19:
	mov	w8, #1
	str	wzr, [sp, #68]          // 4-byte Folded Spill
	str	x20, [sp, #24]          // 8-byte Folded Spill
	str	w8, [sp, #88]           // 4-byte Folded Spill
	b	.LBB33_32
.LBB33_20:
	mov	w8, wzr
	mov	w9, #1
	str	wzr, [sp, #68]          // 4-byte Folded Spill
	str	x20, [sp, #24]          // 8-byte Folded Spill
	str	w9, [sp, #88]           // 4-byte Folded Spill
.LBB33_21:
	str	w8, [sp, #20]           // 4-byte Folded Spill
	ldrb	w8, [x19, #36]
	b	.LBB33_31
.LBB33_22:
	ldp	w8, w9, [x29, #-80]
	mov	w11, #32
	ldur	w10, [x29, #-72]
	add	w9, w9, w8
	sub	x9, x9, x20
	add	w10, w10, w20
	cmp	x9, x23
	sub	w10, w10, w8
	ldr	x8, [x19, #24]
	csel	x9, x23, x9, hi
	str	w10, [x19]
	stp	w9, w11, [x19, #8]
	cbz	x8, .LBB33_24
// %bb.23:
	add	x9, x9, x20
	str	x9, [x8]
.LBB33_24:
	cmp	w24, #3                 // =3
	b.ne	.LBB33_26
// %bb.25:
	ldr	w1, [x19]
	mov	x0, x22
	ldr	w2, [x19, #8]
	mov	x20, x12
	bl	f2fs_wait_on_block_writeback_range
	ldr	x8, [x20, #248]
	ldr	w1, [x19]
	ldr	w9, [x19, #8]
	ldr	x0, [x8, #48]
	add	w8, w1, w9
	sub	w2, w8, #1              // =1
	bl	invalidate_mapping_pages
.LBB33_26:
	ldr	x24, [sp, #32]          // 8-byte Folded Reload
	mov	w25, wzr
	b	.LBB33_210
.LBB33_27:
	ldr	x2, [x22, #64]
	adrp	x1, .L.str.1
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	add	x1, x1, :lo12:.L.str.1
	bl	f2fs_printk
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB33_30
// %bb.28:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB33_30
// %bb.29:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_map_blocks
	add	x1, x1, :lo12:.L.str
	mov	w3, #2465
	add	x2, x2, :lo12:.L__func__.f2fs_map_blocks
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB33_30:
	ldr	x19, [sp, #80]          // 8-byte Folded Reload
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 2465; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB33_31:
	mov	x25, x20
	tst	w8, #0xff
	b.eq	.LBB33_33
.LBB33_32:
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	mov	w1, w24
	mov	w2, #1
	mov	w3, wzr
	bl	__do_map_lock
	mov	x25, x20
	and	w8, w0, #0x1
	str	w8, [sp, #20]           // 4-byte Folded Spill
.LBB33_33:
	sub	x0, x29, #64            // =64
	mov	w1, wzr
	mov	w2, #48
	eor	w21, w28, #0x1
	sub	x20, x29, #64           // =64
	bl	memset
	sub	x0, x29, #64            // =64
	mov	x1, x25
	mov	w2, w21
	stp	x22, xzr, [x29, #-64]
	stur	xzr, [x29, #-48]
	stur	wzr, [x29, #-40]
	str	x25, [sp, #56]          // 8-byte Folded Spill
	bl	f2fs_get_dnode_of_data
	cbnz	w0, .LBB33_228
// %bb.34:
	ldur	x9, [x29, #-48]
	ldur	w11, [x29, #-36]
	lsl	x8, x9, #6
	orr	x8, x8, #0xffffffc000000000
	str	w11, [sp, #64]          // 4-byte Folded Spill
	ldr	w10, [x8, #4072]
	ldr	w8, [x8, #4076]
	cmp	w10, w8
	b.ne	.LBB33_38
// %bb.35:
	ldr	w8, [x22, #1160]
	ldr	w10, [x22, #1168]
	ldrh	w11, [x22]
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	add	w8, w10, w8, asr #2
	mov	w10, #923
	sub	w26, w10, w8
	and	w8, w11, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB33_42
// %bb.36:
	ldr	x8, [x22, #712]
	tbz	w8, #31, .LBB33_42
// %bb.37:
	ldr	w8, [x22, #1268]
	neg	w8, w8
	and	w26, w26, w8
	b	.LBB33_42
.LBB33_38:
	ldrh	w8, [x22]
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB33_41
// %bb.39:
	ldr	x8, [x22, #712]
	mov	w26, #1018
	tbz	w8, #31, .LBB33_42
// %bb.40:
	ldr	w8, [x22, #1268]
	neg	w8, w8
	and	w26, w8, w26
	b	.LBB33_42
.LBB33_41:
	mov	w26, #1018
.LBB33_42:
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	mov	x28, xzr
	mov	w25, #-117
	add	x27, x8, x23
	add	x8, x20, #8             // =8
	ldr	w23, [sp, #64]          // 4-byte Folded Reload
	ldr	x20, [sp, #56]          // 8-byte Folded Reload
	str	x8, [sp, #48]           // 8-byte Folded Spill
	sub	w8, w24, #3             // =3
	str	w8, [sp, #76]           // 4-byte Folded Spill
	mov	w8, w23
.LBB33_43:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB33_74 Depth 2
                                        //     Child Loop BB33_84 Depth 2
                                        //     Child Loop BB33_108 Depth 2
	lsl	x9, x9, #6
	orr	x9, x9, #0xffffffc000000000
	ldr	w10, [x9, #4072]
	ldr	w11, [x9, #4076]
	cmp	w10, w11
	b.ne	.LBB33_48
// %bb.44:                              //   in Loop: Header=BB33_43 Depth=1
	ldur	x12, [x29, #-64]
	cbz	x12, .LBB33_47
// %bb.45:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	x13, [x12, #712]
	tbz	w13, #26, .LBB33_48
// %bb.46:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w12, [x12, #1160]
	asr	w12, w12, #2
	b	.LBB33_49
.LBB33_47:                              //   in Loop: Header=BB33_43 Depth=1
	ldrb	w12, [x9, #3]
	tbnz	w12, #5, .LBB33_116
.LBB33_48:                              //   in Loop: Header=BB33_43 Depth=1
	mov	w12, wzr
.LBB33_49:                              //   in Loop: Header=BB33_43 Depth=1
	add	x13, x9, #360           // =360
	cmp	w10, w11
	csel	x9, x13, x9, eq
	add	w8, w12, w8
	ldr	w21, [x9, w8, uxtw #2]
	add	w8, w21, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB33_70
.LBB33_50:                              //   in Loop: Header=BB33_43 Depth=1
	ldur	w8, [x29, #-84]         // 4-byte Folded Reload
	cbz	w8, .LBB33_54
// %bb.51:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	x8, [x14, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB33_236
// %bb.52:                              //   in Loop: Header=BB33_43 Depth=1
	cmp	w24, #5                 // =5
	b.ne	.LBB33_59
// %bb.53:                              //   in Loop: Header=BB33_43 Depth=1
	ldur	w8, [x29, #-36]
	cmp	w21, #0                 // =0
	cinc	x28, x28, eq
	csel	w23, w8, w23, eq
	b	.LBB33_62
.LBB33_54:                              //   in Loop: Header=BB33_43 Depth=1
	cmp	w24, #6                 // =6
	b.eq	.LBB33_166
// %bb.55:                              //   in Loop: Header=BB33_43 Depth=1
	cmp	w24, #2                 // =2
	b.eq	.LBB33_165
// %bb.56:                              //   in Loop: Header=BB33_43 Depth=1
	cmp	w24, #1                 // =1
	b.ne	.LBB33_58
// %bb.57:                              //   in Loop: Header=BB33_43 Depth=1
	cbz	w21, .LBB33_139
.LBB33_58:                              //   in Loop: Header=BB33_43 Depth=1
	cmp	w24, #1                 // =1
	b.eq	.LBB33_93
	b	.LBB33_141
.LBB33_59:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w8, [sp, #76]           // 4-byte Folded Reload
	cmp	w8, #2                  // =2
	b.hs	.LBB33_117
.LBB33_60:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w1, [x19, #32]
	sub	x0, x29, #64            // =64
	ldr	w2, [sp, #72]           // 4-byte Folded Reload
	bl	__allocate_data_block
	cbnz	w0, .LBB33_148
// %bb.61:                              //   in Loop: Header=BB33_43 Depth=1
	add	x8, x22, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4096
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
.LBB33_62:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w8, [x19, #12]
	ldur	w21, [x29, #-28]
	orr	w8, w8, #0x40
	str	w8, [x19, #12]
.LBB33_63:                              //   in Loop: Header=BB33_43 Depth=1
	cmp	w24, #5                 // =5
	b.ne	.LBB33_93
// %bb.64:                              //   in Loop: Header=BB33_43 Depth=1
	ldur	w8, [x29, #-36]
	add	x20, x20, #1            // =1
	cmp	x20, x27
	add	w8, w8, #1              // =1
	stur	w8, [x29, #-36]
	b.eq	.LBB33_66
// %bb.65:                              //   in Loop: Header=BB33_43 Depth=1
	cmp	w8, w26
	b.ne	.LBB33_113
.LBB33_66:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w21, [sp, #64]          // 4-byte Folded Reload
	sub	x0, x29, #64            // =64
	mov	x1, x28
	stur	w21, [x29, #-36]
	bl	f2fs_reserve_new_blocks
	cbnz	w0, .LBB33_223
// %bb.67:                              //   in Loop: Header=BB33_43 Depth=1
	ldur	w8, [x29, #-36]
	ldr	w9, [x19, #8]
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	sub	w10, w8, w21
	add	w9, w10, w9
	str	w9, [x19, #8]
	cbz	x28, .LBB33_69
// %bb.68:                              //   in Loop: Header=BB33_43 Depth=1
	add	w9, w23, #1             // =1
	cmp	w8, w9
	b.ne	.LBB33_224
.LBB33_69:                              //   in Loop: Header=BB33_43 Depth=1
	mov	w8, w26
	stur	w26, [x29, #-36]
	b	.LBB33_113
.LBB33_70:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w9, [x14, #3024]
	cbz	w9, .LBB33_78
// %bb.71:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	x8, [x14]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB33_77
// %bb.72:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	x11, [x14, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB33_74
.LBB33_73:                              //   in Loop: Header=BB33_74 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB33_77
.LBB33_74:                              //   Parent Loop BB33_43 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w21
	b.hi	.LBB33_73
// %bb.75:                              //   in Loop: Header=BB33_74 Depth=2
	ldr	w12, [x11]
	cmp	w12, w21
	b.lo	.LBB33_73
// %bb.76:                              //   in Loop: Header=BB33_43 Depth=1
	ldur	x8, [x11, #-80]
.LBB33_77:                              //   in Loop: Header=BB33_43 Depth=1
	cbz	x8, .LBB33_79
.LBB33_78:                              //   in Loop: Header=BB33_43 Depth=1
	mov	x0, x14
	mov	w1, w21
	mov	w2, #6
	bl	f2fs_is_valid_blkaddr
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	tbz	w0, #0, .LBB33_144
.LBB33_79:                              //   in Loop: Header=BB33_43 Depth=1
	add	w8, w21, #3             // =3
	cmp	w8, #4                  // =4
	b.lo	.LBB33_50
// %bb.80:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w9, [x14, #3024]
	cbz	w9, .LBB33_88
// %bb.81:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	x8, [x14]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB33_87
// %bb.82:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	x11, [x14, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB33_84
.LBB33_83:                              //   in Loop: Header=BB33_84 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB33_87
.LBB33_84:                              //   Parent Loop BB33_43 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w21
	b.hi	.LBB33_83
// %bb.85:                              //   in Loop: Header=BB33_84 Depth=2
	ldr	w12, [x11]
	cmp	w12, w21
	b.lo	.LBB33_83
// %bb.86:                              //   in Loop: Header=BB33_43 Depth=1
	ldur	x8, [x11, #-80]
.LBB33_87:                              //   in Loop: Header=BB33_43 Depth=1
	cbz	x8, .LBB33_50
.LBB33_88:                              //   in Loop: Header=BB33_43 Depth=1
	cmp	w24, #3                 // =3
	b.ne	.LBB33_63
// %bb.89:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w8, [x14, #1504]
	cmp	w8, #1                  // =1
	b.ne	.LBB33_63
// %bb.90:                              //   in Loop: Header=BB33_43 Depth=1
	ldrb	w8, [x19, #36]
	cbz	w8, .LBB33_93
// %bb.91:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w1, [x19, #32]
	sub	x0, x29, #64            // =64
	ldr	w2, [sp, #72]           // 4-byte Folded Reload
	bl	__allocate_data_block
	cbnz	w0, .LBB33_237
// %bb.92:                              //   in Loop: Header=BB33_43 Depth=1
	add	x8, x22, #712           // =712
	ldur	w21, [x29, #-28]
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4096
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
.LBB33_93:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w8, [x19, #8]
	cbz	w8, .LBB33_101
// %bb.94:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w9, [x19]
	cmn	w9, #1                  // =1
	b.eq	.LBB33_98
// %bb.95:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w10, [sp, #88]          // 4-byte Folded Reload
	add	w10, w9, w10
	cmp	w21, w10
	b.ne	.LBB33_98
// %bb.96:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w10, [sp, #68]          // 4-byte Folded Reload
	cmp	w21, w10
	b.ls	.LBB33_100
// %bb.97:                              //   in Loop: Header=BB33_43 Depth=1
	ldr	w10, [x14, #3024]
	cbz	w10, .LBB33_100
.LBB33_98:                              //   in Loop: Header=BB33_43 Depth=1
	cmp	w24, #4                 // =4
	b.eq	.LBB33_100
// %bb.99:                              //   in Loop: Header=BB33_43 Depth=1
	and	w9, w9, w21
	cmn	w9, #1                  // =1
	b.ne	.LBB33_143
.LBB33_100:                             //   in Loop: Header=BB33_43 Depth=1
	ldr	w9, [sp, #88]           // 4-byte Folded Reload
	add	w8, w8, #1              // =1
	str	w8, [x19, #8]
	add	w9, w9, #1              // =1
	str	w9, [sp, #88]           // 4-byte Folded Spill
	b	.LBB33_112
.LBB33_101:                             //   in Loop: Header=BB33_43 Depth=1
	ldr	w8, [x19, #12]
	cmn	w21, #1                 // =1
	b.ne	.LBB33_103
// %bb.102:                             //   in Loop: Header=BB33_43 Depth=1
	orr	w8, w8, #0x1000
	str	w8, [x19, #12]
.LBB33_103:                             //   in Loop: Header=BB33_43 Depth=1
	orr	w8, w8, #0x20
	add	w9, w21, #1             // =1
	cmp	w9, #2                  // =2
	str	w21, [x19]
	str	w8, [x19, #12]
	mov	w8, #1
	str	w8, [x19, #8]
	b.lo	.LBB33_112
// %bb.104:                             //   in Loop: Header=BB33_43 Depth=1
	ldr	w9, [x14, #3024]
	cbz	w9, .LBB33_112
// %bb.105:                             //   in Loop: Header=BB33_43 Depth=1
	ldr	x8, [x14, #3032]
	cmp	w9, #2                  // =2
	b.lt	.LBB33_110
// %bb.106:                             //   in Loop: Header=BB33_43 Depth=1
	mov	x10, xzr
	add	x11, x8, #80            // =80
	b	.LBB33_108
.LBB33_107:                             //   in Loop: Header=BB33_108 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB33_110
.LBB33_108:                             //   Parent Loop BB33_43 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w21
	b.hi	.LBB33_107
// %bb.109:                             //   in Loop: Header=BB33_108 Depth=2
	ldr	w12, [x11]
	cmp	w12, w21
	b.lo	.LBB33_107
	b	.LBB33_111
.LBB33_110:                             //   in Loop: Header=BB33_43 Depth=1
	mov	x10, xzr
.LBB33_111:                             //   in Loop: Header=BB33_43 Depth=1
	mov	w9, #192
	smaddl	x8, w10, w9, x8
	ldr	w8, [x8, #80]
	str	w8, [sp, #68]           // 4-byte Folded Spill
.LBB33_112:                             //   in Loop: Header=BB33_43 Depth=1
	ldur	w8, [x29, #-36]
	add	x20, x20, #1            // =1
	add	w8, w8, #1              // =1
	stur	w8, [x29, #-36]
.LBB33_113:                             //   in Loop: Header=BB33_43 Depth=1
	cmp	x20, x27
	b.hs	.LBB33_143
// %bb.114:                             //   in Loop: Header=BB33_43 Depth=1
	cmp	w8, w26
	b.hs	.LBB33_118
// %bb.115:                             //   in Loop: Header=BB33_43 Depth=1
	ldur	x9, [x29, #-48]
	b	.LBB33_43
.LBB33_116:                             //   in Loop: Header=BB33_43 Depth=1
	ldrh	w12, [x9, #360]
	lsr	w12, w12, #2
	b	.LBB33_49
.LBB33_117:                             //   in Loop: Header=BB33_43 Depth=1
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	printk
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 2571; .short (1 << 0)|(((9) << 8)); .popsection; 14471: brk 0x800
	//NO_APP
	b	.LBB33_60
.LBB33_118:
	cmp	w24, #6                 // =6
	b.ne	.LBB33_121
// %bb.119:
	ldrb	w8, [x19, #12]
	tbz	w8, #5, .LBB33_121
// %bb.120:
	ldp	w9, w8, [x19]
	sub	x0, x29, #64            // =64
	ldr	x11, [sp, #56]          // 8-byte Folded Reload
	ldr	w10, [x19, #8]
	sub	w8, w11, w8
	and	x1, x11, #0xffffffff
	add	w2, w9, w8
	sub	w3, w10, w8
	bl	f2fs_update_extent_cache_range
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
.LBB33_121:
	ldur	x21, [x29, #-48]
	ldr	x27, [sp, #40]          // 8-byte Folded Reload
	ldr	x23, [sp, #8]           // 8-byte Folded Reload
	ldr	w28, [sp, #4]           // 4-byte Folded Reload
	cbz	x21, .LBB33_157
// %bb.122:
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
	b.ne	.LBB33_149
// %bb.123:
	tbnz	w8, #0, .LBB33_137
// %bb.124:
	bl	print_bdev_access_info
	adrp	x23, f2fs_dclient
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB33_127
// %bb.125:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB33_127
// %bb.126:
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB33_127:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB33_129
// %bb.128:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB33_256
.LBB33_129:
	ldr	x0, [x21, #24]
.LBB33_130:
	ldr	x8, [x0]
	ldr	x23, [sp, #8]           // 8-byte Folded Reload
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB33_132
// %bb.131:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB33_257
.LBB33_132:
	ldr	x0, [x21, #24]
.LBB33_133:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB33_135
// %bb.134:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB33_258
.LBB33_135:
	ldr	x0, [x21, #24]
.LBB33_136:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB33_137:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB33_155
// %bb.138:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB33_139:
	ldr	x8, [x19, #16]
	ldr	x27, [sp, #40]          // 8-byte Folded Reload
	cbz	x8, .LBB33_227
// %bb.140:
	add	x9, x20, #1             // =1
	mov	w25, wzr
	b	.LBB33_171
.LBB33_141:
	ldr	x8, [x19, #16]
	cbz	x8, .LBB33_143
// %bb.142:
	add	x9, x20, #1             // =1
	mov	w25, wzr
	str	x9, [x8]
	b	.LBB33_144
.LBB33_143:
	mov	w25, wzr
.LBB33_144:
	ldr	x27, [sp, #40]          // 8-byte Folded Reload
	cmp	w24, #6                 // =6
	b.eq	.LBB33_167
.LBB33_145:
	cmp	w24, #3                 // =3
	b.ne	.LBB33_172
// %bb.146:
	ldrb	w8, [x19, #12]
	tbz	w8, #5, .LBB33_172
.LBB33_147:
	ldr	w1, [x19]
	mov	x0, x22
	ldr	w2, [x19, #8]
	bl	f2fs_wait_on_block_writeback_range
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	ldr	w1, [x19]
	ldr	w9, [x19, #8]
	ldr	x8, [x8, #248]
	ldr	x0, [x8, #48]
	add	w8, w1, w9
	sub	w2, w8, #1              // =1
	bl	invalidate_mapping_pages
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	b	.LBB33_172
.LBB33_148:
	ldr	x27, [sp, #40]          // 8-byte Folded Reload
	mov	w25, w0
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	cmp	w24, #6                 // =6
	b.ne	.LBB33_145
	b	.LBB33_167
.LBB33_149:
	tbnz	w8, #0, .LBB33_154
// %bb.150:
	bl	print_bdev_access_info
	adrp	x23, f2fs_dclient
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB33_153
// %bb.151:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB33_153
// %bb.152:
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB33_153:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
	ldr	x23, [sp, #8]           // 8-byte Folded Reload
.LBB33_154:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB33_261
.LBB33_155:
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
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	cbnz	w9, .LBB33_157
// %bb.156:
	bl	__put_page
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
.LBB33_157:
	ldur	x8, [x29, #-56]
	cbz	x8, .LBB33_161
// %bb.158:
	ldur	x9, [x29, #-48]
	cmp	x9, x8
	b.eq	.LBB33_161
// %bb.159:
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
	cbnz	w9, .LBB33_161
// %bb.160:
	bl	__put_page
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
.LBB33_161:
	ldrb	w8, [x19, #36]
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	stp	xzr, xzr, [x9]
	cbz	w8, .LBB33_31
// %bb.162:
	cmp	w24, #5                 // =5
	b.ne	.LBB33_164
// %bb.163:
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	tbnz	w8, #0, .LBB33_225
.LBB33_164:
	add	x0, x14, #304           // =304
	b	.LBB33_226
.LBB33_165:
	ldr	x27, [sp, #40]          // 8-byte Folded Reload
	mov	w25, wzr
	str	wzr, [x19]
	b	.LBB33_172
.LBB33_166:
	ldr	x27, [sp, #40]          // 8-byte Folded Reload
	mov	w25, wzr
.LBB33_167:
	ldrb	w8, [x19, #12]
	tbz	w8, #5, .LBB33_169
// %bb.168:
	ldp	w9, w8, [x19]
	sub	x0, x29, #64            // =64
	ldr	x11, [sp, #56]          // 8-byte Folded Reload
	ldr	w10, [x19, #8]
	sub	w8, w11, w8
	and	x1, x11, #0xffffffff
	add	w2, w9, w8
	sub	w3, w10, w8
	bl	f2fs_update_extent_cache_range
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
.LBB33_169:
	ldr	x8, [x19, #24]
	cbz	x8, .LBB33_172
// %bb.170:
	add	x9, x20, #1             // =1
.LBB33_171:
	str	x9, [x8]
.LBB33_172:
	ldur	x21, [x29, #-48]
	cbz	x21, .LBB33_198
// %bb.173:
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
	b.ne	.LBB33_190
// %bb.174:
	tbnz	w8, #0, .LBB33_188
// %bb.175:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB33_178
// %bb.176:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB33_178
// %bb.177:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB33_178:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB33_180
// %bb.179:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB33_253
.LBB33_180:
	ldr	x0, [x21, #24]
.LBB33_181:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB33_183
// %bb.182:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB33_254
.LBB33_183:
	ldr	x0, [x21, #24]
.LBB33_184:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB33_186
// %bb.185:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB33_255
.LBB33_186:
	ldr	x0, [x21, #24]
.LBB33_187:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB33_188:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB33_196
// %bb.189:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB33_190:
	tbnz	w8, #0, .LBB33_195
// %bb.191:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB33_194
// %bb.192:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB33_194
// %bb.193:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB33_194:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB33_195:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB33_262
.LBB33_196:
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
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	cbnz	w9, .LBB33_198
// %bb.197:
	bl	__put_page
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
.LBB33_198:
	ldur	x8, [x29, #-56]
	cbz	x8, .LBB33_202
// %bb.199:
	ldur	x9, [x29, #-48]
	cmp	x9, x8
	b.eq	.LBB33_202
// %bb.200:
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
	cbnz	w9, .LBB33_202
// %bb.201:
	bl	__put_page
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
.LBB33_202:
	ldr	x8, [sp, #48]           // 8-byte Folded Reload
	stp	xzr, xzr, [x8]
.LBB33_203:
	ldrb	w8, [x19, #36]
	cbz	w8, .LBB33_207
// %bb.204:
	cmp	w24, #5                 // =5
	b.ne	.LBB33_206
// %bb.205:
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	tbnz	w8, #0, .LBB33_208
.LBB33_206:
	add	x0, x14, #304           // =304
	b	.LBB33_209
.LBB33_207:
	ldr	x24, [sp, #32]          // 8-byte Folded Reload
	b	.LBB33_210
.LBB33_208:
	add	x0, x14, #424           // =424
.LBB33_209:
	ldr	x24, [sp, #32]          // 8-byte Folded Reload
	mov	x20, x14
	bl	up_read
	ldurb	w1, [x29, #-31]
	mov	x0, x20
	bl	f2fs_balance_fs
.LBB33_210:
	adrp	x21, cpu_number
	adrp	x20, __cpu_online_mask
	add	x21, x21, :lo12:cpu_number
	add	x20, x20, :lo12:__cpu_online_mask
	cbz	x27, .LBB33_243
// %bb.211:
	adrp	x8, __tracepoint_f2fs_dedup_map_blocks
	add	x8, x8, :lo12:__tracepoint_f2fs_dedup_map_blocks
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB33_218
// %bb.212:
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
	ldr	w9, [x9, x21]
	add	w10, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w10, w10, w9, lt
	asr	w10, w10, #6
	ldr	x10, [x20, w10, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB33_218
// %bb.213:
	//APP
	mrs x22, sp_el0
	//NO_APP
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x23, [x8, #32]
	cbz	x23, .LBB33_216
// %bb.214:
	ldr	x8, [x23], #24
.LBB33_215:                             // =>This Inner Loop Header: Depth=1
	ldur	x0, [x23, #-16]
	mov	x1, x24
	mov	x2, x27
	blr	x8
	ldr	x8, [x23], #24
	cbnz	x8, .LBB33_215
.LBB33_216:
	//APP
	//NO_APP
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB33_218
// %bb.217:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB33_238
.LBB33_218:
	ldr	x8, [x27, #712]
	tbnz	x8, #43, .LBB33_239
.LBB33_219:
	bl	print_bdev_access_info
	adrp	x22, f2fs_dclient
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB33_222
// %bb.220:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB33_222
// %bb.221:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.put_inner_inode
	add	x1, x1, :lo12:.L.str
	mov	w3, #4511
	add	x2, x2, :lo12:.L__func__.put_inner_inode
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB33_222:
	ldr	x8, [x27, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x27, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x27, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	b	.LBB33_240
.LBB33_223:
	ldr	x27, [sp, #40]          // 8-byte Folded Reload
	mov	w25, w0
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	b	.LBB33_172
.LBB33_224:
	ldr	x27, [sp, #40]          // 8-byte Folded Reload
	mov	w25, #-28
	b	.LBB33_172
.LBB33_225:
	add	x0, x14, #424           // =424
.LBB33_226:
	mov	x21, x14
	bl	up_read
	ldurb	w1, [x29, #-31]
	mov	x0, x21
	bl	f2fs_balance_fs
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	b	.LBB33_21
.LBB33_227:
	mov	w25, wzr
	b	.LBB33_172
.LBB33_228:
	mov	w25, w0
	cmp	w24, #2                 // =2
	b.ne	.LBB33_230
// %bb.229:
	str	wzr, [x19]
.LBB33_230:
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	cmn	w25, #2                 // =2
	b.ne	.LBB33_203
// %bb.231:
	ldr	x8, [x19, #16]
	ldr	x20, [sp, #56]          // 8-byte Folded Reload
	cbz	x8, .LBB33_233
// %bb.232:
	sub	x0, x29, #64            // =64
	mov	x1, x20
	bl	f2fs_get_next_page_offset
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	ldr	x8, [x19, #16]
	str	x0, [x8]
.LBB33_233:
	ldr	x8, [x19, #24]
	cbz	x8, .LBB33_235
// %bb.234:
	sub	x0, x29, #64            // =64
	mov	x1, x20
	bl	f2fs_get_next_page_offset
	ldr	x8, [x19, #24]
	mov	w25, wzr
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	str	x0, [x8]
	b	.LBB33_203
.LBB33_235:
	mov	w25, wzr
	b	.LBB33_203
.LBB33_236:
	mov	w25, #-5
	b	.LBB33_144
.LBB33_237:
	ldr	x27, [sp, #40]          // 8-byte Folded Reload
	mov	w25, w0
	ldr	x14, [sp, #80]          // 8-byte Folded Reload
	ldrb	w8, [x19, #12]
	tbnz	w8, #5, .LBB33_147
	b	.LBB33_172
.LBB33_238:
	bl	preempt_schedule_notrace
	ldr	x8, [x27, #712]
	tbz	x8, #43, .LBB33_219
.LBB33_239:
	ldr	x8, [x27, #712]
	tbz	x8, #44, .LBB33_219
.LBB33_240:
	ldr	x8, [x27, #712]
	tbz	x8, #43, .LBB33_260
// %bb.241:
	ldr	x8, [x27, #712]
	tbz	x8, #44, .LBB33_260
// %bb.242:
	mov	x0, x27
	bl	iput
	mov	x22, x24
.LBB33_243:
	adrp	x8, __tracepoint_f2fs_map_blocks
	add	x8, x8, :lo12:__tracepoint_f2fs_map_blocks
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB33_250
// %bb.244:
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
	ldr	w9, [x9, x21]
	add	w10, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w10, w10, w9, lt
	asr	w10, w10, #6
	ldr	x10, [x20, w10, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB33_250
// %bb.245:
	//APP
	mrs x20, sp_el0
	//NO_APP
	ldr	w9, [x20, #80]
	add	w9, w9, #1              // =1
	str	w9, [x20, #80]
	//APP
	//NO_APP
	ldr	x21, [x8, #32]
	cbz	x21, .LBB33_248
// %bb.246:
	ldr	x8, [x21], #24
.LBB33_247:                             // =>This Inner Loop Header: Depth=1
	ldur	x0, [x21, #-16]
	mov	x1, x22
	mov	x2, x19
	mov	w3, w25
	blr	x8
	ldr	x8, [x21], #24
	cbnz	x8, .LBB33_247
.LBB33_248:
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	b.ne	.LBB33_250
// %bb.249:
	ldr	x8, [x20]
	tbnz	w8, #1, .LBB33_252
.LBB33_250:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB33_259
// %bb.251:
	mov	w0, w25
	ldp	x20, x19, [sp, #256]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #240]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #224]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #208]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #192]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #176]    // 16-byte Folded Reload
	add	sp, sp, #272            // =272
	ret
.LBB33_252:
	bl	preempt_schedule_notrace
	b	.LBB33_250
.LBB33_253:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB33_181
.LBB33_254:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB33_184
.LBB33_255:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB33_187
.LBB33_256:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB33_130
.LBB33_257:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB33_133
.LBB33_258:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB33_136
.LBB33_259:
	bl	__stack_chk_fail
.LBB33_260:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 4511; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB33_261:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB33_262:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end33:
	.size	f2fs_map_blocks, .Lfunc_end33-f2fs_map_blocks
                                        // -- End function
	.p2align	3               // -- Begin function __allocate_data_block
	.type	__allocate_data_block,@function
__allocate_data_block:                  // @__allocate_data_block
// %bb.0:
	sub	sp, sp, #144            // =144
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	stp	x28, x27, [sp, #64]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #80]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #96]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	x8, [x0]
	ldr	x9, [x8, #40]
	ldr	x20, [x9, #1104]
	ldr	x8, [x8, #712]
	tbnz	w8, #6, .LBB34_59
// %bb.1:
	ldr	w8, [x20, #3024]
	mov	w21, w2
	mov	x19, x0
	mov	w22, w1
	cmp	w8, #2                  // =2
	b.ne	.LBB34_7
// %bb.2:
	ldr	x8, [x20, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB34_7
// %bb.3:
	sub	w23, w22, #6            // =6
	cmp	w23, #2                 // =2
	b.hi	.LBB34_5
// %bb.4:
	mov	x0, x20
	mov	w1, #1
	bl	f2fs_dev_has_enough_space
	tst	w0, #0x1
	csel	w22, w22, w23, ne
	b	.LBB34_7
.LBB34_5:
	cmp	w22, #2                 // =2
	b.hi	.LBB34_7
// %bb.6:
	mov	x0, x20
	mov	w1, wzr
	bl	f2fs_dev_has_enough_space
	add	w8, w22, #6             // =6
	tst	w0, #0x1
	csel	w22, w22, w8, ne
.LBB34_7:
	ldr	w1, [x19, #24]
	add	x2, sp, #16             // =16
	mov	x0, x20
	mov	w3, wzr
	bl	get_node_info_ex
	cbnz	w0, .LBB34_31
// %bb.8:
	ldr	x8, [x19, #16]
	ldr	x23, [x19]
	ldr	w9, [x19, #28]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w10, [x8, #4072]
	ldr	w11, [x8, #4076]
	cmp	w10, w11
	b.ne	.LBB34_13
// %bb.9:
	cbz	x23, .LBB34_12
// %bb.10:
	ldr	x12, [x23, #712]
	tbz	w12, #26, .LBB34_13
// %bb.11:
	ldr	w12, [x23, #1160]
	asr	w12, w12, #2
	b	.LBB34_14
.LBB34_12:
	ldrb	w12, [x8, #3]
	tbnz	w12, #5, .LBB34_43
.LBB34_13:
	mov	w12, wzr
.LBB34_14:
	add	x13, x8, #360           // =360
	cmp	w10, w11
	csel	x8, x13, x8, eq
	add	w9, w12, w9
	mov	x24, x19
	ldr	w8, [x8, w9, uxtw #2]
	str	w8, [x24, #36]!
	cbz	w8, .LBB34_21
.LBB34_15:
	ldp	w8, w9, [x19, #24]
	add	x25, x20, #2192         // =2192
	ldrb	w10, [sp, #28]
	mov	x0, x25
	ldr	w23, [x19, #36]
	stur	w8, [x29, #-16]
	sturh	w9, [x29, #-11]
	sturb	w10, [x29, #-12]
	bl	mutex_lock
	ldr	x8, [x20, #2224]
	cbz	x8, .LBB34_17
// %bb.16:
	ldr	x9, [x8, #408]
	add	x9, x9, #1              // =1
	str	x9, [x8, #408]
.LBB34_17:
	mov	x0, x25
	bl	mutex_unlock
	sub	x4, x29, #16            // =16
	mov	x0, x20
	mov	x1, xzr
	mov	w2, w23
	mov	x3, x24
	mov	w5, w22
	mov	x6, xzr
	mov	w7, wzr
	str	w21, [sp]
	bl	f2fs_allocate_data_block
	add	w8, w23, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB34_33
.LBB34_18:
	ldr	x0, [x19, #16]
	mov	w1, #1
	mov	w2, #1
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
	ldr	x8, [x19, #16]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w9, [x8, #4072]
	ldr	w10, [x8, #4076]
	cmp	w9, w10
	b.ne	.LBB34_20
// %bb.19:
	ldr	x11, [x19]
	ldr	x12, [x11, #712]
	tbnz	w12, #26, .LBB34_27
.LBB34_20:
	mov	w11, wzr
	b	.LBB34_28
.LBB34_21:
	ldrb	w8, [x23, #142]
	mov	w25, #1
	mov	x0, x23
	mov	w2, #3
	lsl	x1, x25, x8
	bl	__dquot_alloc_space
	add	w8, w0, #28             // =28
	cmp	w8, #28                 // =28
	b.hi	.LBB34_23
// %bb.22:
	mov	w9, #1
	lsl	w8, w25, w8
	movk	w9, #4224, lsl #16
	tst	w8, w9
	b.ne	.LBB34_24
.LBB34_23:
	cmn	w0, #122                // =122
	b.ne	.LBB34_31
.LBB34_24:
	adrp	x27, percpu_counter_batch
	add	x25, x20, #1336         // =1336
	mov	x0, x25
	mov	w1, #1
	ldr	w2, [x27, :lo12:percpu_counter_batch]
	bl	percpu_counter_add_batch
	add	x26, x20, #2236         // =2236
	mov	x0, x26
	bl	_raw_spin_lock
	ldr	w8, [x20, #1240]
	ldr	w9, [x20, #1236]
	ldr	w10, [x20, #1256]
	add	w8, w8, #1              // =1
	sub	w28, w9, w10
	str	w8, [x20, #1240]
	cbz	x23, .LBB34_49
// %bb.25:
	ldrb	w8, [x20, #1427]
	tbnz	w8, #0, .LBB34_44
.LBB34_26:
	ldr	w8, [x20, #1436]
	sub	w28, w28, w8
	b	.LBB34_49
.LBB34_27:
	ldr	w11, [x11, #1160]
	asr	w11, w11, #2
.LBB34_28:
	ldr	w12, [x19, #28]
	add	x13, x8, #360           // =360
	cmp	w9, w10
	ldr	w9, [x19, #36]
	csel	x8, x13, x8, eq
	add	w10, w12, w11
	str	w9, [x8, w10, uxtw #2]
	ldr	x0, [x19, #16]
	bl	set_page_dirty
	cbz	w0, .LBB34_30
// %bb.29:
	mov	w8, #1
	strb	w8, [x19, #33]
.LBB34_30:
	mov	x0, x19
	bl	f2fs_update_extent_cache
	mov	w0, wzr
.LBB34_31:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB34_62
// %bb.32:
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #144            // =144
	ret
.LBB34_33:
	ldr	w9, [x20, #3024]
	cbz	w9, .LBB34_41
// %bb.34:
	ldr	x8, [x20]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB34_40
// %bb.35:
	ldr	x11, [x20, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB34_37
.LBB34_36:                              //   in Loop: Header=BB34_37 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB34_40
.LBB34_37:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w23
	b.hi	.LBB34_36
// %bb.38:                              //   in Loop: Header=BB34_37 Depth=1
	ldr	w12, [x11]
	cmp	w12, w23
	b.lo	.LBB34_36
// %bb.39:
	ldur	x8, [x11, #-80]
.LBB34_40:
	cbz	x8, .LBB34_18
.LBB34_41:
	ldr	x8, [x20, #136]
	cbz	x8, .LBB34_56
// %bb.42:
	add	x9, x8, #80             // =80
	b	.LBB34_57
.LBB34_43:
	ldrh	w12, [x8, #360]
	lsr	w12, w12, #2
	b	.LBB34_14
.LBB34_44:
	ldrb	w8, [x23, #12]
	tbnz	w8, #5, .LBB34_49
// %bb.45:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldr	w9, [x20, #1440]
	ldr	x8, [x8, #2224]
	ldr	w8, [x8, #28]
	cmp	w9, w8
	b.eq	.LBB34_49
// %bb.46:
	ldr	w0, [x20, #1444]
	cbz	w0, .LBB34_48
// %bb.47:
	bl	in_group_p
	cbnz	w0, .LBB34_49
.LBB34_48:
	mov	w0, #24
	bl	capable
	tbz	w0, #0, .LBB34_26
.LBB34_49:
	ldr	x8, [x20, #80]
	tbnz	w8, #8, .LBB34_60
.LBB34_50:
	ldr	w8, [x20, #1240]
	cmp	w8, w28
	b.hi	.LBB34_61
// %bb.51:
	mov	x0, x26
	bl	_raw_spin_unlock
	ldr	x26, [x23, #712]
	mov	w9, #1
	ldr	x25, [x23, #712]
	mov	x0, x23
	ldrb	w8, [x23, #142]
	lsl	x1, x9, x8
	bl	dquot_claim_space_nodirty
	cbnz	w0, .LBB34_53
// %bb.52:
	mov	x0, x23
	mov	w1, #1
	bl	__mark_inode_dirty
.LBB34_53:
	mov	x0, x23
	mov	w1, #1
	bl	f2fs_mark_inode_dirty_sync
	tbz	w26, #1, .LBB34_55
// %bb.54:
	tbz	w25, #2, .LBB34_15
.LBB34_55:
	add	x8, x23, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB34_15
.LBB34_56:
	ldr	x9, [x20, #16]
	add	x9, x9, #72             // =72
.LBB34_57:
	ldr	x8, [x8, #8]
	ldr	w9, [x9]
	ldr	w10, [x20, #1184]
	ldr	w8, [x8]
	sub	w9, w23, w9
	lsr	w9, w9, w10
	sub	w8, w9, w8
	cmn	w8, #1                  // =1
	b.eq	.LBB34_18
// %bb.58:
	ldr	x8, [x20, #248]
	mov	x1, x23
	mov	x2, x23
	ldr	x0, [x8, #48]
	bl	invalidate_mapping_pages
	mov	x0, x20
	mov	w1, w23
	bl	f2fs_invalidate_compress_page
	b	.LBB34_18
.LBB34_59:
	mov	w0, #-1
	b	.LBB34_31
.LBB34_60:
	ldr	w8, [x20, #1264]
	subs	w8, w28, w8
	csel	w28, wzr, w8, lo
	b	.LBB34_50
.LBB34_61:
	sub	w8, w8, #1              // =1
	mov	x0, x26
	str	w8, [x20, #1240]
	bl	_raw_spin_unlock
	ldr	w2, [x27, :lo12:percpu_counter_batch]
	mov	x1, #-1
	mov	x0, x25
	bl	percpu_counter_add_batch
	ldrb	w8, [x23, #142]
	mov	w9, #1
	mov	x0, x23
	mov	w2, #2
	lsl	x1, x9, x8
	bl	__dquot_free_space
	mov	w0, #-28
	b	.LBB34_31
.LBB34_62:
	bl	__stack_chk_fail
.Lfunc_end34:
	.size	__allocate_data_block, .Lfunc_end34-__allocate_data_block
                                        // -- End function
	.globl	f2fs_overwrite_io       // -- Begin function f2fs_overwrite_io
	.p2align	3
	.type	f2fs_overwrite_io,@function
f2fs_overwrite_io:                      // @f2fs_overwrite_io
// %bb.0:
	sub	sp, sp, #80             // =80
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	add	x9, x2, x1
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stur	x8, [x29, #-8]
	ldr	x8, [x0, #80]
	cmp	x9, x8
	b.ls	.LBB35_2
.LBB35_1:
	mov	w0, wzr
	b	.LBB35_8
.LBB35_2:
	mov	w10, #11
	add	x9, x9, #4095           // =4095
	lsr	x8, x1, #12
	lsr	x20, x9, #12
	cmp	w8, w20
	stp	xzr, xzr, [sp, #16]
	str	w8, [sp, #4]
	str	w10, [sp, #32]
	strb	wzr, [sp, #36]
	b.hs	.LBB35_7
// %bb.3:
	mov	x19, x0
.LBB35_4:                               // =>This Inner Loop Header: Depth=1
	sub	w8, w20, w8
	mov	x1, sp
	mov	x0, x19
	mov	w2, wzr
	mov	w3, wzr
	str	w8, [sp, #8]
	bl	f2fs_map_blocks
	cbnz	w0, .LBB35_1
// %bb.5:                               //   in Loop: Header=BB35_4 Depth=1
	ldr	w8, [sp, #8]
	cbz	w8, .LBB35_1
// %bb.6:                               //   in Loop: Header=BB35_4 Depth=1
	ldr	w9, [sp, #4]
	add	w8, w9, w8
	cmp	w8, w20
	str	w8, [sp, #4]
	b.lo	.LBB35_4
.LBB35_7:
	mov	w0, #1
.LBB35_8:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB35_10
// %bb.9:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #80             // =80
	ret
.LBB35_10:
	bl	__stack_chk_fail
.Lfunc_end35:
	.size	f2fs_overwrite_io, .Lfunc_end35-f2fs_overwrite_io
                                        // -- End function
	.globl	f2fs_fiemap             // -- Begin function f2fs_fiemap
	.p2align	3
	.type	f2fs_fiemap,@function
f2fs_fiemap:                            // @f2fs_fiemap
// %bb.0:
	sub	sp, sp, #192            // =192
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	stp	x28, x27, [sp, #112]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #128]    // 16-byte Folded Spill
	mov	x28, x2
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #144]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #160]    // 16-byte Folded Spill
	mov	x22, x3
	stp	x20, x19, [sp, #176]    // 16-byte Folded Spill
	mov	x20, x1
	stur	x8, [x29, #-8]
	mov	x21, x0
	ldrb	w8, [x1]
	ldr	w19, [x0, #1268]
	tbz	w8, #2, .LBB36_2
// %bb.1:
	mov	x0, x21
	bl	f2fs_precache_extents
	mov	w23, w0
	cbnz	w0, .LBB36_153
.LBB36_2:
	mov	x0, x20
	mov	w1, #3
	bl	fiemap_check_flags
	mov	w23, w0
	cbnz	w0, .LBB36_153
// %bb.3:
	add	x26, x21, #160          // =160
	mov	x0, x26
	bl	down_write
	mov	x0, x21
	bl	max_file_blocks
	lsl	x9, x0, #12
	subs	x8, x9, x28
	b.hs	.LBB36_5
// %bb.4:
	mov	w23, #-27
	b	.LBB36_152
.LBB36_5:
	sub	x10, x9, x22
	cmp	x10, x28
	ccmp	x9, x22, #0, hs
	ldrb	w9, [x20]
	csel	x24, x8, x22, lo
	tbnz	w9, #1, .LBB36_35
// %bb.6:
	ldr	x8, [x21, #712]
	tbnz	w8, #10, .LBB36_8
// %bb.7:
	ldr	x8, [x21, #712]
	tbz	w8, #11, .LBB36_9
.LBB36_8:
	mov	x0, x21
	mov	x1, x20
	mov	x2, x28
	mov	x3, x24
	bl	f2fs_inline_data_fiemap
	mov	w22, w0
	cmn	w0, #11                 // =11
	b.ne	.LBB36_151
.LBB36_9:
	ldrb	w8, [x21, #142]
	mov	w9, #1
	str	x26, [sp]               // 8-byte Folded Spill
	mov	x26, xzr
	mov	x27, xzr
	mov	w23, wzr
	mov	w25, wzr
	lsr	x10, x24, x8
	cmp	x10, #0                 // =0
	lsl	x9, x9, x8
	sub	w10, w19, #1            // =1
	csel	x9, x9, x24, eq
	//APP
	mrs x24, sp_el0
	//NO_APP
	stp	x10, xzr, [sp, #8]      // 16-byte Folded Spill
	str	x9, [sp, #24]           // 8-byte Folded Spill
	add	x9, x28, x9
	sub	x9, x9, #1              // =1
	lsr	x28, x28, x8
	lsr	x8, x9, x8
	str	x8, [sp, #32]           // 8-byte Folded Spill
	b	.LBB36_11
.LBB36_10:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	w8, [x24, #2360]
	ubfx	w8, w8, #8, #1
	cbnz	w8, .LBB36_79
.LBB36_11:                              // =>This Inner Loop Header: Depth=1
	add	x0, sp, #48             // =48
	mov	w1, wzr
	mov	w2, #40
	bl	memset
	add	x9, sp, #40             // =40
	ldrb	w8, [x21, #142]
	str	x9, [sp, #64]
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	lsr	x8, x9, x8
	stp	w28, w8, [sp, #52]
	mov	w8, #11
	str	w8, [sp, #80]
	tbz	w25, #0, .LBB36_13
// %bb.12:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	str	w8, [sp, #56]
.LBB36_13:                              //   in Loop: Header=BB36_11 Depth=1
	add	x1, sp, #48             // =48
	mov	x0, x21
	mov	w2, wzr
	mov	w3, #1
	bl	f2fs_map_blocks
	cbnz	w0, .LBB36_77
// %bb.14:                              //   in Loop: Header=BB36_11 Depth=1
	ldrh	w8, [sp, #60]
	mov	w9, #4192
	tst	w8, w9
	b.eq	.LBB36_21
// %bb.15:                              //   in Loop: Header=BB36_11 Depth=1
	cbz	x27, .LBB36_17
.LBB36_16:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	w8, [x21, #12]
	mov	w9, #4096
	ldr	x1, [sp, #16]           // 8-byte Folded Reload
	mov	x0, x20
	mov	x2, x26
	mov	x3, x27
	tst	w8, #0x4000
	mov	w8, #4224
	csel	w8, w9, w8, eq
	orr	w23, w8, w23
	mov	w4, w23
	bl	fiemap_fill_next_extent
	cbnz	w0, .LBB36_77
.LBB36_17:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	x8, [sp, #32]           // 8-byte Folded Reload
	cmp	x28, x8
	b.hi	.LBB36_78
// %bb.18:                              //   in Loop: Header=BB36_11 Depth=1
	tbnz	w25, #0, .LBB36_26
// %bb.19:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	w8, [sp, #48]
	cmn	w8, #2                  // =2
	b.ne	.LBB36_28
// %bb.20:                              //   in Loop: Header=BB36_11 Depth=1
	mov	x27, xzr
	add	x28, x28, #1            // =1
	mov	w25, #1
	b	.LBB36_32
.LBB36_21:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	w9, [x21, #1160]
	ldr	w10, [x21, #1168]
	ldr	x28, [sp, #40]
	ldrh	w11, [x21]
	ldrb	w8, [x21, #142]
	add	w9, w10, w9, asr #2
	mov	w10, #923
	sub	w10, w10, w9
	and	w11, w11, #0xf000
	lsl	x9, x28, x8
	cmp	w11, #8, lsl #12        // =32768
	b.ne	.LBB36_29
// %bb.22:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	x11, [x21, #712]
	tbz	w11, #31, .LBB36_24
// %bb.23:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	w11, [x21, #1268]
	neg	w11, w11
	and	w10, w10, w11
.LBB36_24:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	x11, [x21, #712]
	mov	w10, w10
	tbnz	w11, #31, .LBB36_30
// %bb.25:                              //   in Loop: Header=BB36_11 Depth=1
	mov	w11, #22372
	movk	w11, #16129, lsl #16
	b	.LBB36_31
.LBB36_26:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	ldr	x9, [sp, #32]           // 8-byte Folded Reload
	add	x8, x28, x8
	cmp	x8, x9
	b.hi	.LBB36_78
// %bb.27:                              //   in Loop: Header=BB36_11 Depth=1
	ldrb	w9, [x21, #142]
	sub	x11, x28, #1            // =1
	ldr	w10, [sp, #48]
	mov	x28, x8
	mov	w25, wzr
	orr	w23, w23, #0x8
	lsl	x8, x11, x9
	lsl	x27, x19, x9
	lsl	x26, x10, x9
	str	x8, [sp, #16]           // 8-byte Folded Spill
	b	.LBB36_32
.LBB36_28:                              //   in Loop: Header=BB36_11 Depth=1
	ldrb	w9, [x21, #142]
	ldp	w10, w11, [sp, #56]
	lsl	x12, x28, x9
	lsl	x26, x8, x9
	lsl	x27, x10, x9
	lsr	w10, w11, #1
	and	w23, w10, #0x800
	lsr	x10, x27, x9
	add	x28, x10, x28
	str	x12, [sp, #16]          // 8-byte Folded Spill
	b	.LBB36_32
.LBB36_29:                              //   in Loop: Header=BB36_11 Depth=1
	mov	w11, #22372
	mov	w10, w10
	movk	w11, #16129, lsl #16
	b	.LBB36_31
.LBB36_30:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	w11, [x21, #1268]
	mov	w12, #1018
	neg	w11, w11
	and	w11, w11, w12
	mov	w12, #55322
	movk	w12, #15, lsl #16
	mul	w11, w11, w12
.LBB36_31:                              //   in Loop: Header=BB36_11 Depth=1
	add	x10, x11, x10
	lsl	x8, x10, x8
	cmp	x9, x8
	b.hs	.LBB36_34
.LBB36_32:                              //   in Loop: Header=BB36_11 Depth=1
	ldr	x8, [x24]
	tbnz	w8, #0, .LBB36_10
// %bb.33:                              //   in Loop: Header=BB36_11 Depth=1
	mov	w8, wzr
	cbz	w8, .LBB36_11
	b	.LBB36_79
.LBB36_34:                              //   in Loop: Header=BB36_11 Depth=1
	orr	w23, w23, #0x1
	cbnz	x27, .LBB36_16
	b	.LBB36_17
.LBB36_35:
	ldr	x8, [x21, #40]
	ldr	w24, [x21, #800]
	ldr	x25, [x8, #1104]
	ldr	x8, [x21, #712]
	tbnz	w8, #9, .LBB36_57
// %bb.36:
	mov	x27, xzr
                                        // implicit-def: $x28
                                        // implicit-def: $w23
.LBB36_37:
	cbz	w24, .LBB36_148
// %bb.38:
	ldr	x8, [x25, #128]
	mov	x1, x24
	mov	w2, #7
	ldr	x0, [x8, #48]
	ldr	w3, [x0, #140]
	bl	pagecache_get_page
	cbz	x0, .LBB36_76
// %bb.39:
	mov	x23, x0
	add	x2, sp, #48             // =48
	mov	x0, x25
	mov	w1, w24
	mov	w3, wzr
	mov	w27, #8208
	movk	w27, #62197, lsl #16
	bl	get_node_info_ex
	cbz	w0, .LBB36_105
// %bb.40:
	ldr	x8, [x23, #24]
	mov	w22, w0
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x23, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x23, x10, eq
	cmp	x9, x27
	ldr	x8, [x8]
	b.ne	.LBB36_122
// %bb.41:
	tbnz	w8, #0, .LBB36_55
// %bb.42:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_45
// %bb.43:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_45
// %bb.44:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_45:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_47
// %bb.46:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_159
.LBB36_47:
	ldr	x0, [x23, #24]
.LBB36_48:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_50
// %bb.49:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_160
.LBB36_50:
	ldr	x0, [x23, #24]
.LBB36_51:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_53
// %bb.52:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_161
.LBB36_53:
	ldr	x0, [x23, #24]
.LBB36_54:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB36_55:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB36_128
// %bb.56:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_57:
	ldr	x8, [x25, #128]
	mov	w2, #7
	ldr	x1, [x21, #64]
	ldr	x0, [x8, #48]
	ldr	w3, [x0, #140]
	bl	pagecache_get_page
	cbz	x0, .LBB36_76
// %bb.58:
	ldr	w1, [x21, #64]
	mov	x23, x0
	add	x2, sp, #48             // =48
	mov	x0, x25
	mov	w3, wzr
	mov	w28, #8208
	movk	w28, #62197, lsl #16
	bl	get_node_info_ex
	cbz	w0, .LBB36_81
// %bb.59:
	ldr	x8, [x23, #24]
	mov	w22, w0
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x23, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x23, x10, eq
	cmp	x9, x28
	ldr	x8, [x8]
	b.ne	.LBB36_98
// %bb.60:
	tbnz	w8, #0, .LBB36_74
// %bb.61:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_64
// %bb.62:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_64
// %bb.63:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_64:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_66
// %bb.65:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_156
.LBB36_66:
	ldr	x0, [x23, #24]
.LBB36_67:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_69
// %bb.68:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_157
.LBB36_69:
	ldr	x0, [x23, #24]
.LBB36_70:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_72
// %bb.71:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_158
.LBB36_72:
	ldr	x0, [x23, #24]
.LBB36_73:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB36_74:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB36_104
// %bb.75:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_76:
	mov	w22, #-12
	b	.LBB36_151
.LBB36_77:
	ldr	x26, [sp]               // 8-byte Folded Reload
	mov	w22, w0
	b	.LBB36_151
.LBB36_78:
	mov	w23, wzr
	b	.LBB36_80
.LBB36_79:
	mov	w23, #-4
.LBB36_80:
	ldr	x26, [sp]               // 8-byte Folded Reload
	b	.LBB36_152
.LBB36_81:
	ldr	w11, [sp, #56]
	ldrb	w19, [x21, #142]
	ldr	w27, [x21, #1168]
	ldr	x22, [x21, #712]
	ldr	x8, [x23, #24]
	ldr	x8, [x8]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x23, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x23, x10, eq
	cmp	x9, x28
	ldr	x8, [x8]
	b.ne	.LBB36_130
// %bb.82:
	tbnz	w8, #0, .LBB36_96
// %bb.83:
	str	x11, [sp, #32]          // 8-byte Folded Spill
	bl	print_bdev_access_info
	adrp	x28, f2fs_dclient
	ldr	x0, [x28, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_86
// %bb.84:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_86
// %bb.85:
	ldr	x0, [x28, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x28, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_86:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_88
// %bb.87:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_162
.LBB36_88:
	ldr	x0, [x23, #24]
.LBB36_89:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_91
// %bb.90:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_163
.LBB36_91:
	ldr	x0, [x23, #24]
.LBB36_92:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_94
// %bb.93:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_164
.LBB36_94:
	ldr	x0, [x23, #24]
.LBB36_95:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	ldr	x11, [sp, #32]          // 8-byte Folded Reload
.LBB36_96:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB36_136
// %bb.97:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_98:
	tbnz	w8, #0, .LBB36_103
// %bb.99:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_102
// %bb.100:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_102
// %bb.101:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_102:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB36_103:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB36_168
.LBB36_104:
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
	cbnz	w9, .LBB36_151
	b	.LBB36_129
.LBB36_105:
	ldr	x8, [x23, #24]
	ldr	x9, [x21, #40]
	ldr	w19, [sp, #56]
	ldrb	w21, [x21, #142]
	ldr	x8, [x8]
	ldr	x28, [x9, #24]
	ldr	x8, [x8, #40]
	ldr	x9, [x8, #96]
	ldr	x8, [x23, #8]
	sub	x10, x8, #1             // =1
	tst	x8, #0x1
	csel	x8, x23, x10, eq
	cmp	x9, x27
	ldr	x8, [x8]
	b.ne	.LBB36_139
// %bb.106:
	tbnz	w8, #0, .LBB36_120
// %bb.107:
	bl	print_bdev_access_info
	adrp	x22, f2fs_dclient
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_110
// %bb.108:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_110
// %bb.109:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_110:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_112
// %bb.111:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_165
.LBB36_112:
	ldr	x0, [x23, #24]
.LBB36_113:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_115
// %bb.114:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_166
.LBB36_115:
	ldr	x0, [x23, #24]
.LBB36_116:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB36_118
// %bb.117:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB36_167
.LBB36_118:
	ldr	x0, [x23, #24]
.LBB36_119:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB36_120:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB36_145
// %bb.121:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_122:
	tbnz	w8, #0, .LBB36_127
// %bb.123:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_126
// %bb.124:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_126
// %bb.125:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_126:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB36_127:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB36_169
.LBB36_128:
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
	cbnz	w9, .LBB36_151
.LBB36_129:
	bl	__put_page
	b	.LBB36_151
.LBB36_130:
	tbnz	w8, #0, .LBB36_135
// %bb.131:
	mov	x28, x11
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_134
// %bb.132:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_134
// %bb.133:
	adrp	x8, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_record
	adrp	x8, f2fs_dclient
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	ldr	x0, [x8, :lo12:f2fs_dclient]
	bl	dsm_client_notify
.LBB36_134:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
	mov	x11, x28
.LBB36_135:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB36_170
.LBB36_136:
	mov	w8, #4052
	mov	x0, x23
	lsl	w9, w27, #2
	sub	w8, w8, w9
	lsl	x10, x11, x19
	lsl	x11, x22, #54
	add	x27, x10, w8, sxtw
	sxtw	x8, w9
	and	x28, x8, x11, asr #63
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
	cbnz	w9, .LBB36_138
// %bb.137:
	bl	__put_page
.LBB36_138:
	cmp	w24, #0                 // =0
	mov	w8, #768
	cinc	w23, w8, eq
	mov	x0, x20
	mov	x1, xzr
	mov	x2, x27
	mov	x3, x28
	mov	w4, w23
	bl	fiemap_fill_next_extent
	mov	w22, w0
	cbnz	w0, .LBB36_151
	b	.LBB36_37
.LBB36_139:
	tbnz	w8, #0, .LBB36_144
// %bb.140:
	bl	print_bdev_access_info
	adrp	x22, f2fs_dclient
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB36_143
// %bb.141:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB36_143
// %bb.142:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB36_143:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB36_144:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB36_171
.LBB36_145:
	mov	x0, x23
	lsl	x27, x19, x21
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
	cbnz	w9, .LBB36_147
// %bb.146:
	bl	__put_page
.LBB36_147:
	mov	w23, #1
.LBB36_148:
	cbz	x27, .LBB36_150
// %bb.149:
	mov	x0, x20
	mov	x1, xzr
	mov	x2, x27
	mov	x3, x28
	mov	w4, w23
	bl	fiemap_fill_next_extent
	and	w22, w0, w0, asr #31
	b	.LBB36_151
.LBB36_150:
	mov	w22, wzr
.LBB36_151:
	cmp	w22, #1                 // =1
	csel	w23, wzr, w22, eq
.LBB36_152:
	mov	x0, x26
	bl	up_write
.LBB36_153:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB36_155
// %bb.154:
	mov	w0, w23
	ldp	x20, x19, [sp, #176]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #160]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #144]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #128]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #112]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	add	sp, sp, #192            // =192
	ret
.LBB36_155:
	bl	__stack_chk_fail
.LBB36_156:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_67
.LBB36_157:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_70
.LBB36_158:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_73
.LBB36_159:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_48
.LBB36_160:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_51
.LBB36_161:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_54
.LBB36_162:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_89
.LBB36_163:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_92
.LBB36_164:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_95
.LBB36_165:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_113
.LBB36_166:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_116
.LBB36_167:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB36_119
.LBB36_168:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_169:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_170:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB36_171:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end36:
	.size	f2fs_fiemap, .Lfunc_end36-f2fs_fiemap
                                        // -- End function
	.globl	f2fs_read_multi_pages   // -- Begin function f2fs_read_multi_pages
	.p2align	3
	.type	f2fs_read_multi_pages,@function
f2fs_read_multi_pages:                  // @f2fs_read_multi_pages
// %bb.0:
	sub	sp, sp, #240            // =240
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	add	x29, sp, #144           // =144
	stp	x28, x27, [sp, #160]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #176]    // 16-byte Folded Spill
	mov	w28, w4
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	x27, x1
	stp	x24, x23, [sp, #192]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #208]    // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #224]    // 16-byte Folded Spill
	str	w5, [sp, #68]           // 4-byte Folded Spill
	str	x3, [sp, #56]           // 8-byte Folded Spill
	stur	x8, [x29, #-8]
	ldp	x25, x23, [x0]
	ldr	x20, [x1]
	ldr	w26, [x0, #20]
	ldr	x8, [x25, #40]
	ldrb	w19, [x25, #142]
	str	w2, [sp, #52]           // 4-byte Folded Spill
	ldr	x22, [x8, #1104]
	bl	f2fs_cluster_is_empty
	tbnz	w0, #0, .LBB37_244
.LBB37_1:
	mov	x0, x21
	bl	f2fs_cluster_is_empty
	tbnz	w0, #0, .LBB37_263
// %bb.2:
	ldrb	w8, [x25, #14]
	mov	w9, #1
	str	x27, [sp, #72]          // 8-byte Folded Spill
	str	w28, [sp, #40]          // 4-byte Folded Spill
	tbnz	w8, #0, .LBB37_5
// %bb.3:
	ldr	x8, [x25, #712]
	tbnz	w8, #30, .LBB37_5
// %bb.4:
	add	x10, x25, #80           // =80
	b	.LBB37_6
.LBB37_5:
	ldr	x8, [x25, #40]
	add	x10, x8, #32            // =32
.LBB37_6:
	ldr	w8, [x21, #16]
	lsl	x9, x9, x19
	stur	x9, [x29, #-64]         // 8-byte Folded Spill
	cbz	w8, .LBB37_36
// %bb.7:
	ldr	x9, [x10]
	ldur	x11, [x29, #-64]        // 8-byte Folded Reload
	ldrb	w10, [x25, #142]
	add	x9, x9, w11, uxtw
	sub	x9, x9, #1              // =1
	lsr	x28, x9, x10
	ldr	w9, [sp, #68]           // 4-byte Folded Reload
	tbz	w9, #0, .LBB37_23
// %bb.8:
	mov	w9, wzr
	//APP
	mrs x24, sp_el0
	//NO_APP
	b	.LBB37_11
.LBB37_9:                               //   in Loop: Header=BB37_11 Depth=1
	ldr	x8, [x21, #24]
	str	xzr, [x8, x27, lsl #3]
	ldr	w8, [x21, #32]
	sub	w9, w8, #1              // =1
	ldr	w8, [x21, #16]
	str	w9, [x21, #32]
.LBB37_10:                              //   in Loop: Header=BB37_11 Depth=1
	add	w9, w27, #1             // =1
	cmp	w9, w8
	b.hs	.LBB37_36
.LBB37_11:                              // =>This Inner Loop Header: Depth=1
	ldr	x10, [x21, #24]
	sxtw	x27, w9
	ldr	x19, [x10, w9, sxtw #3]
	cbz	x19, .LBB37_10
// %bb.12:                              //   in Loop: Header=BB37_11 Depth=1
	ldr	x9, [x19, #32]
	cmp	x9, x28
	b.hs	.LBB37_15
// %bb.13:                              //   in Loop: Header=BB37_11 Depth=1
	ldr	x9, [x19, #8]
	sub	x10, x9, #1             // =1
	tst	x9, #0x1
	csel	x9, x19, x10, eq
	ldr	x9, [x9]
	tbz	w9, #2, .LBB37_10
// %bb.14:                              //   in Loop: Header=BB37_11 Depth=1
	//APP
	dmb ishld
	//NO_APP
	b	.LBB37_20
.LBB37_15:                              //   in Loop: Header=BB37_11 Depth=1
	ldr	w8, [x24, #80]
	mov	w1, wzr
	mov	w2, #4096
	add	w8, w8, #1              // =1
	str	w8, [x24, #80]
	//APP
	//NO_APP
	ldr	w8, [x24, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x24, #2984]
	lsl	x8, x19, #6
	orr	x0, x8, #0xffffffc000000000
	//APP
	//NO_APP
	bl	memset
	//APP
	//NO_APP
	ldr	w8, [x24, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x24, #2984]
	//APP
	//NO_APP
	ldr	w8, [x24, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x24, #80]
	b.ne	.LBB37_17
// %bb.16:                              //   in Loop: Header=BB37_11 Depth=1
	ldr	x8, [x24]
	tbnz	w8, #1, .LBB37_22
.LBB37_17:                              //   in Loop: Header=BB37_11 Depth=1
	mov	x0, x19
	bl	flush_dcache_page
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB37_19
// %bb.18:                              //   in Loop: Header=BB37_11 Depth=1
	//APP
	dmb ishst
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	orr	x8, x8, 4
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
	b	.LBB37_20
.LBB37_19:                              //   in Loop: Header=BB37_11 Depth=1
	//APP
	dmb ishld
	//NO_APP
.LBB37_20:                              //   in Loop: Header=BB37_11 Depth=1
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
	cbnz	w9, .LBB37_9
// %bb.21:                              //   in Loop: Header=BB37_11 Depth=1
	bl	__put_page
	b	.LBB37_9
.LBB37_22:                              //   in Loop: Header=BB37_11 Depth=1
	bl	preempt_schedule
	b	.LBB37_17
.LBB37_23:
	mov	w9, wzr
	//APP
	mrs x24, sp_el0
	//NO_APP
	b	.LBB37_27
.LBB37_24:                              //   in Loop: Header=BB37_27 Depth=1
	//APP
	dmb ishld
	//NO_APP
.LBB37_25:                              //   in Loop: Header=BB37_27 Depth=1
	mov	x0, x19
	bl	unlock_page
	ldr	x8, [x21, #24]
	str	xzr, [x8, x27, lsl #3]
	ldr	w8, [x21, #32]
	sub	w9, w8, #1              // =1
	ldr	w8, [x21, #16]
	str	w9, [x21, #32]
.LBB37_26:                              //   in Loop: Header=BB37_27 Depth=1
	add	w9, w27, #1             // =1
	cmp	w9, w8
	b.hs	.LBB37_36
.LBB37_27:                              // =>This Inner Loop Header: Depth=1
	ldr	x10, [x21, #24]
	sxtw	x27, w9
	ldr	x19, [x10, w9, sxtw #3]
	cbz	x19, .LBB37_26
// %bb.28:                              //   in Loop: Header=BB37_27 Depth=1
	ldr	x9, [x19, #32]
	cmp	x9, x28
	b.hs	.LBB37_31
// %bb.29:                              //   in Loop: Header=BB37_27 Depth=1
	ldr	x9, [x19, #8]
	sub	x10, x9, #1             // =1
	tst	x9, #0x1
	csel	x9, x19, x10, eq
	ldr	x9, [x9]
	tbz	w9, #2, .LBB37_26
// %bb.30:                              //   in Loop: Header=BB37_27 Depth=1
	//APP
	dmb ishld
	//NO_APP
	b	.LBB37_25
.LBB37_31:                              //   in Loop: Header=BB37_27 Depth=1
	ldr	w8, [x24, #80]
	mov	w1, wzr
	mov	w2, #4096
	add	w8, w8, #1              // =1
	str	w8, [x24, #80]
	//APP
	//NO_APP
	ldr	w8, [x24, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x24, #2984]
	lsl	x8, x19, #6
	orr	x0, x8, #0xffffffc000000000
	//APP
	//NO_APP
	bl	memset
	//APP
	//NO_APP
	ldr	w8, [x24, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x24, #2984]
	//APP
	//NO_APP
	ldr	w8, [x24, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x24, #80]
	b.ne	.LBB37_33
// %bb.32:                              //   in Loop: Header=BB37_27 Depth=1
	ldr	x8, [x24]
	tbnz	w8, #1, .LBB37_35
.LBB37_33:                              //   in Loop: Header=BB37_27 Depth=1
	mov	x0, x19
	bl	flush_dcache_page
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB37_24
// %bb.34:                              //   in Loop: Header=BB37_27 Depth=1
	//APP
	dmb ishst
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	orr	x8, x8, 4
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
	b	.LBB37_25
.LBB37_35:                              //   in Loop: Header=BB37_27 Depth=1
	bl	preempt_schedule
	b	.LBB37_33
.LBB37_36:
	mov	x0, x21
	bl	f2fs_cluster_is_empty
	tbz	w0, #0, .LBB37_38
// %bb.37:
	mov	w28, wzr
	ldr	w8, [x21, #16]
	cbnz	w8, .LBB37_40
	b	.LBB37_211
.LBB37_38:
	sub	x0, x29, #56            // =56
	mov	w1, wzr
	mov	w2, #48
	lsl	x23, x23, x26
	sub	x19, x29, #56           // =56
	bl	memset
	and	x1, x23, #0xffffffff
	sub	x0, x29, #56            // =56
	mov	w2, #1
	stp	x25, xzr, [x29, #-56]
	stur	xzr, [x29, #-40]
	stur	wzr, [x29, #-32]
	bl	f2fs_get_dnode_of_data
	mov	w28, w0
	cbz	w0, .LBB37_44
// %bb.39:
	ldr	w8, [x21, #16]
	cbz	w8, .LBB37_211
.LBB37_40:
	mov	w9, wzr
	b	.LBB37_42
.LBB37_41:                              //   in Loop: Header=BB37_42 Depth=1
	add	w9, w19, #1             // =1
	cmp	w9, w8
	b.hs	.LBB37_211
.LBB37_42:                              // =>This Inner Loop Header: Depth=1
	ldr	x10, [x21, #24]
	sxtw	x19, w9
	ldr	x10, [x10, w9, sxtw #3]
	cbz	x10, .LBB37_41
// %bb.43:                              //   in Loop: Header=BB37_42 Depth=1
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
	ldr	x8, [x21, #24]
	lsl	x9, x19, #3
	ldr	x8, [x8, x9]
	ldr	x10, [x8, #8]
	sub	x11, x10, #1            // =1
	tst	x10, #0x1
	csel	x8, x8, x11, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, 256
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	x8, [x21, #24]
	ldr	x0, [x8, x9]
	bl	unlock_page
	ldr	w8, [x21, #16]
	b	.LBB37_41
.LBB37_44:
	ldur	w8, [x29, #-20]
	cmn	w8, #2                  // =2
	b.ne	.LBB37_248
.LBB37_45:
	ldr	w8, [x21, #16]
	add	x23, x19, #8            // =8
	cmp	w8, #2                  // =2
	b.lo	.LBB37_65
// %bb.46:
	mov	w19, #1
	mov	w28, #-14
.LBB37_47:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB37_58 Depth 2
	ldur	x8, [x29, #-40]
	ldur	w9, [x29, #-28]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	add	w9, w9, w19
	ldr	w10, [x8, #4072]
	ldr	w11, [x8, #4076]
	cmp	w10, w11
	b.ne	.LBB37_52
// %bb.48:                              //   in Loop: Header=BB37_47 Depth=1
	ldur	x12, [x29, #-56]
	cbz	x12, .LBB37_51
// %bb.49:                              //   in Loop: Header=BB37_47 Depth=1
	ldr	x13, [x12, #712]
	tbz	w13, #26, .LBB37_52
// %bb.50:                              //   in Loop: Header=BB37_47 Depth=1
	ldr	w12, [x12, #1160]
	asr	w12, w12, #2
	b	.LBB37_53
.LBB37_51:                              //   in Loop: Header=BB37_47 Depth=1
	ldrb	w12, [x8, #3]
	tbnz	w12, #5, .LBB37_64
.LBB37_52:                              //   in Loop: Header=BB37_47 Depth=1
	mov	w12, wzr
.LBB37_53:                              //   in Loop: Header=BB37_47 Depth=1
	add	x13, x8, #360           // =360
	cmp	w10, w11
	csel	x8, x13, x8, eq
	add	w9, w9, w12
	ldr	w1, [x8, w9, uxtw #2]
	add	w8, w1, #3              // =3
	cmp	w8, #4                  // =4
	b.lo	.LBB37_65
// %bb.54:                              //   in Loop: Header=BB37_47 Depth=1
	ldr	w9, [x22, #3024]
	cbz	w9, .LBB37_62
// %bb.55:                              //   in Loop: Header=BB37_47 Depth=1
	ldr	x8, [x22]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB37_61
// %bb.56:                              //   in Loop: Header=BB37_47 Depth=1
	ldr	x11, [x22, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB37_58
.LBB37_57:                              //   in Loop: Header=BB37_58 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB37_61
.LBB37_58:                              //   Parent Loop BB37_47 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w1
	b.hi	.LBB37_57
// %bb.59:                              //   in Loop: Header=BB37_58 Depth=2
	ldr	w12, [x11]
	cmp	w12, w1
	b.lo	.LBB37_57
// %bb.60:                              //   in Loop: Header=BB37_47 Depth=1
	ldur	x8, [x11, #-80]
.LBB37_61:                              //   in Loop: Header=BB37_47 Depth=1
	cbz	x8, .LBB37_65
.LBB37_62:                              //   in Loop: Header=BB37_47 Depth=1
	mov	x0, x22
	mov	w2, #6
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB37_68
// %bb.63:                              //   in Loop: Header=BB37_47 Depth=1
	ldr	w8, [x21, #48]
	add	w19, w19, #1            // =1
	ldr	w9, [x21, #16]
	add	w8, w8, #1              // =1
	cmp	w19, w9
	str	w8, [x21, #48]
	b.lo	.LBB37_47
	b	.LBB37_65
.LBB37_64:                              //   in Loop: Header=BB37_47 Depth=1
	ldrh	w12, [x8, #360]
	lsr	w12, w12, #2
	b	.LBB37_53
.LBB37_65:
	ldr	w8, [x21, #48]
	cbz	w8, .LBB37_69
// %bb.66:
	mov	x0, x21
	bl	f2fs_alloc_dic
	mov	x27, x0
	cmn	x0, #1, lsl #12         // =4096
	b.ls	.LBB37_87
// %bb.67:
	mov	w28, w27
.LBB37_68:
	ldur	x22, [x29, #-40]
	cbnz	x22, .LBB37_70
	b	.LBB37_175
.LBB37_69:
	mov	w28, wzr
	ldur	x22, [x29, #-40]
	cbz	x22, .LBB37_175
.LBB37_70:
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
	b.ne	.LBB37_167
// %bb.71:
	tbnz	w8, #0, .LBB37_85
// %bb.72:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB37_75
// %bb.73:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB37_75
// %bb.74:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB37_75:
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB37_77
// %bb.76:
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB37_253
.LBB37_77:
	ldr	x0, [x22, #24]
.LBB37_78:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB37_80
// %bb.79:
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB37_254
.LBB37_80:
	ldr	x0, [x22, #24]
.LBB37_81:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB37_83
// %bb.82:
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB37_255
.LBB37_83:
	ldr	x0, [x22, #24]
.LBB37_84:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB37_85:
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB37_173
// %bb.86:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB37_87:
	ldr	w8, [x21, #48]
	str	x23, [sp]               // 8-byte Folded Spill
	cbz	w8, .LBB37_180
// %bb.88:
	ldr	w8, [sp, #40]           // 4-byte Folded Reload
	mov	w23, wzr
	//APP
	mrs x26, sp_el0
	//NO_APP
	str	x27, [sp, #8]           // 8-byte Folded Spill
	tst	w8, #0x1
	mov	w8, #524288
	csel	w8, w8, wzr, ne
	str	w8, [sp, #20]           // 4-byte Folded Spill
	add	x8, x27, #108           // =108
	str	x8, [sp, #32]           // 8-byte Folded Spill
	add	x8, x22, #1308          // =1308
	str	x8, [sp, #24]           // 8-byte Folded Spill
	add	x8, x22, #2240          // =2240
	str	x8, [sp, #40]           // 8-byte Folded Spill
	b	.LBB37_91
.LBB37_89:                              //   in Loop: Header=BB37_91 Depth=1
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 256
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [sp, #56]           // 8-byte Folded Reload
	str	x28, [x8]
.LBB37_90:                              //   in Loop: Header=BB37_91 Depth=1
	ldr	w8, [x21, #48]
	cmp	w23, w8
	b.hs	.LBB37_180
.LBB37_91:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB37_108 Depth 2
                                        //     Child Loop BB37_150 Depth 2
                                        //     Child Loop BB37_129 Depth 2
                                        //     Child Loop BB37_135 Depth 2
	ldur	x8, [x29, #-40]
	ldr	x10, [x27, #48]
	lsl	x8, x8, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	x24, [x10, w23, sxtw #3]
	ldur	w10, [x29, #-28]
	ldr	w9, [x8, #4072]
	ldr	w11, [x8, #4076]
	cmp	w9, w11
	b.ne	.LBB37_96
// %bb.92:                              //   in Loop: Header=BB37_91 Depth=1
	ldur	x12, [x29, #-56]
	cbz	x12, .LBB37_95
// %bb.93:                              //   in Loop: Header=BB37_91 Depth=1
	ldr	x13, [x12, #712]
	tbz	w13, #26, .LBB37_96
// %bb.94:                              //   in Loop: Header=BB37_91 Depth=1
	ldr	w12, [x12, #1160]
	asr	w12, w12, #2
	b	.LBB37_97
.LBB37_95:                              //   in Loop: Header=BB37_91 Depth=1
	ldrb	w12, [x8, #3]
	tbnz	w12, #5, .LBB37_114
.LBB37_96:                              //   in Loop: Header=BB37_91 Depth=1
	mov	w12, wzr
.LBB37_97:                              //   in Loop: Header=BB37_91 Depth=1
	add	w23, w23, #1            // =1
	add	x13, x8, #360           // =360
	cmp	w9, w11
	add	w9, w10, w23
	csel	x8, x13, x8, eq
	add	w9, w9, w12
	mov	x0, x25
	ldr	w28, [x8, w9, uxtw #2]
	mov	w1, w28
	bl	f2fs_wait_on_block_writeback
	mov	x0, x22
	mov	x1, x24
	mov	w2, w28
	bl	f2fs_load_compressed_page
	tbz	w0, #0, .LBB37_100
// %bb.98:                              //   in Loop: Header=BB37_91 Depth=1
	add	x8, x27, #104           // =104
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB37_90
// %bb.99:                              //   in Loop: Header=BB37_91 Depth=1
	mov	x0, x27
	bl	f2fs_decompress_cluster
	b	.LBB37_90
.LBB37_100:                             //   in Loop: Header=BB37_91 Depth=1
	cbz	x20, .LBB37_140
// %bb.101:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x8, [sp, #56]           // 8-byte Folded Reload
	ldr	x9, [x22, #1224]
	ldr	w8, [x8]
	cbz	x9, .LBB37_103
// %bb.102:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	w10, [x20, #48]
	cmp	x9, x10
	cset	w9, ls
.LBB37_103:                             //   in Loop: Header=BB37_91 Depth=1
	add	w8, w8, #1              // =1
	cmp	w8, w28
	b.ne	.LBB37_115
// %bb.104:                             //   in Loop: Header=BB37_91 Depth=1
	tbnz	w9, #0, .LBB37_115
// %bb.105:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x8, [x22]
	ldr	w9, [x22, #3024]
	ldr	x8, [x8, #248]
	cmp	w9, #2                  // =2
	b.lt	.LBB37_111
// %bb.106:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x11, [x22, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB37_108
.LBB37_107:                             //   in Loop: Header=BB37_108 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB37_111
.LBB37_108:                             //   Parent Loop BB37_91 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w28
	b.hi	.LBB37_107
// %bb.109:                             //   in Loop: Header=BB37_108 Depth=2
	ldr	w12, [x11]
	cmp	w12, w28
	b.lo	.LBB37_107
// %bb.110:                             //   in Loop: Header=BB37_91 Depth=1
	ldur	x8, [x11, #-80]
.LBB37_111:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x9, [x20, #8]
	ldr	x10, [x8, #128]
	cmp	x9, x10
	b.ne	.LBB37_115
// %bb.112:                             //   in Loop: Header=BB37_91 Depth=1
	ldrb	w9, [x20, #27]
	ldrb	w8, [x8, #108]
	cmp	w9, w8
	b.ne	.LBB37_115
// %bb.113:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x2, [x24, #32]
	mov	x0, x20
	mov	x1, x25
	bl	fscrypt_mergeable_bio
	tbnz	w0, #0, .LBB37_140
	b	.LBB37_115
.LBB37_114:                             //   in Loop: Header=BB37_91 Depth=1
	ldrh	w12, [x8, #360]
	lsr	w12, w12, #2
	b	.LBB37_97
.LBB37_115:                             //   in Loop: Header=BB37_91 Depth=1
	ldrb	w8, [x26, #111]
	mov	w10, #1
	tbnz	w8, #1, .LBB37_117
// %bb.116:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	w8, [x26, #2512]
	add	w8, w8, #1              // =1
	str	w8, [x26, #2512]
.LBB37_117:                             //   in Loop: Header=BB37_91 Depth=1
	ldrb	w8, [x20, #16]
	cbz	w8, .LBB37_124
// %bb.118:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	w8, [x22, #1504]
	ldr	w19, [x20, #88]
	cmp	w8, #1                  // =1
	b.ne	.LBB37_121
// %bb.119:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x0, [x26, #2504]
	cbz	x0, .LBB37_121
// %bb.120:                             //   in Loop: Header=BB37_91 Depth=1
	bl	blk_finish_plug
	mov	w10, #1
.LBB37_121:                             //   in Loop: Header=BB37_91 Depth=1
	add	w8, w19, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB37_146
.LBB37_122:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	w8, [x22, #1432]
	lsl	w8, w10, w8
	cmp	w8, #2                  // =2
	b.lt	.LBB37_124
// %bb.123:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	w9, [x20, #48]
	sub	w8, w8, #1              // =1
	tst	w8, w9, lsr #12
	b.ne	.LBB37_264
.LBB37_124:                             //   in Loop: Header=BB37_91 Depth=1
	ldrb	w8, [x20, #16]
	mov	w11, #1
	ldr	x19, [x22]
	cbz	w8, .LBB37_131
// %bb.125:                             //   in Loop: Header=BB37_91 Depth=1
	adrp	x8, __tracepoint_f2fs_submit_write_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_write_bio
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB37_139
// %bb.126:                             //   in Loop: Header=BB37_91 Depth=1
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
	cbz	x20, .LBB37_139
// %bb.127:                             //   in Loop: Header=BB37_91 Depth=1
	lsl	x8, x11, x8
	and	x8, x8, x9
	cbz	x8, .LBB37_139
// %bb.128:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	w8, [x26, #80]
	add	w8, w8, #1              // =1
	str	w8, [x26, #80]
	adrp	x8, __tracepoint_f2fs_submit_write_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_write_bio
	//APP
	//NO_APP
	ldr	x27, [x8, #32]
	cbz	x27, .LBB37_130
.LBB37_129:                             //   Parent Loop BB37_91 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x8, x0, [x27]
	mov	x1, x19
	mov	w2, wzr
	mov	x3, x20
	blr	x8
	ldr	x8, [x27, #24]!
	cbnz	x8, .LBB37_129
.LBB37_130:                             //   in Loop: Header=BB37_91 Depth=1
	//APP
	//NO_APP
	b	.LBB37_137
.LBB37_131:                             //   in Loop: Header=BB37_91 Depth=1
	adrp	x8, __tracepoint_f2fs_submit_read_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_read_bio
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB37_139
// %bb.132:                             //   in Loop: Header=BB37_91 Depth=1
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
	cbz	x20, .LBB37_139
// %bb.133:                             //   in Loop: Header=BB37_91 Depth=1
	lsl	x8, x11, x8
	and	x8, x8, x9
	cbz	x8, .LBB37_139
// %bb.134:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	w8, [x26, #80]
	add	w8, w8, #1              // =1
	str	w8, [x26, #80]
	adrp	x8, __tracepoint_f2fs_submit_read_bio
	add	x8, x8, :lo12:__tracepoint_f2fs_submit_read_bio
	//APP
	//NO_APP
	ldr	x27, [x8, #32]
	cbz	x27, .LBB37_136
.LBB37_135:                             //   Parent Loop BB37_91 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldp	x8, x0, [x27]
	mov	x1, x19
	mov	w2, wzr
	mov	x3, x20
	blr	x8
	ldr	x8, [x27, #24]!
	cbnz	x8, .LBB37_135
.LBB37_136:                             //   in Loop: Header=BB37_91 Depth=1
	//APP
	//NO_APP
.LBB37_137:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	w8, [x26, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x26, #80]
	ldr	x27, [sp, #8]           // 8-byte Folded Reload
	b.ne	.LBB37_139
// %bb.138:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x8, [x26]
	tbnz	w8, #1, .LBB37_166
.LBB37_139:                             //   in Loop: Header=BB37_91 Depth=1
	mov	x0, x20
	bl	submit_bio
	mov	x20, xzr
.LBB37_140:                             //   in Loop: Header=BB37_91 Depth=1
	cbnz	x20, .LBB37_142
// %bb.141:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	w8, [sp, #68]           // 4-byte Folded Reload
	mov	x0, x25
	ldr	x4, [x24, #32]
	mov	w1, w28
	ldr	w2, [sp, #52]           // 4-byte Folded Reload
	ldr	w3, [sp, #20]           // 4-byte Folded Reload
	and	w5, w8, #0x1
	bl	f2fs_grab_read_bio
	mov	x20, x0
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB37_213
.LBB37_142:                             //   in Loop: Header=BB37_91 Depth=1
	ldur	x19, [x29, #-64]        // 8-byte Folded Reload
	mov	x0, x20
	mov	x1, x24
	mov	w3, wzr
	mov	w2, w19
	bl	bio_add_page
	cmp	w0, w19
	b.lo	.LBB37_115
// %bb.143:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x8, [x20, #80]
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	ldr	w9, [x8, #64]
	orr	w9, w9, #0x2
	str	w9, [x8, #64]
	bl	refcount_inc_checked
	ldr	x10, [sp, #24]          // 8-byte Folded Reload
	//APP
	// atomic_add
	prfm	pstl1strm, [x10]
1:	ldxr	w8, [x10]
	add	w8, w8, 1
	stxr	w9, w8, [x10]
	cbnz	w9, 1b
	//NO_APP
	ldrb	w8, [x22, #2600]
	cbz	w8, .LBB37_89
// %bb.144:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x19, [sp, #40]          // 8-byte Folded Reload
	mov	x0, x19
	bl	_raw_spin_lock
	ldr	x8, [x22, #2376]
	mov	x0, x19
	add	x8, x8, #1, lsl #12     // =4096
	str	x8, [x22, #2376]
	bl	_raw_spin_unlock
	mov	x0, x22
	bl	f2fs_record_iostat
	ldrb	w8, [x22, #2600]
	cbz	w8, .LBB37_89
// %bb.145:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x19, [sp, #40]          // 8-byte Folded Reload
	mov	x0, x19
	bl	_raw_spin_lock
	ldr	x8, [x22, #2392]
	mov	x0, x19
	add	x8, x8, #1, lsl #12     // =4096
	str	x8, [x22, #2392]
	bl	_raw_spin_unlock
	mov	x0, x22
	bl	f2fs_record_iostat
	b	.LBB37_89
.LBB37_146:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	w9, [x22, #3024]
	cbz	w9, .LBB37_155
// %bb.147:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x8, [x22]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB37_154
// %bb.148:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x11, [x22, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB37_150
.LBB37_149:                             //   in Loop: Header=BB37_150 Depth=2
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB37_153
.LBB37_150:                             //   Parent Loop BB37_91 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x11, #-4]
	cmp	w12, w19
	b.hi	.LBB37_149
// %bb.151:                             //   in Loop: Header=BB37_150 Depth=2
	ldr	w12, [x11]
	cmp	w12, w19
	b.lo	.LBB37_149
// %bb.152:                             //   in Loop: Header=BB37_91 Depth=1
	ldur	x8, [x11, #-80]
.LBB37_153:                             //   in Loop: Header=BB37_91 Depth=1
	mov	w10, #1
.LBB37_154:                             //   in Loop: Header=BB37_91 Depth=1
	cbz	x8, .LBB37_122
.LBB37_155:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x8, [x22, #136]
	cbz	x8, .LBB37_157
// %bb.156:                             //   in Loop: Header=BB37_91 Depth=1
	add	x9, x8, #80             // =80
	b	.LBB37_158
.LBB37_157:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x9, [x22, #16]
	add	x9, x9, #72             // =72
.LBB37_158:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x10, [x8, #8]
	ldr	w9, [x9]
	ldr	w11, [x22, #1184]
	ldr	w10, [x10]
	sub	w9, w19, w9
	lsr	w9, w9, w11
	sub	w9, w9, w10
	mov	w10, #1
	cmn	w9, #1                  // =1
	b.eq	.LBB37_122
// %bb.159:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	x8, [x8]
	mov	w11, #48
	ldr	x8, [x8, #136]
	umaddl	x19, w9, w11, x8
	cbz	x19, .LBB37_122
// %bb.160:                             //   in Loop: Header=BB37_91 Depth=1
	ldr	w8, [x19]
	mov	w11, #455
	and	w9, w8, #0x3f
	cmp	w9, #8                  // =8
	lsl	w9, w10, w9
	and	w9, w9, w11
	ccmp	w9, #0, #4, ls
	b.eq	.LBB37_162
.LBB37_161:                             //   in Loop: Header=BB37_91 Depth=1
	and	w8, w8, #0x3f
	cmp	w8, #8                  // =8
	lsl	w8, w10, w8
	and	w8, w8, w11
	ccmp	w8, #0, #4, ls
	b.ne	.LBB37_122
	b	.LBB37_269
.LBB37_162:                             //   in Loop: Header=BB37_91 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB37_165
// %bb.163:                             //   in Loop: Header=BB37_91 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB37_165
// %bb.164:                             //   in Loop: Header=BB37_91 Depth=1
	adrp	x27, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.__submit_bio
	mov	w3, #892
	ldr	x0, [x27, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x27, :lo12:f2fs_dclient]
	mov	w1, #15241
	ldr	x27, [sp, #8]           // 8-byte Folded Reload
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB37_165:                             //   in Loop: Header=BB37_91 Depth=1
	mov	x0, x22
	bl	f2fs_print_raw_sb_info
	mov	x0, x22
	bl	f2fs_print_ckpt_info
	mov	x0, x22
	bl	f2fs_print_sbi_info
	ldr	w8, [x19]
	mov	w10, #1
	mov	w11, #455
	b	.LBB37_161
.LBB37_166:                             //   in Loop: Header=BB37_91 Depth=1
	bl	preempt_schedule_notrace
	b	.LBB37_139
.LBB37_167:
	tbnz	w8, #0, .LBB37_172
// %bb.168:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB37_171
// %bb.169:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB37_171
// %bb.170:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB37_171:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB37_172:
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB37_274
.LBB37_173:
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
	cbnz	w9, .LBB37_175
// %bb.174:
	bl	__put_page
.LBB37_175:
	ldur	x8, [x29, #-48]
	cbz	x8, .LBB37_179
// %bb.176:
	ldur	x9, [x29, #-40]
	cmp	x9, x8
	b.eq	.LBB37_179
// %bb.177:
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
	cbnz	w9, .LBB37_179
// %bb.178:
	bl	__put_page
.LBB37_179:
	stp	xzr, xzr, [x23]
	ldr	w8, [x21, #16]
	cbnz	w8, .LBB37_40
	b	.LBB37_211
.LBB37_180:
	ldur	x21, [x29, #-40]
	ldr	x22, [sp]               // 8-byte Folded Reload
	cbz	x21, .LBB37_206
// %bb.181:
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
	b.ne	.LBB37_198
// %bb.182:
	tbnz	w8, #0, .LBB37_196
// %bb.183:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB37_186
// %bb.184:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB37_186
// %bb.185:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB37_186:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB37_188
// %bb.187:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB37_256
.LBB37_188:
	ldr	x0, [x21, #24]
.LBB37_189:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB37_191
// %bb.190:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB37_257
.LBB37_191:
	ldr	x0, [x21, #24]
.LBB37_192:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB37_194
// %bb.193:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB37_258
.LBB37_194:
	ldr	x0, [x21, #24]
.LBB37_195:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB37_196:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB37_204
// %bb.197:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB37_198:
	tbnz	w8, #0, .LBB37_203
// %bb.199:
	bl	print_bdev_access_info
	adrp	x19, f2fs_dclient
	ldr	x0, [x19, :lo12:f2fs_dclient]
	cbz	x0, .LBB37_202
// %bb.200:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB37_202
// %bb.201:
	ldr	x0, [x19, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB37_202:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB37_203:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB37_275
.LBB37_204:
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
	cbnz	w9, .LBB37_206
// %bb.205:
	bl	__put_page
.LBB37_206:
	ldur	x8, [x29, #-48]
	cbz	x8, .LBB37_210
// %bb.207:
	ldur	x9, [x29, #-40]
	cmp	x9, x8
	b.eq	.LBB37_210
// %bb.208:
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
	cbnz	w9, .LBB37_210
// %bb.209:
	bl	__put_page
.LBB37_210:
	mov	w28, wzr
	stp	xzr, xzr, [x22]
.LBB37_211:
	ldr	x8, [sp, #72]           // 8-byte Folded Reload
	adrp	x9, __stack_chk_guard
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	str	x20, [x8]
	ldur	x8, [x29, #-8]
	cmp	x9, x8
	b.ne	.LBB37_259
// %bb.212:
	mov	w0, w28
	ldp	x20, x19, [sp, #224]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #208]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #192]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #176]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #160]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	add	sp, sp, #240            // =240
	ret
.LBB37_213:
	cmp	w20, #0                 // =0
	mov	x0, x27
	cset	w1, ne
	mov	w28, w20
	bl	f2fs_decompress_end_io
	ldur	x20, [x29, #-40]
	ldr	x19, [sp]               // 8-byte Folded Reload
	cbz	x20, .LBB37_239
// %bb.214:
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
	b.ne	.LBB37_231
// %bb.215:
	tbnz	w8, #0, .LBB37_229
// %bb.216:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB37_219
// %bb.217:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB37_219
// %bb.218:
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB37_219:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB37_221
// %bb.220:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB37_260
.LBB37_221:
	ldr	x0, [x20, #24]
.LBB37_222:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB37_224
// %bb.223:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB37_261
.LBB37_224:
	ldr	x0, [x20, #24]
.LBB37_225:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB37_227
// %bb.226:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB37_262
.LBB37_227:
	ldr	x0, [x20, #24]
.LBB37_228:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB37_229:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB37_237
// %bb.230:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB37_231:
	tbnz	w8, #0, .LBB37_236
// %bb.232:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB37_235
// %bb.233:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB37_235
// %bb.234:
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB37_235:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB37_236:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB37_276
.LBB37_237:
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
	cbnz	w9, .LBB37_239
// %bb.238:
	bl	__put_page
.LBB37_239:
	ldur	x8, [x29, #-48]
	cbz	x8, .LBB37_243
// %bb.240:
	ldur	x9, [x29, #-40]
	cmp	x9, x8
	b.eq	.LBB37_243
// %bb.241:
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
	cbnz	w9, .LBB37_243
// %bb.242:
	bl	__put_page
.LBB37_243:
	mov	x20, xzr
	stp	xzr, xzr, [x19]
	b	.LBB37_211
.LBB37_244:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB37_247
// %bb.245:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB37_247
// %bb.246:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_read_multi_pages
	add	x1, x1, :lo12:.L.str
	mov	w3, #3427
	add	x2, x2, :lo12:.L__func__.f2fs_read_multi_pages
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB37_247:
	mov	x0, x22
	bl	f2fs_print_raw_sb_info
	mov	x0, x22
	bl	f2fs_print_ckpt_info
	mov	x0, x22
	bl	f2fs_print_sbi_info
	b	.LBB37_1
.LBB37_248:
	bl	print_bdev_access_info
	adrp	x23, f2fs_dclient
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB37_251
// %bb.249:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB37_251
// %bb.250:
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_read_multi_pages
	add	x1, x1, :lo12:.L.str
	mov	w3, #3461
	add	x2, x2, :lo12:.L__func__.f2fs_read_multi_pages
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB37_251:
	mov	x0, x22
	bl	f2fs_print_raw_sb_info
	mov	x0, x22
	bl	f2fs_print_ckpt_info
	mov	x0, x22
	bl	f2fs_print_sbi_info
	ldur	w8, [x29, #-20]
	cmn	w8, #2                  // =2
	b.eq	.LBB37_45
// %bb.252:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 3461; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB37_253:
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB37_78
.LBB37_254:
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB37_81
.LBB37_255:
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB37_84
.LBB37_256:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB37_189
.LBB37_257:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB37_192
.LBB37_258:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB37_195
.LBB37_259:
	bl	__stack_chk_fail
.LBB37_260:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB37_222
.LBB37_261:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB37_225
.LBB37_262:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB37_228
.LBB37_263:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 3427; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB37_264:
	ldr	x0, [x22, #216]
	mov	w1, #2048
	movk	w1, #96, lsl #16
	bl	mempool_alloc
	mov	x19, x0
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbnz	x19, .LBB37_270
// %bb.265:
	cbz	x0, .LBB37_268
// %bb.266:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB37_268
// %bb.267:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #913
	add	x2, x2, :lo12:.L__func__.__submit_bio
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB37_268:
	mov	x0, x22
	bl	f2fs_print_raw_sb_info
	mov	x0, x22
	bl	f2fs_print_ckpt_info
	mov	x0, x22
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 913; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB37_269:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 892; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB37_270:
	cbz	x0, .LBB37_273
// %bb.271:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB37_273
// %bb.272:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.__submit_bio
	add	x1, x1, :lo12:.L.str
	mov	w3, #917
	add	x2, x2, :lo12:.L__func__.__submit_bio
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB37_273:
	mov	x0, x22
	bl	f2fs_print_raw_sb_info
	mov	x0, x22
	bl	f2fs_print_ckpt_info
	mov	x0, x22
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 917; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB37_274:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB37_275:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB37_276:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end37:
	.size	f2fs_read_multi_pages, .Lfunc_end37-f2fs_read_multi_pages
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_grab_read_bio
	.type	f2fs_grab_read_bio,@function
f2fs_grab_read_bio:                     // @f2fs_grab_read_bio
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	mov	w9, #6291456
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	mov	w21, #64
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	movk	w21, #96, lsl #16
	ldr	x8, [x0, #40]
	tst	w5, #0x1
	orr	w10, w21, #0x80
	str	x25, [sp, #16]          // 8-byte Folded Spill
	mov	x20, x0
	csel	w0, w9, w10, ne
	cmp	w2, #256                // =256
	mov	w24, w1
	ldr	x25, [x8, #1104]
	mov	w8, #256
	csel	w1, w2, w8, lt
	adrp	x2, f2fs_bioset
	add	x2, x2, :lo12:f2fs_bioset
	mov	x29, sp
	mov	x22, x4
	mov	w23, w3
	bl	bio_alloc_bioset
	cbz	x0, .LBB38_15
// %bb.1:
	ldr	x8, [x25]
	mov	x19, x0
	ldr	x8, [x8, #248]
	str	w24, [x0, #88]
	ldr	w9, [x25, #3024]
	cmp	w9, #2                  // =2
	b.lt	.LBB38_7
// %bb.2:
	ldr	x10, [x25, #3032]
	mov	x11, xzr
	add	x10, x10, #80           // =80
	b	.LBB38_4
.LBB38_3:                               //   in Loop: Header=BB38_4 Depth=1
	add	x11, x11, #1            // =1
	add	x10, x10, #192          // =192
	cmp	x11, x9
	b.eq	.LBB38_7
.LBB38_4:                               // =>This Inner Loop Header: Depth=1
	ldur	w12, [x10, #-4]
	cmp	w12, w24
	b.hi	.LBB38_3
// %bb.5:                               //   in Loop: Header=BB38_4 Depth=1
	ldr	w13, [x10]
	cmp	w13, w24
	b.lo	.LBB38_3
// %bb.6:
	ldur	x8, [x10, #-80]
	sub	w24, w24, w12
.LBB38_7:
	ldr	x9, [x19, #8]
	ldr	x10, [x8, #128]
	cmp	x9, x10
	b.eq	.LBB38_9
// %bb.8:
	ldrh	w9, [x19, #20]
	and	w9, w9, #0xfffffbff
	strh	w9, [x19, #20]
	ldr	x9, [x8, #128]
.LBB38_9:
	str	x9, [x19, #8]
	mov	w9, w24
	ldrb	w8, [x8, #108]
	mov	x0, x19
	mov	x1, x20
	mov	x2, x22
	mov	w3, w21
	lsl	x9, x9, #3
	strb	w8, [x19, #27]
	str	x9, [x19, #40]
	bl	fscrypt_set_bio_crypt_ctx
	adrp	x8, f2fs_read_end_io
	mov	x0, x20
	add	x8, x8, :lo12:f2fs_read_end_io
	str	w23, [x19, #16]
	str	x8, [x19, #72]
	bl	fscrypt_inode_uses_fs_layer_crypto
	ldr	x9, [x20, #640]
	and	w8, w0, #0x1
	cbz	x9, .LBB38_12
// %bb.10:
	ldr	x9, [x20, #80]
	add	x9, x9, #4095           // =4095
	cmp	x22, x9, lsr #12
	b.hs	.LBB38_12
// %bb.11:
	orr	w22, w8, #0x4
	ldrsb	w8, [x20, #688]
	tbz	w8, #31, .LBB38_14
	b	.LBB38_23
.LBB38_12:
	tbz	w8, #0, .LBB38_16
// %bb.13:
	mov	w22, #1
	ldrsb	w8, [x20, #688]
	tbnz	w8, #31, .LBB38_23
.LBB38_14:
	adrp	x8, bio_post_read_ctx_pool
	mov	w1, w21
	ldr	x0, [x8, :lo12:bio_post_read_ctx_pool]
	bl	mempool_alloc
	stp	x19, x25, [x0]
	str	w22, [x0, #64]
	str	x0, [x19, #80]
	str	xzr, [x0, #72]
	b	.LBB38_25
.LBB38_15:
	mov	x19, #-12
	b	.LBB38_25
.LBB38_16:
	ldr	x8, [x20, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB38_20
// %bb.17:
	ldr	w8, [x20, #1256]
	cbnz	w8, .LBB38_22
// %bb.18:
	ldr	x8, [x20, #712]
	tbnz	x8, #35, .LBB38_22
// %bb.19:
	ldr	x8, [x20, #712]
	tbnz	x8, #34, .LBB38_22
	b	.LBB38_25
.LBB38_20:
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB38_25
// %bb.21:
	ldr	x8, [x20, #712]
	tbz	w8, #31, .LBB38_25
.LBB38_22:
	mov	w22, wzr
	ldrsb	w8, [x20, #688]
	tbz	w8, #31, .LBB38_14
.LBB38_23:
	ldr	x8, [x20, #632]
	cbnz	x8, .LBB38_25
// %bb.24:
	mov	x0, x19
	bl	bio_put
	mov	x19, #-126
.LBB38_25:
	mov	x0, x19
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.Lfunc_end38:
	.size	f2fs_grab_read_bio, .Lfunc_end38-f2fs_grab_read_bio
                                        // -- End function
	.globl	f2fs_mpage_readpages    // -- Begin function f2fs_mpage_readpages
	.p2align	3
	.type	f2fs_mpage_readpages,@function
f2fs_mpage_readpages:                   // @f2fs_mpage_readpages
// %bb.0:
	sub	sp, sp, #368            // =368
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #272]    // 16-byte Folded Spill
	add	x29, sp, #272           // =272
	stp	x28, x27, [sp, #288]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #304]    // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #320]    // 16-byte Folded Spill
	mov	x24, x2
	stp	x22, x21, [sp, #336]    // 16-byte Folded Spill
	mov	w21, w4
	stp	x20, x19, [sp, #352]    // 16-byte Folded Spill
	mov	w20, w3
	stur	x8, [x29, #-16]
	mov	w8, #-1
	ldr	x19, [x0]
	mov	x22, x1
	stp	xzr, xzr, [x29, #-32]
	str	x0, [sp, #80]           // 8-byte Folded Spill
	str	xzr, [sp, #120]
	stp	x19, x8, [sp, #96]
	ldr	w8, [x19, #1268]
	ldrb	w9, [x19, #1261]
	str	wzr, [sp, #128]
	str	xzr, [sp, #136]
	str	wzr, [sp, #144]
	stp	w8, w9, [sp, #112]
	mov	w8, #11
	stp	xzr, xzr, [sp, #152]
	stp	xzr, xzr, [sp, #168]
	stp	xzr, xzr, [sp, #184]
	stp	xzr, xzr, [x29, #-72]
	stp	xzr, xzr, [x29, #-56]
	stur	w8, [x29, #-40]
	sturb	wzr, [x29, #-36]
	cbz	x1, .LBB39_2
// %bb.1:
	ldr	x8, [x19, #40]
	mov	w2, #25
	mov	w1, #4096
	mov	w3, #1
	ldr	x0, [x8, #248]
	bl	blk_throtl_get_quota
.LBB39_2:
	cbz	w20, .LBB39_118
// %bb.3:
	tst	w21, #0x1
	mov	w8, #524288
	csel	w8, w8, wzr, ne
	add	x25, x19, #720          // =720
	mov	x23, xzr
	mov	w28, w20
	str	xzr, [sp, #16]          // 8-byte Folded Spill
	stp	w8, w21, [sp, #28]      // 8-byte Folded Spill
	add	x8, x19, #1296          // =1296
	str	wzr, [sp, #52]          // 4-byte Folded Spill
	str	w20, [sp, #36]          // 4-byte Folded Spill
	//APP
	mrs x20, sp_el0
	//NO_APP
	stp	x8, x25, [sp, #56]      // 16-byte Folded Spill
	add	x8, x19, #1304          // =1304
	str	x22, [sp, #72]          // 8-byte Folded Spill
	str	x8, [sp, #40]           // 8-byte Folded Spill
	b	.LBB39_5
.LBB39_4:                               //   in Loop: Header=BB39_5 Depth=1
	sub	x8, x28, #1             // =1
	cmp	w28, #1                 // =1
	mov	x28, x8
	b.eq	.LBB39_121
.LBB39_5:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB39_89 Depth 2
	cbz	x22, .LBB39_12
// %bb.6:                               //   in Loop: Header=BB39_5 Depth=1
	ldr	x21, [x22, #8]
	mov	x0, x21
	sub	x24, x21, #8            // =8
	//APP
	prfm pstl1keep, [x24]

	//NO_APP
	bl	__list_del_entry_valid
	tbz	w0, #0, .LBB39_8
// %bb.7:                               //   in Loop: Header=BB39_5 Depth=1
	ldp	x9, x8, [x21]
	str	x8, [x9, #8]
	str	x9, [x8]
.LBB39_8:                               //   in Loop: Header=BB39_5 Depth=1
	mov	x9, #256
	movk	x9, #57005, lsl #48
	add	x8, x9, #256            // =256
	stp	x9, x8, [x21]
	ldr	x8, [x21]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB39_10
// %bb.9:                               //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB39_101
.LBB39_10:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x2, [x21, #24]
.LBB39_11:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x1, [sp, #80]           // 8-byte Folded Reload
	mov	w9, #4608
	mov	x0, x24
	ldr	w8, [x1, #140]
	orr	w3, w8, w9
	bl	add_to_page_cache_lru
	cbnz	w0, .LBB39_70
.LBB39_12:                              //   in Loop: Header=BB39_5 Depth=1
	ldrh	w8, [x19]
	lsl	x27, x24, #6
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB39_14
// %bb.13:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x19, #712]
	tbnz	w8, #31, .LBB39_38
.LBB39_14:                              //   in Loop: Header=BB39_5 Depth=1
	mov	x0, x25
	add	x8, x19, #1288          // =1288
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	down_read
	ldr	x8, [x19, #712]
	tbnz	x8, #43, .LBB39_16
.LBB39_15:                              //   in Loop: Header=BB39_5 Depth=1
	mov	x22, xzr
	b	.LBB39_19
.LBB39_16:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x19, #712]
	tbz	x8, #43, .LBB39_18
// %bb.17:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x19, #712]
	tbnz	x8, #44, .LBB39_15
.LBB39_18:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x0, [x19, #1280]
	bl	igrab
	mov	x22, x0
.LBB39_19:                              //   in Loop: Header=BB39_5 Depth=1
	mov	x0, x25
	bl	up_read
	cmp	x22, #0                 // =0
	csel	x26, x22, x19, ne
	cmp	x23, #0                 // =0
	csel	x8, x26, x23, eq
	cmp	x26, x8
	b.ne	.LBB39_100
.LBB39_20:                              //   in Loop: Header=BB39_5 Depth=1
	str	x27, [sp, #88]          // 8-byte Folded Spill
	ldur	x21, [x29, #-24]
	ldrb	w8, [x26, #142]
	ldr	x9, [x24, #8]
	sub	x10, x9, #1             // =1
	tst	x9, #0x1
	csel	x9, x24, x10, eq
	mov	w10, #1
	lsl	x25, x10, x8
	ldr	x9, [x9]
	tbz	w9, #19, .LBB39_22
// %bb.21:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB39_102
.LBB39_22:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x27, [x24, #32]
.LBB39_23:                              //   in Loop: Header=BB39_5 Depth=1
	ldrb	w9, [x26, #14]
	add	x8, x27, x28
	tbnz	w9, #0, .LBB39_26
// %bb.24:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x9, [x26, #712]
	tbnz	w9, #30, .LBB39_26
// %bb.25:                              //   in Loop: Header=BB39_5 Depth=1
	add	x9, x26, #80            // =80
	b	.LBB39_27
.LBB39_26:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x9, [x26, #40]
	add	x9, x9, #32             // =32
.LBB39_27:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x9, [x9]
	ldrb	w10, [x26, #142]
	add	x9, x9, w25, uxtw
	sub	x9, x9, #1              // =1
	lsr	x9, x9, x10
	cmp	x8, x9
	csel	x8, x9, x8, hi
	cmp	x8, x27
	b.ls	.LBB39_46
// %bb.28:                              //   in Loop: Header=BB39_5 Depth=1
	ldur	w9, [x29, #-60]
	tbz	w9, #5, .LBB39_31
// %bb.29:                              //   in Loop: Header=BB39_5 Depth=1
	ldur	w10, [x29, #-68]
	cmp	x27, x10
	b.ls	.LBB39_31
// %bb.30:                              //   in Loop: Header=BB39_5 Depth=1
	ldur	w11, [x29, #-64]
	add	w10, w11, w10
	cmp	x27, x10
	b.lo	.LBB39_45
.LBB39_31:                              //   in Loop: Header=BB39_5 Depth=1
	sub	w8, w8, w27
	sub	x1, x29, #72            // =72
	mov	x0, x26
	mov	w2, wzr
	mov	w3, wzr
	stp	w27, w8, [x29, #-68]
	bl	f2fs_map_blocks
	cbz	w0, .LBB39_44
// %bb.32:                              //   in Loop: Header=BB39_5 Depth=1
	mov	w23, w0
.LBB39_33:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x25, [sp, #64]          // 8-byte Folded Reload
	ldr	x27, [sp, #88]          // 8-byte Folded Reload
	stur	x21, [x29, #-24]
	cbnz	x22, .LBB39_55
.LBB39_34:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	w8, [x19, #1288]
	cbz	w8, .LBB39_64
.LBB39_35:                              //   in Loop: Header=BB39_5 Depth=1
	add	x8, x19, #1288          // =1288
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	ldr	x22, [sp, #72]          // 8-byte Folded Reload
	cbnz	w9, .LBB39_65
// %bb.36:                              //   in Loop: Header=BB39_5 Depth=1
	//APP
	dmb ish
	//NO_APP
	ldr	x9, [sp, #40]           // 8-byte Folded Reload
	ldr	x8, [x9]
	cmp	x9, x8
	b.eq	.LBB39_65
// %bb.37:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	mov	w1, #3
	mov	w2, wzr
	mov	x3, xzr
	bl	__wake_up
	b	.LBB39_65
.LBB39_38:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x1, [x24, #32]
	add	x0, sp, #96             // =96
	bl	f2fs_cluster_can_merge_page
	tbnz	w0, #0, .LBB39_40
// %bb.39:                              //   in Loop: Header=BB39_5 Depth=1
	ldp	w8, w2, [sp, #32]       // 8-byte Folded Reload
	add	x0, sp, #96             // =96
	sub	x1, x29, #24            // =24
	sub	x3, x29, #32            // =32
	mov	w5, wzr
	and	w4, w8, #0x1
	bl	f2fs_read_multi_pages
	mov	w21, w0
	add	x0, sp, #96             // =96
	mov	w1, wzr
	bl	f2fs_destroy_compress_ctx
	cbnz	w21, .LBB39_43
.LBB39_40:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x1, [x24, #32]
	mov	x0, x19
	bl	f2fs_is_compressed_cluster
	tbnz	w0, #31, .LBB39_43
// %bb.41:                              //   in Loop: Header=BB39_5 Depth=1
	cbz	w0, .LBB39_14
// %bb.42:                              //   in Loop: Header=BB39_5 Depth=1
	add	x0, sp, #96             // =96
	bl	f2fs_init_compress_ctx
	cbz	w0, .LBB39_99
.LBB39_43:                              //   in Loop: Header=BB39_5 Depth=1
	mov	x26, x23
	b	.LBB39_66
.LBB39_44:                              //   in Loop: Header=BB39_5 Depth=1
	ldur	w9, [x29, #-60]
.LBB39_45:                              //   in Loop: Header=BB39_5 Depth=1
	tbnz	w9, #5, .LBB39_75
.LBB39_46:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	w8, [x20, #80]
	mov	w1, wzr
	mov	w2, #4096
	add	w8, w8, #1              // =1
	str	w8, [x20, #80]
	//APP
	//NO_APP
	ldr	w8, [x20, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x20, #2984]
	//APP
	//NO_APP
	ldr	x27, [sp, #88]          // 8-byte Folded Reload
	orr	x0, x27, #0xffffffc000000000
	bl	memset
	//APP
	//NO_APP
	ldr	w8, [x20, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x20, #2984]
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	b.ne	.LBB39_48
// %bb.47:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x20]
	tbnz	w8, #1, .LBB39_104
.LBB39_48:                              //   in Loop: Header=BB39_5 Depth=1
	mov	x0, x24
	bl	flush_dcache_page
	ldr	x8, [x24, #32]
	ldr	x9, [x26, #640]
	ldr	x25, [sp, #64]          // 8-byte Folded Reload
	cbz	x9, .LBB39_51
// %bb.49:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x9, [x26, #80]
	add	x9, x9, #4095           // =4095
	cmp	x8, x9, lsr #12
	b.hs	.LBB39_51
// %bb.50:                              //   in Loop: Header=BB39_5 Depth=1
	mov	x0, x24
	bl	fsverity_verify_page
	tbz	w0, #0, .LBB39_78
.LBB39_51:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB39_53
// %bb.52:                              //   in Loop: Header=BB39_5 Depth=1
	//APP
	dmb ishst
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x24]
1:	ldxr	x8, [x24]
	orr	x8, x8, 4
	stxr	w9, x8, [x24]
	cbnz	w9, 1b
	//NO_APP
	b	.LBB39_54
.LBB39_53:                              //   in Loop: Header=BB39_5 Depth=1
	//APP
	dmb ishld
	//NO_APP
.LBB39_54:                              //   in Loop: Header=BB39_5 Depth=1
	mov	x0, x24
	bl	unlock_page
	mov	w23, wzr
	stur	x21, [x29, #-24]
	cbz	x22, .LBB39_34
.LBB39_55:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x22, #712]
	tbnz	x8, #43, .LBB39_60
.LBB39_56:                              //   in Loop: Header=BB39_5 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB39_59
// %bb.57:                              //   in Loop: Header=BB39_5 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB39_59
// %bb.58:                              //   in Loop: Header=BB39_5 Depth=1
	adrp	x21, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.put_inner_inode
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.put_inner_inode
	mov	w3, #4511
	ldr	x0, [x21, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB39_59:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x22, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
	b	.LBB39_61
.LBB39_60:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x22, #712]
	tbz	x8, #44, .LBB39_56
.LBB39_61:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x22, #712]
	tbz	x8, #43, .LBB39_132
// %bb.62:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x22, #712]
	tbz	x8, #44, .LBB39_132
// %bb.63:                              //   in Loop: Header=BB39_5 Depth=1
	mov	x0, x22
	bl	iput
	ldr	w8, [x19, #1288]
	cbnz	w8, .LBB39_35
.LBB39_64:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x19, #40]
	adrp	x1, .L.str.19
	ldr	x2, [x19, #64]
	add	x1, x1, :lo12:.L.str.19
	ldr	x0, [x8, #1104]
	bl	f2fs_printk
	ldr	x0, [sp, #56]           // 8-byte Folded Reload
	mov	w1, #3
	mov	w2, wzr
	mov	x3, xzr
	bl	__wake_up
	ldr	x22, [sp, #72]          // 8-byte Folded Reload
.LBB39_65:                              //   in Loop: Header=BB39_5 Depth=1
	cbz	w23, .LBB39_69
.LBB39_66:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x24, #8]
	orr	x0, x27, #0xffffffc000000000
	mov	w1, wzr
	mov	w2, #4096
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 256
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	w8, [x20, #80]
	add	w8, w8, #1              // =1
	str	w8, [x20, #80]
	//APP
	//NO_APP
	ldr	w8, [x20, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x20, #2984]
	//APP
	//NO_APP
	bl	memset
	//APP
	//NO_APP
	ldr	w8, [x20, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x20, #2984]
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	b.ne	.LBB39_68
// %bb.67:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x20]
	tbnz	w8, #1, .LBB39_103
.LBB39_68:                              //   in Loop: Header=BB39_5 Depth=1
	mov	x0, x24
	bl	flush_dcache_page
	mov	x0, x24
	bl	unlock_page
.LBB39_69:                              //   in Loop: Header=BB39_5 Depth=1
	mov	x23, x26
	cbz	x22, .LBB39_72
.LBB39_70:                              //   in Loop: Header=BB39_5 Depth=1
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
	cbnz	w9, .LBB39_72
// %bb.71:                              //   in Loop: Header=BB39_5 Depth=1
	bl	__put_page
.LBB39_72:                              //   in Loop: Header=BB39_5 Depth=1
	ldrh	w8, [x19]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB39_4
// %bb.73:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x19, #712]
	cmp	x28, #1                 // =1
	b.ne	.LBB39_4
// %bb.74:                              //   in Loop: Header=BB39_5 Depth=1
	tbz	w8, #31, .LBB39_4
	b	.LBB39_119
.LBB39_75:                              //   in Loop: Header=BB39_5 Depth=1
	ldp	w8, w9, [x29, #-72]
	ldr	x10, [x24, #8]
	add	x8, x27, x8
	sub	x23, x8, x9
	sub	x11, x10, #1            // =1
	tst	x10, #0x1
	csel	x10, x24, x11, eq
	//APP
	// atomic64_or
	prfm	pstl1strm, [x10]
1:	ldxr	x11, [x10]
	orr	x11, x11, 131072
	stxr	w12, x11, [x10]
	cbnz	w12, 1b
	//NO_APP
	ldr	x10, [x24, #8]
	sub	x11, x10, #1            // =1
	tst	x10, #0x1
	csel	x10, x24, x11, eq
	ldr	x10, [x10]
	tbnz	w10, #2, .LBB39_79
// %bb.76:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB39_80
// %bb.77:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	xzr, [x24]
	b	.LBB39_80
.LBB39_78:                              //   in Loop: Header=BB39_5 Depth=1
	mov	w23, #-12
	stur	x21, [x29, #-24]
	cbnz	x22, .LBB39_55
	b	.LBB39_34
.LBB39_79:                              //   in Loop: Header=BB39_5 Depth=1
	//APP
	dmb ishld
	//NO_APP
.LBB39_80:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x26, #40]
	mov	w1, w23
	mov	w2, #8
	ldr	x0, [x8, #1104]
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB39_98
// %bb.81:                              //   in Loop: Header=BB39_5 Depth=1
	cbz	x21, .LBB39_106
// %bb.82:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x26, #40]
	ldr	x9, [x8, #1104]
	ldur	w8, [x29, #-32]
	ldr	x10, [x9, #1224]
	cbz	x10, .LBB39_84
// %bb.83:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	w11, [x21, #48]
	cmp	x10, x11
	cset	w10, ls
.LBB39_84:                              //   in Loop: Header=BB39_5 Depth=1
	add	w8, w8, #1              // =1
	cmp	w8, w23
	b.ne	.LBB39_105
// %bb.85:                              //   in Loop: Header=BB39_5 Depth=1
	tbnz	w10, #0, .LBB39_105
// %bb.86:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x9]
	ldr	w10, [x9, #3024]
	ldr	x8, [x8, #248]
	cmp	w10, #2                 // =2
	b.lt	.LBB39_92
// %bb.87:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x9, [x9, #3032]
	mov	x11, xzr
	add	x9, x9, #80             // =80
	b	.LBB39_89
.LBB39_88:                              //   in Loop: Header=BB39_89 Depth=2
	add	x11, x11, #1            // =1
	add	x9, x9, #192            // =192
	cmp	x11, x10
	b.eq	.LBB39_92
.LBB39_89:                              //   Parent Loop BB39_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w12, [x9, #-4]
	cmp	w12, w23
	b.hi	.LBB39_88
// %bb.90:                              //   in Loop: Header=BB39_89 Depth=2
	ldr	w12, [x9]
	cmp	w12, w23
	b.lo	.LBB39_88
// %bb.91:                              //   in Loop: Header=BB39_5 Depth=1
	ldur	x8, [x9, #-80]
.LBB39_92:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x9, [x21, #8]
	ldr	x10, [x8, #128]
	cmp	x9, x10
	b.ne	.LBB39_105
// %bb.93:                              //   in Loop: Header=BB39_5 Depth=1
	ldrb	w9, [x21, #27]
	ldrb	w8, [x8, #108]
	cmp	w9, w8
	b.ne	.LBB39_105
// %bb.94:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x2, [x24, #32]
	mov	x0, x21
	mov	x1, x26
	bl	fscrypt_mergeable_bio
	tbz	w0, #0, .LBB39_105
// %bb.95:                              //   in Loop: Header=BB39_5 Depth=1
	ldrb	w8, [x26, #13]
	tbz	w8, #6, .LBB39_113
// %bb.96:                              //   in Loop: Header=BB39_5 Depth=1
	ldr	x9, [sp, #16]           // 8-byte Folded Reload
	sub	x8, x27, #1             // =1
	cmp	x9, x8
	b.eq	.LBB39_113
// %bb.97:                              //   in Loop: Header=BB39_5 Depth=1
	ldrsb	w8, [x26, #688]
	tbnz	w8, #31, .LBB39_105
	b	.LBB39_113
.LBB39_98:                              //   in Loop: Header=BB39_5 Depth=1
	mov	w23, #-12
	b	.LBB39_33
.LBB39_99:                              //   in Loop: Header=BB39_5 Depth=1
	add	x0, sp, #96             // =96
	mov	x1, x24
	bl	f2fs_compress_ctx_add_page
	mov	x26, x23
	mov	x23, x26
	cbnz	x22, .LBB39_70
	b	.LBB39_72
.LBB39_100:                             //   in Loop: Header=BB39_5 Depth=1
	sub	x0, x29, #72            // =72
	mov	w1, wzr
	mov	w2, #40
	bl	memset
	mov	w8, #11
	stur	w8, [x29, #-40]
	b	.LBB39_20
.LBB39_101:                             //   in Loop: Header=BB39_5 Depth=1
	mov	x0, x24
	bl	__page_file_index
	mov	x2, x0
	b	.LBB39_11
.LBB39_102:                             //   in Loop: Header=BB39_5 Depth=1
	mov	x0, x24
	bl	__page_file_index
	mov	x27, x0
	b	.LBB39_23
.LBB39_103:                             //   in Loop: Header=BB39_5 Depth=1
	bl	preempt_schedule
	b	.LBB39_68
.LBB39_104:                             //   in Loop: Header=BB39_5 Depth=1
	bl	preempt_schedule
	b	.LBB39_48
.LBB39_105:                             //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x26, #40]
	mov	x1, x21
	mov	w2, wzr
	ldr	x0, [x8, #1104]
	ldr	w8, [sp, #52]           // 4-byte Folded Reload
	add	w8, w8, #1              // =1
	str	w8, [sp, #52]           // 4-byte Folded Spill
	bl	__f2fs_submit_read_bio
.LBB39_106:                             //   in Loop: Header=BB39_5 Depth=1
	ldr	x4, [x24, #32]
	mov	x0, x26
	ldr	w3, [sp, #28]           // 4-byte Folded Reload
	mov	w1, w23
	mov	w2, w28
	mov	w5, wzr
	bl	f2fs_grab_read_bio
	mov	x21, x0
	cmn	x0, #4095               // =4095
	b.lo	.LBB39_108
// %bb.107:                             //   in Loop: Header=BB39_5 Depth=1
	mov	w23, w21
	mov	x21, xzr
	b	.LBB39_33
.LBB39_108:                             //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x26, #40]
	mov	x1, x26
	ldr	x0, [x8, #1104]
	bl	f2fs_inode_support_dedup
	tbz	w0, #0, .LBB39_113
// %bb.109:                             //   in Loop: Header=BB39_5 Depth=1
	str	x23, [sp, #8]           // 8-byte Folded Spill
	ldr	x23, [x21, #80]
	cbnz	x23, .LBB39_112
// %bb.110:                             //   in Loop: Header=BB39_5 Depth=1
	adrp	x8, bio_post_read_ctx_pool
	mov	w1, #64
	movk	w1, #96, lsl #16
	ldr	x0, [x8, :lo12:bio_post_read_ctx_pool]
	bl	mempool_alloc
	cbz	x0, .LBB39_117
// %bb.111:                             //   in Loop: Header=BB39_5 Depth=1
	mov	w1, wzr
	mov	w2, #80
	mov	x23, x0
	bl	memset
	str	x21, [x23]
	ldr	x8, [x26, #40]
	ldr	x8, [x8, #1104]
	str	x8, [x23, #8]
	str	x23, [x21, #80]
.LBB39_112:                             //   in Loop: Header=BB39_5 Depth=1
	ldr	w8, [x23, #64]
	add	x9, x26, #1288          // =1288
	str	x26, [x23, #72]
	orr	w8, w8, #0x8
	str	w8, [x23, #64]
	//APP
	// atomic_add
	prfm	pstl1strm, [x9]
1:	ldxr	w8, [x9]
	add	w8, w8, 1
	stxr	w10, w8, [x9]
	cbnz	w10, 1b
	//NO_APP
	ldr	x23, [sp, #8]           // 8-byte Folded Reload
.LBB39_113:                             //   in Loop: Header=BB39_5 Depth=1
	mov	x0, x26
	mov	w1, w23
	bl	f2fs_wait_on_block_writeback
	mov	x0, x21
	mov	x1, x24
	mov	w2, w25
	mov	w3, wzr
	bl	bio_add_page
	cmp	w0, w25
	b.lo	.LBB39_105
// %bb.114:                             //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x26, #40]
	str	x23, [sp, #8]           // 8-byte Folded Spill
	ldr	x8, [x8, #1104]
	add	x8, x8, #1308           // =1308
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x26, #40]
	ldr	x23, [x8, #1104]
	ldrb	w8, [x23, #2600]
	cbz	w8, .LBB39_116
// %bb.115:                             //   in Loop: Header=BB39_5 Depth=1
	add	x25, x23, #2240         // =2240
	mov	x0, x25
	bl	_raw_spin_lock
	ldr	x8, [x23, #2376]
	mov	x0, x25
	add	x8, x8, #1, lsl #12     // =4096
	str	x8, [x23, #2376]
	bl	_raw_spin_unlock
	mov	x0, x23
	bl	f2fs_record_iostat
.LBB39_116:                             //   in Loop: Header=BB39_5 Depth=1
	ldr	x8, [x24, #8]
	mov	w23, wzr
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 256
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	str	x27, [sp, #16]          // 8-byte Folded Spill
	stur	x8, [x29, #-32]
	b	.LBB39_33
.LBB39_117:                             //   in Loop: Header=BB39_5 Depth=1
	mov	x0, x21
	bl	bio_put
	mov	x21, xzr
	mov	w23, #-12
	b	.LBB39_33
.LBB39_118:
	str	wzr, [sp, #52]          // 4-byte Folded Spill
	b	.LBB39_121
.LBB39_119:
	add	x0, sp, #96             // =96
	bl	f2fs_cluster_is_empty
	tbnz	w0, #0, .LBB39_121
// %bb.120:
	ldp	w8, w2, [sp, #32]       // 8-byte Folded Reload
	add	x0, sp, #96             // =96
	sub	x1, x29, #24            // =24
	sub	x3, x29, #32            // =32
	mov	w5, wzr
	and	w4, w8, #0x1
	bl	f2fs_read_multi_pages
	add	x0, sp, #96             // =96
	mov	w1, wzr
	bl	f2fs_destroy_compress_ctx
.LBB39_121:
	cbz	x22, .LBB39_123
// %bb.122:
	ldr	x8, [x22]
	cmp	x8, x22
	b.ne	.LBB39_133
.LBB39_123:
	ldur	x1, [x29, #-24]
	ldr	w20, [sp, #52]          // 4-byte Folded Reload
	cbz	x1, .LBB39_125
// %bb.124:
	ldr	x8, [x19, #40]
	mov	w2, wzr
	add	w20, w20, #1            // =1
	ldr	x0, [x8, #1104]
	bl	__f2fs_submit_read_bio
.LBB39_125:
	cbz	w20, .LBB39_129
// %bb.126:
	subs	w21, w20, #1            // =1
	b.eq	.LBB39_129
// %bb.127:
	ldr	x8, [x19, #40]
	mov	w20, #25
	ldr	x19, [x8, #248]
.LBB39_128:                             // =>This Inner Loop Header: Depth=1
	mov	x0, x19
	mov	w1, #4096
	mov	x2, x20
	mov	w3, #1
	sub	w21, w21, #1            // =1
	bl	blk_throtl_get_quota
	cbnz	w21, .LBB39_128
.LBB39_129:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB39_131
// %bb.130:
	ldp	x20, x19, [sp, #352]    // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x22, x21, [sp, #336]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #320]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #304]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #288]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #272]    // 16-byte Folded Reload
	add	sp, sp, #368            // =368
	ret
.LBB39_131:
	bl	__stack_chk_fail
.LBB39_132:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 4511; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB39_133:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 3716; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end39:
	.size	f2fs_mpage_readpages, .Lfunc_end39-f2fs_mpage_readpages
                                        // -- End function
	.globl	f2fs_encrypt_one_page   // -- Begin function f2fs_encrypt_one_page
	.p2align	3
	.type	f2fs_encrypt_one_page,@function
f2fs_encrypt_one_page:                  // @f2fs_encrypt_one_page
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	ldr	x8, [x0, #40]
	ldr	x9, [x8, #24]
	ldr	x21, [x9]
	ldrb	w9, [x21, #13]
	tbz	w9, #6, .LBB40_3
// %bb.1:
	ldrh	w9, [x21]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB40_3
// %bb.2:
	ldr	x9, [x0, #56]
	mov	x20, x0
	ldr	w1, [x0, #32]
	mov	x0, x21
	cmp	x9, #0                  // =0
	csel	x19, x8, x9, eq
	bl	f2fs_wait_on_block_writeback
	mov	x0, x21
	bl	fscrypt_inode_uses_inline_crypto
	tbz	w0, #0, .LBB40_5
.LBB40_3:
	mov	w0, wzr
.LBB40_4:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
                                        // kill: def $w0 killed $w0 killed $x0
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB40_5:
	ldrsb	w8, [x21, #688]
	tbnz	w8, #31, .LBB40_30
// %bb.6:
	mov	w21, #64
	mov	x0, x19
	movk	w21, #96, lsl #16
	mov	w1, #4096
	mov	w2, wzr
	mov	w3, w21
	bl	fscrypt_encrypt_pagecache_blocks
	cmn	x0, #4095               // =4095
	str	x0, [x20, #48]
	b.lo	.LBB40_10
// %bb.7:
	mov	w22, #5
.LBB40_8:                               // =>This Inner Loop Header: Depth=1
	cmn	x0, #12                 // =12
	b.ne	.LBB40_4
// %bb.9:                               //   in Loop: Header=BB40_8 Depth=1
	ldr	x0, [x20]
	bl	f2fs_flush_merged_writes
	mov	w0, wzr
	mov	x1, x22
	bl	congestion_wait
	orr	w21, w21, #0x800
	mov	x0, x19
	mov	w1, #4096
	mov	w2, wzr
	mov	w3, w21
	bl	fscrypt_encrypt_pagecache_blocks
	cmn	x0, #1, lsl #12         // =4096
	str	x0, [x20, #48]
	b.hi	.LBB40_8
.LBB40_10:
	ldr	x8, [x20]
	mov	w2, #2
	ldr	w1, [x20, #32]
	mov	w3, wzr
	ldr	x8, [x8, #248]
	ldr	x0, [x8, #48]
	bl	pagecache_get_page
	cbz	x0, .LBB40_3
// %bb.11:
	ldr	x8, [x0, #8]
	mov	x19, x0
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x0, x9, eq
	ldr	x8, [x8]
	tbz	w8, #2, .LBB40_13
// %bb.12:
	//APP
	dmb ishld
	//NO_APP
	lsl	x9, x19, #6
	ldr	x8, [x20, #48]
	orr	x0, x9, #0xffffffc000000000
	mov	w2, #4096
	lsl	x8, x8, #6
	orr	x1, x8, #0xffffffc000000000
	bl	memcpy
.LBB40_13:
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
	b.ne	.LBB40_32
// %bb.14:
	tbnz	w8, #0, .LBB40_28
// %bb.15:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB40_18
// %bb.16:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB40_18
// %bb.17:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB40_18:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB40_20
// %bb.19:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB40_40
.LBB40_20:
	ldr	x0, [x19, #24]
.LBB40_21:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB40_23
// %bb.22:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB40_41
.LBB40_23:
	ldr	x0, [x19, #24]
.LBB40_24:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB40_26
// %bb.25:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB40_42
.LBB40_26:
	ldr	x0, [x19, #24]
.LBB40_27:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB40_28:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB40_38
// %bb.29:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB40_30:
	ldr	x8, [x21, #632]
	cbnz	x8, .LBB40_3
// %bb.31:
	mov	w0, #-126
	b	.LBB40_4
.LBB40_32:
	tbnz	w8, #0, .LBB40_37
// %bb.33:
	bl	print_bdev_access_info
	adrp	x20, f2fs_dclient
	ldr	x0, [x20, :lo12:f2fs_dclient]
	cbz	x0, .LBB40_36
// %bb.34:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB40_36
// %bb.35:
	ldr	x0, [x20, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB40_36:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB40_37:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB40_43
.LBB40_38:
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
	cbnz	w9, .LBB40_3
// %bb.39:
	bl	__put_page
	b	.LBB40_3
.LBB40_40:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB40_21
.LBB40_41:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB40_24
.LBB40_42:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB40_27
.LBB40_43:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end40:
	.size	f2fs_encrypt_one_page, .Lfunc_end40-f2fs_encrypt_one_page
                                        // -- End function
	.globl	f2fs_should_update_inplace // -- Begin function f2fs_should_update_inplace
	.p2align	3
	.type	f2fs_should_update_inplace,@function
f2fs_should_update_inplace:             // @f2fs_should_update_inplace
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	ldr	x8, [x0, #712]
	tbnz	x8, #36, .LBB41_29
// %bb.1:
	ldr	x8, [x0, #712]
	mov	x21, x0
	tbnz	w8, #28, .LBB41_25
// %bb.2:
	ldrb	w8, [x21, #688]
	tbnz	w8, #0, .LBB41_18
// %bb.3:
	ldr	x8, [x21, #40]
	ldr	x20, [x8, #1104]
	ldr	x8, [x20, #136]
	ldr	w22, [x8, #136]
	tbnz	w22, #0, .LBB41_25
// %bb.4:
	mov	x19, x1
	tbz	w22, #1, .LBB41_6
// %bb.5:
	mov	x0, x20
	bl	f2fs_need_SSR
	tbnz	w0, #0, .LBB41_25
.LBB41_6:
	tbz	w22, #2, .LBB41_8
// %bb.7:
	ldr	w8, [x20, #1240]
	mov	w10, #100
	ldr	x9, [x20, #136]
	ldr	w11, [x20, #1236]
	mul	x8, x8, x10
	ldr	w9, [x9, #140]
	udiv	x8, x8, x11
	cmp	w9, w8
	b.lo	.LBB41_25
.LBB41_8:
	tbz	w22, #3, .LBB41_11
// %bb.9:
	mov	x0, x20
	bl	f2fs_need_SSR
	tbz	w0, #0, .LBB41_11
// %bb.10:
	ldr	w8, [x20, #1240]
	mov	w10, #100
	ldr	x9, [x20, #136]
	ldr	w11, [x20, #1236]
	mul	x8, x8, x10
	ldr	w9, [x9, #140]
	udiv	x8, x8, x11
	cmp	w9, w8
	b.lo	.LBB41_25
.LBB41_11:
	cbz	x19, .LBB41_16
// %bb.12:
	tbz	w22, #5, .LBB41_16
// %bb.13:
	ldr	w8, [x19, #20]
	cmp	w8, #1                  // =1
	b.ne	.LBB41_16
// %bb.14:
	ldrb	w8, [x19, #25]
	tbnz	w8, #3, .LBB41_16
// %bb.15:
	ldrb	w8, [x21, #13]
	tbz	w8, #6, .LBB41_25
.LBB41_16:
	tbnz	w22, #4, .LBB41_26
// %bb.17:
	cbnz	x19, .LBB41_28
	b	.LBB41_29
.LBB41_18:
	adrp	x8, __tracepoint_f2fs_cold_file_should_IPU
	ldr	w19, [x21, #64]
	add	x8, x8, :lo12:__tracepoint_f2fs_cold_file_should_IPU
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB41_25
// %bb.19:
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
	tbz	w9, #0, .LBB41_25
// %bb.20:
	//APP
	mrs x20, sp_el0
	//NO_APP
	ldr	w9, [x20, #80]
	add	w9, w9, #1              // =1
	str	w9, [x20, #80]
	//APP
	//NO_APP
	ldr	x21, [x8, #32]
	cbz	x21, .LBB41_23
// %bb.21:
	ldr	x8, [x21], #24
.LBB41_22:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x21, #-16]
	mov	w1, w19
	blr	x8
	ldr	x8, [x21], #24
	cbnz	x8, .LBB41_22
.LBB41_23:
	//APP
	//NO_APP
	ldr	w8, [x20, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x20, #80]
	b.ne	.LBB41_25
// %bb.24:
	ldr	x8, [x20]
	tbnz	w8, #1, .LBB41_32
.LBB41_25:
	mov	w8, #1
	b	.LBB41_30
.LBB41_26:
	ldr	x9, [x21, #712]
	ubfx	x8, x9, #14, #1
	tbnz	w9, #14, .LBB41_30
// %bb.27:
	cbz	x19, .LBB41_30
.LBB41_28:
	ldr	x8, [x20, #80]
	tbnz	w8, #8, .LBB41_31
.LBB41_29:
	mov	w8, wzr
.LBB41_30:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	and	w0, w8, #0x1
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB41_31:
	ldr	w1, [x19, #32]
	mov	x0, x20
	bl	f2fs_is_checkpointed_data
	eor	w8, w0, #0x1
	b	.LBB41_30
.LBB41_32:
	bl	preempt_schedule_notrace
	b	.LBB41_25
.Lfunc_end41:
	.size	f2fs_should_update_inplace, .Lfunc_end41-f2fs_should_update_inplace
                                        // -- End function
	.globl	f2fs_should_update_outplace // -- Begin function f2fs_should_update_outplace
	.p2align	3
	.type	f2fs_should_update_outplace,@function
f2fs_should_update_outplace:            // @f2fs_should_update_outplace
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldr	x9, [x0, #40]
	mov	x8, x0
	mov	x29, sp
	ldr	x0, [x9, #1104]
	ldr	w9, [x0, #1504]
	cmp	w9, #1                  // =1
	b.eq	.LBB42_20
// %bb.1:
	ldrh	w9, [x8]
	and	w9, w9, #0xf000
	cmp	w9, #4, lsl #12         // =16384
	b.eq	.LBB42_20
// %bb.2:
	ldrb	w9, [x8, #12]
	tbnz	w9, #5, .LBB42_20
// %bb.3:
	ldr	x9, [x8, #712]
	sxth	w9, w9
	tbnz	w9, #31, .LBB42_20
// %bb.4:
	ldr	x9, [x0, #80]
	tbnz	w9, #2, .LBB42_20
// %bb.5:
	ldr	x9, [x8, #712]
	tbz	x9, #43, .LBB42_7
// %bb.6:
	ldr	x9, [x8, #712]
	tbnz	x9, #46, .LBB42_20
.LBB42_7:
	cbz	x1, .LBB42_9
// %bb.8:
	ldr	w9, [x1, #92]
	cbnz	w9, .LBB42_20
.LBB42_9:
	ldr	x8, [x8, #712]
	tbnz	x8, #36, .LBB42_20
// %bb.10:
	cbz	x1, .LBB42_19
// %bb.11:
	ldr	x8, [x1, #40]
	ldr	x9, [x8]
	tbz	w9, #13, .LBB42_14
// %bb.12:
	ldr	x9, [x8, #40]
	tbz	w9, #0, .LBB42_14
// %bb.13:
	ldr	x9, [x8, #40]
	tbnz	w9, #3, .LBB42_20
.LBB42_14:
	ldr	x9, [x8]
	tbz	w9, #13, .LBB42_17
// %bb.15:
	ldr	x9, [x8, #40]
	tbz	w9, #0, .LBB42_17
// %bb.16:
	ldr	x8, [x8, #40]
	tbnz	w8, #2, .LBB42_20
.LBB42_17:
	ldr	x8, [x0, #80]
	tbz	w8, #8, .LBB42_19
// %bb.18:
	ldr	w1, [x1, #32]
	bl	f2fs_is_checkpointed_data
	tbnz	w0, #0, .LBB42_20
.LBB42_19:
	mov	w0, wzr
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.LBB42_20:
	mov	w0, #1
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end42:
	.size	f2fs_should_update_outplace, .Lfunc_end42-f2fs_should_update_outplace
                                        // -- End function
	.globl	f2fs_do_write_data_page // -- Begin function f2fs_do_write_data_page
	.p2align	3
	.type	f2fs_do_write_data_page,@function
f2fs_do_write_data_page:                // @f2fs_do_write_data_page
// %bb.0:
	sub	sp, sp, #176            // =176
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	str	x25, [sp, #112]         // 8-byte Folded Spill
	stp	x24, x23, [sp, #128]    // 16-byte Folded Spill
	mov	w1, wzr
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	w2, #48
	stp	x22, x21, [sp, #144]    // 16-byte Folded Spill
	add	x23, sp, #40            // =40
	stp	x20, x19, [sp, #160]    // 16-byte Folded Spill
	mov	x19, x0
	stur	x8, [x29, #-8]
	ldr	x20, [x0, #40]
	add	x0, sp, #40             // =40
	ldr	x8, [x20, #24]
	ldr	x21, [x8]
	str	wzr, [sp, #32]
	str	xzr, [sp, #24]
	ldr	x8, [x21, #40]
	ldr	x24, [x8, #1104]
	bl	memset
	ldr	w8, [x19, #132]
	mov	x1, x19
	ldr	x9, [x19, #40]
	add	x23, x23, #8            // =8
	str	wzr, [sp, #64]
	str	xzr, [sp, #56]
	str	w8, [sp, #80]
	ldr	x8, [x9, #24]
	stp	x21, xzr, [sp, #40]
	ldr	x22, [x8]
	mov	x0, x22
	bl	f2fs_should_update_outplace
	tbnz	w0, #0, .LBB43_5
// %bb.1:
	mov	x0, x22
	mov	x1, x19
	bl	f2fs_should_update_inplace
	tbz	w0, #0, .LBB43_5
// %bb.2:
	ldr	x1, [x20, #32]
	add	x2, sp, #24             // =24
	mov	x0, x21
	bl	f2fs_lookup_extent_cache
	tbz	w0, #0, .LBB43_5
// %bb.3:
	ldr	w8, [x20, #32]
	mov	w2, #7
	ldr	w9, [sp, #32]
	ldr	w10, [sp, #24]
	ldr	x0, [x19]
	add	w8, w9, w8
	sub	w1, w8, w10
	str	w1, [x19, #32]
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB43_37
// %bb.4:
	ldr	w1, [x19, #32]
	mov	w22, #1
	str	w22, [x19, #84]
	b	.LBB43_11
.LBB43_5:
	ldr	w8, [x19, #84]
	cbnz	w8, .LBB43_7
// %bb.6:
	ldr	x8, [x19]
	add	x0, x8, #304            // =304
	bl	down_read_trylock
	cbz	w0, .LBB43_16
.LBB43_7:
	ldr	x1, [x20, #32]
	add	x0, sp, #40             // =40
	mov	w2, #1
	bl	f2fs_get_dnode_of_data
	mov	w22, w0
	cbz	w0, .LBB43_9
// %bb.8:
	ldr	w8, [x19, #84]
	cbnz	w8, .LBB43_142
	b	.LBB43_141
.LBB43_9:
	ldr	w1, [sp, #76]
	str	w1, [x19, #32]
	cbz	w1, .LBB43_33
// %bb.10:
	mov	w22, wzr
.LBB43_11:
	add	w8, w1, #3              // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB43_59
.LBB43_12:
	tbz	w22, #0, .LBB43_17
.LBB43_13:
	ldrh	w8, [x21]
	add	x22, x24, #2192         // =2192
	mov	x0, x22
	and	w25, w8, #0xf000
	bl	mutex_lock
	ldr	x8, [x24, #2224]
	cmp	w25, #4, lsl #12        // =16384
	b.ne	.LBB43_38
// %bb.14:
	cbz	x8, .LBB43_40
// %bb.15:
	ldr	x9, [x8, #424]
	add	x9, x9, #1              // =1
	str	x9, [x8, #424]
	b	.LBB43_40
.LBB43_16:
	mov	w22, #-11
	b	.LBB43_142
.LBB43_17:
	ldr	w8, [x19, #32]
	add	w9, w8, #3              // =3
	cmp	w9, #4                  // =4
	b.hs	.LBB43_69
.LBB43_18:
	ldr	w8, [x19, #84]
	cmp	w8, #2                  // =2
	b.ne	.LBB43_21
// %bb.19:
	ldr	x8, [x19]
	add	x0, x8, #304            // =304
	bl	down_read_trylock
	cbz	w0, .LBB43_79
// %bb.20:
	str	wzr, [x19, #84]
.LBB43_21:
	ldr	x0, [x19]
	add	x2, sp, #8              // =8
	ldr	w1, [sp, #64]
	mov	w3, wzr
	bl	get_node_info_ex
	mov	w22, w0
	cbnz	w0, .LBB43_110
// %bb.22:
	ldrb	w8, [sp, #20]
	mov	x0, x19
	strb	w8, [x19, #128]
	bl	f2fs_encrypt_one_page
	mov	w22, w0
	cbnz	w0, .LBB43_110
// %bb.23:
	mov	x0, x20
	mov	w1, wzr
	bl	__test_set_page_writeback
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 256
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	w8, [x19, #92]
	cbz	w8, .LBB43_29
// %bb.24:
	ldr	w9, [x19, #32]
	cmn	w9, #2                  // =2
	b.ne	.LBB43_29
// %bb.25:
	ldr	w9, [x21, #1268]
	ldr	w10, [x21, #1256]
	cbz	w10, .LBB43_29
// %bb.26:
	ldr	w10, [x21, #1256]
	sub	w8, w9, w8
	add	w22, w8, #1             // =1
	cmp	w22, w10
	b.le	.LBB43_28
// %bb.27:
	ldr	x8, [x21, #40]
	adrp	x1, .L.str.20
	adrp	x2, .L__func__.f2fs_i_compr_blocks_update
	add	x1, x1, :lo12:.L.str.20
	add	x2, x2, :lo12:.L__func__.f2fs_i_compr_blocks_update
	mov	w3, w22
	ldr	x0, [x8, #1104]
	ldr	w4, [x21, #1256]
	ldr	x5, [x21, #64]
	bl	f2fs_printk
.LBB43_28:
	add	x8, x21, #1256          // =1256
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, w22
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x21, #40]
	mov	x0, x21
	mov	w1, #1
	sxtw	x9, w22
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
.LBB43_29:
	add	x0, sp, #40             // =40
	mov	x1, x19
	bl	f2fs_outplace_write_data
	cbz	w0, .LBB43_144
// %bb.30:
	mov	w22, w0
	mov	x0, x20
	bl	end_page_writeback
	ldr	w8, [x19, #92]
	cbz	w8, .LBB43_110
// %bb.31:
	ldr	w9, [x19, #32]
	cmn	w9, #2                  // =2
	b.ne	.LBB43_110
// %bb.32:
	ldr	w9, [x21, #1268]
	mov	x0, x21
	mov	w1, #1
	sub	w8, w9, w8
	add	x9, x21, #1256          // =1256
	add	w8, w8, #1              // =1
	//APP
	// atomic_add
	prfm	pstl1strm, [x9]
1:	ldxr	w10, [x9]
	add	w10, w10, w8
	stxr	w11, w10, [x9]
	cbnz	w11, 1b
	//NO_APP
	ldr	x9, [x21, #40]
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
	ldr	x20, [sp, #56]
	cbnz	x20, .LBB43_111
	b	.LBB43_136
.LBB43_33:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, 4
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	add	x9, x20, #40            // =40
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x9]
1:	ldxr	x8, [x9]
	bic	x8, x8, 8
	stxr	w10, x8, [x9]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x20, #40]
	cmp	x8, #1                  // =1
	b.ne	.LBB43_36
// %bb.34:
	str	xzr, [x20, #40]
	ldr	x8, [x20]
	tbz	w8, #13, .LBB43_36
// %bb.35:
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x20]
1:	ldxr	x8, [x20]
	bic	x8, x8, 8192
	stxr	w9, x8, [x20]
	cbnz	w9, 1b
	//NO_APP
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
	cbz	w9, .LBB43_109
.LBB43_36:
	mov	w22, wzr
	ldr	x20, [sp, #56]
	cbnz	x20, .LBB43_111
	b	.LBB43_136
.LBB43_37:
	mov	w22, #-117
	b	.LBB43_142
.LBB43_38:
	cbz	x8, .LBB43_40
// %bb.39:
	ldr	x9, [x8, #432]
	add	x9, x9, #1              // =1
	str	x9, [x8, #432]
.LBB43_40:
	mov	x0, x22
	bl	mutex_unlock
	mov	x0, x19
	bl	f2fs_encrypt_one_page
	mov	w22, w0
	cbnz	w0, .LBB43_110
// %bb.41:
	mov	x0, x20
	mov	w1, wzr
	bl	__test_set_page_writeback
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 256
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x22, [sp, #56]
	cbz	x22, .LBB43_88
// %bb.42:
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
	b.ne	.LBB43_80
// %bb.43:
	tbnz	w8, #0, .LBB43_57
// %bb.44:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB43_47
// %bb.45:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB43_47
// %bb.46:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB43_47:
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB43_49
// %bb.48:
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB43_156
.LBB43_49:
	ldr	x0, [x22, #24]
.LBB43_50:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB43_52
// %bb.51:
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB43_157
.LBB43_52:
	ldr	x0, [x22, #24]
.LBB43_53:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB43_55
// %bb.54:
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB43_158
.LBB43_55:
	ldr	x0, [x22, #24]
.LBB43_56:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB43_57:
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB43_86
// %bb.58:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB43_59:
	ldr	w9, [x24, #3024]
	cbz	w9, .LBB43_67
// %bb.60:
	ldr	x8, [x24]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB43_66
// %bb.61:
	ldr	x11, [x24, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB43_63
.LBB43_62:                              //   in Loop: Header=BB43_63 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB43_66
.LBB43_63:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w1
	b.hi	.LBB43_62
// %bb.64:                              //   in Loop: Header=BB43_63 Depth=1
	ldr	w12, [x11]
	cmp	w12, w1
	b.lo	.LBB43_62
// %bb.65:
	ldur	x8, [x11, #-80]
.LBB43_66:
	cbz	x8, .LBB43_12
.LBB43_67:
	ldr	x0, [x19]
	mov	w2, #7
	bl	f2fs_is_valid_blkaddr
	tbnz	w0, #0, .LBB43_12
// %bb.68:
	mov	w22, #-117
	ldr	x20, [sp, #56]
	cbnz	x20, .LBB43_111
	b	.LBB43_136
.LBB43_69:
	ldr	x12, [x19]
	ldr	w10, [x12, #3024]
	cbz	w10, .LBB43_77
// %bb.70:
	ldr	x9, [x12]
	cmp	w10, #1                 // =1
	ldr	x9, [x9, #248]
	b.lt	.LBB43_76
// %bb.71:
	ldr	x12, [x12, #3032]
	mov	x11, xzr
	add	x12, x12, #80           // =80
	b	.LBB43_73
.LBB43_72:                              //   in Loop: Header=BB43_73 Depth=1
	add	x11, x11, #1            // =1
	add	x12, x12, #192          // =192
	cmp	x11, x10
	b.eq	.LBB43_76
.LBB43_73:                              // =>This Inner Loop Header: Depth=1
	ldur	w13, [x12, #-4]
	cmp	w13, w8
	b.hi	.LBB43_72
// %bb.74:                              //   in Loop: Header=BB43_73 Depth=1
	ldr	w13, [x12]
	cmp	w13, w8
	b.lo	.LBB43_72
// %bb.75:
	ldur	x9, [x12, #-80]
.LBB43_76:
	cbz	x9, .LBB43_18
.LBB43_77:
	ldr	x8, [x19, #40]
	mov	x1, x19
	ldr	x8, [x8, #24]
	ldr	x22, [x8]
	mov	x0, x22
	bl	f2fs_should_update_outplace
	tbnz	w0, #0, .LBB43_18
// %bb.78:
	mov	x0, x22
	mov	x1, x19
	bl	f2fs_should_update_inplace
	tbnz	w0, #0, .LBB43_13
	b	.LBB43_18
.LBB43_79:
	mov	w22, #-11
	ldr	x20, [sp, #56]
	cbnz	x20, .LBB43_111
	b	.LBB43_136
.LBB43_80:
	tbnz	w8, #0, .LBB43_85
// %bb.81:
	bl	print_bdev_access_info
	adrp	x24, f2fs_dclient
	ldr	x0, [x24, :lo12:f2fs_dclient]
	cbz	x0, .LBB43_84
// %bb.82:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB43_84
// %bb.83:
	ldr	x0, [x24, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x24, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB43_84:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB43_85:
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB43_162
.LBB43_86:
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
	cbnz	w9, .LBB43_88
// %bb.87:
	bl	__put_page
.LBB43_88:
	ldr	x8, [sp, #48]
	cbz	x8, .LBB43_92
// %bb.89:
	ldr	x9, [sp, #56]
	cmp	x9, x8
	b.eq	.LBB43_92
// %bb.90:
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
	cbnz	w9, .LBB43_92
// %bb.91:
	bl	__put_page
.LBB43_92:
	ldr	w8, [x19, #84]
	stp	xzr, xzr, [x23]
	cbnz	w8, .LBB43_94
// %bb.93:
	ldr	x8, [x19]
	add	x0, x8, #304            // =304
	bl	up_read
.LBB43_94:
	mov	x0, x19
	bl	f2fs_inplace_write_data
	mov	w22, w0
	cbz	w0, .LBB43_100
// %bb.95:
	mov	x0, x21
	bl	fscrypt_inode_uses_fs_layer_crypto
	tbz	w0, #0, .LBB43_98
// %bb.96:
	ldr	x0, [x19, #48]
	ldr	x8, [x0, #24]
	cbnz	x8, .LBB43_98
// %bb.97:
	ldr	x8, [x0, #40]
	str	x8, [x19, #48]
	bl	fscrypt_free_bounce_page
.LBB43_98:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	sxth	w8, w8
	tbz	w8, #31, .LBB43_101
// %bb.99:
	mov	x0, x20
	bl	end_page_writeback
	b	.LBB43_101
.LBB43_100:
	add	x8, x21, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 8192
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB43_101:
	adrp	x8, __tracepoint_f2fs_do_write_data_page
	ldr	x19, [x19, #40]
	add	x8, x8, :lo12:__tracepoint_f2fs_do_write_data_page
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB43_142
// %bb.102:
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
	tbz	w9, #0, .LBB43_142
// %bb.103:
	//APP
	mrs x21, sp_el0
	//NO_APP
	ldr	w9, [x21, #80]
	add	w9, w9, #1              // =1
	str	w9, [x21, #80]
	//APP
	//NO_APP
	ldr	x23, [x8, #32]
	cbz	x23, .LBB43_106
// %bb.104:
	ldr	x8, [x23], #24
	mov	w20, #9
.LBB43_105:                             // =>This Inner Loop Header: Depth=1
	ldur	x0, [x23, #-16]
	mov	x1, x19
	mov	w2, w20
	blr	x8
	ldr	x8, [x23], #24
	cbnz	x8, .LBB43_105
.LBB43_106:
	//APP
	//NO_APP
	ldr	w8, [x21, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x21, #80]
	b.ne	.LBB43_142
// %bb.107:
	ldr	x8, [x21]
	tbz	w8, #1, .LBB43_142
// %bb.108:
	bl	preempt_schedule_notrace
	b	.LBB43_142
.LBB43_109:
	bl	__put_page
	mov	w22, wzr
.LBB43_110:
	ldr	x20, [sp, #56]
	cbz	x20, .LBB43_136
.LBB43_111:
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
	b.ne	.LBB43_128
// %bb.112:
	tbnz	w8, #0, .LBB43_126
// %bb.113:
	bl	print_bdev_access_info
	adrp	x21, f2fs_dclient
	ldr	x0, [x21, :lo12:f2fs_dclient]
	cbz	x0, .LBB43_116
// %bb.114:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB43_116
// %bb.115:
	ldr	x0, [x21, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB43_116:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB43_118
// %bb.117:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB43_153
.LBB43_118:
	ldr	x0, [x20, #24]
.LBB43_119:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB43_121
// %bb.120:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB43_154
.LBB43_121:
	ldr	x0, [x20, #24]
.LBB43_122:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB43_124
// %bb.123:
	ldr	x8, [x20]
	tbnz	w8, #10, .LBB43_155
.LBB43_124:
	ldr	x0, [x20, #24]
.LBB43_125:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB43_126:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB43_134
// %bb.127:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB43_128:
	tbnz	w8, #0, .LBB43_133
// %bb.129:
	bl	print_bdev_access_info
	adrp	x21, f2fs_dclient
	ldr	x0, [x21, :lo12:f2fs_dclient]
	cbz	x0, .LBB43_132
// %bb.130:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB43_132
// %bb.131:
	ldr	x0, [x21, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB43_132:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB43_133:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB43_161
.LBB43_134:
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
	cbnz	w9, .LBB43_136
// %bb.135:
	bl	__put_page
.LBB43_136:
	ldr	x8, [sp, #48]
	cbz	x8, .LBB43_140
// %bb.137:
	ldr	x9, [sp, #56]
	cmp	x9, x8
	b.eq	.LBB43_140
// %bb.138:
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
	cbnz	w9, .LBB43_140
// %bb.139:
	bl	__put_page
.LBB43_140:
	stp	xzr, xzr, [x23]
	ldr	w8, [x19, #84]
	cbnz	w8, .LBB43_142
.LBB43_141:
	ldr	x8, [x19]
	add	x0, x8, #304            // =304
	bl	up_read
.LBB43_142:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB43_159
// %bb.143:
	mov	w0, w22
	ldr	x25, [sp, #112]         // 8-byte Folded Reload
	ldp	x20, x19, [sp, #160]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #144]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #128]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB43_144:
	adrp	x8, __tracepoint_f2fs_do_write_data_page
	add	x8, x8, :lo12:__tracepoint_f2fs_do_write_data_page
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB43_151
// %bb.145:
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
	tbz	w9, #0, .LBB43_151
// %bb.146:
	//APP
	mrs x24, sp_el0
	//NO_APP
	ldr	w9, [x24, #80]
	add	w9, w9, #1              // =1
	str	w9, [x24, #80]
	//APP
	//NO_APP
	ldr	x25, [x8, #32]
	cbz	x25, .LBB43_149
// %bb.147:
	ldr	x8, [x25], #24
	mov	w22, #10
.LBB43_148:                             // =>This Inner Loop Header: Depth=1
	ldur	x0, [x25, #-16]
	mov	x1, x20
	mov	w2, w22
	blr	x8
	ldr	x8, [x25], #24
	cbnz	x8, .LBB43_148
.LBB43_149:
	//APP
	//NO_APP
	ldr	w8, [x24, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x24, #80]
	b.ne	.LBB43_151
// %bb.150:
	ldr	x8, [x24]
	tbnz	w8, #1, .LBB43_160
.LBB43_151:
	add	x8, x21, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4096
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x9, [x20, #32]
	cbnz	x9, .LBB43_36
// %bb.152:
	mov	w22, wzr
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 262144
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x20, [sp, #56]
	cbnz	x20, .LBB43_111
	b	.LBB43_136
.LBB43_153:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB43_119
.LBB43_154:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB43_122
.LBB43_155:
	mov	x0, x20
	bl	__page_file_mapping
	b	.LBB43_125
.LBB43_156:
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB43_50
.LBB43_157:
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB43_53
.LBB43_158:
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB43_56
.LBB43_159:
	bl	__stack_chk_fail
.LBB43_160:
	bl	preempt_schedule_notrace
	b	.LBB43_151
.LBB43_161:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB43_162:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end43:
	.size	f2fs_do_write_data_page, .Lfunc_end43-f2fs_do_write_data_page
                                        // -- End function
	.globl	f2fs_write_single_data_page // -- Begin function f2fs_write_single_data_page
	.p2align	3
	.type	f2fs_write_single_data_page,@function
f2fs_write_single_data_page:            // @f2fs_write_single_data_page
// %bb.0:
	sub	sp, sp, #304            // =304
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #208]    // 16-byte Folded Spill
	add	x29, sp, #208           // =208
	stp	x28, x27, [sp, #224]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #240]    // 16-byte Folded Spill
	mov	w28, w7
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	w26, w6
	stp	x24, x23, [sp, #256]    // 16-byte Folded Spill
	mov	x25, x4
	stp	x22, x21, [sp, #272]    // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #288]    // 16-byte Folded Spill
	mov	x19, x2
	stur	x8, [x29, #-16]
	mov	x23, x1
	ldp	x8, x9, [x0, #24]
	ldr	w11, [x4, #32]
	ldr	x24, [x8]
	str	x9, [sp, #40]           // 8-byte Folded Spill
	cmp	w11, #1                 // =1
	ldrb	w8, [x4, #36]
	stur	xzr, [sp, #60]
	ldr	x9, [x24, #40]
	ldr	x10, [x24, #64]
	ldr	x27, [x24, #80]
	ldr	x20, [x9, #1104]
	mov	w9, #1
	str	w10, [sp, #56]
	str	w9, [sp, #68]
	str	x20, [sp, #48]
	b.ne	.LBB44_2
// %bb.1:
	mov	w9, #2048
	b	.LBB44_5
.LBB44_2:
	tbnz	w8, #0, .LBB44_4
// %bb.3:
	and	w9, w8, #0x2
	lsl	w9, w9, #19
	b	.LBB44_5
.LBB44_4:
	mov	w9, #1048576
.LBB44_5:
	str	w9, [sp, #72]
	mov	w9, #2
	ubfx	w8, w8, #6, #1
	stur	xzr, [sp, #76]
	stp	x21, xzr, [sp, #88]
	stp	xzr, xzr, [sp, #104]
	str	xzr, [sp, #120]
	strb	wzr, [sp, #128]
	str	w9, [sp, #132]
	strh	wzr, [sp, #136]
	strb	wzr, [sp, #138]
	str	w26, [sp, #140]
	strb	wzr, [sp, #144]
	str	w5, [sp, #148]
	stp	x25, x19, [sp, #152]
	str	x3, [sp, #168]
	strb	wzr, [sp, #176]
	stp	w8, wzr, [sp, #180]
	cbz	w26, .LBB44_7
// %bb.6:
	mov	w8, #1
	str	w8, [sp, #132]
.LBB44_7:
	ldr	w8, [x20, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB44_12
// %bb.8:
	ldr	x8, [x20, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB44_12
// %bb.9:
	cbz	x23, .LBB44_11
// %bb.10:
	ldr	w8, [x23]
	str	wzr, [x23]
	str	w8, [sp, #184]
	b	.LBB44_12
.LBB44_11:
	str	wzr, [sp, #184]
.LBB44_12:
	adrp	x8, __tracepoint_f2fs_writepage
	add	x8, x8, :lo12:__tracepoint_f2fs_writepage
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB44_19
// %bb.13:
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
	tbz	w9, #0, .LBB44_19
// %bb.14:
	str	x27, [sp, #32]          // 8-byte Folded Spill
	//APP
	mrs x22, sp_el0
	//NO_APP
	ldr	w9, [x22, #80]
	mov	x27, x20
	mov	x20, x25
	mov	x25, x23
	mov	x23, x19
	mov	w19, w28
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x28, [x8, #32]
	cbz	x28, .LBB44_17
// %bb.15:
	ldr	x8, [x28], #24
.LBB44_16:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x28, #-16]
	mov	x1, x21
	mov	w2, wzr
	blr	x8
	ldr	x8, [x28], #24
	cbnz	x8, .LBB44_16
.LBB44_17:
	//APP
	//NO_APP
	mov	w28, w19
	ldr	w8, [x22, #80]
	mov	x19, x23
	mov	x23, x25
	mov	x25, x20
	mov	x20, x27
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	ldr	x27, [sp, #32]          // 8-byte Folded Reload
	b.ne	.LBB44_19
// %bb.18:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB44_109
.LBB44_19:
	ldr	x8, [x20, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB44_84
// %bb.20:
	ldr	x8, [x20, #80]
	tbnz	w8, #3, .LBB44_85
// %bb.21:
	ldr	x9, [x21, #32]
	lsr	x10, x27, #12
	cmp	x9, x10
	b.lo	.LBB44_29
// %bb.22:
	ldr	x8, [x24, #712]
	cbnz	w26, .LBB44_29
// %bb.23:
	tbnz	w8, #30, .LBB44_29
// %bb.24:
	mov	w26, wzr
	ands	w8, w27, #0xfff
	b.eq	.LBB44_88
// %bb.25:
	cmp	x9, x10
	b.hi	.LBB44_88
// %bb.26:
	//APP
	mrs x22, sp_el0
	//NO_APP
	ldr	w9, [x22, #80]
	lsl	x10, x21, #6
	mov	w1, wzr
	orr	x10, x10, #0xffffffc000000000
	add	x0, x10, x8
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	w9, [x22, #2984]
	add	w9, w9, #1              // =1
	str	w9, [x22, #2984]
	mov	w9, #4096
	sub	w2, w9, w8
	//APP
	//NO_APP
	bl	memset
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
	b.ne	.LBB44_28
// %bb.27:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB44_110
.LBB44_28:
	mov	x0, x21
	bl	flush_dcache_page
.LBB44_29:
	ldr	x8, [x24, #712]
	tbnz	w8, #19, .LBB44_87
// %bb.30:
	ldr	x8, [x24, #712]
	tbz	w8, #17, .LBB44_34
// %bb.31:
	ldr	x8, [x21, #32]
	cbz	x8, .LBB44_85
// %bb.32:
	ldrb	w8, [x25, #36]
	tbnz	w8, #3, .LBB44_34
// %bb.33:
	mov	x0, x20
	mov	w1, #8
	bl	f2fs_available_free_memory
	tbnz	w0, #0, .LBB44_85
.LBB44_34:
	ldrh	w9, [x24]
	ldr	w8, [x24, #12]
	and	w9, w9, #0xf000
	cmp	w9, #4, lsl #12         // =16384
	b.eq	.LBB44_38
// %bb.35:
	tbnz	w8, #5, .LBB44_38
// %bb.36:
	ldrb	w8, [x25, #36]
	tbnz	w8, #3, .LBB44_43
// %bb.37:
	mov	w26, #1
	ldr	x8, [x24, #712]
	tbnz	w8, #10, .LBB44_55
	b	.LBB44_58
.LBB44_38:
	tbz	w8, #5, .LBB44_40
// %bb.39:
	add	x0, x20, #376           // =376
	bl	down_read
.LBB44_40:
	mov	w8, #1
	add	x0, sp, #48             // =48
	str	w8, [sp, #132]
	bl	f2fs_do_write_data_page
	ldrb	w8, [x24, #12]
	mov	w27, w0
	tbz	w8, #5, .LBB44_42
// %bb.41:
	add	x0, x20, #376           // =376
	bl	up_read
.LBB44_42:
	mov	w26, wzr
	cmn	w27, #2                 // =2
	b.ne	.LBB44_62
	b	.LBB44_63
.LBB44_43:
	ldr	w27, [x20, #1192]
	ldr	w22, [x20, #1188]
	ldrsw	x16, [x20, #1284]
	ldr	w26, [x20, #1184]
	ldrsw	x17, [x20, #1272]
	ldrsw	x18, [x20, #1296]
	ldr	x8, [x20, #80]
	tbnz	w8, #3, .LBB44_54
// %bb.44:
	ldr	x11, [x20, #136]
	ldr	x8, [x11, #8]
	ldr	w9, [x11, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	b.eq	.LBB44_46
// %bb.45:
	udiv	w10, w9, w27
	cmp	w8, w10
	b.eq	.LBB44_47
	b	.LBB44_51
.LBB44_46:
	mov	w10, #-1
	cmp	w8, w10
	b.ne	.LBB44_51
.LBB44_47:
	ldr	w12, [x20, #1284]
	mov	w15, #48
	ldr	w13, [x20, #1272]
	ldr	w0, [x20, #1272]
	ldr	x10, [x11, #24]
	ldr	x11, [x11]
	add	w12, w13, w12
	ldr	w14, [x10, #460]
	ldr	x11, [x11, #136]
	madd	x14, x14, x15, x11
	ldrh	w14, [x14, #2]
	and	w14, w14, #0x3ff
	sub	w13, w22, w14
	cmp	w13, w12
	b.lo	.LBB44_51
// %bb.48:
	ldr	w13, [x10, #580]
	mov	w14, #48
	madd	x13, x13, x14, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w22, w13
	cmp	w13, w12
	b.lo	.LBB44_51
// %bb.49:
	ldr	w13, [x10, #700]
	mov	w14, #48
	madd	x13, x13, x14, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w22, w13
	cmp	w13, w12
	b.lo	.LBB44_51
// %bb.50:
	ldr	w12, [x10, #100]
	mov	w13, #48
	madd	x11, x12, x13, x11
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w11, w22, w11
	cmp	w11, w0
	b.hs	.LBB44_80
.LBB44_51:
	mul	w10, w22, w27
	cmn	w9, #1                  // =1
	sub	x10, x10, #1            // =1
	add	x12, x10, x17
	add	x11, x10, x16
	asr	x12, x12, x26
	add	x10, x10, x18
	asr	x11, x11, x26
	udiv	w12, w12, w27
	asr	x10, x10, x26
	udiv	w11, w11, w27
	udiv	w10, w10, w27
	add	w11, w11, w12, lsl #1
	add	w10, w11, w10
	b.eq	.LBB44_53
// %bb.52:
	ldr	w11, [x20, #1192]
	udiv	w9, w9, w11
.LBB44_53:
	add	w9, w10, w9
	cmp	w8, w9
	b.ls	.LBB44_85
.LBB44_54:
	mov	w26, wzr
	add	x8, x24, #712           // =712
	mov	w9, #33554432
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldr	x8, [x24, #712]
	tbz	w8, #10, .LBB44_58
.LBB44_55:
	ldr	w8, [sp, #180]
	mov	x0, x24
	mov	x1, x21
	cmp	w8, #1                  // =1
	cset	w2, eq
	bl	f2fs_write_inline_data_ex
	cbz	w0, .LBB44_88
// %bb.56:
	ldr	w8, [sp, #180]
	mov	w27, w0
	cmp	w8, #1                  // =1
	b.eq	.LBB44_75
// %bb.57:
	cmn	w27, #11                // =11
	b.ne	.LBB44_61
.LBB44_58:
	add	x0, sp, #48             // =48
	bl	f2fs_do_write_data_page
	mov	w27, w0
	cmn	w0, #11                 // =11
	b.ne	.LBB44_60
// %bb.59:
	add	x0, sp, #48             // =48
	str	wzr, [sp, #132]
	bl	f2fs_do_write_data_page
	mov	w27, w0
.LBB44_60:
	cbz	w27, .LBB44_77
.LBB44_61:
	ldrb	w8, [x24, #688]
	mov	x0, x24
	mov	w1, #1
	orr	w8, w8, #0x10
	strb	w8, [x24, #688]
	bl	f2fs_mark_inode_dirty_sync
	cmn	w27, #2                 // =2
	b.eq	.LBB44_63
.LBB44_62:
	cbnz	w27, .LBB44_75
.LBB44_63:
	ldrh	w8, [x24]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.eq	.LBB44_66
// %bb.64:
	cmp	w8, #10, lsl #12        // =40960
	b.eq	.LBB44_66
// %bb.65:
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB44_70
.LBB44_66:
	add	x8, x24, #768           // =768
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x24, #712]
	tbz	x8, #37, .LBB44_68
// %bb.67:
	ldr	x8, [x24, #40]
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
.LBB44_68:
	ldr	x8, [x24, #40]
	ldrh	w9, [x24]
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
	ldrb	w8, [x24, #12]
	tbz	w8, #5, .LBB44_70
// %bb.69:
	ldr	x8, [x24, #40]
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
.LBB44_70:
	cbz	w27, .LBB44_95
// %bb.71:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, 4
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	add	x9, x21, #40            // =40
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x9]
1:	ldxr	x8, [x9]
	bic	x8, x8, 8
	stxr	w10, x8, [x9]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x21, #40]
	cmp	x8, #1                  // =1
	b.ne	.LBB44_95
// %bb.72:
	str	xzr, [x21, #40]
	ldr	x8, [x21]
	tbz	w8, #13, .LBB44_95
// %bb.73:
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x21]
1:	ldxr	x8, [x21]
	bic	x8, x8, 8192
	stxr	w9, x8, [x21]
	cbnz	w9, 1b
	//NO_APP
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
	cbnz	w9, .LBB44_95
// %bb.74:
	bl	__put_page
	b	.LBB44_95
.LBB44_75:
	mov	x0, x25
	mov	x1, x21
	bl	redirty_page_for_writepage
	ldrb	w8, [x25, #36]
	tbnz	w8, #3, .LBB44_86
// %bb.76:
	mov	x0, x21
	bl	unlock_page
	b	.LBB44_106
.LBB44_77:
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	add	x27, x24, #816          // =816
	mov	x0, x27
	lsl	x8, x8, #12
	add	x22, x8, #1, lsl #12    // =4096
	bl	_raw_spin_lock
	ldr	x8, [x24, #808]
	cmp	x8, x22
	b.ge	.LBB44_79
// %bb.78:
	str	x22, [x24, #808]
.LBB44_79:
	mov	x0, x27
	bl	_raw_spin_unlock
	b	.LBB44_88
.LBB44_80:
	ldr	w8, [x20, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB44_54
// %bb.81:
	ldr	x8, [x20, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB44_54
// %bb.82:
	ldr	w1, [x10, #820]
	str	w0, [sp, #12]           // 4-byte Folded Spill
	mov	x0, x20
	stp	x17, x16, [sp, #24]     // 16-byte Folded Spill
	str	x18, [sp, #16]          // 8-byte Folded Spill
	str	x1, [sp]                // 8-byte Folded Spill
                                        // kill: def $w1 killed $w1 killed $x1
	bl	f2fs_usable_blks_in_seg
	ldr	x9, [x20, #136]
	mov	w10, #48
	ldr	x11, [sp]               // 8-byte Folded Reload
	ldp	x18, x17, [sp, #16]     // 16-byte Folded Reload
	ldr	x16, [sp, #32]          // 8-byte Folded Reload
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x11, x10, x8
	ldr	w10, [sp, #12]          // 4-byte Folded Reload
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w10
	b.hs	.LBB44_54
// %bb.83:
	ldr	x8, [x9, #8]
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB44_51
.LBB44_84:
	ldr	x26, [x21, #24]
	mov	w1, #-5
	mov	x0, x26
	bl	__filemap_set_wb_err
	add	x8, x26, #128           // =128
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldrh	w8, [x24]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.ne	.LBB44_87
.LBB44_85:
	mov	x0, x25
	mov	x1, x21
	bl	redirty_page_for_writepage
.LBB44_86:
	mov	w27, #524288
	b	.LBB44_106
.LBB44_87:
	mov	w26, wzr
.LBB44_88:
	ldrh	w8, [x24]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.eq	.LBB44_91
// %bb.89:
	cmp	w8, #10, lsl #12        // =40960
	b.eq	.LBB44_91
// %bb.90:
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB44_95
.LBB44_91:
	add	x8, x24, #768           // =768
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x24, #712]
	tbz	x8, #37, .LBB44_93
// %bb.92:
	ldr	x8, [x24, #40]
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
.LBB44_93:
	ldr	x8, [x24, #40]
	ldrh	w9, [x24]
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
	ldrb	w8, [x24, #12]
	tbz	w8, #5, .LBB44_95
// %bb.94:
	ldr	x8, [x24, #40]
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
.LBB44_95:
	ldrb	w8, [x25, #36]
	tbz	w8, #3, .LBB44_97
// %bb.96:
	mov	x0, x20
	mov	x1, xzr
	mov	x2, x21
	mov	w3, wzr
	mov	w4, wzr
	mov	w5, wzr
	bl	__submit_merged_write_cond
	mov	x0, x24
	add	x8, x24, #712           // =712
	mov	w9, #33554432
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_remove_dirty_inode
	mov	x23, xzr
.LBB44_97:
	mov	x0, x21
	bl	unlock_page
	ldrh	w8, [x24]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.eq	.LBB44_102
// %bb.98:
	ldrb	w8, [x24, #12]
	tbnz	w8, #5, .LBB44_102
// %bb.99:
	ldr	x8, [x24, #792]
	cbnz	x8, .LBB44_102
// %bb.100:
	tbz	w28, #0, .LBB44_102
// %bb.101:
	mov	x0, x20
	mov	w1, w26
	bl	f2fs_balance_fs
.LBB44_102:
	ldr	x8, [x20, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB44_108
// %bb.103:
	cbz	x23, .LBB44_105
// %bb.104:
	ldrb	w8, [sp, #128]
	mov	w27, wzr
	str	w8, [x23]
	b	.LBB44_106
.LBB44_105:
	mov	w27, wzr
.LBB44_106:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB44_111
// %bb.107:
	mov	w0, w27
	ldp	x20, x19, [sp, #288]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #272]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #256]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #240]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #224]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #208]    // 16-byte Folded Reload
	add	sp, sp, #304            // =304
	ret
.LBB44_108:
	ldr	x21, [x20, #144]
	add	x22, x21, #168          // =168
	mov	x0, x22
	bl	down_write
	mov	x0, x21
	bl	__submit_merged_bio
	mov	x0, x22
	bl	up_write
	ldr	x8, [x20, #144]
	add	x22, x8, #472           // =472
	add	x21, x8, #304           // =304
	mov	x0, x22
	bl	down_write
	mov	x0, x21
	bl	__submit_merged_bio
	mov	x0, x22
	bl	up_write
	ldr	x8, [x20, #144]
	add	x22, x8, #776           // =776
	add	x21, x8, #608           // =608
	mov	x0, x22
	bl	down_write
	mov	x0, x21
	bl	__submit_merged_bio
	mov	x0, x22
	bl	up_write
	mov	x0, x20
	mov	x1, x19
	mov	x2, xzr
	bl	f2fs_submit_merged_ipu_write
	mov	w27, wzr
	b	.LBB44_106
.LBB44_109:
	bl	preempt_schedule_notrace
	b	.LBB44_19
.LBB44_110:
	bl	preempt_schedule
	b	.LBB44_28
.LBB44_111:
	bl	__stack_chk_fail
.Lfunc_end44:
	.size	f2fs_write_single_data_page, .Lfunc_end44-f2fs_write_single_data_page
                                        // -- End function
	.globl	f2fs_get_dm_target_device // -- Begin function f2fs_get_dm_target_device
	.p2align	3
	.type	f2fs_get_dm_target_device,@function
f2fs_get_dm_target_device:              // @f2fs_get_dm_target_device
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	str	x23, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	w20, w2
	ldr	w19, [x3, #4]
	ldr	x8, [x1]
	tbz	w8, #13, .LBB45_3
// %bb.1:
	ldr	x8, [x1, #40]
	tbz	w8, #0, .LBB45_3
// %bb.2:
	ldr	x8, [x1, #40]
	tbnz	w8, #6, .LBB45_12
.LBB45_3:
	ldr	x8, [x1]
	tbz	w8, #13, .LBB45_6
// %bb.4:
	ldr	x8, [x1, #40]
	tbz	w8, #0, .LBB45_6
// %bb.5:
	ldr	x8, [x1, #40]
	sxtb	w8, w8
	tbnz	w8, #31, .LBB45_8
.LBB45_6:
	mov	w21, w19
	cbz	w19, .LBB45_13
// %bb.7:
	cmp	w19, #1                 // =1
	b.ne	.LBB45_9
.LBB45_8:
	mov	w21, #1
	b	.LBB45_13
.LBB45_9:
	mov	w21, wzr
	cbnz	w20, .LBB45_13
// %bb.10:
	cmp	w19, #2                 // =2
	b.ne	.LBB45_13
// %bb.11:
	ldr	w21, [x3, #12]
	b	.LBB45_13
.LBB45_12:
	mov	w21, wzr
.LBB45_13:
	adrp	x8, __tracepoint_f2fs_get_dm_device
	add	x8, x8, :lo12:__tracepoint_f2fs_get_dm_device
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB45_20
// %bb.14:
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
	tbz	w9, #0, .LBB45_20
// %bb.15:
	//APP
	mrs x22, sp_el0
	//NO_APP
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x23, [x8, #32]
	cbz	x23, .LBB45_18
// %bb.16:
	ldr	x8, [x23], #24
.LBB45_17:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x23, #-16]
	mov	w1, w21
	mov	w2, w20
	mov	w3, w19
	blr	x8
	ldr	x8, [x23], #24
	cbnz	x8, .LBB45_17
.LBB45_18:
	//APP
	//NO_APP
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB45_20
// %bb.19:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB45_21
.LBB45_20:
	mov	w0, w21
	ldr	x23, [sp, #16]          // 8-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB45_21:
	bl	preempt_schedule_notrace
	b	.LBB45_20
.Lfunc_end45:
	.size	f2fs_get_dm_target_device, .Lfunc_end45-f2fs_get_dm_target_device
                                        // -- End function
	.globl	f2fs_invalidate_page    // -- Begin function f2fs_invalidate_page
	.p2align	3
	.type	f2fs_invalidate_page,@function
f2fs_invalidate_page:                   // @f2fs_invalidate_page
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #24]
	mov	x29, sp
	str	x21, [sp, #16]          // 8-byte Folded Spill
	ldr	x20, [x8]
	ldr	x8, [x20, #40]
	ldr	x21, [x8, #1104]
	ldr	x8, [x20, #64]
	ldr	w9, [x21, #1172]
	cmp	x8, x9
	b.lo	.LBB46_3
// %bb.1:
	tst	w1, #0xfff
	b.ne	.LBB46_40
// %bb.2:
	cmp	w2, #1, lsl #12         // =4096
	b.ne	.LBB46_40
.LBB46_3:
	ldr	x9, [x19, #8]
	sub	x10, x9, #1             // =1
	tst	x9, #0x1
	csel	x9, x19, x10, eq
	ldr	x9, [x9]
	tbz	w9, #3, .LBB46_16
// %bb.4:
	ldr	w9, [x21, #1180]
	cmp	x8, x9
	b.ne	.LBB46_6
// %bb.5:
	add	x8, x21, #1288          // =1288
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB46_16
.LBB46_6:
	ldr	w9, [x21, #1176]
	cmp	x8, x9
	b.ne	.LBB46_8
// %bb.7:
	add	x8, x21, #1284          // =1284
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB46_16
.LBB46_8:
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.eq	.LBB46_11
// %bb.9:
	cmp	w8, #10, lsl #12        // =40960
	b.eq	.LBB46_11
// %bb.10:
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB46_15
.LBB46_11:
	add	x8, x20, #768           // =768
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x20, #712]
	tbz	x8, #37, .LBB46_13
// %bb.12:
	ldr	x8, [x20, #40]
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
.LBB46_13:
	ldr	x8, [x20, #40]
	ldrh	w9, [x20]
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
	ldrb	w8, [x20, #12]
	tbz	w8, #5, .LBB46_15
// %bb.14:
	ldr	x8, [x20, #40]
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
.LBB46_15:
	mov	x0, x20
	bl	f2fs_remove_dirty_inode
.LBB46_16:
	add	x8, x19, #40            // =40
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 8
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x19, #40]
	cmp	x8, #1                  // =1
	b.ne	.LBB46_20
// %bb.17:
	str	xzr, [x19, #40]
	ldr	x8, [x19]
	tbz	w8, #13, .LBB46_20
// %bb.18:
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
	cbnz	w9, .LBB46_20
// %bb.19:
	bl	__put_page
.LBB46_20:
	ldrb	w8, [x21, #1427]
	tbz	w8, #6, .LBB46_33
// %bb.21:
	ldr	x8, [x20, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB46_25
// %bb.22:
	ldr	w8, [x20, #1256]
	cbnz	w8, .LBB46_27
// %bb.23:
	ldr	x8, [x20, #712]
	tbnz	x8, #35, .LBB46_27
// %bb.24:
	ldr	x8, [x20, #712]
	tbnz	x8, #34, .LBB46_27
	b	.LBB46_28
.LBB46_25:
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB46_28
// %bb.26:
	ldr	x8, [x20, #712]
	tbz	w8, #31, .LBB46_28
.LBB46_27:
	ldr	w1, [x20, #64]
	mov	x0, x21
	bl	f2fs_invalidate_compress_pages
.LBB46_28:
	ldr	x8, [x21, #120]
	ldr	x9, [x20, #64]
	ldr	w8, [x8, #4]
	cmp	x9, x8
	b.ne	.LBB46_33
// %bb.29:
	ldr	x8, [x19, #40]
	and	x8, x8, #0x1ff
	cmp	x8, #1                  // =1
	str	x8, [x19, #40]
	b.ne	.LBB46_33
// %bb.30:
	str	xzr, [x19, #40]
	ldr	x8, [x19]
	tbz	w8, #13, .LBB46_33
// %bb.31:
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
	cbnz	w9, .LBB46_33
// %bb.32:
	bl	__put_page
.LBB46_33:
	ldr	x8, [x19]
	tbz	w8, #13, .LBB46_36
// %bb.34:
	ldr	x8, [x19, #40]
	tbz	w8, #0, .LBB46_36
// %bb.35:
	ldr	x8, [x19, #40]
	tbnz	w8, #1, .LBB46_41
.LBB46_36:
	ldr	x8, [x19]
	tbz	w8, #13, .LBB46_39
// %bb.37:
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
	cbnz	w9, .LBB46_39
// %bb.38:
	bl	__put_page
.LBB46_39:
	str	xzr, [x19, #40]
.LBB46_40:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB46_41:
	mov	x0, x20
	mov	x1, x19
	bl	f2fs_drop_inmem_page
	b	.LBB46_40
.Lfunc_end46:
	.size	f2fs_invalidate_page, .Lfunc_end46-f2fs_invalidate_page
                                        // -- End function
	.globl	f2fs_release_page       // -- Begin function f2fs_release_page
	.p2align	3
	.type	f2fs_release_page,@function
f2fs_release_page:                      // @f2fs_release_page
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	str	x21, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	ldr	x8, [x0, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x0, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #3, .LBB47_15
// %bb.1:
	ldr	x8, [x0]
	mov	x19, x0
	tbz	w8, #13, .LBB47_4
// %bb.2:
	ldr	x8, [x19, #40]
	tbz	w8, #0, .LBB47_4
// %bb.3:
	ldr	x8, [x19, #40]
	tbnz	w8, #1, .LBB47_15
.LBB47_4:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB47_6
// %bb.5:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB47_33
.LBB47_6:
	ldr	x0, [x19, #24]
.LBB47_7:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x8, [x8, #1104]
	ldrb	w8, [x8, #1427]
	tbz	w8, #6, .LBB47_24
// %bb.8:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB47_10
// %bb.9:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB47_34
.LBB47_10:
	ldr	x8, [x19, #24]
	mov	x0, x8
.LBB47_11:
	ldr	x21, [x8]
	ldr	x9, [x0]
	ldr	x8, [x21, #40]
	ldr	x9, [x9, #40]
	ldr	x8, [x8, #1104]
	ldr	x20, [x9, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB47_16
// %bb.12:
	ldr	w8, [x21, #1256]
	cbnz	w8, .LBB47_18
// %bb.13:
	ldr	x8, [x21, #712]
	tbnz	x8, #35, .LBB47_18
// %bb.14:
	ldr	x8, [x21, #712]
	tbnz	x8, #34, .LBB47_18
	b	.LBB47_19
.LBB47_15:
	mov	w0, wzr
	b	.LBB47_32
.LBB47_16:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB47_19
// %bb.17:
	ldr	x8, [x21, #712]
	tbz	w8, #31, .LBB47_19
.LBB47_18:
	ldr	w1, [x21, #64]
	mov	x0, x20
	bl	f2fs_invalidate_compress_pages
.LBB47_19:
	ldr	x8, [x20, #120]
	ldr	x9, [x21, #64]
	ldr	w8, [x8, #4]
	cmp	x9, x8
	b.ne	.LBB47_24
// %bb.20:
	ldr	x8, [x19, #40]
	and	x8, x8, #0x1ff
	cmp	x8, #1                  // =1
	str	x8, [x19, #40]
	b.ne	.LBB47_24
// %bb.21:
	str	xzr, [x19, #40]
	ldr	x8, [x19]
	tbz	w8, #13, .LBB47_24
// %bb.22:
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
	cbnz	w9, .LBB47_24
// %bb.23:
	bl	__put_page
.LBB47_24:
	add	x8, x19, #40            // =40
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 8
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x19, #40]
	cmp	x8, #1                  // =1
	b.ne	.LBB47_28
// %bb.25:
	str	xzr, [x19, #40]
	ldr	x8, [x19]
	tbz	w8, #13, .LBB47_28
// %bb.26:
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
	cbnz	w9, .LBB47_28
// %bb.27:
	bl	__put_page
.LBB47_28:
	ldr	x8, [x19]
	tbz	w8, #13, .LBB47_31
// %bb.29:
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
	cbnz	w9, .LBB47_31
// %bb.30:
	bl	__put_page
.LBB47_31:
	mov	w0, #1
	str	xzr, [x19, #40]
.LBB47_32:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB47_33:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB47_7
.LBB47_34:
	mov	x0, x19
	bl	__page_file_mapping
	ldr	x8, [x19, #24]
	b	.LBB47_11
.Lfunc_end47:
	.size	f2fs_release_page, .Lfunc_end47-f2fs_release_page
                                        // -- End function
	.globl	f2fs_migrate_page       // -- Begin function f2fs_migrate_page
	.p2align	3
	.type	f2fs_migrate_page,@function
f2fs_migrate_page:                      // @f2fs_migrate_page
// %bb.0:
	stp	x29, x30, [sp, #-64]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	mov	w21, w3
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x22, x0
	ldr	x24, [x0]
	mov	x19, x2
	ldr	x8, [x2]
	mov	x20, x1
	tbz	w8, #13, .LBB48_2
// %bb.1:
	ldr	x8, [x19, #40]
	tbnz	w8, #0, .LBB48_3
.LBB48_2:
	mov	w23, wzr
	b	.LBB48_4
.LBB48_3:
	ldr	x8, [x19, #40]
	ubfx	x23, x8, #1, #1
.LBB48_4:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	sxth	w8, w8
	tbnz	w8, #31, .LBB48_29
// %bb.5:
	cbz	w23, .LBB48_8
// %bb.6:
	cmp	w21, #2                 // =2
	b.ne	.LBB48_11
// %bb.7:
	add	x0, x24, #928           // =928
	bl	mutex_trylock
	cbz	w0, .LBB48_16
.LBB48_8:
	mov	x0, x22
	mov	x1, x20
	mov	x2, x19
	mov	x3, xzr
	mov	w4, w21
	mov	w5, w23
	bl	migrate_page_move_mapping
	cbz	w0, .LBB48_12
// %bb.9:
	mov	w22, w0
	cbz	w23, .LBB48_28
// %bb.10:
	add	x0, x24, #928           // =928
	bl	mutex_unlock
	b	.LBB48_28
.LBB48_11:
	mov	w22, #-16
	b	.LBB48_28
.LBB48_12:
	cbz	w23, .LBB48_21
// %bb.13:
	ldr	x8, [x24, #904]
	add	x9, x24, #904           // =904
	cmp	x8, x9
	b.eq	.LBB48_18
.LBB48_14:                              // =>This Inner Loop Header: Depth=1
	ldr	x10, [x8, #16]
	cmp	x10, x19
	b.eq	.LBB48_17
// %bb.15:                              //   in Loop: Header=BB48_14 Depth=1
	ldr	x8, [x8]
	cmp	x8, x9
	b.ne	.LBB48_14
	b	.LBB48_18
.LBB48_16:
	mov	w22, #-11
	b	.LBB48_28
.LBB48_17:
	str	x20, [x8, #16]
.LBB48_18:
	add	x0, x24, #928           // =928
	bl	mutex_unlock
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
	cbnz	w9, .LBB48_20
// %bb.19:
	bl	__put_page
.LBB48_20:
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	add	x8, x8, #52             // =52
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB48_21:
	str	xzr, [x20, #40]
	ldr	x8, [x19]
	tbz	w8, #13, .LBB48_24
// %bb.22:
	ldr	x8, [x19, #40]
	str	x8, [x20, #40]
	//APP
	// atomic64_or
	prfm	pstl1strm, [x20]
1:	ldxr	x8, [x20]
	orr	x8, x8, 8192
	stxr	w9, x8, [x20]
	cbnz	w9, 1b
	//NO_APP
	ldr	x8, [x20, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	add	x8, x8, #52             // =52
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	str	xzr, [x19, #40]
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
	cbnz	w9, .LBB48_24
// %bb.23:
	bl	__put_page
.LBB48_24:
	mov	x0, x20
	mov	x1, x19
	cmp	w21, #3                 // =3
	b.ne	.LBB48_26
// %bb.25:
	bl	migrate_page_states
	b	.LBB48_27
.LBB48_26:
	bl	migrate_page_copy
.LBB48_27:
	mov	w22, wzr
.LBB48_28:
	mov	w0, w22
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #64     // 16-byte Folded Reload
	ret
.LBB48_29:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 5980; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end48:
	.size	f2fs_migrate_page, .Lfunc_end48-f2fs_migrate_page
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_write_data_page
	.type	f2fs_write_data_page,@function
f2fs_write_data_page:                   // @f2fs_write_data_page
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #24]
	mov	x20, x1
	mov	x29, sp
	ldr	x0, [x8]
	ldr	x8, [x0, #40]
	ldr	x8, [x8, #1104]
	ldr	x9, [x8, #224]
	ldrb	w9, [x9, #132]
	tbnz	w9, #3, .LBB49_9
// %bb.1:
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB49_5
// %bb.2:
	ldr	w8, [x0, #1256]
	cbnz	w8, .LBB49_7
// %bb.3:
	ldr	x8, [x0, #712]
	tbnz	x8, #35, .LBB49_7
// %bb.4:
	ldr	x8, [x0, #712]
	tbnz	x8, #34, .LBB49_7
	b	.LBB49_9
.LBB49_5:
	ldrh	w8, [x0]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB49_9
// %bb.6:
	ldr	x8, [x0, #712]
	tbz	w8, #31, .LBB49_9
.LBB49_7:
	ldr	x1, [x19, #32]
	bl	f2fs_is_compressed_cluster
	cbz	w0, .LBB49_9
// %bb.8:
	mov	x0, x20
	mov	x1, x19
	bl	redirty_page_for_writepage
	mov	w0, #524288
	b	.LBB49_10
.LBB49_9:
	mov	x0, x19
	mov	x1, xzr
	mov	x2, xzr
	mov	x3, xzr
	mov	x4, x20
	mov	w5, #4
	mov	w6, wzr
	mov	w7, #1
	bl	f2fs_write_single_data_page
.LBB49_10:
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end49:
	.size	f2fs_write_data_page, .Lfunc_end49-f2fs_write_data_page
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_read_data_page
	.type	f2fs_read_data_page,@function
f2fs_read_data_page:                    // @f2fs_read_data_page
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x1
	ldr	x8, [x1, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x1, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB50_2
// %bb.1:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB50_19
.LBB50_2:
	ldr	x0, [x19, #24]
.LBB50_3:
	adrp	x8, __tracepoint_f2fs_readpage
	ldr	x20, [x0]
	add	x8, x8, :lo12:__tracepoint_f2fs_readpage
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB50_10
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
	tbz	w9, #0, .LBB50_10
// %bb.5:
	//APP
	mrs x21, sp_el0
	//NO_APP
	ldr	w9, [x21, #80]
	add	w9, w9, #1              // =1
	str	w9, [x21, #80]
	//APP
	//NO_APP
	ldr	x22, [x8, #32]
	cbz	x22, .LBB50_8
// %bb.6:
	ldr	x8, [x22], #24
.LBB50_7:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x22, #-16]
	mov	x1, x19
	mov	w2, wzr
	blr	x8
	ldr	x8, [x22], #24
	cbnz	x8, .LBB50_7
.LBB50_8:
	//APP
	//NO_APP
	ldr	w8, [x21, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x21, #80]
	b.ne	.LBB50_10
// %bb.9:
	ldr	x8, [x21]
	tbnz	w8, #1, .LBB50_21
.LBB50_10:
	mov	x0, x20
	bl	f2fs_is_compress_backend_ready
	tbz	w0, #0, .LBB50_17
// %bb.11:
	ldr	x8, [x20, #712]
	tbz	w8, #10, .LBB50_13
// %bb.12:
	mov	x0, x20
	mov	x1, x19
	bl	f2fs_read_inline_data
	cmn	w0, #11                 // =11
	b.ne	.LBB50_18
.LBB50_13:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB50_15
// %bb.14:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB50_20
.LBB50_15:
	ldr	x0, [x19, #24]
.LBB50_16:
	mov	x1, xzr
	mov	x2, x19
	mov	w3, #1
	mov	w4, wzr
	bl	f2fs_mpage_readpages
	mov	w0, wzr
	b	.LBB50_18
.LBB50_17:
	mov	x0, x19
	bl	unlock_page
	mov	w0, #-95
.LBB50_18:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB50_19:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB50_3
.LBB50_20:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB50_16
.LBB50_21:
	bl	preempt_schedule_notrace
	b	.LBB50_10
.Lfunc_end50:
	.size	f2fs_read_data_page, .Lfunc_end50-f2fs_read_data_page
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_write_data_pages
	.type	f2fs_write_data_pages,@function
f2fs_write_data_pages:                  // @f2fs_write_data_pages
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	sub	sp, sp, #496            // =496
	adrp	x8, __stack_chk_guard
	//APP
	mrs x22, sp_el0
	//NO_APP
	mov	w10, #9
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stur	x8, [x29, #-16]
	ldr	x25, [x0]
	ldr	x8, [x0, #120]
	str	x0, [sp, #80]           // 8-byte Folded Spill
	ldr	x9, [x25, #792]
	ldr	x8, [x8]
	cmp	x9, x22
	mov	w9, #4
	csel	w9, w10, w9, eq
	str	w9, [sp, #92]           // 4-byte Folded Spill
	cbz	x8, .LBB51_57
// %bb.1:
	ldr	x8, [x25, #40]
	mov	x19, x1
	ldr	x26, [x8, #1104]
	ldr	w8, [x25, #768]
	cbnz	w8, .LBB51_3
// %bb.2:
	ldr	w8, [x19, #32]
	cbz	w8, .LBB51_57
.LBB51_3:
	ldr	x8, [x26, #80]
	adrp	x24, __tracepoint_f2fs_writepages
	add	x24, x24, :lo12:__tracepoint_f2fs_writepages
	tbnz	w8, #3, .LBB51_50
// %bb.4:
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.eq	.LBB51_6
// %bb.5:
	ldrb	w8, [x25, #12]
	tbz	w8, #5, .LBB51_7
.LBB51_6:
	ldr	w8, [x19, #32]
	cbz	w8, .LBB51_30
.LBB51_7:
	ldr	x8, [x25, #712]
	tbz	x8, #37, .LBB51_20
// %bb.8:
	ldr	w8, [x19, #32]
	cbnz	w8, .LBB51_20
// %bb.9:
	ldr	w8, [x25, #768]
	cmp	w8, #4                  // =4
	b.gt	.LBB51_20
// %bb.10:
	ldr	w8, [x25, #1272]
	cmp	w8, #64                 // =64
	b.hi	.LBB51_20
// %bb.11:
	ldr	w9, [x26, #1328]
	cmp	w9, #128                // =128
	b.gt	.LBB51_20
// %bb.12:
	add	w8, w8, #1              // =1
	ldr	w21, [x25, #64]
	str	w8, [x25, #1272]
	adrp	x8, __tracepoint_f2fs_skip_log_writeback
	add	x8, x8, :lo12:__tracepoint_f2fs_skip_log_writeback
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB51_50
// %bb.13:
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
	tbz	w9, #0, .LBB51_50
// %bb.14:
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x20, [x8, #32]
	cbz	x20, .LBB51_17
// %bb.15:
	ldr	x8, [x20], #24
.LBB51_16:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x20, #-16]
	mov	w1, w21
	blr	x8
	ldr	x8, [x20], #24
	cbnz	x8, .LBB51_16
.LBB51_17:
	//APP
	//NO_APP
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB51_50
// %bb.18:
	ldr	x8, [x22]
	tbz	w8, #1, .LBB51_50
// %bb.19:
	bl	preempt_schedule_notrace
	b	.LBB51_50
.LBB51_20:
	str	wzr, [x25, #1272]
	ldr	x8, [x25, #712]
	tbnz	w8, #22, .LBB51_50
// %bb.21:
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	ldr	x21, [x8]
	ldr	w8, [x24, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB51_28
// %bb.22:
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
	tbz	w8, #0, .LBB51_28
// %bb.23:
	ldr	w8, [x22, #80]
	add	w8, w8, #1              // =1
	str	w8, [x22, #80]
	//APP
	//NO_APP
	ldr	x20, [x24, #32]
	cbz	x20, .LBB51_26
// %bb.24:
	ldr	x8, [x20], #24
.LBB51_25:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x20, #-16]
	mov	x1, x21
	mov	x2, x19
	mov	w3, wzr
	blr	x8
	ldr	x8, [x20], #24
	cbnz	x8, .LBB51_25
.LBB51_26:
	//APP
	//NO_APP
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB51_28
// %bb.27:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB51_189
.LBB51_28:
	ldr	w8, [x19, #32]
	cmp	w8, #1                  // =1
	b.ne	.LBB51_32
// %bb.29:
	add	x8, x26, #1376          // =1376
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB51_33
.LBB51_30:
	ldr	w8, [x25, #768]
	ldr	x9, [x26]
	ldr	x9, [x9, #256]
	ldr	w9, [x9, #456]
	cbz	w9, .LBB51_48
// %bb.31:
	mov	w9, wzr
	cmp	w8, w9
	b.lt	.LBB51_49
	b	.LBB51_7
.LBB51_32:
	ldr	w8, [x26, #1376]
	cbnz	w8, .LBB51_50
.LBB51_33:
	ldrb	w8, [x22, #111]
	tbnz	w8, #1, .LBB51_35
// %bb.34:
	str	wzr, [x22, #2512]
	mov	w2, #25
	ldr	x8, [x25, #40]
	mov	w1, #4096
	mov	w3, #1
	ldr	x0, [x8, #248]
	bl	blk_throtl_get_quota
.LBB51_35:
	ldr	x8, [x25, #792]
	stp	x25, x22, [sp, #24]     // 16-byte Folded Spill
	cbnz	x8, .LBB51_41
// %bb.36:
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB51_41
// %bb.37:
	ldrb	w8, [x25, #12]
	tbnz	w8, #5, .LBB51_41
// %bb.38:
	ldr	x8, [x25, #40]
	ldr	x8, [x8, #1104]
	ldr	w9, [x8, #1532]
	ldr	x10, [x25, #712]
	tbnz	w10, #31, .LBB51_184
.LBB51_39:
	ldr	w9, [x19, #32]
	cmp	w9, #1                  // =1
	b.ne	.LBB51_187
// %bb.40:
	ldr	w9, [x25, #768]
	ldr	x8, [x8, #136]
	ldr	w8, [x8, #148]
	cmp	w9, w8
	b.hs	.LBB51_187
.LBB51_41:
	str	wzr, [sp, #12]          // 4-byte Folded Spill
.LBB51_42:
	add	x0, sp, #96             // =96
	bl	blk_start_plug
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	mov	w9, #-1
	stur	xzr, [x29, #-216]
	str	xzr, [sp, #192]
	str	wzr, [sp, #200]
	ldr	x25, [x8]
	str	wzr, [sp, #156]
	sturh	wzr, [x29, #-144]
	ldr	x8, [x25, #40]
	ldr	w10, [x25, #1268]
	ldrb	w11, [x25, #1261]
	stp	x25, x9, [sp, #168]
	ldr	x23, [x8, #1104]
	lsl	x8, x10, #12
	str	xzr, [sp, #208]
	stp	w10, w11, [sp, #184]
	str	wzr, [sp, #216]
	stp	xzr, xzr, [sp, #224]
	stp	x8, xzr, [sp, #240]
	stp	xzr, xzr, [sp, #256]
	ldr	x8, [x25, #40]
	ldr	x22, [x8, #248]
	ldr	w9, [x25, #768]
	ldr	x8, [x8, #1104]
	ldr	x8, [x8, #136]
	ldr	w8, [x8, #152]
	cmp	w9, w8
	b.ls	.LBB51_45
// %bb.43:
	add	x8, x25, #712           // =712
	mov	w9, #33554432
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	bic	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldrb	w8, [x19, #36]
	tbz	w8, #4, .LBB51_46
.LBB51_44:
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	mov	x20, #-1
	str	wzr, [sp, #8]           // 4-byte Folded Spill
	ldr	x8, [x8, #112]
	str	x8, [sp, #160]
	b	.LBB51_61
.LBB51_45:
	add	x8, x25, #712           // =712
	mov	w9, #33554432
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x10, [x8]
	orr	x10, x10, x9
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	//NO_APP
	ldrb	w8, [x19, #36]
	tbnz	w8, #4, .LBB51_44
.LBB51_46:
	ldp	x9, x8, [x19, #16]
	asr	x10, x9, #12
	asr	x20, x8, #12
	str	x10, [sp, #160]
	cbz	x9, .LBB51_60
// %bb.47:
	str	wzr, [sp, #8]           // 4-byte Folded Spill
	b	.LBB51_61
.LBB51_48:
	ldr	w9, [x26, #1188]
	cmp	w8, w9
	b.ge	.LBB51_7
.LBB51_49:
	mov	x0, x26
	mov	w1, #2
	bl	f2fs_available_free_memory
	tbz	w0, #0, .LBB51_7
.LBB51_50:
	ldrsw	x8, [x25, #768]
	ldr	x9, [x19, #8]
	add	x8, x9, x8
	str	x8, [x19, #8]
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	ldr	x20, [x8]
	ldr	w8, [x24, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB51_57
// %bb.51:
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
	tbz	w8, #0, .LBB51_57
// %bb.52:
	ldr	w8, [x22, #80]
	add	w8, w8, #1              // =1
	str	w8, [x22, #80]
	//APP
	//NO_APP
	ldr	x21, [x24, #32]
	cbz	x21, .LBB51_55
// %bb.53:
	ldr	x8, [x21], #24
.LBB51_54:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x21, #-16]
	mov	x1, x20
	mov	x2, x19
	mov	w3, wzr
	blr	x8
	ldr	x8, [x21], #24
	cbnz	x8, .LBB51_54
.LBB51_55:
	//APP
	//NO_APP
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB51_57
// %bb.56:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB51_188
.LBB51_57:
	mov	w27, wzr
.LBB51_58:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB51_190
// %bb.59:
	mov	w0, w27
	add	sp, sp, #496            // =496
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB51_60:
	mov	x9, #9223372036854775807
	cmp	x8, x9
	cset	w8, eq
	str	w8, [sp, #8]            // 4-byte Folded Spill
.LBB51_61:
	sub	x1, x29, #200           // =200
	mov	x0, x25
	mov	x2, x19
	bl	f2fs_init_dm_info
	ldr	w8, [x19, #32]
	str	x26, [sp, #16]          // 8-byte Folded Spill
	cmp	w8, #1                  // =1
	b.ne	.LBB51_63
// %bb.62:
	mov	w9, #2
	b	.LBB51_64
.LBB51_63:
	ldrb	w9, [x19, #36]
	lsr	w9, w9, #1
	and	w9, w9, #0x2
.LBB51_64:
	mov	w26, wzr
	mov	w27, wzr
	str	w9, [sp, #52]           // 4-byte Folded Spill
	str	wzr, [sp, #68]          // 4-byte Folded Spill
	str	x22, [sp, #40]          // 8-byte Folded Spill
	cmp	w8, #1                  // =1
	b.eq	.LBB51_67
	b	.LBB51_66
.LBB51_65:
	ldr	w8, [x19, #32]
	mov	x20, #-1
	str	xzr, [sp, #160]
	cmp	w8, #1                  // =1
	b.eq	.LBB51_67
.LBB51_66:
	ldrb	w8, [x19, #36]
	tbz	w8, #2, .LBB51_68
.LBB51_67:
	ldr	x1, [sp, #160]
	mov	x2, x20
	ldr	x0, [sp, #80]           // 8-byte Folded Reload
	bl	tag_pages_for_writeback
.LBB51_68:
	ldr	x28, [sp, #160]
	ldr	w8, [sp, #68]           // 4-byte Folded Reload
	str	wzr, [sp, #64]          // 4-byte Folded Spill
	cbnz	w8, .LBB51_142
// %bb.69:
	cmp	x28, x20
	b.hi	.LBB51_142
// %bb.70:
	stp	x20, xzr, [sp, #56]     // 16-byte Folded Spill
.LBB51_71:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB51_79 Depth 2
                                        //       Child Loop BB51_81 Depth 3
	ldr	x1, [sp, #80]           // 8-byte Folded Reload
	sub	x0, x29, #144           // =144
	ldr	w4, [sp, #52]           // 4-byte Folded Reload
	add	x2, sp, #160            // =160
	mov	x3, x20
	bl	pagevec_lookup_range_tag
	cbz	w0, .LBB51_142
// %bb.72:                              //   in Loop: Header=BB51_71 Depth=1
	mov	w21, w0
	cbz	x22, .LBB51_77
// %bb.73:                              //   in Loop: Header=BB51_71 Depth=1
	ldr	x8, [x22, #128]
	cbz	x8, .LBB51_77
// %bb.74:                              //   in Loop: Header=BB51_71 Depth=1
	ldr	x20, [x8, #1280]
	cbz	x20, .LBB51_77
// %bb.75:                              //   in Loop: Header=BB51_71 Depth=1
	mov	x0, x20
	mov	x1, x19
	bl	wbt_fs_get_quota
	tbnz	w0, #0, .LBB51_77
// %bb.76:                              //   in Loop: Header=BB51_71 Depth=1
	mov	x0, x20
	mov	x1, x19
	bl	wbt_fs_wait
.LBB51_77:                              //   in Loop: Header=BB51_71 Depth=1
	cmp	w21, #1                 // =1
	b.lt	.LBB51_136
// %bb.78:                              //   in Loop: Header=BB51_71 Depth=1
	mov	x20, xzr
	mov	w8, w21
	str	x8, [sp, #72]           // 8-byte Folded Spill
.LBB51_79:                              //   Parent Loop BB51_71 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB51_81 Depth 3
	sub	x8, x29, #144           // =144
	mov	w24, w27
	add	x8, x8, x20, lsl #3
	ldr	x21, [x8, #8]
	b	.LBB51_81
.LBB51_80:                              //   in Loop: Header=BB51_81 Depth=3
	mov	w24, wzr
	mov	w27, wzr
	tbz	w22, #0, .LBB51_131
.LBB51_81:                              //   Parent Loop BB51_71 Depth=1
                                        //     Parent Loop BB51_79 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	x8, [x25, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB51_85
// %bb.82:                              //   in Loop: Header=BB51_81 Depth=3
	ldr	w8, [x25, #1256]
	cbnz	w8, .LBB51_88
// %bb.83:                              //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x25, #712]
	tbnz	x8, #35, .LBB51_88
// %bb.84:                              //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x25, #712]
	tbz	x8, #34, .LBB51_87
	b	.LBB51_88
.LBB51_85:                              //   in Loop: Header=BB51_81 Depth=3
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB51_87
// %bb.86:                              //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x25, #712]
	tbnz	w8, #31, .LBB51_88
.LBB51_87:                              //   in Loop: Header=BB51_81 Depth=3
	ldr	w8, [x23, #1376]
	cbnz	w8, .LBB51_96
	b	.LBB51_99
.LBB51_88:                              //   in Loop: Header=BB51_81 Depth=3
	add	x0, sp, #168            // =168
	bl	f2fs_init_compress_ctx
	cbnz	w0, .LBB51_132
// %bb.89:                              //   in Loop: Header=BB51_81 Depth=3
	ldr	x1, [x21, #32]
	add	x0, sp, #168            // =168
	bl	f2fs_cluster_can_merge_page
	tbz	w0, #0, .LBB51_97
// %bb.90:                              //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x23, #224]
	ldrb	w8, [x8, #132]
	tbnz	w8, #3, .LBB51_98
// %bb.91:                              //   in Loop: Header=BB51_81 Depth=3
	add	x0, sp, #168            // =168
	bl	f2fs_cluster_is_empty
	tbz	w0, #0, .LBB51_98
// %bb.92:                              //   in Loop: Header=BB51_81 Depth=3
	ldr	x2, [x21, #32]
	add	x1, sp, #144            // =144
	sub	x3, x29, #208           // =208
	mov	x0, x25
	stur	xzr, [x29, #-208]
	bl	f2fs_prepare_compress_overwrite
	mov	w27, w0
	tbnz	w0, #31, .LBB51_134
// %bb.93:                              //   in Loop: Header=BB51_81 Depth=3
	cbz	w27, .LBB51_95
// %bb.94:                              //   in Loop: Header=BB51_81 Depth=3
	ldur	x1, [x29, #-208]
	mov	x0, x25
	ldr	x2, [x21, #32]
	mov	w3, #1
	bl	f2fs_compress_write_end
	tbz	w0, #0, .LBB51_140
.LBB51_95:                              //   in Loop: Header=BB51_81 Depth=3
	mov	w24, wzr
	ldr	w8, [x23, #1376]
	cbz	w8, .LBB51_99
.LBB51_96:                              //   in Loop: Header=BB51_81 Depth=3
	ldr	w8, [x19, #32]
	cbnz	w8, .LBB51_99
	b	.LBB51_135
.LBB51_97:                              //   in Loop: Header=BB51_81 Depth=3
	ldr	w3, [sp, #92]           // 4-byte Folded Reload
	add	x0, sp, #168            // =168
	add	x1, sp, #156            // =156
	mov	x2, x19
	bl	f2fs_write_multi_pages
	cmp	w0, #0                  // =0
	mov	w27, w0
	cset	w22, eq
	b	.LBB51_121
.LBB51_98:                              //   in Loop: Header=BB51_81 Depth=3
	mov	w24, wzr
.LBB51_99:                              //   in Loop: Header=BB51_81 Depth=3
	ldr	x28, [x21, #32]
	mov	w22, wzr
.LBB51_100:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x9, [x8]
	stur	x9, [x29, #-208]
	ldur	x9, [x29, #-208]
	tbnz	w9, #0, .LBB51_102
// %bb.101:                             //   in Loop: Header=BB51_81 Depth=3
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x8]
1:	ldaxr	x9, [x8]
	orr	x10, x9, 1
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	
	//NO_APP
	tbz	w9, #0, .LBB51_103
.LBB51_102:                             //   in Loop: Header=BB51_81 Depth=3
	mov	x0, x21
	bl	__lock_page
.LBB51_103:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x21, #24]
	ldr	x9, [sp, #80]           // 8-byte Folded Reload
	cmp	x8, x9
	b.ne	.LBB51_128
// %bb.104:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #3, .LBB51_128
// %bb.105:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	sxth	w8, w8
	tbz	w8, #31, .LBB51_108
// %bb.106:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	w8, [x19, #32]
	cbz	w8, .LBB51_128
// %bb.107:                             //   in Loop: Header=BB51_81 Depth=3
	mov	x0, x21
	mov	w1, wzr
	mov	w2, #1
	mov	w3, #1
	bl	f2fs_wait_on_page_writeback
.LBB51_108:                             //   in Loop: Header=BB51_81 Depth=3
	mov	x0, x21
	bl	clear_page_dirty_for_io
	cbz	w0, .LBB51_128
// %bb.109:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x25, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB51_113
// %bb.110:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	w8, [x25, #1256]
	cbnz	w8, .LBB51_129
// %bb.111:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x25, #712]
	tbnz	x8, #35, .LBB51_129
// %bb.112:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x25, #712]
	tbz	x8, #34, .LBB51_115
	b	.LBB51_129
.LBB51_113:                             //   in Loop: Header=BB51_81 Depth=3
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB51_115
// %bb.114:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	x8, [x25, #712]
	tbnz	w8, #31, .LBB51_129
.LBB51_115:                             //   in Loop: Header=BB51_81 Depth=3
	ldurb	w8, [x29, #-200]
	cbz	w8, .LBB51_117
// %bb.116:                             //   in Loop: Header=BB51_81 Depth=3
	sub	x3, x29, #200           // =200
	mov	x1, x21
	mov	w2, wzr
	bl	f2fs_get_dm_target_device
	str	w0, [sp, #156]
.LBB51_117:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	w5, [sp, #92]           // 4-byte Folded Reload
	add	x1, sp, #156            // =156
	sub	x2, x29, #216           // =216
	sub	x3, x29, #224           // =224
	mov	x0, x21
	mov	x4, x19
	mov	w6, wzr
	mov	w7, #1
	bl	f2fs_write_single_data_page
	mov	w27, w0
	cmp	w0, #128, lsl #12       // =524288
	b.ne	.LBB51_119
// %bb.118:                             //   in Loop: Header=BB51_81 Depth=3
	mov	x0, x21
	bl	unlock_page
.LBB51_119:                             //   in Loop: Header=BB51_81 Depth=3
	ldurb	w8, [x29, #-200]
	cmp	w27, #0                 // =0
	cset	w9, eq
	tst	w8, w9
	b.eq	.LBB51_121
// %bb.120:                             //   in Loop: Header=BB51_81 Depth=3
	sub	x2, x29, #200           // =200
	mov	x0, x25
	mov	x1, x21
	bl	f2fs_update_dm_info
.LBB51_121:                             //   in Loop: Header=BB51_81 Depth=3
	ldrsw	x9, [sp, #156]
	ldr	x8, [x19]
	add	w26, w9, w26
	sub	x8, x8, x9
	str	x8, [x19]
	cbnz	w27, .LBB51_124
// %bb.122:                             //   in Loop: Header=BB51_81 Depth=3
	cmp	x8, #0                  // =0
	b.gt	.LBB51_80
// %bb.123:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	w8, [x19, #32]
	cbnz	w8, .LBB51_80
	b	.LBB51_133
.LBB51_124:                             //   in Loop: Header=BB51_81 Depth=3
	cmp	w27, #128, lsl #12      // =524288
	b.eq	.LBB51_80
// %bb.125:                             //   in Loop: Header=BB51_81 Depth=3
	cmn	w27, #11                // =11
	b.ne	.LBB51_141
// %bb.126:                             //   in Loop: Header=BB51_81 Depth=3
	ldr	w8, [x19, #32]
	cmp	w8, #1                  // =1
	b.ne	.LBB51_80
// %bb.127:                             //   in Loop: Header=BB51_81 Depth=3
	mov	w0, wzr
	mov	w1, #5
	bl	congestion_wait
	mov	w24, wzr
	b	.LBB51_100
.LBB51_128:                             //   in Loop: Header=BB51_79 Depth=2
	mov	x0, x21
	bl	unlock_page
	b	.LBB51_130
.LBB51_129:                             //   in Loop: Header=BB51_79 Depth=2
	ldr	x8, [x21, #8]
	add	x0, sp, #168            // =168
	mov	x1, x21
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	add	x8, x8, #52             // =52
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_compress_ctx_add_page
.LBB51_130:                             //   in Loop: Header=BB51_79 Depth=2
	mov	w27, w24
.LBB51_131:                             //   in Loop: Header=BB51_79 Depth=2
	ldr	x8, [sp, #72]           // 8-byte Folded Reload
	add	x20, x20, #1            // =1
	cmp	x20, x8
	b.ne	.LBB51_79
	b	.LBB51_136
.LBB51_132:                             //   in Loop: Header=BB51_71 Depth=1
	mov	w27, w0
	b	.LBB51_134
.LBB51_133:                             //   in Loop: Header=BB51_71 Depth=1
	mov	w27, wzr
.LBB51_134:                             //   in Loop: Header=BB51_71 Depth=1
	mov	w8, #1
	str	w8, [sp, #68]           // 4-byte Folded Spill
	ldurb	w8, [x29, #-144]
	cbnz	w8, .LBB51_137
	b	.LBB51_138
.LBB51_135:                             //   in Loop: Header=BB51_71 Depth=1
	mov	w8, #1
	mov	w27, w24
	str	w8, [sp, #68]           // 4-byte Folded Spill
.LBB51_136:                             //   in Loop: Header=BB51_71 Depth=1
	ldurb	w8, [x29, #-144]
	cbz	w8, .LBB51_138
.LBB51_137:                             //   in Loop: Header=BB51_71 Depth=1
	sub	x0, x29, #144           // =144
	bl	__pagevec_release
.LBB51_138:                             //   in Loop: Header=BB51_71 Depth=1
	ldp	w9, w8, [sp, #64]       // 8-byte Folded Reload
	ldr	x22, [sp, #40]          // 8-byte Folded Reload
	ldr	x20, [sp, #56]          // 8-byte Folded Reload
	orr	w8, w8, w9
	cbnz	w8, .LBB51_142
// %bb.139:                             //   in Loop: Header=BB51_71 Depth=1
	ldr	x8, [sp, #160]
	cmp	x8, x20
	b.ls	.LBB51_71
	b	.LBB51_142
.LBB51_140:                             //   in Loop: Header=BB51_71 Depth=1
	mov	w8, #1
	mov	w27, wzr
	str	w8, [sp, #64]           // 4-byte Folded Spill
	ldurb	w8, [x29, #-144]
	cbnz	w8, .LBB51_137
	b	.LBB51_138
.LBB51_141:                             //   in Loop: Header=BB51_71 Depth=1
	ldr	x8, [x21, #32]
	add	x28, x8, #1             // =1
	b	.LBB51_134
.LBB51_142:
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB51_146
// %bb.143:
	ldr	x8, [x25, #712]
	tbz	w8, #31, .LBB51_146
// %bb.144:
	add	x0, sp, #168            // =168
	bl	f2fs_cluster_is_empty
	tbnz	w0, #0, .LBB51_146
// %bb.145:
	ldr	w3, [sp, #92]           // 4-byte Folded Reload
	add	x0, sp, #168            // =168
	add	x1, sp, #156            // =156
	mov	x2, x19
	bl	f2fs_write_multi_pages
	ldrsw	x8, [sp, #156]
	cmp	w0, #0                  // =0
	ldr	x9, [x19]
	mov	w27, w0
	add	w26, w8, w26
	sub	x8, x9, x8
	ldr	w9, [sp, #64]           // 4-byte Folded Reload
	str	x8, [x19]
	csel	w9, wzr, w9, ne
	str	w9, [sp, #64]           // 4-byte Folded Spill
	ldr	w9, [sp, #68]           // 4-byte Folded Reload
	csinc	w9, w9, wzr, eq
	str	w9, [sp, #68]           // 4-byte Folded Spill
.LBB51_146:
	ldrh	w8, [x25]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB51_149
// %bb.147:
	ldr	x8, [x25, #712]
	tbz	w8, #31, .LBB51_149
// %bb.148:
	add	x0, sp, #168            // =168
	mov	w1, wzr
	bl	f2fs_destroy_compress_ctx
.LBB51_149:
	ldr	w8, [sp, #64]           // 4-byte Folded Reload
	cbnz	w8, .LBB51_65
// %bb.150:
	ldrb	w9, [x19, #36]
	ldr	w8, [sp, #68]           // 4-byte Folded Reload
	tst	w9, #0x10
	ccmp	w8, #0, #0, ne
	csel	x8, x28, xzr, ne
	tbnz	w9, #4, .LBB51_153
// %bb.151:
	ldr	w9, [sp, #8]            // 4-byte Folded Reload
	cbz	w9, .LBB51_154
// %bb.152:
	ldr	x9, [x19]
	cmp	x9, #1                  // =1
	b.lt	.LBB51_154
.LBB51_153:
	ldr	x9, [sp, #80]           // 8-byte Folded Reload
	str	x8, [x9, #112]
.LBB51_154:
	ldp	x25, x20, [sp, #24]     // 16-byte Folded Reload
	cbz	w26, .LBB51_158
// %bb.155:
	adrp	x8, write_opt
	ldr	w8, [x8, :lo12:write_opt]
	cbz	w8, .LBB51_157
// %bb.156:
	ldr	x8, [x20, #1728]
	tbnz	w8, #28, .LBB51_158
.LBB51_157:
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	mov	x2, xzr
	mov	w3, wzr
	mov	w4, wzr
	mov	w5, wzr
	ldr	x1, [x8]
	ldr	x8, [x1, #40]
	ldr	x0, [x8, #1104]
	bl	__submit_merged_write_cond
.LBB51_158:
	ldur	x8, [x29, #-216]
	cbz	x8, .LBB51_160
// %bb.159:
	sub	x1, x29, #216           // =216
	mov	x0, x23
	mov	x2, xzr
	bl	f2fs_submit_merged_ipu_write
.LBB51_160:
	ldurb	w8, [x29, #-200]
	ldr	x24, [sp, #16]          // 8-byte Folded Reload
	cbz	w8, .LBB51_174
// %bb.161:
	add	x21, x23, #2192         // =2192
	mov	x0, x21
	bl	mutex_lock
	ldr	w8, [x23, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB51_173
// %bb.162:
	ldr	x8, [x23, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB51_173
// %bb.163:
	ldr	x9, [x23, #2224]
	ldur	w8, [x29, #-160]
	cbz	x9, .LBB51_166
// %bb.164:
	ldur	w10, [x29, #-156]
	ldr	w11, [x9, #728]
	add	w10, w11, w10
	str	w10, [x9, #728]
	ldr	x9, [x23, #2224]
	cbz	x9, .LBB51_166
// %bb.165:
	ldur	w10, [x29, #-152]
	ldr	w11, [x9, #732]
	add	w10, w11, w10
	str	w10, [x9, #732]
.LBB51_166:
	cmp	w8, #9                  // =9
	b.hs	.LBB51_168
// %bb.167:
	mov	x8, xzr
	b	.LBB51_171
.LBB51_168:
	cmp	w8, #129                // =129
	b.hs	.LBB51_170
// %bb.169:
	mov	w8, #1
	b	.LBB51_171
.LBB51_170:
	cmp	w8, #513                // =513
	mov	w8, #2
	cinc	x8, x8, hs
.LBB51_171:
	ldr	x9, [x23, #2224]
	cbz	x9, .LBB51_173
// %bb.172:
	ldur	w10, [x29, #-164]
	add	x9, x9, x10, lsl #4
	add	x8, x9, x8, lsl #2
	ldr	w9, [x8, #664]
	add	w9, w9, #1              // =1
	str	w9, [x8, #664]
.LBB51_173:
	mov	x0, x21
	bl	mutex_unlock
.LBB51_174:
	add	x0, sp, #96             // =96
	bl	blk_finish_plug
	ldr	w8, [sp, #12]           // 4-byte Folded Reload
	cbz	w8, .LBB51_176
// %bb.175:
	add	x0, x24, #88            // =88
	bl	mutex_unlock
.LBB51_176:
	ldrb	w8, [x20, #111]
	tbnz	w8, #1, .LBB51_181
// %bb.177:
	ldr	w8, [x20, #2512]
	cbz	w8, .LBB51_181
// %bb.178:
	subs	w20, w8, #1             // =1
	b.eq	.LBB51_181
// %bb.179:
	ldr	x8, [x25, #40]
	mov	w22, #25
	ldr	x21, [x8, #248]
.LBB51_180:                             // =>This Inner Loop Header: Depth=1
	mov	x0, x21
	mov	w1, #4096
	mov	x2, x22
	mov	w3, #1
	sub	w20, w20, #1            // =1
	bl	blk_throtl_get_quota
	cbnz	w20, .LBB51_180
.LBB51_181:
	ldr	w8, [x19, #32]
	cmp	w8, #1                  // =1
	b.ne	.LBB51_183
// %bb.182:
	add	x8, x24, #1376          // =1376
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB51_183:
	mov	x0, x25
	bl	f2fs_remove_dirty_inode
	b	.LBB51_58
.LBB51_184:
	cbz	w9, .LBB51_187
// %bb.185:
	cmp	w9, #1                  // =1
	b.ne	.LBB51_39
// %bb.186:
	ldr	x9, [x25, #712]
	tbz	x9, #34, .LBB51_39
.LBB51_187:
	add	x0, x26, #88            // =88
	bl	mutex_lock
	mov	w8, #1
	str	w8, [sp, #12]           // 4-byte Folded Spill
	b	.LBB51_42
.LBB51_188:
	bl	preempt_schedule_notrace
	b	.LBB51_57
.LBB51_189:
	bl	preempt_schedule_notrace
	b	.LBB51_28
.LBB51_190:
	bl	__stack_chk_fail
.Lfunc_end51:
	.size	f2fs_write_data_pages, .Lfunc_end51-f2fs_write_data_pages
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_set_data_page_dirty
	.type	f2fs_set_data_page_dirty,@function
f2fs_set_data_page_dirty:               // @f2fs_set_data_page_dirty
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x0, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB52_2
// %bb.1:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB52_27
.LBB52_2:
	ldr	x0, [x19, #24]
.LBB52_3:
	adrp	x8, __tracepoint_f2fs_set_page_dirty
	ldr	x20, [x0]
	add	x8, x8, :lo12:__tracepoint_f2fs_set_page_dirty
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB52_10
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
	tbz	w9, #0, .LBB52_10
// %bb.5:
	//APP
	mrs x21, sp_el0
	//NO_APP
	ldr	w9, [x21, #80]
	add	w9, w9, #1              // =1
	str	w9, [x21, #80]
	//APP
	//NO_APP
	ldr	x22, [x8, #32]
	cbz	x22, .LBB52_8
// %bb.6:
	ldr	x8, [x22], #24
.LBB52_7:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x22, #-16]
	mov	x1, x19
	mov	w2, wzr
	blr	x8
	ldr	x8, [x22], #24
	cbnz	x8, .LBB52_7
.LBB52_8:
	//APP
	//NO_APP
	ldr	w8, [x21, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x21, #80]
	b.ne	.LBB52_10
// %bb.9:
	ldr	x8, [x21]
	tbnz	w8, #1, .LBB52_28
.LBB52_10:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB52_12
// %bb.11:
	//APP
	dmb ishst
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x19]
1:	ldxr	x8, [x19]
	orr	x8, x8, 4
	stxr	w9, x8, [x19]
	cbnz	w9, 1b
	//NO_APP
	b	.LBB52_13
.LBB52_12:
	//APP
	dmb ishld
	//NO_APP
.LBB52_13:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB52_15
// %bb.14:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB52_25
.LBB52_15:
	ldr	x8, [x20, #712]
	sxth	w8, w8
	tbz	w8, #31, .LBB52_21
// %bb.16:
	ldr	x8, [x20, #712]
	tbnz	w8, #16, .LBB52_21
// %bb.17:
	ldr	x8, [x19]
	tbz	w8, #13, .LBB52_20
// %bb.18:
	ldr	x8, [x19, #40]
	tbz	w8, #0, .LBB52_20
// %bb.19:
	ldr	x8, [x19, #40]
	tbnz	w8, #1, .LBB52_24
.LBB52_20:
	mov	x0, x20
	mov	x1, x19
	bl	f2fs_register_inmem_page
	b	.LBB52_23
.LBB52_21:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #3, .LBB52_24
// %bb.22:
	mov	x0, x19
	bl	__set_page_dirty_nobuffers
	mov	x0, x20
	mov	x1, x19
	bl	f2fs_update_dirty_page
.LBB52_23:
	mov	w0, #1
	b	.LBB52_26
.LBB52_24:
	mov	w0, wzr
	b	.LBB52_26
.LBB52_25:
	mov	x0, x19
	bl	__set_page_dirty_nobuffers
.LBB52_26:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB52_27:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB52_3
.LBB52_28:
	bl	preempt_schedule_notrace
	b	.LBB52_10
.Lfunc_end52:
	.size	f2fs_set_data_page_dirty, .Lfunc_end52-f2fs_set_data_page_dirty
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_read_data_pages
	.type	f2fs_read_data_pages,@function
f2fs_read_data_pages:                   // @f2fs_read_data_pages
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	adrp	x9, __tracepoint_f2fs_readpages
	str	x25, [sp, #16]          // 8-byte Folded Spill
	add	x9, x9, :lo12:__tracepoint_f2fs_readpages
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	mov	w21, w3
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	x19, x2
	ldr	x22, [x1]
	mov	x20, x1
	ldr	x8, [x2, #8]
	mov	x29, sp
	ldr	w10, [x9, #8]
	cmp	w10, #1                 // =1
	b.lt	.LBB53_7
// %bb.1:
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
	tbz	w10, #0, .LBB53_7
// %bb.2:
	//APP
	mrs x24, sp_el0
	//NO_APP
	ldr	w10, [x24, #80]
	add	w10, w10, #1            // =1
	str	w10, [x24, #80]
	//APP
	//NO_APP
	ldr	x25, [x9, #32]
	cbz	x25, .LBB53_5
// %bb.3:
	ldr	x9, [x25], #24
	sub	x23, x8, #8             // =8
.LBB53_4:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x25, #-16]
	mov	x1, x22
	mov	x2, x23
	mov	w3, w21
	blr	x9
	ldr	x9, [x25], #24
	cbnz	x9, .LBB53_4
.LBB53_5:
	//APP
	//NO_APP
	ldr	w8, [x24, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x24, #80]
	b.ne	.LBB53_7
// %bb.6:
	ldr	x8, [x24]
	tbnz	w8, #1, .LBB53_10
.LBB53_7:
	ldr	x8, [x22, #712]
	tbnz	w8, #10, .LBB53_9
.LBB53_8:
	mov	x0, x20
	mov	x1, x19
	mov	x2, xzr
	mov	w3, w21
	mov	w4, #1
	bl	f2fs_mpage_readpages
.LBB53_9:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB53_10:
	bl	preempt_schedule_notrace
	ldr	x8, [x22, #712]
	tbz	w8, #10, .LBB53_8
	b	.LBB53_9
.Lfunc_end53:
	.size	f2fs_read_data_pages, .Lfunc_end53-f2fs_read_data_pages
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_write_begin
	.type	f2fs_write_begin,@function
f2fs_write_begin:                       // @f2fs_write_begin
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	sub	sp, sp, #432            // =432
	adrp	x8, __stack_chk_guard
	stp	x6, x5, [sp, #96]       // 16-byte Folded Spill
	adrp	x28, __tracepoint_android_fs_datawrite_start
	adrp	x23, cpu_number
	add	x28, x28, :lo12:__tracepoint_android_fs_datawrite_start
	adrp	x19, __cpu_online_mask
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	w25, w4
	mov	w20, w3
	mov	x21, x2
	add	x23, x23, :lo12:cpu_number
	add	x19, x19, :lo12:__cpu_online_mask
	stur	x8, [x29, #-16]
	ldr	x24, [x1]
	ldr	x8, [x24, #40]
	ldr	x22, [x8, #1104]
	ldr	w8, [x28, #8]
	stp	x1, x22, [sp, #112]     // 16-byte Folded Spill
	cmp	w8, #1                  // =1
	b.lt	.LBB54_12
// %bb.1:
	mov	x0, x24
	bl	ihold
	mov	x0, x24
	bl	d_obtain_alias
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB54_277
// %bb.2:
	add	x1, sp, #160            // =160
	mov	w2, #256
	mov	x27, x0
	bl	dentry_path_raw
	mov	x26, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB54_278
.LBB54_3:
	mov	x0, x27
	bl	dput
.LBB54_4:
	//APP
	mrs x22, sp_el0
	//NO_APP
	ldr	w27, [x22, #1784]
	ldr	w8, [x28, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB54_11
// %bb.5:
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
	ldr	w8, [x8, x23]
	add	w9, w8, #63             // =63
	cmp	w8, #0                  // =0
	csel	w9, w9, w8, lt
	asr	w9, w9, #6
	ldr	x9, [x19, w9, sxtw #3]
	lsr	x8, x9, x8
	tbz	w8, #0, .LBB54_11
// %bb.6:
	ldr	w8, [x22, #80]
	add	w8, w8, #1              // =1
	str	w8, [x22, #80]
	//APP
	//NO_APP
	ldr	x19, [x28, #32]
	cbz	x19, .LBB54_9
// %bb.7:
	ldr	x8, [x19], #24
	add	x28, x22, #2232         // =2232
.LBB54_8:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x19, #-16]
	mov	x1, x24
	mov	x2, x21
	mov	w3, w20
	mov	w4, w27
	mov	x5, x26
	mov	x6, x28
	blr	x8
	ldr	x8, [x19], #24
	cbnz	x8, .LBB54_8
.LBB54_9:
	//APP
	//NO_APP
	adrp	x19, __cpu_online_mask
	ldr	w8, [x22, #80]
	add	x19, x19, :lo12:__cpu_online_mask
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	b.ne	.LBB54_11
// %bb.10:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB54_293
.LBB54_11:
	ldr	x22, [sp, #120]         // 8-byte Folded Reload
.LBB54_12:
	adrp	x8, __tracepoint_f2fs_write_begin
	add	x8, x8, :lo12:__tracepoint_f2fs_write_begin
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB54_19
// %bb.13:
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
	ldr	w9, [x9, x23]
	add	w10, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w10, w10, w9, lt
	asr	w10, w10, #6
	ldr	x10, [x19, w10, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB54_19
// %bb.14:
	//APP
	mrs x19, sp_el0
	//NO_APP
	ldr	w9, [x19, #80]
	add	w9, w9, #1              // =1
	str	w9, [x19, #80]
	//APP
	//NO_APP
	ldr	x22, [x8, #32]
	cbz	x22, .LBB54_17
// %bb.15:
	ldr	x8, [x22], #24
.LBB54_16:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x22, #-16]
	mov	x1, x24
	mov	x2, x21
	mov	w3, w20
	mov	w4, w25
	blr	x8
	ldr	x8, [x22], #24
	cbnz	x8, .LBB54_16
.LBB54_17:
	//APP
	//NO_APP
	ldr	w8, [x19, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x19, #80]
	ldr	x22, [sp, #120]         // 8-byte Folded Reload
	b.ne	.LBB54_19
// %bb.18:
	ldr	x8, [x19]
	tbnz	w8, #1, .LBB54_279
.LBB54_19:
	ldr	x8, [x22, #80]
	tbnz	w8, #8, .LBB54_280
.LBB54_20:
	ldr	x8, [x24, #712]
	sxth	w8, w8
	tbz	w8, #31, .LBB54_22
// %bb.21:
	mov	w1, #5
	mov	x0, x22
	bl	f2fs_available_free_memory
	tbz	w0, #0, .LBB54_29
.LBB54_22:
	ldr	x8, [x24, #712]
	tbnz	w8, #29, .LBB54_29
// %bb.23:
	lsr	x25, x21, #12
	cbz	x25, .LBB54_25
// %bb.24:
	mov	x0, x24
	bl	f2fs_convert_inline_inode
	mov	w28, w0
	cbnz	w0, .LBB54_252
.LBB54_25:
	ldr	x8, [x24, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB54_30
// %bb.26:
	ldr	w8, [x24, #1256]
	cbnz	w8, .LBB54_32
// %bb.27:
	ldr	x8, [x24, #712]
	tbnz	x8, #35, .LBB54_32
// %bb.28:
	ldr	x8, [x24, #712]
	tbnz	x8, #34, .LBB54_32
	b	.LBB54_35
.LBB54_29:
	ldr	x0, [sp, #112]          // 8-byte Folded Reload
	add	x1, x21, w20, uxtw
	bl	f2fs_write_failed
	mov	x0, x22
	mov	w1, wzr
	bl	f2fs_drop_inmem_pages_all
	mov	w28, #-12
	b	.LBB54_254
.LBB54_30:
	ldrh	w8, [x24]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB54_35
// %bb.31:
	ldr	x8, [x24, #712]
	tbz	w8, #31, .LBB54_35
.LBB54_32:
	ldp	x3, x1, [sp, #96]       // 16-byte Folded Reload
	mov	x0, x24
	mov	x2, x25
	str	xzr, [x3]
	bl	f2fs_prepare_compress_overwrite
	mov	w28, w0
	tbnz	w0, #31, .LBB54_252
// %bb.33:
	cbz	w28, .LBB54_35
.LBB54_34:
	mov	w28, wzr
	b	.LBB54_254
.LBB54_35:
	mov	w3, #64
	ldr	x0, [sp, #112]          // 8-byte Folded Reload
	movk	w3, #96, lsl #16
	mov	x1, x25
	mov	w2, #14
	bl	pagecache_get_page
	cbz	x0, .LBB54_251
// %bb.36:
	mov	w8, w20
	mov	x23, x0
	str	wzr, [sp, #60]          // 4-byte Folded Spill
	str	wzr, [sp, #76]          // 4-byte Folded Spill
	stp	x8, x25, [sp, #8]       // 16-byte Folded Spill
	add	x8, x8, x21
	str	x8, [sp, #64]           // 8-byte Folded Spill
	and	x8, x21, #0xfffffffffffff000
	str	x8, [sp, #24]           // 8-byte Folded Spill
	add	x8, sp, #160            // =160
	add	x8, x8, #8              // =8
	str	x8, [sp, #80]           // 8-byte Folded Spill
	add	x8, x22, #304           // =304
	str	x8, [sp, #40]           // 8-byte Folded Spill
	add	x8, x22, #424           // =424
	str	x8, [sp, #32]           // 8-byte Folded Spill
	and	x8, x21, #0xfff
	str	x8, [sp, #48]           // 8-byte Folded Spill
.LBB54_37:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB54_59 Depth 2
	ldr	x8, [sp, #104]          // 8-byte Folded Reload
	cmp	w20, #1, lsl #12        // =4096
	str	x23, [x8]
	ldp	x8, x22, [x23, #24]
	ldr	x27, [x8]
	str	wzr, [sp, #136]
	str	xzr, [sp, #128]
	ldr	x8, [x27, #712]
	b.ne	.LBB54_41
// %bb.38:                              //   in Loop: Header=BB54_37 Depth=1
	tbnz	w8, #10, .LBB54_41
// %bb.39:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x27, #712]
	tbnz	w8, #24, .LBB54_41
// %bb.40:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x27, #712]
	tbz	w8, #30, .LBB54_53
.LBB54_41:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x27, #712]
	tbz	w8, #10, .LBB54_44
// %bb.42:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	w8, [x27, #1168]
	ldr	w9, [x27, #1160]
	mvn	w8, w8
	sub	w8, w8, w9, asr #2
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	add	w8, w8, #923            // =923
	cmp	x9, w8, sxtw #2
	b.ls	.LBB54_44
// %bb.43:                              //   in Loop: Header=BB54_37 Depth=1
	str	wzr, [sp, #96]          // 4-byte Folded Spill
	b	.LBB54_45
.LBB54_44:                              //   in Loop: Header=BB54_37 Depth=1
	mov	w8, #5
	str	w8, [sp, #96]           // 4-byte Folded Spill
.LBB54_45:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x27, #712]
	tbnz	w8, #10, .LBB54_48
// %bb.46:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x27, #80]
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	cmp	x9, x8
	b.hs	.LBB54_48
// %bb.47:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	x19, [sp, #120]         // 8-byte Folded Reload
	mov	w25, wzr
	str	wzr, [sp, #88]          // 4-byte Folded Spill
	b	.LBB54_49
.LBB54_48:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	x19, [sp, #120]         // 8-byte Folded Reload
	mov	w2, #1
	ldr	w1, [sp, #96]           // 4-byte Folded Reload
	mov	w3, wzr
	mov	w25, #1
	mov	x0, x19
	bl	__do_map_lock
	str	w0, [sp, #88]           // 4-byte Folded Spill
.LBB54_49:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	x1, [x27, #64]
	mov	x0, x19
	bl	f2fs_get_node_page
	mov	x26, x0
	cmn	x0, #1, lsl #12         // =4096
	b.ls	.LBB54_58
.LBB54_50:                              //   in Loop: Header=BB54_37 Depth=1
	mov	w28, w26
	tst	w25, #0xff
	b.eq	.LBB54_52
.LBB54_51:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	w8, [sp, #96]           // 4-byte Folded Reload
	ldr	w9, [sp, #88]           // 4-byte Folded Reload
	cmp	w8, #5                  // =5
	cset	w8, eq
	tst	w8, w9
	ldp	x9, x8, [sp, #32]       // 16-byte Folded Reload
	csel	x0, x9, x8, ne
	bl	up_read
.LBB54_52:                              //   in Loop: Header=BB54_37 Depth=1
	cbnz	w28, .LBB54_233
.LBB54_53:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	w8, [sp, #76]           // 4-byte Folded Reload
	mov	x22, x23
	tst	w8, #0xff
	b.eq	.LBB54_186
// %bb.54:                              //   in Loop: Header=BB54_37 Depth=1
	ldrb	w8, [x24, #12]
	tbnz	w8, #5, .LBB54_186
// %bb.55:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [sp, #120]          // 8-byte Folded Reload
	ldr	w19, [x8, #1192]
	ldr	w28, [x8, #1188]
	ldrsw	x25, [x8, #1284]
	ldr	w23, [x8, #1184]
	ldrsw	x26, [x8, #1272]
	ldrsw	x27, [x8, #1296]
	ldr	x8, [x8, #80]
	tbnz	w8, #3, .LBB54_186
// %bb.56:                              //   in Loop: Header=BB54_37 Depth=1
	ldr	x14, [sp, #120]         // 8-byte Folded Reload
	ldr	x11, [x14, #136]
	ldr	x8, [x11, #8]
	ldr	w9, [x11, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	b.eq	.LBB54_99
// %bb.57:                              //   in Loop: Header=BB54_37 Depth=1
	udiv	w10, w9, w19
	b	.LBB54_100
.LBB54_58:                              //   in Loop: Header=BB54_37 Depth=1
	mov	w28, wzr
.LBB54_59:                              //   Parent Loop BB54_37 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	x0, sp, #160            // =160
	mov	w1, wzr
	mov	w2, #48
	bl	memset
	stp	x27, x26, [sp, #160]
	str	x26, [sp, #176]
	str	wzr, [sp, #184]
	ldr	x8, [x27, #712]
	tbnz	w8, #10, .LBB54_128
// %bb.60:                              //   in Loop: Header=BB54_59 Depth=2
	tst	w25, #0xff
	b.ne	.LBB54_132
// %bb.61:                              //   in Loop: Header=BB54_59 Depth=2
	add	x2, sp, #128            // =128
	mov	x0, x27
	mov	x1, x22
	bl	f2fs_lookup_extent_cache
	tbnz	w0, #0, .LBB54_135
// %bb.62:                              //   in Loop: Header=BB54_59 Depth=2
	add	x0, sp, #160            // =160
	mov	x1, x22
	mov	w2, #1
	bl	f2fs_get_dnode_of_data
	mov	w28, w0
	cbnz	w0, .LBB54_64
// %bb.63:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	w8, [sp, #196]
	cbnz	w8, .LBB54_131
.LBB54_64:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x26, [sp, #176]
	cbz	x26, .LBB54_89
// %bb.65:                              //   in Loop: Header=BB54_59 Depth=2
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
	b.ne	.LBB54_81
// %bb.66:                              //   in Loop: Header=BB54_59 Depth=2
	tbnz	w8, #0, .LBB54_80
// %bb.67:                              //   in Loop: Header=BB54_59 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB54_70
// %bb.68:                              //   in Loop: Header=BB54_59 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB54_70
// %bb.69:                              //   in Loop: Header=BB54_59 Depth=2
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB54_70:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_72
// %bb.71:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB54_96
.LBB54_72:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x0, [x26, #24]
.LBB54_73:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_75
// %bb.74:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB54_97
.LBB54_75:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x0, [x26, #24]
.LBB54_76:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_78
// %bb.77:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x8, [x26]
	tbnz	w8, #10, .LBB54_98
.LBB54_78:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x0, [x26, #24]
.LBB54_79:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB54_80:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB54_87
	b	.LBB54_304
.LBB54_81:                              //   in Loop: Header=BB54_59 Depth=2
	tbnz	w8, #0, .LBB54_86
// %bb.82:                              //   in Loop: Header=BB54_59 Depth=2
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB54_85
// %bb.83:                              //   in Loop: Header=BB54_59 Depth=2
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB54_85
// %bb.84:                              //   in Loop: Header=BB54_59 Depth=2
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB54_85:                              //   in Loop: Header=BB54_59 Depth=2
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB54_86:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB54_305
.LBB54_87:                              //   in Loop: Header=BB54_59 Depth=2
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
	cbnz	w9, .LBB54_89
// %bb.88:                              //   in Loop: Header=BB54_59 Depth=2
	bl	__put_page
.LBB54_89:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x8, [sp, #168]
	cbz	x8, .LBB54_93
// %bb.90:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x9, [sp, #176]
	cmp	x9, x8
	b.eq	.LBB54_93
// %bb.91:                              //   in Loop: Header=BB54_59 Depth=2
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
	cbnz	w9, .LBB54_93
// %bb.92:                              //   in Loop: Header=BB54_59 Depth=2
	bl	__put_page
.LBB54_93:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x19, [sp, #120]         // 8-byte Folded Reload
	mov	w1, #5
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	mov	w2, #1
	mov	w3, wzr
	mov	x0, x19
	stp	xzr, xzr, [x8]
	bl	__do_map_lock
	ldr	w8, [sp, #96]           // 4-byte Folded Reload
	str	w0, [sp, #88]           // 4-byte Folded Spill
	cmp	w8, #5                  // =5
	b.ne	.LBB54_95
.LBB54_94:                              //   in Loop: Header=BB54_59 Depth=2
	ldr	x1, [x27, #64]
	mov	x0, x19
	bl	f2fs_get_node_page
	mov	x26, x0
	mov	w25, #1
	cmn	x0, #1, lsl #12         // =4096
	b.ls	.LBB54_59
	b	.LBB54_50
.LBB54_95:                              //   in Loop: Header=BB54_59 Depth=2
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	printk
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 5327; .short (1 << 0)|(((9) << 8)); .popsection; 14471: brk 0x800
	//NO_APP
	b	.LBB54_94
.LBB54_96:                              //   in Loop: Header=BB54_59 Depth=2
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB54_73
.LBB54_97:                              //   in Loop: Header=BB54_59 Depth=2
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB54_76
.LBB54_98:                              //   in Loop: Header=BB54_59 Depth=2
	mov	x0, x26
	bl	__page_file_mapping
	b	.LBB54_79
.LBB54_99:                              //   in Loop: Header=BB54_37 Depth=1
	mov	w10, #-1
.LBB54_100:                             //   in Loop: Header=BB54_37 Depth=1
	cmp	w8, w10
	b.ne	.LBB54_105
// %bb.101:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	w12, [x14, #1284]
	mov	w15, #48
	ldr	w13, [x14, #1272]
	ldr	w16, [x14, #1272]
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
	b.lo	.LBB54_105
// %bb.102:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	w13, [x10, #580]
	madd	x13, x13, x15, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w28, w13
	cmp	w13, w12
	b.lo	.LBB54_105
// %bb.103:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	w13, [x10, #700]
	madd	x13, x13, x15, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w28, w13
	cmp	w13, w12
	b.lo	.LBB54_105
// %bb.104:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	w12, [x10, #100]
	madd	x11, x12, x15, x11
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w11, w28, w11
	cmp	w11, w16
	b.hs	.LBB54_182
.LBB54_105:                             //   in Loop: Header=BB54_37 Depth=1
	mul	w10, w28, w19
	cmn	w9, #1                  // =1
	sub	x10, x10, #1            // =1
	add	x12, x10, x26
	add	x11, x10, x25
	asr	x12, x12, x23
	add	x10, x10, x27
	asr	x11, x11, x23
	udiv	w12, w12, w19
	asr	x10, x10, x23
	udiv	w11, w11, w19
	udiv	w10, w10, w19
	add	w11, w11, w12, lsl #1
	add	w10, w11, w10
	b.eq	.LBB54_107
// %bb.106:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x11, [sp, #120]         // 8-byte Folded Reload
	ldr	w11, [x11, #1192]
	udiv	w9, w9, w11
.LBB54_107:                             //   in Loop: Header=BB54_37 Depth=1
	add	w9, w10, w9
	cmp	w8, w9
	b.hi	.LBB54_186
// %bb.108:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	mov	x19, x22
	bl	unlock_page
	ldr	x0, [sp, #120]          // 8-byte Folded Reload
	mov	w1, #1
	bl	f2fs_balance_fs
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x9, [x8]
	str	x9, [sp, #160]
	ldr	x9, [sp, #160]
	tbnz	w9, #0, .LBB54_110
// %bb.109:                             //   in Loop: Header=BB54_37 Depth=1
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x8]
1:	ldaxr	x9, [x8]
	orr	x10, x9, 1
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	
	//NO_APP
	tbz	w9, #0, .LBB54_111
.LBB54_110:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x19
	bl	__lock_page
.LBB54_111:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x19, #24]
	ldr	x9, [sp, #112]          // 8-byte Folded Reload
	cmp	x8, x9
	b.eq	.LBB54_186
// %bb.112:                             //   in Loop: Header=BB54_37 Depth=1
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
	b.ne	.LBB54_173
// %bb.113:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	mov	w23, #64
	movk	w23, #96, lsl #16
	mov	w28, #-12
	tbnz	w8, #0, .LBB54_127
// %bb.114:                             //   in Loop: Header=BB54_37 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB54_117
// %bb.115:                             //   in Loop: Header=BB54_37 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB54_117
// %bb.116:                             //   in Loop: Header=BB54_37 Depth=1
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB54_117:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_119
// %bb.118:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB54_225
.LBB54_119:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [x22, #24]
.LBB54_120:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_122
// %bb.121:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB54_226
.LBB54_122:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [x22, #24]
.LBB54_123:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_125
// %bb.124:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB54_227
.LBB54_125:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [x22, #24]
.LBB54_126:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB54_127:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB54_179
	b	.LBB54_306
.LBB54_128:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	w8, [x27, #1168]
	ldr	w9, [x27, #1160]
	mvn	w8, w8
	sub	w8, w8, w9, asr #2
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	add	w8, w8, #923            // =923
	cmp	x9, w8, sxtw #2
	b.ls	.LBB54_138
// %bb.129:                             //   in Loop: Header=BB54_37 Depth=1
	add	x0, sp, #160            // =160
	mov	x1, x23
	bl	f2fs_convert_inline_page
	mov	w28, w0
	cbnz	w0, .LBB54_143
// %bb.130:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	w8, [sp, #196]
	cbz	w8, .LBB54_214
.LBB54_131:                             //   in Loop: Header=BB54_37 Depth=1
	mov	w28, wzr
	b	.LBB54_142
.LBB54_132:                             //   in Loop: Header=BB54_37 Depth=1
	str	wzr, [sp, #152]
	add	x2, sp, #144            // =144
	str	xzr, [sp, #144]
	mov	x0, x27
.LBB54_133:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x1, x22
	bl	f2fs_lookup_extent_cache
	tbz	w0, #0, .LBB54_137
// %bb.134:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	w8, [sp, #152]
	mov	w28, wzr
	ldr	w9, [sp, #144]
	b	.LBB54_136
.LBB54_135:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	w8, [sp, #136]
	ldr	w9, [sp, #128]
.LBB54_136:                             //   in Loop: Header=BB54_37 Depth=1
	add	w8, w8, w22
	sub	w8, w8, w9
	str	w8, [sp, #196]
	b	.LBB54_142
.LBB54_137:                             //   in Loop: Header=BB54_37 Depth=1
	add	x0, sp, #160            // =160
	mov	x1, x22
	bl	f2fs_reserve_block
	mov	w28, w0
	b	.LBB54_142
.LBB54_138:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x23
	mov	x1, x26
	bl	f2fs_do_read_inline_data
	mov	x0, x27
	mov	w1, #1
	add	x8, x27, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1048576
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	ldr	w8, [x27, #72]
	cbz	w8, .LBB54_142
// %bb.139:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x26]
	tbnz	w8, #13, .LBB54_141
// %bb.140:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x26, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x26, x9, eq
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
	prfm	pstl1strm, [x26]
1:	ldxr	x8, [x26]
	orr	x8, x8, 8192
	stxr	w9, x8, [x26]
	cbnz	w9, 1b
	//NO_APP
	str	xzr, [x26, #40]
.LBB54_141:                             //   in Loop: Header=BB54_37 Depth=1
	add	x8, x26, #40            // =40
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
	orr	x9, x9, 16
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB54_142:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	w8, [sp, #196]
	str	w8, [sp, #60]           // 4-byte Folded Spill
	ldrb	w8, [sp, #193]
	str	w8, [sp, #76]           // 4-byte Folded Spill
.LBB54_143:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x22, [sp, #176]
	cbz	x22, .LBB54_168
// %bb.144:                             //   in Loop: Header=BB54_37 Depth=1
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
	b.ne	.LBB54_160
// %bb.145:                             //   in Loop: Header=BB54_37 Depth=1
	tbnz	w8, #0, .LBB54_159
// %bb.146:                             //   in Loop: Header=BB54_37 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB54_149
// %bb.147:                             //   in Loop: Header=BB54_37 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB54_149
// %bb.148:                             //   in Loop: Header=BB54_37 Depth=1
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB54_149:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_151
// %bb.150:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB54_222
.LBB54_151:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [x22, #24]
.LBB54_152:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_154
// %bb.153:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB54_223
.LBB54_154:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [x22, #24]
.LBB54_155:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_157
// %bb.156:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB54_224
.LBB54_157:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [x22, #24]
.LBB54_158:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB54_159:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB54_166
	b	.LBB54_307
.LBB54_160:                             //   in Loop: Header=BB54_37 Depth=1
	tbnz	w8, #0, .LBB54_165
// %bb.161:                             //   in Loop: Header=BB54_37 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB54_164
// %bb.162:                             //   in Loop: Header=BB54_37 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB54_164
// %bb.163:                             //   in Loop: Header=BB54_37 Depth=1
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB54_164:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB54_165:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB54_308
.LBB54_166:                             //   in Loop: Header=BB54_37 Depth=1
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
	cbnz	w9, .LBB54_168
// %bb.167:                             //   in Loop: Header=BB54_37 Depth=1
	bl	__put_page
.LBB54_168:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [sp, #168]
	cbz	x8, .LBB54_172
// %bb.169:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x9, [sp, #176]
	cmp	x9, x8
	b.eq	.LBB54_172
// %bb.170:                             //   in Loop: Header=BB54_37 Depth=1
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
	cbnz	w9, .LBB54_172
// %bb.171:                             //   in Loop: Header=BB54_37 Depth=1
	bl	__put_page
.LBB54_172:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [sp, #80]           // 8-byte Folded Reload
	stp	xzr, xzr, [x8]
	tst	w25, #0xff
	b.ne	.LBB54_51
	b	.LBB54_52
.LBB54_173:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	mov	w23, #64
	movk	w23, #96, lsl #16
	mov	w28, #-12
	tbnz	w8, #0, .LBB54_178
// %bb.174:                             //   in Loop: Header=BB54_37 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB54_177
// %bb.175:                             //   in Loop: Header=BB54_37 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB54_177
// %bb.176:                             //   in Loop: Header=BB54_37 Depth=1
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB54_177:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB54_178:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB54_309
.LBB54_179:                             //   in Loop: Header=BB54_37 Depth=1
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
	cbnz	w9, .LBB54_181
.LBB54_180:                             //   in Loop: Header=BB54_37 Depth=1
	bl	__put_page
.LBB54_181:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [sp, #112]          // 8-byte Folded Reload
	mov	x1, x25
	mov	w2, #14
	mov	w3, w23
	bl	pagecache_get_page
	mov	x23, x0
	cbnz	x0, .LBB54_37
	b	.LBB54_252
.LBB54_182:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [sp, #120]          // 8-byte Folded Reload
	ldr	w8, [x8, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB54_186
// %bb.183:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [sp, #120]          // 8-byte Folded Reload
	ldr	x8, [x8, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB54_186
// %bb.184:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	w1, [x10, #820]
	ldr	x0, [sp, #120]          // 8-byte Folded Reload
	str	w16, [sp, #96]          // 4-byte Folded Spill
	str	x1, [sp, #88]           // 8-byte Folded Spill
                                        // kill: def $w1 killed $w1 killed $x1
	bl	f2fs_usable_blks_in_seg
	ldr	x8, [sp, #120]          // 8-byte Folded Reload
	mov	w10, #48
	ldr	x11, [sp, #88]          // 8-byte Folded Reload
	ldr	x9, [x8, #136]
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x11, x10, x8
	ldr	w10, [sp, #96]          // 4-byte Folded Reload
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w10
	b.hs	.LBB54_186
// %bb.185:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x9, #8]
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB54_105
.LBB54_186:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	mov	w1, wzr
	mov	w2, wzr
	mov	w3, #1
	mov	x23, x22
	bl	f2fs_wait_on_page_writeback
	cmp	w20, #1, lsl #12        // =4096
	b.eq	.LBB54_34
// %bb.187:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB54_266
// %bb.188:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [sp, #48]           // 8-byte Folded Reload
	cbnz	x8, .LBB54_191
// %bb.189:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x24, #80]
	ldr	x9, [sp, #64]           // 8-byte Folded Reload
	cmp	x9, x8
	b.lt	.LBB54_191
// %bb.190:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x24, #712]
	tbz	w8, #30, .LBB54_272
.LBB54_191:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	w19, [sp, #60]          // 4-byte Folded Reload
	cmn	w19, #1                 // =1
	b.eq	.LBB54_267
// %bb.192:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [sp, #120]          // 8-byte Folded Reload
	mov	w1, w19
	mov	w2, #8
	bl	f2fs_is_valid_blkaddr
	tbz	w0, #0, .LBB54_270
// %bb.193:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x24
	mov	x1, x23
	mov	w2, w19
	mov	w3, wzr
	mov	w4, #1
	bl	f2fs_submit_page_read
	cbnz	w0, .LBB54_271
// %bb.194:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x9, [x8]
	str	x9, [sp, #160]
	ldr	x9, [sp, #160]
	tbnz	w9, #0, .LBB54_196
// %bb.195:                             //   in Loop: Header=BB54_37 Depth=1
	//APP
	// atomic64_fetch_or_acquire
	prfm	pstl1strm, [x8]
1:	ldaxr	x9, [x8]
	orr	x10, x9, 1
	stxr	w11, x10, [x8]
	cbnz	w11, 1b
	
	//NO_APP
	tbz	w9, #0, .LBB54_197
.LBB54_196:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x23
	bl	__lock_page
.LBB54_197:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x23, #24]
	ldr	x9, [sp, #112]          // 8-byte Folded Reload
	cmp	x8, x9
	b.eq	.LBB54_231
// %bb.198:                             //   in Loop: Header=BB54_37 Depth=1
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
	b.ne	.LBB54_215
// %bb.199:                             //   in Loop: Header=BB54_37 Depth=1
	tbnz	w8, #0, .LBB54_213
// %bb.200:                             //   in Loop: Header=BB54_37 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB54_203
// %bb.201:                             //   in Loop: Header=BB54_37 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB54_203
// %bb.202:                             //   in Loop: Header=BB54_37 Depth=1
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB54_203:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22, #8]
	mov	x10, x22
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_205
// %bb.204:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB54_228
.LBB54_205:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [x22, #24]
.LBB54_206:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	mov	x10, x22
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_208
// %bb.207:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB54_229
.LBB54_208:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [x22, #24]
.LBB54_209:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	mov	x10, x22
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_211
// %bb.210:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB54_230
.LBB54_211:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [x22, #24]
.LBB54_212:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB54_213:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22, #8]
	mov	x10, x22
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB54_221
	b	.LBB54_310
.LBB54_214:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x0, [sp, #160]
	add	x2, sp, #144            // =144
	str	wzr, [sp, #152]
	str	xzr, [sp, #144]
	b	.LBB54_133
.LBB54_215:                             //   in Loop: Header=BB54_37 Depth=1
	tbnz	w8, #0, .LBB54_220
// %bb.216:                             //   in Loop: Header=BB54_37 Depth=1
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB54_219
// %bb.217:                             //   in Loop: Header=BB54_37 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB54_219
// %bb.218:                             //   in Loop: Header=BB54_37 Depth=1
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB54_219:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB54_220:                             //   in Loop: Header=BB54_37 Depth=1
	ldr	x8, [x22, #8]
	mov	x10, x22
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB54_311
.LBB54_221:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	bl	unlock_page
	ldr	x8, [x22, #8]
	mov	w23, #64
	movk	w23, #96, lsl #16
	mov	w28, #-12
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
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	cbnz	w9, .LBB54_181
	b	.LBB54_180
.LBB54_222:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB54_152
.LBB54_223:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB54_155
.LBB54_224:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB54_158
.LBB54_225:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB54_120
.LBB54_226:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB54_123
.LBB54_227:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB54_126
.LBB54_228:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB54_206
.LBB54_229:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB54_209
.LBB54_230:                             //   in Loop: Header=BB54_37 Depth=1
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB54_212
.LBB54_231:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB54_256
// %bb.232:
	mov	w28, #-5
.LBB54_233:
	cbz	x23, .LBB54_265
// %bb.234:
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
	b.ne	.LBB54_257
// %bb.235:
	tbnz	w8, #0, .LBB54_249
// %bb.236:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB54_239
// %bb.237:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB54_239
// %bb.238:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB54_239:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_241
// %bb.240:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB54_298
.LBB54_241:
	ldr	x0, [x23, #24]
.LBB54_242:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_244
// %bb.243:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB54_299
.LBB54_244:
	ldr	x0, [x23, #24]
.LBB54_245:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB54_247
// %bb.246:
	ldr	x8, [x23]
	tbnz	w8, #10, .LBB54_300
.LBB54_247:
	ldr	x0, [x23, #24]
.LBB54_248:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB54_249:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB54_263
// %bb.250:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB54_251:
	mov	w28, #-12
.LBB54_252:
	ldr	x0, [sp, #112]          // 8-byte Folded Reload
	add	x1, x21, w20, uxtw
.LBB54_253:
	bl	f2fs_write_failed
.LBB54_254:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB54_301
// %bb.255:
	mov	w0, w28
	add	sp, sp, #432            // =432
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB54_256:
	//APP
	dmb ishld
	//NO_APP
	mov	w28, wzr
	b	.LBB54_254
.LBB54_257:
	tbnz	w8, #0, .LBB54_262
// %bb.258:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB54_261
// %bb.259:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB54_261
// %bb.260:
	adrp	x19, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	ldr	x0, [x19, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x19, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB54_261:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB54_262:
	ldr	x8, [x23, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x23, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB54_312
.LBB54_263:
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
	cbnz	w9, .LBB54_265
// %bb.264:
	bl	__put_page
.LBB54_265:
	ldr	x0, [sp, #112]          // 8-byte Folded Reload
	ldr	x1, [sp, #64]           // 8-byte Folded Reload
	b	.LBB54_253
.LBB54_266:
	//APP
	dmb ishld
	//NO_APP
	mov	w28, wzr
	b	.LBB54_254
.LBB54_267:
	//APP
	mrs x19, sp_el0
	//NO_APP
	ldr	w8, [x19, #80]
	mov	w1, wzr
	mov	w2, #4096
	add	w8, w8, #1              // =1
	str	w8, [x19, #80]
	//APP
	//NO_APP
	ldr	w8, [x19, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x19, #2984]
	lsl	x8, x23, #6
	orr	x0, x8, #0xffffffc000000000
	//APP
	//NO_APP
	bl	memset
	//APP
	//NO_APP
	ldr	w8, [x19, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x19, #2984]
	//APP
	//NO_APP
	ldr	w8, [x19, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x19, #80]
	b.ne	.LBB54_269
// %bb.268:
	ldr	x8, [x19]
	tbnz	w8, #1, .LBB54_302
.LBB54_269:
	mov	x0, x23
	bl	flush_dcache_page
	//APP
	dmb ishst
	//NO_APP
	mov	w28, wzr
	//APP
	// atomic64_or
	prfm	pstl1strm, [x23]
1:	ldxr	x8, [x23]
	orr	x8, x8, 4
	stxr	w9, x8, [x23]
	cbnz	w9, 1b
	//NO_APP
	b	.LBB54_254
.LBB54_270:
	mov	w28, #-117
	b	.LBB54_233
.LBB54_271:
	mov	w28, w0
	b	.LBB54_233
.LBB54_272:
	//APP
	mrs x19, sp_el0
	//NO_APP
	ldr	w8, [x19, #80]
	cmp	w20, #4095              // =4095
	add	w8, w8, #1              // =1
	str	w8, [x19, #80]
	//APP
	//NO_APP
	ldr	w8, [x19, #2984]
	add	w8, w8, #1              // =1
	str	w8, [x19, #2984]
	//APP
	//NO_APP
	b.hi	.LBB54_274
// %bb.273:
	ldr	x10, [sp, #8]           // 8-byte Folded Reload
	lsl	x8, x23, #6
	orr	x8, x8, #0xffffffc000000000
	mov	w9, #4096
	sub	w2, w9, w20
	mov	w1, wzr
	add	x0, x8, x10
	bl	memset
.LBB54_274:
	//APP
	//NO_APP
	ldr	w8, [x19, #2984]
	sub	w8, w8, #1              // =1
	str	w8, [x19, #2984]
	//APP
	//NO_APP
	ldr	w8, [x19, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x19, #80]
	b.ne	.LBB54_276
// %bb.275:
	ldr	x8, [x19]
	tbnz	w8, #1, .LBB54_303
.LBB54_276:
	mov	x0, x23
	bl	flush_dcache_page
	mov	w28, wzr
	b	.LBB54_254
.LBB54_277:
	adrp	x1, .L.str.14
	add	x0, sp, #160            // =160
	add	x1, x1, :lo12:.L.str.14
	add	x26, sp, #160           // =160
	bl	strcpy
	b	.LBB54_4
.LBB54_278:
	adrp	x1, .L.str.14
	add	x0, sp, #160            // =160
	add	x1, x1, :lo12:.L.str.14
	add	x26, sp, #160           // =160
	bl	strcpy
	b	.LBB54_3
.LBB54_279:
	bl	preempt_schedule_notrace
	ldr	x8, [x22, #80]
	tbz	w8, #8, .LBB54_20
.LBB54_280:
	ldr	w26, [x22, #1192]
	ldr	w25, [x22, #1188]
	ldrsw	x23, [x22, #1284]
	ldr	w19, [x22, #1184]
	ldrsw	x27, [x22, #1272]
	ldrsw	x28, [x22, #1296]
	ldr	x8, [x22, #80]
	tbnz	w8, #3, .LBB54_20
// %bb.281:
	ldr	x11, [x22, #136]
	ldr	x8, [x11, #8]
	ldr	w9, [x11, #100]
	ldr	w8, [x8, #8]
	cmn	w9, #1                  // =1
	b.eq	.LBB54_283
// %bb.282:
	udiv	w10, w9, w26
	b	.LBB54_284
.LBB54_283:
	mov	w10, #-1
.LBB54_284:
	cmp	w8, w10
	b.ne	.LBB54_289
// %bb.285:
	ldr	w12, [x22, #1284]
	mov	w15, #48
	ldr	w13, [x22, #1272]
	ldr	w16, [x22, #1272]
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
	b.lo	.LBB54_289
// %bb.286:
	ldr	w13, [x10, #580]
	mov	w14, #48
	madd	x13, x13, x14, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w25, w13
	cmp	w13, w12
	b.lo	.LBB54_289
// %bb.287:
	ldr	w13, [x10, #700]
	mov	w14, #48
	str	w16, [sp, #88]          // 4-byte Folded Spill
	madd	x13, x13, x14, x11
	ldrh	w13, [x13, #2]
	and	w13, w13, #0x3ff
	sub	w13, w25, w13
	cmp	w13, w12
	b.lo	.LBB54_289
// %bb.288:
	ldr	w12, [x10, #100]
	mov	w13, #48
	madd	x11, x12, x13, x11
	ldr	w12, [sp, #88]          // 4-byte Folded Reload
	ldrh	w11, [x11, #2]
	and	w11, w11, #0x3ff
	sub	w11, w25, w11
	cmp	w11, w12
	b.hs	.LBB54_294
.LBB54_289:
	mul	w10, w25, w26
	cmn	w9, #1                  // =1
	sub	x10, x10, #1            // =1
	add	x12, x10, x27
	add	x11, x10, x23
	asr	x12, x12, x19
	add	x10, x10, x28
	asr	x11, x11, x19
	udiv	w12, w12, w26
	asr	x10, x10, x19
	udiv	w11, w11, w26
	udiv	w10, w10, w26
	add	w11, w11, w12, lsl #1
	add	w10, w11, w10
	b.eq	.LBB54_291
// %bb.290:
	ldr	w11, [x22, #1192]
	udiv	w9, w9, w11
.LBB54_291:
	add	w9, w10, w9
	cmp	w8, w9
	b.hi	.LBB54_20
// %bb.292:
	mov	w28, #-28
	b	.LBB54_252
.LBB54_293:
	bl	preempt_schedule_notrace
	b	.LBB54_11
.LBB54_294:
	ldr	w8, [x22, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB54_20
// %bb.295:
	ldr	x8, [x22, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB54_20
// %bb.296:
	ldr	w1, [x10, #820]
	mov	x0, x22
	str	x1, [sp, #80]           // 8-byte Folded Spill
                                        // kill: def $w1 killed $w1 killed $x1
	bl	f2fs_usable_blks_in_seg
	ldr	x9, [x22, #136]
	mov	w10, #48
	ldr	x11, [sp, #80]          // 8-byte Folded Reload
	ldr	x8, [x9]
	ldr	x8, [x8, #136]
	madd	x8, x11, x10, x8
	ldr	w10, [sp, #88]          // 4-byte Folded Reload
	ldrh	w8, [x8, #2]
	and	w8, w8, #0x3ff
	sub	w8, w0, w8
	cmp	w8, w10
	b.hs	.LBB54_20
// %bb.297:
	ldr	x8, [x9, #8]
	ldr	w9, [x9, #100]
	ldr	w8, [x8, #8]
	b	.LBB54_289
.LBB54_298:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB54_242
.LBB54_299:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB54_245
.LBB54_300:
	mov	x0, x23
	bl	__page_file_mapping
	b	.LBB54_248
.LBB54_301:
	bl	__stack_chk_fail
.LBB54_302:
	bl	preempt_schedule
	b	.LBB54_269
.LBB54_303:
	bl	preempt_schedule
	b	.LBB54_276
.LBB54_304:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB54_305:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB54_306:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB54_307:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB54_308:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB54_309:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB54_310:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB54_311:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB54_312:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end54:
	.size	f2fs_write_begin, .Lfunc_end54-f2fs_write_begin
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_write_end
	.type	f2fs_write_end,@function
f2fs_write_end:                         // @f2fs_write_end
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	adrp	x8, __tracepoint_android_fs_datawrite_end
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	add	x8, x8, :lo12:__tracepoint_android_fs_datawrite_end
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	adrp	x26, cpu_number
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	adrp	x25, __cpu_online_mask
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	x23, x6
	ldr	x9, [x5, #24]
	mov	x21, x5
	mov	w19, w4
	mov	w24, w3
	mov	x22, x2
	add	x26, x26, :lo12:cpu_number
	add	x25, x25, :lo12:__cpu_online_mask
	mov	x29, sp
	ldr	x20, [x9]
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB55_7
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
	ldr	w9, [x9, x26]
	add	w10, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w10, w10, w9, lt
	asr	w10, w10, #6
	ldr	x10, [x25, w10, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB55_7
// %bb.2:
	//APP
	mrs x27, sp_el0
	//NO_APP
	ldr	w9, [x27, #80]
	add	w9, w9, #1              // =1
	str	w9, [x27, #80]
	//APP
	//NO_APP
	ldr	x28, [x8, #32]
	cbz	x28, .LBB55_5
// %bb.3:
	ldr	x8, [x28], #24
.LBB55_4:                               // =>This Inner Loop Header: Depth=1
	ldur	x0, [x28, #-16]
	mov	x1, x20
	mov	x2, x22
	mov	w3, w24
	blr	x8
	ldr	x8, [x28], #24
	cbnz	x8, .LBB55_4
.LBB55_5:
	//APP
	//NO_APP
	ldr	w8, [x27, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x27, #80]
	b.ne	.LBB55_7
// %bb.6:
	ldr	x8, [x27]
	tbnz	w8, #1, .LBB55_66
.LBB55_7:
	adrp	x8, __tracepoint_f2fs_write_end
	add	x8, x8, :lo12:__tracepoint_f2fs_write_end
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB55_14
// %bb.8:
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
	ldr	w9, [x9, x26]
	add	w10, w9, #63            // =63
	cmp	w9, #0                  // =0
	csel	w10, w10, w9, lt
	asr	w10, w10, #6
	ldr	x10, [x25, w10, sxtw #3]
	lsr	x9, x10, x9
	tbz	w9, #0, .LBB55_14
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
	cbz	x26, .LBB55_12
// %bb.10:
	ldr	x8, [x26], #24
.LBB55_11:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x26, #-16]
	mov	x1, x20
	mov	x2, x22
	mov	w3, w24
	mov	w4, w19
	blr	x8
	ldr	x8, [x26], #24
	cbnz	x8, .LBB55_11
.LBB55_12:
	//APP
	//NO_APP
	ldr	w8, [x25, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x25, #80]
	b.ne	.LBB55_14
// %bb.13:
	ldr	x8, [x25]
	tbnz	w8, #1, .LBB55_67
.LBB55_14:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #2, .LBB55_17
// %bb.15:
	cmp	w19, w24
	b.ne	.LBB55_65
// %bb.16:
	//APP
	dmb ishst
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x21]
1:	ldxr	x8, [x21]
	orr	x8, x8, 4
	stxr	w9, x8, [x21]
	cbnz	w9, 1b
	//NO_APP
	b	.LBB55_18
.LBB55_17:
	//APP
	dmb ishld
	//NO_APP
.LBB55_18:
	ldr	x8, [x20, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB55_23
// %bb.19:
	ldr	w8, [x20, #1256]
	cbnz	w8, .LBB55_22
// %bb.20:
	ldr	x8, [x20, #712]
	tbnz	x8, #35, .LBB55_22
// %bb.21:
	ldr	x8, [x20, #712]
	ubfx	x8, x8, #34, #1
	cbnz	x23, .LBB55_25
	b	.LBB55_31
.LBB55_22:
	mov	w8, #1
	cbnz	x23, .LBB55_25
	b	.LBB55_31
.LBB55_23:
	ldrh	w8, [x20]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB55_31
// %bb.24:
	ldr	x8, [x20, #712]
	ubfx	x8, x8, #31, #1
	cbz	x23, .LBB55_31
.LBB55_25:
	cbz	w8, .LBB55_31
// %bb.26:
	ldr	x2, [x21, #32]
	mov	x0, x20
	mov	x1, x23
	mov	w3, w19
	bl	f2fs_compress_write_end
	ldr	x8, [x20, #40]
	adrp	x9, jiffies
	ldr	x8, [x8, #1104]
	ldr	x9, [x9, :lo12:jiffies]
	stp	x9, x9, [x8, #504]
	str	x9, [x8, #520]
	add	x8, x22, w19, uxtw
	ldr	x9, [x20, #80]
	cmp	x8, x9
	b.le	.LBB55_64
// %bb.27:
	ldr	x9, [x20, #712]
	tbnz	w9, #30, .LBB55_64
// %bb.28:
	ldr	x22, [x20, #712]
	mov	x0, x20
	ldr	x21, [x20, #712]
	mov	w1, #1
	str	x8, [x20, #80]
	bl	f2fs_mark_inode_dirty_sync
	tbz	w22, #1, .LBB55_30
// %bb.29:
	tbz	w21, #2, .LBB55_64
.LBB55_30:
	add	x8, x20, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB55_64
.LBB55_31:
	cbz	w19, .LBB55_37
// %bb.32:
	mov	x0, x21
	bl	set_page_dirty
	ldr	x9, [x20, #80]
	add	x8, x22, w19, uxtw
	cmp	x8, x9
	b.le	.LBB55_37
// %bb.33:
	ldr	x9, [x20, #712]
	tbnz	w9, #30, .LBB55_37
// %bb.34:
	ldr	x23, [x20, #712]
	mov	x0, x20
	ldr	x22, [x20, #712]
	mov	w1, #1
	str	x8, [x20, #80]
	bl	f2fs_mark_inode_dirty_sync
	tbz	w23, #1, .LBB55_36
// %bb.35:
	tbz	w22, #2, .LBB55_37
.LBB55_36:
	add	x8, x20, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB55_37:
	cbz	x21, .LBB55_63
// %bb.38:
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
	b.ne	.LBB55_55
// %bb.39:
	tbnz	w8, #0, .LBB55_53
// %bb.40:
	bl	print_bdev_access_info
	adrp	x22, f2fs_dclient
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB55_43
// %bb.41:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB55_43
// %bb.42:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB55_43:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB55_45
// %bb.44:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB55_68
.LBB55_45:
	ldr	x0, [x21, #24]
.LBB55_46:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB55_48
// %bb.47:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB55_69
.LBB55_48:
	ldr	x0, [x21, #24]
.LBB55_49:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB55_51
// %bb.50:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB55_70
.LBB55_51:
	ldr	x0, [x21, #24]
.LBB55_52:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB55_53:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB55_61
// %bb.54:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB55_55:
	tbnz	w8, #0, .LBB55_60
// %bb.56:
	bl	print_bdev_access_info
	adrp	x22, f2fs_dclient
	ldr	x0, [x22, :lo12:f2fs_dclient]
	cbz	x0, .LBB55_59
// %bb.57:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB55_59
// %bb.58:
	ldr	x0, [x22, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x22, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB55_59:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB55_60:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB55_71
.LBB55_61:
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
	cbnz	w9, .LBB55_63
// %bb.62:
	bl	__put_page
.LBB55_63:
	ldr	x8, [x20, #40]
	adrp	x9, jiffies
	ldr	x8, [x8, #1104]
	ldr	x9, [x9, :lo12:jiffies]
	stp	x9, x9, [x8, #504]
	str	x9, [x8, #520]
.LBB55_64:
	mov	w0, w19
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.LBB55_65:
	mov	w19, wzr
	b	.LBB55_18
.LBB55_66:
	bl	preempt_schedule_notrace
	b	.LBB55_7
.LBB55_67:
	bl	preempt_schedule_notrace
	b	.LBB55_14
.LBB55_68:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB55_46
.LBB55_69:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB55_49
.LBB55_70:
	mov	x0, x21
	bl	__page_file_mapping
	b	.LBB55_52
.LBB55_71:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end55:
	.size	f2fs_write_end, .Lfunc_end55-f2fs_write_end
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_bmap
	.type	f2fs_bmap,@function
f2fs_bmap:                              // @f2fs_bmap
// %bb.0:
	sub	sp, sp, #128            // =128
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	stp	x24, x23, [sp, #80]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #96]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x20, x19, [sp, #112]    // 16-byte Folded Spill
	stur	x8, [x29, #-8]
	ldr	x21, [x0]
	ldr	x8, [x21, #712]
	tbnz	w8, #10, .LBB56_8
// %bb.1:
	mov	x22, x1
	mov	w1, wzr
	mov	x19, x0
	bl	mapping_tagged
	cbz	w0, .LBB56_3
// %bb.2:
	mov	x0, x19
	bl	filemap_write_and_wait
.LBB56_3:
	mov	x0, x21
	bl	max_file_blocks
	cmp	x0, x22
	b.ls	.LBB56_8
// %bb.4:
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	w8, [x8, #1532]
	cbz	w8, .LBB56_9
// %bb.5:
	ldr	w8, [x21, #1256]
	cbnz	w8, .LBB56_12
// %bb.6:
	ldr	x8, [x21, #712]
	tbnz	x8, #35, .LBB56_12
// %bb.7:
	ldr	x8, [x21, #712]
	tbz	x8, #34, .LBB56_11
	b	.LBB56_12
.LBB56_8:
	mov	x20, xzr
	b	.LBB56_54
.LBB56_9:
	ldrh	w8, [x21]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB56_11
// %bb.10:
	ldr	x8, [x21, #712]
	tbnz	w8, #31, .LBB56_12
.LBB56_11:
	mov	w2, #40
	add	x0, sp, #8              // =8
	mov	w1, wzr
	bl	memset
	mov	w8, #1
	mov	w9, #11
	add	x1, sp, #8              // =8
	mov	x0, x21
	mov	w2, wzr
	mov	w3, #2
	str	xzr, [sp, #24]
	stp	w22, w8, [sp, #12]
	str	w9, [sp, #40]
	bl	f2fs_map_blocks
	ldr	w8, [sp, #8]
	cmp	w0, #0                  // =0
	csel	w20, w8, wzr, eq
	b	.LBB56_54
.LBB56_12:
	ldr	w8, [x21, #1268]
	add	x0, sp, #8              // =8
	mov	w1, wzr
	mov	w2, #48
	add	x24, sp, #8             // =8
	sub	w8, w8, #1              // =1
	bic	x23, x22, x8
	bl	memset
	add	x0, sp, #8              // =8
	mov	x1, x23
	mov	w2, #1
	stp	x21, xzr, [sp, #8]
	str	xzr, [sp, #24]
	str	wzr, [sp, #32]
	bl	f2fs_get_dnode_of_data
	mov	x20, xzr
	cbnz	w0, .LBB56_54
// %bb.13:
	ldr	w8, [sp, #44]
	cmn	w8, #2                  // =2
	b.ne	.LBB56_15
// %bb.14:
	ldr	x19, [sp, #24]
	b	.LBB56_22
.LBB56_15:
	ldr	x19, [sp, #24]
	sub	w12, w22, w23
	ldr	w9, [sp, #36]
	lsl	x8, x19, #6
	orr	x8, x8, #0xffffffc000000000
	add	w9, w9, w12
	ldr	w10, [x8, #4072]
	ldr	w11, [x8, #4076]
	str	w9, [sp, #36]
	cmp	w10, w11
	b.ne	.LBB56_20
// %bb.16:
	ldr	x12, [sp, #8]
	cbz	x12, .LBB56_19
// %bb.17:
	ldr	x13, [x12, #712]
	tbz	w13, #26, .LBB56_20
// %bb.18:
	ldr	w12, [x12, #1160]
	asr	w12, w12, #2
	b	.LBB56_21
.LBB56_19:
	ldrb	w12, [x8, #3]
	tbnz	w12, #5, .LBB56_64
.LBB56_20:
	mov	w12, wzr
.LBB56_21:
	add	x13, x8, #360           // =360
	cmp	w10, w11
	csel	x8, x13, x8, eq
	add	w9, w12, w9
	ldr	w20, [x8, w9, uxtw #2]
	add	w8, w20, #3             // =3
	cmp	w8, #4                  // =4
	b.hs	.LBB56_56
.LBB56_22:
	mov	x20, xzr
.LBB56_23:
	cbz	x19, .LBB56_49
// %bb.24:
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
	b.ne	.LBB56_41
// %bb.25:
	tbnz	w8, #0, .LBB56_39
// %bb.26:
	bl	print_bdev_access_info
	adrp	x21, f2fs_dclient
	ldr	x0, [x21, :lo12:f2fs_dclient]
	cbz	x0, .LBB56_29
// %bb.27:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB56_29
// %bb.28:
	ldr	x0, [x21, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3734
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB56_29:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB56_31
// %bb.30:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB56_65
.LBB56_31:
	ldr	x0, [x19, #24]
.LBB56_32:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB56_34
// %bb.33:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB56_66
.LBB56_34:
	ldr	x0, [x19, #24]
.LBB56_35:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB56_37
// %bb.36:
	ldr	x8, [x19]
	tbnz	w8, #10, .LBB56_67
.LBB56_37:
	ldr	x0, [x19, #24]
.LBB56_38:
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB56_39:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB56_47
// %bb.40:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB56_41:
	tbnz	w8, #0, .LBB56_46
// %bb.42:
	bl	print_bdev_access_info
	adrp	x21, f2fs_dclient
	ldr	x0, [x21, :lo12:f2fs_dclient]
	cbz	x0, .LBB56_45
// %bb.43:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB56_45
// %bb.44:
	ldr	x0, [x21, :lo12:f2fs_dclient]
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	mov	w3, #3736
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	bl	dsm_client_record
	ldr	x0, [x21, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB56_45:
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB56_46:
	ldr	x8, [x19, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x19, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB56_69
.LBB56_47:
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
	cbnz	w9, .LBB56_49
// %bb.48:
	bl	__put_page
.LBB56_49:
	ldr	x8, [sp, #16]
	add	x19, x24, #8            // =8
	cbz	x8, .LBB56_53
// %bb.50:
	ldr	x9, [sp, #24]
	cmp	x9, x8
	b.eq	.LBB56_53
// %bb.51:
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
	cbnz	w9, .LBB56_53
// %bb.52:
	bl	__put_page
.LBB56_53:
	stp	xzr, xzr, [x19]
.LBB56_54:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB56_68
// %bb.55:
	mov	x0, x20
	ldp	x20, x19, [sp, #112]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #128            // =128
	ret
.LBB56_56:
	ldr	x8, [x21, #40]
	ldr	x11, [x8, #1104]
	ldr	w9, [x11, #3024]
	cbz	w9, .LBB56_23
// %bb.57:
	ldr	x8, [x11]
	cmp	w9, #1                  // =1
	ldr	x8, [x8, #248]
	b.lt	.LBB56_63
// %bb.58:
	ldr	x11, [x11, #3032]
	mov	x10, xzr
	add	x11, x11, #80           // =80
	b	.LBB56_60
.LBB56_59:                              //   in Loop: Header=BB56_60 Depth=1
	add	x10, x10, #1            // =1
	add	x11, x11, #192          // =192
	cmp	x10, x9
	b.eq	.LBB56_63
.LBB56_60:                              // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	cmp	w12, w20
	b.hi	.LBB56_59
// %bb.61:                              //   in Loop: Header=BB56_60 Depth=1
	ldr	w12, [x11]
	cmp	w12, w20
	b.lo	.LBB56_59
// %bb.62:
	ldur	x8, [x11, #-80]
.LBB56_63:
	cbnz	x8, .LBB56_23
	b	.LBB56_22
.LBB56_64:
	ldrh	w12, [x8, #360]
	lsr	w12, w12, #2
	b	.LBB56_21
.LBB56_65:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB56_32
.LBB56_66:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB56_35
.LBB56_67:
	mov	x0, x19
	bl	__page_file_mapping
	b	.LBB56_38
.LBB56_68:
	bl	__stack_chk_fail
.LBB56_69:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end56:
	.size	f2fs_bmap, .Lfunc_end56-f2fs_bmap
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_direct_IO
	.type	f2fs_direct_IO,@function
f2fs_direct_IO:                         // @f2fs_direct_IO
// %bb.0:
	sub	sp, sp, #448            // =448
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #352]    // 16-byte Folded Spill
	add	x29, sp, #352           // =352
	stp	x28, x27, [sp, #368]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #384]    // 16-byte Folded Spill
	mov	x25, x0
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	stp	x24, x23, [sp, #400]    // 16-byte Folded Spill
	//APP
	mrs x23, sp_el0
	//NO_APP
	stp	x22, x21, [sp, #416]    // 16-byte Folded Spill
	mov	x24, x1
	stp	x20, x19, [sp, #432]    // 16-byte Folded Spill
	stur	x8, [x29, #-16]
	ldp	x8, x19, [x0]
	ldr	x20, [x1, #16]
	ldr	w28, [x1]
	ldr	x27, [x8, #240]
	mov	w8, #50
	str	w8, [sp, #72]
	ldr	x21, [x27]
	ldrh	w8, [x0, #36]
	mov	x0, x1
	ldr	x9, [x21, #40]
	str	w8, [sp, #64]           // 4-byte Folded Spill
	ldr	w8, [x23, #344]
	ldr	x26, [x9, #1104]
	str	w8, [sp, #60]           // 4-byte Folded Spill
	ldr	w8, [x26, #1484]
	str	w8, [sp, #68]           // 4-byte Folded Spill
	ldrb	w22, [x21, #142]
	bl	iov_iter_alignment
	ldr	x10, [x21, #40]
	mov	x12, x19
	ldr	w19, [x24]
	ldr	x9, [x10, #248]
	tbnz	w19, #0, .LBB57_2
// %bb.1:
	ldr	x8, [x21, #80]
	cmp	x8, x12
	b.le	.LBB57_12
.LBB57_2:
	str	x23, [sp, #48]          // 8-byte Folded Spill
	mov	w23, #-1
	lsl	w8, w23, w22
	mvn	w11, w8
	orr	x8, x0, x12
	mov	w11, w11
	tst	x8, x11
	b.eq	.LBB57_10
// %bb.3:
	cbz	x9, .LBB57_8
// %bb.4:
	ldr	x9, [x9, #128]
	ldr	x10, [x9, #1280]
	mov	w9, #512
	cbz	x10, .LBB57_6
// %bb.5:
	ldr	w10, [x10, #1688]
	cmp	w10, #0                 // =0
	csel	w9, w9, w10, eq
.LBB57_6:
	mov	w22, #8
.LBB57_7:                               // =>This Inner Loop Header: Depth=1
	lsr	w10, w9, #1
	cmp	w9, #513                // =513
	add	w22, w22, #1            // =1
	mov	w9, w10
	b.hi	.LBB57_7
.LBB57_8:
	lsl	w9, w23, w22
	mvn	w9, w9
	tst	x8, x9
	b.eq	.LBB57_12
// %bb.9:
	mov	x0, #-22
	b	.LBB57_13
.LBB57_10:
	ldr	x22, [x10, #1104]
	mov	x0, x25
	mov	x1, x24
	str	x12, [sp, #40]          // 8-byte Folded Spill
	bl	fscrypt_dio_supported
	tbz	w0, #0, .LBB57_12
// %bb.11:
	ldr	x8, [x21, #640]
	cbz	x8, .LBB57_15
.LBB57_12:
	mov	x0, xzr
.LBB57_13:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB57_157
// %bb.14:
	ldp	x20, x19, [sp, #432]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #416]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #400]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #384]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #368]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #352]    // 16-byte Folded Reload
	add	sp, sp, #448            // =448
	ret
.LBB57_15:
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	w9, [x8, #1532]
	cbz	w9, .LBB57_19
// %bb.16:
	ldr	w9, [x21, #1256]
	cbnz	w9, .LBB57_12
// %bb.17:
	ldr	x9, [x21, #712]
	tbnz	x9, #35, .LBB57_12
// %bb.18:
	ldr	x9, [x21, #712]
	tbnz	x9, #34, .LBB57_12
	b	.LBB57_21
.LBB57_19:
	ldrh	w9, [x21]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB57_21
// %bb.20:
	ldr	x9, [x21, #712]
	tbnz	w9, #31, .LBB57_12
.LBB57_21:
	ldr	x9, [x22, #16]
	ldrb	w9, [x9, #2180]
	tbnz	w9, #1, .LBB57_12
// %bb.22:
	tbz	w19, #0, .LBB57_27
// %bb.23:
	ldr	w9, [x22, #1504]
	cmp	w9, #1                  // =1
	b.ne	.LBB57_27
// %bb.24:
	ldrb	w8, [x21, #142]
	mov	x0, x24
	ldr	w19, [x25, #8]
	lsl	w8, w23, w8
	str	w8, [sp, #32]           // 4-byte Folded Spill
	bl	iov_iter_alignment
	ldr	w9, [sp, #32]           // 4-byte Folded Reload
	orr	w8, w0, w19
	bics	wzr, w8, w9
	b.ne	.LBB57_12
// %bb.25:
	ldr	w8, [x22, #1432]
	mov	w9, #1
	lsl	w8, w9, w8
	cmp	w8, #1                  // =1
	b.gt	.LBB57_12
// %bb.26:
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
.LBB57_27:
	ldr	x9, [x8, #80]
	tbnz	w9, #8, .LBB57_12
// %bb.28:
	ldr	w8, [x8, #1504]
	mov	w19, wzr
	and	x9, x28, #0x1
	cmp	w8, #1                  // =1
	str	x9, [sp, #24]           // 8-byte Folded Spill
	b.ne	.LBB57_31
// %bb.29:
	ldr	w8, [x24]
	mov	x28, x20
	tbz	w8, #0, .LBB57_32
// %bb.30:
	ldrb	w8, [x21, #142]
	mov	x0, x24
	ldr	w19, [x25, #8]
	lsl	w22, w23, w8
	bl	iov_iter_alignment
	orr	w8, w0, w19
	bics	wzr, w8, w22
	cset	w19, eq
	b	.LBB57_32
.LBB57_31:
	mov	x28, x20
.LBB57_32:
	adrp	x8, __tracepoint_f2fs_direct_IO_enter
	add	x8, x8, :lo12:__tracepoint_f2fs_direct_IO_enter
	ldr	w9, [x8, #8]
	ldr	x22, [sp, #48]          // 8-byte Folded Reload
	cmp	w9, #1                  // =1
	b.lt	.LBB57_39
// %bb.33:
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
	tbz	w9, #0, .LBB57_39
// %bb.34:
	str	w19, [sp, #16]          // 4-byte Folded Spill
	ldr	w9, [x22, #80]
	add	w9, w9, #1              // =1
	str	w9, [x22, #80]
	//APP
	//NO_APP
	ldr	x19, [x8, #32]
	ldr	x20, [sp, #40]          // 8-byte Folded Reload
	ldr	x23, [sp, #24]          // 8-byte Folded Reload
	cbz	x19, .LBB57_37
// %bb.35:
	ldr	x8, [x19], #24
.LBB57_36:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x19, #-16]
	mov	x1, x21
	mov	x2, x20
	mov	x3, x28
	mov	w4, w23
	blr	x8
	ldr	x8, [x19], #24
	cbnz	x8, .LBB57_36
.LBB57_37:
	//APP
	//NO_APP
	ldr	w8, [x22, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x22, #80]
	ldr	w19, [sp, #16]          // 4-byte Folded Reload
	b.ne	.LBB57_39
// %bb.38:
	ldr	x8, [x22]
	tbnz	w8, #1, .LBB57_162
.LBB57_39:
	adrp	x20, __tracepoint_android_fs_dataread_start
	add	x20, x20, :lo12:__tracepoint_android_fs_dataread_start
	ldr	w8, [x20, #8]
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	cbnz	w9, .LBB57_52
// %bb.40:
	cmp	w8, #1                  // =1
	b.lt	.LBB57_52
// %bb.41:
	mov	x0, x21
	bl	ihold
	mov	x0, x21
	bl	d_obtain_alias
	cmn	x0, #1, lsl #12         // =4096
	b.hi	.LBB57_158
// %bb.42:
	add	x1, sp, #80             // =80
	mov	w2, #256
	mov	x20, x0
	bl	dentry_path_raw
	mov	x23, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB57_159
.LBB57_43:
	mov	x0, x20
	bl	dput
.LBB57_44:
	adrp	x20, __tracepoint_android_fs_dataread_start
	ldr	w22, [x22, #1784]
	add	x20, x20, :lo12:__tracepoint_android_fs_dataread_start
	ldr	w8, [x20, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB57_51
// %bb.45:
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
	tbz	w8, #0, .LBB57_51
// %bb.46:
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	str	w19, [sp, #16]          // 4-byte Folded Spill
	ldr	w8, [x9, #80]
	add	w8, w8, #1              // =1
	str	w8, [x9, #80]
	//APP
	//NO_APP
	ldr	x19, [x20, #32]
	ldr	x20, [sp, #40]          // 8-byte Folded Reload
	cbz	x19, .LBB57_49
// %bb.47:
	ldr	x8, [x19], #24
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	add	x9, x9, #2232           // =2232
	str	x9, [sp, #32]           // 8-byte Folded Spill
.LBB57_48:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x19, #-16]
	mov	x1, x21
	ldr	x6, [sp, #32]           // 8-byte Folded Reload
	mov	x2, x20
	mov	w3, w28
	mov	w4, w22
	mov	x5, x23
	blr	x8
	ldr	x8, [x19], #24
	cbnz	x8, .LBB57_48
.LBB57_49:
	//APP
	//NO_APP
	adrp	x20, __tracepoint_android_fs_dataread_start
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	add	x20, x20, :lo12:__tracepoint_android_fs_dataread_start
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	ldr	w19, [sp, #16]          // 4-byte Folded Reload
	b.ne	.LBB57_51
// %bb.50:
	ldr	x8, [sp, #48]           // 8-byte Folded Reload
	ldr	x8, [x8]
	tbnz	w8, #1, .LBB57_164
.LBB57_51:
	adrp	x8, __tracepoint_android_fs_datawrite_start
	add	x8, x8, :lo12:__tracepoint_android_fs_datawrite_start
	ldr	wzr, [x8, #8]
	ldr	x22, [sp, #24]          // 8-byte Folded Reload
	b	.LBB57_65
.LBB57_52:
	adrp	x8, __tracepoint_android_fs_datawrite_start
	add	x8, x8, :lo12:__tracepoint_android_fs_datawrite_start
	ldr	w8, [x8, #8]
	ldr	x22, [sp, #24]          // 8-byte Folded Reload
	cbz	w22, .LBB57_65
// %bb.53:
	cmp	w8, #1                  // =1
	b.lt	.LBB57_65
// %bb.54:
	mov	x0, x21
	bl	ihold
	mov	x0, x21
	bl	d_obtain_alias
	cmn	x0, #1, lsl #12         // =4096
	str	x28, [sp, #8]           // 8-byte Folded Spill
	b.hi	.LBB57_160
// %bb.55:
	add	x1, sp, #80             // =80
	mov	w2, #256
	mov	x23, x0
	bl	dentry_path_raw
	cmn	x0, #4095               // =4095
	str	x0, [sp]                // 8-byte Folded Spill
	b.hs	.LBB57_161
.LBB57_56:
	mov	x0, x23
	bl	dput
.LBB57_57:
	ldr	x8, [sp, #48]           // 8-byte Folded Reload
	adrp	x11, __tracepoint_android_fs_datawrite_start
	add	x11, x11, :lo12:__tracepoint_android_fs_datawrite_start
	ldr	w28, [x8, #1784]
	ldr	w8, [x11, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB57_64
// %bb.58:
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
	tbz	w8, #0, .LBB57_64
// %bb.59:
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	str	w19, [sp, #16]          // 4-byte Folded Spill
	ldr	w8, [x9, #80]
	add	w8, w8, #1              // =1
	str	w8, [x9, #80]
	//APP
	//NO_APP
	ldr	x19, [x11, #32]
	ldr	x22, [sp, #40]          // 8-byte Folded Reload
	ldp	x23, x20, [sp]          // 16-byte Folded Reload
	cbz	x19, .LBB57_62
// %bb.60:
	ldr	x8, [x19], #24
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	add	x9, x9, #2232           // =2232
	str	x9, [sp, #32]           // 8-byte Folded Spill
.LBB57_61:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x19, #-16]
	mov	x1, x21
	ldr	x6, [sp, #32]           // 8-byte Folded Reload
	mov	x2, x22
	mov	w3, w20
	mov	w4, w28
	mov	x5, x23
	blr	x8
	ldr	x8, [x19], #24
	cbnz	x8, .LBB57_61
.LBB57_62:
	//APP
	//NO_APP
	adrp	x20, __tracepoint_android_fs_dataread_start
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	add	x20, x20, :lo12:__tracepoint_android_fs_dataread_start
	ldr	w8, [x9, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x9, #80]
	ldr	x22, [sp, #24]          // 8-byte Folded Reload
	ldr	w19, [sp, #16]          // 4-byte Folded Reload
	b.ne	.LBB57_64
// %bb.63:
	ldr	x8, [sp, #48]           // 8-byte Folded Reload
	ldr	x8, [x8]
	tbnz	w8, #1, .LBB57_166
.LBB57_64:
	ldr	x28, [sp, #8]           // 8-byte Folded Reload
.LBB57_65:
	ldr	x8, [x21, #40]
	ldr	x8, [x8, #1104]
	ldr	w9, [x8, #3024]
	cmp	w9, #2                  // =2
	b.ne	.LBB57_75
// %bb.66:
	ldr	x8, [x8, #16]
	ldr	x23, [sp, #48]          // 8-byte Folded Reload
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB57_76
// %bb.67:
	ldr	x8, [x24, #16]
	str	x8, [sp, #16]           // 8-byte Folded Spill
	bl	__rcu_read_lock
	bl	kthread_blkcg
	cbnz	x0, .LBB57_69
// %bb.68:
	ldr	x8, [x23, #2688]
	ldr	x0, [x8, #32]
.LBB57_69:
	cbz	x0, .LBB57_108
// %bb.70:
	adrp	x8, blkcg_root
	add	x8, x8, :lo12:blkcg_root
	cmp	x0, x8
	b.eq	.LBB57_108
// %bb.71:
	ldr	w22, [x0, #392]
	bl	__rcu_read_unlock
	cmp	w22, #1                 // =1
	b.hi	.LBB57_122
// %bb.72:
	ldp	x8, x22, [sp, #16]      // 16-byte Folded Reload
	str	wzr, [sp, #32]          // 4-byte Folded Spill
	cmp	x8, #1, lsl #12         // =4096
	b.ne	.LBB57_77
// %bb.73:
	ldr	w8, [x23, #1408]
	cbnz	w8, .LBB57_77
// %bb.74:
	add	x2, sp, #72             // =72
	mov	x0, x23
	mov	w1, #1
	mov	w8, #1
	str	w8, [sp, #32]           // 4-byte Folded Spill
	bl	sched_setscheduler_nocheck
	b	.LBB57_77
.LBB57_75:
	ldr	x23, [sp, #48]          // 8-byte Folded Reload
.LBB57_76:
	str	wzr, [sp, #32]          // 4-byte Folded Spill
.LBB57_77:
	cbz	w22, .LBB57_80
// %bb.78:
	ldr	w8, [sp, #68]           // 4-byte Folded Reload
	cbnz	w8, .LBB57_80
// %bb.79:
	strh	wzr, [x25, #36]
.LBB57_80:
	mov	w8, #48
	ldrb	w9, [x25, #32]
	add	x10, x21, #968          // =968
	mul	x8, x22, x8
	add	x8, x21, x8
	add	x0, x8, #968            // =968
	stp	x0, x10, [sp, #16]      // 16-byte Folded Spill
	tbnz	w9, #3, .LBB57_83
// %bb.81:
	bl	down_read
	cbz	w19, .LBB57_86
// %bb.82:
	ldr	x0, [sp, #24]           // 8-byte Folded Reload
	bl	down_read
	b	.LBB57_86
.LBB57_83:
	bl	down_read_trylock
	cbz	w0, .LBB57_119
// %bb.84:
	cbz	w19, .LBB57_86
// %bb.85:
	ldr	x0, [sp, #24]           // 8-byte Folded Reload
	bl	down_read_trylock
	cbz	w0, .LBB57_118
.LBB57_86:
	ldr	x8, [x21, #40]
	cbz	w22, .LBB57_97
.LBB57_87:
	adrp	x9, get_data_block_dio
	adrp	x10, get_data_block_dio_write
	add	x9, x9, :lo12:get_data_block_dio
	add	x10, x10, :lo12:get_data_block_dio_write
	ldr	x2, [x8, #248]
	cmp	w22, #0                 // =0
	adrp	x6, f2fs_dio_submit_bio
	csel	x4, x10, x9, ne
	orr	w7, w22, #0x2
	add	x6, x6, :lo12:f2fs_dio_submit_bio
	mov	x0, x25
	mov	x1, x21
	mov	x3, x24
	mov	x5, xzr
	bl	__blockdev_direct_IO
	mov	x20, x0
	cbz	w19, .LBB57_89
// %bb.88:
	ldr	x0, [sp, #24]           // 8-byte Folded Reload
	bl	up_read
.LBB57_89:
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	bl	up_read
	cbz	w22, .LBB57_101
// %bb.90:
	ldr	w8, [sp, #68]           // 4-byte Folded Reload
	cbnz	w8, .LBB57_92
// %bb.91:
	ldr	w8, [sp, #64]           // 4-byte Folded Reload
	strh	w8, [x25, #36]
.LBB57_92:
	mov	x26, x20
	cmp	w26, #1                 // =1
	b.lt	.LBB57_104
// %bb.93:
	ldr	x8, [x21, #40]
	adrp	x20, __tracepoint_android_fs_dataread_start
	ldr	w27, [sp, #32]          // 4-byte Folded Reload
	add	x20, x20, :lo12:__tracepoint_android_fs_dataread_start
	ldr	x25, [x8, #1104]
	ldrb	w8, [x25, #2600]
	cbz	w8, .LBB57_95
// %bb.94:
	add	x24, x25, #2240         // =2240
	mov	x0, x24
	bl	_raw_spin_lock
	ldr	x8, [x25, #2248]
	mov	x0, x24
	ldr	x9, [x25, #2264]
	add	x8, x8, w26, sxtw
	sub	x9, x9, x8
	str	x8, [x25, #2248]
	str	x9, [x25, #2256]
	bl	_raw_spin_unlock
	mov	x0, x25
	bl	f2fs_record_iostat
.LBB57_95:
	ldr	x23, [sp, #48]          // 8-byte Folded Reload
	cbnz	w19, .LBB57_125
// %bb.96:
	add	x8, x21, #712           // =712
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 8192
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	cbnz	w27, .LBB57_126
	b	.LBB57_128
.LBB57_97:
	ldr	x9, [x8, #1104]
	ldr	w9, [x9, #1532]
	cbz	w9, .LBB57_109
// %bb.98:
	ldr	w9, [x21, #1256]
	cbnz	w9, .LBB57_111
// %bb.99:
	ldr	x9, [x21, #712]
	tbnz	x9, #35, .LBB57_111
// %bb.100:
	ldr	x9, [x21, #712]
	tbz	x9, #34, .LBB57_87
	b	.LBB57_111
.LBB57_101:
	cmp	w20, #1                 // =1
	b.lt	.LBB57_114
// %bb.102:
	ldrb	w8, [x26, #2600]
	ldr	w27, [sp, #32]          // 4-byte Folded Reload
	cbz	w8, .LBB57_123
// %bb.103:
	add	x24, x26, #2240         // =2240
	mov	x0, x24
	bl	_raw_spin_lock
	ldr	x8, [x26, #2344]
	mov	x0, x24
	ldr	x9, [x26, #2360]
	add	x8, x8, w20, sxtw
	sub	x9, x9, x8
	str	x8, [x26, #2344]
	str	x9, [x26, #2352]
	bl	_raw_spin_unlock
	mov	x0, x26
	mov	x26, x20
	bl	f2fs_record_iostat
	b	.LBB57_124
.LBB57_104:
	adrp	x20, __tracepoint_android_fs_dataread_start
	cmn	w26, #529               // =529
	add	x20, x20, :lo12:__tracepoint_android_fs_dataread_start
	b.ne	.LBB57_120
// %bb.105:
	ldr	x8, [x21, #40]
	ldr	x23, [sp, #48]          // 8-byte Folded Reload
	ldr	x25, [x8, #1104]
	ldrb	w8, [x25, #2600]
	cbz	w8, .LBB57_107
// %bb.106:
	ldr	x8, [x24, #16]
	add	x24, x25, #2240         // =2240
	mov	x0, x24
	sub	x19, x28, x8
	bl	_raw_spin_lock
	ldr	x8, [x25, #2248]
	mov	x0, x24
	ldr	x9, [x25, #2264]
	add	x8, x8, x19
	sub	x9, x9, x8
	str	x8, [x25, #2248]
	str	x9, [x25, #2256]
	bl	_raw_spin_unlock
	mov	x0, x25
	bl	f2fs_record_iostat
.LBB57_107:
	ldr	w27, [sp, #32]          // 4-byte Folded Reload
	mov	w26, #-529
	cbnz	w27, .LBB57_126
	b	.LBB57_128
.LBB57_108:
	bl	__rcu_read_unlock
	b	.LBB57_76
.LBB57_109:
	ldrh	w9, [x21]
	and	w9, w9, #0xf000
	cmp	w9, #8, lsl #12         // =32768
	b.ne	.LBB57_87
// %bb.110:
	ldr	x9, [x21, #712]
	tbz	w9, #31, .LBB57_87
.LBB57_111:
	ldr	w8, [sp, #64]           // 4-byte Folded Reload
	ldr	w27, [sp, #32]          // 4-byte Folded Reload
	strh	w8, [x25, #36]
	cbz	w19, .LBB57_113
// %bb.112:
	ldr	x0, [sp, #24]           // 8-byte Folded Reload
	bl	up_read
.LBB57_113:
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	bl	up_read
	mov	w26, wzr
	cbnz	w27, .LBB57_126
	b	.LBB57_128
.LBB57_114:
	mov	x26, x20
	adrp	x20, __tracepoint_android_fs_dataread_start
	ldr	x23, [sp, #48]          // 8-byte Folded Reload
	add	x20, x20, :lo12:__tracepoint_android_fs_dataread_start
	ldr	w27, [sp, #32]          // 4-byte Folded Reload
	cmn	w26, #529               // =529
	b.ne	.LBB57_125
// %bb.115:
	ldr	x8, [x21, #40]
	ldr	x25, [x8, #1104]
	ldrb	w8, [x25, #2600]
	cbz	w8, .LBB57_117
// %bb.116:
	ldr	x8, [x24, #16]
	add	x24, x25, #2240         // =2240
	mov	x0, x24
	sub	x19, x28, x8
	bl	_raw_spin_lock
	ldr	x8, [x25, #2344]
	mov	x0, x24
	ldr	x9, [x25, #2360]
	add	x8, x8, x19
	sub	x9, x9, x8
	str	x8, [x25, #2344]
	str	x9, [x25, #2352]
	bl	_raw_spin_unlock
	mov	x0, x25
	bl	f2fs_record_iostat
.LBB57_117:
	mov	w26, #-529
	cbnz	w27, .LBB57_126
	b	.LBB57_128
.LBB57_118:
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	bl	up_read
.LBB57_119:
	ldr	w8, [sp, #64]           // 4-byte Folded Reload
	mov	w26, #-11
	strh	w8, [x25, #36]
	ldr	w27, [sp, #32]          // 4-byte Folded Reload
	cbnz	w27, .LBB57_126
	b	.LBB57_128
.LBB57_120:
	ldr	x23, [sp, #48]          // 8-byte Folded Reload
	tbnz	w26, #31, .LBB57_156
// %bb.121:
	ldr	w27, [sp, #32]          // 4-byte Folded Reload
	mov	w26, wzr
	cbnz	w27, .LBB57_126
	b	.LBB57_128
.LBB57_122:
	ldr	x22, [sp, #24]          // 8-byte Folded Reload
	b	.LBB57_76
.LBB57_123:
	mov	x26, x20
.LBB57_124:
	ldr	x23, [sp, #48]          // 8-byte Folded Reload
	adrp	x20, __tracepoint_android_fs_dataread_start
	add	x20, x20, :lo12:__tracepoint_android_fs_dataread_start
.LBB57_125:
	cbz	w27, .LBB57_128
.LBB57_126:
	ldr	w8, [x23, #1408]
	cmp	w8, #1                  // =1
	b.ne	.LBB57_128
// %bb.127:
	ldr	w8, [sp, #60]           // 4-byte Folded Reload
	add	x2, sp, #72             // =72
	mov	x0, x23
	mov	w1, wzr
	str	w8, [sp, #72]
	bl	sched_setscheduler_nocheck
.LBB57_128:
	ldr	w8, [x20, #8]
	cbnz	w22, .LBB57_146
// %bb.129:
	cmp	w8, #1                  // =1
	b.lt	.LBB57_146
// %bb.130:
	adrp	x8, __tracepoint_android_fs_dataread_end
	add	x8, x8, :lo12:__tracepoint_android_fs_dataread_end
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB57_137
// %bb.131:
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
	tbz	w9, #0, .LBB57_137
// %bb.132:
	ldr	w9, [x23, #80]
	add	w9, w9, #1              // =1
	str	w9, [x23, #80]
	//APP
	//NO_APP
	ldr	x19, [x8, #32]
	ldr	x20, [sp, #40]          // 8-byte Folded Reload
	cbz	x19, .LBB57_135
// %bb.133:
	ldr	x8, [x19], #24
.LBB57_134:                             // =>This Inner Loop Header: Depth=1
	ldur	x0, [x19, #-16]
	mov	x1, x21
	mov	x2, x20
	mov	w3, w28
	blr	x8
	ldr	x8, [x19], #24
	cbnz	x8, .LBB57_134
.LBB57_135:
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB57_137
// %bb.136:
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB57_165
.LBB57_137:
	adrp	x8, __tracepoint_android_fs_datawrite_start
	add	x8, x8, :lo12:__tracepoint_android_fs_datawrite_start
	ldr	wzr, [x8, #8]
.LBB57_138:
	adrp	x8, __tracepoint_f2fs_direct_IO_exit
	add	x8, x8, :lo12:__tracepoint_f2fs_direct_IO_exit
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB57_145
// %bb.139:
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
	tbz	w9, #0, .LBB57_145
// %bb.140:
	ldr	w9, [x23, #80]
	add	w9, w9, #1              // =1
	str	w9, [x23, #80]
	//APP
	//NO_APP
	ldr	x19, [x8, #32]
	ldr	x20, [sp, #40]          // 8-byte Folded Reload
	cbz	x19, .LBB57_143
// %bb.141:
	ldr	x8, [x19], #24
.LBB57_142:                             // =>This Inner Loop Header: Depth=1
	ldur	x0, [x19, #-16]
	mov	x1, x21
	mov	x2, x20
	mov	x3, x28
	mov	w4, w22
	mov	w5, w26
	blr	x8
	ldr	x8, [x19], #24
	cbnz	x8, .LBB57_142
.LBB57_143:
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB57_145
// %bb.144:
	ldr	x8, [x23]
	tbnz	w8, #1, .LBB57_163
.LBB57_145:
	sxtw	x0, w26
	b	.LBB57_13
.LBB57_146:
	adrp	x8, __tracepoint_android_fs_datawrite_start
	add	x8, x8, :lo12:__tracepoint_android_fs_datawrite_start
	ldr	w8, [x8, #8]
	cbz	w22, .LBB57_138
// %bb.147:
	cmp	w8, #1                  // =1
	b.lt	.LBB57_138
// %bb.148:
	adrp	x8, __tracepoint_android_fs_datawrite_end
	add	x8, x8, :lo12:__tracepoint_android_fs_datawrite_end
	ldr	w9, [x8, #8]
	cmp	w9, #1                  // =1
	b.lt	.LBB57_138
// %bb.149:
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
	tbz	w9, #0, .LBB57_138
// %bb.150:
	ldr	w9, [x23, #80]
	add	w9, w9, #1              // =1
	str	w9, [x23, #80]
	//APP
	//NO_APP
	ldr	x19, [x8, #32]
	ldr	x20, [sp, #40]          // 8-byte Folded Reload
	cbz	x19, .LBB57_153
// %bb.151:
	ldr	x8, [x19], #24
.LBB57_152:                             // =>This Inner Loop Header: Depth=1
	ldur	x0, [x19, #-16]
	mov	x1, x21
	mov	x2, x20
	mov	w3, w28
	blr	x8
	ldr	x8, [x19], #24
	cbnz	x8, .LBB57_152
.LBB57_153:
	//APP
	//NO_APP
	ldr	w8, [x23, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x23, #80]
	b.ne	.LBB57_138
// %bb.154:
	ldr	x8, [x23]
	tbz	w8, #1, .LBB57_138
// %bb.155:
	bl	preempt_schedule_notrace
	b	.LBB57_138
.LBB57_156:
	ldr	x8, [sp, #40]           // 8-byte Folded Reload
	mov	x0, x27
	add	x1, x8, x28
	bl	f2fs_write_failed
	ldr	w27, [sp, #32]          // 4-byte Folded Reload
	cbnz	w27, .LBB57_126
	b	.LBB57_128
.LBB57_157:
	bl	__stack_chk_fail
.LBB57_158:
	adrp	x1, .L.str.14
	add	x0, sp, #80             // =80
	add	x1, x1, :lo12:.L.str.14
	add	x23, sp, #80            // =80
	bl	strcpy
	b	.LBB57_44
.LBB57_159:
	adrp	x1, .L.str.14
	add	x0, sp, #80             // =80
	add	x1, x1, :lo12:.L.str.14
	add	x23, sp, #80            // =80
	bl	strcpy
	b	.LBB57_43
.LBB57_160:
	adrp	x1, .L.str.14
	add	x8, sp, #80             // =80
	add	x1, x1, :lo12:.L.str.14
	add	x0, sp, #80             // =80
	str	x8, [sp]                // 8-byte Folded Spill
	bl	strcpy
	b	.LBB57_57
.LBB57_161:
	adrp	x1, .L.str.14
	add	x8, sp, #80             // =80
	add	x1, x1, :lo12:.L.str.14
	add	x0, sp, #80             // =80
	str	x8, [sp]                // 8-byte Folded Spill
	bl	strcpy
	b	.LBB57_56
.LBB57_162:
	bl	preempt_schedule_notrace
	b	.LBB57_39
.LBB57_163:
	bl	preempt_schedule_notrace
	b	.LBB57_145
.LBB57_164:
	bl	preempt_schedule_notrace
	b	.LBB57_51
.LBB57_165:
	bl	preempt_schedule_notrace
	b	.LBB57_137
.LBB57_166:
	bl	preempt_schedule_notrace
	b	.LBB57_64
.Lfunc_end57:
	.size	f2fs_direct_IO, .Lfunc_end57-f2fs_direct_IO
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_swap_activate
	.type	f2fs_swap_activate,@function
f2fs_swap_activate:                     // @f2fs_swap_activate
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
	ldr	x19, [x1, #32]
	ldrh	w8, [x19]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB58_4
// %bb.1:
	ldr	x8, [x19, #40]
	mov	x20, x0
	ldr	x0, [x8, #1104]
	ldr	x8, [x0]
	ldrb	w8, [x8, #80]
	tbnz	w8, #0, .LBB58_5
// %bb.2:
	ldr	w8, [x0, #1504]
	cmp	w8, #1                  // =1
	b.ne	.LBB58_8
// %bb.3:
	adrp	x1, .L.str.25
	add	x1, x1, :lo12:.L.str.25
	bl	f2fs_printk
.LBB58_4:
	mov	w22, #-22
	b	.LBB58_6
.LBB58_5:
	mov	w22, #-30
.LBB58_6:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-16]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB58_86
// %bb.7:
	mov	w0, w22
	ldp	x20, x19, [sp, #336]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #320]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #304]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #288]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #272]    // 16-byte Folded Reload
	ldp	x29, x30, [sp, #256]    // 16-byte Folded Reload
	add	sp, sp, #352            // =352
	ret
.LBB58_8:
	ldr	x8, [x19, #712]
	tbnz	x8, #43, .LBB58_75
// %bb.9:
	mov	x0, x19
	mov	x21, x2
	mov	x23, x1
	bl	f2fs_convert_inline_inode
	mov	w22, w0
	cbnz	w0, .LBB58_6
// %bb.10:
	ldrh	w8, [x19]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB58_16
// %bb.11:
	ldr	x8, [x19, #712]
	tbz	w8, #31, .LBB58_16
// %bb.12:
	ldr	w8, [x19, #800]
	ldr	x9, [x19, #144]
	cmp	w8, #0                  // =0
	cset	w8, ne
	cmp	x8, x9, lsr #3
	b.lo	.LBB58_4
// %bb.13:
	ldr	x8, [x19, #680]
	and	x8, x8, #0xfffffffffffffffb
	str	x8, [x19, #680]
	ldr	x8, [x19, #712]
	tbz	w8, #31, .LBB58_15
// %bb.14:
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
.LBB58_15:
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
.LBB58_16:
	mov	x0, x19
	str	x21, [sp, #48]          // 8-byte Folded Spill
	bl	f2fs_precache_extents
	ldr	x8, [x23, #240]
	ldr	x25, [x8]
	ldr	x8, [x25, #40]
	ldr	x10, [x25, #80]
	ldrb	w11, [x25, #142]
	ldr	x9, [x8, #1104]
	ldr	w8, [x9, #1192]
	str	x9, [sp, #64]           // 8-byte Folded Spill
	ldr	w9, [x9, #1188]
	mul	w12, w9, w8
	lsr	x9, x10, x11
	cbz	x9, .LBB58_76
// %bb.17:
	sub	x8, x29, #56            // =56
	sub	w11, w12, #1            // =1
	add	x8, x8, #16             // =16
	mov	x24, xzr
	mov	w23, wzr
	mov	w10, wzr
	str	xzr, [sp, #32]          // 8-byte Folded Spill
	str	x8, [sp, #120]          // 8-byte Folded Spill
	mov	w8, w11
	str	w11, [sp, #116]         // 4-byte Folded Spill
	str	w12, [sp, #60]          // 4-byte Folded Spill
	stur	x8, [x29, #-104]        // 8-byte Folded Spill
	mov	w8, w12
	str	x20, [sp, #88]          // 8-byte Folded Spill
	str	x8, [sp, #96]           // 8-byte Folded Spill
	add	x8, x25, #1016          // =1016
	stur	x8, [x29, #-72]         // 8-byte Folded Spill
	add	x8, x25, #1064          // =1064
	stur	x8, [x29, #-80]         // 8-byte Folded Spill
	mov	x8, #-1
	stp	x9, x8, [sp, #16]       // 16-byte Folded Spill
	//APP
	mrs x8, sp_el0
	//NO_APP
	str	x8, [sp, #8]            // 8-byte Folded Spill
.LBB58_18:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB58_22 Depth 2
                                        //       Child Loop BB58_29 Depth 3
                                        //         Child Loop BB58_34 Depth 4
	ldr	w8, [x20, #60]
	cmp	x24, x8
	b.hs	.LBB58_74
// %bb.19:                              //   in Loop: Header=BB58_18 Depth=1
	sub	w8, w9, w24
	str	w10, [sp, #44]          // 4-byte Folded Spill
	str	x24, [sp, #104]         // 8-byte Folded Spill
	stur	w8, [x29, #-124]        // 4-byte Folded Spill
	b	.LBB58_22
.LBB58_20:                              //   in Loop: Header=BB58_22 Depth=2
	mov	w22, wzr
.LBB58_21:                              //   in Loop: Header=BB58_22 Depth=2
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x11]
1:	ldxr	x8, [x11]
	bic	x8, x8, 4194304
	stxr	w9, x8, [x11]
	cbnz	w9, 1b
	//NO_APP
	mov	x10, #68719476736
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x11]
1:	ldxr	x8, [x11]
	bic	x8, x8, x10
	stxr	w9, x8, [x11]
	cbnz	w9, 1b
	//NO_APP
	ldur	x0, [x29, #-80]         // 8-byte Folded Reload
	bl	up_write
	ldur	x0, [x29, #-72]         // 8-byte Folded Reload
	bl	up_write
	ldr	x24, [sp, #104]         // 8-byte Folded Reload
	ldr	x20, [sp, #88]          // 8-byte Folded Reload
	cbnz	w22, .LBB58_81
.LBB58_22:                              //   Parent Loop BB58_18 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB58_29 Depth 3
                                        //         Child Loop BB58_34 Depth 4
	sub	x0, x29, #56            // =56
	mov	w1, wzr
	mov	w2, #40
	bl	memset
	ldur	w8, [x29, #-124]        // 4-byte Folded Reload
	sub	x1, x29, #56            // =56
	mov	x0, x25
	mov	w2, wzr
	mov	w3, #1
	stp	w24, w8, [x29, #-52]
	ldr	x8, [sp, #120]          // 8-byte Folded Reload
	stp	xzr, xzr, [x8]
	mov	w8, #11
	sturb	wzr, [x29, #-20]
	stur	w8, [x29, #-24]
	bl	f2fs_map_blocks
	cbnz	w0, .LBB58_79
// %bb.23:                              //   in Loop: Header=BB58_22 Depth=2
	ldurh	w8, [x29, #-44]
	mov	w9, #4192
	tst	w8, w9
	b.eq	.LBB58_80
// %bb.24:                              //   in Loop: Header=BB58_22 Depth=2
	ldur	w21, [x29, #-48]
	ldr	w8, [sp, #116]          // 4-byte Folded Reload
	ldur	w22, [x29, #-56]
	tst	w21, w8
	b.ne	.LBB58_26
// %bb.25:                              //   in Loop: Header=BB58_22 Depth=2
	ldr	x8, [sp, #64]           // 8-byte Folded Reload
	ldur	x9, [x29, #-104]        // 8-byte Folded Reload
	ldr	x8, [x8, #136]
	ldr	w8, [x8, #84]
	sub	w8, w22, w8
	and	x8, x8, x9
	cbz	x8, .LBB58_70
.LBB58_26:                              //   in Loop: Header=BB58_22 Depth=2
	ldur	x8, [x29, #-104]        // 8-byte Folded Reload
	add	w23, w23, #1            // =1
	ldr	x11, [sp, #96]          // 8-byte Folded Reload
	ldr	w9, [x20, #60]
	add	x8, x21, x8
	udiv	x8, x8, x11
	mul	x8, x8, x11
	add	x10, x8, x24
	cmp	x10, x9
	csel	x9, x11, xzr, hi
	subs	x8, x8, x9
	b.eq	.LBB58_69
// %bb.27:                              //   in Loop: Header=BB58_22 Depth=2
	ldr	x9, [x25, #40]
	ldur	x0, [x29, #-72]         // 8-byte Folded Reload
	ldr	x26, [x9, #1104]
	ldr	w9, [x26, #1192]
	ldr	w10, [x26, #1188]
	mul	w28, w10, w9
	udiv	w24, w24, w28
	udiv	w8, w8, w28
	add	w20, w8, w24
	bl	down_write
	ldur	x0, [x29, #-80]         // 8-byte Folded Reload
	bl	down_write
	add	x11, x25, #712          // =712
	mov	x10, #68719476736
	//APP
	// atomic64_or
	prfm	pstl1strm, [x11]
1:	ldxr	x8, [x11]
	orr	x8, x8, x10
	stxr	w9, x8, [x11]
	cbnz	w9, 1b
	//NO_APP
	cmp	w24, w20
	stur	w20, [x29, #-84]        // 4-byte Folded Spill
	b.hs	.LBB58_20
// %bb.28:                              //   in Loop: Header=BB58_22 Depth=2
	str	w23, [sp, #84]          // 4-byte Folded Spill
	add	x20, x26, #1920         // =1920
	add	x21, x26, #368          // =368
	add	x8, x26, #304           // =304
	mov	w23, w28
	str	x11, [sp, #72]          // 8-byte Folded Spill
	stur	x8, [x29, #-96]         // 8-byte Folded Spill
	stp	x21, x20, [x29, #-120]  // 16-byte Folded Spill
.LBB58_29:                              //   Parent Loop BB58_18 Depth=1
                                        //     Parent Loop BB58_22 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB58_34 Depth 4
	mov	x0, x20
	bl	down_write
	mov	x0, x21
	bl	_raw_spin_lock
	ldr	x8, [x26, #352]
	cbz	x8, .LBB58_31
// %bb.30:                              //   in Loop: Header=BB58_29 Depth=3
	adrp	x9, jiffies
	ldr	x8, [x26, #360]
	ldr	x9, [x9, :lo12:jiffies]
	sub	x8, x8, x9
	cmn	x8, #2500               // =2500
	b.mi	.LBB58_65
.LBB58_31:                              //   in Loop: Header=BB58_29 Depth=3
	mov	x0, x21
	bl	_raw_spin_unlock
	ldur	x21, [x29, #-96]        // 8-byte Folded Reload
	mov	x0, x21
	bl	down_read
	mov	x0, x26
	mov	w1, #9
	mov	w2, wzr
	bl	f2fs_allocate_new_section
	mov	x0, x21
	bl	up_read
	add	x10, x25, #712          // =712
	stur	x10, [x29, #-64]        // 8-byte Folded Spill
	//APP
	// atomic64_or
	prfm	pstl1strm, [x10]
1:	ldxr	x8, [x10]
	orr	x8, x8, 4194304
	stxr	w9, x8, [x10]
	cbnz	w9, 1b
	//NO_APP
	cbz	w28, .LBB58_63
// %bb.32:                              //   in Loop: Header=BB58_29 Depth=3
	mul	w21, w24, w28
	mov	x27, xzr
	b	.LBB58_34
.LBB58_33:                              //   in Loop: Header=BB58_34 Depth=4
	add	x27, x27, #1            // =1
	cmp	x27, x23
	b.eq	.LBB58_63
.LBB58_34:                              //   Parent Loop BB58_18 Depth=1
                                        //     Parent Loop BB58_22 Depth=2
                                        //       Parent Loop BB58_29 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	add	w1, w21, w27
	mov	x0, x25
	mov	w2, #1
	bl	f2fs_get_lock_data_page
	mov	x22, x0
	cmn	x0, #4095               // =4095
	b.hs	.LBB58_66
// %bb.35:                              //   in Loop: Header=BB58_34 Depth=4
	mov	x0, x22
	bl	set_page_dirty
	cbz	x22, .LBB58_33
// %bb.36:                              //   in Loop: Header=BB58_34 Depth=4
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
	b.ne	.LBB58_52
// %bb.37:                              //   in Loop: Header=BB58_34 Depth=4
	tbnz	w8, #0, .LBB58_51
// %bb.38:                              //   in Loop: Header=BB58_34 Depth=4
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB58_41
// %bb.39:                              //   in Loop: Header=BB58_34 Depth=4
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB58_41
// %bb.40:                              //   in Loop: Header=BB58_34 Depth=4
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3734
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	ldur	x20, [x29, #-112]       // 8-byte Folded Reload
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB58_41:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB58_43
// %bb.42:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB58_60
.LBB58_43:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x0, [x22, #24]
.LBB58_44:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_raw_sb_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB58_46
// %bb.45:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB58_61
.LBB58_46:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x0, [x22, #24]
.LBB58_47:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_ckpt_info
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB58_49
// %bb.48:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x8, [x22]
	tbnz	w8, #10, .LBB58_62
.LBB58_49:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x0, [x22, #24]
.LBB58_50:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x0, [x8, #1104]
	bl	f2fs_print_sbi_info
.LBB58_51:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #0, .LBB58_58
	b	.LBB58_87
.LBB58_52:                              //   in Loop: Header=BB58_34 Depth=4
	tbnz	w8, #0, .LBB58_57
// %bb.53:                              //   in Loop: Header=BB58_34 Depth=4
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB58_56
// %bb.54:                              //   in Loop: Header=BB58_34 Depth=4
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB58_56
// %bb.55:                              //   in Loop: Header=BB58_34 Depth=4
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_put_page
	add	x1, x1, :lo12:.L.str
	add	x2, x2, :lo12:.L__func__.f2fs_put_page
	mov	w3, #3736
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	ldur	x20, [x29, #-112]       // 8-byte Folded Reload
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB58_56:                              //   in Loop: Header=BB58_34 Depth=4
	mov	x0, xzr
	bl	f2fs_print_raw_sb_info
	mov	x0, xzr
	bl	f2fs_print_ckpt_info
	mov	x0, xzr
	bl	f2fs_print_sbi_info
.LBB58_57:                              //   in Loop: Header=BB58_34 Depth=4
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	ldr	x8, [x8]
	tbz	w8, #0, .LBB58_88
.LBB58_58:                              //   in Loop: Header=BB58_34 Depth=4
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
	cbnz	w9, .LBB58_33
// %bb.59:                              //   in Loop: Header=BB58_34 Depth=4
	bl	__put_page
	b	.LBB58_33
.LBB58_60:                              //   in Loop: Header=BB58_34 Depth=4
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB58_44
.LBB58_61:                              //   in Loop: Header=BB58_34 Depth=4
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB58_47
.LBB58_62:                              //   in Loop: Header=BB58_34 Depth=4
	mov	x0, x22
	bl	__page_file_mapping
	b	.LBB58_50
.LBB58_63:                              //   in Loop: Header=BB58_29 Depth=3
	ldur	x10, [x29, #-64]        // 8-byte Folded Reload
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x10]
1:	ldxr	x8, [x10]
	bic	x8, x8, 4194304
	stxr	w9, x8, [x10]
	cbnz	w9, 1b
	//NO_APP
	ldr	x0, [x25, #48]
	bl	filemap_fdatawrite
	mov	w22, w0
	mov	x0, x20
	bl	up_write
	cbnz	w22, .LBB58_67
// %bb.64:                              //   in Loop: Header=BB58_29 Depth=3
	ldur	w8, [x29, #-84]         // 4-byte Folded Reload
	add	w24, w24, #1            // =1
	ldur	x21, [x29, #-120]       // 8-byte Folded Reload
	cmp	w24, w8
	b.lo	.LBB58_29
	b	.LBB58_68
.LBB58_65:                              //   in Loop: Header=BB58_29 Depth=3
	ldr	x0, [sp, #8]            // 8-byte Folded Reload
	mov	x1, xzr
	bl	show_stack
	adrp	x8, jiffies
	ldr	x1, [x26, #360]
	adrp	x0, .L.str.18
	add	x0, x0, :lo12:.L.str.18
	ldr	x2, [x8, :lo12:jiffies]
	bl	printk
	ldr	x0, [x26, #352]
	mov	x1, xzr
	bl	show_stack
	b	.LBB58_31
.LBB58_66:                              //   in Loop: Header=BB58_22 Depth=2
	mov	x0, x20
	bl	up_write
.LBB58_67:                              //   in Loop: Header=BB58_22 Depth=2
	ldr	w23, [sp, #84]          // 4-byte Folded Reload
	ldr	x11, [sp, #72]          // 8-byte Folded Reload
	b	.LBB58_21
.LBB58_68:                              //   in Loop: Header=BB58_22 Depth=2
	mov	w22, wzr
	b	.LBB58_67
.LBB58_69:                              //   in Loop: Header=BB58_18 Depth=1
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	adrp	x1, .L.str.28
	add	x1, x1, :lo12:.L.str.28
	bl	f2fs_printk
.LBB58_70:                              //   in Loop: Header=BB58_18 Depth=1
	ldr	w8, [x20, #60]
	add	x9, x24, x21
	sub	x10, x8, x24
	cmp	x9, x8
	mov	x8, x24
	csel	x24, x21, x10, lo
	mov	x21, x8
	cbz	x8, .LBB58_72
// %bb.71:                              //   in Loop: Header=BB58_18 Depth=1
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	add	x8, x22, x24
	sub	x8, x8, #1              // =1
	cmp	x9, x22
	csel	x9, x22, x9, hi
	str	x9, [sp, #24]           // 8-byte Folded Spill
	ldr	x9, [sp, #32]           // 8-byte Folded Reload
	cmp	x8, x9
	csel	x9, x8, x9, hi
	str	x9, [sp, #32]           // 8-byte Folded Spill
.LBB58_72:                              //   in Loop: Header=BB58_18 Depth=1
	mov	x0, x20
	mov	x1, x21
	mov	x2, x24
	mov	x3, x22
	bl	add_swap_extent
	mov	w22, w0
	tbnz	w0, #31, .LBB58_81
// %bb.73:                              //   in Loop: Header=BB58_18 Depth=1
	ldr	w10, [sp, #44]          // 4-byte Folded Reload
	add	x21, x24, x21
	ldr	x9, [sp, #16]           // 8-byte Folded Reload
	mov	x24, x21
	ldr	w12, [sp, #60]          // 4-byte Folded Reload
	add	w10, w22, w10
	cmp	x9, x21
	b.hi	.LBB58_18
.LBB58_74:
	ldp	x9, x8, [sp, #24]       // 16-byte Folded Reload
	sub	x8, x8, x9
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	add	x8, x8, #1              // =1
	str	x8, [x9]
	cbnz	x24, .LBB58_78
	b	.LBB58_77
.LBB58_75:
	adrp	x1, .L.str.26
	add	x1, x1, :lo12:.L.str.26
	bl	f2fs_printk
	mov	w22, #-95
	b	.LBB58_6
.LBB58_76:
	ldr	x9, [sp, #48]           // 8-byte Folded Reload
	mov	w8, #2
	mov	w23, wzr
	mov	w10, wzr
	str	x8, [x9]
.LBB58_77:
	mov	w24, #1
.LBB58_78:
	sub	w8, w24, #1             // =1
	str	w24, [x20, #60]
	mov	w22, w10
	stp	w8, w8, [x20, #100]
	b	.LBB58_82
.LBB58_79:
	mov	w22, w0
	b	.LBB58_81
.LBB58_80:
	adrp	x1, .L.str.27
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	add	x1, x1, :lo12:.L.str.27
	bl	f2fs_printk
	mov	w22, #-22
.LBB58_81:
	ldr	w12, [sp, #60]          // 4-byte Folded Reload
.LBB58_82:
	cbz	w23, .LBB58_84
// %bb.83:
	adrp	x1, .L.str.29
	ldr	x0, [sp, #64]           // 8-byte Folded Reload
	add	x1, x1, :lo12:.L.str.29
	mov	w2, w23
	lsl	w3, w12, #12
	bl	f2fs_printk
.LBB58_84:
	tbnz	w22, #31, .LBB58_6
// %bb.85:
	mov	x0, x19
	mov	w1, #1
	add	x8, x19, #712           // =712
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
	ldr	x8, [x19, #40]
	adrp	x9, jiffies
	ldr	x8, [x8, #1104]
	ldr	x9, [x9, :lo12:jiffies]
	stp	x9, x9, [x8, #504]
	str	x9, [x8, #520]
	b	.LBB58_6
.LBB58_86:
	bl	__stack_chk_fail
.LBB58_87:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3734; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB58_88:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/f2fs.h"; .popsection; .long 14472b - 14470b; .short 3736; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end58:
	.size	f2fs_swap_activate, .Lfunc_end58-f2fs_swap_activate
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_swap_deactivate
	.type	f2fs_swap_deactivate,@function
f2fs_swap_deactivate:                   // @f2fs_swap_deactivate
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldr	x0, [x0, #32]
	mov	w1, #1
	mov	w8, #268435456
	mov	x29, sp
	add	x9, x0, #712            // =712
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x9]
1:	ldxr	x10, [x9]
	bic	x10, x10, x8
	stxr	w11, x10, [x9]
	cbnz	w11, 1b
	//NO_APP
	bl	f2fs_mark_inode_dirty_sync
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end59:
	.size	f2fs_swap_deactivate, .Lfunc_end59-f2fs_swap_deactivate
                                        // -- End function
	.globl	f2fs_clear_page_cache_dirty_tag // -- Begin function f2fs_clear_page_cache_dirty_tag
	.p2align	3
	.type	f2fs_clear_page_cache_dirty_tag,@function
f2fs_clear_page_cache_dirty_tag:        // @f2fs_clear_page_cache_dirty_tag
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	str	x21, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x21, x0
	bl	page_mapping
	add	x19, x0, #8             // =8
	mov	x0, x19
	bl	_raw_spin_lock_irqsave
	ldr	x8, [x21, #8]
	mov	x20, x0
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB60_2
// %bb.1:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB60_4
.LBB60_2:
	ldr	x1, [x21, #32]
.LBB60_3:
	mov	x0, x19
	mov	w2, wzr
	bl	radix_tree_tag_clear
	mov	x0, x19
	mov	x1, x20
	bl	_raw_spin_unlock_irqrestore
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.LBB60_4:
	mov	x0, x21
	bl	__page_file_index
	mov	x1, x0
	b	.LBB60_3
.Lfunc_end60:
	.size	f2fs_clear_page_cache_dirty_tag, .Lfunc_end60-f2fs_clear_page_cache_dirty_tag
                                        // -- End function
	.section	.init.text,"ax",@progbits
	.globl	f2fs_init_post_read_processing // -- Begin function f2fs_init_post_read_processing
	.p2align	2
	.type	f2fs_init_post_read_processing,@function
f2fs_init_post_read_processing:         // @f2fs_init_post_read_processing
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	adrp	x0, .L.str.5
	mov	w1, #80
	add	x0, x0, :lo12:.L.str.5
	mov	w2, wzr
	mov	w3, wzr
	mov	x4, xzr
	str	x19, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	bl	kmem_cache_create
	adrp	x19, bio_post_read_ctx_cache
	str	x0, [x19, :lo12:bio_post_read_ctx_cache]
	cbz	x0, .LBB61_4
// %bb.1:
	adrp	x1, mempool_alloc_slab
	adrp	x2, mempool_free_slab
	mov	x3, x0
	add	x1, x1, :lo12:mempool_alloc_slab
	add	x2, x2, :lo12:mempool_free_slab
	mov	w0, #128
	bl	mempool_create
	adrp	x8, bio_post_read_ctx_pool
	str	x0, [x8, :lo12:bio_post_read_ctx_pool]
	cbz	x0, .LBB61_3
// %bb.2:
	mov	w0, wzr
	b	.LBB61_5
.LBB61_3:
	ldr	x0, [x19, :lo12:bio_post_read_ctx_cache]
	bl	kmem_cache_destroy
.LBB61_4:
	mov	w0, #-12
.LBB61_5:
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end61:
	.size	f2fs_init_post_read_processing, .Lfunc_end61-f2fs_init_post_read_processing
                                        // -- End function
	.text
	.globl	f2fs_destroy_post_read_processing // -- Begin function f2fs_destroy_post_read_processing
	.p2align	3
	.type	f2fs_destroy_post_read_processing,@function
f2fs_destroy_post_read_processing:      // @f2fs_destroy_post_read_processing
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x8, bio_post_read_ctx_pool
	mov	x29, sp
	ldr	x0, [x8, :lo12:bio_post_read_ctx_pool]
	bl	mempool_destroy
	adrp	x8, bio_post_read_ctx_cache
	ldr	x0, [x8, :lo12:bio_post_read_ctx_cache]
	bl	kmem_cache_destroy
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end62:
	.size	f2fs_destroy_post_read_processing, .Lfunc_end62-f2fs_destroy_post_read_processing
                                        // -- End function
	.globl	f2fs_init_post_read_wq  // -- Begin function f2fs_init_post_read_wq
	.p2align	3
	.type	f2fs_init_post_read_wq,@function
f2fs_init_post_read_wq:                 // @f2fs_init_post_read_wq
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	ldr	x8, [x0, #16]
	mov	w9, #9217
	str	x19, [sp, #16]          // 8-byte Folded Spill
	mov	x29, sp
	ldrh	w8, [x8, #2180]
	tst	w8, w9
	b.eq	.LBB63_2
// %bb.1:
	adrp	x8, __cpu_online_mask
	mov	x19, x0
	ldrb	w0, [x8, :lo12:__cpu_online_mask]
	bl	__sw_hweight64
	mov	x2, x0
	adrp	x0, .L.str.6
	mov	w1, #18
	add	x0, x0, :lo12:.L.str.6
	mov	x3, xzr
	mov	x4, xzr
                                        // kill: def $w2 killed $w2 killed $x2
	bl	__alloc_workqueue_key
	mov	w9, #-12
	cmp	x0, #0                  // =0
	mov	x8, x0
	csel	w0, w9, wzr, eq
	str	x8, [x19, #3120]
	b	.LBB63_3
.LBB63_2:
	mov	w0, wzr
.LBB63_3:
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end63:
	.size	f2fs_init_post_read_wq, .Lfunc_end63-f2fs_init_post_read_wq
                                        // -- End function
	.globl	f2fs_destroy_post_read_wq // -- Begin function f2fs_destroy_post_read_wq
	.p2align	3
	.type	f2fs_destroy_post_read_wq,@function
f2fs_destroy_post_read_wq:              // @f2fs_destroy_post_read_wq
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldr	x0, [x0, #3120]
	mov	x29, sp
	cbz	x0, .LBB64_2
// %bb.1:
	bl	destroy_workqueue
.LBB64_2:
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end64:
	.size	f2fs_destroy_post_read_wq, .Lfunc_end64-f2fs_destroy_post_read_wq
                                        // -- End function
	.section	.init.text,"ax",@progbits
	.globl	f2fs_init_bio_entry_cache // -- Begin function f2fs_init_bio_entry_cache
	.p2align	2
	.type	f2fs_init_bio_entry_cache,@function
f2fs_init_bio_entry_cache:              // @f2fs_init_bio_entry_cache
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x0, .L.str.7
	mov	w1, #24
	add	x0, x0, :lo12:.L.str.7
	mov	w2, wzr
	mov	w3, #131072
	mov	x4, xzr
	mov	x29, sp
	bl	kmem_cache_create
	mov	w9, #-12
	cmp	x0, #0                  // =0
	mov	x8, x0
	csel	w0, w9, wzr, eq
	adrp	x9, bio_entry_slab
	str	x8, [x9, :lo12:bio_entry_slab]
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end65:
	.size	f2fs_init_bio_entry_cache, .Lfunc_end65-f2fs_init_bio_entry_cache
                                        // -- End function
	.text
	.globl	f2fs_destroy_bio_entry_cache // -- Begin function f2fs_destroy_bio_entry_cache
	.p2align	3
	.type	f2fs_destroy_bio_entry_cache,@function
f2fs_destroy_bio_entry_cache:           // @f2fs_destroy_bio_entry_cache
// %bb.0:
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x8, bio_entry_slab
	mov	x29, sp
	ldr	x0, [x8, :lo12:bio_entry_slab]
	bl	kmem_cache_destroy
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end66:
	.size	f2fs_destroy_bio_entry_cache, .Lfunc_end66-f2fs_destroy_bio_entry_cache
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_read_end_io
	.type	f2fs_read_end_io,@function
f2fs_read_end_io:                       // @f2fs_read_end_io
// %bb.0:
	stp	x29, x30, [sp, #-80]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	x19, x0
	ldrb	w8, [x0, #20]
	str	x25, [sp, #16]          // 8-byte Folded Spill
	tbnz	w8, #2, .LBB67_6
.LBB67_1:
	ldr	x8, [x19, #152]
	ldr	x21, [x8]
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB67_3
// %bb.2:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB67_7
.LBB67_3:
	ldrb	w8, [x19, #26]
	cbz	w8, .LBB67_8
.LBB67_4:
	mov	x0, x19
	bl	f2fs_finish_read_bio
.LBB67_5:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldr	x25, [sp, #16]          // 8-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #80     // 16-byte Folded Reload
	ret
.LBB67_6:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "include/linux/bio.h"; .popsection; .long 14472b - 14470b; .short 322; .short (1 << 0)|((1 << 1)|((9) << 8)); .popsection; 14471: brk 0x800
	//NO_APP
	b	.LBB67_1
.LBB67_7:
	mov	x0, x21
	bl	__page_file_mapping
	ldrb	w8, [x19, #26]
	cbnz	w8, .LBB67_4
.LBB67_8:
	ldr	x20, [x19, #80]
	cbz	x21, .LBB67_21
// %bb.9:
	ldr	x8, [x21, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x21, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB67_11
// %bb.10:
	ldr	x8, [x21]
	tbnz	w8, #10, .LBB67_24
.LBB67_11:
	ldr	x0, [x21, #24]
	cbz	x0, .LBB67_14
.LBB67_12:
	ldr	x8, [x0]
	ldr	x9, [x8, #40]
	ldr	x8, [x8, #64]
	ldr	x9, [x9, #1104]
	ldr	w10, [x9, #1180]
	cmp	x8, x10
	b.eq	.LBB67_21
// %bb.13:
	ldr	w9, [x9, #1176]
	cmp	x8, x9
	b.eq	.LBB67_21
.LBB67_14:
	ldp	x10, x8, [x21, #24]
	adrp	x9, __tracepoint_android_fs_dataread_end
	add	x9, x9, :lo12:__tracepoint_android_fs_dataread_end
	ldr	w21, [x19, #48]
	ldr	x22, [x10]
	ldr	w10, [x9, #8]
	cmp	w10, #1                 // =1
	b.lt	.LBB67_21
// %bb.15:
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
	tbz	w10, #0, .LBB67_21
// %bb.16:
	//APP
	mrs x24, sp_el0
	//NO_APP
	ldr	w10, [x24, #80]
	add	w10, w10, #1            // =1
	str	w10, [x24, #80]
	//APP
	//NO_APP
	ldr	x25, [x9, #32]
	cbz	x25, .LBB67_19
// %bb.17:
	ldr	x9, [x25], #24
	lsl	x23, x8, #12
.LBB67_18:                              // =>This Inner Loop Header: Depth=1
	ldur	x0, [x25, #-16]
	mov	x1, x22
	mov	x2, x23
	mov	w3, w21
	blr	x9
	ldr	x9, [x25], #24
	cbnz	x9, .LBB67_18
.LBB67_19:
	//APP
	//NO_APP
	ldr	w8, [x24, #80]
	subs	w8, w8, #1              // =1
	str	w8, [x24, #80]
	b.ne	.LBB67_21
// %bb.20:
	ldr	x8, [x24]
	tbnz	w8, #1, .LBB67_25
.LBB67_21:
	cbz	x20, .LBB67_4
.LBB67_22:
	ldrb	w8, [x20, #64]
	tst	w8, #0x3
	b.eq	.LBB67_4
// %bb.23:
	mov	x8, #68719476704
	adrp	x10, f2fs_post_read_work
	add	x10, x10, :lo12:f2fs_post_read_work
	mov	w0, #8
	str	x8, [x20, #16]!
	add	x8, x20, #8             // =8
	mov	x2, x20
	str	x8, [x20, #8]
	ldur	x9, [x20, #-8]
	stp	x8, x10, [x20, #16]
	ldr	x1, [x9, #3120]
	bl	queue_work_on
	b	.LBB67_5
.LBB67_24:
	mov	x0, x21
	bl	__page_file_mapping
	cbnz	x0, .LBB67_12
	b	.LBB67_14
.LBB67_25:
	bl	preempt_schedule_notrace
	cbnz	x20, .LBB67_22
	b	.LBB67_4
.Lfunc_end67:
	.size	f2fs_read_end_io, .Lfunc_end67-f2fs_read_end_io
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_write_end_io
	.type	f2fs_write_end_io,@function
f2fs_write_end_io:                      // @f2fs_write_end_io
// %bb.0:
	sub	sp, sp, #112            // =112
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x28, x27, [sp, #32]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #48]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	mov	x20, x0
	ldrh	w8, [x0, #138]
	ldr	x19, [x0, #80]
	cbz	w8, .LBB68_59
// %bb.1:
	ldr	w22, [x20, #88]
	mov	x25, xzr
	ldr	x24, [x20, #152]
	mov	w23, wzr
	mov	w21, #-1
	stur	w21, [x29, #-4]         // 4-byte Folded Spill
	b	.LBB68_4
.LBB68_2:                               //   in Loop: Header=BB68_4 Depth=1
	mov	x0, x20
	mov	x1, x28
	bl	f2fs_compress_write_end_io
.LBB68_3:                               //   in Loop: Header=BB68_4 Depth=1
	ldrh	w8, [x20, #138]
	add	w23, w23, #1            // =1
	add	x24, x24, #16           // =16
	cmp	w23, w8
	b.hs	.LBB68_59
.LBB68_4:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB68_43 Depth 2
	ldr	x28, [x24]
	ldr	x8, [x28, #24]
	cbz	x8, .LBB68_15
// %bb.5:                               //   in Loop: Header=BB68_4 Depth=1
	ldr	x27, [x8]
	ldr	x8, [x27, #40]
	ldr	x9, [x8, #1104]
	ldr	x8, [x27, #64]
	ldr	w10, [x9, #1180]
	cmp	x8, x10
	b.eq	.LBB68_8
// %bb.6:                               //   in Loop: Header=BB68_4 Depth=1
	ldr	w9, [x9, #1176]
	cmp	x8, x9
	b.eq	.LBB68_8
// %bb.7:                               //   in Loop: Header=BB68_4 Depth=1
	ldrh	w8, [x27]
	and	w8, w8, #0xf000
	cmp	w8, #4, lsl #12         // =16384
	b.ne	.LBB68_9
.LBB68_8:                               //   in Loop: Header=BB68_4 Depth=1
	mov	w27, #1
	ldr	x8, [x28]
	tbz	w8, #13, .LBB68_18
	b	.LBB68_16
.LBB68_9:                               //   in Loop: Header=BB68_4 Depth=1
	mov	x0, x28
	bl	f2fs_is_compressed_page
	tbnz	w0, #0, .LBB68_15
// %bb.10:                              //   in Loop: Header=BB68_4 Depth=1
	ldrh	w8, [x27]
	and	w8, w8, #0xf000
	cmp	w8, #8, lsl #12         // =32768
	b.ne	.LBB68_13
// %bb.11:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x8, [x27, #712]
	sxth	w8, w8
	tbnz	w8, #31, .LBB68_8
// %bb.12:                              //   in Loop: Header=BB68_4 Depth=1
	ldrb	w8, [x27, #12]
	tbnz	w8, #5, .LBB68_8
.LBB68_13:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x8, [x28]
	tbz	w8, #13, .LBB68_15
// %bb.14:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x8, [x28, #40]
	tbnz	w8, #0, .LBB68_52
.LBB68_15:                              //   in Loop: Header=BB68_4 Depth=1
	mov	w27, wzr
	ldr	x8, [x28]
	tbz	w8, #13, .LBB68_18
.LBB68_16:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x8, [x28, #40]
	tbz	w8, #0, .LBB68_18
// %bb.17:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x8, [x28, #40]
	tbnz	w8, #2, .LBB68_63
.LBB68_18:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x8, [x28, #24]
	cbnz	x8, .LBB68_20
// %bb.19:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x26, [x28, #40]
	mov	x0, x28
	bl	fscrypt_free_bounce_page
	mov	x28, x26
.LBB68_20:                              //   in Loop: Header=BB68_4 Depth=1
	mov	x0, x28
	add	w21, w21, #1            // =1
	bl	f2fs_is_compressed_page
	tbnz	w0, #0, .LBB68_2
// %bb.21:                              //   in Loop: Header=BB68_4 Depth=1
	ldrb	w8, [x20, #26]
	cbnz	w8, .LBB68_53
.LBB68_22:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x9, [x19, #248]
	ldr	x8, [x28, #24]
	ldr	x9, [x9, #48]
	cmp	x8, x9
	b.eq	.LBB68_24
// %bb.23:                              //   in Loop: Header=BB68_4 Depth=1
	add	w10, w21, w22
	add	w11, w10, #3            // =3
	cmp	w11, #4                 // =4
	b.hs	.LBB68_39
.LBB68_24:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x10, [x19, #128]
	ldr	x10, [x10, #48]
	cmp	x8, x10
	b.eq	.LBB68_29
// %bb.25:                              //   in Loop: Header=BB68_4 Depth=1
	cmp	x8, x9
	b.eq	.LBB68_32
// %bb.26:                              //   in Loop: Header=BB68_4 Depth=1
	cbz	x25, .LBB68_67
// %bb.27:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	w8, [x25]
	and	w2, w8, #0x3f
	cmp	w2, #8                  // =8
	b.hi	.LBB68_68
// %bb.28:                              //   in Loop: Header=BB68_4 Depth=1
	mov	w8, #1
	mov	w9, #455
	lsl	w8, w8, w2
	tst	w8, w9
	b.ne	.LBB68_32
	b	.LBB68_68
.LBB68_29:                              //   in Loop: Header=BB68_4 Depth=1
	lsl	x8, x28, #6
	orr	x8, x8, #0xffffffc000000000
	ldr	w2, [x8, #4072]
	ldr	x8, [x28, #32]
	cmp	x8, x2
	b.ne	.LBB68_72
// %bb.30:                              //   in Loop: Header=BB68_4 Depth=1
	cbz	x25, .LBB68_77
// %bb.31:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	w8, [x25]
	and	w8, w8, #0x3f
	sub	w9, w8, #3              // =3
	cmp	w9, #3                  // =3
	b.hs	.LBB68_76
.LBB68_32:                              //   in Loop: Header=BB68_4 Depth=1
	cmp	w27, #0                 // =0
	mov	w8, #32
	mov	w9, #28
	mov	x0, x19
	csel	x8, x9, x8, ne
	mov	x1, x28
	add	x8, x19, x8
	add	x8, x8, #1272           // =1272
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	f2fs_in_warm_node_list
	tbz	w0, #0, .LBB68_34
// %bb.33:                              //   in Loop: Header=BB68_4 Depth=1
	mov	x0, x19
	mov	x1, x28
	bl	f2fs_del_fsync_node_entry
.LBB68_34:                              //   in Loop: Header=BB68_4 Depth=1
	add	x8, x28, #40            // =40
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 8
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x28, #40]
	cmp	x8, #1                  // =1
	b.ne	.LBB68_38
// %bb.35:                              //   in Loop: Header=BB68_4 Depth=1
	str	xzr, [x28, #40]
	ldr	x8, [x28]
	tbz	w8, #13, .LBB68_38
// %bb.36:                              //   in Loop: Header=BB68_4 Depth=1
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x28]
1:	ldxr	x8, [x28]
	bic	x8, x8, 8192
	stxr	w9, x8, [x28]
	cbnz	w9, 1b
	//NO_APP
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
	cbnz	w9, .LBB68_38
// %bb.37:                              //   in Loop: Header=BB68_4 Depth=1
	bl	__put_page
.LBB68_38:                              //   in Loop: Header=BB68_4 Depth=1
	mov	x0, x28
	bl	end_page_writeback
	b	.LBB68_3
.LBB68_39:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	w12, [x19, #3024]
	cbz	w12, .LBB68_47
// %bb.40:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x11, [x19]
	cmp	w12, #1                 // =1
	ldr	x11, [x11, #248]
	b.lt	.LBB68_46
// %bb.41:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x14, [x19, #3032]
	mov	x13, xzr
	add	x14, x14, #80           // =80
	b	.LBB68_43
.LBB68_42:                              //   in Loop: Header=BB68_43 Depth=2
	add	x13, x13, #1            // =1
	add	x14, x14, #192          // =192
	cmp	x13, x12
	b.eq	.LBB68_46
.LBB68_43:                              //   Parent Loop BB68_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	w15, [x14, #-4]
	cmp	w15, w10
	b.hi	.LBB68_42
// %bb.44:                              //   in Loop: Header=BB68_43 Depth=2
	ldr	w15, [x14]
	cmp	w15, w10
	b.lo	.LBB68_42
// %bb.45:                              //   in Loop: Header=BB68_4 Depth=1
	ldur	x11, [x14, #-80]
.LBB68_46:                              //   in Loop: Header=BB68_4 Depth=1
	cbz	x11, .LBB68_24
.LBB68_47:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x11, [x19, #136]
	cbz	x11, .LBB68_49
// %bb.48:                              //   in Loop: Header=BB68_4 Depth=1
	add	x12, x11, #80           // =80
	b	.LBB68_50
.LBB68_49:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x12, [x19, #16]
	add	x12, x12, #72           // =72
.LBB68_50:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x13, [x11, #8]
	ldr	w12, [x12]
	ldr	w14, [x19, #1184]
	ldr	w13, [x13]
	sub	w10, w10, w12
	lsr	w10, w10, w14
	sub	w10, w10, w13
	cmn	w10, #1                 // =1
	b.eq	.LBB68_24
// %bb.51:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x11, [x11]
	mov	w12, #48
	ldr	x11, [x11, #136]
	umaddl	x25, w10, w12, x11
	b	.LBB68_24
.LBB68_52:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x8, [x28, #40]
	ubfx	x27, x8, #3, #1
	ldr	x8, [x28]
	tbnz	w8, #13, .LBB68_16
	b	.LBB68_18
.LBB68_53:                              //   in Loop: Header=BB68_4 Depth=1
	ldr	x26, [x28, #24]
	mov	w1, #-5
	mov	x0, x26
	bl	__filemap_set_wb_err
	add	x8, x26, #128           // =128
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 1
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	cbz	w27, .LBB68_22
// %bb.54:                              //   in Loop: Header=BB68_4 Depth=1
	mov	x0, x19
	mov	w1, #1
	bl	f2fs_stop_checkpoint
	ldrb	w2, [x20, #26]
	adrp	x1, .L.str.10
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.10
	bl	f2fs_printk
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB68_57
// %bb.55:                              //   in Loop: Header=BB68_4 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB68_57
// %bb.56:                              //   in Loop: Header=BB68_4 Depth=1
	adrp	x26, f2fs_dclient
	ldrb	w4, [x20, #26]
	adrp	x1, .L.str.11
	adrp	x2, .L__func__.f2fs_write_end_io
	add	x1, x1, :lo12:.L.str.11
	add	x2, x2, :lo12:.L__func__.f2fs_write_end_io
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w3, #675
	bl	dsm_client_record
	ldr	x0, [x26, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB68_57:                              //   in Loop: Header=BB68_4 Depth=1
	adrp	x8, system_state
	ldr	w8, [x8, :lo12:system_state]
	cmp	w8, #3                  // =3
	b.lo	.LBB68_81
// %bb.58:                              //   in Loop: Header=BB68_4 Depth=1
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	printk
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 679; .short (1 << 0)|(((9) << 8)); .popsection; 14471: brk 0x800
	//NO_APP
	b	.LBB68_22
.LBB68_59:
	ldr	w8, [x19, #1300]
	cbnz	w8, .LBB68_62
// %bb.60:
	//APP
	dmb ish
	//NO_APP
	add	x9, x19, #480           // =480
	ldr	x8, [x19, #480]
	cmp	x9, x8
	b.eq	.LBB68_62
// %bb.61:
	add	x0, x19, #472           // =472
	mov	w1, #3
	mov	w2, #1
	mov	x3, xzr
	bl	__wake_up
.LBB68_62:
	mov	x0, x20
	bl	bio_put
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB68_63:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB68_66
// %bb.64:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB68_66
// %bb.65:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_write_end_io
	add	x1, x1, :lo12:.L.str
	mov	w3, #635
	add	x2, x2, :lo12:.L__func__.f2fs_write_end_io
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB68_66:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 635; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB68_67:
	mov	w2, #-1
.LBB68_68:
	adrp	x0, .L.str.13
	adrp	x1, .L__func__.f2fs_write_end_io
	add	w3, w21, w22
	add	x0, x0, :lo12:.L.str.13
	add	x1, x1, :lo12:.L__func__.f2fs_write_end_io
	bl	printk
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB68_71
// %bb.69:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB68_71
// %bb.70:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_write_end_io
	add	x1, x1, :lo12:.L.str
	mov	w3, #710
	add	x2, x2, :lo12:.L__func__.f2fs_write_end_io
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB68_71:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 710; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB68_72:
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB68_75
// %bb.73:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB68_75
// %bb.74:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_write_end_io
	add	x1, x1, :lo12:.L.str
	mov	w3, #697
	add	x2, x2, :lo12:.L__func__.f2fs_write_end_io
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB68_75:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 697; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB68_76:
	stur	w8, [x29, #-4]          // 4-byte Folded Spill
.LBB68_77:
	adrp	x0, .L.str.12
	adrp	x1, .L__func__.f2fs_write_end_io
	ldur	w3, [x29, #-4]          // 4-byte Folded Reload
	add	w4, w21, w22
	add	x0, x0, :lo12:.L.str.12
	add	x1, x1, :lo12:.L__func__.f2fs_write_end_io
                                        // kill: def $w2 killed $w2 killed $x2
	bl	printk
	bl	print_bdev_access_info
	adrp	x8, f2fs_dclient
	ldr	x0, [x8, :lo12:f2fs_dclient]
	cbz	x0, .LBB68_80
// %bb.78:
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB68_80
// %bb.79:
	adrp	x20, f2fs_dclient
	adrp	x1, .L.str
	adrp	x2, .L__func__.f2fs_write_end_io
	add	x1, x1, :lo12:.L.str
	mov	w3, #702
	add	x2, x2, :lo12:.L__func__.f2fs_write_end_io
	ldr	x0, [x20, :lo12:f2fs_dclient]
	bl	dsm_client_record
	ldr	x0, [x20, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB68_80:
	mov	x0, x19
	bl	f2fs_print_raw_sb_info
	mov	x0, x19
	bl	f2fs_print_ckpt_info
	mov	x0, x19
	bl	f2fs_print_sbi_info
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 702; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.LBB68_81:
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 679; .short 0; .popsection; 14471: brk 0x800
	//NO_APP
.Lfunc_end68:
	.size	f2fs_write_end_io, .Lfunc_end68-f2fs_write_end_io
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_finish_read_bio
	.type	f2fs_finish_read_bio,@function
f2fs_finish_read_bio:                   // @f2fs_finish_read_bio
// %bb.0:
	stp	x29, x30, [sp, #-96]!   // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x8, [x0, #80]
	cbz	x8, .LBB69_7
// %bb.1:
	ldrb	w9, [x8, #64]
	tbz	w9, #3, .LBB69_7
// %bb.2:
	ldr	x20, [x8, #72]
	ldr	w8, [x20, #1288]
	cbz	w8, .LBB69_5
// %bb.3:
	add	x8, x20, #1288          // =1288
	//APP
	// atomic_sub_return
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stlxr	w10, w9, [x8]
	cbnz	w10, 1b
	dmb ish
	//NO_APP
	cbnz	w9, .LBB69_7
// %bb.4:
	//APP
	dmb ish
	//NO_APP
	add	x9, x20, #1304          // =1304
	ldr	x8, [x20, #1304]
	cmp	x9, x8
	b.ne	.LBB69_6
	b	.LBB69_7
.LBB69_5:
	ldr	x8, [x20, #40]
	adrp	x1, .L.str.19
	ldr	x2, [x20, #64]
	add	x1, x1, :lo12:.L.str.19
	ldr	x0, [x8, #1104]
	bl	f2fs_printk
.LBB69_6:
	add	x0, x20, #1296          // =1296
	mov	w1, #3
	mov	w2, wzr
	mov	x3, xzr
	bl	__wake_up
.LBB69_7:
	ldrh	w8, [x19, #138]
	cbz	w8, .LBB69_35
// %bb.8:
	ldr	x26, [x19, #152]
	adrp	x22, .L__func__.f2fs_finish_read_bio
	mov	w25, wzr
	mov	w27, #9
	mov	w28, #11
	mov	w21, #10
	adrp	x23, f2fs_dclient
	add	x22, x22, :lo12:.L__func__.f2fs_finish_read_bio
	b	.LBB69_12
.LBB69_9:                               //   in Loop: Header=BB69_12 Depth=1
	mov	x8, x27
.LBB69_10:                              //   in Loop: Header=BB69_12 Depth=1
	add	x8, x20, x8, lsl #2
	mov	x0, x24
	add	x8, x8, #1272           // =1272
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	unlock_page
.LBB69_11:                              //   in Loop: Header=BB69_12 Depth=1
	ldrh	w8, [x19, #138]
	add	w25, w25, #1            // =1
	add	x26, x26, #16           // =16
	cmp	w25, w8
	b.hs	.LBB69_35
.LBB69_12:                              // =>This Inner Loop Header: Depth=1
	ldr	x24, [x26]
	mov	x0, x24
	bl	f2fs_is_compressed_page
	ldrb	w2, [x19, #26]
	tbz	w0, #0, .LBB69_16
// %bb.13:                              //   in Loop: Header=BB69_12 Depth=1
	cbz	w2, .LBB69_15
// %bb.14:                              //   in Loop: Header=BB69_12 Depth=1
	mov	x0, x24
	mov	w1, #1
	mov	w2, wzr
	bl	f2fs_end_read_compressed_page
.LBB69_15:                              //   in Loop: Header=BB69_12 Depth=1
	mov	x0, x24
	bl	f2fs_put_page_dic
	b	.LBB69_11
.LBB69_16:                              //   in Loop: Header=BB69_12 Depth=1
	cbnz	w2, .LBB69_29
// %bb.17:                              //   in Loop: Header=BB69_12 Depth=1
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbnz	w8, #8, .LBB69_29
// %bb.18:                              //   in Loop: Header=BB69_12 Depth=1
	//APP
	dmb ishst
	//NO_APP
	//APP
	// atomic64_or
	prfm	pstl1strm, [x24]
1:	ldxr	x8, [x24]
	orr	x8, x8, 4
	stxr	w9, x8, [x24]
	cbnz	w9, 1b
	//NO_APP
.LBB69_19:                              //   in Loop: Header=BB69_12 Depth=1
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB69_21
// %bb.20:                              //   in Loop: Header=BB69_12 Depth=1
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB69_33
.LBB69_21:                              //   in Loop: Header=BB69_12 Depth=1
	ldr	x0, [x24, #24]
.LBB69_22:                              //   in Loop: Header=BB69_12 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	ldr	x20, [x8, #1104]
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	ldr	x8, [x8]
	tbz	w8, #19, .LBB69_24
// %bb.23:                              //   in Loop: Header=BB69_12 Depth=1
	ldr	x8, [x24]
	tbnz	w8, #10, .LBB69_34
.LBB69_24:                              //   in Loop: Header=BB69_12 Depth=1
	ldr	x0, [x24, #24]
	cbz	x0, .LBB69_9
.LBB69_25:                              //   in Loop: Header=BB69_12 Depth=1
	ldr	x8, [x0]
	ldr	x9, [x8, #40]
	ldr	x8, [x8, #64]
	ldr	x9, [x9, #1104]
	ldr	w10, [x9, #1180]
	cmp	x8, x10
	b.ne	.LBB69_27
// %bb.26:                              //   in Loop: Header=BB69_12 Depth=1
	mov	x8, x28
	b	.LBB69_10
.LBB69_27:                              //   in Loop: Header=BB69_12 Depth=1
	ldr	w9, [x9, #1176]
	cmp	x8, x9
	b.ne	.LBB69_9
// %bb.28:                              //   in Loop: Header=BB69_12 Depth=1
	mov	x8, x21
	b	.LBB69_10
.LBB69_29:                              //   in Loop: Header=BB69_12 Depth=1
	adrp	x0, .L.str.8
	mov	x1, x22
	add	x0, x0, :lo12:.L.str.8
	bl	printk
	ldr	x0, [x23, :lo12:f2fs_dclient]
	cbz	x0, .LBB69_32
// %bb.30:                              //   in Loop: Header=BB69_12 Depth=1
	bl	dsm_client_ocuppy
	cbnz	w0, .LBB69_32
// %bb.31:                              //   in Loop: Header=BB69_12 Depth=1
	ldr	x0, [x23, :lo12:f2fs_dclient]
	adrp	x1, .L.str.9
	ldrb	w3, [x19, #26]
	add	x1, x1, :lo12:.L.str.9
	mov	x2, x22
	bl	dsm_client_record
	ldr	x0, [x23, :lo12:f2fs_dclient]
	mov	w1, #15241
	movk	w1, #14160, lsl #16
	bl	dsm_client_notify
.LBB69_32:                              //   in Loop: Header=BB69_12 Depth=1
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 4
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x24, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x24, x9, eq
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 256
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	b	.LBB69_19
.LBB69_33:                              //   in Loop: Header=BB69_12 Depth=1
	mov	x0, x24
	bl	__page_file_mapping
	b	.LBB69_22
.LBB69_34:                              //   in Loop: Header=BB69_12 Depth=1
	mov	x0, x24
	bl	__page_file_mapping
	cbnz	x0, .LBB69_25
	b	.LBB69_9
.LBB69_35:
	ldr	x0, [x19, #80]
	cbz	x0, .LBB69_37
// %bb.36:
	adrp	x8, bio_post_read_ctx_pool
	ldr	x1, [x8, :lo12:bio_post_read_ctx_pool]
	bl	mempool_free
.LBB69_37:
	mov	x0, x19
	bl	bio_put
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end69:
	.size	f2fs_finish_read_bio, .Lfunc_end69-f2fs_finish_read_bio
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_post_read_work
	.type	f2fs_post_read_work,@function
f2fs_post_read_work:                    // @f2fs_post_read_work
// %bb.0:
	sub	sp, sp, #112            // =112
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x28, x27, [sp, #32]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #48]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	w8, [x0, #48]
	tbz	w8, #0, .LBB70_6
// %bb.1:
	tbz	w8, #3, .LBB70_5
// %bb.2:
	ldr	x20, [x19, #56]
	cbz	x20, .LBB70_5
// %bb.3:
	ldur	x8, [x19, #-16]
	str	x8, [sp, #8]            // 8-byte Folded Spill
	ldrh	w8, [x8, #138]
	cbz	w8, .LBB70_6
// %bb.4:
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	mov	w21, #64
	mov	w27, wzr
	movk	w21, #96, lsl #16
	ldr	x28, [x8, #152]
	b	.LBB70_20
.LBB70_5:
	ldur	x0, [x19, #-16]
	bl	fscrypt_decrypt_bio
.LBB70_6:
	ldr	w8, [x19, #48]
	ldur	x0, [x19, #-16]
	tbz	w8, #1, .LBB70_16
// %bb.7:
	ldrh	w9, [x0, #138]
	cbz	w9, .LBB70_15
// %bb.8:
	ldr	x8, [x0, #40]
	mov	w21, wzr
	ldr	x22, [x0, #152]
	mov	w23, #1
	lsr	x24, x8, #3
	b	.LBB70_11
.LBB70_9:                               //   in Loop: Header=BB70_11 Depth=1
	ldr	x8, [x20, #8]
	add	w2, w24, w21
	mov	x0, x20
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x20, x9, eq
	ldr	x8, [x8]
	ubfx	x1, x8, #8, #1
                                        // kill: def $w1 killed $w1 killed $x1
	bl	f2fs_end_read_compressed_page
.LBB70_10:                              //   in Loop: Header=BB70_11 Depth=1
	ldur	x0, [x19, #-16]
	add	w21, w21, #1            // =1
	add	x22, x22, #16           // =16
	ldrh	w8, [x0, #138]
	cmp	w21, w8
	b.hs	.LBB70_13
.LBB70_11:                              // =>This Inner Loop Header: Depth=1
	ldr	x20, [x22]
	mov	x0, x20
	bl	f2fs_is_compressed_page
	tbnz	w0, #0, .LBB70_9
// %bb.12:                              //   in Loop: Header=BB70_11 Depth=1
	mov	w23, wzr
	b	.LBB70_10
.LBB70_13:
	tbz	w23, #0, .LBB70_16
// %bb.14:
	ldr	w8, [x19, #48]
.LBB70_15:
	and	w8, w8, #0xfffffffb
	str	w8, [x19, #48]
.LBB70_16:
	bl	f2fs_finish_read_bio
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB70_17:                              //   in Loop: Header=BB70_20 Depth=1
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 297; .short (1 << 0)|((1 << 1)|((9) << 8)); .popsection; 14471: brk 0x800
	//NO_APP
.LBB70_18:                              //   in Loop: Header=BB70_20 Depth=1
	ldr	x8, [x22, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x8, x22, x9, eq
	//APP
	// atomic64_or
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	orr	x9, x9, 256
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
.LBB70_19:                              //   in Loop: Header=BB70_20 Depth=1
	ldr	x8, [sp, #8]            // 8-byte Folded Reload
	add	w27, w27, #1            // =1
	add	x28, x28, #16           // =16
	ldrh	w8, [x8, #138]
	cmp	w27, w8
	b.hs	.LBB70_6
.LBB70_20:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB70_25 Depth 2
	ldr	x22, [x28]
	ldp	w10, w23, [x28, #8]
	ldrb	w8, [x20, #142]
	ldr	x9, [x22, #32]
	ldr	x11, [x22, #8]
	sub	x12, x11, #1            // =1
	tst	x11, #0x1
	csel	x11, x22, x12, eq
	ldr	x11, [x11]
	tbz	w11, #0, .LBB70_27
// %bb.21:                              //   in Loop: Header=BB70_20 Depth=1
	cbz	w10, .LBB70_17
// %bb.22:                              //   in Loop: Header=BB70_20 Depth=1
	mov	w11, #1
	lsl	w24, w11, w8
	orr	w11, w23, w10
	sub	w12, w24, #1            // =1
	and	w11, w12, w11
	cbnz	w11, .LBB70_17
// %bb.23:                              //   in Loop: Header=BB70_20 Depth=1
	add	w26, w23, w10
	cmp	w26, w23
	b.ls	.LBB70_19
// %bb.24:                              //   in Loop: Header=BB70_20 Depth=1
	mov	w10, #12
	sub	w10, w10, w8
	lsr	x8, x23, x8
	lsl	x9, x9, x10
	add	x25, x9, x8
.LBB70_25:                              //   Parent Loop BB70_20 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x0, x20
	mov	x1, x22
	mov	w2, w24
	mov	w3, w23
	mov	x4, x25
	mov	w5, w21
	bl	fscrypt_encrypt_block_inplace
	cbnz	w0, .LBB70_18
// %bb.26:                              //   in Loop: Header=BB70_25 Depth=2
	add	w23, w23, w24
	add	x25, x25, #1            // =1
	cmp	w23, w26
	b.lo	.LBB70_25
	b	.LBB70_19
.LBB70_27:                              //   in Loop: Header=BB70_20 Depth=1
	//APP
	.pushsection __bug_table,"aw"; .align 2; 14470: .long 14471f - 14470b; .pushsection .rodata.str,"aMS",@progbits,1; 14472: .string "fs/hw_f2fs/data.c"; .popsection; .long 14472b - 14470b; .short 292; .short (1 << 0)|((1 << 1)|((9) << 8)); .popsection; 14471: brk 0x800
	//NO_APP
	b	.LBB70_18
.Lfunc_end70:
	.size	f2fs_post_read_work, .Lfunc_end70-f2fs_post_read_work
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_dio_dm_control_init
	.type	f2fs_dio_dm_control_init,@function
f2fs_dio_dm_control_init:               // @f2fs_dio_dm_control_init
// %bb.0:
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	lsr	x10, x2, #14
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	cmp	x10, #0                 // =0
	ldr	x8, [x0, #40]
	cset	w10, ne
	str	x21, [sp, #32]          // 8-byte Folded Spill
	mov	x21, x0
	mov	w9, #256
	mov	x19, x2
	mov	x20, x1
	add	x29, sp, #16            // =16
	ldr	x0, [x8, #1104]
	lsl	w8, w10, #1
	mov	w10, #1
	str	w9, [x1, #32]
	str	w8, [x1, #4]
	strb	w10, [x1]
	ldr	w9, [x0, #3324]
	cmp	w9, #2                  // =2
	b.hi	.LBB71_2
// %bb.1:
	mov	w8, w9
	str	w9, [x20, #4]
.LBB71_2:
	cmp	w8, #2                  // =2
	b.ne	.LBB71_8
// %bb.3:
	ldr	w8, [x0, #3320]
	cbz	w8, .LBB71_5
// %bb.4:
	str	w8, [x20, #32]
.LBB71_5:
	add	x2, x20, #16            // =16
	mov	w1, wzr
	bl	f2fs_get_static_performance
	ldr	w9, [x20, #32]
	mov	w11, #1
	ldp	w10, w8, [x20, #16]
	strb	w11, [x20, #1]
	mul	w12, w9, w10
	cmp	w10, #0                 // =0
	mul	w9, w8, w9
	cset	w11, eq
	str	w11, [x20, #12]
	stp	w12, w9, [x20, #24]
	cbz	w10, .LBB71_7
// %bb.6:
	cbnz	w8, .LBB71_8
.LBB71_7:
	cmp	w8, #0                  // =0
	cset	w8, ne
	str	w8, [x20, #4]
.LBB71_8:
	adrp	x8, __tracepoint_f2fs_datawrite_start
	add	x8, x8, :lo12:__tracepoint_f2fs_datawrite_start
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB71_10
.Ltmp0:                                 // Block address taken
// %bb.9:
	adrp	x8, f2fs_dio_dm_control_init.trace_printk_fmt
	ldr	x2, [x21, #64]
	ldp	w3, w4, [x20, #16]
	adrp	x0, .Ltmp0
	mov	x7, x19
	ldr	x1, [x8, :lo12:f2fs_dio_dm_control_init.trace_printk_fmt]
	add	x0, x0, :lo12:.Ltmp0
	ldp	w5, w6, [x20, #24]
	ldr	w8, [x20, #4]
	str	w8, [sp]
	bl	__trace_bprintk
.LBB71_10:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x21, [sp, #32]          // 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end71:
	.size	f2fs_dio_dm_control_init, .Lfunc_end71-f2fs_dio_dm_control_init
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_init_dm_info
	.type	f2fs_init_dm_info,@function
f2fs_init_dm_info:                      // @f2fs_init_dm_info
// %bb.0:
	sub	sp, sp, #80             // =80
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	ldr	x8, [x0, #40]
	ldr	x22, [x8, #1104]
	ldr	w19, [x0, #768]
	strh	wzr, [x1]
	ldr	w8, [x22, #3024]
	cmp	w8, #2                  // =2
	b.ne	.LBB72_30
// %bb.1:
	ldr	x8, [x22, #16]
	ldrb	w8, [x8, #2182]
	tbz	w8, #0, .LBB72_30
// %bb.2:
	add	x23, x1, #36            // =36
	mov	x20, x1
	mov	x21, x0
	mov	x24, x2
	mov	x0, x23
	mov	w1, wzr
	mov	w2, #16
	bl	memset
	ldr	w0, [x22, #3328]
	bl	dm_wb_over_bg_thresh
	tbz	w0, #0, .LBB72_6
// %bb.3:
	mov	x0, x22
	mov	w1, wzr
	bl	get_device_main_seg
	ldr	x9, [x22, #3032]
	mov	w8, #34079
	add	w10, w0, w0, lsl #2
	movk	w8, #20971, lsl #16
	lsl	w10, w10, #1
	umull	x10, w10, w8
	ldr	w11, [x9, #168]
	lsr	x10, x10, #37
	cmp	w11, w10
	b.ls	.LBB72_6
// %bb.4:
	ldr	w10, [x22, #1188]
	ldr	w9, [x9, #184]
	mul	w10, w10, w0
	lsl	w11, w10, #4
	sub	w9, w10, w9
	sub	w11, w11, w10
	umull	x8, w11, w8
	lsr	x8, x8, #37
	cmp	w9, w8
	b.ls	.LBB72_6
// %bb.5:
	mov	w8, #2
	b	.LBB72_16
.LBB72_6:
	ldrb	w8, [x24, #36]
	tbnz	w8, #3, .LBB72_14
// %bb.7:
	ldr	w8, [x24, #32]
	cmp	w8, #1                  // =1
	b.ne	.LBB72_15
// %bb.8:
	bl	__rcu_read_lock
	bl	kthread_blkcg
	cbnz	x0, .LBB72_10
// %bb.9:
	//APP
	mrs x8, sp_el0
	//NO_APP
	ldr	x8, [x8, #2688]
	ldr	x0, [x8, #32]
.LBB72_10:
	cbz	x0, .LBB72_17
// %bb.11:
	adrp	x8, blkcg_root
	add	x8, x8, :lo12:blkcg_root
	cmp	x0, x8
	b.eq	.LBB72_17
// %bb.12:
	ldr	w24, [x0, #392]
	bl	__rcu_read_unlock
	add	x9, x20, #4             // =4
	cmp	w24, #1                 // =1
	b.hi	.LBB72_18
// %bb.13:
	mov	w10, #1
	mov	w8, wzr
	str	wzr, [x9]
	str	w10, [x23]
	b	.LBB72_19
.LBB72_14:
	mov	w8, wzr
	str	wzr, [x20, #4]
	str	wzr, [x20, #36]
	b	.LBB72_19
.LBB72_15:
	ldr	w8, [x21, #1332]
.LBB72_16:
	mov	w9, #3
	str	w8, [x20, #4]
	str	w9, [x20, #36]
	b	.LBB72_19
.LBB72_17:
	bl	__rcu_read_unlock
	add	x9, x20, #4             // =4
.LBB72_18:
	mov	w8, #2
	str	w8, [x9]
	str	w8, [x23]
.LBB72_19:
	ldr	w9, [x21, #1328]
	cmp	w9, #5                  // =5
	b.ne	.LBB72_21
// %bb.20:
	mov	w8, wzr
	mov	w9, #3
	str	wzr, [x20, #4]
	str	w9, [x20, #36]
.LBB72_21:
	str	w19, [x20, #40]
	ldr	w9, [x22, #3324]
	cmp	w9, #2                  // =2
	b.hi	.LBB72_23
// %bb.22:
	mov	w8, w9
	str	w9, [x20, #4]
.LBB72_23:
	mov	w9, #1
	cmp	w8, #2                  // =2
	strb	w9, [x20]
	b.ne	.LBB72_28
// %bb.24:
	cmp	w19, #512               // =512
	mov	w8, #8
	mov	w9, #256
	csel	w8, w9, w8, gt
	str	w8, [x20, #32]
	ldr	w9, [x22, #3320]
	cmp	w9, #0                  // =0
	csel	w8, w8, w9, eq
	str	w8, [x20, #32]
	ldr	x8, [x21, #712]
	tbnz	x8, #39, .LBB72_26
// %bb.25:
	mov	w8, #1
	add	x3, x20, #16            // =16
	mov	x0, x22
	mov	w1, wzr
	mov	w2, w19
	strb	w8, [x20, #8]
	bl	f2fs_get_dyn_performance
	ldr	w8, [x20, #48]
	add	w8, w8, #1              // =1
	str	w8, [x20, #48]
	b	.LBB72_27
.LBB72_26:
	add	x2, x20, #16            // =16
	mov	x0, x22
	mov	w1, wzr
	strb	wzr, [x20, #8]
	bl	f2fs_get_static_performance
	ldr	w8, [x20, #44]
	add	w8, w8, #1              // =1
	str	w8, [x20, #44]
.LBB72_27:
	ldr	w8, [x20, #32]
	mov	w11, #1
	ldp	w9, w10, [x20, #16]
	strb	w11, [x20, #1]
	mul	w9, w8, w9
	mul	w8, w10, w8
	cmp	w9, #0                  // =0
	cset	w10, eq
	stp	w9, w8, [x20, #24]
	str	w10, [x20, #12]
.LBB72_28:
	adrp	x8, __tracepoint_f2fs_datawrite_start
	add	x8, x8, :lo12:__tracepoint_f2fs_datawrite_start
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB72_30
.Ltmp1:                                 // Block address taken
// %bb.29:
	adrp	x8, f2fs_init_dm_info.trace_printk_fmt
	ldr	x2, [x21, #64]
	ldp	w3, w4, [x20, #16]
	adrp	x0, .Ltmp1
	ldr	x1, [x8, :lo12:f2fs_init_dm_info.trace_printk_fmt]
	add	x0, x0, :lo12:.Ltmp1
	ldp	w5, w6, [x20, #24]
	ldrb	w7, [x20, #8]
	ldr	w8, [x20, #4]
	str	w19, [sp]
	str	w8, [sp, #8]
	bl	__trace_bprintk
.LBB72_30:
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #80             // =80
	ret
.Lfunc_end72:
	.size	f2fs_init_dm_info, .Lfunc_end72-f2fs_init_dm_info
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_update_dm_info
	.type	f2fs_update_dm_info,@function
f2fs_update_dm_info:                    // @f2fs_update_dm_info
// %bb.0:
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	str	x21, [sp, #32]          // 8-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x20, x2
	ldr	w8, [x2, #12]
	ldr	w19, [x0, #768]
	ldr	x9, [x1]
	tbz	w9, #13, .LBB73_3
// %bb.1:
	ldr	x9, [x1, #40]
	tbz	w9, #0, .LBB73_3
// %bb.2:
	ldr	x9, [x1, #40]
	tbnz	w9, #6, .LBB73_14
.LBB73_3:
	ldr	x9, [x1]
	tbz	w9, #13, .LBB73_6
// %bb.4:
	ldr	x9, [x1, #40]
	tbz	w9, #0, .LBB73_6
// %bb.5:
	ldr	x9, [x1, #40]
	sxtb	w9, w9
	tbnz	w9, #31, .LBB73_17
.LBB73_6:
	ldrb	w9, [x20, #1]
	cbz	w9, .LBB73_24
// %bb.7:
	add	x9, x20, x8, lsl #2
	ldr	w10, [x9, #24]!
	cbz	w10, .LBB73_9
// %bb.8:
	subs	w10, w10, #1            // =1
	str	w10, [x9]
	b.ne	.LBB73_10
.LBB73_9:
	cmp	w8, #0                  // =0
	cset	w8, eq
	str	w8, [x20, #12]
.LBB73_10:
	ldr	w8, [x20, #24]
	cbnz	w8, .LBB73_24
// %bb.11:
	ldr	w8, [x20, #28]
	cbnz	w8, .LBB73_24
// %bb.12:
	ldr	x8, [x21, #40]
	add	x3, x20, #16            // =16
	ldrb	w9, [x20, #8]
	mov	w1, wzr
	ldr	x0, [x8, #1104]
	cbz	w9, .LBB73_21
// %bb.13:
	mov	w2, w19
	bl	f2fs_get_dyn_performance
	b	.LBB73_22
.LBB73_14:
	add	x8, x1, #40             // =40
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 64
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x1, #40]
	cmp	x8, #1                  // =1
	b.ne	.LBB73_24
// %bb.15:
	str	xzr, [x1, #40]
	ldr	x8, [x1]
	tbz	w8, #13, .LBB73_24
// %bb.16:
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x1]
1:	ldxr	x8, [x1]
	bic	x8, x8, 8192
	stxr	w9, x8, [x1]
	cbnz	w9, 1b
	//NO_APP
	ldr	x8, [x1, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x1, x9, eq
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
	cbnz	w9, .LBB73_24
	b	.LBB73_20
.LBB73_17:
	add	x8, x1, #40             // =40
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x8]
1:	ldxr	x9, [x8]
	bic	x9, x9, 128
	stxr	w10, x9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x1, #40]
	cmp	x8, #1                  // =1
	b.ne	.LBB73_24
// %bb.18:
	str	xzr, [x1, #40]
	ldr	x8, [x1]
	tbz	w8, #13, .LBB73_24
// %bb.19:
	//APP
	// atomic64_andnot
	prfm	pstl1strm, [x1]
1:	ldxr	x8, [x1]
	bic	x8, x8, 8192
	stxr	w9, x8, [x1]
	cbnz	w9, 1b
	//NO_APP
	ldr	x8, [x1, #8]
	sub	x9, x8, #1              // =1
	tst	x8, #0x1
	csel	x0, x1, x9, eq
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
	cbnz	w9, .LBB73_24
.LBB73_20:
	bl	__put_page
	b	.LBB73_24
.LBB73_21:
	mov	x2, x3
	bl	f2fs_get_static_performance
.LBB73_22:
	ldr	w8, [x20, #32]
	ldp	w3, w4, [x20, #16]
	mul	w5, w8, w3
	mul	w6, w4, w8
	cmp	w5, #0                  // =0
	cset	w8, eq
	stp	w5, w6, [x20, #24]
	str	w8, [x20, #12]
	adrp	x8, __tracepoint_f2fs_datawrite_start
	add	x8, x8, :lo12:__tracepoint_f2fs_datawrite_start
	ldr	w8, [x8, #8]
	cmp	w8, #1                  // =1
	b.lt	.LBB73_24
.Ltmp2:                                 // Block address taken
// %bb.23:
	adrp	x8, f2fs_update_dm_info.trace_printk_fmt
	ldr	x2, [x21, #64]
	ldrb	w7, [x20, #8]
	adrp	x0, .Ltmp2
	add	x0, x0, :lo12:.Ltmp2
	str	w19, [sp]
	ldr	x1, [x8, :lo12:f2fs_update_dm_info.trace_printk_fmt]
	bl	__trace_bprintk
.LBB73_24:
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x21, [sp, #32]          // 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end73:
	.size	f2fs_update_dm_info, .Lfunc_end73-f2fs_update_dm_info
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_write_failed
	.type	f2fs_write_failed,@function
f2fs_write_failed:                      // @f2fs_write_failed
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x29, sp
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	ldr	x19, [x0]
	ldr	x20, [x19, #80]
	ldr	w8, [x19, #12]
	cmp	x20, x1
	and	w8, w8, #0x20
	ccmp	w8, #0, #0, lt
	b.ne	.LBB74_3
// %bb.1:
	ldr	x8, [x19, #712]
	tbnz	w8, #30, .LBB74_3
// %bb.2:
	add	x21, x19, #1016         // =1016
	mov	x0, x21
	bl	down_write
	add	x22, x19, #1064         // =1064
	mov	x0, x22
	bl	down_write
	mov	x0, x19
	mov	x1, x20
	bl	truncate_pagecache
	mov	x0, x19
	mov	x1, x20
	mov	w2, #1
	bl	f2fs_truncate_blocks
	mov	x0, x22
	bl	up_write
	mov	x0, x21
	bl	up_write
.LBB74_3:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end74:
	.size	f2fs_write_failed, .Lfunc_end74-f2fs_write_failed
                                        // -- End function
	.p2align	3               // -- Begin function get_data_block_dio_write
	.type	get_data_block_dio_write,@function
get_data_block_dio_write:               // @get_data_block_dio_write
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	ldrb	w0, [x0, #143]
	mov	w19, w3
	mov	x20, x2
	mov	x22, x1
	bl	f2fs_rw_hint_to_seg_type
	mov	w4, w0
	mov	x0, x21
	mov	x1, x22
	mov	x2, x20
	mov	w3, w19
	mov	w5, #1
	bl	__get_data_block
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end75:
	.size	get_data_block_dio_write, .Lfunc_end75-get_data_block_dio_write
                                        // -- End function
	.p2align	3               // -- Begin function get_data_block_dio
	.type	get_data_block_dio,@function
get_data_block_dio:                     // @get_data_block_dio
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x21, x0
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	x29, sp
	ldrb	w0, [x0, #143]
	mov	w19, w3
	mov	x20, x2
	mov	x22, x1
	bl	f2fs_rw_hint_to_seg_type
	mov	w4, w0
	mov	x0, x21
	mov	x1, x22
	mov	x2, x20
	mov	w3, w19
	mov	w5, wzr
	bl	__get_data_block
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end76:
	.size	get_data_block_dio, .Lfunc_end76-get_data_block_dio
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_dio_submit_bio
	.type	f2fs_dio_submit_bio,@function
f2fs_dio_submit_bio:                    // @f2fs_dio_submit_bio
// %bb.0:
	stp	x29, x30, [sp, #-48]!   // 16-byte Folded Spill
	adrp	x8, kmalloc_caches
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	add	x8, x8, :lo12:kmalloc_caches
	mov	x19, x0
	mov	x20, x1
	mov	w1, #32832
	str	x21, [sp, #16]          // 8-byte Folded Spill
	movk	w1, #96, lsl #16
	ldr	x0, [x8, #48]
	mov	w2, #32
	ldrb	w21, [x19, #16]
	mov	x29, sp
	bl	kmem_cache_alloc_trace
	cbz	x0, .LBB77_2
// %bb.1:
	ldp	x8, x9, [x19, #72]
	adrp	x10, f2fs_dio_end_io
	cmp	w21, #1                 // =1
	add	x10, x10, :lo12:f2fs_dio_end_io
	stp	x10, x0, [x19, #72]
	stp	x9, x8, [x0, #8]
	cset	w8, eq
	ldr	x10, [x20, #40]
	mov	w9, #52
	str	x20, [x0]
	strb	w8, [x0, #24]
	mov	x0, x19
	ldr	x8, [x10, #1104]
	mov	w10, #48
	csel	x9, x10, x9, eq
	add	x8, x8, x9
	add	x8, x8, #1272           // =1272
	//APP
	// atomic_add
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	add	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	bl	submit_bio
	b	.LBB77_3
.LBB77_2:
	mov	w8, #10
	mov	x0, x19
	strb	w8, [x19, #26]
	bl	bio_endio
.LBB77_3:
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x21, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end77:
	.size	f2fs_dio_submit_bio, .Lfunc_end77-f2fs_dio_submit_bio
                                        // -- End function
	.p2align	3               // -- Begin function __get_data_block
	.type	__get_data_block,@function
__get_data_block:                       // @__get_data_block
// %bb.0:
	sub	sp, sp, #96             // =96
	adrp	x8, __stack_chk_guard
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	x19, x2
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	mov	w2, w3
	mov	w3, #3
	mov	x20, x0
	stur	x8, [x29, #-8]
	ldr	x9, [x19, #32]
	ldrb	w10, [x0, #142]
	ldr	x8, [x0, #40]
	stp	xzr, xzr, [sp, #16]
	str	w4, [sp, #32]
	lsr	x9, x9, x10
	ldr	x22, [x8, #1104]
	and	w8, w5, #0x1
	stp	w1, w9, [sp, #4]
	mov	x1, sp
	strb	w8, [sp, #36]
	bl	f2fs_map_blocks
	mov	w21, w0
	cbnz	w0, .LBB78_15
// %bb.1:
	ldr	x9, [x20, #40]
	ldr	w8, [sp]
	ldr	x10, [x19]
	tbnz	w10, #5, .LBB78_3
// %bb.2:
	//APP
	// atomic64_or
	prfm	pstl1strm, [x19]
1:	ldxr	x10, [x19]
	orr	x10, x10, 32
	stxr	w11, x10, [x19]
	cbnz	w11, 1b
	//NO_APP
.LBB78_3:
	ldr	x10, [x9, #248]
	str	x8, [x19, #24]
	str	x10, [x19, #48]
	ldr	x9, [x9, #24]
	str	x9, [x19, #32]
	ldr	w9, [x22, #3024]
	cbz	w9, .LBB78_14
// %bb.4:
	ldr	w2, [sp]
	cmp	w9, #2                  // =2
	b.lt	.LBB78_11
// %bb.5:
	ldr	x10, [x22, #3032]
	mov	x11, xzr
	mov	x12, xzr
	mov	x14, #4294967296
	add	x13, x10, #80           // =80
	b	.LBB78_7
.LBB78_6:                               //   in Loop: Header=BB78_7 Depth=1
	add	x12, x12, #1            // =1
	add	x11, x11, x14
	add	x13, x13, #192          // =192
	cmp	x12, x9
	b.eq	.LBB78_11
.LBB78_7:                               // =>This Inner Loop Header: Depth=1
	ldur	w15, [x13, #-4]
	cmp	w15, w2
	b.hi	.LBB78_6
// %bb.8:                               //   in Loop: Header=BB78_7 Depth=1
	ldr	w15, [x13]
	cmp	w15, w2
	b.lo	.LBB78_6
// %bb.9:
	cbz	w12, .LBB78_11
// %bb.10:
	asr	x9, x11, #32
	add	x11, x9, x11, asr #31
	lsl	x11, x11, #6
	ldr	x10, [x10, x11]
	str	x10, [x19, #48]
	ldr	x10, [x22, #3032]
	add	x10, x10, x11
	ldr	w10, [x10, #76]
	sub	x8, x8, x10
	str	x8, [x19, #24]
	b	.LBB78_12
.LBB78_11:
	mov	x9, xzr
.LBB78_12:
	mov	w8, #192
	ldr	x10, [x22, #3032]
	mul	x8, x9, x8
	ldr	x8, [x10, x8]
	cbz	x8, .LBB78_14
// %bb.13:
	ldr	w1, [x20, #64]
	mov	x0, x22
	bl	f2fs_update_device_state
.LBB78_14:
	ldr	x8, [x19]
	mov	x10, #-4193
	and	x8, x8, x10
	ldp	w10, w9, [sp, #8]
	orr	x8, x8, x9
	str	x8, [x19]
	ldrb	w8, [x20, #142]
	lsl	x8, x10, x8
	str	x8, [x19, #32]
.LBB78_15:
	adrp	x9, __stack_chk_guard
	ldur	x8, [x29, #-8]
	ldr	x9, [x9, :lo12:__stack_chk_guard]
	cmp	x9, x8
	b.ne	.LBB78_17
// %bb.16:
	mov	w0, w21
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #96             // =96
	ret
.LBB78_17:
	bl	__stack_chk_fail
.Lfunc_end78:
	.size	__get_data_block, .Lfunc_end78-__get_data_block
                                        // -- End function
	.p2align	3               // -- Begin function f2fs_dio_end_io
	.type	f2fs_dio_end_io,@function
f2fs_dio_end_io:                        // @f2fs_dio_end_io
// %bb.0:
	stp	x29, x30, [sp, #-32]!   // 16-byte Folded Spill
	str	x19, [sp, #16]          // 8-byte Folded Spill
	mov	x19, x0
	ldr	x0, [x0, #80]
	mov	w8, #48
	mov	x29, sp
	ldr	x9, [x0]
	ldrb	w10, [x0, #24]
	ldr	x9, [x9, #40]
	cmp	w10, #0                 // =0
	mov	w10, #52
	csel	x8, x10, x8, eq
	ldr	x9, [x9, #1104]
	add	x8, x9, x8
	add	x8, x8, #1272           // =1272
	//APP
	// atomic_sub
	prfm	pstl1strm, [x8]
1:	ldxr	w9, [x8]
	sub	w9, w9, 1
	stxr	w10, w9, [x8]
	cbnz	w10, 1b
	//NO_APP
	ldr	x8, [x0, #8]
	str	x8, [x19, #80]
	ldr	x8, [x0, #16]
	str	x8, [x19, #72]
	bl	kfree
	mov	x0, x19
	bl	bio_endio
	ldr	x19, [sp, #16]          // 8-byte Folded Reload
	ldp	x29, x30, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end79:
	.size	f2fs_dio_end_io, .Lfunc_end79-f2fs_dio_end_io
                                        // -- End function
	.type	f2fs_bioset,@object     // @f2fs_bioset
	.local	f2fs_bioset
	.comm	f2fs_bioset,272,8
	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"F2FS bug: %s:%d\n"
	.size	.L.str, 17

	.type	.L__func__.f2fs_submit_page_write,@object // @__func__.f2fs_submit_page_write
.L__func__.f2fs_submit_page_write:
	.asciz	"f2fs_submit_page_write"
	.size	.L__func__.f2fs_submit_page_write, 23

	.type	.L__func__.f2fs_get_new_data_page,@object // @__func__.f2fs_get_new_data_page
.L__func__.f2fs_get_new_data_page:
	.asciz	"f2fs_get_new_data_page"
	.size	.L__func__.f2fs_get_new_data_page, 23

	.type	.L.str.1,@object        // @.str.1
.L.str.1:
	.asciz	"\0013inode[%d] dedup addr error"
	.size	.L.str.1, 29

	.type	.L__func__.f2fs_map_blocks,@object // @__func__.f2fs_map_blocks
.L__func__.f2fs_map_blocks:
	.asciz	"f2fs_map_blocks"
	.size	.L__func__.f2fs_map_blocks, 16

	.type	.L.str.2,@object        // @.str.2
.L.str.2:
	.asciz	"\0014------------[ cut here ]------------\n"
	.size	.L.str.2, 40

	.type	.L__func__.f2fs_read_multi_pages,@object // @__func__.f2fs_read_multi_pages
.L__func__.f2fs_read_multi_pages:
	.asciz	"f2fs_read_multi_pages"
	.size	.L__func__.f2fs_read_multi_pages, 22

	.type	.L.str.4,@object        // @.str.4
.L.str.4:
	.asciz	"\0013device number %d or %d is invalid"
	.size	.L.str.4, 36

	.type	.L__func__.f2fs_dev_has_enough_space,@object // @__func__.f2fs_dev_has_enough_space
.L__func__.f2fs_dev_has_enough_space:
	.asciz	"f2fs_dev_has_enough_space"
	.size	.L__func__.f2fs_dev_has_enough_space, 26

	.type	f2fs_dblock_aops,@object // @f2fs_dblock_aops
	.section	.rodata,"a",@progbits
	.globl	f2fs_dblock_aops
	.p2align	3
f2fs_dblock_aops:
	.xword	f2fs_write_data_page
	.xword	f2fs_read_data_page
	.xword	f2fs_write_data_pages
	.xword	f2fs_set_data_page_dirty
	.xword	f2fs_read_data_pages
	.xword	f2fs_write_begin
	.xword	f2fs_write_end
	.xword	f2fs_bmap
	.xword	f2fs_invalidate_page
	.xword	f2fs_release_page
	.xword	0
	.xword	f2fs_direct_IO
	.xword	f2fs_migrate_page
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	f2fs_swap_activate
	.xword	f2fs_swap_deactivate
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.xword	0                       // 0x0
	.size	f2fs_dblock_aops, 200

	.type	.L.str.5,@object        // @.str.5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5:
	.asciz	"f2fs_bio_post_read_ctx"
	.size	.L.str.5, 23

	.type	bio_post_read_ctx_cache,@object // @bio_post_read_ctx_cache
	.local	bio_post_read_ctx_cache
	.comm	bio_post_read_ctx_cache,8,8
	.type	bio_post_read_ctx_pool,@object // @bio_post_read_ctx_pool
	.local	bio_post_read_ctx_pool
	.comm	bio_post_read_ctx_pool,8,8
	.type	.L.str.6,@object        // @.str.6
.L.str.6:
	.asciz	"f2fs_post_read_wq"
	.size	.L.str.6, 18

	.type	.L.str.7,@object        // @.str.7
.L.str.7:
	.asciz	"f2fs_bio_entry_slab"
	.size	.L.str.7, 20

	.type	bio_entry_slab,@object  // @bio_entry_slab
	.local	bio_entry_slab
	.comm	bio_entry_slab,8,8
	.type	.L__func__.__submit_bio,@object // @__func__.__submit_bio
.L__func__.__submit_bio:
	.asciz	"__submit_bio"
	.size	.L__func__.__submit_bio, 13

	.type	.L.str.8,@object        // @.str.8
.L.str.8:
	.asciz	"\0013%s: read IO fault[%d]\n"
	.size	.L.str.8, 25

	.type	.L__func__.f2fs_finish_read_bio,@object // @__func__.f2fs_finish_read_bio
.L__func__.f2fs_finish_read_bio:
	.asciz	"f2fs_finish_read_bio"
	.size	.L__func__.f2fs_finish_read_bio, 21

	.type	.L.str.9,@object        // @.str.9
.L.str.9:
	.asciz	"%s: read IO fault[%d]\n"
	.size	.L.str.9, 23

	.type	.L__func__.f2fs_write_end_io,@object // @__func__.f2fs_write_end_io
.L__func__.f2fs_write_end_io:
	.asciz	"f2fs_write_end_io"
	.size	.L__func__.f2fs_write_end_io, 18

	.type	.L.str.10,@object       // @.str.10
.L.str.10:
	.asciz	"\0013f2fs reboot for bio submit error! erro_num = %d"
	.size	.L.str.10, 50

	.type	.L.str.11,@object       // @.str.11
.L.str.11:
	.asciz	"F2FS reboot: %s:%d [%d]\n"
	.size	.L.str.11, 25

	.type	.L.str.12,@object       // @.str.12
.L.str.12:
	.asciz	"\0013F2FS-fs: %s: invalid nid %u seg type %d expect NODE blk %#x\n"
	.size	.L.str.12, 63

	.type	.L.str.13,@object       // @.str.13
.L.str.13:
	.asciz	"\0013F2FS-fs: %s: invalid seg type %d expect DATA blk %#x\n"
	.size	.L.str.13, 56

	.type	.L.str.14,@object       // @.str.14
.L.str.14:
	.asciz	"ERROR"
	.size	.L.str.14, 6

	.type	.L__func__.add_bio_entry,@object // @__func__.add_bio_entry
.L__func__.add_bio_entry:
	.asciz	"add_bio_entry"
	.size	.L__func__.add_bio_entry, 14

	.type	.L__func__.add_ipu_page,@object // @__func__.add_ipu_page
.L__func__.add_ipu_page:
	.asciz	"add_ipu_page"
	.size	.L__func__.add_ipu_page, 13

	.type	.L.str.15,@object       // @.str.15
.L.str.15:
	.asciz	"\0013invalid blkaddr: %u, type: %d, run fsck to fix."
	.size	.L.str.15, 50

	.type	.L__func__.verify_blkaddr,@object // @__func__.verify_blkaddr
.L__func__.verify_blkaddr:
	.asciz	"verify_blkaddr"
	.size	.L__func__.verify_blkaddr, 15

	.type	.L__func__.f2fs_put_page,@object // @__func__.f2fs_put_page
.L__func__.f2fs_put_page:
	.asciz	"f2fs_put_page"
	.size	.L__func__.f2fs_put_page, 14

	.type	f2fs_dio_dm_control_init.trace_printk_fmt,@object // @f2fs_dio_dm_control_init.trace_printk_fmt
	.section	__trace_printk_fmt,"aw",@progbits
	.p2align	3
f2fs_dio_dm_control_init.trace_printk_fmt:
	.xword	.L.str.16
	.size	f2fs_dio_dm_control_init.trace_printk_fmt, 8

	.type	.L.str.16,@object       // @.str.16
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.16:
	.asciz	"ino %lu dio split ratio:%u:%u, submitted: %u:%u, count:%d, hint:%u\n"
	.size	.L.str.16, 68

	.type	f2fs_dio_dm_control_init.trace_printk_fmt.17,@object // @f2fs_dio_dm_control_init.trace_printk_fmt.17
	.section	__trace_printk_fmt,"aw",@progbits
	.p2align	3
f2fs_dio_dm_control_init.trace_printk_fmt.17:
	.xword	.L.str.16
	.size	f2fs_dio_dm_control_init.trace_printk_fmt.17, 8

	.type	.L.str.18,@object       // @.str.18
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.18:
	.asciz	"\0013cp_rwsem_timeout: start: %lu now: %lu\n"
	.size	.L.str.18, 41

	.type	.L__func__.put_inner_inode,@object // @__func__.put_inner_inode
.L__func__.put_inner_inode:
	.asciz	"put_inner_inode"
	.size	.L__func__.put_inner_inode, 16

	.type	.L.str.19,@object       // @.str.19
.L.str.19:
	.asciz	"\0013F2FS-fs: inode [%lu] inflight_read_io refcount may leak"
	.size	.L.str.19, 58

	.type	.L.str.20,@object       // @.str.20
.L.str.20:
	.asciz	"\0014%s, potential error with diff:%d, i_compr_blocks:%d, i_ino:%lu"
	.size	.L.str.20, 65

	.type	.L__func__.f2fs_i_compr_blocks_update,@object // @__func__.f2fs_i_compr_blocks_update
.L__func__.f2fs_i_compr_blocks_update:
	.asciz	"f2fs_i_compr_blocks_update"
	.size	.L__func__.f2fs_i_compr_blocks_update, 27

	.type	f2fs_init_dm_info.trace_printk_fmt,@object // @f2fs_init_dm_info.trace_printk_fmt
	.section	__trace_printk_fmt,"aw",@progbits
	.p2align	3
f2fs_init_dm_info.trace_printk_fmt:
	.xword	.L.str.21
	.size	f2fs_init_dm_info.trace_printk_fmt, 8

	.type	.L.str.21,@object       // @.str.21
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.21:
	.asciz	"ino %lu split ratio:%u:%u, submitted: %u:%u, dynamic:%u dirty_pages: %d hint: %u\n"
	.size	.L.str.21, 82

	.type	f2fs_init_dm_info.trace_printk_fmt.22,@object // @f2fs_init_dm_info.trace_printk_fmt.22
	.section	__trace_printk_fmt,"aw",@progbits
	.p2align	3
f2fs_init_dm_info.trace_printk_fmt.22:
	.xword	.L.str.21
	.size	f2fs_init_dm_info.trace_printk_fmt.22, 8

	.type	f2fs_update_dm_info.trace_printk_fmt,@object // @f2fs_update_dm_info.trace_printk_fmt
	.p2align	3
f2fs_update_dm_info.trace_printk_fmt:
	.xword	.L.str.23
	.size	f2fs_update_dm_info.trace_printk_fmt, 8

	.type	.L.str.23,@object       // @.str.23
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.23:
	.asciz	"ino %lu update ratio:%u:%u, submitted: %u:%u, dynamic:%u, dirty_pages:%d\n"
	.size	.L.str.23, 74

	.type	f2fs_update_dm_info.trace_printk_fmt.24,@object // @f2fs_update_dm_info.trace_printk_fmt.24
	.section	__trace_printk_fmt,"aw",@progbits
	.p2align	3
f2fs_update_dm_info.trace_printk_fmt.24:
	.xword	.L.str.23
	.size	f2fs_update_dm_info.trace_printk_fmt.24, 8

	.type	.L.str.25,@object       // @.str.25
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.25:
	.asciz	"\0013Swapfile not supported in LFS mode"
	.size	.L.str.25, 37

	.type	.L.str.26,@object       // @.str.26
.L.str.26:
	.asciz	"\0013Swapfile not supported in dedup mode"
	.size	.L.str.26, 39

	.type	.L.str.27,@object       // @.str.27
.L.str.27:
	.asciz	"\0013Swapfile has holes"
	.size	.L.str.27, 21

	.type	.L.str.28,@object       // @.str.28
.L.str.28:
	.asciz	"\0014Swapfile: last extent is not aligned to section"
	.size	.L.str.28, 50

	.type	.L.str.29,@object       // @.str.29
.L.str.29:
	.asciz	"\0014Swapfile (%u) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(%u * N)"
	.size	.L.str.29, 107

	.ident	"Snapdragon LLVM ARM Compiler 10.0.7 for Android NDK"
	.section	".note.GNU-stack","",@progbits
