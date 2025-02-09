import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iac_task/core/routes/routes_manager.dart';
import 'package:iac_task/core/utils/app_colors.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/core/utils/app_styles.dart';

class AuthLoginAndRegisterPageSwitcher extends StatelessWidget {
  final String text;
  final String linkText;


  const AuthLoginAndRegisterPageSwitcher({
    Key? key,
    required this.text,
    required this.linkText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(
            text: text,
            style: AppStyles.light20TextStyle,
            children: [
              TextSpan(
                text: ' $linkText',
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = linkText == AppStrings.signUp ? () {
                    Navigator.pushNamed(context, Routes.registerViewRoute);
                  } : () {
                    Navigator.pop(context);
                  },),
            ],
          )),
    );
  }
}