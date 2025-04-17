import 'package:flowery/features/cart/presentation/view/widgets/cart_item_widget.dart';
import 'package:flowery/features/cart/presentation/view/widgets/price_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../home/presentation/view/currentUserLocation.dart';
import '../view model/cubit/cart_cubit.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getUserCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: Text("Cart"),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartSuccess) {
            final cartItems = state.cartResponse.cart!.cartItems;

            return Column(
              children: [
                CurrentUserLocation(),
                SizedBox(
                  height: 435.h,
                  child: ListView.builder(
                    itemCount: cartItems!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: CartItemWidget(cartItem: cartItems[index]),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                PriceRow(
                    title: "Sub Total",
                    value: "${state.cartResponse.cart!.totalPrice}\$"),
                PriceRow(title: "Delivery Fee", value: "10\$"),
                Divider(thickness: 1.sp),
                PriceRow(
                  title: "Total",
                  value: "${state.cartResponse.cart!.totalPrice! + 10}\$",
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
            );
          }

          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartFailure) {
            return Center(child: Text(state.errorMessage));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
