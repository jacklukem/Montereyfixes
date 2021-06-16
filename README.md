# Montereyfixes

Alpha working BaseSystem fix installer based mainly on:

ASentientBot patched 0xfff boot.efi and HaxLib.dylib

workaround to boot non metal desktop "enable auto login"

on the ASentientBot method I made a patched Setup Assistant to simplify this step

if you made multiuser accounts to simply reload Setup Assistant boot through CMD+S then type:

`mount -P 2
rm /private/var/db/.AppleSetupDone
exit`

anyway is expectable that apple will fix this, because safe mode needs to works also without Metal acceleration for supported Mac.

![Monterey BaseSystemfix](https://user-images.githubusercontent.com/63143548/122189199-025a8a80-ce91-11eb-90c7-26d757bff18c.jpeg)
