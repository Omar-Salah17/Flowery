import 'package:flowery/core/config/route_generator.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/application_theme.dart';
import 'package:flowery/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/cart/presentation/view model/cubit/cart_cubit.dart';

void main() {
  configureDependencies();
  Bloc.observer = SimpleBlocObserver();

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<CartCubit>(
            create: (context) => getIt<CartCubit>())],

        child: const Flowery()), // Replace with your main app widget
      
        );
}

class Flowery extends StatelessWidget {
  const Flowery({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.initial,
          onGenerateRoute: RouteGenerator.onGenerator,
          theme: ApplicationTheme.themeData,
        );
      },
    );
  }
}
