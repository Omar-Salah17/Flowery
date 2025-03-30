import 'package:flowery/features/categories/presentation/view/widgets/categories_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTitleListView extends StatelessWidget {
  const CategoriesTitleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoriesTitleWidget();
        },
      ),
    );
  }
}
