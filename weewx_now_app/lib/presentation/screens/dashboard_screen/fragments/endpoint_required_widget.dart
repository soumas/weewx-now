import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now_app/presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';
import 'package:weewx_now_app/presentation/screens/add_station_screen/add_station_screen.dart';

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
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: const Image(
              image: AssetImage('assets/images/logo_full.png'),
            ),
          ),
          PlatformElevatedButton(
            child: const Text('WeeWX Station hinzufügen'),
            onPressed: () {
              context.pushNamed<WeewxEndpoint>(AddStationScreen.routeName).then((newEndpoint) {
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
