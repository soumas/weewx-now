import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_pwa/domain/entities/endpoint/weewx_endpoint_entity.dart';
import 'package:weewx_pwa/presentation/screens/add_endpoint_screen/add_endpoint_screen.dart';
import 'package:weewx_pwa/presentation/screens/main_screen/main_screen.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        final endpoint = state.uri.queryParameters['endpoint'];
        return MainScreen(initialEndpoint: endpoint);
      },
    ),
    GoRoute(
        path: '/${AddEndpointScreen.routeName}',
        name: AddEndpointScreen.routeName,
        builder: (context, state) {
          return AddEndpointScreen(
            endpointSuggestion: state.extra as WeewxEndpointEntity?,
          );
        })
  ],
);
