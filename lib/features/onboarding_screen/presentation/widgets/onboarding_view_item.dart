import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:slidee_app/config/routes/route_manger.dart';
import 'package:slidee_app/config/routes/routes.dart';
import 'package:slidee_app/core/components/custom_botton.dart';
import 'package:slidee_app/core/utils/assets_manager.dart';
import 'package:slidee_app/core/utils/color_mananger.dart';
import 'package:slidee_app/core/utils/constants_manager.dart';
import 'package:slidee_app/features/splash_screen/presentation/pages/splash_screen.dart';

import '../../../../core/utils/styles_manager.dart';

class OnboardingViewItem extends StatelessWidget {
  const OnboardingViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
      globalBackgroundColor: ColorManager.white,
      initialPage: 0,
      showDoneButton: true,
      showNextButton: true,
      showSkipButton: true,
      done: CustomBotton(text: 'Get Started', color: ColorManager.primary,),
      next: CustomBotton(text: 'Next', color: ColorManager.primary,),
      skip: CustomBotton(text: 'Skip', color: ColorManager.secondaryPrimary,),
      dotsDecorator: const DotsDecorator(
      activeColor: ColorManager.primary,
      ),
      curve: Curves.easeInOut,
      isProgress: true,
      onSkip: (){
        context.go(Routes.loginRoute);
      },
      onDone: (){
        context.go(Routes.loginRoute);
      },
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      pages: [
        PageViewModel(
          title: AppConstants.share,
          body: AppConstants.shareDescription,
          image: Image.asset(ImageAssets.onBoarding , width: 1000.w, height: 1000.h,),
          decoration: PageDecoration(
              titleTextStyle: getBoldStyle(color: ColorManager.secondaryPrimary, fontSize: 24.sp),
              imageFlex: 3,
              bodyTextStyle: getRegularStyle(color: ColorManager.secondaryPrimary, fontSize: 14.sp),
          ),
        ),
        PageViewModel(
          title: AppConstants.connectWith,
          body: AppConstants.connectWithDescription,
          image: Image.asset(ImageAssets.onBoarding2),
          decoration: PageDecoration(
              titleTextStyle: getBoldStyle(color: ColorManager.secondaryPrimary, fontSize: 24.sp),
              bodyTextStyle: getRegularStyle(color: ColorManager.secondaryPrimary, fontSize: 14.sp),
              imageFlex: 3
          ),
        ),
        PageViewModel(
          title: AppConstants.exploreSlidee,
          body: AppConstants.exploreSlideeDescription,
          image: Image.asset(ImageAssets.onBoarding3),
          decoration: PageDecoration(
              titleTextStyle: getBoldStyle(color: ColorManager.secondaryPrimary, fontSize: 24.sp),
              bodyTextStyle: getRegularStyle(color: ColorManager.secondaryPrimary, fontSize: 14.sp),
            imageFlex: 3,
          ),
        ),
      ],
          ),
    );
  }
}
