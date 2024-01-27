part of 'add_endpoint_screen_bloc.dart';

@immutable
sealed class AddEndpointScreenState {}

final class AddEndpointScreenInitial extends AddEndpointScreenState {}

final class CheckingEndpoint extends AddEndpointScreenState {}

final class EndpointCheckSuccess extends AddEndpointScreenState {
  final String endpointUrl;
  final WeeWxConfig settings;
  EndpointCheckSuccess({
    required this.endpointUrl,
    required this.settings,
  });
}

final class EndpointCheckFailed extends AddEndpointScreenState {
  final String endpointUrl;
  final String message;
  EndpointCheckFailed({
    required this.endpointUrl,
    required this.message,
  });
}

final class EndpointAdded extends AddEndpointScreenState {
  final WeewxEndpoint endpoint;
  EndpointAdded({
    required this.endpoint,
  });
}
