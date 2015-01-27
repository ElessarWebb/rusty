
.SUFFIXES: .asm .img

.asm.img:
	nasm -f bin -o $@ $<

all: bootloader.img

run: bootloader.img
	qemu-system-i386 -fda bootloader.img
