#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\033[1;38;5;51m;%s\a' "$color"

printf "$'\e[40m'Monterey Preboot OTA fix beta by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the Monterey Preboot OTA fix beta\nthis version should fix booting without nvram compat_check and even without opencore, allowing OTA updates booting directly from apple startup manager only requirement is a snapshot booting (it works even with an unsealed system)"
echo "\nMonterey Preboot OTA fix beta can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
csrutil disable
csrutil authenticated-root disable
echo "\nDone\n"
printf '\033[1;38;5;226m'
echo "\nListing the APFS disks\n"
diskutil list | grep APFS
echo "\nDetecting and adjusting Monterey APFS Preboot\n"
diskutil list | grep Preboot
echo "\n(if you have multiple Preboot check from previous list which belongs to Monterey diskX then type the diskXs2 with largest MB size)\n" 
read -p "Type your diskXsY (for example disk3s2) Monterey APFS Volume label -> " prelabel
diskutil mount $prelabel
if [ -e /Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
sudo mount -uw /Volumes/Preboot*
cd /Volumes/Preboot/*/boot/System/Library/KernelCollections/
echo "\nPatching Preboot BKE as vmm for allowing OTA updates"
sudo perl -pi -e 's|\x00\x64\x69\x72\x65\x63\x74\x5f\x68\x61\x6e\x64\x6f\x66\x66\x00\x45\x6e\x61\x62\x6c\x65\x20\x64\x69\x72\x65\x63\x74\x20\x68\x61\x6e\x64\x6f\x66\x66\x20\x66\x6f\x72\x20\x72\x65\x61\x6c\x74\x69\x6d\x65\x20\x74\x68\x72\x65\x61\x64\x73\x00|\x00\x68\x76\x5f\x76\x6d\x6d\x5f\x70\x72\x65\x73\x65\x6e\x74\x00\x45\x6e\x61\x62\x6c\x65\x20\x64\x69\x72\x65\x63\x74\x20\x68\x61\x6e\x64\x6f\x66\x66\x20\x66\x6f\x72\x20\x72\x65\x61\x6c\x74\x69\x6d\x65\x20\x74\x68\x72\x65\x61\x64\x73\x00|g' BootKernelExtensions.kc
sudo perl -pi -e 's|\x00\x68\x76\x5f\x64\x69\x73\x61\x62\x6c\x65\x00\x68\x76\x5f\x76\x6d\x6d\x5f\x70\x72\x65\x73\x65\x6e\x74\x00|\x00\x68\x76\x5f\x64\x69\x73\x61\x62\x6c\x65\x00\x64\x69\x72\x65\x63\x74\x5f\x68\x61\x6e\x64\x6f\x66\x66\x00|g' BootKernelExtensions.kc
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
mv PlatformSupport.plist PlatformSupport.plist2
echo "\nSwitching to Beta Update channel"
sudo /System/Library/PrivateFrameworks/Seeding.framework/Resources/seedutil enroll DeveloperSeed
echo "\nDone\n"
echo "\n\nAfter reboot your Monterey should boot directly from apple startup manager allowing OTA updates\n"
elif [ -e /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
cd /System/Volumes/Preboot/*/boot/System/Library/KernelCollections/
echo "\nPatching Preboot BKE as vmm for allowing OTA updates"
sudo perl -pi -e 's|\x00\x64\x69\x72\x65\x63\x74\x5f\x68\x61\x6e\x64\x6f\x66\x66\x00\x45\x6e\x61\x62\x6c\x65\x20\x64\x69\x72\x65\x63\x74\x20\x68\x61\x6e\x64\x6f\x66\x66\x20\x66\x6f\x72\x20\x72\x65\x61\x6c\x74\x69\x6d\x65\x20\x74\x68\x72\x65\x61\x64\x73\x00|\x00\x68\x76\x5f\x76\x6d\x6d\x5f\x70\x72\x65\x73\x65\x6e\x74\x00\x45\x6e\x61\x62\x6c\x65\x20\x64\x69\x72\x65\x63\x74\x20\x68\x61\x6e\x64\x6f\x66\x66\x20\x66\x6f\x72\x20\x72\x65\x61\x6c\x74\x69\x6d\x65\x20\x74\x68\x72\x65\x61\x64\x73\x00|g' BootKernelExtensions.kc
sudo perl -pi -e 's|\x00\x68\x76\x5f\x64\x69\x73\x61\x62\x6c\x65\x00\x68\x76\x5f\x76\x6d\x6d\x5f\x70\x72\x65\x73\x65\x6e\x74\x00|\x00\x68\x76\x5f\x64\x69\x73\x61\x62\x6c\x65\x00\x64\x69\x72\x65\x63\x74\x5f\x68\x61\x6e\x64\x6f\x66\x66\x00|g' BootKernelExtensions.kc
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
mv PlatformSupport.plist PlatformSupport.plist2
echo "\nSwitching to Beta Update channel"
sudo /System/Library/PrivateFrameworks/Seeding.framework/Resources/seedutil enroll DeveloperSeed
echo "Done"
echo "\nAfter reboot your Monterey should boot directly from apple startup manager allowing OTA updates\n"
else
echo "\nWarning: you have multiple separate APFS containers to find your correct Monterey APFS Preboot type:\n\ndiskutil unmount Preboot\ndiskutil list | grep Preboot\n(select the largest MB Preboot and mount)\ndiskutil list | grep Preboot\ndiskutil mount diskXsY\n\nafter mounted diskXsY relaunch the fix\n\n"
diskutil list | grep Preboot
fi
