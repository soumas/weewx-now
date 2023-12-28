import 'package:weewx_pwa/domain/entities/main_screen_data_entity.dart';
import 'package:weewx_pwa/domain/repositories/weewx_station_repository.dart';

class UpdateMainScreenDataUsecase {
  final WeewxStationRepository repository;

  UpdateMainScreenDataUsecase({
    required this.repository,
  });

  Future<MainScreenDataEntity> execute() async {
    // TODO
    String ep = 'http://localhost/weewx/webapp/';
    return MainScreenDataEntity(
      settings: await repository.loadSettings(ep),
      weather: await repository.loadWeather(ep),
      images: await repository.loadImages(ep),
    );
  }
}
