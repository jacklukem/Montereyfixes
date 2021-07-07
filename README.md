# Montereyfixes

Alpha Beta working BaseSystem fix installer: https://github.com/jacklukem/Montereyfixes/releases

based mainly on ASentientBot patched 0xfff boot.efi and HaxLib.dylib

![Monterey BaseSystemfix](https://github.com/jacklukem/Montereyfixes/blob/main/MontereyBaseSystemfix/MontereyInstallerBaseSystemfix.jpeg?raw=true)

![MontereyFixes table](https://raw.githubusercontent.com/jacklukem/Montereyfixes/main/MontereyFixes%20table.png)

Quick guide: https://github.com/jacklukem/Montereyfixes/blob/main/MontereyBaseSystemfix.pdf

IntelHD4000 fixes credits:

me for finding valid apple compiled Metal, GL binaries bundles on 11.0 beta 3 and com.apple.coremedia to disable hardware video decoder

EduCovas for Catalina AppleIntelGraphicsShared.bundle (libIGIL-Metal.dylib), restart fix through updated 11.4 AppleIntelFrameBufferCapri and VADriver

Dhinak for retrieving beta 6 more updated Metal binaries

khronokernel for fixing Metal white overlay on Safari Google search bar through BigSur com.apple.WebProcess.sb (WebKit framework)

current issue with IntelHD4000 on Monterey eject key that crash to login window, anyway these will still work:
```shell
CMD ⌘ + E (eject selected CD or DVD)
ctrl + eject ⏏ (shows finder power options)
ctrl + ⇧ shift + eject ⏏ (shorcut to turn off display)
alt ⌥ + CMD ⌘ + eject ⏏ (shortcut to stand by Mac)
ctrl + CMD ⌘ + eject ⏏ (shortcut to restart Mac)
ctrl + alt ⌥ + CMD ⌘ + eject (shortcut to power off Mac)
```

My workaround to fix Bluetooth (on machines equipped with BT 2.1 + EDR) buy a cheap `USB Bluetooth 4.0 CSR` based on this chip `CSR8510`(works with stock Monterey drivers): https://docs.qualcomm.com/bundle/publicresource/80-CT903-1.pdf


# MontereyBaseSystemfix
### external recovery patcher, from here you can delete the `com.apple.os.update` locked snapshot booting resulting in a working `sudo mount -uw /` to make any system modifications (this requires an unsealed System installation), updated for generic Monterey 12.x beta, simply restore through DiskUtility this DMG to a minimum 2 GB USB drive [Dropbox link](https://www.dropbox.com/s/j0kpnq6k0n3rrhh/montereybasesystemfix.dmg?dl=0)
besides DiskUtility you can use also its Apple Software Restore command line :
```shell
sudo asr -source ~/Downloads/MontereyBaseSystemfix.dmg -erase -noverify -target /Volumes/YourUSBLabel
```

Note about delete snapshot: `sudo mount -uw /` works only with an unsealed System (that is when using ASentientBot HaxLib Installer fix), while instead if you made a Sealed System installation then after deleting snapshot if you get a kp `Rooting from the live fs of a sealed volume is not allowed on a RELEASE build` , this is easily fixable from MontereyBaseSystemfix using Rebuild KC or MontereyFixes snapshot booting.

![MontereyBaseSystemfix2](https://user-images.githubusercontent.com/63143548/122277646-678c9b00-cee6-11eb-90b5-de013c97482f.jpeg)

 workaround to boot non metal desktop enable "auto login" from login options

I made also a patched Setup Assistant to simplify this step (Montereyfixes AppleSetupUndone and non Metal autologinfix) but if you already made multiuser accounts to simply reload Setup Assistant boot targeting Monterey disk through CMD+S then type:

```shell
mount -P 2
rm /private/var/db/.AppleSetupDone
exit
```

```
Other notes from CMD+S that work and volumes are writable from a snapshot booting:

"mount -P 1" (mounts the APFS Preboot Volume, mount point is typically on /System/Volumes/)
"mount -P 2" (mounts the APFS Data Volume, mount point is merged with /)
"mount -vat nonfs" (mount all the filesystem types, added on BigSur)
```

![Monterey autologinfix](https://github.com/jacklukem/Montereyfixes/raw/main/setupautologinfix/Monterey%20autologinfix.jpeg)

anyway is expectable that apple will fix this, because safe mode needs to work also without Metal acceleration for supported Mac.

Infact apple fixed the non metal login window on macOS Monterey beta 2 (21A5268h) they also changed the label and product icons.
