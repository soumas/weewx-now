import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now/presentation/screens/add_station_precheck_screen/add_station_precheck_screen.dart';
import 'package:weewx_now/presentation/screens/dashboard_screen/dashboard_screen.dart';
import 'package:weewx_now/presentation/screens/my_stations_sceen/my_stations_screen.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: DashboardScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardScreen();
      },
    ),
    GoRoute(
      path: '/stations',
      name: MyStationsScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const MyStationsScreen();
      },
    ),
    GoRoute(
      path: '/stations/add',
      name: AddStationPrecheckScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const AddStationPrecheckScreen();
      },
    ),
  ],
);
