import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/features/profile/about_us/data/Models/about_app.dart';
import 'package:flowery/features/profile/about_us/domain/use_cases/about_us_use_case.dart';
import 'package:flowery/features/profile/about_us/presentation/viewmodel/about_us_state.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AboutUsViewModel extends Cubit<AboutUsState> {
  final AboutUsUseCase aboutUsUseCase;

  AboutUsViewModel(this.aboutUsUseCase) : super(AboutUsInitState());

  Future<void> getAboutUsContent() async {
    emit(AboutUsLoadingState()); // Emit loading state when fetching data
    try {
      var result = await aboutUsUseCase.call();
      result.fold(
            (failure) {
          emit(AboutUsFailureState(failure.errorMessage)); // Emit failure state if there's an error
        },
            (model) {
          emit(AboutUsSuccessState(model)); // Emit success state when data is fetched
        },
      );
    } catch (e) {
      emit(AboutUsFailureState("An unexpected error occurred: $e")); // Handle any unexpected errors
      print("Error fetching About Us content: $e"); // Log the error for debugging
    }
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

  String getLocalizedTitle(AboutApp aboutapp, bool isEnglish,BuildContext context) {
    // For sections with title object
    if (aboutapp.title != null) {
      return isEnglish ? aboutapp.title!.en ?? '' : aboutapp.title!.ar ?? '';
    }

    // For sections without title object but need localization
    switch (aboutapp.section) {
      case 'introduction':
        return context.tr(LocaleKeys.about_Us_Introduction_Title);
      case 'closing':
        return context.tr(LocaleKeys.about_Us_Closing_Title);
      default:
        return aboutapp.section ?? 'No Data available';
    }
  }
}
