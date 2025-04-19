part of 'register_cubit.dart';

class RegisterStates extends Equatable {
  final RequestState state;
  final String errorMessage;
  final RegisterEntity? registerEntity;
  const RegisterStates({
    this.state = RequestState.initial,
    this.errorMessage = '',
    this.registerEntity,
  });
  RegisterStates copyWith({
    RequestState? state,
    String? errorMessage,
    RegisterEntity? registerEntity,
  }) {
    return RegisterStates(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      registerEntity: registerEntity ?? this.registerEntity,
    );
  }

  @override
  List<Object?> get props => [state, registerEntity];
}
