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
  RegisterCubit( this._registerUseCase) : super(RegisterStates());
   final RegisterUseCase _registerUseCase;
  TextEditingController emailController = TextEditingController(text: 'mariam@gmail.com');
  TextEditingController passwordController = TextEditingController(text: 'Mariam@123');
  TextEditingController confirmPasswordController = TextEditingController(text: 'Mariam@123');
  TextEditingController firstNameController = TextEditingController(text: "mariam");
  TextEditingController lastNameController = TextEditingController(text: "kamel");
  TextEditingController phoneNumberController = TextEditingController(text: "+201111111111");
  var formKey = GlobalKey<FormState>();
  Gender selectedGender = Gender.female; 


  selectGender(Gender value){
    emit(state.copyWith(state: RequestState.initial));
    selectedGender =value ;
    print("============${selectedGender}");
    emit(state.copyWith(state: RequestState.selectGender));
  }
  register()async{
    emit(state.copyWith(state: RequestState.loading));
  if (formKey.currentState?.validate() == true) {
  var either = await  _registerUseCase.invoke(
      registerRequest: RegisterRequest(
        email: emailController.text,
        password: passwordController.text,
        rePassword: confirmPasswordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneNumberController.text,
        gender: selectedGender == Gender.female ? "female" : "male"
      )
    );
  either.fold(
        (l) {
      print("Failure: ${l.errorMessage}");
      emit(state.copyWith(state: RequestState.error, errorMessage: l.errorMessage));
    },
        (r) {
      print("Success: RegisterEntity = $r");
      emit(state.copyWith(state: RequestState.success, registerEntity: r));
    },
  );
}
  }


}
