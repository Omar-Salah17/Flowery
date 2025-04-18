import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: PalletsColors.white10,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.occasion.tr(), style: text.titleMedium),
              Text(
                LocaleKeys.bloomSellers.tr(),
                style: text.labelSmall?.copyWith(color: PalletsColors.gray),
              ),
              verticalSpace(8),
            ],
          ),
        ],
      ),
    );
  }
}
