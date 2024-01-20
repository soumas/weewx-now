import 'package:weewx_now_app/data/models/weewx_endpoint_model.dart';
import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint_entity.dart';

extension WeewxEndpointModelExt on WeewxEndpointModel {
  WeewxEndpointEntity toEntity() {
    return WeewxEndpointEntity(
      name: name,
      url: url,
    );
  }

  static WeewxEndpointModel fromEntity(WeewxEndpointEntity e) {
    return WeewxEndpointModel(
      name: e.name,
      url: e.url,
    );
  }
}
