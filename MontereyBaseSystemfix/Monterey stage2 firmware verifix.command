#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'Monterey beta 9 stage2 installer BaseSystem BKE vmm to skip firmware verification fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the Monterey beta 9 stage2 installer BaseSystem BKE vmm to skip firmware verification, this version does include legacy usb fixes"
echo "\nMonterey stage2 installer BaseSystem BKE vmm to skip firmware verification fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting Monterey APFS Data macOS Installer stage2"
if [ -e /Volumes/*/"macOS Install Data"/UpdateBundle/AssetData ]
echo "&& [ -e /Volumes/*/BaseSystem/BaseSystembackup.dmg ]"
then
echo "\nPatching the stage1 installer as vmm"
cd /Volumes/*/BaseSystem/
cd ..
cd System/Library/KernelCollections/
sudo perl -pi -e 's|\00\64\69\72\65\63\74\5f\68\61\6e\64\6f\66\66\00\45\6e\61\62\6c\65\20\64\69\72\65\63\74\20\68\61\6e\64\6f\66\66\20\66\6f\72\20\72\65\61\6c\74\69\6d\65\20\74\68\72\65\61\64\73\00|\00\68\76\5f\76\6d\6d\5f\70\72\65\73\65\6e\74\00\45\6e\61\62\6c\65\20\64\69\72\65\63\74\20\68\61\6e\64\6f\66\66\20\66\6f\72\20\72\65\61\6c\74\69\6d\65\20\74\68\72\65\61\64\73\00|g' BootKernelExtensions.kc
sudo perl -pi -e 's|\00\68\76\5f\64\69\73\61\62\6c\65\00\68\76\5f\76\6d\6d\5f\70\72\65\73\65\6e\74\00|\00\68\76\5f\64\69\73\61\62\6c\65\00\64\69\72\65\63\74\5f\68\61\6e\64\6f\66\66\00|g' BootKernelExtensions.kc
echo "\nPatching the stage2 installer macOS Installer as vmm"
sudo chflags -R nouchg /Volumes/*/"macOS Install Data"/"Locked Files"/
sudo chmod uo+rw /Volumes/*/"macOS Install Data"/"Locked Files"/
cd /Volumes/*/"macOS Install Data"/"Locked Files"/
sudo perl -pi -e 's|\00\64\69\72\65\63\74\5f\68\61\6e\64\6f\66\66\00\45\6e\61\62\6c\65\20\64\69\72\65\63\74\20\68\61\6e\64\6f\66\66\20\66\6f\72\20\72\65\61\6c\74\69\6d\65\20\74\68\72\65\61\64\73\00|\00\68\76\5f\76\6d\6d\5f\70\72\65\73\65\6e\74\00\45\6e\61\62\6c\65\20\64\69\72\65\63\74\20\68\61\6e\64\6f\66\66\20\66\6f\72\20\72\65\61\6c\74\69\6d\65\20\74\68\72\65\61\64\73\00|g' BootKernelExtensions.kc
sudo perl -pi -e 's|\00\68\76\5f\64\69\73\61\62\6c\65\00\68\76\5f\76\6d\6d\5f\70\72\65\73\65\6e\74\00|\00\68\76\5f\64\69\73\61\62\6c\65\00\64\69\72\65\63\74\5f\68\61\6e\64\6f\66\66\00|g' BootKernelExtensions.kc
echo "\nDone\n"
echo "\nAfter reboot either your Monterey stage1 and stage2 macOS Installer should use a patched BaseSystem with BootKernelExtensions.kc as BKE vmm to skip firmware verification \n"
else
echo "\nWarning: You don't have any USB Monterey Installer plugged or any Monterey macOS Install Data\n"
fi
