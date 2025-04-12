import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
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
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      6,
      (index) => Container(
        color: PalletsColors.mainColor30,
        height: 400,
        width: double.infinity,
        // child:
        //  Image.network(),
      ),
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            SizedBox(
              height: 343,
              child: PageView.builder(
                controller: controller,
                // itemCount: pages.length,
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
                      Text(
                        "Status: ",
                        style: AppTextStyles.instance.textStyle16,
                      ),
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
                    "15 Pink Rose Bouquet",
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
                    "Lorem ipsum dolor sit amet consectetur. Id sit morbi ornare morbi duis rhoncus orci massa.",
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
                        "Pink roses:",
                        style: AppTextStyles.instance.textStyle14,
                      ),
                      Text("15", style: AppTextStyles.instance.textStyle14),
                    ],
                  ),
                  Text("White wrap", style: AppTextStyles.instance.textStyle14),
                  SizedBox(height: 7),
                  ElevatedButton(onPressed: () {}, child: Text("Add to cart")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // return Container();
}

// }
