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
            description='Backend of weewx now app.',
            author="Thomas Juen",
            author_email="office@soumasoft.com",
            config={
                'StdReport': {
                    'now': {
                        'skin': 'now',
                        'enable': 'true',
                        'HTML_ROOT': '/var/www/html/weewx/now',
                        'Extras': {
                            'responsibleEntityName': 'REPLACE_ME_WITH_YOUR_OR_YOUR_ORGANIZATIONS_NAME',
                            'responsibleEntityUrl': 'REPLACE_ME_WITH_YOUR_OR_YOUR_ORGANIZATIONS_URL',
                            'hideImageViewer': 'false'
                        } 
                    }
                }
            },
            files=[('bin/user', [
                        'bin/user/now.py',
                        'bin/user/now_image_index_generator.py',
                        'bin/user/now_weather_records_json_generator.py'
                        ]
                    ),
                   ('skins/now', [                                                     
                        'skins/now/index.html.tmpl',   
                        'skins/now/index_app.html.tmpl',
                        'skins/now/index_images.html',
                        'skins/now/nowStationSettings.json.tmpl',   
                        'skins/now/nowWeatherAgg.json.tmpl',
                        'skins/now/skin.conf',
                        'skins/now/webcam.html.tmpl'
                        ]
                    ),
                    ('skins/now/font', [  
                        'skins/now/font/Kanit-Bold.ttf',
                        'skins/now/font/Kanit-Regular.ttf',
                        'skins/now/font/license.txt',
                        'skins/now/font/OFL.txt',
                        'skins/now/font/OpenSans-Bold.ttf',
                        'skins/now/font/OpenSans-Regular.ttf',
                        'skins/now/font/OpenSans.woff',
                        'skins/now/font/OpenSans.woff2'
                        ]                      
                    ),
                    ('skins/now/lang', [  
                        'skins/now/lang/de.conf',
                        'skins/now/lang/en.conf'
                        ]
                    ),
                    ('skins/now/assets', [  
                        'skins/now/assets/appstore-badge.png',
                        'skins/now/assets/google-play-badge.png',
                        'skins/now/assets/icon.svg',
                        'skins/now/assets/style.css'
                        ]
                    ),
                    ('skins/now/js', [
                        'skins/now/js/weewx-now.js',
                        'skins/now/js/chart-windspeed.js',
                        'skins/now/js/chart-winddir.js',
                        'skins/now/js/chart-temp-pressure.js',
                        'skins/now/js/chart-rain.js'
                        ]
                    ),
                    ('skins/now/images', [])
                ]
            )