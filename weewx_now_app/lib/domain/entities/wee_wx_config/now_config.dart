class WeeWXNowConfig {
  final String responsibleEntityName;
  final String responsibleEntityUrl;
  final String? password;
  final bool hideImageViewer;
  WeeWXNowConfig({
    required this.responsibleEntityName,
    required this.responsibleEntityUrl,
    this.password,
    required this.hideImageViewer,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeeWXNowConfig &&
        other.responsibleEntityName == responsibleEntityName &&
        other.responsibleEntityUrl == responsibleEntityUrl &&
        other.password == password &&
        other.hideImageViewer == hideImageViewer;
  }

  @override
  int get hashCode {
    return responsibleEntityName.hashCode ^ responsibleEntityUrl.hashCode ^ password.hashCode ^ hideImageViewer.hashCode;
  }
}
