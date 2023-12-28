import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:weewx_pwa/domain/entities/settings/webapp_entity.dart';

class WebappModel {
  final String? password;
  WebappModel({
    this.password,
  });

  WebappModel copyWith({
    ValueGetter<String?>? password,
  }) {
    return WebappModel(
      password: password?.call() ?? this.password,
    );
  }

  WebappEntity toEntity() {
    return WebappEntity(password: password);
  }

  Map<String, dynamic> toMap() {
    return {
      'password': password,
    };
  }

  factory WebappModel.fromMap(Map<String, dynamic> map) {
    return WebappModel(
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WebappModel.fromJson(String source) =>
      WebappModel.fromMap(json.decode(source));

  @override
  String toString() => 'WebappModel(password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WebappModel && other.password == password;
  }

  @override
  int get hashCode => password.hashCode;
}
