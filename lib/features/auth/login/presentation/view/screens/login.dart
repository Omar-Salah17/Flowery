import 'package:flowery/core/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Expanded(
              child: FilledButton(onPressed: () {}, child: Text("data")))),
    );
  }
}
