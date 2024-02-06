import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/add_station_precheck_screen/add_station_precheck_screen_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weewx_now/presentation/bloc/busy/busy_cubit.dart';
import 'package:weewx_now/presentation/screens/add_station_confirm_screen/add_station_confirm_screen.dart';
import 'package:weewx_now/presentation/screens/add_station_precheck_screen/fragments/add_station_check_failed_dialog.dart';
import 'package:weewx_now/presentation/screens/add_station_precheck_screen/fragments/add_station_method_button.dart';
import 'package:weewx_now/presentation/widgets/weewx_now_scaffold.dart';
import 'package:weewx_now/util/precached_images.dart';

class AddStationPrecheckScreen extends StatefulWidget {
  const AddStationPrecheckScreen({super.key});

  static const routeName = 'addStationPrecheckScreen';
  static const heroImageTag = 'addStationPrecheckScreenHero';

  @override
  State<AddStationPrecheckScreen> createState() => _AddStationPrecheckScreenState();
}

class _AddStationPrecheckScreenState extends State<AddStationPrecheckScreen> {
  final _urlInputController = TextEditingController();

  @override
  void dispose() {
    _urlInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<AddStationPrecheckScreenBloc>(),
      child: BlocListener<AddStationPrecheckScreenBloc, AddStationPrecheckScreenState>(
        listener: (context, state) {
          context.read<BusyCubit>().setBusy(state is AddStationPrecheckRunning);
          if (state is AddStationPrecheckFailed) {
            showPlatformDialog<String>(context: context, builder: (context) => AddStationCheckFailedDialog(error: state.error));
          }
          if (state is AddStationPrecheckSuccess) {
            context.pushNamed(AddStationConfirmScreen.routeName, extra: state);
          }
        },
        child: Builder(builder: (context) {
          return WeeWxNowScaffold(
            appBar: PlatformAppBar(
              title: Text(AppLocalizations.of(context)!.addWeeWXStation),
            ),
            child: ListView(children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 32, top: 16),
                    child: Hero(
                      tag: AddStationPrecheckScreen.heroImageTag,
                      child: Image(
                        image: PrecachedImages.logoFull,
                        width: 200,
                      ),
                    ),
                  ),
                ],
              ),
              AddStationMethodButton(
                context: context,
                iconData: Icons.qr_code_2_rounded,
                description: AppLocalizations.of(context)!.addStationViaQrCodeDesc,
                actionLabel: AppLocalizations.of(context)!.scanQrCode,
                onPressed: () async {
                  await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666',
                    AppLocalizations.of(context)!.cancel,
                    false,
                    ScanMode.QR,
                  ).then(
                    (value) {
                      if (value.compareTo('-1') != 0) {
                        context.read<AddStationPrecheckScreenBloc>().add(RunCheck(url: value));
                      }
                    },
                  );
                },
              ),
              AddStationMethodButton(
                context: context,
                iconData: Icons.share,
                description: AppLocalizations.of(context)!.addStationVialviaUrlDesc,
                actionLabel: AppLocalizations.of(context)!.checkConnection,
                onPressed: Uri.parse(_urlInputController.text).host.isNotEmpty
                    ? () async {
                        context.read<AddStationPrecheckScreenBloc>().add(RunCheck(url: _urlInputController.text));
                      }
                    : null,
                inputWidgetnWidget: PlatformTextFormField(
                  controller: _urlInputController,
                  hintText: 'https://myserver.com/weewx/now',
                  keyboardType: TextInputType.url,
                  onChanged: (value) => setState(() {}),
                ),
              ),
              AddStationMethodButton(
                context: context,
                iconData: Icons.search,
                description: AppLocalizations.of(context)!.addStationVialviaPublicService,
                actionLabel: AppLocalizations.of(context)!.searchStation,
                onPressed: () {
                  showPlatformDialog(
                    context: context,
                    builder: (context) => PlatformAlertDialog(
                      title: Text(AppLocalizations.of(context)!.comingSoon),
                      content: Text(AppLocalizations.of(context)!.weewxnowRegisterComingSoon),
                      actions: [
                        PlatformDialogAction(
                          child: Text(AppLocalizations.of(context)!.close),
                          onPressed: () => context.pop(),
                        )
                      ],
                    ),
                  );
                },
              ),
            ]),
          );
        }),
      ),
    );
  }
}
