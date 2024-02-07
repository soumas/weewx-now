import 'package:weewx_now/domain/entities/wee_wx_config/now_config.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/station_config.dart';

class WeeWxConfig {
  final StationConfig station;
  final WeeWXNowConfig now;
  WeeWxConfig({
    required this.station,
    required this.now,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeeWxConfig && other.station == station && other.now == now;
  }

  @override
  int get hashCode => station.hashCode ^ now.hashCode;
}
