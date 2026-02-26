import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/shard/app_assets.dart';
import 'package:meal_app/shard/app_color.dart';
import 'package:meal_app/shard/app_style.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppAssets.headerHome),
        Positioned(
          top: 30.h,
          left: 30.w,
          child: Container(
            width: 180.w,
            height: 186.h,
            decoration: BoxDecoration(
              color: AppColor.orang.withAlpha(30),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "Welcome Add A New Recipe",
              style: AppStyle.onbordingTitle,
            ),
          ),
        ),
      ],
    );
  }
}
