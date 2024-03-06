import 'package:shared_preferences/shared_preferences.dart';
import 'package:weewx_now/domain/entities/endpoint/endpoint.dart';
import 'package:weewx_now/domain/repositories/endpoint_repository.dart';
import 'package:weewx_now/util/constants.dart';

class EndpointRepositoryImpl extends EndpointRepository {
  EndpointRepositoryImpl();

  @override
  Future<List<Endpoint>> loadEndpoints() async {
    final jsonLst = (await SharedPreferences.getInstance()).getStringList(kSharedPrefKeyEndpoints);
    if (jsonLst == null) {
      return [];
    }
    return List<Endpoint>.from(
      jsonLst.map((e) => Endpoint.fromJson(e)),
    );
  }

  @override
  Future<List<Endpoint>> addOrUpdateEndpoint(Endpoint endpoint) async {
    var epLst = await loadEndpoints();
    if (epLst.any((element) => element.url == endpoint.url)) {
      epLst = await deleteEndpoint(endpoint.url);
    }
    epLst.add(endpoint);
    await _saveEndpoints(epLst);
    return epLst;
  }

  @override
  Future<List<Endpoint>> deleteEndpoint(String endpointUrl) async {
    var epLst = await loadEndpoints();
    epLst.removeWhere((element) => element.url == endpointUrl);
    await _saveEndpoints(epLst);
    return epLst;
  }

  @override
  Future<Endpoint?> loadLastSelectedEndpoint() async {
    final json = (await SharedPreferences.getInstance()).getString(kSharedPrefKeyLastSelectedEndpoint);
    return json != null ? Endpoint.fromJson(json) : null;
  }

  @override
  Future<Endpoint> saveLastSelectedEndpoint(Endpoint endpoint) async {
    await (await SharedPreferences.getInstance()).setString(kSharedPrefKeyLastSelectedEndpoint, endpoint.toJson());
    return endpoint;
  }

  @override
  Future resetLastSelectedEndpoint() async {
    await (await SharedPreferences.getInstance()).remove(kSharedPrefKeyLastSelectedEndpoint);
  }

  Future<bool> _saveEndpoints(List<Endpoint> epLst) async {
    return (await SharedPreferences.getInstance()).setStringList(
      kSharedPrefKeyEndpoints,
      epLst.map((e) => e.toJson()).toList(),
    );
  }
}
