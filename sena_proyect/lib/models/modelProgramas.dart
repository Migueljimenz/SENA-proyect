// To parse this JSON data, do
//

// ignore_for_file: file_names
//     final programa = programaFromJson(jsonString);

import 'dart:convert';

List<Programa> programaFromJson(String str) =>
    List<Programa>.from(json.decode(str).map((x) => Programa.fromJson(x)));

String programaToJson(List<Programa> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Programa {
  Programa({
    this.programa = "",
    this.nombreArea = "", nombre_area,
  });

  String programa;
  String nombreArea;

  factory Programa.fromJson(Map<String, dynamic> json) => Programa(
        programa: json["programa"],
        nombreArea: json["nombre_area"],
      );

  Map<String, dynamic> toJson() => {
        "programa": programa,
        "nombre_area": nombreArea,
      };
}
