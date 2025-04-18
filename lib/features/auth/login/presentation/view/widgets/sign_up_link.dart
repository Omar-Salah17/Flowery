import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: LocaleKeys.DoNotHaveAnAccount.tr(),
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          WidgetSpan(child: SizedBox(width: 4.w)),
          TextSpan(
            text: LocaleKeys.signup.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RoutesName.register);
                  },
          ),
        ],
      ),
    );
  }
}
