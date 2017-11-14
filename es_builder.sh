#!/bin/bash

# *************************************************
# Script to build EmulationStation on the OSMC Vero 4K
# HissingShark 2017 -
# *************************************************

# whence we came
pushd .

# stop Kodi to free up resources
sudo systemctl stop mediacenter

# install typical building suite
sudo apt-get update
sudo apt-get install -y vero3-userland-dev-osmc build-essential git

echo -n "Checking for SDL2... "
# if sdl2 missing we need to build it first
if [ "$(sdl2-config 2> >(grep 'command not found'))" = "" ];
then
  echo OK
else
  echo -n BUILDING... 
	cd
	git clone https://github.com/hissingshark/sdl2-vero4k.git
	cd sdl2-vero4k
	./sdl2_build.sh
fi

# set flags useful to all of the builds on our Amlogic S905x based Vero 4K
# not $(sdl2-config --cflags --libs) - this build doesn't like it
export CFLAGS="-I/opt/vero3/include -L/opt/vero3/lib -O3 -march=armv8-a+crc -mtune=cortex-a53 -funsafe-math-optimizations"
export CPPFLAGS=$CFLAGS
export CXXFLAGS=$CFLAGS

# install specific packages for building ES
sudo apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-date-time-dev libboost-locale-dev \
libfreeimage-dev libfreetype6-dev libeigen3-dev libcurl4-openssl-dev libasound2-dev cmake libvlc-dev 
# libcec-dev removed as it seems to be optional - nice idea - but it's not building... TODO

# pull retropie fork of ES
cd
git clone --recursive https://github.com/RetroPie/EmulationStation.git
cd EmulationStation

# CMakeLists.txt needs to find libMali.so here
sudo ln -s /opt/vero3/lib/libMali.so /usr/lib/arm-linux-gnueabihf/libMali.so

# build/install ES
cmake -DCMAKE_CXX_COMPILER=/usr/bin/g++-4.9 -DOPENGLES_INCLUDE_DIR=/opt/vero3/include/ .
# install configs TODO

cd

# aaaand we're back in 5, 4, 3, 2, 1...
popd
