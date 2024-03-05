import 'package:weewx_now/domain/entities/endpoint/endpoint.dart';

abstract class EndpointRepository {
  Future<List<Endpoint>> loadEndpoints();
  Future<List<Endpoint>> addOrUpdateEndpoint(Endpoint endpoint);
  Future<List<Endpoint>> deleteEndpoint(String endpointUrl);
  Future<Endpoint?> loadLastSelectedEndpoint();
  Future<Endpoint> saveLastSelectedEndpoint(Endpoint endpoint);
  Future resetLastSelectedEndpoint();
}
