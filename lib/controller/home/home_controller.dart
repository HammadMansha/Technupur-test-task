import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:technupur_test_task/utils/api/apis_url.dart';
class HomeController extends GetxController{

  RxBool isLoading=false.obs;
  RxString selectedTab="All".obs;
  RxString selectedSubCategory="Bags".obs;


  List<String> noOfCategories=["5","20","20","20","20","20","20"];
  List categoriesData=[];
  List allSubCategoriesData=[];
  RxInt ind=0.obs;
  RxInt catIndex=0.obs;
  RxInt productQuantity=0.obs;



  @override
  void onInit()async {
await fetchCategories();

    // TODO: implement onInit
    super.onInit();
  }


  Future<void> fetchCategories() async {
    const String url = ApiData.getCategories; // Replace with your API endpoint

    try {
      categoriesData.clear();
      isLoading.value=true;
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
         var data = json.decode(response.body);
         categoriesData.addAll(data);

        // Now you can work with the data
         isLoading.value=false;


      } else {
        isLoading.value=false;

        // If the server returns an error response, throw an exception
        throw Exception('Failed to load data: ${response.statusCode}');

      }
    } catch (e) {
      isLoading.value=false;

      // Catch any errors that occurred during the GET request
      print('Error fetching data: $e');
    }
  }

  double calculateDiscountedPrice(String price, String percentage) {
    // Convert price to double
    double originalPrice = double.tryParse(price) ?? 0.0;

    // Extract percentage value and convert it to double
    double discountPercentage = double.tryParse(percentage.replaceAll('%', '')) ?? 0.0;

    // Calculate the discounted price
    double discountedPrice = originalPrice - (originalPrice * (discountPercentage / 100));

    return discountedPrice;
  }
}