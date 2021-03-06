#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'MontereyBaseSystemfix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the MontereyBaseSystemfix for legacy USB\n and non-APFS Mac this version does include sound, Wifi and legacy usb fixes"
echo "\nMonterey BaseSystem can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check amfi_get_out_of_my_way=1"
echo "Done"
echo "\nDetecting and adjusting Monterey APFS BaseSystem"
if [ -e /Volumes/Install\ macOS\ Monterey*/BaseSystem/BaseSystem.dmg ]
then
cd /Volumes/Install\ macOS\ Monterey*/BaseSystem/
rm BaseSystem.dmg.shadow
hdiutil attach -owners on BaseSystem.dmg -shadow
echo "\nAdjusting Monterey APFS BaseSystem can take up to 15 minutes"
echo "github blob or raw use main instead of master"
curl https://github.com/jacklukem/Montereyfixes/raw/main/MontereyBaseSystemfix/MontereyFixes --progress-bar -L -o /private/tmp/MontereyFixes
curl https://github.com/jacklukem/Montereyfixes/raw/main/MontereyBaseSystemfix/Utilities.plist --progress-bar -L -o /private/tmp/Utilities.plist
cd /Volumes/macOS\ Base\ System/System/Installation/CDIS/Recovery\ Springboard.app/Contents
cd Resources
sudo cp /private/tmp/Utilities.plist .
cd /Volumes/macOS\ Base\ System/Applications/
sudo unzip -qo -P jacklukem /private/tmp/MontereyFixes -d .
diskutil unmount "macOS Base System"
diskutil unmount "Preboot"
cd /Volumes/Install\ macOS\ Monterey*/BaseSystem/
hdiutil unmount BaseSystem.dmg -force
echo "First part Done"
echo "\nYou now should unplug and plug again your USB Monterey Installer\nthen launch the BaseSystem fix2 to complete the patching"
else
echo "\nWarning: you don't have any USB Monterey Installer plugged\n\nNote to run directly from Monterey an ethernet or wifi internet connection is required\n"
fi
