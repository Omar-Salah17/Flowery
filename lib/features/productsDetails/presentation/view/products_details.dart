import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';
import 'package:flowery/features/productsDetails/domain/useCases/get_product_details_use_case.dart';
import 'package:flowery/features/productsDetails/presentation/viewModel/product_details_cubit/product_details_cubit.dart';
import 'package:flowery/features/productsDetails/presentation/viewModel/product_details_cubit/product_details_states.dart';
import 'package:flowery/features/productsDetails/presentation/widgets/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDetails extends StatefulWidget {
  const ProductsDetails({super.key});

  @override
  State<ProductsDetails> createState() => _ProductsDetails();
}

class _ProductsDetails extends State<ProductsDetails> {
  var viewModel = ProductDetailsCubit(getIt.get<GetProductDetailsUseCase>());

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as Product;
    return BlocProvider(
      create: (context) => viewModel,
      // ..fetchProduct(args.id??'')
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.arrow_back_ios)),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductDetailsError) {
              return Center(child: Text(state.message));
            } else if (state is ProductDetailsSuccess) {
              return ProductDetailsBody();
            }
            return Center(
              child: Text("No data found"),
            );
          },
        ),
      ),
    );
  }
}
