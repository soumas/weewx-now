import 'package:flutter/material.dart';

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
            width: contentAreaWidth(constraints.maxWidth),
            child: Padding(
              padding: noPaddingForLowestBreakpoint && constraints.maxWidth <= kLayoutBreakpointMD
                  ? EdgeInsets.zero
                  : EdgeInsets.symmetric(
                      horizontal: contentAreaWidth(constraints.maxWidth)! * 0.02,
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

// width in pixels when layout should show small-/large-screen version
const double kLayoutBreakpointMD = 640;
const double kLayoutBreakpointXL = 1200;

double? contentAreaWidth(double screenWidth) {
  if (screenWidth >= kLayoutBreakpointXL) {
    return kLayoutBreakpointXL;
  } else if (screenWidth >= kLayoutBreakpointMD) {
    return kLayoutBreakpointMD;
  }
  return screenWidth;
}
