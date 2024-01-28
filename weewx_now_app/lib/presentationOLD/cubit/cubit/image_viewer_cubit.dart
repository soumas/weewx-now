import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now_app/domain/entities/image/image_category.dart';
import 'package:weewx_now_app/domain/entities/image/image_meta_data.dart';
import 'package:weewx_now_app/domain/entities/image/image_bundle.dart';
import 'package:weewx_now_app/domain/entities/wee_wx_config/wee_wx_config.dart';

part 'image_viewer_state.dart';

class ImageViewerCubit extends Cubit<ImageViewerState> {
  ImageViewerCubit() : super(ImageViewerInitial());

  void applyImages(WeeWxConfig settings, ImageBundle images) async {
    if (state case ImageViewerInitial _) {}
    switch (state.runtimeType) {
      case == ImageViewerInitial:
      case == NoImageViewerData:
        if (images.map.isEmpty) {
          emit(NoImageViewerData());
        } else {
          final selectedImage = images.map.values.first.first;
          final selectedCategory = selectedImage.category;
          emit(
            ImageViewerData(
              settings: settings,
              images: images,
              selectedImage: selectedImage,
              selectedCategory: selectedCategory,
            ),
          );
        }
        break;
      case == ImageViewerData:
        emit((state as ImageViewerData).copyWith(images: images));
        break;
    }
  }
}
