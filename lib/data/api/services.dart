import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Services {

  static const String url = "https://jsonplaceholder.typicode.com/users";

  void getPointList() async {
    final String _url = "https://jsonplaceholder.typicode.com/users";
    
    Response response = await http.get(Uri.parse(_url));
    print(response.body);
  }
  
}