import 'routes.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.tabBarRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TabBarScreen());

      case RoutesName.settingsRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SettingsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No route defined'),
              ),
            );
          },
        );
    }
  }
}
