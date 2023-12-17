import 'package:weewx_pwa/domain/entities/image/images_entity.dart';

abstract class ImagesRepository {
  Future<ImagesEntity> loadImages();
}
