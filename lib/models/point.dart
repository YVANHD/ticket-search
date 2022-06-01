// To parse this JSON data, do
//
//     final point = pointFromJson(jsonString);

import 'dart:convert';

List<Point> pointFromJson(String str) => List<Point>.from(json.decode(str).map((x) => Point.fromJson(x)));

String pointToJson(List<Point> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Point {
    Point({
        required this.name,
        required this.region,
        required this.town,
        required this.address,
        required this.firstPhone,
        required this.secondPhone,
        required this.fix,
        required this.email,
        required this.agence,
    });

    String name;
    String region;
    String town;
    String address;
    String firstPhone;
    String secondPhone;
    String fix;
    String email;
    Agence agence;

    factory Point.fromJson(Map<String, dynamic> json) => Point(
        name: json["name"],
        region: json["region"],
        town: json["town"],
        address: json["address"],
        firstPhone: json["first_phone"],
        secondPhone: json["second_phone"],
        fix: json["fix"],
        email: json["email"],
        agence: Agence.fromJson(json["agence"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "town": town,
        "address": address,
        "first_phone": firstPhone,
        "second_phone": secondPhone,
        "fix": fix,
        "email": email,
        "agence": agence.toJson(),
    };
}

class Agence {
    Agence({
        required this.name,
        required this.headOffice,
        required this.postBox,
        required this.firstPhone,
        required this.secondPhone,
        required this.fix,
        required this.website,
    });

    String name;
    String headOffice;
    String postBox;
    String firstPhone;
    String secondPhone;
    String fix;
    String website;

    factory Agence.fromJson(Map<String, dynamic> json) => Agence(
        name: json["name"],
        headOffice: json["head_office"],
        postBox: json["post_box"],
        firstPhone: json["first_phone"],
        secondPhone: json["second_phone"],
        fix: json["fix"],
        website: json["website"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "head_office": headOffice,
        "post_box": postBox,
        "first_phone": firstPhone,
        "second_phone": secondPhone,
        "fix": fix,
        "website": website,
    };
}
