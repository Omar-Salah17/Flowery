import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreenBody extends StatefulWidget {
  const ChangePasswordScreenBody({super.key});

  @override
  State<ChangePasswordScreenBody> createState() =>
      _ChangePasswordScreenBodyState();
}

class _ChangePasswordScreenBodyState extends State<ChangePasswordScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController oldPassWord;
  late TextEditingController newPassWord;
  late TextEditingController confirmPassword;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    oldPassWord = TextEditingController();
    newPassWord = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    oldPassWord.dispose();
    newPassWord.dispose();
    confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 32.h),
          CustomTextFormFieled(
            textEditingController: oldPassWord,
            labelText: 'Current password',
            hintText: 'Current password',
            shouldObscureText: true,
          ),
          SizedBox(height: 24.h),
          CustomTextFormFieled(
            textEditingController: oldPassWord,
            labelText: 'New password',
            hintText: 'New password',
            shouldObscureText: true,
          ),
          SizedBox(height: 24.h),
          CustomTextFormFieled(
            textEditingController: oldPassWord,
            labelText: 'Confirm password',
            hintText: 'Confirm password',
            shouldObscureText: true,
          ),
        ],
      ),
    );
  }
}
