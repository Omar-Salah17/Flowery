part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final Map<String, dynamic> data;

  const ForgetPasswordSuccess({required this.data});
}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errorMessage;

  const ForgetPasswordFailure({required this.errorMessage});
}
