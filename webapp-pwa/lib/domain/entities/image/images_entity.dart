import 'package:flutter/foundation.dart';

import 'package:weewx_pwa/domain/entities/image/image_category_entity.dart';
import 'package:weewx_pwa/domain/entities/image/image_meta_data_entity.dart';

class ImagesEntity {
  final DateTime generation;
  final Map<ImageCategoryEntity, List<ImageMetaDataEntity>> map;

  ImagesEntity({
    required this.generation,
    required this.map,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImagesEntity &&
        other.generation == generation &&
        mapEquals(other.map, map);
  }

  @override
  int get hashCode => generation.hashCode ^ map.hashCode;
}
