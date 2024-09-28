import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:slidee_app/core/components/custom_password_filed.dart';
import 'package:slidee_app/core/components/custom_text_filed.dart';
import 'package:slidee_app/core/components/validators.dart';
import 'package:slidee_app/core/utils/assets_manager.dart';
import 'package:slidee_app/core/utils/toast_utils.dart';
import 'package:slidee_app/features/auth/login_screen/presentation/manager/login_cubit.dart';
import 'package:slidee_app/features/auth/login_screen/presentation/widgets/custom_button.dart';
import 'package:slidee_app/features/auth/login_screen/presentation/widgets/custom_checkbox.dart';

import '../../../../../config/di/di.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../widgets/dont_have_account.dart';

class LoginScreen extends StatelessWidget {

  LoginCubit loginCubit = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: loginCubit,
      listener: (context, state) {
      if (state is LoginError) {
      ToastUtils.showErrorToast('Error', context, state.faliures.errorMessage);
        }
      if (state is LoginSuccess) {
        ToastUtils.showSuccessToast('Success', context, 'Login Success');
        context.go(Routes.mainLayoutRoute);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: loginCubit.formKey,
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
                        controller: loginCubit.emailController,
                        validator: AppValidators.validateEmail,
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
                        controller: loginCubit.passwordController,
                        validator: AppValidators.validatePassword,
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
                        onPressed: () {
                          loginCubit.onPressedLogin();
                        },
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
            ),
          ),
        );
      },
    );
  }
}
