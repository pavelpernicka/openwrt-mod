#
# Copyright (C) 2016 Ben Whitten <ben.whitten@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_VERSION:=linux4sam_5.8
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/linux4sam/u-boot-at91.git
PKG_MIRROR_HASH:=03ae55f16e716c2c06481372174f9d8506fa077459bf321a024e0d23a9bb013a
PKG_SOURCE_VERSION:=59f202622154f82e708a6ca2bf86350a5c1b2d33

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define U-Boot/Default
  BUILD_TARGET:=at91
  HIDDEN:=1
  UBOOT_IMAGE:=u-boot.bin
endef

define U-Boot/at91sam9m10g45ek_nandflash
  NAME:=AT91SAM9M10G45-EK board (NandFlash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9m10g45ek
endef

define U-Boot/at91sam9x5ek_nandflash
  NAME:=AT91SAM9X5-EK board (NandFlash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9g15ek at91sam9g25ek \
                 at91sam9g35ek at91sam9x25ek \
				 at91sam9x35ek
endef

define U-Boot/sama5d3_xplained_nandflash
  NAME:=SAMA5D3 Xplained board (NandFlash)
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d3_xplained
endef

define U-Boot/sama5d3_xplained_mmc
  NAME:=SAMA5D3 Xplained board (SDcard)
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d3_xplained
endef

define U-Boot/sama5d2_xplained_spiflash
  NAME:=SAMA5D2 Xplained board (SPI Flash)
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d2_xplained
endef

define U-Boot/sama5d2_xplained_mmc
  NAME:=SAMA5D2 Xplained board (SDcard/EMMC)
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d2_xplained
endef

define U-Boot/sama5d4_xplained_spiflash
  NAME:=SAMA5D4 Xplained board (SPI Flash)
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d4_xplained
endef

define U-Boot/sama5d4_xplained_mmc
  NAME:=SAMA5D4 Xplained board (SDcard)
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d4_xplained
endef

define U-Boot/sama5d4_xplained_nandflash
  NAME:=SAMA5D4 Xplained board (NandFlash)
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d4_xplained
endef

define U-Boot/sama5d27_som1_ek_mmc
  NAME:=SAMA5D27 SOM1 Ek (SDCard)
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d27_som1_ek
endef

define U-Boot/sama5d27_som1_ek_spiflash
  NAME:=SAMA5D27 SOM1 Ek (QSPI Flash)
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d27_som1_ek
endef

define U-Boot/sama5d2_ptc_ek_nandflash
  NAME:=SAMA5D2 PTC Ek (Nand Flash)
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d2_ptc_ek
endef

define U-Boot/sama5d2_ptc_ek_mmc
  NAME:=SAMA5D2 PTC Ek (SDCard)
  BUILD_SUBTARGET:=sama5
  BUILD_DEVICES:=at91-sama5d2_ptc_ek
endef

define U-Boot/at91sam9g15ek_nandflash
  NAME:=AT91SAM9G15-EK board (NandFlash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9g15ek
endef

define U-Boot/at91sam9g25ek_nandflash
  NAME:=AT91SAM9G25-EK board (NandFlash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9g25ek
endef

define U-Boot/at91sam9g35ek_nandflash
  NAME:=AT91SAM9G35-EK board (NandFlash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9g35ek
endef

define U-Boot/at91sam9x25ek_nandflash
  NAME:=AT91SAM9x25-EK board (NandFlash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9x25ek
endef

define U-Boot/at91sam9x35ek_nandflash
  NAME:=AT91SAM9x35-EK board (NandFlash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9x35ek
endef

define U-Boot/at91sam9g15ek_mmc
  NAME:=AT91SAM9G15-EK board (SDcard)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9g15ek
endef

define U-Boot/at91sam9g25ek_mmc
  NAME:=AT91SAM9G25-EK board (SDcard)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9g25ek
endef

define U-Boot/at91sam9g35ek_mmc
  NAME:=AT91SAM9G35-EK board (SDcard)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9g35ek
endef

define U-Boot/at91sam9x25ek_mmc
  NAME:=AT91SAM9x25-EK board (SDcard)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9x25ek
endef

define U-Boot/at91sam9x35ek_mmc
  NAME:=AT91SAM9x35-EK board (SDcard)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9x35ek
endef

define U-Boot/at91sam9g15ek_spiflash
  NAME:=AT91SAM9G15-EK board (SPI Flash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9g15ek
endef

define U-Boot/at91sam9g25ek_spiflash
  NAME:=AT91SAM9G25-EK board (SPI Flash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9g25ek
endef

define U-Boot/at91sam9g35ek_spiflash
  NAME:=AT91SAM9G35-EK board (SPI Flash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9g35ek
endef

define U-Boot/at91sam9x25ek_spiflash
  NAME:=AT91SAM9x25-EK board (SPI Flash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9x25ek
endef

define U-Boot/at91sam9x35ek_spiflash
  NAME:=AT91SAM9x35-EK board (SPI Flash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91sam9x35ek
endef

define U-Boot/at91-ariag25_spiflash
  NAME:=Aria G25 (SPI Flash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91-ariag25
endef

define U-Boot/at91-ariag25_mmc
  NAME:=Aria G25 (SDcard)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91-ariag25
endef

define U-Boot/at91-ariag25_nandflash
  NAME:=Aria G25 (NandFlash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91-ariag25
endef

define U-Boot/sam9x60ek_mmc
  NAME:=SAM9X60-EK board (SDcard)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91-sam9x60ek
endef

define U-Boot/sam9x60ek_nandflash
  NAME:=SAM9X60-EK board (Nand Flash)
  BUILD_SUBTARGET:=sam9x
  BUILD_DEVICES:=at91-sam9x60ek
endef

UBOOT_TARGETS := \
	at91-ariag25_nandflash \
	at91-ariag25_mmc \
	at91-ariag25_spiflash \
	at91sam9g15ek_spiflash \
	at91sam9g25ek_spiflash \
	at91sam9g35ek_spiflash \
	at91sam9x25ek_spiflash \
	at91sam9x35ek_spiflash \
	at91sam9g15ek_mmc \
	at91sam9g25ek_mmc \
	at91sam9g35ek_mmc \
	at91sam9x25ek_mmc \
	at91sam9x35ek_mmc \
	at91sam9g15ek_nandflash \
	at91sam9g25ek_nandflash \
	at91sam9g35ek_nandflasht \
	at91sam9x25ek_nandflash \
	at91sam9x35ek_nandflash \
	at91sam9m10g45ek_nandflash \
	sam9x60ek_mmc \
	sam9x60ek_nandflash \
	at91sam9m10g45ek_nandflash \
	at91sam9x5ek_nandflash \
	sama5d3_xplained_nandflash \
	sama5d3_xplained_mmc \
	sama5d2_xplained_mmc \
	sama5d2_xplained_spiflash \
	sama5d4_xplained_mmc \
	sama5d4_xplained_spiflash \
	sama5d4_xplained_nandflash\
    sama5d27_som1_ek_mmc \
    sama5d27_som1_ek_spiflash \
	sama5d2_ptc_ek_nandflash \
	sama5d2_ptc_ek_mmc

define Build/Compile
  +$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
     CROSS_COMPILE=$(TARGET_CROSS) \
	 DTC=$(LINUX_DIR)/scripts/dtc/dtc \
     KCFLAGS="$(filter-out -fstack-protector \
      -mfloat-abi=hard, $(TARGET_CFLAGS)) -mfloat-abi=soft"
endef

$(eval $(call BuildPackage/U-Boot))
