import 'package:flutter/material.dart';
import 'package:weewx_now/util/responsive_utils.dart';

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({
    super.key,
    required this.child,
    this.noPaddingForLowestBreakpoint = false,
  });

  final Widget child;
  final bool noPaddingForLowestBreakpoint;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: ScreenSizeExt.contentWidthOf(context),
            child: Padding(
              padding: noPaddingForLowestBreakpoint &&
                      ScreenSizeExt.of(context) == ScreenSize.small
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
              child: Align(
                alignment: Alignment.topLeft,
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
