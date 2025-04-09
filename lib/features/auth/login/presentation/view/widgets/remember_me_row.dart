import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flutter/material.dart';

class RememberMeRow extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onRememberMeChanged;

  const RememberMeRow({
    Key? key,
    required this.rememberMe,
    required this.onRememberMeChanged,
  }) : super(key: key);

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
        Text("Remember me", style: Theme.of(context).textTheme.bodyMedium),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.forgetPassword);
          },
          child: Text(
            "Forget password?",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: const Color.fromRGBO(12, 16, 21, 1),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
