import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ResendCode extends StatelessWidget {
  const ResendCode({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Didn\'t receive code?',
              style: AppTextStyles.instance.textStyle16,
            ),
            GestureDetector(
              onTap: () {
                // log("email from the ResendCode Widget $email");
                // context.read<ForgetPasswordViewModel>().forgetPassword(email);
              },
              child: Text(
                " Resend",
                style: TextStyle(
                  color: PalletsColors.mainColorBase,
                  fontSize: AppTextStyles.instance.textStyle16.fontSize,
                  decoration: TextDecoration.underline,
                  decorationColor: PalletsColors.mainColorBase,
                ),
              ),
            ),
          ],
        ),
        
      ],
    );
  }
}
