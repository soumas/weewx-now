zip -r ../weewx-now.zip . -i ../now/
sudo weectl extension uninstall now --yes
sudo weectl extension install ../weewx-now.zip --yes
sudo weectl report run