#zip -r ../weewx-now-backend.zip ../weewx-now-backend/
#sudo weectl backend uninstall now --yes
sudo weectl backend install ../weewx-now-backend.zip --yes
#rem sudo weectl backend /etc/weewx/weewx.conf