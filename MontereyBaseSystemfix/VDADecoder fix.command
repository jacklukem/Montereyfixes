#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\033[1;38;5;218m;%s\a' "$color"

printf "$'\e[40m'MontereyFixes VDADecoder fix by jackluke"

printf "\n\n\n"

echo "Welcome to the MontereyFixes VDADecoder fix\n\nthis version should unpatch Safari settings"
account=$(whoami)
echo "\nApplying the Monterey Safari unpatch to the current account: $account"
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari.plist ExperimentalUseGPUProcessForMediaEnabled -bool TRUE
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari.plist ExperimentalVP9SWDecoderEnabledOnBattery -bool TRUE
defaults write com.apple.coremedia hardwareVideoDecoder -string enable
~/Downloads/VDADecoderChecker
echo "\nDone"
echo "\n\nNow on Monterey using VDADecoderChecker should print Hardware acceleration is fully supported and YouTube and other sites streaming work too\n"