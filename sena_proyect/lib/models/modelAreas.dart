// To parse this JSON data, do
//
//     final area = areaFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Area> areaFromJson(String str) => List<Area>.from(json.decode(str).map((x) => Area.fromJson(x)));

String areaToJson(List<Area> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Area {
    Area({
        this.nombre="",
        this.logo="",
    });

    String nombre;
    String logo;

    factory Area.fromJson(Map<String, dynamic> json) => Area(
        nombre: json["nombre"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "logo": logo,
    };
}
