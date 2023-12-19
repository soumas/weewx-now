import 'package:dio/dio.dart';
import 'package:weewx_pwa/data/models/config/config_model.dart';

abstract class ConfigRemoteDataSource {
  Future<ImagesModel> getConfig(String endpoint);
}

class ConfigRemoteDataSourceImpl implements ConfigRemoteDataSource {
  final Dio http;

  ConfigRemoteDataSourceImpl({required this.http});

  @override
  Future<ImagesModel> getConfig(String endpoint) async {
    // 'http://localhost/weewx/webapp/config.json'
    final response = await http.get<String>('$endpoint/config.json');
    return ImagesModel.fromJson(response.data!);
  }
}
