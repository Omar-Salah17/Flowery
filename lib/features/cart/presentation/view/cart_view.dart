import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/presentation/view%20model/cubit/cart_state.dart';
import 'package:flowery/features/cart/presentation/view/widgets/cart_app_bar.dart';
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
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 5.w),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartSuccess) {
                return CartAppBar(cartItems: state.cartResponse);
              } else if (state is CartFailure) {
                return Center(child: Text(state.errorMessage));
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const CurrentUserLocation(),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                buildWhen: (previous, current) => current is! CartLoading,
                builder: (context, state) {
                  if (state is CartSuccess) {
                    return CartViewBody(cartResponse: state.cartResponse);
                  } else if (state is CartFailure) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: PalletsColors.mainColorBase,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          value: "${cartResponse.cart!.totalPrice} \EGP",
        ),
        PriceRow(title: "Delivery Fee", value: "10 \EGP"),
        Divider(thickness: 1.sp),
        PriceRow(
          title: "Total",
          value: "${cartResponse.cart!.totalPrice! + 10} \EGP",
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
