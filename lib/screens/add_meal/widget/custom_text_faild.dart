import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/shard/app_color.dart';
import 'package:meal_app/shard/app_style.dart';

class CustomTextFaild extends StatelessWidget {
  const CustomTextFaild({
    super.key,
    required this.validator,
    this.maxLines = 1,
    this.lable,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
  });

  final String? Function(String?) validator;
  final int maxLines;
  final String? lable;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      cursorColor: AppColor.orang,
      style: AppStyle.interBlack16,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: AppColor.orang),
        labelText: lable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}