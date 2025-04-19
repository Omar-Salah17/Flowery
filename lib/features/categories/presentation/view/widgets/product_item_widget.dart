import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/presentation/view%20model/cubit/cart_state.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cart/presentation/view model/cubit/cart_cubit.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesName.productsDetails,
          arguments: product,
        );
      },
      child: Container(
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
                      product.title ?? LocaleKeys.noTitle.tr(),
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.instance.textStyle12,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.egp.tr(),
                          style: AppTextStyles.instance.textStyle14.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${product.priceAfterDiscount}",
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
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final isLoading =
                      state is CartLoading && state.productId == product.id;
                  final isSuccess =
                      state is CartSuccess && state.productId == product.id;
                  final isFailure =
                      state is CartFailure && state.productId == product.id;

                  // عرض SnackBar لحالة النجاح
                  if (isSuccess) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Added to cart successfully'),
                        ),
                      );
                      context.read<CartCubit>().resetCartState();
                    });
                  }

                  // عرض SnackBar لحالة الفشل
                  if (isFailure) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.errorMessage),
                        ),
                      );
                      context.read<CartCubit>().resetCartState();
                    });
                  }

                  return ElevatedButton(
                    onPressed:
                        isLoading
                            ? null
                            : () {
                              context.read<CartCubit>().addToCart(
                                AddProductRequest(
                                  productId: product.id,
                                  quantity: 1,
                                ),
                              );
                            },
                    child:
                        isLoading
                            ? SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                color: PalletsColors.mainColorBase,
                              ),
                            )
                            : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart_outlined, size: 18),
                                SizedBox(width: 6),
                                Text(
                                  'Add to cart',
                                  style: AppTextStyles.instance.textStyle13
                                      .copyWith(fontWeight: FontWeight.w500),
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
