import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class ApiClient extends GetConnect implements GetxService {
  // late String token;
  // final String appBaseUrl;
  // late Map<String, String> _headers;
  final String _urlr = "https://jsonplaceholder.typicode.com/";
  final String _url = "http://192.168.100.233/api/v1/point/";
  final String _urlresearch = "http://192.168.100.233/api/v1/";

  // ApiClient({required this.appBaseUrl, required shared_preferences}) {
  //   baseUrl = appBaseUrl;
  //   timeout = Duration(seconds: 30);
  //   _headers = {
  //     'Content-type' : 'application/json; charset=utf-8',
  //     'Authorization': 'Bearer $token',
  //   };
  // }

  // void updateHeader(String token) {
  //   _headers = {
  //     'Content-type' : 'application/json; charset=utf-8',
  //     'Authorization': 'Bearer $token',
  //   };
  // }

  // Future<Response> getData(String uri) async {
  //   try{
  //     Response response = await get(uri);
  //     return response;
  //   } catch(error) {
  //     return Response(statusCode: 1, statusText: error.toString());
  //   }
  // }

  // Future<Response> postData(String uri, dynamic body) async {
  //   try{
  //     Response response = await  post(uri, body, headers: _headers);
  //     return response;
  //   }catch(event) {
  //     print(event.toString());
  //     return Response(statusCode: 1, statusText: event.toString());
  //   }
  // }

  getPoint(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(
      Uri.parse(fullUrl),
    );
  }

    getResult(apiUrl) async {
    var fullUrl = _urlr + apiUrl;
    return await http.get(
      Uri.parse(fullUrl),
    );
  }

  research(data, apiUrl) async {
    var fullUrl = _urlresearch + apiUrl;

    return await http.post(
        Uri.parse(fullUrl),
        body: data,
        // headers: _setHeaders()
    );
  }
}