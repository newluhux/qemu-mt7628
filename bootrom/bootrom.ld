OUTPUT_ARCH(mips)
ENTRY(_start)

MEMORY
{
	bootrom : ORIGIN = 0xb0118000, LENGTH = 32K
}

SECTIONS
{
	.bootrom :
	{
		bootrom.o (.text)
	} > bootrom
}
