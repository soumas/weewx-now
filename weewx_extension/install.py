# Copyright 2023 Thomas Juen
# Distributed under the terms of GPLv3

'''
Installer for weewx-webapp extension
'''

from weecfg.extension import ExtensionInstaller

VERSION = '0.1'

def loader():
    return WebappInstaller()

class WebappInstaller(ExtensionInstaller):
    def __init__(self):
        super(WebappInstaller, self).__init__(
            version="0.1",
            name='webapp',
            description='Backend of weewx webapp skin.',
            author="Thomas Juen",
            author_email="office@soumasoft.com",
            config={
                'StdReport': {
                    'webapp': {
                        'skin': 'webapp',
                        'enable': 'true',
                        'HTML_ROOT': '/var/www/html/weewx/webapp',
                    }
                }
            },
            files=[('bin/user', ['bin/user/webapp.py']),
                   ('skins/webapp', ['skins/webapp/skin.conf', 'skins/webapp/config.json.tmpl'])]
            )