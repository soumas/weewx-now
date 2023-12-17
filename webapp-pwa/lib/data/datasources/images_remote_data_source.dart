import 'package:dio/dio.dart';
import 'package:weewx_pwa/data/models/image/images_model.dart';

abstract class ImagesRemoteDataSource {
  Future<ImagesModel> getImages();
}

class ImagesRemoteDataSourceImpl implements ImagesRemoteDataSource {
  final Dio http;

  ImagesRemoteDataSourceImpl({required this.http});

  @override
  Future<ImagesModel> getImages() async {
    final response =
        await http.get<String>('http://localhost/weewx/webapp/images.json');
    return ImagesModel.fromJson(response.data!);
  }
}
