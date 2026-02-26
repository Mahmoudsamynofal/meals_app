import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/screens/home/home_screen.dart';
import 'package:meal_app/screens/onbording/model/onbording_model.dart';
import 'package:meal_app/shard/app_color.dart';
import 'package:meal_app/shard/app_style.dart';
import 'package:meal_app/shard/space.dart';


// ignore: must_be_immutable
class CoustomCarouselSlider extends StatefulWidget {
  CoustomCarouselSlider({super.key, required this.onbordingList});
  List<OnbordingModel> onbordingList;
 

  @override
  State<CoustomCarouselSlider> createState() => _CoustomCarouselSliderState();
}

class _CoustomCarouselSliderState extends State<CoustomCarouselSlider> {
  int currentIndex = 0;
   CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250.h,
          child: CarouselSlider(
            carouselController:carouselController,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              height: 300.h,

              viewportFraction: 0.9,
              initialPage: 0,

              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: widget.onbordingList.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    children: [
                      HightSpace(height: 10.h),
                      SizedBox(
                        width: 211.w,
                        child: Text(
                          item.title,
                          style: AppStyle.onbordingTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      HightSpace(height: 15.h),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          item.description,
                          style: AppStyle.onbordingDiscription,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
        HightSpace(height: 25.h),
        DotsIndicator(
          decorator: DotsDecorator(
            color: AppColor.gery,
            activeColor: AppColor.white,
            activeSize: Size(24.w, 6.h),
            size: Size(24.w, 6.h),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          dotsCount: widget.onbordingList.length,
          position: currentIndex.toDouble(),
          onTap: (position) {
            carouselController.animateToPage(
              position.toInt(),
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            );
            setState(() {
              currentIndex = position;
            });
          },
        ),
        HightSpace(height: 10.h),
        currentIndex == 2
            ? Container(
                width: 62.w,
                height: 62.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                ),
                child: IconButton(
                  onPressed: () {
                    
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  icon: Icon(Icons.arrow_forward, color: AppColor.orang),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                     
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text("Skip", style: AppStyle.interWhite14),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentIndex < 2) {
                       carouselController.nextPage();
                      }
                    },
                    child: Text("next", style: AppStyle.interWhite14),
                  ),
                ],
              ),
      ],
    );
  }
}
