import 'package:weewx_pwa/data/datasources/weewx_endpoint_data_source.dart';
import 'package:weewx_pwa/data/models/weewx_endpoint_model_ext.dart';
import 'package:weewx_pwa/domain/entities/endpoint/weewx_endpoint_entity.dart';
import 'package:weewx_pwa/domain/repositories/weewx_endpoint_repository.dart';

class WeewxEndpointRepositoryImpl extends WeewxEndpointRepository {
  final WeewxEndpointDataSource dataSource;
  WeewxEndpointRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<List<WeewxEndpointEntity>> loadEndpoints() async {
    return List<WeewxEndpointEntity>.of(
        (await dataSource.loadEndpoints()).map((e) => e.toEntity()));
  }

  @override
  Future<List<WeewxEndpointEntity>> addOrUpdateEndpoint(
      WeewxEndpointEntity endpoint) async {
    return List.of((await dataSource
            .addOrUpdateEndpoint(WeewxEndpointModelExt.fromEntity(endpoint)))
        .map((e) => e.toEntity()));
  }

  @override
  Future<List<WeewxEndpointEntity>> deleteEndpoint(String endpointUrl) async {
    return List.of((await dataSource.deleteEndpoint(endpointUrl))
        .map((e) => e.toEntity()));
  }

  @override
  Future<WeewxEndpointEntity?> loadLastSelectedEndpoint() async {
    final lep = await dataSource.loadLastSelectedEndpoint();
    return lep?.toEntity();
  }

  @override
  Future<WeewxEndpointEntity> saveLastSelectedEndpoint(
      WeewxEndpointEntity endpoint) async {
    return (await dataSource.saveLastSelectedEndpoint(
            WeewxEndpointModelExt.fromEntity(endpoint)))
        .toEntity();
  }
}
