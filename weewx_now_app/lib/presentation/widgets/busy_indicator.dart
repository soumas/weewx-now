import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_now/presentation/bloc/busy/busy_cubit.dart';

class BusyIndicator extends StatelessWidget {
  const BusyIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusyCubit, bool>(
      builder: (context, state) {
        return state ? const LinearProgressIndicator() : const SizedBox();
      },
    );
  }
}
