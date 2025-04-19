// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/domain/use_case/get_user_data_use_case.dart';
import 'package:flowery/features/profile/logout/domain/use_cases/logout_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserDataUseCase getUserDataUseCase;
  final LogoutUseCase logoutUseCase;
  ProfileCubit(this.getUserDataUseCase, this.logoutUseCase)
    : super(ProfileInitial());
  Future<void> getUserData() async {
    emit(ProfileLoading());
    final result = await getUserDataUseCase.invoke();
    result.fold(
      (failure) {
        emit(ProfileError(failure.errorMessage));
      },
      (user) {
        log("${user.firstName}=================================");
        log("${user.lastName}");
        log("${user.email}");
        emit(ProfileSucess(user: user));
        emit(ProfileSucess(user: user));
      },
    );
  }

  Future<void> userLogout() async {
    final result = await logoutUseCase.call();
    result.fold(
      (err) {
        emit(LogoutFailureState(err.errorMessage));
      },
      (message) {
        emit(LogoutSuccessState(message));
      },
    );
  }

  Future<void> showLogoutConfirmationDialog(BuildContext context)  {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to close dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
                // Call the logout function with proper error handling
                userLogout().catchError((error) {
                  log('Error during logout: $error');
                });
              },
            ),
          ],
        );
      },
    );
  }
}
