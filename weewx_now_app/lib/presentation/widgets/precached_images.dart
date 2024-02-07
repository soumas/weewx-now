import 'package:flutter/material.dart';
import 'package:weewx_now/util/constants.dart';

late Image precachedLogoFull;

class PrecachedImages extends StatefulWidget {
  const PrecachedImages({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<PrecachedImages> createState() => _PrecachedImagesState();
}

class _PrecachedImagesState extends State<PrecachedImages> {
  @override
  void initState() {
    super.initState();
    precachedLogoFull = Image.asset(kAssetPathFullLogo);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(precachedLogoFull.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
