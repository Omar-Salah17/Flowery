// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/domain/use_case/get_user_data_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserDataUseCase getUserDataUseCase;
  ProfileCubit(this.getUserDataUseCase) : super(ProfileInitial());
  void getUserData() async {
    emit(ProfileLoading());
    final result = await getUserDataUseCase.invoke();
    result.fold(
      (failure) {
        emit(ProfileError(failure.errorMessage));
      },
      (user) {
        print("${user.firstName}=================================");
        print(user.lastName);
        print(user.email);
        emit(ProfileSucess(user: user));
      },
    );
  }
}
