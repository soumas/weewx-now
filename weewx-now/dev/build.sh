#!/bin/bash

cd ..
rm weewx-now.zip
zip -r weewx-now.zip weewx-now -x weewx-now/dev/\* weewx-now/dev/weewx-now.zip
sudo weectl extension uninstall now --yes
sudo weectl extension install weewx-now.zip --yes
sudo weectl report run