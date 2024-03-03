import 'package:shared_preferences/shared_preferences.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now/domain/repositories/weewx_endpoint_repository.dart';
import 'package:weewx_now/util/constants.dart';

class WeewxEndpointRepositoryImpl extends WeewxEndpointRepository {
  WeewxEndpointRepositoryImpl();

  @override
  Future<List<WeewxEndpoint>> loadEndpoints() async {
    final jsonLst = (await SharedPreferences.getInstance()).getStringList(kSharedPrefKeyEndpoints);
    if (jsonLst == null) {
      return [];
    }
    return List<WeewxEndpoint>.from(
      jsonLst.map((e) => WeewxEndpoint.fromJson(e)),
    );
  }

  @override
  Future<List<WeewxEndpoint>> addOrUpdateEndpoint(WeewxEndpoint endpoint) async {
    var epLst = await loadEndpoints();
    if (epLst.any((element) => element.url == endpoint.url)) {
      epLst = await deleteEndpoint(endpoint.url);
    }
    epLst.add(endpoint);
    await _saveEndpoints(epLst);
    return epLst;
  }

  @override
  Future<List<WeewxEndpoint>> deleteEndpoint(String endpointUrl) async {
    var epLst = await loadEndpoints();
    epLst.removeWhere((element) => element.url == endpointUrl);
    await _saveEndpoints(epLst);
    return epLst;
  }

  @override
  Future<WeewxEndpoint?> loadLastSelectedEndpoint() async {
    final json = (await SharedPreferences.getInstance()).getString(kSharedPrefKeyLastSelectedEndpoint);
    return json != null ? WeewxEndpoint.fromJson(json) : null;
  }

  @override
  Future<WeewxEndpoint> saveLastSelectedEndpoint(WeewxEndpoint endpoint) async {
    await (await SharedPreferences.getInstance()).setString(kSharedPrefKeyLastSelectedEndpoint, endpoint.toJson());
    return endpoint;
  }

  @override
  Future resetLastSelectedEndpoint() async {
    await (await SharedPreferences.getInstance()).remove(kSharedPrefKeyLastSelectedEndpoint);
  }

  Future<bool> _saveEndpoints(List<WeewxEndpoint> epLst) async {
    return (await SharedPreferences.getInstance()).setStringList(
      kSharedPrefKeyEndpoints,
      epLst.map((e) => e.toJson()).toList(),
    );
  }
}
