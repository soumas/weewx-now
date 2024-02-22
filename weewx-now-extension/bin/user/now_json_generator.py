# Copyright 2024 Thomas Juen
# Distributed under the terms of GPLv3

import time
import logging
import json
import os.path

import weewx.reportengine

try:
    from weeutil.weeutil import accumulateLeaves
except:
    from weeutil.config import accumulateLeaves
from weeutil.config import merge_config
from weewx.units import convert
from weeutil.weeutil import to_bool


log = logging.getLogger(__name__)

class NowJSONGenerator(weewx.reportengine.ReportGenerator):

    ''' Generator for weewx that generates wather data for the weewx now app '''

    def run(self):
        enabled = False
        try:
            enabled = self.skin_dict['NowJSONGenerator']['enabled'].lower() == 'true'
        except KeyError:
            log.info("JSONGenerator failed to read config or config missing")
        else:
            if enabled:
                self.setup()
                self.gen_data()
            else:
                log.info("JSONGenerator is not enabled")
                
    def setup(self):
        self.json_dict = self.skin_dict['NowJSONGenerator']

        # Lookup the last reading in the archive
        db_manager = self.db_binder.get_manager()
        self.lastGoodStamp = db_manager.lastGoodStamp()

        self.units_dict = self.skin_dict['Units']
        merge_config(self.units_dict, self.config_dict['StdReport']['Defaults']['Units'])

        self.resultObj = {}

    def gen_data(self):
        db_manager = self.db_binder.get_manager()

        history_list = []
        time_list = []
        
        columns = ['outTemp', 'inTemp', 'barometer', 'windDir', 'outHumidity', 'windSpeed', 'windGust']

        for column in columns:
            log.info(column)

            try:
                label = self.get_label(column)
                target_unit = self.get_target_unit(column)
                traget_unit_label = self.get_unit_label(target_unit)
                traget_unit_format = self.get_unit_format(target_unit)                

            except:
                log.info("JSONGenerator: *** Could not find target unit of measure for column '%s' ***" % column)
                return 0, None
        
            log.info(label)
            log.info(target_unit)
            log.info(traget_unit_label)
            log.info(traget_unit_format)

            batch_records = db_manager.genBatchRecords(self.lastGoodStamp - 24 * 60 * 60, self.lastGoodStamp)
            for rec in batch_records:

                try:
                    db_value_tuple = weewx.units.as_value_tuple(rec, column)
                except:
                    log.debug("JSONGenerator: Ignoring data for column '%s', is this column in the database table?" % (column))
                    return 0, None

                if target_unit == "":
                    history_value = rec[column]
                else:
                    history_value = weewx.units.convert(db_value_tuple, target_unit)[0]

                try:
                    if history_value is None:
                        history_list.append(history_value)
                        log.info(history_value)
                    else:
                        history_list.append(round(float(history_value), 2))
                        log.info(float(round(float(history_value), 2)))
                    time_list.append(rec['dateTime'])
                    log.info(rec['dateTime'])
                except:
                    log.debug("JSONGenerator: Cannot decode reading of '%s' for column '%s'" % (history_value, column))

    def get_label(self, column_name):
        try:
            return self.skin_dict['Texts'][column_name]
        except KeyError:
            log.info("JSONGenerator: self.units_dict['Groups'][weewx.units.obs_group_dict['%s']] is not present, using the empty string." % column_name)
            return ""

    def get_target_unit(self, column_name):
        try:
            return self.units_dict['Groups'][weewx.units.obs_group_dict[column_name]]
        except KeyError:
            log.info("JSONGenerator: self.units_dict['Groups'][weewx.units.obs_group_dict['%s']] is not present, using the empty string." % column_name)
            return ""
        
    def get_unit_label(self, group):
        try:
            return self.units_dict["Labels"][group]
        except KeyError:
            log.info("JSONGenerator: self.units_dict[\"Labels\"]['%s']] is not present, using group name." % group)
            return group

    def get_unit_format(self, group):
        try:
            return self.units_dict["StringFormats"][group]
        except KeyError:
            log.info("JSONGenerator: self.units_dict[\"StringFormats\"]['%s']] is not present, using the empty string." % group)
            return group        