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
  final Widget? suffix;
  final bool? readOnly;
  final Function(String)? onChanged;

  const CustomTextFormFieled({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.hintText,
    required this.shouldObscureText,
    this.validator,
    this.suffix,
    this.readOnly,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      validator: validator,
      controller: textEditingController,
      obscureText: shouldObscureText,
      obscuringCharacter: "*",
      style: ApplicationTheme.themeData.textTheme.bodyMedium?.copyWith(
        color: PalletsColors.white70,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.r),
        suffix: suffix,

        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.error),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.error),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: PalletsColors.gray),
        ),
        labelText: labelText,
        labelStyle: ApplicationTheme.themeData.textTheme.bodySmall?.copyWith(
          color: PalletsColors.white90,
        ),
        hintText: hintText,
        hintStyle: ApplicationTheme.themeData.textTheme.bodyLarge?.copyWith(
          color: PalletsColors.white70,
        ),
      ),
    );
  }
}
