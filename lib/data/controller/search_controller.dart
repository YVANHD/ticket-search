import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intro_ticket/data/repository/search_repo.dart';

class SearchController extends GetxController  implements GetxService{
SearchRepository searchRepo;

SearchController({required this.searchRepo});


  
}