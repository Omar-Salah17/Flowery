import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
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
            SizedBox(
              height: 131.h,
              width: 147.w,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    "https://flower.elevateegy.com/uploads/8ee8e389-da6a-4371-8b13-5e35fcca16c6-image_one.png",
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
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Red roses', style: AppTextStyles.instance.textStyle12),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP 600",
                        style: AppTextStyles.instance.textStyle14.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '800',
                        style: AppTextStyles.instance.textStyle12.copyWith(
                          fontWeight: FontWeight.w500,
                          color: PalletsColors.white90,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '20%',
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
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(30.h),
              ),
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
    );
  }
}
