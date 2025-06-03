import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return     Row(
      children: [
        Image.asset("assets/images/Delivery Boy.png"),
        horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Muhammed",
              style: AppTextStyles.instance.textStyle16,
            ),
            Text(
              "Is your delivery hero for today",
              style: AppTextStyles.instance.textStyle14.copyWith(
                color: PalletsColors.gray,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.call),
          color: PalletsColors.mainColorBase,
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            height: 20,
            width: 20,
            "assets/images/whatsapp.svg",
          ),
          color: PalletsColors.mainColorBase,
        ),
      ],
    )
        ;
  }
}