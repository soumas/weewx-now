# weewx-webapp

TODO Description

## Installation

1) Download the generator

```
wget -O weewx-webapp.zip https://github.com/...
```

2) Install the generator

```
sudo wee_extension --install weewx-sftp.zip
```

3) Set the SFTP parameters in the weewx configuration file

```
[StdReport]
    [[webapp]]
        skin = webapp
        enable = true
        HTML_ROOT = /var/www/html/weewx/webapp
```

4) Re-start weewx

```
sudo /etc/init.d/weewx start
```

## Options

`HTML_ROOT` - rootpath path for generated files (images, html, json)