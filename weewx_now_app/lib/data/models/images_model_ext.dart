import 'package:weewx_now/data/models/images_model.dart';
import 'package:weewx_now/domain/entities/image/image_category.dart';
import 'package:weewx_now/domain/entities/image/image_meta_data.dart';
import 'package:weewx_now/domain/entities/image/image_type.dart';
import 'package:weewx_now/domain/entities/image/image_bundle.dart';

extension ImagesModelExt on ImagesModel {
  ImageBundle toEntity() {
    final imagesMap = <ImageCategory, List<ImageMetaData>>{};
    for (final img in images) {
      final cat = ImageCategory(id: img.category);
      imagesMap.putIfAbsent(cat, () => []);
      imagesMap[cat]!.add(ImageMetaData(
        type: ImageTypeExt.fromString(img.type),
        category: cat,
        data: img.data,
        date: DateTime.parse(img.date),
      ));
    }

    return ImageBundle(
      generation: DateTime.parse(generation),
      map: imagesMap,
    );
  }
}
