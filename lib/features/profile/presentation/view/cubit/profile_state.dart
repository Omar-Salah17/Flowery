part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSucess extends ProfileState {
  final UserData user;

  const ProfileSucess({required this.user});

  @override
  List<Object> get props => [user];
}

final class ProfileError extends ProfileState {
  final String error;

  const ProfileError(this.error);

  @override
  List<Object> get props => [error];
}





class LogoutInitState extends ProfileState{}


class LogoutLoadingState extends ProfileState{}

class LogoutFailureState extends ProfileState{
  String errorMessage;
  LogoutFailureState(this.errorMessage);
}

class LogoutSuccessState extends ProfileState{
  String message;
  LogoutSuccessState(this.message);
}


