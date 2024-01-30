import 'package:weewx_now/domain/entities/wee_wx_config/now_config.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/station_config.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/labels.dart';

class WeeWxConfig {
  final StationConfig station;
  final NowConfig now;
  final Labels texts;
  WeeWxConfig({
    required this.station,
    required this.now,
    required this.texts,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeeWxConfig && other.station == station && other.now == now && other.texts == texts;
  }

  @override
  int get hashCode => station.hashCode ^ now.hashCode ^ texts.hashCode;
}
