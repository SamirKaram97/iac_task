part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginPressedEvent extends LoginEvent {
  final LoginStrategy authStrategy;

  const LoginPressedEvent({required this.authStrategy});

  @override
  List<Object> get props => [authStrategy];
}

