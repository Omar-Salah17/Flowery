part of 'email_verification_cubit.dart';

sealed class EmailVerificationState extends Equatable {
  const EmailVerificationState();

  @override
  List<Object> get props => [];
}

final class EmailVerificationInitial extends EmailVerificationState {}

final class EmailVerificationLoading extends EmailVerificationState {}

final class EmailVerificationSuccess extends EmailVerificationState {
  final String status;

  const EmailVerificationSuccess({required this.status});
}

final class EmailVerificationFailure extends EmailVerificationState {
  final String errorMessage;

  const EmailVerificationFailure({required this.errorMessage});
}
