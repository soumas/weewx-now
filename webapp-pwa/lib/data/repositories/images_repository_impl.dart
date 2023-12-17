import 'package:weewx_pwa/data/datasources/images_remote_data_source.dart';
import 'package:weewx_pwa/domain/entities/image/images_entity.dart';
import 'package:weewx_pwa/domain/repositories/images_repository.dart';

class ImagesRepositoryImpl extends ImagesRepository {
  final ImagesRemoteDataSource dataSource;

  ImagesRepositoryImpl({required this.dataSource});

  @override
  Future<ImagesEntity> loadImages() async {
    return (await dataSource.getImages()).toEntity();
  }
}
