import 'package:weewx_pwa/data/datasources/config_remote_data_source.dart';
import 'package:weewx_pwa/domain/entities/config/config_entity.dart';
import 'package:weewx_pwa/domain/repositories/config_repository.dart';

class ConfigRepositoryImpl extends ConfigRepository {
  final ConfigRemoteDataSource dataSource;

  ConfigRepositoryImpl({required this.dataSource});

  @override
  Future<ConfigEntity> loadConfig(String endpoint) async {
    return (await dataSource.getConfig(endpoint)).toEntity();
  }
}
