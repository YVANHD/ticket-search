
import 'package:get/get.dart';
import 'package:intro_ticket/data/api/api_client.dart';
import 'package:intro_ticket/data/controller/point_controller.dart';
import 'package:intro_ticket/data/controller/search_controller.dart';
import 'package:intro_ticket/data/repository/point_repo.dart';
import 'package:intro_ticket/data/repository/search_repo.dart';
import 'package:intro_ticket/helpers/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

// for apiClient
  //Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL, shared_preferences: Get.find()));
//Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));

//for repository
  //Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  //Get.lazyPut(() => SearchRepository(apiClient: Get.find(), sharedPreferences: Get.find()));
  //Get.lazyPut(() => PointRepository(apiClient: Get.find(), sharedPreferences: Get.find()));


  //for controllers
  //Get.lazyPut(() => AuthController(authRepo: Get.find()));
  //Get.lazyPut(() => SearchController(searchRepo: Get.find()));
  //Get.lazyPut(() => PointController(pointRepo: Get.find()));
}