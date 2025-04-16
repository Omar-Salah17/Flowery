import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:flowery/features/cart/presentation/view%20model/add_to_cart_cubit.dart';
import 'package:flowery/features/cart/presentation/view%20model/add_to_cart_states.dart';
import 'package:flowery/features/productsDetails/presentation/viewModel/product_details_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    AddToCartCubit addToCartCubit = AddToCartCubit(getIt<AddToCartUsecase>());
    return GestureDetector(
      onTap: () {
        // await context.read<ProductDetailsCubit>().fetchProduct(product.id!);
        Navigator.pushNamed(
          context,
          RoutesName.productsDetails,
          arguments: product,
        );
      },
      child: Container(
        // height: 229.h,
        width: 163.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: PalletsColors.white70),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: 147.w,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: product.imgCover ?? "",
                    placeholder: (context, url) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: PalletsColors.mainColorBase,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? 'No title',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.instance.textStyle12,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP${product.priceAfterDiscount}",
                          style: AppTextStyles.instance.textStyle14.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          product.price.toString(),
                          style: AppTextStyles.instance.textStyle12.copyWith(
                            fontWeight: FontWeight.w500,
                            color: PalletsColors.white90,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          // '${discountPercentage(product.price!, product.priceAfterDiscount!).toStringAsFixed(0)}%',
                          '${discountPercentage(product.priceAfterDiscount!, product.price!).toStringAsFixed(0)}%',
                          style: AppTextStyles.instance.textStyle12.copyWith(
                            color: PalletsColors.success,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              BlocConsumer<AddToCartCubit, AddToCartState>(
                bloc: addToCartCubit,
                listener: (context, state) {
                  if (state is AddToCartSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Added to cart successfully'),
                      ),
                    );
                  }
                  if (state is AddToCartFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Failed to add to cart: ${state.errorMessage}'),
                      ),
                    );
                  }
                  
                },
                builder: (context, state) {
                  return ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //   minimumSize: Size.fromHeight(30.h),
                    // ),
                    onPressed: () {
                      addToCartCubit.addToCart(addProductRequest: AddProductRequest(
                        productId: product.id,
                        quantity: product.quantity,
                      ));
                    },
                    child: Row(
                      spacing: 8.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined),
                      state is AddToCartLoading ? CircularProgressIndicator(color: PalletsColors.mainColorBase,) :
                      state is AddToCartSuccess ? Icon(Icons.check)
                      :  Text(
                          'Add to cart',
                          style: AppTextStyles.instance.textStyle13.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double discountPercentage(int priceAfterDiscount, int originalPrice) {
  if (originalPrice <= 0 || priceAfterDiscount <= 0) return 0.0;
  double discount = (priceAfterDiscount / originalPrice) * 100;
  return discount;
}
