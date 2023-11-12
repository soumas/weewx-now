import 'package:flutter/material.dart';
import 'package:weewx_pwa/util/constants.dart';

enum ScreenSize { small, medium, large }

extension ScreenSizeExt on ScreenSize {
  static ScreenSize of(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= kLayoutBreakpointL) {
      return ScreenSize.large;
    } else if (screenWidth >= kLayoutBreakpointM) {
      return ScreenSize.medium;
    }
    return ScreenSize.small;
  }

  static double contentWidthOf(BuildContext context) {
    switch (ScreenSizeExt.of(context)) {
      case ScreenSize.small:
        return MediaQuery.of(context).size.width;
      case ScreenSize.medium:
        return kLayoutBreakpointM;
      case ScreenSize.large:
        return kLayoutBreakpointL;
    }
  }
}
