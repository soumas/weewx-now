import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now_app/presentation/screens/dashboard_screen/dashboard_screen.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: DashboardScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardScreen();
      },
    ),
  ],
);
