class NowConfig {
  final String endpoint;
  final bool hideImageViewer;
  final String? password;
  NowConfig({
    required this.endpoint,
    required this.hideImageViewer,
    this.password,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NowConfig &&
        other.endpoint == endpoint &&
        other.hideImageViewer == hideImageViewer &&
        other.password == password;
  }

  @override
  int get hashCode =>
      endpoint.hashCode ^ hideImageViewer.hashCode ^ password.hashCode;
}
