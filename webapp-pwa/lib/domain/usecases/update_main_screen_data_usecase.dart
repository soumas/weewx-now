import 'package:weewx_pwa/domain/entities/main_screen_data_entity.dart';
import 'package:weewx_pwa/domain/repositories/weewx_station_repository.dart';

class UpdateMainScreenDataUsecase {
  final WeewxStationRepository repository;

  UpdateMainScreenDataUsecase({
    required this.repository,
  });

  Future<MainScreenDataEntity> execute(String endpoint) async {
    return MainScreenDataEntity(
      weather: await repository.loadWeather(endpoint),
      images: await repository.loadImages(endpoint),
    );
  }
}
