import 'package:weewx_now_app/domain/entities/image/image_category_entity.dart';
import 'package:weewx_now_app/domain/entities/image/image_meta_data_entity.dart';

class ImagesEntity {
  final DateTime generation;
  final Map<ImageCategoryEntity, List<ImageMetaDataEntity>> map;
  ImagesEntity({
    required this.generation,
    required this.map,
  });
}
