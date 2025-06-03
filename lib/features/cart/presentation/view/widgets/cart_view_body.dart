import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_button.dart';
import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
import 'package:flowery/core/utils/widgets/custom_error_widget.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/presentation/view/widgets/cart_item_widget.dart';
import 'package:flowery/features/cart/presentation/view/widgets/price_row.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.cartResponse});
  final CartResponse cartResponse;

  @override
  Widget build(BuildContext context) {
    List cartItems = cartResponse.cart!.cartItems ?? [];
    return cartItems.isEmpty
        ? Center(
          child: CustomErrorWidget(
            title: LocaleKeys.cartIsempty.tr(),
            content: LocaleKeys.startShoppingNow.tr(),
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.layout);
            },
          ),
        )
        : Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: CartItemWidget(cartItem: cartItems[index]),
                  );
                },
              ),
            ),
            const Spacer(),
            PriceRow(
              title: LocaleKeys.subTotal.tr(),
              value: "${cartResponse.cart!.totalPrice} ${LocaleKeys.egp.tr()}",
            ),
            PriceRow(
              title: LocaleKeys.deliveryFee.tr(),
              value: "10 ${LocaleKeys.egp.tr()}",
            ),
            Divider(thickness: 1.sp),
            PriceRow(
              title: LocaleKeys.total.tr(),
              value:
                  "${cartResponse.cart!.totalPrice! + 10} ${LocaleKeys.egp.tr()}",
              titleFontWeight: FontWeight.w500,
              valueFontWeight: FontWeight.w500,
              valueColor: PalletsColors.blackBase,
              titleColor: PalletsColors.blackBase,
            ),
            SizedBox(height: 12.h),
            CustomElevatedButton(
              text: LocaleKeys.checkout.tr(),
              isPink: true,
              onTap: () {
                log('cartResponse ===${cartResponse.cart!.totalPrice}');
                if (cartResponse.cart!.cartItems!.isNotEmpty) {
                  Navigator.pushNamed(
                    context,
                    RoutesName.checkOut,
                    arguments: cartResponse,
                  );
                } else {
                  showErrorSnackBar(context, 'Cart is empty');
                }
              },
            ),
            SizedBox(height: 10.h),
          ],
        );
  }
}
