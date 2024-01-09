import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_category_entity.freezed.dart';

@freezed
class ImageCategoryEntity with _$ImageCategoryEntity {
  factory ImageCategoryEntity({
    required String id,
  }) = _ImageCategoryEntity;
}
