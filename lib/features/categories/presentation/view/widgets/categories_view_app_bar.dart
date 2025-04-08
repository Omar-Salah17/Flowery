import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
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
          SizedBox(
            // height: 48.h,
            width: 271.w,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 15.5.h,
                  bottom: 15.5.h,
                  left: 19.w,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: AppTextStyles.instance.textStyle14.fontSize,
                  color: PalletsColors.white70,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: PalletsColors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: PalletsColors.white70),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: PalletsColors.white70,
                  size: 24.r,
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
