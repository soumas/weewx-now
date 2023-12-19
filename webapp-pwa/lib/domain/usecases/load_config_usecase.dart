import 'package:weewx_pwa/domain/entities/config/config_entity.dart';
import 'package:weewx_pwa/domain/repositories/config_repository.dart';

class LoadConfigUsecase {
  final ConfigRepository repository;
  LoadConfigUsecase({
    required this.repository,
  });

  Future<ConfigEntity> execute(String endpoint) async {
    return repository.loadConfig(endpoint);
  }
}
