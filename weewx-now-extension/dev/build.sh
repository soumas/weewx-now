#!/bin/bash

cd ..
rm weewx-now-extension.zip
zip -r weewx-now-extension.zip weewx-now-extension -x weewx-now-extension/dev/\* weewx-now-extension/dev/weewx-now-extension.zip
sudo weectl extension uninstall now --yes
sudo weectl extension install weewx-now-extension.zip --yes
sudo weectl report run