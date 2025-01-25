part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final APIStatus registerApiStatus;
  final String? registerApiMessage;

  const RegisterState(this.registerApiStatus, this.registerApiMessage);
  const RegisterState.init()
      : registerApiStatus = APIStatus.none,
        registerApiMessage = null;

  @override
  List<Object?> get props => [registerApiStatus,registerApiMessage];


  RegisterState copyWith({
    APIStatus? registerApiStatus,
    String? registerApiMessage,
  }) {
    return RegisterState(
      registerApiStatus ?? this.registerApiStatus,
      registerApiMessage ?? this.registerApiMessage,
    );
  }
}

