import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iac_task/core/routes/routes_manager.dart';
import 'package:iac_task/core/theme/app_theme.dart';
import 'package:iac_task/core/utils/app_constants.dart';
import 'package:iac_task/core/utils/app_strings.dart';

class IACApp extends StatelessWidget {
  const IACApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConstants.appSize,
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: AppTheme.lightTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
      ),
    );
  }
}
