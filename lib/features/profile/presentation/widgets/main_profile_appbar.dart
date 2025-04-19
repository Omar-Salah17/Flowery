import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainProfileAppBar extends StatelessWidget {
  const MainProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          SvgPicture.asset("assets/images/Flower.svg"),
          Text(
            "Flowery",
            style: AppTextStyles.instance.textStyle20Fell.copyWith(
              color: PalletsColors.mainColorBase,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Badge(
            label: const Text('3'),
            child: SvgPicture.asset('assets/images/notification.svg'),
          ),
        ),
      ],
    );
  }
}
