import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/email_verification_screen.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/forget_password_screen.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/reset_password_screen.dart';
import 'package:flowery/features/auth/login/presentation/view/screens/login.dart';
import 'package:flowery/features/auth/register/presentation/view/screens/register_screen.dart';
import 'package:flowery/features/best_seller/presentation/view/best_seller_screen.dart';
import 'package:flowery/features/cart/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:flowery/features/occasion/presentation/view/occasion_screen.dart';
import 'package:flowery/features/productsDetails/presentation/view/products_details.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/presentation/view/change_password_screen.dart';
import 'package:flowery/features/profile/presentation/view/edit_profile_view.dart';

import 'package:flowery/features/splash/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cart/presentation/view/cart_view.dart';
import '../../features/categories/presentation/view/categories_screen.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/layout/Presentation/layout.dart';

import '../../features/profile/presentation/view/profile_view.dart';
import '../../features/profile/presentation/view_model/edit_profile_cubit.dart';
import '../di/di.dart';

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
      case RoutesName.bestSeller:
        return MaterialPageRoute(
          builder: (context) => BestSellerScreen(),
          settings: Settings,
        );
      case RoutesName.occasionScreen:
        return MaterialPageRoute(
          builder: (context) => OccasionScreen(),
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
      case RoutesName.changePasswordScreen:
        return MaterialPageRoute(
          builder: (context) => ChangePasswordScreen(),
          settings: Settings,
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
          settings: Settings,
        );

      case RoutesName.productsDetails:
        return MaterialPageRoute(
        builder:
        (context) => BlocProvider(
    create: (context) => getIt<CartCubit>(),
    child: ProductsDetails(),),
          settings: Settings,
        );

      case RoutesName.editProfile:
        final userData = Settings.arguments as UserData;
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<EditProfileCubit>(),
                child: EditProfileView(user: userData),
              ),
          settings: Settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Splash(),
          settings: Settings,
        );
    }
  }
}
