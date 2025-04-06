import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isPink;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.isPink,
  });

  @override
  Widget build(BuildContext context) {
    return isPink
        ? SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.0),
            ),
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: Colors.white),
            ),
          ),
        )
        : SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.0),
            ),
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
        );
  }
}
