import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSection extends StatefulWidget {
  const GenderSection({super.key});

  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
    String? gender;
    return Row(
      children: [
        Text(
          LocaleKeys.gender.tr(),
          style: text.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
        horizontalSpace(20),
        Radio<String>(
          value: LocaleKeys.Female.tr(),
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value;
            });
          },
          activeColor: PalletsColors.mainColorBase,
        ),
        Text(
          LocaleKeys.Female.tr(),
          style: text.bodyMedium!.copyWith(
            color: PalletsColors.gray,
            fontWeight: FontWeight.w500,
          ),
        ),

        horizontalSpace(20),
        Radio<String>(
          activeColor: PalletsColors.mainColorBase,
          value: LocaleKeys.Male.tr(),
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value;
            });
          },
        ),
        Text(
          LocaleKeys.Male.tr(),
          style: text.bodyMedium!.copyWith(
            color: PalletsColors.gray,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
