import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iac_task/core/utils/app_colors.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/core/utils/app_styles.dart';

class LoginWelcomeSection extends StatelessWidget {
  const LoginWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcome,
          style: AppStyles.bold32TextStyle.copyWith(color: AppColors.blackColor),
        ),
        SizedBox(height: 10.h,),
        Text(
          AppStrings.enterDetailsLoginMessage,
          style: AppStyles.regular22TextStyle,
        ),
      ],
    );
  }
}