	.text
	.file	"fib.ll"
	.hidden	fib
	.globl	fib
	.type	fib,@function
fib:                                    # @fib
	.param  	i32
	.result 	i32
	.local  	i32
# BB#0:
	i32.const	$push13=, 0
	i32.const	$push10=, 0
	i32.load	$push11=, __stack_pointer($pop10)
	i32.const	$push12=, 16
	i32.sub 	$push19=, $pop11, $pop12
	tee_local	$push18=, $1=, $pop19
	i32.store	__stack_pointer($pop13), $pop18
	i32.store	8($1), $0
	block   	
	block   	
	i32.const	$push17=, 1
	i32.gt_s	$push0=, $0, $pop17
	br_if   	0, $pop0        # 0: down to label1
# BB#1:
	i32.const	$push20=, 1
	i32.store	12($1), $pop20
	br      	1               # 1: down to label0
.LBB0_2:
	end_block                       # label1:
	i32.load	$push2=, 8($1)
	i32.const	$push1=, -1
	i32.add 	$push3=, $pop2, $pop1
	i32.call	$push4=, fib@FUNCTION, $pop3
	i32.load	$push6=, 8($1)
	i32.const	$push5=, -2
	i32.add 	$push7=, $pop6, $pop5
	i32.call	$push8=, fib@FUNCTION, $pop7
	i32.add 	$push9=, $pop4, $pop8
	i32.store	12($1), $pop9
.LBB0_3:
	end_block                       # label0:
	i32.load	$0=, 12($1)
	i32.const	$push16=, 0
	i32.const	$push14=, 16
	i32.add 	$push15=, $1, $pop14
	i32.store	__stack_pointer($pop16), $pop15
	copy_local	$push21=, $0
                                        # fallthrough-return: $pop21
	.endfunc
.Lfunc_end0:
	.size	fib, .Lfunc_end0-fib

	.hidden	fib_memo
	.globl	fib_memo
	.type	fib_memo,@function
fib_memo:                               # @fib_memo
	.param  	i32
	.result 	i32
	.local  	i32, i32, i32
# BB#0:
	i32.const	$push24=, 0
	i32.load	$push25=, __stack_pointer($pop24)
	i32.const	$push26=, 32
	i32.sub 	$push31=, $pop25, $pop26
	tee_local	$push30=, $2=, $pop31
	copy_local	$push29=, $pop30
	tee_local	$push28=, $3=, $pop29
	i32.store	24($pop28), $0
	block   	
	i32.const	$push27=, 1
	i32.gt_s	$push0=, $0, $pop27
	br_if   	0, $pop0        # 0: down to label2
# BB#1:
	i32.const	$push32=, 1
	i32.store	28($3), $pop32
	i32.load	$push22=, 28($3)
	return  	$pop22
.LBB1_2:
	end_block                       # label2:
	i32.load	$0=, 24($3)
	i32.store	16($3), $2
	i32.const	$push36=, 2
	i32.shl 	$push1=, $0, $pop36
	i32.const	$push2=, 15
	i32.add 	$push3=, $pop1, $pop2
	i32.const	$push4=, -16
	i32.and 	$push5=, $pop3, $pop4
	i32.sub 	$push35=, $2, $pop5
	tee_local	$push34=, $1=, $pop35
	copy_local	$drop=, $pop34
	i64.const	$push6=, 4294967297
	i64.store	0($1), $pop6
	i32.const	$push33=, 2
	i32.store	12($3), $pop33
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                # label4:
	i32.load	$push8=, 12($3)
	i32.load	$push7=, 24($3)
	i32.ge_s	$push9=, $pop8, $pop7
	br_if   	1, $pop9        # 1: down to label3
# BB#4:                                 #   in Loop: Header=BB1_3 Depth=1
	i32.load	$push44=, 12($3)
	tee_local	$push43=, $2=, $pop44
	i32.const	$push42=, 2
	i32.shl 	$push15=, $pop43, $pop42
	i32.add 	$push41=, $1, $pop15
	tee_local	$push40=, $0=, $pop41
	i32.const	$push39=, -4
	i32.add 	$push18=, $0, $pop39
	i32.load	$push19=, 0($pop18)
	i32.const	$push38=, -8
	i32.add 	$push16=, $0, $pop38
	i32.load	$push17=, 0($pop16)
	i32.add 	$push20=, $pop19, $pop17
	i32.store	0($pop40), $pop20
	i32.const	$push37=, 1
	i32.add 	$push21=, $2, $pop37
	i32.store	12($3), $pop21
	br      	0               # 0: up to label4
.LBB1_5:
	end_loop
	end_block                       # label3:
	i32.load	$push11=, 24($3)
	i32.const	$push10=, 2
	i32.shl 	$push12=, $pop11, $pop10
	i32.add 	$push13=, $1, $pop12
	i32.load	$push14=, 0($pop13)
	i32.store	28($3), $pop14
	i32.load	$drop=, 16($3)
	i32.load	$push23=, 28($3)
                                        # fallthrough-return: $pop23
	.endfunc
.Lfunc_end1:
	.size	fib_memo, .Lfunc_end1-fib_memo


	.ident	"Apple LLVM version 8.1.0 (clang-802.0.42)"
