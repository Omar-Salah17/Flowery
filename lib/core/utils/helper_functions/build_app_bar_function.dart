import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({required String title, void Function()? onPressed}) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.instance.textStyle20.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      titleSpacing: 0,
      leading: IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back_ios),
      ),
    );
  }
