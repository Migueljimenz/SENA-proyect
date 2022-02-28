// ignore_for_file: unused_element, avoid_print, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:sena_proyect/models/getAreas.dart';

class Areas extends StatefulWidget {
  @override
  State<Areas> createState() => _AreasState();
}

class _AreasState extends State<Areas> {
  @override
  initState() {
    super.initState();
    getAreas();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAreas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                children: listAreas(snapshot.data),
              ),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Error');
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  List<Widget> listAreas(data) {
    List<Widget> areas = [];
    for (var i = 0; i < data.length; i++) {
      areas.add(Column(
        children: [
          GestureDetector(
              child: Column(
                children: [
                  Container(
                      width: 160,
                      height: 160,
                      child: Image.network(data[i].logo)),
                ],
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(data[i].nombre),
                    ),
                    body: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Text(
                                'Se Supone que aqui van los programas, pero no carga nada jajajajajajajaj'),
                          ),
                        )
                      ],
                    ),
                  );
                }));
              }),
        ],
      ));
    }
    return areas;
  }
}
