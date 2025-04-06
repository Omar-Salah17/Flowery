import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flowery/features/auth/login/domain/use_cases/login_usecase.dart';
import 'package:flowery/features/auth/login/presentation/view_model/login_status.dart';
import 'package:injectable/injectable.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  final LoginUsecase loginUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    log("before invoke");
    var result = await loginUseCase.invoke(email: email, password: password);
    log("after invoke");
    result.fold(
      (failure) {
        log(" in cubit failure");
        emit(LoginFailure(errorMessage: failure.errorMessage));
      },
      (response) {
        log("in cubit succes");
        emit(LoginSuccess(data: response));
      },
    );
  }
}
