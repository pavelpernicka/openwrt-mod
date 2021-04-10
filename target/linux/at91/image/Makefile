# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2006-2013 OpenWrt.org

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

KERNEL_LOADADDR := 0x20008000

define Build/at91-install-zImage
	$(CP) $(KDIR)/zImage $@
endef

include $(SUBTARGET).mk

AT91_SD_BOOT_PARTSIZE:=64
FAT32_BLOCK_SIZE:=1024
FAT32_BLOCKS:=$(shell echo \
  $$(($(AT91_SD_BOOT_PARTSIZE)*1024*1024/$(FAT32_BLOCK_SIZE))))

define Device/Default
  $(Device/default-nand)
  PROFILES := Default
  FILESYSTEMS := squashfs ubifs ext4
  DEVICE_DTS = $(lastword $(subst _, ,$(1)))
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
  KERNEL_SUFFIX := -fit-zImage.itb
  KERNEL = kernel-bin | gzip | fit gzip $$(KDIR)/image-$$(DEVICE_DTS).dtb
endef

define Device/evaluation-fit
  $(Device/evaluation)
  KERNEL_SUFFIX := -fit-uImage.itb
  KERNEL = kernel-bin | lzma | fit lzma $$(KDIR)/image-$$(DEVICE_DTS).dtb
endef

define Device/production
  UBINIZE_OPTS := -E 5
  IMAGES := factory.bin
  IMAGE/factory.bin := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi
endef

define Device/production-dtb
  $(Device/production)
  $(Device/dtb)
  IMAGE/factory.bin := append-dtb | pad-to $$$$(DTB_SIZE) | \
	append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi
endef

$(eval $(call BuildImage))
