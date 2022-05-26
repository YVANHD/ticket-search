class Agence {
  String? name;
  String? headOffice;
  String? website;

  Agence(
      {
       this.name,
       this.headOffice,
       this.website,
      });

  Agence.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    headOffice = json['head_office'];
    website = json['website'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['head_office'] = this.headOffice;
    data['website'] = this.website;
    return data;
  }
}