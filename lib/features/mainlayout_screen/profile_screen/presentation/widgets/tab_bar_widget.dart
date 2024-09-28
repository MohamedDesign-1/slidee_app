import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../home_screen/presentation/pages/community_tab/presentation/pages/community_tab.dart';
import '../../../home_screen/presentation/pages/explore_tab/presentation/pages/explore_tab.dart';
import '../../../home_screen/presentation/pages/home_tab/presentation/pages/home_tab.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            dividerColor: ColorManager.secondaryPrimary.withOpacity(0.1),
            indicatorColor: ColorManager.primary,
            indicatorWeight: 3,
            tabs: [
              Tab(
                child: Text(
                  'Feeds',
                  style: getSemiBoldStyle(
                      color: ColorManager.secondaryPrimary, fontSize: 14.sp),
                ),
              ),
              Tab(
                child: Text(
                  'Community',
                  style: getSemiBoldStyle(
                      color: ColorManager.secondaryPrimary, fontSize: 14.sp),
                ),
              ),
              Tab(
                child: Text(
                  'Explore',
                  style: getSemiBoldStyle(
                      color: ColorManager.secondaryPrimary, fontSize: 14.sp),
                ),
              ),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
              HomeTab(),
              CommunityTab(),
              ExploreTab(),
            ]),
          ),
        ],
      ),
    );
  }
}
