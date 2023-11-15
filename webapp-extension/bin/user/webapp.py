# Copyright 2023 Thomas Juen
# Distributed under the terms of GPLv3

'''
Generator for weewx that generates an index file of available
webcam in json format for usage in the weewx web app.
'''

import os
import time
import pathlib

import weewx
import weewx.reportengine
import logging

from datetime import datetime

VERSION = '0.1'

log = logging.getLogger(__name__)
supported_ext = ['.jpg','.jpeg','.png']

class ImageIndexGenerator(weewx.reportengine.ReportGenerator):

    def run(self):
        try:
            log.info('running ImageIndexGenerator %s' % VERSION)

            # use HTML_ROOT from [[webapp]] section in weewx.conf
            # or the HTML_ROOT from [StdReport] as fallback
            if 'HTML_ROOT' in self.skin_dict:
                root_dir = os.path.join(
                    self.config_dict['WEEWX_ROOT'],
                    self.skin_dict['HTML_ROOT'])
            else:
                root_dir = os.path.join(
                    self.config_dict['WEEWX_ROOT'],
                    self.config_dict.get('StdReport', {}).get('HTML_ROOT', 'public_html'))

            # expect webcam to be in subdirecotry 'webcam'
            webcam_dir = os.path.join(root_dir, 'webcam')
            if not os.path.exists(webcam_dir):
                os.makedirs(webcam_dir)

            # compose json
            webcam_json_lst = []
            for file in os.scandir(webcam_dir):
                if file.is_file() and pathlib.Path(file.name).suffix.lower() in supported_ext:
                    webcam_json_lst.append('{"filename":"%s","date":"%s"}' % (file.name, datetime.fromtimestamp(os.path.getctime(file.path)).strftime('%Y-%m-%dT%H:%M:%S.%f')))
            jsonContent = '{webcam:[%s]}' % ','.join(webcam_json_lst)

            # write json to output file
            open(os.path.join(root_dir, 'webcam.json'), 'w').write(jsonContent)

        except () as e:
            log.error('%s' % e, 'webapp')
            return
