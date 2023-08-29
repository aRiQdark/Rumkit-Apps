// To parse this JSON data, do
//
//     final detailsurah = detailsurahFromJson(jsonString);

import 'dart:convert';

class datarumkit {
  String? name;
  String? address;
  String? region;
  String? phone;
  String? province;

  datarumkit({
    this.name,
    this.address,
    this.region,
    this.phone,
    this.province,
  });

  factory datarumkit.fromJson(Map<String, dynamic> json) => datarumkit(
        name: json["name"],
        address: json["address"],
        region: json["region"],
        phone: json["phone"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "region": region,
        "phone": phone,
        "province": province,
      };
}
