CROSS_COMPILE ?= mipsel-elf-
CC = $(CROSS_COMPILE)gcc
AS = $(CC)
LD = $(CROSS_COMPILE)ld
OC = $(CROSS_COMPILE)objcopy
OD = $(CROSS_COMPILE)objdump

CFLAGS += -Wall -Wextra -O3 -g3
CFLAGS += -march=mips32r2 -mtune=mips32r2

all:	bootrom

bootrom:
	$(CC) $(CFLAGS) -c -o bootrom.o bootrom.s
	$(CC) -T $@.ld -Wl,-Map=$@.map,--cref,--no-warn-mismatch -o $@.elf \
		bootrom.o
	$(OD) -D -m mips -S $@.elf > $@.dis
	$(OC) -O binary -S $@.elf $@.bin

clean:
	rm -f ./*.o ./*.bin ./*.elf ./*.dis ./*.map
