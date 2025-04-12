import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';

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
    var args = ModalRoute.of(context)!.settings.arguments as Product;
    return BlocProvider(
      create:
          (context) =>
              ProductDetailsCubit(getIt.get<GetProductDetailsUseCase>())
                ..fetchProduct(args.id!),

      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsSuccess) {
              return ProductDetailsBody(product: state.product);
            } else if (state is ProductDetailsError) {
              return Center(child: Text(state.message));
            } else {
              return Center(
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


