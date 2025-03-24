import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/auth/forgetPassword/domain/use_cases/verify_code_use_case.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit(this.verifyCodeUseCase) : super(VerifyCodeInitial());
  final VerifyCodeUseCase verifyCodeUseCase;
  Future<void> verifyCode({required String resetCode}) async {
    emit(VerifyCodeLoading());
    var result = await verifyCodeUseCase(resetCode: resetCode);
    result.fold(
      (failure) => emit(VerifyCodeFailure(errorMessage: failure.errorMessage)),
      (response) => emit(VerifyCodeSuccess(data: response)),
    );
  }
}
