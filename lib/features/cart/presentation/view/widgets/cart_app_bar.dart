import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key, required this.cartItems});

  final CartResponse cartItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        Text(
          LocaleKeys.cart.tr(),
          style: AppTextStyles.instance.textStyle20.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(12, 16, 21, 1),
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          "(${cartItems.numOfCartItems} ${LocaleKeys.items.tr()})",
          style: AppTextStyles.instance.textStyle20.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(83, 83, 83, 1),
          ),
        ),
      ],
    );
  }
}
