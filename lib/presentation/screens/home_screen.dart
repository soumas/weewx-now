import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weewx_pwa/constants.dart';

import 'package:weewx_pwa/presentation/screens/fragments/carousel_slider_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 992,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth >= kLayoutBreakpoint
                  ? Scaffold(
                      endDrawer: Container(),
                      appBar: AppBar(
                        title: const Text('MSGU Weather Channel', style: TextStyle(color: Colors.black)),
                        actions: [
                          Builder(
                            builder: (context) => TextButton(onPressed: () => Scaffold.of(context).openEndDrawer(), child: const Text('xxxx')),
                          ),
                          PopupMenuButton(
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: const Text('Webcam', style: TextStyle(color: Colors.black)),
                                onTap: () => Scaffold.of(context).openEndDrawer(),
                              ),
                              const PopupMenuItem(child: Text('Statistics', style: TextStyle(color: Colors.black))),
                              const PopupMenuItem(child: Text('Settings', style: TextStyle(color: Colors.black))),
                            ],
                          ),
                          /*MenuBar(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('Webcam', style: TextStyle(color: Colors.black)),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Verlauf', style: TextStyle(color: Colors.black)),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Wettervorhersage', style: TextStyle(color: Colors.black)),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Einstellungen', style: TextStyle(color: Colors.black)),
                              )
                            ],
                          ),*/
                        ],
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      body: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: kLayoutBreakpoint * 0.6,
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
                                        url: 'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110419334300.jpg',
                                        angel: 84,
                                      ),
                                    ],
                                    options: CarouselOptions(
                                      aspectRatio: 4 / 3,
                                      autoPlay: false,
                                      enableInfiniteScroll: false,
                                      initialPage: 0,
                                      reverse: true,
                                      pageSnapping: true,
                                      viewportFraction: 1.0,
                                    ),
                                  ),
                                  AspectRatio(
                                    aspectRatio: 4 / 3,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                        Icon(
                                          Icons.chevron_left_outlined,
                                          color: Colors.white.withAlpha(150),
                                          size: 40,
                                        ),
                                        Icon(
                                          Icons.chevron_right_outlined,
                                          color: Colors.white.withAlpha(150),
                                          size: 40,
                                        ),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Details'),
                                  ),
                                  Table(children: const [
                                    TableRow(children: [Text('Datum'), Text('11.11.2023, 22:17 Uhr')]),
                                    TableRow(children: [Text('Windstärke'), Text('0,00 km/h')]),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Scaffold(
                      body: Container(
                        color: Colors.green,
                        child: const Center(
                          child: Text('xx'),
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
