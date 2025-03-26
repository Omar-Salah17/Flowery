part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterError extends RegisterState {
  final String errorMessage;
  const RegisterError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

final class RegisterSuccess extends RegisterState {
final  RegisterEntity registerEntity;
  const RegisterSuccess(this.registerEntity);
} 
final class SelectGender extends RegisterState {}
