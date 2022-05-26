import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _headers;

  ApiClient({required this.appBaseUrl, required shared_preferences}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _headers = {
      'Content-type' : 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String token) {
    _headers = {
      'Content-type' : 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async {
    try{
      Response response = await get(uri);
      return response;
    } catch(error) {
      return Response(statusCode: 1, statusText: error.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try{
      Response response = await  post(uri, body, headers: _headers);
      return response;
    }catch(event) {
      print(event.toString());
      return Response(statusCode: 1, statusText: event.toString());
    }
  }
}