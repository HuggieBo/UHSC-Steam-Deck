#!/bin/bash

if [ -f ~/Downloads/UHSC ]
then
rm -fr ~/Downloads/UHSC/
fi


# Move to Download folder and download latest release
cd ~/Downloads || exit
URL=$(curl -s https://api.github.com/repos/Bambosh/unofficial-homestuck-collection/releases/latest | grep "browser_download_url" | grep "tar.gz"| cut -d : -f 2,3| tr -d \")
echo ${URL}
wget --output-document=UHSC.tar.gz  ${URL}


# Unpack
mkdir UHSC
tar -xf UHSC.tar.gz --directory=UHSC || exit
cd UHSC/* || exit
sed -i 's/${platformAndArch}/linux-x64/' resources/app.asar.unpacked/node_modules/sharp/lib/sharp.js

echo "Completed Task"
