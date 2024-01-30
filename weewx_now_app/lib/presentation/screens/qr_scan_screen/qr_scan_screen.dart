import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanScreen extends StatelessWidget {
  const QrScanScreen({super.key});

  static const String routeName = 'qrScanScreen';

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: MobileScanner(
        onDetect: (capture) {
          if (capture.barcodes.isNotEmpty) {
            context.pop(capture.barcodes[0]);
          }
        },
      ),
    );
  }
}
