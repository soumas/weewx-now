import 'package:weewx_now_app/domain/entities/image/image_category_entity.dart';

class ImageMetaDataEntity {
  final ImageCategoryEntity category;
  final String filename;
  final DateTime date;
  ImageMetaDataEntity({
    required this.category,
    required this.filename,
    required this.date,
  });
}
