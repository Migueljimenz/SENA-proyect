import 'package:sena_proyect/models/modelAreas.dart';
import 'package:http/http.dart' as http;

Future<List<Area>> getAreas() async {
  final url = Uri.parse('https://aplicativo-sena.000webhostapp.com/index.php');
  final response = await http.get(url);
  /* print(response.body); */
  /* List<Area> areas = []; */
  if (response.statusCode == 200) {
    return areaFromJson(response.body);
  } else {
    throw Exception('Failed to load area');
  }
}
