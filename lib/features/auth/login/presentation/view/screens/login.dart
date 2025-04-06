import 'dart:developer';

import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_button.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/core/utils/validator.dart';
import 'package:flowery/features/auth/login/domain/use_cases/login_usecase.dart';
import 'package:flowery/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:flowery/features/auth/login/presentation/view_model/login_status.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final LoginCubit cubit = LoginCubit(getIt<LoginUsecase>());

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          titleSpacing: 0,
          title: Text(
            "Login",
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: BlocConsumer<LoginCubit, LoginState>(
          bloc: cubit,
          listener: (context, state) {
            if (state is LoginSuccess) {
              log("succes");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Logged in successfully'),
                ),
              );
              Navigator.pushNamed(context, RoutesName.layout);
            } else if (state is LoginFailure) {
              log("fail");
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
                      hintText: "Enter your email",
                      labelText: "Email",
                      textEditingController: emailController,
                      validator: (value) => Validator.validateEmail(value),
                      shouldObscureText: false,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormFieled(
                      hintText: "Enter your Password",
                      labelText: "Password",
                      textEditingController: passwordController,
                      validator: (value) => Validator.validatePassword(value),
                      shouldObscureText: true,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (val) {
                            setState(() {
                              rememberMe = val ?? rememberMe;
                            });
                          },
                          activeColor: PalletsColors.mainColorBase,
                          checkColor: Colors.white,
                        ),
                        Text(
                          "Remember me",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.forgetPassword,
                            );
                          },
                          child: Text(
                            "Forget password?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromRGBO(12, 16, 21, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        text: "Login",
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            log("inside method");
                            log(emailController.text);
                            log(passwordController.text);
                            cubit.login(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            log("after calling");
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
                        text: "Continue as guest",
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.layout);
                        },
                        isPink: false,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text.rich(
                      TextSpan(
                        text: "Don't have an account?",
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          WidgetSpan(child: SizedBox(width: 4.w)),
                          TextSpan(
                            text: "Sign up",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutesName.register,
                                    );
                                  },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
