// ignore_for_file: avoid_unnecessary_containers, file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:sena_proyect/models/modelDesProgramas.dart';
import 'package:sena_proyect/models/modelProgramas.dart';
import 'package:sena_proyect/models/postDescPrograma.dart';

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
                            title: const Center(
                                child: Text('Descripcion del programa')),
                          ),
                          backgroundColor: Colors.white,
                          body: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, right: 20, left: 20),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.orange, width: 2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            pro[index].programa,
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // se llama la funcion que contiene los datos de la descripcion del programa
                                Container(
                                  child: descProgramas(
                                    descripcion: descripcion,
                                  ),
                                ),
                              ],
                            ),
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

// se crea una funcion con la lista de los programas y se le asigna una lista de las descripciones de cada programa para poder mostrarlo en la pantalla
  descProgramas({required List<DesPrograma> descripcion}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: descripcion.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  child: ListTile(
                    title: Text(descripcion[index].descPrograma,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
