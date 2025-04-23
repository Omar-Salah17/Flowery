import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/categories/presentation/view/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceSortOptionTile extends StatelessWidget {
  final String label;
  final PriceSortOptions value;
  final PriceSortOptions groupValue;
  final ValueChanged<PriceSortOptions?> onChanged;

  const PriceSortOptionTile({
    Key? key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.instance.textStyle16),
            RadioTheme(
              data: RadioThemeData(
                fillColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => PalletsColors.mainColorBase,
                ),
              ),
              child: Radio<PriceSortOptions>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: PalletsColors.mainColorBase,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
