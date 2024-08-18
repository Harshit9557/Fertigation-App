part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class UpdateThemeEvent extends SettingsEvent {
  const UpdateThemeEvent({required this.themeMode});
  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];
}
