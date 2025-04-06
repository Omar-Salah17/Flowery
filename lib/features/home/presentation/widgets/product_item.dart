import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,        
      ),
    width: 163.w,
      height: 250.h,
      decoration: BoxDecoration(
        border: Border.all(color: PalletsColors.gray, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/Image.png',
              width: 147.w,
              height: 131.h,
            ),
            verticalSpace(10),
            Text(
              'Red Roses',
              style: AppTextStyles.instance.textStyle12.copyWith(
                color: PalletsColors.blackBase,
              ),
            ),
        // verticalSpace(10),
            Text(   
              'EGP 20.00',
              style: AppTextStyles.instance.textStyle14.copyWith(
                color: PalletsColors.blackBase,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(10),
            SizedBox(
              width: 147.w,
              height: 35.h,
              child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    ),
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset('assets/images/cart_icon.png',
                    width: 15.w,
                    height: 15.h,
                    color:
                     PalletsColors.whiteBase,),
                    horizontalSpace(5),
                    Text('Add to cart',
                        style: AppTextStyles.instance.textStyle13.copyWith(
                          color: PalletsColors.whiteBase,
                          fontWeight: FontWeight.w700
                        )),
                    // horizontalSpace(5),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
