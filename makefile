CC=gcc
CFLAGS=-m32 -c

.SUFFIXES: .asm .img .o

.asm.o:
	nasm -f elf32 -o $@ $<

all: kernel

kernel: kernel.o multiboot.o link.ld
	ld -m elf_i386 -T link.ld -o kernel multiboot.o kernel.o

run-kernel: kernel
	qemu-system-i386 -kernel kernel

bootloader: bootloader.img

run-bootloader: bootloader.img
	qemu-system-i386 -fda bootloader.img

clean:
	-@rm -rf *.o kernel
