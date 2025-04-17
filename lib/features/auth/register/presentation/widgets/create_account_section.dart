import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountSection extends StatelessWidget {
  const CreateAccountSection({super.key});
  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: RichText(
        text: TextSpan(
          style: text.bodySmall?.copyWith(
            color: PalletsColors.black100,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(text: LocaleKeys.agreeTerms.tr()),
            TextSpan(
              text: LocaleKeys.termsConditions.tr(),
              style: text.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: PalletsColors.black100,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
