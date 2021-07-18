## Information about this fork
This fork mainly contains changes that make possible to use normal (non QSPI) SPI flashes on Acmesystems Aria-G25 system on module (SoM). At the momment the only flash supported is W25Q128 (16M), but more can be add quite easily (just do the same things as in package/boot/at91bootstrap/patches/901-more_spiflash_families_support.patch). However, the way how the support for flashes is implemented isn't the best, it would be better to edit spi-flash subsystem and add there some support for non-QSPI flashes (I haven't done it because I somehow wasn't even able to make this subsystem work on Aria). It's also a litle bit easier to prepare OpenWrt itself, instand of many configurations of generic at91sam9g25-ek board you can just choose "Aria G25 (spi flash)" and buildsystem makes everything, including final flash image and sysupgrade image. There is also included patch that forces kernel to make gpio accessible through sysfs by normal names in format gpioXX, so there would not be problems for example with Openocd which can't handle other gpio names format.  
Note: this fork contains newer uboot-at91 version than original openwrt 19.07

## Installation steps
1) Clone this repository
2) Follow official Openwrt instructions (original content of readme)
3) In build root folder type make menuconfig and configure:
    * Target system = Microchip (Atmel AT91)
    * Subtarget = SAM9X Boards (ARMv5)
    * Target profile = Acme Systems Aria G25 (spi flash)
    * If you want to make flash image you must configure:
    * Target Images -> squashfs (check) -> Pad to a 4K boundary (without it it makes problems)
    * Target Images -> squashfs (check) -> No options for comprimation (when there are options kernel can't detect filesystem)
    * Target Images -> squashfs (check) -> Block size (in KiB) = value which works with your flash (for W25Q128 it is 128 KiB)
4) Easier way is to use config file configs/ariag25
5) If you want you can change devicetree (dts) located in: target/linux/at91/files/arch/arm/boot/dts/at91-ariag25.dts
6) Compile
7) When the compilation is done, it's good to check if the image size has not exceeded flash size
8) Flash it and test it

## Original content of readme:
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------

This is the buildsystem for the OpenWrt Linux distribution.

To build your own firmware you need a Linux, BSD or MacOSX system (case
sensitive filesystem required). Cygwin is unsupported because of the lack
of a case sensitive file system.

You need gcc, binutils, bzip2, flex, python, perl, make, find, grep, diff,
unzip, gawk, getopt, subversion, libz-dev and libc headers installed.

1. Run "./scripts/feeds update -a" to obtain all the latest package definitions
defined in feeds.conf / feeds.conf.default

2. Run "./scripts/feeds install -a" to install symlinks for all obtained
packages into package/feeds/

3. Run "make menuconfig" to select your preferred configuration for the
toolchain, target system & firmware packages.

4. Run "make" to build your firmware. This will download all sources, build
the cross-compile toolchain and then cross-compile the Linux kernel & all
chosen applications for your target system.

Sunshine!
	Your OpenWrt Community
	http://www.openwrt.org


