import 'package:dio/dio.dart';
import 'package:flowery/features/home/presentation/viewModel/currentUserLocationViewModel/CurrentUserLocationViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/plus_code_client.dart';
import 'CurrentUserLocationBody.dart';

class CurrentUserLocation extends StatelessWidget {
  const CurrentUserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final dio =
            Dio()
              ..options.connectTimeout = const Duration(seconds: 5)
              ..options.receiveTimeout = const Duration(seconds: 3);
        final client = PlusCodeClient(dio);

        final cubit = CurrentUserLocationViewModel(client);
        cubit.fetchLocation();
        return cubit;
      },
      child: CurrentUserLocationBody(),
    );
  }
}
