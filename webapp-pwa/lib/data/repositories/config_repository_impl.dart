import 'package:weewx_pwa/domain/entities/config/config_entity.dart';
import 'package:weewx_pwa/domain/repositories/config_repository.dart';

class ConfigRepositoryImpl extends ConfigRepository {
  @override
  Future<ConfigEntity> loadConfig() {
    throw UnimplementedError();
  }
}
