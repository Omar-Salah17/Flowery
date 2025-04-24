import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/categories/presentation/view/widgets/product_search_delegate.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreenAppBar extends StatelessWidget {
  const CategoriesScreenAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              showSearch(context: context, delegate: ProductSearchDelegate());
            },
            child: SizedBox(
              width: 271.w,
              height: 48.h,
              child: IgnorePointer(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: LocaleKeys.search.tr(),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: PalletsColors.white70,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: PalletsColors.white70,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: PalletsColors.white70),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: Icon(Icons.sort, color: PalletsColors.white70, size: 24.r),
            ),
          ),
        ],
      ),
    );
  }
}
