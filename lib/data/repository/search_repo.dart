import 'package:intro_ticket/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  SearchRepository({required this.apiClient, required this.sharedPreferences });
}