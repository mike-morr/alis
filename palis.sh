# Archbomination - Mixing dotnet and Arch
# includes btrfs and is based on arch official install guide
# mostly an automatic version of https://wiki.archlinux.org/index.php/User:Altercation/Bullet_Proof_Arch_Install

# let's get minimum deps for PowerShell
pacman --noconfirm --needed -S git fakeroot dotnet-runtime

export PATH="${PATH}:~/.dotnet/tools"

dotnet tool install --global PowerShell

# PowerShell has been installed, start the install
pwsh -c ./install.ps1
