import 'package:flutter/foundation.dart';

import 'package:weewx_pwa/domain/entities/image/image_category_entity.dart';
import 'package:weewx_pwa/domain/entities/image/image_meta_data_entity.dart';

class ImagesEntity {
  final Map<ImageCategoryEntity, List<ImageMetaDataEntity>> images;

  ImagesEntity({
    required this.images,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImagesEntity && mapEquals(other.images, images);
  }

  @override
  int get hashCode => images.hashCode;

  @override
  String toString() => 'ImagesEntity(images: $images)';
}
