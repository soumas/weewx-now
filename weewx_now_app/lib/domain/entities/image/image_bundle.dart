import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weewx_now/domain/entities/image/image_category.dart';
import 'package:weewx_now/domain/entities/image/image_meta_data.dart';

class ImageBundle {
  final DateTime generation;
  final Map<ImageCategory, List<ImageMetaData>> map;
  ImageBundle({
    required this.generation,
    required this.map,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageBundle && other.generation == generation && mapEquals(other.map, map);
  }

  @override
  int get hashCode => generation.hashCode ^ map.hashCode;

  ImageBundle copyWith({
    DateTime? generation,
    Map<ImageCategory, List<ImageMetaData>>? map,
  }) {
    return ImageBundle(
      generation: generation ?? this.generation,
      map: map ?? this.map,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation.millisecondsSinceEpoch,
      'map': map,
    };
  }

  factory ImageBundle.fromMap(Map<String, dynamic> map) {
    return ImageBundle(
      generation: DateTime.fromMillisecondsSinceEpoch(map['generation']),
      map: Map<ImageCategory, List<ImageMetaData>>.from(map['map']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageBundle.fromJson(String source) => ImageBundle.fromMap(json.decode(source));

  @override
  String toString() => 'ImageBundle(generation: $generation, map: $map)';
}
