import 'package:flutter/cupertino.dart';
import 'package:iac_task/core/utils/app_strings.dart';

class LoginFillData {
   late TextEditingController emailOrUsernameController;
   late TextEditingController passwordController;
   GlobalKey<FormState>? formStateKey;

   void dispose() {
    emailOrUsernameController.dispose();
    passwordController.dispose();
    formStateKey=null;
  }

   void init() {
    emailOrUsernameController = TextEditingController();
    passwordController = TextEditingController();
    formStateKey = GlobalKey<FormState>();
  }

   bool validate() => formStateKey?.currentState?.validate() ?? false;


   String? passwordValidator(String? value) {
     if(value!.length < 6){
       return AppStrings.passwordMustBeMoreThan6;
     }
     return null;
   }
}