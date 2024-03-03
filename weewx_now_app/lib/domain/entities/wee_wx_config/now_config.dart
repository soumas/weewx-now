import 'dart:convert';

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

  WeeWXNowConfig copyWith({
    String? responsibleEntityName,
    String? responsibleEntityUrl,
    String? password,
    bool? hideImageViewer,
  }) {
    return WeeWXNowConfig(
      responsibleEntityName: responsibleEntityName ?? this.responsibleEntityName,
      responsibleEntityUrl: responsibleEntityUrl ?? this.responsibleEntityUrl,
      password: password ?? this.password,
      hideImageViewer: hideImageViewer ?? this.hideImageViewer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'responsibleEntityName': responsibleEntityName,
      'responsibleEntityUrl': responsibleEntityUrl,
      'password': password,
      'hideImageViewer': hideImageViewer,
    };
  }

  factory WeeWXNowConfig.fromMap(Map<String, dynamic> map) {
    return WeeWXNowConfig(
      responsibleEntityName: map['responsibleEntityName'] ?? '',
      responsibleEntityUrl: map['responsibleEntityUrl'] ?? '',
      password: map['password'],
      hideImageViewer: map['hideImageViewer'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeeWXNowConfig.fromJson(String source) => WeeWXNowConfig.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeeWXNowConfig(responsibleEntityName: $responsibleEntityName, responsibleEntityUrl: $responsibleEntityUrl, password: $password, hideImageViewer: $hideImageViewer)';
  }
}
