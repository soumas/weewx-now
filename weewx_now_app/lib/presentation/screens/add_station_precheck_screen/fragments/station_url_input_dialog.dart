import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/add_station_screen/add_station_screen_bloc.dart';

class StationUrlInputDialog extends StatefulWidget {
  const StationUrlInputDialog({
    super.key,
  });

  @override
  State<StationUrlInputDialog> createState() => _StationUrlInputDialogState();
}

class _StationUrlInputDialogState extends State<StationUrlInputDialog> {
  final _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => sl.get<AddStationPrecheckScreenBloc>(),
        child: Builder(builder: (context) {
          return PlatformAlertDialog(
            title: Text(AppLocalizations.of(context)!.weeWXStationUrl),
            content: BlocListener<AddStationPrecheckScreenBloc, AddStationPrecheckScreenState>(
              listenWhen: (previous, current) => current is AddStationPrecheckSuccess,
              listener: (context, state) {
                context.pop(_inputController.text);
              },
              child: BlocBuilder<AddStationPrecheckScreenBloc, AddStationPrecheckScreenState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PlatformTextFormField(
                        controller: _inputController,
                        hintText: 'https://myserver/weewx/now',
                        keyboardType: TextInputType.url,
                        autofocus: true,
                      ),
                      if (state is AddStationPrecheckFailed) Text(state.error),
                    ],
                  );
                },
              ),
            ),
            actions: [
              PlatformDialogAction(
                child: PlatformText(AppLocalizations.of(context)!.cancel),
                onPressed: () => context.pop(),
              ),
              PlatformDialogAction(
                child: PlatformText(AppLocalizations.of(context)!.continuee),
                onPressed: () async {
                  context.read<AddStationPrecheckScreenBloc>().add(RunCheck(url: _inputController.text));
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
