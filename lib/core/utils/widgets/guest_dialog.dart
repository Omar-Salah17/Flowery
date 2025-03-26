import 'package:flutter/material.dart';


import '../../config/routes_name.dart';

void showGuestDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "you are guest",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        content: Text(
          "Please Register to continue",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: Theme.of(context).textTheme.bodySmall),
          ),
          ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: (){
              Navigator.pushNamed(context, RoutesName.register);
              },
            child: Text("Register", style: Theme.of(context).textTheme.labelSmall),
          ),
        ],
      );
    },
  );
}
