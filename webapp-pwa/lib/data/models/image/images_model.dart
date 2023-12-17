import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weewx_pwa/data/models/image/image_metadata_model.dart';
import 'package:weewx_pwa/domain/entities/image/images_entity.dart';

class ImagesModel {
  final List<ImageMetaDataModel> webcam;

  ImagesModel({
    required this.webcam,
  });

  ImagesEntity toEntity() {
    return ImagesEntity(webcam: webcam.map((e) => e.toEntity()).toList());
  }

  ImagesModel copyWith({
    List<ImageMetaDataModel>? webcam,
  }) {
    return ImagesModel(
      webcam: webcam ?? this.webcam,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'webcam': webcam.map((x) => x.toMap()).toList(),
    };
  }

  factory ImagesModel.fromMap(Map<String, dynamic> map) {
    return ImagesModel(
      webcam: List<ImageMetaDataModel>.from(
          map['webcam']?.map((x) => ImageMetaDataModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImagesModel.fromJson(String source) =>
      ImagesModel.fromMap(json.decode(source));

  @override
  String toString() => 'ImagesModel(webcam: $webcam)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImagesModel && listEquals(other.webcam, webcam);
  }

  @override
  int get hashCode => webcam.hashCode;
}
