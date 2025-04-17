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
              onTap: () => _showLanguageBottomSheet(context),
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

    context.setLocale(Locale(newLang));
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('English'),
              onTap: () {
                _changeLanguage(context, 'en');
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('العربية'),
              onTap: () {
                _changeLanguage(context, 'ar');
              },
            ),
          ],
        );
      },
    );
  }

  void _changeLanguage(BuildContext context, String newLang) {
    final appConfigProvider = getIt<AppConfigProvider>();

    if (appConfigProvider.currentLanguge != newLang) {
      appConfigProvider.changeCurrentLanguge(newLang);
      context.setLocale(Locale(newLang));
    }

    Navigator.pop(context);
  }
}
