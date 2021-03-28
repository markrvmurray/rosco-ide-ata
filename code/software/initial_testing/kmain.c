/*
 * Copyright (c) 2021 Mark R V Murray <mark@grondar.org>
 */

#include <machine.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#define IO_BASE 0x00F80000
#define IDE_BASE (IO_BASE + 0x0040)

#define IDE_REG_RD_DATA 0
#define IDE_REG_RD_ERROR 1
#define IDE_REG_RD_SECTOR_COUNT 2
#define IDE_REG_RD_LBA_7_0 3
#define IDE_REG_RD_LBA_15_8 4
#define IDE_REG_RD_LBA_23_16 5
#define IDE_REG_RD_LBA_27_24 6
#define IDE_REG_RD_STATUS 7

#define IDE_REG_RD_ALT_STATUS 14

#define IDE_REG_WR_DATA 0
#define IDE_REG_WR_FEATURES 1
#define IDE_REG_WR_SECTOR_COUNT 2
#define IDE_REG_WR_LBA_7_0 3
#define IDE_REG_WR_LBA_15_8 4
#define IDE_REG_WR_LBA_23_16 5
#define IDE_REG_WR_LBA_27_24 6
#define IDE_REG_WR_COMMAND 7

#define IDE_REG_WR_DEVICE_CONTROL 14

volatile uint16_t *idereg = (volatile uint16_t *)IDE_BASE;

volatile uint16_t vstatus, verror;
volatile bool virq = false;
volatile bool vread = false;
volatile bool vwrite = false;

volatile union {
	uint16_t word[256];
	uint8_t byte[512];
} vbuffer;

__attribute__ ((interrupt)) void
autovector_ipl_3_handler(void)
{
	virq = true;
	vstatus = idereg[IDE_REG_RD_STATUS] & 0x00FF;
	verror = idereg[IDE_REG_RD_ERROR] & 0x00FF;
	if (vread) {
		if (vstatus & 0x0008) 						// DRQ bit
			for (int i = 0; i < 256; i++)
				vbuffer.word[i] = idereg[IDE_REG_RD_DATA];
	}
	printf("Interrupt 3\r\n");
}

void
kmain(void)
{
	void (**vector)(void);

	printf("Setting Autovector IPL handlers\n\r");
	vector = (void (**)(void))(&_INITIAL_STACK);
	vector[27] = autovector_ipl_3_handler;

	mcEnableInterrupts();

	printf("Disabling interrupt\r\n");
	idereg[IDE_REG_WR_DEVICE_CONTROL] = 0x0002;

	printf("Waiting for BSY to clear\r\n");
	while (idereg[IDE_REG_RD_ALT_STATUS] & 0x0080)
		continue;

	printf("Selecting the master device\r\n");
	idereg[IDE_REG_WR_LBA_27_24] = 0x00E0;

	printf("Waiting for DRDY\r\n");
	while ((idereg[IDE_REG_RD_ALT_STATUS] & 0x00C0) != 0x0040)
		continue;

	printf("Enabling interrupt\r\n");
	idereg[IDE_REG_WR_DEVICE_CONTROL] = 0x0000;

#if 0
	printf("Sending the NOP command\r\n");
	vread = false;
	vwrite = false;
	idereg[IDE_REG_WR_COMMAND] = 0x0000;
#endif

#if 0
	printf("Sending the IDENTIFY DEVICE command\r\n");
	vread = true;
	vwrite = false;
	idereg[IDE_REG_WR_COMMAND] = 0x00EC;
#endif

#if 1
	printf("Sending the READ SECTORS command\r\n");
	vread = true;
	vwrite = false;
	idereg[IDE_REG_RD_LBA_23_16] = 0;
	idereg[IDE_REG_RD_LBA_15_8] = 0;
	idereg[IDE_REG_RD_LBA_7_0] = 0;
	idereg[IDE_REG_RD_SECTOR_COUNT] = 1;
	idereg[IDE_REG_WR_COMMAND] = 0x0020;
#endif

#if 0
	for (unsigned i = 0; i < 512; i++)
		vbuffer.byte[i] = i + 11;
	printf("Sending the WRITE SECTORS command, followed by data\r\n");
	vread = false;
	vwrite = true;
	idereg[IDE_REG_RD_LBA_23_16] = 0;
	idereg[IDE_REG_RD_LBA_15_8] = 0;
	idereg[IDE_REG_RD_LBA_7_0] = 0;
	idereg[IDE_REG_RD_SECTOR_COUNT] = 1;
	idereg[IDE_REG_WR_COMMAND] = 0x0030;
	if (idereg[IDE_REG_RD_STATUS] & 0x0001)					// ERR bit
		printf("Write Error %04X\r\n", idereg[IDE_REG_RD_ERROR]);
	else {
		printf("Checking for DRQ\r\n");
		while ((idereg[IDE_REG_RD_ALT_STATUS] & 0x0008) != 0x0008)	// DRQ bit
			continue;
		for (int i = 0; i < 256; i++)
			idereg[IDE_REG_RD_DATA] = vbuffer.word[i];
	}
#endif

	printf("Waiting for interrupt to trigger\r\n");
	while (!virq)
		continue;

	printf("Error = %04X\r\n", verror);

	printf("vstatus = %04X\r\n", vstatus);

	printf("Checking for DRQ\r\n");
	if ((vstatus & 0x0008 && vread) || vwrite) {
		int i, j;
		for (i = 0; i < 32; i++) {
			printf("%04X -", i*16);
			for (j = 0; j < 16; j++)
				printf(" %02X", vbuffer.byte[i*16 + j]);
			printf(" - ");
			for (j = 0; j < 16; j++)
				printf("%c", (vbuffer.byte[i*16 + j] >= ' ' && vbuffer.byte[i*16 + j] <= '~') ? vbuffer.byte[i*16 + j] : '.');
			printf("\r\n");
		}
	}
}
