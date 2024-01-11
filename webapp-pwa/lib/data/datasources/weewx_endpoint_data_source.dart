import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weewx_pwa/data/models/weewx_endpoint_model.dart';
import 'package:weewx_pwa/util/constants.dart';

abstract class WeewxEndpointDataSource {
  Future<List<WeewxEndpointModel>> loadEndpoints();
  Future saveEndpoints(List<WeewxEndpointModel> endpoints);
  Future<WeewxEndpointModel?> loadLastSelectedEndpoint();
  Future saveLastSelectedEndpoint(WeewxEndpointModel endpoint);
}

class WeewxEndpointDataSourceImpl extends WeewxEndpointDataSource {
  @override
  Future<List<WeewxEndpointModel>> loadEndpoints() async {
    final json = (await SharedPreferences.getInstance())
        .getString(kSharedPrefKeyEndpoints);
    if (json == null) {
      return [];
    }
    Iterable l = jsonDecode(json);
    return List<WeewxEndpointModel>.from(
      l.map((e) => WeewxEndpointModel.fromJson(e)),
    );
  }

  @override
  Future saveEndpoints(List<WeewxEndpointModel> endpoints) async {
    (await SharedPreferences.getInstance()).setString(
      kSharedPrefKeyEndpoints,
      jsonEncode(
        endpoints.map((e) => e.toJson()),
      ),
    );
  }

  @override
  Future<WeewxEndpointModel?> loadLastSelectedEndpoint() async {
    final json = (await SharedPreferences.getInstance())
        .getString(kSharedPrefKeyLastSelectedEndpoint);
    return json != null ? WeewxEndpointModel.fromJson(json) : null;
  }

  @override
  Future saveLastSelectedEndpoint(WeewxEndpointModel endpoint) async {
    (await SharedPreferences.getInstance())
        .setString(kSharedPrefKeyLastSelectedEndpoint, endpoint.toJson());
  }
}
