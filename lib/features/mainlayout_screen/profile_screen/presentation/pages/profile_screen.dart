import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:slidee_app/config/routes/route_manger.dart';
import 'package:slidee_app/features/mainlayout_screen/profile_screen/presentation/manager/fetchprofile_cubit.dart';
import 'package:slidee_app/features/mainlayout_screen/profile_screen/presentation/widgets/edit_profile.dart';
import 'package:slidee_app/features/mainlayout_screen/profile_screen/presentation/widgets/follower_widget.dart';

import '../../../../../config/di/di.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/toast_utils.dart';
import '../widgets/tab_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  FetchProfileCubit fetchProfileCubit = getIt<FetchProfileCubit>();

  @override
  Widget build(BuildContext context) {
    fetchProfileCubit.getProfile(FirebaseAuth.instance.currentUser!.uid);
    print("Building ProfileScreen...");

    return BlocConsumer<FetchProfileCubit, FetchprofileState>(
      bloc: fetchProfileCubit,
      listener: (context, state) {
        if (state is FetchProfileError) {
          ToastUtils.showErrorToast('Error', context, state.message.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is FetchProfileLoading) {
          return Center(child: CircularProgressIndicator());
        }
        else if (state is FetchProfileLoaded) {
          print("State: FetchProfileLoaded with username: ${state.profile.username}");
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Profile',
                  style: getMediumStyle(
                      color: ColorManager.secondaryPrimary, fontSize: 16.sp),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        // todo: Go to Settings
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.gear,
                        size: 20,
                        color: ColorManager.secondaryPrimary,
                      )),
                ],
                leading: IconButton(
                  onPressed: () {
                  context.go(Routes.mainLayoutRoute);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: 20,
                    color: ColorManager.secondaryPrimary,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(90.r),
                          child: Image.network(
                            state.profile.imageUrl,
                            width: 88.w,
                            height: 88.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.profile.username,
                              style: getBoldStyle(
                                  color: ColorManager.secondaryPrimary,
                                  fontSize: 14.sp),
                            ),
                            SizedBox(height: 4.h),
                            FollowerWidget(
                              followersText:
                              '${state.profile.followersCount} Followers',
                              followingText:
                              '${state.profile.followingCount} Following',
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              state.profile.displayName,
                              style: getSemiBoldStyle(
                                  color: ColorManager.secondaryPrimary
                                      .withOpacity(0.5),
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      state.profile.bio,
                      style: getBoldStyle(
                          color: ColorManager.secondaryPrimary,
                          fontSize: 14.sp),
                    ),
                    SizedBox(height: 16.h),
                    EditProfile(onPressed: () {}),
                    SizedBox(height: 16.h),
                    const TabBarWidget(),
                  ],
                ),
              ),
            ),
          );
        }
        return Container(
          color: ColorManager.primary,
        );
      },
    );
  }
}
