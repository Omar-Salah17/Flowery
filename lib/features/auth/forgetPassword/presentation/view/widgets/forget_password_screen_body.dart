import 'dart:developer';

import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
import 'package:flowery/core/utils/validator.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view_model/forget_pass_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forget password',
                    style: AppTextStyles.instance.textStyle18.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Please enter your email associated to your account',
                    style: AppTextStyles.instance.textStyle14,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            CustomTextFormField(
              textEditingController: emailController,
              labelText: 'Email',
              hintText: "Enter Your Email",
              shouldObscureText: false,
              validator: (value) {
                return Validator.validateEmail(value);
                
              },
            ),
            SizedBox(height: 48.h),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  log(
                    "The email in forget password screen body is ${emailController.text.trim()}",
                  );
                  await context.read<ForgetPasswordCubit>().forgetPassword(
                    email: emailController.text.trim(),
                  );
                  autovalidateMode = AutovalidateMode.disabled;
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  if (state is ForgetPasswordSuccess) {
                    showSnackBar(context, state.data["info"]);
                    Navigator.pushNamed(
                      context,
                      RoutesName.emailVerificationScreen,
                      arguments: {"email": emailController.text.trim()},
                    );
                    log(
                      'email from Navigating to EmailVerificationScreen is ${emailController.text.trim()}',
                    );
                  } else if (state is ForgetPasswordFailure) {
                    showErrorSnackBar(context, state.errorMessage);
                  }
                },
                builder: (context, state) {
                  if (state is ForgetPasswordLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: PalletsColors.white10,
                      ),
                    );
                  } else {
                    return Text('Confirm');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
