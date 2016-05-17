#!/bin/bash

WORKDIR="build"

# Download the Ubuntu Driver from the DisplayLink webiste
wget -O ${WORKDIR}/DisplayLink_Ubuntu_1.1.62.zip http://www.displaylink.com/downloads/file?id=607

# Unpack the driver
cd ${WORKDIR}
unzip DisplayLink_Ubuntu_1.1.62.zip
chmod 755 displaylink-driver-1.1.62.run
./displaylink-driver-1.1.62.run --noexec --keep
cd displaylink-driver-1.1.62

# Patch the installer, so it can installer everything on openSUSE Tumbleweed
patch -p0 < ../../displaylink-installer.sh.opensuse.patch
