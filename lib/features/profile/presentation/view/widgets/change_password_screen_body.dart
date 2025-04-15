import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
import 'package:flowery/core/utils/validator.dart';
import 'package:flowery/features/profile/presentation/view_model/change_pass_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: Form(
        key: formKey,
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
              textEditingController: newPassWord,
              labelText: 'New password',
              hintText: 'New password',
              shouldObscureText: true,
              validator: (value) => Validator.validatePassword(value),
            ),
            SizedBox(height: 24.h),
            CustomTextFormFieled(
              textEditingController: confirmPassword,
              labelText: 'Confirm password',
              hintText: 'Confirm password',
              shouldObscureText: true,
              validator:
                  (value) => Validator.validateConfirmPassword(
                    value,
                    newPassWord.text.trim(),
                  ),
            ),
            SizedBox(height: 48.h),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  triggerChangePasswordCubit(context);
                  autovalidateMode = AutovalidateMode.disabled;
                  setState(() {});
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: PalletsColors.black30,
              ),
              child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordFailure) {
                    showErrorSnackBar(context, state.errorMessage);
                  }
                  if (state is ChangePasswordSuccess) {
                    showSnackBar(context, state.data["message"]);
                  }
                },
                builder: (context, state) {
                  if (state is ChangePasswordLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Text('Update');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void triggerChangePasswordCubit(BuildContext context) {
    context.read<ChangePasswordCubit>().changePassword(
      oldPassword: oldPassWord.text.trim(),
      newPassword: newPassWord.text.trim(),
    );
  }
}
