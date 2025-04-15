import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/profile/domain/use_case/change_password_use_case.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.changePasswordUseCase)
    : super(ChangePasswordInitial());
  final ChangePasswordUseCase changePasswordUseCase;
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());
    final result = await changePasswordUseCase.call(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    result.fold(
      (failure) =>
          emit(ChangePasswordFailure(errorMessage: failure.errorMessage)),
      (response) => emit(ChangePasswordSuccess(data: response)),
    );
  }
}
