import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class RememberMeRow extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onRememberMeChanged;

  const RememberMeRow({
    super.key,
    required this.rememberMe,
    required this.onRememberMeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: onRememberMeChanged,
          activeColor: PalletsColors.mainColorBase,
          checkColor: Colors.white,
        ),
        Text(
          LocaleKeys.remmemberMe.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.forgetPassword);
          },
          child: Text(
            LocaleKeys.forgetPassword.tr(),
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: Color.fromRGBO(12, 16, 21, 1),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
