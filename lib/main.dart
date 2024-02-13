import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technupur_test_task/routes/app_pagess.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      //title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
            background: Colors.white, onBackground: Colors.white,
        ),
        useMaterial3: true,

      ),
      defaultTransition: Get.defaultTransition,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      //home: MyHomePage(),
    );
  }
}