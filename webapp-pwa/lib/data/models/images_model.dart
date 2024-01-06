import 'dart:convert';

import 'package:flutter/foundation.dart';

class ImagesModel {
  final String generation;
  final List<Image> images;
  ImagesModel({
    required this.generation,
    required this.images,
  });

  ImagesModel copyWith({
    String? generation,
    List<Image>? images,
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
      images: List<Image>.from(map['images']?.map((x) => Image.fromMap(x))),
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

class Image {
  final String category;
  final String filename;
  final String date;
  Image({
    required this.category,
    required this.filename,
    required this.date,
  });

  Image copyWith({
    String? category,
    String? filename,
    String? date,
  }) {
    return Image(
      category: category ?? this.category,
      filename: filename ?? this.filename,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'filename': filename,
      'date': date,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      category: map['category'] ?? '',
      filename: map['filename'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  @override
  String toString() =>
      'Image(category: $category, filename: $filename, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Image &&
        other.category == category &&
        other.filename == filename &&
        other.date == date;
  }

  @override
  int get hashCode => category.hashCode ^ filename.hashCode ^ date.hashCode;
}
