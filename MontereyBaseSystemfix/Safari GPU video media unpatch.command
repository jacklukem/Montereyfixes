#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\033[1;38;5;218m;%s\a' "$color"

printf "$'\e[40m'MontereyFixes GPU video media unpatch by jackluke"

printf "\n\n\n"

echo "Welcome to the MontereyFixes GPU video media unpatch\n\nthis version should unpatch Safari settings"
account=$(whoami)
echo "\nApplying the Monterey Safari unpatch to the current account: $account"
defaults delete ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari.plist ExperimentalUseGPUProcessForMediaEnabled
defaults delete ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari.plist ExperimentalVP9SWDecoderEnabledOnBattery
defaults write com.apple.coremedia hardwareVideoDecoder -string enable
echo "\nDone"
echo "\n\nNow on Monterey Safari video media settings are reset to defaults\n"
