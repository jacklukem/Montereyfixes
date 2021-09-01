#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'Monterey beta SharedSupport.dmg fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the Monterey Beta SharedSupport.dmg fix, this version works also with non-APFS legacy usb"
echo "\nMonterey beta SharedSupport.dmg fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting Monterey InstallAssistant package"
SharedSupport="$(ls ~/Downloads/InstallAssistant.pkg)";
if [ -e /Volumes/Install\ macOS\ Monterey*/BaseSystem/BaseSystem.dmg ] && [ -e "$SharedSupport" ] ;
then
echo "\nMonterey Installer app found, now copying the updated SharedSupport.dmg to the target MontereyBaseSystemfix, this might take up to 15 minutes\n"
sudo cp -a ~/Downloads/InstallAssistant.pkg /Volumes/Install\ macOS\ Monterey*/*.app/Contents/SharedSupport/SharedSupport.dmg
echo "\nDone\n"
echo "\nAfter reboot your Monterey stage2 macOS Installer should use an updated SharedSupport.dmg with BootKernelExtensions.kc as prelinkedkernel\n"
else
echo "\nWarning: You don't have any Monterey Installer app or InstallAssistant on Applications folder or any plugged USB MontereyBaseSystemfix\n"
fi