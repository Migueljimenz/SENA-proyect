

import 'package:flutter/material.dart';
import 'package:sena_proyect/models/postDescPrograma.dart';


class DescProgramas extends StatefulWidget {
  DescProgramas({Key? key}) : super(key: key);

  @override
  State<DescProgramas> createState() => _DescProgramasState();
}

class _DescProgramasState extends State<DescProgramas> {
  var descripcion;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DescPrograma(descripcion),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(crossAxisCount: 1);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
