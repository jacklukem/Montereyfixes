#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\033[1;38;5;51m;%s\a' "$color"

printf "$'\e[40m'MontereyFixes beta by jackluke"

printf "\n\n\n"

echo "Welcome to the MontereyFixes beta\nthis version should allow fix auto login for non Metal GPUs\nyou should run this from an USB Monterey installer environment (or even from an USB BigSur installer)"
echo "\nSetting nvram and csrutil parameter to enforce compatibility check"
nvram boot-args="-no_compat_check amfi_get_out_of_my_way=1"
csrutil disable
csrutil authenticated-root disable
echo "\nDone\n"
echo "\nListing the APFS disks\n"
diskutil list
echo "\nDone\n"
echo "\nListing available mounted disks\n"
ls /Volumes
echo "\n"
read -p "Type your Monterey Volume label -> " label  
mount -uw /Volumes/"$label"
echo "\nDone"
echo "\n\nAttempting to patch Setup Assistant for Monterey APFS System"
cd /Volumes/"$label"/System/Library/CoreServices
cd Setup\ Assistant.app/Contents/MacOS
cp -a /Volumes/"Image Volume"/setupautologinfix/Setup\ Assistant* .
cd .. ; cd .. ; cd .. 
echo "\nRebuild kernel collection for snapshot booting\n"
/Volumes/"$label"/usr/bin/kmutil install --volume-root /Volumes/"$label" --update-all
/Volumes/"$label"/usr/sbin/kcditto
echo "\nMaking a new snapshot with patched kext\n"
bless --folder /Volumes/"$label"/System/Library/CoreServices --bootefi --create-snapshot
diskutil apfs listSnapshots /Volumes/"$label"/
cd /Volumes/"$label"\ -\ Data/Library/KernelCollections/
cd .. ; cd ..
cd private/var/db
rm .AppleSetupDone
echo "\nDone"
echo "\n\nAfter reboot your Monterey should reload Setup Assistant with Accounts prefpane to edit login options to enable auto login for admin account\n"