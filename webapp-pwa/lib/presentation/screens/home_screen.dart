import 'dart:ui';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:weewx_pwa/domain/repositories/weather_repository.dart';
import 'package:weewx_pwa/injection.dart';
import 'package:weewx_pwa/presentation/screens/fragments/carousel_slider_item.dart';
import 'package:weewx_pwa/presentation/widgets/responsive_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.url});

  static const String routeName = "homeScreen";
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: ResponsiveContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MSGU Flugplatz, Weer',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
      body: ResponsiveContainer(
        noPaddingForLowestBreakpoint: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ExpandablePageView(
                    pageSnapping: true,
                    reverse: true,
                    scrollBehavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    children: const [
                      CarouselSliderItem(
                        url:
                            'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110413534300.jpg',
                        angel: 107,
                      ),
                      CarouselSliderItem(
                        url:
                            'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110413534300.jpg',
                        angel: 107,
                      ),
                      CarouselSliderItem(
                        url:
                            'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110413534300.jpg',
                        angel: 107,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MenuBar(
                        children: [
                          IconButton(
                              onPressed: () async {
                                await sl<WeatherRepository>().loadWeather();
                              },
                              icon: const Icon(Icons.refresh)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.chevron_left_outlined)),
                          const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.chevron_right_outlined),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Text(url ?? 'kein URL')
            ],
          ),
        ),
      ),
    );
  }
}
