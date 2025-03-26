import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/domain/entities/register_entity.dart';
import 'package:flowery/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit( this._registerUseCase) : super(RegisterInitial());
   RegisterUseCase _registerUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? gender ;

  selectGender(String? value){
    gender = value;
    emit(SelectGender());
  }
  register()async{
  var either = await  _registerUseCase.invoke(
      registerRequest: RegisterRequest(
        email: emailController.text,
        password: passwordController.text,
        rePassword: confirmPasswordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneNumberController.text,
        gender: gender??''
      )
    );
    either.fold((l) => emit(RegisterError(l.errorMessage)), (r) => emit(RegisterSuccess(r)));
  }


}
