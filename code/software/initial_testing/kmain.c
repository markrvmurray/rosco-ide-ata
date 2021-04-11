/*
 * Copyright (c) 2021 Mark R V Murray <mark@grondar.org>
 */

#include <assert.h>
#include <machine.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

// This needs to go in the library.
void
__assert_func(const char *file, int line, const char *func, const char *cond)
{

	printf("ASSERT: file %s, line %d, function %s ""%s""\r\n", file, line, func, cond);
	for (;;)
		continue;
}

#define min(a,b) ((a) < (b) ? (a) : (b))
#define max(a,b) ((a) > (b) ? (a) : (b))

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

enum REG_CONTROL_BIT { CONTROL_nIEN = 1, CONTROL_SRST };

#define MASTER_DEVICE_SELECT 0xE0

#define DEVICE_COMMAND_NOP 0x00
#define DEVICE_COMMAND_IDENTIFY_DEVICE 0xEC
#define DEVICE_COMMAND_READ_SECTORS 0x20
#define DEVICE_COMMAND_WRITE_SECTORS 0x30

#define DEFAULT_BUFFER_COUNT 4

volatile uint16_t *idereg = (volatile uint16_t *)IDE_BASE;

         int device;
         uint8_t command;
volatile uint16_t vsectors_read, vsectors_written;
         uint16_t sectors_to_read, sectors_to_write;
volatile uint8_t vstatus, verror;
volatile bool virq = false;

union {
	volatile uint32_t lword[DEFAULT_BUFFER_COUNT][128];
	volatile uint16_t word[DEFAULT_BUFFER_COUNT][256];
	volatile uint8_t byte[DEFAULT_BUFFER_COUNT][512];
	char string[DEFAULT_BUFFER_COUNT][512];
	uint8_t whole[DEFAULT_BUFFER_COUNT*512];
} vbuffer;

static inline void
read_sector_data(volatile uint16_t *buffer)
{

	for (int i = 0; i < 256; i++)
		buffer[i] = idereg[IDE_REG_RD_DATA];
}

static inline void
write_sector_data(volatile uint16_t *buffer)
{

	for (int i = 0; i < 256; i++)
		idereg[IDE_REG_WR_DATA] = buffer[i];
}

__attribute__ ((interrupt)) void
autovector_ipl_3_handler(void)
{
	virq = true;
	vstatus = idereg[IDE_REG_RD_STATUS] & 0x00FF;
	verror = idereg[IDE_REG_RD_ERROR] & 0x00FF;
	switch (command) {
	case DEVICE_COMMAND_NOP:
		break;
	case DEVICE_COMMAND_READ_SECTORS:
	case DEVICE_COMMAND_IDENTIFY_DEVICE:
		if (vstatus & (1<<STATUS_DRQ))
			read_sector_data(vbuffer.word[vsectors_read++]);
		break;
	case DEVICE_COMMAND_WRITE_SECTORS:
		if (vstatus & (1<<STATUS_DRQ))
			write_sector_data(vbuffer.word[vsectors_written++]);
		break;
	}
	printf("Interrupt 3\r\n");
}

void
setup_interrupts(void)
{
	void (**vector)(void);

	mcDisableInterrupts();
	vector = (void (**)(void))(&_INITIAL_STACK);
	vector[27] = autovector_ipl_3_handler;
	mcEnableInterrupts();
}

char *
string_error(uint8_t err_reg)
{
	static char buffer[64];
	int i;

	sprintf(buffer, "[ ");
	for (i = 7; i >= 0; i--)
		sprintf(buffer + strlen(buffer), "%s ", str_error_reg[i][err_reg >> i & 0x01]);
	sprintf(buffer + strlen(buffer), "]");

	return buffer;
}

char *
string_status(uint8_t stat_reg)
{
	static char buffer[64];
	int i;

	sprintf(buffer, "[ ");
	for (i = 7; i >= 0; i--)
		sprintf(buffer + strlen(buffer), "%s ", str_status_reg[i][stat_reg >> i & 0x01]);
	sprintf(buffer + strlen(buffer), "]");

	return buffer;
}

