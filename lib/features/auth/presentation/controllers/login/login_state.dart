part of 'login_bloc.dart';

class LoginState extends Equatable {
  final APIStatus loginApiStatus;
  final String? loginApiMessage;
  final UserDataModel? userDataModel;

  const LoginState(
      {required this.loginApiStatus,
      required this.loginApiMessage,
      required this.userDataModel,});

  const LoginState.init()
      : loginApiStatus = APIStatus.none,
        userDataModel = null,
        loginApiMessage = null;

  @override
  List<Object?> get props => [loginApiStatus, userDataModel,loginApiMessage];

  LoginState copyWith({
    APIStatus? loginApiStatus,
    String? loginApiMessage,
    UserDataModel? userDataModel,
    bool? isPasswordShown,
  }) {
    return LoginState(
      loginApiStatus: loginApiStatus ?? this.loginApiStatus,
      loginApiMessage: loginApiMessage ?? this.loginApiMessage,
      userDataModel: userDataModel ?? this.userDataModel,
    );
  }

}
