import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iac_task/core/database/api/api_status.dart';
import 'package:iac_task/features/auth/data/models/user_data_model.dart';
import 'package:iac_task/features/auth/domain/strategy/login_strategy.dart';
import 'package:iac_task/features/auth/domain/use_cases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(const LoginState.init()) {
    on<LoginPressedEvent>(_login);

  }

  Future<void> _login(
      LoginPressedEvent event, Emitter<LoginState> emit) async {

    emit(state.copyWith(loginApiStatus: APIStatus.loading));

    //used strategy design pattern to achieve this
    var result = await loginUseCase(event.authStrategy);
    result.fold(
          (l) {
        emit(state.copyWith(
            loginApiStatus: APIStatus.error, loginApiMessage: l.errMessage));
      },
          (useData) {
        emit(state.copyWith(
            loginApiStatus: APIStatus.success, userDataModel: useData));
      },
    );
  }}
