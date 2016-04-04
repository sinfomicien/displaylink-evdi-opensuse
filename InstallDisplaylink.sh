#!/bin/bash

wget -O DisplayLink_Ubuntu_1.0.335.zip http://www.displaylink.com/downloads/file?id=123

unzip DisplayLink_Ubuntu_1.0.335.zip

./displaylink-driver-1.0.335.run --noexec --keep

mv displaylink-driver-1.0.335 displaylink-driver-1.0.68

cd displaylink-driver-1.0.68

mkdir evdi-1.0.68
cd evdi-1.0.68
tar -zxvf ../evdi-1.0.335-src.tar.gz
patch -p0 ../../evdi-1.0.68-linux-4.5.0.patch
tar -zcf ../evdi-1.0.68-src.tar.gz *

cd ..
patch -p0 ../displaylink-installer.sh.opensuse.patch
