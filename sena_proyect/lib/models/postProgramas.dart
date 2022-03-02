// ignore_for_file: avoid_print, file_names, unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'modelProgramas.dart';

// ignore: non_constant_identifier_names
Future<List<Programa>> PostProgramas(programas) async {
  final headers = {'Content-Type': 'application/json'};
  final url =
      Uri.parse('https://aplicativo-sena.000webhostapp.com/programas.php');
  final response = await http.post(url, body: jsonEncode(programas));
  /* print(response.body); */
  if (response.statusCode == 200) {
    return programaFromJson(response.body);
  } else {
    throw Exception(response.body);
  }
}
