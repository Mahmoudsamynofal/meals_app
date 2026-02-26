import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/screens/add_meal/widget/custom_button.dart';
import 'package:meal_app/screens/add_meal/widget/custom_text_faild.dart';
import 'package:meal_app/screens/home/data/dp_sevices.dart';
import 'package:meal_app/screens/home/model/category_model.dart';
import 'package:meal_app/shard/app_style.dart';
import 'package:meal_app/shard/space.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final timeController = TextEditingController();
  final rateController = TextEditingController();
  final imageController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    timeController.dispose();
    rateController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Meal", style: AppStyle.interBlack16),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomTextFaild(
                  keyboardType: TextInputType.url,
                  controller: imageController,
                  lable: "Enter image url",
                  prefixIcon: Icons.image,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter image url";
                    }
                    return null;
                  },
                ),
                HightSpace(height: 20.h),

                CustomTextFaild(
                  controller: nameController,
                  lable: "Enter name",
                  prefixIcon: Icons.food_bank,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter name";
                    }
                    return null;
                  },
                ),
                HightSpace(height: 20.h),

                CustomTextFaild(
                  keyboardType: TextInputType.number,
                  controller: timeController,
                  lable: "Enter time",
                  prefixIcon: Icons.timer,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter time";
                    }
                    return null;
                  },
                ),
                HightSpace(height: 20.h),

                CustomTextFaild(
                  keyboardType: TextInputType.number,
                  controller: rateController,
                  lable: "Enter rate",
                  prefixIcon: Icons.star,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter rate";
                    }
                    if (double.tryParse(value) == null) {
                      return "Rate must be a number";
                    }
                    return null;
                  },
                ),
                HightSpace(height: 20.h),

                CustomTextFaild(
                  controller: descriptionController,
                  lable: "Enter description",
                  prefixIcon: Icons.directions,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter description";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: SizedBox(
          width: double.infinity,
          child: CustomButton(
            onpress: () {
              if (formKey.currentState!.validate()) {
                final categoryAdd = CategoryModel(
                  name: nameController.text,
                  image: imageController.text,
                  time: timeController.text,
                  discription: descriptionController.text,
                  rate: double.parse(rateController.text),
                );

                DpSevices.instance
                    .insertTodata(categoryAdd)
                    .then((_) => Navigator.pop(context));
              }
            },
          ),
        ),
      ),
    );
  }
}