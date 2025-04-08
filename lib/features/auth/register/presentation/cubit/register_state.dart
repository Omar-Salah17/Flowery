part of 'register_cubit.dart';

class RegisterStates extends Equatable {
  RequestState state;
  String errorMessage;
  RegisterEntity? registerEntity;
  RegisterStates({
    this.state = RequestState.initial,
    this.errorMessage = '',
    this.registerEntity,
  });
  copyWith({
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
