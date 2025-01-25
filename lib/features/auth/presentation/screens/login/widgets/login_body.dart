import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iac_task/core/extensions/animation_extension.dart';
import 'package:iac_task/core/service/service_locator.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/core/utils/app_styles.dart';
import 'package:iac_task/features/auth/data/strategy/login_facebook_strategy.dart';
import 'package:iac_task/features/auth/data/strategy/login_google_strategy.dart';
import 'package:iac_task/features/auth/presentation/controllers/login/login_bloc.dart';
import 'package:iac_task/features/auth/presentation/screens/login/widgets/login_button_consumer.dart';
import 'package:iac_task/features/auth/presentation/screens/login/widgets/login_input_section.dart';
import 'package:iac_task/features/auth/presentation/screens/login/widgets/login_welcome_section.dart';
import 'package:iac_task/features/auth/presentation/screens/widgets/auth_login_and_register_page_switcher.dart';
import 'package:iac_task/features/auth/presentation/screens/widgets/auth_social_media_section.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginWelcomeSection().animateFadeInUp(),
            SizedBox(
              height: 100.h,
            ),
            const LoginInputSection(),
            SizedBox(
              height: 60.h,
            ),
            const LoginButtonConsumer(),
            SizedBox(
              height: 15.h,
            ),
            //forgot Password text
            Center(
                child: Text(AppStrings.forgotPassword,
                    style: AppStyles.bold22TextStyle)),
            SizedBox(
              height: 170.h,
            ),
            AuthSocialMediaSection(
              onFacebookTap: () => context.read<LoginBloc>().add(
                  LoginPressedEvent(authStrategy: sl<FacebookLoginStrategy>())),
              onGoogleTap: () => context.read<LoginBloc>().add(
                  LoginPressedEvent(authStrategy: sl<GoogleLoginStrategy>())),
            ),
            SizedBox(
              height: 10.h,
            ),
            const AuthLoginAndRegisterPageSwitcher(
              text: AppStrings.dontHaveAccount,
              linkText: AppStrings.signUp,
            )
          ],
        ),
      ),
    );
  }
}
