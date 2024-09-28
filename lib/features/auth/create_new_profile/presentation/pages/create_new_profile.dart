import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:slidee_app/config/routes/routes.dart';
import 'package:slidee_app/core/components/validators.dart';
import 'package:slidee_app/features/auth/login_screen/presentation/widgets/custom_button.dart';
import '../../../../../config/di/di.dart';
import '../../../../../core/components/custom_text_filed.dart';
import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/toast_utils.dart';
import '../manager/create_new_profile_cubit.dart';

class CreateNewProfile extends StatelessWidget {
  CreateNewProfileCubit createNewProfileCubit = getIt<CreateNewProfileCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateNewProfileCubit, CreateNewProfileState>(
      bloc: createNewProfileCubit,
      listener: (context, state) {
        if (state is CreateNewProfileError) {
          ToastUtils.showErrorToast('Error', context, state.faliures.errorMessage);
        }
        if (state is CreateNewProfileSuccess) {
          ToastUtils.showSuccessToast('Success', context, 'Create New Profile Success');
          context.go(Routes.mainLayoutRoute);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Create New Profile',
              style: getBoldStyle(
                  color: ColorManager.secondaryPrimary, fontSize: 16.sp),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: SingleChildScrollView(
              child: Form(
                key: createNewProfileCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 24.h),
                    GestureDetector(
                      onTap: () async {
                        String? imageUrl = await createNewProfileCubit.pickImageAndUpload();
                        if (imageUrl != null) {
                          createNewProfileCubit.createNewProfile(imageUrl);
                        }
                      },
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: state is UploadImageSuccess
                            ? NetworkImage(state.profileEntity.imageUrl)
                            : null,
                        child: state is UploadImageSuccess
                            ? null
                            : Icon(
                            Icons.camera_alt, size: 40.sp, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    CustomTextFiled (
                      validator: AppValidators.validateUsername,
                      controller: createNewProfileCubit.usernameController,
                      hintText: 'Your unique @username',
                      borderRadius: BorderRadius.all(Radius.circular(32.r)),
                    ),
                    SizedBox(height: 24.h),

                    CustomTextFiled(
                      validator: AppValidators.validateDisplayName,
                      controller: createNewProfileCubit.displayNameController,
                      hintText: 'How your name appears on profile',
                      borderRadius: BorderRadius.all(Radius.circular(32.r)),
                    ),
                    SizedBox(height: 24.h),

                    CustomTextFiled(
                      validator: AppValidators.validateBio,
                      controller: createNewProfileCubit.bioController,
                      hintText: 'How your bio appears on profile',
                      borderRadius: BorderRadius.all(Radius.circular(32.r)),
                    ),
                    SizedBox(height: 24.h),
                    
                    CustomElevatedButton(
                      title: 'Save',
                      icon: Icons.arrow_forward_rounded,
                      onPressed: () {
                        String imageUrl = '';
                        createNewProfileCubit.onPressedCreateProfile(imageUrl);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
