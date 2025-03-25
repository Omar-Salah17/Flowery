import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flowery/features/auth/forgetPassword/domain/use_cases/verify_code_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit(this.verifyCodeUseCase)
    : super(EmailVerificationInitial());
  final VerifyCodeUseCase verifyCodeUseCase;
  Future<void> verifyCode(String resetCode) async {
    emit(EmailVerificationLoading());
    var result = await verifyCodeUseCase.call(resetCode: resetCode);
    result.fold(
      (failure) {
        log(
          'Verification code Failed in EmailVerificationCubit : ${failure.errorMessage}',
        );
        emit(EmailVerificationFailure(errorMessage: failure.errorMessage));
      },
      (response) {
        log(
          'Verification Success in EmailVerificationCubit : ${response["status"]}',
        );
        emit(EmailVerificationSuccess(status: response["status"]));
      },
    );
  }

  static void onChanged(
    String value,
    int index,
    String otpCode,
    List<FocusNode> focusNodes,
    BuildContext context,
  ) {
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    } else if (otpCode.length == 6) {
      log("ooootp in EmailVerificationCubit $otpCode");
      context.read<EmailVerificationCubit>().verifyCode(otpCode);
    }
  }
}
