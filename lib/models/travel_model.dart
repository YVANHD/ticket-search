
import 'seat_model.dart';

class TravelModel {
  String? id;
  String? logo;
  String? title;
  double? price;
  List<dynamic>? places;

  TravelModel({
    this.id,
    this.logo,
    this.title,
    this.price,
    this.places,
  });

  TravelModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String?;
    logo = map['logo'] as String?;
    title = map['title'] as String?;
    price = map['price'] as double?;
    places = map['places'].map((places) => SeatModel.fromMap(places)).toList();
  }
}
