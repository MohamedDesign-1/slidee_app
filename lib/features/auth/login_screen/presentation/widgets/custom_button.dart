import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  String? title;
  IconData? icon;
  VoidCallback? onPressed;
  CustomElevatedButton({this.title, this.icon , this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 53.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0.r),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(ColorManager.primary),
          fixedSize: WidgetStateProperty.all(Size(double.infinity.w, 40.h)),
          elevation: WidgetStateProperty.all(0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( title!,
              style: getBoldStyle(color: ColorManager.white, fontSize: 14.sp),),
            SizedBox(width: 8.w,),
            Icon(icon, color: ColorManager.white, size: 16.sp,)
          ],
        ),
      ),
    );
  }
}
