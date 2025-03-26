import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/enums/gender_enum.dart';
import 'package:flowery/core/enums/request_enum.dart';
import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/core/utils/validator.dart';
import 'package:flowery/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:flowery/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:flowery/features/auth/register/presentation/widgets/already_have_account_section.dart';
import 'package:flowery/features/auth/register/presentation/widgets/create_account_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? gender;
  var cubit = RegisterCubit(getIt<RegisterUseCase>());
  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.arrow_back_ios),
            horizontalSpace(10),
            Text('Sign Up', style: text.titleMedium),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: BlocConsumer<RegisterCubit, RegisterStates>(
            bloc: cubit,
            listener: (context, state) {
              if (state.state == RequestState.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('User Registered Successfully'),
                  ),
                );
              } else if (state.state == RequestState.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
                
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  verticalSpace(20),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFormFieled(
                            hintText: 'Enter First Name',
                            labelText: 'First Name',
                            shouldObscureText: false,
                            textEditingController: cubit.firstNameController,
                            validator: (val) => Validator.validateName(val),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFormFieled(
                            hintText: 'Enter Last Name',
                            labelText: 'Last Name',
                            shouldObscureText: false,
                            textEditingController: cubit.lastNameController,
                            validator: (val) => Validator.validateName(val),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 15.h,
                    ),
                    child: CustomTextFormFieled(
                      hintText: 'Enter your email',
                      labelText: 'email',
                      shouldObscureText: false,
                      textEditingController: cubit.emailController,
                      validator: (val) {
                        return Validator.validateEmail(val);
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFormFieled(
                            hintText: 'Enter your password',
                            labelText: 'Password',
                            shouldObscureText: true,
                            textEditingController: cubit.passwordController,
                            validator:
                                (value) => Validator.validatePassword(value),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextFormFieled(
                            validator:
                                (val) => Validator.validateConfirmPassword(
                                  val,
                                  cubit.passwordController.text,
                                ),
                            hintText: 'Confirm your password',
                            labelText: 'Confirm Password',
                            shouldObscureText: true,
                            textEditingController:
                                cubit.confirmPasswordController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 15.h,
                    ),
                    child: CustomTextFormFieled(
                      hintText: 'Enter your phone number',
                      labelText: 'Phone Number',
                      shouldObscureText: false,
                      textEditingController: cubit.phoneNumberController,
                      validator: (val) => Validator.validatePhoneNumber(val),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 15.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Gender',
                          style: text.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                        ),
                        horizontalSpace(20),
                        Radio<Gender>(
                          value: Gender.female,
                          groupValue: cubit.selectedGender,
                          onChanged: (value) {
                            cubit.selectGender(value!);
                          },
                          activeColor: PalletsColors.mainColorBase,
                        ),
                        Text(
                          "Female",
                          style: text.bodyMedium!.copyWith(
                            color: PalletsColors.gray,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        horizontalSpace(20),
                        Radio<Gender>(
                          activeColor: PalletsColors.mainColorBase,
                          value: Gender.male,
                          groupValue: cubit.selectedGender,
                          onChanged: (value) {
                            cubit.selectGender(value!);
                          },
                        ),
                        Text(
                          "Male",
                          style: text.bodyMedium!.copyWith(
                            color: PalletsColors.gray,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CreateAccountSection(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 40.h,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                      
                          cubit.register();
                        
                      },
                      child: Text('Sign Up'),
                    ),
                  ),
                  AlreadyHaveAccountSection(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
