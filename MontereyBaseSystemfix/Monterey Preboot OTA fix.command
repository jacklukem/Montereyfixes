#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\033[1;38;5;51m;%s\a' "$color"

printf "$'\e[40m'Monterey Preboot OTA fix beta by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the Monterey Preboot OTA fix beta\nthis version should fix booting without nvram compat_check and even without opencore, allowing OTA updates booting directly from apple startup manager (to work properly this requires a sealed system installation and a snapshot)"
echo "\nSetting nvram and csrutil parameter to enforce compatibility check"
nvram boot-args="-no_compat_check"
csrutil disable
csrutil authenticated-root disable
echo "\nDone\n"
printf '\033[1;38;5;226m'
echo "\nDetecting and adjusting BigSur APFS Preboot\n"
diskutil list | grep Preboot
echo "\n(if you have multiple Preboot type the diskXsY with largest MB size)\n" 
read -p "Type your diskXsY (for example disk3s2) BigSur APFS Volume label -> " prelabel
diskutil mount $prelabel
if [ -e /Volumes/Preboot/*/boot/System/Library/KernelCollections/ ]
then
mount -uw /Volumes/Preboot*
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
cd .. ; cd .. ; cd .. ; cd ..
cd System/Library/CoreServices/
mv PlatformSupport.plist PlatformSupport.plist2
echo "Done"
echo "\nAfter reboot your Monterey should boot should boot directly from apple startup manager allowing OTA updates\n"
else
echo "\nWarning: you have multiple separate APFS containers to find your correct BigSur APFS Preboot type:\n\ndiskutil unmount Preboot\ndiskutil list | grep Preboot\n(select the largest MB Preboot and mount)\ndiskutil list | grep Preboot\ndiskutil mount diskXsY\n\nafter mounted diskXsY relaunch the fix\n\n"
diskutil list | grep Preboot
fi
