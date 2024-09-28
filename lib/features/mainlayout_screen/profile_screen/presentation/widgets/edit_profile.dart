import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';

class EditProfile extends StatelessWidget {
  GestureTapCallback onPressed;

  EditProfile({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(color: ColorManager.secondaryPrimary.withOpacity(0.2)),
        ),
        child: Center(
          child: Text(
            'Edit Profile',
            style: getBoldStyle(
                color: ColorManager.secondaryPrimary, fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
