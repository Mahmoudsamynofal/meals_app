import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/screens/home/model/category_model.dart';
import 'package:meal_app/shard/app_color.dart';
import 'package:meal_app/shard/app_style.dart';
import 'package:meal_app/shard/space.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.modelDetails});
  CategoryModel modelDetails;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HightSpace(height: 5),
                Container(
                  width: 360.w,
                  height: 327.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(modelDetails.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,color: AppColor.white,),
                      ),
                    ),
                  ),
                ),
                Text(modelDetails.name, style: AppStyle.interblack24),
                HightSpace(height: 10),
                Row(
                  children: [
                    Icon(Icons.timer, size: 20.sp, color: AppColor.orang),
                    Text(modelDetails.time, style: AppStyle.interBlack14),
                    Expanded(child: WidethSpace(width: 20)),
                    Icon(Icons.star, size: 20.sp, color: AppColor.orang),
                    Text(
                      modelDetails.rate.toString(),
                      style: AppStyle.interBlack14,
                    ),
                  ],
                ),
                HightSpace(height: 20),
                Divider(),
                HightSpace(height: 20),
                Text("Description", style: AppStyle.interblack24),
                Text(modelDetails.discription, style: AppStyle.interGery14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


                  // "Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you."