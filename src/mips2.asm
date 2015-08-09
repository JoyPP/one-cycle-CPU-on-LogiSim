	ori	$s1,$zero,12	# s0=0 or 12=12
	subu	$sp,$sp,$s1	# sp=sp-s1=sp-12=-12
	sw	$t1,8($sp)	# Memory[sp+8]=Mem[24]=t1=0
	sw	$t0,4($sp)	# Memory[sp+4]=Mem[20]=t0=0
	sw	$s0,0($sp)	# Memory[sp+0]=Mem[16]=s0=0
	ori	$a0,$zero,0	# a0=0	represent g=0
	ori	$a1,$zero,1	# a1=1	represent i=1
	ori	$a2,$zero,2	# a2=2	represent h=2
	ori	$a3,$zero,3	# a3=3	represent j=3
	addu	$t0,$a0,$a2	# t0=a0+a2=2  represent x, containing g+h
	addu	$t1,$a1,$a3	# t1=a1+a3=4  represent y, containing i+j
	beq	$t0,$t1,L1	# if (t0==t1),jump to L1
	addu	$a1,$a1,$a2	# if (t0!=t1),a1=a1+a2=1+2=3
	beq	$zero,$zero,L2	# if (0==0),jump to L2
L1:	ori	$t0,$zero,5	# x=t0=5
L2:	beq	$a1,$a3,L3	# if (a1==a3),jump to L3
	subu	$a3,$a3,$a2	# if (a1!=a3),a3=a3-a2=3-2=1
	beq	$zero,$zero,L4	# if (0==0),jump to L4
L3:	lui	$t1,2		# if (a1==a3),y=t1=2*2^16	
	addu	$s0,$t0,$t1	# s0=t0+t1,which is f=x+y
	subu	$v0,$s0,$zero	# return v0=s0
L4:	lw	$s0,0($sp)	# s0=Memory[sp+8]=0
	lw	$t0,4($sp)	# t0=Memory[sp+4]=0
	lw	$t1,8($sp)	# t1=Memory[sp+0]=0
	addu	$sp,$sp,$s1	# sp=sp+s1=sp+12=0
	
	
	