uint32_t
fnv_1a(char *buffer, unsigned count)
{
	uint32_t hash;

	hash = 0x811c9dc5;

	for (unsigned i = 0; i < count; i++) {
		hash ^= buffer[i];
		hash *= 0x01000193;
	}

	return hash ;
}

void
fill_sectors(int buffer_count, unsigned sector)
{
	for (int i = 0; i < buffer_count; i++) {
		for (int j = 0; j < 508; j++)
			vbuffer.byte[i][j] = j;
		sprintf(vbuffer.string[i], "ZZZZ - %09d////ROSCO_68K///", sector++);
		vbuffer.lword[i][127] = fnv_1a(vbuffer.string[i], 508);
	}
}

void
select_device(int dev)
{

	assert(dev == 0 || dev == 1);

	while (idereg[IDE_REG_RD_ALT_STATUS] & (1<<STATUS_BSY))
		continue;

	idereg[IDE_REG_WR_LBA_27_24] = MASTER_DEVICE_SELECT | ((dev & 0x01)<<4);

	for (int i = 0; i < 4; i++)			// This is Black Magic.
		(void)idereg[IDE_REG_RD_ALT_STATUS];	// Read the status 4 times to allow the newly-selected drive to settle.

	while ((idereg[IDE_REG_RD_ALT_STATUS] & ((1<<STATUS_BSY)|(1<<STATUS_DRDY))) != (1<<STATUS_DRDY))
		continue;
	device = dev;
}

void
set_lba_address(unsigned lba, unsigned count)
{

	assert(lba <= 0x0FFFFFFF);

	idereg[IDE_REG_RD_SECTOR_COUNT] = count;
	idereg[IDE_REG_WR_LBA_27_24] = MASTER_DEVICE_SELECT | ((device & 0x01)<<4) | (uint8_t)(lba>>24);
	idereg[IDE_REG_RD_LBA_23_16] = (uint8_t)(lba>>16);
	idereg[IDE_REG_RD_LBA_15_8] = (uint8_t)(lba>>8);
	idereg[IDE_REG_RD_LBA_7_0] = (uint8_t)(lba);
}

void
print_id_parameters(volatile uint16_t *id_block)
{

	printf("[0] %s %s %s\r\n", (id_block[0] & 0x8000) ? "ATAPI" : "ATA", (id_block[0] & 0x0080) ? "Removable media device" : "", (id_block[0] & 0x0040) ? "Not Removable controller and/or device" : "");
	printf("[1] Logical cylinders = %u\r\n", id_block[1]);
	printf("[3] Logical heads = %u\r\n", id_block[3]);
	printf("[6] Logical sectors per logical track = %u\r\n", id_block[6]);
	printf("[10-19] Serial number = \"%.20s\"\r\n", &id_block[10]);
	printf("[22] Vendor-specic bytes available on READ/WRITE LONG commands = %u\r\n", id_block[22]);
	printf("[23-26] Firmware revision = \"%.8s\"\r\n", &id_block[23]);
	printf("[27-46] Model number = \"%.40s\"\r\n", &id_block[27]);
	printf("[47] Max number of sectors that can be transferred per interrupt on READ/WRITE MULTIPLE = %u\r\n", id_block[47] & 0xFF);
	printf("[53] The fields in [54-58] %s valid\r\n", (id_block[53] & 0x0001) ? "are" : "may be");
	printf("[54] Number of current logical cylinders = %u\r\n", id_block[54]);
	printf("[55] Number of current logical heads = %u\r\n", id_block[55]);
	printf("[56] Number of current logical sectors per track = %u\r\n", id_block[56]);
	printf("[57-58] Current capacity in sectors = %u\r\n", (uint32_t)id_block[58]*65536 + (uint32_t)id_block[57]);
	printf("[60-61] Total number of LBA addressable sectors = %u\r\n", (uint32_t)id_block[61]*65536 + (uint32_t)id_block[60]);
	printf("[80] Major version number = %04X\r\n", id_block[80]);
	printf("[81] Minor version number = %04X\r\n", id_block[81]);
	printf("[128] Security Status = %04X\r\n", id_block[128]);
}

