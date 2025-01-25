import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iac_task/core/utils/app_colors.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/core/utils/app_styles.dart';

class CustomTextFormFiled extends StatefulWidget {
  const CustomTextFormFiled(
      {super.key,
      required this.title,
      required this.controller,
      required this.keyboardType,
      required this.hintText, this.validator});

  final TextEditingController controller;

  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  bool isPasswordShown = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppStyles.bold22TextStyle,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          child: TextFormField(
            validator: (value) {
                return _validate(value);
            },
            cursorColor: AppColors.primaryColor,
            obscureText: !isPasswordShown&&widget.keyboardType == TextInputType.visiblePassword,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            style: AppStyles.regular22TextStyle,
            decoration: _buildInputDecoration(),
          ),
        ),
      ],
    );
  }

  String? _validate(String? value) {
    if(value==null || value.isEmpty) {
      return AppStrings.canNotBeEmpty;
    }
    return widget.validator != null ? widget.validator!(value): null;
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      suffixIcon:widget.keyboardType == TextInputType.visiblePassword ? IconButton(
        onPressed: () {

          setState(() {
            isPasswordShown = !isPasswordShown;
          });
        },
        icon: Icon(
          size: 32.w,
          isPasswordShown ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: AppColors.greyColor,
        ),
      ):null,
      hintText: widget.hintText,
      hintStyle:
          AppStyles.regular22TextStyle.copyWith(color: AppColors.greyColor),
      filled: true,
      fillColor: AppColors.color2,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      errorStyle: AppStyles.regular14TextStyle.copyWith(color: Colors.red),
    );
  }
}
