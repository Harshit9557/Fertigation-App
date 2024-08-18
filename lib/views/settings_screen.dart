import 'package:fertigation/bloc/settings/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            // Glue the SettingsController to the theme selection DropdownButton.
            //
            // When a user selects a theme from the dropdown list, the
            // SettingsController is updated, which rebuilds the MaterialApp.
            child: DropdownButton<ThemeMode>(
              // Read the selected themeMode from the controller
              value: state.themeMode,
              // Call the updateThemeMode method any time the user selects a theme.
              onChanged: (value) {
                context
                    .read<SettingsBloc>()
                    .add(UpdateThemeEvent(themeMode: value!));
              },
              items: [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text(
                      '${AppLocalizations.of(context)!.system} ${AppLocalizations.of(context)!.theme}'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text(
                      '${AppLocalizations.of(context)!.light} ${AppLocalizations.of(context)!.theme}'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text(
                      '${AppLocalizations.of(context)!.dark} ${AppLocalizations.of(context)!.theme}'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
