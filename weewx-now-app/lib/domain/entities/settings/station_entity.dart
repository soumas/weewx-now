class StationEntity {
  final String location;
  final double latitude;
  final double longitude;
  final double altitudeMeters;
  final String url;
  final String hardware;
  final String uptimeOS;
  final String uptimeWeeWX;
  final String versionWeeWX;
  StationEntity({
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.altitudeMeters,
    required this.url,
    required this.hardware,
    required this.uptimeOS,
    required this.uptimeWeeWX,
    required this.versionWeeWX,
  });
}
