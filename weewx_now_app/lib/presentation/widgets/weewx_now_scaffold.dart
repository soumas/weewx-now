import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:weewx_now/presentation/widgets/busy_indicator.dart';

class WeeWxNowScaffold extends StatelessWidget {
  const WeeWxNowScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.material,
    this.cupertino,
  });

  final PlatformAppBar? appBar;
  final Widget body;
  final MaterialScaffoldData Function(BuildContext context, PlatformTarget platform)? material;
  final CupertinoPageScaffoldData Function(BuildContext context, PlatformTarget platform)? cupertino;

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
      material: material,
      cupertino: cupertino,
    );
  }
}
