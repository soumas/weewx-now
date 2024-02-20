# Copyright 2024 Thomas Juen
# Distributed under the terms of GPLv3

'''
Installer for weewx-now extension
'''

from weecfg.extension import ExtensionInstaller

VERSION = '0.1'

def loader():
    return NowInstaller()

class NowInstaller(ExtensionInstaller):
    def __init__(self):
        super(NowInstaller, self).__init__(
            version="0.1",
            name='now',
            description='Backend of weewx now skin.',
            author="Thomas Juen",
            author_email="office@soumasoft.com",
            config={
                'StdReport': {
                    'now': {
                        'skin': 'now',
                        'enable': 'true',
                        'HTML_ROOT': '/var/www/html/weewx/now',
                        'Extras': {
                            'url': 'http://localhost/weewx/now/',
                            'hideImageViewer': 'false',
                            'password': ''
                        } 
                    }
                }
            },
            files=[('bin/user', [
                'bin/user/now.py'
                ]),
                   ('skins/now', [   
                'skins/now/font/Kanit-Bold.ttf',
                'skins/now/font/Kanit-Regular.ttf',
                'skins/now/font/license.txt',
                'skins/now/font/OFL.txt',
                'skins/now/font/OpenSans-Bold.ttf',
                'skins/now/font/OpenSans-Regular.ttf',
                'skins/now/font/OpenSans.woff',
                'skins/now/font/OpenSans.woff2',  
                'skins/now/lang/de.conf',
                'skins/now/lang/en.conf',     
                'skins/now/index.html.tmpl',   
                'skins/now/settings.json.tmpl',   
                'skins/now/skin.conf', 
                'skins/now/weather.json.tmpl'
                ])]
            )