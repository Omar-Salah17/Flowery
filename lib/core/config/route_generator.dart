import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/email_verification_screen.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/forget_password_screen.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/reset_password_screen.dart';
import 'package:flowery/features/auth/login/presentation/view/screens/login.dart';
import 'package:flowery/features/auth/register/presentation/view/screens/register_screen.dart';
import 'package:flowery/features/home/data/models/occaions.dart';
import 'package:flowery/features/home/presentation/view/occasion_screen.dart';
import 'package:flowery/features/splash/view/splash.dart';
import 'package:flutter/material.dart';

import '../../features/cart/presentation/view/cart_view.dart';
import '../../features/categories/presentation/view/categories_screen.dart';
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
          builder: (context) => ForgetPasswordScreen(),
          settings: Settings,
        );
      case RoutesName.emailVerificationScreen:
        return MaterialPageRoute(
          builder: (context) => EmailVerificationScreen(),
          settings: Settings,
        );
      case RoutesName.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
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
          builder: (context) => CategoriesScreen(),
          settings: Settings,
        );

      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
          settings: Settings,
        );
          case RoutesName.occasionScreen:
        return MaterialPageRoute(
          
          builder: (context) => OccasionScreen(),
        
        );

      default:
        return MaterialPageRoute(builder: (context) => Splash());
    }
  }
}
