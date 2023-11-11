import 'dart:math' as math;
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
    return Stack(
      children: [
        Image.network(url),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black.withAlpha(100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '11.11.2023, 16:24 Uhr',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        '0 km/h',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Transform.rotate(
                        angle: angel * math.pi / 180,
                        child: const Icon(
                          Icons.north,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
