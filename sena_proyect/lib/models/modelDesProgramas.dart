// To parse this JSON data, do
//
//     final desPrograma = desProgramaFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<DesPrograma> desProgramaFromJson(String str) => List<DesPrograma>.from(json.decode(str).map((x) => DesPrograma.fromJson(x)));

String desProgramaToJson(List<DesPrograma> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DesPrograma {
    DesPrograma({
        this.nomPrograma="",
        this.descPrograma="",
        this.programa2="",
    });

    String nomPrograma;
    String descPrograma;
    String programa2;

    factory DesPrograma.fromJson(Map<String, dynamic> json) => DesPrograma(
        nomPrograma: json["nomPrograma"],
        descPrograma: json["descPrograma"],
        programa2: json["programa2"],
    );

    Map<String, dynamic> toJson() => {
        "nomPrograma": nomPrograma,
        "descPrograma": descPrograma,
        "programa2": programa2,
    };
}
