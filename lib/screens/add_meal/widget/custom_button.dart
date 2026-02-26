import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/shard/app_color.dart';
import 'package:meal_app/shard/app_style.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,this.onpress});
  Function()? onpress;
  


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.orang,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
          
        ),
        fixedSize: Size(double.infinity, 50.h),
      ),
      onPressed:onpress, child: Text("save",style: AppStyle.interBlack16,));
  }
}
