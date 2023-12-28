import 'package:weewx_pwa/domain/entities/image/image_category_entity.dart';

class ImageMetaDataEntity {
  final ImageCategoryEntity category;
  final String filename;
  final DateTime date;

  ImageMetaDataEntity({
    required this.category,
    required this.filename,
    required this.date,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageMetaDataEntity &&
        other.category == category &&
        other.filename == filename &&
        other.date == date;
  }

  @override
  int get hashCode => category.hashCode ^ filename.hashCode ^ date.hashCode;

  @override
  String toString() =>
      'ImageMetaDataEntity(category: $category, filename: $filename, date: $date)';
}
