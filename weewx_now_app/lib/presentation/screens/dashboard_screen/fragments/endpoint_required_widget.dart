import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now/presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';
import 'package:weewx_now/presentation/screens/add_station_precheck_screen/add_station_precheck_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

import 'package:weewx_now/presentation/widgets/precached_images.dart';

class EndpointRequiredWidget extends StatelessWidget {
  const EndpointRequiredWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Hero(
            tag: AddStationPrecheckScreen.heroImageTag,
            child: Image(
              image: precachedLogoFull.image,
              width: [MediaQuery.of(context).size.width * 0.85, 1200].reduce(math.min).toDouble(),
            ),
          ),
          PlatformElevatedButton(
            child: Text(AppLocalizations.of(context)!.addWeeWXStation),
            onPressed: () {
              context.pushNamed<WeewxEndpoint>(AddStationPrecheckScreen.routeName).then((newEndpoint) {
                if (newEndpoint != null) {
                  context.read<CurrentEndpointCubit>().selectEndpoint(newEndpoint);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
