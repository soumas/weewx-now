part of 'endpoint_cubit.dart';

@immutable
sealed class EndpointState {}

final class EndpointInitial extends EndpointState {}

final class NoSelectableEndpointFound extends EndpointState {}

final class EndpointSelected extends EndpointState {}
