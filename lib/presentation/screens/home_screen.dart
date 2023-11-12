import 'dart:ui';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weewx_pwa/presentation/screens/fragments/carousel_slider_item.dart';
import 'package:weewx_pwa/presentation/widgets/responsive_container.dart';
import 'package:weewx_pwa/util/responsive_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "homeScreen";

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
                        url: 'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110413534300.jpg',
                        angel: 107,
                      ),
                      CarouselSliderItem(
                        url: 'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110413534300.jpg',
                        angel: 107,
                      ),
                      CarouselSliderItem(
                        url: 'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110413534300.jpg',
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
                          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
                          IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left_outlined)),
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
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Weather development',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(
                width: ScreenSizeExt.contentWidthOf(context),
                height: 400,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    minY: -20,
                    maxX: 13,
                    maxY: 40,
                    lineBarsData: [
                      LineChartBarData(
                        color: Colors.blue,
                        isCurved: true,
                        spots: const [
                          FlSpot(0, 11),
                          FlSpot(1, 15),
                          FlSpot(3, 17),
                          FlSpot(5, 18.2),
                          FlSpot(7, 3.4),
                          FlSpot(10, 2),
                          FlSpot(12, 2.2),
                          FlSpot(13, 40.8),
                        ],
                      ),
                      LineChartBarData(
                        color: Colors.green,
                        isCurved: true,
                        spots: const [
                          FlSpot(0, 10),
                          FlSpot(1, 17),
                          FlSpot(3, 18),
                          FlSpot(5, 21),
                          FlSpot(7, 18),
                          FlSpot(10, 12),
                          FlSpot(12, 0),
                          FlSpot(13, 40.8),
                        ],
                      ),
                    ],
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(),
                      topTitles: const AxisTitles(),
                      rightTitles: AxisTitles(
                        drawBelowEverything: true,
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) => Text('$value °C'),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        drawBelowEverything: true,
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) => value % 2 == 0 ? Text('8:00 Uhr') : SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
