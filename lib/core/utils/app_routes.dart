import 'package:flutter/material.dart';
import 'package:gelamor/features/navigation_bottom/screens/navigation_bottom.dart';

import '../../core/utils/app_strings.dart';
import '../../features/contact_us/presentation/screens/contact_us.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const NavigationBottomRoute = '/NavigationBottom';
  // static const String languageRoute = '/language';
  static const String contactUsScreenRoute = '/contactUsScreen';

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
      case Routes.contactUsScreenRoute:
        return MaterialPageRoute(
          builder: (context) => ContactUsScreen(),
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
