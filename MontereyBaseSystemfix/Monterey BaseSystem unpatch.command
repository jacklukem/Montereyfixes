#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[92m;%s\a' "$color"

printf "$'\e[40m'Monterey BaseSystem unpatch by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the Monterey BaseSystem unpatch, this version puts the installer to its stock version"
echo "\nMonterey BaseSystem unpatch can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check amfi_get_out_of_my_way=1"
echo "Done"
echo "\nDetecting and adjusting Monterey APFS BaseSystem"
if [ -e /Volumes/*/BaseSystem/BaseSystembackup.dmg ]
then
cd /Volumes/*/BaseSystem/
mv BaseSystembackup.dmg BaseSystem.dmg
rm BaseSystem.dmg.shadow
echo "\nUnpatching Monterey USB Installer can take up to 5 minutes"
echo "github blob or raw use main instead of master"
curl https://github.com/jacklukem/Montereyfixes/blob/main/MontereyBaseSystemfix/bootmontereybeta.efi?raw=true --progress-bar -L -o /private/tmp/boot.efi
cd ..
cd System/Library/CoreServices
sudo cp -a /private/tmp/boot.efi .
sudo bless --folder . --bootefi ./boot.efi --label "Install macOS Beta"
cd .. ; cd .. ; cd ..
rm -r HaxFixUSB __MACOSX
rm Hax*
rm -r kext
rm -r custom
echo "Done"
echo "\nAfter reboot your Monterey should use a stock BaseSystem with stock BootKernelExtensions.kc\n \n"
else
echo "\nWarning: you should launch first BaseSystem fix or you don't have any USB Monterey Installer plugged\n\nNote to run directly from Monterey an ethernet or Wifi internet connection is required\n"
fi
