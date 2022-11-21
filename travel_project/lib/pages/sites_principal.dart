import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:travel_project/models/lugares_model.dart';

import 'package:travel_project/pages/info_lugares.dart';
import 'package:travel_project/pages/menu.dart';
import 'package:travel_project/pages/menu_inferior.dart';

//CLASE 10/11/22
class SitesPrincipalPage extends StatefulWidget {
  const SitesPrincipalPage({super.key});

  @override
  State<SitesPrincipalPage> createState() => _SitesListPageState();
}

class _SitesListPageState extends State<SitesPrincipalPage> {
  // ignore: non_constant_identifier_names
  List SitiosAPP = [];
  List<dynamic> idInfo = [];
  final buscar = TextEditingController(); //controlador buscar

  @override //ejecucion del metodo getSitio
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getOpcionesTrip(); // al iniciar la pantalla ejecuta el metodo
  }

// metodo para hacer consulta, cargar la lista y traer  todas los sitios
  Future getOpcionesTrip() async {
    String id = "";
    QuerySnapshot opciontrip = await FirebaseFirestore.instance
        .collection("Prueba")
        .get(); // QuerySnapshot = coleccion de datos consultados
    setState(() {
      if (opciontrip.docs.isNotEmpty) {
        for (var x in opciontrip.docs) {
          id = x.id; //trae id del sitio turistico
          idInfo.add(id);
          SitiosAPP.add(x.data()); //data trae todos los datos de los sitios
        }
      }
    });
  }

  //metodo para hacer consulta, cargar la lista y traer  todas los sitios
  Future getBuscarCategoria() async {
    idInfo.clear();
    SitiosAPP.clear();
    String id = "";
    // ignore: non_constant_identifier_names
    QuerySnapshot Categoria = await FirebaseFirestore.instance
        .collection("Prueba")
        .where("ubicacion", isEqualTo: buscar.text)
        .get();
    setState(() {
      if (Categoria.docs.isNotEmpty) {
        for (var x in Categoria.docs) {
          id = x.id; //trae id del sitio turistico
          idInfo.add(id);
          SitiosAPP.add(x.data()); //data trae todos los datos de los sitios
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourist Sites"),
        /*actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const HomePage())));
            },
            icon: const Icon(
              Icons.home_outlined,
              size: 24,
              color: Colors.white,
            )),
      ]*/
      ),
      drawer: MenuPage(), //drawer llama a la clase menu
      body: Stack(
        children: [
          Row(children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: TextFormField(
                  controller: buscar,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Search city',
                    labelStyle: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                        color: Colors.black26),
                    /*suffixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.black26,
                    ),*/ // Icon(Icons.search_outlined, size: 20, color: Colors.black26, )),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  getBuscarCategoria();
                });
              },
              padding: const EdgeInsets.only(right: 50, left: 10),
              icon: const Icon(
                Icons.search_outlined,
                size: 30,
                color: Colors.black26,
              ),
            )
          ]),
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: ListView.builder(
              //builder realiza el recorrido iterable
              padding: const EdgeInsets.all(20),
              itemCount:
                  SitiosAPP.length, // cuenta la longitud de la lista sitios
              itemBuilder: (BuildContext context, i) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(SitiosAPP[i]["foto"]),
                        radius: 40,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        //item del listview
                        title: Text(SitiosAPP[i]["nombre"],
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87)),
                        subtitle: Text(
                          SitiosAPP[i]["ubicacion"],
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        onTap: () {
                          //instancia de la clase LugaresTuristicos - lugares_tu
                          // ignore: non_constant_identifier_names
                          
                          LugaresTuristicos LugarNuevo = LugaresTuristicos(
                            idInfo[i],
                            SitiosAPP[i]["nombre"],
                            SitiosAPP[i]["departamento"],
                            SitiosAPP[i]["temperatura"],
                            SitiosAPP[i]["ubicacion"],
                            SitiosAPP[i]["detalle"],
                            SitiosAPP[i]["categoria"],
                            SitiosAPP[i]["descripcion"],
                            SitiosAPP[i]["foto"],
                            SitiosAPP[i]["coordenadas"],
                          );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InfoLugares(LugarNuevo)));
                        },
                      ),
                    ),
                  ],
                );
              }, //
            ),
          )
        ],
      ),
      bottomNavigationBar: const MenuInferior(),
    );
  }
}

/*TextButton.icon(             
              onPressed: () {},
              label: const Text("Search your trip", style: TextStyle(fontSize: 17, color: Colors.black26),),
              icon: const Icon(Icons.search_outlined, size: 30, color:Colors.black26,),
              
            )*/
// IconButton(onPressed: (){}, icon: const Icon(Icons.home, size: 30, color: Colors.amber,),)
