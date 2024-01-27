import 'package:flutter/foundation.dart';

import 'package:weewx_now_app/domain/entities/image/image_category.dart';
import 'package:weewx_now_app/domain/entities/image/image_meta_data.dart';

class ImageBundle {
  final DateTime generation;
  final Map<ImageCategory, List<ImageMetaData>> map;
  ImageBundle({
    required this.generation,
    required this.map,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageBundle &&
        other.generation == generation &&
        mapEquals(other.map, map);
  }

  @override
  int get hashCode => generation.hashCode ^ map.hashCode;
}
