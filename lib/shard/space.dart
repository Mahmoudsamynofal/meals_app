import 'package:flutter/material.dart';
// ignore: must_be_immutable
class HightSpace extends StatelessWidget {
   HightSpace({super.key,this.height});
  double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height ?? 5,
    );
  }
}


// ignore: must_be_immutable
class WidethSpace extends StatelessWidget {
   WidethSpace({super.key,this.width});
   double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width:width ?? 5 ,);
  }
}