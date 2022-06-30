import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';

class UserRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  UserRepository({required this.apiClient, required this.sharedPreferences});
}