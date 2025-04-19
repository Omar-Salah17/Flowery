import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_button.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/presentation/view/widgets/cart_item_widget.dart';
import 'package:flowery/features/cart/presentation/view/widgets/price_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.cartResponse});
  final CartResponse cartResponse;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: cartResponse.cart!.cartItems!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: CartItemWidget(
                  cartItem: cartResponse.cart!.cartItems![index],
                ),
              );
            },
          ),
        ),
        Spacer(),
        PriceRow(
          title: "Sub Total",
          value: "${cartResponse.cart!.totalPrice} EGP",
        ),
        PriceRow(title: "Delivery Fee", value: "10 EGP"),
        Divider(thickness: 1.sp),
        PriceRow(
          title: "Total",
          value: "${cartResponse.cart!.totalPrice! + 10} EGP",
          titleFontWeight: FontWeight.w500,
          valueFontWeight: FontWeight.w500,
          valueColor: PalletsColors.blackBase,
          titleColor: PalletsColors.blackBase,
        ),
        SizedBox(height: 12.h),
        CustomElevatedButton(text: "Checkout", isPink: true, onTap: () {}),
        SizedBox(height: 10.h),
      ],
    );
  }
}
