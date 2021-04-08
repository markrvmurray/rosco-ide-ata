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

static char *str_error_reg[8][2] = {
	{"amnf", "AMNF"},
	{"t0nf", "T0NF"},
	{"abrt", "ABRT"},
	{" mcr", " MCR"},
	{"idnf", "IDNF"},
	{"  mc", "  MC"},
	{" unc", " UNC"},
	{"   x", "   X"}
};

enum REG_ERROR_BIT { ERROR_AMNF, ERROR_T0NF, ERROR_ABRT, ERROR_MCR, ERROR_IDNF, ERROR_MC, ERROR_UNC, ERROR_X };

static char *str_status_reg[8][2] = {
	{" err", " ERR"},
	{" idx", " IDX"},
	{"corr", "CORR"},
	{" drq", " DRQ"},
	{" dsc", " DSC"},
	{"  df", "  DF"},
	{"drdy", "DRDY"},
	{" bsy", " BSY"}
};

enum REG_STATUS_BIT { STATUS_ERR, STATUS_IDX, STATUS_CORR, STATUS_DRQ, STATUS_DSC, STATUS_DF, STATUS_DRDY, STATUS_BSY };

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
print_error(uint8_t err_reg)
{
	int i;

	printf("Error register =  [ ");
	for (i = 7; i >= 0; i--)
		printf("%s ", str_error_reg[i][err_reg >> i & 0x01]);
	printf("]\r\n");
}

void
print_status(uint8_t stat_reg)
{
	int i;

	printf("Status register = [ ");
	for (i = 7; i >= 0; i--)
		printf("%s ", str_status_reg[i][stat_reg >> i & 0x01]);
	printf("]\r\n");
}

void
kmain(void)
{
	void (**vector)(void);
	uint8_t error, status;

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

#if 1
	printf("Sending the NOP command\r\n");
	printf("Should set the ERR status, and an ABRT error\r\n");
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

#if 0
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

	status = (uint8_t)vstatus;
	print_status(status);

	if (status & (1<<STATUS_ERR)) {
		error = (uint8_t)verror;
		print_error(error);
	}

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
