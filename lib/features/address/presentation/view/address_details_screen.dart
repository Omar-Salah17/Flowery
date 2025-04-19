import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';


class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: LocaleKeys.address , onPressed: () => Navigator.pop(context)),
    );
  }

  AppBar buildAppBar({required String title, void Function()? onPressed}) {
    return AppBar(
    title:Text(title),
    leading: IconButton(onPressed: onPressed, icon:Icon( Icons.arrow_back_ios)),
  );
  }
}
