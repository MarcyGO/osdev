#!/bin/bash
export PATH="$HOME/opt/cross/bin:$PATH"
i686-elf-as boot.s -o boot.o
i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra            # compile the kernel
i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc    # link the kernel
cp myos.bin isodir/boot/myos.bin
grub-mkrescue -o myos.iso isodir    # create the bootable image
qemu-system-i386 -cdrom myos.iso    # test