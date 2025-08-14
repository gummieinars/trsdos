#
# make trsdos 2.3 system files
#
# Version 0.0
#
AS	= az80
HB	= hex2bin
CA	= cat
TR	= truncate
DI	= diff
BI	= ../bin

all:	boot sys0 sys1 sys2 sys3 sys4 sys5 sys6

boot:
	$(AS) -l $@.lst -o $@.hex $@.asm
	$(HB) -o $@.bin $@.hex
	$(AS) -t -l copyr.lst -o copyr.bin -r 0x00fe copyr.asm
	$(TR) -s 512 copyr.bin
	$(AS) -l gata.lst -o gata.hex gata.asm
	$(HB) -o gata.bin gata.hex
	$(AS) -l gatb.lst -o gatb.hex gatb.asm
	$(HB) -o gatb.bin gatb.hex
	$(CA) $@.bin copyr.bin gata.bin gatb.bin > $@.sys
	$(DI) -s $@.sys $(BI)/$@.sys

sys0:
	$(AS) -t -l $@.lst -o $@.cmd -r 0x00fe $@.asm
	$(DI) -s $@.cmd $(BI)/$@.sys

sys1:
	$(AS) -t -l $@.lst -o $@.cmd -r 0x00fe $@.asm
	$(DI) -s $@.cmd $(BI)/$@.sys

sys2:
	$(AS) -t -l $@.lst -o $@.cmd -r 0x00fe $@.asm
	$(DI) -s $@.cmd $(BI)/$@.sys

sys3:
	$(AS) -t -l $@.lst -o $@.cmd -r 0x00fc $@.asm
	$(DI) -s $@.cmd $(BI)/$@.sys

sys4:
	$(AS) -t -l $@.lst -o $@.cmd -r 0x00fe $@.asm
	$(DI) -s $@.cmd $(BI)/$@.sys

sys5:
	$(AS) -t -l $@.lst -o $@.cmd -r 0x00fe $@.asm
	$(DI) -s $@.cmd $(BI)/$@.sys

sys6:
	$(AS) -t -l $@.lst -o $@.cmd -r 0x00fe $@.asm
	$(DI) -s $@.cmd $(BI)/$@.sys

clean:
	rm *.bin *.cmd *.hex *.lst *.sys
