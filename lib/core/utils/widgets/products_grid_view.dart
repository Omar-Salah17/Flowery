import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/categories/presentation/view/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.productsList});
  final List<Product> productsList;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ProductItemWidget(product: productsList[index]),

          childCount: productsList.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 17.h,
          crossAxisSpacing: 17.w,
          crossAxisCount: 2,
          childAspectRatio: 0.65,
        ),
      ),
    );
  }
}
