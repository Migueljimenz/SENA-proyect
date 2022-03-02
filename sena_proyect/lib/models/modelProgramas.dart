// To parse this JSON data, do
//
//     final programa = programaFromJson(jsonString);

import 'dart:convert';

List<Programa> programaFromJson(String str) => List<Programa>.from(json.decode(str).map((x) => Programa.fromJson(x)));

String programaToJson(List<Programa> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Programa {
    Programa({
        this.programa="",
        this.nombreArea2="",
    });

    String programa;
    String nombreArea2;

    factory Programa.fromJson(Map<String, dynamic> json) => Programa(
        programa: json["programa"],
        nombreArea2: json["nombreArea2"],
    );

    Map<String, dynamic> toJson() => {
        "programa": programa,
        "nombreArea2": nombreArea2,
    };
}
