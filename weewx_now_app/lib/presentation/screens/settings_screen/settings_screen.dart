import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now/presentation/bloc/locale/locale_cubit.dart';
import 'package:weewx_now/presentation/bloc/theme/theme_cubit.dart';
import 'package:weewx_now/presentation/widgets/weewx_now_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String routeName = 'settingsScreen';

  @override
  Widget build(BuildContext context) {
    return WeeWxNowScaffold(
      appBar: PlatformAppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: ListView(
        children: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return PlatformListTile(
                title: Text(AppLocalizations.of(context)!.design),
                trailing: PlatformPopupMenu(
                  options: [
                    PopupMenuOption(label: AppLocalizations.of(context)!.light, onTap: (_) => context.read<ThemeCubit>().setThemeMode(ThemeMode.light)),
                    PopupMenuOption(label: AppLocalizations.of(context)!.dark, onTap: (_) => context.read<ThemeCubit>().setThemeMode(ThemeMode.dark)),
                  ],
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(context.read<ThemeCubit>().currentThemeMode == null
                          ? AppLocalizations.of(context)!.automatic
                          : context.read<ThemeCubit>().currentThemeMode == ThemeMode.light
                              ? AppLocalizations.of(context)!.light
                              : AppLocalizations.of(context)!.dark),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              return PlatformListTile(
                title: Text(AppLocalizations.of(context)!.language),
                trailing: PlatformPopupMenu(
                  options: [
                    PopupMenuOption(label: AppLocalizations.of(context)!.german, onTap: (_) => context.read<LocaleCubit>().setLocale(const Locale('de'))),
                    PopupMenuOption(label: AppLocalizations.of(context)!.english, onTap: (_) => context.read<LocaleCubit>().setLocale(const Locale('en'))),
                  ],
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(context.read<LocaleCubit>().currentLocale.languageCode == 'de'
                          ? AppLocalizations.of(context)!.german
                          : AppLocalizations.of(context)!.english),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
