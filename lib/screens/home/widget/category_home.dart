import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/screens/category%20details/category_details.dart';
import 'package:meal_app/screens/home/data/dp_sevices.dart';

import 'package:meal_app/shard/app_color.dart';
import 'package:meal_app/shard/app_style.dart';
import 'package:meal_app/shard/space.dart';

class CategoryHome extends StatelessWidget {
  CategoryHome({super.key});

  DpSevices dpSevices = DpSevices.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DpSevices().getToData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          var data = snapshot.data;
          return data!.isEmpty
              ? Center(child: Text("No Data"))
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your Food", style: AppStyle.interBlack16),
                      HightSpace(height: 10.h),
                      SizedBox(
                        height: 400.h,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),

                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                childAspectRatio: 0.90,
                              ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // margin: EdgeInsets.only(top: 12.h),
                              width: 153.w,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CategoryDetails(
                                                  modelDetails: data[index],
                                                ),
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 106.h,
                                        child: CachedNetworkImage(
                                          imageUrl: data[index].image,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                  HightSpace(height: 10.h),
                                  Text(
                                    data[index].name,
                                    style: AppStyle.interBlack16,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: AppColor.orang),
                                      Text(
                                        data[index].rate.toString(),
                                        style: AppStyle.interBlack16,
                                      ),
                                      WidethSpace(width: 35.w),
                                      Icon(Icons.timer, color: AppColor.orang),
                                      Text(
                                        data[index].time,
                                        style: AppStyle.interBlack16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
        } else {
          return Center(child: Text("No Data"));
        }
      },
    );
  }
}
