import 'package:easy_localization/easy_localization.dart'; // Ensure this import is added
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CheckOutAppBar extends StatelessWidget {
  const CheckOutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new),
              ),
              Text(
                LocaleKeys.checkout
                    .tr(), // Using LocaleKeys for the "Checkout" text
                style: AppTextStyles.instance.textStyle20,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Expanded(child: deliveryTimeSection()),
        ],
      ),
    );
  }

  Widget deliveryTimeSection() {
    return SizedBox(
      height: 62,
      width: 343,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                LocaleKeys.deliveryFee
                    .tr(), // Using LocaleKeys for "Delivery Time"
                style: AppTextStyles.instance.textStyle18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                LocaleKeys.schedule.tr(), // Using LocaleKeys for "Schedule"
                style: AppTextStyles.instance.textStyle18.copyWith(
                  color: PalletsColors.mainColorBase,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(
                Icons.access_time,
                color: PalletsColors.blackBase,
                size: 20,
              ),
              Text(
                LocaleKeys.instant.tr(), // Using LocaleKeys for "instant"
                style: AppTextStyles.instance.textStyle14.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 3),
              Text(
                LocaleKeys.estimatedArrival.tr(
                  args: ['03 Sep 2024', '11:00 AM'],
                ), // Using LocaleKeys with parameters
                style: AppTextStyles.instance.textStyle14.copyWith(
                  color: PalletsColors.success,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
