import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTitleWidget extends StatelessWidget {
  const CategoriesTitleWidget({super.key, required this.category, required this.isSelected});
  final Category category;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final String name = category.name ?? 'Without Name';
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: name),
      textDirection: TextDirection.ltr,
    )..layout(); // here i measure the size
    final double textWidth = textPainter.size.width;
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(
        children: [
          Text(
            name,
            style: AppTextStyles.instance.textStyle16.copyWith(
              color:isSelected ? PalletsColors.mainColorBase : PalletsColors.white70,
            ),
          ),
          Container(
            height: 3.h,
            width: textWidth,
            decoration: BoxDecoration(
              color:isSelected ? PalletsColors.mainColorBase : PalletsColors.white70,
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
