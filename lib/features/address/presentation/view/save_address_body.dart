import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/provider/app_config_provider.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/features/address/presentation/widgets/address_item.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SaveAddressBody extends StatelessWidget {
  const SaveAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
      final appConfigProvider = getIt<AppConfigProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(LocaleKeys.savedAddress.tr(),style: AppTextStyles.instance.
        textStyle20.copyWith(
          fontWeight: FontWeight.w600,
        ),),
      ),
      body:Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return AddressItem();
            },
          ))
        ],
      )
    );
  }
}