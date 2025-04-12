import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //   minimumSize: Size.fromHeight(30.h),
                // ),
                onPressed: () {},
                child: Row(
                  spacing: 8.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_outlined),
                    Text(
                      'Add to cart',
                      style: AppTextStyles.instance.textStyle13.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
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
