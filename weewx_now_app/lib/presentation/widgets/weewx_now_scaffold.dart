import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:weewx_now/presentation/widgets/busy_indicator.dart';

class WeeWxNowScaffold extends StatelessWidget {
  const WeeWxNowScaffold({
    super.key,
    this.appBar,
    required this.body,
  });

  final PlatformAppBar? appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: appBar,
      body: SafeArea(
        child: Stack(
          children: [
            body,
            const BusyIndicator(),
          ],
        ),
      ),
    );
  }
}
