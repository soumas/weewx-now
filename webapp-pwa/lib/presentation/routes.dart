import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_pwa/presentation/screens/home_screen.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        final endpoint = state.uri.queryParameters['endpoint'];
        return HomeScreen(url: endpoint);
      },
    ),
  ],
);
