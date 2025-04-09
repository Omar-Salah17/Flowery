import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/application_theme.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/config/route_generator.dart';
import 'package:flowery/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  configureDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Flowery());
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
          initialRoute: RoutesName.productsDetails,
          onGenerateRoute: RouteGenerator.onGenerator,
          theme: ApplicationTheme.themeData,
        );
      },
    );
  }
}
