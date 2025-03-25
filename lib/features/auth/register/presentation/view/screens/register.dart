import 'package:flowery/core/helper/spacing.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title:   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back_ios),
          horizontalSpace(10),
            Text('Sign Up', style: text.titleMedium,),
          ],
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
