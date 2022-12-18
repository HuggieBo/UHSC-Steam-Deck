#!/bin/bash

if [[ ! -f ~/Downloads/UHSC]]
then
  mkdir ~/Downloads/UHSC
else
  rm -fr ~/Downloads/UHSC/
fi

# Move to Download folder and download latest release
cd ~/Downloads
curl -s https://api.github.com/repos/Bambosh/unofficial-homestuck-collection/releases/latest | grep "browser_download_url" | grep "tar.gz"| cut -d : -f 2,3| tr -d \" | wget -i -

# Unpack
tar -xf "*tar.gz" --directory=UHSC
cd UHSC
sed -i '7s/.*/  module.export = require(`..\/build\/Release\/sharp-linux-x64.node`);/ resources/app.asar.unpacked/node_modules/sharp/lib/sharp.js


