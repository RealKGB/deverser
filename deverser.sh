#!/bin/sh

if [ ! -d "/var/mobile/Documents/deverser" ]; then
    mkdir /var/mobile/Documents/deverser

cat << "intro"
[!] Welcome to Déverser, a simple script to dump onboard SHSH (Blobs) with a valid Generator for iOS devices...
[!] This script will allow you to use dumped blobs with futurerestore at a later date (depending on SEP compatibility)...
[!] This fork works only on iOS, please do not use it on any other platform.
intro

unamestr=$(uname)
if [ "$unamestr" = "Darwin" ]; then
    OS=ios
    echo "[!] iOS detected!"
else
    echo "Not running on iOS. exiting..."
    exit 1
fi


if command -v img4tool >/dev/null; then
    echo "[!] Found img4tool at $(command -v img4tool)!"
else
    echo "[#] img4tool is not installed, please install it from your package manager. You may find it at https://apt.procurs.us/."
    echo "[*] The script will now close."
    exit
fi
echo "[!] Please enter the device's root password (Default is 'alpine')..."
dd if=/dev/rdisk1 of=/var/mobile/Documents/deverser/dump.raw bs=256 count=$((0x4000)) >/dev/null 2>&1
if [ -s /var/mobile/Documents/deverser/dump.raw ]
	rm dump.raw
	dd if=/dev/rdisk2 of=/var/mobile/Documents/deverser/dump.raw bs=256 count=$((0x4000)) >/dev/null 2>&1
fi
echo "[!] Dumped onboard SHSH to /var/mobile/Documents/deverser, about to convert to SHSH..."
img4tool --convert -s dumped.shsh dump.raw >/dev/null 2>&1
if img4tool -s dumped.shsh | grep -q 'failed'; then
    echo "[#] Error: Failed to create SHSH from 'dump.raw'..."
    exit 4
fi
ecid=$(img4tool -s dumped.shsh | grep "ECID" | cut -c13-)
mv dumped.shsh $ecid.dumped.shsh # Allows multiple devices to be dumped as each dump/converted SHSH will have a filename that links the SHSH to the device
generator=$(cat $ecid.dumped.shsh | grep "<string>0x" | cut -c10-27)

echo "[!] SHSH should be dumped successfully at '$ecid.dumped.shsh' (The number in the filename is your devices ECID)!"
echo "[!] Your Generator for the dumped SHSH is: $generator"
echo "[@] Originally Written by Matty (@mosk_i), Modified by joshuah345 / Superuser#1958 & RealKGB / WhitetailAni#1287 - Enjoy!
echo "I'm not the best at scripting, if you find any bugs please ping me in the r/jailbreak or Sileo server if you find any problems."
exit
