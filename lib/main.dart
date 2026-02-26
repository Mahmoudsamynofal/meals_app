import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:meal_app/screens/onbording/onbording.dart';
import 'package:meal_app/screens/shard_pref_sevices/sherd_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await SherdPref.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Onbording()),
    );
  }
}
