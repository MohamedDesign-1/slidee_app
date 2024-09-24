import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';

class DontHaveAccount extends StatelessWidget {
  String? title ;
  String? decrp ;
  VoidCallback? onPress;

  DontHaveAccount({Key? key, required this.title, required this.onPress , this.decrp}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            decrp!,
            style: getSemiBoldStyle(
                color: ColorManager.secondaryPrimary, fontSize: 12.sp),
          ),
          SizedBox(
            width: 8.w,
          ),
          InkWell(
            onTap: onPress,
            child: Text(
              title!,
              style: getSemiBoldStyle(
                  color: ColorManager.primary, fontSize: 12.sp),
            ),
          )
        ]
    );
  }
}
