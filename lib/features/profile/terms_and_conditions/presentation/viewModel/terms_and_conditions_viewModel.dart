

import 'package:bloc/bloc.dart';
import 'package:flowery/features/profile/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase.dart';
import 'package:flowery/features/profile/terms_and_conditions/presentation/viewModel/terms_and_conditions_state.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsViewModel extends Cubit<TermsAndConditionsState> {
  TermsAndConditionsUseCase termsAndConditionsUseCase;
  TermsAndConditionsViewModel(this.termsAndConditionsUseCase)
    : super(TermsAndConditionsInitState());

  Future<void> getTermsAndConditions() async {
    emit(TermsAndConditionsLoadingState());
    var resp = await termsAndConditionsUseCase.call();
    resp.fold(
      (failure) {
        emit(TermsAndConditionsFailureState(failure.errorMessage));
      },
      (model) {
        emit(TermsAndConditionsSuccessState(model));
      },
    );
  }

  FontWeight getFontWeight(String? weight) {
    if (weight == 'bold') {
      return FontWeight.bold;
    }
    return FontWeight.normal;
  }

  Color getColor(String? color) {
    if (color == null) {
      return Colors.black;
    }
    return Color(int.parse(color.replaceAll('#', '0xff')));
  }

  TextAlign getTextAlign(String? align) {
    switch (align) {
      case 'center':
        return TextAlign.center;
      case 'right':
        return TextAlign.right;
      default:
        return TextAlign.left;
    }
  }
}
