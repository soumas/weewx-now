import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weewx_pwa/domain/entities/image/image_category_entity.dart';
import 'package:weewx_pwa/domain/entities/image/image_meta_data_entity.dart';

part 'images_entity.freezed.dart';

@freezed
class ImagesEntity with _$ImagesEntity {
  factory ImagesEntity({
    required DateTime generation,
    required Map<ImageCategoryEntity, List<ImageMetaDataEntity>> map,
  }) = _ImagesEntity;
}
