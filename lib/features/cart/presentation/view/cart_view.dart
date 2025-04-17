import 'dart:developer';

import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_button.dart';

import 'package:flowery/features/cart/domain/usecases/delete_cart_item_usecase.dart';

import 'package:flowery/features/cart/domain/usecases/update_product_quantity_use_case.dart';

import 'package:flowery/features/cart/presentation/view/widgets/cart_app_bar.dart';
import 'package:flowery/features/cart/presentation/view/widgets/cart_item_widget.dart';
import 'package:flowery/features/cart/presentation/view/widgets/price_row.dart';

import 'package:flowery/features/home/presentation/view/currentUserLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: CartAppBar(cartItems: cartItems),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CurrentUserLocation(),
            SizedBox(
              height: 435.h,
              child:  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                       
                       
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: CartItemWidget(
                            item: item,
                            onDelete: () {
                              cartCubit.getLoggedCart();
                            },
                            cartCubit: cartCubit,
                            deleteCartItemCubit: deleteItemCubit,
                            updateCartCubit: updateCartCubit,
                            id: item.product.id,
                            onQuantityChanged: (value) {
                              updateCartCubit.updateCartItem(
                                cartItemId: item.product.id,
                                request: UpdateProductRequest(quantity: 1),
                              );
                              print('Quantity changed: 1');
                            },
                          ),
                        );
                      },
                    );
            ),
            SizedBox(height: 16.h),
            PriceRow(title: "Sub Total", value: "100\$"),
            PriceRow(title: "Delivery Fee", value: "10\$"),
            Divider(thickness: 1.sp),
            PriceRow(
              title: "Total",
              value: "110\$",
              titleFontWeight: FontWeight.w500,
              valueFontWeight: FontWeight.w500,
              valueColor: PalletsColors.blackBase,
              titleColor: PalletsColors.blackBase,
            ),
            SizedBox(height: 12.h),
            CustomElevatedButton(
              text: "Checkout",
              isPink: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
