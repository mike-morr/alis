#!/usr/bin/env bash
set -e

grub-install --target=x86_64-efi --bootloader-id='Arch' --efi-directory=/boot/efi --recheck
