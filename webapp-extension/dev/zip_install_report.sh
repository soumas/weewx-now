zip -r ../weewx-webapp.zip ../webapp-extension/
sudo wee_extension --install ../weewx-webapp.zip
sudo wee_reports /etc/weewx/weewx.conf