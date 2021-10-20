# Montereyfixes

Alpha Beta working BaseSystem fix installer: https://github.com/jacklukem/Montereyfixes/releases

based mainly on [ASentientBot](https://github.com/ASentientBot) patched 0xfff boot.efi and HaxLib.dylib

coming soon experimental dyld shared cache patching (also making System smaller removing about 10 GB of unused dyld shared caches stuffs)

perform a full OTA update directly booting from apple startup manager (works also on unsealed system), tested on beta 10 build 21A5552a:
https://github.com/jacklukem/Montereyfixes/blob/main/Monterey%20Preboot%20OTA%20fix.zip
Note the minimum requirement to correctly detect an OTA update is a snapshot booting (sealed system is optional), because the snapshot automatically mounts on Monterey desktop folder /System/Volumes/ the Preboot and Update disks both required to proceed with OTA downloading an preparing

![Monterey BaseSystemfix](https://github.com/jacklukem/Montereyfixes/blob/main/MontereyBaseSystemfix/MontereyInstallerBaseSystemfix.jpeg?raw=true)

![MontereyFixes table](https://raw.githubusercontent.com/jacklukem/Montereyfixes/main/MontereyFixes%20table.png)

Quick guide: https://github.com/jacklukem/Montereyfixes/blob/main/MontereyBaseSystemfix.pdf

both the BaseSystem fix and installer are updated often, it's also usable the same Monterey installer for stage1, just download the current InstallAssistant.pkg, then updating the SharedSupport.dmg for stage2 through this (ASentientBot method of renaming the .pkg to .dmg):
https://github.com/jacklukem/Montereyfixes/releases/download/1.0/MontereySharedSupportfix.zip

currently the Preboot OTA update fix for RC full OTA is not yet showed or available, probably some changes occurred on SDK macosx12.0.1.internal , currently investigating

you can now optionally free about 10 GB removing the unused dyld shared caches (probably this breaks OTA updates, because apple might check integrity also there):
```shell
rm /System/Library/dyld/aot_shared_cache* /System/Library/dyld/dyld_shared_cache_arm64e* /System/Library/dyld/dyld_shared_cache_x86_64h*
```

added from beta 9 two methods to binary patch directly the BKE kc on Preboot volume (or anywhere is loaded from system) with the new vmm hypervisor to allow OTA updates (and to continue the stage2 installer without firmware checking) also through booting from apple startup manager (anyway still require a sealed system and a snapshot), this is doable simply because the BKE already embeds the kernel without LZFSE compression

from beta 9 apple added the vector Monterey desktop heic with 8 dynamic wallpaper pictures, attached an example with reduced quality

temporary fix (until apple fix) for making a valid USB beta 7 installer:
https://github.com/jacklukem/Montereyfixes/releases/download/1.0/MontereySharedSupportfix2.zip

This method of copying the already extracted SharedSupport folder still works on beta 9 and I added also a method to skip the sha256 verify, so when it doesn't match still allows to continue the stage1 installer (preparing the macOS Install Data)

From Monterey beta 7 added Nvidia Kepler hybrid drivers from 11.0 beta 3 (same technique as IntelHD4000 apple compiled Metal binaries) and stock Monterey beta 6

IntelHD4000 fixes credits:

me for finding valid apple compiled Metal, GL binaries bundles on 11.0 beta 3 and com.apple.coremedia for hardware video decoder and direct binary patch the Preboot BKE kc (or its target kernelcollections path) without making a new snapshot and while keeping stock system kernel (a simple kcditto removes the patch)

[EduCovas](https://github.com/educovas) for Catalina AppleIntelGraphicsShared.bundle (libIGIL-Metal.dylib), restart fix through updated 11.4 AppleIntelFrameBufferCapri and VADriver, com.apple.WebProcess.sb (BigSur WebKit framework) for fixing Metal white overlay on Safari Google search bar, AppleGVA DRM fix, legacy Wifi patches

[ASentientHedgehog](https://github.com/moosethegoose2213) and EduCovas for fixing non metal acceleration borders through BigSur QuartzCore

Dhinak for retrieving beta 6 more updated Metal binaries (even if I still use beta 3 binaries)

ASentientBot, [dhinakg](https://github.com/dhinakg) and khronokernel for fixing bluetool legacy Bluetooth cards

ASentientBot and khronokernel for insights about beta 7 installer firmware checking

[khronokernel](https://github.com/khronokernel) and [parrotgeek1](https://github.com/parrotgeek1) for patching hypervisor vmm on kernel from BigSur 11.3 and later

[fabioroberto](https://github.com/fabioiop) for MBP Nvidia GT330M kp fix

[ASentientBot](https://github.com/ASentientBot) general non metal GPU acceleration fixes (included CoreDisplay for dualGPUs or iGPU)

current issue with IntelHD4000 on Monterey eject key that crash to login window (fixed by apple on Monterey beta 3 build 21A5284e), anyway these will still work:
```shell
CMD ⌘ + E (eject selected CD or DVD)
ctrl + eject ⏏ (shows finder power options)
ctrl + ⇧ shift + eject ⏏ (shorcut to turn off display)
alt ⌥ + CMD ⌘ + eject ⏏ (shortcut to stand by Mac)
ctrl + CMD ⌘ + eject ⏏ (shortcut to restart Mac)
ctrl + alt ⌥ + CMD ⌘ + eject (shortcut to power off Mac)
```

For AirDrop Broadcom 802.11n Wifi (vendor ID 0x14E4) through ASentientBot deduced method (from AirPortBrcmFixup), I also checked and verified that any product ID ≥ 0x9* (example 0xA* , 0xB* , 0xC* , 0xD* , 0xE* , 0xF* and so on) can use the stock IO80211FamilyLegacy's Plugin AirPortBrcmNIC (typically used from 802.11ac with a 0x three digit product ID)

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
