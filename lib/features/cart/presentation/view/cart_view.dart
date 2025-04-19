import 'package:flowery/features/cart/presentation/view%20model/cubit/cart_state.dart';
import 'package:flowery/features/cart/presentation/view/widgets/cart_app_bar.dart';
import 'package:flowery/features/cart/presentation/view/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';
import '../../../home/presentation/view/current_user_location.dart';
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

