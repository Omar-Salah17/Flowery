import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/profile/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase.dart';
import 'package:flowery/features/profile/terms_and_conditions/presentation/view/terms_and_conditions_screenbody.dart';
import 'package:flowery/features/profile/terms_and_conditions/presentation/viewModel/terms_and_conditions_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => TermsAndConditionsViewModel(
            getIt.get<TermsAndConditionsUseCase>(),
          )..getTermsAndConditions(),
      child: Scaffold(body: TermsAndConditionsScreenbody()),
    );
  }
}
