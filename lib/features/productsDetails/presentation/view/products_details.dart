import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/productsDetails/domain/useCases/get_product_details_use_case.dart';
import 'package:flowery/features/productsDetails/presentation/viewModel/product_details_cubit/product_details_cubit.dart';
import 'package:flowery/features/productsDetails/presentation/widgets/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDetails extends StatefulWidget {
  const ProductsDetails({super.key});

  @override
  State<ProductsDetails> createState() => _ProductsDetails();
}

class _ProductsDetails extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductDetailsCubit(getIt.get<GetProductDetailsUseCase>()),
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.arrow_back_ios)),
        body: ProductDetailsBody(),
      ),
    );
  }
}
