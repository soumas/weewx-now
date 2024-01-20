import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint_entity.dart';

abstract class WeewxEndpointRepository {
  Future<List<WeewxEndpointEntity>> loadEndpoints();
  Future<List<WeewxEndpointEntity>> addOrUpdateEndpoint(
      WeewxEndpointEntity endpoint);
  Future<List<WeewxEndpointEntity>> deleteEndpoint(String endpointUrl);
  Future<WeewxEndpointEntity?> loadLastSelectedEndpoint();
  Future<WeewxEndpointEntity> saveLastSelectedEndpoint(
      WeewxEndpointEntity endpoint);
}
