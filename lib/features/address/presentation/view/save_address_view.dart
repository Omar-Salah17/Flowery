import 'package:flowery/features/address/presentation/cubit/address_cubit.dart';
import 'package:flowery/features/address/presentation/view/save_address_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveAddressView extends StatelessWidget {
   SaveAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return SaveAddressBody();
  }
}
