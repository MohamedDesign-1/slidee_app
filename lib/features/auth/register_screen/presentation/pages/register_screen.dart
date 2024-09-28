import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:slidee_app/core/components/validators.dart';
import 'package:slidee_app/core/utils/toast_utils.dart';
import 'package:slidee_app/features/auth/register_screen/presentation/manager/register_cubit.dart';

import '../../../../../config/di/di.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../core/components/custom_password_filed.dart';
import '../../../../../core/components/custom_text_filed.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../login_screen/presentation/widgets/custom_button.dart';
import '../../../login_screen/presentation/widgets/dont_have_account.dart';

class RegisterScreen extends StatelessWidget {
  RegisterCubit cubit = getIt<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is RegisterError) {
          print('Error state reached');
          ToastUtils.showErrorToast('Error', context, state.message.errorMessage);
        }
        if (state is RegisterSuccess) {
          print('Success state reached');
          ToastUtils.showSuccessToast('Success', context, 'Register Success');
          context.go(Routes.createNewProfile);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: cubit.formKey,
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
                              color: ColorManager.secondaryPrimary,
                              fontSize: 18.sp),
                        ),
                        Text(
                          'Sign up and enjoy our community',
                          style: getSemiBoldStyle(
                              color: ColorManager.secondaryPrimary.withOpacity(
                                  0.4),
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomTextFiled(
                          controller: cubit.nameController,
                          validator: AppValidators.validateName,
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
                          validator: AppValidators.validateEmail,
                          controller: cubit.emailController,
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
                          validator: AppValidators.validatePassword,
                          controller: cubit.passwordController,
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
                          validator: AppValidators.validatePassword,
                          controller: cubit.confirmPasswordController,
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
                            cubit.onRegisterButtonPressed();
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
                ),
              ),
            )
        );
      },
    );
  }
}
