import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weewx_pwa/data/models/image/image_metadata_model.dart';
import 'package:weewx_pwa/domain/entities/image/image_category_entity.dart';
import 'package:weewx_pwa/domain/entities/image/image_meta_data_entity.dart';
import 'package:weewx_pwa/domain/entities/image/images_entity.dart';

class ImagesModel {
  final String generation;
  final List<ImageMetaDataModel> images;

  ImagesModel({
    required this.generation,
    required this.images,
  });

  ImagesEntity toEntity() {
    final map = <ImageCategoryEntity, List<ImageMetaDataEntity>>{};
    for (final img in images) {
      final cat = ImageCategoryEntity(id: img.category);
      map.putIfAbsent(cat, () => []);
      map[cat]!.add(img.toEntity());
    }
    return ImagesEntity(images: map);
  }

  ImagesModel copyWith({
    String? generation,
    List<ImageMetaDataModel>? images,
  }) {
    return ImagesModel(
      generation: generation ?? this.generation,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation,
      'images': images.map((x) => x.toMap()).toList(),
    };
  }

  factory ImagesModel.fromMap(Map<String, dynamic> map) {
    return ImagesModel(
      generation: map['generation'] ?? '',
      images: List<ImageMetaDataModel>.from(
          map['images']?.map((x) => ImageMetaDataModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImagesModel.fromJson(String source) =>
      ImagesModel.fromMap(json.decode(source));

  @override
  String toString() => 'ImagesModel(generation: $generation, images: $images)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImagesModel &&
        other.generation == generation &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode => generation.hashCode ^ images.hashCode;
}
