import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Screen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
  }
}