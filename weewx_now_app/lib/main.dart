import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/locale/locale_cubit.dart';
import 'package:weewx_now/presentation/bloc/theme/theme_cubit.dart';
import 'package:weewx_now/presentation/routes.dart';
import 'package:weewx_now/presentation/theme.dart';
import 'package:weewx_now/util/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injection.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl.get<ThemeCubit>()..init()),
        BlocProvider(create: (context) => sl.get<LocaleCubit>()..init()),
        BlocProvider(create: (context) => sl.get<CurrentEndpointCubit>()..init()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().currentThemeMode;
    final locale = context.watch<LocaleCubit>().currentLocale;

    return PlatformProvider(
      settings: PlatformSettingsData(
        iosUsesMaterialWidgets: true,
        iosUseZeroPaddingForAppbarPlatformIcon: true,
      ),
      builder: (context) => PlatformTheme(
        themeMode: themeMode,
        materialLightTheme: themeDataLight,
        materialDarkTheme: themeDataDark,
        cupertinoLightTheme: MaterialBasedCupertinoThemeData(materialTheme: themeDataLight),
        cupertinoDarkTheme: MaterialBasedCupertinoThemeData(materialTheme: themeDataDark),
        matchCupertinoSystemChromeBrightness: true,
        builder: (context) => PlatformApp.router(
          locale: locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: kSupportedLocales.map((e) => Locale(e)),
          routerConfig: router,
        ),
      ),
    );
  }
}
