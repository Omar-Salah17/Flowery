import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/profile/about_us/domain/use_cases/about_us_use_case.dart';
import 'package:flowery/features/profile/about_us/presentation/view/about_us_screenbody.dart';
import 'package:flowery/features/profile/about_us/presentation/viewmodel/about_us_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              AboutUsViewModel(getIt.get<AboutUsUseCase>())
                ..getAboutUsContent(),
      child: Scaffold(body: AboutUsScreenBody()),
    );
  }
}
