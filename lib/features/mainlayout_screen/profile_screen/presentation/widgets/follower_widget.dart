import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';

class FollowerWidget extends StatelessWidget {
  String followersText;
  String followingText;

  FollowerWidget({Key? key, required this.followersText, required this.followingText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          followersText,
          style: getBoldStyle(
              color: ColorManager.secondaryPrimary,
              fontSize: 12.sp),
        ),
        SizedBox(
          width: 16.w,
        ),
        Text(
          followingText,
          style: getBoldStyle(
              color: ColorManager.secondaryPrimary,
              fontSize: 12.sp),
        ),
      ],
    );
  }
}
