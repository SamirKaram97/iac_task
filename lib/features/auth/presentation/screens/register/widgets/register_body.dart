import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iac_task/core/extensions/animation_extension.dart';
import 'package:iac_task/core/service/service_locator.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/features/auth/data/strategy/register_facebook_strategy.dart';
import 'package:iac_task/features/auth/data/strategy/register_google_strategy.dart';
import 'package:iac_task/features/auth/presentation/controllers/register/register_bloc.dart';
import 'package:iac_task/features/auth/presentation/screens/register/widgets/register_button_consumer.dart';
import 'package:iac_task/features/auth/presentation/screens/register/widgets/register_input_data_section.dart';
import 'package:iac_task/features/auth/presentation/screens/register/widgets/terms_section.dart';
import 'package:iac_task/features/auth/presentation/screens/widgets/auth_login_and_register_page_switcher.dart';
import 'package:iac_task/features/auth/presentation/screens/widgets/auth_social_media_section.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const RegisterInputDataSection().animateFadeInUp(),
            SizedBox(
              height: 20.h,
            ),
            const TermsSection(),
            const RegisterButtonConsumer(),
            AuthSocialMediaSection(
              onFacebookTap: () => context.read<RegisterBloc>().add(
                  RegisterPressedEvent(
                      registerStrategy: sl<FacebookRegisterStrategy>())),
              onGoogleTap: () => context.read<RegisterBloc>().add(
                  RegisterPressedEvent(
                      registerStrategy: sl<GoogleRegisterStrategy>())),
            ),
            SizedBox(
              height: 10.h,
            ),
            const AuthLoginAndRegisterPageSwitcher(
              text: AppStrings.alreadyHaveAccount,
              linkText: AppStrings.login,
            )
          ],
        ),
      ),
    );
  }
}
