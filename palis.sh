# create aur build directory
mkdir /home/build
chgrp nobody /home/build
chmod g+ws /home/build
setfacl -m u::rwx,g::rwx /home/build
setfacl -d --set u::rwx,g::rwx,o::- /home/build
cd /home/build

# Clone PowerShell
git clone https://aur.archlinux.org/powershell-bin.git
cd powershell-bin
cat PKGBUILD

sudo -u nobody makepkg -si
