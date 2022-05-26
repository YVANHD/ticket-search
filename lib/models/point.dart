class PointInfo {
  String? name;
  String? region;
  String? town;
  String? address;
  String? firstPhone;
  String? secondPhone;
  String? email;


  PointInfo(
      {
       this.name,
       this.region,
       this.town,
       this.address,
       this.firstPhone,
       this.secondPhone,
       this.email,

      });

  PointInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    town = json['town'];
    address = json['address'];
    firstPhone = json['first_phone'];
    secondPhone = json['second_phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['region'] = this.region;
    data['town'] = this.town;
    data['address'] = this.address;
    data['first_phone'] = this.firstPhone;
    data['second_phone'] = this.secondPhone;
    data['email'] = this.email;
    return data;
  }
}