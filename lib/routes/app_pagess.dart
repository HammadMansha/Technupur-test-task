


import 'package:get/get.dart';
import 'package:technupur_test_task/view/home/home_screen.dart';

import '../view/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var initial =Routes.splashScreen;




  static final routes = [
    //Splash screen
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),

    //Home screen
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
    ),


  ];
}
