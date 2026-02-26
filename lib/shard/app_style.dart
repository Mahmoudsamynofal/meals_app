import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/shard/app_color.dart';

class AppStyle {
  static final TextStyle onbordingTitle = GoogleFonts.inter(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
  );
  static final TextStyle onbordingDiscription = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );
  static final TextStyle interBlack16 = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.black,
  );
  static final TextStyle interGery14 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.gery,
   
  );
  static final TextStyle interWhite14 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
    
  );
  static final TextStyle interblack24 = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
    
  );
   static final TextStyle interBlack14 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
    
  );
}
