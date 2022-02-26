// ignore_for_file: unused_element, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sena_proyect/models/modelAreas.dart';
import 'package:http/http.dart' as http;

class Areas extends StatefulWidget {
  @override
  State<Areas> createState() => _AreasState();
}

class _AreasState extends State<Areas> {
  Future<List<Area>> _getAreas() async {
    final url = Uri.parse('https://aplicativo-sena.000webhostapp.com');
    final response = await http.get(url);
    /* print(response.body); */
    /* List<Area> areas = []; */
    if (response.statusCode == 200) {
      return areaFromJson(response.body);
    } else {
      throw Exception('Failed to load area');
    }
  }

  @override
  initState() {
    super.initState();
    _getAreas();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getAreas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                children: _listAreas(snapshot.data),
              ),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Error');
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  List<Widget> _listAreas(data) {
    List<Widget> areas = [];
    for (var i = 0; i < data.length; i++) {
      areas.add(Column(
        children: [
          GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                  width: 1,
                )),
                color: Colors.white,
                width: 160,
                height: 160,
                child: Image.network(data[i].logo)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Center(child: Text(data[i].nombre)),
                    backgroundColor: Colors.orange,
                  ),
                );
              }));
            },
          ),
        ],
      ));
    }
    return areas;
  }
}
