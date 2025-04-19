import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBestSeller extends StatelessWidget {
  const HomeBestSeller({super.key, required this.product});
 final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (context, index) {
          final item = product[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.productsDetails,
                  arguments: product[index],
                );
              },
              child: SizedBox(
                width: 130.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      height: 160.h,
                      width: 140.w,
                      fit: BoxFit.cover,
                      imageUrl: item.imgCover!,
                      progressIndicatorBuilder:
                          (context, url, progress) => Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                              color: PalletsColors.mainColorBase,
                            ),
                          ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      item.title!,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.instance.textStyle12.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(12, 16, 21, 1),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          "${item.price} EGP",
                          style: AppTextStyles.instance.textStyle14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(12, 16, 21, 1),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
