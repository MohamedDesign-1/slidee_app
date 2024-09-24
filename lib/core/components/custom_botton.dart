import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slidee_app/core/utils/styles_manager.dart';

import '../utils/color_mananger.dart';

class CustomBotton extends StatelessWidget {
  String text;
  Color color = ColorManager.primary;

  CustomBotton({Key? key, required this.text , required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: color,
      ),
      child: Center(
        child: Text(text,
            style: getMediumStyle(color: ColorManager.white, fontSize: 14.sp)),
      ),
    );
  }
}
