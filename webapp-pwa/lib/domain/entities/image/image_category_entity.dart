class ImageCategoryEntity {
  final String id;

  ImageCategoryEntity({
    required this.id,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageCategoryEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ImageCategoryEntity(id: $id)';
}
