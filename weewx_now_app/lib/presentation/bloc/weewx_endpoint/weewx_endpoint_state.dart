part of 'weewx_endpoint_cubit.dart';

@immutable
sealed class WeewxEndpointState {}

final class WeewxEndpointInitial extends WeewxEndpointState {}

final class NoSelectableEndpointFound extends WeewxEndpointState {}

final class WeewxEndpointSelected extends WeewxEndpointState {}
