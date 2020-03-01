#!/bin/bash

# When you change this file, you must take manual action. Read this doc:
# - https://docs.sandstorm.io/en/latest/vagrant-spk/customizing/#setupsh

# Install node.js

# Discussion, issues and change requests at:
#   https://github.com/nodesource/distributions
#
# Script to install the NodeSource Node.js 10.x repo onto a
# Debian or Ubuntu system.

export DEBIAN_FRONTEND=noninteractive

echo "Installing the NodeSource Node.js 10.x repo..."

curl -sL https://deb.nodesource.com/setup_10.x | bash -

apt-get install -y -qq --no-install-suggests --no-install-recommends nodejs git-core g++ libreoffice-writer libreoffice-impress libreoffice-calc unoconv clang autoconf pkg-config libtool

# Set up libreoffice config directory
rm -Rf /var/libreoffice
mkdir -p /var/libreoffice/config
# Libreoffice always crashes the first time it is run, in the process of creating its config dir
/usr/lib/libreoffice/program/soffice.bin -env:UserInstallation=file:///var/libreoffice/config --headless --invisible --nocrashreport --nodefault --nofirststartwizard --nologo --norestore
# Make sure sandstorm can write to config dir
chown -R 1000:1000 /var/libreoffice

# Compile capnp, for powerbox requests
cd /tmp
if [ ! -e capnproto ]; then git clone https://github.com/capnproto/capnproto; fi
cd capnproto
git checkout master
cd c++
autoreconf -i
./configure
make -j2
sudo make install

exit 0
