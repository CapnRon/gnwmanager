/* Stash the stacked PC at a fixed RAM slot before handing off to Error_Handler. */
	.syntax unified
	.thumb
	.global FaultCap_RecordPC
	.thumb_func
FaultCap_RecordPC:
	mrs	r0, msp
	ldr	r1, [r0, #24]		/* stacked PC */
	ldr	r2, =0x240F8000		/* debug capture slot */
	str	r1, [r2]
	b	Error_Handler
	.size	FaultCap_RecordPC, .-FaultCap_RecordPC
