import 'package:flutter/foundation.dart';

import 'package:weewx_pwa/domain/entities/image/image_meta_data_entity.dart';

class ImagesEntity {
  final List<ImageMetaDataEntity> webcam;

  ImagesEntity({
    required this.webcam,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImagesEntity && listEquals(other.webcam, webcam);
  }

  @override
  int get hashCode => webcam.hashCode;
}
