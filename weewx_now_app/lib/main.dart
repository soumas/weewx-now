import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now_app/injection.dart';
import 'package:weewx_now_app/presentation/state/theme/theme_cubit.dart';
import 'package:weewx_now_app/presentation/routes.dart';
import 'package:weewx_now_app/presentation/theme.dart';

import 'presentation/state/weewx_endpoint/weewx_endpoint_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injection.init();
  await sl.get<ThemeCubit>().init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl.get<ThemeCubit>()),
        BlocProvider(create: (context) => sl.get<WeewxEndpointCubit>()),
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
          localizationsDelegates: const [
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          routerConfig: router,
        ),
      ),
    );

    // final themeMode = context.watch<ThemeCubit>().currentThemeMode;
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routerConfig: router,
    //   theme: themeDataLight,
    //   darkTheme: themeDataDark,
    //   themeMode: themeMode,
    // );
  }
}
