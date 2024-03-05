import 'dart:convert';

class Endpoint {
  final String name;
  final String url;
  Endpoint({
    required this.name,
    required this.url,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Endpoint && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Endpoint.fromMap(Map<String, dynamic> map) {
    return Endpoint(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Endpoint.fromJson(String source) => Endpoint.fromMap(json.decode(source));

  Endpoint copyWith({
    String? name,
    String? url,
  }) {
    return Endpoint(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  String toString() => 'WeewxEndpoint(name: $name, url: $url)';
}
