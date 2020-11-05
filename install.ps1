# vars
$keymap = "us"
$disk = "/dev/vda"

loadkeys $keymap

$efiVars = ls /sys/firmware/efi/efivars

if ($null -ne $efiVars) {
    $isEfi = $true
} else {
    $isEfi = $false
}

$pingResults = Test-Connection -Ping -ResolveDestination -TargetName google.com -ErrorAction SilentlyContinue

if ($null -eq $pingResults) { Write-Error "Unable to access google.com"; exit 1 }

timedatectl set-ntp true

sgdisk --zap-all $disk
sgdisk --clear `
         --new=1:0:+550MiB --typecode=1:ef00 --change-name=1:EFI `
         --new=2:0:0       --typecode=2:8300 --change-name=2:cryptsystem `
           $disk

$uniqueLabel = $((New-Guid) -split )         
Write-Host "PS working"