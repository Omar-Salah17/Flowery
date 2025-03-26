import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/auth/forgetPassword/domain/use_cases/forget_password_use_case.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordUseCase)
    : super(ForgetPasswordInitial());
  final ForgetPasswordUseCase forgetPasswordUseCase;
  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    var result = await forgetPasswordUseCase.call(email: email);
    result.fold((failure) {
      emit(ForgetPasswordFailure(errorMessage: failure.errorMessage));
    }, (response) {
      emit(ForgetPasswordSuccess(data: response));
    });
  }
}
