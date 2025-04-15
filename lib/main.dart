import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/route_generator.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/application_theme.dart';
import 'package:flowery/core/utils/simple_bloc_observer.dart';
import 'package:flowery/generated/codegen_loader.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main() async {

//   runApp(
//     EasyLocalization(
//       supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
//       path:
//           'assets/translations', // <-- change the path of the translation files
//       fallbackLocale: Locale('en', 'US'),
//       child: MyApp(),
//     ),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('ar'),
      assetLoader: CodegenLoader(),
      child: Flowery(),
    ),
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
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          initialRoute: RoutesName.localization,
          onGenerateRoute: RouteGenerator.onGenerator,
          theme: ApplicationTheme.themeData,
        );
      },
    );
  }
}
