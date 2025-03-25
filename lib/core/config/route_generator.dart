import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/screens/forget_password.dart';
import 'package:flowery/features/auth/login/presentation/view/screens/login.dart';
import 'package:flowery/features/auth/register/presentation/view/screens/register.dart';
import 'package:flowery/features/splash/view/splash.dart';
import 'package:flutter/material.dart';

import '../../features/cart/presentation/view/cart_view.dart';
import '../../features/catigories/presentation/view/categories_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/layout/Presentation/layout.dart';
import '../../features/profile/presentation/view/profile_view.dart';



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

        case RoutesName.layout:
        return MaterialPageRoute(
          builder: (context) => Layout(),
          settings: Settings,
        );

        case RoutesName.profile:
        return MaterialPageRoute(
          builder: (context) => ProfileView(),
          settings: Settings,
        );

        case RoutesName.cart:
        return MaterialPageRoute(
          builder: (context) => CartView(),
          settings: Settings,
        );

        case RoutesName.categories:
        return MaterialPageRoute(
          builder: (context) => CategoriesView(),
          settings: Settings,
        );

        case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
          settings: Settings,
        );

      default:
        return MaterialPageRoute(builder: (context) => Splash());
    }
  }
}
