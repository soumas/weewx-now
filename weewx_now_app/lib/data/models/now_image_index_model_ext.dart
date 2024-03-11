import 'package:weewx_now/data/models/now_image_index_model.dart';
import 'package:weewx_now/domain/entities/weather_data/images/images_set.dart';

extension NowImageIndexModelExt on NowImageIndexModel {
  ImagesSet toEntity() {
    return ImagesSet();
  }
}
