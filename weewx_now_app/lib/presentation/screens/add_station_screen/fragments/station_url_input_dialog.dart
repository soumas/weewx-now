import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StationUrlInputDialog extends StatefulWidget {
  const StationUrlInputDialog({
    super.key,
    required this.initialValue,
  });

  final String initialValue;

  @override
  State<StationUrlInputDialog> createState() => _StationUrlInputDialogState();
}

class _StationUrlInputDialogState extends State<StationUrlInputDialog> {
  final _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _inputController.text = widget.initialValue;
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PlatformAlertDialog(
        title: Text(AppLocalizations.of(context)!.weeWXStationUrl),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PlatformTextFormField(
              controller: _inputController,
              hintText: 'https://myserver/weewx/now',
              keyboardType: TextInputType.url,
              autofocus: true,
            ),
          ],
        ),
        actions: [
          PlatformDialogAction(
            child: PlatformText(AppLocalizations.of(context)!.cancel),
            onPressed: () => context.pop(),
          ),
          PlatformDialogAction(
            child: PlatformText(AppLocalizations.of(context)!.continuee),
            onPressed: () async {
              context.pop(_inputController.text);
            },
          ),
        ],
      ),
    );
  }
}
