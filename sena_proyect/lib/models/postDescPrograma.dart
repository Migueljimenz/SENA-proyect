// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sena_proyect/models/modelDesProgramas.dart';

Future<List<DesPrograma>> DescPrograma(descripcion) async {
  final url =
      Uri.parse('https://aplicativo-sena.000webhostapp.com/descripcion.php');
  final response = await http.post(url, body: jsonEncode(descripcion));
  if (response.statusCode == 200) {
    return desProgramaFromJson(response.body);
  }else{
    throw Exception('Error al cargar los datos');
  }
}
