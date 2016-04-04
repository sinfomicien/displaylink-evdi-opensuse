#!/bin/bash

WORKDIR="build"

# Download the Ubuntu Driver from the DisplayLink webiste
wget -O ${WORKDIR}/DisplayLink_Ubuntu_1.0.335.zip http://www.displaylink.com/downloads/file?id=123

# Unpack the driver
cd ${WORKDIR}
unzip DisplayLink_Ubuntu_1.0.335.zip
chmod 755 displaylink-driver-1.0.335.run
./displaylink-driver-1.0.335.run --noexec --keep

# Change the version to 1.0.68, because it's the module version
mv displaylink-driver-1.0.335 displaylink-driver-1.0.68
cd displaylink-driver-1.0.68

# Patch the kernel driver source, to be able to nuild it for kernel 4.5.0
mkdir evdi-1.0.68
cd evdi-1.0.68
tar -zxvf ../evdi-1.0.335-src.tar.gz
patch -p0 < ../../../evdi-1.0.68-linux-4.5.0.patch
tar -zcf ../evdi-1.0.68-src.tar.gz ./
rm -f ../evdi-1.0.335-src.tar.gz
cd ..

# Patch the installer, so it can installer everything on openSUSE Tumbleweed
patch -p0 < ../../displaylink-installer.sh.opensuse.patch
