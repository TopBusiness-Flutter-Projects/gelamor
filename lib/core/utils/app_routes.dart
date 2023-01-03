import 'package:flutter/material.dart';
import 'package:gelamor/features/navigation_bottom/screens/navigation_bottom.dart';

import '../../core/utils/app_strings.dart';
import '../../features/contact_us/presentation/screens/contact_us.dart';
import '../../features/packages/presentation/screens/all_package_screen.dart';
import '../../features/profile/presentation/screens/profile.dart';
import '../../features/registeration/presentation/screens/check_code.dart';
import '../../features/registeration/presentation/screens/forget_password.dart';
import '../../features/registeration/presentation/screens/login.dart';
import '../../features/registeration/presentation/screens/new_password.dart';
import '../../features/registeration/presentation/screens/register.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/weight_lose/presentation/screens/weight_lose_result_screen.dart';
import '../../features/weight_lose/presentation/screens/weight_lose_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const NavigationBottomRoute = '/NavigationBottom';
  static const String registerRoute = '/register';
  static const String loginRoute = '/login';
  static const String forgetPasswordRoute = '/forget_password';
  static const String checkCodeRoute = '/check_code';
  static const String newPasswordRoute = '/new_password';
  static const String contactUsScreenRoute = '/contactUsScreen';
  static const String weightLoseScreenRoute = '/weightLoseScreen';
  static const String weightLoseResultScreenRoute = '/weightLoseResultScreen';
  static const String allPackagesScreensRoute = '/allPackagesScreens';
  static const String profileRoute = '/Profile';
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
          builder: (context) => NavigationBottom(),
        );
      case Routes.contactUsScreenRoute:
        return MaterialPageRoute(
          builder: (context) => ContactUsScreen(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
        );
      case Routes.checkCodeRoute:
        return MaterialPageRoute(
          builder: (context) => CheckCodeScreen(),
        );
      case Routes.newPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => NewPassword(),
        );
      case Routes.weightLoseScreenRoute:
        return MaterialPageRoute(
          builder: (context) => WeightLoseScreen(),
        );
      case Routes.weightLoseResultScreenRoute:
        return MaterialPageRoute(
          builder: (context) => WeightLoseResultScreen(),
        );
      case Routes.allPackagesScreensRoute:
        return MaterialPageRoute(
          builder: (context) => AllPackagesScreens(),
        );
      case Routes.profileRoute:
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(),
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
