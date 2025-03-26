import 'package:flowery/core/utils/application_theme.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormFieled extends StatelessWidget {
 final TextEditingController textEditingController;
  final String labelText;
  final String hintText;
 final bool shouldObscureText;
  final String? Function(String?)? validator;

  const CustomTextFormFieled({super.key, required this.textEditingController, required this.labelText, required this.hintText, required this.shouldObscureText, this.validator});

  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      obscureText: shouldObscureText,
      obscuringCharacter: "*",
      style: ApplicationTheme.themeData.textTheme.bodyMedium?.copyWith(
        color: PalletsColors.white70,
      ),
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.error),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),
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
