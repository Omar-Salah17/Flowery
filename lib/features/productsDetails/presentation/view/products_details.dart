import 'dart:developer';

import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/cart/presentation/view%20model/cubit/cart_cubit.dart';
import 'package:flowery/features/cart/presentation/view%20model/cubit/cart_state.dart';
import 'package:flowery/features/productsDetails/domain/useCases/get_product_details_use_case.dart';
import 'package:flowery/features/productsDetails/presentation/viewModel/product_details_cubit/product_details_cubit.dart';
import 'package:flowery/features/productsDetails/presentation/viewModel/product_details_cubit/product_details_states.dart';
import 'package:flowery/features/productsDetails/presentation/view/widgets/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Product;

    return MultiBlocProvider(
      providers: [

    BlocProvider<CartCubit>(
        create: (context) => getIt<CartCubit>()),
        BlocProvider(
          create: (_) => ProductDetailsCubit(getIt.get<GetProductDetailsUseCase>())
            ..fetchProduct(args.id!),
        ),
        BlocProvider.value(
          value: getIt<CartCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsSuccess) {
              log("product data i will receive in product details ${args.id}");
              return BlocListener<CartCubit, CartState>(
                listener: (context, cartState) {
                  if (cartState is CartSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Product added to cart"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else if (cartState is CartFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Failed to add product to cart"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: ProductDetailsBody(product: state.product),
              );
            } else if (state is ProductDetailsError) {
              return Center(child: Text(state.message));
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
    );
  }
}
