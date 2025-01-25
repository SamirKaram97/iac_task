import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iac_task/core/extensions/animation_extension.dart';
import 'package:iac_task/core/service/service_locator.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/features/auth/data/data_sources/fill_data/login_fill_data.dart';
import 'package:iac_task/features/auth/presentation/screens/widgets/custom_text_from_filed.dart';

class LoginInputSection extends StatelessWidget {
  const LoginInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    LoginFillData loginFillData = sl<LoginFillData>();
    return Form(
        key:loginFillData.formStateKey,
      child: Column(
        children: [
          CustomTextFormFiled(
              title: AppStrings.emailOrUsername,
              controller: loginFillData.emailOrUsernameController,
              keyboardType: TextInputType.emailAddress,
              hintText: AppStrings.emailOrUsernameHint).animateSlideInLeft(),
          SizedBox(height: 30.h,),
          CustomTextFormFiled(
              validator: (value) =>loginFillData.passwordValidator(value),
              title: AppStrings.password,
              controller: loginFillData.passwordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: AppStrings.passwordHint).animateSlideInRight(),
        ],
      ),
    );
  }
}
