import 'package:flutter/material.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/core/utils/app_styles.dart';

class TermsSection extends StatelessWidget {
  const TermsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(AppStrings.byContinue,style: AppStyles.light20TextStyle,),
        RichText(
            text: TextSpan(
              text: AppStrings.termsOfUse,
              style: AppStyles.bold20TextStyle,
              children: [
                TextSpan(
                  text: AppStrings.and,
                  style:  AppStyles.light20TextStyle,),
                TextSpan(
                  text: AppStrings.privacyPolicy,
                  style:  AppStyles.bold20TextStyle,),
              ],
            ))
      ],
    );
  }
}


