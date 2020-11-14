#!/usr/bin/env bash
set -e

PARTITION_OPTIONS="defaults,noatime,X-mount.mkdir"
CRYPTO_NAME="cryptoroot"

cryptsetup open "${DEVICE}2" $CRYPTO_NAME

DEVICE_ROOT="/dev/mapper/${CRYPTO_NAME}"

mount -o "subvol=@,$PARTITION_OPTIONS,compress=zstd" "$DEVICE_ROOT" /mnt
mount -o "subvol=@root-home,$PARTITION_OPTIONS,compress=zstd" "$DEVICE_ROOT" /mnt/root
mount -o "subvol=@var,$PARTITION_OPTIONS,compress=zstd" "$DEVICE_ROOT" /mnt/var
mount -o "subvol=@srv,$PARTITION_OPTIONS,compress=zstd" "$DEVICE_ROOT" /mnt/srv
mount -o "subvol=@home,$PARTITION_OPTIONS,compress=zstd" "$DEVICE_ROOT" /mnt/home
mount -o "subvol=@opt,$PARTITION_OPTIONS,compress=zstd" "$DEVICE_ROOT" /mnt/opt
mount -o "subvol=@grub2,$PARTITION_OPTIONS,compress=zstd" "$DEVICE_ROOT" /mnt/boot/grub2
mount -o "subvol=@tmp,$PARTITION_OPTIONS,compress=zstd" "$DEVICE_ROOT" /mnt/tmp
mount -o "subvol=@usr-local,$PARTITION_OPTIONS,compress=zstd" "$DEVICE_ROOT" /mnt/usr/local
mount -o "subvol=@snapshots,$PARTITION_OPTIONS,compress=zstd" "$DEVICE_ROOT" /mnt/.snapshots

mkdir -p /mnt/boot/efi
mount -o "$PARTITION_OPTIONS" "$PARTITION_BOOT" /mnt/boot/efi
