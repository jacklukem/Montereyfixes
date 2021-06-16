# Montereyfixes

Alpha working BaseSystem fix installer based mainly on:

ASentientBot patched 0xfff boot.efi and HaxLib.dylib, workaround to boot non metal desktop enable "auto login" from login options

I made also a patched Setup Assistant to simplify this step (Montereyfixes AppleSetupUndone and non Metal autologinfix) but if you already made multiuser accounts to simply reload Setup Assistant boot targeting Monterey disk through CMD+S then type:

```shell
mount -P 2
rm /private/var/db/.AppleSetupDone
exit
```

anyway is expectable that apple will fix this, because safe mode needs to works also without Metal acceleration for supported Mac.

# MontereyBaseSystemfix
external recovery patcher (from here you can even delete also for `Monterey` the `com.apple.os.update` locked snapshot booting resulting in a working `mount -uw /` to make any system modifications), updated for generic Monterey 12.x beta, simply restore through DiskUtility this DMG to a minimum 2 GB USB drive [Dropbox link]()
besides DiskUtility you can use also its Apple Software Restore command line :
```shell
sudo asr -source ~/Downloads/MontereyBaseSystemfix.dmg -erase -noverify -target /Volumes/YourUSBLabel
```

![Monterey BaseSystemfix](https://user-images.githubusercontent.com/63143548/122189199-025a8a80-ce91-11eb-90c7-26d757bff18c.jpeg)

![MontereyFixes table](https://user-images.githubusercontent.com/63143548/122200632-844fb100-ce9b-11eb-83c7-ab4e6a58c045.png)

