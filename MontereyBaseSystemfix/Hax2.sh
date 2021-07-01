#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'Monterey beta USB Installer fix by jackluke"

printf "\n\n\n"

echo "Welcome to the Monterey beta USB Installer  fix for domain error as target Volume"
echo "\nApplying the ASentientBot HaxLib patch modified for allow Sealing"
launchctl setenv DYLD_INSERT_LIBRARIES /Volumes/Image\ Volume/HaxLibSeal.dylib
echo "Done"
echo "\nDisabling SSV"
csrutil authenticated-root disable
csrutil status
nvram csr-active-config
echo "Done"
echo "\nSetting nvram parameter to enforce compatibility check"
nvram boot-args="-no_compat_check"
nvram boot-args
echo "Done"
echo "\nYou can close with CMD+Q and launch from Utilities the Install macOS"