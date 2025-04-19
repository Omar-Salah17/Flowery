import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/email_verification_screen.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/forget_password_screen.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/reset_password_screen.dart';
import 'package:flowery/features/auth/login/presentation/view/screens/login.dart';
import 'package:flowery/features/auth/register/presentation/view/screens/register_screen.dart';
import 'package:flowery/features/best_seller/presentation/view/best_seller_screen.dart';
import 'package:flowery/features/cart/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:flowery/features/cart/presentation/view/cart_view.dart';
import 'package:flowery/features/categories/presentation/view/categories_screen.dart';
import 'package:flowery/features/home/presentation/view/home_view.dart';
import 'package:flowery/features/layout/Presentation/layout.dart';
import 'package:flowery/features/occasion/presentation/view/occasion_screen.dart';
import 'package:flowery/features/productsDetails/presentation/view/products_details.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/presentation/view/change_password_screen.dart';
import 'package:flowery/features/profile/presentation/view/edit_profile_view.dart';
import 'package:flowery/features/profile/presentation/view/profile_view.dart';
import 'package:flowery/features/profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:flowery/features/splash/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
          settings: settings,
        );

      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
          settings: settings,
        );
      case RoutesName.bestSeller:
        return MaterialPageRoute(
          builder: (context) => const BestSellerScreen(),
          settings: settings,
        );
      case RoutesName.occasionScreen:
        return MaterialPageRoute(
          builder: (context) => const OccasionScreen(),
          settings: settings,
        );

      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => const Register(),
          settings: settings,
        );

      case RoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
          settings: settings,
        );
      case RoutesName.emailVerificationScreen:
        return MaterialPageRoute(
          builder: (context) => const EmailVerificationScreen(),
          settings: settings,
        );
      case RoutesName.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
          settings: settings,
        );

      case RoutesName.layout:
        return MaterialPageRoute(
          builder: (context) => const Layout(),
          settings: settings,
        );

      case RoutesName.profile:
        return MaterialPageRoute(
          builder: (context) => ProfileView(),
          settings: settings,
        );

      case RoutesName.cart:
        return MaterialPageRoute(
          builder: (context) => const CartView(),
          settings: settings,
        );

      case RoutesName.categories:
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
          settings: settings,
        );
      case RoutesName.changePasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ChangePasswordScreen(),
          settings: settings,
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );

      case RoutesName.productsDetails:
        return MaterialPageRoute(
        builder:
        (context) => BlocProvider(
    create: (context) => getIt<CartCubit>(),
    child: const ProductsDetails(),),
          settings: settings,
        );

      case RoutesName.editProfile:
        final userData = settings.arguments! as UserData;
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<EditProfileCubit>(),
                child: EditProfileView(user: userData),
              ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
          settings: settings,
        );
    }
  }
}
