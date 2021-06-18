#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\033[1;38;5;218m;%s\a' "$color"

printf "$'\e[40m'MontereyFixes GPU video media fix by jackluke"

printf "\n\n\n"

echo "Welcome to the MontereyFixes GPU video media fix\n\nthis version should allow any video media streaming content on Monterey Safari with an IntelHD4000 (and other similar unsupported Metal GPUs and maybe also non Metal)"
account=$(whoami)
echo "\nApplying the Monterey Safari fix to the current account: $account"
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari.plist ExperimentalUseGPUProcessForMediaEnabled -bool FALSE
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari.plist ExperimentalVP9SWDecoderEnabledOnBattery -bool TRUE
defaults write com.apple.coremedia hardwareVideoDecoder -string disable
echo "\nDone"
echo "\n\nNow on Monterey through an IntelHD4000 (and other similar unsupported Metal GPUs and maybe also non Metal) you can play any video media streaming content through Safari, for example Youtube and others\n"