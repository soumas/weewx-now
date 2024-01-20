import 'package:weewx_now_app/data/models/images_model.dart';
import 'package:weewx_now_app/domain/entities/image/image_category_entity.dart';
import 'package:weewx_now_app/domain/entities/image/image_meta_data_entity.dart';
import 'package:weewx_now_app/domain/entities/image/images_entity.dart';

extension ImagesModelExt on ImagesModel {
  ImagesEntity toEntity() {
    final imagesMap = <ImageCategoryEntity, List<ImageMetaDataEntity>>{};
    for (final img in images) {
      final cat = ImageCategoryEntity(id: img.category);
      imagesMap.putIfAbsent(cat, () => []);
      imagesMap[cat]!.add(ImageMetaDataEntity(
        category: cat,
        date: DateTime.parse(img.date),
        filename: img.filename,
      ));
    }

    return ImagesEntity(
      generation: DateTime.parse(generation),
      map: imagesMap,
    );
  }
}
