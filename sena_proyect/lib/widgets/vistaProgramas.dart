// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sena_proyect/models/modelProgramas.dart';

class Programas extends StatelessWidget {
  const Programas({
    Key? key,
    required this.pro,
  }) : super(key: key);

  final List<Programa> pro;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: pro.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: ListTile(
                title: Center(
                  child: Text(pro[index].programa,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                onTap: () {
                  /*  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.orange,
      title: Center(child: Text(nombreArea)),
    ),
    backgroundColor: Colors.transparent,
                    );
                  }),
                ); */
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
