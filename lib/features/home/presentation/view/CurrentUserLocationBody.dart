import 'package:flowery/features/home/presentation/viewModel/currentUserLocationViewModel/CurrentUserLocationViewModel.dart';
import 'package:flowery/features/home/presentation/viewModel/currentUserLocationViewModel/LocationState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentUserLocationBody extends StatelessWidget{
  const CurrentUserLocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentUserLocationViewModel, LocationState>(
      builder: (context, state) {
        String text = "";
        if (state is LocationLoading || state is LocationInitial) {
          text = "Detecting your location...";
        } else if (state is LocationSuccess) {
          text = "Deliver to ${state.plusCode} - ${state.areaName}";
        } else if (state is LocationError) {
          text = state.message;
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.location_on, color: Colors.black54),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down, color: Colors.pink),
            ],
          ),
        );
      },
    );
  }
}