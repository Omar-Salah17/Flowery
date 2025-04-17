import 'dart:io';

import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/custom_text_form_fieled.dart';
import '../../../../core/utils/validator.dart';
import '../view_model/edit_profile_cubit.dart';
import '../view_model/edit_profile_state.dart';

class EditProfileView extends StatefulWidget {
  final UserData user;
  const EditProfileView({super.key, required this.user});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;

  File? selectedImage;

  @override
  void initState() {
    super.initState();

    print('**********************************${widget.user.firstName}');
    firstNameController = TextEditingController(text: widget.user.firstName);
    lastNameController = TextEditingController(text: widget.user.lastName);
    emailController = TextEditingController(text: widget.user.email);
    phoneNumberController = TextEditingController(text: widget.user.phone);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
      });
    } else {
      selectedImage = File(widget.user.photo!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final cubit = context.read<EditProfileCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Edit Profile", style: text.titleMedium),
      ),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state.status == EditProfileStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profile updated successfully")),
            );
          } else if (state.status == EditProfileStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? "Update failed")),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                selectedImage != null
                                    ? FileImage(selectedImage!)
                                    : (widget.user.photo != null
                                            ? NetworkImage(widget.user.photo!)
                                            : const AssetImage(''))
                                        as ImageProvider,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: PalletsColors.mainColor30,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                onPressed: pickImage,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(50),

                    // First & Last Name
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormFieled(
                            labelText: 'First Name',
                            shouldObscureText: false,
                            textEditingController: firstNameController,
                            validator: Validator.validateName,
                            hintText: '',
                          ),
                        ),
                        horizontalSpace(20),
                        Expanded(
                          child: CustomTextFormFieled(
                            labelText: 'Last Name',
                            shouldObscureText: false,
                            textEditingController: lastNameController,
                            validator: Validator.validateName,
                            hintText: '',
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(12),

                    // Email
                    CustomTextFormFieled(
                      labelText: 'Email',
                      shouldObscureText: false,
                      textEditingController: emailController,
                      validator: Validator.validateEmail,
                      hintText: '',
                    ),
                    verticalSpace(12),

                    // Phone Number
                    CustomTextFormFieled(
                      labelText: 'Phone Number',
                      shouldObscureText: false,
                      textEditingController: phoneNumberController,
                      validator: Validator.validatePhoneNumber,
                      hintText: '',
                    ),
                    verticalSpace(30),

                    CustomTextFormFieled(
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      shouldObscureText: true,
                      readOnly: true,
                      textEditingController: TextEditingController(
                        text: '*********',
                      ),
                      suffix: GestureDetector(
                        child: GestureDetector(
                          onTap:
                              () => Navigator.pushNamed(
                                context,
                                RoutesName.changePasswordScreen,
                              ),
                          child: Text(
                            'Change',
                            style: AppTextStyles.instance.textStyle14.copyWith(
                              color: PalletsColors.mainColorBase,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),

                    verticalSpace(100),

                    // Save Button
                    state.status == EditProfileStatus.loading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              final updatedUser = UpdatedUserModel(
                                firstName: firstNameController.text.trim(),
                                lastName: lastNameController.text.trim(),
                                email: emailController.text.trim(),
                                phone: phoneNumberController.text.trim(),
                              );
                              if (selectedImage != null) {
                                await cubit.uploadProfilePhoto(selectedImage);
                              }
                              await cubit.editProfile(updatedUser);
                              Navigator.pop(context);
                            } else {
                              setState(() {
                                autoValidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                          child: const Text("Update Profile"),
                        ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
