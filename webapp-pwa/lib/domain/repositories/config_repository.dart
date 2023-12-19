import 'package:weewx_pwa/domain/entities/config/config_entity.dart';

abstract class ConfigRepository {
  Future<ConfigEntity> loadConfig(String endpoint);
}
