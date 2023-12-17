import 'dart:convert';

import 'package:weewx_pwa/domain/entities/image/image_meta_data_entity.dart';

class ImageMetaDataModel {
  final String filename;
  final String date;

  ImageMetaDataModel({
    required this.filename,
    required this.date,
  });

  ImageMetaDataEntity toEntity() {
    return ImageMetaDataEntity(
      filename: filename,
      date: DateTime.parse(date),
    );
  }

  ImageMetaDataModel copyWith({
    String? filename,
    String? date,
  }) {
    return ImageMetaDataModel(
      filename: filename ?? this.filename,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filename': filename,
      'date': date,
    };
  }

  factory ImageMetaDataModel.fromMap(Map<String, dynamic> map) {
    return ImageMetaDataModel(
      filename: map['filename'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageMetaDataModel.fromJson(String source) =>
      ImageMetaDataModel.fromMap(json.decode(source));

  @override
  String toString() => 'ImageMetaDataModel(filename: $filename, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageMetaDataModel &&
        other.filename == filename &&
        other.date == date;
  }

  @override
  int get hashCode => filename.hashCode ^ date.hashCode;
}
