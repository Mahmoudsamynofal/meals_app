import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/screens/home/home_screen.dart';
import 'package:meal_app/screens/onbording/model/onbording_model.dart';
import 'package:meal_app/screens/onbording/widget/coustom_carousel_slider.dart';
import 'package:meal_app/screens/shard_pref_sevices/sherd_pref.dart';
import 'package:meal_app/shard/app_assets.dart';
import 'package:meal_app/shard/app_color.dart';

// ignore: must_be_immutable
class Onbording extends StatefulWidget {
  const Onbording({super.key});
 

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  List<OnbordingModel> onbordingList = [
    OnbordingModel(
      title: "Save Your Meals Ingredient",
      description:
          "Add Your Meals and its Ingredients and we will save it for you",
    ),
    OnbordingModel(
      title: "Use Our AppThe Best Choice",
      description: "the best choice for your kitchen do not hesitate",
    ),
     OnbordingModel(
      title: " Our AppYour Ultimate Choice",
      description: "All the best restaurants and their top menus are ready for you",
    ),
  ];
   @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
       bool isFirstTime = SherdPref.isFristTime();
       SherdPref.setFristTime();
       if(!isFirstTime){
         Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
       }
      

    } );
    super.initState();
    
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.onbordingImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 36.h,
            left: 30.w,
            right: 30.w,

            child: Container(
              width: 311.w,
              height: 400.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48.r),
                color: AppColor.orang.withValues(alpha: 0.8),
              ),

              child: CoustomCarouselSlider(onbordingList:onbordingList),
              
            ),
          ),
        ],
      ),
    );
  }
}







// child: Column(
              //   children: [
              //     HightSpace(height: 10.h),
              //     SizedBox(
              //       width: 211.w,
              //       child: Text(
              //         "Save Your Meals Ingredient",
              //         style: AppStyle.onbordingTitle,
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //     HightSpace(height: 15.h),
              //     SizedBox(
              //       width:300.w ,
              //       child: Text(
              //         "Add Your Meals and its Ingredients and we will save it for you",
              //         style: AppStyle.onbordingDiscription,
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ],
              // ),