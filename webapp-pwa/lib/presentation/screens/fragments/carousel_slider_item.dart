import 'package:flutter/material.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({
    super.key,
    required this.url,
    required this.angel,
  });

  final String url;
  final double angel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Image.network(url, fit: BoxFit.cover);
      },
    );
  }
}
