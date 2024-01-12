import 'package:shared_preferences/shared_preferences.dart';
import 'package:weewx_pwa/data/models/weewx_endpoint_model.dart';
import 'package:weewx_pwa/util/constants.dart';

abstract class WeewxEndpointDataSource {
  Future<List<WeewxEndpointModel>> loadEndpoints();
  Future<List<WeewxEndpointModel>> addOrUpdateEndpoint(
      WeewxEndpointModel endpoint);
  Future<List<WeewxEndpointModel>> deleteEndpoint(String endpointUrl);
  Future<WeewxEndpointModel?> loadLastSelectedEndpoint();
  Future<WeewxEndpointModel> saveLastSelectedEndpoint(
      WeewxEndpointModel endpoint);
}

class WeewxEndpointDataSourceImpl extends WeewxEndpointDataSource {
  @override
  Future<List<WeewxEndpointModel>> loadEndpoints() async {
    final jsonLst = (await SharedPreferences.getInstance())
        .getStringList(kSharedPrefKeyEndpoints);
    if (jsonLst == null) {
      return [];
    }
    return List<WeewxEndpointModel>.from(
      jsonLst.map((e) => WeewxEndpointModel.fromJson(e)),
    );
  }

  @override
  Future<List<WeewxEndpointModel>> addOrUpdateEndpoint(
      WeewxEndpointModel endpoint) async {
    var epLst = await loadEndpoints();
    if (epLst.any((element) => element.url == endpoint.url)) {
      epLst = await deleteEndpoint(endpoint.url);
    }
    epLst.add(endpoint);
    await _saveEndpoints(epLst);
    return epLst;
  }

  @override
  Future<List<WeewxEndpointModel>> deleteEndpoint(String endpointUrl) async {
    var epLst = await loadEndpoints();
    epLst.removeWhere((element) => element.url == endpointUrl);
    await _saveEndpoints(epLst);
    return epLst;
  }

  @override
  Future<WeewxEndpointModel?> loadLastSelectedEndpoint() async {
    final json = (await SharedPreferences.getInstance())
        .getString(kSharedPrefKeyLastSelectedEndpoint);
    return json != null ? WeewxEndpointModel.fromJson(json) : null;
  }

  @override
  Future<WeewxEndpointModel> saveLastSelectedEndpoint(
      WeewxEndpointModel endpoint) async {
    await (await SharedPreferences.getInstance())
        .setString(kSharedPrefKeyLastSelectedEndpoint, endpoint.toJson());
    return endpoint;
  }

  Future<bool> _saveEndpoints(List<WeewxEndpointModel> epLst) async {
    return (await SharedPreferences.getInstance()).setStringList(
      kSharedPrefKeyEndpoints,
      epLst.map((e) => e.toJson()).toList(),
    );
  }
}
