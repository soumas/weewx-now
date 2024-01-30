import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';

abstract class WeewxEndpointRepository {
  Future<List<WeewxEndpoint>> loadEndpoints();
  Future<List<WeewxEndpoint>> addOrUpdateEndpoint(WeewxEndpoint endpoint);
  Future<List<WeewxEndpoint>> deleteEndpoint(String endpointUrl);
  Future<WeewxEndpoint?> loadLastSelectedEndpoint();
  Future<WeewxEndpoint> saveLastSelectedEndpoint(WeewxEndpoint endpoint);
}
