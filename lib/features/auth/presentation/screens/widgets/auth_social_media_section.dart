import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iac_task/core/utils/app_assets.dart';
import 'package:iac_task/core/utils/app_strings.dart';
import 'package:iac_task/core/utils/app_styles.dart';

class AuthSocialMediaSection extends StatelessWidget {
  const AuthSocialMediaSection({super.key, this.onGoogleTap, this.onFacebookTap});
  final void Function()? onGoogleTap;
  final void Function()? onFacebookTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppStrings.socialMediaText, style: AppStyles.light20TextStyle),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: onFacebookTap,
                child: Image.asset(
                  AppAssets.facebookIcon,
                  height: 50.w,
                  width: 50.w,
                )),
            SizedBox(
              width: 15.w,
            ),
            InkWell(
                onTap: onGoogleTap,
                child: Image.asset(
                  AppAssets.googleIcon,
                  height: 50.w,
                  width: 50.w,
                )),
          ],
        ),
      ],
    );
  }
}