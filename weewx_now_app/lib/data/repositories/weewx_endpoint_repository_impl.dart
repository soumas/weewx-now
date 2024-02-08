import 'package:weewx_now/data/datasources/weewx_endpoint_data_source.dart';
import 'package:weewx_now/data/models/weewx_endpoint_model_ext.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now/domain/repositories/weewx_endpoint_repository.dart';

class WeewxEndpointRepositoryImpl extends WeewxEndpointRepository {
  final WeewxEndpointDataSource dataSource;
  WeewxEndpointRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<List<WeewxEndpoint>> loadEndpoints() async {
    return List<WeewxEndpoint>.of((await dataSource.loadEndpoints()).map((e) => e.toEntity()));
  }

  @override
  Future<List<WeewxEndpoint>> addOrUpdateEndpoint(WeewxEndpoint endpoint) async {
    return List.of((await dataSource.addOrUpdateEndpoint(WeewxEndpointModelExt.fromEntity(endpoint))).map((e) => e.toEntity()));
  }

  @override
  Future<List<WeewxEndpoint>> deleteEndpoint(String endpointUrl) async {
    return List.of((await dataSource.deleteEndpoint(endpointUrl)).map((e) => e.toEntity()));
  }

  @override
  Future<WeewxEndpoint?> loadLastSelectedEndpoint() async {
    final lep = await dataSource.loadLastSelectedEndpoint();
    return lep?.toEntity();
  }

  @override
  Future<WeewxEndpoint> saveLastSelectedEndpoint(WeewxEndpoint endpoint) async {
    return (await dataSource.saveLastSelectedEndpoint(WeewxEndpointModelExt.fromEntity(endpoint))).toEntity();
  }

  @override
  Future resetLastSelectedEndpoint() async {
    return dataSource.resetLastSelectedEndpoint();
  }
}
