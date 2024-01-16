import 'dart:convert';

class WeewxEndpointModel {
  final String name;
  final String url;
  WeewxEndpointModel({
    required this.name,
    required this.url,
  });

  WeewxEndpointModel copyWith({
    String? name,
    String? url,
  }) {
    return WeewxEndpointModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory WeewxEndpointModel.fromMap(Map<String, dynamic> map) {
    return WeewxEndpointModel(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WeewxEndpointModel.fromJson(String source) =>
      WeewxEndpointModel.fromMap(json.decode(source));

  @override
  String toString() => 'WeewxEndpointModel(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeewxEndpointModel &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
