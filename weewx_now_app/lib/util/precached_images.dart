import 'package:flutter/material.dart';
import 'package:weewx_now/util/constants.dart';

class PrecachedImages {
  static var _initialized = false;
  static const logoFull = AssetImage(kAssetPathFullLogo);

  static Future init(BuildContext context) async {
    if (!_initialized) {
      await precacheImage(logoFull, context);
      _initialized = true;
    }
  }
}
