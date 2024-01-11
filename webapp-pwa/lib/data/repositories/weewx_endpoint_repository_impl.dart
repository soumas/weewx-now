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
  Future saveEndpoints(List<WeewxEndpointEntity> endpoints) {
    return dataSource.saveEndpoints(
        endpoints.map((e) => WeewxEndpointModelExt.fromEntity(e)).toList());
  }

  @override
  Future<WeewxEndpointEntity?> loadLastSelectedEndpoint() {
    // TODO: implement loadLastSelectedEndpoint
    throw UnimplementedError();
  }

  @override
  Future saveLastSelectedEndpoint(WeewxEndpointEntity endpoints) {
    // TODO: implement saveLastSelectedEndpoint
    throw UnimplementedError();
  }
}
