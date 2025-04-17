import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/presentation/view%20model/add_to_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsBody extends StatefulWidget {
  final Product product;
  const ProductDetailsBody({required this.product, super.key});

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      widget.product.images?.length ?? 1,
      (index) => Container(
        color: PalletsColors.mainColor30,
        height: 375.h,
        width: double.infinity,
        child: SizedBox.expand(
          child: Image.network(
            widget.product.images![index],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          SizedBox(
            height: 375.h,
            width: double.infinity,
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
          SizedBox(height: 9),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: const WormEffect(
                dotHeight: 16,
                dotWidth: 16,
                type: WormType.thinUnderground,
                activeDotColor: PalletsColors.mainColorBase,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      "EGP ${widget.product.price}",
                      style: AppTextStyles.instance.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text("Status: ", style: AppTextStyles.instance.textStyle16),
                    Text(
                      " In stock",
                      style: AppTextStyles.instance.textStyle14,
                    ),
                  ],
                ),
                Text(
                  "All prices include tax",
                  style: AppTextStyles.instance.textStyle16,
                ),
                Text(
                  "${widget.product.quantity} ${widget.product.title}",
                  style: AppTextStyles.instance.textStyle16.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.sp),
                Text(
                  "Description",
                  style: AppTextStyles.instance.textStyle16.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  widget.product.description ?? "No description found",
                  style: AppTextStyles.instance.textStyle14,
                ),

                SizedBox(height: 20.sp),

                Text(
                  "Bouquet include",
                  style: AppTextStyles.instance.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${widget.product.title}: ",
                      style: AppTextStyles.instance.textStyle14,
                    ),
                    Text(
                      "${widget.product.quantity}",
                      style: AppTextStyles.instance.textStyle14,
                    ),
                  ],
                ),
                Text("White wrap", style: AppTextStyles.instance.textStyle14),
                SizedBox(height: 7),
                ElevatedButton(onPressed: () {
                  AddToCartCubit.get(context).addToCart(
                    addProductRequest: AddProductRequest(
                      productId: widget.product.id,
                      quantity: 1,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Product added to cart"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }, child: Text("Add to cart")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
