import 'package:flowery/core/config/application_theme.dart';
import 'package:flowery/core/config/colors.dart';
import 'package:flowery/core/config/validator.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieled extends StatelessWidget {
  TextEditingController textEditingController;
  String labelText;
  String hintText;
  bool shouldObscureText;
  Validator validator;
  CustomTextFormFieled({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.hintText,
    required this.shouldObscureText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: shouldObscureText,
      obscuringCharacter: "*",
      style: ApplicationTheme.themeData.textTheme.bodyMedium?.copyWith(
        color: PalletsColors.white70,
      ),

      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),
        labelText: labelText,
        labelStyle: ApplicationTheme.themeData.textTheme.bodySmall,

        hintText: hintText,

        hintStyle: ApplicationTheme.themeData.textTheme.bodyMedium?.copyWith(
          color: PalletsColors.white70,
        ),
      ),
    );
  }
}
