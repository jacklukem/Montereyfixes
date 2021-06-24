# Montereyfixes

Alpha working BaseSystem fix installer: https://github.com/jacklukem/Montereyfixes/releases

based mainly on ASentientBot patched 0xfff boot.efi and HaxLib.dylib, workaround to boot non metal desktop enable "auto login" from login options

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
"mount -vat nonfs" (verbose all non filesystem types, not sure I found that on BigSur)
```

![Monterey autologinfix](https://github.com/jacklukem/Montereyfixes/raw/main/setupautologinfix/Monterey%20autologinfix.jpeg)

anyway is expectable that apple will fix this, because safe mode needs to works also without Metal acceleration for supported Mac.

![Monterey BaseSystemfix](https://user-images.githubusercontent.com/63143548/122189199-025a8a80-ce91-11eb-90c7-26d757bff18c.jpeg)

![MontereyFixes table](https://user-images.githubusercontent.com/63143548/122200632-844fb100-ce9b-11eb-83c7-ab4e6a58c045.png)

IntelHD4000 fixes credits:

me for finding valid apple compiled Metal, GL binaries bundles on 11.0 beta 3 and com.apple.coremedia to disable hardware video decoder

EduCovas for Catalina AppleIntelGraphicsShared.bundle (libIGIL-Metal.dylib), restart fix through updated 11.4 AppleIntelFrameBufferCapri and VADriver

Dhinak for retrieving beta 6 more updated Metal binaries

khronokernel for fixing Metal white overlay on Safari Google search bar through BigSur com.apple.WebProcess.sb (WebKit framework)


My workaround to fix Bluetooth (on machines equipped with BT 2.1 + EDR) buy a cheap `USB Bluetooth 4.0 CSR` based on this chip (works with stock Monterey drivers): https://docs.qualcomm.com/bundle/publicresource/80-CT903-1.pdf


# MontereyBaseSystemfix
external recovery patcher, from here you can delete the `com.apple.os.update` locked snapshot booting resulting in a working `sudo mount -uw /` to make any system modifications, updated for generic Monterey 12.x beta, simply restore through DiskUtility this DMG to a minimum 2 GB USB drive [Dropbox link](https://www.dropbox.com/s/j0kpnq6k0n3rrhh/montereybasesystemfix.dmg?dl=0)
besides DiskUtility you can use also its Apple Software Restore command line :
```shell
sudo asr -source ~/Downloads/MontereyBaseSystemfix.dmg -erase -noverify -target /Volumes/YourUSBLabel
```

![MontereyBaseSystemfix2](https://user-images.githubusercontent.com/63143548/122277646-678c9b00-cee6-11eb-90b5-de013c97482f.jpeg)
