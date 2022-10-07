# Déverser
Simple script to dump onboard SHSH with a valid Generator for iOS devices, on the iOS device

## What is this/What does this do

Déverser is a simple script to dump onboard SHSH from iOS devices and convert it to usable SHSH which contains a generator! This is different to just dumping 'ApTicket.der' from the device's filesystem, like some jailbreaks such as unc0ver allow for, as 'ApTicket.der' doesn't contain the generator for the ApNonce it is valid for, meaning restores/downgrades using converted ApTicket.der's are not possible unless you know the generator.

This script simply dumps iBoot from /dev/rdisk1 or /dev/rdisk2 on the device, copies the dump to /var/mobile/Documents/deverser, then converts the dump to valid SHSH using [img4tool](https://github.com/tihmstar/img4tool). This is all possible and easy to do manually, this script just allows for those who are less comfortable with the command line or less knowledgeable to have a simple method to dump onboard SHSH on-device.

Even though this script will give you valid SHSH for the currently installed iOS version on your device, you are still limited by signed SEP, baseband, and Rose compatiblity when restoring/downgrading with this dumped SHSH, so please bear that in mind when using this script - compatibility chart can be found [here](https://docs.google.com/spreadsheets/d/1Mb1UNm6g3yvdQD67M413GYSaJ4uoNhLgpkc7YKi3LBs/edit#gid=0). Also, please copy your dumped blobs to cloud storage or a computer so you don't end up in the situation that capt's meme shows: *insertlinkhereonceihavecellsignal*

## Requirements

A jailbroken iOS device on iOS 11+ as img4tool does not work on 32-bit iDevices.

img4tool and dependencies installed (get it from https://apt.procurs.us/)

## Usage (.sh file)

1. Download the .sh and move it to your jailbroken device in some way
2. Run the .sh in NewTerm 2
3. Follow the instructions in the script
4. Copy the dumped blob to cloud storage or a separate computer.

## Issues/Bugs/Fixes/Improvements

If you have any bugs/issues open an issue [here](https://github.com/RealKGB/deverser/issues) with details about your iOS device (iOS version, jailbreak) and details about what is not working.

Any ideas/fixes/improvements can be sent in a pull request [here](https://github.com/RealKGB/deverser/pulls).

## Credits

Matty - [@mosk_i](https://twitter.com/moski_dev) - For writing the script, original macOS script can be found [here.](https://github.com/MatthewPierson/deverser/)

Superuser1958 - changes for Linux

RealKGB - port to iOS

Tihmstar - [@tihmstar](https://twitter.com/tihmstar) - For creating img4tool
