import 'package:flutter/material.dart';
import 'package:weewx_pwa/presentation/screens/fragments/headline_row.dart';
import 'package:weewx_pwa/presentation/screens/fragments/image_viewer.dart';
import 'package:weewx_pwa/presentation/screens/fragments/weather_agg_data_table.dart';
import 'package:weewx_pwa/presentation/screens/fragments/weather_graphs.dart';
import 'package:weewx_pwa/presentation/widgets/responsive_container.dart';
import 'package:weewx_pwa/util/responsive_utils.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, this.url});

  static const String routeName = 'mainScreen';
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          // headline for not small screen (above image)
          if (ScreenSizeExt.of(context) != ScreenSize.small)
            const ResponsiveContainer(
              child: HeadlineRow(),
            ),
          // image for small screen (without padding)
          if (ScreenSizeExt.of(context) == ScreenSize.small)
            const ResponsiveContainer(
              noPaddingForLowestBreakpoint: true,
              child: ImageViewer(),
            ),
          // image for medium screen (without padding)
          if (ScreenSizeExt.of(context) == ScreenSize.medium)
            const ResponsiveContainer(
              child: ImageViewer(),
            ),
          // image and weather table for large screen
          if (ScreenSizeExt.of(context) == ScreenSize.large)
            ResponsiveContainer(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ScreenSizeExt.contentWidthOf(context) * 0.65,
                    child: const ImageViewer(),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: WeatherAggDataTable(),
                    ),
                  ),
                ],
              ),
            ),
          // headline for small screen (below image)
          if (ScreenSizeExt.of(context) == ScreenSize.small)
            const ResponsiveContainer(
              child: HeadlineRow(),
            ),
          // spacer before weather data table
          if (ScreenSizeExt.of(context) != ScreenSize.large)
            const SizedBox(
              height: 30,
            ),
          // weather table for non large screen
          if (ScreenSizeExt.of(context) != ScreenSize.large)
            const ResponsiveContainer(
              child: WeatherAggDataTable(),
            ),
          // spacer before graphs
          const SizedBox(
            height: 30,
          ),
          // graphs
          const ResponsiveContainer(
            child: WeatherGraphs(images: [
              'http://localhost/weewx/webapp/dayhum.png',
              'http://localhost/weewx/webapp/dayhum.png',
              'http://localhost/weewx/webapp/dayrain.png',
              'http://localhost/weewx/webapp/dayrain.png',
              'http://localhost/weewx/webapp/dayhum.png',
            ]),
          ),
          // bottom spacer
          const SizedBox(
            height: 80,
          ),
        ],
      )),
    );
  }
}
