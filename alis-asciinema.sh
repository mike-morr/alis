#!/usr/bin/env bash
set -e

# Arch Linux Install Script (alis) installs unattended, automated
# and customized Arch Linux system.
# Copyright (C) 2020 mike-morr

curl -sL https://github.com/asciinema/asciinema/archive/v2.0.1.zip -o asciinema-2.0.1.zip
bsdtar -x -f asciinema-2.0.1.zip
cp -r asciinema-2.0.1/* .
rm -f alis.asciinema
python3 -m asciinema rec -i 5 --overwrite "$@" ~/alis.asciinema