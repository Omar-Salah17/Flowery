import 'dart:developer';

import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_button.dart';
import 'package:flowery/features/cart/domain/usecases/get_logged_cart_usecase.dart';
import 'package:flowery/features/cart/presentation/view%20model/get%20logged%20cart%20view%20model/get_logged_cart_cubit.dart';
import 'package:flowery/features/cart/presentation/view%20model/get%20logged%20cart%20view%20model/get_logged_cart_states.dart';
import 'package:flowery/features/cart/presentation/view/widgets/cart_app_bar.dart';
import 'package:flowery/features/cart/presentation/view/widgets/cart_item_widget.dart';
import 'package:flowery/features/cart/presentation/view/widgets/price_row.dart';

import 'package:flowery/features/home/presentation/view/currentUserLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<Map<String, dynamic>> cartItems = [
    {
      'title': 'Red roses',
      'subtitle': '15 Pink Rose Bouquet',
      'price': 'EGP 600',
      'image': 'assets/images/Image.png',
    },
    {
      'title': 'Sunflowers',
      'subtitle': '10 Bright Sunflowers',
      'price': 'EGP 450',
      'image': 'assets/images/Image.png',
    },
    {
      'title': 'Mixed Bouquet',
      'subtitle': 'Roses & Lilies',
      'price': 'EGP 700',
      'image': 'assets/images/Image.png',
    },
    {
      'title': 'Mixed Bouquet',
      'subtitle': 'Roses & Lilies',
      'price': 'EGP 700',
      'image': 'assets/images/Image.png',
    },
  ];

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
        child: BlocProvider(
          create:
              (context) =>
                  GetLoggedCartCubit(getIt.get<GetLoggedCartUsecase>())
                    ..getLoggedCart(),
          child: Column(
            children: [
              CurrentUserLocation(),
              SizedBox(
                height: 435.h,
                child: BlocBuilder<GetLoggedCartCubit, GetLoggedCartState>(
                  builder: (context, state) {
                    log("inside builder");
                    if (state is GetLoggedCartLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is GetLoggedCartFailure) {
                      return Center(
                        child: Text("Error: ${state.errorMessage}"),
                      );
                    } else if (state is GetLoggedCartSuccess) {
                      return ListView.builder(
                        itemCount: state.response.numOfCartItems,
                        itemBuilder: (context, index) {
                          final item = state.response.cart.cartItems[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: CartItemWidget(
                              item: item,
                              onDelete: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },
                              onQuantityChanged: (value) {
                                print('Quantity changed: $value');
                              },
                            ),
                          );
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
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
      ),
    );
  }
}
