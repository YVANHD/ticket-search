
import 'package:get/get.dart';
import 'package:intro_ticket/data/repository/point_repo.dart';

class PointController extends GetxController {
  final PointRepository pointRepo;
  List<dynamic> _pointList = [];
  List<dynamic> get pointList => _pointList;

  PointController({required this.pointRepo});

  // Future<void> getPointList() async {
  //   Response response = await pointRepo.getPointList();
  //   //print(response);
  //   if(response.statusCode == 200) {
  //     _pointList = [];
  //    //  _pointList.addAll(response);
  //   }
  // }




  
}