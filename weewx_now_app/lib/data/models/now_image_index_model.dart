import 'dart:convert';

import 'package:flutter/foundation.dart';

class NowImageIndexModel {
  final int generation;
  final List<Image> images;
  NowImageIndexModel({
    required this.generation,
    required this.images,
  });

  NowImageIndexModel copyWith({
    int? generation,
    List<Image>? images,
  }) {
    return NowImageIndexModel(
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

  factory NowImageIndexModel.fromMap(Map<String, dynamic> map) {
    return NowImageIndexModel(
      generation: map['generation']?.toInt() ?? 0,
      images: List<Image>.from(map['images']?.map((x) => Image.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NowImageIndexModel.fromJson(String source) => NowImageIndexModel.fromMap(json.decode(source));

  @override
  String toString() => 'NowImageIndex(generation: $generation, images: $images)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NowImageIndexModel && other.generation == generation && listEquals(other.images, images);
  }

  @override
  int get hashCode => generation.hashCode ^ images.hashCode;
}

class Image {
  final String type;
  final String category;
  final String data;
  final int date;
  Image({
    required this.type,
    required this.category,
    required this.data,
    required this.date,
  });

  Image copyWith({
    String? type,
    String? category,
    String? data,
    int? date,
  }) {
    return Image(
      type: type ?? this.type,
      category: category ?? this.category,
      data: data ?? this.data,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'category': category,
      'data': data,
      'date': date,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      type: map['type'] ?? '',
      category: map['category'] ?? '',
      data: map['data'] ?? '',
      date: map['date']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Image(type: $type, category: $category, data: $data, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Image && other.type == type && other.category == category && other.data == data && other.date == date;
  }

  @override
  int get hashCode {
    return type.hashCode ^ category.hashCode ^ data.hashCode ^ date.hashCode;
  }
}
