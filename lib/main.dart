import 'package:flowery/core/application_theme.dart';
import 'package:flowery/core/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Flowery());
}

class Flowery extends StatelessWidget {
  const Flowery({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            onGenerateRoute: RouteGenerator.onGenerator,
            theme: ApplicationTheme.themeData,
          );
        });
  }
}
