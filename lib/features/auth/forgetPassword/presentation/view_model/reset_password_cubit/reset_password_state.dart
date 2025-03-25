part of 'reset_password_cubit.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ResetPasswordLoading extends ResetPasswordState {}
final class ResetPasswordSuccess extends ResetPasswordState {
  final Map<String, dynamic> data;
  const ResetPasswordSuccess({required this.data});
}
final class ResetPasswordFailure extends ResetPasswordState {
  final String errorMessage;

 const ResetPasswordFailure({required this.errorMessage});
}
