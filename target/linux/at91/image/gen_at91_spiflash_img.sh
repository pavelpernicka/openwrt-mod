#!/usr/bin/env bash

COMBINEDFILE="$6"
BOOTLOADER="$3"
KERNEL="$5"
ROOTFSR="$4"
UBOOT="$2"
UBOOT_ENV="$1"

newsize=$((16777216)) #16 MB flash
rm -f $COMBINEDFILE

# offset musí začínat na začátku erase blocku
dd conv=notrunc bs=1 if=$BOOTLOADER of=$COMBINEDFILE seek=0 
dd conv=notrunc bs=1 if=$UBOOT_ENV of=$COMBINEDFILE seek=$((0x00005000))
dd conv=notrunc bs=1 if=$UBOOT of=$COMBINEDFILE seek=$((0x00008000))
dd conv=notrunc bs=1 if=$KERNEL of=$COMBINEDFILE seek=$((0x000b0000))
dd conv=notrunc bs=1 if=$ROOTFSR of=$COMBINEDFILE seek=$((0x00330000))

filesize=$(stat -c "%s" $COMBINEDFILE)
padcount=$((newsize - filesize))
dd if=/dev/zero ibs=1 count="$padcount" | tr "\000" "\377" >> $COMBINEDFILE
echo "Done!"
