// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sena_proyect/models/postProgramas.dart';

// ignore: use_key_in_widget_constructors
class Programas extends StatefulWidget {
  @override
  State<Programas> createState() => _ProgramasState();
}

class _ProgramasState extends State<Programas> {
  /*  @override
  initState() {
    super.initState();
    PostProgramas(programas);
  } */

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PostProgramas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: listPrograma(snapshot.data),
            );
          } else if (snapshot.hasError) {
            return Text("error");
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  List<Widget> listPrograma(info) {
    List<Widget> programa = [];
    for (var pro = 0; pro < programa.length; pro++) {
      programa.add(Column(
        children: [
          Text(info[pro].programa),
          Text(info[pro].nombreArea),
        ],
      ));
    }
    return programa;
  }
}
