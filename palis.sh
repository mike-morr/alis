# Archbomination - Mixing PowerShell and Arch
# very deep on PowerShell, so let's try it for arch install
# includes btrfs and is based on arch official install guide
# mostly an automatic version of https://wiki.archlinux.org/index.php/User:Altercation/Bullet_Proof_Arch_Install

# let's get minimum deps for PowerShell
pacman --noconfirm --needed -S git fakeroot

# create aur build directory
rm -rf /home/build || true
mkdir /home/build

chgrp nobody /home/build
chmod g+ws /home/build
setfacl -m u::rwx,g::rwx /home/build
setfacl -d --set u::rwx,g::rwx,o::- /home/build
cd /home/build

# Clone and build PowerShell
rm -rf /home/build/powershell-bin || true
git clone https://aur.archlinux.org/powershell-bin.git
cd powershell-bin
cat PKGBUILD

sudo -u nobody makepkg -si

# PowerShell has been installed, start the install
pwsh -c ./install.ps1
