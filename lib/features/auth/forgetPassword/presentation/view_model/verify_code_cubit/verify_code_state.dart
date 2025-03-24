part of 'verify_code_cubit.dart';

sealed class VerifyCodeState extends Equatable {
  const VerifyCodeState();

  @override
  List<Object> get props => [];
}

final class VerifyCodeInitial extends VerifyCodeState {}

final class VerifyCodeLoading extends VerifyCodeState {}

final class VerifyCodeSuccess extends VerifyCodeState {
  final Map<String, dynamic> data;

  const VerifyCodeSuccess({required this.data});
}

final class VerifyCodeFailure extends VerifyCodeState {
  final String errorMessage;

 const VerifyCodeFailure({required this.errorMessage});
}
