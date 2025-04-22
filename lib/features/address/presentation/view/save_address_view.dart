import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/address/domain/use_case/add_address_use_case.dart';
import 'package:flowery/features/address/presentation/view/save_address_body.dart';
import 'package:flowery/features/address/presentation/view_model/address_details_cubit/address_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveAddressView extends StatelessWidget {
  const SaveAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressDetailsCubit(getIt.get<AddAddressUseCase>()),
      child: SaveAddressBody(),
    );
  }
}
