// To parse this JSON data, do
//
//     final area = areaFromJson(jsonString);

import 'dart:convert';

List<Area> areaFromJson(String str) => List<Area>.from(json.decode(str).map((x) => Area.fromJson(x)));

String areaToJson(List<Area> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Area {
    Area({
        this.nombreArea="",
        this.logo="",
    });

    String nombreArea;
    String logo;

    factory Area.fromJson(Map<String, dynamic> json) => Area(
        nombreArea: json["nombreArea"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "nombreArea": nombreArea,
        "logo": logo,
    };
}
