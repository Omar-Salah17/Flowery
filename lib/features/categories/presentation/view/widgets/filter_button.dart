import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: PalletsColors.mainColorBase,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.tune, size: 20.sp, color: PalletsColors.whiteBase),
          SizedBox(width: 12.w),
          Text(
            LocaleKeys.filter.tr(),
            style: AppTextStyles.instance.textStyle16.copyWith(
              color: PalletsColors.whiteBase,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
