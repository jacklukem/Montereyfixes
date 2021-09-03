#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke

printf '\e[92m;%s\a' "$color"

printf "$'\e[40m'Reditshallow by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'

echo "\n\nWelcome to Redit shell allow, adding this to an automator workflow actions on folder should allow from Monterey beta 6 to redit and run any shell script from Desktop and Downloads folder"
touch ~/this.isrecent
touch ~/this2.isrecent
ls -l ~/Desktop > /tmp/check.this
ls -l ~/Downloads > /tmp/check2.this
diff /tmp/check.this ~/this.isrecent || echo "something changed"
diff /tmp/check2.this ~/this.isrecent || echo "something else changed"
thischanged=$(diff /tmp/check.this ~/this.isrecent)
this2changed=$(diff /tmp/check2.this ~/this2.isrecent) 
if [ "$thischanged" != "" ] 
then
    echo "The directory was modified"
    cp /tmp/check.this ~/this.isrecent
    xattr -dr com.apple.quarantine ~/Desktop
elif [ "$this2changed" != "" ] 
then
    echo "The directory was modified"
    cp /tmp/check2.this ~/this2.isrecent
    xattr -dr com.apple.quarantine ~/Downloads
fi