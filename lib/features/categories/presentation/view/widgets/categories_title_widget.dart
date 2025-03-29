import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTitleWidget extends StatelessWidget {
  const CategoriesTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w),
      child: Column(
        children: [
          Text(
            'Hand Bouquet',
            style: AppTextStyles.instance.textStyle16.copyWith(
              color: PalletsColors.white70,
            ),
          ),
          Container(
            height: 3.h,
            width: 105.w,
            decoration: BoxDecoration(
              color: PalletsColors.white70,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100.r),
                topRight: Radius.circular(100.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
