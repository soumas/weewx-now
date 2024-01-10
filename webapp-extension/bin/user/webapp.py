# Copyright 2023 Thomas Juen
# Distributed under the terms of GPLv3

'''
Generator for weewx that generates an index file of available
webcam in json format for usage in the weewx web app.
'''

import os
import json
import pathlib
import time

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
            self.debug('%s' % VERSION)

            statStartTime = time.time_ns();
            statCntCategories = 0
            statCntImages = 0

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
            
            # compose json
            images_json_lst = []

            # expect images to be in subdirecotry 'images'
            images_dir = os.path.join(root_dir, 'images')            
            if os.path.exists(images_dir):
                self.debug('images directory found, looking for subdirectories (categories) in %s' % root_dir)
                for category_dir in os.scandir(images_dir):
                    if category_dir.is_dir():
                        category_name = os.path.basename(os.path.normpath(category_dir.path))
                        statCntCategories += 1
                        self.debug('handling subdirectory (category) "%s"' % category_name)
                        for file in os.scandir(category_dir):
                            if file.is_file():
                                if pathlib.Path(file.name).suffix.lower() in supported_ext:
                                    images_json_lst.append('{"category":%s,"filename":%s,"date":%s}' % (json.dumps(category_name), json.dumps(file.name), json.dumps(datetime.fromtimestamp(os.path.getctime(file.path)).strftime('%Y-%m-%dT%H:%M:%S.%f'))))
                                    statCntImages += 1
                                    self.debug('Image added "%s" (category "%s")' % (file.path, category_name))
                                else:
                                    self.warn('Filetype not supported: "%s". Supported types: %s' % (file.path, supported_ext))
                            elif file.is_dir():
                                self.warn('Subcategories not supported: "%s"' % file.path)
                    else:
                        self.warn('"%s" isn''t in any category-directory (subdirectory) and will be ignored' % category_dir.path)
            else:
                self.debug('Subdirectory %s not found. No Images will be available in weewx web app' % images_dir)
                        
            jsonContent = '{"generation":"%s","images":[%s]}' % (datetime.now().strftime('%Y-%m-%dT%H:%M:%S.%f'), ','.join(images_json_lst))
            
            # write json to output file
            targetfile = os.path.join(root_dir, 'images.json')
            open(targetfile, 'w').write(jsonContent)

            self.info('Image index generated and written to %s (images: %d, categories: %d, time: %f ms)' % (targetfile, statCntImages, statCntCategories, (time.time_ns() - statStartTime) / 1000000))

        except () as e:
            self.error('%s' % e)
            return
        
    def info(self, msg):
        log.info('ImageIndexGenerator %s' %  msg)
    def warn(self, msg):
        log.warn('ImageIndexGenerator %s' %  msg)
    def error(self, msg):
        log.error('ImageIndexGenerator %s' %  msg)
    def debug(self, msg):
        log.debug('ImageIndexGenerator %s' %  msg)

