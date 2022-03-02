// ignore_for_file: avoid_unnecessary_containers, file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:sena_proyect/models/modelDesProgramas.dart';
import 'package:sena_proyect/models/modelProgramas.dart';
import 'package:sena_proyect/models/postDescPrograma.dart';
import 'package:sena_proyect/widgets/descPrograma.dart';

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
                trailing: const Icon(Icons.arrow_forward_ios),
                title: Center(
                  child: Text(pro[index].programa,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                onTap: () async {
                  List<DesPrograma> descripcion;
                  DesPrograma desc =
                      DesPrograma(programa2: pro[index].programa);
                  descripcion = await DescPrograma(desc);

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Scaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.orange,
                            title:
                                Center(child: Text('Descripcion del programa')),
                          ),
                          backgroundColor: Colors.white,
                          body: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(pro[index].programa,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: descProgramas(
                                  descripcion: descripcion,
                                ),
                              ),
                            ],
                          ));
                    }),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  descProgramas({required List<DesPrograma> descripcion}) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: descripcion.length,
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
                child: Text(descripcion[index].descPrograma,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              onTap: () {},
            ),
          ),
        );
      },
    );
  }
}
