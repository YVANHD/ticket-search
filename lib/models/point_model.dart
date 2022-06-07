// To parse required this JSON data, do
//
//     final points = pointsFromJson(jsonString);

import 'dart:convert';

List<Points> pointsFromJson(String str) => List<Points>.from(json.decode(str).map((x) => Points.fromJson(x)));

String pointsToJson(List<Points> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Points {
    Points({
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
        required this.createdAt,
        required this.updatedAt,
        required this.agence,
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
    String createdAt;
    String updatedAt;
    Agence agence;

    factory Points.fromJson(Map<String, dynamic> json) => Points(
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
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        agence: Agence.fromJson(json["agence"]),
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "agence": agence.toJson(),
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
