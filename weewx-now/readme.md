# weewx now

TODO Description

## Installation

1) Download the generator

```
wget -O weewx-now.zip https://github.com/...
```

2) Install the generator

```
sudo weexctl install extension weewx-sftp.zip
```

3) Set the SFTP parameters in the weewx configuration file

```
[StdReport]
    [[now]]
        skin = now
        enable = true
        HTML_ROOT = /var/www/html/weewx/now
```

4) Re-start weewx

```
sudo /etc/init.d/weewx start
```

## Options

`HTML_ROOT` - rootpath path for generated files (images, html, json)