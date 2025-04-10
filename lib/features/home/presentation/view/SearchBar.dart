import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: TextField(

        decoration: InputDecoration(

          prefixIcon:Icon(
            Icons.search
          ),
          hintStyle: AppTextStyles.instance.textStyle14.copyWith(
            color: PalletsColors.white80
          ),
          hintText: "Search",
          prefixIconColor: PalletsColors.white80 ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color:PalletsColors.white80),
          ),
          filled: false,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        style: AppTextStyles.instance.textStyle14,
      ),
    );
  }
}