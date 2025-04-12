import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key, required this.cartItems});

  final List<Map<String, dynamic>> cartItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back_ios),
        Text(
          "Cart",
          style: AppTextStyles.instance.textStyle20.copyWith(
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(12, 16, 21, 1),
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          "(${cartItems.length} Items)",
          style: AppTextStyles.instance.textStyle20.copyWith(
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(83, 83, 83, 1),
          ),
        ),
      ],
    );
  }
}
