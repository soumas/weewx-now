import 'package:flutter/material.dart';

class MainScreenLoadingWidget extends StatelessWidget {
  const MainScreenLoadingWidget({
    super.key,
    this.information,
  });

  final Widget? information;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Text('Loading...'), if (information != null) information!],
    );
  }
}
