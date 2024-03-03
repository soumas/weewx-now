import 'dart:convert';

class WeewxEndpoint {
  final String name;
  final String url;
  WeewxEndpoint({
    required this.name,
    required this.url,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeewxEndpoint && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory WeewxEndpoint.fromMap(Map<String, dynamic> map) {
    return WeewxEndpoint(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WeewxEndpoint.fromJson(String source) => WeewxEndpoint.fromMap(json.decode(source));

  WeewxEndpoint copyWith({
    String? name,
    String? url,
  }) {
    return WeewxEndpoint(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  String toString() => 'WeewxEndpoint(name: $name, url: $url)';
}
