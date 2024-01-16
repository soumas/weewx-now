import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint_entity.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/main_screen/main_screen_bloc.dart';
import 'package:weewx_now/presentation/screens/add_endpoint_screen/add_endpoint_screen.dart';
import 'package:weewx_now/presentation/screens/main_screen/fragments/main_screen_data_widget.dart';
import 'package:weewx_now/presentation/widgets/responsive_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.initialEndpoint});

  static const String routeName = 'mainScreen';
  final String? initialEndpoint;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final mainScreenBloc = sl.get<MainScreenBloc>();

  @override
  void initState() {
    super.initState();
    mainScreenBloc.add(InitMainScreen(initialEndpoint: widget.initialEndpoint));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainScreenBloc,
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocListener<MainScreenBloc, MainScreenState>(
            listener: (context, state) {
              if (state is EndpointChanged) {
                mainScreenBloc
                    .add(LoadMainScreenData(endpoint: state.endpoint));
              }
              if (state is NewInitialEndpoint) {
                _addNewEndpoint(context, state.endpoint);
              }
            },
            child: BlocBuilder<MainScreenBloc, MainScreenState>(
              builder: (context, state) {
                if (state is NoEndpointAvailable) {
                  return ResponsiveContainer(
                    child: Column(
                      children: [
                        const Text('no endpoint available'),
                        ElevatedButton(
                          onPressed: () => _addNewEndpoint(context, null),
                          child: const Text('add endpoint'),
                        ),
                      ],
                    ),
                  );
                } else if (state is MainScreenData) {
                  return const MainScreenDataWidget();
                } else if (state is LoadingMainScreenData) {
                  return const Center(
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator()));
                } else {
                  return kDebugMode ? Text(state.toString()) : const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  _addNewEndpoint(BuildContext context, WeewxEndpointEntity? endpoint) {
    return context
        .pushNamed(AddEndpointScreen.routeName, extra: endpoint)
        .then((value) {
      if (value != null) {
        // user has added new endpoint - let's use it now
        mainScreenBloc
            .add(ChangeEndpoint(endpoint: value as WeewxEndpointEntity));
      } else {
        // user has cancelled the add new endpoint process
        mainScreenBloc.add(InitMainScreen(initialEndpoint: null));
      }
    });
  }
}
