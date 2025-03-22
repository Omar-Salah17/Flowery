import 'dart:async';

import 'package:flowery/core/colors.dart';
import 'package:flowery/core/routes_name.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesName.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalletsColors.lightPink,
      body: Center(
        child: Image.asset("assets/images/Image.png"),
      ),
    );
  }
}
