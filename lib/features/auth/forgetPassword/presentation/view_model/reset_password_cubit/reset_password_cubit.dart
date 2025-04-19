import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/auth/forgetPassword/domain/use_cases/reset_password_use_case.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswirdUseCase) : super(ResetPasswordInitial());
  final ResetPasswordUseCase resetPasswirdUseCase;

  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());
    final result = await resetPasswirdUseCase.call(
      email: email,
      newPassword: newPassword,
    );
    result.fold(
      (failure) {
        emit(ResetPasswordFailure(errorMessage: failure.errorMessage));
      },
      (response) {
        emit(ResetPasswordSuccess(data: response));
      },
    );
  }
}
