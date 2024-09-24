import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/components/custom_password_filed.dart';
import '../../../../../core/components/custom_text_filed.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../login_screen/presentation/widgets/custom_button.dart';
import '../../../login_screen/presentation/widgets/dont_have_account.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                'Sign up and enjoy our community',
                style: getSemiBoldStyle(
                    color: ColorManager.secondaryPrimary.withOpacity(0.4),
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextFiled(
                hintText: 'User Name',
                borderRadius: BorderRadius.all(Radius.circular(32.r)),
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: ColorManager.primary,
                ),
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
                height: 24.h,
              ),
              CustomPasswordFiled(
                hintText: 'Confirm Password',
                borderRadius: BorderRadius.all(Radius.circular(32.r)),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomElevatedButton(
                title: 'Sign Up',
                icon: Icons.arrow_forward,
                onPressed: () {
                  context.go(Routes.mainLayoutRoute);
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              DontHaveAccount(
                decrp: 'Already have an account?',
                title: 'Sign In',
                onPress: () {
                  context.go(Routes.loginRoute);
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
