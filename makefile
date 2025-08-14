#
# make trsdos 2.3 utility files
#
# Version 0.0
#

#
# executables and flags
#
AS	= az80 -t
DI	= diff -s

#
# path to binary files
#
BI	= ../bin

all:	backup basic basicr format patch tapedisk test1a

backup:
	$(AS) -l $@.lst -o $@.cmd -r 0x00fe $@.asm
	$(DI) $@.cmd $(BI)/$@.cmd

basic:
	$(AS) -l $@.lst -o $@.cmd -r 0x0100 $@.asm
	$(DI) $@.cmd $(BI)/$@.cmd

basicr:
	$(AS) -l $@.lst -o $@.cmd -r 0x0100 $@.asm
	$(DI) $@.cmd $(BI)/$@.cmd

format:
	$(AS) -l $@.lst -o $@.cmd -r 0x00fe $@.asm
	$(DI) $@.cmd $(BI)/$@.cmd

patch:
	$(AS) -l $@.lst -o $@.cmd -r 0x00fe $@.asm
#	$(DI) $@.cmd $(BI)/$@.cmd

tapedisk:
	$(AS) -l $@.lst -o $@.cmd -r 0x0100 $@.asm
	$(DI) $@.cmd $(BI)/$@.cmd

test1a:
	$(AS) -l $@.lst -o $@.cmd -r 0x00fc $@.asm
	$(DI) $@.cmd $(BI)/$@.cmd

clean:
	rm -rf *.bin *.cmd *.dmp *.hex *.lst
