import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iac_task/core/components/toast/toast.dart';
import 'package:iac_task/core/database/api/api_status.dart';
import 'package:iac_task/core/service/service_locator.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/core/widgets/custom_button.dart';
import 'package:iac_task/features/auth/data/data_sources/fill_data/register_fill_data.dart';
import 'package:iac_task/features/auth/data/strategy/register_email_strategy.dart';
import 'package:iac_task/features/auth/presentation/controllers/register/register_bloc.dart';

class RegisterButtonConsumer extends StatelessWidget {
  const RegisterButtonConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) {
        bool rebuild=previous.registerApiStatus!=current.registerApiStatus;
        return rebuild;
      },
      listenWhen: (previous, current) {
        bool rebuild=previous.registerApiStatus!=current.registerApiStatus;
        return rebuild;
      },
      listener: (context, state) {
        _handleRegisterStates(state);
      },
      builder: (context, state) {
        return CustomButton(
            isLoading: state.registerApiStatus.isLoading,
            text: AppStrings.signUp,
            onPressed: () {
              _registerPerform(context);
            });
      },
    );
  }

  void _handleRegisterStates(RegisterState state) {
    if (state.registerApiStatus.isError) {
      showToast(
          state: ToastState.EROOR,
          text: state.registerApiMessage ?? AppStrings.someThingWentWrong);
    } else if (state.registerApiStatus.isSuccess) {
      showToast(
          state: ToastState.SUCCESS,
          text:
          state.registerApiMessage ?? AppStrings.registerSuccessfully);
    }

  }

  void _registerPerform(BuildContext context) {
    if(sl<RegisterFillData>().validate())
      {
        context.read<RegisterBloc>().add(RegisterPressedEvent(registerStrategy: sl<EmailPasswordRegisterStrategy>()));
      }
  }
}