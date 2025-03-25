import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/custom_text_form_fieled.dart';
import 'package:flowery/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.arrow_back_ios),
            horizontalSpace(10),
            Text('Sign Up', style: text.titleMedium),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: GlobalKey<FormState>(),
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
                        hintText: 'Enter First Name',
                        labelText: 'First Name',
                        shouldObscureText: false,
                        textEditingController: TextEditingController(),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormFieled(
                        hintText: 'Enter Last Name',
                        labelText: 'Last Name',
                        shouldObscureText: false,
                        textEditingController: TextEditingController(),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: CustomTextFormFieled(
                  hintText: 'Enter your email',
                  labelText: 'email',
                  shouldObscureText: false,
                  textEditingController: TextEditingController(),
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
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        shouldObscureText: true,
                        textEditingController: TextEditingController(),
                        validator: (value) => Validator.validatePassword(value),
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
                              "textEditingControllerOfPassword.text",
                            ),
                        hintText: 'Enter Last Name',
                        labelText: 'Last Name',
                        shouldObscureText: true,
                        textEditingController: TextEditingController(),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: CustomTextFormFieled(
                  hintText: 'Enter your phone number',
                  labelText: 'Phone Number',
                  shouldObscureText: false,
                  textEditingController: TextEditingController(),
                  validator: (val) {
                    return Validator.validatePhoneNumber(val);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                child: Row(
                  children: [
                    Text(
                      'Gender',
                      style: text.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    horizontalSpace(20),

                    Radio<String>(
                      value: "Female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                      activeColor: PalletsColors.mainColorBase,
                    ),
                    Text(
                      "Female",
                      style: text.bodyMedium!.copyWith(
                        color: PalletsColors.gray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    horizontalSpace(20),

                    Radio<String>(
                      activeColor: PalletsColors.mainColorBase,
                      value: "Male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    Text(
                      "Male",
                      style: text.bodyMedium!.copyWith(
                        color: PalletsColors.gray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),

                child: RichText(
                  text: TextSpan(
                    style: text.bodySmall?.copyWith(
                      color: PalletsColors.black100,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: "Creating an account, you agree to our "),
                      TextSpan(
                        text: "Terms & Conditions",
                        style: text.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: PalletsColors.black100,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 48.h),
                child: ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: text.bodySmall!.copyWith(
                      color: PalletsColors.black100,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: text.bodySmall!.copyWith(
                        color: PalletsColors.mainColorBase,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
