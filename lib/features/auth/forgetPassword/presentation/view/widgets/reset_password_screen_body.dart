import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreenBody extends StatefulWidget {
  const ResetPasswordScreenBody({super.key});

  @override
  State<ResetPasswordScreenBody> createState() =>
      _ResetPasswordScreenBodyState();
}

class _ResetPasswordScreenBodyState extends State<ResetPasswordScreenBody> {
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Text(
            "Reset Password",
            style: AppTextStyles.instance.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Password must not be empty and must contain 6 characters with upper case letter and one number at least ",
              textAlign: TextAlign.center,
              style: AppTextStyles.instance.textStyle14.copyWith(
                color: PalletsColors.gray,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          CustomTextFormField(
            textEditingController: newPasswordController,
            labelText: 'New password',
            hintText: 'Enter you password',
            shouldObscureText: false,
          ),
          SizedBox(height: 24.h),
          CustomTextFormField(
            textEditingController: confirmPasswordController,
            labelText: 'Confirm password',
            hintText: 'Confirm password',
            shouldObscureText: false,
          ),
          SizedBox(height: 48.h),
          ElevatedButton(onPressed: () {}, child: Text('Confirm')),
        ],
      ),
    );
  }
}
