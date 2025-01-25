import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iac_task/core/database/api/api_status.dart';
import 'package:iac_task/features/auth/domain/strategy/register_strategy.dart';
import 'package:iac_task/features/auth/domain/use_cases/register_use_case.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterBloc(this.registerUseCase) : super(const RegisterState.init()) {
    on<RegisterPressedEvent>(_register);

  }

  Future<void> _register(
      RegisterPressedEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(registerApiStatus: APIStatus.loading));

    //used strategy design pattern to achieve this
    var result = await registerUseCase(event.registerStrategy);
    result.fold(
          (l) {
        emit(state.copyWith(
            registerApiStatus: APIStatus.error, registerApiMessage: l.errMessage));
      },
          (_) {
        emit(state.copyWith(
            registerApiStatus: APIStatus.success));
      },
    );
  }

}
