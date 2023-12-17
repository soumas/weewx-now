class ImageMetaDataEntity {
  final String filename;
  final DateTime date;

  ImageMetaDataEntity({
    required this.filename,
    required this.date,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageMetaDataEntity &&
        other.filename == filename &&
        other.date == date;
  }

  @override
  int get hashCode => filename.hashCode ^ date.hashCode;
}
