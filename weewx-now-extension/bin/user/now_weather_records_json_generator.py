# Copyright 2024 Thomas Juen
# Distributed under the terms of GPLv3

import logging
import json
import os.path
import time

import weewx.reportengine

from weeutil.config import merge_config

log = logging.getLogger(__name__)

class NowWeatherRecordsJSONGenerator(weewx.reportengine.ReportGenerator):

    ''' Generator for weewx that generates wather data for the weewx now app '''

    def run(self):
        enabled = False
        try:
            enabled = self.skin_dict['NowWeatherRecordsJSONGenerator']['enabled'].lower() == 'true'
        except KeyError:
            log.info("NowWeatherRecordsJSONGenerator failed to read config or config missing")
        else:
            if enabled:
                self.setup()
                self.gen_data()
            else:
                log.info("NowWeatherRecordsJSONGenerator is not enabled")
                
    def setup(self):        
        db_manager = self.db_binder.get_manager()
        self.lastGoodStamp = db_manager.lastGoodStamp()

        self.units_dict = self.skin_dict['Units']
        merge_config(self.units_dict, self.config_dict['StdReport']['Defaults']['Units'])

        self.resultObj = {}

    def gen_data(self):        

        # set generation timestamp
        self.resultObj['generation'] = round(time.time())

        # current weather data
        self.resultObj['current'] = self.gen_weather_current()

        # short term historical records (2, 4 and 8 hours back)
        self.resultObj['shortTerm'] = {}        
        shortTermHistoryColumn = ['windSpeed', 'windGust', 'windDir', 'outTemp', 'barometer', 'rainRate']
        for column in shortTermHistoryColumn:
            log.info(column)
            self.resultObj['shortTerm'][column] = self.gen_weather_shortterm(column)
        
        try:
            data_filename = os.path.join(
                    self.config_dict['WEEWX_ROOT'],
                    self.skin_dict['HTML_ROOT'],
                    'nowWeatherRecords.json')
            fp = open(data_filename, 'w')
        except IOError:
            log.error("NowWeatherRecordsJSONGenerator: Could not open %s for writing" % data_filename)
        else:
            with fp:
                json_string = json.dumps(self.resultObj, indent=None)
                fp.write(json_string)        

    def gen_weather_current(self):
        
        currentWeatherColumns = ['outTemp', 'dewpoint', 'outHumidity', 'heatindex', 'barometer', 'windSpeed', 'windGust', 'windDir', 'windchill', 'rainRate', 'inTemp', 'inHumidity']
        
        dataset = {}
        db_manager = self.db_binder.get_manager()
        batch_records = db_manager.genBatchRecords(self.lastGoodStamp-1, self.lastGoodStamp)
        for rec in batch_records:
            dataset['dateTime'] = rec['dateTime']
            for column in currentWeatherColumns:                


                try:
                    label = self.get_label(column)
                    target_unit = self.get_target_unit(column)
                    traget_unit_label = self.get_unit_label(target_unit)
                    traget_unit_format = self.get_unit_format(target_unit)                
                except:
                    log.info("NowWeatherRecordsJSONGenerator: *** Could not find target unit of measure for column '%s' ***" % column)
                    return 0, None

                try:
                    db_value_tuple = weewx.units.as_value_tuple(rec, column)
                except:
                    log.debug("NowWeatherRecordsJSONGenerator: Ignoring data for column '%s', is this column in the database table?" % (column))
                    return 0, None

                dataset[column] = {}                
                dataset[column]['label'] = label
                if target_unit == "":
                    dataset[column]['value'] = rec[column]
                else:
                    dataset[column]['value'] = weewx.units.convert(db_value_tuple, target_unit)[0]
                dataset[column]['unitformat'] = traget_unit_format                        
                dataset[column]['unitlabel'] = traget_unit_label
                    
        return dataset


    def gen_weather_shortterm(self, column):
        try:
            label = self.get_label(column)
            target_unit = self.get_target_unit(column)
            traget_unit_label = self.get_unit_label(target_unit)
            traget_unit_format = self.get_unit_format(target_unit)                
        except:
            log.info("NowWeatherRecordsJSONGenerator: *** Could not find target unit of measure for column '%s' ***" % column)
            return 0, None
        
        dataset = {}
        dataset['label'] = label
        dataset['unitlabel'] = traget_unit_label
        dataset['unitformat'] = traget_unit_format

        for hours in [2,4,8]:
            db_manager = self.db_binder.get_manager()
            history_list = []
            time_list = []

            batch_records = db_manager.genBatchRecords(self.lastGoodStamp - hours * 60 * 60, self.lastGoodStamp)
            for rec in batch_records:

                try:
                    db_value_tuple = weewx.units.as_value_tuple(rec, column)
                except:
                    log.debug("NowWeatherRecordsJSONGenerator: Ignoring data for column '%s', is this column in the database table?" % (column))
                    return 0, None

                if target_unit == "":
                    history_value = rec[column]
                else:
                    history_value = weewx.units.convert(db_value_tuple, target_unit)[0]

                try:
                    if history_value is None:
                        history_list.append(history_value)
                    else:
                        history_list.append(round(float(history_value), 2))
                    time_list.append(rec['dateTime'])
                except:
                    log.debug("NowWeatherRecordsJSONGenerator: Cannot decode reading of '%s' for column '%s'" % (history_value, column))        
            dataset['last'+str(hours)+'hours'] = list(zip(time_list, history_list))
        return dataset

    def get_label(self, column_name):
        try:
            return self.skin_dict['Texts'][column_name]
        except KeyError:
            log.info("NowWeatherRecordsJSONGenerator: self.units_dict['Groups'][weewx.units.obs_group_dict['%s']] is not present, using the empty string." % column_name)
            return ""

    def get_target_unit(self, column_name):
        try:
            return self.units_dict['Groups'][weewx.units.obs_group_dict[column_name]]
        except KeyError:
            log.info("NowWeatherRecordsJSONGenerator: self.units_dict['Groups'][weewx.units.obs_group_dict['%s']] is not present, using the empty string." % column_name)
            return ""
        
    def get_unit_label(self, group):
        try:
            return self.units_dict["Labels"][group]
        except KeyError:
            log.info("NowWeatherRecordsJSONGenerator: self.units_dict[\"Labels\"]['%s']] is not present, using group name." % group)
            return group

    def get_unit_format(self, group):
        try:
            return self.units_dict["StringFormats"][group]
        except KeyError:
            log.info("NowWeatherRecordsJSONGenerator: self.units_dict[\"StringFormats\"]['%s']] is not present, using the empty string." % group)
            return group        