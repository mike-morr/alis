#!/usr/bin/env bash
set -e

# Arch Linux Install Script (alis) installs unattended, automated
# and customized Arch Linux system.
# Copyright (C) 2020 mike-morr

GITHUB_USER="mike-morr"

while getopts "u:" arg; do
  case ${arg} in
    u)
      GITHUB_USER=${OPTARG}
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

rm -f alis.conf
rm -f alis.sh
rm -f alis-asciinema.sh
rm -f alis-reboot.sh

rm -f alis-recovery.conf
rm -f alis-recovery.sh
rm -f alis-recovery-asciinema.sh
rm -f alis-recovery-reboot.sh

curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/alis.conf
curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/alis.sh
curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/palis.sh
curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/install.ps1
curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/alis-asciinema.sh
curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/alis-reboot.sh

curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/alis-recovery.conf
curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/alis-recovery.sh
curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/alis-recovery-asciinema.sh
curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/alis-recovery-reboot.sh
curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/alis-mount.sh
curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/groot-i-am-root.jpg
curl -H "Cache-Control: no-cache" -O https://raw.githubusercontent.com/$GITHUB_USER/alis/master/alis-grub-install.sh
chmod +x alis.sh
chmod +x palis.sh
chmod +x install.ps1
chmod +x alis-asciinema.sh
chmod +x alis-reboot.sh
chmod +x alis-grub-install.sh
chmod +x alis-mount.sh

chmod +x alis-recovery.sh
chmod +x alis-recovery-asciinema.sh
chmod +x alis-recovery-reboot.sh
