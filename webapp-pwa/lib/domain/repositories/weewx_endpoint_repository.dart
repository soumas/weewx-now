import 'package:weewx_pwa/domain/entities/endpoint/weewx_endpoint_entity.dart';

abstract class WeewxEndpointRepository {
  Future<List<WeewxEndpointEntity>> loadEndpoints();
  Future saveEndpoints(List<WeewxEndpointEntity> endpoints);
  Future<WeewxEndpointEntity?> loadLastSelectedEndpoint();
  Future saveLastSelectedEndpoint(WeewxEndpointEntity endpoints);
}
