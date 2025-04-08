import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/core/enums/gender_enum.dart';
import 'package:flowery/core/enums/request_enum.dart';
import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/domain/entities/register_entity.dart';
import 'package:flowery/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this._registerUseCase) : super(RegisterStates());
  final RegisterUseCase _registerUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  static Gender selectedGender = Gender.female;

  selectGender(Gender value) {
    selectedGender = value;
    emit(state.copyWith(state: RequestState.selectGender));
  }

  register() async {
    emit(state.copyWith(state: RequestState.loading));

    var either = await _registerUseCase.invoke(
      registerRequest: RegisterRequest(
        email: emailController.text,
        password: passwordController.text,
        rePassword: confirmPasswordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneNumberController.text,
        gender: selectedGender == Gender.female ? "female" : "male",
      ),
    );
    either.fold(
      (l) {
        emit(
          state.copyWith(
            state: RequestState.error,
            errorMessage: l.errorMessage,
          ),
        );
      },
      (r) {
        emit(state.copyWith(state: RequestState.success, registerEntity: r));
      },
    );
  }
}
