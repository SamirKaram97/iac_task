part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
}


class RegisterPressedEvent extends RegisterEvent {
  final RegisterStrategy registerStrategy;

  const RegisterPressedEvent({required this.registerStrategy});
  @override
  List<Object> get props => [registerStrategy];
}
