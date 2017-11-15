# emulationstation-vero4k
Automated building of EmulationStation for the OSMC device Vero 4k

This would not have been possible without the addition of mali-fbdev support by mihailescu2m to SDL2 - THANK YOU

Retropie on the RPi3 is brilliant.  
RetrOSMC on the RPi3 is brilliant++  
The Vero 4K is faster than the RPi3, but has no emulation support. Oh, wait a minute…

#### The purpose of this tool is to get EmulationStation onto your Vero 4K.
I know Kodi 18 (Leia) promises RetroPlayer, but that as far as I can see is:

* A long way off;
* Limited to Retroarch cores - which is what I use mostly, but some emulators such as Mupen64Plus perform better as a standalone;
* Running from within Kodi, perhaps diminishing some of the performance gains from the RPi3 to Vero4K upgrade.

#### This README assumes:

* NO RESPONSIBILITY FOR DATA LOSS!! Backup backup backup;
* You have git installed - `sudo apt-get install git`
* You can use SSH and have some familiarity working in a linux console;
* You are familiar with EmulationStation and it's configuration files;
* You have migrated from an RPi running RetrOSMC or Retropie and therefore have already got config files to crib from.

## Installation Instructions
Run the following:
```
cd
git clone https://github.com/hissingshark/emulationstation-vero4k.git
cd emulationstation-vero4k
./es_builder.sh
```

Kodi will stop whilst the build goes on and return when it’s finished (<15mins).

## Usage instructions
`./emulationstation`


Configuration is largely beyond the scope of this Readme.  
Google and YouTube are your friends.  

https://retropie.org.uk/docs/

I wish you joy!
