import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_mananger.dart';
import '../../../../../core/utils/styles_manager.dart';
import 'community_tab/presentation/pages/community_tab.dart';
import 'explore_tab/presentation/pages/explore_tab.dart';
import 'home_tab/presentation/pages/home_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            dividerColor: ColorManager.secondaryPrimary.withOpacity(0.3),
            indicatorColor: ColorManager.primary,
            indicatorWeight: 6,
            tabs: [
              Tab(
                child: Text('Home' , style: getBoldStyle(color: ColorManager.secondaryPrimary , fontSize: 16.sp),),
              ),
              Tab(
                child: Text('Community' , style: getBoldStyle(color: ColorManager.secondaryPrimary , fontSize: 16.sp ),),
              ),
              Tab(
                child: Text('Explore' , style: getBoldStyle(color: ColorManager.secondaryPrimary , fontSize: 16.sp),),
              ),
            ],
          ),
          toolbarHeight: 12.h,
        ),
        body: const TabBarView(
            children: [
              HomeTab(),
              CommunityTab(),
              ExploreTab(),
            ]
        ),
      ),
    );
  }
}
