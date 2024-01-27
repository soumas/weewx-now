part of 'image_viewer_cubit.dart';

@immutable
sealed class ImageViewerState {}

final class ImageViewerInitial extends ImageViewerState {}

final class NoImageViewerData extends ImageViewerState {}

final class ImageViewerData extends ImageViewerState {
  final WeeWxConfig settings;
  final ImageBundle images;
  final ImageMetaData selectedImage;
  final ImageCategory selectedCategory;

  ImageViewerData({
    required this.settings,
    required this.images,
    required this.selectedImage,
    required this.selectedCategory,
  });

  ImageViewerData copyWith({
    WeeWxConfig? settings,
    ImageBundle? images,
    ImageMetaData? selectedImage,
    ImageCategory? selectedCategory,
  }) {
    return ImageViewerData(
      settings: settings ?? this.settings,
      images: images ?? this.images,
      selectedImage: selectedImage ?? this.selectedImage,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
