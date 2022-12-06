import 'package:flutter/material.dart';
import 'package:gelamor/features/navigation_bottom/screens/navigation_bottom.dart';

import '../../core/utils/app_strings.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const NavigationBottomRoute = '/NavigationBottom';

}

class AppRoutes {
  static String route = '';
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.NavigationBottomRoute:
        return MaterialPageRoute(
          builder: (context) =>NavigationBottom(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
