part of 'config_bloc.dart';

@immutable
sealed class ConfigState {}

final class ConfigInitial extends ConfigState {}

final class ConfigLoading extends ConfigState {}

final class ConfigLoaded extends ConfigState {
  final ConfigEntity config;
  ConfigLoaded({
    required this.config,
  });
}
