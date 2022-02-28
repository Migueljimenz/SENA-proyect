import 'package:http/http.dart' as http;

import 'modelProgramas.dart';

// ignore: non_constant_identifier_names
Future<List<Programa>> PostProgramas() async {
  final url =
      Uri.parse('https://aplicativo-sena.000webhostapp.com/programas.php');

  final response = await http.post(url);
  print(response.body);
  if (response.statusCode == 200) {
    return programaFromJson(response.body).cast();
  } else {
    throw Exception(response.statusCode);
  }
}
