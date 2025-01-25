import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iac_task/core/components/toast/toast.dart';
import 'package:iac_task/core/database/api/api_status.dart';
import 'package:iac_task/core/service/service_locator.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/core/widgets/custom_button.dart';
import 'package:iac_task/features/auth/data/data_sources/fill_data/login_fill_data.dart';
import 'package:iac_task/features/auth/data/strategy/login_email_strategy.dart';
import 'package:iac_task/features/auth/presentation/controllers/login/login_bloc.dart';

class LoginButtonConsumer extends StatelessWidget {
  const LoginButtonConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      buildWhen: (previous, current) {
        bool rebuild=previous.loginApiStatus!=current.loginApiStatus;
        return rebuild;
      },
      listenWhen: (previous, current) {
        bool rebuild=previous.loginApiStatus!=current.loginApiStatus;
        return rebuild;
      },
      listener: (context, state) {
        _handleLoginStates(state);
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state.loginApiStatus.isLoading,
          text: AppStrings.login,
          onPressed: ()=>_performLogin(context),
        );
      },
    );
  }

  void _handleLoginStates(LoginState state) {
    if(state.loginApiStatus.isError) {
      showToast(state: ToastState.EROOR, text: state.loginApiMessage??AppStrings.someThingWentWrong);
    }
    else if(state.loginApiStatus.isSuccess) {
      // Navigate To The Home Screen or any thing else
      showToast(state: ToastState.SUCCESS, text: "welcome ${state.userDataModel?.name??""}"??AppStrings.loginSuccessfully);
    }
  }
  void _performLogin(BuildContext context) {
    final loginFillData = sl<LoginFillData>();
    if (loginFillData.validate()) {
      context.read<LoginBloc>().add(LoginPressedEvent(authStrategy: sl<EmailPasswordLoginStrategy>()));
    }
  }
}