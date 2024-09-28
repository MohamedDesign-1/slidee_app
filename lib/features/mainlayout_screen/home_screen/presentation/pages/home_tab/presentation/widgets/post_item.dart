import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slidee_app/core/utils/constants_manager.dart';

import '../../../../../../../../core/utils/color_mananger.dart';
import '../../../../../../../../core/utils/styles_manager.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: CachedNetworkImage(
                  imageUrl: AppConstants.staticTestImage,
                  placeholder: (context, imageProvider) =>
                      CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
            title: Row(
              children: [
                Text(
                  'Netflix ID',
                  style: getBoldStyle(
                      color: ColorManager.secondaryPrimary, fontSize: 16.sp),
                ),
                SizedBox(width: 4.w),
                Text(
                  '@Netflix ID',
                  style: getBoldStyle(
                      color: ColorManager.secondaryPrimary.withOpacity(0.4), fontSize: 12.sp),
                ),
              ],
            ),
            subtitle: Text(
              'Official Teaser on Netflix',
              style: getMediumStyle(
                  color: ColorManager.secondaryPrimary, fontSize: 12.sp),
            ),
            trailing: Text(
              '2 Hours',
              style: getMediumStyle(
                  color: ColorManager.secondaryPrimary, fontSize: 12.sp),
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: AppConstants.staticTestImage,
                height: 300.h,
                width: 400.w,
                fit: BoxFit.cover,
                placeholder: (context, imageProvider) =>
                    CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  Text(
                    '24',
                    style: getBoldStyle(
                        color: ColorManager.secondaryPrimary, fontSize: 12.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.comment_outlined),
                    onPressed: () {},
                  ),
                  Text(
                    '2',
                    style: getBoldStyle(
                        color: ColorManager.secondaryPrimary, fontSize: 12.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                  ),
                  Text(
                    '4',
                    style: getBoldStyle(
                        color: ColorManager.secondaryPrimary, fontSize: 12.sp),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
