import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:slidee_app/core/components/custom_password_filed.dart';
import 'package:slidee_app/core/components/custom_text_filed.dart';
import 'package:slidee_app/core/utils/assets_manager.dart';
import 'package:slidee_app/features/auth/login_screen/presentation/widgets/custom_button.dart';
import 'package:slidee_app/features/auth/login_screen/presentation/widgets/custom_checkbox.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../widgets/dont_have_account.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                IconAssets.logo,
                width: 200.w,
                height: 200.h,
              ),
              Text(
                'Welcome Slidee' '👋',
                style: getBoldStyle(
                    color: ColorManager.secondaryPrimary, fontSize: 18.sp),
              ),
              Text(
                'Enter your Email & Password to Sign in',
                style: getSemiBoldStyle(
                    color: ColorManager.secondaryPrimary.withOpacity(0.4),
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextFiled(
                hintText: 'Your Email',
                borderRadius: BorderRadius.all(Radius.circular(32.r)),
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomPasswordFiled(
                hintText: 'Password',
                borderRadius: BorderRadius.all(Radius.circular(32.r)),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomCheckbox(),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    'Forget Password?',
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomElevatedButton(
                title: 'Sign in',
                icon: Icons.arrow_forward,
                onPressed: () {},
              ),
              SizedBox(
                height: 24.h,
              ),
              DontHaveAccount(
                decrp: 'Don\'t have an account?',
                title: 'Sign up',
                onPress: () {
                  context.go(Routes.registerRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
