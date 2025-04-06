import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/home/presentation/widgets/appbar_title.dart';
import 'package:flowery/features/home/presentation/widgets/product_item.dart';
import 'package:flowery/features/home/presentation/widgets/tab_widget.dart';
import 'package:flutter/material.dart';

class OccasionScreen extends StatelessWidget {
  const OccasionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: PalletsColors.white10,
        title: const AppbarTitle(),
      ),
      body: DefaultTabController(
        length: 8,
        initialIndex: 0,
        child: Column(
          children: [
        TabWidget(),
            verticalSpace(10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 17,
                  crossAxisSpacing: 17,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) => ProductItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
