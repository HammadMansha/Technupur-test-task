import 'dart:ffi';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:technupur_test_task/common_widgets/common_textstyle/common_text_style.dart';
import 'package:technupur_test_task/constants/app_colors/app_colors.dart';

import '../../common_widgets/common_spaces/common_spaces.dart';
import '../../constants/app_assets/app_assets.dart';
import '../../controller/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: bodyData(context, homeController),
    );
  }

  bodyData(BuildContext context, HomeController homeController) {
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
      child: Obx(() {
        return SizedBox(
          height: Get.height,
          width: Get.width,
          child: homeController.isLoading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    //Top bar icons.,logo
                    SizedBox(
                      height: 45,
                      width: Get.width,
                      child: Image.asset(
                        AppAssets.topBar,
                        fit: BoxFit.contain,
                      ),
                    ),

                    //main categories
                    Container(
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: AppColors.color8999F, width: 1.0),
                          bottom: BorderSide(
                              color: AppColors.color8999F, width: 1.0),
                        ),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.categoriesData
                            .length, // Example item count, replace with your actual item count
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  homeController.ind.value = index;
                                  homeController.selectedTab.value =
                                      homeController.categoriesData[index]
                                          ["name"];
                                },
                                child: Obx(() {
                                  return Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      FittedBox(
                                        child: Container(
                                          height: 28,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: homeController
                                                          .selectedTab.value ==
                                                      homeController
                                                              .categoriesData[
                                                          index]["name"]
                                                  ? const Color(0xffb9202b)
                                                  : const Color(0xff89999f),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          child: Center(
                                            child: Text(
                                              homeController
                                                      .categoriesData[index]
                                                  ["name"],
                                              style: TextStyle(
                                                  color: homeController
                                                              .selectedTab
                                                              .value ==
                                                          homeController
                                                                  .categoriesData[
                                                              index]["name"]
                                                      ? Colors.black
                                                      : const Color(0xff89999f),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ).marginSymmetric(horizontal: 15),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: -10,
                                        right: -10,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: homeController
                                                            .selectedTab
                                                            .value ==
                                                        homeController
                                                                .categoriesData[
                                                            index]["name"]
                                                    ? const Color(0xffb9202b)
                                                    : const Color(0xff89999f),
                                                width: 2,
                                              )),
                                          child: Center(
                                            child: Text(
                                              homeController
                                                  .noOfCategories[index],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ).marginSymmetric(horizontal: 7),
                            ],
                          );
                        },
                      ),
                    ),

                    //sub categories
                    Row(
                      children: <Widget>[
                        // Replace the itemCount with your desired number of items
                        // Replace the itemBuilder with your own custom item builder
                        Flexible(
                          child: SizedBox(
                            height: 97,
                            width: Get.width, // Adjust the width as needed
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homeController
                                  .categoriesData[homeController.ind.value]
                                      ["subCategory"]
                                  .length,
                              itemBuilder: (context, index) {
                                return Obx(() => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                homeController
                                                    .selectedSubCategory
                                                    .value = homeController
                                                                .categoriesData[
                                                            homeController
                                                                .ind.value]
                                                        ["subCategory"][index]
                                                    ["name"];
                                                homeController.catIndex.value=index;
                                              },
                                              child: Container(
                                                height: 57,
                                                width: 57,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: homeController
                                                                    .selectedSubCategory
                                                                    .value ==
                                                                homeController
                                                                            .categoriesData[
                                                                        homeController
                                                                            .ind
                                                                            .value]["subCategory"]
                                                                    [
                                                                    index]["name"]
                                                            ? AppColors.colorB920
                                                            : AppColors.color8999F,
                                                        width: 2)),
                                                child: Image.network(
                                                  homeController.categoriesData[
                                                              homeController
                                                                  .ind.value]
                                                          ["subCategory"][index]
                                                      ["image"],
                                                  fit: BoxFit.contain,
                                                ).marginSymmetric(
                                                    horizontal: 2, vertical: 2),
                                              ),
                                            ),
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: homeController
                                                        .selectedSubCategory
                                                        .value ==
                                                        homeController
                                                            .categoriesData[
                                                        homeController
                                                            .ind
                                                            .value]["subCategory"]
                                                        [
                                                        index]["name"]
                                                        ? AppColors.colorB920
                                                        : AppColors.color8999F,
                                                    width: 2),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "${homeController.categoriesData[homeController.ind.value]["subCategory"][index]["products"].length}",
                                                style: CommonTextStyle
                                                    .font6weight600Black,
                                              )),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${homeController.categoriesData[homeController.ind.value]["subCategory"][index]["name"]}",
                                          style: CommonTextStyle
                                              .font11weight400899f,
                                          textAlign: TextAlign.center,
                                        ).marginOnly(left: 15)
                                      ],
                                    ).marginSymmetric(horizontal: 8));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    CommonSpaces.spaceVertical10,
                    //Products
                    const Row(
                      children: [
                        Text(
                          "Products",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        Text(
                          "(Beg)",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: AppColors.colorB920,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ],
                    ),

                    //Categories
                    Row(
                      children: <Widget>[
                        // Replace the itemCount with your desired number of items
                        // Replace the itemBuilder with your own custom item builder
                        Flexible(
                          child: SizedBox(
                            height: Get.height / 2.2,
                            width: Get.width, // Adjust the width as needed
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homeController.categoriesData[homeController.ind.value]["subCategory"][homeController.catIndex.value]["products"].length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: Get.height,
                                  width: Get.width /
                                      2, // Adjust the width as needed
                                  margin: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: Get.height / 3,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color: AppColors.colorF0f6f8,
                                              borderRadius:
                                                  BorderRadius.circular(5),

                                            ),
                                            child: Image.network("${ homeController.categoriesData[homeController.ind.value]["subCategory"][homeController.catIndex.value]["products"][index]["image"]}"),
                                          ),

                                          //Discount percentage
                                          Container(
                                            height: 25,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.green,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "-${homeController.categoriesData[homeController.ind.value]["subCategory"][homeController.catIndex.value]["products"][index]["discountPercentage"]}",
                                                style: CommonTextStyle
                                                    .font10weight500white,
                                              ),
                                            ),
                                          ).marginSymmetric(
                                              vertical: 6, horizontal: 6),

                                          //Category
                                        ],
                                      ),
                                      Text(
                                        "${ homeController.categoriesData[homeController.ind.value]["subCategory"][homeController.catIndex.value]["products"][index]["name"]}",
                                        style: CommonTextStyle
                                            .font14weight500white,
                                      ),
                                      Row(
                                        children: [
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              text: '\$${ homeController.categoriesData[homeController.ind.value]["subCategory"][homeController.catIndex.value]["products"][index]["price"]}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Montserrat',
                                                  color: AppColors.color8999F,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                          ),
                                          CommonSpaces.spaceHorizontal10,
                                          Text("\$${homeController.calculateDiscountedPrice(homeController.categoriesData[homeController.ind.value]["subCategory"][homeController.catIndex.value]["products"][index]["price"].toString(), homeController.categoriesData[homeController.ind.value]["subCategory"][homeController.catIndex.value]["products"][index]["discountPercentage"].toString()).toStringAsFixed(2)}",
                                            style: CommonTextStyle
                                                .font14weight500B920,
                                          ),
                                        ],
                                      ),
                                      CommonSpaces.spaceVertical10,

                                      Obx(() => homeController.categoriesData[homeController.ind.value]["subCategory"][homeController.catIndex.value]["products"][index]["status"]==true? const SizedBox():
                                      Container(
                                        height: 16,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: AppColors.colorFfcd03,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Container(
                                                width: Get.width / 3,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  color: AppColors.colorFfc107,
                                                ),
                                                child: Center(
                                                    child: Text(
                                                      "sold out",
                                                      style: CommonTextStyle
                                                          .font9weight500B920,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),),
                                      //sold out section

                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    //Banner section
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage(AppAssets.banner),
                              fit: BoxFit.cover)),
                      height: 80,
                      width: Get.width,
                    ),
                  ],
                ).marginSymmetric(horizontal: 15),
        );
      }),
    );
  }
}
