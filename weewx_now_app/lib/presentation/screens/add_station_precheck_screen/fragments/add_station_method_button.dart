import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AddStationMethodButton extends StatelessWidget {
  const AddStationMethodButton({
    super.key,
    required this.context,
    required this.iconData,
    required this.description,
    required this.actionLabel,
    this.onPressed,
    this.inputWidgetnWidget,
  });

  final BuildContext context;
  final IconData iconData;
  final String description;
  final String actionLabel;
  final void Function()? onPressed;
  final Widget? inputWidgetnWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description),
                if (inputWidgetnWidget != null) inputWidgetnWidget!,
                PlatformTextButton(
                  padding: EdgeInsets.zero,
                  onPressed: onPressed,
                  child: Text(actionLabel),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
