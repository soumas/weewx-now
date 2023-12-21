import 'package:flutter/material.dart';
import 'package:weewx_pwa/presentation/screens/fragments/image_viewer.dart';
import 'package:weewx_pwa/presentation/screens/fragments/weather_agg_data_table.dart';
import 'package:weewx_pwa/presentation/widgets/responsive_container.dart';
import 'package:weewx_pwa/util/responsive_utils.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, this.url});

  static const String routeName = 'mainScreen';
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          noPaddingForLowestBreakpoint: true,
          child: Column(
            children: [
              if (ScreenSizeExt.of(context) != ScreenSize.small)
                const Row(
                  children: [
                    Text('Wetterstation 1'),
                    Icon(Icons.edit),
                  ],
                ),
              ScreenSizeExt.of(context) == ScreenSize.large
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: ScreenSizeExt.contentWidthOf(context) * 0.65,
                          child: const ImageViewer(),
                        ),
                        const Expanded(
                          child: WeatherAggDataTable(),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const ImageViewer(),
                        if (ScreenSizeExt.of(context) == ScreenSize.small)
                          const Row(
                            children: [
                              Text('Wetterstation 1'),
                              Icon(Icons.edit),
                            ],
                          ),
                        const WeatherAggDataTable(),
                      ],
                    ),
              Table(
                children: [
                  TableRow(
                    children: [
                      Image.network('http://localhost/weewx/webapp/dayhum.png'),
                      Image.network(
                          'http://localhost/weewx/webapp/dayrain.png'),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
