import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Localization extends StatefulWidget {
  const Localization({super.key});

  @override
  State<Localization> createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("appTitle".tr()),
            InkWell(
              onTap: () {
                changeLanguge();
                setState(() {});
              },
              child: Icon(Icons.language_sharp),
            ),
          ],
        ),
      ),
    );
  }

  void changeLanguge() {
    if (context.locale == Locale("en")) {
      context.setLocale(Locale("ar"));
    } else {
      context.setLocale(Locale("en"));
    }
  }
}
