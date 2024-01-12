import 'package:flutter/material.dart';

const Color themeColor1 = Color.fromARGB(200, 7, 16, 19);
const Color themeColor2 = Color.fromARGB(200, 35, 181, 211);
const Color themeColor3 = Color.fromARGB(200, 117, 171, 188);
const Color themeColor4 = Color.fromARGB(200, 162, 174, 187);
const Color themeColor5 = Color.fromARGB(200, 223, 224, 226);

final themeDataLight = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: Colors.transparent,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 36),
    headlineMedium: TextStyle(fontSize: 24),
    headlineSmall: TextStyle(fontSize: 18),
  ),
);

final themeDataDark = ThemeData.dark(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: Colors.transparent,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 36),
    headlineMedium: TextStyle(fontSize: 24),
    headlineSmall: TextStyle(fontSize: 18),
  ),
);
