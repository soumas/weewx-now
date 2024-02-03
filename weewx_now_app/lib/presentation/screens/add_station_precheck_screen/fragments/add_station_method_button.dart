import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AddStationMethodButton extends StatelessWidget {
  const AddStationMethodButton({
    super.key,
    required this.context,
    required this.iconData,
    required this.description,
    required this.onPressed,
  });

  final BuildContext context;
  final IconData iconData;
  final String description;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      child: Card(
        child: PlatformTextButton(
          onPressed: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 60,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(description),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
