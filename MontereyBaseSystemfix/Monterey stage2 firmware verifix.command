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
sudo perl -pi -e 's|\x00\x64\x69\x72\x65\x63\x74\x5f\x68\x61\x6e\x64\x6f\x66\x66\x00\x45\x6e\x61\x62\x6c\x65\x20\x64\x69\x72\x65\x63\x74\x20\x68\x61\x6e\x64\x6f\x66\x66\x20\x66\x6f\x72\x20\x72\x65\x61\x6c\x74\x69\x6d\x65\x20\x74\x68\x72\x65\x61\x64\x73\x00|\x00\x68\x76\x5f\x76\x6d\x6d\x5f\x70\x72\x65\x73\x65\x6e\x74\x00\x45\x6e\x61\x62\x6c\x65\x20\x64\x69\x72\x65\x63\x74\x20\x68\x61\x6e\x64\x6f\x66\x66\x20\x66\x6f\x72\x20\x72\x65\x61\x6c\x74\x69\x6d\x65\x20\x74\x68\x72\x65\x61\x64\x73\x00|g' BootKernelExtensions.kc
sudo perl -pi -e 's|\x00\x68\x76\x5f\x64\x69\x73\x61\x62\x6c\x65\x00\x68\x76\x5f\x76\x6d\x6d\x5f\x70\x72\x65\x73\x65\x6e\x74\x00|\x00\x68\x76\x5f\x64\x69\x73\x61\x62\x6c\x65\x00\x64\x69\x72\x65\x63\x74\x5f\x68\x61\x6e\x64\x6f\x66\x66\x00|g' BootKernelExtensions.kc
echo "\nPatching the stage2 installer macOS Installer as vmm"
sudo chflags -R nouchg /Volumes/*/"macOS Install Data"/"Locked Files"/
sudo chmod uo+rw /Volumes/*/"macOS Install Data"/"Locked Files"/
cd /Volumes/*/"macOS Install Data"/"Locked Files"/
sudo perl -pi -e 's|\x00\x64\x69\x72\x65\x63\x74\x5f\x68\x61\x6e\x64\x6f\x66\x66\x00\x45\x6e\x61\x62\x6c\x65\x20\x64\x69\x72\x65\x63\x74\x20\x68\x61\x6e\x64\x6f\x66\x66\x20\x66\x6f\x72\x20\x72\x65\x61\x6c\x74\x69\x6d\x65\x20\x74\x68\x72\x65\x61\x64\x73\x00|\x00\x68\x76\x5f\x76\x6d\x6d\x5f\x70\x72\x65\x73\x65\x6e\x74\x00\x45\x6e\x61\x62\x6c\x65\x20\x64\x69\x72\x65\x63\x74\x20\x68\x61\x6e\x64\x6f\x66\x66\x20\x66\x6f\x72\x20\x72\x65\x61\x6c\x74\x69\x6d\x65\x20\x74\x68\x72\x65\x61\x64\x73\x00|g' BootKernelExtensions.kc
sudo perl -pi -e 's|\x00\x68\x76\x5f\x64\x69\x73\x61\x62\x6c\x65\x00\x68\x76\x5f\x76\x6d\x6d\x5f\x70\x72\x65\x73\x65\x6e\x74\x00|\x00\x68\x76\x5f\x64\x69\x73\x61\x62\x6c\x65\x00\x64\x69\x72\x65\x63\x74\x5f\x68\x61\x6e\x64\x6f\x66\x66\x00|g' BootKernelExtensions.kc
echo "\nPatching the boot files for macOS Installer as vmm"
sudo chflags -R nouchg /Volumes/*/"macOS Install Data"/"Locked Files"/"Boot Files"/
sudo chmod uo+rw /Volumes/*/"macOS Install Data"/"Locked Files"/"Boot Files"/
cd /Volumes/*/"macOS Install Data"/"Locked Files"/"Boot Files"/
sudo perl -pi -e 's|\x00\x64\x69\x72\x65\x63\x74\x5f\x68\x61\x6e\x64\x6f\x66\x66\x00\x45\x6e\x61\x62\x6c\x65\x20\x64\x69\x72\x65\x63\x74\x20\x68\x61\x6e\x64\x6f\x66\x66\x20\x66\x6f\x72\x20\x72\x65\x61\x6c\x74\x69\x6d\x65\x20\x74\x68\x72\x65\x61\x64\x73\x00|\x00\x68\x76\x5f\x76\x6d\x6d\x5f\x70\x72\x65\x73\x65\x6e\x74\x00\x45\x6e\x61\x62\x6c\x65\x20\x64\x69\x72\x65\x63\x74\x20\x68\x61\x6e\x64\x6f\x66\x66\x20\x66\x6f\x72\x20\x72\x65\x61\x6c\x74\x69\x6d\x65\x20\x74\x68\x72\x65\x61\x64\x73\x00|g' BootKernelExtensions.kc
sudo perl -pi -e 's|\x00\x68\x76\x5f\x64\x69\x73\x61\x62\x6c\x65\x00\x68\x76\x5f\x76\x6d\x6d\x5f\x70\x72\x65\x73\x65\x6e\x74\x00|\x00\x68\x76\x5f\x64\x69\x73\x61\x62\x6c\x65\x00\x64\x69\x72\x65\x63\x74\x5f\x68\x61\x6e\x64\x6f\x66\x66\x00|g' BootKernelExtensions.kc
echo "\nDone\n"
echo "\nAfter reboot either your Monterey stage1 and stage2 macOS Installer should use a patched BaseSystem with BootKernelExtensions.kc as BKE vmm to skip firmware verification \n"
else
echo "\nWarning: You don't have any USB Monterey Installer plugged or any Monterey macOS Install Data\n"
fi
