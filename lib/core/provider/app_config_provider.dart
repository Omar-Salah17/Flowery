import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  String currentLanguge = "en";

  changeCurrentLanguge(String newLanguge) {
    if (currentLanguge == newLanguge) return;
    currentLanguge = newLanguge;
    notifyListeners();
  }

  String getLocal() {
    return currentLanguge;
  }

  bool isEn() {
    return currentLanguge == "en";
  }
}
