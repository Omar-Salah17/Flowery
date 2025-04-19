import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/route_generator.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/provider/app_config_provider.dart';
import 'package:flowery/core/utils/application_theme.dart';
import 'package:flowery/core/utils/simple_bloc_observer.dart';
import 'package:flowery/features/cart/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:flowery/generated/codegen_loader.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
      fallbackLocale: Locale("_languageCode"),
      assetLoader: CodegenLoader(),
      child: ChangeNotifierProvider(
        create: (_) => getIt<AppConfigProvider>(),
        child: Flowery(),
      ),
    ),
  );
}

class Flowery extends StatefulWidget {
  const Flowery({super.key});

  @override
  State<Flowery> createState() => _FloweryState();
}

class _FloweryState extends State<Flowery> {
  late AppConfigProvider appConfigProvider;

  @override
  Widget build(BuildContext context) {
    var cartCubit = getIt<CartCubit>();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        appConfigProvider = Provider.of<AppConfigProvider>(context);
        return BlocProvider(
          create: (context) => cartCubit,
          child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  initialRoute: RoutesName.initial,
                  onGenerateRoute: RouteGenerator.onGenerator,
                  theme: ApplicationTheme.themeData,
                ),
        );
      },
    );
  }
}
