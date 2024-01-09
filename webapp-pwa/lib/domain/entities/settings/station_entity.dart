import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_entity.freezed.dart';

@freezed
class StationEntity with _$StationEntity {
  factory StationEntity({
    required String location,
    required double latitude,
    required double longitude,
    required double altitudeMeters,
    required String url,
    required String hardware,
    required String uptimeOS,
    required String uptimeWeeWX,
    required String versionWeeWX,
  }) = _StationEntity;
}
