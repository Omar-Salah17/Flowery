// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsTile extends StatelessWidget {
  final Widget? icon;
  final String? iconPath;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  const SettingsTile({
    super.key,
    this.icon,
    this.iconPath,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            if (icon != null) icon! else SvgPicture.asset('$iconPath'),
            horizontalSpace(10),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.instance.textStyle16.copyWith(
                  color: PalletsColors.blackBase,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            if (trailing != null)
              trailing!
            else
              Icon(
                Icons.arrow_forward_ios,
                size: 22.sp,
                color: PalletsColors.gray,
              ),
          ],
        ),
      ),
    );
  }
}
