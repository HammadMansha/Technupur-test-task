import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technupur_test_task/constants/app_assets/app_assets.dart';
import 'package:technupur_test_task/view/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyData(context),
    );
  }

  bodyData(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(()=>HomeScreen());
      // code to be executed after 2 seconds
    });
    return SafeArea(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height/3,
              width: Get.width,
              child: Image.asset(AppAssets.splashBg,fit: BoxFit.fill,),
            ),
            Center(
              child: SizedBox(
                height: Get.height/6,
                width: Get.width/2,
                child: Image.asset(AppAssets.logo,fit: BoxFit.fill,),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 25,
              width: Get.width/2,
              child: Image.asset(AppAssets.poweredBy,fit: BoxFit.fill,),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      
      ),
    );

  }
}
