import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/helper_functions/build_app_bar_function.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/domain/use_case/add_address_use_case.dart';
import 'package:flowery/features/address/presentation/view/widgets/address_details_screen_body.dart';
import 'package:flowery/features/address/presentation/view_model/address_details_cubit/address_details_cubit.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/update_address_use_case.dart';

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final address = ModalRoute.of(context)!.settings.arguments as Addresses;

    return BlocProvider(
      create:
          (context) => AddressDetailsCubit(
            getIt.get<AddAddressUseCase>(),
            getIt.get<UpdateAddressUseCase>(),
          )..initControllers(),
      child: Scaffold(
        appBar: buildAppBar(
          title: LocaleKeys.address.tr(),
          onPressed: () => Navigator.pop(context),
        ),
        body: AddressDetailsScreenBody(address: address),
      ),
    );
  }
}
