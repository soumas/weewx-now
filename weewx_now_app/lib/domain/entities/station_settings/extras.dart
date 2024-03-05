import 'dart:convert';

class Extras {
  final String responsibleEntityName;
  final String responsibleEntityUrl;
  final bool hideImageViewer;
  Extras({
    required this.responsibleEntityName,
    required this.responsibleEntityUrl,
    required this.hideImageViewer,
  });

  Extras copyWith({
    String? responsibleEntityName,
    String? responsibleEntityUrl,
    bool? hideImageViewer,
  }) {
    return Extras(
      responsibleEntityName: responsibleEntityName ?? this.responsibleEntityName,
      responsibleEntityUrl: responsibleEntityUrl ?? this.responsibleEntityUrl,
      hideImageViewer: hideImageViewer ?? this.hideImageViewer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'responsibleEntityName': responsibleEntityName,
      'responsibleEntityUrl': responsibleEntityUrl,
      'hideImageViewer': hideImageViewer,
    };
  }

  factory Extras.fromMap(Map<String, dynamic> map) {
    return Extras(
      responsibleEntityName: map['responsibleEntityName'] ?? '',
      responsibleEntityUrl: map['responsibleEntityUrl'] ?? '',
      hideImageViewer: map['hideImageViewer'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Extras.fromJson(String source) => Extras.fromMap(json.decode(source));

  @override
  String toString() => 'Extras(responsibleEntityName: $responsibleEntityName, responsibleEntityUrl: $responsibleEntityUrl, hideImageViewer: $hideImageViewer)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Extras &&
        other.responsibleEntityName == responsibleEntityName &&
        other.responsibleEntityUrl == responsibleEntityUrl &&
        other.hideImageViewer == hideImageViewer;
  }

  @override
  int get hashCode => responsibleEntityName.hashCode ^ responsibleEntityUrl.hashCode ^ hideImageViewer.hashCode;
}
