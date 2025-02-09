import 'package:flutter/material.dart';
import 'package:iac_task/core/utils/app_colors.dart';
import 'package:iac_task/core/utils/app_styles.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool arrowBack;


  const AuthAppBar({
    Key? key,
    required this.title,
    this.arrowBack=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.scaffoldWhiteColor,
      centerTitle: true,
      title: Text(
          title,
          style: AppStyles.bold32TextStyle
      ),
      leading: arrowBack?IconButton(onPressed: () => Navigator.pop(context), icon:  const Icon(Icons.arrow_back,color: AppColors.blackColor,)):null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}