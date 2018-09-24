
RVM:     file format elf32-littlearm


Disassembly of section .text:

08010000 <_RVM_Entry>:
 8010000:	4822      	ldr	r0, [pc, #136]	; (801008c <_RVM_MSB_Get+0x10>)
 8010002:	4923      	ldr	r1, [pc, #140]	; (8010090 <_RVM_MSB_Get+0x14>)
 8010004:	4a23      	ldr	r2, [pc, #140]	; (8010094 <_RVM_MSB_Get+0x18>)

08010006 <load_data>:
 8010006:	4288      	cmp	r0, r1
 8010008:	d006      	beq.n	8010018 <load_done>
 801000a:	6813      	ldr	r3, [r2, #0]
 801000c:	6003      	str	r3, [r0, #0]
 801000e:	f100 0004 	add.w	r0, r0, #4
 8010012:	f102 0204 	add.w	r2, r2, #4
 8010016:	e7f6      	b.n	8010006 <load_data>

08010018 <load_done>:
 8010018:	481f      	ldr	r0, [pc, #124]	; (8010098 <_RVM_MSB_Get+0x1c>)
 801001a:	4920      	ldr	r1, [pc, #128]	; (801009c <_RVM_MSB_Get+0x20>)
 801001c:	2200      	movs	r2, #0

0801001e <clear_bss>:
 801001e:	4288      	cmp	r0, r1
 8010020:	d003      	beq.n	801002a <clear_done>
 8010022:	6002      	str	r2, [r0, #0]
 8010024:	f100 0004 	add.w	r0, r0, #4
 8010028:	e7f9      	b.n	801001e <clear_bss>

0801002a <clear_done>:
 801002a:	481d      	ldr	r0, [pc, #116]	; (80100a0 <_RVM_MSB_Get+0x24>)
 801002c:	4700      	bx	r0

0801002e <_RVM_Jmp_Stub>:
 801002e:	b090      	sub	sp, #64	; 0x40
 8010030:	4628      	mov	r0, r5
 8010032:	47a0      	blx	r4

08010034 <RVM_Inv_Act>:
 8010034:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8010038:	f44f 3480 	mov.w	r4, #65536	; 0x10000
 801003c:	ea44 0400 	orr.w	r4, r4, r0
 8010040:	460d      	mov	r5, r1
 8010042:	df00      	svc	0
 8010044:	f3bf 8f6f 	isb	sy
 8010048:	4620      	mov	r0, r4
 801004a:	2a00      	cmp	r2, #0
 801004c:	bf18      	it	ne
 801004e:	6015      	strne	r5, [r2, #0]
 8010050:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8010054:	4770      	bx	lr

08010056 <RVM_Inv_Ret>:
 8010056:	f04f 0400 	mov.w	r4, #0
 801005a:	4605      	mov	r5, r0
 801005c:	df00      	svc	0
 801005e:	f3bf 8f6f 	isb	sy
 8010062:	e7fe      	b.n	8010062 <RVM_Inv_Ret+0xc>

08010064 <RVM_Svc>:
 8010064:	b4f0      	push	{r4, r5, r6, r7}
 8010066:	4604      	mov	r4, r0
 8010068:	460d      	mov	r5, r1
 801006a:	4616      	mov	r6, r2
 801006c:	461f      	mov	r7, r3
 801006e:	df00      	svc	0
 8010070:	f3bf 8f6f 	isb	sy
 8010074:	4620      	mov	r0, r4
 8010076:	bcf0      	pop	{r4, r5, r6, r7}
 8010078:	4770      	bx	lr
 801007a:	e7fe      	b.n	801007a <RVM_Svc+0x16>

0801007c <_RVM_MSB_Get>:
 801007c:	fab0 f180 	clz	r1, r0
 8010080:	f04f 001f 	mov.w	r0, #31
 8010084:	eba0 0001 	sub.w	r0, r0, r1
 8010088:	4770      	bx	lr
 801008a:	0000      	.short	0x0000
 801008c:	20012000 	.word	0x20012000
 8010090:	20012000 	.word	0x20012000
 8010094:	08014000 	.word	0x08014000
 8010098:	20011000 	.word	0x20011000
 801009c:	2001ea64 	.word	0x2001ea64
 80100a0:	08011601 	.word	0x08011601

080100a4 <RVM_Putchar>:
Output      : None.
Return      : rvm_ptr_t - Always 0.
******************************************************************************/
rvm_ptr_t RVM_Putchar(char Char)
{
    USART1->TDR=Char;
 80100a4:	4b03      	ldr	r3, [pc, #12]	; (80100b4 <RVM_Putchar+0x10>)
    
    while((USART1->ISR&0x40)==0)
 80100a6:	461a      	mov	r2, r3
Output      : None.
Return      : rvm_ptr_t - Always 0.
******************************************************************************/
rvm_ptr_t RVM_Putchar(char Char)
{
    USART1->TDR=Char;
 80100a8:	6298      	str	r0, [r3, #40]	; 0x28
    
    while((USART1->ISR&0x40)==0)
 80100aa:	69d3      	ldr	r3, [r2, #28]
 80100ac:	065b      	lsls	r3, r3, #25
 80100ae:	d5fc      	bpl.n	80100aa <RVM_Putchar+0x6>
    {
        
    }
    return 0;
}
 80100b0:	2000      	movs	r0, #0
 80100b2:	4770      	bx	lr
 80100b4:	40011000 	.word	0x40011000

080100b8 <RVM_Stack_Init>:
******************************************************************************/
rvm_ptr_t RVM_Stack_Init(rvm_ptr_t Stack, rvm_ptr_t Size)
{
    struct RVM_CMX_Ret_Stack* Stack_Ptr;
    
    Stack_Ptr=(struct RVM_CMX_Ret_Stack*)(Stack+Size-RVM_STACK_SAFE_SIZE*sizeof(rvm_ptr_t)-sizeof(struct RVM_CMX_Ret_Stack));
 80100b8:	39e0      	subs	r1, #224	; 0xe0
    Stack_Ptr->R12=0;
 80100ba:	2300      	movs	r3, #0
    Stack_Ptr->LR=0;
    Stack_Ptr->PC=(rvm_ptr_t)_RVM_Jmp_Stub;
    /* Initialize the xPSR to avoid a transition to ARM state */
    Stack_Ptr->XPSR=0x01000200;
 80100bc:	4a05      	ldr	r2, [pc, #20]	; (80100d4 <RVM_Stack_Init+0x1c>)
******************************************************************************/
rvm_ptr_t RVM_Stack_Init(rvm_ptr_t Stack, rvm_ptr_t Size)
{
    struct RVM_CMX_Ret_Stack* Stack_Ptr;
    
    Stack_Ptr=(struct RVM_CMX_Ret_Stack*)(Stack+Size-RVM_STACK_SAFE_SIZE*sizeof(rvm_ptr_t)-sizeof(struct RVM_CMX_Ret_Stack));
 80100be:	4401      	add	r1, r0
              rvm_ptr_t Size  - The size of the stack.
Output      : None.
Return      : rvm_ptr_t - The actual stack address to use for system call.
******************************************************************************/
rvm_ptr_t RVM_Stack_Init(rvm_ptr_t Stack, rvm_ptr_t Size)
{
 80100c0:	b410      	push	{r4}
    struct RVM_CMX_Ret_Stack* Stack_Ptr;
    
    Stack_Ptr=(struct RVM_CMX_Ret_Stack*)(Stack+Size-RVM_STACK_SAFE_SIZE*sizeof(rvm_ptr_t)-sizeof(struct RVM_CMX_Ret_Stack));
    Stack_Ptr->R12=0;
    Stack_Ptr->LR=0;
    Stack_Ptr->PC=(rvm_ptr_t)_RVM_Jmp_Stub;
 80100c2:	4c05      	ldr	r4, [pc, #20]	; (80100d8 <RVM_Stack_Init+0x20>)
    /* Initialize the xPSR to avoid a transition to ARM state */
    Stack_Ptr->XPSR=0x01000200;
    
    return (rvm_ptr_t)Stack_Ptr;
}
 80100c4:	4608      	mov	r0, r1
    Stack_Ptr=(struct RVM_CMX_Ret_Stack*)(Stack+Size-RVM_STACK_SAFE_SIZE*sizeof(rvm_ptr_t)-sizeof(struct RVM_CMX_Ret_Stack));
    Stack_Ptr->R12=0;
    Stack_Ptr->LR=0;
    Stack_Ptr->PC=(rvm_ptr_t)_RVM_Jmp_Stub;
    /* Initialize the xPSR to avoid a transition to ARM state */
    Stack_Ptr->XPSR=0x01000200;
 80100c6:	61ca      	str	r2, [r1, #28]
    struct RVM_CMX_Ret_Stack* Stack_Ptr;
    
    Stack_Ptr=(struct RVM_CMX_Ret_Stack*)(Stack+Size-RVM_STACK_SAFE_SIZE*sizeof(rvm_ptr_t)-sizeof(struct RVM_CMX_Ret_Stack));
    Stack_Ptr->R12=0;
    Stack_Ptr->LR=0;
    Stack_Ptr->PC=(rvm_ptr_t)_RVM_Jmp_Stub;
 80100c8:	618c      	str	r4, [r1, #24]
rvm_ptr_t RVM_Stack_Init(rvm_ptr_t Stack, rvm_ptr_t Size)
{
    struct RVM_CMX_Ret_Stack* Stack_Ptr;
    
    Stack_Ptr=(struct RVM_CMX_Ret_Stack*)(Stack+Size-RVM_STACK_SAFE_SIZE*sizeof(rvm_ptr_t)-sizeof(struct RVM_CMX_Ret_Stack));
    Stack_Ptr->R12=0;
 80100ca:	610b      	str	r3, [r1, #16]
    Stack_Ptr->LR=0;
 80100cc:	614b      	str	r3, [r1, #20]
    Stack_Ptr->PC=(rvm_ptr_t)_RVM_Jmp_Stub;
    /* Initialize the xPSR to avoid a transition to ARM state */
    Stack_Ptr->XPSR=0x01000200;
    
    return (rvm_ptr_t)Stack_Ptr;
}
 80100ce:	f85d 4b04 	ldr.w	r4, [sp], #4
 80100d2:	4770      	bx	lr
 80100d4:	01000200 	.word	0x01000200
 80100d8:	0801002f 	.word	0x0801002f

080100dc <_RVM_Pgtbl_Setup>:
Return      : None.
******************************************************************************/
void _RVM_Pgtbl_Setup(struct RVM_Hdr_Pgtbl* Pgtbl, rvm_ptr_t Pos, 
                      rvm_cid_t Cap_Captbl, rvm_ptr_t* Cap_Bump,
                      rvm_cid_t Cap_Kmem, rvm_ptr_t* Kmem_Bump)
{
 80100dc:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 80100e0:	b085      	sub	sp, #20
 80100e2:	4605      	mov	r5, r0
 80100e4:	4699      	mov	r9, r3
 80100e6:	4610      	mov	r0, r2
 80100e8:	f8dd 8034 	ldr.w	r8, [sp, #52]	; 0x34
    /* Create the page table - 0 is always the top level */
    if(Pos==0)
 80100ec:	460e      	mov	r6, r1
 80100ee:	bb71      	cbnz	r1, 801014e <_RVM_Pgtbl_Setup+0x72>
    {
        RVM_ASSERT(RVM_Pgtbl_Crt(Cap_Captbl, Cap_Kmem, *Cap_Bump, 
 80100f0:	68a9      	ldr	r1, [r5, #8]
 80100f2:	2201      	movs	r2, #1
 80100f4:	f8d8 3000 	ldr.w	r3, [r8]
 80100f8:	b28c      	uxth	r4, r1
 80100fa:	9201      	str	r2, [sp, #4]
 80100fc:	0c09      	lsrs	r1, r1, #16
 80100fe:	f8d9 2000 	ldr.w	r2, [r9]
 8010102:	9403      	str	r4, [sp, #12]
 8010104:	686c      	ldr	r4, [r5, #4]
 8010106:	9102      	str	r1, [sp, #8]
 8010108:	9400      	str	r4, [sp, #0]
 801010a:	990c      	ldr	r1, [sp, #48]	; 0x30
 801010c:	f002 fe6a 	bl	8012de4 <RVM_Pgtbl_Crt>
 8010110:	2800      	cmp	r0, #0
 8010112:	f000 809b 	beq.w	801024c <_RVM_Pgtbl_Setup+0x170>
 8010116:	48c6      	ldr	r0, [pc, #792]	; (8010430 <_RVM_Pgtbl_Setup+0x354>)
 8010118:	f002 fe2a 	bl	8012d70 <RVM_Print_String>
 801011c:	48c5      	ldr	r0, [pc, #788]	; (8010434 <_RVM_Pgtbl_Setup+0x358>)
 801011e:	f002 fe27 	bl	8012d70 <RVM_Print_String>
 8010122:	48c5      	ldr	r0, [pc, #788]	; (8010438 <_RVM_Pgtbl_Setup+0x35c>)
 8010124:	f002 fe24 	bl	8012d70 <RVM_Print_String>
 8010128:	2090      	movs	r0, #144	; 0x90
 801012a:	f002 fd8f 	bl	8012c4c <RVM_Print_Int>
 801012e:	48c3      	ldr	r0, [pc, #780]	; (801043c <_RVM_Pgtbl_Setup+0x360>)
 8010130:	f002 fe1e 	bl	8012d70 <RVM_Print_String>
 8010134:	48c2      	ldr	r0, [pc, #776]	; (8010440 <_RVM_Pgtbl_Setup+0x364>)
 8010136:	f002 fe1b 	bl	8012d70 <RVM_Print_String>
 801013a:	48c2      	ldr	r0, [pc, #776]	; (8010444 <_RVM_Pgtbl_Setup+0x368>)
 801013c:	f002 fe18 	bl	8012d70 <RVM_Print_String>
 8010140:	48c1      	ldr	r0, [pc, #772]	; (8010448 <_RVM_Pgtbl_Setup+0x36c>)
 8010142:	f002 fe15 	bl	8012d70 <RVM_Print_String>
 8010146:	48bd      	ldr	r0, [pc, #756]	; (801043c <_RVM_Pgtbl_Setup+0x360>)
 8010148:	f002 fe12 	bl	8012d70 <RVM_Print_String>
 801014c:	e7fe      	b.n	801014c <_RVM_Pgtbl_Setup+0x70>
        RVM_LOG_SISUS("Init:CortexM:Created top-level page table number ",Pos," @ address ",*Kmem_Bump,".\r\n");
        *Kmem_Bump+=RVM_PGTBL_SIZE_TOP(Pgtbl[Pos].Order);
    }
    else
    {
        RVM_ASSERT(RVM_Pgtbl_Crt(Cap_Captbl, Cap_Kmem, *Cap_Bump, 
 801014e:	eb01 0481 	add.w	r4, r1, r1, lsl #2
 8010152:	2700      	movs	r7, #0
 8010154:	f8d8 3000 	ldr.w	r3, [r8]
 8010158:	eb05 0484 	add.w	r4, r5, r4, lsl #2
 801015c:	f8d9 2000 	ldr.w	r2, [r9]
 8010160:	68a1      	ldr	r1, [r4, #8]
 8010162:	9701      	str	r7, [sp, #4]
 8010164:	fa1f fe81 	uxth.w	lr, r1
 8010168:	6867      	ldr	r7, [r4, #4]
 801016a:	0c09      	lsrs	r1, r1, #16
 801016c:	f8cd e00c 	str.w	lr, [sp, #12]
 8010170:	9102      	str	r1, [sp, #8]
 8010172:	9700      	str	r7, [sp, #0]
 8010174:	990c      	ldr	r1, [sp, #48]	; 0x30
 8010176:	f002 fe35 	bl	8012de4 <RVM_Pgtbl_Crt>
 801017a:	b1d8      	cbz	r0, 80101b4 <_RVM_Pgtbl_Setup+0xd8>
 801017c:	48ac      	ldr	r0, [pc, #688]	; (8010430 <_RVM_Pgtbl_Setup+0x354>)
 801017e:	f002 fdf7 	bl	8012d70 <RVM_Print_String>
 8010182:	48ac      	ldr	r0, [pc, #688]	; (8010434 <_RVM_Pgtbl_Setup+0x358>)
 8010184:	f002 fdf4 	bl	8012d70 <RVM_Print_String>
 8010188:	48ab      	ldr	r0, [pc, #684]	; (8010438 <_RVM_Pgtbl_Setup+0x35c>)
 801018a:	f002 fdf1 	bl	8012d70 <RVM_Print_String>
 801018e:	2098      	movs	r0, #152	; 0x98
 8010190:	f002 fd5c 	bl	8012c4c <RVM_Print_Int>
 8010194:	48a9      	ldr	r0, [pc, #676]	; (801043c <_RVM_Pgtbl_Setup+0x360>)
 8010196:	f002 fdeb 	bl	8012d70 <RVM_Print_String>
 801019a:	48a9      	ldr	r0, [pc, #676]	; (8010440 <_RVM_Pgtbl_Setup+0x364>)
 801019c:	f002 fde8 	bl	8012d70 <RVM_Print_String>
 80101a0:	48a8      	ldr	r0, [pc, #672]	; (8010444 <_RVM_Pgtbl_Setup+0x368>)
 80101a2:	f002 fde5 	bl	8012d70 <RVM_Print_String>
 80101a6:	48a8      	ldr	r0, [pc, #672]	; (8010448 <_RVM_Pgtbl_Setup+0x36c>)
 80101a8:	f002 fde2 	bl	8012d70 <RVM_Print_String>
 80101ac:	48a3      	ldr	r0, [pc, #652]	; (801043c <_RVM_Pgtbl_Setup+0x360>)
 80101ae:	f002 fddf 	bl	8012d70 <RVM_Print_String>
 80101b2:	e7fe      	b.n	80101b2 <_RVM_Pgtbl_Setup+0xd6>
                                 *Kmem_Bump, Pgtbl[Pos].Addr, 0, RVM_PGTBL_SIZE(Pgtbl[Pos].Order),
                                 RVM_PGTBL_NUM(Pgtbl[Pos].Order))==0);
        RVM_LOG_SISUS("Init:CortexM:Created normal page table number ",Pos," @ address ",*Kmem_Bump,".\r\n");
 80101b4:	48a5      	ldr	r0, [pc, #660]	; (801044c <_RVM_Pgtbl_Setup+0x370>)
 80101b6:	f002 fddb 	bl	8012d70 <RVM_Print_String>
 80101ba:	4630      	mov	r0, r6
 80101bc:	f002 fd46 	bl	8012c4c <RVM_Print_Int>
 80101c0:	48a3      	ldr	r0, [pc, #652]	; (8010450 <_RVM_Pgtbl_Setup+0x374>)
 80101c2:	f002 fdd5 	bl	8012d70 <RVM_Print_String>
 80101c6:	f8d8 0000 	ldr.w	r0, [r8]
 80101ca:	f002 fda5 	bl	8012d18 <RVM_Print_Uint>
 80101ce:	48a1      	ldr	r0, [pc, #644]	; (8010454 <_RVM_Pgtbl_Setup+0x378>)
 80101d0:	f002 fdce 	bl	8012d70 <RVM_Print_String>
        *Kmem_Bump+=RVM_PGTBL_SIZE_NOM(Pgtbl[Pos].Order);
 80101d4:	68a1      	ldr	r1, [r4, #8]
 80101d6:	2304      	movs	r3, #4
 80101d8:	f8d8 2000 	ldr.w	r2, [r8]
 80101dc:	408b      	lsls	r3, r1
 80101de:	3323      	adds	r3, #35	; 0x23
 80101e0:	f023 030f 	bic.w	r3, r3, #15
 80101e4:	4413      	add	r3, r2
 80101e6:	f8c8 3000 	str.w	r3, [r8]
    rvm_ptr_t Cur_Addr;
    rvm_ptr_t Parent_Slot;
    rvm_ptr_t Parent_Index;
    
    /* Map in all the pages, using the init process's page tables */
    if(RVM_PGTBL_NUM(Pgtbl[Pos].Order)==RME_PGTBL_NUM_8)
 80101ea:	68a3      	ldr	r3, [r4, #8]
        RVM_LOG_SISUS("Init:CortexM:Created normal page table number ",Pos," @ address ",*Kmem_Bump,".\r\n");
        *Kmem_Bump+=RVM_PGTBL_SIZE_NOM(Pgtbl[Pos].Order);
    }
    
    /* Do the mapping work */
    __RVM_Pgtbl_Map(Pgtbl,Pos,*Cap_Bump);
 80101ec:	f8d9 7000 	ldr.w	r7, [r9]
    rvm_ptr_t Cur_Addr;
    rvm_ptr_t Parent_Slot;
    rvm_ptr_t Parent_Index;
    
    /* Map in all the pages, using the init process's page tables */
    if(RVM_PGTBL_NUM(Pgtbl[Pos].Order)==RME_PGTBL_NUM_8)
 80101f0:	b29a      	uxth	r2, r3
 80101f2:	2a03      	cmp	r2, #3
 80101f4:	d04e      	beq.n	8010294 <_RVM_Pgtbl_Setup+0x1b8>
            }
        }
    }
    
    /* See if we are the parent ourself. If no, we do a construction */
    if(Pgtbl[Pos].Parent!=Pos)
 80101f6:	6823      	ldr	r3, [r4, #0]
 80101f8:	429e      	cmp	r6, r3
 80101fa:	f000 81ad 	beq.w	8010558 <_RVM_Pgtbl_Setup+0x47c>
    {
        RVM_ASSERT(Pgtbl[Pos].Parent<Pos);
 80101fe:	f240 818f 	bls.w	8010520 <_RVM_Pgtbl_Setup+0x444>
        RVM_ASSERT(Pgtbl[Pos].Addr>=Pgtbl[Pgtbl[Pos].Parent].Addr);
 8010202:	eb03 0183 	add.w	r1, r3, r3, lsl #2
 8010206:	6862      	ldr	r2, [r4, #4]
 8010208:	eb05 0581 	add.w	r5, r5, r1, lsl #2
 801020c:	6869      	ldr	r1, [r5, #4]
 801020e:	428a      	cmp	r2, r1
 8010210:	f080 8093 	bcs.w	801033a <_RVM_Pgtbl_Setup+0x25e>
 8010214:	4886      	ldr	r0, [pc, #536]	; (8010430 <_RVM_Pgtbl_Setup+0x354>)
 8010216:	f002 fdab 	bl	8012d70 <RVM_Print_String>
 801021a:	4886      	ldr	r0, [pc, #536]	; (8010434 <_RVM_Pgtbl_Setup+0x358>)
 801021c:	f002 fda8 	bl	8012d70 <RVM_Print_String>
 8010220:	4885      	ldr	r0, [pc, #532]	; (8010438 <_RVM_Pgtbl_Setup+0x35c>)
 8010222:	f002 fda5 	bl	8012d70 <RVM_Print_String>
 8010226:	206d      	movs	r0, #109	; 0x6d
 8010228:	f002 fd10 	bl	8012c4c <RVM_Print_Int>
 801022c:	4883      	ldr	r0, [pc, #524]	; (801043c <_RVM_Pgtbl_Setup+0x360>)
 801022e:	f002 fd9f 	bl	8012d70 <RVM_Print_String>
 8010232:	4883      	ldr	r0, [pc, #524]	; (8010440 <_RVM_Pgtbl_Setup+0x364>)
 8010234:	f002 fd9c 	bl	8012d70 <RVM_Print_String>
 8010238:	4882      	ldr	r0, [pc, #520]	; (8010444 <_RVM_Pgtbl_Setup+0x368>)
 801023a:	f002 fd99 	bl	8012d70 <RVM_Print_String>
 801023e:	4882      	ldr	r0, [pc, #520]	; (8010448 <_RVM_Pgtbl_Setup+0x36c>)
 8010240:	f002 fd96 	bl	8012d70 <RVM_Print_String>
 8010244:	487d      	ldr	r0, [pc, #500]	; (801043c <_RVM_Pgtbl_Setup+0x360>)
 8010246:	f002 fd93 	bl	8012d70 <RVM_Print_String>
 801024a:	e7fe      	b.n	801024a <_RVM_Pgtbl_Setup+0x16e>
    if(Pos==0)
    {
        RVM_ASSERT(RVM_Pgtbl_Crt(Cap_Captbl, Cap_Kmem, *Cap_Bump, 
                                 *Kmem_Bump, Pgtbl[Pos].Addr, 1, RVM_PGTBL_SIZE(Pgtbl[Pos].Order),
                                 RVM_PGTBL_NUM(Pgtbl[Pos].Order))==0);
        RVM_LOG_SISUS("Init:CortexM:Created top-level page table number ",Pos," @ address ",*Kmem_Bump,".\r\n");
 801024c:	4882      	ldr	r0, [pc, #520]	; (8010458 <_RVM_Pgtbl_Setup+0x37c>)
 801024e:	462c      	mov	r4, r5
 8010250:	f002 fd8e 	bl	8012d70 <RVM_Print_String>
 8010254:	4630      	mov	r0, r6
 8010256:	f002 fcf9 	bl	8012c4c <RVM_Print_Int>
 801025a:	487d      	ldr	r0, [pc, #500]	; (8010450 <_RVM_Pgtbl_Setup+0x374>)
 801025c:	f002 fd88 	bl	8012d70 <RVM_Print_String>
 8010260:	f8d8 0000 	ldr.w	r0, [r8]
 8010264:	f002 fd58 	bl	8012d18 <RVM_Print_Uint>
 8010268:	487a      	ldr	r0, [pc, #488]	; (8010454 <_RVM_Pgtbl_Setup+0x378>)
 801026a:	f002 fd81 	bl	8012d70 <RVM_Print_String>
        *Kmem_Bump+=RVM_PGTBL_SIZE_TOP(Pgtbl[Pos].Order);
 801026e:	68a9      	ldr	r1, [r5, #8]
 8010270:	2304      	movs	r3, #4
 8010272:	f8d8 2000 	ldr.w	r2, [r8]
 8010276:	408b      	lsls	r3, r1
 8010278:	3323      	adds	r3, #35	; 0x23
 801027a:	f023 030f 	bic.w	r3, r3, #15
 801027e:	009b      	lsls	r3, r3, #2
 8010280:	3330      	adds	r3, #48	; 0x30
 8010282:	4413      	add	r3, r2
 8010284:	f8c8 3000 	str.w	r3, [r8]
    rvm_ptr_t Cur_Addr;
    rvm_ptr_t Parent_Slot;
    rvm_ptr_t Parent_Index;
    
    /* Map in all the pages, using the init process's page tables */
    if(RVM_PGTBL_NUM(Pgtbl[Pos].Order)==RME_PGTBL_NUM_8)
 8010288:	68a3      	ldr	r3, [r4, #8]
        RVM_LOG_SISUS("Init:CortexM:Created normal page table number ",Pos," @ address ",*Kmem_Bump,".\r\n");
        *Kmem_Bump+=RVM_PGTBL_SIZE_NOM(Pgtbl[Pos].Order);
    }
    
    /* Do the mapping work */
    __RVM_Pgtbl_Map(Pgtbl,Pos,*Cap_Bump);
 801028a:	f8d9 7000 	ldr.w	r7, [r9]
    rvm_ptr_t Cur_Addr;
    rvm_ptr_t Parent_Slot;
    rvm_ptr_t Parent_Index;
    
    /* Map in all the pages, using the init process's page tables */
    if(RVM_PGTBL_NUM(Pgtbl[Pos].Order)==RME_PGTBL_NUM_8)
 801028e:	b29a      	uxth	r2, r3
 8010290:	2a03      	cmp	r2, #3
 8010292:	d1b0      	bne.n	80101f6 <_RVM_Pgtbl_Setup+0x11a>
    {
        /* Check if there are any pages to map. If there are, check the flags
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
 8010294:	7b22      	ldrb	r2, [r4, #12]
 8010296:	2a00      	cmp	r2, #0
 8010298:	f040 812e 	bne.w	80104f8 <_RVM_Pgtbl_Setup+0x41c>
 801029c:	7b62      	ldrb	r2, [r4, #13]
 801029e:	2a00      	cmp	r2, #0
 80102a0:	f040 8110 	bne.w	80104c4 <_RVM_Pgtbl_Setup+0x3e8>
 80102a4:	7ba2      	ldrb	r2, [r4, #14]
 80102a6:	2a00      	cmp	r2, #0
 80102a8:	f040 80f2 	bne.w	8010490 <_RVM_Pgtbl_Setup+0x3b4>
 80102ac:	7be2      	ldrb	r2, [r4, #15]
 80102ae:	2a00      	cmp	r2, #0
 80102b0:	f040 80d4 	bne.w	801045c <_RVM_Pgtbl_Setup+0x380>
 80102b4:	7c22      	ldrb	r2, [r4, #16]
 80102b6:	2a00      	cmp	r2, #0
 80102b8:	f040 80a0 	bne.w	80103fc <_RVM_Pgtbl_Setup+0x320>
 80102bc:	7c62      	ldrb	r2, [r4, #17]
 80102be:	2a00      	cmp	r2, #0
 80102c0:	f040 8082 	bne.w	80103c8 <_RVM_Pgtbl_Setup+0x2ec>
 80102c4:	7ca2      	ldrb	r2, [r4, #18]
 80102c6:	2a00      	cmp	r2, #0
 80102c8:	d149      	bne.n	801035e <_RVM_Pgtbl_Setup+0x282>
 80102ca:	7ce2      	ldrb	r2, [r4, #19]
 80102cc:	2a00      	cmp	r2, #0
 80102ce:	d092      	beq.n	80101f6 <_RVM_Pgtbl_Setup+0x11a>
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 80102d0:	f8b4 800a 	ldrh.w	r8, [r4, #10]
 80102d4:	2107      	movs	r1, #7
 80102d6:	6860      	ldr	r0, [r4, #4]
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 80102d8:	2301      	movs	r3, #1
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 80102da:	fa01 fe08 	lsl.w	lr, r1, r8
 80102de:	4486      	add	lr, r0
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 80102e0:	f447 6028 	orr.w	r0, r7, #2688	; 0xa80
 80102e4:	f02e 4c60 	bic.w	ip, lr, #3758096384	; 0xe0000000
 80102e8:	ea4f 7e5e 	mov.w	lr, lr, lsr #29
 80102ec:	fa2c fc08 	lsr.w	ip, ip, r8
 80102f0:	f8cd e000 	str.w	lr, [sp]
 80102f4:	f8cd c004 	str.w	ip, [sp, #4]
 80102f8:	f002 fd88 	bl	8012e0c <RVM_Pgtbl_Add>
 80102fc:	2800      	cmp	r0, #0
 80102fe:	f43f af7a 	beq.w	80101f6 <_RVM_Pgtbl_Setup+0x11a>
 8010302:	484b      	ldr	r0, [pc, #300]	; (8010430 <_RVM_Pgtbl_Setup+0x354>)
 8010304:	f002 fd34 	bl	8012d70 <RVM_Print_String>
 8010308:	484a      	ldr	r0, [pc, #296]	; (8010434 <_RVM_Pgtbl_Setup+0x358>)
 801030a:	f002 fd31 	bl	8012d70 <RVM_Print_String>
 801030e:	484a      	ldr	r0, [pc, #296]	; (8010438 <_RVM_Pgtbl_Setup+0x35c>)
 8010310:	f002 fd2e 	bl	8012d70 <RVM_Print_String>
 8010314:	2064      	movs	r0, #100	; 0x64
 8010316:	f002 fc99 	bl	8012c4c <RVM_Print_Int>
 801031a:	4848      	ldr	r0, [pc, #288]	; (801043c <_RVM_Pgtbl_Setup+0x360>)
 801031c:	f002 fd28 	bl	8012d70 <RVM_Print_String>
 8010320:	4847      	ldr	r0, [pc, #284]	; (8010440 <_RVM_Pgtbl_Setup+0x364>)
 8010322:	f002 fd25 	bl	8012d70 <RVM_Print_String>
 8010326:	4847      	ldr	r0, [pc, #284]	; (8010444 <_RVM_Pgtbl_Setup+0x368>)
 8010328:	f002 fd22 	bl	8012d70 <RVM_Print_String>
 801032c:	4846      	ldr	r0, [pc, #280]	; (8010448 <_RVM_Pgtbl_Setup+0x36c>)
 801032e:	f002 fd1f 	bl	8012d70 <RVM_Print_String>
 8010332:	4842      	ldr	r0, [pc, #264]	; (801043c <_RVM_Pgtbl_Setup+0x360>)
 8010334:	f002 fd1c 	bl	8012d70 <RVM_Print_String>
 8010338:	e7fe      	b.n	8010338 <_RVM_Pgtbl_Setup+0x25c>
    {
        RVM_ASSERT(Pgtbl[Pos].Parent<Pos);
        RVM_ASSERT(Pgtbl[Pos].Addr>=Pgtbl[Pgtbl[Pos].Parent].Addr);
        
        Parent_Slot=(Pgtbl[Pos].Addr-Pgtbl[Pgtbl[Pos].Parent].Addr)>>RVM_PGTBL_SIZE(Pgtbl[Pgtbl[Pos].Parent].Order);
        RVM_ASSERT(RVM_Pgtbl_Con(Pgtbl_Cap-Pos+Pgtbl[Pos].Parent, Parent_Slot, Pgtbl_Cap, RME_PGTBL_ALL_PERM)==0);
 801033a:	1a51      	subs	r1, r2, r1
 801033c:	18f8      	adds	r0, r7, r3
 801033e:	896c      	ldrh	r4, [r5, #10]
 8010340:	463a      	mov	r2, r7
 8010342:	233f      	movs	r3, #63	; 0x3f
 8010344:	1b80      	subs	r0, r0, r6
 8010346:	40e1      	lsrs	r1, r4
 8010348:	f002 fd72 	bl	8012e30 <RVM_Pgtbl_Con>
 801034c:	bb00      	cbnz	r0, 8010390 <_RVM_Pgtbl_Setup+0x2b4>
        *Kmem_Bump+=RVM_PGTBL_SIZE_NOM(Pgtbl[Pos].Order);
    }
    
    /* Do the mapping work */
    __RVM_Pgtbl_Map(Pgtbl,Pos,*Cap_Bump);
    (*Cap_Bump)++;
 801034e:	f8d9 3000 	ldr.w	r3, [r9]
 8010352:	3301      	adds	r3, #1
 8010354:	f8c9 3000 	str.w	r3, [r9]
}
 8010358:	b005      	add	sp, #20
 801035a:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 801035e:	f8b4 800a 	ldrh.w	r8, [r4, #10]
 8010362:	2106      	movs	r1, #6
 8010364:	6860      	ldr	r0, [r4, #4]
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 8010366:	2301      	movs	r3, #1
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 8010368:	fa01 fe08 	lsl.w	lr, r1, r8
 801036c:	4486      	add	lr, r0
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 801036e:	f447 6028 	orr.w	r0, r7, #2688	; 0xa80
 8010372:	f02e 4c60 	bic.w	ip, lr, #3758096384	; 0xe0000000
 8010376:	ea4f 7e5e 	mov.w	lr, lr, lsr #29
 801037a:	fa2c fc08 	lsr.w	ip, ip, r8
 801037e:	f8cd e000 	str.w	lr, [sp]
 8010382:	f8cd c004 	str.w	ip, [sp, #4]
 8010386:	f002 fd41 	bl	8012e0c <RVM_Pgtbl_Add>
 801038a:	2800      	cmp	r0, #0
 801038c:	d09d      	beq.n	80102ca <_RVM_Pgtbl_Setup+0x1ee>
 801038e:	e7b8      	b.n	8010302 <_RVM_Pgtbl_Setup+0x226>
    {
        RVM_ASSERT(Pgtbl[Pos].Parent<Pos);
        RVM_ASSERT(Pgtbl[Pos].Addr>=Pgtbl[Pgtbl[Pos].Parent].Addr);
        
        Parent_Slot=(Pgtbl[Pos].Addr-Pgtbl[Pgtbl[Pos].Parent].Addr)>>RVM_PGTBL_SIZE(Pgtbl[Pgtbl[Pos].Parent].Order);
        RVM_ASSERT(RVM_Pgtbl_Con(Pgtbl_Cap-Pos+Pgtbl[Pos].Parent, Parent_Slot, Pgtbl_Cap, RME_PGTBL_ALL_PERM)==0);
 8010390:	4827      	ldr	r0, [pc, #156]	; (8010430 <_RVM_Pgtbl_Setup+0x354>)
 8010392:	f002 fced 	bl	8012d70 <RVM_Print_String>
 8010396:	4827      	ldr	r0, [pc, #156]	; (8010434 <_RVM_Pgtbl_Setup+0x358>)
 8010398:	f002 fcea 	bl	8012d70 <RVM_Print_String>
 801039c:	4826      	ldr	r0, [pc, #152]	; (8010438 <_RVM_Pgtbl_Setup+0x35c>)
 801039e:	f002 fce7 	bl	8012d70 <RVM_Print_String>
 80103a2:	2070      	movs	r0, #112	; 0x70
 80103a4:	f002 fc52 	bl	8012c4c <RVM_Print_Int>
 80103a8:	4824      	ldr	r0, [pc, #144]	; (801043c <_RVM_Pgtbl_Setup+0x360>)
 80103aa:	f002 fce1 	bl	8012d70 <RVM_Print_String>
 80103ae:	4824      	ldr	r0, [pc, #144]	; (8010440 <_RVM_Pgtbl_Setup+0x364>)
 80103b0:	f002 fcde 	bl	8012d70 <RVM_Print_String>
 80103b4:	4823      	ldr	r0, [pc, #140]	; (8010444 <_RVM_Pgtbl_Setup+0x368>)
 80103b6:	f002 fcdb 	bl	8012d70 <RVM_Print_String>
 80103ba:	4823      	ldr	r0, [pc, #140]	; (8010448 <_RVM_Pgtbl_Setup+0x36c>)
 80103bc:	f002 fcd8 	bl	8012d70 <RVM_Print_String>
 80103c0:	481e      	ldr	r0, [pc, #120]	; (801043c <_RVM_Pgtbl_Setup+0x360>)
 80103c2:	f002 fcd5 	bl	8012d70 <RVM_Print_String>
 80103c6:	e7fe      	b.n	80103c6 <_RVM_Pgtbl_Setup+0x2ea>
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 80103c8:	f8b4 800a 	ldrh.w	r8, [r4, #10]
 80103cc:	2105      	movs	r1, #5
 80103ce:	6860      	ldr	r0, [r4, #4]
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 80103d0:	2301      	movs	r3, #1
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 80103d2:	fa01 fe08 	lsl.w	lr, r1, r8
 80103d6:	4486      	add	lr, r0
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 80103d8:	f447 6028 	orr.w	r0, r7, #2688	; 0xa80
 80103dc:	f02e 4c60 	bic.w	ip, lr, #3758096384	; 0xe0000000
 80103e0:	ea4f 7e5e 	mov.w	lr, lr, lsr #29
 80103e4:	fa2c fc08 	lsr.w	ip, ip, r8
 80103e8:	f8cd e000 	str.w	lr, [sp]
 80103ec:	f8cd c004 	str.w	ip, [sp, #4]
 80103f0:	f002 fd0c 	bl	8012e0c <RVM_Pgtbl_Add>
 80103f4:	2800      	cmp	r0, #0
 80103f6:	f43f af65 	beq.w	80102c4 <_RVM_Pgtbl_Setup+0x1e8>
 80103fa:	e782      	b.n	8010302 <_RVM_Pgtbl_Setup+0x226>
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 80103fc:	f8b4 800a 	ldrh.w	r8, [r4, #10]
 8010400:	2104      	movs	r1, #4
 8010402:	6860      	ldr	r0, [r4, #4]
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 8010404:	2301      	movs	r3, #1
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 8010406:	fa01 fe08 	lsl.w	lr, r1, r8
 801040a:	4486      	add	lr, r0
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 801040c:	f447 6028 	orr.w	r0, r7, #2688	; 0xa80
 8010410:	f02e 4c60 	bic.w	ip, lr, #3758096384	; 0xe0000000
 8010414:	ea4f 7e5e 	mov.w	lr, lr, lsr #29
 8010418:	fa2c fc08 	lsr.w	ip, ip, r8
 801041c:	f8cd e000 	str.w	lr, [sp]
 8010420:	f8cd c004 	str.w	ip, [sp, #4]
 8010424:	f002 fcf2 	bl	8012e0c <RVM_Pgtbl_Add>
 8010428:	2800      	cmp	r0, #0
 801042a:	f43f af47 	beq.w	80102bc <_RVM_Pgtbl_Setup+0x1e0>
 801042e:	e768      	b.n	8010302 <_RVM_Pgtbl_Setup+0x226>
 8010430:	08012f08 	.word	0x08012f08
 8010434:	08012f3c 	.word	0x08012f3c
 8010438:	08012fa4 	.word	0x08012fa4
 801043c:	080134b0 	.word	0x080134b0
 8010440:	08012fac 	.word	0x08012fac
 8010444:	08012fb8 	.word	0x08012fb8
 8010448:	08012fbc 	.word	0x08012fbc
 801044c:	08013008 	.word	0x08013008
 8010450:	08012ffc 	.word	0x08012ffc
 8010454:	0801314c 	.word	0x0801314c
 8010458:	08012fc8 	.word	0x08012fc8
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 801045c:	f8b4 800a 	ldrh.w	r8, [r4, #10]
 8010460:	2103      	movs	r1, #3
 8010462:	6860      	ldr	r0, [r4, #4]
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 8010464:	2301      	movs	r3, #1
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 8010466:	fa01 fe08 	lsl.w	lr, r1, r8
 801046a:	4486      	add	lr, r0
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 801046c:	f447 6028 	orr.w	r0, r7, #2688	; 0xa80
 8010470:	f02e 4c60 	bic.w	ip, lr, #3758096384	; 0xe0000000
 8010474:	ea4f 7e5e 	mov.w	lr, lr, lsr #29
 8010478:	fa2c fc08 	lsr.w	ip, ip, r8
 801047c:	f8cd e000 	str.w	lr, [sp]
 8010480:	f8cd c004 	str.w	ip, [sp, #4]
 8010484:	f002 fcc2 	bl	8012e0c <RVM_Pgtbl_Add>
 8010488:	2800      	cmp	r0, #0
 801048a:	f43f af13 	beq.w	80102b4 <_RVM_Pgtbl_Setup+0x1d8>
 801048e:	e738      	b.n	8010302 <_RVM_Pgtbl_Setup+0x226>
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 8010490:	f8b4 800a 	ldrh.w	r8, [r4, #10]
 8010494:	2102      	movs	r1, #2
 8010496:	6860      	ldr	r0, [r4, #4]
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 8010498:	2301      	movs	r3, #1
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 801049a:	fa01 fe08 	lsl.w	lr, r1, r8
 801049e:	4486      	add	lr, r0
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 80104a0:	f447 6028 	orr.w	r0, r7, #2688	; 0xa80
 80104a4:	f02e 4c60 	bic.w	ip, lr, #3758096384	; 0xe0000000
 80104a8:	ea4f 7e5e 	mov.w	lr, lr, lsr #29
 80104ac:	fa2c fc08 	lsr.w	ip, ip, r8
 80104b0:	f8cd e000 	str.w	lr, [sp]
 80104b4:	f8cd c004 	str.w	ip, [sp, #4]
 80104b8:	f002 fca8 	bl	8012e0c <RVM_Pgtbl_Add>
 80104bc:	2800      	cmp	r0, #0
 80104be:	f43f aef5 	beq.w	80102ac <_RVM_Pgtbl_Setup+0x1d0>
 80104c2:	e71e      	b.n	8010302 <_RVM_Pgtbl_Setup+0x226>
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 80104c4:	f8b4 800a 	ldrh.w	r8, [r4, #10]
 80104c8:	2301      	movs	r3, #1
 80104ca:	6860      	ldr	r0, [r4, #4]
 80104cc:	fa03 fe08 	lsl.w	lr, r3, r8
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 80104d0:	4619      	mov	r1, r3
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 80104d2:	4486      	add	lr, r0
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 80104d4:	f447 6028 	orr.w	r0, r7, #2688	; 0xa80
 80104d8:	f02e 4c60 	bic.w	ip, lr, #3758096384	; 0xe0000000
 80104dc:	ea4f 7e5e 	mov.w	lr, lr, lsr #29
 80104e0:	fa2c fc08 	lsr.w	ip, ip, r8
 80104e4:	f8cd e000 	str.w	lr, [sp]
 80104e8:	f8cd c004 	str.w	ip, [sp, #4]
 80104ec:	f002 fc8e 	bl	8012e0c <RVM_Pgtbl_Add>
 80104f0:	2800      	cmp	r0, #0
 80104f2:	f43f aed7 	beq.w	80102a4 <_RVM_Pgtbl_Setup+0x1c8>
 80104f6:	e704      	b.n	8010302 <_RVM_Pgtbl_Setup+0x226>
         * and map them in. */
        for(Count=0;Count<8;Count++)
        {
            if(Pgtbl[Pos].Flags[Count]!=0)
            {
                Cur_Addr=Pgtbl[Pos].Addr+RVM_POW2(RVM_PGTBL_SIZE(Pgtbl[Pos].Order))*Count;
 80104f8:	6861      	ldr	r1, [r4, #4]
                Parent_Slot=Cur_Addr/0x20000000;
                Parent_Index=(Cur_Addr%0x20000000)>>RVM_PGTBL_SIZE(Pgtbl[Pos].Order);
                RVM_ASSERT(RVM_Pgtbl_Add(RVM_CAPID(RVM_VIRT_TBL_PGTBL,Pgtbl_Cap), Count,
 80104fa:	0c18      	lsrs	r0, r3, #16
 80104fc:	2301      	movs	r3, #1
 80104fe:	f021 4e60 	bic.w	lr, r1, #3758096384	; 0xe0000000
 8010502:	0f49      	lsrs	r1, r1, #29
 8010504:	fa2e fe00 	lsr.w	lr, lr, r0
 8010508:	9100      	str	r1, [sp, #0]
 801050a:	f447 6028 	orr.w	r0, r7, #2688	; 0xa80
 801050e:	2100      	movs	r1, #0
 8010510:	f8cd e004 	str.w	lr, [sp, #4]
 8010514:	f002 fc7a 	bl	8012e0c <RVM_Pgtbl_Add>
 8010518:	2800      	cmp	r0, #0
 801051a:	f43f aebf 	beq.w	801029c <_RVM_Pgtbl_Setup+0x1c0>
 801051e:	e6f0      	b.n	8010302 <_RVM_Pgtbl_Setup+0x226>
    }
    
    /* See if we are the parent ourself. If no, we do a construction */
    if(Pgtbl[Pos].Parent!=Pos)
    {
        RVM_ASSERT(Pgtbl[Pos].Parent<Pos);
 8010520:	481d      	ldr	r0, [pc, #116]	; (8010598 <_RVM_Pgtbl_Setup+0x4bc>)
 8010522:	f002 fc25 	bl	8012d70 <RVM_Print_String>
 8010526:	481d      	ldr	r0, [pc, #116]	; (801059c <_RVM_Pgtbl_Setup+0x4c0>)
 8010528:	f002 fc22 	bl	8012d70 <RVM_Print_String>
 801052c:	481c      	ldr	r0, [pc, #112]	; (80105a0 <_RVM_Pgtbl_Setup+0x4c4>)
 801052e:	f002 fc1f 	bl	8012d70 <RVM_Print_String>
 8010532:	206c      	movs	r0, #108	; 0x6c
 8010534:	f002 fb8a 	bl	8012c4c <RVM_Print_Int>
 8010538:	481a      	ldr	r0, [pc, #104]	; (80105a4 <_RVM_Pgtbl_Setup+0x4c8>)
 801053a:	f002 fc19 	bl	8012d70 <RVM_Print_String>
 801053e:	481a      	ldr	r0, [pc, #104]	; (80105a8 <_RVM_Pgtbl_Setup+0x4cc>)
 8010540:	f002 fc16 	bl	8012d70 <RVM_Print_String>
 8010544:	4819      	ldr	r0, [pc, #100]	; (80105ac <_RVM_Pgtbl_Setup+0x4d0>)
 8010546:	f002 fc13 	bl	8012d70 <RVM_Print_String>
 801054a:	4819      	ldr	r0, [pc, #100]	; (80105b0 <_RVM_Pgtbl_Setup+0x4d4>)
 801054c:	f002 fc10 	bl	8012d70 <RVM_Print_String>
 8010550:	4814      	ldr	r0, [pc, #80]	; (80105a4 <_RVM_Pgtbl_Setup+0x4c8>)
 8010552:	f002 fc0d 	bl	8012d70 <RVM_Print_String>
 8010556:	e7fe      	b.n	8010556 <_RVM_Pgtbl_Setup+0x47a>
        RVM_ASSERT(RVM_Pgtbl_Con(Pgtbl_Cap-Pos+Pgtbl[Pos].Parent, Parent_Slot, Pgtbl_Cap, RME_PGTBL_ALL_PERM)==0);
    }
    else
    {
        /* If they are equal, only the top-level can have this */
        RVM_ASSERT(Pos==0);
 8010558:	2e00      	cmp	r6, #0
 801055a:	f43f aef8 	beq.w	801034e <_RVM_Pgtbl_Setup+0x272>
 801055e:	480e      	ldr	r0, [pc, #56]	; (8010598 <_RVM_Pgtbl_Setup+0x4bc>)
 8010560:	f002 fc06 	bl	8012d70 <RVM_Print_String>
 8010564:	480d      	ldr	r0, [pc, #52]	; (801059c <_RVM_Pgtbl_Setup+0x4c0>)
 8010566:	f002 fc03 	bl	8012d70 <RVM_Print_String>
 801056a:	480d      	ldr	r0, [pc, #52]	; (80105a0 <_RVM_Pgtbl_Setup+0x4c4>)
 801056c:	f002 fc00 	bl	8012d70 <RVM_Print_String>
 8010570:	2075      	movs	r0, #117	; 0x75
 8010572:	f002 fb6b 	bl	8012c4c <RVM_Print_Int>
 8010576:	480b      	ldr	r0, [pc, #44]	; (80105a4 <_RVM_Pgtbl_Setup+0x4c8>)
 8010578:	f002 fbfa 	bl	8012d70 <RVM_Print_String>
 801057c:	480a      	ldr	r0, [pc, #40]	; (80105a8 <_RVM_Pgtbl_Setup+0x4cc>)
 801057e:	f002 fbf7 	bl	8012d70 <RVM_Print_String>
 8010582:	480a      	ldr	r0, [pc, #40]	; (80105ac <_RVM_Pgtbl_Setup+0x4d0>)
 8010584:	f002 fbf4 	bl	8012d70 <RVM_Print_String>
 8010588:	4809      	ldr	r0, [pc, #36]	; (80105b0 <_RVM_Pgtbl_Setup+0x4d4>)
 801058a:	f002 fbf1 	bl	8012d70 <RVM_Print_String>
 801058e:	4805      	ldr	r0, [pc, #20]	; (80105a4 <_RVM_Pgtbl_Setup+0x4c8>)
 8010590:	f002 fbee 	bl	8012d70 <RVM_Print_String>
 8010594:	e7fe      	b.n	8010594 <_RVM_Pgtbl_Setup+0x4b8>
 8010596:	bf00      	nop
 8010598:	08012f08 	.word	0x08012f08
 801059c:	08012f3c 	.word	0x08012f3c
 80105a0:	08012fa4 	.word	0x08012fa4
 80105a4:	080134b0 	.word	0x080134b0
 80105a8:	08012fac 	.word	0x08012fac
 80105ac:	08012fb8 	.word	0x08012fb8
 80105b0:	08012fbc 	.word	0x08012fbc

080105b4 <_RVM_Pgtbl_Check>:
//    {
//        /* RAM - need to check the address itself and 256 bytes before it */
//    }
    
    return 0;
}
 80105b4:	2000      	movs	r0, #0
 80105b6:	4770      	bx	lr

080105b8 <RVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void RVM_Idle(void)
{
 80105b8:	4770      	bx	lr
 80105ba:	bf00      	nop

080105bc <_RVM_Set_Rdy>:
Input       : struct RVM_Virt* Virt - The virtual machine to put into the runqueue.
Output      : None.
Return      : None.
******************************************************************************/
void _RVM_Set_Rdy(struct RVM_Virt* Virt)
{
 80105bc:	b510      	push	{r4, lr}
    /* Insert this into the corresponding runqueue */
    RVM_List_Ins(&(Virt->Head),RVM_Run[Virt->Image->Prio].Prev,&(RVM_Run[Virt->Image->Prio]));
 80105be:	6902      	ldr	r2, [r0, #16]
Input       : struct RVM_Virt* Virt - The virtual machine to put into the runqueue.
Output      : None.
Return      : None.
******************************************************************************/
void _RVM_Set_Rdy(struct RVM_Virt* Virt)
{
 80105c0:	4604      	mov	r4, r0
    /* Insert this into the corresponding runqueue */
    RVM_List_Ins(&(Virt->Head),RVM_Run[Virt->Image->Prio].Prev,&(RVM_Run[Virt->Image->Prio]));
 80105c2:	4b0b      	ldr	r3, [pc, #44]	; (80105f0 <_RVM_Set_Rdy+0x34>)
 80105c4:	6b51      	ldr	r1, [r2, #52]	; 0x34
 80105c6:	eb03 02c1 	add.w	r2, r3, r1, lsl #3
 80105ca:	f853 1031 	ldr.w	r1, [r3, r1, lsl #3]
 80105ce:	f002 fb37 	bl	8012c40 <RVM_List_Ins>
    /* Set this runlevel as active */
    RVM_Bitmap[Virt->Image->Prio>>RVM_WORD_ORDER]|=((rvm_ptr_t)1)<<(Virt->Image->Prio&RVM_WORD_MASK);
 80105d2:	6923      	ldr	r3, [r4, #16]
 80105d4:	4807      	ldr	r0, [pc, #28]	; (80105f4 <_RVM_Set_Rdy+0x38>)
 80105d6:	2101      	movs	r1, #1
 80105d8:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 80105da:	095c      	lsrs	r4, r3, #5
 80105dc:	f003 030f 	and.w	r3, r3, #15
 80105e0:	f850 2024 	ldr.w	r2, [r0, r4, lsl #2]
 80105e4:	fa01 f303 	lsl.w	r3, r1, r3
 80105e8:	431a      	orrs	r2, r3
 80105ea:	f840 2024 	str.w	r2, [r0, r4, lsl #2]
 80105ee:	bd10      	pop	{r4, pc}
 80105f0:	2001e948 	.word	0x2001e948
 80105f4:	2001ea5c 	.word	0x2001ea5c

080105f8 <_RVM_Get_High_Rdy>:
Output      : None.
Return      : struct RVM_Virt* Virt - The virtual machine. If all virtual machine
                                      have gone asleep, this will return 0.
******************************************************************************/
struct RVM_Virt* _RVM_Get_High_Rdy(void)
{
 80105f8:	b508      	push	{r3, lr}
    rvm_cnt_t Count;
    
    /* See which one is ready, and pick it */
    for(Count=RVM_PRIO_BITMAP-1;Count>=0;Count--)
    {
        if(RVM_Bitmap[Count]==0)
 80105fa:	4b05      	ldr	r3, [pc, #20]	; (8010610 <_RVM_Get_High_Rdy+0x18>)
 80105fc:	6818      	ldr	r0, [r3, #0]
 80105fe:	b900      	cbnz	r0, 8010602 <_RVM_Get_High_Rdy+0xa>
        Count=_RVM_MSB_Get(RVM_Bitmap[Count])+(Count<<RVM_WORD_ORDER);
        return (struct RVM_Virt*)(RVM_Run[Count].Next);
    }
    
    return 0;
}
 8010600:	bd08      	pop	{r3, pc}
    for(Count=RVM_PRIO_BITMAP-1;Count>=0;Count--)
    {
        if(RVM_Bitmap[Count]==0)
            continue;
        
        Count=_RVM_MSB_Get(RVM_Bitmap[Count])+(Count<<RVM_WORD_ORDER);
 8010602:	f7ff fd3b 	bl	801007c <_RVM_MSB_Get>
        return (struct RVM_Virt*)(RVM_Run[Count].Next);
 8010606:	4b03      	ldr	r3, [pc, #12]	; (8010614 <_RVM_Get_High_Rdy+0x1c>)
 8010608:	eb03 00c0 	add.w	r0, r3, r0, lsl #3
 801060c:	6840      	ldr	r0, [r0, #4]
    }
    
    return 0;
}
 801060e:	bd08      	pop	{r3, pc}
 8010610:	2001ea5c 	.word	0x2001ea5c
 8010614:	2001e948 	.word	0x2001e948

08010618 <_RVM_Virt_Switch>:
Output      : None.
Return      : None.
******************************************************************************/
void _RVM_Virt_Switch(struct RVM_Virt* From, struct RVM_Virt* To)
{
    if(From==To)
 8010618:	4288      	cmp	r0, r1
 801061a:	d03b      	beq.n	8010694 <_RVM_Virt_Switch+0x7c>
              struct RVM_Virt* To - The destination virtual machine.
Output      : None.
Return      : None.
******************************************************************************/
void _RVM_Virt_Switch(struct RVM_Virt* From, struct RVM_Virt* To)
{
 801061c:	b538      	push	{r3, r4, r5, lr}
 801061e:	460c      	mov	r4, r1
 8010620:	4605      	mov	r5, r0
    if(From==To)
        return;
    
    /* Just change the thread's priorities */
    if(From!=0)
 8010622:	b330      	cbz	r0, 8010672 <_RVM_Virt_Switch+0x5a>
    {
        RVM_ASSERT(RVM_Thd_Sched_Prio(From->Cap.User_Thd, RVM_WAIT_PRIO)==0);
 8010624:	2100      	movs	r1, #0
 8010626:	6a40      	ldr	r0, [r0, #36]	; 0x24
 8010628:	f002 fc4a 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 801062c:	4601      	mov	r1, r0
 801062e:	b1d8      	cbz	r0, 8010668 <_RVM_Virt_Switch+0x50>
 8010630:	4853      	ldr	r0, [pc, #332]	; (8010780 <_RVM_Virt_Switch+0x168>)
 8010632:	f002 fb9d 	bl	8012d70 <RVM_Print_String>
 8010636:	4853      	ldr	r0, [pc, #332]	; (8010784 <_RVM_Virt_Switch+0x16c>)
 8010638:	f002 fb9a 	bl	8012d70 <RVM_Print_String>
 801063c:	4852      	ldr	r0, [pc, #328]	; (8010788 <_RVM_Virt_Switch+0x170>)
 801063e:	f002 fb97 	bl	8012d70 <RVM_Print_String>
 8010642:	2082      	movs	r0, #130	; 0x82
 8010644:	f002 fb02 	bl	8012c4c <RVM_Print_Int>
 8010648:	4850      	ldr	r0, [pc, #320]	; (801078c <_RVM_Virt_Switch+0x174>)
 801064a:	f002 fb91 	bl	8012d70 <RVM_Print_String>
 801064e:	4850      	ldr	r0, [pc, #320]	; (8010790 <_RVM_Virt_Switch+0x178>)
 8010650:	f002 fb8e 	bl	8012d70 <RVM_Print_String>
 8010654:	484f      	ldr	r0, [pc, #316]	; (8010794 <_RVM_Virt_Switch+0x17c>)
 8010656:	f002 fb8b 	bl	8012d70 <RVM_Print_String>
 801065a:	484f      	ldr	r0, [pc, #316]	; (8010798 <_RVM_Virt_Switch+0x180>)
 801065c:	f002 fb88 	bl	8012d70 <RVM_Print_String>
 8010660:	484a      	ldr	r0, [pc, #296]	; (801078c <_RVM_Virt_Switch+0x174>)
 8010662:	f002 fb85 	bl	8012d70 <RVM_Print_String>
 8010666:	e7fe      	b.n	8010666 <_RVM_Virt_Switch+0x4e>
        RVM_ASSERT(RVM_Thd_Sched_Prio(From->Cap.Int_Thd, RVM_WAIT_PRIO)==0);
 8010668:	6a28      	ldr	r0, [r5, #32]
 801066a:	f002 fc29 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 801066e:	2800      	cmp	r0, #0
 8010670:	d132      	bne.n	80106d8 <_RVM_Virt_Switch+0xc0>
    }
    
    if(To!=0)
 8010672:	b174      	cbz	r4, 8010692 <_RVM_Virt_Switch+0x7a>
    {
        RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.User_Thd, RVM_USER_PRIO)==0);
 8010674:	2102      	movs	r1, #2
 8010676:	6a60      	ldr	r0, [r4, #36]	; 0x24
 8010678:	f002 fc22 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 801067c:	2800      	cmp	r0, #0
 801067e:	d163      	bne.n	8010748 <_RVM_Virt_Switch+0x130>
        /* If the booting is not done yet, place the interrupt vector at the waiting level as always */
        if((To->Sched.State&RVM_VM_BOOTDONE)==0)
 8010680:	6b63      	ldr	r3, [r4, #52]	; 0x34
            RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.Int_Thd, RVM_WAIT_PRIO)==0);
 8010682:	6a20      	ldr	r0, [r4, #32]
    
    if(To!=0)
    {
        RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.User_Thd, RVM_USER_PRIO)==0);
        /* If the booting is not done yet, place the interrupt vector at the waiting level as always */
        if((To->Sched.State&RVM_VM_BOOTDONE)==0)
 8010684:	f413 3100 	ands.w	r1, r3, #131072	; 0x20000
 8010688:	d105      	bne.n	8010696 <_RVM_Virt_Switch+0x7e>
            RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.Int_Thd, RVM_WAIT_PRIO)==0);
 801068a:	f002 fc19 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 801068e:	2800      	cmp	r0, #0
 8010690:	d13e      	bne.n	8010710 <_RVM_Virt_Switch+0xf8>
 8010692:	bd38      	pop	{r3, r4, r5, pc}
 8010694:	4770      	bx	lr
        else
            RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.Int_Thd, RVM_VINT_PRIO)==0);
 8010696:	2103      	movs	r1, #3
 8010698:	f002 fc12 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 801069c:	2800      	cmp	r0, #0
 801069e:	d0f8      	beq.n	8010692 <_RVM_Virt_Switch+0x7a>
 80106a0:	4837      	ldr	r0, [pc, #220]	; (8010780 <_RVM_Virt_Switch+0x168>)
 80106a2:	f002 fb65 	bl	8012d70 <RVM_Print_String>
 80106a6:	4837      	ldr	r0, [pc, #220]	; (8010784 <_RVM_Virt_Switch+0x16c>)
 80106a8:	f002 fb62 	bl	8012d70 <RVM_Print_String>
 80106ac:	4836      	ldr	r0, [pc, #216]	; (8010788 <_RVM_Virt_Switch+0x170>)
 80106ae:	f002 fb5f 	bl	8012d70 <RVM_Print_String>
 80106b2:	208d      	movs	r0, #141	; 0x8d
 80106b4:	f002 faca 	bl	8012c4c <RVM_Print_Int>
 80106b8:	4834      	ldr	r0, [pc, #208]	; (801078c <_RVM_Virt_Switch+0x174>)
 80106ba:	f002 fb59 	bl	8012d70 <RVM_Print_String>
 80106be:	4834      	ldr	r0, [pc, #208]	; (8010790 <_RVM_Virt_Switch+0x178>)
 80106c0:	f002 fb56 	bl	8012d70 <RVM_Print_String>
 80106c4:	4833      	ldr	r0, [pc, #204]	; (8010794 <_RVM_Virt_Switch+0x17c>)
 80106c6:	f002 fb53 	bl	8012d70 <RVM_Print_String>
 80106ca:	4833      	ldr	r0, [pc, #204]	; (8010798 <_RVM_Virt_Switch+0x180>)
 80106cc:	f002 fb50 	bl	8012d70 <RVM_Print_String>
 80106d0:	482e      	ldr	r0, [pc, #184]	; (801078c <_RVM_Virt_Switch+0x174>)
 80106d2:	f002 fb4d 	bl	8012d70 <RVM_Print_String>
 80106d6:	e7fe      	b.n	80106d6 <_RVM_Virt_Switch+0xbe>
    
    /* Just change the thread's priorities */
    if(From!=0)
    {
        RVM_ASSERT(RVM_Thd_Sched_Prio(From->Cap.User_Thd, RVM_WAIT_PRIO)==0);
        RVM_ASSERT(RVM_Thd_Sched_Prio(From->Cap.Int_Thd, RVM_WAIT_PRIO)==0);
 80106d8:	4829      	ldr	r0, [pc, #164]	; (8010780 <_RVM_Virt_Switch+0x168>)
 80106da:	f002 fb49 	bl	8012d70 <RVM_Print_String>
 80106de:	4829      	ldr	r0, [pc, #164]	; (8010784 <_RVM_Virt_Switch+0x16c>)
 80106e0:	f002 fb46 	bl	8012d70 <RVM_Print_String>
 80106e4:	4828      	ldr	r0, [pc, #160]	; (8010788 <_RVM_Virt_Switch+0x170>)
 80106e6:	f002 fb43 	bl	8012d70 <RVM_Print_String>
 80106ea:	2083      	movs	r0, #131	; 0x83
 80106ec:	f002 faae 	bl	8012c4c <RVM_Print_Int>
 80106f0:	4826      	ldr	r0, [pc, #152]	; (801078c <_RVM_Virt_Switch+0x174>)
 80106f2:	f002 fb3d 	bl	8012d70 <RVM_Print_String>
 80106f6:	4826      	ldr	r0, [pc, #152]	; (8010790 <_RVM_Virt_Switch+0x178>)
 80106f8:	f002 fb3a 	bl	8012d70 <RVM_Print_String>
 80106fc:	4825      	ldr	r0, [pc, #148]	; (8010794 <_RVM_Virt_Switch+0x17c>)
 80106fe:	f002 fb37 	bl	8012d70 <RVM_Print_String>
 8010702:	4825      	ldr	r0, [pc, #148]	; (8010798 <_RVM_Virt_Switch+0x180>)
 8010704:	f002 fb34 	bl	8012d70 <RVM_Print_String>
 8010708:	4820      	ldr	r0, [pc, #128]	; (801078c <_RVM_Virt_Switch+0x174>)
 801070a:	f002 fb31 	bl	8012d70 <RVM_Print_String>
 801070e:	e7fe      	b.n	801070e <_RVM_Virt_Switch+0xf6>
    if(To!=0)
    {
        RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.User_Thd, RVM_USER_PRIO)==0);
        /* If the booting is not done yet, place the interrupt vector at the waiting level as always */
        if((To->Sched.State&RVM_VM_BOOTDONE)==0)
            RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.Int_Thd, RVM_WAIT_PRIO)==0);
 8010710:	481b      	ldr	r0, [pc, #108]	; (8010780 <_RVM_Virt_Switch+0x168>)
 8010712:	f002 fb2d 	bl	8012d70 <RVM_Print_String>
 8010716:	481b      	ldr	r0, [pc, #108]	; (8010784 <_RVM_Virt_Switch+0x16c>)
 8010718:	f002 fb2a 	bl	8012d70 <RVM_Print_String>
 801071c:	481a      	ldr	r0, [pc, #104]	; (8010788 <_RVM_Virt_Switch+0x170>)
 801071e:	f002 fb27 	bl	8012d70 <RVM_Print_String>
 8010722:	208b      	movs	r0, #139	; 0x8b
 8010724:	f002 fa92 	bl	8012c4c <RVM_Print_Int>
 8010728:	4818      	ldr	r0, [pc, #96]	; (801078c <_RVM_Virt_Switch+0x174>)
 801072a:	f002 fb21 	bl	8012d70 <RVM_Print_String>
 801072e:	4818      	ldr	r0, [pc, #96]	; (8010790 <_RVM_Virt_Switch+0x178>)
 8010730:	f002 fb1e 	bl	8012d70 <RVM_Print_String>
 8010734:	4817      	ldr	r0, [pc, #92]	; (8010794 <_RVM_Virt_Switch+0x17c>)
 8010736:	f002 fb1b 	bl	8012d70 <RVM_Print_String>
 801073a:	4817      	ldr	r0, [pc, #92]	; (8010798 <_RVM_Virt_Switch+0x180>)
 801073c:	f002 fb18 	bl	8012d70 <RVM_Print_String>
 8010740:	4812      	ldr	r0, [pc, #72]	; (801078c <_RVM_Virt_Switch+0x174>)
 8010742:	f002 fb15 	bl	8012d70 <RVM_Print_String>
 8010746:	e7fe      	b.n	8010746 <_RVM_Virt_Switch+0x12e>
        RVM_ASSERT(RVM_Thd_Sched_Prio(From->Cap.Int_Thd, RVM_WAIT_PRIO)==0);
    }
    
    if(To!=0)
    {
        RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.User_Thd, RVM_USER_PRIO)==0);
 8010748:	480d      	ldr	r0, [pc, #52]	; (8010780 <_RVM_Virt_Switch+0x168>)
 801074a:	f002 fb11 	bl	8012d70 <RVM_Print_String>
 801074e:	480d      	ldr	r0, [pc, #52]	; (8010784 <_RVM_Virt_Switch+0x16c>)
 8010750:	f002 fb0e 	bl	8012d70 <RVM_Print_String>
 8010754:	480c      	ldr	r0, [pc, #48]	; (8010788 <_RVM_Virt_Switch+0x170>)
 8010756:	f002 fb0b 	bl	8012d70 <RVM_Print_String>
 801075a:	2088      	movs	r0, #136	; 0x88
 801075c:	f002 fa76 	bl	8012c4c <RVM_Print_Int>
 8010760:	480a      	ldr	r0, [pc, #40]	; (801078c <_RVM_Virt_Switch+0x174>)
 8010762:	f002 fb05 	bl	8012d70 <RVM_Print_String>
 8010766:	480a      	ldr	r0, [pc, #40]	; (8010790 <_RVM_Virt_Switch+0x178>)
 8010768:	f002 fb02 	bl	8012d70 <RVM_Print_String>
 801076c:	4809      	ldr	r0, [pc, #36]	; (8010794 <_RVM_Virt_Switch+0x17c>)
 801076e:	f002 faff 	bl	8012d70 <RVM_Print_String>
 8010772:	4809      	ldr	r0, [pc, #36]	; (8010798 <_RVM_Virt_Switch+0x180>)
 8010774:	f002 fafc 	bl	8012d70 <RVM_Print_String>
 8010778:	4804      	ldr	r0, [pc, #16]	; (801078c <_RVM_Virt_Switch+0x174>)
 801077a:	f002 faf9 	bl	8012d70 <RVM_Print_String>
 801077e:	e7fe      	b.n	801077e <_RVM_Virt_Switch+0x166>
 8010780:	08012f08 	.word	0x08012f08
 8010784:	08013038 	.word	0x08013038
 8010788:	08012fa4 	.word	0x08012fa4
 801078c:	080134b0 	.word	0x080134b0
 8010790:	08012fac 	.word	0x08012fac
 8010794:	08012fb8 	.word	0x08012fb8
 8010798:	08012fbc 	.word	0x08012fbc

0801079c <_RVM_Set_Int_Flag>:
              rvm_ptr_t Int_Num - The interrupt number to set flag for.
Output      : None.
Return      : None.
******************************************************************************/
void _RVM_Set_Int_Flag(struct RVM_Virt* Virt, rvm_ptr_t Int_Num)
{
 801079c:	b410      	push	{r4}
    Virt->Image->Int_Flags[Int_Num>>RVM_WORD_ORDER]|=((rvm_ptr_t)1)<<(Int_Num&RVM_WORD_MASK);
 801079e:	6902      	ldr	r2, [r0, #16]
 80107a0:	2301      	movs	r3, #1
 80107a2:	0948      	lsrs	r0, r1, #5
 80107a4:	f001 010f 	and.w	r1, r1, #15
 80107a8:	6c92      	ldr	r2, [r2, #72]	; 0x48
 80107aa:	fa03 f101 	lsl.w	r1, r3, r1
 80107ae:	f852 4020 	ldr.w	r4, [r2, r0, lsl #2]
 80107b2:	4321      	orrs	r1, r4
 80107b4:	f842 1020 	str.w	r1, [r2, r0, lsl #2]
}
 80107b8:	f85d 4b04 	ldr.w	r4, [sp], #4
 80107bc:	4770      	bx	lr
 80107be:	bf00      	nop

080107c0 <RVM_Hyp_Enable_Int>:
Input       : None.
Output      : None.
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Enable_Int(void)
{
 80107c0:	b538      	push	{r3, r4, r5, lr}
    if((RVM_Cur_Virt->Sched.State&RVM_VM_INTENA)!=0)
 80107c2:	4d29      	ldr	r5, [pc, #164]	; (8010868 <RVM_Hyp_Enable_Int+0xa8>)
 80107c4:	682c      	ldr	r4, [r5, #0]
 80107c6:	6b63      	ldr	r3, [r4, #52]	; 0x34
 80107c8:	03d9      	lsls	r1, r3, #15
 80107ca:	d448      	bmi.n	801085e <RVM_Hyp_Enable_Int+0x9e>
        return RVM_ERR_STATE;
    else
    {
        /* If the virtual machine ever calls this, then it means that it have done booting */
        if((RVM_Cur_Virt->Sched.State&RVM_VM_BOOTDONE)==0)
 80107cc:	039a      	lsls	r2, r3, #14
 80107ce:	d519      	bpl.n	8010804 <RVM_Hyp_Enable_Int+0x44>
            RVM_Cur_Virt->Sched.State|=RVM_VM_BOOTDONE;
            RVM_ASSERT(RVM_Thd_Sched_Prio(RVM_Cur_Virt->Cap.Int_Thd, RVM_VINT_PRIO)==0);
            /* Because some toolchain will reinitialize the memory to zero, we need to init again */
            RVM_Stack_Init((rvm_ptr_t)(RVM_Cur_Virt->Image->Int_Stack),RVM_Cur_Virt->Image->Int_Size);
        }
        RVM_Cur_Virt->Sched.State|=RVM_VM_INTENA;
 80107d0:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
Return      : If there is one interrupt pending, return 1; else 0.
******************************************************************************/
rvm_ret_t _RVM_Check_Int_Pend(struct RVM_Virt* Virt)
{
    rvm_cnt_t Count;
    for(Count=0;Count<(Virt->Image->Int_Num)>>RVM_WORD_ORDER;Count++)
 80107d4:	6921      	ldr	r1, [r4, #16]
            RVM_Cur_Virt->Sched.State|=RVM_VM_BOOTDONE;
            RVM_ASSERT(RVM_Thd_Sched_Prio(RVM_Cur_Virt->Cap.Int_Thd, RVM_VINT_PRIO)==0);
            /* Because some toolchain will reinitialize the memory to zero, we need to init again */
            RVM_Stack_Init((rvm_ptr_t)(RVM_Cur_Virt->Image->Int_Stack),RVM_Cur_Virt->Image->Int_Size);
        }
        RVM_Cur_Virt->Sched.State|=RVM_VM_INTENA;
 80107d6:	6363      	str	r3, [r4, #52]	; 0x34
Return      : If there is one interrupt pending, return 1; else 0.
******************************************************************************/
rvm_ret_t _RVM_Check_Int_Pend(struct RVM_Virt* Virt)
{
    rvm_cnt_t Count;
    for(Count=0;Count<(Virt->Image->Int_Num)>>RVM_WORD_ORDER;Count++)
 80107d8:	6c4b      	ldr	r3, [r1, #68]	; 0x44
 80107da:	095a      	lsrs	r2, r3, #5
 80107dc:	d042      	beq.n	8010864 <RVM_Hyp_Enable_Int+0xa4>
    {
        if(Virt->Image->Int_Flags[Count]!=0)
 80107de:	6c8b      	ldr	r3, [r1, #72]	; 0x48
 80107e0:	6819      	ldr	r1, [r3, #0]
 80107e2:	b951      	cbnz	r1, 80107fa <RVM_Hyp_Enable_Int+0x3a>
 80107e4:	eb03 0282 	add.w	r2, r3, r2, lsl #2
 80107e8:	3304      	adds	r3, #4
 80107ea:	e002      	b.n	80107f2 <RVM_Hyp_Enable_Int+0x32>
 80107ec:	f853 1b04 	ldr.w	r1, [r3], #4
 80107f0:	b919      	cbnz	r1, 80107fa <RVM_Hyp_Enable_Int+0x3a>
Return      : If there is one interrupt pending, return 1; else 0.
******************************************************************************/
rvm_ret_t _RVM_Check_Int_Pend(struct RVM_Virt* Virt)
{
    rvm_cnt_t Count;
    for(Count=0;Count<(Virt->Image->Int_Num)>>RVM_WORD_ORDER;Count++)
 80107f2:	429a      	cmp	r2, r3
 80107f4:	d1fa      	bne.n	80107ec <RVM_Hyp_Enable_Int+0x2c>
        /* See if we do have excess interrupt to process. If yes, send to the endpoint now */
        if(_RVM_Check_Int_Pend(RVM_Cur_Virt)!=0)
            RVM_Sig_Snd(RVM_Cur_Virt->Cap.Int_Sig);
    }

    return 0;
 80107f6:	2000      	movs	r0, #0
}
 80107f8:	bd38      	pop	{r3, r4, r5, pc}
            RVM_Stack_Init((rvm_ptr_t)(RVM_Cur_Virt->Image->Int_Stack),RVM_Cur_Virt->Image->Int_Size);
        }
        RVM_Cur_Virt->Sched.State|=RVM_VM_INTENA;
        /* See if we do have excess interrupt to process. If yes, send to the endpoint now */
        if(_RVM_Check_Int_Pend(RVM_Cur_Virt)!=0)
            RVM_Sig_Snd(RVM_Cur_Virt->Cap.Int_Sig);
 80107fa:	6aa0      	ldr	r0, [r4, #40]	; 0x28
 80107fc:	f002 fb74 	bl	8012ee8 <RVM_Sig_Snd>
    }

    return 0;
 8010800:	2000      	movs	r0, #0
}
 8010802:	bd38      	pop	{r3, r4, r5, pc}
    else
    {
        /* If the virtual machine ever calls this, then it means that it have done booting */
        if((RVM_Cur_Virt->Sched.State&RVM_VM_BOOTDONE)==0)
        {
            RVM_Cur_Virt->Sched.State|=RVM_VM_BOOTDONE;
 8010804:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
            RVM_ASSERT(RVM_Thd_Sched_Prio(RVM_Cur_Virt->Cap.Int_Thd, RVM_VINT_PRIO)==0);
 8010808:	6a20      	ldr	r0, [r4, #32]
 801080a:	2103      	movs	r1, #3
    else
    {
        /* If the virtual machine ever calls this, then it means that it have done booting */
        if((RVM_Cur_Virt->Sched.State&RVM_VM_BOOTDONE)==0)
        {
            RVM_Cur_Virt->Sched.State|=RVM_VM_BOOTDONE;
 801080c:	6363      	str	r3, [r4, #52]	; 0x34
            RVM_ASSERT(RVM_Thd_Sched_Prio(RVM_Cur_Virt->Cap.Int_Thd, RVM_VINT_PRIO)==0);
 801080e:	f002 fb57 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 8010812:	b1d8      	cbz	r0, 801084c <RVM_Hyp_Enable_Int+0x8c>
 8010814:	4815      	ldr	r0, [pc, #84]	; (801086c <RVM_Hyp_Enable_Int+0xac>)
 8010816:	f002 faab 	bl	8012d70 <RVM_Print_String>
 801081a:	4815      	ldr	r0, [pc, #84]	; (8010870 <RVM_Hyp_Enable_Int+0xb0>)
 801081c:	f002 faa8 	bl	8012d70 <RVM_Print_String>
 8010820:	4814      	ldr	r0, [pc, #80]	; (8010874 <RVM_Hyp_Enable_Int+0xb4>)
 8010822:	f002 faa5 	bl	8012d70 <RVM_Print_String>
 8010826:	20d0      	movs	r0, #208	; 0xd0
 8010828:	f002 fa10 	bl	8012c4c <RVM_Print_Int>
 801082c:	4812      	ldr	r0, [pc, #72]	; (8010878 <RVM_Hyp_Enable_Int+0xb8>)
 801082e:	f002 fa9f 	bl	8012d70 <RVM_Print_String>
 8010832:	4812      	ldr	r0, [pc, #72]	; (801087c <RVM_Hyp_Enable_Int+0xbc>)
 8010834:	f002 fa9c 	bl	8012d70 <RVM_Print_String>
 8010838:	4811      	ldr	r0, [pc, #68]	; (8010880 <RVM_Hyp_Enable_Int+0xc0>)
 801083a:	f002 fa99 	bl	8012d70 <RVM_Print_String>
 801083e:	4811      	ldr	r0, [pc, #68]	; (8010884 <RVM_Hyp_Enable_Int+0xc4>)
 8010840:	f002 fa96 	bl	8012d70 <RVM_Print_String>
 8010844:	480c      	ldr	r0, [pc, #48]	; (8010878 <RVM_Hyp_Enable_Int+0xb8>)
 8010846:	f002 fa93 	bl	8012d70 <RVM_Print_String>
 801084a:	e7fe      	b.n	801084a <RVM_Hyp_Enable_Int+0x8a>
            /* Because some toolchain will reinitialize the memory to zero, we need to init again */
            RVM_Stack_Init((rvm_ptr_t)(RVM_Cur_Virt->Image->Int_Stack),RVM_Cur_Virt->Image->Int_Size);
 801084c:	682b      	ldr	r3, [r5, #0]
 801084e:	691b      	ldr	r3, [r3, #16]
 8010850:	6a99      	ldr	r1, [r3, #40]	; 0x28
 8010852:	6a58      	ldr	r0, [r3, #36]	; 0x24
 8010854:	f7ff fc30 	bl	80100b8 <RVM_Stack_Init>
 8010858:	682c      	ldr	r4, [r5, #0]
 801085a:	6b63      	ldr	r3, [r4, #52]	; 0x34
 801085c:	e7b8      	b.n	80107d0 <RVM_Hyp_Enable_Int+0x10>
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Enable_Int(void)
{
    if((RVM_Cur_Virt->Sched.State&RVM_VM_INTENA)!=0)
        return RVM_ERR_STATE;
 801085e:	f04f 30ff 	mov.w	r0, #4294967295
 8010862:	bd38      	pop	{r3, r4, r5, pc}
        /* See if we do have excess interrupt to process. If yes, send to the endpoint now */
        if(_RVM_Check_Int_Pend(RVM_Cur_Virt)!=0)
            RVM_Sig_Snd(RVM_Cur_Virt->Cap.Int_Sig);
    }

    return 0;
 8010864:	4610      	mov	r0, r2
 8010866:	bd38      	pop	{r3, r4, r5, pc}
 8010868:	2001ea60 	.word	0x2001ea60
 801086c:	08012f08 	.word	0x08012f08
 8010870:	08013038 	.word	0x08013038
 8010874:	08012fa4 	.word	0x08012fa4
 8010878:	080134b0 	.word	0x080134b0
 801087c:	08012fac 	.word	0x08012fac
 8010880:	08012fb8 	.word	0x08012fb8
 8010884:	08012fbc 	.word	0x08012fbc

08010888 <RVM_Hyp_Disable_Int>:
Output      : None.
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Disable_Int(void)
{
    if((RVM_Cur_Virt->Sched.State&RVM_VM_INTENA)==0)
 8010888:	4b06      	ldr	r3, [pc, #24]	; (80108a4 <RVM_Hyp_Disable_Int+0x1c>)
 801088a:	681a      	ldr	r2, [r3, #0]
 801088c:	6b53      	ldr	r3, [r2, #52]	; 0x34
 801088e:	03d9      	lsls	r1, r3, #15
 8010890:	d504      	bpl.n	801089c <RVM_Hyp_Disable_Int+0x14>
        return RVM_ERR_STATE;
    else
        RVM_Cur_Virt->Sched.State&=~RVM_VM_INTENA;
 8010892:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000

    return 0;
 8010896:	2000      	movs	r0, #0
rvm_ret_t RVM_Hyp_Disable_Int(void)
{
    if((RVM_Cur_Virt->Sched.State&RVM_VM_INTENA)==0)
        return RVM_ERR_STATE;
    else
        RVM_Cur_Virt->Sched.State&=~RVM_VM_INTENA;
 8010898:	6353      	str	r3, [r2, #52]	; 0x34

    return 0;
 801089a:	4770      	bx	lr
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Disable_Int(void)
{
    if((RVM_Cur_Virt->Sched.State&RVM_VM_INTENA)==0)
        return RVM_ERR_STATE;
 801089c:	f04f 30ff 	mov.w	r0, #4294967295
    else
        RVM_Cur_Virt->Sched.State&=~RVM_VM_INTENA;

    return 0;
}
 80108a0:	4770      	bx	lr
 80108a2:	bf00      	nop
 80108a4:	2001ea60 	.word	0x2001ea60

080108a8 <RVM_Hyp_Reg_Int>:
{
    struct RVM_Int* Int;
    rvm_ptr_t VMID;
    
    /* See if both numbers are overrange */
    if((Vect_Num>=RVM_INT_VECT_NUM)||(Int_Num>=(RVM_Cur_Virt->Image->Int_Num)))
 80108a8:	286d      	cmp	r0, #109	; 0x6d
 80108aa:	d83e      	bhi.n	801092a <RVM_Hyp_Reg_Int+0x82>
              rvm_ptr_t Int_Num - The virtual vector number.
Output      : None.
Return      : rvm_ret_t - If successful, the interrupt registration ID; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Reg_Int(rvm_ptr_t Vect_Num, rvm_ptr_t Int_Num)
{
 80108ac:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    struct RVM_Int* Int;
    rvm_ptr_t VMID;
    
    /* See if both numbers are overrange */
    if((Vect_Num>=RVM_INT_VECT_NUM)||(Int_Num>=(RVM_Cur_Virt->Image->Int_Num)))
 80108b0:	4b21      	ldr	r3, [pc, #132]	; (8010938 <RVM_Hyp_Reg_Int+0x90>)
 80108b2:	681b      	ldr	r3, [r3, #0]
 80108b4:	691a      	ldr	r2, [r3, #16]
 80108b6:	6c52      	ldr	r2, [r2, #68]	; 0x44
 80108b8:	428a      	cmp	r2, r1
 80108ba:	d939      	bls.n	8010930 <RVM_Hyp_Reg_Int+0x88>
        return RVM_ERR_RANGE;
    
    /* Check if the VM have registered for this interrupt before */
    VMID=RVM_VMID(RVM_Cur_Virt);
 80108bc:	4c1f      	ldr	r4, [pc, #124]	; (801093c <RVM_Hyp_Reg_Int+0x94>)
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
 80108be:	4f20      	ldr	r7, [pc, #128]	; (8010940 <RVM_Hyp_Reg_Int+0x98>)
    /* See if both numbers are overrange */
    if((Vect_Num>=RVM_INT_VECT_NUM)||(Int_Num>=(RVM_Cur_Virt->Image->Int_Num)))
        return RVM_ERR_RANGE;
    
    /* Check if the VM have registered for this interrupt before */
    VMID=RVM_VMID(RVM_Cur_Virt);
 80108c0:	1b1b      	subs	r3, r3, r4
 80108c2:	4a20      	ldr	r2, [pc, #128]	; (8010944 <RVM_Hyp_Reg_Int+0x9c>)
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
 80108c4:	eb07 06c0 	add.w	r6, r7, r0, lsl #3
    /* See if both numbers are overrange */
    if((Vect_Num>=RVM_INT_VECT_NUM)||(Int_Num>=(RVM_Cur_Virt->Image->Int_Num)))
        return RVM_ERR_RANGE;
    
    /* Check if the VM have registered for this interrupt before */
    VMID=RVM_VMID(RVM_Cur_Virt);
 80108c8:	089c      	lsrs	r4, r3, #2
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
 80108ca:	6873      	ldr	r3, [r6, #4]
    /* See if both numbers are overrange */
    if((Vect_Num>=RVM_INT_VECT_NUM)||(Int_Num>=(RVM_Cur_Virt->Image->Int_Num)))
        return RVM_ERR_RANGE;
    
    /* Check if the VM have registered for this interrupt before */
    VMID=RVM_VMID(RVM_Cur_Virt);
 80108cc:	fba2 2404 	umull	r2, r4, r2, r4
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
    while(Int!=(struct RVM_Int*)(&RVM_Int_Vect[Vect_Num]))
 80108d0:	42b3      	cmp	r3, r6
    /* See if both numbers are overrange */
    if((Vect_Num>=RVM_INT_VECT_NUM)||(Int_Num>=(RVM_Cur_Virt->Image->Int_Num)))
        return RVM_ERR_RANGE;
    
    /* Check if the VM have registered for this interrupt before */
    VMID=RVM_VMID(RVM_Cur_Virt);
 80108d2:	ea4f 0454 	mov.w	r4, r4, lsr #1
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
    while(Int!=(struct RVM_Int*)(&RVM_Int_Vect[Vect_Num]))
 80108d6:	d009      	beq.n	80108ec <RVM_Hyp_Reg_Int+0x44>
    {
        if(Int->VM_ID==VMID)
 80108d8:	68da      	ldr	r2, [r3, #12]
 80108da:	4294      	cmp	r4, r2
 80108dc:	d103      	bne.n	80108e6 <RVM_Hyp_Reg_Int+0x3e>
 80108de:	e020      	b.n	8010922 <RVM_Hyp_Reg_Int+0x7a>
 80108e0:	68dd      	ldr	r5, [r3, #12]
 80108e2:	42ac      	cmp	r4, r5
 80108e4:	d01d      	beq.n	8010922 <RVM_Hyp_Reg_Int+0x7a>
            return RVM_ERR_INT;
        
        Int=(struct RVM_Int*)(Int->Head.Next);
 80108e6:	685b      	ldr	r3, [r3, #4]
        return RVM_ERR_RANGE;
    
    /* Check if the VM have registered for this interrupt before */
    VMID=RVM_VMID(RVM_Cur_Virt);
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
    while(Int!=(struct RVM_Int*)(&RVM_Int_Vect[Vect_Num]))
 80108e8:	42b3      	cmp	r3, r6
 80108ea:	d1f9      	bne.n	80108e0 <RVM_Hyp_Reg_Int+0x38>
        
        Int=(struct RVM_Int*)(Int->Head.Next);
    }
    
    /* See if there are empty interrupt registration blocks available */
    if(RVM_Int_Free.Next==&RVM_Int_Free)
 80108ec:	4b16      	ldr	r3, [pc, #88]	; (8010948 <RVM_Hyp_Reg_Int+0xa0>)
 80108ee:	f8d3 8004 	ldr.w	r8, [r3, #4]
 80108f2:	4598      	cmp	r8, r3
 80108f4:	d015      	beq.n	8010922 <RVM_Hyp_Reg_Int+0x7a>
 80108f6:	4605      	mov	r5, r0
 80108f8:	4689      	mov	r9, r1
        return RVM_ERR_INT;
    
    /* Insert this event into the current VM's event list */
    Int=(struct RVM_Int*)(RVM_Int_Free.Next);
    RVM_List_Del(Int->Head.Prev,Int->Head.Next);
 80108fa:	e898 0003 	ldmia.w	r8, {r0, r1}
 80108fe:	f002 f99b 	bl	8012c38 <RVM_List_Del>
    RVM_List_Ins(&(Int->Head),RVM_Int_Vect[Vect_Num].Prev, &RVM_Int_Vect[Vect_Num]);
 8010902:	4640      	mov	r0, r8
 8010904:	4632      	mov	r2, r6
 8010906:	f857 1035 	ldr.w	r1, [r7, r5, lsl #3]
 801090a:	f002 f999 	bl	8012c40 <RVM_List_Ins>
    
    Int->State=RVM_INT_USED;
 801090e:	2301      	movs	r3, #1
    Int->Int_Num=Int_Num;
 8010910:	f8c8 9010 	str.w	r9, [r8, #16]
    Int->VM_ID=VMID;
    
    return 0;
 8010914:	2000      	movs	r0, #0
    RVM_List_Del(Int->Head.Prev,Int->Head.Next);
    RVM_List_Ins(&(Int->Head),RVM_Int_Vect[Vect_Num].Prev, &RVM_Int_Vect[Vect_Num]);
    
    Int->State=RVM_INT_USED;
    Int->Int_Num=Int_Num;
    Int->VM_ID=VMID;
 8010916:	f8c8 400c 	str.w	r4, [r8, #12]
    /* Insert this event into the current VM's event list */
    Int=(struct RVM_Int*)(RVM_Int_Free.Next);
    RVM_List_Del(Int->Head.Prev,Int->Head.Next);
    RVM_List_Ins(&(Int->Head),RVM_Int_Vect[Vect_Num].Prev, &RVM_Int_Vect[Vect_Num]);
    
    Int->State=RVM_INT_USED;
 801091a:	f8c8 3008 	str.w	r3, [r8, #8]
    Int->Int_Num=Int_Num;
    Int->VM_ID=VMID;
    
    return 0;
 801091e:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    VMID=RVM_VMID(RVM_Cur_Virt);
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
    while(Int!=(struct RVM_Int*)(&RVM_Int_Vect[Vect_Num]))
    {
        if(Int->VM_ID==VMID)
            return RVM_ERR_INT;
 8010922:	f06f 0003 	mvn.w	r0, #3
    Int->State=RVM_INT_USED;
    Int->Int_Num=Int_Num;
    Int->VM_ID=VMID;
    
    return 0;
}
 8010926:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    struct RVM_Int* Int;
    rvm_ptr_t VMID;
    
    /* See if both numbers are overrange */
    if((Vect_Num>=RVM_INT_VECT_NUM)||(Int_Num>=(RVM_Cur_Virt->Image->Int_Num)))
        return RVM_ERR_RANGE;
 801092a:	f06f 0001 	mvn.w	r0, #1
    Int->State=RVM_INT_USED;
    Int->Int_Num=Int_Num;
    Int->VM_ID=VMID;
    
    return 0;
}
 801092e:	4770      	bx	lr
    struct RVM_Int* Int;
    rvm_ptr_t VMID;
    
    /* See if both numbers are overrange */
    if((Vect_Num>=RVM_INT_VECT_NUM)||(Int_Num>=(RVM_Cur_Virt->Image->Int_Num)))
        return RVM_ERR_RANGE;
 8010930:	f06f 0001 	mvn.w	r0, #1
 8010934:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8010938:	2001ea60 	.word	0x2001ea60
 801093c:	2001e384 	.word	0x2001e384
 8010940:	2001e00c 	.word	0x2001e00c
 8010944:	1af286bd 	.word	0x1af286bd
 8010948:	2001e37c 	.word	0x2001e37c

0801094c <RVM_Hyp_Del_Int>:
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Del_Int(rvm_cnt_t Int_ID)
{
    /* See if the number is overrange */
    if(Int_ID>=RVM_INT_MAP_NUM)
 801094c:	f5b0 6f80 	cmp.w	r0, #1024	; 0x400
 8010950:	da23      	bge.n	801099a <RVM_Hyp_Del_Int+0x4e>
        return RVM_ERR_RANGE;
    
    /* Is the block empty? */
    if(RVM_Int_DB[Int_ID].State==RVM_INT_FREE)
 8010952:	eb00 0080 	add.w	r0, r0, r0, lsl #2
Input       : rvm_cnt_t Int_ID - The interrupt registration ID returned by RVM_Hyp_Reg_Int.
Output      : None.
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Del_Int(rvm_cnt_t Int_ID)
{
 8010956:	b570      	push	{r4, r5, r6, lr}
    /* See if the number is overrange */
    if(Int_ID>=RVM_INT_MAP_NUM)
        return RVM_ERR_RANGE;
    
    /* Is the block empty? */
    if(RVM_Int_DB[Int_ID].State==RVM_INT_FREE)
 8010958:	0083      	lsls	r3, r0, #2
 801095a:	4e13      	ldr	r6, [pc, #76]	; (80109a8 <RVM_Hyp_Del_Int+0x5c>)
 801095c:	18f4      	adds	r4, r6, r3
 801095e:	68a2      	ldr	r2, [r4, #8]
 8010960:	b1f2      	cbz	r2, 80109a0 <RVM_Hyp_Del_Int+0x54>
        return RVM_ERR_STATE;
    
    /* Are we the creator of the channel? */
    if(RVM_Int_DB[Int_ID].VM_ID!=RVM_VMID(RVM_Cur_Virt))
 8010962:	4912      	ldr	r1, [pc, #72]	; (80109ac <RVM_Hyp_Del_Int+0x60>)
 8010964:	4a12      	ldr	r2, [pc, #72]	; (80109b0 <RVM_Hyp_Del_Int+0x64>)
 8010966:	6809      	ldr	r1, [r1, #0]
 8010968:	4812      	ldr	r0, [pc, #72]	; (80109b4 <RVM_Hyp_Del_Int+0x68>)
 801096a:	1a8a      	subs	r2, r1, r2
 801096c:	68e1      	ldr	r1, [r4, #12]
 801096e:	0892      	lsrs	r2, r2, #2
 8010970:	fba0 0202 	umull	r0, r2, r0, r2
 8010974:	ebb1 0f52 	cmp.w	r1, r2, lsr #1
 8010978:	d10c      	bne.n	8010994 <RVM_Hyp_Del_Int+0x48>
        return RVM_ERR_INT;
    
    /* Delete it from database */
    RVM_Int_DB[Int_ID].State=RVM_EVT_FREE;
 801097a:	2500      	movs	r5, #0
    RVM_List_Del(RVM_Int_DB[Int_ID].Head.Prev,RVM_Int_DB[Int_ID].Head.Next);
 801097c:	58f0      	ldr	r0, [r6, r3]
 801097e:	6861      	ldr	r1, [r4, #4]
    /* Are we the creator of the channel? */
    if(RVM_Int_DB[Int_ID].VM_ID!=RVM_VMID(RVM_Cur_Virt))
        return RVM_ERR_INT;
    
    /* Delete it from database */
    RVM_Int_DB[Int_ID].State=RVM_EVT_FREE;
 8010980:	60a5      	str	r5, [r4, #8]
    RVM_List_Del(RVM_Int_DB[Int_ID].Head.Prev,RVM_Int_DB[Int_ID].Head.Next);
 8010982:	f002 f959 	bl	8012c38 <RVM_List_Del>
    RVM_List_Ins(&(RVM_Int_DB[Int_ID].Head),RVM_Int_Free.Prev, &(RVM_Int_Free));
 8010986:	4a0c      	ldr	r2, [pc, #48]	; (80109b8 <RVM_Hyp_Del_Int+0x6c>)
 8010988:	4620      	mov	r0, r4
 801098a:	6811      	ldr	r1, [r2, #0]
 801098c:	f002 f958 	bl	8012c40 <RVM_List_Ins>
    
    return 0;
 8010990:	4628      	mov	r0, r5
 8010992:	bd70      	pop	{r4, r5, r6, pc}
    if(RVM_Int_DB[Int_ID].State==RVM_INT_FREE)
        return RVM_ERR_STATE;
    
    /* Are we the creator of the channel? */
    if(RVM_Int_DB[Int_ID].VM_ID!=RVM_VMID(RVM_Cur_Virt))
        return RVM_ERR_INT;
 8010994:	f06f 0003 	mvn.w	r0, #3
    RVM_Int_DB[Int_ID].State=RVM_EVT_FREE;
    RVM_List_Del(RVM_Int_DB[Int_ID].Head.Prev,RVM_Int_DB[Int_ID].Head.Next);
    RVM_List_Ins(&(RVM_Int_DB[Int_ID].Head),RVM_Int_Free.Prev, &(RVM_Int_Free));
    
    return 0;
}
 8010998:	bd70      	pop	{r4, r5, r6, pc}
******************************************************************************/
rvm_ret_t RVM_Hyp_Del_Int(rvm_cnt_t Int_ID)
{
    /* See if the number is overrange */
    if(Int_ID>=RVM_INT_MAP_NUM)
        return RVM_ERR_RANGE;
 801099a:	f06f 0001 	mvn.w	r0, #1
    RVM_Int_DB[Int_ID].State=RVM_EVT_FREE;
    RVM_List_Del(RVM_Int_DB[Int_ID].Head.Prev,RVM_Int_DB[Int_ID].Head.Next);
    RVM_List_Ins(&(RVM_Int_DB[Int_ID].Head),RVM_Int_Free.Prev, &(RVM_Int_Free));
    
    return 0;
}
 801099e:	4770      	bx	lr
    if(Int_ID>=RVM_INT_MAP_NUM)
        return RVM_ERR_RANGE;
    
    /* Is the block empty? */
    if(RVM_Int_DB[Int_ID].State==RVM_INT_FREE)
        return RVM_ERR_STATE;
 80109a0:	f04f 30ff 	mov.w	r0, #4294967295
 80109a4:	bd70      	pop	{r4, r5, r6, pc}
 80109a6:	bf00      	nop
 80109a8:	20019004 	.word	0x20019004
 80109ac:	2001ea60 	.word	0x2001ea60
 80109b0:	2001e384 	.word	0x2001e384
 80109b4:	1af286bd 	.word	0x1af286bd
 80109b8:	2001e37c 	.word	0x2001e37c

080109bc <RVM_Hyp_Reg_Evt>:
              rvm_ptr_t Stack - The stack of the interrupt.
Output      : None.
Return      : rvm_ret_t - If successful, the event channel ID; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Reg_Evt(rvm_ptr_t Int_Num, rvm_ptr_t VMID)
{
 80109bc:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    struct RVM_Evt* Event;
    
    /* See if both numbers are overrange */
    if((VMID>=RVM_VM_Num)||(Int_Num>=(RVM_Cur_Virt->Image->Int_Num)))
 80109c0:	4b1d      	ldr	r3, [pc, #116]	; (8010a38 <RVM_Hyp_Reg_Evt+0x7c>)
 80109c2:	681b      	ldr	r3, [r3, #0]
 80109c4:	428b      	cmp	r3, r1
 80109c6:	d92f      	bls.n	8010a28 <RVM_Hyp_Reg_Evt+0x6c>
 80109c8:	f8df 9078 	ldr.w	r9, [pc, #120]	; 8010a44 <RVM_Hyp_Reg_Evt+0x88>
 80109cc:	f8d9 3000 	ldr.w	r3, [r9]
 80109d0:	691b      	ldr	r3, [r3, #16]
 80109d2:	6c5b      	ldr	r3, [r3, #68]	; 0x44
 80109d4:	4283      	cmp	r3, r0
 80109d6:	d927      	bls.n	8010a28 <RVM_Hyp_Reg_Evt+0x6c>
        return RVM_ERR_RANGE;
    
    /* See if there are empty events available */
    if(RVM_Evt_Free.Next==&RVM_Evt_Free)
 80109d8:	4b18      	ldr	r3, [pc, #96]	; (8010a3c <RVM_Hyp_Reg_Evt+0x80>)
 80109da:	685c      	ldr	r4, [r3, #4]
 80109dc:	429c      	cmp	r4, r3
 80109de:	d027      	beq.n	8010a30 <RVM_Hyp_Reg_Evt+0x74>
 80109e0:	460e      	mov	r6, r1
        return RVM_ERR_EVENT;
    
    /* Insert this event into the current VM's event list */
    Event=(struct RVM_Evt*)(RVM_Evt_Free.Next);
    RVM_List_Del(Event->Head.Prev,Event->Head.Next);
    RVM_List_Ins(&(Event->Head),RVM_Virt_DB[VMID].Evt_Head.Prev, &(RVM_Virt_DB[VMID].Evt_Head));
 80109e2:	254c      	movs	r5, #76	; 0x4c
 80109e4:	f8df 8060 	ldr.w	r8, [pc, #96]	; 8010a48 <RVM_Hyp_Reg_Evt+0x8c>
 80109e8:	4607      	mov	r7, r0
 80109ea:	fb05 f506 	mul.w	r5, r5, r6
    if(RVM_Evt_Free.Next==&RVM_Evt_Free)
        return RVM_ERR_EVENT;
    
    /* Insert this event into the current VM's event list */
    Event=(struct RVM_Evt*)(RVM_Evt_Free.Next);
    RVM_List_Del(Event->Head.Prev,Event->Head.Next);
 80109ee:	e894 0003 	ldmia.w	r4, {r0, r1}
 80109f2:	f002 f921 	bl	8012c38 <RVM_List_Del>
    RVM_List_Ins(&(Event->Head),RVM_Virt_DB[VMID].Evt_Head.Prev, &(RVM_Virt_DB[VMID].Evt_Head));
 80109f6:	eb08 0205 	add.w	r2, r8, r5
 80109fa:	4620      	mov	r0, r4
 80109fc:	4615      	mov	r5, r2
 80109fe:	3244      	adds	r2, #68	; 0x44
 8010a00:	6c69      	ldr	r1, [r5, #68]	; 0x44
    
    Event->State=RVM_EVT_USED;
 8010a02:	2501      	movs	r5, #1
        return RVM_ERR_EVENT;
    
    /* Insert this event into the current VM's event list */
    Event=(struct RVM_Evt*)(RVM_Evt_Free.Next);
    RVM_List_Del(Event->Head.Prev,Event->Head.Next);
    RVM_List_Ins(&(Event->Head),RVM_Virt_DB[VMID].Evt_Head.Prev, &(RVM_Virt_DB[VMID].Evt_Head));
 8010a04:	f002 f91c 	bl	8012c40 <RVM_List_Ins>
    
    Event->State=RVM_EVT_USED;
    Event->Int_Num=Int_Num;
    Event->Rcv_VM_ID=RVM_VMID(RVM_Cur_Virt);
 8010a08:	f8d9 2000 	ldr.w	r2, [r9]
 8010a0c:	490c      	ldr	r1, [pc, #48]	; (8010a40 <RVM_Hyp_Reg_Evt+0x84>)
    Event->Snd_VM_ID=VMID;
    
    return 0;
 8010a0e:	2000      	movs	r0, #0
    RVM_List_Del(Event->Head.Prev,Event->Head.Next);
    RVM_List_Ins(&(Event->Head),RVM_Virt_DB[VMID].Evt_Head.Prev, &(RVM_Virt_DB[VMID].Evt_Head));
    
    Event->State=RVM_EVT_USED;
    Event->Int_Num=Int_Num;
    Event->Rcv_VM_ID=RVM_VMID(RVM_Cur_Virt);
 8010a10:	ebc8 0302 	rsb	r3, r8, r2
    Event=(struct RVM_Evt*)(RVM_Evt_Free.Next);
    RVM_List_Del(Event->Head.Prev,Event->Head.Next);
    RVM_List_Ins(&(Event->Head),RVM_Virt_DB[VMID].Evt_Head.Prev, &(RVM_Virt_DB[VMID].Evt_Head));
    
    Event->State=RVM_EVT_USED;
    Event->Int_Num=Int_Num;
 8010a14:	60e7      	str	r7, [r4, #12]
    Event->Rcv_VM_ID=RVM_VMID(RVM_Cur_Virt);
    Event->Snd_VM_ID=VMID;
 8010a16:	6126      	str	r6, [r4, #16]
    RVM_List_Del(Event->Head.Prev,Event->Head.Next);
    RVM_List_Ins(&(Event->Head),RVM_Virt_DB[VMID].Evt_Head.Prev, &(RVM_Virt_DB[VMID].Evt_Head));
    
    Event->State=RVM_EVT_USED;
    Event->Int_Num=Int_Num;
    Event->Rcv_VM_ID=RVM_VMID(RVM_Cur_Virt);
 8010a18:	089b      	lsrs	r3, r3, #2
    /* Insert this event into the current VM's event list */
    Event=(struct RVM_Evt*)(RVM_Evt_Free.Next);
    RVM_List_Del(Event->Head.Prev,Event->Head.Next);
    RVM_List_Ins(&(Event->Head),RVM_Virt_DB[VMID].Evt_Head.Prev, &(RVM_Virt_DB[VMID].Evt_Head));
    
    Event->State=RVM_EVT_USED;
 8010a1a:	60a5      	str	r5, [r4, #8]
    Event->Int_Num=Int_Num;
    Event->Rcv_VM_ID=RVM_VMID(RVM_Cur_Virt);
 8010a1c:	fba1 2303 	umull	r2, r3, r1, r3
 8010a20:	40eb      	lsrs	r3, r5
 8010a22:	6163      	str	r3, [r4, #20]
    Event->Snd_VM_ID=VMID;
    
    return 0;
 8010a24:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
{
    struct RVM_Evt* Event;
    
    /* See if both numbers are overrange */
    if((VMID>=RVM_VM_Num)||(Int_Num>=(RVM_Cur_Virt->Image->Int_Num)))
        return RVM_ERR_RANGE;
 8010a28:	f06f 0001 	mvn.w	r0, #1
 8010a2c:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    
    /* See if there are empty events available */
    if(RVM_Evt_Free.Next==&RVM_Evt_Free)
        return RVM_ERR_EVENT;
 8010a30:	f06f 0004 	mvn.w	r0, #4
    Event->Int_Num=Int_Num;
    Event->Rcv_VM_ID=RVM_VMID(RVM_Cur_Virt);
    Event->Snd_VM_ID=VMID;
    
    return 0;
}
 8010a34:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8010a38:	2001ea50 	.word	0x2001ea50
 8010a3c:	2001e004 	.word	0x2001e004
 8010a40:	1af286bd 	.word	0x1af286bd
 8010a44:	2001ea60 	.word	0x2001ea60
 8010a48:	2001e384 	.word	0x2001e384

08010a4c <RVM_Hyp_Del_Evt>:
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Del_Evt(rvm_cnt_t Evt_ID)
{
    /* See if the number is overrange */
    if(Evt_ID>=RVM_EVT_MAP_NUM)
 8010a4c:	f5b0 6f80 	cmp.w	r0, #1024	; 0x400
 8010a50:	da23      	bge.n	8010a9a <RVM_Hyp_Del_Evt+0x4e>
        return RVM_ERR_RANGE;
    
    /* Is the block empty? */
    if(RVM_Evt_DB[Evt_ID].State==RVM_EVT_FREE)
 8010a52:	eb00 0040 	add.w	r0, r0, r0, lsl #1
Input       : rvm_cnt_t Evt_ID - The ID of the event block to delete.
Output      : None.
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Del_Evt(rvm_cnt_t Evt_ID)
{
 8010a56:	b570      	push	{r4, r5, r6, lr}
    /* See if the number is overrange */
    if(Evt_ID>=RVM_EVT_MAP_NUM)
        return RVM_ERR_RANGE;
    
    /* Is the block empty? */
    if(RVM_Evt_DB[Evt_ID].State==RVM_EVT_FREE)
 8010a58:	00c3      	lsls	r3, r0, #3
 8010a5a:	4e13      	ldr	r6, [pc, #76]	; (8010aa8 <RVM_Hyp_Del_Evt+0x5c>)
 8010a5c:	18f4      	adds	r4, r6, r3
 8010a5e:	68a2      	ldr	r2, [r4, #8]
 8010a60:	b1f2      	cbz	r2, 8010aa0 <RVM_Hyp_Del_Evt+0x54>
        return RVM_ERR_STATE;
    
    /* Are we the creator of the event? */
    if(RVM_Evt_DB[Evt_ID].Rcv_VM_ID!=RVM_VMID(RVM_Cur_Virt))
 8010a62:	4912      	ldr	r1, [pc, #72]	; (8010aac <RVM_Hyp_Del_Evt+0x60>)
 8010a64:	4a12      	ldr	r2, [pc, #72]	; (8010ab0 <RVM_Hyp_Del_Evt+0x64>)
 8010a66:	6809      	ldr	r1, [r1, #0]
 8010a68:	4812      	ldr	r0, [pc, #72]	; (8010ab4 <RVM_Hyp_Del_Evt+0x68>)
 8010a6a:	1a8a      	subs	r2, r1, r2
 8010a6c:	6961      	ldr	r1, [r4, #20]
 8010a6e:	0892      	lsrs	r2, r2, #2
 8010a70:	fba0 0202 	umull	r0, r2, r0, r2
 8010a74:	ebb1 0f52 	cmp.w	r1, r2, lsr #1
 8010a78:	d10c      	bne.n	8010a94 <RVM_Hyp_Del_Evt+0x48>
        return RVM_ERR_EVENT;
    
    /* Delete it from database */
    RVM_Evt_DB[Evt_ID].State=RVM_EVT_FREE;
 8010a7a:	2500      	movs	r5, #0
    RVM_List_Del(RVM_Evt_DB[Evt_ID].Head.Prev,RVM_Evt_DB[Evt_ID].Head.Next);
 8010a7c:	58f0      	ldr	r0, [r6, r3]
 8010a7e:	6861      	ldr	r1, [r4, #4]
    /* Are we the creator of the event? */
    if(RVM_Evt_DB[Evt_ID].Rcv_VM_ID!=RVM_VMID(RVM_Cur_Virt))
        return RVM_ERR_EVENT;
    
    /* Delete it from database */
    RVM_Evt_DB[Evt_ID].State=RVM_EVT_FREE;
 8010a80:	60a5      	str	r5, [r4, #8]
    RVM_List_Del(RVM_Evt_DB[Evt_ID].Head.Prev,RVM_Evt_DB[Evt_ID].Head.Next);
 8010a82:	f002 f8d9 	bl	8012c38 <RVM_List_Del>
    RVM_List_Ins(&(RVM_Evt_DB[Evt_ID].Head),RVM_Evt_Free.Prev, &(RVM_Evt_Free));
 8010a86:	4a0c      	ldr	r2, [pc, #48]	; (8010ab8 <RVM_Hyp_Del_Evt+0x6c>)
 8010a88:	4620      	mov	r0, r4
 8010a8a:	6811      	ldr	r1, [r2, #0]
 8010a8c:	f002 f8d8 	bl	8012c40 <RVM_List_Ins>
    
    return 0;
 8010a90:	4628      	mov	r0, r5
 8010a92:	bd70      	pop	{r4, r5, r6, pc}
    if(RVM_Evt_DB[Evt_ID].State==RVM_EVT_FREE)
        return RVM_ERR_STATE;
    
    /* Are we the creator of the event? */
    if(RVM_Evt_DB[Evt_ID].Rcv_VM_ID!=RVM_VMID(RVM_Cur_Virt))
        return RVM_ERR_EVENT;
 8010a94:	f06f 0004 	mvn.w	r0, #4
    RVM_Evt_DB[Evt_ID].State=RVM_EVT_FREE;
    RVM_List_Del(RVM_Evt_DB[Evt_ID].Head.Prev,RVM_Evt_DB[Evt_ID].Head.Next);
    RVM_List_Ins(&(RVM_Evt_DB[Evt_ID].Head),RVM_Evt_Free.Prev, &(RVM_Evt_Free));
    
    return 0;
}
 8010a98:	bd70      	pop	{r4, r5, r6, pc}
******************************************************************************/
rvm_ret_t RVM_Hyp_Del_Evt(rvm_cnt_t Evt_ID)
{
    /* See if the number is overrange */
    if(Evt_ID>=RVM_EVT_MAP_NUM)
        return RVM_ERR_RANGE;
 8010a9a:	f06f 0001 	mvn.w	r0, #1
    RVM_Evt_DB[Evt_ID].State=RVM_EVT_FREE;
    RVM_List_Del(RVM_Evt_DB[Evt_ID].Head.Prev,RVM_Evt_DB[Evt_ID].Head.Next);
    RVM_List_Ins(&(RVM_Evt_DB[Evt_ID].Head),RVM_Evt_Free.Prev, &(RVM_Evt_Free));
    
    return 0;
}
 8010a9e:	4770      	bx	lr
    if(Evt_ID>=RVM_EVT_MAP_NUM)
        return RVM_ERR_RANGE;
    
    /* Is the block empty? */
    if(RVM_Evt_DB[Evt_ID].State==RVM_EVT_FREE)
        return RVM_ERR_STATE;
 8010aa0:	f04f 30ff 	mov.w	r0, #4294967295
 8010aa4:	bd70      	pop	{r4, r5, r6, pc}
 8010aa6:	bf00      	nop
 8010aa8:	20013004 	.word	0x20013004
 8010aac:	2001ea60 	.word	0x2001ea60
 8010ab0:	2001e384 	.word	0x2001e384
 8010ab4:	1af286bd 	.word	0x1af286bd
 8010ab8:	2001e004 	.word	0x2001e004

08010abc <RVM_Hyp_Wait_Evt>:
Input       : None.
Output      : None.
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Wait_Evt(void)
{
 8010abc:	b570      	push	{r4, r5, r6, lr}
    struct RVM_Virt* Next;
    
    /* See if it have interrupt disabled */
    if((RVM_Cur_Virt->Sched.State&RVM_VM_INTENA)==0)
 8010abe:	4d75      	ldr	r5, [pc, #468]	; (8010c94 <RVM_Hyp_Wait_Evt+0x1d8>)
 8010ac0:	682b      	ldr	r3, [r5, #0]
 8010ac2:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8010ac4:	03d1      	lsls	r1, r2, #15
 8010ac6:	f140 80a3 	bpl.w	8010c10 <RVM_Hyp_Wait_Evt+0x154>
        return RVM_ERR_STATE;

    /* Now suspend the virtual machine and switch to somebody else */
    RVM_VM_STATE_SET(RVM_Cur_Virt->Sched.State,RVM_VM_WAITEVT);
 8010aca:	f022 02ff 	bic.w	r2, r2, #255	; 0xff
Return      : None.
******************************************************************************/
void _RVM_Clr_Rdy(struct RVM_Virt* Virt)
{
    /* See if it is the last thread on the priority level */
    if(Virt->Head.Prev==Virt->Head.Next)
 8010ace:	e893 0003 	ldmia.w	r3, {r0, r1}
    /* See if it have interrupt disabled */
    if((RVM_Cur_Virt->Sched.State&RVM_VM_INTENA)==0)
        return RVM_ERR_STATE;

    /* Now suspend the virtual machine and switch to somebody else */
    RVM_VM_STATE_SET(RVM_Cur_Virt->Sched.State,RVM_VM_WAITEVT);
 8010ad2:	f042 0201 	orr.w	r2, r2, #1
Return      : None.
******************************************************************************/
void _RVM_Clr_Rdy(struct RVM_Virt* Virt)
{
    /* See if it is the last thread on the priority level */
    if(Virt->Head.Prev==Virt->Head.Next)
 8010ad6:	4288      	cmp	r0, r1
    /* See if it have interrupt disabled */
    if((RVM_Cur_Virt->Sched.State&RVM_VM_INTENA)==0)
        return RVM_ERR_STATE;

    /* Now suspend the virtual machine and switch to somebody else */
    RVM_VM_STATE_SET(RVM_Cur_Virt->Sched.State,RVM_VM_WAITEVT);
 8010ad8:	635a      	str	r2, [r3, #52]	; 0x34
Return      : None.
******************************************************************************/
void _RVM_Clr_Rdy(struct RVM_Virt* Virt)
{
    /* See if it is the last thread on the priority level */
    if(Virt->Head.Prev==Virt->Head.Next)
 8010ada:	d06c      	beq.n	8010bb6 <RVM_Hyp_Wait_Evt+0xfa>
 8010adc:	4c6e      	ldr	r4, [pc, #440]	; (8010c98 <RVM_Hyp_Wait_Evt+0x1dc>)
        RVM_Bitmap[Virt->Image->Prio>>RVM_WORD_ORDER]&=~(((rvm_ptr_t)1)<<(Virt->Image->Prio&RVM_WORD_MASK));
    
    /* Delete this from the corresponding runqueue */
    RVM_List_Del(Virt->Head.Prev,Virt->Head.Next);
 8010ade:	f002 f8ab 	bl	8012c38 <RVM_List_Del>

    /* Now suspend the virtual machine and switch to somebody else */
    RVM_VM_STATE_SET(RVM_Cur_Virt->Sched.State,RVM_VM_WAITEVT);
    _RVM_Clr_Rdy(RVM_Cur_Virt);
    /* Insert this into the suspended queue */
    RVM_List_Ins(&(RVM_Cur_Virt->Head),RVM_Wait.Prev,&RVM_Wait);
 8010ae2:	4a6e      	ldr	r2, [pc, #440]	; (8010c9c <RVM_Hyp_Wait_Evt+0x1e0>)
 8010ae4:	6828      	ldr	r0, [r5, #0]
 8010ae6:	6811      	ldr	r1, [r2, #0]
 8010ae8:	f002 f8aa 	bl	8012c40 <RVM_List_Ins>
    rvm_cnt_t Count;
    
    /* See which one is ready, and pick it */
    for(Count=RVM_PRIO_BITMAP-1;Count>=0;Count--)
    {
        if(RVM_Bitmap[Count]==0)
 8010aec:	6820      	ldr	r0, [r4, #0]
 8010aee:	2800      	cmp	r0, #0
 8010af0:	d15a      	bne.n	8010ba8 <RVM_Hyp_Wait_Evt+0xec>
        
        Count=_RVM_MSB_Get(RVM_Bitmap[Count])+(Count<<RVM_WORD_ORDER);
        return (struct RVM_Virt*)(RVM_Run[Count].Next);
    }
    
    return 0;
 8010af2:	4604      	mov	r4, r0
    /* Insert this into the suspended queue */
    RVM_List_Ins(&(RVM_Cur_Virt->Head),RVM_Wait.Prev,&RVM_Wait);
    
    /* The next could be zero, which means that there are no VM running now */
    Next=_RVM_Get_High_Rdy();
    _RVM_Virt_Switch(RVM_Cur_Virt, Next);
 8010af4:	682e      	ldr	r6, [r5, #0]
Output      : None.
Return      : None.
******************************************************************************/
void _RVM_Virt_Switch(struct RVM_Virt* From, struct RVM_Virt* To)
{
    if(From==To)
 8010af6:	42a6      	cmp	r6, r4
 8010af8:	d037      	beq.n	8010b6a <RVM_Hyp_Wait_Evt+0xae>
        return;
    
    /* Just change the thread's priorities */
    if(From!=0)
 8010afa:	b336      	cbz	r6, 8010b4a <RVM_Hyp_Wait_Evt+0x8e>
    {
        RVM_ASSERT(RVM_Thd_Sched_Prio(From->Cap.User_Thd, RVM_WAIT_PRIO)==0);
 8010afc:	2100      	movs	r1, #0
 8010afe:	6a70      	ldr	r0, [r6, #36]	; 0x24
 8010b00:	f002 f9de 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 8010b04:	4601      	mov	r1, r0
 8010b06:	2800      	cmp	r0, #0
 8010b08:	d132      	bne.n	8010b70 <RVM_Hyp_Wait_Evt+0xb4>
        RVM_ASSERT(RVM_Thd_Sched_Prio(From->Cap.Int_Thd, RVM_WAIT_PRIO)==0);
 8010b0a:	6a30      	ldr	r0, [r6, #32]
 8010b0c:	f002 f9d8 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 8010b10:	b1d8      	cbz	r0, 8010b4a <RVM_Hyp_Wait_Evt+0x8e>
 8010b12:	4863      	ldr	r0, [pc, #396]	; (8010ca0 <RVM_Hyp_Wait_Evt+0x1e4>)
 8010b14:	f002 f92c 	bl	8012d70 <RVM_Print_String>
 8010b18:	4862      	ldr	r0, [pc, #392]	; (8010ca4 <RVM_Hyp_Wait_Evt+0x1e8>)
 8010b1a:	f002 f929 	bl	8012d70 <RVM_Print_String>
 8010b1e:	4862      	ldr	r0, [pc, #392]	; (8010ca8 <RVM_Hyp_Wait_Evt+0x1ec>)
 8010b20:	f002 f926 	bl	8012d70 <RVM_Print_String>
 8010b24:	2083      	movs	r0, #131	; 0x83
 8010b26:	f002 f891 	bl	8012c4c <RVM_Print_Int>
 8010b2a:	4860      	ldr	r0, [pc, #384]	; (8010cac <RVM_Hyp_Wait_Evt+0x1f0>)
 8010b2c:	f002 f920 	bl	8012d70 <RVM_Print_String>
 8010b30:	485f      	ldr	r0, [pc, #380]	; (8010cb0 <RVM_Hyp_Wait_Evt+0x1f4>)
 8010b32:	f002 f91d 	bl	8012d70 <RVM_Print_String>
 8010b36:	485f      	ldr	r0, [pc, #380]	; (8010cb4 <RVM_Hyp_Wait_Evt+0x1f8>)
 8010b38:	f002 f91a 	bl	8012d70 <RVM_Print_String>
 8010b3c:	485e      	ldr	r0, [pc, #376]	; (8010cb8 <RVM_Hyp_Wait_Evt+0x1fc>)
 8010b3e:	f002 f917 	bl	8012d70 <RVM_Print_String>
 8010b42:	485a      	ldr	r0, [pc, #360]	; (8010cac <RVM_Hyp_Wait_Evt+0x1f0>)
 8010b44:	f002 f914 	bl	8012d70 <RVM_Print_String>
 8010b48:	e7fe      	b.n	8010b48 <RVM_Hyp_Wait_Evt+0x8c>
    }
    
    if(To!=0)
 8010b4a:	b174      	cbz	r4, 8010b6a <RVM_Hyp_Wait_Evt+0xae>
    {
        RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.User_Thd, RVM_USER_PRIO)==0);
 8010b4c:	2102      	movs	r1, #2
 8010b4e:	6a60      	ldr	r0, [r4, #36]	; 0x24
 8010b50:	f002 f9b6 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 8010b54:	2800      	cmp	r0, #0
 8010b56:	d13f      	bne.n	8010bd8 <RVM_Hyp_Wait_Evt+0x11c>
        /* If the booting is not done yet, place the interrupt vector at the waiting level as always */
        if((To->Sched.State&RVM_VM_BOOTDONE)==0)
 8010b58:	6b63      	ldr	r3, [r4, #52]	; 0x34
 8010b5a:	f413 3100 	ands.w	r1, r3, #131072	; 0x20000
 8010b5e:	d176      	bne.n	8010c4e <RVM_Hyp_Wait_Evt+0x192>
            RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.Int_Thd, RVM_WAIT_PRIO)==0);
 8010b60:	6a20      	ldr	r0, [r4, #32]
 8010b62:	f002 f9ad 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 8010b66:	2800      	cmp	r0, #0
 8010b68:	d155      	bne.n	8010c16 <RVM_Hyp_Wait_Evt+0x15a>
    RVM_List_Ins(&(RVM_Cur_Virt->Head),RVM_Wait.Prev,&RVM_Wait);
    
    /* The next could be zero, which means that there are no VM running now */
    Next=_RVM_Get_High_Rdy();
    _RVM_Virt_Switch(RVM_Cur_Virt, Next);
    RVM_Cur_Virt=Next;
 8010b6a:	602c      	str	r4, [r5, #0]
    
    return 0;
 8010b6c:	2000      	movs	r0, #0
 8010b6e:	bd70      	pop	{r4, r5, r6, pc}
        return;
    
    /* Just change the thread's priorities */
    if(From!=0)
    {
        RVM_ASSERT(RVM_Thd_Sched_Prio(From->Cap.User_Thd, RVM_WAIT_PRIO)==0);
 8010b70:	484b      	ldr	r0, [pc, #300]	; (8010ca0 <RVM_Hyp_Wait_Evt+0x1e4>)
 8010b72:	f002 f8fd 	bl	8012d70 <RVM_Print_String>
 8010b76:	484b      	ldr	r0, [pc, #300]	; (8010ca4 <RVM_Hyp_Wait_Evt+0x1e8>)
 8010b78:	f002 f8fa 	bl	8012d70 <RVM_Print_String>
 8010b7c:	484a      	ldr	r0, [pc, #296]	; (8010ca8 <RVM_Hyp_Wait_Evt+0x1ec>)
 8010b7e:	f002 f8f7 	bl	8012d70 <RVM_Print_String>
 8010b82:	2082      	movs	r0, #130	; 0x82
 8010b84:	f002 f862 	bl	8012c4c <RVM_Print_Int>
 8010b88:	4848      	ldr	r0, [pc, #288]	; (8010cac <RVM_Hyp_Wait_Evt+0x1f0>)
 8010b8a:	f002 f8f1 	bl	8012d70 <RVM_Print_String>
 8010b8e:	4848      	ldr	r0, [pc, #288]	; (8010cb0 <RVM_Hyp_Wait_Evt+0x1f4>)
 8010b90:	f002 f8ee 	bl	8012d70 <RVM_Print_String>
 8010b94:	4847      	ldr	r0, [pc, #284]	; (8010cb4 <RVM_Hyp_Wait_Evt+0x1f8>)
 8010b96:	f002 f8eb 	bl	8012d70 <RVM_Print_String>
 8010b9a:	4847      	ldr	r0, [pc, #284]	; (8010cb8 <RVM_Hyp_Wait_Evt+0x1fc>)
 8010b9c:	f002 f8e8 	bl	8012d70 <RVM_Print_String>
 8010ba0:	4842      	ldr	r0, [pc, #264]	; (8010cac <RVM_Hyp_Wait_Evt+0x1f0>)
 8010ba2:	f002 f8e5 	bl	8012d70 <RVM_Print_String>
 8010ba6:	e7fe      	b.n	8010ba6 <RVM_Hyp_Wait_Evt+0xea>
    for(Count=RVM_PRIO_BITMAP-1;Count>=0;Count--)
    {
        if(RVM_Bitmap[Count]==0)
            continue;
        
        Count=_RVM_MSB_Get(RVM_Bitmap[Count])+(Count<<RVM_WORD_ORDER);
 8010ba8:	f7ff fa68 	bl	801007c <_RVM_MSB_Get>
        return (struct RVM_Virt*)(RVM_Run[Count].Next);
 8010bac:	4b43      	ldr	r3, [pc, #268]	; (8010cbc <RVM_Hyp_Wait_Evt+0x200>)
 8010bae:	eb03 00c0 	add.w	r0, r3, r0, lsl #3
 8010bb2:	6844      	ldr	r4, [r0, #4]
 8010bb4:	e79e      	b.n	8010af4 <RVM_Hyp_Wait_Evt+0x38>
******************************************************************************/
void _RVM_Clr_Rdy(struct RVM_Virt* Virt)
{
    /* See if it is the last thread on the priority level */
    if(Virt->Head.Prev==Virt->Head.Next)
        RVM_Bitmap[Virt->Image->Prio>>RVM_WORD_ORDER]&=~(((rvm_ptr_t)1)<<(Virt->Image->Prio&RVM_WORD_MASK));
 8010bb6:	691a      	ldr	r2, [r3, #16]
 8010bb8:	2001      	movs	r0, #1
 8010bba:	4c37      	ldr	r4, [pc, #220]	; (8010c98 <RVM_Hyp_Wait_Evt+0x1dc>)
 8010bbc:	6b52      	ldr	r2, [r2, #52]	; 0x34
 8010bbe:	0956      	lsrs	r6, r2, #5
 8010bc0:	f002 020f 	and.w	r2, r2, #15
 8010bc4:	fa00 f202 	lsl.w	r2, r0, r2
 8010bc8:	f854 0026 	ldr.w	r0, [r4, r6, lsl #2]
 8010bcc:	ea20 0002 	bic.w	r0, r0, r2
 8010bd0:	f844 0026 	str.w	r0, [r4, r6, lsl #2]
 8010bd4:	6818      	ldr	r0, [r3, #0]
 8010bd6:	e782      	b.n	8010ade <RVM_Hyp_Wait_Evt+0x22>
        RVM_ASSERT(RVM_Thd_Sched_Prio(From->Cap.Int_Thd, RVM_WAIT_PRIO)==0);
    }
    
    if(To!=0)
    {
        RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.User_Thd, RVM_USER_PRIO)==0);
 8010bd8:	4831      	ldr	r0, [pc, #196]	; (8010ca0 <RVM_Hyp_Wait_Evt+0x1e4>)
 8010bda:	f002 f8c9 	bl	8012d70 <RVM_Print_String>
 8010bde:	4831      	ldr	r0, [pc, #196]	; (8010ca4 <RVM_Hyp_Wait_Evt+0x1e8>)
 8010be0:	f002 f8c6 	bl	8012d70 <RVM_Print_String>
 8010be4:	4830      	ldr	r0, [pc, #192]	; (8010ca8 <RVM_Hyp_Wait_Evt+0x1ec>)
 8010be6:	f002 f8c3 	bl	8012d70 <RVM_Print_String>
 8010bea:	2088      	movs	r0, #136	; 0x88
 8010bec:	f002 f82e 	bl	8012c4c <RVM_Print_Int>
 8010bf0:	482e      	ldr	r0, [pc, #184]	; (8010cac <RVM_Hyp_Wait_Evt+0x1f0>)
 8010bf2:	f002 f8bd 	bl	8012d70 <RVM_Print_String>
 8010bf6:	482e      	ldr	r0, [pc, #184]	; (8010cb0 <RVM_Hyp_Wait_Evt+0x1f4>)
 8010bf8:	f002 f8ba 	bl	8012d70 <RVM_Print_String>
 8010bfc:	482d      	ldr	r0, [pc, #180]	; (8010cb4 <RVM_Hyp_Wait_Evt+0x1f8>)
 8010bfe:	f002 f8b7 	bl	8012d70 <RVM_Print_String>
 8010c02:	482d      	ldr	r0, [pc, #180]	; (8010cb8 <RVM_Hyp_Wait_Evt+0x1fc>)
 8010c04:	f002 f8b4 	bl	8012d70 <RVM_Print_String>
 8010c08:	4828      	ldr	r0, [pc, #160]	; (8010cac <RVM_Hyp_Wait_Evt+0x1f0>)
 8010c0a:	f002 f8b1 	bl	8012d70 <RVM_Print_String>
 8010c0e:	e7fe      	b.n	8010c0e <RVM_Hyp_Wait_Evt+0x152>
{
    struct RVM_Virt* Next;
    
    /* See if it have interrupt disabled */
    if((RVM_Cur_Virt->Sched.State&RVM_VM_INTENA)==0)
        return RVM_ERR_STATE;
 8010c10:	f04f 30ff 	mov.w	r0, #4294967295
    Next=_RVM_Get_High_Rdy();
    _RVM_Virt_Switch(RVM_Cur_Virt, Next);
    RVM_Cur_Virt=Next;
    
    return 0;
}
 8010c14:	bd70      	pop	{r4, r5, r6, pc}
    if(To!=0)
    {
        RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.User_Thd, RVM_USER_PRIO)==0);
        /* If the booting is not done yet, place the interrupt vector at the waiting level as always */
        if((To->Sched.State&RVM_VM_BOOTDONE)==0)
            RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.Int_Thd, RVM_WAIT_PRIO)==0);
 8010c16:	4822      	ldr	r0, [pc, #136]	; (8010ca0 <RVM_Hyp_Wait_Evt+0x1e4>)
 8010c18:	f002 f8aa 	bl	8012d70 <RVM_Print_String>
 8010c1c:	4821      	ldr	r0, [pc, #132]	; (8010ca4 <RVM_Hyp_Wait_Evt+0x1e8>)
 8010c1e:	f002 f8a7 	bl	8012d70 <RVM_Print_String>
 8010c22:	4821      	ldr	r0, [pc, #132]	; (8010ca8 <RVM_Hyp_Wait_Evt+0x1ec>)
 8010c24:	f002 f8a4 	bl	8012d70 <RVM_Print_String>
 8010c28:	208b      	movs	r0, #139	; 0x8b
 8010c2a:	f002 f80f 	bl	8012c4c <RVM_Print_Int>
 8010c2e:	481f      	ldr	r0, [pc, #124]	; (8010cac <RVM_Hyp_Wait_Evt+0x1f0>)
 8010c30:	f002 f89e 	bl	8012d70 <RVM_Print_String>
 8010c34:	481e      	ldr	r0, [pc, #120]	; (8010cb0 <RVM_Hyp_Wait_Evt+0x1f4>)
 8010c36:	f002 f89b 	bl	8012d70 <RVM_Print_String>
 8010c3a:	481e      	ldr	r0, [pc, #120]	; (8010cb4 <RVM_Hyp_Wait_Evt+0x1f8>)
 8010c3c:	f002 f898 	bl	8012d70 <RVM_Print_String>
 8010c40:	481d      	ldr	r0, [pc, #116]	; (8010cb8 <RVM_Hyp_Wait_Evt+0x1fc>)
 8010c42:	f002 f895 	bl	8012d70 <RVM_Print_String>
 8010c46:	4819      	ldr	r0, [pc, #100]	; (8010cac <RVM_Hyp_Wait_Evt+0x1f0>)
 8010c48:	f002 f892 	bl	8012d70 <RVM_Print_String>
 8010c4c:	e7fe      	b.n	8010c4c <RVM_Hyp_Wait_Evt+0x190>
        else
            RVM_ASSERT(RVM_Thd_Sched_Prio(To->Cap.Int_Thd, RVM_VINT_PRIO)==0);
 8010c4e:	2103      	movs	r1, #3
 8010c50:	6a20      	ldr	r0, [r4, #32]
 8010c52:	f002 f935 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 8010c56:	2800      	cmp	r0, #0
 8010c58:	d087      	beq.n	8010b6a <RVM_Hyp_Wait_Evt+0xae>
 8010c5a:	4811      	ldr	r0, [pc, #68]	; (8010ca0 <RVM_Hyp_Wait_Evt+0x1e4>)
 8010c5c:	f002 f888 	bl	8012d70 <RVM_Print_String>
 8010c60:	4810      	ldr	r0, [pc, #64]	; (8010ca4 <RVM_Hyp_Wait_Evt+0x1e8>)
 8010c62:	f002 f885 	bl	8012d70 <RVM_Print_String>
 8010c66:	4810      	ldr	r0, [pc, #64]	; (8010ca8 <RVM_Hyp_Wait_Evt+0x1ec>)
 8010c68:	f002 f882 	bl	8012d70 <RVM_Print_String>
 8010c6c:	208d      	movs	r0, #141	; 0x8d
 8010c6e:	f001 ffed 	bl	8012c4c <RVM_Print_Int>
 8010c72:	480e      	ldr	r0, [pc, #56]	; (8010cac <RVM_Hyp_Wait_Evt+0x1f0>)
 8010c74:	f002 f87c 	bl	8012d70 <RVM_Print_String>
 8010c78:	480d      	ldr	r0, [pc, #52]	; (8010cb0 <RVM_Hyp_Wait_Evt+0x1f4>)
 8010c7a:	f002 f879 	bl	8012d70 <RVM_Print_String>
 8010c7e:	480d      	ldr	r0, [pc, #52]	; (8010cb4 <RVM_Hyp_Wait_Evt+0x1f8>)
 8010c80:	f002 f876 	bl	8012d70 <RVM_Print_String>
 8010c84:	480c      	ldr	r0, [pc, #48]	; (8010cb8 <RVM_Hyp_Wait_Evt+0x1fc>)
 8010c86:	f002 f873 	bl	8012d70 <RVM_Print_String>
 8010c8a:	4808      	ldr	r0, [pc, #32]	; (8010cac <RVM_Hyp_Wait_Evt+0x1f0>)
 8010c8c:	f002 f870 	bl	8012d70 <RVM_Print_String>
 8010c90:	e7fe      	b.n	8010c90 <RVM_Hyp_Wait_Evt+0x1d4>
 8010c92:	bf00      	nop
 8010c94:	2001ea60 	.word	0x2001ea60
 8010c98:	2001ea5c 	.word	0x2001ea5c
 8010c9c:	2001ea48 	.word	0x2001ea48
 8010ca0:	08012f08 	.word	0x08012f08
 8010ca4:	08013038 	.word	0x08013038
 8010ca8:	08012fa4 	.word	0x08012fa4
 8010cac:	080134b0 	.word	0x080134b0
 8010cb0:	08012fac 	.word	0x08012fac
 8010cb4:	08012fb8 	.word	0x08012fb8
 8010cb8:	08012fbc 	.word	0x08012fbc
 8010cbc:	2001e948 	.word	0x2001e948

08010cc0 <RVM_Hyp_Send_Evt>:
rvm_ret_t RVM_Hyp_Send_Evt(rvm_ptr_t Evt_ID)
{
    struct RVM_Virt* Rcv_Virt;
    
    /* See if the number is overrange */
    if(Evt_ID>=RVM_EVT_MAP_NUM)
 8010cc0:	f5b0 6f80 	cmp.w	r0, #1024	; 0x400
 8010cc4:	d269      	bcs.n	8010d9a <RVM_Hyp_Send_Evt+0xda>
        return RVM_ERR_RANGE;
    
    /* Is the block empty? */
    if(RVM_Evt_DB[Evt_ID].State==RVM_EVT_FREE)
 8010cc6:	eb00 0040 	add.w	r0, r0, r0, lsl #1
Input       : cid_t Evt_ID - The event channel ID.
Output      : None.
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Send_Evt(rvm_ptr_t Evt_ID)
{
 8010cca:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    /* See if the number is overrange */
    if(Evt_ID>=RVM_EVT_MAP_NUM)
        return RVM_ERR_RANGE;
    
    /* Is the block empty? */
    if(RVM_Evt_DB[Evt_ID].State==RVM_EVT_FREE)
 8010ccc:	4b36      	ldr	r3, [pc, #216]	; (8010da8 <RVM_Hyp_Send_Evt+0xe8>)
 8010cce:	eb03 02c0 	add.w	r2, r3, r0, lsl #3
 8010cd2:	6893      	ldr	r3, [r2, #8]
 8010cd4:	2b00      	cmp	r3, #0
 8010cd6:	d063      	beq.n	8010da0 <RVM_Hyp_Send_Evt+0xe0>
        return RVM_ERR_STATE;
    
    /* Are we allowed to send to it? */
    if(RVM_Evt_DB[Evt_ID].Snd_VM_ID!=RVM_VMID(RVM_Cur_Virt))
 8010cd8:	4d34      	ldr	r5, [pc, #208]	; (8010dac <RVM_Hyp_Send_Evt+0xec>)
 8010cda:	4e35      	ldr	r6, [pc, #212]	; (8010db0 <RVM_Hyp_Send_Evt+0xf0>)
 8010cdc:	682b      	ldr	r3, [r5, #0]
 8010cde:	4835      	ldr	r0, [pc, #212]	; (8010db4 <RVM_Hyp_Send_Evt+0xf4>)
 8010ce0:	1b9b      	subs	r3, r3, r6
 8010ce2:	6911      	ldr	r1, [r2, #16]
 8010ce4:	089b      	lsrs	r3, r3, #2
 8010ce6:	fba0 0303 	umull	r0, r3, r0, r3
 8010cea:	ebb1 0f53 	cmp.w	r1, r3, lsr #1
 8010cee:	d11b      	bne.n	8010d28 <RVM_Hyp_Send_Evt+0x68>
        return RVM_ERR_EVENT;
    
    /* Sending to that VM */
    Rcv_Virt=&RVM_Virt_DB[RVM_Evt_DB[Evt_ID].Rcv_VM_ID];
 8010cf0:	6951      	ldr	r1, [r2, #20]
Output      : None.
Return      : None.
******************************************************************************/
void _RVM_Set_Int_Flag(struct RVM_Virt* Virt, rvm_ptr_t Int_Num)
{
    Virt->Image->Int_Flags[Int_Num>>RVM_WORD_ORDER]|=((rvm_ptr_t)1)<<(Int_Num&RVM_WORD_MASK);
 8010cf2:	274c      	movs	r7, #76	; 0x4c
    if(RVM_Evt_DB[Evt_ID].Snd_VM_ID!=RVM_VMID(RVM_Cur_Virt))
        return RVM_ERR_EVENT;
    
    /* Sending to that VM */
    Rcv_Virt=&RVM_Virt_DB[RVM_Evt_DB[Evt_ID].Rcv_VM_ID];
    _RVM_Set_Int_Flag(Rcv_Virt, RVM_Evt_DB[Evt_ID].Int_Num);
 8010cf4:	68d2      	ldr	r2, [r2, #12]
Output      : None.
Return      : None.
******************************************************************************/
void _RVM_Set_Int_Flag(struct RVM_Virt* Virt, rvm_ptr_t Int_Num)
{
    Virt->Image->Int_Flags[Int_Num>>RVM_WORD_ORDER]|=((rvm_ptr_t)1)<<(Int_Num&RVM_WORD_MASK);
 8010cf6:	2301      	movs	r3, #1
 8010cf8:	fb07 f701 	mul.w	r7, r7, r1
 8010cfc:	0951      	lsrs	r1, r2, #5
 8010cfe:	f002 020f 	and.w	r2, r2, #15
 8010d02:	19f4      	adds	r4, r6, r7
 8010d04:	4093      	lsls	r3, r2
 8010d06:	6922      	ldr	r2, [r4, #16]
 8010d08:	6c92      	ldr	r2, [r2, #72]	; 0x48
 8010d0a:	f852 0021 	ldr.w	r0, [r2, r1, lsl #2]
 8010d0e:	4303      	orrs	r3, r0
 8010d10:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
        return RVM_ERR_EVENT;
    
    /* Sending to that VM */
    Rcv_Virt=&RVM_Virt_DB[RVM_Evt_DB[Evt_ID].Rcv_VM_ID];
    _RVM_Set_Int_Flag(Rcv_Virt, RVM_Evt_DB[Evt_ID].Int_Num);
    RVM_ASSERT(RVM_Sig_Snd(Rcv_Virt->Cap.Int_Sig));
 8010d14:	6aa0      	ldr	r0, [r4, #40]	; 0x28
 8010d16:	f002 f8e7 	bl	8012ee8 <RVM_Sig_Snd>
 8010d1a:	b140      	cbz	r0, 8010d2e <RVM_Hyp_Send_Evt+0x6e>
    
    if(RVM_VM_STATE(Rcv_Virt->Sched.State)==RVM_VM_WAITEVT)
 8010d1c:	f894 3034 	ldrb.w	r3, [r4, #52]	; 0x34
 8010d20:	2b01      	cmp	r3, #1
 8010d22:	d021      	beq.n	8010d68 <RVM_Hyp_Send_Evt+0xa8>
            _RVM_Virt_Switch(RVM_Cur_Virt, Rcv_Virt);
            RVM_Cur_Virt=Rcv_Virt;
        }
    }
    
    return 0;
 8010d24:	2000      	movs	r0, #0
 8010d26:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    if(RVM_Evt_DB[Evt_ID].State==RVM_EVT_FREE)
        return RVM_ERR_STATE;
    
    /* Are we allowed to send to it? */
    if(RVM_Evt_DB[Evt_ID].Snd_VM_ID!=RVM_VMID(RVM_Cur_Virt))
        return RVM_ERR_EVENT;
 8010d28:	f06f 0004 	mvn.w	r0, #4
            RVM_Cur_Virt=Rcv_Virt;
        }
    }
    
    return 0;
}
 8010d2c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
        return RVM_ERR_EVENT;
    
    /* Sending to that VM */
    Rcv_Virt=&RVM_Virt_DB[RVM_Evt_DB[Evt_ID].Rcv_VM_ID];
    _RVM_Set_Int_Flag(Rcv_Virt, RVM_Evt_DB[Evt_ID].Int_Num);
    RVM_ASSERT(RVM_Sig_Snd(Rcv_Virt->Cap.Int_Sig));
 8010d2e:	4822      	ldr	r0, [pc, #136]	; (8010db8 <RVM_Hyp_Send_Evt+0xf8>)
 8010d30:	f002 f81e 	bl	8012d70 <RVM_Print_String>
 8010d34:	4821      	ldr	r0, [pc, #132]	; (8010dbc <RVM_Hyp_Send_Evt+0xfc>)
 8010d36:	f002 f81b 	bl	8012d70 <RVM_Print_String>
 8010d3a:	4821      	ldr	r0, [pc, #132]	; (8010dc0 <RVM_Hyp_Send_Evt+0x100>)
 8010d3c:	f002 f818 	bl	8012d70 <RVM_Print_String>
 8010d40:	f44f 70d9 	mov.w	r0, #434	; 0x1b2
 8010d44:	f001 ff82 	bl	8012c4c <RVM_Print_Int>
 8010d48:	481e      	ldr	r0, [pc, #120]	; (8010dc4 <RVM_Hyp_Send_Evt+0x104>)
 8010d4a:	f002 f811 	bl	8012d70 <RVM_Print_String>
 8010d4e:	481e      	ldr	r0, [pc, #120]	; (8010dc8 <RVM_Hyp_Send_Evt+0x108>)
 8010d50:	f002 f80e 	bl	8012d70 <RVM_Print_String>
 8010d54:	481d      	ldr	r0, [pc, #116]	; (8010dcc <RVM_Hyp_Send_Evt+0x10c>)
 8010d56:	f002 f80b 	bl	8012d70 <RVM_Print_String>
 8010d5a:	481d      	ldr	r0, [pc, #116]	; (8010dd0 <RVM_Hyp_Send_Evt+0x110>)
 8010d5c:	f002 f808 	bl	8012d70 <RVM_Print_String>
 8010d60:	4818      	ldr	r0, [pc, #96]	; (8010dc4 <RVM_Hyp_Send_Evt+0x104>)
 8010d62:	f002 f805 	bl	8012d70 <RVM_Print_String>
 8010d66:	e7fe      	b.n	8010d66 <RVM_Hyp_Send_Evt+0xa6>
    
    if(RVM_VM_STATE(Rcv_Virt->Sched.State)==RVM_VM_WAITEVT)
    {
        RVM_VM_STATE_SET(RVM_Cur_Virt->Sched.State,RVM_VM_RUNNING);
 8010d68:	682a      	ldr	r2, [r5, #0]
 8010d6a:	6b53      	ldr	r3, [r2, #52]	; 0x34
 8010d6c:	f023 03ff 	bic.w	r3, r3, #255	; 0xff
 8010d70:	6353      	str	r3, [r2, #52]	; 0x34
        RVM_List_Del(Rcv_Virt->Head.Prev,Rcv_Virt->Head.Next);
 8010d72:	59f0      	ldr	r0, [r6, r7]
 8010d74:	6861      	ldr	r1, [r4, #4]
 8010d76:	f001 ff5f 	bl	8012c38 <RVM_List_Del>
        _RVM_Set_Rdy(Rcv_Virt);
 8010d7a:	4620      	mov	r0, r4
 8010d7c:	f7ff fc1e 	bl	80105bc <_RVM_Set_Rdy>
        /* If the receiving VM have a higher priority, switch to it */
        if(Rcv_Virt->Image->Prio>RVM_Cur_Virt->Image->Prio)
 8010d80:	6828      	ldr	r0, [r5, #0]
 8010d82:	6922      	ldr	r2, [r4, #16]
 8010d84:	6903      	ldr	r3, [r0, #16]
 8010d86:	6b52      	ldr	r2, [r2, #52]	; 0x34
 8010d88:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 8010d8a:	429a      	cmp	r2, r3
 8010d8c:	d9ca      	bls.n	8010d24 <RVM_Hyp_Send_Evt+0x64>
        {
            _RVM_Virt_Switch(RVM_Cur_Virt, Rcv_Virt);
 8010d8e:	4621      	mov	r1, r4
 8010d90:	f7ff fc42 	bl	8010618 <_RVM_Virt_Switch>
            RVM_Cur_Virt=Rcv_Virt;
 8010d94:	602c      	str	r4, [r5, #0]
        }
    }
    
    return 0;
 8010d96:	2000      	movs	r0, #0
 8010d98:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
{
    struct RVM_Virt* Rcv_Virt;
    
    /* See if the number is overrange */
    if(Evt_ID>=RVM_EVT_MAP_NUM)
        return RVM_ERR_RANGE;
 8010d9a:	f06f 0001 	mvn.w	r0, #1
            RVM_Cur_Virt=Rcv_Virt;
        }
    }
    
    return 0;
}
 8010d9e:	4770      	bx	lr
    if(Evt_ID>=RVM_EVT_MAP_NUM)
        return RVM_ERR_RANGE;
    
    /* Is the block empty? */
    if(RVM_Evt_DB[Evt_ID].State==RVM_EVT_FREE)
        return RVM_ERR_STATE;
 8010da0:	f04f 30ff 	mov.w	r0, #4294967295
 8010da4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8010da6:	bf00      	nop
 8010da8:	20013004 	.word	0x20013004
 8010dac:	2001ea60 	.word	0x2001ea60
 8010db0:	2001e384 	.word	0x2001e384
 8010db4:	1af286bd 	.word	0x1af286bd
 8010db8:	08012f08 	.word	0x08012f08
 8010dbc:	08013038 	.word	0x08013038
 8010dc0:	08012fa4 	.word	0x08012fa4
 8010dc4:	080134b0 	.word	0x080134b0
 8010dc8:	08012fac 	.word	0x08012fac
 8010dcc:	08012fb8 	.word	0x08012fb8
 8010dd0:	08012fbc 	.word	0x08012fbc

08010dd4 <RVM_Hyp_Query_Evt>:
******************************************************************************/
rvm_ret_t RVM_Hyp_Query_Evt(rvm_ptr_t VMID)
{
    struct RVM_Evt* Evt;
    /* See if both numbers are overrange */
    if(VMID>=RVM_VM_Num)
 8010dd4:	4b17      	ldr	r3, [pc, #92]	; (8010e34 <RVM_Hyp_Query_Evt+0x60>)
 8010dd6:	681b      	ldr	r3, [r3, #0]
 8010dd8:	4283      	cmp	r3, r0
 8010dda:	d928      	bls.n	8010e2e <RVM_Hyp_Query_Evt+0x5a>
        return RVM_ERR_RANGE;
    
    Evt=(struct RVM_Evt*)(RVM_Virt_DB[VMID].Evt_Head.Next);
 8010ddc:	234c      	movs	r3, #76	; 0x4c
Input       : rvm_ptr_t VMID - The VM identifier.
Output      : None.
Return      : rvm_ret_t - If successful, the event channel ID; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Query_Evt(rvm_ptr_t VMID)
{
 8010dde:	b430      	push	{r4, r5}
    struct RVM_Evt* Evt;
    /* See if both numbers are overrange */
    if(VMID>=RVM_VM_Num)
        return RVM_ERR_RANGE;
    
    Evt=(struct RVM_Evt*)(RVM_Virt_DB[VMID].Evt_Head.Next);
 8010de0:	fb03 f000 	mul.w	r0, r3, r0
 8010de4:	4d14      	ldr	r5, [pc, #80]	; (8010e38 <RVM_Hyp_Query_Evt+0x64>)
 8010de6:	182b      	adds	r3, r5, r0
    
    /* Pass through the database to look for the first guy that matches the sender */
    while(Evt!=(struct RVM_Evt*)&(RVM_Virt_DB[VMID].Evt_Head))
 8010de8:	4618      	mov	r0, r3
    struct RVM_Evt* Evt;
    /* See if both numbers are overrange */
    if(VMID>=RVM_VM_Num)
        return RVM_ERR_RANGE;
    
    Evt=(struct RVM_Evt*)(RVM_Virt_DB[VMID].Evt_Head.Next);
 8010dea:	6c9b      	ldr	r3, [r3, #72]	; 0x48
    
    /* Pass through the database to look for the first guy that matches the sender */
    while(Evt!=(struct RVM_Evt*)&(RVM_Virt_DB[VMID].Evt_Head))
 8010dec:	3044      	adds	r0, #68	; 0x44
 8010dee:	4283      	cmp	r3, r0
 8010df0:	d011      	beq.n	8010e16 <RVM_Hyp_Query_Evt+0x42>
    {
        if(Evt->Snd_VM_ID==RVM_VMID(RVM_Cur_Virt))
 8010df2:	4a12      	ldr	r2, [pc, #72]	; (8010e3c <RVM_Hyp_Query_Evt+0x68>)
 8010df4:	4912      	ldr	r1, [pc, #72]	; (8010e40 <RVM_Hyp_Query_Evt+0x6c>)
 8010df6:	6812      	ldr	r2, [r2, #0]
 8010df8:	691c      	ldr	r4, [r3, #16]
 8010dfa:	1b52      	subs	r2, r2, r5
 8010dfc:	0892      	lsrs	r2, r2, #2
 8010dfe:	fba1 2102 	umull	r2, r1, r1, r2
 8010e02:	0849      	lsrs	r1, r1, #1
 8010e04:	428c      	cmp	r4, r1
 8010e06:	d103      	bne.n	8010e10 <RVM_Hyp_Query_Evt+0x3c>
 8010e08:	e009      	b.n	8010e1e <RVM_Hyp_Query_Evt+0x4a>
 8010e0a:	691a      	ldr	r2, [r3, #16]
 8010e0c:	428a      	cmp	r2, r1
 8010e0e:	d006      	beq.n	8010e1e <RVM_Hyp_Query_Evt+0x4a>
            return RVM_EVTID(Evt);
        
        Evt=(struct RVM_Evt*)(Evt->Head.Next);
 8010e10:	685b      	ldr	r3, [r3, #4]
        return RVM_ERR_RANGE;
    
    Evt=(struct RVM_Evt*)(RVM_Virt_DB[VMID].Evt_Head.Next);
    
    /* Pass through the database to look for the first guy that matches the sender */
    while(Evt!=(struct RVM_Evt*)&(RVM_Virt_DB[VMID].Evt_Head))
 8010e12:	4283      	cmp	r3, r0
 8010e14:	d1f9      	bne.n	8010e0a <RVM_Hyp_Query_Evt+0x36>
            return RVM_EVTID(Evt);
        
        Evt=(struct RVM_Evt*)(Evt->Head.Next);
    }
    
    return RVM_ERR_EVENT;
 8010e16:	f06f 0004 	mvn.w	r0, #4
}
 8010e1a:	bc30      	pop	{r4, r5}
 8010e1c:	4770      	bx	lr
    
    /* Pass through the database to look for the first guy that matches the sender */
    while(Evt!=(struct RVM_Evt*)&(RVM_Virt_DB[VMID].Evt_Head))
    {
        if(Evt->Snd_VM_ID==RVM_VMID(RVM_Cur_Virt))
            return RVM_EVTID(Evt);
 8010e1e:	4a09      	ldr	r2, [pc, #36]	; (8010e44 <RVM_Hyp_Query_Evt+0x70>)
 8010e20:	4809      	ldr	r0, [pc, #36]	; (8010e48 <RVM_Hyp_Query_Evt+0x74>)
 8010e22:	1a9b      	subs	r3, r3, r2
 8010e24:	fba0 3003 	umull	r3, r0, r0, r3
        
        Evt=(struct RVM_Evt*)(Evt->Head.Next);
    }
    
    return RVM_ERR_EVENT;
}
 8010e28:	bc30      	pop	{r4, r5}
    
    /* Pass through the database to look for the first guy that matches the sender */
    while(Evt!=(struct RVM_Evt*)&(RVM_Virt_DB[VMID].Evt_Head))
    {
        if(Evt->Snd_VM_ID==RVM_VMID(RVM_Cur_Virt))
            return RVM_EVTID(Evt);
 8010e2a:	0900      	lsrs	r0, r0, #4
        
        Evt=(struct RVM_Evt*)(Evt->Head.Next);
    }
    
    return RVM_ERR_EVENT;
}
 8010e2c:	4770      	bx	lr
rvm_ret_t RVM_Hyp_Query_Evt(rvm_ptr_t VMID)
{
    struct RVM_Evt* Evt;
    /* See if both numbers are overrange */
    if(VMID>=RVM_VM_Num)
        return RVM_ERR_RANGE;
 8010e2e:	f06f 0001 	mvn.w	r0, #1
        
        Evt=(struct RVM_Evt*)(Evt->Head.Next);
    }
    
    return RVM_ERR_EVENT;
}
 8010e32:	4770      	bx	lr
 8010e34:	2001ea50 	.word	0x2001ea50
 8010e38:	2001e384 	.word	0x2001e384
 8010e3c:	2001ea60 	.word	0x2001ea60
 8010e40:	1af286bd 	.word	0x1af286bd
 8010e44:	20013004 	.word	0x20013004
 8010e48:	aaaaaaab 	.word	0xaaaaaaab

08010e4c <RVM_Hyp_Query_VM>:
rvm_ret_t RVM_Hyp_Query_VM(rvm_s8_t* Name)
{
    rvm_cnt_t Count;
    
    /* Pass through the database to look for the first guy that matches the name */
    for(Count=0;Count<RVM_VM_Num;Count++)
 8010e4c:	4b5a      	ldr	r3, [pc, #360]	; (8010fb8 <RVM_Hyp_Query_VM+0x16c>)
Input       : rvm_s8_t* Name - The name of the VM, 16 characters max, we only compare the first 15.
Output      : None.
Return      : rvm_ret_t - If successful, the VM ID; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Query_VM(rvm_s8_t* Name)
{
 8010e4e:	b470      	push	{r4, r5, r6}
    rvm_cnt_t Count;
    
    /* Pass through the database to look for the first guy that matches the name */
    for(Count=0;Count<RVM_VM_Num;Count++)
 8010e50:	681e      	ldr	r6, [r3, #0]
 8010e52:	2e00      	cmp	r6, #0
 8010e54:	f000 808e 	beq.w	8010f74 <RVM_Hyp_Query_VM+0x128>
 8010e58:	4c58      	ldr	r4, [pc, #352]	; (8010fbc <RVM_Hyp_Query_VM+0x170>)
 8010e5a:	2100      	movs	r1, #0
    {
        if(_RVM_Strncmp(RVM_Virt_DB[Count].Image->Name,Name,16)==0)
 8010e5c:	6922      	ldr	r2, [r4, #16]
{
    rvm_cnt_t Count;

    for(Count=0;Count<Num;Count++)
    {
        if((Str1[Count]=='\0')||(Str1[Count]!=Str2[Count]))
 8010e5e:	f992 3004 	ldrsb.w	r3, [r2, #4]
 8010e62:	2b00      	cmp	r3, #0
 8010e64:	f000 80a2 	beq.w	8010fac <RVM_Hyp_Query_VM+0x160>
 8010e68:	f990 5000 	ldrsb.w	r5, [r0]
 8010e6c:	429d      	cmp	r5, r3
 8010e6e:	d17c      	bne.n	8010f6a <RVM_Hyp_Query_VM+0x11e>
 8010e70:	f992 3005 	ldrsb.w	r3, [r2, #5]
 8010e74:	2b00      	cmp	r3, #0
 8010e76:	d074      	beq.n	8010f62 <RVM_Hyp_Query_VM+0x116>
 8010e78:	f990 5001 	ldrsb.w	r5, [r0, #1]
 8010e7c:	429d      	cmp	r5, r3
 8010e7e:	d170      	bne.n	8010f62 <RVM_Hyp_Query_VM+0x116>
 8010e80:	f992 3006 	ldrsb.w	r3, [r2, #6]
 8010e84:	2b00      	cmp	r3, #0
 8010e86:	d079      	beq.n	8010f7c <RVM_Hyp_Query_VM+0x130>
 8010e88:	f990 5002 	ldrsb.w	r5, [r0, #2]
 8010e8c:	429d      	cmp	r5, r3
 8010e8e:	d175      	bne.n	8010f7c <RVM_Hyp_Query_VM+0x130>
 8010e90:	f992 3007 	ldrsb.w	r3, [r2, #7]
 8010e94:	2b00      	cmp	r3, #0
 8010e96:	d073      	beq.n	8010f80 <RVM_Hyp_Query_VM+0x134>
 8010e98:	f990 5003 	ldrsb.w	r5, [r0, #3]
 8010e9c:	429d      	cmp	r5, r3
 8010e9e:	d16f      	bne.n	8010f80 <RVM_Hyp_Query_VM+0x134>
 8010ea0:	f992 3008 	ldrsb.w	r3, [r2, #8]
 8010ea4:	2b00      	cmp	r3, #0
 8010ea6:	d06d      	beq.n	8010f84 <RVM_Hyp_Query_VM+0x138>
 8010ea8:	f990 5004 	ldrsb.w	r5, [r0, #4]
 8010eac:	429d      	cmp	r5, r3
 8010eae:	d169      	bne.n	8010f84 <RVM_Hyp_Query_VM+0x138>
 8010eb0:	f992 3009 	ldrsb.w	r3, [r2, #9]
 8010eb4:	2b00      	cmp	r3, #0
 8010eb6:	d069      	beq.n	8010f8c <RVM_Hyp_Query_VM+0x140>
 8010eb8:	f990 5005 	ldrsb.w	r5, [r0, #5]
 8010ebc:	429d      	cmp	r5, r3
 8010ebe:	d165      	bne.n	8010f8c <RVM_Hyp_Query_VM+0x140>
 8010ec0:	f992 300a 	ldrsb.w	r3, [r2, #10]
 8010ec4:	2b00      	cmp	r3, #0
 8010ec6:	d063      	beq.n	8010f90 <RVM_Hyp_Query_VM+0x144>
 8010ec8:	f990 5006 	ldrsb.w	r5, [r0, #6]
 8010ecc:	429d      	cmp	r5, r3
 8010ece:	d15f      	bne.n	8010f90 <RVM_Hyp_Query_VM+0x144>
 8010ed0:	f992 300b 	ldrsb.w	r3, [r2, #11]
 8010ed4:	2b00      	cmp	r3, #0
 8010ed6:	d05d      	beq.n	8010f94 <RVM_Hyp_Query_VM+0x148>
 8010ed8:	f990 5007 	ldrsb.w	r5, [r0, #7]
 8010edc:	429d      	cmp	r5, r3
 8010ede:	d159      	bne.n	8010f94 <RVM_Hyp_Query_VM+0x148>
 8010ee0:	f992 300c 	ldrsb.w	r3, [r2, #12]
 8010ee4:	2b00      	cmp	r3, #0
 8010ee6:	d057      	beq.n	8010f98 <RVM_Hyp_Query_VM+0x14c>
 8010ee8:	f990 5008 	ldrsb.w	r5, [r0, #8]
 8010eec:	429d      	cmp	r5, r3
 8010eee:	d153      	bne.n	8010f98 <RVM_Hyp_Query_VM+0x14c>
 8010ef0:	f992 300d 	ldrsb.w	r3, [r2, #13]
 8010ef4:	2b00      	cmp	r3, #0
 8010ef6:	d051      	beq.n	8010f9c <RVM_Hyp_Query_VM+0x150>
 8010ef8:	f990 5009 	ldrsb.w	r5, [r0, #9]
 8010efc:	429d      	cmp	r5, r3
 8010efe:	d14d      	bne.n	8010f9c <RVM_Hyp_Query_VM+0x150>
 8010f00:	f992 300e 	ldrsb.w	r3, [r2, #14]
 8010f04:	2b00      	cmp	r3, #0
 8010f06:	d04b      	beq.n	8010fa0 <RVM_Hyp_Query_VM+0x154>
 8010f08:	f990 500a 	ldrsb.w	r5, [r0, #10]
 8010f0c:	429d      	cmp	r5, r3
 8010f0e:	d147      	bne.n	8010fa0 <RVM_Hyp_Query_VM+0x154>
 8010f10:	f992 300f 	ldrsb.w	r3, [r2, #15]
 8010f14:	2b00      	cmp	r3, #0
 8010f16:	d045      	beq.n	8010fa4 <RVM_Hyp_Query_VM+0x158>
 8010f18:	f990 500b 	ldrsb.w	r5, [r0, #11]
 8010f1c:	429d      	cmp	r5, r3
 8010f1e:	d141      	bne.n	8010fa4 <RVM_Hyp_Query_VM+0x158>
 8010f20:	f992 3010 	ldrsb.w	r3, [r2, #16]
 8010f24:	2b00      	cmp	r3, #0
 8010f26:	d03f      	beq.n	8010fa8 <RVM_Hyp_Query_VM+0x15c>
 8010f28:	f990 500c 	ldrsb.w	r5, [r0, #12]
 8010f2c:	429d      	cmp	r5, r3
 8010f2e:	d13b      	bne.n	8010fa8 <RVM_Hyp_Query_VM+0x15c>
 8010f30:	f992 3011 	ldrsb.w	r3, [r2, #17]
 8010f34:	2b00      	cmp	r3, #0
 8010f36:	d03b      	beq.n	8010fb0 <RVM_Hyp_Query_VM+0x164>
 8010f38:	f990 500d 	ldrsb.w	r5, [r0, #13]
 8010f3c:	429d      	cmp	r5, r3
 8010f3e:	d137      	bne.n	8010fb0 <RVM_Hyp_Query_VM+0x164>
 8010f40:	f992 3012 	ldrsb.w	r3, [r2, #18]
 8010f44:	b3b3      	cbz	r3, 8010fb4 <RVM_Hyp_Query_VM+0x168>
 8010f46:	f990 500e 	ldrsb.w	r5, [r0, #14]
 8010f4a:	429d      	cmp	r5, r3
 8010f4c:	d132      	bne.n	8010fb4 <RVM_Hyp_Query_VM+0x168>
 8010f4e:	f992 3013 	ldrsb.w	r3, [r2, #19]
 8010f52:	b1cb      	cbz	r3, 8010f88 <RVM_Hyp_Query_VM+0x13c>
 8010f54:	f990 200f 	ldrsb.w	r2, [r0, #15]
 8010f58:	429a      	cmp	r2, r3
 8010f5a:	d115      	bne.n	8010f88 <RVM_Hyp_Query_VM+0x13c>
 8010f5c:	4608      	mov	r0, r1
        if(_RVM_Strncmp(RVM_Virt_DB[Count].Image->Name,Name,16)==0)
            return Count;
    }
    
    return RVM_ERR_RANGE;
}
 8010f5e:	bc70      	pop	{r4, r5, r6}
 8010f60:	4770      	bx	lr
******************************************************************************/
rvm_ret_t _RVM_Strncmp(const rvm_s8_t* Str1, const rvm_s8_t* Str2, rvm_ptr_t Num)
{
    rvm_cnt_t Count;

    for(Count=0;Count<Num;Count++)
 8010f62:	2201      	movs	r2, #1
    rvm_cnt_t Count;
    
    /* Pass through the database to look for the first guy that matches the name */
    for(Count=0;Count<RVM_VM_Num;Count++)
    {
        if(_RVM_Strncmp(RVM_Virt_DB[Count].Image->Name,Name,16)==0)
 8010f64:	5682      	ldrsb	r2, [r0, r2]
 8010f66:	429a      	cmp	r2, r3
 8010f68:	d0f8      	beq.n	8010f5c <RVM_Hyp_Query_VM+0x110>
rvm_ret_t RVM_Hyp_Query_VM(rvm_s8_t* Name)
{
    rvm_cnt_t Count;
    
    /* Pass through the database to look for the first guy that matches the name */
    for(Count=0;Count<RVM_VM_Num;Count++)
 8010f6a:	3101      	adds	r1, #1
 8010f6c:	344c      	adds	r4, #76	; 0x4c
 8010f6e:	42b1      	cmp	r1, r6
 8010f70:	f47f af74 	bne.w	8010e5c <RVM_Hyp_Query_VM+0x10>
    {
        if(_RVM_Strncmp(RVM_Virt_DB[Count].Image->Name,Name,16)==0)
            return Count;
    }
    
    return RVM_ERR_RANGE;
 8010f74:	f06f 0001 	mvn.w	r0, #1
}
 8010f78:	bc70      	pop	{r4, r5, r6}
 8010f7a:	4770      	bx	lr
******************************************************************************/
rvm_ret_t _RVM_Strncmp(const rvm_s8_t* Str1, const rvm_s8_t* Str2, rvm_ptr_t Num)
{
    rvm_cnt_t Count;

    for(Count=0;Count<Num;Count++)
 8010f7c:	2202      	movs	r2, #2
 8010f7e:	e7f1      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010f80:	2203      	movs	r2, #3
 8010f82:	e7ef      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010f84:	2204      	movs	r2, #4
 8010f86:	e7ed      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010f88:	220f      	movs	r2, #15
 8010f8a:	e7eb      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010f8c:	2205      	movs	r2, #5
 8010f8e:	e7e9      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010f90:	2206      	movs	r2, #6
 8010f92:	e7e7      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010f94:	2207      	movs	r2, #7
 8010f96:	e7e5      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010f98:	2208      	movs	r2, #8
 8010f9a:	e7e3      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010f9c:	2209      	movs	r2, #9
 8010f9e:	e7e1      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010fa0:	220a      	movs	r2, #10
 8010fa2:	e7df      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010fa4:	220b      	movs	r2, #11
 8010fa6:	e7dd      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010fa8:	220c      	movs	r2, #12
 8010faa:	e7db      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010fac:	461a      	mov	r2, r3
 8010fae:	e7d9      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010fb0:	220d      	movs	r2, #13
 8010fb2:	e7d7      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010fb4:	220e      	movs	r2, #14
 8010fb6:	e7d5      	b.n	8010f64 <RVM_Hyp_Query_VM+0x118>
 8010fb8:	2001ea50 	.word	0x2001ea50
 8010fbc:	2001e384 	.word	0x2001e384

08010fc0 <RVM_Hyp_Tim_Prog>:
Input       : rvm_ptr_t Period - The new timer period.
Output      : None.
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Tim_Prog(rvm_ptr_t Period)
{
 8010fc0:	b538      	push	{r3, r4, r5, lr}
    /* See if the period is too much */
    if((Period<RVM_MIN_PERIOD)||(Period>=RVM_MAX_PERIOD))
 8010fc2:	1e42      	subs	r2, r0, #1
 8010fc4:	f242 730e 	movw	r3, #9998	; 0x270e
 8010fc8:	429a      	cmp	r2, r3
 8010fca:	d80d      	bhi.n	8010fe8 <RVM_Hyp_Tim_Prog+0x28>
        return RVM_ERR_RANGE;
    
    /* Set this as the new period */
    RVM_Cur_Virt->Sched.Period=Period;
 8010fcc:	4d08      	ldr	r5, [pc, #32]	; (8010ff0 <RVM_Hyp_Tim_Prog+0x30>)
 8010fce:	4604      	mov	r4, r0
 8010fd0:	682b      	ldr	r3, [r5, #0]
 8010fd2:	6418      	str	r0, [r3, #64]	; 0x40
    
    /* Need working timer subsystem */
    RVM_List_Del(RVM_Cur_Virt->Evt_Head.Prev,RVM_Cur_Virt->Evt_Head.Next);
 8010fd4:	6c99      	ldr	r1, [r3, #72]	; 0x48
 8010fd6:	6c58      	ldr	r0, [r3, #68]	; 0x44
 8010fd8:	f001 fe2e 	bl	8012c38 <RVM_List_Del>
    _RVM_Wheel_Ins(RVM_Cur_Virt,Period);
 8010fdc:	6828      	ldr	r0, [r5, #0]
 8010fde:	4621      	mov	r1, r4
 8010fe0:	f000 faf0 	bl	80115c4 <_RVM_Wheel_Ins>
    
    return 0;
 8010fe4:	2000      	movs	r0, #0
 8010fe6:	bd38      	pop	{r3, r4, r5, pc}
******************************************************************************/
rvm_ret_t RVM_Hyp_Tim_Prog(rvm_ptr_t Period)
{
    /* See if the period is too much */
    if((Period<RVM_MIN_PERIOD)||(Period>=RVM_MAX_PERIOD))
        return RVM_ERR_RANGE;
 8010fe8:	f06f 0001 	mvn.w	r0, #1
    /* Need working timer subsystem */
    RVM_List_Del(RVM_Cur_Virt->Evt_Head.Prev,RVM_Cur_Virt->Evt_Head.Next);
    _RVM_Wheel_Ins(RVM_Cur_Virt,Period);
    
    return 0;
}
 8010fec:	bd38      	pop	{r3, r4, r5, pc}
 8010fee:	bf00      	nop
 8010ff0:	2001ea60 	.word	0x2001ea60

08010ff4 <RVM_Hyp_Print>:
Input       : None.
Output      : None.
Return      : rvm_ret_t - If successful, 0; else an error code.
******************************************************************************/
rvm_ret_t RVM_Hyp_Print(void)
{
 8010ff4:	b538      	push	{r3, r4, r5, lr}
    if(RVM_Cur_Virt->Image->Console_Size!=0)
 8010ff6:	4d0f      	ldr	r5, [pc, #60]	; (8011034 <RVM_Hyp_Print+0x40>)
 8010ff8:	682b      	ldr	r3, [r5, #0]
 8010ffa:	691a      	ldr	r2, [r3, #16]
 8010ffc:	6bd3      	ldr	r3, [r2, #60]	; 0x3c
 8010ffe:	b1b3      	cbz	r3, 801102e <RVM_Hyp_Print+0x3a>
    {
        /* Place the end here to avoid excessive printing */
        ((rvm_s8_t*)RVM_Cur_Virt->Image->Console_Buf)[RVM_Cur_Virt->Image->Console_Size-1]='\0';
 8011000:	6c12      	ldr	r2, [r2, #64]	; 0x40
 8011002:	2400      	movs	r4, #0
 8011004:	4413      	add	r3, r2
 8011006:	f803 4c01 	strb.w	r4, [r3, #-1]
        RVM_Print_String(RVM_Cur_Virt->Image->Name);
 801100a:	682b      	ldr	r3, [r5, #0]
 801100c:	6918      	ldr	r0, [r3, #16]
 801100e:	3004      	adds	r0, #4
 8011010:	f001 feae 	bl	8012d70 <RVM_Print_String>
        RVM_Print_String((rvm_s8_t*)" : ");
 8011014:	4808      	ldr	r0, [pc, #32]	; (8011038 <RVM_Hyp_Print+0x44>)
 8011016:	f001 feab 	bl	8012d70 <RVM_Print_String>
        RVM_Print_String(RVM_Cur_Virt->Image->Console_Buf);
 801101a:	682b      	ldr	r3, [r5, #0]
 801101c:	691b      	ldr	r3, [r3, #16]
 801101e:	6c18      	ldr	r0, [r3, #64]	; 0x40
 8011020:	f001 fea6 	bl	8012d70 <RVM_Print_String>
        RVM_Print_String((rvm_s8_t*)"\r\n");
 8011024:	4805      	ldr	r0, [pc, #20]	; (801103c <RVM_Hyp_Print+0x48>)
 8011026:	f001 fea3 	bl	8012d70 <RVM_Print_String>
    }
    else
        return RVM_ERR_RANGE;
    
    return 0;
 801102a:	4620      	mov	r0, r4
 801102c:	bd38      	pop	{r3, r4, r5, pc}
        RVM_Print_String((rvm_s8_t*)" : ");
        RVM_Print_String(RVM_Cur_Virt->Image->Console_Buf);
        RVM_Print_String((rvm_s8_t*)"\r\n");
    }
    else
        return RVM_ERR_RANGE;
 801102e:	f06f 0001 	mvn.w	r0, #1
    
    return 0;
}
 8011032:	bd38      	pop	{r3, r4, r5, pc}
 8011034:	2001ea60 	.word	0x2001ea60
 8011038:	0801308c 	.word	0x0801308c
 801103c:	080134b0 	.word	0x080134b0

08011040 <RVM_Int_Get>:
Input       : struct RVM_Flag_Set* Set - The interrupt set data.
Output      : struct RVM_Flag_Set* Set - The interrupt set data.
Return      : rvm_cnt_t - The interrupt number.
******************************************************************************/
rvm_cnt_t RVM_Int_Get(struct RVM_Flag_Set* Set)
{
 8011040:	b570      	push	{r4, r5, r6, lr}
 8011042:	4604      	mov	r4, r0
    rvm_cnt_t Group;
    rvm_cnt_t Member;
    /* See which source group could possibly have any interrupts */
    Group=_RVM_MSB_Get(Set->Group);
 8011044:	6840      	ldr	r0, [r0, #4]
 8011046:	f7ff f819 	bl	801007c <_RVM_MSB_Get>
    RVM_ASSERT(Group>=0);
 801104a:	1e05      	subs	r5, r0, #0
 801104c:	db16      	blt.n	801107c <RVM_Int_Get+0x3c>
 801104e:	eb04 0685 	add.w	r6, r4, r5, lsl #2
    
    Member=_RVM_MSB_Get(Set->Flags[Group]);
 8011052:	68b0      	ldr	r0, [r6, #8]
 8011054:	f7ff f812 	bl	801007c <_RVM_MSB_Get>
    RVM_ASSERT(Member>=0);
 8011058:	2800      	cmp	r0, #0
 801105a:	db2c      	blt.n	80110b6 <RVM_Int_Get+0x76>
    
    /* Clean up the slot now */
    Set->Flags[Group]&=~(((rvm_ptr_t)1)<<Member);
 801105c:	2301      	movs	r3, #1
 801105e:	68b2      	ldr	r2, [r6, #8]
 8011060:	fa03 f100 	lsl.w	r1, r3, r0
 8011064:	ea22 0201 	bic.w	r2, r2, r1
 8011068:	60b2      	str	r2, [r6, #8]
    if(Set->Flags[Group]==0)
 801106a:	b922      	cbnz	r2, 8011076 <RVM_Int_Get+0x36>
        Set->Group&=~(((rvm_ptr_t)1)<<Group);
 801106c:	6862      	ldr	r2, [r4, #4]
 801106e:	40ab      	lsls	r3, r5
 8011070:	ea22 0303 	bic.w	r3, r2, r3
 8011074:	6063      	str	r3, [r4, #4]
    
    return (Group<<RVM_WORD_ORDER)|Member;
}
 8011076:	ea40 1045 	orr.w	r0, r0, r5, lsl #5
 801107a:	bd70      	pop	{r4, r5, r6, pc}
{
    rvm_cnt_t Group;
    rvm_cnt_t Member;
    /* See which source group could possibly have any interrupts */
    Group=_RVM_MSB_Get(Set->Group);
    RVM_ASSERT(Group>=0);
 801107c:	481c      	ldr	r0, [pc, #112]	; (80110f0 <RVM_Int_Get+0xb0>)
 801107e:	f001 fe77 	bl	8012d70 <RVM_Print_String>
 8011082:	481c      	ldr	r0, [pc, #112]	; (80110f4 <RVM_Int_Get+0xb4>)
 8011084:	f001 fe74 	bl	8012d70 <RVM_Print_String>
 8011088:	481b      	ldr	r0, [pc, #108]	; (80110f8 <RVM_Int_Get+0xb8>)
 801108a:	f001 fe71 	bl	8012d70 <RVM_Print_String>
 801108e:	f240 20ce 	movw	r0, #718	; 0x2ce
 8011092:	f001 fddb 	bl	8012c4c <RVM_Print_Int>
 8011096:	4819      	ldr	r0, [pc, #100]	; (80110fc <RVM_Int_Get+0xbc>)
 8011098:	f001 fe6a 	bl	8012d70 <RVM_Print_String>
 801109c:	4818      	ldr	r0, [pc, #96]	; (8011100 <RVM_Int_Get+0xc0>)
 801109e:	f001 fe67 	bl	8012d70 <RVM_Print_String>
 80110a2:	4818      	ldr	r0, [pc, #96]	; (8011104 <RVM_Int_Get+0xc4>)
 80110a4:	f001 fe64 	bl	8012d70 <RVM_Print_String>
 80110a8:	4817      	ldr	r0, [pc, #92]	; (8011108 <RVM_Int_Get+0xc8>)
 80110aa:	f001 fe61 	bl	8012d70 <RVM_Print_String>
 80110ae:	4813      	ldr	r0, [pc, #76]	; (80110fc <RVM_Int_Get+0xbc>)
 80110b0:	f001 fe5e 	bl	8012d70 <RVM_Print_String>
 80110b4:	e7fe      	b.n	80110b4 <RVM_Int_Get+0x74>
    
    Member=_RVM_MSB_Get(Set->Flags[Group]);
    RVM_ASSERT(Member>=0);
 80110b6:	480e      	ldr	r0, [pc, #56]	; (80110f0 <RVM_Int_Get+0xb0>)
 80110b8:	f001 fe5a 	bl	8012d70 <RVM_Print_String>
 80110bc:	480d      	ldr	r0, [pc, #52]	; (80110f4 <RVM_Int_Get+0xb4>)
 80110be:	f001 fe57 	bl	8012d70 <RVM_Print_String>
 80110c2:	480d      	ldr	r0, [pc, #52]	; (80110f8 <RVM_Int_Get+0xb8>)
 80110c4:	f001 fe54 	bl	8012d70 <RVM_Print_String>
 80110c8:	f240 20d1 	movw	r0, #721	; 0x2d1
 80110cc:	f001 fdbe 	bl	8012c4c <RVM_Print_Int>
 80110d0:	480a      	ldr	r0, [pc, #40]	; (80110fc <RVM_Int_Get+0xbc>)
 80110d2:	f001 fe4d 	bl	8012d70 <RVM_Print_String>
 80110d6:	480a      	ldr	r0, [pc, #40]	; (8011100 <RVM_Int_Get+0xc0>)
 80110d8:	f001 fe4a 	bl	8012d70 <RVM_Print_String>
 80110dc:	4809      	ldr	r0, [pc, #36]	; (8011104 <RVM_Int_Get+0xc4>)
 80110de:	f001 fe47 	bl	8012d70 <RVM_Print_String>
 80110e2:	4809      	ldr	r0, [pc, #36]	; (8011108 <RVM_Int_Get+0xc8>)
 80110e4:	f001 fe44 	bl	8012d70 <RVM_Print_String>
 80110e8:	4804      	ldr	r0, [pc, #16]	; (80110fc <RVM_Int_Get+0xbc>)
 80110ea:	f001 fe41 	bl	8012d70 <RVM_Print_String>
 80110ee:	e7fe      	b.n	80110ee <RVM_Int_Get+0xae>
 80110f0:	08012f08 	.word	0x08012f08
 80110f4:	08013090 	.word	0x08013090
 80110f8:	08012fa4 	.word	0x08012fa4
 80110fc:	080134b0 	.word	0x080134b0
 8011100:	08012fac 	.word	0x08012fac
 8011104:	08012fb8 	.word	0x08012fb8
 8011108:	080130e4 	.word	0x080130e4

0801110c <RVM_VMM_Daemon>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void RVM_VMM_Daemon(void)
{
 801110c:	b538      	push	{r3, r4, r5, lr}
    rvm_ptr_t* Param;
    RVM_LOG_S("VMMD:VMMD initialization complete.\r\n");
 801110e:	4828      	ldr	r0, [pc, #160]	; (80111b0 <RVM_VMM_Daemon+0xa4>)
 8011110:	4d28      	ldr	r5, [pc, #160]	; (80111b4 <RVM_VMM_Daemon+0xa8>)
 8011112:	f001 fe2d 	bl	8012d70 <RVM_Print_String>
    
    /* Main cycle */
    while(1)
    {
        /* Blocking multi receive */
        RVM_Sig_Rcv(RVM_VMM_VMMD_SIG, RME_RCV_BS);
 8011116:	2100      	movs	r1, #0
 8011118:	200f      	movs	r0, #15
 801111a:	f001 feed 	bl	8012ef8 <RVM_Sig_Rcv>
        
        //RVM_LOG_SIS("VMMD:Hypercall ",RVM_Cur_Virt->Image->Param->Number," called.\r\n");
        /* See what system call it is */
        Param=RVM_Cur_Virt->Image->Param->Param;
 801111e:	682b      	ldr	r3, [r5, #0]
 8011120:	691b      	ldr	r3, [r3, #16]
 8011122:	6adc      	ldr	r4, [r3, #44]	; 0x2c
        switch(RVM_Cur_Virt->Image->Param->Number)
 8011124:	6823      	ldr	r3, [r4, #0]
 8011126:	2b0b      	cmp	r3, #11
 8011128:	d8f5      	bhi.n	8011116 <RVM_VMM_Daemon+0xa>
 801112a:	e8df f003 	tbb	[pc, r3]
 801112e:	383c      	.short	0x383c
 8011130:	22272d32 	.word	0x22272d32
 8011134:	0f14191e 	.word	0x0f14191e
 8011138:	060a      	.short	0x060a
                Param[0]=RVM_Hyp_Tim_Prog(Param[0] /* rvm_ptr_t Period */);
                break;
            }
            case RVM_HYP_PRINT:
            {
                Param[0]=RVM_Hyp_Print();
 801113a:	f7ff ff5b 	bl	8010ff4 <RVM_Hyp_Print>
 801113e:	6060      	str	r0, [r4, #4]
                break;
 8011140:	e7e9      	b.n	8011116 <RVM_VMM_Daemon+0xa>
                Param[0]=RVM_Hyp_Query_VM(((rvm_s8_t*)Param) /* rvm_s8_t* Name */);
                break;
            }
            case RVM_HYP_TIMPROG:
            {
                Param[0]=RVM_Hyp_Tim_Prog(Param[0] /* rvm_ptr_t Period */);
 8011142:	6860      	ldr	r0, [r4, #4]
 8011144:	f7ff ff3c 	bl	8010fc0 <RVM_Hyp_Tim_Prog>
 8011148:	6060      	str	r0, [r4, #4]
                break;
 801114a:	e7e4      	b.n	8011116 <RVM_VMM_Daemon+0xa>
                Param[0]=RVM_Hyp_Query_Evt(Param[0] /* rvm_ptr_t VMID */);
                break;
            }
            case RVM_HYP_QUERYVM:
            {
                Param[0]=RVM_Hyp_Query_VM(((rvm_s8_t*)Param) /* rvm_s8_t* Name */);
 801114c:	1d20      	adds	r0, r4, #4
 801114e:	f7ff fe7d 	bl	8010e4c <RVM_Hyp_Query_VM>
 8011152:	6060      	str	r0, [r4, #4]
                break;
 8011154:	e7df      	b.n	8011116 <RVM_VMM_Daemon+0xa>
                Param[0]=RVM_Hyp_Send_Evt(Param[0] /* rvm_ptr_t Evt_ID */);
                break;
            }
            case RVM_HYP_QUERYEVT:
            {
                Param[0]=RVM_Hyp_Query_Evt(Param[0] /* rvm_ptr_t VMID */);
 8011156:	6860      	ldr	r0, [r4, #4]
 8011158:	f7ff fe3c 	bl	8010dd4 <RVM_Hyp_Query_Evt>
 801115c:	6060      	str	r0, [r4, #4]
                break;
 801115e:	e7da      	b.n	8011116 <RVM_VMM_Daemon+0xa>
                Param[0]=RVM_Hyp_Wait_Evt();
                break;
            }
            case RVM_HYP_SENDEVT:
            {
                Param[0]=RVM_Hyp_Send_Evt(Param[0] /* rvm_ptr_t Evt_ID */);
 8011160:	6860      	ldr	r0, [r4, #4]
 8011162:	f7ff fdad 	bl	8010cc0 <RVM_Hyp_Send_Evt>
 8011166:	6060      	str	r0, [r4, #4]
                break;
 8011168:	e7d5      	b.n	8011116 <RVM_VMM_Daemon+0xa>
                Param[0]=RVM_Hyp_Del_Evt(Param[0] /* rvm_cnt_t Evt_ID */);
                break;
            }
            case RVM_HYP_WAITEVT:
            {
                Param[0]=RVM_Hyp_Wait_Evt();
 801116a:	f7ff fca7 	bl	8010abc <RVM_Hyp_Wait_Evt>
 801116e:	6060      	str	r0, [r4, #4]
                break;
 8011170:	e7d1      	b.n	8011116 <RVM_VMM_Daemon+0xa>
                                         Param[1] /* rvm_ptr_t VMID */);
                break;
            }
            case RVM_HYP_DELEVT:
            {
                Param[0]=RVM_Hyp_Del_Evt(Param[0] /* rvm_cnt_t Evt_ID */);
 8011172:	6860      	ldr	r0, [r4, #4]
 8011174:	f7ff fc6a 	bl	8010a4c <RVM_Hyp_Del_Evt>
 8011178:	6060      	str	r0, [r4, #4]
                break;
 801117a:	e7cc      	b.n	8011116 <RVM_VMM_Daemon+0xa>
                Param[0]=RVM_Hyp_Del_Int(Param[0] /* rvm_cnt_t Int_ID */);
                break;
            }
            case RVM_HYP_REGEVT:
            {
                Param[0]=RVM_Hyp_Reg_Evt(Param[0] /* rvm_ptr_t Int_Num */,
 801117c:	68a1      	ldr	r1, [r4, #8]
 801117e:	6860      	ldr	r0, [r4, #4]
 8011180:	f7ff fc1c 	bl	80109bc <RVM_Hyp_Reg_Evt>
 8011184:	6060      	str	r0, [r4, #4]
                                         Param[1] /* rvm_ptr_t VMID */);
                break;
 8011186:	e7c6      	b.n	8011116 <RVM_VMM_Daemon+0xa>
                                         Param[1] /* rvm_ptr_t Int_Num */);
                break;
            }
            case RVM_HYP_DELINT:
            {
                Param[0]=RVM_Hyp_Del_Int(Param[0] /* rvm_cnt_t Int_ID */);
 8011188:	6860      	ldr	r0, [r4, #4]
 801118a:	f7ff fbdf 	bl	801094c <RVM_Hyp_Del_Int>
 801118e:	6060      	str	r0, [r4, #4]
                break;
 8011190:	e7c1      	b.n	8011116 <RVM_VMM_Daemon+0xa>
                Param[0]=RVM_Hyp_Disable_Int();
                break;
            }
            case RVM_HYP_REGINT:
            {
                Param[0]=RVM_Hyp_Reg_Int(Param[0] /* rvm_ptr_t Vect_Num */,
 8011192:	68a1      	ldr	r1, [r4, #8]
 8011194:	6860      	ldr	r0, [r4, #4]
 8011196:	f7ff fb87 	bl	80108a8 <RVM_Hyp_Reg_Int>
 801119a:	6060      	str	r0, [r4, #4]
                                         Param[1] /* rvm_ptr_t Int_Num */);
                break;
 801119c:	e7bb      	b.n	8011116 <RVM_VMM_Daemon+0xa>
                Param[0]=RVM_Hyp_Enable_Int();
                break;
            }
            case RVM_HYP_DISINT:
            {
                Param[0]=RVM_Hyp_Disable_Int();
 801119e:	f7ff fb73 	bl	8010888 <RVM_Hyp_Disable_Int>
 80111a2:	6060      	str	r0, [r4, #4]
                break;
 80111a4:	e7b7      	b.n	8011116 <RVM_VMM_Daemon+0xa>
        Param=RVM_Cur_Virt->Image->Param->Param;
        switch(RVM_Cur_Virt->Image->Param->Number)
        {
            case RVM_HYP_ENAINT:
            {
                Param[0]=RVM_Hyp_Enable_Int();
 80111a6:	f7ff fb0b 	bl	80107c0 <RVM_Hyp_Enable_Int>
 80111aa:	6060      	str	r0, [r4, #4]
                break;
 80111ac:	e7b3      	b.n	8011116 <RVM_VMM_Daemon+0xa>
 80111ae:	bf00      	nop
 80111b0:	080130f0 	.word	0x080130f0
 80111b4:	2001ea60 	.word	0x2001ea60

080111b8 <RVM_Guard_Daemon>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void RVM_Guard_Daemon(void)
{
 80111b8:	b508      	push	{r3, lr}
    rvm_tid_t Thd;
    rvm_ptr_t VMID;
    struct RVM_Evt* Event;
    RVM_LOG_S("GUARD:Guard daemon start complete.\r\n");
 80111ba:	4807      	ldr	r0, [pc, #28]	; (80111d8 <RVM_Guard_Daemon+0x20>)
 80111bc:	f001 fdd8 	bl	8012d70 <RVM_Print_String>

    /* Main cycle - recover faults if possible */
    while(1)
    {
        /* Blocking single receive */
        RVM_Sig_Rcv(RVM_VMM_GUARD_SIG, RME_RCV_BS);
 80111c0:	2100      	movs	r1, #0
 80111c2:	200c      	movs	r0, #12
 80111c4:	f001 fe98 	bl	8012ef8 <RVM_Sig_Rcv>
        
        Thd=RVM_Thd_Sched_Rcv(RVM_VMM_GUARD_THD);
 80111c8:	200b      	movs	r0, #11
 80111ca:	f001 fe71 	bl	8012eb0 <RVM_Thd_Sched_Rcv>
        
        /* We stop whenever there is a fault now */
        RVM_LOG_S("GUARD:Fault!.\r\n");
 80111ce:	4803      	ldr	r0, [pc, #12]	; (80111dc <RVM_Guard_Daemon+0x24>)
 80111d0:	f001 fdce 	bl	8012d70 <RVM_Print_String>
 80111d4:	e7fe      	b.n	80111d4 <RVM_Guard_Daemon+0x1c>
 80111d6:	bf00      	nop
 80111d8:	08013118 	.word	0x08013118
 80111dc:	08013140 	.word	0x08013140

080111e0 <RVM_Interrupt_Daemon>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void RVM_Interrupt_Daemon(void)
{
 80111e0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    while(1)
    {
        /* Blocking multi receive */
        RVM_Sig_Rcv(RVM_BOOT_INIT_INT, RME_RCV_BM);
        /* Try to lock the first set of table */
        Flags->Set0.Lock=1;
 80111e4:	f8df 922c 	ldr.w	r9, [pc, #556]	; 8011414 <RVM_Interrupt_Daemon+0x234>
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void RVM_Interrupt_Daemon(void)
{
 80111e8:	b083      	sub	sp, #12
    rvm_cnt_t Num;
    struct RVM_Flags* Flags;
    RVM_LOG_S("INTD:Interrupt daemon start complete.\r\n");
 80111ea:	4888      	ldr	r0, [pc, #544]	; (801140c <RVM_Interrupt_Daemon+0x22c>)
    {
        /* Blocking multi receive */
        RVM_Sig_Rcv(RVM_BOOT_INIT_INT, RME_RCV_BM);
        /* Try to lock the first set of table */
        Flags->Set0.Lock=1;
        while(Flags->Set0.Group!=0)
 80111ec:	46cb      	mov	fp, r9
 80111ee:	4c88      	ldr	r4, [pc, #544]	; (8011410 <RVM_Interrupt_Daemon+0x230>)
******************************************************************************/
void RVM_Interrupt_Daemon(void)
{
    rvm_cnt_t Num;
    struct RVM_Flags* Flags;
    RVM_LOG_S("INTD:Interrupt daemon start complete.\r\n");
 80111f0:	f001 fdbe 	bl	8012d70 <RVM_Print_String>
    Flags=(struct RVM_Flags*)RVM_INT_FLAG_ADDR;
    /* Main cycle - do nothing for now */
    while(1)
    {
        /* Blocking multi receive */
        RVM_Sig_Rcv(RVM_BOOT_INIT_INT, RME_RCV_BM);
 80111f4:	2101      	movs	r1, #1
 80111f6:	2007      	movs	r0, #7
 80111f8:	f001 fe7e 	bl	8012ef8 <RVM_Sig_Rcv>
    
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
    
    while(Int!=(struct RVM_Int*)(&RVM_Int_Vect[Vect_Num]))
    {
        RVM_Int_Send(&RVM_Virt_DB[Int->VM_ID],Int->Int_Num);
 80111fc:	f04f 0a4c 	mov.w	sl, #76	; 0x4c
    while(1)
    {
        /* Blocking multi receive */
        RVM_Sig_Rcv(RVM_BOOT_INIT_INT, RME_RCV_BM);
        /* Try to lock the first set of table */
        Flags->Set0.Lock=1;
 8011200:	2301      	movs	r3, #1
 8011202:	f8c9 3000 	str.w	r3, [r9]
        while(Flags->Set0.Group!=0)
 8011206:	f8d9 3004 	ldr.w	r3, [r9, #4]
 801120a:	2b00      	cmp	r3, #0
 801120c:	d06f      	beq.n	80112ee <RVM_Interrupt_Daemon+0x10e>
        {
            /* Process the interrupts in the first group one by one */
            Num=RVM_Int_Get(&(Flags->Set0));
 801120e:	4881      	ldr	r0, [pc, #516]	; (8011414 <RVM_Interrupt_Daemon+0x234>)
 8011210:	f7ff ff16 	bl	8011040 <RVM_Int_Get>
Return      : None.
******************************************************************************/
void RVM_Int_Proc(rvm_cnt_t Vect_Num)
{
    struct RVM_Int* Int;
    RVM_ASSERT(Vect_Num<RVM_INT_VECT_NUM);
 8011214:	286d      	cmp	r0, #109	; 0x6d
 8011216:	dc4d      	bgt.n	80112b4 <RVM_Interrupt_Daemon+0xd4>
    
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
 8011218:	4b7f      	ldr	r3, [pc, #508]	; (8011418 <RVM_Interrupt_Daemon+0x238>)
 801121a:	eb03 07c0 	add.w	r7, r3, r0, lsl #3
 801121e:	687e      	ldr	r6, [r7, #4]
    
    while(Int!=(struct RVM_Int*)(&RVM_Int_Vect[Vect_Num]))
 8011220:	42be      	cmp	r6, r7
 8011222:	d0f0      	beq.n	8011206 <RVM_Interrupt_Daemon+0x26>
    {
        RVM_Int_Send(&RVM_Virt_DB[Int->VM_ID],Int->Int_Num);
 8011224:	68f5      	ldr	r5, [r6, #12]
 8011226:	6933      	ldr	r3, [r6, #16]
 8011228:	fb0a 4805 	mla	r8, sl, r5, r4
Output      : None.
Return      : None.
******************************************************************************/
void RVM_Int_Send(struct RVM_Virt* Virt, rvm_ptr_t Int_Num)
{
    RVM_ASSERT(Int_Num<Virt->Image->Int_Num);
 801122c:	f8d8 2010 	ldr.w	r2, [r8, #16]
 8011230:	6c52      	ldr	r2, [r2, #68]	; 0x44
 8011232:	429a      	cmp	r2, r3
 8011234:	d921      	bls.n	801127a <RVM_Interrupt_Daemon+0x9a>
 8011236:	9700      	str	r7, [sp, #0]
    
    if(RVM_VM_STATE(Virt->Sched.State)==RVM_VM_WAITEVT)
 8011238:	fb0a f105 	mul.w	r1, sl, r5
 801123c:	1867      	adds	r7, r4, r1
 801123e:	f897 0034 	ldrb.w	r0, [r7, #52]	; 0x34
 8011242:	2801      	cmp	r0, #1
 8011244:	f000 80d4 	beq.w	80113f0 <RVM_Interrupt_Daemon+0x210>
    
    /* Set the corresponding interrupt bit */
    _RVM_Set_Int_Flag(Virt, Int_Num);
    
    /* Send interrupt to it, if its interrupts are enabled */
    if((Virt->Sched.State&RVM_VM_INTENA)!=0)
 8011248:	fb0a 4505 	mla	r5, sl, r5, r4
        _RVM_Set_Rdy(Virt);
        RVM_VM_STATE_SET(Virt->Sched.State,RVM_VM_RUNNING);
    }
    
    /* Set the corresponding interrupt bit */
    _RVM_Set_Int_Flag(Virt, Int_Num);
 801124c:	4619      	mov	r1, r3
 801124e:	4640      	mov	r0, r8
 8011250:	f7ff faa4 	bl	801079c <_RVM_Set_Int_Flag>
    
    /* Send interrupt to it, if its interrupts are enabled */
    if((Virt->Sched.State&RVM_VM_INTENA)!=0)
 8011254:	6b6b      	ldr	r3, [r5, #52]	; 0x34
 8011256:	03da      	lsls	r2, r3, #15
 8011258:	d502      	bpl.n	8011260 <RVM_Interrupt_Daemon+0x80>
        RVM_Sig_Snd(Virt->Cap.Int_Sig);
 801125a:	6aa8      	ldr	r0, [r5, #40]	; 0x28
 801125c:	f001 fe44 	bl	8012ee8 <RVM_Sig_Snd>
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
    
    while(Int!=(struct RVM_Int*)(&RVM_Int_Vect[Vect_Num]))
    {
        RVM_Int_Send(&RVM_Virt_DB[Int->VM_ID],Int->Int_Num);
        Int=(struct RVM_Int*)(Int->Head.Next);
 8011260:	6876      	ldr	r6, [r6, #4]
    struct RVM_Int* Int;
    RVM_ASSERT(Vect_Num<RVM_INT_VECT_NUM);
    
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
    
    while(Int!=(struct RVM_Int*)(&RVM_Int_Vect[Vect_Num]))
 8011262:	9b00      	ldr	r3, [sp, #0]
 8011264:	429e      	cmp	r6, r3
 8011266:	d0ce      	beq.n	8011206 <RVM_Interrupt_Daemon+0x26>
    {
        RVM_Int_Send(&RVM_Virt_DB[Int->VM_ID],Int->Int_Num);
 8011268:	68f5      	ldr	r5, [r6, #12]
 801126a:	6933      	ldr	r3, [r6, #16]
 801126c:	fb0a 4805 	mla	r8, sl, r5, r4
Output      : None.
Return      : None.
******************************************************************************/
void RVM_Int_Send(struct RVM_Virt* Virt, rvm_ptr_t Int_Num)
{
    RVM_ASSERT(Int_Num<Virt->Image->Int_Num);
 8011270:	f8d8 1010 	ldr.w	r1, [r8, #16]
 8011274:	6c49      	ldr	r1, [r1, #68]	; 0x44
 8011276:	428b      	cmp	r3, r1
 8011278:	d3de      	bcc.n	8011238 <RVM_Interrupt_Daemon+0x58>
 801127a:	4868      	ldr	r0, [pc, #416]	; (801141c <RVM_Interrupt_Daemon+0x23c>)
 801127c:	f001 fd78 	bl	8012d70 <RVM_Print_String>
 8011280:	4867      	ldr	r0, [pc, #412]	; (8011420 <RVM_Interrupt_Daemon+0x240>)
 8011282:	f001 fd75 	bl	8012d70 <RVM_Print_String>
 8011286:	4867      	ldr	r0, [pc, #412]	; (8011424 <RVM_Interrupt_Daemon+0x244>)
 8011288:	f001 fd72 	bl	8012d70 <RVM_Print_String>
 801128c:	f240 200f 	movw	r0, #527	; 0x20f
 8011290:	f001 fcdc 	bl	8012c4c <RVM_Print_Int>
 8011294:	4864      	ldr	r0, [pc, #400]	; (8011428 <RVM_Interrupt_Daemon+0x248>)
 8011296:	f001 fd6b 	bl	8012d70 <RVM_Print_String>
 801129a:	4864      	ldr	r0, [pc, #400]	; (801142c <RVM_Interrupt_Daemon+0x24c>)
 801129c:	f001 fd68 	bl	8012d70 <RVM_Print_String>
 80112a0:	4863      	ldr	r0, [pc, #396]	; (8011430 <RVM_Interrupt_Daemon+0x250>)
 80112a2:	f001 fd65 	bl	8012d70 <RVM_Print_String>
 80112a6:	4863      	ldr	r0, [pc, #396]	; (8011434 <RVM_Interrupt_Daemon+0x254>)
 80112a8:	f001 fd62 	bl	8012d70 <RVM_Print_String>
 80112ac:	485e      	ldr	r0, [pc, #376]	; (8011428 <RVM_Interrupt_Daemon+0x248>)
 80112ae:	f001 fd5f 	bl	8012d70 <RVM_Print_String>
 80112b2:	e7fe      	b.n	80112b2 <RVM_Interrupt_Daemon+0xd2>
Return      : None.
******************************************************************************/
void RVM_Int_Proc(rvm_cnt_t Vect_Num)
{
    struct RVM_Int* Int;
    RVM_ASSERT(Vect_Num<RVM_INT_VECT_NUM);
 80112b4:	4859      	ldr	r0, [pc, #356]	; (801141c <RVM_Interrupt_Daemon+0x23c>)
 80112b6:	f001 fd5b 	bl	8012d70 <RVM_Print_String>
 80112ba:	4859      	ldr	r0, [pc, #356]	; (8011420 <RVM_Interrupt_Daemon+0x240>)
 80112bc:	f001 fd58 	bl	8012d70 <RVM_Print_String>
 80112c0:	4858      	ldr	r0, [pc, #352]	; (8011424 <RVM_Interrupt_Daemon+0x244>)
 80112c2:	f001 fd55 	bl	8012d70 <RVM_Print_String>
 80112c6:	f240 20e5 	movw	r0, #741	; 0x2e5
 80112ca:	f001 fcbf 	bl	8012c4c <RVM_Print_Int>
 80112ce:	4856      	ldr	r0, [pc, #344]	; (8011428 <RVM_Interrupt_Daemon+0x248>)
 80112d0:	f001 fd4e 	bl	8012d70 <RVM_Print_String>
 80112d4:	4855      	ldr	r0, [pc, #340]	; (801142c <RVM_Interrupt_Daemon+0x24c>)
 80112d6:	f001 fd4b 	bl	8012d70 <RVM_Print_String>
 80112da:	4855      	ldr	r0, [pc, #340]	; (8011430 <RVM_Interrupt_Daemon+0x250>)
 80112dc:	f001 fd48 	bl	8012d70 <RVM_Print_String>
 80112e0:	4854      	ldr	r0, [pc, #336]	; (8011434 <RVM_Interrupt_Daemon+0x254>)
 80112e2:	f001 fd45 	bl	8012d70 <RVM_Print_String>
 80112e6:	4850      	ldr	r0, [pc, #320]	; (8011428 <RVM_Interrupt_Daemon+0x248>)
 80112e8:	f001 fd42 	bl	8012d70 <RVM_Print_String>
 80112ec:	e7fe      	b.n	80112ec <RVM_Interrupt_Daemon+0x10c>
            /* Process the interrupts in the first group one by one */
            Num=RVM_Int_Get(&(Flags->Set0));
            RVM_Int_Proc(Num);
        }
        Flags->Set0.Lock=0;
        Flags->Set1.Lock=1;
 80112ee:	2201      	movs	r2, #1
    
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
    
    while(Int!=(struct RVM_Int*)(&RVM_Int_Vect[Vect_Num]))
    {
        RVM_Int_Send(&RVM_Virt_DB[Int->VM_ID],Int->Int_Num);
 80112f0:	274c      	movs	r7, #76	; 0x4c
        {
            /* Process the interrupts in the first group one by one */
            Num=RVM_Int_Get(&(Flags->Set0));
            RVM_Int_Proc(Num);
        }
        Flags->Set0.Lock=0;
 80112f2:	f8cb 3000 	str.w	r3, [fp]
        Flags->Set1.Lock=1;
 80112f6:	f8cb 2088 	str.w	r2, [fp, #136]	; 0x88
        while(Flags->Set1.Group!=0)
 80112fa:	f8d9 308c 	ldr.w	r3, [r9, #140]	; 0x8c
 80112fe:	2b00      	cmp	r3, #0
 8011300:	d073      	beq.n	80113ea <RVM_Interrupt_Daemon+0x20a>
        {
            /* Process the interrupts in the first group one by one */
            Num=RVM_Int_Get(&(Flags->Set1));
 8011302:	484d      	ldr	r0, [pc, #308]	; (8011438 <RVM_Interrupt_Daemon+0x258>)
 8011304:	f7ff fe9c 	bl	8011040 <RVM_Int_Get>
Return      : None.
******************************************************************************/
void RVM_Int_Proc(rvm_cnt_t Vect_Num)
{
    struct RVM_Int* Int;
    RVM_ASSERT(Vect_Num<RVM_INT_VECT_NUM);
 8011308:	286d      	cmp	r0, #109	; 0x6d
 801130a:	dc51      	bgt.n	80113b0 <RVM_Interrupt_Daemon+0x1d0>
    
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
 801130c:	4b42      	ldr	r3, [pc, #264]	; (8011418 <RVM_Interrupt_Daemon+0x238>)
 801130e:	eb03 03c0 	add.w	r3, r3, r0, lsl #3
 8011312:	f8d3 8004 	ldr.w	r8, [r3, #4]
    
    while(Int!=(struct RVM_Int*)(&RVM_Int_Vect[Vect_Num]))
 8011316:	461e      	mov	r6, r3
 8011318:	45b0      	cmp	r8, r6
 801131a:	d0ee      	beq.n	80112fa <RVM_Interrupt_Daemon+0x11a>
    {
        RVM_Int_Send(&RVM_Virt_DB[Int->VM_ID],Int->Int_Num);
 801131c:	f8d8 a00c 	ldr.w	sl, [r8, #12]
 8011320:	f8d8 2010 	ldr.w	r2, [r8, #16]
 8011324:	fb07 f30a 	mul.w	r3, r7, sl
 8011328:	18e5      	adds	r5, r4, r3
Output      : None.
Return      : None.
******************************************************************************/
void RVM_Int_Send(struct RVM_Virt* Virt, rvm_ptr_t Int_Num)
{
    RVM_ASSERT(Int_Num<Virt->Image->Int_Num);
 801132a:	6929      	ldr	r1, [r5, #16]
 801132c:	6c49      	ldr	r1, [r1, #68]	; 0x44
 801132e:	428a      	cmp	r2, r1
 8011330:	d221      	bcs.n	8011376 <RVM_Interrupt_Daemon+0x196>
    
    if(RVM_VM_STATE(Virt->Sched.State)==RVM_VM_WAITEVT)
 8011332:	f895 1034 	ldrb.w	r1, [r5, #52]	; 0x34
 8011336:	2901      	cmp	r1, #1
 8011338:	d10c      	bne.n	8011354 <RVM_Interrupt_Daemon+0x174>
    {
        RVM_List_Del(Virt->Head.Prev,Virt->Head.Next);
 801133a:	58e0      	ldr	r0, [r4, r3]
 801133c:	6869      	ldr	r1, [r5, #4]
 801133e:	9200      	str	r2, [sp, #0]
 8011340:	f001 fc7a 	bl	8012c38 <RVM_List_Del>
        _RVM_Set_Rdy(Virt);
 8011344:	4628      	mov	r0, r5
 8011346:	f7ff f939 	bl	80105bc <_RVM_Set_Rdy>
        RVM_VM_STATE_SET(Virt->Sched.State,RVM_VM_RUNNING);
 801134a:	6b6b      	ldr	r3, [r5, #52]	; 0x34
 801134c:	9a00      	ldr	r2, [sp, #0]
 801134e:	f023 03ff 	bic.w	r3, r3, #255	; 0xff
 8011352:	636b      	str	r3, [r5, #52]	; 0x34
    
    /* Set the corresponding interrupt bit */
    _RVM_Set_Int_Flag(Virt, Int_Num);
    
    /* Send interrupt to it, if its interrupts are enabled */
    if((Virt->Sched.State&RVM_VM_INTENA)!=0)
 8011354:	fb07 4a0a 	mla	sl, r7, sl, r4
        _RVM_Set_Rdy(Virt);
        RVM_VM_STATE_SET(Virt->Sched.State,RVM_VM_RUNNING);
    }
    
    /* Set the corresponding interrupt bit */
    _RVM_Set_Int_Flag(Virt, Int_Num);
 8011358:	4611      	mov	r1, r2
 801135a:	4628      	mov	r0, r5
 801135c:	f7ff fa1e 	bl	801079c <_RVM_Set_Int_Flag>
    
    /* Send interrupt to it, if its interrupts are enabled */
    if((Virt->Sched.State&RVM_VM_INTENA)!=0)
 8011360:	f8da 3034 	ldr.w	r3, [sl, #52]	; 0x34
 8011364:	03db      	lsls	r3, r3, #15
 8011366:	d503      	bpl.n	8011370 <RVM_Interrupt_Daemon+0x190>
        RVM_Sig_Snd(Virt->Cap.Int_Sig);
 8011368:	f8da 0028 	ldr.w	r0, [sl, #40]	; 0x28
 801136c:	f001 fdbc 	bl	8012ee8 <RVM_Sig_Snd>
    Int=(struct RVM_Int*)(RVM_Int_Vect[Vect_Num].Next);
    
    while(Int!=(struct RVM_Int*)(&RVM_Int_Vect[Vect_Num]))
    {
        RVM_Int_Send(&RVM_Virt_DB[Int->VM_ID],Int->Int_Num);
        Int=(struct RVM_Int*)(Int->Head.Next);
 8011370:	f8d8 8004 	ldr.w	r8, [r8, #4]
 8011374:	e7d0      	b.n	8011318 <RVM_Interrupt_Daemon+0x138>
Output      : None.
Return      : None.
******************************************************************************/
void RVM_Int_Send(struct RVM_Virt* Virt, rvm_ptr_t Int_Num)
{
    RVM_ASSERT(Int_Num<Virt->Image->Int_Num);
 8011376:	4829      	ldr	r0, [pc, #164]	; (801141c <RVM_Interrupt_Daemon+0x23c>)
 8011378:	f001 fcfa 	bl	8012d70 <RVM_Print_String>
 801137c:	4828      	ldr	r0, [pc, #160]	; (8011420 <RVM_Interrupt_Daemon+0x240>)
 801137e:	f001 fcf7 	bl	8012d70 <RVM_Print_String>
 8011382:	4828      	ldr	r0, [pc, #160]	; (8011424 <RVM_Interrupt_Daemon+0x244>)
 8011384:	f001 fcf4 	bl	8012d70 <RVM_Print_String>
 8011388:	f240 200f 	movw	r0, #527	; 0x20f
 801138c:	f001 fc5e 	bl	8012c4c <RVM_Print_Int>
 8011390:	4825      	ldr	r0, [pc, #148]	; (8011428 <RVM_Interrupt_Daemon+0x248>)
 8011392:	f001 fced 	bl	8012d70 <RVM_Print_String>
 8011396:	4825      	ldr	r0, [pc, #148]	; (801142c <RVM_Interrupt_Daemon+0x24c>)
 8011398:	f001 fcea 	bl	8012d70 <RVM_Print_String>
 801139c:	4824      	ldr	r0, [pc, #144]	; (8011430 <RVM_Interrupt_Daemon+0x250>)
 801139e:	f001 fce7 	bl	8012d70 <RVM_Print_String>
 80113a2:	4824      	ldr	r0, [pc, #144]	; (8011434 <RVM_Interrupt_Daemon+0x254>)
 80113a4:	f001 fce4 	bl	8012d70 <RVM_Print_String>
 80113a8:	481f      	ldr	r0, [pc, #124]	; (8011428 <RVM_Interrupt_Daemon+0x248>)
 80113aa:	f001 fce1 	bl	8012d70 <RVM_Print_String>
 80113ae:	e7fe      	b.n	80113ae <RVM_Interrupt_Daemon+0x1ce>
Return      : None.
******************************************************************************/
void RVM_Int_Proc(rvm_cnt_t Vect_Num)
{
    struct RVM_Int* Int;
    RVM_ASSERT(Vect_Num<RVM_INT_VECT_NUM);
 80113b0:	481a      	ldr	r0, [pc, #104]	; (801141c <RVM_Interrupt_Daemon+0x23c>)
 80113b2:	f001 fcdd 	bl	8012d70 <RVM_Print_String>
 80113b6:	481a      	ldr	r0, [pc, #104]	; (8011420 <RVM_Interrupt_Daemon+0x240>)
 80113b8:	f001 fcda 	bl	8012d70 <RVM_Print_String>
 80113bc:	4819      	ldr	r0, [pc, #100]	; (8011424 <RVM_Interrupt_Daemon+0x244>)
 80113be:	f001 fcd7 	bl	8012d70 <RVM_Print_String>
 80113c2:	f240 20e5 	movw	r0, #741	; 0x2e5
 80113c6:	f001 fc41 	bl	8012c4c <RVM_Print_Int>
 80113ca:	4817      	ldr	r0, [pc, #92]	; (8011428 <RVM_Interrupt_Daemon+0x248>)
 80113cc:	f001 fcd0 	bl	8012d70 <RVM_Print_String>
 80113d0:	4816      	ldr	r0, [pc, #88]	; (801142c <RVM_Interrupt_Daemon+0x24c>)
 80113d2:	f001 fccd 	bl	8012d70 <RVM_Print_String>
 80113d6:	4816      	ldr	r0, [pc, #88]	; (8011430 <RVM_Interrupt_Daemon+0x250>)
 80113d8:	f001 fcca 	bl	8012d70 <RVM_Print_String>
 80113dc:	4815      	ldr	r0, [pc, #84]	; (8011434 <RVM_Interrupt_Daemon+0x254>)
 80113de:	f001 fcc7 	bl	8012d70 <RVM_Print_String>
 80113e2:	4811      	ldr	r0, [pc, #68]	; (8011428 <RVM_Interrupt_Daemon+0x248>)
 80113e4:	f001 fcc4 	bl	8012d70 <RVM_Print_String>
 80113e8:	e7fe      	b.n	80113e8 <RVM_Interrupt_Daemon+0x208>
        {
            /* Process the interrupts in the first group one by one */
            Num=RVM_Int_Get(&(Flags->Set1));
            RVM_Int_Proc(Num);
        }
        Flags->Set1.Lock=0;
 80113ea:	f8cb 3088 	str.w	r3, [fp, #136]	; 0x88
        /* Now many VMs are woken up, and many interrupts are delivered */
    }
 80113ee:	e701      	b.n	80111f4 <RVM_Interrupt_Daemon+0x14>
{
    RVM_ASSERT(Int_Num<Virt->Image->Int_Num);
    
    if(RVM_VM_STATE(Virt->Sched.State)==RVM_VM_WAITEVT)
    {
        RVM_List_Del(Virt->Head.Prev,Virt->Head.Next);
 80113f0:	5860      	ldr	r0, [r4, r1]
 80113f2:	6879      	ldr	r1, [r7, #4]
 80113f4:	9301      	str	r3, [sp, #4]
 80113f6:	f001 fc1f 	bl	8012c38 <RVM_List_Del>
        _RVM_Set_Rdy(Virt);
 80113fa:	4640      	mov	r0, r8
 80113fc:	f7ff f8de 	bl	80105bc <_RVM_Set_Rdy>
        RVM_VM_STATE_SET(Virt->Sched.State,RVM_VM_RUNNING);
 8011400:	6b79      	ldr	r1, [r7, #52]	; 0x34
 8011402:	9b01      	ldr	r3, [sp, #4]
 8011404:	f021 01ff 	bic.w	r1, r1, #255	; 0xff
 8011408:	6379      	str	r1, [r7, #52]	; 0x34
 801140a:	e71d      	b.n	8011248 <RVM_Interrupt_Daemon+0x68>
 801140c:	08013150 	.word	0x08013150
 8011410:	2001e384 	.word	0x2001e384
 8011414:	20010000 	.word	0x20010000
 8011418:	2001e00c 	.word	0x2001e00c
 801141c:	08012f08 	.word	0x08012f08
 8011420:	08013090 	.word	0x08013090
 8011424:	08012fa4 	.word	0x08012fa4
 8011428:	080134b0 	.word	0x080134b0
 801142c:	08012fac 	.word	0x08012fac
 8011430:	08012fb8 	.word	0x08012fb8
 8011434:	080130e4 	.word	0x080130e4
 8011438:	20010088 	.word	0x20010088

0801143c <RVM_Timer_Daemon>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void RVM_Timer_Daemon(void)
{
 801143c:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8011440:	4e53      	ldr	r6, [pc, #332]	; (8011590 <RVM_Timer_Daemon+0x154>)
    struct RVM_Virt* Virt;
    struct RVM_List* Slot;
    struct RVM_List* Trav;
    
    RVM_LOG_S("TIMD:Timer daemon start complete.\r\n");
 8011442:	4854      	ldr	r0, [pc, #336]	; (8011594 <RVM_Timer_Daemon+0x158>)
 8011444:	4f54      	ldr	r7, [pc, #336]	; (8011598 <RVM_Timer_Daemon+0x15c>)
            /* Send number 0 interrupt to it */
            RVM_Int_Send(Virt, 0);
        }
        
        /* If there is at least one virtual machine working, check scheduler time expiration */
        if(RVM_Cur_Virt!=0)
 8011446:	46b2      	mov	sl, r6
 8011448:	f8df 9170 	ldr.w	r9, [pc, #368]	; 80115bc <RVM_Timer_Daemon+0x180>
 801144c:	f8df b170 	ldr.w	fp, [pc, #368]	; 80115c0 <RVM_Timer_Daemon+0x184>
{
    struct RVM_Virt* Virt;
    struct RVM_List* Slot;
    struct RVM_List* Trav;
    
    RVM_LOG_S("TIMD:Timer daemon start complete.\r\n");
 8011450:	f001 fc8e 	bl	8012d70 <RVM_Print_String>

    /* We will receive a timer interrupt every tick here */
    while(1)
    {
        RVM_Sig_Rcv(RVM_BOOT_INIT_TIMER, RME_RCV_BS);
 8011454:	2100      	movs	r1, #0
 8011456:	2006      	movs	r0, #6
 8011458:	f001 fd4e 	bl	8012ef8 <RVM_Sig_Rcv>
        RVM_Tick++;
 801145c:	683b      	ldr	r3, [r7, #0]
 801145e:	3301      	adds	r3, #1
        /*
        if((RVM_Tick%1000)==0)
            RVM_LOG_S("TIMD:Timer daemon passed 1000 ticks.\r\n");
        */
        Slot=&(RVM_Wheel[RVM_Tick%RVM_WHEEL_SIZE]);
 8011460:	f003 081f 	and.w	r8, r3, #31

    /* We will receive a timer interrupt every tick here */
    while(1)
    {
        RVM_Sig_Rcv(RVM_BOOT_INIT_TIMER, RME_RCV_BS);
        RVM_Tick++;
 8011464:	603b      	str	r3, [r7, #0]
        /*
        if((RVM_Tick%1000)==0)
            RVM_LOG_S("TIMD:Timer daemon passed 1000 ticks.\r\n");
        */
        Slot=&(RVM_Wheel[RVM_Tick%RVM_WHEEL_SIZE]);
 8011466:	eb09 08c8 	add.w	r8, r9, r8, lsl #3
        
        Trav=Slot->Next;
 801146a:	f8d8 2004 	ldr.w	r2, [r8, #4]
        /* See if we need to process the timer wheel to deliver timer interrupts to virtual machines */
        while(Trav!=Slot)
 801146e:	4590      	cmp	r8, r2
 8011470:	d043      	beq.n	80114fa <RVM_Timer_Daemon+0xbe>
        {
            Virt=RVM_DLY2VM(Trav);
 8011472:	f1a2 0408 	sub.w	r4, r2, #8
            Trav=Trav->Next;
 8011476:	6855      	ldr	r5, [r2, #4]
            /* If the value is more than this, then it means that the time have
             * already passed and we have to process this */
            if((RVM_Tick-Virt->Sched.Timeout)>=(RVM_ALLBITS>>1))
 8011478:	6be2      	ldr	r2, [r4, #60]	; 0x3c
 801147a:	1a9b      	subs	r3, r3, r2
 801147c:	4a47      	ldr	r2, [pc, #284]	; (801159c <RVM_Timer_Daemon+0x160>)
 801147e:	4293      	cmp	r3, r2
 8011480:	d83b      	bhi.n	80114fa <RVM_Timer_Daemon+0xbe>
                break;
            
            /* This VM should be processed, place it at the new position */
            RVM_List_Del(Virt->Delay.Prev,Virt->Delay.Next);
 8011482:	68e1      	ldr	r1, [r4, #12]
 8011484:	68a0      	ldr	r0, [r4, #8]
 8011486:	f001 fbd7 	bl	8012c38 <RVM_List_Del>
            _RVM_Wheel_Ins(Virt,Virt->Sched.Period);
 801148a:	6c20      	ldr	r0, [r4, #64]	; 0x40
{
    struct RVM_List* Slot;
    struct RVM_List* Trav_Ptr;
    struct RVM_Virt* Trav_Virt;
    
    Slot=&(RVM_Wheel[(RVM_Tick+Period)%RVM_WHEEL_SIZE]);
 801148c:	f8d7 e000 	ldr.w	lr, [r7]
 8011490:	eb00 0c0e 	add.w	ip, r0, lr
 8011494:	f00c 011f 	and.w	r1, ip, #31
 8011498:	eb09 01c1 	add.w	r1, r9, r1, lsl #3
    
    Trav_Ptr=Slot->Next;
 801149c:	684a      	ldr	r2, [r1, #4]
    while(Trav_Ptr!=Slot)
 801149e:	4291      	cmp	r1, r2
 80114a0:	d103      	bne.n	80114aa <RVM_Timer_Daemon+0x6e>
 80114a2:	e007      	b.n	80114b4 <RVM_Timer_Daemon+0x78>
    {
        Trav_Virt=RVM_DLY2VM(Trav_Ptr);
        if((Trav_Virt->Sched.Timeout-RVM_Tick)>Period)
            break;
        
        Trav_Ptr=Trav_Ptr->Next;
 80114a4:	6852      	ldr	r2, [r2, #4]
    struct RVM_Virt* Trav_Virt;
    
    Slot=&(RVM_Wheel[(RVM_Tick+Period)%RVM_WHEEL_SIZE]);
    
    Trav_Ptr=Slot->Next;
    while(Trav_Ptr!=Slot)
 80114a6:	4291      	cmp	r1, r2
 80114a8:	d004      	beq.n	80114b4 <RVM_Timer_Daemon+0x78>
    {
        Trav_Virt=RVM_DLY2VM(Trav_Ptr);
        if((Trav_Virt->Sched.Timeout-RVM_Tick)>Period)
 80114aa:	6b53      	ldr	r3, [r2, #52]	; 0x34
 80114ac:	ebce 0303 	rsb	r3, lr, r3
 80114b0:	4298      	cmp	r0, r3
 80114b2:	d2f7      	bcs.n	80114a4 <RVM_Timer_Daemon+0x68>
        
        Trav_Ptr=Trav_Ptr->Next;
    }

    /* Insert this into the list */
    Virt->Sched.Timeout=RVM_Tick+Period;
 80114b4:	f8c4 c03c 	str.w	ip, [r4, #60]	; 0x3c
    RVM_List_Ins(&(Virt->Delay),Trav_Ptr->Prev,Trav_Ptr);
 80114b8:	f104 0008 	add.w	r0, r4, #8
 80114bc:	6811      	ldr	r1, [r2, #0]
 80114be:	f001 fbbf 	bl	8012c40 <RVM_List_Ins>
Output      : None.
Return      : None.
******************************************************************************/
void RVM_Int_Send(struct RVM_Virt* Virt, rvm_ptr_t Int_Num)
{
    RVM_ASSERT(Int_Num<Virt->Image->Int_Num);
 80114c2:	6923      	ldr	r3, [r4, #16]
 80114c4:	6c5b      	ldr	r3, [r3, #68]	; 0x44
 80114c6:	b343      	cbz	r3, 801151a <RVM_Timer_Daemon+0xde>
    
    if(RVM_VM_STATE(Virt->Sched.State)==RVM_VM_WAITEVT)
 80114c8:	f894 3034 	ldrb.w	r3, [r4, #52]	; 0x34
 80114cc:	2b01      	cmp	r3, #1
 80114ce:	d041      	beq.n	8011554 <RVM_Timer_Daemon+0x118>
        _RVM_Set_Rdy(Virt);
        RVM_VM_STATE_SET(Virt->Sched.State,RVM_VM_RUNNING);
    }
    
    /* Set the corresponding interrupt bit */
    _RVM_Set_Int_Flag(Virt, Int_Num);
 80114d0:	2100      	movs	r1, #0
 80114d2:	4620      	mov	r0, r4
 80114d4:	f7ff f962 	bl	801079c <_RVM_Set_Int_Flag>
    
    /* Send interrupt to it, if its interrupts are enabled */
    if((Virt->Sched.State&RVM_VM_INTENA)!=0)
 80114d8:	6b63      	ldr	r3, [r4, #52]	; 0x34
 80114da:	03db      	lsls	r3, r3, #15
 80114dc:	d502      	bpl.n	80114e4 <RVM_Timer_Daemon+0xa8>
        RVM_Sig_Snd(Virt->Cap.Int_Sig);
 80114de:	6aa0      	ldr	r0, [r4, #40]	; 0x28
 80114e0:	f001 fd02 	bl	8012ee8 <RVM_Sig_Snd>
        */
        Slot=&(RVM_Wheel[RVM_Tick%RVM_WHEEL_SIZE]);
        
        Trav=Slot->Next;
        /* See if we need to process the timer wheel to deliver timer interrupts to virtual machines */
        while(Trav!=Slot)
 80114e4:	45a8      	cmp	r8, r5
 80114e6:	d008      	beq.n	80114fa <RVM_Timer_Daemon+0xbe>
        {
            Virt=RVM_DLY2VM(Trav);
 80114e8:	f1a5 0408 	sub.w	r4, r5, #8
            Trav=Trav->Next;
            /* If the value is more than this, then it means that the time have
             * already passed and we have to process this */
            if((RVM_Tick-Virt->Sched.Timeout)>=(RVM_ALLBITS>>1))
 80114ec:	683b      	ldr	r3, [r7, #0]
 80114ee:	6be2      	ldr	r2, [r4, #60]	; 0x3c
        Trav=Slot->Next;
        /* See if we need to process the timer wheel to deliver timer interrupts to virtual machines */
        while(Trav!=Slot)
        {
            Virt=RVM_DLY2VM(Trav);
            Trav=Trav->Next;
 80114f0:	686d      	ldr	r5, [r5, #4]
            /* If the value is more than this, then it means that the time have
             * already passed and we have to process this */
            if((RVM_Tick-Virt->Sched.Timeout)>=(RVM_ALLBITS>>1))
 80114f2:	1a9b      	subs	r3, r3, r2
 80114f4:	4a29      	ldr	r2, [pc, #164]	; (801159c <RVM_Timer_Daemon+0x160>)
 80114f6:	4293      	cmp	r3, r2
 80114f8:	d9c3      	bls.n	8011482 <RVM_Timer_Daemon+0x46>
            /* Send number 0 interrupt to it */
            RVM_Int_Send(Virt, 0);
        }
        
        /* If there is at least one virtual machine working, check scheduler time expiration */
        if(RVM_Cur_Virt!=0)
 80114fa:	6833      	ldr	r3, [r6, #0]
 80114fc:	b123      	cbz	r3, 8011508 <RVM_Timer_Daemon+0xcc>
        {
            if(RVM_Cur_Virt->Sched.Slices_Left==1)   
 80114fe:	6b9a      	ldr	r2, [r3, #56]	; 0x38
 8011500:	2a01      	cmp	r2, #1
 8011502:	d033      	beq.n	801156c <RVM_Timer_Daemon+0x130>
                RVM_List_Ins(&(RVM_Cur_Virt->Head),
                             RVM_Run[RVM_Cur_Virt->Image->Prio].Prev,
                             &(RVM_Run[RVM_Cur_Virt->Image->Prio]));
            }
            else
                RVM_Cur_Virt->Sched.Slices_Left--;
 8011504:	3a01      	subs	r2, #1
 8011506:	639a      	str	r2, [r3, #56]	; 0x38
        }
        
        /* There must at least be a virtual machine that is active */
        Virt=_RVM_Get_High_Rdy();
 8011508:	f7ff f876 	bl	80105f8 <_RVM_Get_High_Rdy>
 801150c:	4604      	mov	r4, r0
        _RVM_Virt_Switch(RVM_Cur_Virt, Virt);
 801150e:	4601      	mov	r1, r0
 8011510:	6830      	ldr	r0, [r6, #0]
 8011512:	f7ff f881 	bl	8010618 <_RVM_Virt_Switch>
        RVM_Cur_Virt=Virt;
 8011516:	6034      	str	r4, [r6, #0]
    }
 8011518:	e79c      	b.n	8011454 <RVM_Timer_Daemon+0x18>
Output      : None.
Return      : None.
******************************************************************************/
void RVM_Int_Send(struct RVM_Virt* Virt, rvm_ptr_t Int_Num)
{
    RVM_ASSERT(Int_Num<Virt->Image->Int_Num);
 801151a:	4821      	ldr	r0, [pc, #132]	; (80115a0 <RVM_Timer_Daemon+0x164>)
 801151c:	f001 fc28 	bl	8012d70 <RVM_Print_String>
 8011520:	4820      	ldr	r0, [pc, #128]	; (80115a4 <RVM_Timer_Daemon+0x168>)
 8011522:	f001 fc25 	bl	8012d70 <RVM_Print_String>
 8011526:	4820      	ldr	r0, [pc, #128]	; (80115a8 <RVM_Timer_Daemon+0x16c>)
 8011528:	f001 fc22 	bl	8012d70 <RVM_Print_String>
 801152c:	f240 200f 	movw	r0, #527	; 0x20f
 8011530:	f001 fb8c 	bl	8012c4c <RVM_Print_Int>
 8011534:	481d      	ldr	r0, [pc, #116]	; (80115ac <RVM_Timer_Daemon+0x170>)
 8011536:	f001 fc1b 	bl	8012d70 <RVM_Print_String>
 801153a:	481d      	ldr	r0, [pc, #116]	; (80115b0 <RVM_Timer_Daemon+0x174>)
 801153c:	f001 fc18 	bl	8012d70 <RVM_Print_String>
 8011540:	481c      	ldr	r0, [pc, #112]	; (80115b4 <RVM_Timer_Daemon+0x178>)
 8011542:	f001 fc15 	bl	8012d70 <RVM_Print_String>
 8011546:	481c      	ldr	r0, [pc, #112]	; (80115b8 <RVM_Timer_Daemon+0x17c>)
 8011548:	f001 fc12 	bl	8012d70 <RVM_Print_String>
 801154c:	4817      	ldr	r0, [pc, #92]	; (80115ac <RVM_Timer_Daemon+0x170>)
 801154e:	f001 fc0f 	bl	8012d70 <RVM_Print_String>
 8011552:	e7fe      	b.n	8011552 <RVM_Timer_Daemon+0x116>
    
    if(RVM_VM_STATE(Virt->Sched.State)==RVM_VM_WAITEVT)
    {
        RVM_List_Del(Virt->Head.Prev,Virt->Head.Next);
 8011554:	e894 0003 	ldmia.w	r4, {r0, r1}
 8011558:	f001 fb6e 	bl	8012c38 <RVM_List_Del>
        _RVM_Set_Rdy(Virt);
 801155c:	4620      	mov	r0, r4
 801155e:	f7ff f82d 	bl	80105bc <_RVM_Set_Rdy>
        RVM_VM_STATE_SET(Virt->Sched.State,RVM_VM_RUNNING);
 8011562:	6b63      	ldr	r3, [r4, #52]	; 0x34
 8011564:	f023 03ff 	bic.w	r3, r3, #255	; 0xff
 8011568:	6363      	str	r3, [r4, #52]	; 0x34
 801156a:	e7b1      	b.n	80114d0 <RVM_Timer_Daemon+0x94>
        /* If there is at least one virtual machine working, check scheduler time expiration */
        if(RVM_Cur_Virt!=0)
        {
            if(RVM_Cur_Virt->Sched.Slices_Left==1)   
            {
                RVM_Cur_Virt->Sched.Slices_Left=RVM_Cur_Virt->Image->Slices;
 801156c:	691a      	ldr	r2, [r3, #16]
                /* Place it at the end of the run queue */
                RVM_List_Del(RVM_Cur_Virt->Head.Prev,RVM_Cur_Virt->Head.Next);
 801156e:	6859      	ldr	r1, [r3, #4]
        /* If there is at least one virtual machine working, check scheduler time expiration */
        if(RVM_Cur_Virt!=0)
        {
            if(RVM_Cur_Virt->Sched.Slices_Left==1)   
            {
                RVM_Cur_Virt->Sched.Slices_Left=RVM_Cur_Virt->Image->Slices;
 8011570:	6b92      	ldr	r2, [r2, #56]	; 0x38
                /* Place it at the end of the run queue */
                RVM_List_Del(RVM_Cur_Virt->Head.Prev,RVM_Cur_Virt->Head.Next);
 8011572:	6818      	ldr	r0, [r3, #0]
        /* If there is at least one virtual machine working, check scheduler time expiration */
        if(RVM_Cur_Virt!=0)
        {
            if(RVM_Cur_Virt->Sched.Slices_Left==1)   
            {
                RVM_Cur_Virt->Sched.Slices_Left=RVM_Cur_Virt->Image->Slices;
 8011574:	639a      	str	r2, [r3, #56]	; 0x38
                /* Place it at the end of the run queue */
                RVM_List_Del(RVM_Cur_Virt->Head.Prev,RVM_Cur_Virt->Head.Next);
 8011576:	f001 fb5f 	bl	8012c38 <RVM_List_Del>
                RVM_List_Ins(&(RVM_Cur_Virt->Head),
 801157a:	f8da 0000 	ldr.w	r0, [sl]
                             RVM_Run[RVM_Cur_Virt->Image->Prio].Prev,
 801157e:	6903      	ldr	r3, [r0, #16]
 8011580:	6b5b      	ldr	r3, [r3, #52]	; 0x34
            if(RVM_Cur_Virt->Sched.Slices_Left==1)   
            {
                RVM_Cur_Virt->Sched.Slices_Left=RVM_Cur_Virt->Image->Slices;
                /* Place it at the end of the run queue */
                RVM_List_Del(RVM_Cur_Virt->Head.Prev,RVM_Cur_Virt->Head.Next);
                RVM_List_Ins(&(RVM_Cur_Virt->Head),
 8011582:	eb0b 02c3 	add.w	r2, fp, r3, lsl #3
 8011586:	f85b 1033 	ldr.w	r1, [fp, r3, lsl #3]
 801158a:	f001 fb59 	bl	8012c40 <RVM_List_Ins>
 801158e:	e7bb      	b.n	8011508 <RVM_Timer_Daemon+0xcc>
 8011590:	2001ea60 	.word	0x2001ea60
 8011594:	08013178 	.word	0x08013178
 8011598:	2001e844 	.word	0x2001e844
 801159c:	7ffffffe 	.word	0x7ffffffe
 80115a0:	08012f08 	.word	0x08012f08
 80115a4:	08013090 	.word	0x08013090
 80115a8:	08012fa4 	.word	0x08012fa4
 80115ac:	080134b0 	.word	0x080134b0
 80115b0:	08012fac 	.word	0x08012fac
 80115b4:	08012fb8 	.word	0x08012fb8
 80115b8:	080130e4 	.word	0x080130e4
 80115bc:	2001e848 	.word	0x2001e848
 80115c0:	2001e948 	.word	0x2001e948

080115c4 <_RVM_Wheel_Ins>:
{
    struct RVM_List* Slot;
    struct RVM_List* Trav_Ptr;
    struct RVM_Virt* Trav_Virt;
    
    Slot=&(RVM_Wheel[(RVM_Tick+Period)%RVM_WHEEL_SIZE]);
 80115c4:	4a0c      	ldr	r2, [pc, #48]	; (80115f8 <_RVM_Wheel_Ins+0x34>)
 80115c6:	4b0d      	ldr	r3, [pc, #52]	; (80115fc <_RVM_Wheel_Ins+0x38>)
              rvm_ptr_t Period - The period of the timer interrupt.
Output      : None.
Return      : None.
******************************************************************************/
void _RVM_Wheel_Ins(struct RVM_Virt* Virt, rvm_ptr_t Period)
{
 80115c8:	b470      	push	{r4, r5, r6}
    struct RVM_List* Slot;
    struct RVM_List* Trav_Ptr;
    struct RVM_Virt* Trav_Virt;
    
    Slot=&(RVM_Wheel[(RVM_Tick+Period)%RVM_WHEEL_SIZE]);
 80115ca:	6815      	ldr	r5, [r2, #0]
 80115cc:	186e      	adds	r6, r5, r1
 80115ce:	f006 041f 	and.w	r4, r6, #31
 80115d2:	eb03 04c4 	add.w	r4, r3, r4, lsl #3
    
    Trav_Ptr=Slot->Next;
 80115d6:	6862      	ldr	r2, [r4, #4]
    while(Trav_Ptr!=Slot)
 80115d8:	4294      	cmp	r4, r2
 80115da:	d103      	bne.n	80115e4 <_RVM_Wheel_Ins+0x20>
 80115dc:	e006      	b.n	80115ec <_RVM_Wheel_Ins+0x28>
    {
        Trav_Virt=RVM_DLY2VM(Trav_Ptr);
        if((Trav_Virt->Sched.Timeout-RVM_Tick)>Period)
            break;
        
        Trav_Ptr=Trav_Ptr->Next;
 80115de:	6852      	ldr	r2, [r2, #4]
    struct RVM_Virt* Trav_Virt;
    
    Slot=&(RVM_Wheel[(RVM_Tick+Period)%RVM_WHEEL_SIZE]);
    
    Trav_Ptr=Slot->Next;
    while(Trav_Ptr!=Slot)
 80115e0:	4294      	cmp	r4, r2
 80115e2:	d003      	beq.n	80115ec <_RVM_Wheel_Ins+0x28>
    {
        Trav_Virt=RVM_DLY2VM(Trav_Ptr);
        if((Trav_Virt->Sched.Timeout-RVM_Tick)>Period)
 80115e4:	6b53      	ldr	r3, [r2, #52]	; 0x34
 80115e6:	1b5b      	subs	r3, r3, r5
 80115e8:	4299      	cmp	r1, r3
 80115ea:	d2f8      	bcs.n	80115de <_RVM_Wheel_Ins+0x1a>
        
        Trav_Ptr=Trav_Ptr->Next;
    }

    /* Insert this into the list */
    Virt->Sched.Timeout=RVM_Tick+Period;
 80115ec:	63c6      	str	r6, [r0, #60]	; 0x3c
    RVM_List_Ins(&(Virt->Delay),Trav_Ptr->Prev,Trav_Ptr);
 80115ee:	3008      	adds	r0, #8
 80115f0:	6811      	ldr	r1, [r2, #0]
}
 80115f2:	bc70      	pop	{r4, r5, r6}
        Trav_Ptr=Trav_Ptr->Next;
    }

    /* Insert this into the list */
    Virt->Sched.Timeout=RVM_Tick+Period;
    RVM_List_Ins(&(Virt->Delay),Trav_Ptr->Prev,Trav_Ptr);
 80115f4:	f001 bb24 	b.w	8012c40 <RVM_List_Ins>
 80115f8:	2001e844 	.word	0x2001e844
 80115fc:	2001e848 	.word	0x2001e848

08011600 <main>:
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(void)
{
 8011600:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    /* The kernel heap allocation bump pointer */
    rvm_ptr_t Kmem_Bump;

    RVM_LOG_S("\r\n\r\n-------------------------------------------------------------------------------\r\n");
 8011604:	48b7      	ldr	r0, [pc, #732]	; (80118e4 <main+0x2e4>)
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(void)
{
 8011606:	b089      	sub	sp, #36	; 0x24
    /* The kernel heap allocation bump pointer */
    rvm_ptr_t Kmem_Bump;

    RVM_LOG_S("\r\n\r\n-------------------------------------------------------------------------------\r\n");
 8011608:	f001 fbb2 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                               Welcome to the\r\n");
 801160c:	48b6      	ldr	r0, [pc, #728]	; (80118e8 <main+0x2e8>)
 801160e:	f001 fbaf 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("\r\n");
 8011612:	48b6      	ldr	r0, [pc, #728]	; (80118ec <main+0x2ec>)
 8011614:	f001 fbac 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        ######    ###  ###  ########\r\n");
 8011618:	48b5      	ldr	r0, [pc, #724]	; (80118f0 <main+0x2f0>)
 801161a:	f001 fba9 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        #######   ###  ###  ########\r\n");
 801161e:	48b5      	ldr	r0, [pc, #724]	; (80118f4 <main+0x2f4>)
 8011620:	f001 fba6 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        ##    ##  ###  ###  ##\r\n");
 8011624:	48b4      	ldr	r0, [pc, #720]	; (80118f8 <main+0x2f8>)
 8011626:	f001 fba3 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        ##    ##  ###  ###  ##\r\n");
 801162a:	48b3      	ldr	r0, [pc, #716]	; (80118f8 <main+0x2f8>)
 801162c:	f001 fba0 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        ##    ##  ## ## ##  ##\r\n");
 8011630:	48b2      	ldr	r0, [pc, #712]	; (80118fc <main+0x2fc>)
 8011632:	f001 fb9d 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        #######   ## ## ##  #######\r\n");
 8011636:	48b2      	ldr	r0, [pc, #712]	; (8011900 <main+0x300>)
 8011638:	f001 fb9a 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        ######    ## ## ##  #######\r\n");
 801163c:	48b1      	ldr	r0, [pc, #708]	; (8011904 <main+0x304>)
 801163e:	f001 fb97 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        ##   ##   ## ## ##  ##\r\n");
 8011642:	48b1      	ldr	r0, [pc, #708]	; (8011908 <main+0x308>)
 8011644:	f001 fb94 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        ##   ##   ##    ##  ##\r\n");
 8011648:	48b0      	ldr	r0, [pc, #704]	; (801190c <main+0x30c>)
 801164a:	f001 fb91 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        ##    ##  ##    ##  ##\r\n");
 801164e:	48b0      	ldr	r0, [pc, #704]	; (8011910 <main+0x310>)
 8011650:	f001 fb8e 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        ##    ##  ##    ##  ########\r\n");
 8011654:	48af      	ldr	r0, [pc, #700]	; (8011914 <main+0x314>)
 8011656:	f001 fb8b 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                        ##    ### ##    ##  ########\r\n");
 801165a:	48af      	ldr	r0, [pc, #700]	; (8011918 <main+0x318>)
 801165c:	f001 fb88 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("\r\n");
 8011660:	48a2      	ldr	r0, [pc, #648]	; (80118ec <main+0x2ec>)
 8011662:	f001 fb85 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("                    Microcontroller User-level Platform!\r\n");
 8011666:	48ad      	ldr	r0, [pc, #692]	; (801191c <main+0x31c>)
 8011668:	f001 fb82 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("-------------------------------------------------------------------------------\r\n");
 801166c:	48ac      	ldr	r0, [pc, #688]	; (8011920 <main+0x320>)
 801166e:	f001 fb7f 	bl	8012d70 <RVM_Print_String>
    /* Check the priority settings - are they all correct? */
    RVM_ASSERT(RVM_GUARD_PRIO>RVM_VMD_PRIO+2);
    RVM_ASSERT(RVM_VMD_PRIO>1);
    
    /* Raise our own priority to the top of the system */
    RVM_ASSERT(RVM_Thd_Sched_Prio(RVM_BOOT_INIT_THD, RVM_MAX_PREEMPT_PRIO-1)==0);
 8011672:	211f      	movs	r1, #31
 8011674:	2003      	movs	r0, #3
 8011676:	f001 fc23 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 801167a:	b1e0      	cbz	r0, 80116b6 <main+0xb6>
 801167c:	48a9      	ldr	r0, [pc, #676]	; (8011924 <main+0x324>)
 801167e:	f001 fb77 	bl	8012d70 <RVM_Print_String>
 8011682:	48a9      	ldr	r0, [pc, #676]	; (8011928 <main+0x328>)
 8011684:	f001 fb74 	bl	8012d70 <RVM_Print_String>
 8011688:	48a8      	ldr	r0, [pc, #672]	; (801192c <main+0x32c>)
 801168a:	f001 fb71 	bl	8012d70 <RVM_Print_String>
 801168e:	f240 303d 	movw	r0, #829	; 0x33d
 8011692:	f001 fadb 	bl	8012c4c <RVM_Print_Int>
 8011696:	4895      	ldr	r0, [pc, #596]	; (80118ec <main+0x2ec>)
 8011698:	f001 fb6a 	bl	8012d70 <RVM_Print_String>
 801169c:	48a4      	ldr	r0, [pc, #656]	; (8011930 <main+0x330>)
 801169e:	f001 fb67 	bl	8012d70 <RVM_Print_String>
 80116a2:	48a4      	ldr	r0, [pc, #656]	; (8011934 <main+0x334>)
 80116a4:	f001 fb64 	bl	8012d70 <RVM_Print_String>
 80116a8:	48a3      	ldr	r0, [pc, #652]	; (8011938 <main+0x338>)
 80116aa:	f001 fb61 	bl	8012d70 <RVM_Print_String>
 80116ae:	488f      	ldr	r0, [pc, #572]	; (80118ec <main+0x2ec>)
 80116b0:	f001 fb5e 	bl	8012d70 <RVM_Print_String>
 80116b4:	e7fe      	b.n	80116b4 <main+0xb4>
 80116b6:	4605      	mov	r5, r0
    RVM_LOG_S("Init:Preparation - priority raised.\r\n");
 80116b8:	48a0      	ldr	r0, [pc, #640]	; (801193c <main+0x33c>)
 80116ba:	f001 fb59 	bl	8012d70 <RVM_Print_String>
    
    RVM_LOG_SUS("Init:Start creating kernel objects @ kernel virtual address base 0x",RVM_KMEM_VA_START+RVM_KMEM_BOOT_FRONTIER,".\r\n");
 80116be:	48a0      	ldr	r0, [pc, #640]	; (8011940 <main+0x340>)
 80116c0:	f001 fb56 	bl	8012d70 <RVM_Print_String>
 80116c4:	489f      	ldr	r0, [pc, #636]	; (8011944 <main+0x344>)
 80116c6:	f001 fb27 	bl	8012d18 <RVM_Print_Uint>
 80116ca:	489f      	ldr	r0, [pc, #636]	; (8011948 <main+0x348>)
 80116cc:	f001 fb50 	bl	8012d70 <RVM_Print_String>
    Kmem_Bump=RVM_KMEM_BOOT_FRONTIER;
 80116d0:	f44f 6380 	mov.w	r3, #1024	; 0x400
Return      : rvm_ptr_t - The bump pointer's new location.
******************************************************************************/
void RVM_Daemon_Init(rvm_ptr_t* Kmem_Bump)
{
    rvm_cnt_t Count;
    RVM_LOG_S("-------------------------------------------------------------------------------\r\n");
 80116d4:	4892      	ldr	r0, [pc, #584]	; (8011920 <main+0x320>)
    /* Raise our own priority to the top of the system */
    RVM_ASSERT(RVM_Thd_Sched_Prio(RVM_BOOT_INIT_THD, RVM_MAX_PREEMPT_PRIO-1)==0);
    RVM_LOG_S("Init:Preparation - priority raised.\r\n");
    
    RVM_LOG_SUS("Init:Start creating kernel objects @ kernel virtual address base 0x",RVM_KMEM_VA_START+RVM_KMEM_BOOT_FRONTIER,".\r\n");
    Kmem_Bump=RVM_KMEM_BOOT_FRONTIER;
 80116d6:	9306      	str	r3, [sp, #24]
Return      : rvm_ptr_t - The bump pointer's new location.
******************************************************************************/
void RVM_Daemon_Init(rvm_ptr_t* Kmem_Bump)
{
    rvm_cnt_t Count;
    RVM_LOG_S("-------------------------------------------------------------------------------\r\n");
 80116d8:	f001 fb4a 	bl	8012d70 <RVM_Print_String>
    RVM_Tick=0;
    RVM_VM_Num=0;
 80116dc:	4a9b      	ldr	r2, [pc, #620]	; (801194c <main+0x34c>)
    /* We initialize this to 1 because the init thread already have TID 0 */
    RVM_TID_Inc=1;
 80116de:	2301      	movs	r3, #1
******************************************************************************/
void RVM_Daemon_Init(rvm_ptr_t* Kmem_Bump)
{
    rvm_cnt_t Count;
    RVM_LOG_S("-------------------------------------------------------------------------------\r\n");
    RVM_Tick=0;
 80116e0:	499b      	ldr	r1, [pc, #620]	; (8011950 <main+0x350>)
    RVM_VM_Num=0;
 80116e2:	6015      	str	r5, [r2, #0]
    /* We initialize this to 1 because the init thread already have TID 0 */
    RVM_TID_Inc=1;
 80116e4:	4a9b      	ldr	r2, [pc, #620]	; (8011954 <main+0x354>)
    
    RVM_List_Crt(&RVM_Wait);
 80116e6:	489c      	ldr	r0, [pc, #624]	; (8011958 <main+0x358>)
******************************************************************************/
void RVM_Daemon_Init(rvm_ptr_t* Kmem_Bump)
{
    rvm_cnt_t Count;
    RVM_LOG_S("-------------------------------------------------------------------------------\r\n");
    RVM_Tick=0;
 80116e8:	600d      	str	r5, [r1, #0]
    RVM_VM_Num=0;
    /* We initialize this to 1 because the init thread already have TID 0 */
    RVM_TID_Inc=1;
 80116ea:	6013      	str	r3, [r2, #0]
    
    RVM_List_Crt(&RVM_Wait);
 80116ec:	f001 faa0 	bl	8012c30 <RVM_List_Crt>
    RVM_List_Crt(&RVM_Free);
 80116f0:	489a      	ldr	r0, [pc, #616]	; (801195c <main+0x35c>)
 80116f2:	f001 fa9d 	bl	8012c30 <RVM_List_Crt>
 80116f6:	4c9a      	ldr	r4, [pc, #616]	; (8011960 <main+0x360>)
    RVM_List_Crt(&RVM_Int_Free);
 80116f8:	489a      	ldr	r0, [pc, #616]	; (8011964 <main+0x364>)
 80116fa:	f001 fa99 	bl	8012c30 <RVM_List_Crt>
    RVM_List_Crt(&RVM_Evt_Free);
 80116fe:	489a      	ldr	r0, [pc, #616]	; (8011968 <main+0x368>)
 8011700:	f504 6598 	add.w	r5, r4, #1216	; 0x4c0
 8011704:	f001 fa94 	bl	8012c30 <RVM_List_Crt>
    
    /* VM init */
    for(Count=0;Count<RVM_MAX_VM_NUM;Count++)
        RVM_List_Ins(&(RVM_Virt_DB[Count].Head),RVM_Free.Prev,&RVM_Free);
 8011708:	4a94      	ldr	r2, [pc, #592]	; (801195c <main+0x35c>)
 801170a:	4620      	mov	r0, r4
 801170c:	344c      	adds	r4, #76	; 0x4c
 801170e:	6811      	ldr	r1, [r2, #0]
 8011710:	f001 fa96 	bl	8012c40 <RVM_List_Ins>
    RVM_List_Crt(&RVM_Free);
    RVM_List_Crt(&RVM_Int_Free);
    RVM_List_Crt(&RVM_Evt_Free);
    
    /* VM init */
    for(Count=0;Count<RVM_MAX_VM_NUM;Count++)
 8011714:	42a5      	cmp	r5, r4
 8011716:	d1f7      	bne.n	8011708 <main+0x108>
 8011718:	4c94      	ldr	r4, [pc, #592]	; (801196c <main+0x36c>)
 801171a:	f504 755c 	add.w	r5, r4, #880	; 0x370
        RVM_List_Ins(&(RVM_Virt_DB[Count].Head),RVM_Free.Prev,&RVM_Free);
    /* Interrupts init */
    for(Count=0;Count<RVM_INT_VECT_NUM;Count++)
        RVM_List_Crt(&RVM_Int_Vect[Count]);
 801171e:	4620      	mov	r0, r4
 8011720:	3408      	adds	r4, #8
 8011722:	f001 fa85 	bl	8012c30 <RVM_List_Crt>
    
    /* VM init */
    for(Count=0;Count<RVM_MAX_VM_NUM;Count++)
        RVM_List_Ins(&(RVM_Virt_DB[Count].Head),RVM_Free.Prev,&RVM_Free);
    /* Interrupts init */
    for(Count=0;Count<RVM_INT_VECT_NUM;Count++)
 8011726:	42ac      	cmp	r4, r5
 8011728:	d1f9      	bne.n	801171e <main+0x11e>
 801172a:	4c91      	ldr	r4, [pc, #580]	; (8011970 <main+0x370>)
        RVM_List_Crt(&RVM_Int_Vect[Count]);
    for(Count=0;Count<RVM_INT_MAP_NUM;Count++)
    {
        RVM_Evt_DB[Count].State=RVM_INT_FREE;
 801172c:	f04f 0900 	mov.w	r9, #0
 8011730:	4e90      	ldr	r6, [pc, #576]	; (8011974 <main+0x374>)
 8011732:	f504 47c0 	add.w	r7, r4, #24576	; 0x6000
    
    /* VM init */
    for(Count=0;Count<RVM_MAX_VM_NUM;Count++)
        RVM_List_Ins(&(RVM_Virt_DB[Count].Head),RVM_Free.Prev,&RVM_Free);
    /* Interrupts init */
    for(Count=0;Count<RVM_INT_VECT_NUM;Count++)
 8011736:	4625      	mov	r5, r4
 8011738:	f8df 8228 	ldr.w	r8, [pc, #552]	; 8011964 <main+0x364>
        RVM_List_Crt(&RVM_Int_Vect[Count]);
    for(Count=0;Count<RVM_INT_MAP_NUM;Count++)
    {
        RVM_Evt_DB[Count].State=RVM_INT_FREE;
 801173c:	f8c5 9008 	str.w	r9, [r5, #8]
 8011740:	3518      	adds	r5, #24
        RVM_List_Ins(&(RVM_Int_DB[Count].Head),RVM_Int_Free.Prev,&RVM_Int_Free);
 8011742:	4630      	mov	r0, r6
 8011744:	4a87      	ldr	r2, [pc, #540]	; (8011964 <main+0x364>)
 8011746:	f8d8 1000 	ldr.w	r1, [r8]
 801174a:	3614      	adds	r6, #20
 801174c:	f001 fa78 	bl	8012c40 <RVM_List_Ins>
    for(Count=0;Count<RVM_MAX_VM_NUM;Count++)
        RVM_List_Ins(&(RVM_Virt_DB[Count].Head),RVM_Free.Prev,&RVM_Free);
    /* Interrupts init */
    for(Count=0;Count<RVM_INT_VECT_NUM;Count++)
        RVM_List_Crt(&RVM_Int_Vect[Count]);
    for(Count=0;Count<RVM_INT_MAP_NUM;Count++)
 8011750:	42af      	cmp	r7, r5
 8011752:	d1f3      	bne.n	801173c <main+0x13c>
 8011754:	4e84      	ldr	r6, [pc, #528]	; (8011968 <main+0x368>)
        RVM_List_Ins(&(RVM_Int_DB[Count].Head),RVM_Int_Free.Prev,&RVM_Int_Free);
    }
    /* Event init */
    for(Count=0;Count<RVM_EVT_MAP_NUM;Count++)
    {
        RVM_Evt_DB[Count].State=RVM_EVT_FREE;
 8011756:	2500      	movs	r5, #0
 8011758:	60a5      	str	r5, [r4, #8]
        RVM_List_Ins(&(RVM_Evt_DB[Count].Head),RVM_Evt_Free.Prev,&RVM_Evt_Free);
 801175a:	4620      	mov	r0, r4
 801175c:	3418      	adds	r4, #24
 801175e:	4a82      	ldr	r2, [pc, #520]	; (8011968 <main+0x368>)
 8011760:	6831      	ldr	r1, [r6, #0]
 8011762:	f001 fa6d 	bl	8012c40 <RVM_List_Ins>
    {
        RVM_Evt_DB[Count].State=RVM_INT_FREE;
        RVM_List_Ins(&(RVM_Int_DB[Count].Head),RVM_Int_Free.Prev,&RVM_Int_Free);
    }
    /* Event init */
    for(Count=0;Count<RVM_EVT_MAP_NUM;Count++)
 8011766:	42a7      	cmp	r7, r4
 8011768:	d1f6      	bne.n	8011758 <main+0x158>
 801176a:	4c83      	ldr	r4, [pc, #524]	; (8011978 <main+0x378>)
 801176c:	f504 7580 	add.w	r5, r4, #256	; 0x100
        RVM_Evt_DB[Count].State=RVM_EVT_FREE;
        RVM_List_Ins(&(RVM_Evt_DB[Count].Head),RVM_Evt_Free.Prev,&RVM_Evt_Free);
    }
    /* Run list init */
    for(Count=0;Count<RVM_MAX_PREEMPT_VPRIO;Count++)
        RVM_List_Crt(&RVM_Run[Count]);
 8011770:	4620      	mov	r0, r4
 8011772:	3408      	adds	r4, #8
 8011774:	f001 fa5c 	bl	8012c30 <RVM_List_Crt>
    {
        RVM_Evt_DB[Count].State=RVM_EVT_FREE;
        RVM_List_Ins(&(RVM_Evt_DB[Count].Head),RVM_Evt_Free.Prev,&RVM_Evt_Free);
    }
    /* Run list init */
    for(Count=0;Count<RVM_MAX_PREEMPT_VPRIO;Count++)
 8011778:	42ac      	cmp	r4, r5
 801177a:	d1f9      	bne.n	8011770 <main+0x170>
 801177c:	4c7f      	ldr	r4, [pc, #508]	; (801197c <main+0x37c>)
 801177e:	f504 7580 	add.w	r5, r4, #256	; 0x100
        RVM_List_Crt(&RVM_Run[Count]);
    /* Timer wheel init */
    for(Count=0;Count<RVM_WHEEL_SIZE;Count++)
        RVM_List_Crt(&(RVM_Wheel[Count]));
 8011782:	4620      	mov	r0, r4
 8011784:	3408      	adds	r4, #8
 8011786:	f001 fa53 	bl	8012c30 <RVM_List_Crt>
    }
    /* Run list init */
    for(Count=0;Count<RVM_MAX_PREEMPT_VPRIO;Count++)
        RVM_List_Crt(&RVM_Run[Count]);
    /* Timer wheel init */
    for(Count=0;Count<RVM_WHEEL_SIZE;Count++)
 801178a:	42ac      	cmp	r4, r5
 801178c:	d1f9      	bne.n	8011782 <main+0x182>
        RVM_List_Crt(&(RVM_Wheel[Count]));
    
    RVM_LOG_S("Init:Virtual machine database initialization complete.\r\n");
 801178e:	487c      	ldr	r0, [pc, #496]	; (8011980 <main+0x380>)
 8011790:	f001 faee 	bl	8012d70 <RVM_Print_String>
    
    /* Guard daemon initialization - highest priority as always */    
    RVM_ASSERT(RVM_Sig_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_SIG, *Kmem_Bump)==0);
 8011794:	9b06      	ldr	r3, [sp, #24]
 8011796:	220c      	movs	r2, #12
 8011798:	2105      	movs	r1, #5
 801179a:	2000      	movs	r0, #0
 801179c:	f001 fba0 	bl	8012ee0 <RVM_Sig_Crt>
 80117a0:	4605      	mov	r5, r0
 80117a2:	b1e0      	cbz	r0, 80117de <main+0x1de>
 80117a4:	485f      	ldr	r0, [pc, #380]	; (8011924 <main+0x324>)
 80117a6:	f001 fae3 	bl	8012d70 <RVM_Print_String>
 80117aa:	485f      	ldr	r0, [pc, #380]	; (8011928 <main+0x328>)
 80117ac:	f001 fae0 	bl	8012d70 <RVM_Print_String>
 80117b0:	485e      	ldr	r0, [pc, #376]	; (801192c <main+0x32c>)
 80117b2:	f001 fadd 	bl	8012d70 <RVM_Print_String>
 80117b6:	f44f 70ab 	mov.w	r0, #342	; 0x156
 80117ba:	f001 fa47 	bl	8012c4c <RVM_Print_Int>
 80117be:	484b      	ldr	r0, [pc, #300]	; (80118ec <main+0x2ec>)
 80117c0:	f001 fad6 	bl	8012d70 <RVM_Print_String>
 80117c4:	485a      	ldr	r0, [pc, #360]	; (8011930 <main+0x330>)
 80117c6:	f001 fad3 	bl	8012d70 <RVM_Print_String>
 80117ca:	485a      	ldr	r0, [pc, #360]	; (8011934 <main+0x334>)
 80117cc:	f001 fad0 	bl	8012d70 <RVM_Print_String>
 80117d0:	4859      	ldr	r0, [pc, #356]	; (8011938 <main+0x338>)
 80117d2:	f001 facd 	bl	8012d70 <RVM_Print_String>
 80117d6:	4845      	ldr	r0, [pc, #276]	; (80118ec <main+0x2ec>)
 80117d8:	f001 faca 	bl	8012d70 <RVM_Print_String>
 80117dc:	e7fe      	b.n	80117dc <main+0x1dc>
    RVM_LOG_SISUS("Init:Created GuardD fault endpoint CID ",RVM_VMM_GUARD_SIG," @ address 0x",*Kmem_Bump,".\r\n");
 80117de:	4869      	ldr	r0, [pc, #420]	; (8011984 <main+0x384>)
    *Kmem_Bump+=RVM_SIG_SIZE;
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_THD,
 80117e0:	261f      	movs	r6, #31
    
    RVM_LOG_S("Init:Virtual machine database initialization complete.\r\n");
    
    /* Guard daemon initialization - highest priority as always */    
    RVM_ASSERT(RVM_Sig_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_SIG, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created GuardD fault endpoint CID ",RVM_VMM_GUARD_SIG," @ address 0x",*Kmem_Bump,".\r\n");
 80117e2:	f001 fac5 	bl	8012d70 <RVM_Print_String>
 80117e6:	200c      	movs	r0, #12
 80117e8:	f001 fa30 	bl	8012c4c <RVM_Print_Int>
 80117ec:	4866      	ldr	r0, [pc, #408]	; (8011988 <main+0x388>)
 80117ee:	f001 fabf 	bl	8012d70 <RVM_Print_String>
 80117f2:	9806      	ldr	r0, [sp, #24]
 80117f4:	f001 fa90 	bl	8012d18 <RVM_Print_Uint>
 80117f8:	4853      	ldr	r0, [pc, #332]	; (8011948 <main+0x348>)
 80117fa:	f001 fab9 	bl	8012d70 <RVM_Print_String>
    *Kmem_Bump+=RVM_SIG_SIZE;
 80117fe:	9c06      	ldr	r4, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_THD,
 8011800:	9600      	str	r6, [sp, #0]
 8011802:	2302      	movs	r3, #2
    RVM_LOG_S("Init:Virtual machine database initialization complete.\r\n");
    
    /* Guard daemon initialization - highest priority as always */    
    RVM_ASSERT(RVM_Sig_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_SIG, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created GuardD fault endpoint CID ",RVM_VMM_GUARD_SIG," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_SIG_SIZE;
 8011804:	3410      	adds	r4, #16
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_THD,
 8011806:	220b      	movs	r2, #11
 8011808:	2105      	movs	r1, #5
 801180a:	4628      	mov	r0, r5
 801180c:	9401      	str	r4, [sp, #4]
    RVM_LOG_S("Init:Virtual machine database initialization complete.\r\n");
    
    /* Guard daemon initialization - highest priority as always */    
    RVM_ASSERT(RVM_Sig_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_SIG, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created GuardD fault endpoint CID ",RVM_VMM_GUARD_SIG," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_SIG_SIZE;
 801180e:	9406      	str	r4, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_THD,
 8011810:	f001 fb28 	bl	8012e64 <RVM_Thd_Crt>
 8011814:	2800      	cmp	r0, #0
 8011816:	f2c0 8325 	blt.w	8011e64 <main+0x864>
                           RVM_BOOT_INIT_PROC, RVM_GUARD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created Guard daemon CID ",RVM_VMM_GUARD_THD," @ address 0x",*Kmem_Bump,".\r\n");
 801181a:	485c      	ldr	r0, [pc, #368]	; (801198c <main+0x38c>)
 801181c:	f001 faa8 	bl	8012d70 <RVM_Print_String>
 8011820:	200b      	movs	r0, #11
 8011822:	f001 fa13 	bl	8012c4c <RVM_Print_Int>
 8011826:	4858      	ldr	r0, [pc, #352]	; (8011988 <main+0x388>)
 8011828:	f001 faa2 	bl	8012d70 <RVM_Print_String>
 801182c:	9806      	ldr	r0, [sp, #24]
 801182e:	f001 fa73 	bl	8012d18 <RVM_Print_Uint>
 8011832:	4845      	ldr	r0, [pc, #276]	; (8011948 <main+0x348>)
 8011834:	f001 fa9c 	bl	8012d70 <RVM_Print_String>
    *Kmem_Bump+=RVM_THD_SIZE;
 8011838:	9a06      	ldr	r2, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_GUARD_THD, RVM_BOOT_INIT_THD, RVM_VMM_GUARD_SIG, 0, RVM_MAX_PREEMPT_PRIO-1)==0);
 801183a:	9600      	str	r6, [sp, #0]
 801183c:	462b      	mov	r3, r5
    *Kmem_Bump+=RVM_SIG_SIZE;
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_THD,
                           RVM_BOOT_INIT_PROC, RVM_GUARD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created Guard daemon CID ",RVM_VMM_GUARD_THD," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_THD_SIZE;
 801183e:	f102 04c0 	add.w	r4, r2, #192	; 0xc0
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_GUARD_THD, RVM_BOOT_INIT_THD, RVM_VMM_GUARD_SIG, 0, RVM_MAX_PREEMPT_PRIO-1)==0);
 8011842:	2103      	movs	r1, #3
 8011844:	220c      	movs	r2, #12
 8011846:	200b      	movs	r0, #11
    *Kmem_Bump+=RVM_SIG_SIZE;
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_THD,
                           RVM_BOOT_INIT_PROC, RVM_GUARD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created Guard daemon CID ",RVM_VMM_GUARD_THD," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_THD_SIZE;
 8011848:	9406      	str	r4, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_GUARD_THD, RVM_BOOT_INIT_THD, RVM_VMM_GUARD_SIG, 0, RVM_MAX_PREEMPT_PRIO-1)==0);
 801184a:	f001 fb25 	bl	8012e98 <RVM_Thd_Sched_Bind>
 801184e:	4604      	mov	r4, r0
 8011850:	b1e0      	cbz	r0, 801188c <main+0x28c>
 8011852:	4834      	ldr	r0, [pc, #208]	; (8011924 <main+0x324>)
 8011854:	f001 fa8c 	bl	8012d70 <RVM_Print_String>
 8011858:	4833      	ldr	r0, [pc, #204]	; (8011928 <main+0x328>)
 801185a:	f001 fa89 	bl	8012d70 <RVM_Print_String>
 801185e:	4833      	ldr	r0, [pc, #204]	; (801192c <main+0x32c>)
 8011860:	f001 fa86 	bl	8012d70 <RVM_Print_String>
 8011864:	f240 105f 	movw	r0, #351	; 0x15f
 8011868:	f001 f9f0 	bl	8012c4c <RVM_Print_Int>
 801186c:	481f      	ldr	r0, [pc, #124]	; (80118ec <main+0x2ec>)
 801186e:	f001 fa7f 	bl	8012d70 <RVM_Print_String>
 8011872:	482f      	ldr	r0, [pc, #188]	; (8011930 <main+0x330>)
 8011874:	f001 fa7c 	bl	8012d70 <RVM_Print_String>
 8011878:	482e      	ldr	r0, [pc, #184]	; (8011934 <main+0x334>)
 801187a:	f001 fa79 	bl	8012d70 <RVM_Print_String>
 801187e:	482e      	ldr	r0, [pc, #184]	; (8011938 <main+0x338>)
 8011880:	f001 fa76 	bl	8012d70 <RVM_Print_String>
 8011884:	4819      	ldr	r0, [pc, #100]	; (80118ec <main+0x2ec>)
 8011886:	f001 fa73 	bl	8012d70 <RVM_Print_String>
 801188a:	e7fe      	b.n	801188a <main+0x28a>
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VMM_GUARD_THD, (rvm_ptr_t)RVM_Guard_Daemon, 
 801188c:	f44f 6100 	mov.w	r1, #2048	; 0x800
 8011890:	483f      	ldr	r0, [pc, #252]	; (8011990 <main+0x390>)
 8011892:	f7fe fc11 	bl	80100b8 <RVM_Stack_Init>
 8011896:	4623      	mov	r3, r4
 8011898:	4602      	mov	r2, r0
 801189a:	493e      	ldr	r1, [pc, #248]	; (8011994 <main+0x394>)
 801189c:	200b      	movs	r0, #11
 801189e:	f001 faef 	bl	8012e80 <RVM_Thd_Exec_Set>
 80118a2:	4604      	mov	r4, r0
 80118a4:	2800      	cmp	r0, #0
 80118a6:	d077      	beq.n	8011998 <main+0x398>
 80118a8:	481e      	ldr	r0, [pc, #120]	; (8011924 <main+0x324>)
 80118aa:	f001 fa61 	bl	8012d70 <RVM_Print_String>
 80118ae:	481e      	ldr	r0, [pc, #120]	; (8011928 <main+0x328>)
 80118b0:	f001 fa5e 	bl	8012d70 <RVM_Print_String>
 80118b4:	481d      	ldr	r0, [pc, #116]	; (801192c <main+0x32c>)
 80118b6:	f001 fa5b 	bl	8012d70 <RVM_Print_String>
 80118ba:	f240 1061 	movw	r0, #353	; 0x161
 80118be:	f001 f9c5 	bl	8012c4c <RVM_Print_Int>
 80118c2:	480a      	ldr	r0, [pc, #40]	; (80118ec <main+0x2ec>)
 80118c4:	f001 fa54 	bl	8012d70 <RVM_Print_String>
 80118c8:	4819      	ldr	r0, [pc, #100]	; (8011930 <main+0x330>)
 80118ca:	f001 fa51 	bl	8012d70 <RVM_Print_String>
 80118ce:	4819      	ldr	r0, [pc, #100]	; (8011934 <main+0x334>)
 80118d0:	f001 fa4e 	bl	8012d70 <RVM_Print_String>
 80118d4:	4818      	ldr	r0, [pc, #96]	; (8011938 <main+0x338>)
 80118d6:	f001 fa4b 	bl	8012d70 <RVM_Print_String>
 80118da:	4804      	ldr	r0, [pc, #16]	; (80118ec <main+0x2ec>)
 80118dc:	f001 fa48 	bl	8012d70 <RVM_Print_String>
 80118e0:	e7fe      	b.n	80118e0 <main+0x2e0>
 80118e2:	bf00      	nop
 80118e4:	0801319c 	.word	0x0801319c
 80118e8:	080131f4 	.word	0x080131f4
 80118ec:	080134b0 	.word	0x080134b0
 80118f0:	08013224 	.word	0x08013224
 80118f4:	0801325c 	.word	0x0801325c
 80118f8:	08013294 	.word	0x08013294
 80118fc:	080132c8 	.word	0x080132c8
 8011900:	080132fc 	.word	0x080132fc
 8011904:	08013334 	.word	0x08013334
 8011908:	0801336c 	.word	0x0801336c
 801190c:	080133a0 	.word	0x080133a0
 8011910:	080133d4 	.word	0x080133d4
 8011914:	08013408 	.word	0x08013408
 8011918:	08013440 	.word	0x08013440
 801191c:	08013478 	.word	0x08013478
 8011920:	080131a0 	.word	0x080131a0
 8011924:	08012f08 	.word	0x08012f08
 8011928:	08013090 	.word	0x08013090
 801192c:	08012fa4 	.word	0x08012fa4
 8011930:	08012fac 	.word	0x08012fac
 8011934:	08012fb8 	.word	0x08012fb8
 8011938:	080130e4 	.word	0x080130e4
 801193c:	080134b4 	.word	0x080134b4
 8011940:	080134dc 	.word	0x080134dc
 8011944:	20003400 	.word	0x20003400
 8011948:	0801314c 	.word	0x0801314c
 801194c:	2001ea50 	.word	0x2001ea50
 8011950:	2001e844 	.word	0x2001e844
 8011954:	20011000 	.word	0x20011000
 8011958:	2001ea48 	.word	0x2001ea48
 801195c:	2001ea54 	.word	0x2001ea54
 8011960:	2001e384 	.word	0x2001e384
 8011964:	2001e37c 	.word	0x2001e37c
 8011968:	2001e004 	.word	0x2001e004
 801196c:	2001e00c 	.word	0x2001e00c
 8011970:	20013004 	.word	0x20013004
 8011974:	20019004 	.word	0x20019004
 8011978:	2001e948 	.word	0x2001e948
 801197c:	2001e848 	.word	0x2001e848
 8011980:	08013520 	.word	0x08013520
 8011984:	0801355c 	.word	0x0801355c
 8011988:	08013584 	.word	0x08013584
 801198c:	08013594 	.word	0x08013594
 8011990:	20011004 	.word	0x20011004
 8011994:	080111b9 	.word	0x080111b9
                                RVM_Stack_Init((rvm_ptr_t)RVM_GUARD_Stack,RVM_GUARD_STACK_SIZE),0)==0);
    RVM_LOG_S("Init:Guard daemon initialization complete.\r\n");
 8011998:	48b2      	ldr	r0, [pc, #712]	; (8011c64 <main+0x664>)

    /* Timer daemon initialization - main priority */
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_TIMD_THD,
 801199a:	2504      	movs	r5, #4
    *Kmem_Bump+=RVM_THD_SIZE;
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_GUARD_THD, RVM_BOOT_INIT_THD, RVM_VMM_GUARD_SIG, 0, RVM_MAX_PREEMPT_PRIO-1)==0);
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VMM_GUARD_THD, (rvm_ptr_t)RVM_Guard_Daemon, 
                                RVM_Stack_Init((rvm_ptr_t)RVM_GUARD_Stack,RVM_GUARD_STACK_SIZE),0)==0);
    RVM_LOG_S("Init:Guard daemon initialization complete.\r\n");
 801199c:	f001 f9e8 	bl	8012d70 <RVM_Print_String>

    /* Timer daemon initialization - main priority */
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_TIMD_THD,
 80119a0:	9a06      	ldr	r2, [sp, #24]
 80119a2:	9500      	str	r5, [sp, #0]
 80119a4:	2302      	movs	r3, #2
 80119a6:	9201      	str	r2, [sp, #4]
 80119a8:	2105      	movs	r1, #5
 80119aa:	220d      	movs	r2, #13
 80119ac:	4620      	mov	r0, r4
 80119ae:	f001 fa59 	bl	8012e64 <RVM_Thd_Crt>
 80119b2:	2800      	cmp	r0, #0
 80119b4:	f2c0 8239 	blt.w	8011e2a <main+0x82a>
                           RVM_BOOT_INIT_PROC, RVM_TIMD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created Timer daemon CID ",RVM_VMM_TIMD_THD," @ address 0x",*Kmem_Bump,".\r\n");
 80119b8:	48ab      	ldr	r0, [pc, #684]	; (8011c68 <main+0x668>)
 80119ba:	f001 f9d9 	bl	8012d70 <RVM_Print_String>
 80119be:	200d      	movs	r0, #13
 80119c0:	f001 f944 	bl	8012c4c <RVM_Print_Int>
 80119c4:	48a9      	ldr	r0, [pc, #676]	; (8011c6c <main+0x66c>)
 80119c6:	f001 f9d3 	bl	8012d70 <RVM_Print_String>
 80119ca:	9806      	ldr	r0, [sp, #24]
 80119cc:	f001 f9a4 	bl	8012d18 <RVM_Print_Uint>
 80119d0:	48a7      	ldr	r0, [pc, #668]	; (8011c70 <main+0x670>)
 80119d2:	f001 f9cd 	bl	8012d70 <RVM_Print_String>
    *Kmem_Bump+=RVM_THD_SIZE;
 80119d6:	9a06      	ldr	r2, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_TIMD_THD, RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, 0, RVM_TIMD_PRIO)==0);
 80119d8:	4623      	mov	r3, r4
 80119da:	9500      	str	r5, [sp, #0]

    /* Timer daemon initialization - main priority */
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_TIMD_THD,
                           RVM_BOOT_INIT_PROC, RVM_TIMD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created Timer daemon CID ",RVM_VMM_TIMD_THD," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_THD_SIZE;
 80119dc:	f102 04c0 	add.w	r4, r2, #192	; 0xc0
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_TIMD_THD, RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, 0, RVM_TIMD_PRIO)==0);
 80119e0:	210b      	movs	r1, #11
 80119e2:	220c      	movs	r2, #12
 80119e4:	200d      	movs	r0, #13

    /* Timer daemon initialization - main priority */
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_TIMD_THD,
                           RVM_BOOT_INIT_PROC, RVM_TIMD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created Timer daemon CID ",RVM_VMM_TIMD_THD," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_THD_SIZE;
 80119e6:	9406      	str	r4, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_TIMD_THD, RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, 0, RVM_TIMD_PRIO)==0);
 80119e8:	f001 fa56 	bl	8012e98 <RVM_Thd_Sched_Bind>
 80119ec:	4604      	mov	r4, r0
 80119ee:	b1e0      	cbz	r0, 8011a2a <main+0x42a>
 80119f0:	48a0      	ldr	r0, [pc, #640]	; (8011c74 <main+0x674>)
 80119f2:	f001 f9bd 	bl	8012d70 <RVM_Print_String>
 80119f6:	48a0      	ldr	r0, [pc, #640]	; (8011c78 <main+0x678>)
 80119f8:	f001 f9ba 	bl	8012d70 <RVM_Print_String>
 80119fc:	489f      	ldr	r0, [pc, #636]	; (8011c7c <main+0x67c>)
 80119fe:	f001 f9b7 	bl	8012d70 <RVM_Print_String>
 8011a02:	f44f 70b5 	mov.w	r0, #362	; 0x16a
 8011a06:	f001 f921 	bl	8012c4c <RVM_Print_Int>
 8011a0a:	489d      	ldr	r0, [pc, #628]	; (8011c80 <main+0x680>)
 8011a0c:	f001 f9b0 	bl	8012d70 <RVM_Print_String>
 8011a10:	489c      	ldr	r0, [pc, #624]	; (8011c84 <main+0x684>)
 8011a12:	f001 f9ad 	bl	8012d70 <RVM_Print_String>
 8011a16:	489c      	ldr	r0, [pc, #624]	; (8011c88 <main+0x688>)
 8011a18:	f001 f9aa 	bl	8012d70 <RVM_Print_String>
 8011a1c:	489b      	ldr	r0, [pc, #620]	; (8011c8c <main+0x68c>)
 8011a1e:	f001 f9a7 	bl	8012d70 <RVM_Print_String>
 8011a22:	4897      	ldr	r0, [pc, #604]	; (8011c80 <main+0x680>)
 8011a24:	f001 f9a4 	bl	8012d70 <RVM_Print_String>
 8011a28:	e7fe      	b.n	8011a28 <main+0x428>
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VMM_TIMD_THD, (rvm_ptr_t)RVM_Timer_Daemon, 
 8011a2a:	f44f 6100 	mov.w	r1, #2048	; 0x800
 8011a2e:	4898      	ldr	r0, [pc, #608]	; (8011c90 <main+0x690>)
 8011a30:	f7fe fb42 	bl	80100b8 <RVM_Stack_Init>
 8011a34:	4623      	mov	r3, r4
 8011a36:	4602      	mov	r2, r0
 8011a38:	4996      	ldr	r1, [pc, #600]	; (8011c94 <main+0x694>)
 8011a3a:	200d      	movs	r0, #13
 8011a3c:	f001 fa20 	bl	8012e80 <RVM_Thd_Exec_Set>
 8011a40:	4604      	mov	r4, r0
 8011a42:	b1e0      	cbz	r0, 8011a7e <main+0x47e>
 8011a44:	488b      	ldr	r0, [pc, #556]	; (8011c74 <main+0x674>)
 8011a46:	f001 f993 	bl	8012d70 <RVM_Print_String>
 8011a4a:	488b      	ldr	r0, [pc, #556]	; (8011c78 <main+0x678>)
 8011a4c:	f001 f990 	bl	8012d70 <RVM_Print_String>
 8011a50:	488a      	ldr	r0, [pc, #552]	; (8011c7c <main+0x67c>)
 8011a52:	f001 f98d 	bl	8012d70 <RVM_Print_String>
 8011a56:	f44f 70b6 	mov.w	r0, #364	; 0x16c
 8011a5a:	f001 f8f7 	bl	8012c4c <RVM_Print_Int>
 8011a5e:	4888      	ldr	r0, [pc, #544]	; (8011c80 <main+0x680>)
 8011a60:	f001 f986 	bl	8012d70 <RVM_Print_String>
 8011a64:	4887      	ldr	r0, [pc, #540]	; (8011c84 <main+0x684>)
 8011a66:	f001 f983 	bl	8012d70 <RVM_Print_String>
 8011a6a:	4887      	ldr	r0, [pc, #540]	; (8011c88 <main+0x688>)
 8011a6c:	f001 f980 	bl	8012d70 <RVM_Print_String>
 8011a70:	4886      	ldr	r0, [pc, #536]	; (8011c8c <main+0x68c>)
 8011a72:	f001 f97d 	bl	8012d70 <RVM_Print_String>
 8011a76:	4882      	ldr	r0, [pc, #520]	; (8011c80 <main+0x680>)
 8011a78:	f001 f97a 	bl	8012d70 <RVM_Print_String>
 8011a7c:	e7fe      	b.n	8011a7c <main+0x47c>
                                RVM_Stack_Init((rvm_ptr_t)RVM_TIMD_Stack,RVM_TIMD_STACK_SIZE),0)==0);
    RVM_LOG_S("Init:Timer daemon initialization complete.\r\n");
 8011a7e:	4886      	ldr	r0, [pc, #536]	; (8011c98 <main+0x698>)
 8011a80:	f001 f976 	bl	8012d70 <RVM_Print_String>

    /* VMM daemon initialization - main priority */
    RVM_ASSERT(RVM_Sig_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_VMMD_SIG, *Kmem_Bump)==0);
 8011a84:	4620      	mov	r0, r4
 8011a86:	9b06      	ldr	r3, [sp, #24]
 8011a88:	220f      	movs	r2, #15
 8011a8a:	2105      	movs	r1, #5
 8011a8c:	f001 fa28 	bl	8012ee0 <RVM_Sig_Crt>
 8011a90:	4606      	mov	r6, r0
 8011a92:	b1e0      	cbz	r0, 8011ace <main+0x4ce>
 8011a94:	4877      	ldr	r0, [pc, #476]	; (8011c74 <main+0x674>)
 8011a96:	f001 f96b 	bl	8012d70 <RVM_Print_String>
 8011a9a:	4877      	ldr	r0, [pc, #476]	; (8011c78 <main+0x678>)
 8011a9c:	f001 f968 	bl	8012d70 <RVM_Print_String>
 8011aa0:	4876      	ldr	r0, [pc, #472]	; (8011c7c <main+0x67c>)
 8011aa2:	f001 f965 	bl	8012d70 <RVM_Print_String>
 8011aa6:	f44f 70b8 	mov.w	r0, #368	; 0x170
 8011aaa:	f001 f8cf 	bl	8012c4c <RVM_Print_Int>
 8011aae:	4874      	ldr	r0, [pc, #464]	; (8011c80 <main+0x680>)
 8011ab0:	f001 f95e 	bl	8012d70 <RVM_Print_String>
 8011ab4:	4873      	ldr	r0, [pc, #460]	; (8011c84 <main+0x684>)
 8011ab6:	f001 f95b 	bl	8012d70 <RVM_Print_String>
 8011aba:	4873      	ldr	r0, [pc, #460]	; (8011c88 <main+0x688>)
 8011abc:	f001 f958 	bl	8012d70 <RVM_Print_String>
 8011ac0:	4872      	ldr	r0, [pc, #456]	; (8011c8c <main+0x68c>)
 8011ac2:	f001 f955 	bl	8012d70 <RVM_Print_String>
 8011ac6:	486e      	ldr	r0, [pc, #440]	; (8011c80 <main+0x680>)
 8011ac8:	f001 f952 	bl	8012d70 <RVM_Print_String>
 8011acc:	e7fe      	b.n	8011acc <main+0x4cc>
    RVM_LOG_SISUS("Init:Created VMMD endpoint CID ",RVM_VMM_VMMD_SIG," @ address 0x",*Kmem_Bump,".\r\n");
 8011ace:	4873      	ldr	r0, [pc, #460]	; (8011c9c <main+0x69c>)
 8011ad0:	f001 f94e 	bl	8012d70 <RVM_Print_String>
 8011ad4:	200f      	movs	r0, #15
 8011ad6:	f001 f8b9 	bl	8012c4c <RVM_Print_Int>
 8011ada:	4864      	ldr	r0, [pc, #400]	; (8011c6c <main+0x66c>)
 8011adc:	f001 f948 	bl	8012d70 <RVM_Print_String>
 8011ae0:	9806      	ldr	r0, [sp, #24]
 8011ae2:	f001 f919 	bl	8012d18 <RVM_Print_Uint>
 8011ae6:	4862      	ldr	r0, [pc, #392]	; (8011c70 <main+0x670>)
 8011ae8:	f001 f942 	bl	8012d70 <RVM_Print_String>
    *Kmem_Bump+=RVM_SIG_SIZE;
 8011aec:	9c06      	ldr	r4, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_VMMD_THD,
 8011aee:	9500      	str	r5, [sp, #0]
 8011af0:	4630      	mov	r0, r6
    RVM_LOG_S("Init:Timer daemon initialization complete.\r\n");

    /* VMM daemon initialization - main priority */
    RVM_ASSERT(RVM_Sig_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_VMMD_SIG, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created VMMD endpoint CID ",RVM_VMM_VMMD_SIG," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_SIG_SIZE;
 8011af2:	3410      	adds	r4, #16
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_VMMD_THD,
 8011af4:	2302      	movs	r3, #2
 8011af6:	220e      	movs	r2, #14
 8011af8:	2105      	movs	r1, #5
 8011afa:	9401      	str	r4, [sp, #4]
    RVM_LOG_S("Init:Timer daemon initialization complete.\r\n");

    /* VMM daemon initialization - main priority */
    RVM_ASSERT(RVM_Sig_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_VMMD_SIG, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created VMMD endpoint CID ",RVM_VMM_VMMD_SIG," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_SIG_SIZE;
 8011afc:	9406      	str	r4, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_VMMD_THD,
 8011afe:	f001 f9b1 	bl	8012e64 <RVM_Thd_Crt>
 8011b02:	2800      	cmp	r0, #0
 8011b04:	f2c0 81cb 	blt.w	8011e9e <main+0x89e>
                           RVM_BOOT_INIT_PROC, RVM_VMMD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created VMM daemon CID ",RVM_VMM_VMMD_THD," @ address 0x",*Kmem_Bump,".\r\n");
 8011b08:	4865      	ldr	r0, [pc, #404]	; (8011ca0 <main+0x6a0>)
    *Kmem_Bump+=RVM_THD_SIZE;
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_VMMD_THD, RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, 0, RVM_VMMD_PRIO)==0);
 8011b0a:	2504      	movs	r5, #4
    RVM_LOG_SISUS("Init:Created VMMD endpoint CID ",RVM_VMM_VMMD_SIG," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_SIG_SIZE;
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_VMMD_THD,
                           RVM_BOOT_INIT_PROC, RVM_VMMD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created VMM daemon CID ",RVM_VMM_VMMD_THD," @ address 0x",*Kmem_Bump,".\r\n");
 8011b0c:	f001 f930 	bl	8012d70 <RVM_Print_String>
 8011b10:	200e      	movs	r0, #14
 8011b12:	f001 f89b 	bl	8012c4c <RVM_Print_Int>
 8011b16:	4855      	ldr	r0, [pc, #340]	; (8011c6c <main+0x66c>)
 8011b18:	f001 f92a 	bl	8012d70 <RVM_Print_String>
 8011b1c:	9806      	ldr	r0, [sp, #24]
 8011b1e:	f001 f8fb 	bl	8012d18 <RVM_Print_Uint>
 8011b22:	4853      	ldr	r0, [pc, #332]	; (8011c70 <main+0x670>)
 8011b24:	f001 f924 	bl	8012d70 <RVM_Print_String>
    *Kmem_Bump+=RVM_THD_SIZE;
 8011b28:	9a06      	ldr	r2, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_VMMD_THD, RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, 0, RVM_VMMD_PRIO)==0);
 8011b2a:	9500      	str	r5, [sp, #0]
 8011b2c:	2300      	movs	r3, #0
    *Kmem_Bump+=RVM_SIG_SIZE;
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_VMMD_THD,
                           RVM_BOOT_INIT_PROC, RVM_VMMD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created VMM daemon CID ",RVM_VMM_VMMD_THD," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_THD_SIZE;
 8011b2e:	f102 04c0 	add.w	r4, r2, #192	; 0xc0
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_VMMD_THD, RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, 0, RVM_VMMD_PRIO)==0);
 8011b32:	210b      	movs	r1, #11
 8011b34:	220c      	movs	r2, #12
 8011b36:	200e      	movs	r0, #14
    *Kmem_Bump+=RVM_SIG_SIZE;
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_VMMD_THD,
                           RVM_BOOT_INIT_PROC, RVM_VMMD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created VMM daemon CID ",RVM_VMM_VMMD_THD," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_THD_SIZE;
 8011b38:	9406      	str	r4, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_VMMD_THD, RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, 0, RVM_VMMD_PRIO)==0);
 8011b3a:	f001 f9ad 	bl	8012e98 <RVM_Thd_Sched_Bind>
 8011b3e:	4604      	mov	r4, r0
 8011b40:	b1e0      	cbz	r0, 8011b7c <main+0x57c>
 8011b42:	484c      	ldr	r0, [pc, #304]	; (8011c74 <main+0x674>)
 8011b44:	f001 f914 	bl	8012d70 <RVM_Print_String>
 8011b48:	484b      	ldr	r0, [pc, #300]	; (8011c78 <main+0x678>)
 8011b4a:	f001 f911 	bl	8012d70 <RVM_Print_String>
 8011b4e:	484b      	ldr	r0, [pc, #300]	; (8011c7c <main+0x67c>)
 8011b50:	f001 f90e 	bl	8012d70 <RVM_Print_String>
 8011b54:	f240 1079 	movw	r0, #377	; 0x179
 8011b58:	f001 f878 	bl	8012c4c <RVM_Print_Int>
 8011b5c:	4848      	ldr	r0, [pc, #288]	; (8011c80 <main+0x680>)
 8011b5e:	f001 f907 	bl	8012d70 <RVM_Print_String>
 8011b62:	4848      	ldr	r0, [pc, #288]	; (8011c84 <main+0x684>)
 8011b64:	f001 f904 	bl	8012d70 <RVM_Print_String>
 8011b68:	4847      	ldr	r0, [pc, #284]	; (8011c88 <main+0x688>)
 8011b6a:	f001 f901 	bl	8012d70 <RVM_Print_String>
 8011b6e:	4847      	ldr	r0, [pc, #284]	; (8011c8c <main+0x68c>)
 8011b70:	f001 f8fe 	bl	8012d70 <RVM_Print_String>
 8011b74:	4842      	ldr	r0, [pc, #264]	; (8011c80 <main+0x680>)
 8011b76:	f001 f8fb 	bl	8012d70 <RVM_Print_String>
 8011b7a:	e7fe      	b.n	8011b7a <main+0x57a>
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VMM_VMMD_THD, (rvm_ptr_t)RVM_VMM_Daemon, 
 8011b7c:	f44f 6100 	mov.w	r1, #2048	; 0x800
 8011b80:	4848      	ldr	r0, [pc, #288]	; (8011ca4 <main+0x6a4>)
 8011b82:	f7fe fa99 	bl	80100b8 <RVM_Stack_Init>
 8011b86:	4623      	mov	r3, r4
 8011b88:	4602      	mov	r2, r0
 8011b8a:	4947      	ldr	r1, [pc, #284]	; (8011ca8 <main+0x6a8>)
 8011b8c:	200e      	movs	r0, #14
 8011b8e:	f001 f977 	bl	8012e80 <RVM_Thd_Exec_Set>
 8011b92:	4604      	mov	r4, r0
 8011b94:	b1e0      	cbz	r0, 8011bd0 <main+0x5d0>
 8011b96:	4837      	ldr	r0, [pc, #220]	; (8011c74 <main+0x674>)
 8011b98:	f001 f8ea 	bl	8012d70 <RVM_Print_String>
 8011b9c:	4836      	ldr	r0, [pc, #216]	; (8011c78 <main+0x678>)
 8011b9e:	f001 f8e7 	bl	8012d70 <RVM_Print_String>
 8011ba2:	4836      	ldr	r0, [pc, #216]	; (8011c7c <main+0x67c>)
 8011ba4:	f001 f8e4 	bl	8012d70 <RVM_Print_String>
 8011ba8:	f240 107b 	movw	r0, #379	; 0x17b
 8011bac:	f001 f84e 	bl	8012c4c <RVM_Print_Int>
 8011bb0:	4833      	ldr	r0, [pc, #204]	; (8011c80 <main+0x680>)
 8011bb2:	f001 f8dd 	bl	8012d70 <RVM_Print_String>
 8011bb6:	4833      	ldr	r0, [pc, #204]	; (8011c84 <main+0x684>)
 8011bb8:	f001 f8da 	bl	8012d70 <RVM_Print_String>
 8011bbc:	4832      	ldr	r0, [pc, #200]	; (8011c88 <main+0x688>)
 8011bbe:	f001 f8d7 	bl	8012d70 <RVM_Print_String>
 8011bc2:	4832      	ldr	r0, [pc, #200]	; (8011c8c <main+0x68c>)
 8011bc4:	f001 f8d4 	bl	8012d70 <RVM_Print_String>
 8011bc8:	482d      	ldr	r0, [pc, #180]	; (8011c80 <main+0x680>)
 8011bca:	f001 f8d1 	bl	8012d70 <RVM_Print_String>
 8011bce:	e7fe      	b.n	8011bce <main+0x5ce>
                                RVM_Stack_Init((rvm_ptr_t)RVM_VMMD_Stack,RVM_VMMD_STACK_SIZE),0)==0);
    RVM_LOG_S("Init:VMM daemon initialization complete.\r\n");
 8011bd0:	4836      	ldr	r0, [pc, #216]	; (8011cac <main+0x6ac>)
 8011bd2:	f001 f8cd 	bl	8012d70 <RVM_Print_String>

    /* Interrupt daemon initialization - main priority */
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_INTD_THD,
 8011bd6:	9a06      	ldr	r2, [sp, #24]
 8011bd8:	9500      	str	r5, [sp, #0]
 8011bda:	2302      	movs	r3, #2
 8011bdc:	9201      	str	r2, [sp, #4]
 8011bde:	2105      	movs	r1, #5
 8011be0:	2210      	movs	r2, #16
 8011be2:	4620      	mov	r0, r4
 8011be4:	f001 f93e 	bl	8012e64 <RVM_Thd_Crt>
 8011be8:	2800      	cmp	r0, #0
 8011bea:	f2c0 8101 	blt.w	8011df0 <main+0x7f0>
                           RVM_BOOT_INIT_PROC, RVM_INTD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created Interrupt daemon CID ",RVM_VMM_INTD_THD," @ address 0x",*Kmem_Bump,".\r\n");
 8011bee:	4830      	ldr	r0, [pc, #192]	; (8011cb0 <main+0x6b0>)
 8011bf0:	f001 f8be 	bl	8012d70 <RVM_Print_String>
 8011bf4:	2010      	movs	r0, #16
 8011bf6:	f001 f829 	bl	8012c4c <RVM_Print_Int>
 8011bfa:	481c      	ldr	r0, [pc, #112]	; (8011c6c <main+0x66c>)
 8011bfc:	f001 f8b8 	bl	8012d70 <RVM_Print_String>
 8011c00:	9806      	ldr	r0, [sp, #24]
 8011c02:	f001 f889 	bl	8012d18 <RVM_Print_Uint>
 8011c06:	481a      	ldr	r0, [pc, #104]	; (8011c70 <main+0x670>)
 8011c08:	f001 f8b2 	bl	8012d70 <RVM_Print_String>
    *Kmem_Bump+=RVM_THD_SIZE;
 8011c0c:	9a06      	ldr	r2, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_INTD_THD, RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, 0, RVM_INTD_PRIO)==0);
 8011c0e:	4623      	mov	r3, r4
 8011c10:	9500      	str	r5, [sp, #0]

    /* Interrupt daemon initialization - main priority */
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_INTD_THD,
                           RVM_BOOT_INIT_PROC, RVM_INTD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created Interrupt daemon CID ",RVM_VMM_INTD_THD," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_THD_SIZE;
 8011c12:	f102 04c0 	add.w	r4, r2, #192	; 0xc0
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_INTD_THD, RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, 0, RVM_INTD_PRIO)==0);
 8011c16:	210b      	movs	r1, #11
 8011c18:	220c      	movs	r2, #12
 8011c1a:	2010      	movs	r0, #16

    /* Interrupt daemon initialization - main priority */
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_INTD_THD,
                           RVM_BOOT_INIT_PROC, RVM_INTD_PRIO, *Kmem_Bump)>=0);
    RVM_LOG_SISUS("Init:Created Interrupt daemon CID ",RVM_VMM_INTD_THD," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_THD_SIZE;
 8011c1c:	9406      	str	r4, [sp, #24]
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_INTD_THD, RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, 0, RVM_INTD_PRIO)==0);
 8011c1e:	f001 f93b 	bl	8012e98 <RVM_Thd_Sched_Bind>
 8011c22:	4604      	mov	r4, r0
 8011c24:	2800      	cmp	r0, #0
 8011c26:	d045      	beq.n	8011cb4 <main+0x6b4>
 8011c28:	4812      	ldr	r0, [pc, #72]	; (8011c74 <main+0x674>)
 8011c2a:	f001 f8a1 	bl	8012d70 <RVM_Print_String>
 8011c2e:	4812      	ldr	r0, [pc, #72]	; (8011c78 <main+0x678>)
 8011c30:	f001 f89e 	bl	8012d70 <RVM_Print_String>
 8011c34:	4811      	ldr	r0, [pc, #68]	; (8011c7c <main+0x67c>)
 8011c36:	f001 f89b 	bl	8012d70 <RVM_Print_String>
 8011c3a:	f44f 70c2 	mov.w	r0, #388	; 0x184
 8011c3e:	f001 f805 	bl	8012c4c <RVM_Print_Int>
 8011c42:	480f      	ldr	r0, [pc, #60]	; (8011c80 <main+0x680>)
 8011c44:	f001 f894 	bl	8012d70 <RVM_Print_String>
 8011c48:	480e      	ldr	r0, [pc, #56]	; (8011c84 <main+0x684>)
 8011c4a:	f001 f891 	bl	8012d70 <RVM_Print_String>
 8011c4e:	480e      	ldr	r0, [pc, #56]	; (8011c88 <main+0x688>)
 8011c50:	f001 f88e 	bl	8012d70 <RVM_Print_String>
 8011c54:	480d      	ldr	r0, [pc, #52]	; (8011c8c <main+0x68c>)
 8011c56:	f001 f88b 	bl	8012d70 <RVM_Print_String>
 8011c5a:	4809      	ldr	r0, [pc, #36]	; (8011c80 <main+0x680>)
 8011c5c:	f001 f888 	bl	8012d70 <RVM_Print_String>
 8011c60:	e7fe      	b.n	8011c60 <main+0x660>
 8011c62:	bf00      	nop
 8011c64:	080135b4 	.word	0x080135b4
 8011c68:	080135e4 	.word	0x080135e4
 8011c6c:	08013584 	.word	0x08013584
 8011c70:	0801314c 	.word	0x0801314c
 8011c74:	08012f08 	.word	0x08012f08
 8011c78:	08013090 	.word	0x08013090
 8011c7c:	08012fa4 	.word	0x08012fa4
 8011c80:	080134b0 	.word	0x080134b0
 8011c84:	08012fac 	.word	0x08012fac
 8011c88:	08012fb8 	.word	0x08012fb8
 8011c8c:	080130e4 	.word	0x080130e4
 8011c90:	20012004 	.word	0x20012004
 8011c94:	0801143d 	.word	0x0801143d
 8011c98:	08013604 	.word	0x08013604
 8011c9c:	08013634 	.word	0x08013634
 8011ca0:	08013654 	.word	0x08013654
 8011ca4:	20012804 	.word	0x20012804
 8011ca8:	0801110d 	.word	0x0801110d
 8011cac:	08013674 	.word	0x08013674
 8011cb0:	080136a0 	.word	0x080136a0
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VMM_INTD_THD, (rvm_ptr_t)RVM_Interrupt_Daemon, 
 8011cb4:	f44f 6100 	mov.w	r1, #2048	; 0x800
 8011cb8:	4899      	ldr	r0, [pc, #612]	; (8011f20 <main+0x920>)
 8011cba:	f7fe f9fd 	bl	80100b8 <RVM_Stack_Init>
 8011cbe:	4623      	mov	r3, r4
 8011cc0:	4602      	mov	r2, r0
 8011cc2:	4998      	ldr	r1, [pc, #608]	; (8011f24 <main+0x924>)
 8011cc4:	2010      	movs	r0, #16
 8011cc6:	f001 f8db 	bl	8012e80 <RVM_Thd_Exec_Set>
 8011cca:	4605      	mov	r5, r0
 8011ccc:	b1e0      	cbz	r0, 8011d08 <main+0x708>
 8011cce:	4896      	ldr	r0, [pc, #600]	; (8011f28 <main+0x928>)
 8011cd0:	f001 f84e 	bl	8012d70 <RVM_Print_String>
 8011cd4:	4895      	ldr	r0, [pc, #596]	; (8011f2c <main+0x92c>)
 8011cd6:	f001 f84b 	bl	8012d70 <RVM_Print_String>
 8011cda:	4895      	ldr	r0, [pc, #596]	; (8011f30 <main+0x930>)
 8011cdc:	f001 f848 	bl	8012d70 <RVM_Print_String>
 8011ce0:	f44f 70c3 	mov.w	r0, #390	; 0x186
 8011ce4:	f000 ffb2 	bl	8012c4c <RVM_Print_Int>
 8011ce8:	4892      	ldr	r0, [pc, #584]	; (8011f34 <main+0x934>)
 8011cea:	f001 f841 	bl	8012d70 <RVM_Print_String>
 8011cee:	4892      	ldr	r0, [pc, #584]	; (8011f38 <main+0x938>)
 8011cf0:	f001 f83e 	bl	8012d70 <RVM_Print_String>
 8011cf4:	4891      	ldr	r0, [pc, #580]	; (8011f3c <main+0x93c>)
 8011cf6:	f001 f83b 	bl	8012d70 <RVM_Print_String>
 8011cfa:	4891      	ldr	r0, [pc, #580]	; (8011f40 <main+0x940>)
 8011cfc:	f001 f838 	bl	8012d70 <RVM_Print_String>
 8011d00:	488c      	ldr	r0, [pc, #560]	; (8011f34 <main+0x934>)
 8011d02:	f001 f835 	bl	8012d70 <RVM_Print_String>
 8011d06:	e7fe      	b.n	8011d06 <main+0x706>
    RVM_LOG_S("Init:Interrupt daemon initialization complete.\r\n");
    
    /* Delegate timeslice to GuardD, and make it work - we should stop here actually,
     * and we have done operating the database, now all the work is the Guard daemon's.
     * additionally, from then on, no further kernel objects will be created anymore */
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_GUARD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
 8011d08:	4e8e      	ldr	r6, [pc, #568]	; (8011f44 <main+0x944>)
    *Kmem_Bump+=RVM_THD_SIZE;
    
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VMM_INTD_THD, RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, 0, RVM_INTD_PRIO)==0);
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VMM_INTD_THD, (rvm_ptr_t)RVM_Interrupt_Daemon, 
                                RVM_Stack_Init((rvm_ptr_t)RVM_INTD_Stack,RVM_INTD_STACK_SIZE),0)==0);
    RVM_LOG_S("Init:Interrupt daemon initialization complete.\r\n");
 8011d0a:	488f      	ldr	r0, [pc, #572]	; (8011f48 <main+0x948>)
 8011d0c:	f001 f830 	bl	8012d70 <RVM_Print_String>
    
    /* Delegate timeslice to GuardD, and make it work - we should stop here actually,
     * and we have done operating the database, now all the work is the Guard daemon's.
     * additionally, from then on, no further kernel objects will be created anymore */
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_GUARD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
 8011d10:	4632      	mov	r2, r6
 8011d12:	2103      	movs	r1, #3
 8011d14:	200b      	movs	r0, #11
 8011d16:	f001 f8db 	bl	8012ed0 <RVM_Thd_Time_Xfer>
 8011d1a:	42b0      	cmp	r0, r6
 8011d1c:	4604      	mov	r4, r0
 8011d1e:	d01c      	beq.n	8011d5a <main+0x75a>
 8011d20:	4881      	ldr	r0, [pc, #516]	; (8011f28 <main+0x928>)
 8011d22:	f001 f825 	bl	8012d70 <RVM_Print_String>
 8011d26:	4881      	ldr	r0, [pc, #516]	; (8011f2c <main+0x92c>)
 8011d28:	f001 f822 	bl	8012d70 <RVM_Print_String>
 8011d2c:	4880      	ldr	r0, [pc, #512]	; (8011f30 <main+0x930>)
 8011d2e:	f001 f81f 	bl	8012d70 <RVM_Print_String>
 8011d32:	f44f 70c6 	mov.w	r0, #396	; 0x18c
 8011d36:	f000 ff89 	bl	8012c4c <RVM_Print_Int>
 8011d3a:	487e      	ldr	r0, [pc, #504]	; (8011f34 <main+0x934>)
 8011d3c:	f001 f818 	bl	8012d70 <RVM_Print_String>
 8011d40:	487d      	ldr	r0, [pc, #500]	; (8011f38 <main+0x938>)
 8011d42:	f001 f815 	bl	8012d70 <RVM_Print_String>
 8011d46:	487d      	ldr	r0, [pc, #500]	; (8011f3c <main+0x93c>)
 8011d48:	f001 f812 	bl	8012d70 <RVM_Print_String>
 8011d4c:	487c      	ldr	r0, [pc, #496]	; (8011f40 <main+0x940>)
 8011d4e:	f001 f80f 	bl	8012d70 <RVM_Print_String>
 8011d52:	4878      	ldr	r0, [pc, #480]	; (8011f34 <main+0x934>)
 8011d54:	f001 f80c 	bl	8012d70 <RVM_Print_String>
 8011d58:	e7fe      	b.n	8011d58 <main+0x758>
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_TIMD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
 8011d5a:	4602      	mov	r2, r0
 8011d5c:	2103      	movs	r1, #3
 8011d5e:	200d      	movs	r0, #13
 8011d60:	f001 f8b6 	bl	8012ed0 <RVM_Thd_Time_Xfer>
 8011d64:	42a0      	cmp	r0, r4
 8011d66:	4606      	mov	r6, r0
 8011d68:	d01c      	beq.n	8011da4 <main+0x7a4>
 8011d6a:	486f      	ldr	r0, [pc, #444]	; (8011f28 <main+0x928>)
 8011d6c:	f001 f800 	bl	8012d70 <RVM_Print_String>
 8011d70:	486e      	ldr	r0, [pc, #440]	; (8011f2c <main+0x92c>)
 8011d72:	f000 fffd 	bl	8012d70 <RVM_Print_String>
 8011d76:	486e      	ldr	r0, [pc, #440]	; (8011f30 <main+0x930>)
 8011d78:	f000 fffa 	bl	8012d70 <RVM_Print_String>
 8011d7c:	f240 108d 	movw	r0, #397	; 0x18d
 8011d80:	f000 ff64 	bl	8012c4c <RVM_Print_Int>
 8011d84:	486b      	ldr	r0, [pc, #428]	; (8011f34 <main+0x934>)
 8011d86:	f000 fff3 	bl	8012d70 <RVM_Print_String>
 8011d8a:	486b      	ldr	r0, [pc, #428]	; (8011f38 <main+0x938>)
 8011d8c:	f000 fff0 	bl	8012d70 <RVM_Print_String>
 8011d90:	486a      	ldr	r0, [pc, #424]	; (8011f3c <main+0x93c>)
 8011d92:	f000 ffed 	bl	8012d70 <RVM_Print_String>
 8011d96:	486a      	ldr	r0, [pc, #424]	; (8011f40 <main+0x940>)
 8011d98:	f000 ffea 	bl	8012d70 <RVM_Print_String>
 8011d9c:	4865      	ldr	r0, [pc, #404]	; (8011f34 <main+0x934>)
 8011d9e:	f000 ffe7 	bl	8012d70 <RVM_Print_String>
 8011da2:	e7fe      	b.n	8011da2 <main+0x7a2>
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_VMMD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
 8011da4:	4602      	mov	r2, r0
 8011da6:	2103      	movs	r1, #3
 8011da8:	200e      	movs	r0, #14
 8011daa:	f001 f891 	bl	8012ed0 <RVM_Thd_Time_Xfer>
 8011dae:	42b0      	cmp	r0, r6
 8011db0:	4604      	mov	r4, r0
 8011db2:	f000 8091 	beq.w	8011ed8 <main+0x8d8>
 8011db6:	485c      	ldr	r0, [pc, #368]	; (8011f28 <main+0x928>)
 8011db8:	f000 ffda 	bl	8012d70 <RVM_Print_String>
 8011dbc:	485b      	ldr	r0, [pc, #364]	; (8011f2c <main+0x92c>)
 8011dbe:	f000 ffd7 	bl	8012d70 <RVM_Print_String>
 8011dc2:	485b      	ldr	r0, [pc, #364]	; (8011f30 <main+0x930>)
 8011dc4:	f000 ffd4 	bl	8012d70 <RVM_Print_String>
 8011dc8:	f44f 70c7 	mov.w	r0, #398	; 0x18e
 8011dcc:	f000 ff3e 	bl	8012c4c <RVM_Print_Int>
 8011dd0:	4858      	ldr	r0, [pc, #352]	; (8011f34 <main+0x934>)
 8011dd2:	f000 ffcd 	bl	8012d70 <RVM_Print_String>
 8011dd6:	4858      	ldr	r0, [pc, #352]	; (8011f38 <main+0x938>)
 8011dd8:	f000 ffca 	bl	8012d70 <RVM_Print_String>
 8011ddc:	4857      	ldr	r0, [pc, #348]	; (8011f3c <main+0x93c>)
 8011dde:	f000 ffc7 	bl	8012d70 <RVM_Print_String>
 8011de2:	4857      	ldr	r0, [pc, #348]	; (8011f40 <main+0x940>)
 8011de4:	f000 ffc4 	bl	8012d70 <RVM_Print_String>
 8011de8:	4852      	ldr	r0, [pc, #328]	; (8011f34 <main+0x934>)
 8011dea:	f000 ffc1 	bl	8012d70 <RVM_Print_String>
 8011dee:	e7fe      	b.n	8011dee <main+0x7ee>
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VMM_VMMD_THD, (rvm_ptr_t)RVM_VMM_Daemon, 
                                RVM_Stack_Init((rvm_ptr_t)RVM_VMMD_Stack,RVM_VMMD_STACK_SIZE),0)==0);
    RVM_LOG_S("Init:VMM daemon initialization complete.\r\n");

    /* Interrupt daemon initialization - main priority */
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_INTD_THD,
 8011df0:	484d      	ldr	r0, [pc, #308]	; (8011f28 <main+0x928>)
 8011df2:	f000 ffbd 	bl	8012d70 <RVM_Print_String>
 8011df6:	484d      	ldr	r0, [pc, #308]	; (8011f2c <main+0x92c>)
 8011df8:	f000 ffba 	bl	8012d70 <RVM_Print_String>
 8011dfc:	484c      	ldr	r0, [pc, #304]	; (8011f30 <main+0x930>)
 8011dfe:	f000 ffb7 	bl	8012d70 <RVM_Print_String>
 8011e02:	f44f 70c0 	mov.w	r0, #384	; 0x180
 8011e06:	f000 ff21 	bl	8012c4c <RVM_Print_Int>
 8011e0a:	484a      	ldr	r0, [pc, #296]	; (8011f34 <main+0x934>)
 8011e0c:	f000 ffb0 	bl	8012d70 <RVM_Print_String>
 8011e10:	4849      	ldr	r0, [pc, #292]	; (8011f38 <main+0x938>)
 8011e12:	f000 ffad 	bl	8012d70 <RVM_Print_String>
 8011e16:	4849      	ldr	r0, [pc, #292]	; (8011f3c <main+0x93c>)
 8011e18:	f000 ffaa 	bl	8012d70 <RVM_Print_String>
 8011e1c:	4848      	ldr	r0, [pc, #288]	; (8011f40 <main+0x940>)
 8011e1e:	f000 ffa7 	bl	8012d70 <RVM_Print_String>
 8011e22:	4844      	ldr	r0, [pc, #272]	; (8011f34 <main+0x934>)
 8011e24:	f000 ffa4 	bl	8012d70 <RVM_Print_String>
 8011e28:	e7fe      	b.n	8011e28 <main+0x828>
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VMM_GUARD_THD, (rvm_ptr_t)RVM_Guard_Daemon, 
                                RVM_Stack_Init((rvm_ptr_t)RVM_GUARD_Stack,RVM_GUARD_STACK_SIZE),0)==0);
    RVM_LOG_S("Init:Guard daemon initialization complete.\r\n");

    /* Timer daemon initialization - main priority */
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_TIMD_THD,
 8011e2a:	483f      	ldr	r0, [pc, #252]	; (8011f28 <main+0x928>)
 8011e2c:	f000 ffa0 	bl	8012d70 <RVM_Print_String>
 8011e30:	483e      	ldr	r0, [pc, #248]	; (8011f2c <main+0x92c>)
 8011e32:	f000 ff9d 	bl	8012d70 <RVM_Print_String>
 8011e36:	483e      	ldr	r0, [pc, #248]	; (8011f30 <main+0x930>)
 8011e38:	f000 ff9a 	bl	8012d70 <RVM_Print_String>
 8011e3c:	f44f 70b3 	mov.w	r0, #358	; 0x166
 8011e40:	f000 ff04 	bl	8012c4c <RVM_Print_Int>
 8011e44:	483b      	ldr	r0, [pc, #236]	; (8011f34 <main+0x934>)
 8011e46:	f000 ff93 	bl	8012d70 <RVM_Print_String>
 8011e4a:	483b      	ldr	r0, [pc, #236]	; (8011f38 <main+0x938>)
 8011e4c:	f000 ff90 	bl	8012d70 <RVM_Print_String>
 8011e50:	483a      	ldr	r0, [pc, #232]	; (8011f3c <main+0x93c>)
 8011e52:	f000 ff8d 	bl	8012d70 <RVM_Print_String>
 8011e56:	483a      	ldr	r0, [pc, #232]	; (8011f40 <main+0x940>)
 8011e58:	f000 ff8a 	bl	8012d70 <RVM_Print_String>
 8011e5c:	4835      	ldr	r0, [pc, #212]	; (8011f34 <main+0x934>)
 8011e5e:	f000 ff87 	bl	8012d70 <RVM_Print_String>
 8011e62:	e7fe      	b.n	8011e62 <main+0x862>
    /* Guard daemon initialization - highest priority as always */    
    RVM_ASSERT(RVM_Sig_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_SIG, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created GuardD fault endpoint CID ",RVM_VMM_GUARD_SIG," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_SIG_SIZE;
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_GUARD_THD,
 8011e64:	4830      	ldr	r0, [pc, #192]	; (8011f28 <main+0x928>)
 8011e66:	f000 ff83 	bl	8012d70 <RVM_Print_String>
 8011e6a:	4830      	ldr	r0, [pc, #192]	; (8011f2c <main+0x92c>)
 8011e6c:	f000 ff80 	bl	8012d70 <RVM_Print_String>
 8011e70:	482f      	ldr	r0, [pc, #188]	; (8011f30 <main+0x930>)
 8011e72:	f000 ff7d 	bl	8012d70 <RVM_Print_String>
 8011e76:	f240 105b 	movw	r0, #347	; 0x15b
 8011e7a:	f000 fee7 	bl	8012c4c <RVM_Print_Int>
 8011e7e:	482d      	ldr	r0, [pc, #180]	; (8011f34 <main+0x934>)
 8011e80:	f000 ff76 	bl	8012d70 <RVM_Print_String>
 8011e84:	482c      	ldr	r0, [pc, #176]	; (8011f38 <main+0x938>)
 8011e86:	f000 ff73 	bl	8012d70 <RVM_Print_String>
 8011e8a:	482c      	ldr	r0, [pc, #176]	; (8011f3c <main+0x93c>)
 8011e8c:	f000 ff70 	bl	8012d70 <RVM_Print_String>
 8011e90:	482b      	ldr	r0, [pc, #172]	; (8011f40 <main+0x940>)
 8011e92:	f000 ff6d 	bl	8012d70 <RVM_Print_String>
 8011e96:	4827      	ldr	r0, [pc, #156]	; (8011f34 <main+0x934>)
 8011e98:	f000 ff6a 	bl	8012d70 <RVM_Print_String>
 8011e9c:	e7fe      	b.n	8011e9c <main+0x89c>
    /* VMM daemon initialization - main priority */
    RVM_ASSERT(RVM_Sig_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_VMMD_SIG, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created VMMD endpoint CID ",RVM_VMM_VMMD_SIG," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_SIG_SIZE;
    
    RVM_ASSERT(RVM_Thd_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VMM_VMMD_THD,
 8011e9e:	4822      	ldr	r0, [pc, #136]	; (8011f28 <main+0x928>)
 8011ea0:	f000 ff66 	bl	8012d70 <RVM_Print_String>
 8011ea4:	4821      	ldr	r0, [pc, #132]	; (8011f2c <main+0x92c>)
 8011ea6:	f000 ff63 	bl	8012d70 <RVM_Print_String>
 8011eaa:	4821      	ldr	r0, [pc, #132]	; (8011f30 <main+0x930>)
 8011eac:	f000 ff60 	bl	8012d70 <RVM_Print_String>
 8011eb0:	f240 1075 	movw	r0, #373	; 0x175
 8011eb4:	f000 feca 	bl	8012c4c <RVM_Print_Int>
 8011eb8:	481e      	ldr	r0, [pc, #120]	; (8011f34 <main+0x934>)
 8011eba:	f000 ff59 	bl	8012d70 <RVM_Print_String>
 8011ebe:	481e      	ldr	r0, [pc, #120]	; (8011f38 <main+0x938>)
 8011ec0:	f000 ff56 	bl	8012d70 <RVM_Print_String>
 8011ec4:	481d      	ldr	r0, [pc, #116]	; (8011f3c <main+0x93c>)
 8011ec6:	f000 ff53 	bl	8012d70 <RVM_Print_String>
 8011eca:	481d      	ldr	r0, [pc, #116]	; (8011f40 <main+0x940>)
 8011ecc:	f000 ff50 	bl	8012d70 <RVM_Print_String>
 8011ed0:	4818      	ldr	r0, [pc, #96]	; (8011f34 <main+0x934>)
 8011ed2:	f000 ff4d 	bl	8012d70 <RVM_Print_String>
 8011ed6:	e7fe      	b.n	8011ed6 <main+0x8d6>
     * and we have done operating the database, now all the work is the Guard daemon's.
     * additionally, from then on, no further kernel objects will be created anymore */
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_GUARD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_TIMD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_VMMD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_INTD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
 8011ed8:	4602      	mov	r2, r0
 8011eda:	2103      	movs	r1, #3
 8011edc:	2010      	movs	r0, #16
 8011ede:	f000 fff7 	bl	8012ed0 <RVM_Thd_Time_Xfer>
 8011ee2:	42a0      	cmp	r0, r4
 8011ee4:	d032      	beq.n	8011f4c <main+0x94c>
 8011ee6:	4810      	ldr	r0, [pc, #64]	; (8011f28 <main+0x928>)
 8011ee8:	f000 ff42 	bl	8012d70 <RVM_Print_String>
 8011eec:	480f      	ldr	r0, [pc, #60]	; (8011f2c <main+0x92c>)
 8011eee:	f000 ff3f 	bl	8012d70 <RVM_Print_String>
 8011ef2:	480f      	ldr	r0, [pc, #60]	; (8011f30 <main+0x930>)
 8011ef4:	f000 ff3c 	bl	8012d70 <RVM_Print_String>
 8011ef8:	f240 108f 	movw	r0, #399	; 0x18f
 8011efc:	f000 fea6 	bl	8012c4c <RVM_Print_Int>
 8011f00:	480c      	ldr	r0, [pc, #48]	; (8011f34 <main+0x934>)
 8011f02:	f000 ff35 	bl	8012d70 <RVM_Print_String>
 8011f06:	480c      	ldr	r0, [pc, #48]	; (8011f38 <main+0x938>)
 8011f08:	f000 ff32 	bl	8012d70 <RVM_Print_String>
 8011f0c:	480b      	ldr	r0, [pc, #44]	; (8011f3c <main+0x93c>)
 8011f0e:	f000 ff2f 	bl	8012d70 <RVM_Print_String>
 8011f12:	480b      	ldr	r0, [pc, #44]	; (8011f40 <main+0x940>)
 8011f14:	f000 ff2c 	bl	8012d70 <RVM_Print_String>
 8011f18:	4806      	ldr	r0, [pc, #24]	; (8011f34 <main+0x934>)
 8011f1a:	f000 ff29 	bl	8012d70 <RVM_Print_String>
 8011f1e:	e7fe      	b.n	8011f1e <main+0x91e>
 8011f20:	20011804 	.word	0x20011804
 8011f24:	080111e1 	.word	0x080111e1
 8011f28:	08012f08 	.word	0x08012f08
 8011f2c:	08013090 	.word	0x08013090
 8011f30:	08012fa4 	.word	0x08012fa4
 8011f34:	080134b0 	.word	0x080134b0
 8011f38:	08012fac 	.word	0x08012fac
 8011f3c:	08012fb8 	.word	0x08012fb8
 8011f40:	080130e4 	.word	0x080130e4
 8011f44:	7ffffffe 	.word	0x7ffffffe
 8011f48:	080136c4 	.word	0x080136c4
    RVM_LOG_S("Init:Daemon time budget initialization complete.\r\n");
 8011f4c:	48b2      	ldr	r0, [pc, #712]	; (8012218 <main+0xc18>)
{
    rvm_ptr_t VM_Cnt;
    rvm_ptr_t Pgtbl_Cnt;
    const struct RVM_Image* Image;
    
    VM_Cnt=0;
 8011f4e:	462e      	mov	r6, r5
     * additionally, from then on, no further kernel objects will be created anymore */
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_GUARD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_TIMD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_VMMD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VMM_INTD_THD, RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
    RVM_LOG_S("Init:Daemon time budget initialization complete.\r\n");
 8011f50:	f000 ff0e 	bl	8012d70 <RVM_Print_String>
    /* Create the startup thread in the init process, because the init thread
     * cannot block. Bind that to the processor, and let it have infinite budget.
     * after this the task will be handled by this task, and we will never return
     * to init unless there is nothing to run */
    RVM_Daemon_Init(&Kmem_Bump);
    RVM_LOG_S("Init:Daemon initialization done.\r\n");
 8011f54:	48b1      	ldr	r0, [pc, #708]	; (801221c <main+0xc1c>)
 8011f56:	f000 ff0b 	bl	8012d70 <RVM_Print_String>
    rvm_ptr_t Pgtbl_Cnt;
    const struct RVM_Image* Image;
    
    VM_Cnt=0;
    Pgtbl_Cnt=0;
    Image=(struct RVM_Image*)(*(rvm_ptr_t*)RVM_IMAGE_HEADER_START);
 8011f5a:	4bb1      	ldr	r3, [pc, #708]	; (8012220 <main+0xc20>)
    RVM_LOG_SUS("Init:First VM address 0x",(rvm_ptr_t)Image,".\r\n");
 8011f5c:	48b1      	ldr	r0, [pc, #708]	; (8012224 <main+0xc24>)
    rvm_ptr_t Pgtbl_Cnt;
    const struct RVM_Image* Image;
    
    VM_Cnt=0;
    Pgtbl_Cnt=0;
    Image=(struct RVM_Image*)(*(rvm_ptr_t*)RVM_IMAGE_HEADER_START);
 8011f5e:	681c      	ldr	r4, [r3, #0]
    RVM_LOG_SUS("Init:First VM address 0x",(rvm_ptr_t)Image,".\r\n");
 8011f60:	f000 ff06 	bl	8012d70 <RVM_Print_String>
 8011f64:	4620      	mov	r0, r4
 8011f66:	f000 fed7 	bl	8012d18 <RVM_Print_Uint>
 8011f6a:	48af      	ldr	r0, [pc, #700]	; (8012228 <main+0xc28>)
 8011f6c:	f000 ff00 	bl	8012d70 <RVM_Print_String>
    
    while(1)
    {
        VM_Cnt++;
        Pgtbl_Cnt+=Image->Pgtbl_Num;
 8011f70:	6ce3      	ldr	r3, [r4, #76]	; 0x4c
        if(Image->Next_Image==0)
 8011f72:	6de4      	ldr	r4, [r4, #92]	; 0x5c
    Image=(struct RVM_Image*)(*(rvm_ptr_t*)RVM_IMAGE_HEADER_START);
    RVM_LOG_SUS("Init:First VM address 0x",(rvm_ptr_t)Image,".\r\n");
    
    while(1)
    {
        VM_Cnt++;
 8011f74:	3601      	adds	r6, #1
        Pgtbl_Cnt+=Image->Pgtbl_Num;
 8011f76:	441d      	add	r5, r3
        if(Image->Next_Image==0)
 8011f78:	2c00      	cmp	r4, #0
 8011f7a:	d1fb      	bne.n	8011f74 <main+0x974>
    rvm_ptr_t Pgtbl_Bump;
    struct RVM_Image* Image;
    
    /* Traverse the images and see how many of them are there, and how many page table caps do they need */
    RVM_VM_Cnt(&VM_Num, &Pgtbl_Num);
    RVM_LOG_SIS("Init:Total virtual machine count ",VM_Num,".\r\n");
 8011f7c:	48ab      	ldr	r0, [pc, #684]	; (801222c <main+0xc2c>)
    RVM_LOG_SIS("Init:Total page table count ",Pgtbl_Num,".\r\n");
    
    /* Create the high-level captbls for virtual machines */
    /* This is the capability table for VM captbl/process caps */
    RVM_LOG_SISUS("Init:Virtual machine process/captbl table size ",VM_Num*2," @ address 0x",*Kmem_Bump,".\r\n");
 8011f7e:	0077      	lsls	r7, r6, #1
    rvm_ptr_t Pgtbl_Bump;
    struct RVM_Image* Image;
    
    /* Traverse the images and see how many of them are there, and how many page table caps do they need */
    RVM_VM_Cnt(&VM_Num, &Pgtbl_Num);
    RVM_LOG_SIS("Init:Total virtual machine count ",VM_Num,".\r\n");
 8011f80:	f000 fef6 	bl	8012d70 <RVM_Print_String>
 8011f84:	4630      	mov	r0, r6
 8011f86:	f000 fe61 	bl	8012c4c <RVM_Print_Int>
 8011f8a:	48a7      	ldr	r0, [pc, #668]	; (8012228 <main+0xc28>)
 8011f8c:	f000 fef0 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_SIS("Init:Total page table count ",Pgtbl_Num,".\r\n");
 8011f90:	48a7      	ldr	r0, [pc, #668]	; (8012230 <main+0xc30>)
 8011f92:	f000 feed 	bl	8012d70 <RVM_Print_String>
 8011f96:	4628      	mov	r0, r5
 8011f98:	f000 fe58 	bl	8012c4c <RVM_Print_Int>
 8011f9c:	48a2      	ldr	r0, [pc, #648]	; (8012228 <main+0xc28>)
 8011f9e:	f000 fee7 	bl	8012d70 <RVM_Print_String>
    
    /* Create the high-level captbls for virtual machines */
    /* This is the capability table for VM captbl/process caps */
    RVM_LOG_SISUS("Init:Virtual machine process/captbl table size ",VM_Num*2," @ address 0x",*Kmem_Bump,".\r\n");
 8011fa2:	48a4      	ldr	r0, [pc, #656]	; (8012234 <main+0xc34>)
 8011fa4:	f000 fee4 	bl	8012d70 <RVM_Print_String>
 8011fa8:	4638      	mov	r0, r7
 8011faa:	f000 fe4f 	bl	8012c4c <RVM_Print_Int>
 8011fae:	48a2      	ldr	r0, [pc, #648]	; (8012238 <main+0xc38>)
 8011fb0:	f000 fede 	bl	8012d70 <RVM_Print_String>
 8011fb4:	9806      	ldr	r0, [sp, #24]
 8011fb6:	f000 feaf 	bl	8012d18 <RVM_Print_Uint>
 8011fba:	489b      	ldr	r0, [pc, #620]	; (8012228 <main+0xc28>)
 8011fbc:	f000 fed8 	bl	8012d70 <RVM_Print_String>
    RVM_ASSERT(RVM_Captbl_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VIRT_TBL_CAPPROC, *Kmem_Bump, VM_Num*2)==0);
 8011fc0:	9700      	str	r7, [sp, #0]
 8011fc2:	9b06      	ldr	r3, [sp, #24]
 8011fc4:	2208      	movs	r2, #8
 8011fc6:	2105      	movs	r1, #5
 8011fc8:	4620      	mov	r0, r4
 8011fca:	f000 fee1 	bl	8012d90 <RVM_Captbl_Crt>
 8011fce:	b1e0      	cbz	r0, 801200a <main+0xa0a>
 8011fd0:	489a      	ldr	r0, [pc, #616]	; (801223c <main+0xc3c>)
 8011fd2:	f000 fecd 	bl	8012d70 <RVM_Print_String>
 8011fd6:	489a      	ldr	r0, [pc, #616]	; (8012240 <main+0xc40>)
 8011fd8:	f000 feca 	bl	8012d70 <RVM_Print_String>
 8011fdc:	4899      	ldr	r0, [pc, #612]	; (8012244 <main+0xc44>)
 8011fde:	f000 fec7 	bl	8012d70 <RVM_Print_String>
 8011fe2:	f240 100b 	movw	r0, #267	; 0x10b
 8011fe6:	f000 fe31 	bl	8012c4c <RVM_Print_Int>
 8011fea:	4897      	ldr	r0, [pc, #604]	; (8012248 <main+0xc48>)
 8011fec:	f000 fec0 	bl	8012d70 <RVM_Print_String>
 8011ff0:	4896      	ldr	r0, [pc, #600]	; (801224c <main+0xc4c>)
 8011ff2:	f000 febd 	bl	8012d70 <RVM_Print_String>
 8011ff6:	4896      	ldr	r0, [pc, #600]	; (8012250 <main+0xc50>)
 8011ff8:	f000 feba 	bl	8012d70 <RVM_Print_String>
 8011ffc:	4895      	ldr	r0, [pc, #596]	; (8012254 <main+0xc54>)
 8011ffe:	f000 feb7 	bl	8012d70 <RVM_Print_String>
 8012002:	4891      	ldr	r0, [pc, #580]	; (8012248 <main+0xc48>)
 8012004:	f000 feb4 	bl	8012d70 <RVM_Print_String>
 8012008:	e7fe      	b.n	8012008 <main+0xa08>
    *Kmem_Bump+=RVM_CAPTBL_SIZE(VM_Num*2);
 801200a:	9b06      	ldr	r3, [sp, #24]
    
    /* This is the capability table for VM userthd/intthd/intsig caps */
    RVM_LOG_SISUS("Init:Virtual machine userthd/intthd/intsig table size ",VM_Num*3," @ address 0x",*Kmem_Bump,".\r\n");
 801200c:	4437      	add	r7, r6
 801200e:	4892      	ldr	r0, [pc, #584]	; (8012258 <main+0xc58>)
    
    /* Create the high-level captbls for virtual machines */
    /* This is the capability table for VM captbl/process caps */
    RVM_LOG_SISUS("Init:Virtual machine process/captbl table size ",VM_Num*2," @ address 0x",*Kmem_Bump,".\r\n");
    RVM_ASSERT(RVM_Captbl_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VIRT_TBL_CAPPROC, *Kmem_Bump, VM_Num*2)==0);
    *Kmem_Bump+=RVM_CAPTBL_SIZE(VM_Num*2);
 8012010:	eb03 1386 	add.w	r3, r3, r6, lsl #6
 8012014:	9306      	str	r3, [sp, #24]
    
    /* This is the capability table for VM userthd/intthd/intsig caps */
    RVM_LOG_SISUS("Init:Virtual machine userthd/intthd/intsig table size ",VM_Num*3," @ address 0x",*Kmem_Bump,".\r\n");
 8012016:	f000 feab 	bl	8012d70 <RVM_Print_String>
 801201a:	4638      	mov	r0, r7
 801201c:	f000 fe16 	bl	8012c4c <RVM_Print_Int>
 8012020:	4885      	ldr	r0, [pc, #532]	; (8012238 <main+0xc38>)
 8012022:	f000 fea5 	bl	8012d70 <RVM_Print_String>
 8012026:	9806      	ldr	r0, [sp, #24]
 8012028:	f000 fe76 	bl	8012d18 <RVM_Print_Uint>
 801202c:	487e      	ldr	r0, [pc, #504]	; (8012228 <main+0xc28>)
 801202e:	f000 fe9f 	bl	8012d70 <RVM_Print_String>
    RVM_ASSERT(RVM_Captbl_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VIRT_TBL_THDSIG, *Kmem_Bump, VM_Num*3)==0);
 8012032:	9700      	str	r7, [sp, #0]
 8012034:	9b06      	ldr	r3, [sp, #24]
 8012036:	2209      	movs	r2, #9
 8012038:	2105      	movs	r1, #5
 801203a:	4620      	mov	r0, r4
 801203c:	f000 fea8 	bl	8012d90 <RVM_Captbl_Crt>
 8012040:	b1e0      	cbz	r0, 801207c <main+0xa7c>
 8012042:	487e      	ldr	r0, [pc, #504]	; (801223c <main+0xc3c>)
 8012044:	f000 fe94 	bl	8012d70 <RVM_Print_String>
 8012048:	487d      	ldr	r0, [pc, #500]	; (8012240 <main+0xc40>)
 801204a:	f000 fe91 	bl	8012d70 <RVM_Print_String>
 801204e:	487d      	ldr	r0, [pc, #500]	; (8012244 <main+0xc44>)
 8012050:	f000 fe8e 	bl	8012d70 <RVM_Print_String>
 8012054:	f44f 7088 	mov.w	r0, #272	; 0x110
 8012058:	f000 fdf8 	bl	8012c4c <RVM_Print_Int>
 801205c:	487a      	ldr	r0, [pc, #488]	; (8012248 <main+0xc48>)
 801205e:	f000 fe87 	bl	8012d70 <RVM_Print_String>
 8012062:	487a      	ldr	r0, [pc, #488]	; (801224c <main+0xc4c>)
 8012064:	f000 fe84 	bl	8012d70 <RVM_Print_String>
 8012068:	4879      	ldr	r0, [pc, #484]	; (8012250 <main+0xc50>)
 801206a:	f000 fe81 	bl	8012d70 <RVM_Print_String>
 801206e:	4879      	ldr	r0, [pc, #484]	; (8012254 <main+0xc54>)
 8012070:	f000 fe7e 	bl	8012d70 <RVM_Print_String>
 8012074:	4874      	ldr	r0, [pc, #464]	; (8012248 <main+0xc48>)
 8012076:	f000 fe7b 	bl	8012d70 <RVM_Print_String>
 801207a:	e7fe      	b.n	801207a <main+0xa7a>
    *Kmem_Bump+=RVM_CAPTBL_SIZE(VM_Num*3);
 801207c:	9b06      	ldr	r3, [sp, #24]
 801207e:	2260      	movs	r2, #96	; 0x60
    
    /* This is the capability table for VM pgtbl caps */
    RVM_LOG_SISUS("Init:Virtual machine pgtbl table size ",Pgtbl_Num," @ address 0x",*Kmem_Bump,".\r\n");
 8012080:	4876      	ldr	r0, [pc, #472]	; (801225c <main+0xc5c>)
    *Kmem_Bump+=RVM_CAPTBL_SIZE(VM_Num*2);
    
    /* This is the capability table for VM userthd/intthd/intsig caps */
    RVM_LOG_SISUS("Init:Virtual machine userthd/intthd/intsig table size ",VM_Num*3," @ address 0x",*Kmem_Bump,".\r\n");
    RVM_ASSERT(RVM_Captbl_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VIRT_TBL_THDSIG, *Kmem_Bump, VM_Num*3)==0);
    *Kmem_Bump+=RVM_CAPTBL_SIZE(VM_Num*3);
 8012082:	fb02 3606 	mla	r6, r2, r6, r3
 8012086:	9606      	str	r6, [sp, #24]
    
    /* This is the capability table for VM pgtbl caps */
    RVM_LOG_SISUS("Init:Virtual machine pgtbl table size ",Pgtbl_Num," @ address 0x",*Kmem_Bump,".\r\n");
 8012088:	f000 fe72 	bl	8012d70 <RVM_Print_String>
 801208c:	4628      	mov	r0, r5
 801208e:	f000 fddd 	bl	8012c4c <RVM_Print_Int>
 8012092:	4869      	ldr	r0, [pc, #420]	; (8012238 <main+0xc38>)
 8012094:	f000 fe6c 	bl	8012d70 <RVM_Print_String>
 8012098:	9806      	ldr	r0, [sp, #24]
 801209a:	f000 fe3d 	bl	8012d18 <RVM_Print_Uint>
 801209e:	4862      	ldr	r0, [pc, #392]	; (8012228 <main+0xc28>)
 80120a0:	f000 fe66 	bl	8012d70 <RVM_Print_String>
    RVM_ASSERT(RVM_Captbl_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VIRT_TBL_PGTBL, *Kmem_Bump, Pgtbl_Num)==0);
 80120a4:	9500      	str	r5, [sp, #0]
 80120a6:	9b06      	ldr	r3, [sp, #24]
 80120a8:	220a      	movs	r2, #10
 80120aa:	2105      	movs	r1, #5
 80120ac:	4620      	mov	r0, r4
 80120ae:	f000 fe6f 	bl	8012d90 <RVM_Captbl_Crt>
 80120b2:	2800      	cmp	r0, #0
 80120b4:	d13c      	bne.n	8012130 <main+0xb30>
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Pgtbl_Num);
 80120b6:	9b06      	ldr	r3, [sp, #24]
    
    /* Now load all the images */
    Image=(struct RVM_Image*)(*((rvm_ptr_t*)RVM_IMAGE_HEADER_START));
    Pgtbl_Bump=0;
 80120b8:	aa08      	add	r2, sp, #32
 80120ba:	9404      	str	r4, [sp, #16]
 80120bc:	4611      	mov	r1, r2
    *Kmem_Bump+=RVM_CAPTBL_SIZE(VM_Num*3);
    
    /* This is the capability table for VM pgtbl caps */
    RVM_LOG_SISUS("Init:Virtual machine pgtbl table size ",Pgtbl_Num," @ address 0x",*Kmem_Bump,".\r\n");
    RVM_ASSERT(RVM_Captbl_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VIRT_TBL_PGTBL, *Kmem_Bump, Pgtbl_Num)==0);
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Pgtbl_Num);
 80120be:	eb03 1345 	add.w	r3, r3, r5, lsl #5
    
    /* Now load all the images */
    Image=(struct RVM_Image*)(*((rvm_ptr_t*)RVM_IMAGE_HEADER_START));
 80120c2:	4a57      	ldr	r2, [pc, #348]	; (8012220 <main+0xc20>)
    Pgtbl_Bump=0;
 80120c4:	9403      	str	r4, [sp, #12]
    *Kmem_Bump+=RVM_CAPTBL_SIZE(VM_Num*3);
    
    /* This is the capability table for VM pgtbl caps */
    RVM_LOG_SISUS("Init:Virtual machine pgtbl table size ",Pgtbl_Num," @ address 0x",*Kmem_Bump,".\r\n");
    RVM_ASSERT(RVM_Captbl_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VIRT_TBL_PGTBL, *Kmem_Bump, Pgtbl_Num)==0);
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Pgtbl_Num);
 80120c6:	9306      	str	r3, [sp, #24]
    
    /* Now load all the images */
    Image=(struct RVM_Image*)(*((rvm_ptr_t*)RVM_IMAGE_HEADER_START));
 80120c8:	6815      	ldr	r5, [r2, #0]
    Pgtbl_Bump=0;
 80120ca:	460a      	mov	r2, r1
 80120cc:	f842 4d04 	str.w	r4, [r2, #-4]!
 80120d0:	9205      	str	r2, [sp, #20]
    
    Count=0;
    while(Image!=0)
 80120d2:	2d00      	cmp	r5, #0
 80120d4:	f000 8085 	beq.w	80121e2 <main+0xbe2>
{
    rvm_ptr_t Count;
    struct RVM_Virt* Virt;
    struct RVM_Hdr_Pgtbl* Pgtbl;

    RVM_LOG_S("-------------------------------------------------------------------------------\r\n");
 80120d8:	4861      	ldr	r0, [pc, #388]	; (8012260 <main+0xc60>)
 80120da:	f000 fe49 	bl	8012d70 <RVM_Print_String>

    /* Is the magic number correct? */
    if((*Image)->Magic==RVM_VM_MAGIC)
 80120de:	682b      	ldr	r3, [r5, #0]
 80120e0:	4a60      	ldr	r2, [pc, #384]	; (8012264 <main+0xc64>)
 80120e2:	4293      	cmp	r3, r2
 80120e4:	d041      	beq.n	801216a <main+0xb6a>
        RVM_LOG_SUS("Init:Found VM image header @ address 0x",(rvm_ptr_t)(*Image),".\r\n");
    else
    {
        RVM_LOG_SUS("Init:Found corrupted image header @ address 0x",(rvm_ptr_t)(*Image),".\r\n");
 80120e6:	4860      	ldr	r0, [pc, #384]	; (8012268 <main+0xc68>)
 80120e8:	f000 fe42 	bl	8012d70 <RVM_Print_String>
 80120ec:	4628      	mov	r0, r5
 80120ee:	f000 fe13 	bl	8012d18 <RVM_Print_Uint>
 80120f2:	484d      	ldr	r0, [pc, #308]	; (8012228 <main+0xc28>)
 80120f4:	f000 fe3c 	bl	8012d70 <RVM_Print_String>
        RVM_ASSERT(0);
 80120f8:	4850      	ldr	r0, [pc, #320]	; (801223c <main+0xc3c>)
 80120fa:	f000 fe39 	bl	8012d70 <RVM_Print_String>
 80120fe:	4850      	ldr	r0, [pc, #320]	; (8012240 <main+0xc40>)
 8012100:	f000 fe36 	bl	8012d70 <RVM_Print_String>
 8012104:	484f      	ldr	r0, [pc, #316]	; (8012244 <main+0xc44>)
 8012106:	f000 fe33 	bl	8012d70 <RVM_Print_String>
 801210a:	207d      	movs	r0, #125	; 0x7d
 801210c:	f000 fd9e 	bl	8012c4c <RVM_Print_Int>
 8012110:	484d      	ldr	r0, [pc, #308]	; (8012248 <main+0xc48>)
 8012112:	f000 fe2d 	bl	8012d70 <RVM_Print_String>
 8012116:	484d      	ldr	r0, [pc, #308]	; (801224c <main+0xc4c>)
 8012118:	f000 fe2a 	bl	8012d70 <RVM_Print_String>
 801211c:	484c      	ldr	r0, [pc, #304]	; (8012250 <main+0xc50>)
 801211e:	f000 fe27 	bl	8012d70 <RVM_Print_String>
 8012122:	484c      	ldr	r0, [pc, #304]	; (8012254 <main+0xc54>)
 8012124:	f000 fe24 	bl	8012d70 <RVM_Print_String>
 8012128:	4847      	ldr	r0, [pc, #284]	; (8012248 <main+0xc48>)
 801212a:	f000 fe21 	bl	8012d70 <RVM_Print_String>
 801212e:	e7fe      	b.n	801212e <main+0xb2e>
    RVM_ASSERT(RVM_Captbl_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VIRT_TBL_THDSIG, *Kmem_Bump, VM_Num*3)==0);
    *Kmem_Bump+=RVM_CAPTBL_SIZE(VM_Num*3);
    
    /* This is the capability table for VM pgtbl caps */
    RVM_LOG_SISUS("Init:Virtual machine pgtbl table size ",Pgtbl_Num," @ address 0x",*Kmem_Bump,".\r\n");
    RVM_ASSERT(RVM_Captbl_Crt(RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KMEM, RVM_VIRT_TBL_PGTBL, *Kmem_Bump, Pgtbl_Num)==0);
 8012130:	4842      	ldr	r0, [pc, #264]	; (801223c <main+0xc3c>)
 8012132:	f000 fe1d 	bl	8012d70 <RVM_Print_String>
 8012136:	4842      	ldr	r0, [pc, #264]	; (8012240 <main+0xc40>)
 8012138:	f000 fe1a 	bl	8012d70 <RVM_Print_String>
 801213c:	4841      	ldr	r0, [pc, #260]	; (8012244 <main+0xc44>)
 801213e:	f000 fe17 	bl	8012d70 <RVM_Print_String>
 8012142:	f240 1015 	movw	r0, #277	; 0x115
 8012146:	f000 fd81 	bl	8012c4c <RVM_Print_Int>
 801214a:	483f      	ldr	r0, [pc, #252]	; (8012248 <main+0xc48>)
 801214c:	f000 fe10 	bl	8012d70 <RVM_Print_String>
 8012150:	483e      	ldr	r0, [pc, #248]	; (801224c <main+0xc4c>)
 8012152:	f000 fe0d 	bl	8012d70 <RVM_Print_String>
 8012156:	483e      	ldr	r0, [pc, #248]	; (8012250 <main+0xc50>)
 8012158:	f000 fe0a 	bl	8012d70 <RVM_Print_String>
 801215c:	483d      	ldr	r0, [pc, #244]	; (8012254 <main+0xc54>)
 801215e:	f000 fe07 	bl	8012d70 <RVM_Print_String>
 8012162:	4839      	ldr	r0, [pc, #228]	; (8012248 <main+0xc48>)
 8012164:	f000 fe04 	bl	8012d70 <RVM_Print_String>
 8012168:	e7fe      	b.n	8012168 <main+0xb68>

    RVM_LOG_S("-------------------------------------------------------------------------------\r\n");

    /* Is the magic number correct? */
    if((*Image)->Magic==RVM_VM_MAGIC)
        RVM_LOG_SUS("Init:Found VM image header @ address 0x",(rvm_ptr_t)(*Image),".\r\n");
 801216a:	4840      	ldr	r0, [pc, #256]	; (801226c <main+0xc6c>)
 801216c:	f000 fe00 	bl	8012d70 <RVM_Print_String>
 8012170:	4628      	mov	r0, r5
 8012172:	f000 fdd1 	bl	8012d18 <RVM_Print_Uint>
 8012176:	482c      	ldr	r0, [pc, #176]	; (8012228 <main+0xc28>)
 8012178:	f000 fdfa 	bl	8012d70 <RVM_Print_String>
        RVM_LOG_SUS("Init:Found corrupted image header @ address 0x",(rvm_ptr_t)(*Image),".\r\n");
        RVM_ASSERT(0);
    }

    /* Allocate one structure */
    if(RVM_Free.Next==&RVM_Free)
 801217c:	4b3c      	ldr	r3, [pc, #240]	; (8012270 <main+0xc70>)
 801217e:	685c      	ldr	r4, [r3, #4]
 8012180:	429c      	cmp	r4, r3
 8012182:	f000 80a4 	beq.w	80122ce <main+0xcce>
    {
        RVM_LOG_S("Init:Virtual machine control block exhausted.\r\n");
        RVM_ASSERT(0);
    }
    Virt=(struct RVM_Virt*)(RVM_Free.Next);
    RVM_List_Del(Virt->Head.Prev,Virt->Head.Next);
 8012186:	e894 0003 	ldmia.w	r4, {r0, r1}
 801218a:	f000 fd55 	bl	8012c38 <RVM_List_Del>
    
    /* Fill in the process structure */
    Virt->Image=*Image;

    /* Setup the pgtbl - only log the top level in the database */
    Virt->Cap.Pgtbl=RVM_CAPID(RVM_VIRT_TBL_PGTBL,*Pgtbl_Bump);
 801218e:	9a07      	ldr	r2, [sp, #28]
    }
    Virt=(struct RVM_Virt*)(RVM_Free.Next);
    RVM_List_Del(Virt->Head.Prev,Virt->Head.Next);
    
    /* Fill in the process structure */
    Virt->Image=*Image;
 8012190:	6125      	str	r5, [r4, #16]
    Virt->Cap.Pgtbl=RVM_CAPID(RVM_VIRT_TBL_PGTBL,*Pgtbl_Bump);
    Pgtbl=(struct RVM_Hdr_Pgtbl*)((*Image)->Pgtbl);
    
    /* Do some checks here to make sure that the page table fits our needs - critical memory is all mapped in */
    /* Check user thread entry address&user stack */
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->User_Entry,4)==0);
 8012192:	2304      	movs	r3, #4
    
    /* Fill in the process structure */
    Virt->Image=*Image;

    /* Setup the pgtbl - only log the top level in the database */
    Virt->Cap.Pgtbl=RVM_CAPID(RVM_VIRT_TBL_PGTBL,*Pgtbl_Bump);
 8012194:	f442 6228 	orr.w	r2, r2, #2688	; 0xa80
 8012198:	61e2      	str	r2, [r4, #28]
    Pgtbl=(struct RVM_Hdr_Pgtbl*)((*Image)->Pgtbl);
 801219a:	6d2e      	ldr	r6, [r5, #80]	; 0x50
    
    /* Do some checks here to make sure that the page table fits our needs - critical memory is all mapped in */
    /* Check user thread entry address&user stack */
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->User_Entry,4)==0);
 801219c:	696a      	ldr	r2, [r5, #20]
 801219e:	4630      	mov	r0, r6
 80121a0:	6ce9      	ldr	r1, [r5, #76]	; 0x4c
 80121a2:	f7fe fa07 	bl	80105b4 <_RVM_Pgtbl_Check>
 80121a6:	2800      	cmp	r0, #0
 80121a8:	d06c      	beq.n	8012284 <main+0xc84>
 80121aa:	4824      	ldr	r0, [pc, #144]	; (801223c <main+0xc3c>)
 80121ac:	f000 fde0 	bl	8012d70 <RVM_Print_String>
 80121b0:	4823      	ldr	r0, [pc, #140]	; (8012240 <main+0xc40>)
 80121b2:	f000 fddd 	bl	8012d70 <RVM_Print_String>
 80121b6:	4823      	ldr	r0, [pc, #140]	; (8012244 <main+0xc44>)
 80121b8:	f000 fdda 	bl	8012d70 <RVM_Print_String>
 80121bc:	2092      	movs	r0, #146	; 0x92
 80121be:	f000 fd45 	bl	8012c4c <RVM_Print_Int>
 80121c2:	4821      	ldr	r0, [pc, #132]	; (8012248 <main+0xc48>)
 80121c4:	f000 fdd4 	bl	8012d70 <RVM_Print_String>
 80121c8:	4820      	ldr	r0, [pc, #128]	; (801224c <main+0xc4c>)
 80121ca:	f000 fdd1 	bl	8012d70 <RVM_Print_String>
 80121ce:	4820      	ldr	r0, [pc, #128]	; (8012250 <main+0xc50>)
 80121d0:	f000 fdce 	bl	8012d70 <RVM_Print_String>
 80121d4:	481f      	ldr	r0, [pc, #124]	; (8012254 <main+0xc54>)
 80121d6:	f000 fdcb 	bl	8012d70 <RVM_Print_String>
 80121da:	481b      	ldr	r0, [pc, #108]	; (8012248 <main+0xc48>)
 80121dc:	f000 fdc8 	bl	8012d70 <RVM_Print_String>
 80121e0:	e7fe      	b.n	80121e0 <main+0xbe0>
    RVM_Daemon_Init(&Kmem_Bump);
    RVM_LOG_S("Init:Daemon initialization done.\r\n");
    
    /* Initialize the virtual machine databases, and create whatever is needed */
    RVM_VM_Init(&Kmem_Bump);
    RVM_LOG_S("Init:Virtual machine image initialization done.\r\n");
 80121e2:	4824      	ldr	r0, [pc, #144]	; (8012274 <main+0xc74>)
 80121e4:	f000 fdc4 	bl	8012d70 <RVM_Print_String>
    
    /* Now pick a virtual machine to run */
    RVM_Cur_Virt=_RVM_Get_High_Rdy();
 80121e8:	f7fe fa06 	bl	80105f8 <_RVM_Get_High_Rdy>
 80121ec:	4603      	mov	r3, r0
 80121ee:	4a22      	ldr	r2, [pc, #136]	; (8012278 <main+0xc78>)
    _RVM_Virt_Switch(0,RVM_Cur_Virt);
 80121f0:	4628      	mov	r0, r5
 80121f2:	4619      	mov	r1, r3
    /* Initialize the virtual machine databases, and create whatever is needed */
    RVM_VM_Init(&Kmem_Bump);
    RVM_LOG_S("Init:Virtual machine image initialization done.\r\n");
    
    /* Now pick a virtual machine to run */
    RVM_Cur_Virt=_RVM_Get_High_Rdy();
 80121f4:	6013      	str	r3, [r2, #0]
    _RVM_Virt_Switch(0,RVM_Cur_Virt);
 80121f6:	f7fe fa0f 	bl	8010618 <_RVM_Virt_Switch>
    
    /* Put our priority to the lowest in system - this should get everything else running */
    RVM_LOG_S("Init:Job finished - lowering priority.\r\n");
 80121fa:	4820      	ldr	r0, [pc, #128]	; (801227c <main+0xc7c>)
 80121fc:	f000 fdb8 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_S("-------------------------------------------------------------------------------\r\n\r\n");
 8012200:	481f      	ldr	r0, [pc, #124]	; (8012280 <main+0xc80>)
 8012202:	f000 fdb5 	bl	8012d70 <RVM_Print_String>
    RVM_ASSERT(RVM_Thd_Sched_Prio(RVM_BOOT_INIT_THD, RVM_INIT_PRIO)==0);
 8012206:	2101      	movs	r1, #1
 8012208:	2003      	movs	r0, #3
 801220a:	f000 fe59 	bl	8012ec0 <RVM_Thd_Sched_Prio>
 801220e:	2800      	cmp	r0, #0
 8012210:	d17c      	bne.n	801230c <main+0xd0c>
    while(1)
    {
        /* Receive the scheduler notifications for the interrupt threads. If any of
         * them failed, then we just panic, because none of them are supposed to fail. */
        /* RVM_LOG_S("I"); */
        RVM_Idle();
 8012212:	f7fe f9d1 	bl	80105b8 <RVM_Idle>
 8012216:	e7fc      	b.n	8012212 <main+0xc12>
 8012218:	080136f8 	.word	0x080136f8
 801221c:	0801372c 	.word	0x0801372c
 8012220:	08020000 	.word	0x08020000
 8012224:	08013750 	.word	0x08013750
 8012228:	0801314c 	.word	0x0801314c
 801222c:	0801376c 	.word	0x0801376c
 8012230:	08013790 	.word	0x08013790
 8012234:	080137b0 	.word	0x080137b0
 8012238:	08013584 	.word	0x08013584
 801223c:	08012f08 	.word	0x08012f08
 8012240:	08013090 	.word	0x08013090
 8012244:	08012fa4 	.word	0x08012fa4
 8012248:	080134b0 	.word	0x080134b0
 801224c:	08012fac 	.word	0x08012fac
 8012250:	08012fb8 	.word	0x08012fb8
 8012254:	080130e4 	.word	0x080130e4
 8012258:	080137e0 	.word	0x080137e0
 801225c:	08013818 	.word	0x08013818
 8012260:	080131a0 	.word	0x080131a0
 8012264:	56495254 	.word	0x56495254
 8012268:	08013868 	.word	0x08013868
 801226c:	08013840 	.word	0x08013840
 8012270:	2001ea54 	.word	0x2001ea54
 8012274:	08013a90 	.word	0x08013a90
 8012278:	2001ea60 	.word	0x2001ea60
 801227c:	08013ac4 	.word	0x08013ac4
 8012280:	08013af0 	.word	0x08013af0
    Pgtbl=(struct RVM_Hdr_Pgtbl*)((*Image)->Pgtbl);
    
    /* Do some checks here to make sure that the page table fits our needs - critical memory is all mapped in */
    /* Check user thread entry address&user stack */
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->User_Entry,4)==0);
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->User_Stack,Virt->Image->User_Size)==0);
 8012284:	6920      	ldr	r0, [r4, #16]
 8012286:	69c3      	ldr	r3, [r0, #28]
 8012288:	6982      	ldr	r2, [r0, #24]
 801228a:	6cc1      	ldr	r1, [r0, #76]	; 0x4c
 801228c:	6d00      	ldr	r0, [r0, #80]	; 0x50
 801228e:	f7fe f991 	bl	80105b4 <_RVM_Pgtbl_Check>
 8012292:	2800      	cmp	r0, #0
 8012294:	d057      	beq.n	8012346 <main+0xd46>
 8012296:	48ad      	ldr	r0, [pc, #692]	; (801254c <main+0xf4c>)
 8012298:	f000 fd6a 	bl	8012d70 <RVM_Print_String>
 801229c:	48ac      	ldr	r0, [pc, #688]	; (8012550 <main+0xf50>)
 801229e:	f000 fd67 	bl	8012d70 <RVM_Print_String>
 80122a2:	48ac      	ldr	r0, [pc, #688]	; (8012554 <main+0xf54>)
 80122a4:	f000 fd64 	bl	8012d70 <RVM_Print_String>
 80122a8:	2093      	movs	r0, #147	; 0x93
 80122aa:	f000 fccf 	bl	8012c4c <RVM_Print_Int>
 80122ae:	48aa      	ldr	r0, [pc, #680]	; (8012558 <main+0xf58>)
 80122b0:	f000 fd5e 	bl	8012d70 <RVM_Print_String>
 80122b4:	48a9      	ldr	r0, [pc, #676]	; (801255c <main+0xf5c>)
 80122b6:	f000 fd5b 	bl	8012d70 <RVM_Print_String>
 80122ba:	48a9      	ldr	r0, [pc, #676]	; (8012560 <main+0xf60>)
 80122bc:	f000 fd58 	bl	8012d70 <RVM_Print_String>
 80122c0:	48a8      	ldr	r0, [pc, #672]	; (8012564 <main+0xf64>)
 80122c2:	f000 fd55 	bl	8012d70 <RVM_Print_String>
 80122c6:	48a4      	ldr	r0, [pc, #656]	; (8012558 <main+0xf58>)
 80122c8:	f000 fd52 	bl	8012d70 <RVM_Print_String>
 80122cc:	e7fe      	b.n	80122cc <main+0xccc>
    }

    /* Allocate one structure */
    if(RVM_Free.Next==&RVM_Free)
    {
        RVM_LOG_S("Init:Virtual machine control block exhausted.\r\n");
 80122ce:	48a6      	ldr	r0, [pc, #664]	; (8012568 <main+0xf68>)
 80122d0:	f000 fd4e 	bl	8012d70 <RVM_Print_String>
        RVM_ASSERT(0);
 80122d4:	489d      	ldr	r0, [pc, #628]	; (801254c <main+0xf4c>)
 80122d6:	f000 fd4b 	bl	8012d70 <RVM_Print_String>
 80122da:	489d      	ldr	r0, [pc, #628]	; (8012550 <main+0xf50>)
 80122dc:	f000 fd48 	bl	8012d70 <RVM_Print_String>
 80122e0:	489c      	ldr	r0, [pc, #624]	; (8012554 <main+0xf54>)
 80122e2:	f000 fd45 	bl	8012d70 <RVM_Print_String>
 80122e6:	2084      	movs	r0, #132	; 0x84
 80122e8:	f000 fcb0 	bl	8012c4c <RVM_Print_Int>
 80122ec:	489a      	ldr	r0, [pc, #616]	; (8012558 <main+0xf58>)
 80122ee:	f000 fd3f 	bl	8012d70 <RVM_Print_String>
 80122f2:	489a      	ldr	r0, [pc, #616]	; (801255c <main+0xf5c>)
 80122f4:	f000 fd3c 	bl	8012d70 <RVM_Print_String>
 80122f8:	4899      	ldr	r0, [pc, #612]	; (8012560 <main+0xf60>)
 80122fa:	f000 fd39 	bl	8012d70 <RVM_Print_String>
 80122fe:	4899      	ldr	r0, [pc, #612]	; (8012564 <main+0xf64>)
 8012300:	f000 fd36 	bl	8012d70 <RVM_Print_String>
 8012304:	4894      	ldr	r0, [pc, #592]	; (8012558 <main+0xf58>)
 8012306:	f000 fd33 	bl	8012d70 <RVM_Print_String>
 801230a:	e7fe      	b.n	801230a <main+0xd0a>
    _RVM_Virt_Switch(0,RVM_Cur_Virt);
    
    /* Put our priority to the lowest in system - this should get everything else running */
    RVM_LOG_S("Init:Job finished - lowering priority.\r\n");
    RVM_LOG_S("-------------------------------------------------------------------------------\r\n\r\n");
    RVM_ASSERT(RVM_Thd_Sched_Prio(RVM_BOOT_INIT_THD, RVM_INIT_PRIO)==0);
 801230c:	488f      	ldr	r0, [pc, #572]	; (801254c <main+0xf4c>)
 801230e:	f000 fd2f 	bl	8012d70 <RVM_Print_String>
 8012312:	488f      	ldr	r0, [pc, #572]	; (8012550 <main+0xf50>)
 8012314:	f000 fd2c 	bl	8012d70 <RVM_Print_String>
 8012318:	488e      	ldr	r0, [pc, #568]	; (8012554 <main+0xf54>)
 801231a:	f000 fd29 	bl	8012d70 <RVM_Print_String>
 801231e:	f240 3055 	movw	r0, #853	; 0x355
 8012322:	f000 fc93 	bl	8012c4c <RVM_Print_Int>
 8012326:	488c      	ldr	r0, [pc, #560]	; (8012558 <main+0xf58>)
 8012328:	f000 fd22 	bl	8012d70 <RVM_Print_String>
 801232c:	488b      	ldr	r0, [pc, #556]	; (801255c <main+0xf5c>)
 801232e:	f000 fd1f 	bl	8012d70 <RVM_Print_String>
 8012332:	488b      	ldr	r0, [pc, #556]	; (8012560 <main+0xf60>)
 8012334:	f000 fd1c 	bl	8012d70 <RVM_Print_String>
 8012338:	488a      	ldr	r0, [pc, #552]	; (8012564 <main+0xf64>)
 801233a:	f000 fd19 	bl	8012d70 <RVM_Print_String>
 801233e:	4886      	ldr	r0, [pc, #536]	; (8012558 <main+0xf58>)
 8012340:	f000 fd16 	bl	8012d70 <RVM_Print_String>
 8012344:	e7fe      	b.n	8012344 <main+0xd44>
    /* Do some checks here to make sure that the page table fits our needs - critical memory is all mapped in */
    /* Check user thread entry address&user stack */
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->User_Entry,4)==0);
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->User_Stack,Virt->Image->User_Size)==0);
    /* Check interrupt thread entry address & interrupt stack */
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->Int_Entry,4)==0);
 8012346:	6920      	ldr	r0, [r4, #16]
 8012348:	2304      	movs	r3, #4
 801234a:	6a02      	ldr	r2, [r0, #32]
 801234c:	6cc1      	ldr	r1, [r0, #76]	; 0x4c
 801234e:	6d00      	ldr	r0, [r0, #80]	; 0x50
 8012350:	f7fe f930 	bl	80105b4 <_RVM_Pgtbl_Check>
 8012354:	b1d8      	cbz	r0, 801238e <main+0xd8e>
 8012356:	487d      	ldr	r0, [pc, #500]	; (801254c <main+0xf4c>)
 8012358:	f000 fd0a 	bl	8012d70 <RVM_Print_String>
 801235c:	487c      	ldr	r0, [pc, #496]	; (8012550 <main+0xf50>)
 801235e:	f000 fd07 	bl	8012d70 <RVM_Print_String>
 8012362:	487c      	ldr	r0, [pc, #496]	; (8012554 <main+0xf54>)
 8012364:	f000 fd04 	bl	8012d70 <RVM_Print_String>
 8012368:	2095      	movs	r0, #149	; 0x95
 801236a:	f000 fc6f 	bl	8012c4c <RVM_Print_Int>
 801236e:	487a      	ldr	r0, [pc, #488]	; (8012558 <main+0xf58>)
 8012370:	f000 fcfe 	bl	8012d70 <RVM_Print_String>
 8012374:	4879      	ldr	r0, [pc, #484]	; (801255c <main+0xf5c>)
 8012376:	f000 fcfb 	bl	8012d70 <RVM_Print_String>
 801237a:	4879      	ldr	r0, [pc, #484]	; (8012560 <main+0xf60>)
 801237c:	f000 fcf8 	bl	8012d70 <RVM_Print_String>
 8012380:	4878      	ldr	r0, [pc, #480]	; (8012564 <main+0xf64>)
 8012382:	f000 fcf5 	bl	8012d70 <RVM_Print_String>
 8012386:	4874      	ldr	r0, [pc, #464]	; (8012558 <main+0xf58>)
 8012388:	f000 fcf2 	bl	8012d70 <RVM_Print_String>
 801238c:	e7fe      	b.n	801238c <main+0xd8c>
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->Int_Stack,Virt->Image->Int_Size)==0);
 801238e:	6920      	ldr	r0, [r4, #16]
 8012390:	6a83      	ldr	r3, [r0, #40]	; 0x28
 8012392:	6a42      	ldr	r2, [r0, #36]	; 0x24
 8012394:	6cc1      	ldr	r1, [r0, #76]	; 0x4c
 8012396:	6d00      	ldr	r0, [r0, #80]	; 0x50
 8012398:	f7fe f90c 	bl	80105b4 <_RVM_Pgtbl_Check>
 801239c:	b1d8      	cbz	r0, 80123d6 <main+0xdd6>
 801239e:	486b      	ldr	r0, [pc, #428]	; (801254c <main+0xf4c>)
 80123a0:	f000 fce6 	bl	8012d70 <RVM_Print_String>
 80123a4:	486a      	ldr	r0, [pc, #424]	; (8012550 <main+0xf50>)
 80123a6:	f000 fce3 	bl	8012d70 <RVM_Print_String>
 80123aa:	486a      	ldr	r0, [pc, #424]	; (8012554 <main+0xf54>)
 80123ac:	f000 fce0 	bl	8012d70 <RVM_Print_String>
 80123b0:	2096      	movs	r0, #150	; 0x96
 80123b2:	f000 fc4b 	bl	8012c4c <RVM_Print_Int>
 80123b6:	4868      	ldr	r0, [pc, #416]	; (8012558 <main+0xf58>)
 80123b8:	f000 fcda 	bl	8012d70 <RVM_Print_String>
 80123bc:	4867      	ldr	r0, [pc, #412]	; (801255c <main+0xf5c>)
 80123be:	f000 fcd7 	bl	8012d70 <RVM_Print_String>
 80123c2:	4867      	ldr	r0, [pc, #412]	; (8012560 <main+0xf60>)
 80123c4:	f000 fcd4 	bl	8012d70 <RVM_Print_String>
 80123c8:	4866      	ldr	r0, [pc, #408]	; (8012564 <main+0xf64>)
 80123ca:	f000 fcd1 	bl	8012d70 <RVM_Print_String>
 80123ce:	4862      	ldr	r0, [pc, #392]	; (8012558 <main+0xf58>)
 80123d0:	f000 fcce 	bl	8012d70 <RVM_Print_String>
 80123d4:	e7fe      	b.n	80123d4 <main+0xdd4>
    /* Check parameter, register & interrupt flag space */
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->Param,sizeof(struct RVM_Param))==0);
 80123d6:	6920      	ldr	r0, [r4, #16]
 80123d8:	2314      	movs	r3, #20
 80123da:	6ac2      	ldr	r2, [r0, #44]	; 0x2c
 80123dc:	6cc1      	ldr	r1, [r0, #76]	; 0x4c
 80123de:	6d00      	ldr	r0, [r0, #80]	; 0x50
 80123e0:	f7fe f8e8 	bl	80105b4 <_RVM_Pgtbl_Check>
 80123e4:	b1d8      	cbz	r0, 801241e <main+0xe1e>
 80123e6:	4859      	ldr	r0, [pc, #356]	; (801254c <main+0xf4c>)
 80123e8:	f000 fcc2 	bl	8012d70 <RVM_Print_String>
 80123ec:	4858      	ldr	r0, [pc, #352]	; (8012550 <main+0xf50>)
 80123ee:	f000 fcbf 	bl	8012d70 <RVM_Print_String>
 80123f2:	4858      	ldr	r0, [pc, #352]	; (8012554 <main+0xf54>)
 80123f4:	f000 fcbc 	bl	8012d70 <RVM_Print_String>
 80123f8:	2098      	movs	r0, #152	; 0x98
 80123fa:	f000 fc27 	bl	8012c4c <RVM_Print_Int>
 80123fe:	4856      	ldr	r0, [pc, #344]	; (8012558 <main+0xf58>)
 8012400:	f000 fcb6 	bl	8012d70 <RVM_Print_String>
 8012404:	4855      	ldr	r0, [pc, #340]	; (801255c <main+0xf5c>)
 8012406:	f000 fcb3 	bl	8012d70 <RVM_Print_String>
 801240a:	4855      	ldr	r0, [pc, #340]	; (8012560 <main+0xf60>)
 801240c:	f000 fcb0 	bl	8012d70 <RVM_Print_String>
 8012410:	4854      	ldr	r0, [pc, #336]	; (8012564 <main+0xf64>)
 8012412:	f000 fcad 	bl	8012d70 <RVM_Print_String>
 8012416:	4850      	ldr	r0, [pc, #320]	; (8012558 <main+0xf58>)
 8012418:	f000 fcaa 	bl	8012d70 <RVM_Print_String>
 801241c:	e7fe      	b.n	801241c <main+0xe1c>
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->Regs,sizeof(struct RVM_Regs))==0);
 801241e:	6920      	ldr	r0, [r4, #16]
 8012420:	2368      	movs	r3, #104	; 0x68
 8012422:	6b02      	ldr	r2, [r0, #48]	; 0x30
 8012424:	6cc1      	ldr	r1, [r0, #76]	; 0x4c
 8012426:	6d00      	ldr	r0, [r0, #80]	; 0x50
 8012428:	f7fe f8c4 	bl	80105b4 <_RVM_Pgtbl_Check>
 801242c:	b1d8      	cbz	r0, 8012466 <main+0xe66>
 801242e:	4847      	ldr	r0, [pc, #284]	; (801254c <main+0xf4c>)
 8012430:	f000 fc9e 	bl	8012d70 <RVM_Print_String>
 8012434:	4846      	ldr	r0, [pc, #280]	; (8012550 <main+0xf50>)
 8012436:	f000 fc9b 	bl	8012d70 <RVM_Print_String>
 801243a:	4846      	ldr	r0, [pc, #280]	; (8012554 <main+0xf54>)
 801243c:	f000 fc98 	bl	8012d70 <RVM_Print_String>
 8012440:	2099      	movs	r0, #153	; 0x99
 8012442:	f000 fc03 	bl	8012c4c <RVM_Print_Int>
 8012446:	4844      	ldr	r0, [pc, #272]	; (8012558 <main+0xf58>)
 8012448:	f000 fc92 	bl	8012d70 <RVM_Print_String>
 801244c:	4843      	ldr	r0, [pc, #268]	; (801255c <main+0xf5c>)
 801244e:	f000 fc8f 	bl	8012d70 <RVM_Print_String>
 8012452:	4843      	ldr	r0, [pc, #268]	; (8012560 <main+0xf60>)
 8012454:	f000 fc8c 	bl	8012d70 <RVM_Print_String>
 8012458:	4842      	ldr	r0, [pc, #264]	; (8012564 <main+0xf64>)
 801245a:	f000 fc89 	bl	8012d70 <RVM_Print_String>
 801245e:	483e      	ldr	r0, [pc, #248]	; (8012558 <main+0xf58>)
 8012460:	f000 fc86 	bl	8012d70 <RVM_Print_String>
 8012464:	e7fe      	b.n	8012464 <main+0xe64>
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->Int_Flags,sizeof(rvm_ptr_t)*RVM_VECT_BITMAP(Virt->Image->Int_Num))==0);
 8012466:	6920      	ldr	r0, [r4, #16]
 8012468:	6c43      	ldr	r3, [r0, #68]	; 0x44
 801246a:	6c82      	ldr	r2, [r0, #72]	; 0x48
 801246c:	3b01      	subs	r3, #1
 801246e:	6cc1      	ldr	r1, [r0, #76]	; 0x4c
 8012470:	6d00      	ldr	r0, [r0, #80]	; 0x50
 8012472:	095b      	lsrs	r3, r3, #5
 8012474:	3301      	adds	r3, #1
 8012476:	009b      	lsls	r3, r3, #2
 8012478:	f7fe f89c 	bl	80105b4 <_RVM_Pgtbl_Check>
 801247c:	b1d8      	cbz	r0, 80124b6 <main+0xeb6>
 801247e:	4833      	ldr	r0, [pc, #204]	; (801254c <main+0xf4c>)
 8012480:	f000 fc76 	bl	8012d70 <RVM_Print_String>
 8012484:	4832      	ldr	r0, [pc, #200]	; (8012550 <main+0xf50>)
 8012486:	f000 fc73 	bl	8012d70 <RVM_Print_String>
 801248a:	4832      	ldr	r0, [pc, #200]	; (8012554 <main+0xf54>)
 801248c:	f000 fc70 	bl	8012d70 <RVM_Print_String>
 8012490:	209a      	movs	r0, #154	; 0x9a
 8012492:	f000 fbdb 	bl	8012c4c <RVM_Print_Int>
 8012496:	4830      	ldr	r0, [pc, #192]	; (8012558 <main+0xf58>)
 8012498:	f000 fc6a 	bl	8012d70 <RVM_Print_String>
 801249c:	482f      	ldr	r0, [pc, #188]	; (801255c <main+0xf5c>)
 801249e:	f000 fc67 	bl	8012d70 <RVM_Print_String>
 80124a2:	482f      	ldr	r0, [pc, #188]	; (8012560 <main+0xf60>)
 80124a4:	f000 fc64 	bl	8012d70 <RVM_Print_String>
 80124a8:	482e      	ldr	r0, [pc, #184]	; (8012564 <main+0xf64>)
 80124aa:	f000 fc61 	bl	8012d70 <RVM_Print_String>
 80124ae:	482a      	ldr	r0, [pc, #168]	; (8012558 <main+0xf58>)
 80124b0:	f000 fc5e 	bl	8012d70 <RVM_Print_String>
 80124b4:	e7fe      	b.n	80124b4 <main+0xeb4>
    /* Check console space */
    RVM_ASSERT(_RVM_Pgtbl_Check(Virt->Image->Pgtbl,Virt->Image->Pgtbl_Num,Virt->Image->Console_Buf,Virt->Image->Console_Size)==0);
 80124b6:	6920      	ldr	r0, [r4, #16]
 80124b8:	6bc3      	ldr	r3, [r0, #60]	; 0x3c
 80124ba:	6c02      	ldr	r2, [r0, #64]	; 0x40
 80124bc:	6cc1      	ldr	r1, [r0, #76]	; 0x4c
 80124be:	6d00      	ldr	r0, [r0, #80]	; 0x50
 80124c0:	f7fe f878 	bl	80105b4 <_RVM_Pgtbl_Check>
 80124c4:	4607      	mov	r7, r0
 80124c6:	b1d8      	cbz	r0, 8012500 <main+0xf00>
 80124c8:	4820      	ldr	r0, [pc, #128]	; (801254c <main+0xf4c>)
 80124ca:	f000 fc51 	bl	8012d70 <RVM_Print_String>
 80124ce:	4820      	ldr	r0, [pc, #128]	; (8012550 <main+0xf50>)
 80124d0:	f000 fc4e 	bl	8012d70 <RVM_Print_String>
 80124d4:	481f      	ldr	r0, [pc, #124]	; (8012554 <main+0xf54>)
 80124d6:	f000 fc4b 	bl	8012d70 <RVM_Print_String>
 80124da:	209c      	movs	r0, #156	; 0x9c
 80124dc:	f000 fbb6 	bl	8012c4c <RVM_Print_Int>
 80124e0:	481d      	ldr	r0, [pc, #116]	; (8012558 <main+0xf58>)
 80124e2:	f000 fc45 	bl	8012d70 <RVM_Print_String>
 80124e6:	481d      	ldr	r0, [pc, #116]	; (801255c <main+0xf5c>)
 80124e8:	f000 fc42 	bl	8012d70 <RVM_Print_String>
 80124ec:	481c      	ldr	r0, [pc, #112]	; (8012560 <main+0xf60>)
 80124ee:	f000 fc3f 	bl	8012d70 <RVM_Print_String>
 80124f2:	481c      	ldr	r0, [pc, #112]	; (8012564 <main+0xf64>)
 80124f4:	f000 fc3c 	bl	8012d70 <RVM_Print_String>
 80124f8:	4817      	ldr	r0, [pc, #92]	; (8012558 <main+0xf58>)
 80124fa:	f000 fc39 	bl	8012d70 <RVM_Print_String>
 80124fe:	e7fe      	b.n	80124fe <main+0xefe>
    RVM_LOG_S("Init:Virtual machine system shared memory mapping check complete.\r\n");
 8012500:	481a      	ldr	r0, [pc, #104]	; (801256c <main+0xf6c>)
 8012502:	f000 fc35 	bl	8012d70 <RVM_Print_String>
    /* Clean up the interrupt flag space */
    RVM_Clear(Virt->Image->Int_Flags,sizeof(rvm_ptr_t)*RVM_VECT_BITMAP(Virt->Image->Int_Num));
 8012506:	6922      	ldr	r2, [r4, #16]
 8012508:	6c53      	ldr	r3, [r2, #68]	; 0x44
 801250a:	6c92      	ldr	r2, [r2, #72]	; 0x48
 801250c:	3b01      	subs	r3, #1
 801250e:	095b      	lsrs	r3, r3, #5
 8012510:	3301      	adds	r3, #1
 8012512:	eb02 0383 	add.w	r3, r2, r3, lsl #2
    
    /* On processors not that fast, copy by word is really important */
    Word_Inc=(rvm_ptr_t*)Addr;
    for(Words=Size/sizeof(rvm_ptr_t);Words>0;Words--)
    {
        *Word_Inc=0;
 8012516:	f842 7b04 	str.w	r7, [r2], #4
    rvm_ptr_t Words;
    rvm_ptr_t Bytes;
    
    /* On processors not that fast, copy by word is really important */
    Word_Inc=(rvm_ptr_t*)Addr;
    for(Words=Size/sizeof(rvm_ptr_t);Words>0;Words--)
 801251a:	4293      	cmp	r3, r2
 801251c:	d1fb      	bne.n	8012516 <main+0xf16>
 801251e:	2700      	movs	r7, #0
    /* Clean up the interrupt flag space */
    RVM_Clear(Virt->Image->Int_Flags,sizeof(rvm_ptr_t)*RVM_VECT_BITMAP(Virt->Image->Int_Num));
    
    /* Actually do the page table setup */
    for(Count=0;Count<Virt->Image->Pgtbl_Num;Count++)
        _RVM_Pgtbl_Setup(Pgtbl, Count, RVM_VIRT_TBL_PGTBL, Pgtbl_Bump, RVM_BOOT_INIT_KMEM, Kmem_Bump);
 8012520:	f04f 0805 	mov.w	r8, #5
 8012524:	46a9      	mov	r9, r5
    RVM_LOG_S("Init:Virtual machine system shared memory mapping check complete.\r\n");
    /* Clean up the interrupt flag space */
    RVM_Clear(Virt->Image->Int_Flags,sizeof(rvm_ptr_t)*RVM_VECT_BITMAP(Virt->Image->Int_Num));
    
    /* Actually do the page table setup */
    for(Count=0;Count<Virt->Image->Pgtbl_Num;Count++)
 8012526:	6920      	ldr	r0, [r4, #16]
        _RVM_Pgtbl_Setup(Pgtbl, Count, RVM_VIRT_TBL_PGTBL, Pgtbl_Bump, RVM_BOOT_INIT_KMEM, Kmem_Bump);
 8012528:	4639      	mov	r1, r7
 801252a:	9b05      	ldr	r3, [sp, #20]
 801252c:	220a      	movs	r2, #10
    RVM_LOG_S("Init:Virtual machine system shared memory mapping check complete.\r\n");
    /* Clean up the interrupt flag space */
    RVM_Clear(Virt->Image->Int_Flags,sizeof(rvm_ptr_t)*RVM_VECT_BITMAP(Virt->Image->Int_Num));
    
    /* Actually do the page table setup */
    for(Count=0;Count<Virt->Image->Pgtbl_Num;Count++)
 801252e:	f8d0 e04c 	ldr.w	lr, [r0, #76]	; 0x4c
        _RVM_Pgtbl_Setup(Pgtbl, Count, RVM_VIRT_TBL_PGTBL, Pgtbl_Bump, RVM_BOOT_INIT_KMEM, Kmem_Bump);
 8012532:	4630      	mov	r0, r6
    RVM_LOG_S("Init:Virtual machine system shared memory mapping check complete.\r\n");
    /* Clean up the interrupt flag space */
    RVM_Clear(Virt->Image->Int_Flags,sizeof(rvm_ptr_t)*RVM_VECT_BITMAP(Virt->Image->Int_Num));
    
    /* Actually do the page table setup */
    for(Count=0;Count<Virt->Image->Pgtbl_Num;Count++)
 8012534:	4577      	cmp	r7, lr
 8012536:	f107 0701 	add.w	r7, r7, #1
 801253a:	d219      	bcs.n	8012570 <main+0xf70>
        _RVM_Pgtbl_Setup(Pgtbl, Count, RVM_VIRT_TBL_PGTBL, Pgtbl_Bump, RVM_BOOT_INIT_KMEM, Kmem_Bump);
 801253c:	ad06      	add	r5, sp, #24
 801253e:	f8cd 8000 	str.w	r8, [sp]
 8012542:	9501      	str	r5, [sp, #4]
 8012544:	f7fd fdca 	bl	80100dc <_RVM_Pgtbl_Setup>
 8012548:	e7ed      	b.n	8012526 <main+0xf26>
 801254a:	bf00      	nop
 801254c:	08012f08 	.word	0x08012f08
 8012550:	08013090 	.word	0x08013090
 8012554:	08012fa4 	.word	0x08012fa4
 8012558:	080134b0 	.word	0x080134b0
 801255c:	08012fac 	.word	0x08012fac
 8012560:	08012fb8 	.word	0x08012fb8
 8012564:	080130e4 	.word	0x080130e4
 8012568:	08013898 	.word	0x08013898
 801256c:	080138c8 	.word	0x080138c8
    RVM_LOG_SIS("Init:Created ",Virt->Image->Pgtbl_Num," page tables.\r\n");   
 8012570:	48ac      	ldr	r0, [pc, #688]	; (8012824 <main+0x1224>)
 8012572:	464d      	mov	r5, r9
    
    /* Create the virtual machine capability table */
    Virt->Cap.Captbl=RVM_VIRT_CAPTBL(VMID);
 8012574:	9f04      	ldr	r7, [sp, #16]
    RVM_Clear(Virt->Image->Int_Flags,sizeof(rvm_ptr_t)*RVM_VECT_BITMAP(Virt->Image->Int_Num));
    
    /* Actually do the page table setup */
    for(Count=0;Count<Virt->Image->Pgtbl_Num;Count++)
        _RVM_Pgtbl_Setup(Pgtbl, Count, RVM_VIRT_TBL_PGTBL, Pgtbl_Bump, RVM_BOOT_INIT_KMEM, Kmem_Bump);
    RVM_LOG_SIS("Init:Created ",Virt->Image->Pgtbl_Num," page tables.\r\n");   
 8012576:	f000 fbfb 	bl	8012d70 <RVM_Print_String>
 801257a:	6923      	ldr	r3, [r4, #16]
    
    /* Create the virtual machine capability table */
    Virt->Cap.Captbl=RVM_VIRT_CAPTBL(VMID);
 801257c:	f447 6608 	orr.w	r6, r7, #2176	; 0x880
    RVM_Clear(Virt->Image->Int_Flags,sizeof(rvm_ptr_t)*RVM_VECT_BITMAP(Virt->Image->Int_Num));
    
    /* Actually do the page table setup */
    for(Count=0;Count<Virt->Image->Pgtbl_Num;Count++)
        _RVM_Pgtbl_Setup(Pgtbl, Count, RVM_VIRT_TBL_PGTBL, Pgtbl_Bump, RVM_BOOT_INIT_KMEM, Kmem_Bump);
    RVM_LOG_SIS("Init:Created ",Virt->Image->Pgtbl_Num," page tables.\r\n");   
 8012580:	6cd8      	ldr	r0, [r3, #76]	; 0x4c
 8012582:	f000 fb63 	bl	8012c4c <RVM_Print_Int>
 8012586:	48a8      	ldr	r0, [pc, #672]	; (8012828 <main+0x1228>)
 8012588:	f000 fbf2 	bl	8012d70 <RVM_Print_String>
    
    /* Create the virtual machine capability table */
    Virt->Cap.Captbl=RVM_VIRT_CAPTBL(VMID);
    RVM_ASSERT(RVM_Captbl_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2, *Kmem_Bump, Virt->Image->Kcap_Num+2)==0);
 801258c:	6923      	ldr	r3, [r4, #16]
    for(Count=0;Count<Virt->Image->Pgtbl_Num;Count++)
        _RVM_Pgtbl_Setup(Pgtbl, Count, RVM_VIRT_TBL_PGTBL, Pgtbl_Bump, RVM_BOOT_INIT_KMEM, Kmem_Bump);
    RVM_LOG_SIS("Init:Created ",Virt->Image->Pgtbl_Num," page tables.\r\n");   
    
    /* Create the virtual machine capability table */
    Virt->Cap.Captbl=RVM_VIRT_CAPTBL(VMID);
 801258e:	61a6      	str	r6, [r4, #24]
    RVM_ASSERT(RVM_Captbl_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2, *Kmem_Bump, Virt->Image->Kcap_Num+2)==0);
 8012590:	463a      	mov	r2, r7
 8012592:	6d5f      	ldr	r7, [r3, #84]	; 0x54
 8012594:	2105      	movs	r1, #5
 8012596:	9b06      	ldr	r3, [sp, #24]
 8012598:	2008      	movs	r0, #8
 801259a:	3702      	adds	r7, #2
 801259c:	9700      	str	r7, [sp, #0]
 801259e:	f000 fbf7 	bl	8012d90 <RVM_Captbl_Crt>
 80125a2:	b1d8      	cbz	r0, 80125dc <main+0xfdc>
 80125a4:	48a1      	ldr	r0, [pc, #644]	; (801282c <main+0x122c>)
 80125a6:	f000 fbe3 	bl	8012d70 <RVM_Print_String>
 80125aa:	48a1      	ldr	r0, [pc, #644]	; (8012830 <main+0x1230>)
 80125ac:	f000 fbe0 	bl	8012d70 <RVM_Print_String>
 80125b0:	48a0      	ldr	r0, [pc, #640]	; (8012834 <main+0x1234>)
 80125b2:	f000 fbdd 	bl	8012d70 <RVM_Print_String>
 80125b6:	20a8      	movs	r0, #168	; 0xa8
 80125b8:	f000 fb48 	bl	8012c4c <RVM_Print_Int>
 80125bc:	489e      	ldr	r0, [pc, #632]	; (8012838 <main+0x1238>)
 80125be:	f000 fbd7 	bl	8012d70 <RVM_Print_String>
 80125c2:	489e      	ldr	r0, [pc, #632]	; (801283c <main+0x123c>)
 80125c4:	f000 fbd4 	bl	8012d70 <RVM_Print_String>
 80125c8:	489d      	ldr	r0, [pc, #628]	; (8012840 <main+0x1240>)
 80125ca:	f000 fbd1 	bl	8012d70 <RVM_Print_String>
 80125ce:	489d      	ldr	r0, [pc, #628]	; (8012844 <main+0x1244>)
 80125d0:	f000 fbce 	bl	8012d70 <RVM_Print_String>
 80125d4:	4898      	ldr	r0, [pc, #608]	; (8012838 <main+0x1238>)
 80125d6:	f000 fbcb 	bl	8012d70 <RVM_Print_String>
 80125da:	e7fe      	b.n	80125da <main+0xfda>
 80125dc:	9f04      	ldr	r7, [sp, #16]
    RVM_LOG_SISUS("Init:Created virtual machine capability table CID ",VMID*2," @ address 0x",*Kmem_Bump,".\r\n");
 80125de:	489a      	ldr	r0, [pc, #616]	; (8012848 <main+0x1248>)
 80125e0:	f000 fbc6 	bl	8012d70 <RVM_Print_String>
 80125e4:	4638      	mov	r0, r7
 80125e6:	f000 fb31 	bl	8012c4c <RVM_Print_Int>
 80125ea:	4898      	ldr	r0, [pc, #608]	; (801284c <main+0x124c>)
 80125ec:	f000 fbc0 	bl	8012d70 <RVM_Print_String>
 80125f0:	9806      	ldr	r0, [sp, #24]
 80125f2:	f000 fb91 	bl	8012d18 <RVM_Print_Uint>
 80125f6:	4896      	ldr	r0, [pc, #600]	; (8012850 <main+0x1250>)
 80125f8:	f000 fbba 	bl	8012d70 <RVM_Print_String>
    RVM_LOG_SIS("Init:Virtual machine capability table size ",Virt->Image->Kcap_Num+2,".\r\n");
 80125fc:	4895      	ldr	r0, [pc, #596]	; (8012854 <main+0x1254>)
 80125fe:	f000 fbb7 	bl	8012d70 <RVM_Print_String>
 8012602:	6923      	ldr	r3, [r4, #16]
 8012604:	f107 0801 	add.w	r8, r7, #1
 8012608:	6d58      	ldr	r0, [r3, #84]	; 0x54
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Virt->Image->Kcap_Num+2);
    
    /* Create the virtual machine process */
    Virt->Cap.Proc=RVM_VIRT_PROC(VMID);
 801260a:	f448 6a08 	orr.w	sl, r8, #2176	; 0x880
    
    /* Create the virtual machine capability table */
    Virt->Cap.Captbl=RVM_VIRT_CAPTBL(VMID);
    RVM_ASSERT(RVM_Captbl_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2, *Kmem_Bump, Virt->Image->Kcap_Num+2)==0);
    RVM_LOG_SISUS("Init:Created virtual machine capability table CID ",VMID*2," @ address 0x",*Kmem_Bump,".\r\n");
    RVM_LOG_SIS("Init:Virtual machine capability table size ",Virt->Image->Kcap_Num+2,".\r\n");
 801260e:	3002      	adds	r0, #2
 8012610:	f000 fb1c 	bl	8012c4c <RVM_Print_Int>
 8012614:	488e      	ldr	r0, [pc, #568]	; (8012850 <main+0x1250>)
 8012616:	f000 fbab 	bl	8012d70 <RVM_Print_String>
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Virt->Image->Kcap_Num+2);
 801261a:	6923      	ldr	r3, [r4, #16]
    
    /* Create the virtual machine process */
    Virt->Cap.Proc=RVM_VIRT_PROC(VMID);
    RVM_ASSERT(RVM_Proc_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2+1, RVM_VIRT_CAPTBL(VMID), Virt->Cap.Pgtbl, *Kmem_Bump)==0);
 801261c:	2105      	movs	r1, #5
    /* Create the virtual machine capability table */
    Virt->Cap.Captbl=RVM_VIRT_CAPTBL(VMID);
    RVM_ASSERT(RVM_Captbl_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2, *Kmem_Bump, Virt->Image->Kcap_Num+2)==0);
    RVM_LOG_SISUS("Init:Created virtual machine capability table CID ",VMID*2," @ address 0x",*Kmem_Bump,".\r\n");
    RVM_LOG_SIS("Init:Virtual machine capability table size ",Virt->Image->Kcap_Num+2,".\r\n");
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Virt->Image->Kcap_Num+2);
 801261e:	9f06      	ldr	r7, [sp, #24]
 8012620:	6d58      	ldr	r0, [r3, #84]	; 0x54
    
    /* Create the virtual machine process */
    Virt->Cap.Proc=RVM_VIRT_PROC(VMID);
    RVM_ASSERT(RVM_Proc_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2+1, RVM_VIRT_CAPTBL(VMID), Virt->Cap.Pgtbl, *Kmem_Bump)==0);
 8012622:	4642      	mov	r2, r8
    RVM_LOG_SISUS("Init:Created virtual machine capability table CID ",VMID*2," @ address 0x",*Kmem_Bump,".\r\n");
    RVM_LOG_SIS("Init:Virtual machine capability table size ",Virt->Image->Kcap_Num+2,".\r\n");
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Virt->Image->Kcap_Num+2);
    
    /* Create the virtual machine process */
    Virt->Cap.Proc=RVM_VIRT_PROC(VMID);
 8012624:	f8c4 a014 	str.w	sl, [r4, #20]
    RVM_ASSERT(RVM_Proc_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2+1, RVM_VIRT_CAPTBL(VMID), Virt->Cap.Pgtbl, *Kmem_Bump)==0);
 8012628:	4633      	mov	r3, r6
    /* Create the virtual machine capability table */
    Virt->Cap.Captbl=RVM_VIRT_CAPTBL(VMID);
    RVM_ASSERT(RVM_Captbl_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2, *Kmem_Bump, Virt->Image->Kcap_Num+2)==0);
    RVM_LOG_SISUS("Init:Created virtual machine capability table CID ",VMID*2," @ address 0x",*Kmem_Bump,".\r\n");
    RVM_LOG_SIS("Init:Virtual machine capability table size ",Virt->Image->Kcap_Num+2,".\r\n");
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Virt->Image->Kcap_Num+2);
 801262a:	fa00 fe01 	lsl.w	lr, r0, r1
    
    /* Create the virtual machine process */
    Virt->Cap.Proc=RVM_VIRT_PROC(VMID);
    RVM_ASSERT(RVM_Proc_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2+1, RVM_VIRT_CAPTBL(VMID), Virt->Cap.Pgtbl, *Kmem_Bump)==0);
 801262e:	2008      	movs	r0, #8
    /* Create the virtual machine capability table */
    Virt->Cap.Captbl=RVM_VIRT_CAPTBL(VMID);
    RVM_ASSERT(RVM_Captbl_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2, *Kmem_Bump, Virt->Image->Kcap_Num+2)==0);
    RVM_LOG_SISUS("Init:Created virtual machine capability table CID ",VMID*2," @ address 0x",*Kmem_Bump,".\r\n");
    RVM_LOG_SIS("Init:Virtual machine capability table size ",Virt->Image->Kcap_Num+2,".\r\n");
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Virt->Image->Kcap_Num+2);
 8012630:	f10e 0e40 	add.w	lr, lr, #64	; 0x40
 8012634:	4477      	add	r7, lr
    
    /* Create the virtual machine process */
    Virt->Cap.Proc=RVM_VIRT_PROC(VMID);
    RVM_ASSERT(RVM_Proc_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2+1, RVM_VIRT_CAPTBL(VMID), Virt->Cap.Pgtbl, *Kmem_Bump)==0);
 8012636:	9701      	str	r7, [sp, #4]
    /* Create the virtual machine capability table */
    Virt->Cap.Captbl=RVM_VIRT_CAPTBL(VMID);
    RVM_ASSERT(RVM_Captbl_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2, *Kmem_Bump, Virt->Image->Kcap_Num+2)==0);
    RVM_LOG_SISUS("Init:Created virtual machine capability table CID ",VMID*2," @ address 0x",*Kmem_Bump,".\r\n");
    RVM_LOG_SIS("Init:Virtual machine capability table size ",Virt->Image->Kcap_Num+2,".\r\n");
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Virt->Image->Kcap_Num+2);
 8012638:	9706      	str	r7, [sp, #24]
    
    /* Create the virtual machine process */
    Virt->Cap.Proc=RVM_VIRT_PROC(VMID);
    RVM_ASSERT(RVM_Proc_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2+1, RVM_VIRT_CAPTBL(VMID), Virt->Cap.Pgtbl, *Kmem_Bump)==0);
 801263a:	69e7      	ldr	r7, [r4, #28]
 801263c:	9700      	str	r7, [sp, #0]
 801263e:	f000 fc03 	bl	8012e48 <RVM_Proc_Crt>
 8012642:	b1d8      	cbz	r0, 801267c <main+0x107c>
 8012644:	4879      	ldr	r0, [pc, #484]	; (801282c <main+0x122c>)
 8012646:	f000 fb93 	bl	8012d70 <RVM_Print_String>
 801264a:	4879      	ldr	r0, [pc, #484]	; (8012830 <main+0x1230>)
 801264c:	f000 fb90 	bl	8012d70 <RVM_Print_String>
 8012650:	4878      	ldr	r0, [pc, #480]	; (8012834 <main+0x1234>)
 8012652:	f000 fb8d 	bl	8012d70 <RVM_Print_String>
 8012656:	20af      	movs	r0, #175	; 0xaf
 8012658:	f000 faf8 	bl	8012c4c <RVM_Print_Int>
 801265c:	4876      	ldr	r0, [pc, #472]	; (8012838 <main+0x1238>)
 801265e:	f000 fb87 	bl	8012d70 <RVM_Print_String>
 8012662:	4876      	ldr	r0, [pc, #472]	; (801283c <main+0x123c>)
 8012664:	f000 fb84 	bl	8012d70 <RVM_Print_String>
 8012668:	4875      	ldr	r0, [pc, #468]	; (8012840 <main+0x1240>)
 801266a:	f000 fb81 	bl	8012d70 <RVM_Print_String>
 801266e:	4875      	ldr	r0, [pc, #468]	; (8012844 <main+0x1244>)
 8012670:	f000 fb7e 	bl	8012d70 <RVM_Print_String>
 8012674:	4870      	ldr	r0, [pc, #448]	; (8012838 <main+0x1238>)
 8012676:	f000 fb7b 	bl	8012d70 <RVM_Print_String>
 801267a:	e7fe      	b.n	801267a <main+0x107a>
    RVM_LOG_SISUS("Init:Created virtual machine process CID ",VMID*2+1," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_PROC_SIZE;
    
    /* Create the virtual machine threads and endpoint in the virtual machine process */
    Virt->Cap.User_Thd=RVM_VIRT_USERTHD(VMID);
 801267c:	9b03      	ldr	r3, [sp, #12]
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Virt->Image->Kcap_Num+2);
    
    /* Create the virtual machine process */
    Virt->Cap.Proc=RVM_VIRT_PROC(VMID);
    RVM_ASSERT(RVM_Proc_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2+1, RVM_VIRT_CAPTBL(VMID), Virt->Cap.Pgtbl, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created virtual machine process CID ",VMID*2+1," @ address 0x",*Kmem_Bump,".\r\n");
 801267e:	4876      	ldr	r0, [pc, #472]	; (8012858 <main+0x1258>)
    *Kmem_Bump+=RVM_PROC_SIZE;
    
    /* Create the virtual machine threads and endpoint in the virtual machine process */
    Virt->Cap.User_Thd=RVM_VIRT_USERTHD(VMID);
 8012680:	f443 6718 	orr.w	r7, r3, #2432	; 0x980
    *Kmem_Bump+=RVM_CAPTBL_SIZE(Virt->Image->Kcap_Num+2);
    
    /* Create the virtual machine process */
    Virt->Cap.Proc=RVM_VIRT_PROC(VMID);
    RVM_ASSERT(RVM_Proc_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2+1, RVM_VIRT_CAPTBL(VMID), Virt->Cap.Pgtbl, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created virtual machine process CID ",VMID*2+1," @ address 0x",*Kmem_Bump,".\r\n");
 8012684:	f000 fb74 	bl	8012d70 <RVM_Print_String>
 8012688:	4640      	mov	r0, r8
 801268a:	f000 fadf 	bl	8012c4c <RVM_Print_Int>
 801268e:	486f      	ldr	r0, [pc, #444]	; (801284c <main+0x124c>)
 8012690:	f000 fb6e 	bl	8012d70 <RVM_Print_String>
 8012694:	9806      	ldr	r0, [sp, #24]
 8012696:	f000 fb3f 	bl	8012d18 <RVM_Print_Uint>
 801269a:	486d      	ldr	r0, [pc, #436]	; (8012850 <main+0x1250>)
 801269c:	f000 fb68 	bl	8012d70 <RVM_Print_String>
    *Kmem_Bump+=RVM_PROC_SIZE;
 80126a0:	9b06      	ldr	r3, [sp, #24]
    
    /* Create the virtual machine threads and endpoint in the virtual machine process */
    Virt->Cap.User_Thd=RVM_VIRT_USERTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3, RVM_VIRT_PROC(VMID), RVM_USER_PRIO, *Kmem_Bump)==0);
 80126a2:	2202      	movs	r2, #2
    RVM_ASSERT(RVM_Proc_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2+1, RVM_VIRT_CAPTBL(VMID), Virt->Cap.Pgtbl, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created virtual machine process CID ",VMID*2+1," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_PROC_SIZE;
    
    /* Create the virtual machine threads and endpoint in the virtual machine process */
    Virt->Cap.User_Thd=RVM_VIRT_USERTHD(VMID);
 80126a4:	6267      	str	r7, [r4, #36]	; 0x24
    
    /* Create the virtual machine process */
    Virt->Cap.Proc=RVM_VIRT_PROC(VMID);
    RVM_ASSERT(RVM_Proc_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2+1, RVM_VIRT_CAPTBL(VMID), Virt->Cap.Pgtbl, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created virtual machine process CID ",VMID*2+1," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_PROC_SIZE;
 80126a6:	f103 0e10 	add.w	lr, r3, #16
    
    /* Create the virtual machine threads and endpoint in the virtual machine process */
    Virt->Cap.User_Thd=RVM_VIRT_USERTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3, RVM_VIRT_PROC(VMID), RVM_USER_PRIO, *Kmem_Bump)==0);
 80126aa:	2105      	movs	r1, #5
 80126ac:	9200      	str	r2, [sp, #0]
 80126ae:	4653      	mov	r3, sl
 80126b0:	9a03      	ldr	r2, [sp, #12]
 80126b2:	2009      	movs	r0, #9
 80126b4:	f8cd e004 	str.w	lr, [sp, #4]
    
    /* Create the virtual machine process */
    Virt->Cap.Proc=RVM_VIRT_PROC(VMID);
    RVM_ASSERT(RVM_Proc_Crt(RVM_VIRT_TBL_CAPPROC, RVM_BOOT_INIT_KMEM, VMID*2+1, RVM_VIRT_CAPTBL(VMID), Virt->Cap.Pgtbl, *Kmem_Bump)==0);
    RVM_LOG_SISUS("Init:Created virtual machine process CID ",VMID*2+1," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_PROC_SIZE;
 80126b8:	f8cd e018 	str.w	lr, [sp, #24]
    
    /* Create the virtual machine threads and endpoint in the virtual machine process */
    Virt->Cap.User_Thd=RVM_VIRT_USERTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3, RVM_VIRT_PROC(VMID), RVM_USER_PRIO, *Kmem_Bump)==0);
 80126bc:	f000 fbd2 	bl	8012e64 <RVM_Thd_Crt>
 80126c0:	b1d8      	cbz	r0, 80126fa <main+0x10fa>
 80126c2:	485a      	ldr	r0, [pc, #360]	; (801282c <main+0x122c>)
 80126c4:	f000 fb54 	bl	8012d70 <RVM_Print_String>
 80126c8:	4859      	ldr	r0, [pc, #356]	; (8012830 <main+0x1230>)
 80126ca:	f000 fb51 	bl	8012d70 <RVM_Print_String>
 80126ce:	4859      	ldr	r0, [pc, #356]	; (8012834 <main+0x1234>)
 80126d0:	f000 fb4e 	bl	8012d70 <RVM_Print_String>
 80126d4:	20b5      	movs	r0, #181	; 0xb5
 80126d6:	f000 fab9 	bl	8012c4c <RVM_Print_Int>
 80126da:	4857      	ldr	r0, [pc, #348]	; (8012838 <main+0x1238>)
 80126dc:	f000 fb48 	bl	8012d70 <RVM_Print_String>
 80126e0:	4856      	ldr	r0, [pc, #344]	; (801283c <main+0x123c>)
 80126e2:	f000 fb45 	bl	8012d70 <RVM_Print_String>
 80126e6:	4856      	ldr	r0, [pc, #344]	; (8012840 <main+0x1240>)
 80126e8:	f000 fb42 	bl	8012d70 <RVM_Print_String>
 80126ec:	4855      	ldr	r0, [pc, #340]	; (8012844 <main+0x1244>)
 80126ee:	f000 fb3f 	bl	8012d70 <RVM_Print_String>
 80126f2:	4851      	ldr	r0, [pc, #324]	; (8012838 <main+0x1238>)
 80126f4:	f000 fb3c 	bl	8012d70 <RVM_Print_String>
 80126f8:	e7fe      	b.n	80126f8 <main+0x10f8>
    Virt->Cap.User_TID=RVM_TID_Inc++;
 80126fa:	4b58      	ldr	r3, [pc, #352]	; (801285c <main+0x125c>)
 80126fc:	9a03      	ldr	r2, [sp, #12]
 80126fe:	681b      	ldr	r3, [r3, #0]
 8012700:	f102 0901 	add.w	r9, r2, #1
 8012704:	f8df b154 	ldr.w	fp, [pc, #340]	; 801285c <main+0x125c>
 8012708:	1c5a      	adds	r2, r3, #1
 801270a:	6323      	str	r3, [r4, #48]	; 0x30
    RVM_LOG_SISUS("Init:Created virual machine user thread CID ",VMID*3 ," @ address 0x",*Kmem_Bump," internal TID ");RVM_LOG_I(Virt->Cap.User_TID);
 801270c:	4854      	ldr	r0, [pc, #336]	; (8012860 <main+0x1260>)
    *Kmem_Bump+=RVM_THD_SIZE;
    
    Virt->Cap.Int_Thd=RVM_VIRT_INTTHD(VMID);
 801270e:	f449 6818 	orr.w	r8, r9, #2432	; 0x980
    *Kmem_Bump+=RVM_PROC_SIZE;
    
    /* Create the virtual machine threads and endpoint in the virtual machine process */
    Virt->Cap.User_Thd=RVM_VIRT_USERTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3, RVM_VIRT_PROC(VMID), RVM_USER_PRIO, *Kmem_Bump)==0);
    Virt->Cap.User_TID=RVM_TID_Inc++;
 8012712:	f8cb 2000 	str.w	r2, [fp]
    RVM_LOG_SISUS("Init:Created virual machine user thread CID ",VMID*3 ," @ address 0x",*Kmem_Bump," internal TID ");RVM_LOG_I(Virt->Cap.User_TID);
 8012716:	f000 fb2b 	bl	8012d70 <RVM_Print_String>
 801271a:	9803      	ldr	r0, [sp, #12]
 801271c:	f000 fa96 	bl	8012c4c <RVM_Print_Int>
 8012720:	484a      	ldr	r0, [pc, #296]	; (801284c <main+0x124c>)
 8012722:	f000 fb25 	bl	8012d70 <RVM_Print_String>
 8012726:	9806      	ldr	r0, [sp, #24]
 8012728:	f000 faf6 	bl	8012d18 <RVM_Print_Uint>
 801272c:	484d      	ldr	r0, [pc, #308]	; (8012864 <main+0x1264>)
 801272e:	f000 fb1f 	bl	8012d70 <RVM_Print_String>
 8012732:	6b20      	ldr	r0, [r4, #48]	; 0x30
 8012734:	f000 fa8a 	bl	8012c4c <RVM_Print_Int>
    *Kmem_Bump+=RVM_THD_SIZE;
 8012738:	9a06      	ldr	r2, [sp, #24]
    
    Virt->Cap.Int_Thd=RVM_VIRT_INTTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+1, RVM_VIRT_PROC(VMID), RVM_VINT_PRIO, *Kmem_Bump)==0);
 801273a:	2103      	movs	r1, #3
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3, RVM_VIRT_PROC(VMID), RVM_USER_PRIO, *Kmem_Bump)==0);
    Virt->Cap.User_TID=RVM_TID_Inc++;
    RVM_LOG_SISUS("Init:Created virual machine user thread CID ",VMID*3 ," @ address 0x",*Kmem_Bump," internal TID ");RVM_LOG_I(Virt->Cap.User_TID);
    *Kmem_Bump+=RVM_THD_SIZE;
    
    Virt->Cap.Int_Thd=RVM_VIRT_INTTHD(VMID);
 801273c:	f8c4 8020 	str.w	r8, [r4, #32]
    /* Create the virtual machine threads and endpoint in the virtual machine process */
    Virt->Cap.User_Thd=RVM_VIRT_USERTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3, RVM_VIRT_PROC(VMID), RVM_USER_PRIO, *Kmem_Bump)==0);
    Virt->Cap.User_TID=RVM_TID_Inc++;
    RVM_LOG_SISUS("Init:Created virual machine user thread CID ",VMID*3 ," @ address 0x",*Kmem_Bump," internal TID ");RVM_LOG_I(Virt->Cap.User_TID);
    *Kmem_Bump+=RVM_THD_SIZE;
 8012740:	f102 0ec0 	add.w	lr, r2, #192	; 0xc0
    
    Virt->Cap.Int_Thd=RVM_VIRT_INTTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+1, RVM_VIRT_PROC(VMID), RVM_VINT_PRIO, *Kmem_Bump)==0);
 8012744:	4653      	mov	r3, sl
 8012746:	464a      	mov	r2, r9
 8012748:	2009      	movs	r0, #9
    /* Create the virtual machine threads and endpoint in the virtual machine process */
    Virt->Cap.User_Thd=RVM_VIRT_USERTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3, RVM_VIRT_PROC(VMID), RVM_USER_PRIO, *Kmem_Bump)==0);
    Virt->Cap.User_TID=RVM_TID_Inc++;
    RVM_LOG_SISUS("Init:Created virual machine user thread CID ",VMID*3 ," @ address 0x",*Kmem_Bump," internal TID ");RVM_LOG_I(Virt->Cap.User_TID);
    *Kmem_Bump+=RVM_THD_SIZE;
 801274a:	f8cd e018 	str.w	lr, [sp, #24]
    
    Virt->Cap.Int_Thd=RVM_VIRT_INTTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+1, RVM_VIRT_PROC(VMID), RVM_VINT_PRIO, *Kmem_Bump)==0);
 801274e:	e88d 4002 	stmia.w	sp, {r1, lr}
 8012752:	2105      	movs	r1, #5
 8012754:	f000 fb86 	bl	8012e64 <RVM_Thd_Crt>
 8012758:	b1d8      	cbz	r0, 8012792 <main+0x1192>
 801275a:	4834      	ldr	r0, [pc, #208]	; (801282c <main+0x122c>)
 801275c:	f000 fb08 	bl	8012d70 <RVM_Print_String>
 8012760:	4833      	ldr	r0, [pc, #204]	; (8012830 <main+0x1230>)
 8012762:	f000 fb05 	bl	8012d70 <RVM_Print_String>
 8012766:	4833      	ldr	r0, [pc, #204]	; (8012834 <main+0x1234>)
 8012768:	f000 fb02 	bl	8012d70 <RVM_Print_String>
 801276c:	20bb      	movs	r0, #187	; 0xbb
 801276e:	f000 fa6d 	bl	8012c4c <RVM_Print_Int>
 8012772:	4831      	ldr	r0, [pc, #196]	; (8012838 <main+0x1238>)
 8012774:	f000 fafc 	bl	8012d70 <RVM_Print_String>
 8012778:	4830      	ldr	r0, [pc, #192]	; (801283c <main+0x123c>)
 801277a:	f000 faf9 	bl	8012d70 <RVM_Print_String>
 801277e:	4830      	ldr	r0, [pc, #192]	; (8012840 <main+0x1240>)
 8012780:	f000 faf6 	bl	8012d70 <RVM_Print_String>
 8012784:	482f      	ldr	r0, [pc, #188]	; (8012844 <main+0x1244>)
 8012786:	f000 faf3 	bl	8012d70 <RVM_Print_String>
 801278a:	482b      	ldr	r0, [pc, #172]	; (8012838 <main+0x1238>)
 801278c:	f000 faf0 	bl	8012d70 <RVM_Print_String>
 8012790:	e7fe      	b.n	8012790 <main+0x1190>
    Virt->Cap.Int_TID=RVM_TID_Inc++;
 8012792:	f8db 3000 	ldr.w	r3, [fp]
 8012796:	9a03      	ldr	r2, [sp, #12]
 8012798:	62e3      	str	r3, [r4, #44]	; 0x2c
 801279a:	f102 0a02 	add.w	sl, r2, #2
 801279e:	1c5a      	adds	r2, r3, #1
    RVM_LOG_SISUS(".\r\nInit:Created virual machine interrupt thread CID ",VMID*3+1 ," @ address 0x",*Kmem_Bump," internal TID ");RVM_LOG_I(Virt->Cap.Int_TID);
 80127a0:	4831      	ldr	r0, [pc, #196]	; (8012868 <main+0x1268>)
    RVM_LOG_SISUS("Init:Created virual machine user thread CID ",VMID*3 ," @ address 0x",*Kmem_Bump," internal TID ");RVM_LOG_I(Virt->Cap.User_TID);
    *Kmem_Bump+=RVM_THD_SIZE;
    
    Virt->Cap.Int_Thd=RVM_VIRT_INTTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+1, RVM_VIRT_PROC(VMID), RVM_VINT_PRIO, *Kmem_Bump)==0);
    Virt->Cap.Int_TID=RVM_TID_Inc++;
 80127a2:	f8cb 2000 	str.w	r2, [fp]
    RVM_LOG_SISUS(".\r\nInit:Created virual machine interrupt thread CID ",VMID*3+1 ," @ address 0x",*Kmem_Bump," internal TID ");RVM_LOG_I(Virt->Cap.Int_TID);
 80127a6:	f000 fae3 	bl	8012d70 <RVM_Print_String>
 80127aa:	4648      	mov	r0, r9
 80127ac:	f000 fa4e 	bl	8012c4c <RVM_Print_Int>
 80127b0:	4826      	ldr	r0, [pc, #152]	; (801284c <main+0x124c>)
 80127b2:	f000 fadd 	bl	8012d70 <RVM_Print_String>
 80127b6:	9806      	ldr	r0, [sp, #24]
 80127b8:	f000 faae 	bl	8012d18 <RVM_Print_Uint>
 80127bc:	4829      	ldr	r0, [pc, #164]	; (8012864 <main+0x1264>)
 80127be:	f000 fad7 	bl	8012d70 <RVM_Print_String>
 80127c2:	6ae0      	ldr	r0, [r4, #44]	; 0x2c
 80127c4:	f000 fa42 	bl	8012c4c <RVM_Print_Int>
    *Kmem_Bump+=RVM_THD_SIZE;
 80127c8:	9b06      	ldr	r3, [sp, #24]
    
    Virt->Cap.Int_Sig=RVM_VIRT_INTSIG(VMID);
 80127ca:	f44a 6018 	orr.w	r0, sl, #2432	; 0x980
    RVM_ASSERT(RVM_Sig_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+2, *Kmem_Bump)==0);
 80127ce:	4652      	mov	r2, sl
    
    Virt->Cap.Int_Thd=RVM_VIRT_INTTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+1, RVM_VIRT_PROC(VMID), RVM_VINT_PRIO, *Kmem_Bump)==0);
    Virt->Cap.Int_TID=RVM_TID_Inc++;
    RVM_LOG_SISUS(".\r\nInit:Created virual machine interrupt thread CID ",VMID*3+1 ," @ address 0x",*Kmem_Bump," internal TID ");RVM_LOG_I(Virt->Cap.Int_TID);
    *Kmem_Bump+=RVM_THD_SIZE;
 80127d0:	f103 0ec0 	add.w	lr, r3, #192	; 0xc0
    
    Virt->Cap.Int_Sig=RVM_VIRT_INTSIG(VMID);
    RVM_ASSERT(RVM_Sig_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+2, *Kmem_Bump)==0);
 80127d4:	2105      	movs	r1, #5
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+1, RVM_VIRT_PROC(VMID), RVM_VINT_PRIO, *Kmem_Bump)==0);
    Virt->Cap.Int_TID=RVM_TID_Inc++;
    RVM_LOG_SISUS(".\r\nInit:Created virual machine interrupt thread CID ",VMID*3+1 ," @ address 0x",*Kmem_Bump," internal TID ");RVM_LOG_I(Virt->Cap.Int_TID);
    *Kmem_Bump+=RVM_THD_SIZE;
    
    Virt->Cap.Int_Sig=RVM_VIRT_INTSIG(VMID);
 80127d6:	62a0      	str	r0, [r4, #40]	; 0x28
    RVM_ASSERT(RVM_Sig_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+2, *Kmem_Bump)==0);
 80127d8:	2009      	movs	r0, #9
 80127da:	4673      	mov	r3, lr
    
    Virt->Cap.Int_Thd=RVM_VIRT_INTTHD(VMID);
    RVM_ASSERT(RVM_Thd_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+1, RVM_VIRT_PROC(VMID), RVM_VINT_PRIO, *Kmem_Bump)==0);
    Virt->Cap.Int_TID=RVM_TID_Inc++;
    RVM_LOG_SISUS(".\r\nInit:Created virual machine interrupt thread CID ",VMID*3+1 ," @ address 0x",*Kmem_Bump," internal TID ");RVM_LOG_I(Virt->Cap.Int_TID);
    *Kmem_Bump+=RVM_THD_SIZE;
 80127dc:	f8cd e018 	str.w	lr, [sp, #24]
    
    Virt->Cap.Int_Sig=RVM_VIRT_INTSIG(VMID);
    RVM_ASSERT(RVM_Sig_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+2, *Kmem_Bump)==0);
 80127e0:	f000 fb7e 	bl	8012ee0 <RVM_Sig_Crt>
 80127e4:	4681      	mov	r9, r0
 80127e6:	2800      	cmp	r0, #0
 80127e8:	d040      	beq.n	801286c <main+0x126c>
 80127ea:	4810      	ldr	r0, [pc, #64]	; (801282c <main+0x122c>)
 80127ec:	f000 fac0 	bl	8012d70 <RVM_Print_String>
 80127f0:	480f      	ldr	r0, [pc, #60]	; (8012830 <main+0x1230>)
 80127f2:	f000 fabd 	bl	8012d70 <RVM_Print_String>
 80127f6:	480f      	ldr	r0, [pc, #60]	; (8012834 <main+0x1234>)
 80127f8:	f000 faba 	bl	8012d70 <RVM_Print_String>
 80127fc:	20c1      	movs	r0, #193	; 0xc1
 80127fe:	f000 fa25 	bl	8012c4c <RVM_Print_Int>
 8012802:	480d      	ldr	r0, [pc, #52]	; (8012838 <main+0x1238>)
 8012804:	f000 fab4 	bl	8012d70 <RVM_Print_String>
 8012808:	480c      	ldr	r0, [pc, #48]	; (801283c <main+0x123c>)
 801280a:	f000 fab1 	bl	8012d70 <RVM_Print_String>
 801280e:	480c      	ldr	r0, [pc, #48]	; (8012840 <main+0x1240>)
 8012810:	f000 faae 	bl	8012d70 <RVM_Print_String>
 8012814:	480b      	ldr	r0, [pc, #44]	; (8012844 <main+0x1244>)
 8012816:	f000 faab 	bl	8012d70 <RVM_Print_String>
 801281a:	4807      	ldr	r0, [pc, #28]	; (8012838 <main+0x1238>)
 801281c:	f000 faa8 	bl	8012d70 <RVM_Print_String>
 8012820:	e7fe      	b.n	8012820 <main+0x1220>
 8012822:	bf00      	nop
 8012824:	0801390c 	.word	0x0801390c
 8012828:	0801391c 	.word	0x0801391c
 801282c:	08012f08 	.word	0x08012f08
 8012830:	08013090 	.word	0x08013090
 8012834:	08012fa4 	.word	0x08012fa4
 8012838:	080134b0 	.word	0x080134b0
 801283c:	08012fac 	.word	0x08012fac
 8012840:	08012fb8 	.word	0x08012fb8
 8012844:	080130e4 	.word	0x080130e4
 8012848:	0801392c 	.word	0x0801392c
 801284c:	08013584 	.word	0x08013584
 8012850:	0801314c 	.word	0x0801314c
 8012854:	08013960 	.word	0x08013960
 8012858:	0801398c 	.word	0x0801398c
 801285c:	20011000 	.word	0x20011000
 8012860:	080139b8 	.word	0x080139b8
 8012864:	080139e8 	.word	0x080139e8
 8012868:	080139f8 	.word	0x080139f8
    RVM_LOG_SISUS(".\r\nInit:Created virual machine interrupt endpoint CID ",VMID*3+2," @ address 0x",*Kmem_Bump,".\r\n");
 801286c:	48a2      	ldr	r0, [pc, #648]	; (8012af8 <main+0x14f8>)
 801286e:	f000 fa7f 	bl	8012d70 <RVM_Print_String>
 8012872:	4650      	mov	r0, sl
 8012874:	f000 f9ea 	bl	8012c4c <RVM_Print_Int>
 8012878:	48a0      	ldr	r0, [pc, #640]	; (8012afc <main+0x14fc>)
 801287a:	f000 fa79 	bl	8012d70 <RVM_Print_String>
 801287e:	9806      	ldr	r0, [sp, #24]
 8012880:	f000 fa4a 	bl	8012d18 <RVM_Print_Uint>
 8012884:	489e      	ldr	r0, [pc, #632]	; (8012b00 <main+0x1500>)
 8012886:	f000 fa73 	bl	8012d70 <RVM_Print_String>
    *Kmem_Bump+=RVM_SIG_SIZE;
 801288a:	9b06      	ldr	r3, [sp, #24]
    
    /* Bind both threads to the processor */
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VIRT_USERTHD(VMID), RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, Virt->Cap.User_TID, RVM_WAIT_PRIO)==0);
 801288c:	f8cd 9000 	str.w	r9, [sp]
 8012890:	220c      	movs	r2, #12
    *Kmem_Bump+=RVM_THD_SIZE;
    
    Virt->Cap.Int_Sig=RVM_VIRT_INTSIG(VMID);
    RVM_ASSERT(RVM_Sig_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+2, *Kmem_Bump)==0);
    RVM_LOG_SISUS(".\r\nInit:Created virual machine interrupt endpoint CID ",VMID*3+2," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_SIG_SIZE;
 8012892:	f103 0e10 	add.w	lr, r3, #16
    
    /* Bind both threads to the processor */
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VIRT_USERTHD(VMID), RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, Virt->Cap.User_TID, RVM_WAIT_PRIO)==0);
 8012896:	210b      	movs	r1, #11
 8012898:	6b23      	ldr	r3, [r4, #48]	; 0x30
 801289a:	4638      	mov	r0, r7
    *Kmem_Bump+=RVM_THD_SIZE;
    
    Virt->Cap.Int_Sig=RVM_VIRT_INTSIG(VMID);
    RVM_ASSERT(RVM_Sig_Crt(RVM_VIRT_TBL_THDSIG, RVM_BOOT_INIT_KMEM, VMID*3+2, *Kmem_Bump)==0);
    RVM_LOG_SISUS(".\r\nInit:Created virual machine interrupt endpoint CID ",VMID*3+2," @ address 0x",*Kmem_Bump,".\r\n");
    *Kmem_Bump+=RVM_SIG_SIZE;
 801289c:	f8cd e018 	str.w	lr, [sp, #24]
    
    /* Bind both threads to the processor */
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VIRT_USERTHD(VMID), RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, Virt->Cap.User_TID, RVM_WAIT_PRIO)==0);
 80128a0:	f000 fafa 	bl	8012e98 <RVM_Thd_Sched_Bind>
 80128a4:	b1d8      	cbz	r0, 80128de <main+0x12de>
 80128a6:	4897      	ldr	r0, [pc, #604]	; (8012b04 <main+0x1504>)
 80128a8:	f000 fa62 	bl	8012d70 <RVM_Print_String>
 80128ac:	4896      	ldr	r0, [pc, #600]	; (8012b08 <main+0x1508>)
 80128ae:	f000 fa5f 	bl	8012d70 <RVM_Print_String>
 80128b2:	4896      	ldr	r0, [pc, #600]	; (8012b0c <main+0x150c>)
 80128b4:	f000 fa5c 	bl	8012d70 <RVM_Print_String>
 80128b8:	20c6      	movs	r0, #198	; 0xc6
 80128ba:	f000 f9c7 	bl	8012c4c <RVM_Print_Int>
 80128be:	4894      	ldr	r0, [pc, #592]	; (8012b10 <main+0x1510>)
 80128c0:	f000 fa56 	bl	8012d70 <RVM_Print_String>
 80128c4:	4893      	ldr	r0, [pc, #588]	; (8012b14 <main+0x1514>)
 80128c6:	f000 fa53 	bl	8012d70 <RVM_Print_String>
 80128ca:	4893      	ldr	r0, [pc, #588]	; (8012b18 <main+0x1518>)
 80128cc:	f000 fa50 	bl	8012d70 <RVM_Print_String>
 80128d0:	4892      	ldr	r0, [pc, #584]	; (8012b1c <main+0x151c>)
 80128d2:	f000 fa4d 	bl	8012d70 <RVM_Print_String>
 80128d6:	488e      	ldr	r0, [pc, #568]	; (8012b10 <main+0x1510>)
 80128d8:	f000 fa4a 	bl	8012d70 <RVM_Print_String>
 80128dc:	e7fe      	b.n	80128dc <main+0x12dc>
    RVM_ASSERT(RVM_Thd_Sched_Bind(RVM_VIRT_INTTHD(VMID), RVM_VMM_GUARD_THD, RVM_VMM_GUARD_SIG, Virt->Cap.Int_TID, RVM_WAIT_PRIO)==0);
 80128de:	9000      	str	r0, [sp, #0]
 80128e0:	220c      	movs	r2, #12
 80128e2:	6ae3      	ldr	r3, [r4, #44]	; 0x2c
 80128e4:	210b      	movs	r1, #11
 80128e6:	4640      	mov	r0, r8
 80128e8:	f000 fad6 	bl	8012e98 <RVM_Thd_Sched_Bind>
 80128ec:	b1d8      	cbz	r0, 8012926 <main+0x1326>
 80128ee:	4885      	ldr	r0, [pc, #532]	; (8012b04 <main+0x1504>)
 80128f0:	f000 fa3e 	bl	8012d70 <RVM_Print_String>
 80128f4:	4884      	ldr	r0, [pc, #528]	; (8012b08 <main+0x1508>)
 80128f6:	f000 fa3b 	bl	8012d70 <RVM_Print_String>
 80128fa:	4884      	ldr	r0, [pc, #528]	; (8012b0c <main+0x150c>)
 80128fc:	f000 fa38 	bl	8012d70 <RVM_Print_String>
 8012900:	20c7      	movs	r0, #199	; 0xc7
 8012902:	f000 f9a3 	bl	8012c4c <RVM_Print_Int>
 8012906:	4882      	ldr	r0, [pc, #520]	; (8012b10 <main+0x1510>)
 8012908:	f000 fa32 	bl	8012d70 <RVM_Print_String>
 801290c:	4881      	ldr	r0, [pc, #516]	; (8012b14 <main+0x1514>)
 801290e:	f000 fa2f 	bl	8012d70 <RVM_Print_String>
 8012912:	4881      	ldr	r0, [pc, #516]	; (8012b18 <main+0x1518>)
 8012914:	f000 fa2c 	bl	8012d70 <RVM_Print_String>
 8012918:	4880      	ldr	r0, [pc, #512]	; (8012b1c <main+0x151c>)
 801291a:	f000 fa29 	bl	8012d70 <RVM_Print_String>
 801291e:	487c      	ldr	r0, [pc, #496]	; (8012b10 <main+0x1510>)
 8012920:	f000 fa26 	bl	8012d70 <RVM_Print_String>
 8012924:	e7fe      	b.n	8012924 <main+0x1324>
    
    /* Set the execution/hypervior properties for both threads, the stack information is from the image header - always set stack to 256 bytes */
    RVM_ASSERT(RVM_Thd_Hyp_Set(RVM_VIRT_USERTHD(VMID), (rvm_ptr_t)(Virt->Image->Regs))==0);
 8012926:	6923      	ldr	r3, [r4, #16]
 8012928:	4638      	mov	r0, r7
 801292a:	6b19      	ldr	r1, [r3, #48]	; 0x30
 801292c:	f000 faac 	bl	8012e88 <RVM_Thd_Hyp_Set>
 8012930:	4683      	mov	fp, r0
 8012932:	b1d8      	cbz	r0, 801296c <main+0x136c>
 8012934:	4873      	ldr	r0, [pc, #460]	; (8012b04 <main+0x1504>)
 8012936:	f000 fa1b 	bl	8012d70 <RVM_Print_String>
 801293a:	4873      	ldr	r0, [pc, #460]	; (8012b08 <main+0x1508>)
 801293c:	f000 fa18 	bl	8012d70 <RVM_Print_String>
 8012940:	4872      	ldr	r0, [pc, #456]	; (8012b0c <main+0x150c>)
 8012942:	f000 fa15 	bl	8012d70 <RVM_Print_String>
 8012946:	20ca      	movs	r0, #202	; 0xca
 8012948:	f000 f980 	bl	8012c4c <RVM_Print_Int>
 801294c:	4870      	ldr	r0, [pc, #448]	; (8012b10 <main+0x1510>)
 801294e:	f000 fa0f 	bl	8012d70 <RVM_Print_String>
 8012952:	4870      	ldr	r0, [pc, #448]	; (8012b14 <main+0x1514>)
 8012954:	f000 fa0c 	bl	8012d70 <RVM_Print_String>
 8012958:	486f      	ldr	r0, [pc, #444]	; (8012b18 <main+0x1518>)
 801295a:	f000 fa09 	bl	8012d70 <RVM_Print_String>
 801295e:	486f      	ldr	r0, [pc, #444]	; (8012b1c <main+0x151c>)
 8012960:	f000 fa06 	bl	8012d70 <RVM_Print_String>
 8012964:	486a      	ldr	r0, [pc, #424]	; (8012b10 <main+0x1510>)
 8012966:	f000 fa03 	bl	8012d70 <RVM_Print_String>
 801296a:	e7fe      	b.n	801296a <main+0x136a>
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VIRT_USERTHD(VMID), (rvm_ptr_t)(Virt->Image->User_Entry), 
 801296c:	6922      	ldr	r2, [r4, #16]
 801296e:	f8d2 9014 	ldr.w	r9, [r2, #20]
 8012972:	69d1      	ldr	r1, [r2, #28]
 8012974:	6990      	ldr	r0, [r2, #24]
 8012976:	f7fd fb9f 	bl	80100b8 <RVM_Stack_Init>
 801297a:	465b      	mov	r3, fp
 801297c:	4602      	mov	r2, r0
 801297e:	4649      	mov	r1, r9
 8012980:	4638      	mov	r0, r7
 8012982:	f000 fa7d 	bl	8012e80 <RVM_Thd_Exec_Set>
 8012986:	b1d8      	cbz	r0, 80129c0 <main+0x13c0>
 8012988:	485e      	ldr	r0, [pc, #376]	; (8012b04 <main+0x1504>)
 801298a:	f000 f9f1 	bl	8012d70 <RVM_Print_String>
 801298e:	485e      	ldr	r0, [pc, #376]	; (8012b08 <main+0x1508>)
 8012990:	f000 f9ee 	bl	8012d70 <RVM_Print_String>
 8012994:	485d      	ldr	r0, [pc, #372]	; (8012b0c <main+0x150c>)
 8012996:	f000 f9eb 	bl	8012d70 <RVM_Print_String>
 801299a:	20cc      	movs	r0, #204	; 0xcc
 801299c:	f000 f956 	bl	8012c4c <RVM_Print_Int>
 80129a0:	485b      	ldr	r0, [pc, #364]	; (8012b10 <main+0x1510>)
 80129a2:	f000 f9e5 	bl	8012d70 <RVM_Print_String>
 80129a6:	485b      	ldr	r0, [pc, #364]	; (8012b14 <main+0x1514>)
 80129a8:	f000 f9e2 	bl	8012d70 <RVM_Print_String>
 80129ac:	485a      	ldr	r0, [pc, #360]	; (8012b18 <main+0x1518>)
 80129ae:	f000 f9df 	bl	8012d70 <RVM_Print_String>
 80129b2:	485a      	ldr	r0, [pc, #360]	; (8012b1c <main+0x151c>)
 80129b4:	f000 f9dc 	bl	8012d70 <RVM_Print_String>
 80129b8:	4855      	ldr	r0, [pc, #340]	; (8012b10 <main+0x1510>)
 80129ba:	f000 f9d9 	bl	8012d70 <RVM_Print_String>
 80129be:	e7fe      	b.n	80129be <main+0x13be>
                                RVM_Stack_Init((rvm_ptr_t)(Virt->Image->User_Stack),Virt->Image->User_Size),0)==0);
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VIRT_INTTHD(VMID), (rvm_ptr_t)(Virt->Image->Int_Entry), 
 80129c0:	6923      	ldr	r3, [r4, #16]
 80129c2:	f8d3 9020 	ldr.w	r9, [r3, #32]
 80129c6:	6a99      	ldr	r1, [r3, #40]	; 0x28
 80129c8:	6a58      	ldr	r0, [r3, #36]	; 0x24
 80129ca:	f7fd fb75 	bl	80100b8 <RVM_Stack_Init>
 80129ce:	4649      	mov	r1, r9
 80129d0:	4602      	mov	r2, r0
 80129d2:	2300      	movs	r3, #0
 80129d4:	4640      	mov	r0, r8
 80129d6:	f000 fa53 	bl	8012e80 <RVM_Thd_Exec_Set>
 80129da:	4681      	mov	r9, r0
 80129dc:	b1d8      	cbz	r0, 8012a16 <main+0x1416>
 80129de:	4849      	ldr	r0, [pc, #292]	; (8012b04 <main+0x1504>)
 80129e0:	f000 f9c6 	bl	8012d70 <RVM_Print_String>
 80129e4:	4848      	ldr	r0, [pc, #288]	; (8012b08 <main+0x1508>)
 80129e6:	f000 f9c3 	bl	8012d70 <RVM_Print_String>
 80129ea:	4848      	ldr	r0, [pc, #288]	; (8012b0c <main+0x150c>)
 80129ec:	f000 f9c0 	bl	8012d70 <RVM_Print_String>
 80129f0:	20ce      	movs	r0, #206	; 0xce
 80129f2:	f000 f92b 	bl	8012c4c <RVM_Print_Int>
 80129f6:	4846      	ldr	r0, [pc, #280]	; (8012b10 <main+0x1510>)
 80129f8:	f000 f9ba 	bl	8012d70 <RVM_Print_String>
 80129fc:	4845      	ldr	r0, [pc, #276]	; (8012b14 <main+0x1514>)
 80129fe:	f000 f9b7 	bl	8012d70 <RVM_Print_String>
 8012a02:	4845      	ldr	r0, [pc, #276]	; (8012b18 <main+0x1518>)
 8012a04:	f000 f9b4 	bl	8012d70 <RVM_Print_String>
 8012a08:	4844      	ldr	r0, [pc, #272]	; (8012b1c <main+0x151c>)
 8012a0a:	f000 f9b1 	bl	8012d70 <RVM_Print_String>
 8012a0e:	4840      	ldr	r0, [pc, #256]	; (8012b10 <main+0x1510>)
 8012a10:	f000 f9ae 	bl	8012d70 <RVM_Print_String>
 8012a14:	e7fe      	b.n	8012a14 <main+0x1414>
                                RVM_Stack_Init((rvm_ptr_t)(Virt->Image->Int_Stack),Virt->Image->Int_Size),0)==0);
    RVM_LOG_S("Init:Thread initialization complete.\r\n");
    
    /* Delegete infinite time to both threads */
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VIRT_USERTHD(VMID), RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
 8012a16:	f8df b10c 	ldr.w	fp, [pc, #268]	; 8012b24 <main+0x1524>
    RVM_ASSERT(RVM_Thd_Hyp_Set(RVM_VIRT_USERTHD(VMID), (rvm_ptr_t)(Virt->Image->Regs))==0);
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VIRT_USERTHD(VMID), (rvm_ptr_t)(Virt->Image->User_Entry), 
                                RVM_Stack_Init((rvm_ptr_t)(Virt->Image->User_Stack),Virt->Image->User_Size),0)==0);
    RVM_ASSERT(RVM_Thd_Exec_Set(RVM_VIRT_INTTHD(VMID), (rvm_ptr_t)(Virt->Image->Int_Entry), 
                                RVM_Stack_Init((rvm_ptr_t)(Virt->Image->Int_Stack),Virt->Image->Int_Size),0)==0);
    RVM_LOG_S("Init:Thread initialization complete.\r\n");
 8012a1a:	4841      	ldr	r0, [pc, #260]	; (8012b20 <main+0x1520>)
 8012a1c:	f000 f9a8 	bl	8012d70 <RVM_Print_String>
    
    /* Delegete infinite time to both threads */
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VIRT_USERTHD(VMID), RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
 8012a20:	4638      	mov	r0, r7
 8012a22:	465a      	mov	r2, fp
 8012a24:	2103      	movs	r1, #3
 8012a26:	f000 fa53 	bl	8012ed0 <RVM_Thd_Time_Xfer>
 8012a2a:	4558      	cmp	r0, fp
 8012a2c:	4607      	mov	r7, r0
 8012a2e:	d01b      	beq.n	8012a68 <main+0x1468>
 8012a30:	4834      	ldr	r0, [pc, #208]	; (8012b04 <main+0x1504>)
 8012a32:	f000 f99d 	bl	8012d70 <RVM_Print_String>
 8012a36:	4834      	ldr	r0, [pc, #208]	; (8012b08 <main+0x1508>)
 8012a38:	f000 f99a 	bl	8012d70 <RVM_Print_String>
 8012a3c:	4833      	ldr	r0, [pc, #204]	; (8012b0c <main+0x150c>)
 8012a3e:	f000 f997 	bl	8012d70 <RVM_Print_String>
 8012a42:	20d2      	movs	r0, #210	; 0xd2
 8012a44:	f000 f902 	bl	8012c4c <RVM_Print_Int>
 8012a48:	4831      	ldr	r0, [pc, #196]	; (8012b10 <main+0x1510>)
 8012a4a:	f000 f991 	bl	8012d70 <RVM_Print_String>
 8012a4e:	4831      	ldr	r0, [pc, #196]	; (8012b14 <main+0x1514>)
 8012a50:	f000 f98e 	bl	8012d70 <RVM_Print_String>
 8012a54:	4830      	ldr	r0, [pc, #192]	; (8012b18 <main+0x1518>)
 8012a56:	f000 f98b 	bl	8012d70 <RVM_Print_String>
 8012a5a:	4830      	ldr	r0, [pc, #192]	; (8012b1c <main+0x151c>)
 8012a5c:	f000 f988 	bl	8012d70 <RVM_Print_String>
 8012a60:	482b      	ldr	r0, [pc, #172]	; (8012b10 <main+0x1510>)
 8012a62:	f000 f985 	bl	8012d70 <RVM_Print_String>
 8012a66:	e7fe      	b.n	8012a66 <main+0x1466>
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VIRT_INTTHD(VMID), RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
 8012a68:	4640      	mov	r0, r8
 8012a6a:	463a      	mov	r2, r7
 8012a6c:	2103      	movs	r1, #3
 8012a6e:	f000 fa2f 	bl	8012ed0 <RVM_Thd_Time_Xfer>
 8012a72:	42b8      	cmp	r0, r7
 8012a74:	d01b      	beq.n	8012aae <main+0x14ae>
 8012a76:	4823      	ldr	r0, [pc, #140]	; (8012b04 <main+0x1504>)
 8012a78:	f000 f97a 	bl	8012d70 <RVM_Print_String>
 8012a7c:	4822      	ldr	r0, [pc, #136]	; (8012b08 <main+0x1508>)
 8012a7e:	f000 f977 	bl	8012d70 <RVM_Print_String>
 8012a82:	4822      	ldr	r0, [pc, #136]	; (8012b0c <main+0x150c>)
 8012a84:	f000 f974 	bl	8012d70 <RVM_Print_String>
 8012a88:	20d3      	movs	r0, #211	; 0xd3
 8012a8a:	f000 f8df 	bl	8012c4c <RVM_Print_Int>
 8012a8e:	4820      	ldr	r0, [pc, #128]	; (8012b10 <main+0x1510>)
 8012a90:	f000 f96e 	bl	8012d70 <RVM_Print_String>
 8012a94:	481f      	ldr	r0, [pc, #124]	; (8012b14 <main+0x1514>)
 8012a96:	f000 f96b 	bl	8012d70 <RVM_Print_String>
 8012a9a:	481f      	ldr	r0, [pc, #124]	; (8012b18 <main+0x1518>)
 8012a9c:	f000 f968 	bl	8012d70 <RVM_Print_String>
 8012aa0:	481e      	ldr	r0, [pc, #120]	; (8012b1c <main+0x151c>)
 8012aa2:	f000 f965 	bl	8012d70 <RVM_Print_String>
 8012aa6:	481a      	ldr	r0, [pc, #104]	; (8012b10 <main+0x1510>)
 8012aa8:	f000 f962 	bl	8012d70 <RVM_Print_String>
 8012aac:	e7fe      	b.n	8012aac <main+0x14ac>
    
    /* Delegate the endpoints to the virtual machine's capability table, only sending allowed.
     * The VMM daemon endpoint is always at 0, the interrupt handler endpoint is always at 1 */
    RVM_ASSERT(RVM_Captbl_Add(RVM_VIRT_CAPTBL(VMID), 0, RVM_BOOT_CAPTBL, RVM_VMM_VMMD_SIG, RME_SIG_FLAG_SND)==0);
 8012aae:	2701      	movs	r7, #1
 8012ab0:	230f      	movs	r3, #15
 8012ab2:	464a      	mov	r2, r9
 8012ab4:	4649      	mov	r1, r9
 8012ab6:	9700      	str	r7, [sp, #0]
 8012ab8:	4630      	mov	r0, r6
 8012aba:	f000 f975 	bl	8012da8 <RVM_Captbl_Add>
 8012abe:	b398      	cbz	r0, 8012b28 <main+0x1528>
 8012ac0:	4810      	ldr	r0, [pc, #64]	; (8012b04 <main+0x1504>)
 8012ac2:	f000 f955 	bl	8012d70 <RVM_Print_String>
 8012ac6:	4810      	ldr	r0, [pc, #64]	; (8012b08 <main+0x1508>)
 8012ac8:	f000 f952 	bl	8012d70 <RVM_Print_String>
 8012acc:	480f      	ldr	r0, [pc, #60]	; (8012b0c <main+0x150c>)
 8012ace:	f000 f94f 	bl	8012d70 <RVM_Print_String>
 8012ad2:	20d7      	movs	r0, #215	; 0xd7
 8012ad4:	f000 f8ba 	bl	8012c4c <RVM_Print_Int>
 8012ad8:	480d      	ldr	r0, [pc, #52]	; (8012b10 <main+0x1510>)
 8012ada:	f000 f949 	bl	8012d70 <RVM_Print_String>
 8012ade:	480d      	ldr	r0, [pc, #52]	; (8012b14 <main+0x1514>)
 8012ae0:	f000 f946 	bl	8012d70 <RVM_Print_String>
 8012ae4:	480c      	ldr	r0, [pc, #48]	; (8012b18 <main+0x1518>)
 8012ae6:	f000 f943 	bl	8012d70 <RVM_Print_String>
 8012aea:	480c      	ldr	r0, [pc, #48]	; (8012b1c <main+0x151c>)
 8012aec:	f000 f940 	bl	8012d70 <RVM_Print_String>
 8012af0:	4807      	ldr	r0, [pc, #28]	; (8012b10 <main+0x1510>)
 8012af2:	f000 f93d 	bl	8012d70 <RVM_Print_String>
 8012af6:	e7fe      	b.n	8012af6 <main+0x14f6>
 8012af8:	08013a30 	.word	0x08013a30
 8012afc:	08013584 	.word	0x08013584
 8012b00:	0801314c 	.word	0x0801314c
 8012b04:	08012f08 	.word	0x08012f08
 8012b08:	08013090 	.word	0x08013090
 8012b0c:	08012fa4 	.word	0x08012fa4
 8012b10:	080134b0 	.word	0x080134b0
 8012b14:	08012fac 	.word	0x08012fac
 8012b18:	08012fb8 	.word	0x08012fb8
 8012b1c:	080130e4 	.word	0x080130e4
 8012b20:	08013a68 	.word	0x08013a68
 8012b24:	7ffffffe 	.word	0x7ffffffe
    RVM_ASSERT(RVM_Captbl_Add(RVM_VIRT_CAPTBL(VMID), 1, RVM_VIRT_TBL_THDSIG, VMID*3+2, RME_SIG_FLAG_SND|
 8012b28:	201f      	movs	r0, #31
 8012b2a:	4653      	mov	r3, sl
 8012b2c:	4639      	mov	r1, r7
 8012b2e:	2209      	movs	r2, #9
 8012b30:	9000      	str	r0, [sp, #0]
 8012b32:	4630      	mov	r0, r6
 8012b34:	f000 f938 	bl	8012da8 <RVM_Captbl_Add>
 8012b38:	2800      	cmp	r0, #0
 8012b3a:	d131      	bne.n	8012ba0 <main+0x15a0>
 8012b3c:	4680      	mov	r8, r0
 8012b3e:	46a9      	mov	r9, r5
                                                                                       RME_SIG_FLAG_RCV_BS|
                                                                                       RME_SIG_FLAG_RCV_BM|
                                                                                       RME_SIG_FLAG_RCV_NS|
                                                                                       RME_SIG_FLAG_RCV_NM)==0);
    /* Delegate the kernel function capabilities to the VM according to their respective declarations */
    for(Count=0;Count<Virt->Image->Kcap_Num;Count++)
 8012b40:	6927      	ldr	r7, [r4, #16]
    {
        RVM_ASSERT(RVM_Captbl_Kern(RVM_VIRT_CAPTBL(VMID), Count+2, RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KERN, 
 8012b42:	f108 0102 	add.w	r1, r8, #2
 8012b46:	2304      	movs	r3, #4
 8012b48:	2200      	movs	r2, #0
                                                                                       RME_SIG_FLAG_RCV_BS|
                                                                                       RME_SIG_FLAG_RCV_BM|
                                                                                       RME_SIG_FLAG_RCV_NS|
                                                                                       RME_SIG_FLAG_RCV_NM)==0);
    /* Delegate the kernel function capabilities to the VM according to their respective declarations */
    for(Count=0;Count<Virt->Image->Kcap_Num;Count++)
 8012b4a:	6d7d      	ldr	r5, [r7, #84]	; 0x54
    {
        RVM_ASSERT(RVM_Captbl_Kern(RVM_VIRT_CAPTBL(VMID), Count+2, RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KERN, 
 8012b4c:	4630      	mov	r0, r6
                                                                                       RME_SIG_FLAG_RCV_BS|
                                                                                       RME_SIG_FLAG_RCV_BM|
                                                                                       RME_SIG_FLAG_RCV_NS|
                                                                                       RME_SIG_FLAG_RCV_NM)==0);
    /* Delegate the kernel function capabilities to the VM according to their respective declarations */
    for(Count=0;Count<Virt->Image->Kcap_Num;Count++)
 8012b4e:	45a8      	cmp	r8, r5
 8012b50:	d242      	bcs.n	8012bd8 <main+0x15d8>
    {
        RVM_ASSERT(RVM_Captbl_Kern(RVM_VIRT_CAPTBL(VMID), Count+2, RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KERN, 
 8012b52:	6dbf      	ldr	r7, [r7, #88]	; 0x58
 8012b54:	f857 7028 	ldr.w	r7, [r7, r8, lsl #2]
                                                                                       RME_SIG_FLAG_RCV_BS|
                                                                                       RME_SIG_FLAG_RCV_BM|
                                                                                       RME_SIG_FLAG_RCV_NS|
                                                                                       RME_SIG_FLAG_RCV_NM)==0);
    /* Delegate the kernel function capabilities to the VM according to their respective declarations */
    for(Count=0;Count<Virt->Image->Kcap_Num;Count++)
 8012b58:	f108 0801 	add.w	r8, r8, #1
    {
        RVM_ASSERT(RVM_Captbl_Kern(RVM_VIRT_CAPTBL(VMID), Count+2, RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KERN, 
 8012b5c:	9701      	str	r7, [sp, #4]
 8012b5e:	9700      	str	r7, [sp, #0]
 8012b60:	f000 f930 	bl	8012dc4 <RVM_Captbl_Kern>
 8012b64:	2800      	cmp	r0, #0
 8012b66:	d0eb      	beq.n	8012b40 <main+0x1540>
 8012b68:	482a      	ldr	r0, [pc, #168]	; (8012c14 <main+0x1614>)
 8012b6a:	f000 f901 	bl	8012d70 <RVM_Print_String>
 8012b6e:	482a      	ldr	r0, [pc, #168]	; (8012c18 <main+0x1618>)
 8012b70:	f000 f8fe 	bl	8012d70 <RVM_Print_String>
 8012b74:	4829      	ldr	r0, [pc, #164]	; (8012c1c <main+0x161c>)
 8012b76:	f000 f8fb 	bl	8012d70 <RVM_Print_String>
 8012b7a:	20e1      	movs	r0, #225	; 0xe1
 8012b7c:	f000 f866 	bl	8012c4c <RVM_Print_Int>
 8012b80:	4827      	ldr	r0, [pc, #156]	; (8012c20 <main+0x1620>)
 8012b82:	f000 f8f5 	bl	8012d70 <RVM_Print_String>
 8012b86:	4827      	ldr	r0, [pc, #156]	; (8012c24 <main+0x1624>)
 8012b88:	f000 f8f2 	bl	8012d70 <RVM_Print_String>
 8012b8c:	4826      	ldr	r0, [pc, #152]	; (8012c28 <main+0x1628>)
 8012b8e:	f000 f8ef 	bl	8012d70 <RVM_Print_String>
 8012b92:	4826      	ldr	r0, [pc, #152]	; (8012c2c <main+0x162c>)
 8012b94:	f000 f8ec 	bl	8012d70 <RVM_Print_String>
 8012b98:	4821      	ldr	r0, [pc, #132]	; (8012c20 <main+0x1620>)
 8012b9a:	f000 f8e9 	bl	8012d70 <RVM_Print_String>
 8012b9e:	e7fe      	b.n	8012b9e <main+0x159e>
    RVM_ASSERT(RVM_Thd_Time_Xfer(RVM_VIRT_INTTHD(VMID), RVM_BOOT_INIT_THD, RVM_THD_INF_TIME)==RVM_THD_INF_TIME);
    
    /* Delegate the endpoints to the virtual machine's capability table, only sending allowed.
     * The VMM daemon endpoint is always at 0, the interrupt handler endpoint is always at 1 */
    RVM_ASSERT(RVM_Captbl_Add(RVM_VIRT_CAPTBL(VMID), 0, RVM_BOOT_CAPTBL, RVM_VMM_VMMD_SIG, RME_SIG_FLAG_SND)==0);
    RVM_ASSERT(RVM_Captbl_Add(RVM_VIRT_CAPTBL(VMID), 1, RVM_VIRT_TBL_THDSIG, VMID*3+2, RME_SIG_FLAG_SND|
 8012ba0:	481c      	ldr	r0, [pc, #112]	; (8012c14 <main+0x1614>)
 8012ba2:	f000 f8e5 	bl	8012d70 <RVM_Print_String>
 8012ba6:	481c      	ldr	r0, [pc, #112]	; (8012c18 <main+0x1618>)
 8012ba8:	f000 f8e2 	bl	8012d70 <RVM_Print_String>
 8012bac:	481b      	ldr	r0, [pc, #108]	; (8012c1c <main+0x161c>)
 8012bae:	f000 f8df 	bl	8012d70 <RVM_Print_String>
 8012bb2:	20dc      	movs	r0, #220	; 0xdc
 8012bb4:	f000 f84a 	bl	8012c4c <RVM_Print_Int>
 8012bb8:	4819      	ldr	r0, [pc, #100]	; (8012c20 <main+0x1620>)
 8012bba:	f000 f8d9 	bl	8012d70 <RVM_Print_String>
 8012bbe:	4819      	ldr	r0, [pc, #100]	; (8012c24 <main+0x1624>)
 8012bc0:	f000 f8d6 	bl	8012d70 <RVM_Print_String>
 8012bc4:	4818      	ldr	r0, [pc, #96]	; (8012c28 <main+0x1628>)
 8012bc6:	f000 f8d3 	bl	8012d70 <RVM_Print_String>
 8012bca:	4818      	ldr	r0, [pc, #96]	; (8012c2c <main+0x162c>)
 8012bcc:	f000 f8d0 	bl	8012d70 <RVM_Print_String>
 8012bd0:	4813      	ldr	r0, [pc, #76]	; (8012c20 <main+0x1620>)
 8012bd2:	f000 f8cd 	bl	8012d70 <RVM_Print_String>
 8012bd6:	e7fe      	b.n	8012bd6 <main+0x15d6>
        RVM_ASSERT(RVM_Captbl_Kern(RVM_VIRT_CAPTBL(VMID), Count+2, RVM_BOOT_CAPTBL, RVM_BOOT_INIT_KERN, 
                                   Virt->Image->Kcap[Count], Virt->Image->Kcap[Count])==0);
    }
    
    /* Initialize all other data structures */
    RVM_List_Crt(&(Virt->Evt_Head));
 8012bd8:	f104 0044 	add.w	r0, r4, #68	; 0x44
 8012bdc:	f000 f828 	bl	8012c30 <RVM_List_Crt>
    /* By default, interrupts are disabled, and booting not done */
    Virt->Sched.State=RVM_VM_RUNNING;
 8012be0:	2100      	movs	r1, #0
    Virt->Sched.Period=RVM_DEF_PERIOD;
 8012be2:	2201      	movs	r2, #1
    Virt->Sched.Slices_Left=Virt->Image->Slices;
 8012be4:	6923      	ldr	r3, [r4, #16]
    }
    
    /* Initialize all other data structures */
    RVM_List_Crt(&(Virt->Evt_Head));
    /* By default, interrupts are disabled, and booting not done */
    Virt->Sched.State=RVM_VM_RUNNING;
 8012be6:	6361      	str	r1, [r4, #52]	; 0x34
    Virt->Sched.Period=RVM_DEF_PERIOD;
    Virt->Sched.Slices_Left=Virt->Image->Slices;
    _RVM_Set_Rdy(Virt);
 8012be8:	4620      	mov	r0, r4
    
    /* Initialize all other data structures */
    RVM_List_Crt(&(Virt->Evt_Head));
    /* By default, interrupts are disabled, and booting not done */
    Virt->Sched.State=RVM_VM_RUNNING;
    Virt->Sched.Period=RVM_DEF_PERIOD;
 8012bea:	6422      	str	r2, [r4, #64]	; 0x40
    Virt->Sched.Slices_Left=Virt->Image->Slices;
 8012bec:	6b9b      	ldr	r3, [r3, #56]	; 0x38
 8012bee:	63a3      	str	r3, [r4, #56]	; 0x38
    _RVM_Set_Rdy(Virt);
 8012bf0:	f7fd fce4 	bl	80105bc <_RVM_Set_Rdy>
    _RVM_Wheel_Ins(Virt,Virt->Sched.Period);
 8012bf4:	6c21      	ldr	r1, [r4, #64]	; 0x40
 8012bf6:	4620      	mov	r0, r4
 8012bf8:	f7fe fce4 	bl	80115c4 <_RVM_Wheel_Ins>

    /* Update the image */
    if(((*Image)->Next_Image)!=0)
 8012bfc:	f8d9 505c 	ldr.w	r5, [r9, #92]	; 0x5c
 8012c00:	b105      	cbz	r5, 8012c04 <main+0x1604>
        (*Image)=(struct RVM_Image*)(*((*Image)->Next_Image));
 8012c02:	682d      	ldr	r5, [r5, #0]
 8012c04:	9b03      	ldr	r3, [sp, #12]
 8012c06:	3303      	adds	r3, #3
 8012c08:	9303      	str	r3, [sp, #12]
 8012c0a:	9b04      	ldr	r3, [sp, #16]
 8012c0c:	3302      	adds	r3, #2
 8012c0e:	9304      	str	r3, [sp, #16]
 8012c10:	f7ff ba5f 	b.w	80120d2 <main+0xad2>
 8012c14:	08012f08 	.word	0x08012f08
 8012c18:	08013090 	.word	0x08013090
 8012c1c:	08012fa4 	.word	0x08012fa4
 8012c20:	080134b0 	.word	0x080134b0
 8012c24:	08012fac 	.word	0x08012fac
 8012c28:	08012fb8 	.word	0x08012fb8
 8012c2c:	080130e4 	.word	0x080130e4

08012c30 <RVM_List_Crt>:
Output      : None.
Return      : None.
******************************************************************************/
void RVM_List_Crt(volatile struct RVM_List* Head)
{
    Head->Prev=(struct RVM_List*)Head;
 8012c30:	6000      	str	r0, [r0, #0]
    Head->Next=(struct RVM_List*)Head;
 8012c32:	6040      	str	r0, [r0, #4]
 8012c34:	4770      	bx	lr
 8012c36:	bf00      	nop

08012c38 <RVM_List_Del>:
Output      : None.
Return      : None.
******************************************************************************/
void RVM_List_Del(volatile struct RVM_List* Prev,volatile struct RVM_List* Next)
{
    Next->Prev=(struct RVM_List*)Prev;
 8012c38:	6008      	str	r0, [r1, #0]
    Prev->Next=(struct RVM_List*)Next;
 8012c3a:	6041      	str	r1, [r0, #4]
 8012c3c:	4770      	bx	lr
 8012c3e:	bf00      	nop

08012c40 <RVM_List_Ins>:
******************************************************************************/
void RVM_List_Ins(volatile struct RVM_List* New,
                  volatile struct RVM_List* Prev,
                  volatile struct RVM_List* Next)
{
    Next->Prev=(struct RVM_List*)New;
 8012c40:	6010      	str	r0, [r2, #0]
    New->Next=(struct RVM_List*)Next;
 8012c42:	6042      	str	r2, [r0, #4]
    New->Prev=(struct RVM_List*)Prev;
 8012c44:	6001      	str	r1, [r0, #0]
    Prev->Next=(struct RVM_List*)New;
 8012c46:	6048      	str	r0, [r1, #4]
 8012c48:	4770      	bx	lr
 8012c4a:	bf00      	nop

08012c4c <RVM_Print_Int>:
    rvm_cnt_t Count;
    rvm_cnt_t Num;
    rvm_ptr_t Div;
    
    /* how many digits are there? */
    if(Int==0)
 8012c4c:	2800      	cmp	r0, #0
Input       : rvm_cnt_t Int - The integer to print.
Output      : None.
Return      : rvm_cnt_t - The length of the string printed.
******************************************************************************/
rvm_cnt_t RVM_Print_Int(rvm_cnt_t Int)
{
 8012c4e:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    rvm_cnt_t Count;
    rvm_cnt_t Num;
    rvm_ptr_t Div;
    
    /* how many digits are there? */
    if(Int==0)
 8012c52:	d052      	beq.n	8012cfa <RVM_Print_Int+0xae>
    {
        RVM_Putchar('0');
        return 1;
    }
    else if(Int<0)
 8012c54:	db25      	blt.n	8012ca2 <RVM_Print_Int+0x56>
    else
    {
        /* How many digits are there? */
        Count=0;
        Div=1;
        Iter=Int;
 8012c56:	4605      	mov	r5, r0
    }
    else
    {
        /* How many digits are there? */
        Count=0;
        Div=1;
 8012c58:	2401      	movs	r4, #1
        }
    }
    else
    {
        /* How many digits are there? */
        Count=0;
 8012c5a:	2600      	movs	r6, #0
        Div=1;
        Iter=Int;
        while(Iter!=0)
        {
            Iter/=10;
 8012c5c:	492d      	ldr	r1, [pc, #180]	; (8012d14 <RVM_Print_Int+0xc8>)
    else
    {
        /* How many digits are there? */
        Count=0;
        Div=1;
        Iter=Int;
 8012c5e:	4603      	mov	r3, r0
        while(Iter!=0)
        {
            Iter/=10;
 8012c60:	fba1 2303 	umull	r2, r3, r1, r3
            Count++;
            Div*=10;
 8012c64:	eb04 0484 	add.w	r4, r4, r4, lsl #2
        Div=1;
        Iter=Int;
        while(Iter!=0)
        {
            Iter/=10;
            Count++;
 8012c68:	3601      	adds	r6, #1
        Count=0;
        Div=1;
        Iter=Int;
        while(Iter!=0)
        {
            Iter/=10;
 8012c6a:	4a2a      	ldr	r2, [pc, #168]	; (8012d14 <RVM_Print_Int+0xc8>)
    {
        /* How many digits are there? */
        Count=0;
        Div=1;
        Iter=Int;
        while(Iter!=0)
 8012c6c:	08db      	lsrs	r3, r3, #3
        {
            Iter/=10;
            Count++;
            Div*=10;
 8012c6e:	ea4f 0444 	mov.w	r4, r4, lsl #1
    {
        /* How many digits are there? */
        Count=0;
        Div=1;
        Iter=Int;
        while(Iter!=0)
 8012c72:	d1f5      	bne.n	8012c60 <RVM_Print_Int+0x14>
        {
            Iter/=10;
            Count++;
            Div*=10;
        }
        Div/=10;
 8012c74:	fba2 3404 	umull	r3, r4, r2, r4
        while(Count>0)
        {
            Count--;
            RVM_Putchar(Iter/Div+'0');
            Iter=Iter%Div;
            Div/=10;
 8012c78:	4690      	mov	r8, r2
        {
            Iter/=10;
            Count++;
            Div*=10;
        }
        Div/=10;
 8012c7a:	4637      	mov	r7, r6
 8012c7c:	08e4      	lsrs	r4, r4, #3
        Iter=Int;
        Num=Count;
        
        while(Count>0)
        {
            Count--;
 8012c7e:	3f01      	subs	r7, #1
            RVM_Putchar(Iter/Div+'0');
 8012c80:	fbb5 f3f4 	udiv	r3, r5, r4
 8012c84:	f103 0030 	add.w	r0, r3, #48	; 0x30
            Iter=Iter%Div;
 8012c88:	fb04 5513 	mls	r5, r4, r3, r5
            Div/=10;
 8012c8c:	fba8 3404 	umull	r3, r4, r8, r4
        Num=Count;
        
        while(Count>0)
        {
            Count--;
            RVM_Putchar(Iter/Div+'0');
 8012c90:	b2c0      	uxtb	r0, r0
 8012c92:	f7fd fa07 	bl	80100a4 <RVM_Putchar>
            Iter=Iter%Div;
            Div/=10;
 8012c96:	08e4      	lsrs	r4, r4, #3
        Div/=10;
        
        Iter=Int;
        Num=Count;
        
        while(Count>0)
 8012c98:	2f00      	cmp	r7, #0
 8012c9a:	d1f0      	bne.n	8012c7e <RVM_Print_Int+0x32>
 8012c9c:	4630      	mov	r0, r6
 8012c9e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    else if(Int<0)
    {
        /* How many digits are there? */
        Count=0;
        Div=1;
        Iter=-Int;
 8012ca2:	4245      	negs	r5, r0
        while(Iter!=0)
 8012ca4:	b37d      	cbz	r5, 8012d06 <RVM_Print_Int+0xba>
 8012ca6:	462b      	mov	r3, r5
 8012ca8:	2401      	movs	r4, #1
 8012caa:	2000      	movs	r0, #0
        {
            Iter/=10;
 8012cac:	4919      	ldr	r1, [pc, #100]	; (8012d14 <RVM_Print_Int+0xc8>)
 8012cae:	e000      	b.n	8012cb2 <RVM_Print_Int+0x66>
            Count++;
 8012cb0:	4638      	mov	r0, r7
        Count=0;
        Div=1;
        Iter=-Int;
        while(Iter!=0)
        {
            Iter/=10;
 8012cb2:	fba1 2303 	umull	r2, r3, r1, r3
            Count++;
            Div*=10;
 8012cb6:	eb04 0484 	add.w	r4, r4, r4, lsl #2
        Count=0;
        Div=1;
        Iter=-Int;
        while(Iter!=0)
        {
            Iter/=10;
 8012cba:	4a16      	ldr	r2, [pc, #88]	; (8012d14 <RVM_Print_Int+0xc8>)
            Count++;
 8012cbc:	1c47      	adds	r7, r0, #1
    {
        /* How many digits are there? */
        Count=0;
        Div=1;
        Iter=-Int;
        while(Iter!=0)
 8012cbe:	08db      	lsrs	r3, r3, #3
        {
            Iter/=10;
            Count++;
            Div*=10;
 8012cc0:	ea4f 0444 	mov.w	r4, r4, lsl #1
    {
        /* How many digits are there? */
        Count=0;
        Div=1;
        Iter=-Int;
        while(Iter!=0)
 8012cc4:	d1f4      	bne.n	8012cb0 <RVM_Print_Int+0x64>
        {
            Iter/=10;
            Count++;
            Div*=10;
        }
        Div/=10;
 8012cc6:	fba2 3404 	umull	r3, r4, r2, r4
        
        RVM_Putchar('-');
        Iter=-Int;
        Num=Count+1;
 8012cca:	1c86      	adds	r6, r0, #2
            Count++;
            Div*=10;
        }
        Div/=10;
        
        RVM_Putchar('-');
 8012ccc:	202d      	movs	r0, #45	; 0x2d
        while(Count>0)
        {
            Count--;
            RVM_Putchar(Iter/Div+'0');
            Iter=Iter%Div;
            Div/=10;
 8012cce:	4690      	mov	r8, r2
        {
            Iter/=10;
            Count++;
            Div*=10;
        }
        Div/=10;
 8012cd0:	08e4      	lsrs	r4, r4, #3
        
        RVM_Putchar('-');
 8012cd2:	f7fd f9e7 	bl	80100a4 <RVM_Putchar>
        Iter=-Int;
        Num=Count+1;
        
        while(Count>0)
        {
            Count--;
 8012cd6:	3f01      	subs	r7, #1
            RVM_Putchar(Iter/Div+'0');
 8012cd8:	fbb5 f3f4 	udiv	r3, r5, r4
 8012cdc:	f103 0030 	add.w	r0, r3, #48	; 0x30
            Iter=Iter%Div;
 8012ce0:	fb04 5513 	mls	r5, r4, r3, r5
            Div/=10;
 8012ce4:	fba8 3404 	umull	r3, r4, r8, r4
        Num=Count+1;
        
        while(Count>0)
        {
            Count--;
            RVM_Putchar(Iter/Div+'0');
 8012ce8:	b2c0      	uxtb	r0, r0
 8012cea:	f7fd f9db 	bl	80100a4 <RVM_Putchar>
            Iter=Iter%Div;
            Div/=10;
 8012cee:	08e4      	lsrs	r4, r4, #3
        
        RVM_Putchar('-');
        Iter=-Int;
        Num=Count+1;
        
        while(Count>0)
 8012cf0:	2f00      	cmp	r7, #0
 8012cf2:	d1f0      	bne.n	8012cd6 <RVM_Print_Int+0x8a>
 8012cf4:	4630      	mov	r0, r6
 8012cf6:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    rvm_ptr_t Div;
    
    /* how many digits are there? */
    if(Int==0)
    {
        RVM_Putchar('0');
 8012cfa:	2030      	movs	r0, #48	; 0x30
 8012cfc:	f7fd f9d2 	bl	80100a4 <RVM_Putchar>
        return 1;
 8012d00:	2001      	movs	r0, #1
 8012d02:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
            Count++;
            Div*=10;
        }
        Div/=10;
        
        RVM_Putchar('-');
 8012d06:	202d      	movs	r0, #45	; 0x2d
 8012d08:	f7fd f9cc 	bl	80100a4 <RVM_Putchar>
        Iter=-Int;
        Num=Count+1;
 8012d0c:	2001      	movs	r0, #1
            Div/=10;
        }
    }
    
    return Num;
}
 8012d0e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8012d12:	bf00      	nop
 8012d14:	cccccccd 	.word	0xcccccccd

08012d18 <RVM_Print_Uint>:
Input       : rvm_ptr_t Uint - The unsigned integer to print.
Output      : None.
Return      : rvm_cnt_t - The length of the string printed.
******************************************************************************/
rvm_cnt_t RVM_Print_Uint(rvm_ptr_t Uint)
{
 8012d18:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    rvm_ptr_t Iter;
    rvm_cnt_t Count;
    rvm_cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
 8012d1a:	b308      	cbz	r0, 8012d60 <RVM_Print_Uint+0x48>
 8012d1c:	4605      	mov	r5, r0
    else
    {
        /* Filter out all the zeroes */
        Count=0;
        Iter=Uint;
        while((Iter>>((sizeof(rvm_ptr_t)*8)-4))==0)
 8012d1e:	0f00      	lsrs	r0, r0, #28
 8012d20:	d123      	bne.n	8012d6a <RVM_Print_Uint+0x52>
 8012d22:	462b      	mov	r3, r5
        {
            Iter<<=4;
 8012d24:	011b      	lsls	r3, r3, #4
            Count++;
 8012d26:	3001      	adds	r0, #1
    else
    {
        /* Filter out all the zeroes */
        Count=0;
        Iter=Uint;
        while((Iter>>((sizeof(rvm_ptr_t)*8)-4))==0)
 8012d28:	0f1a      	lsrs	r2, r3, #28
 8012d2a:	d0fb      	beq.n	8012d24 <RVM_Print_Uint+0xc>
        {
            Iter<<=4;
            Count++;
        }
        /* Count is the number of pts to print */
        Count=sizeof(rvm_ptr_t)*2-Count;
 8012d2c:	f1c0 0008 	rsb	r0, r0, #8
        Num=Count;
        while(Count>0)
 8012d30:	2800      	cmp	r0, #0
        {
            Iter<<=4;
            Count++;
        }
        /* Count is the number of pts to print */
        Count=sizeof(rvm_ptr_t)*2-Count;
 8012d32:	4606      	mov	r6, r0
        Num=Count;
        while(Count>0)
 8012d34:	dd13      	ble.n	8012d5e <RVM_Print_Uint+0x46>
 8012d36:	1e74      	subs	r4, r6, #1
        {
            Iter<<=4;
            Count++;
        }
        /* Count is the number of pts to print */
        Count=sizeof(rvm_ptr_t)*2-Count;
 8012d38:	4637      	mov	r7, r6
 8012d3a:	00a4      	lsls	r4, r4, #2
        Num=Count;
        while(Count>0)
        {
            Count--;
            Iter=(Uint>>(Count*4))&0x0F;
 8012d3c:	fa25 f304 	lsr.w	r3, r5, r4
        /* Count is the number of pts to print */
        Count=sizeof(rvm_ptr_t)*2-Count;
        Num=Count;
        while(Count>0)
        {
            Count--;
 8012d40:	3f01      	subs	r7, #1
 8012d42:	3c04      	subs	r4, #4
            Iter=(Uint>>(Count*4))&0x0F;
 8012d44:	f003 030f 	and.w	r3, r3, #15
            if(Iter<10)
 8012d48:	2b09      	cmp	r3, #9
                RVM_Putchar('0'+Iter);
 8012d4a:	f103 0030 	add.w	r0, r3, #48	; 0x30
            else
                RVM_Putchar('A'+Iter-10);
 8012d4e:	bf88      	it	hi
 8012d50:	f103 0037 	addhi.w	r0, r3, #55	; 0x37
 8012d54:	f7fd f9a6 	bl	80100a4 <RVM_Putchar>
            Count++;
        }
        /* Count is the number of pts to print */
        Count=sizeof(rvm_ptr_t)*2-Count;
        Num=Count;
        while(Count>0)
 8012d58:	2f00      	cmp	r7, #0
 8012d5a:	d1ef      	bne.n	8012d3c <RVM_Print_Uint+0x24>
 8012d5c:	4630      	mov	r0, r6
                RVM_Putchar('A'+Iter-10);
        }
    }
    
    return Num;
}
 8012d5e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
    rvm_cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
    {
        RVM_Putchar('0');
 8012d60:	2030      	movs	r0, #48	; 0x30
 8012d62:	f7fd f99f 	bl	80100a4 <RVM_Putchar>
        return 1;
 8012d66:	2001      	movs	r0, #1
 8012d68:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
        {
            Iter<<=4;
            Count++;
        }
        /* Count is the number of pts to print */
        Count=sizeof(rvm_ptr_t)*2-Count;
 8012d6a:	2608      	movs	r6, #8
 8012d6c:	e7e3      	b.n	8012d36 <RVM_Print_Uint+0x1e>
 8012d6e:	bf00      	nop

08012d70 <RVM_Print_String>:
Input       : rvm_s8_t* String - The string to print.
Output      : None.
Return      : rvm_cnt_t - The length of the string printed, the '\0' is not included.
******************************************************************************/
rvm_cnt_t RVM_Print_String(rvm_s8_t* String)
{
 8012d70:	b538      	push	{r3, r4, r5, lr}
 8012d72:	1e45      	subs	r5, r0, #1
    rvm_cnt_t Count;
    
    Count=0;
 8012d74:	2400      	movs	r4, #0
 8012d76:	e004      	b.n	8012d82 <RVM_Print_String+0x12>
    while(Count<RVM_USER_DEBUG_MAX_STR)
    {
        if(String[Count]=='\0')
            break;
        
        RVM_Putchar(String[Count++]);
 8012d78:	3401      	adds	r4, #1
 8012d7a:	f7fd f993 	bl	80100a4 <RVM_Putchar>
rvm_cnt_t RVM_Print_String(rvm_s8_t* String)
{
    rvm_cnt_t Count;
    
    Count=0;
    while(Count<RVM_USER_DEBUG_MAX_STR)
 8012d7e:	2c80      	cmp	r4, #128	; 0x80
 8012d80:	d004      	beq.n	8012d8c <RVM_Print_String+0x1c>
    {
        if(String[Count]=='\0')
 8012d82:	f915 3f01 	ldrsb.w	r3, [r5, #1]!
            break;
        
        RVM_Putchar(String[Count++]);
 8012d86:	b2d8      	uxtb	r0, r3
    rvm_cnt_t Count;
    
    Count=0;
    while(Count<RVM_USER_DEBUG_MAX_STR)
    {
        if(String[Count]=='\0')
 8012d88:	2b00      	cmp	r3, #0
 8012d8a:	d1f5      	bne.n	8012d78 <RVM_Print_String+0x8>
        
        RVM_Putchar(String[Count++]);
    }
    
    return Count;
}
 8012d8c:	4620      	mov	r0, r4
 8012d8e:	bd38      	pop	{r3, r4, r5, pc}

08012d90 <RVM_Captbl_Crt>:
Output      : None.
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Captbl_Crt(rvm_cid_t Cap_Captbl_Crt, rvm_cid_t Cap_Kmem, 
                         rvm_cid_t Cap_Captbl, rvm_ptr_t Raddr, rvm_ptr_t Entry_Num)
{
 8012d90:	b430      	push	{r4, r5}
 8012d92:	461d      	mov	r5, r3
    return RVM_CAP_OP(RME_SVC_CAPTBL_CRT, Cap_Captbl_Crt, 
 8012d94:	b294      	uxth	r4, r2
 8012d96:	9b02      	ldr	r3, [sp, #8]
 8012d98:	f440 2010 	orr.w	r0, r0, #589824	; 0x90000
 8012d9c:	462a      	mov	r2, r5
 8012d9e:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
                      RVM_PARAM_D1(Cap_Kmem)|RVM_PARAM_D0(Cap_Captbl),
                      Raddr,
                      Entry_Num);
}
 8012da2:	bc30      	pop	{r4, r5}
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Captbl_Crt(rvm_cid_t Cap_Captbl_Crt, rvm_cid_t Cap_Kmem, 
                         rvm_cid_t Cap_Captbl, rvm_ptr_t Raddr, rvm_ptr_t Entry_Num)
{
    return RVM_CAP_OP(RME_SVC_CAPTBL_CRT, Cap_Captbl_Crt, 
 8012da4:	f7fd b95e 	b.w	8010064 <RVM_Svc>

08012da8 <RVM_Captbl_Add>:
Output      : None.
Return      : rvm_ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
rvm_ret_t RVM_Captbl_Add(rvm_cid_t Cap_Captbl_Dst, rvm_cid_t Cap_Dst, 
                         rvm_cid_t Cap_Captbl_Src, rvm_cid_t Cap_Src, rvm_ptr_t Flags)
{
 8012da8:	b410      	push	{r4}
    return RVM_CAP_OP(RME_SVC_CAPTBL_ADD, 0,
 8012daa:	b29c      	uxth	r4, r3
 8012dac:	f360 411f 	bfi	r1, r0, #16, #16
 8012db0:	9b01      	ldr	r3, [sp, #4]
 8012db2:	f44f 2040 	mov.w	r0, #786432	; 0xc0000
 8012db6:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
                      RVM_PARAM_D1(Cap_Captbl_Dst)|RVM_PARAM_D0(Cap_Dst),
                      RVM_PARAM_D1(Cap_Captbl_Src)|RVM_PARAM_D0(Cap_Src),Flags);
}
 8012dba:	f85d 4b04 	ldr.w	r4, [sp], #4
Return      : rvm_ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
rvm_ret_t RVM_Captbl_Add(rvm_cid_t Cap_Captbl_Dst, rvm_cid_t Cap_Dst, 
                         rvm_cid_t Cap_Captbl_Src, rvm_cid_t Cap_Src, rvm_ptr_t Flags)
{
    return RVM_CAP_OP(RME_SVC_CAPTBL_ADD, 0,
 8012dbe:	f7fd b951 	b.w	8010064 <RVM_Svc>
 8012dc2:	bf00      	nop

08012dc4 <RVM_Captbl_Kern>:
Return      : rvm_ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
rvm_ret_t RVM_Captbl_Kern(rvm_cid_t Cap_Captbl_Dst, rvm_cid_t Cap_Dst, 
                          rvm_cid_t Cap_Captbl_Src, rvm_cid_t Cap_Src,
                          rvm_ptr_t Start, rvm_ptr_t End)
{
 8012dc4:	b430      	push	{r4, r5}
 8012dc6:	9c02      	ldr	r4, [sp, #8]
    return RVM_CAP_OP(RME_SVC_CAPTBL_ADD, 0,
 8012dc8:	b29d      	uxth	r5, r3
Return      : rvm_ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
rvm_ret_t RVM_Captbl_Kern(rvm_cid_t Cap_Captbl_Dst, rvm_cid_t Cap_Dst, 
                          rvm_cid_t Cap_Captbl_Src, rvm_cid_t Cap_Src,
                          rvm_ptr_t Start, rvm_ptr_t End)
{
 8012dca:	9b03      	ldr	r3, [sp, #12]
    return RVM_CAP_OP(RME_SVC_CAPTBL_ADD, 0,
 8012dcc:	f360 411f 	bfi	r1, r0, #16, #16
 8012dd0:	ea45 4202 	orr.w	r2, r5, r2, lsl #16
 8012dd4:	f44f 2040 	mov.w	r0, #786432	; 0xc0000
 8012dd8:	ea44 4303 	orr.w	r3, r4, r3, lsl #16
                      RVM_PARAM_D1(Cap_Captbl_Dst)|RVM_PARAM_D0(Cap_Dst),
                      RVM_PARAM_D1(Cap_Captbl_Src)|RVM_PARAM_D0(Cap_Src),
                      RVM_KERN_FLAG(End,Start));
}
 8012ddc:	bc30      	pop	{r4, r5}
******************************************************************************/
rvm_ret_t RVM_Captbl_Kern(rvm_cid_t Cap_Captbl_Dst, rvm_cid_t Cap_Dst, 
                          rvm_cid_t Cap_Captbl_Src, rvm_cid_t Cap_Src,
                          rvm_ptr_t Start, rvm_ptr_t End)
{
    return RVM_CAP_OP(RME_SVC_CAPTBL_ADD, 0,
 8012dde:	f7fd b941 	b.w	8010064 <RVM_Svc>
 8012de2:	bf00      	nop

08012de4 <RVM_Pgtbl_Crt>:
rvm_ret_t RVM_Pgtbl_Crt(rvm_cid_t Cap_Captbl, rvm_cid_t Cap_Kmem, rvm_cid_t Cap_Pgtbl, 
                        rvm_ptr_t Raddr, rvm_ptr_t Start_Addr, rvm_ptr_t Top_Flag,
                        rvm_ptr_t Size_Order, rvm_ptr_t Num_Order)
{
    
    return RVM_CAP_OP(RVM_PGTBL_SVC(Num_Order,RME_SVC_PGTBL_CRT), Cap_Captbl,
 8012de4:	0212      	lsls	r2, r2, #8
 8012de6:	f440 2060 	orr.w	r0, r0, #917504	; 0xe0000
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Pgtbl_Crt(rvm_cid_t Cap_Captbl, rvm_cid_t Cap_Kmem, rvm_cid_t Cap_Pgtbl, 
                        rvm_ptr_t Raddr, rvm_ptr_t Start_Addr, rvm_ptr_t Top_Flag,
                        rvm_ptr_t Size_Order, rvm_ptr_t Num_Order)
{
 8012dea:	b4f0      	push	{r4, r5, r6, r7}
    
    return RVM_CAP_OP(RVM_PGTBL_SVC(Num_Order,RME_SVC_PGTBL_CRT), Cap_Captbl,
 8012dec:	b294      	uxth	r4, r2
 8012dee:	f89d 6018 	ldrb.w	r6, [sp, #24]
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Pgtbl_Crt(rvm_cid_t Cap_Captbl, rvm_cid_t Cap_Kmem, rvm_cid_t Cap_Pgtbl, 
                        rvm_ptr_t Raddr, rvm_ptr_t Start_Addr, rvm_ptr_t Top_Flag,
                        rvm_ptr_t Size_Order, rvm_ptr_t Num_Order)
{
 8012df2:	9f07      	ldr	r7, [sp, #28]
    
    return RVM_CAP_OP(RVM_PGTBL_SVC(Num_Order,RME_SVC_PGTBL_CRT), Cap_Captbl,
 8012df4:	461a      	mov	r2, r3
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Pgtbl_Crt(rvm_cid_t Cap_Captbl, rvm_cid_t Cap_Kmem, rvm_cid_t Cap_Pgtbl, 
                        rvm_ptr_t Raddr, rvm_ptr_t Start_Addr, rvm_ptr_t Top_Flag,
                        rvm_ptr_t Size_Order, rvm_ptr_t Num_Order)
{
 8012df6:	9d04      	ldr	r5, [sp, #16]
    
    return RVM_CAP_OP(RVM_PGTBL_SVC(Num_Order,RME_SVC_PGTBL_CRT), Cap_Captbl,
 8012df8:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Pgtbl_Crt(rvm_cid_t Cap_Captbl, rvm_cid_t Cap_Kmem, rvm_cid_t Cap_Pgtbl, 
                        rvm_ptr_t Raddr, rvm_ptr_t Start_Addr, rvm_ptr_t Top_Flag,
                        rvm_ptr_t Size_Order, rvm_ptr_t Num_Order)
{
 8012dfc:	9b05      	ldr	r3, [sp, #20]
    
    return RVM_CAP_OP(RVM_PGTBL_SVC(Num_Order,RME_SVC_PGTBL_CRT), Cap_Captbl,
 8012dfe:	ea40 6007 	orr.w	r0, r0, r7, lsl #24
 8012e02:	4331      	orrs	r1, r6
 8012e04:	432b      	orrs	r3, r5
                      RVM_PARAM_D1(Cap_Kmem)|RVM_PARAM_Q1(Cap_Pgtbl)|RVM_PARAM_Q0(Size_Order),
                      Raddr, 
                      Start_Addr|Top_Flag);
}
 8012e06:	bcf0      	pop	{r4, r5, r6, r7}
rvm_ret_t RVM_Pgtbl_Crt(rvm_cid_t Cap_Captbl, rvm_cid_t Cap_Kmem, rvm_cid_t Cap_Pgtbl, 
                        rvm_ptr_t Raddr, rvm_ptr_t Start_Addr, rvm_ptr_t Top_Flag,
                        rvm_ptr_t Size_Order, rvm_ptr_t Num_Order)
{
    
    return RVM_CAP_OP(RVM_PGTBL_SVC(Num_Order,RME_SVC_PGTBL_CRT), Cap_Captbl,
 8012e08:	f7fd b92c 	b.w	8010064 <RVM_Svc>

08012e0c <RVM_Pgtbl_Add>:
Output      : None.
Return      : rvm_ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
rvm_ret_t RVM_Pgtbl_Add(rvm_cid_t Cap_Pgtbl_Dst, rvm_ptr_t Pos_Dst, rvm_ptr_t Flags_Dst,
                        rvm_cid_t Cap_Pgtbl_Src, rvm_ptr_t Pos_Src, rvm_ptr_t Index)
{
 8012e0c:	b430      	push	{r4, r5}
    return RVM_CAP_OP(RME_SVC_PGTBL_ADD, 0,
 8012e0e:	f8bd 4008 	ldrh.w	r4, [sp, #8]
 8012e12:	f360 411f 	bfi	r1, r0, #16, #16
 8012e16:	f8bd 500c 	ldrh.w	r5, [sp, #12]
 8012e1a:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
 8012e1e:	ea44 4403 	orr.w	r4, r4, r3, lsl #16
 8012e22:	ea45 4302 	orr.w	r3, r5, r2, lsl #16
 8012e26:	4622      	mov	r2, r4
                      RVM_PARAM_D1(Cap_Pgtbl_Dst)|RVM_PARAM_D0(Pos_Dst),
                      RVM_PARAM_D1(Cap_Pgtbl_Src)|RVM_PARAM_D0(Pos_Src),
                      RVM_PARAM_D1(Flags_Dst)|RVM_PARAM_D0(Index));
}
 8012e28:	bc30      	pop	{r4, r5}
Return      : rvm_ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
rvm_ret_t RVM_Pgtbl_Add(rvm_cid_t Cap_Pgtbl_Dst, rvm_ptr_t Pos_Dst, rvm_ptr_t Flags_Dst,
                        rvm_cid_t Cap_Pgtbl_Src, rvm_ptr_t Pos_Src, rvm_ptr_t Index)
{
    return RVM_CAP_OP(RME_SVC_PGTBL_ADD, 0,
 8012e2a:	f7fd b91b 	b.w	8010064 <RVM_Svc>
 8012e2e:	bf00      	nop

08012e30 <RVM_Pgtbl_Con>:
              rvm_ptr_t Flags_Child - This have no effect on MPU-based architectures.
Output      : None.
Return      : rvm_ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
rvm_ret_t RVM_Pgtbl_Con(rvm_cid_t Cap_Pgtbl_Parent, rvm_ptr_t Pos, rvm_cid_t Cap_Pgtbl_Child, rvm_ptr_t Flags_Child)
{
 8012e30:	b410      	push	{r4}
    return RVM_CAP_OP(RME_SVC_PGTBL_CON, 0,
 8012e32:	b294      	uxth	r4, r2
 8012e34:	460a      	mov	r2, r1
 8012e36:	ea44 4100 	orr.w	r1, r4, r0, lsl #16
 8012e3a:	f44f 1090 	mov.w	r0, #1179648	; 0x120000
                      RVM_PARAM_D1(Cap_Pgtbl_Parent)|RVM_PARAM_D0(Cap_Pgtbl_Child),
                      Pos,
                      Flags_Child);
}
 8012e3e:	f85d 4b04 	ldr.w	r4, [sp], #4
Output      : None.
Return      : rvm_ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
rvm_ret_t RVM_Pgtbl_Con(rvm_cid_t Cap_Pgtbl_Parent, rvm_ptr_t Pos, rvm_cid_t Cap_Pgtbl_Child, rvm_ptr_t Flags_Child)
{
    return RVM_CAP_OP(RME_SVC_PGTBL_CON, 0,
 8012e42:	f7fd b90f 	b.w	8010064 <RVM_Svc>
 8012e46:	bf00      	nop

08012e48 <RVM_Proc_Crt>:
Output      : None.
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Proc_Crt(rvm_cid_t Cap_Captbl_Crt, rvm_cid_t Cap_Kmem, rvm_cid_t Cap_Proc,
                       rvm_cid_t Cap_Captbl, rvm_cid_t Cap_Pgtbl, rvm_ptr_t Raddr)
{
 8012e48:	b430      	push	{r4, r5}
    return RVM_CAP_OP(RME_SVC_PROC_CRT, Cap_Captbl_Crt,
 8012e4a:	b295      	uxth	r5, r2
 8012e4c:	f8bd 4008 	ldrh.w	r4, [sp, #8]
 8012e50:	f440 10a0 	orr.w	r0, r0, #1310720	; 0x140000
 8012e54:	ea44 4203 	orr.w	r2, r4, r3, lsl #16
 8012e58:	9b03      	ldr	r3, [sp, #12]
 8012e5a:	ea45 4101 	orr.w	r1, r5, r1, lsl #16
                      RVM_PARAM_D1(Cap_Kmem)|RVM_PARAM_D0(Cap_Proc),
                      RVM_PARAM_D1(Cap_Captbl)|RVM_PARAM_D0(Cap_Pgtbl),
                      Raddr);
}
 8012e5e:	bc30      	pop	{r4, r5}
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Proc_Crt(rvm_cid_t Cap_Captbl_Crt, rvm_cid_t Cap_Kmem, rvm_cid_t Cap_Proc,
                       rvm_cid_t Cap_Captbl, rvm_cid_t Cap_Pgtbl, rvm_ptr_t Raddr)
{
    return RVM_CAP_OP(RME_SVC_PROC_CRT, Cap_Captbl_Crt,
 8012e60:	f7fd b900 	b.w	8010064 <RVM_Svc>

08012e64 <RVM_Thd_Crt>:
Output      : None.
Return      : rvm_ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
rvm_ret_t RVM_Thd_Crt(rvm_cid_t Cap_Captbl, rvm_cid_t Cap_Kmem, rvm_cid_t Cap_Thd,
                  rvm_cid_t Cap_Proc, rvm_ptr_t Max_Prio, rvm_ptr_t Raddr)
{
 8012e64:	b430      	push	{r4, r5}
    return RVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
 8012e66:	b295      	uxth	r5, r2
 8012e68:	f8bd 4008 	ldrh.w	r4, [sp, #8]
 8012e6c:	f440 10c0 	orr.w	r0, r0, #1572864	; 0x180000
 8012e70:	ea44 4203 	orr.w	r2, r4, r3, lsl #16
 8012e74:	9b03      	ldr	r3, [sp, #12]
 8012e76:	ea45 4101 	orr.w	r1, r5, r1, lsl #16
                      RVM_PARAM_D1(Cap_Kmem)|RVM_PARAM_D0(Cap_Thd),
                      RVM_PARAM_D1(Cap_Proc)|RVM_PARAM_D0(Max_Prio),
                      Raddr);
}
 8012e7a:	bc30      	pop	{r4, r5}
Return      : rvm_ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
rvm_ret_t RVM_Thd_Crt(rvm_cid_t Cap_Captbl, rvm_cid_t Cap_Kmem, rvm_cid_t Cap_Thd,
                  rvm_cid_t Cap_Proc, rvm_ptr_t Max_Prio, rvm_ptr_t Raddr)
{
    return RVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
 8012e7c:	f7fd b8f2 	b.w	8010064 <RVM_Svc>

08012e80 <RVM_Thd_Exec_Set>:
Output      : None.
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Thd_Exec_Set(rvm_cid_t Cap_Thd, rvm_ptr_t Entry, rvm_ptr_t Stack, rvm_ptr_t Param)
{
    return RVM_CAP_OP(RME_SVC_THD_EXEC_SET, Cap_Thd,
 8012e80:	f440 10d0 	orr.w	r0, r0, #1703936	; 0x1a0000
 8012e84:	f7fd b8ee 	b.w	8010064 <RVM_Svc>

08012e88 <RVM_Thd_Hyp_Set>:
Output      : None.
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Thd_Hyp_Set(rvm_cid_t Cap_Thd, rvm_ptr_t Kaddr)
{
    return RVM_CAP_OP(RME_SVC_THD_HYP_SET, 0,
 8012e88:	460a      	mov	r2, r1
 8012e8a:	2300      	movs	r3, #0
 8012e8c:	4601      	mov	r1, r0
 8012e8e:	f44f 10d8 	mov.w	r0, #1769472	; 0x1b0000
 8012e92:	f7fd b8e7 	b.w	8010064 <RVM_Svc>
 8012e96:	bf00      	nop

08012e98 <RVM_Thd_Sched_Bind>:
              rvm_ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Thd_Sched_Bind(rvm_cid_t Cap_Thd, rvm_cid_t Cap_Thd_Sched, rvm_cid_t Cap_Sig, rvm_tid_t TID, rvm_ptr_t Prio)
{
 8012e98:	b430      	push	{r4, r5}
 8012e9a:	461d      	mov	r5, r3
    return RVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
 8012e9c:	b294      	uxth	r4, r2
 8012e9e:	9b02      	ldr	r3, [sp, #8]
 8012ea0:	f440 10e0 	orr.w	r0, r0, #1835008	; 0x1c0000
 8012ea4:	462a      	mov	r2, r5
 8012ea6:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
                      RVM_PARAM_D1(Cap_Thd_Sched)|RVM_PARAM_D0(Cap_Sig),
                      TID, 
                      Prio);
}
 8012eaa:	bc30      	pop	{r4, r5}
Output      : None.
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Thd_Sched_Bind(rvm_cid_t Cap_Thd, rvm_cid_t Cap_Thd_Sched, rvm_cid_t Cap_Sig, rvm_tid_t TID, rvm_ptr_t Prio)
{
    return RVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
 8012eac:	f7fd b8da 	b.w	8010064 <RVM_Svc>

08012eb0 <RVM_Thd_Sched_Rcv>:
Output      : None.
Return      : rvm_ret_t - If successful, the thread ID; or an error code.
******************************************************************************/
rvm_ret_t RVM_Thd_Sched_Rcv(rvm_cid_t Cap_Thd)
{
    return RVM_CAP_OP(RME_SVC_THD_SCHED_RCV, 0,
 8012eb0:	2300      	movs	r3, #0
 8012eb2:	4601      	mov	r1, r0
 8012eb4:	f44f 10e8 	mov.w	r0, #1900544	; 0x1d0000
 8012eb8:	461a      	mov	r2, r3
 8012eba:	f7fd b8d3 	b.w	8010064 <RVM_Svc>
 8012ebe:	bf00      	nop

08012ec0 <RVM_Thd_Sched_Prio>:
Output      : None.
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Thd_Sched_Prio(rvm_cid_t Cap_Thd, rvm_ptr_t Prio)
{
    return RVM_CAP_OP(RME_SVC_THD_SCHED_PRIO, 0,
 8012ec0:	460a      	mov	r2, r1
 8012ec2:	2300      	movs	r3, #0
 8012ec4:	4601      	mov	r1, r0
 8012ec6:	f44f 20a0 	mov.w	r0, #327680	; 0x50000
 8012eca:	f7fd b8cb 	b.w	8010064 <RVM_Svc>
 8012ece:	bf00      	nop

08012ed0 <RVM_Thd_Time_Xfer>:
Output      : None.
Return      : rvm_ret_t - If successful, the destination time amount; or an error code.
******************************************************************************/
rvm_ret_t RVM_Thd_Time_Xfer(rvm_cid_t Cap_Thd_Dst, rvm_cid_t Cap_Thd_Src, rvm_ptr_t Time)
{
    return RVM_CAP_OP(RME_SVC_THD_TIME_XFER, 0,
 8012ed0:	4613      	mov	r3, r2
 8012ed2:	460a      	mov	r2, r1
 8012ed4:	4601      	mov	r1, r0
 8012ed6:	f44f 20e0 	mov.w	r0, #458752	; 0x70000
 8012eda:	f7fd b8c3 	b.w	8010064 <RVM_Svc>
 8012ede:	bf00      	nop

08012ee0 <RVM_Sig_Crt>:
Output      : None.
Return      : rvm_ret_t - If successful, 0; or an error code.
******************************************************************************/
rvm_ret_t RVM_Sig_Crt(rvm_cid_t Cap_Captbl, rvm_cid_t Cap_Kmem, rvm_cid_t Cap_Sig, rvm_ptr_t Raddr)
{
    return RVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
 8012ee0:	f440 10f0 	orr.w	r0, r0, #1966080	; 0x1e0000
 8012ee4:	f7fd b8be 	b.w	8010064 <RVM_Svc>

08012ee8 <RVM_Sig_Snd>:
Output      : None.
Return      : rvm_ret_t - If successful, 0, or an error code.
******************************************************************************/
rvm_ret_t RVM_Sig_Snd(rvm_cid_t Cap_Sig)
{
    return RVM_CAP_OP(RME_SVC_SIG_SND, 0,
 8012ee8:	2300      	movs	r3, #0
 8012eea:	4601      	mov	r1, r0
 8012eec:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8012ef0:	461a      	mov	r2, r3
 8012ef2:	f7fd b8b7 	b.w	8010064 <RVM_Svc>
 8012ef6:	bf00      	nop

08012ef8 <RVM_Sig_Rcv>:
Return      : rvm_ret_t - If successful, a non-negative number containing the number of
                          signals received will be returned; else an error code.
******************************************************************************/
rvm_ret_t RVM_Sig_Rcv(rvm_cid_t Cap_Sig, rvm_ptr_t Option)
{
    return RVM_CAP_OP(RME_SVC_SIG_RCV, 0,
 8012ef8:	460a      	mov	r2, r1
 8012efa:	2300      	movs	r3, #0
 8012efc:	4601      	mov	r1, r0
 8012efe:	f44f 3040 	mov.w	r0, #196608	; 0x30000
 8012f02:	f7fd b8af 	b.w	8010064 <RVM_Svc>
 8012f06:	bf00      	nop
 8012f08:	2a2a0a0d 	.word	0x2a2a0a0d
 8012f0c:	550a0d2a 	.word	0x550a0d2a
 8012f10:	2d726573 	.word	0x2d726573
 8012f14:	6576656c 	.word	0x6576656c
 8012f18:	696c206c 	.word	0x696c206c
 8012f1c:	72617262 	.word	0x72617262
 8012f20:	61702079 	.word	0x61702079
 8012f24:	2063696e 	.word	0x2063696e
 8012f28:	6f6e202d 	.word	0x6f6e202d
 8012f2c:	79732074 	.word	0x79732074
 8012f30:	6e69636e 	.word	0x6e69636e
 8012f34:	0a0d3a67 	.word	0x0a0d3a67
 8012f38:	00000000 	.word	0x00000000
 8012f3c:	64656d2f 	.word	0x64656d2f
 8012f40:	702f6169 	.word	0x702f6169
 8012f44:	432f7972 	.word	0x432f7972
 8012f48:	2f65646f 	.word	0x2f65646f
 8012f4c:	65646f43 	.word	0x65646f43
 8012f50:	62694c5f 	.word	0x62694c5f
 8012f54:	79726172 	.word	0x79726172
 8012f58:	55434d2f 	.word	0x55434d2f
 8012f5c:	74754d2f 	.word	0x74754d2f
 8012f60:	73757461 	.word	0x73757461
 8012f64:	4d374d2f 	.word	0x4d374d2f
 8012f68:	754d5f32 	.word	0x754d5f32
 8012f6c:	6f6d6d41 	.word	0x6f6d6d41
 8012f70:	6574696e 	.word	0x6574696e
 8012f74:	6d414d2f 	.word	0x6d414d2f
 8012f78:	696e6f6d 	.word	0x696e6f6d
 8012f7c:	502f6574 	.word	0x502f6574
 8012f80:	6674616c 	.word	0x6674616c
 8012f84:	2f6d726f 	.word	0x2f6d726f
 8012f88:	74726f43 	.word	0x74726f43
 8012f8c:	2f4d7865 	.word	0x2f4d7865
 8012f90:	5f6d7672 	.word	0x5f6d7672
 8012f94:	74616c70 	.word	0x74616c70
 8012f98:	6d726f66 	.word	0x6d726f66
 8012f9c:	786d635f 	.word	0x786d635f
 8012fa0:	0000632e 	.word	0x0000632e
 8012fa4:	694c202c 	.word	0x694c202c
 8012fa8:	0020656e 	.word	0x0020656e
 8012fac:	20706553 	.word	0x20706553
 8012fb0:	32203232 	.word	0x32203232
 8012fb4:	00383130 	.word	0x00383130
 8012fb8:	0000202c 	.word	0x0000202c
 8012fbc:	303a3931 	.word	0x303a3931
 8012fc0:	39353a33 	.word	0x39353a33
 8012fc4:	00000000 	.word	0x00000000
 8012fc8:	74696e49 	.word	0x74696e49
 8012fcc:	726f433a 	.word	0x726f433a
 8012fd0:	4d786574 	.word	0x4d786574
 8012fd4:	6572433a 	.word	0x6572433a
 8012fd8:	64657461 	.word	0x64657461
 8012fdc:	706f7420 	.word	0x706f7420
 8012fe0:	76656c2d 	.word	0x76656c2d
 8012fe4:	70206c65 	.word	0x70206c65
 8012fe8:	20656761 	.word	0x20656761
 8012fec:	6c626174 	.word	0x6c626174
 8012ff0:	756e2065 	.word	0x756e2065
 8012ff4:	7265626d 	.word	0x7265626d
 8012ff8:	00000020 	.word	0x00000020
 8012ffc:	61204020 	.word	0x61204020
 8013000:	65726464 	.word	0x65726464
 8013004:	00207373 	.word	0x00207373
 8013008:	74696e49 	.word	0x74696e49
 801300c:	726f433a 	.word	0x726f433a
 8013010:	4d786574 	.word	0x4d786574
 8013014:	6572433a 	.word	0x6572433a
 8013018:	64657461 	.word	0x64657461
 801301c:	726f6e20 	.word	0x726f6e20
 8013020:	206c616d 	.word	0x206c616d
 8013024:	65676170 	.word	0x65676170
 8013028:	62617420 	.word	0x62617420
 801302c:	6e20656c 	.word	0x6e20656c
 8013030:	65626d75 	.word	0x65626d75
 8013034:	00002072 	.word	0x00002072
 8013038:	64656d2f 	.word	0x64656d2f
 801303c:	702f6169 	.word	0x702f6169
 8013040:	432f7972 	.word	0x432f7972
 8013044:	2f65646f 	.word	0x2f65646f
 8013048:	65646f43 	.word	0x65646f43
 801304c:	62694c5f 	.word	0x62694c5f
 8013050:	79726172 	.word	0x79726172
 8013054:	55434d2f 	.word	0x55434d2f
 8013058:	74754d2f 	.word	0x74754d2f
 801305c:	73757461 	.word	0x73757461
 8013060:	4d374d2f 	.word	0x4d374d2f
 8013064:	754d5f32 	.word	0x754d5f32
 8013068:	6f6d6d41 	.word	0x6f6d6d41
 801306c:	6574696e 	.word	0x6574696e
 8013070:	6d414d2f 	.word	0x6d414d2f
 8013074:	696e6f6d 	.word	0x696e6f6d
 8013078:	492f6574 	.word	0x492f6574
 801307c:	2f74696e 	.word	0x2f74696e
 8013080:	5f6d7672 	.word	0x5f6d7672
 8013084:	65707968 	.word	0x65707968
 8013088:	00632e72 	.word	0x00632e72
 801308c:	00203a20 	.word	0x00203a20
 8013090:	64656d2f 	.word	0x64656d2f
 8013094:	702f6169 	.word	0x702f6169
 8013098:	432f7972 	.word	0x432f7972
 801309c:	2f65646f 	.word	0x2f65646f
 80130a0:	65646f43 	.word	0x65646f43
 80130a4:	62694c5f 	.word	0x62694c5f
 80130a8:	79726172 	.word	0x79726172
 80130ac:	55434d2f 	.word	0x55434d2f
 80130b0:	74754d2f 	.word	0x74754d2f
 80130b4:	73757461 	.word	0x73757461
 80130b8:	4d374d2f 	.word	0x4d374d2f
 80130bc:	754d5f32 	.word	0x754d5f32
 80130c0:	6f6d6d41 	.word	0x6f6d6d41
 80130c4:	6574696e 	.word	0x6574696e
 80130c8:	6d414d2f 	.word	0x6d414d2f
 80130cc:	696e6f6d 	.word	0x696e6f6d
 80130d0:	492f6574 	.word	0x492f6574
 80130d4:	2f74696e 	.word	0x2f74696e
 80130d8:	5f6d7672 	.word	0x5f6d7672
 80130dc:	74696e69 	.word	0x74696e69
 80130e0:	0000632e 	.word	0x0000632e
 80130e4:	303a3931 	.word	0x303a3931
 80130e8:	30303a34 	.word	0x30303a34
 80130ec:	00000000 	.word	0x00000000
 80130f0:	444d4d56 	.word	0x444d4d56
 80130f4:	4d4d563a 	.word	0x4d4d563a
 80130f8:	6e692044 	.word	0x6e692044
 80130fc:	61697469 	.word	0x61697469
 8013100:	617a696c 	.word	0x617a696c
 8013104:	6e6f6974 	.word	0x6e6f6974
 8013108:	6d6f6320 	.word	0x6d6f6320
 801310c:	74656c70 	.word	0x74656c70
 8013110:	0a0d2e65 	.word	0x0a0d2e65
 8013114:	00000000 	.word	0x00000000
 8013118:	52415547 	.word	0x52415547
 801311c:	75473a44 	.word	0x75473a44
 8013120:	20647261 	.word	0x20647261
 8013124:	6d656164 	.word	0x6d656164
 8013128:	73206e6f 	.word	0x73206e6f
 801312c:	74726174 	.word	0x74726174
 8013130:	6d6f6320 	.word	0x6d6f6320
 8013134:	74656c70 	.word	0x74656c70
 8013138:	0a0d2e65 	.word	0x0a0d2e65
 801313c:	00000000 	.word	0x00000000
 8013140:	52415547 	.word	0x52415547
 8013144:	61463a44 	.word	0x61463a44
 8013148:	21746c75 	.word	0x21746c75
 801314c:	000a0d2e 	.word	0x000a0d2e
 8013150:	44544e49 	.word	0x44544e49
 8013154:	746e493a 	.word	0x746e493a
 8013158:	75727265 	.word	0x75727265
 801315c:	64207470 	.word	0x64207470
 8013160:	6f6d6561 	.word	0x6f6d6561
 8013164:	7473206e 	.word	0x7473206e
 8013168:	20747261 	.word	0x20747261
 801316c:	706d6f63 	.word	0x706d6f63
 8013170:	6574656c 	.word	0x6574656c
 8013174:	000a0d2e 	.word	0x000a0d2e
 8013178:	444d4954 	.word	0x444d4954
 801317c:	6d69543a 	.word	0x6d69543a
 8013180:	64207265 	.word	0x64207265
 8013184:	6f6d6561 	.word	0x6f6d6561
 8013188:	7473206e 	.word	0x7473206e
 801318c:	20747261 	.word	0x20747261
 8013190:	706d6f63 	.word	0x706d6f63
 8013194:	6574656c 	.word	0x6574656c
 8013198:	000a0d2e 	.word	0x000a0d2e
 801319c:	0a0d0a0d 	.word	0x0a0d0a0d
 80131a0:	2d2d2d2d 	.word	0x2d2d2d2d
 80131a4:	2d2d2d2d 	.word	0x2d2d2d2d
 80131a8:	2d2d2d2d 	.word	0x2d2d2d2d
 80131ac:	2d2d2d2d 	.word	0x2d2d2d2d
 80131b0:	2d2d2d2d 	.word	0x2d2d2d2d
 80131b4:	2d2d2d2d 	.word	0x2d2d2d2d
 80131b8:	2d2d2d2d 	.word	0x2d2d2d2d
 80131bc:	2d2d2d2d 	.word	0x2d2d2d2d
 80131c0:	2d2d2d2d 	.word	0x2d2d2d2d
 80131c4:	2d2d2d2d 	.word	0x2d2d2d2d
 80131c8:	2d2d2d2d 	.word	0x2d2d2d2d
 80131cc:	2d2d2d2d 	.word	0x2d2d2d2d
 80131d0:	2d2d2d2d 	.word	0x2d2d2d2d
 80131d4:	2d2d2d2d 	.word	0x2d2d2d2d
 80131d8:	2d2d2d2d 	.word	0x2d2d2d2d
 80131dc:	2d2d2d2d 	.word	0x2d2d2d2d
 80131e0:	2d2d2d2d 	.word	0x2d2d2d2d
 80131e4:	2d2d2d2d 	.word	0x2d2d2d2d
 80131e8:	2d2d2d2d 	.word	0x2d2d2d2d
 80131ec:	0d2d2d2d 	.word	0x0d2d2d2d
 80131f0:	0000000a 	.word	0x0000000a
 80131f4:	20202020 	.word	0x20202020
 80131f8:	20202020 	.word	0x20202020
 80131fc:	20202020 	.word	0x20202020
 8013200:	20202020 	.word	0x20202020
 8013204:	20202020 	.word	0x20202020
 8013208:	20202020 	.word	0x20202020
 801320c:	20202020 	.word	0x20202020
 8013210:	57202020 	.word	0x57202020
 8013214:	6f636c65 	.word	0x6f636c65
 8013218:	7420656d 	.word	0x7420656d
 801321c:	6874206f 	.word	0x6874206f
 8013220:	000a0d65 	.word	0x000a0d65
 8013224:	20202020 	.word	0x20202020
 8013228:	20202020 	.word	0x20202020
 801322c:	20202020 	.word	0x20202020
 8013230:	20202020 	.word	0x20202020
 8013234:	20202020 	.word	0x20202020
 8013238:	20202020 	.word	0x20202020
 801323c:	23232323 	.word	0x23232323
 8013240:	20202323 	.word	0x20202323
 8013244:	23232020 	.word	0x23232020
 8013248:	23202023 	.word	0x23202023
 801324c:	20202323 	.word	0x20202323
 8013250:	23232323 	.word	0x23232323
 8013254:	23232323 	.word	0x23232323
 8013258:	00000a0d 	.word	0x00000a0d
 801325c:	20202020 	.word	0x20202020
 8013260:	20202020 	.word	0x20202020
 8013264:	20202020 	.word	0x20202020
 8013268:	20202020 	.word	0x20202020
 801326c:	20202020 	.word	0x20202020
 8013270:	20202020 	.word	0x20202020
 8013274:	23232323 	.word	0x23232323
 8013278:	20232323 	.word	0x20232323
 801327c:	23232020 	.word	0x23232020
 8013280:	23202023 	.word	0x23202023
 8013284:	20202323 	.word	0x20202323
 8013288:	23232323 	.word	0x23232323
 801328c:	23232323 	.word	0x23232323
 8013290:	00000a0d 	.word	0x00000a0d
 8013294:	20202020 	.word	0x20202020
 8013298:	20202020 	.word	0x20202020
 801329c:	20202020 	.word	0x20202020
 80132a0:	20202020 	.word	0x20202020
 80132a4:	20202020 	.word	0x20202020
 80132a8:	20202020 	.word	0x20202020
 80132ac:	20202323 	.word	0x20202323
 80132b0:	23232020 	.word	0x23232020
 80132b4:	23232020 	.word	0x23232020
 80132b8:	23202023 	.word	0x23202023
 80132bc:	20202323 	.word	0x20202323
 80132c0:	0a0d2323 	.word	0x0a0d2323
 80132c4:	00000000 	.word	0x00000000
 80132c8:	20202020 	.word	0x20202020
 80132cc:	20202020 	.word	0x20202020
 80132d0:	20202020 	.word	0x20202020
 80132d4:	20202020 	.word	0x20202020
 80132d8:	20202020 	.word	0x20202020
 80132dc:	20202020 	.word	0x20202020
 80132e0:	20202323 	.word	0x20202323
 80132e4:	23232020 	.word	0x23232020
 80132e8:	23232020 	.word	0x23232020
 80132ec:	20232320 	.word	0x20232320
 80132f0:	20202323 	.word	0x20202323
 80132f4:	0a0d2323 	.word	0x0a0d2323
 80132f8:	00000000 	.word	0x00000000
 80132fc:	20202020 	.word	0x20202020
 8013300:	20202020 	.word	0x20202020
 8013304:	20202020 	.word	0x20202020
 8013308:	20202020 	.word	0x20202020
 801330c:	20202020 	.word	0x20202020
 8013310:	20202020 	.word	0x20202020
 8013314:	23232323 	.word	0x23232323
 8013318:	20232323 	.word	0x20232323
 801331c:	23232020 	.word	0x23232020
 8013320:	20232320 	.word	0x20232320
 8013324:	20202323 	.word	0x20202323
 8013328:	23232323 	.word	0x23232323
 801332c:	0d232323 	.word	0x0d232323
 8013330:	0000000a 	.word	0x0000000a
 8013334:	20202020 	.word	0x20202020
 8013338:	20202020 	.word	0x20202020
 801333c:	20202020 	.word	0x20202020
 8013340:	20202020 	.word	0x20202020
 8013344:	20202020 	.word	0x20202020
 8013348:	20202020 	.word	0x20202020
 801334c:	23232323 	.word	0x23232323
 8013350:	20202323 	.word	0x20202323
 8013354:	23232020 	.word	0x23232020
 8013358:	20232320 	.word	0x20232320
 801335c:	20202323 	.word	0x20202323
 8013360:	23232323 	.word	0x23232323
 8013364:	0d232323 	.word	0x0d232323
 8013368:	0000000a 	.word	0x0000000a
 801336c:	20202020 	.word	0x20202020
 8013370:	20202020 	.word	0x20202020
 8013374:	20202020 	.word	0x20202020
 8013378:	20202020 	.word	0x20202020
 801337c:	20202020 	.word	0x20202020
 8013380:	20202020 	.word	0x20202020
 8013384:	20202323 	.word	0x20202323
 8013388:	20232320 	.word	0x20232320
 801338c:	23232020 	.word	0x23232020
 8013390:	20232320 	.word	0x20232320
 8013394:	20202323 	.word	0x20202323
 8013398:	0a0d2323 	.word	0x0a0d2323
 801339c:	00000000 	.word	0x00000000
 80133a0:	20202020 	.word	0x20202020
 80133a4:	20202020 	.word	0x20202020
 80133a8:	20202020 	.word	0x20202020
 80133ac:	20202020 	.word	0x20202020
 80133b0:	20202020 	.word	0x20202020
 80133b4:	20202020 	.word	0x20202020
 80133b8:	20202323 	.word	0x20202323
 80133bc:	20232320 	.word	0x20232320
 80133c0:	23232020 	.word	0x23232020
 80133c4:	20202020 	.word	0x20202020
 80133c8:	20202323 	.word	0x20202323
 80133cc:	0a0d2323 	.word	0x0a0d2323
 80133d0:	00000000 	.word	0x00000000
 80133d4:	20202020 	.word	0x20202020
 80133d8:	20202020 	.word	0x20202020
 80133dc:	20202020 	.word	0x20202020
 80133e0:	20202020 	.word	0x20202020
 80133e4:	20202020 	.word	0x20202020
 80133e8:	20202020 	.word	0x20202020
 80133ec:	20202323 	.word	0x20202323
 80133f0:	23232020 	.word	0x23232020
 80133f4:	23232020 	.word	0x23232020
 80133f8:	20202020 	.word	0x20202020
 80133fc:	20202323 	.word	0x20202323
 8013400:	0a0d2323 	.word	0x0a0d2323
 8013404:	00000000 	.word	0x00000000
 8013408:	20202020 	.word	0x20202020
 801340c:	20202020 	.word	0x20202020
 8013410:	20202020 	.word	0x20202020
 8013414:	20202020 	.word	0x20202020
 8013418:	20202020 	.word	0x20202020
 801341c:	20202020 	.word	0x20202020
 8013420:	20202323 	.word	0x20202323
 8013424:	23232020 	.word	0x23232020
 8013428:	23232020 	.word	0x23232020
 801342c:	20202020 	.word	0x20202020
 8013430:	20202323 	.word	0x20202323
 8013434:	23232323 	.word	0x23232323
 8013438:	23232323 	.word	0x23232323
 801343c:	00000a0d 	.word	0x00000a0d
 8013440:	20202020 	.word	0x20202020
 8013444:	20202020 	.word	0x20202020
 8013448:	20202020 	.word	0x20202020
 801344c:	20202020 	.word	0x20202020
 8013450:	20202020 	.word	0x20202020
 8013454:	20202020 	.word	0x20202020
 8013458:	20202323 	.word	0x20202323
 801345c:	23232020 	.word	0x23232020
 8013460:	23232023 	.word	0x23232023
 8013464:	20202020 	.word	0x20202020
 8013468:	20202323 	.word	0x20202323
 801346c:	23232323 	.word	0x23232323
 8013470:	23232323 	.word	0x23232323
 8013474:	00000a0d 	.word	0x00000a0d
 8013478:	20202020 	.word	0x20202020
 801347c:	20202020 	.word	0x20202020
 8013480:	20202020 	.word	0x20202020
 8013484:	20202020 	.word	0x20202020
 8013488:	20202020 	.word	0x20202020
 801348c:	7263694d 	.word	0x7263694d
 8013490:	6e6f636f 	.word	0x6e6f636f
 8013494:	6c6f7274 	.word	0x6c6f7274
 8013498:	2072656c 	.word	0x2072656c
 801349c:	72657355 	.word	0x72657355
 80134a0:	76656c2d 	.word	0x76656c2d
 80134a4:	50206c65 	.word	0x50206c65
 80134a8:	6674616c 	.word	0x6674616c
 80134ac:	216d726f 	.word	0x216d726f
 80134b0:	00000a0d 	.word	0x00000a0d
 80134b4:	74696e49 	.word	0x74696e49
 80134b8:	6572503a 	.word	0x6572503a
 80134bc:	61726170 	.word	0x61726170
 80134c0:	6e6f6974 	.word	0x6e6f6974
 80134c4:	70202d20 	.word	0x70202d20
 80134c8:	726f6972 	.word	0x726f6972
 80134cc:	20797469 	.word	0x20797469
 80134d0:	73696172 	.word	0x73696172
 80134d4:	0d2e6465 	.word	0x0d2e6465
 80134d8:	0000000a 	.word	0x0000000a
 80134dc:	74696e49 	.word	0x74696e49
 80134e0:	6174533a 	.word	0x6174533a
 80134e4:	63207472 	.word	0x63207472
 80134e8:	74616572 	.word	0x74616572
 80134ec:	20676e69 	.word	0x20676e69
 80134f0:	6e72656b 	.word	0x6e72656b
 80134f4:	6f206c65 	.word	0x6f206c65
 80134f8:	63656a62 	.word	0x63656a62
 80134fc:	40207374 	.word	0x40207374
 8013500:	72656b20 	.word	0x72656b20
 8013504:	206c656e 	.word	0x206c656e
 8013508:	74726976 	.word	0x74726976
 801350c:	206c6175 	.word	0x206c6175
 8013510:	72646461 	.word	0x72646461
 8013514:	20737365 	.word	0x20737365
 8013518:	65736162 	.word	0x65736162
 801351c:	00783020 	.word	0x00783020
 8013520:	74696e49 	.word	0x74696e49
 8013524:	7269563a 	.word	0x7269563a
 8013528:	6c617574 	.word	0x6c617574
 801352c:	63616d20 	.word	0x63616d20
 8013530:	656e6968 	.word	0x656e6968
 8013534:	74616420 	.word	0x74616420
 8013538:	73616261 	.word	0x73616261
 801353c:	6e692065 	.word	0x6e692065
 8013540:	61697469 	.word	0x61697469
 8013544:	617a696c 	.word	0x617a696c
 8013548:	6e6f6974 	.word	0x6e6f6974
 801354c:	6d6f6320 	.word	0x6d6f6320
 8013550:	74656c70 	.word	0x74656c70
 8013554:	0a0d2e65 	.word	0x0a0d2e65
 8013558:	00000000 	.word	0x00000000
 801355c:	74696e49 	.word	0x74696e49
 8013560:	6572433a 	.word	0x6572433a
 8013564:	64657461 	.word	0x64657461
 8013568:	61754720 	.word	0x61754720
 801356c:	20446472 	.word	0x20446472
 8013570:	6c756166 	.word	0x6c756166
 8013574:	6e652074 	.word	0x6e652074
 8013578:	696f7064 	.word	0x696f7064
 801357c:	4320746e 	.word	0x4320746e
 8013580:	00204449 	.word	0x00204449
 8013584:	61204020 	.word	0x61204020
 8013588:	65726464 	.word	0x65726464
 801358c:	30207373 	.word	0x30207373
 8013590:	00000078 	.word	0x00000078
 8013594:	74696e49 	.word	0x74696e49
 8013598:	6572433a 	.word	0x6572433a
 801359c:	64657461 	.word	0x64657461
 80135a0:	61754720 	.word	0x61754720
 80135a4:	64206472 	.word	0x64206472
 80135a8:	6f6d6561 	.word	0x6f6d6561
 80135ac:	4943206e 	.word	0x4943206e
 80135b0:	00002044 	.word	0x00002044
 80135b4:	74696e49 	.word	0x74696e49
 80135b8:	6175473a 	.word	0x6175473a
 80135bc:	64206472 	.word	0x64206472
 80135c0:	6f6d6561 	.word	0x6f6d6561
 80135c4:	6e69206e 	.word	0x6e69206e
 80135c8:	61697469 	.word	0x61697469
 80135cc:	617a696c 	.word	0x617a696c
 80135d0:	6e6f6974 	.word	0x6e6f6974
 80135d4:	6d6f6320 	.word	0x6d6f6320
 80135d8:	74656c70 	.word	0x74656c70
 80135dc:	0a0d2e65 	.word	0x0a0d2e65
 80135e0:	00000000 	.word	0x00000000
 80135e4:	74696e49 	.word	0x74696e49
 80135e8:	6572433a 	.word	0x6572433a
 80135ec:	64657461 	.word	0x64657461
 80135f0:	6d695420 	.word	0x6d695420
 80135f4:	64207265 	.word	0x64207265
 80135f8:	6f6d6561 	.word	0x6f6d6561
 80135fc:	4943206e 	.word	0x4943206e
 8013600:	00002044 	.word	0x00002044
 8013604:	74696e49 	.word	0x74696e49
 8013608:	6d69543a 	.word	0x6d69543a
 801360c:	64207265 	.word	0x64207265
 8013610:	6f6d6561 	.word	0x6f6d6561
 8013614:	6e69206e 	.word	0x6e69206e
 8013618:	61697469 	.word	0x61697469
 801361c:	617a696c 	.word	0x617a696c
 8013620:	6e6f6974 	.word	0x6e6f6974
 8013624:	6d6f6320 	.word	0x6d6f6320
 8013628:	74656c70 	.word	0x74656c70
 801362c:	0a0d2e65 	.word	0x0a0d2e65
 8013630:	00000000 	.word	0x00000000
 8013634:	74696e49 	.word	0x74696e49
 8013638:	6572433a 	.word	0x6572433a
 801363c:	64657461 	.word	0x64657461
 8013640:	4d4d5620 	.word	0x4d4d5620
 8013644:	6e652044 	.word	0x6e652044
 8013648:	696f7064 	.word	0x696f7064
 801364c:	4320746e 	.word	0x4320746e
 8013650:	00204449 	.word	0x00204449
 8013654:	74696e49 	.word	0x74696e49
 8013658:	6572433a 	.word	0x6572433a
 801365c:	64657461 	.word	0x64657461
 8013660:	4d4d5620 	.word	0x4d4d5620
 8013664:	65616420 	.word	0x65616420
 8013668:	206e6f6d 	.word	0x206e6f6d
 801366c:	20444943 	.word	0x20444943
 8013670:	00000000 	.word	0x00000000
 8013674:	74696e49 	.word	0x74696e49
 8013678:	4d4d563a 	.word	0x4d4d563a
 801367c:	65616420 	.word	0x65616420
 8013680:	206e6f6d 	.word	0x206e6f6d
 8013684:	74696e69 	.word	0x74696e69
 8013688:	696c6169 	.word	0x696c6169
 801368c:	6974617a 	.word	0x6974617a
 8013690:	63206e6f 	.word	0x63206e6f
 8013694:	6c706d6f 	.word	0x6c706d6f
 8013698:	2e657465 	.word	0x2e657465
 801369c:	00000a0d 	.word	0x00000a0d
 80136a0:	74696e49 	.word	0x74696e49
 80136a4:	6572433a 	.word	0x6572433a
 80136a8:	64657461 	.word	0x64657461
 80136ac:	746e4920 	.word	0x746e4920
 80136b0:	75727265 	.word	0x75727265
 80136b4:	64207470 	.word	0x64207470
 80136b8:	6f6d6561 	.word	0x6f6d6561
 80136bc:	4943206e 	.word	0x4943206e
 80136c0:	00002044 	.word	0x00002044
 80136c4:	74696e49 	.word	0x74696e49
 80136c8:	746e493a 	.word	0x746e493a
 80136cc:	75727265 	.word	0x75727265
 80136d0:	64207470 	.word	0x64207470
 80136d4:	6f6d6561 	.word	0x6f6d6561
 80136d8:	6e69206e 	.word	0x6e69206e
 80136dc:	61697469 	.word	0x61697469
 80136e0:	617a696c 	.word	0x617a696c
 80136e4:	6e6f6974 	.word	0x6e6f6974
 80136e8:	6d6f6320 	.word	0x6d6f6320
 80136ec:	74656c70 	.word	0x74656c70
 80136f0:	0a0d2e65 	.word	0x0a0d2e65
 80136f4:	00000000 	.word	0x00000000
 80136f8:	74696e49 	.word	0x74696e49
 80136fc:	6561443a 	.word	0x6561443a
 8013700:	206e6f6d 	.word	0x206e6f6d
 8013704:	656d6974 	.word	0x656d6974
 8013708:	64756220 	.word	0x64756220
 801370c:	20746567 	.word	0x20746567
 8013710:	74696e69 	.word	0x74696e69
 8013714:	696c6169 	.word	0x696c6169
 8013718:	6974617a 	.word	0x6974617a
 801371c:	63206e6f 	.word	0x63206e6f
 8013720:	6c706d6f 	.word	0x6c706d6f
 8013724:	2e657465 	.word	0x2e657465
 8013728:	00000a0d 	.word	0x00000a0d
 801372c:	74696e49 	.word	0x74696e49
 8013730:	6561443a 	.word	0x6561443a
 8013734:	206e6f6d 	.word	0x206e6f6d
 8013738:	74696e69 	.word	0x74696e69
 801373c:	696c6169 	.word	0x696c6169
 8013740:	6974617a 	.word	0x6974617a
 8013744:	64206e6f 	.word	0x64206e6f
 8013748:	2e656e6f 	.word	0x2e656e6f
 801374c:	00000a0d 	.word	0x00000a0d
 8013750:	74696e49 	.word	0x74696e49
 8013754:	7269463a 	.word	0x7269463a
 8013758:	56207473 	.word	0x56207473
 801375c:	6461204d 	.word	0x6461204d
 8013760:	73657264 	.word	0x73657264
 8013764:	78302073 	.word	0x78302073
 8013768:	00000000 	.word	0x00000000
 801376c:	74696e49 	.word	0x74696e49
 8013770:	746f543a 	.word	0x746f543a
 8013774:	76206c61 	.word	0x76206c61
 8013778:	75747269 	.word	0x75747269
 801377c:	6d206c61 	.word	0x6d206c61
 8013780:	69686361 	.word	0x69686361
 8013784:	6320656e 	.word	0x6320656e
 8013788:	746e756f 	.word	0x746e756f
 801378c:	00000020 	.word	0x00000020
 8013790:	74696e49 	.word	0x74696e49
 8013794:	746f543a 	.word	0x746f543a
 8013798:	70206c61 	.word	0x70206c61
 801379c:	20656761 	.word	0x20656761
 80137a0:	6c626174 	.word	0x6c626174
 80137a4:	6f632065 	.word	0x6f632065
 80137a8:	20746e75 	.word	0x20746e75
 80137ac:	00000000 	.word	0x00000000
 80137b0:	74696e49 	.word	0x74696e49
 80137b4:	7269563a 	.word	0x7269563a
 80137b8:	6c617574 	.word	0x6c617574
 80137bc:	63616d20 	.word	0x63616d20
 80137c0:	656e6968 	.word	0x656e6968
 80137c4:	6f727020 	.word	0x6f727020
 80137c8:	73736563 	.word	0x73736563
 80137cc:	7061632f 	.word	0x7061632f
 80137d0:	206c6274 	.word	0x206c6274
 80137d4:	6c626174 	.word	0x6c626174
 80137d8:	69732065 	.word	0x69732065
 80137dc:	0020657a 	.word	0x0020657a
 80137e0:	74696e49 	.word	0x74696e49
 80137e4:	7269563a 	.word	0x7269563a
 80137e8:	6c617574 	.word	0x6c617574
 80137ec:	63616d20 	.word	0x63616d20
 80137f0:	656e6968 	.word	0x656e6968
 80137f4:	65737520 	.word	0x65737520
 80137f8:	64687472 	.word	0x64687472
 80137fc:	746e692f 	.word	0x746e692f
 8013800:	2f646874 	.word	0x2f646874
 8013804:	73746e69 	.word	0x73746e69
 8013808:	74206769 	.word	0x74206769
 801380c:	656c6261 	.word	0x656c6261
 8013810:	7a697320 	.word	0x7a697320
 8013814:	00002065 	.word	0x00002065
 8013818:	74696e49 	.word	0x74696e49
 801381c:	7269563a 	.word	0x7269563a
 8013820:	6c617574 	.word	0x6c617574
 8013824:	63616d20 	.word	0x63616d20
 8013828:	656e6968 	.word	0x656e6968
 801382c:	74677020 	.word	0x74677020
 8013830:	74206c62 	.word	0x74206c62
 8013834:	656c6261 	.word	0x656c6261
 8013838:	7a697320 	.word	0x7a697320
 801383c:	00002065 	.word	0x00002065
 8013840:	74696e49 	.word	0x74696e49
 8013844:	756f463a 	.word	0x756f463a
 8013848:	5620646e 	.word	0x5620646e
 801384c:	6d69204d 	.word	0x6d69204d
 8013850:	20656761 	.word	0x20656761
 8013854:	64616568 	.word	0x64616568
 8013858:	40207265 	.word	0x40207265
 801385c:	64646120 	.word	0x64646120
 8013860:	73736572 	.word	0x73736572
 8013864:	00783020 	.word	0x00783020
 8013868:	74696e49 	.word	0x74696e49
 801386c:	756f463a 	.word	0x756f463a
 8013870:	6320646e 	.word	0x6320646e
 8013874:	7572726f 	.word	0x7572726f
 8013878:	64657470 	.word	0x64657470
 801387c:	616d6920 	.word	0x616d6920
 8013880:	68206567 	.word	0x68206567
 8013884:	65646165 	.word	0x65646165
 8013888:	20402072 	.word	0x20402072
 801388c:	72646461 	.word	0x72646461
 8013890:	20737365 	.word	0x20737365
 8013894:	00007830 	.word	0x00007830
 8013898:	74696e49 	.word	0x74696e49
 801389c:	7269563a 	.word	0x7269563a
 80138a0:	6c617574 	.word	0x6c617574
 80138a4:	63616d20 	.word	0x63616d20
 80138a8:	656e6968 	.word	0x656e6968
 80138ac:	6e6f6320 	.word	0x6e6f6320
 80138b0:	6c6f7274 	.word	0x6c6f7274
 80138b4:	6f6c6220 	.word	0x6f6c6220
 80138b8:	65206b63 	.word	0x65206b63
 80138bc:	75616878 	.word	0x75616878
 80138c0:	64657473 	.word	0x64657473
 80138c4:	000a0d2e 	.word	0x000a0d2e
 80138c8:	74696e49 	.word	0x74696e49
 80138cc:	7269563a 	.word	0x7269563a
 80138d0:	6c617574 	.word	0x6c617574
 80138d4:	63616d20 	.word	0x63616d20
 80138d8:	656e6968 	.word	0x656e6968
 80138dc:	73797320 	.word	0x73797320
 80138e0:	206d6574 	.word	0x206d6574
 80138e4:	72616873 	.word	0x72616873
 80138e8:	6d206465 	.word	0x6d206465
 80138ec:	726f6d65 	.word	0x726f6d65
 80138f0:	616d2079 	.word	0x616d2079
 80138f4:	6e697070 	.word	0x6e697070
 80138f8:	68632067 	.word	0x68632067
 80138fc:	206b6365 	.word	0x206b6365
 8013900:	706d6f63 	.word	0x706d6f63
 8013904:	6574656c 	.word	0x6574656c
 8013908:	000a0d2e 	.word	0x000a0d2e
 801390c:	74696e49 	.word	0x74696e49
 8013910:	6572433a 	.word	0x6572433a
 8013914:	64657461 	.word	0x64657461
 8013918:	00000020 	.word	0x00000020
 801391c:	67617020 	.word	0x67617020
 8013920:	61742065 	.word	0x61742065
 8013924:	73656c62 	.word	0x73656c62
 8013928:	000a0d2e 	.word	0x000a0d2e
 801392c:	74696e49 	.word	0x74696e49
 8013930:	6572433a 	.word	0x6572433a
 8013934:	64657461 	.word	0x64657461
 8013938:	72697620 	.word	0x72697620
 801393c:	6c617574 	.word	0x6c617574
 8013940:	63616d20 	.word	0x63616d20
 8013944:	656e6968 	.word	0x656e6968
 8013948:	70616320 	.word	0x70616320
 801394c:	6c696261 	.word	0x6c696261
 8013950:	20797469 	.word	0x20797469
 8013954:	6c626174 	.word	0x6c626174
 8013958:	49432065 	.word	0x49432065
 801395c:	00002044 	.word	0x00002044
 8013960:	74696e49 	.word	0x74696e49
 8013964:	7269563a 	.word	0x7269563a
 8013968:	6c617574 	.word	0x6c617574
 801396c:	63616d20 	.word	0x63616d20
 8013970:	656e6968 	.word	0x656e6968
 8013974:	70616320 	.word	0x70616320
 8013978:	6c696261 	.word	0x6c696261
 801397c:	20797469 	.word	0x20797469
 8013980:	6c626174 	.word	0x6c626174
 8013984:	69732065 	.word	0x69732065
 8013988:	0020657a 	.word	0x0020657a
 801398c:	74696e49 	.word	0x74696e49
 8013990:	6572433a 	.word	0x6572433a
 8013994:	64657461 	.word	0x64657461
 8013998:	72697620 	.word	0x72697620
 801399c:	6c617574 	.word	0x6c617574
 80139a0:	63616d20 	.word	0x63616d20
 80139a4:	656e6968 	.word	0x656e6968
 80139a8:	6f727020 	.word	0x6f727020
 80139ac:	73736563 	.word	0x73736563
 80139b0:	44494320 	.word	0x44494320
 80139b4:	00000020 	.word	0x00000020
 80139b8:	74696e49 	.word	0x74696e49
 80139bc:	6572433a 	.word	0x6572433a
 80139c0:	64657461 	.word	0x64657461
 80139c4:	72697620 	.word	0x72697620
 80139c8:	206c6175 	.word	0x206c6175
 80139cc:	6863616d 	.word	0x6863616d
 80139d0:	20656e69 	.word	0x20656e69
 80139d4:	72657375 	.word	0x72657375
 80139d8:	72687420 	.word	0x72687420
 80139dc:	20646165 	.word	0x20646165
 80139e0:	20444943 	.word	0x20444943
 80139e4:	00000000 	.word	0x00000000
 80139e8:	746e6920 	.word	0x746e6920
 80139ec:	616e7265 	.word	0x616e7265
 80139f0:	4954206c 	.word	0x4954206c
 80139f4:	00002044 	.word	0x00002044
 80139f8:	490a0d2e 	.word	0x490a0d2e
 80139fc:	3a74696e 	.word	0x3a74696e
 8013a00:	61657243 	.word	0x61657243
 8013a04:	20646574 	.word	0x20646574
 8013a08:	75726976 	.word	0x75726976
 8013a0c:	6d206c61 	.word	0x6d206c61
 8013a10:	69686361 	.word	0x69686361
 8013a14:	6920656e 	.word	0x6920656e
 8013a18:	7265746e 	.word	0x7265746e
 8013a1c:	74707572 	.word	0x74707572
 8013a20:	72687420 	.word	0x72687420
 8013a24:	20646165 	.word	0x20646165
 8013a28:	20444943 	.word	0x20444943
 8013a2c:	00000000 	.word	0x00000000
 8013a30:	490a0d2e 	.word	0x490a0d2e
 8013a34:	3a74696e 	.word	0x3a74696e
 8013a38:	61657243 	.word	0x61657243
 8013a3c:	20646574 	.word	0x20646574
 8013a40:	75726976 	.word	0x75726976
 8013a44:	6d206c61 	.word	0x6d206c61
 8013a48:	69686361 	.word	0x69686361
 8013a4c:	6920656e 	.word	0x6920656e
 8013a50:	7265746e 	.word	0x7265746e
 8013a54:	74707572 	.word	0x74707572
 8013a58:	646e6520 	.word	0x646e6520
 8013a5c:	6e696f70 	.word	0x6e696f70
 8013a60:	49432074 	.word	0x49432074
 8013a64:	00002044 	.word	0x00002044
 8013a68:	74696e49 	.word	0x74696e49
 8013a6c:	7268543a 	.word	0x7268543a
 8013a70:	20646165 	.word	0x20646165
 8013a74:	74696e69 	.word	0x74696e69
 8013a78:	696c6169 	.word	0x696c6169
 8013a7c:	6974617a 	.word	0x6974617a
 8013a80:	63206e6f 	.word	0x63206e6f
 8013a84:	6c706d6f 	.word	0x6c706d6f
 8013a88:	2e657465 	.word	0x2e657465
 8013a8c:	00000a0d 	.word	0x00000a0d
 8013a90:	74696e49 	.word	0x74696e49
 8013a94:	7269563a 	.word	0x7269563a
 8013a98:	6c617574 	.word	0x6c617574
 8013a9c:	63616d20 	.word	0x63616d20
 8013aa0:	656e6968 	.word	0x656e6968
 8013aa4:	616d6920 	.word	0x616d6920
 8013aa8:	69206567 	.word	0x69206567
 8013aac:	6974696e 	.word	0x6974696e
 8013ab0:	7a696c61 	.word	0x7a696c61
 8013ab4:	6f697461 	.word	0x6f697461
 8013ab8:	6f64206e 	.word	0x6f64206e
 8013abc:	0d2e656e 	.word	0x0d2e656e
 8013ac0:	0000000a 	.word	0x0000000a
 8013ac4:	74696e49 	.word	0x74696e49
 8013ac8:	626f4a3a 	.word	0x626f4a3a
 8013acc:	6e696620 	.word	0x6e696620
 8013ad0:	65687369 	.word	0x65687369
 8013ad4:	202d2064 	.word	0x202d2064
 8013ad8:	65776f6c 	.word	0x65776f6c
 8013adc:	676e6972 	.word	0x676e6972
 8013ae0:	69727020 	.word	0x69727020
 8013ae4:	7469726f 	.word	0x7469726f
 8013ae8:	0a0d2e79 	.word	0x0a0d2e79
 8013aec:	00000000 	.word	0x00000000
 8013af0:	2d2d2d2d 	.word	0x2d2d2d2d
 8013af4:	2d2d2d2d 	.word	0x2d2d2d2d
 8013af8:	2d2d2d2d 	.word	0x2d2d2d2d
 8013afc:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b00:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b04:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b08:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b0c:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b10:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b14:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b18:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b1c:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b20:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b24:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b28:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b2c:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b30:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b34:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b38:	2d2d2d2d 	.word	0x2d2d2d2d
 8013b3c:	0d2d2d2d 	.word	0x0d2d2d2d
 8013b40:	000a0d0a 	.word	0x000a0d0a
