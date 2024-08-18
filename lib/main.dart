import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/my_app.dart';

// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  servicesLocator();

  // Run the app
  runApp(const FertigationApp());
}

void servicesLocator() {
  // getIt.registerLazySingleton<ChatRepository>(() =>
  //     ChatRepository()); // Registering ChatRepository as a lazy singleton for ChatBloc
}
