import 'package:dio/dio.dart';
import 'package:weewx_pwa/data/models/config/config_model.dart';

abstract class ConfigRemoteDataSource {
  Future<ImagesModel> getConfig();
}

class ConfigRemoteDataSourceImpl implements ConfigRemoteDataSource {
  final Dio http;

  ConfigRemoteDataSourceImpl({required this.http});

  @override
  Future<ImagesModel> getConfig() async {
    final response =
        await http.get<String>('http://localhost/weewx/webapp/config.json');
    return ImagesModel.fromJson(response.data!);
  }
}
