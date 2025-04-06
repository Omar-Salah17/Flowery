import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final Map<String, dynamic> data;

  const LoginSuccess({required this.data});
}

final class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure({required this.errorMessage});
}
