import 'dart:developer';

import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/widgets/resend_code_widget.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view_model/verify_code_cubit/email_verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailVerificationScreenBody extends StatefulWidget {
  const EmailVerificationScreenBody({super.key, required this.email});
  final String email;
  @override
  State<EmailVerificationScreenBody> createState() =>
      _EmailVerificationScreenBodyState();
}

class _EmailVerificationScreenBodyState
    extends State<EmailVerificationScreenBody> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  String otpCode() {
    return controllers.map((controller) => controller.text).join();
  }

  @override
  void dispose() {
    for (var item in controllers) {
      item.dispose();
    }
    for (var item in focusNodes) {
      item.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationSuccess) {
          showSnackBar(context, state.status);
          Navigator.pushNamed(
            context,
            RoutesName.resetPasswordScreen,
            arguments: widget.email,
          );
          log(
            "email from EmailVerificationScreenBody to ResetPasswordScreen: ${widget.email}",
          );
        } else if (state is EmailVerificationFailure) {
          showErrorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Email verification',
                    style: AppTextStyles.instance.textStyle18.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Please enter your code that was sent to your email address',
                    style: AppTextStyles.instance.textStyle14,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: 45.w,
                    height: 70.h,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: Color(0xffDFE7F7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 1.5,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        EmailVerificationCubit.onChanged(
                          value,
                          index,
                          otpCode(),
                          focusNodes,
                          context,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            ResendCode(email: widget.email),
          ],
        );
      },
    );
  }
}
