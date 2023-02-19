/*
 * mt7628 bootrom for qemu
 *
 * a simple bios
 *
 * Copyright (c) 2023 Lu Hui <luhux76@gmail.com>
 * some code from mtk's uboot:
 * https://gitlab.com/db260179/u-boot-mt7621
 * board/rt2880/include/mem_map_1fc0.h
 * Author: Ian Thompson
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * for more details.
 */


.global _start
_start:
	/* copy FLASH first 8 KiB to ISRAM */

	/* t0 is flash direct access memory address */
	lui   $t0, 0xbc00

	/* t1 is ISRAM start memory address */
	lui   $t1, 0xa020

	/* t2 is ISRAM end memory address */
	addiu $t2, $t1, 8192

_copy:
	/* copy memory */
	lw $t3, 0($t0)
	sw $t3, 0($t1)

	/* address += 4 */
	addiu $t0, $t0, 4
	addiu $t1, $t1, 4

	/* loop */
	bne $t1,$t2,_copy
	nop

_goto_isram:
	lui $t0, 0xa020
	jr $t0
