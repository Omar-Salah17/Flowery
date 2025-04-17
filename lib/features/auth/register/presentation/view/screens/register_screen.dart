import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/routes_name.dart';
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
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
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
            Text(LocaleKeys.signup.tr(), style: text.titleMedium),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          bloc: cubit,
          listener: (context, state) {
            if (state.state == RequestState.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(LocaleKeys.userRegisteredSuccessfully.tr()),
                ),
              );
              Navigator.pushNamed(context, RoutesName.layout);
            } else if (state.state == RequestState.error) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
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
                            hintText: LocaleKeys.enterFirstName.tr(),
                            labelText: LocaleKeys.firstName.tr(),
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
                            hintText: LocaleKeys.enterLastName.tr(),
                            labelText: LocaleKeys.lastName.tr(),
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
                      hintText: LocaleKeys.enterYourEmail.tr(),
                      labelText: LocaleKeys.email.tr(),
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
                            hintText: LocaleKeys.enterYourPassword.tr(),
                            labelText: LocaleKeys.password.tr(),
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
                            hintText: LocaleKeys.confirmPassword.tr(),
                            labelText: LocaleKeys.confirmPassword.tr(),
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
                      hintText: LocaleKeys.enterPhoneNumber,
                      labelText: LocaleKeys.phoneNumber.tr(),
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
                          LocaleKeys.gender.tr(),
                          style: text.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                        ),
                        horizontalSpace(20),
                        Radio<Gender>(
                          value: Gender.female,
                          groupValue: RegisterCubit.selectedGender,
                          onChanged: (value) {
                            setState(() {
                              RegisterCubit.selectedGender = value!;
                            });
                          },
                          activeColor: PalletsColors.mainColorBase,
                        ),
                        Text(
                         LocaleKeys.Female.tr(),
                          style: text.bodyMedium!.copyWith(
                            color: PalletsColors.gray,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        horizontalSpace(20),
                        Radio<Gender>(
                          activeColor: PalletsColors.mainColorBase,
                          value: Gender.male,
                          groupValue: RegisterCubit.selectedGender,
                          onChanged: (value) {
                            setState(() {
                              RegisterCubit.selectedGender = value!;
                            });
                          },
                        ),
                        Text(
                          LocaleKeys.Male.tr(),
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
                        if (formKey.currentState!.validate()) {
                          cubit.register();
                          autoValidateMode = AutovalidateMode.disabled;
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      child: Text(LocaleKeys.signup.tr()),
                    ),
                  ),
                  AlreadyHaveAccountSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
