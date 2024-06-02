#!/bin/bash
qemu-system-i386 -cdrom myos.iso    # test using the bootable media
# qemu-system-i386 -kernel myos.bin   # boot directly through the multiboot kernel