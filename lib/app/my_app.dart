import 'app.dart';

/// The Widget that configures your application.
class FertigationApp extends StatelessWidget {
  const FertigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingsBloc()),
      ],
      child: ScreenUtilInit(builder: (context, _) {
        return BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return MaterialApp(
              //Set this false to hide the debug banner
              debugShowCheckedModeBanner: false,
              // Providing a restorationScopeId allows the Navigator built by the
              // MaterialApp to restore the navigation stack when a user leaves and
              // returns to the app after it has been killed while running in the
              // background.
              restorationScopeId: 'app',

              // Provide the generated AppLocalizations to the MaterialApp. This
              // allows descendant Widgets to display the correct translations
              // depending on the user's locale.
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],

              // Use AppLocalizations to configure the correct application title
              // depending on the user's locale.
              //
              // The appTitle is defined in .arb files found in the localization
              // directory.
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,

              // Define a light and dark color theme. Then, read the user's
              // preferred ThemeMode (light, dark, or system default) from the
              // SettingsController to display the correct theme.

              theme: lightTheme, // Setting light theme
              darkTheme: darkTheme, // Setting dark theme
              themeMode:
                  state.themeMode, // Setting theme mode to system theme mode

              // Define a function to handle named routes in order to support
              // Flutter web url navigation and deep linking.
              initialRoute: RoutesName.tabBarRoute,
              onGenerateRoute: AppRoutes.generateRoute,
            );
          },
        );
      }),
    );
  }
}
