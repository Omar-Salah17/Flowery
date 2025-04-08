import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: PalletsColors.success,
      duration: Duration(seconds: 3),
    ),
  );
}

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: PalletsColors.error,
      duration: Duration(seconds: 3),
    ),
  );
}
