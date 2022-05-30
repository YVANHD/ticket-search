import 'package:get/get.dart';
import 'package:intro_ticket/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PointRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  PointRepository({required this.apiClient, required this.sharedPreferences });

  //Future<Response> getPointList() async {
    //return await apiClient.getData('uri');
  //}
}