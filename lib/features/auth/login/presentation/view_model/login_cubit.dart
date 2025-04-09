import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flowery/features/auth/login/data/models/login_request.dart';

import 'package:flowery/features/auth/login/domain/use_cases/login_usecase.dart';
import 'package:flowery/features/auth/login/presentation/view_model/login_status.dart';
import 'package:injectable/injectable.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  final LoginUsecase loginUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    log("before invoke");
    final loginRequest = LoginRequest(email: email, password: password);
    var result = await loginUseCase.invoke(loginRequest: loginRequest);
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
