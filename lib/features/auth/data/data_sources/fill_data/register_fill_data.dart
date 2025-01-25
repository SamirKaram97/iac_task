import 'package:flutter/cupertino.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:validators/validators.dart';

class RegisterFillData {
  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController confirmPasswordController;

  late TextEditingController nameController;

  late TextEditingController dateOfBirthController;

  late TextEditingController mobileNumberController;

  GlobalKey<FormState>? formStateKey;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    dateOfBirthController.dispose();
    mobileNumberController.dispose();
    formStateKey = null;
  }

  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nameController = TextEditingController();
    dateOfBirthController = TextEditingController();
    mobileNumberController = TextEditingController();
    formStateKey = GlobalKey<FormState>();
  }

  bool validate() => formStateKey?.currentState?.validate() ?? false;

  String? emailValidator() {
    if (!isEmail(emailController.text)) {
      return AppStrings.emailMustBeValid;
    }
    return null;
  }

  String? passwordValidator() {
    if (passwordController.text.length < 6) {
      return AppStrings.passwordMustBeMoreThan6;
    }
    return null;
  }
  String? confirmPasswordValidator() {
    if(confirmPasswordController.text != passwordController.text) {
      return AppStrings.passwordNotMatch;
    }
    return null;
  }

  String? phoneValidator() {
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    if (!phoneRegex.hasMatch(mobileNumberController.text)) {
      return AppStrings.phoneMustBeValid;
    }
    return null;
  }
  String? dateValidator() {
    // if(!isDate(dateOfBirthController.text)) {
    //   return AppStrings.dateMustBeValid;
    // }
    return null;
  }


}
