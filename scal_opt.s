	.file	"add_scalar.cpp"
	.text
	.p2align 4
	.type	_ZL10add_arraysPfS_S_.constprop.0, @function
_ZL10add_arraysPfS_S_.constprop.0:
.LFB2416:
	.cfi_startproc
	xorl	%eax, %eax
	leaq	_ZZ4mainE7array_c(%rip), %rsi
	leaq	_ZZ4mainE7array_b(%rip), %rcx
	leaq	_ZZ4mainE7array_a(%rip), %rdx
	.p2align 4,,10
	.p2align 3
.L2:
	movaps	(%rcx,%rax), %xmm0
	addps	(%rdx,%rax), %xmm0
	movaps	%xmm0, (%rsi,%rax)
	addq	$16, %rax
	cmpq	$268435456, %rax
	jne	.L2
	ret
	.cfi_endproc
.LFE2416:
	.size	_ZL10add_arraysPfS_S_.constprop.0, .-_ZL10add_arraysPfS_S_.constprop.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"O3 "
.LC2:
	.string	"Scalar "
.LC3:
	.string	"execution time: "
.LC4:
	.string	" us\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1877:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1877
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%edi, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	_ZZ4mainE7array_b(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	_ZZ4mainE7array_a(%rip), %rbx
	leaq	268435456(%rbx), %r12
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	.p2align 4,,10
	.p2align 3
.L6:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	addq	$4, %rbx
	addq	$4, %rbp
	cvtsi2ssl	%eax, %xmm0
	movss	%xmm0, -4(%rbx)
	call	rand@PLT
	pxor	%xmm0, %xmm0
	movss	.LC0(%rip), %xmm1
	cvtsi2ssl	%eax, %xmm0
	divss	%xmm0, %xmm1
	movss	%xmm1, -4(%rbp)
	cmpq	%r12, %rbx
	jne	.L6
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %rbx
	call	_ZL10add_arraysPfS_S_.constprop.0
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rsp, %rdi
	movb	$0, 16(%rsp)
	movabsq	$2361183241434822607, %rdx
	subq	%rbx, %rax
	leaq	.LC1(%rip), %rsi
	leaq	16(%rsp), %rbx
	movq	$0, 8(%rsp)
	movq	%rax, %rcx
	imulq	%rdx
	movq	%rbx, (%rsp)
	sarq	$63, %rcx
	sarq	$7, %rdx
	subq	%rcx, %rdx
	movq	%rdx, %rbp
.LEHB0:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6assignEPKc@PLT
	movl	$7, %edx
	leaq	.LC2(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	8(%rsp), %rdx
	movq	(%rsp), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$16, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIlEERSoT_@PLT
	movq	%rax, %rdi
	leaq	.LC4(%rip), %rsi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
.LEHE0:
	movq	(%rsp), %rdi
	cmpq	%rbx, %rdi
	je	.L7
	call	_ZdlPv@PLT
.L7:
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L15
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L11:
	endbr64
	movq	%rax, %rbp
	jmp	.L8
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1877:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1877-.LLSDACSB1877
.LLSDACSB1877:
	.uleb128 .LEHB0-.LFB1877
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L11-.LFB1877
	.uleb128 0
.LLSDACSE1877:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC1877
	.type	main.cold, @function
main.cold:
.LFSB1877:
.L8:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	movq	(%rsp), %rdi
	cmpq	%rbx, %rdi
	je	.L9
	call	_ZdlPv@PLT
.L9:
	movq	%rbp, %rdi
.LEHB1:
	call	_Unwind_Resume@PLT
.LEHE1:
	.cfi_endproc
.LFE1877:
	.section	.gcc_except_table
.LLSDAC1877:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC1877-.LLSDACSBC1877
.LLSDACSBC1877:
	.uleb128 .LEHB1-.LCOLDB5
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSEC1877:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.p2align 4
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2397:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2397:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.local	_ZZ4mainE7array_c
	.comm	_ZZ4mainE7array_c,268435456,32
	.local	_ZZ4mainE7array_b
	.comm	_ZZ4mainE7array_b,268435456,32
	.local	_ZZ4mainE7array_a
	.comm	_ZZ4mainE7array_a,268435456,32
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1065353216
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
