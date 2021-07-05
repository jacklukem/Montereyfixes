#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[92m;%s\a' "$color"

printf "$'\e[40m'Monterey BaseSystem fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the Monterey BaseSystem fix2 for legacy USB\n and non-APFS Mac this version does not legacy usb fixes"
echo "\nMonterey BaseSystem fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check amfi_get_out_of_my_way=1"
echo "Done"
echo "\nDetecting and adjusting Monterey APFS BaseSystem"
if [ -e /Volumes/Install\ macOS\ Monterey*/BaseSystem/BaseSystem.dmg.shadow ]
then
cd /Volumes/Install\ macOS\ Monterey*/BaseSystem/
hdiutil convert -format ULFO -o ~/Downloads/BaseSystem2.dmg BaseSystem.dmg -shadow
mv BaseSystem.dmg BaseSystembackup.dmg
rm BaseSystem.dmg.shadow
mv ~/Downloads/BaseSystem2.dmg BaseSystem.dmg
echo "\nPatching Monterey USB Installer can take up to 15 minutes"
echo "github blob or raw use main instead of master"
curl https://github.com/jacklukem/Montereyfixes/raw/main/MontereyBaseSystemfix/com.apple.Boot.plist --progress-bar -L -o /private/tmp/com.apple.Boot.plist

curl https://github.com/jacklukem/Montereyfixes/blob/main/MontereyBaseSystemfix/boot.efi?raw=true --progress-bar -L -o /private/tmp/boot.efi
curl https://github.com/jacklukem/Montereyfixes/blob/main/MontereyBaseSystemfix/HaxfixUSB.zip?raw=true --progress-bar -L -o /private/tmp/HaxfixUSB.zip
curl https://github.com/jacklukem/Montereyfixes/blob/main/MontereyBaseSystemfix/kext.zip?raw=true --progress-bar -L -o /private/tmp/kext.zip
curl https://github.com/jacklukem/Montereyfixes/blob/main/MontereyBaseSystemfix/IntelHD4000beta3.zip?raw=true --progress-bar -L -o /private/tmp/IntelHD4000beta3.zip
curl https://github.com/jacklukem/Montereyfixes/blob/main/MontereyBaseSystemfix/HaxLibSeal.dylib?raw=true --progress-bar -L -o /private/tmp/HaxLibSeal.dylib
cd ..
cd Library/Preferences/SystemConfiguration/
sudo cp -a /private/tmp/com.apple.Boot.plist .
cd .. ; cd .. ; cd ..
cd System/Library/CoreServices
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo cp -a /private/tmp/boot.efi .
sudo bless --folder . --bootefi ./boot.efi --label "Monterey Installer (BaseSystem fix)"
cd .. ; cd .. ; cd ..
mkdir custom
sudo unzip -o /private/tmp/HaxfixUSB.zip -d .
sudo unzip -o /private/tmp/kext.zip -d .
cd kext
mv /private/tmp/IntelHD4000beta3.zip .
cd ..
mv /private/tmp/HaxLibSeal.dylib .
mv HaxFixUSB/* .
mv VolumeIcon.icns .VolumeIcon.icns
rm -r HaxFixUSB __MACOSX
echo "Done"
echo "\nAfter reboot your Monterey should use a patched BaseSystem with stock BootKernelExtensions.kc\n \n"
else
echo "\nWarning: you should launch first BaseSystem fix or you don't have any USB Monterey Installer plugged\n\nNote to run directly from Monterey an ethernet or Wifi internet connection is required\n"
fi
