
// import 'seat_model.dart';

// class TravelModel {
//   String? id;
//   String? logo;
//   String? title;
//   double? price;
//   List<dynamic>? places;

//   TravelModel({
//     required this.id,
//     required this.logo,
//     required this.title,
//     required this.price,
//     required this.places,
//   });

//   TravelModel.fromMap(Map<String, dynamic> map) {
//     id = map['id'] as String?;
//     logo = map['logo'] as String?;
//     title = map['title'] as String?;
//     price = map['price'] as double?;
//     places = map['places'].map((places) => SeatModel.fromMap(places)).toList();
//   }
// }

// To parse required this JSON data, do
//
//     final travel = travelFromJson(jsonString);

import 'dart:convert';

List<Travel> travelFromJson(String str) => List<Travel>.from(json.decode(str).map((x) => Travel.fromJson(x)));

String travelToJson(List<Travel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Travel {
    Travel({
        required this.departureId,
        required this.hour,
        required this.dayInterval,
        required this.price,
        required this.travelReturn,
        required this.pubPrice,
        required this.pubReturn,
        required this.pub,
        required this.category,
        required this.journeyId,
        required this.carId,
        required this.adminId,
        required this.agence,
        required this.car,
        required this.journey,
    });

    String departureId;
    String hour;
    String dayInterval;
    String price;
    String travelReturn;
    String pubPrice;
    String pubReturn;
    String pub;
    String category;
    String journeyId;
    String carId;
    String adminId;
    Agence agence;
    Car car;
    Journey journey;

    factory Travel.fromJson(Map<String, dynamic> json) => Travel(
        departureId: json["departure_id"],
        hour: json["hour"],
        dayInterval: json["day_interval"],
        price: json["price"],
        travelReturn: json["return"],
        pubPrice: json["pub_price"],
        pubReturn: json["pub_return"],
        pub: json["pub"],
        category: json["category"],
        journeyId: json["journey_id"],
        carId: json["car_id"],
        adminId: json["admin_id"],
        agence: Agence.fromJson(json["agence"]),
        car: Car.fromJson(json["car"]),
        journey: Journey.fromJson(json["journey"]),
    );

    Map<String, dynamic> toJson() => {
        "departure_id": departureId,
        "hour": hour,
        "day_interval": dayInterval,
        "price": price,
        "return": travelReturn,
        "pub_price": pubPrice,
        "pub_return": pubReturn,
        "pub": pub,
        "category": category,
        "journey_id": journeyId,
        "car_id": carId,
        "admin_id": adminId,
        "agence": agence.toJson(),
        "car": car.toJson(),
        "journey": journey.toJson(),
    };
}

class Agence {
    Agence({
        required this.agenceId,
        required this.name,
        required this.headOffice,
        required this.postBox,
        required this.taxpayer,
        required this.commercialRegister,
        required this.firstPhone,
        required this.secondPhone,
        required this.fix,
        required this.website,
        required this.adminId,
    });

    String agenceId;
    String name;
    String headOffice;
    String postBox;
    String taxpayer;
    String commercialRegister;
    String firstPhone;
    String secondPhone;
    String fix;
    String website;
    String adminId;

    factory Agence.fromJson(Map<String, dynamic> json) => Agence(
        agenceId: json["agence_id"],
        name: json["name"],
        headOffice: json["head_office"],
        postBox: json["post_box"],
        taxpayer: json["taxpayer"],
        commercialRegister: json["commercial_register"],
        firstPhone: json["first_phone"],
        secondPhone: json["second_phone"],
        fix: json["fix"],
        website: json["website"],
        adminId: json["admin_id"],
    );

    Map<String, dynamic> toJson() => {
        "agence_id": agenceId,
        "name": name,
        "head_office": headOffice,
        "post_box": postBox,
        "taxpayer": taxpayer,
        "commercial_register": commercialRegister,
        "first_phone": firstPhone,
        "second_phone": secondPhone,
        "fix": fix,
        "website": website,
        "admin_id": adminId,
    };
}

class Car {
    Car({
        required this.carId,
        required this.color,
        required this.matricule,
        required this.place,
        required this.style,
        required this.speed,
        required this.agentId,
        required this.adminId,
    });

    String carId;
    String color;
    String matricule;
    String place;
    String style;
    String speed;
    String agentId;
    String adminId;

    factory Car.fromJson(Map<String, dynamic> json) => Car(
        carId: json["car_id"],
        color: json["color"],
        matricule: json["matricule"],
        place: json["place"],
        style: json["style"],
        speed: json["speed"],
        agentId: json["agent_id"],
        adminId: json["admin_id"],
    );

    Map<String, dynamic> toJson() => {
        "car_id": carId,
        "color": color,
        "matricule": matricule,
        "place": place,
        "style": style,
        "speed": speed,
        "agent_id": agentId,
        "admin_id": adminId,
    };
}

class Journey {
    Journey({
        required this.journeyId,
        required this.distance,
        required this.adminId,
        required this.points,
    });

    String journeyId;
    String distance;
    String adminId;
    List<Point> points;

    factory Journey.fromJson(Map<String, dynamic> json) => Journey(
        journeyId: json["journey_id"],
        distance: json["distance"],
        adminId: json["admin_id"],
        points: List<Point>.from(json["points"].map((x) => Point.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "journey_id": journeyId,
        "distance": distance,
        "admin_id": adminId,
        "points": List<dynamic>.from(points.map((x) => x.toJson())),
    };
}

class Point {
    Point({
        required this.pointId,
        required this.name,
        required this.region,
        required this.town,
        required this.address,
        required this.firstPhone,
        required this.secondPhone,
        required this.fix,
        required this.email,
        required this.adminId,
        required this.type,
    });

    String pointId;
    String name;
    String region;
    String town;
    String address;
    String firstPhone;
    String secondPhone;
    String fix;
    String email;
    String adminId;
    String type;

    factory Point.fromJson(Map<String, dynamic> json) => Point(
        pointId: json["point_id"],
        name: json["name"],
        region: json["region"],
        town: json["town"],
        address: json["address"],
        firstPhone: json["first_phone"],
        secondPhone: json["second_phone"],
        fix: json["fix"],
        email: json["email"],
        adminId: json["admin_id"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "point_id": pointId,
        "name": name,
        "region": region,
        "town": town,
        "address": address,
        "first_phone": firstPhone,
        "second_phone": secondPhone,
        "fix": fix,
        "email": email,
        "admin_id": adminId,
        "type": type,
    };
}

