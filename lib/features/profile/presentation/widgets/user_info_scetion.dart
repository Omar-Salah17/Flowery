import 'package:flowery/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserInfoScetion extends StatelessWidget {
  const UserInfoScetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            child: SvgPicture.asset(
              "assets/images/Flower.svg",
              height: 100.h,
              width: 100.w,
            ),
          ),
          verticalSpace(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nour',
                style: AppTextStyles.instance.textStyle18.copyWith(
                  color: PalletsColors.black100,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  // Handle edit action
                },
                child: SvgPicture.asset('assets/images/pen.svg'),
              ),
            ],
          ),
          Text(
            'Nour_Mohamed@gmail.com',
            style: AppTextStyles.instance.textStyle18.copyWith(
              color: PalletsColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}
