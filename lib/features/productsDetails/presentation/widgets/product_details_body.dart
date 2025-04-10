import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';
import 'package:flowery/features/productsDetails/presentation/viewModel/product_details_cubit/product_details_cubit.dart';
import 'package:flowery/features/productsDetails/presentation/viewModel/product_details_cubit/product_details_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key});

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade300,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: SizedBox(
          height: 280,
          child: Center(
            child: Text(
              "Page $index",
              style: TextStyle(color: PalletsColors.mainColorBase),
            ),
          ),
        ),
      ),
    );
  return  SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 16),
                  SizedBox(
                    height: 240,
                    child: PageView.builder(
                      controller: controller,
                      // itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return pages[index % pages.length];
                      },
                    ),
                  ),

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
                        Row(children: [Text("data"), Spacer(), Text("data")]),
                        Text("data"),
                        Text("data"),
                        Text("data"),
                        Text("data"),
                        Text("data"),
                        Text("data"),
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
