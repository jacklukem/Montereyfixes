#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke

printf '\e[92m;%s\a' "$color"

printf "$'\e[40m'Reditshallow by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'

echo "\n\nWelcome to Reditshallow adding this to an automator workflow actions on folder should allow from Monterey beta 6 to redit and run any shell script from Desktop and Downloads folder"
touch ~/this.isrecent
if [ -e ~/this.isrecent ]; then
ls -l ~/Desktop > /tmp/check.this
ls -l ~/Downloads > /tmp/check2.this
diff /tmp/check.this ~/this.isrecent || echo "something changed"
diff /tmp/check2.this ~/this.isrecent || echo "something else changed" 
xattr -dr com.apple.quarantine ~/Desktop
xattr -dr com.apple.quarantine ~/Downloads
fi