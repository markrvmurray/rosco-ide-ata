# IDE/ATA Interface for Rosco_68k

**(c) 2021 Mark R V Murray**

_v1.1 - first public release_


This is a minimalist PIO-only interface to PATA hard disk and
compatible devices.

It has received minimal testing, and is being released in the hope
that it may be useful to someone, somewhere.

The materials in this repository will, when assembled, give a board
that will map the IDE registers into the Rosco_68k's address space.

The addresses are mapped as follows:

| Address | Read | Write | Width in bits |
--- | --- | --- | ---
| 00F80040 | DATA | DATA | 16 |
| 00F80042 | Error | Features | 8 |
| 00F80044 | Sector Count | Sector Count | 8 |
| 00F80046 | Sector Number | Sector Number | 8 |
| 00F80048 | Cylinder Low | Cyllinder Low | 8 |
| 00F8004A | Cylinder High | Cylinder High | 8 |
| 00F8004C | Device and Head | Device and Head | 8 |
| 00F8004E | Status | Command | 8 |
| 00F80050 | (Not used) | | |
| 00F80052 | (Not used) | | |
| 00F80054 | (Not used) | | |
| 00F80056 | (Not used) | | |
| 00F80058 | (Not used) | | |
| 00F8005A | (Not used) | | |
| 00F8005C | Alternate Status | Device Control | 8 |
| 00F8005E | (Not used) | | |

The above memory locations base address may be changed by changing
the U1 image.  This is written in CUPL, and you will need a programmer
capable of programming GAL16V8s or the equivalent.

The supplied GAL images and jumper setting defaults will give the
IDE device IPL3. To change this, the three IPL jumpers on the board
will need to be changed; IPL0 and IPL1 can be cut, and all three
can be (re-)bridged with a solder blob if necessary.
