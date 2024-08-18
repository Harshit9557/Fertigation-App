import 'dart:async'; // Importing dart:async for asynchronous operations

import 'package:fertigation/config/routes/routes_name.dart'; // Importing routes names for navigation
import 'package:fertigation/services/session/session_controller.dart'; // Importing session controller for managing user session
import 'package:flutter/material.dart'; // Importing Flutter material library

/// A class containing services related to the splash screen.
class SplashServices {
  /// Checks authentication status and navigates accordingly.
  ///
  /// Takes a [BuildContext] as input and navigates to the home screen if the user is authenticated,
  /// otherwise navigates to the login screen after a delay of 2 seconds.
  void checkAuthentication(BuildContext context) async {
    SessionController().getUserFromPreference().then((value) async {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.tabBarRoute, (route) => false),
      );
      // if (SessionController.isLogin ?? false) {
      //   Timer(
      //     const Duration(seconds: 2),
      //     () => Navigator.pushNamedAndRemoveUntil(
      //         context, RoutesName.tabBarRoute, (route) => false),
      //   );
      // } else {
      //   Timer(
      //     const Duration(seconds: 2),
      //     () => Navigator.pushNamedAndRemoveUntil(
      //         context, RoutesName.loginRoute, (route) => false),
      //   );
      // }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.loginRoute, (route) => false),
      );
    });
  }
}
