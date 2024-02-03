import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/add_station_screen/add_station_screen_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weewx_now/presentation/screens/add_station_precheck_screen/fragments/add_station_check_failed_dialog.dart';
import 'package:weewx_now/presentation/screens/add_station_precheck_screen/fragments/add_station_method_button.dart';
import 'package:weewx_now/presentation/screens/add_station_precheck_screen/fragments/station_url_input_dialog.dart';

import 'package:weewx_now/util/precached_images.dart';

class AddStationPrecheckScreen extends StatelessWidget {
  const AddStationPrecheckScreen({super.key});

  static const routeName = 'addStationPrecheckScreen';
  static const heroImageTag = 'addStationPrecheckScreenHero';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<AddStationPrecheckScreenBloc>(),
      child: PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(AppLocalizations.of(context)!.addWeeWXStation),
        ),
        body: Builder(builder: (context) {
          return BlocListener<AddStationPrecheckScreenBloc, AddStationPrecheckScreenState>(
            listenWhen: (previous, current) => current is AddStationPrecheckFailed,
            listener: (context, state) {
              showPlatformModalSheet<String>(
                context: context,
                builder: (context) => const AddStationCheckFailedDialog(),
              );
            },
            child: SafeArea(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Hero(
                          tag: heroImageTag,
                          child: Image(image: PrecachedImages.logoFull, width: 200),
                        ),
                      ],
                    ),
                  ),
                  AddStationMethodButton(
                      context: context,
                      iconData: Icons.qr_code_2_rounded,
                      description: AppLocalizations.of(context)!.addStationViaQrCodeDesc,
                      onPressed: () async {
                        await FlutterBarcodeScanner.scanBarcode(
                          '#ff6666',
                          AppLocalizations.of(context)!.cancel,
                          false,
                          ScanMode.QR,
                        ).then((value) {
                          if (value.startsWith('http')) {
                            context.read<AddStationPrecheckScreenBloc>().add(RunCheck(url: value));
                          }
                        });
                      }),
                  AddStationMethodButton(
                      context: context,
                      iconData: Icons.share,
                      description: AppLocalizations.of(context)!.addStationVialviaUrlDesc,
                      onPressed: () async {
                        await showPlatformDialog<String>(
                          context: context,
                          builder: (context) => const StationUrlInputDialog(),
                        ).then((value) {
                          if (value != null) {
                            context.read<AddStationPrecheckScreenBloc>().add(RunCheck(url: value));
                          }
                        });
                      }),
                  AddStationMethodButton(
                      context: context, iconData: Icons.search, description: AppLocalizations.of(context)!.addStationVialviaPublicService, onPressed: () {}),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
