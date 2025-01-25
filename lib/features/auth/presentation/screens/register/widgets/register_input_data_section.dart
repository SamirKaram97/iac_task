import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iac_task/core/service/service_locator.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/features/auth/data/data_sources/fill_data/register_fill_data.dart';
import 'package:iac_task/features/auth/presentation/screens/widgets/custom_text_from_filed.dart';

class RegisterInputDataSection extends StatelessWidget {
  const RegisterInputDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterFillData registerFillData = sl<RegisterFillData>();
    return Form(
      key: registerFillData.formStateKey,
      child: Column(
        //can replace the size box with spacing parameter in column
        // SizedBox(height: 14.h,),
        //if use newest version from flutter

        children: [
          CustomTextFormFiled(
            controller: registerFillData.nameController,
            title: AppStrings.fullName,
            keyboardType: TextInputType.text, hintText: AppStrings.emailOrUsernameHint,
          ),
          SizedBox(height: 14.h,),
          CustomTextFormFiled(
            validator: (value) =>registerFillData.emailValidator(),
            controller: registerFillData.emailController,
            title: AppStrings.email,
            keyboardType: TextInputType.emailAddress, hintText: AppStrings.emailOrUsernameHint,
          ),
          SizedBox(height: 14.h,),
          CustomTextFormFiled(
            validator: (value) =>registerFillData.phoneValidator(),
            controller: registerFillData.mobileNumberController,
            title: AppStrings.mobileNumber,
            keyboardType: TextInputType.number, hintText: AppStrings.mobileNumberHint,
          ),
          SizedBox(height: 14.h,),
          CustomTextFormFiled(
            validator: (value) =>registerFillData.dateValidator(),
            controller: registerFillData.dateOfBirthController,
            title: AppStrings.dateOfBirth,
            keyboardType: TextInputType.datetime, hintText: AppStrings.dateOfBirthHint,
          ),
          SizedBox(height: 14.h,),
          CustomTextFormFiled(
            validator: (value) =>registerFillData.passwordValidator(),
            controller: registerFillData.passwordController,
            title: AppStrings.password,
            keyboardType: TextInputType.visiblePassword, hintText: AppStrings.passwordHint,
          ),
          SizedBox(height: 14.h,),
          CustomTextFormFiled(
            validator: (value) =>registerFillData.confirmPasswordValidator(),
            controller: registerFillData.confirmPasswordController,
            title: AppStrings.confirmPassword,
            keyboardType: TextInputType.visiblePassword, hintText: AppStrings.passwordHint,
          ),
        ],
      ),
    );
  }
}
