import 'dart:async';

import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/core/utils/services/secure_sotrage_service.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SecureStorageService storageService = SecureStorageService();

  @override
  void initState() {
    checkAuth();
    super.initState();
  }

  checkAuth() async {
    final token = await storageService.readSecureData(Constants.userToken);
    Timer(Duration(seconds: 2), () {
      if (token != null) {
        Navigator.pushReplacementNamed(context, RoutesName.layout);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalletsColors.lightPink,
      body: Center(child: Image.asset("assets/images/flower.jpeg")),
    );
  }
}
