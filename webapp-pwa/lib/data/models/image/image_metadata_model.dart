import 'dart:convert';

import 'package:weewx_pwa/domain/entities/image/image_category_entity.dart';
import 'package:weewx_pwa/domain/entities/image/image_meta_data_entity.dart';

class ImageMetaDataModel {
  final String category;
  final String filename;
  final String date;

  ImageMetaDataModel({
    required this.category,
    required this.filename,
    required this.date,
  });

  ImageMetaDataEntity toEntity() {
    return ImageMetaDataEntity(
      category: ImageCategoryEntity(id: category),
      filename: filename,
      date: DateTime.parse(date),
    );
  }

  ImageMetaDataModel copyWith({
    String? category,
    String? filename,
    String? date,
  }) {
    return ImageMetaDataModel(
      category: category ?? this.category,
      filename: filename ?? this.filename,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'filename': filename,
      'date': date,
    };
  }

  factory ImageMetaDataModel.fromMap(Map<String, dynamic> map) {
    return ImageMetaDataModel(
      category: map['category'] ?? '',
      filename: map['filename'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageMetaDataModel.fromJson(String source) =>
      ImageMetaDataModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ImageMetaDataModel(category: $category, filename: $filename, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageMetaDataModel &&
        other.category == category &&
        other.filename == filename &&
        other.date == date;
  }

  @override
  int get hashCode => category.hashCode ^ filename.hashCode ^ date.hashCode;
}
