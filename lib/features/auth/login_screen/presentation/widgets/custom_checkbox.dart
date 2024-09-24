import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value){}, activeColor: ColorManager.primary,),
        Text('Remember me', style: getSemiBoldStyle(color: ColorManager.secondaryPrimary, fontSize: 12.sp),),
      ],
    );
  }
}
