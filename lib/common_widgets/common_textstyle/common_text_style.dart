import 'package:flutter/material.dart';
import 'package:technupur_test_task/constants/app_colors/app_colors.dart';


class CommonTextStyle {
  static TextStyle font10weight500white = const TextStyle(
      color: Colors.white,
      letterSpacing: 0.4,
      fontSize: 10,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w500,
  );

  static TextStyle font14weight500white =  TextStyle(
    color: AppColors.color8999F,
    letterSpacing: 0.4,
    fontSize: 14,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
  );

  static TextStyle font14weight500B920 =  const TextStyle(
    color: AppColors.colorB920,
    letterSpacing: 0.4,
    fontSize: 14,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
  );


  static TextStyle font9weight500B920 =  const TextStyle(
    color: AppColors.colorB920,
    letterSpacing: 0.4,
    fontSize: 9,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
  );

  static TextStyle font11weight400899f =   TextStyle(
    color: AppColors.color8999F,
    letterSpacing: 0.4,
    fontSize: 11,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w400,
  );


  static TextStyle font6weight600Black =  const TextStyle(
    color: Colors.black,
    letterSpacing: 0.4,
    fontSize: 6,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w600,
  );


}
