import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/colors.dart';
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
          'Gender',
          style: text.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
        horizontalSpace(20),
        Radio<String>(
          value: "Female",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value;
            });
          },
          activeColor: PalletsColors.mainColorBase,
        ),
        Text(
          "Female",
          style: text.bodyMedium!.copyWith(
            color: PalletsColors.gray,
            fontWeight: FontWeight.w500,
          ),
        ),

        horizontalSpace(20),
        Radio<String>(
          activeColor: PalletsColors.mainColorBase,
          value: "Male",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value;
            });
          },
        ),
        Text(
          "Male",
          style: text.bodyMedium!.copyWith(
            color: PalletsColors.gray,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
