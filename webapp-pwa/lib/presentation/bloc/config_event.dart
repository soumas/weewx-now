part of 'config_bloc.dart';

@immutable
sealed class ConfigEvent {}

class LoadConfigEvent extends ConfigEvent {
  final String endpoint;

  LoadConfigEvent({required this.endpoint});
}
