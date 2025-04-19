import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCatView extends StatelessWidget {
  const HomeCatView({super.key, required this.categories});

  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length ,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.categories);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: PalletsColors.mainColor10,
                    ),
                    child: Image.network(
                      category.image ?? LocaleKeys.noImageFound.tr(),
                      width: 18.17.w,
                      height: 22.5.h,
                    ),
                  ),
                ),
              ),
              Text(
                (category.name != null && category.name!.isNotEmpty)
                    ? category.name![0].toUpperCase() +
                        category.name!.substring(1)
                    : LocaleKeys.noNameFound.tr(),
              ),
            ],
          );
        },
      ),
    );
  }
}
