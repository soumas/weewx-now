import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_pwa/presentation/screens/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
