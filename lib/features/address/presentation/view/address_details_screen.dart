import 'package:easy_localization/easy_localization.dart';

import 'package:flowery/core/utils/helper_functions/build_app_bar_function.dart';
import 'package:flowery/features/address/presentation/view/widgets/address_details_screen_body.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: LocaleKeys.address.tr(),
        onPressed: () => Navigator.pop(context),
      ),
      body: AddressDetailsScreenBody(),
    );
  }

  
}