void
kmain(void)
{

	static char ascii[17];

	printf("Setting Autovector IPL handlers\n\r");
	setup_interrupts();

	printf("Disabling device interrupt\r\n");
	idereg[IDE_REG_WR_DEVICE_CONTROL] = (1<<CONTROL_nIEN);

	printf("Selecting the %d device\r\n", 0);

	printf("Enabling device interrupt\r\n");
	idereg[IDE_REG_WR_DEVICE_CONTROL] = 0;

	vsectors_read = 0;
	vsectors_written = 0;

	memset(vbuffer.whole, 0, sizeof(vbuffer.whole));

#if 0
	printf("Sending the NOP command\r\n");
	printf("Expect STATUS.ERR and ERROR.ABRT\r\n");
	idereg[IDE_REG_WR_COMMAND] = command = DEVICE_COMMAND_NOP;
#endif

#if 1
	printf("Sending the IDENTIFY DEVICE command\r\n");
	sectors_to_read = 1;
	idereg[IDE_REG_WR_COMMAND] = command = DEVICE_COMMAND_IDENTIFY_DEVICE;
#endif

#if 0
	printf("Sending the READ SECTORS command\r\n");
	set_lba_address(0, DEFAULT_BUFFER_COUNT);
	sectors_to_read = DEFAULT_BUFFER_COUNT;
	idereg[IDE_REG_WR_COMMAND] = command = DEVICE_COMMAND_READ_SECTORS;
#endif

#if 0
	printf("Filling sector buffer with dummy data\r\n");
	fill_sectors(DEFAULT_BUFFER_COUNT, 0);
	printf("Sending the WRITE SECTORS command, followed by data\r\n");
	set_lba_address(0, DEFAULT_BUFFER_COUNT);
	sectors_to_write = DEFAULT_BUFFER_COUNT;
	idereg[IDE_REG_WR_COMMAND] = command = DEVICE_COMMAND_WRITE_SECTORS;
	vstatus = idereg[IDE_REG_RD_ALT_STATUS];
	verror = idereg[IDE_REG_RD_ERROR];
	if (vstatus & (1<<STATUS_ERR))
		printf("Write Error %s\r\n", idereg[IDE_REG_RD_ERROR]);
	else {
		printf("Waiting for DRQ to clear\r\n");
		while (!(idereg[IDE_REG_RD_ALT_STATUS] & (1<<STATUS_DRQ)))
			continue;
		write_sector_data(vbuffer.word[vsectors_written++]);
	}
#endif

	switch (command) {
	case DEVICE_COMMAND_NOP:
		printf("Waiting for interrupt to trigger\r\n");
		while (!virq)
			continue;
		break;
	case DEVICE_COMMAND_IDENTIFY_DEVICE:
	case DEVICE_COMMAND_READ_SECTORS:
		printf("Waiting for %d sectors to be read\r\n", sectors_to_read);
		while (vsectors_read != sectors_to_read)
			continue;
		break;
	case DEVICE_COMMAND_WRITE_SECTORS:
		printf("Waiting for %d sectors to be written\r\n", sectors_to_write);
		while (vsectors_written != sectors_to_write)
			continue;
		break;
	}

	printf("Status = %s\r\n", string_status(vstatus));
	if (vstatus & (1<<STATUS_ERR))
		printf("Error =  %s\r\n", string_error(verror));

	if (command == DEVICE_COMMAND_IDENTIFY_DEVICE || command == DEVICE_COMMAND_READ_SECTORS) {
		ascii[16] = '\0';
		for (int i = 0; i < vsectors_read; i++) {
			printf("Sector offset %d\r\n", i);
			for (int j = 0; j < 32; j++) {
				printf("%04X -", j*16);
				for (int k = 0; k < 16; k++) {
					printf(" %02X", vbuffer.byte[i][j*16 + k]);
					ascii[k] = vbuffer.byte[i][j*16 + k];
					ascii[k] = (ascii[k] >= ' ' && ascii[k] <= '~') ? ascii[k] : '.';
				}
				printf(" - %s\r\n", ascii);
			}
		}
	}

	if (command == DEVICE_COMMAND_IDENTIFY_DEVICE)
		print_id_parameters(vbuffer.word[0]);


}
