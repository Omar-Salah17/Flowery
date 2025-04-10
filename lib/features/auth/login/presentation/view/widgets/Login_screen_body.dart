import 'dart:developer';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/custom_button.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/core/utils/validator.dart';
import 'package:flowery/features/auth/login/domain/use_cases/login_usecase.dart';
import 'package:flowery/features/auth/login/presentation/view/widgets/remember_me_row.dart';
import 'package:flowery/features/auth/login/presentation/view/widgets/sign_up_link.dart';
import 'package:flowery/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:flowery/features/auth/login/presentation/view_model/login_status.dart';
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
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<LoginUsecase>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Logged in successfully'),
              ),
            );
            Navigator.pushNamed(context, RoutesName.layout);
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
                      text: "Login",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          log("inside method");
                          log(emailController.text);
                          log(passwordController.text);
                          await context.read<LoginCubit>().login(
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
                  SignUpLink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
