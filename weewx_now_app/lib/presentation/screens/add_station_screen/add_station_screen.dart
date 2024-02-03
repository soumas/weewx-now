import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now/presentation/bloc/add_station_screen/add_station_screen_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weewx_now/presentation/screens/add_station_screen/fragments/station_url_input_dialog.dart';

import 'package:weewx_now/util/precached_images.dart';

class AddStationScreen extends StatelessWidget {
  const AddStationScreen({super.key});

  static const routeName = 'addStationScreen';
  static const heroImageTag = 'addStationScreenHero';

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(AppLocalizations.of(context)!.addWeeWXStation),
      ),
      body: SafeArea(
        child: Stack(children: [
          ListView(
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
              _actionButton(
                context: context,
                iconData: Icons.qr_code_2_rounded,
                description: AppLocalizations.of(context)!.addStationViaQrCodeDesc,
                onPressed: () async {
                  await FlutterBarcodeScanner.scanBarcode('#ff6666', AppLocalizations.of(context)!.cancel, false, ScanMode.QR).then((value) {
                    if (value.startsWith('http')) {
                      context.read<AddStationScreenBloc>().add(RunEndpointCheck(url: value));
                    }
                  });
                },
              ),
              _actionButton(
                context: context,
                iconData: Icons.share,
                description: AppLocalizations.of(context)!.addStationVialviaUrlDesc,
                onPressed: () async {
                  await showPlatformDialog<String>(
                    context: context,
                    builder: (context) => StationUrlInputDialog(
                      initialValue: '',
                    ),
                  ).then((value) {
                    if (value != null) {
                      context.read<AddStationScreenBloc>().add(RunEndpointCheck(url: value));
                    }
                  });
                },
              ),
              _actionButton(
                context: context,
                iconData: Icons.search,
                description: AppLocalizations.of(context)!.addStationVialviaPublicService,
                onPressed: () {},
              ),
            ],
          ),
        ]),
      ),
    );
  }

  PlatformTextButton _actionButton({
    required BuildContext context,
    required IconData iconData,
    required String description,
    required void Function() onPressed,
  }) {
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
