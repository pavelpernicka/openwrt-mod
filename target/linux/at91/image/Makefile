#
# Copyright (C) 2006-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

KERNEL_LOADADDR := 0x20008000

define Build/at91-install-zImage
    $(CP) $(KDIR)/zImage $@
endef

ifeq ($(SUBTARGET),sam9x)
include ./sam9x.mk
endif
ifeq ($(SUBTARGET),sama5)
include ./sama5.mk
endif

AT91_SD_BOOT_PARTSIZE:=64
FAT32_BLOCK_SIZE:=1024
FAT32_BLOCKS:=$(shell echo \
  $$(($(AT91_SD_BOOT_PARTSIZE)*1024*1024/$(FAT32_BLOCK_SIZE))))

define Device/Default
  $(Device/default-nand)
  PROFILES := Default
  FILESYSTEMS := squashfs ubifs ext4
  DEVICE_DTS := $(1)
  KERNEL_NAME := zImage
  KERNEL_SIZE := 4096k
  KERNEL := kernel-bin | append-dtb | lzma | uImage lzma
  DTB_SIZE := 128k
endef

define Device/dtb
  KERNEL := kernel-bin | lzma | uImage lzma
endef

define Build/at91-spiflash
  $(CP) uboot-env.txt $@-uboot-env.txt
  sed -i '2d;3d' $@-uboot-env.txt
  sed -i '2i board='"spiflash"'' $@-uboot-env.txt
  sed -i '3i board_name='"$(firstword $(SUPPORTED_DEVICES))"'' $@-uboot-env.txt

  mkenvimage -s 0x3000 -o $@-uboot.env $@-uboot-env.txt

  ./gen_at91_spiflash_img.sh \
      $@-uboot.env \
      $(BIN_DIR)/u-boot-$(DEVICE_NAME)_spiflash/u-boot.bin \
      $(BIN_DIR)/at91bootstrap-$(DEVICE_NAME)df_uboot/at91bootstrap.bin \
      $(KDIR)/root.squashfs \
      $(KDIR)/$(DEVICE_NAME)-fit-uImage.itb \
      $@

endef

define Build/at91-sdcard
  $(if $(findstring ext4,$@), \
  rm -f $@.boot
  mkfs.fat -C $@.boot $(FAT32_BLOCKS)

  mcopy -i $@.boot $(KDIR)/zImage ::zImage

  $(foreach dts,$(DEVICE_DTS), \
     mcopy -i $@.boot $(DTS_DIR)/$(dts).dtb \
        ::$(dts).dtb)

  mcopy -i $@.boot \
    $(BIN_DIR)/u-boot-$(DEVICE_NAME:at91-%=%)_mmc/u-boot.bin \
    ::u-boot.bin

  mcopy -i $@.boot \
    $(BIN_DIR)/at91bootstrap-$(DEVICE_NAME:at91-%=%)sd*/at91bootstrap.bin \
    ::BOOT.bin

  ./gen_at91_sdcard_img.sh \
      $@.img \
      $@.boot \
      $(KDIR)/root.ext4 \
      $(AT91_SD_BOOT_PARTSIZE) \
      $(CONFIG_TARGET_ROOTFS_PARTSIZE)

  gzip -nc9 $@.img > $@

  rm -f $@.img $@.boot )
endef

define Device/evaluation-sdimage
  IMAGES += sdcard.img.gz
  IMAGE/sdcard.img.gz := at91-sdcard
endef

define Device/evaluation-spiflashimage
  $(Device/evaluation-fit)
  IMAGES += flash.bin
  IMAGE/flash.bin := at91-spiflash
endef

define Device/spiflash-sysupgrade
  IMAGES += sysupgrade.bin
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs-to 0x00280000 | append-metadata
endef

define Device/evaluation
  KERNEL_INSTALL := 1
  KERNEL_SUFFIX := -uImage
  IMAGES := root.ubi
  IMAGE/root.ubi := append-ubi
endef

define Device/evaluation-zImage
  IMAGES += zImage
  IMAGE/zImage := at91-install-zImage
endef

define Device/evaluation-dtb
  $(Device/evaluation)
  $(Device/dtb)
  $(Device/evaluation-zImage)
  IMAGES += dtb
  IMAGE/dtb := install-dtb
endef

define Device/evaluation-fit
  $(Device/evaluation)
  KERNEL_SUFFIX := -fit-uImage.itb
  KERNEL := kernel-bin | lzma | fit lzma $$(DTS_DIR)/$$(DEVICE_DTS).dtb
endef

define Device/production
  UBINIZE_OPTS := -E 5
  IMAGES := factory.bin
  IMAGE/factory.bin := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi
endef

define Device/production-dtb
  $(Device/production)
  $(Device/dtb)
  IMAGE/factory.bin := append-dtb | pad-to $$$$(DTB_SIZE) \
	  | append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi
endef

$(eval $(call BuildImage))
