import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/utils/color_mananger.dart';
import '../widgets/post_item.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) => Divider(
            color: ColorManager.secondaryPrimary.withOpacity(0.2),
            height: 2.h,
          ),
          itemBuilder: (context, index) => PostItem(),
      )
    );
  }
}
