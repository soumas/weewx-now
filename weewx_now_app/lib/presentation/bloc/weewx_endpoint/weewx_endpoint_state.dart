part of 'weewx_endpoint_cubit.dart';

@immutable
sealed class WeewxEndpointState {}

final class WeewxEndpointInitial extends WeewxEndpointState {}

final class NoSelectableEndpointFound extends WeewxEndpointState {}

final class WeewxEndpointSelection extends WeewxEndpointState {
  final WeewxEndpoint endpoint;
  WeewxEndpointSelection({
    required this.endpoint,
  });

  WeewxEndpointSelection copyWith({
    WeewxEndpoint? endpoint,
  }) {
    return WeewxEndpointSelection(
      endpoint: endpoint ?? this.endpoint,
    );
  }
}
