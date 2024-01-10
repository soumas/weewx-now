import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weewx_endpoint_state.dart';

class WeewxEndpointCubit extends Cubit<WeewxEndpointState> {
  WeewxEndpointCubit() : super(WeewxEndpointInitial());
}
