import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weewx_pwa/presentation/screens/fragments/carousel_slider_item.dart';
import 'package:weewx_pwa/presentation/widgets/responsive_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: ResponsiveContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('MSGU Flugplatz, Weer'),
              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      body: ResponsiveContainer(
        noPaddingForLowestBreakpoint: true,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              CarouselSlider(
                items: const [
                  CarouselSliderItem(
                    url: 'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110413534300.jpg',
                    angel: 107,
                  ),
                  CarouselSliderItem(
                    url: 'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110415334300.jpg',
                    angel: 207,
                  ),
                  CarouselSliderItem(
                    url: 'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110415334300.jpg',
                    angel: 207,
                  ),
                  CarouselSliderItem(
                    url: 'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110419334300.jpg',
                    angel: 84,
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  reverse: true,
                  pageSnapping: true,
                  viewportFraction: 1.0,
                  aspectRatio: 0.6,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuBar(
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left_outlined)),
                      const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.chevron_right_outlined),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
