import 'package:flutter/material.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/features/auth/presentation/screens/register/widgets/register_body.dart';
import 'package:iac_task/features/auth/presentation/screens/widgets/auth_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: AuthAppBar(title: AppStrings.createAccount),
      body: RegisterBody(),
      
    );
  }
}
