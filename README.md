# Déverser
Simple script to dump onboard SHSH with a valid Generator for iOS devices, on the iOS device

## What is this/What does this do

Déverser is a simple script to dump onboard SHSH from iOS devices and convert it to useable SHSH which contains a generator! This is different to just dumping 'ApTicket.der' from the device's filesystem, like some jailbreaks such as Unc0ver allow for, as the 'ApTicket.der' doesn't contain the generator for the ApNonce it is valid for, meaning restores/downgrades using converted ApTicket.der's are not possible unless you know the generator.

This script simply dumps iBoot from /dev/rdisk1 or /dev/rdisk2 on the device, copies the dump to your computer then converts the dump to valid SHSH using [img4tool](https://github.com/tihmstar/img4tool). This is all possible and easy to do manually, this script just allows for those who are less comfortable with the command line or less knowledgeable to have a simple method to dump onboard SHSH.

Even though this script will give you valid SHSH for the currently installed iOS version on your device, you are still limited by signed SEP compatiblity when restoring/downgrading with this dumped SHSH, so please bear that in mind when using this script.

## Requirements

A jailbroken iOS device

img4tool installed (get it from https://apt.procurs.us/)

## Usage (.sh file)

1. Download the .sh and get it to your jailbroken device in some way. I use Filza's WebDAV server.
2. Run the .sh in NewTerm 2
3. Follow the instructions

## Issues/Bugs/Fixes/Improvements

If you have any bugs/issues open an issue [here](https://github.com/RealKGB/deverser/issues) with details about your macOS machine (OS version, other basic info), iOS device (iOS version, jailbreak, etc) and details about what is not working.

Any ideas/fixes/improvements can be sent in a pull request [here](https://github.com/RealKGB/deverser/pulls).

## Credits

Matty - [@mosk_i](https://twitter.com/moski_dev) - For writing the script
Original macOS script can be found [here.](https://github.com/MatthewPierson/deverser/)

Superuser1958 - changes for Linux
RealKGB - changes for iOS

Tihmstar - [@tihmstar](https://twitter.com/tihmstar) - For creating img4tool
