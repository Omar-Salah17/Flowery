import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/features/categories/presentation/view/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../categories/data/models/products_model/product.dart';

class BestSellerGridView extends StatelessWidget {
  final List<Product> bestSeller;
  const BestSellerGridView({super.key, required this.bestSeller});

  @override
  Widget build(BuildContext context) {
    if (bestSeller.isEmpty) {
      return Center(
        child: Text(
          "There are no best sellers available 😔",
          style: AppTextStyles.instance.textStyle16.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    } else {
      return GridView.builder(

        itemCount: bestSeller.length,
        padding: EdgeInsets.only(bottom: 16.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          print("produvt.....");
          return ProductItemWidget(product: bestSeller[index]);
        },
      );
    }
  }
}
