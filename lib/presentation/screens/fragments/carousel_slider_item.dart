import 'package:flutter/material.dart';
import 'package:weewx_pwa/presentation/screens/fragments/carousel_slider_item_data.dart';
import 'package:weewx_pwa/util/responsive_utils.dart';

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
    return LayoutBuilder(builder: (context, constraints) {
      if (ScreenSizeExt.of(context) == ScreenSize.large) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.6,
              child: Image.network(url, fit: BoxFit.cover),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.4,
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CarouselSliderItemData(),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            SizedBox(
              width: constraints.maxWidth,
              child: Image.network(url, fit: BoxFit.cover),
            ),
            Padding(
              padding: ScreenSizeExt.of(context) == ScreenSize.small
                  ? const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    )
                  : EdgeInsets.zero,
              child: const CarouselSliderItemData(),
            ),
          ],
        );
      }
    });
  }
}
