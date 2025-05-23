import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/helper_functions/build_app_bar_function.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SucessTrackOrder extends StatelessWidget {
  const SucessTrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: LocaleKeys.trackOrder.tr(),
        onPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Spacer(),
          Image.asset('assets/images/sucess.png'),
          Spacer(),
          Text(
            LocaleKeys.yourOrderPlacedSuccessfully.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.instance.textStyle24.copyWith(
              color: PalletsColors.blackBase,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.trackOrder);
              },
              child: Text(
                LocaleKeys.trackOrder.tr(),
                style: AppTextStyles.instance.textStyle16.copyWith(
                  color: PalletsColors.whiteBase,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Spacer(flex: 6),
        ],
      ),
    );
  }
}
