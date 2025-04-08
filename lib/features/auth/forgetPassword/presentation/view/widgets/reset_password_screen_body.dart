import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
import 'package:flowery/core/utils/validator.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreenBody extends StatefulWidget {
  const ResetPasswordScreenBody({super.key, required this.email});
  final String email;
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
      child: Form(
        key: formKey,
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              showSnackBar(context, state.data["message"]);
              Navigator.pushNamed(context, RoutesName.login);
            } else if (state is ResetPasswordFailure) {
              showErrorSnackBar(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            return Column(
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
                CustomTextFormFieled(
                  textEditingController: newPasswordController,
                  labelText: 'New password',
                  hintText: 'Enter you password',
                  shouldObscureText: true,
                  validator: (value) {
                    return Validator.validatePassword(value);
                  },
                ),
                SizedBox(height: 24.h),
                CustomTextFormFieled(
                  textEditingController: confirmPasswordController,
                  labelText: 'Confirm password',
                  hintText: 'Confirm password',
                  shouldObscureText: true,
                  validator: (value) {
                    return Validator.validateConfirmPassword(
                      value,
                      newPasswordController.text.trim(),
                    );
                  },
                ),
                SizedBox(height: 48.h),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<ResetPasswordCubit>().resetPassword(
                        email: widget.email,
                        newPassword: newPasswordController.text.trim(),
                      );
                    }
                  },
                  child:
                      state is ResetPasswordLoading
                          ? Center(
                            child: CircularProgressIndicator(
                              color: PalletsColors.white10,
                            ),
                          )
                          : Text('Confirm'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
