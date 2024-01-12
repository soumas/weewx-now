part of 'add_endpoint_screen_bloc.dart';

@immutable
sealed class AddEndpointScreenEvent {}

class CheckEndpoint extends AddEndpointScreenEvent {
  final String endpointUrl;
  CheckEndpoint({
    required this.endpointUrl,
  });
}

class AddEndpoint extends AddEndpointScreenEvent {
  final String name;
  final String url;
  AddEndpoint({
    required this.name,
    required this.url,
  });
}
