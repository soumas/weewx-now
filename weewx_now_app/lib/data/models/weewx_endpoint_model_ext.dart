import 'package:weewx_now_app/data/models/weewx_endpoint_model.dart';
import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint.dart';

extension WeewxEndpointModelExt on WeewxEndpointModel {
  WeewxEndpoint toEntity() {
    return WeewxEndpoint(
      name: name,
      url: url,
    );
  }

  static WeewxEndpointModel fromEntity(WeewxEndpoint e) {
    return WeewxEndpointModel(
      name: e.name,
      url: e.url,
    );
  }
}
