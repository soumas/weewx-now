enum ImageType { image }

extension ImageTypeExt on ImageType {
  static ImageType fromString(String name) {
    return ImageType.values.byName(name);
  }
}
