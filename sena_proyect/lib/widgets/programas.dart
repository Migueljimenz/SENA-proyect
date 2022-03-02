// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sena_proyect/models/postProgramas.dart';

class Programas extends StatefulWidget {
  Programas({Key? key, nombreArea}) : super(key: key);

  @override
  State<Programas> createState() => _ProgramasState();
}

class _ProgramasState extends State<Programas> {
  var programas;

  @override
  /* void initState() {
    super.initState();
    PostProgramas();
  } */
  @override
  Widget build(BuildContext context) {
    /* Object? programas = ModalRoute.of(context)!.settings.arguments; */
    return FutureBuilder(
      future: PostProgramas(programas),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
            crossAxisCount: 1,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
