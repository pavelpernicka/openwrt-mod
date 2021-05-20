## Information about this fork
This fork mainly contains changes that make possible to use normal (non QSPI) SPI flashes on Acmesystems Aria-G25 system on module (SoM). At the momment the only flash supported is W25Q128 (16M), but more can be add quite easily (just do the same things as in package/boot/at91bootstrap/patches/901-more_spiflash_families_support.patch). However, the way how the support for flashes is implemented isn't the best, it would be better to edit spi-flash subsystem and add there some support for non-QSPI flashes (I haven't done it because I somehow wasn't even able to make this subsystem work on Aria). It's also a litle bit easier to prepare OpenWrt itself, instand of many configurations of generic at91sam9g25-ek board you can just choose "Aria G25 (spi flash)" and buildsystem makes everything, including final flash image and sysupgrade image. There is also included patch that forces kernel to make gpio accessible through sysfs by normal names in format gpioXX, so there would not be problems for example with Openocd which can't handle other gpio names format.

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
5) Compile
6) When the compilation is done, it's good to check if the image size has not exceeded flash size
7) Flash it and test it

## Original content of readme:
![OpenWrt logo](include/logo.png)

OpenWrt Project is a Linux operating system targeting embedded devices. Instead
of trying to create a single, static firmware, OpenWrt provides a fully
writable filesystem with package management. This frees you from the
application selection and configuration provided by the vendor and allows you
to customize the device through the use of packages to suit any application.
For developers, OpenWrt is the framework to build an application without having
to build a complete firmware around it; for users this means the ability for
full customization, to use the device in ways never envisioned.

Sunshine!

## Development

To build your own firmware you need a GNU/Linux, BSD or MacOSX system (case
sensitive filesystem required). Cygwin is unsupported because of the lack of a
case sensitive file system.

### Requirements

You need the following tools to compile OpenWrt, the package names vary between
distributions. A complete list with distribution specific packages is found in
the [Build System Setup](https://openwrt.org/docs/guide-developer/build-system/install-buildsystem)
documentation.

```
binutils bzip2 diff find flex gawk gcc-6+ getopt grep install libc-dev libz-dev
make4.1+ perl python3.6+ rsync subversion unzip which
```

### Quickstart

1. Run `./scripts/feeds update -a` to obtain all the latest package definitions
   defined in feeds.conf / feeds.conf.default

2. Run `./scripts/feeds install -a` to install symlinks for all obtained
   packages into package/feeds/

3. Run `make menuconfig` to select your preferred configuration for the
   toolchain, target system & firmware packages.

4. Run `make` to build your firmware. This will download all sources, build the
   cross-compile toolchain and then cross-compile the GNU/Linux kernel & all chosen
   applications for your target system.

### Related Repositories

The main repository uses multiple sub-repositories to manage packages of
different categories. All packages are installed via the OpenWrt package
manager called `opkg`. If you're looking to develop the web interface or port
packages to OpenWrt, please find the fitting repository below.

* [LuCI Web Interface](https://github.com/openwrt/luci): Modern and modular
  interface to control the device via a web browser.

* [OpenWrt Packages](https://github.com/openwrt/packages): Community repository
  of ported packages.

* [OpenWrt Routing](https://github.com/openwrt-routing/packages): Packages
  specifically focused on (mesh) routing.

## Support Information

For a list of supported devices see the [OpenWrt Hardware Database](https://openwrt.org/supported_devices)

### Documentation

* [Quick Start Guide](https://openwrt.org/docs/guide-quick-start/start)
* [User Guide](https://openwrt.org/docs/guide-user/start)
* [Developer Documentation](https://openwrt.org/docs/guide-developer/start)
* [Technical Reference](https://openwrt.org/docs/techref/start)

### Support Community

* [Forum](https://forum.openwrt.org): For usage, projects, discussions and hardware advise.
* [Support Chat](https://webchat.freenode.net/#openwrt): Channel `#openwrt` on freenode.net.

### Developer Community

* [Bug Reports](https://bugs.openwrt.org): Report bugs in OpenWrt
* [Dev Mailing List](https://lists.openwrt.org/mailman/listinfo/openwrt-devel): Send patches
* [Dev Chat](https://webchat.freenode.net/#openwrt-devel): Channel `#openwrt-devel` on freenode.net.

## License

OpenWrt is licensed under GPL-2.0
