import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.title,
    this.content,
    this.onPressed,
    this.buttonText,
  });
  final String? title;
  final String? content;
  final void Function()? onPressed;
  final String? buttonText;
  
  @override
  Widget build(BuildContext context) {
    final hasActions = onPressed != null || buttonText != null;
    
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      shadowColor: PalletsColors.mainColorBase,
      backgroundColor: PalletsColors.white50,
      elevation: 10.r,
      title: Text(
        title ?? "",
        style: AppTextStyles.instance.textStyle16.copyWith(
          fontWeight: FontWeight.w500,
          color: PalletsColors.mainColorBase,
        ),
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: hasActions ? 0 : 48.h, 
        ),
        child: Text(
          softWrap: true,
          content ?? '',
          style: AppTextStyles.instance.textStyle16.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: hasActions
          ? [
              TextButton(
                onPressed: onPressed,
                child: Text(
                  buttonText ?? "",
                  style: AppTextStyles.instance.textStyle14.copyWith(
                    color: PalletsColors.mainColorBase,
                  ),
                ),
              ),
            ]
          : null,
    );
  }
}