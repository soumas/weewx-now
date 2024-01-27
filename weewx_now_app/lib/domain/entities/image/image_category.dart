class ImageCategory {
  final String id;
  ImageCategory({
    required this.id,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageCategory && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
