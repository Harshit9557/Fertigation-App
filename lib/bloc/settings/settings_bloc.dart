import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<UpdateThemeEvent>(_updateTheme);
  }
  void _updateTheme(UpdateThemeEvent event, Emitter<SettingsState> emit) {
    // Do not perform any work if new and old ThemeMode are identical
    // if (state.themeMode == event.themeMode) {
    //   return;
    // } else {

    // }
    emit(state.copyWith(themeMode: event.themeMode));

    //settingsController.updateThemeMode(event.themeMode);
  }
}
