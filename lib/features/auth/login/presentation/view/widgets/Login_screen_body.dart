import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/constants.dart';

import 'package:flowery/core/utils/custom_button.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/core/utils/services/secure_sotrage_service.dart';
import 'package:flowery/core/utils/validator.dart';
import 'package:flowery/features/auth/login/domain/use_cases/login_usecase.dart';
import 'package:flowery/features/auth/login/presentation/view/widgets/remember_me_row.dart';
import 'package:flowery/features/auth/login/presentation/view/widgets/sign_up_link.dart';
import 'package:flowery/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:flowery/features/auth/login/presentation/view_model/login_status.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: 'mariaamk1@123');
    passwordController = TextEditingController(text: 'Ahmed@123');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<LoginUsecase>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(LocaleKeys.LoggedInSuccessfully.tr()),
              ),
            );

            _saveUserToken(state);

            Navigator.pushReplacementNamed(context, RoutesName.layout);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
                children: [
                  SizedBox(height: 36.h),
                  CustomTextFormFieled(
                    hintText: LocaleKeys.enterYourEmail.tr(),
                    labelText: LocaleKeys.email.tr(),
                    textEditingController: emailController,
                    validator: (value) => Validator.validateEmail(value),
                    shouldObscureText: false,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormFieled(
                    hintText: LocaleKeys.enterYourPassword.tr(),
                    labelText: LocaleKeys.password.tr(),
                    textEditingController: passwordController,
                    validator: (value) => Validator.validatePassword(value),
                    shouldObscureText: true,
                  ),
                  SizedBox(height: 4.h),
                  RememberMeRow(
                    rememberMe: rememberMe,
                    onRememberMeChanged: (val) {
                      setState(() {
                        rememberMe = val ?? rememberMe;
                      });
                    },
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      text: LocaleKeys.login.tr(),
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                        
                          await context.read<LoginCubit>().login(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                          
                          autoValidateMode = AutovalidateMode.disabled;
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      isPink: true,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      text: LocaleKeys.continueAsGuest.tr(),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesName.layout,
                        );
                      },
                      isPink: false,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SignUpLink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _saveUserToken(LoginSuccess state) async {
    await SecureStorageService().writeSecureData(
      Constants.userToken,
      state.data.token,
    );
    String? token = await SecureStorageService().readSecureData(
      Constants.userToken,
    );
    // print("user token $token");
    log("user token is $token");
  }
}
