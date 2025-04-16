import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/provider/app_config_provider.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Localization extends StatefulWidget {
  const Localization({super.key});

  @override
  State<Localization> createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  @override
  Widget build(BuildContext context) {
    var appConfigProvider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.local.tr()),

            InkWell(
              onTap: () {
                changeLanguge();
                setState(() {});
              },
              child: Icon(Icons.language_sharp),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }

  void changeLanguge() {
    final appConfigProvider = getIt<AppConfigProvider>();
    final newLang = appConfigProvider.isEn() ? "ar" : "en";
    appConfigProvider.changeCurrentLanguge(newLang);

    // Set the locale in EasyLocalization
    context.setLocale(Locale(newLang));
  }
}
