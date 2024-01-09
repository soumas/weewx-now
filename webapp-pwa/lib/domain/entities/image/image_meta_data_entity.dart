import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weewx_pwa/domain/entities/image/image_category_entity.dart';

part 'image_meta_data_entity.freezed.dart';

@freezed
class ImageMetaDataEntity with _$ImageMetaDataEntity {
  factory ImageMetaDataEntity({
    required ImageCategoryEntity category,
    required String filename,
    required DateTime date,
  }) = _ImageMetaDataEntity;
}
