import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAllWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ViewAllWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.instance.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
             LocaleKeys.viewAll.tr(),
              style: AppTextStyles.instance.textStyle12.copyWith(
                fontWeight: FontWeight.w500,
                color: PalletsColors.mainColorBase,
                decoration: TextDecoration.underline,
                decorationColor: PalletsColors.mainColorBase,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
