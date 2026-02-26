
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/screens/add_meal/add_meal_screen.dart';
import 'package:meal_app/screens/home/data/dp_sevices.dart';
import 'package:meal_app/screens/home/widget/category_home.dart';
import 'package:meal_app/screens/home/widget/header_home.dart';
import 'package:meal_app/shard/app_color.dart';

import 'package:meal_app/shard/space.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DpSevices dpSevices = DpSevices.instance;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderHome(),
          HightSpace(height: 20.h),
          CategoryHome(),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: ()async {
          await Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const AddMealScreen(),
  ),
);

setState(() {});
        },
        child: Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(color: AppColor.orang, width: 2),
          ),
          child: Icon(Icons.add, color: AppColor.orang),
        ),
      ),
    );
  }
}
