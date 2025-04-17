import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  final String title;
  final String value;
  final FontWeight? titleFontWeight;
  final FontWeight? valueFontWeight;
  final Color? titleColor;
  final Color? valueColor;

  const PriceRow({
    super.key,
    required this.title,
    required this.value,
    this.titleFontWeight,
    this.valueFontWeight,
    this.titleColor,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.instance.textStyle16.copyWith(
            fontWeight: titleFontWeight ?? FontWeight.w400,
            color: titleColor ?? PalletsColors.white90,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.instance.textStyle16.copyWith(
            fontWeight: valueFontWeight ?? FontWeight.w400,
            color: valueColor ?? PalletsColors.white90,
          ),
        ),
      ],
    );
  }
}
