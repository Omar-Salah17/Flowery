import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/screens/forget_password.dart';
import 'package:flowery/features/auth/login/presentation/view/screens/login.dart';
import 'package:flowery/features/auth/register/presentation/view/screens/register.dart';
import 'package:flowery/features/splash/view/splash.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerator(RouteSettings Settings) {
    switch (Settings.name) {
      case RoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => Splash(),
          settings: Settings,
        );

      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => Login(),
          settings: Settings,
        );

      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => Register(),
          settings: Settings,
        );

      case RoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPassword(),
          settings: Settings,
        );

      default:
        return MaterialPageRoute(builder: (context) => Splash());
    }
  }
}
