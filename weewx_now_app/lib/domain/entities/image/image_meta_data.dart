import 'package:weewx_now/domain/entities/image/image_category.dart';
import 'package:weewx_now/domain/entities/image/image_type.dart';

class ImageMetaData {
  final ImageType type;
  final ImageCategory category;
  final String data;
  final DateTime date;
  ImageMetaData({
    required this.type,
    required this.category,
    required this.data,
    required this.date,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageMetaData && other.type == type && other.category == category && other.data == data && other.date == date;
  }

  @override
  int get hashCode {
    return type.hashCode ^ category.hashCode ^ data.hashCode ^ date.hashCode;
  }
}
