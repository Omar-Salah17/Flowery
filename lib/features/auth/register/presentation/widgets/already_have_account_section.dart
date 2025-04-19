import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountSection extends StatelessWidget {
  const AlreadyHaveAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.alreadyHaveAccount.tr(),
          style: text.bodySmall!.copyWith(
            color: PalletsColors.black100,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.login);
          },
          child: Text(
            LocaleKeys.login.tr(),
            style: text.bodySmall!.copyWith(
              color: PalletsColors.mainColorBase,
              decoration: TextDecoration.underline,
              decorationColor: PalletsColors.mainColorBase,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
