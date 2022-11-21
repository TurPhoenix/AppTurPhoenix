import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:travel_project/pages/card_image.dart';
import 'package:travel_project/pages/menu.dart';
import 'package:travel_project/pages/menu_inferior.dart';
import 'package:travel_project/pages/sites_principal.dart';

//CLASE 9/11/22
class SitesListPage extends StatefulWidget {
  const SitesListPage({super.key});

  @override
  State<SitesListPage> createState() => _SitesListPageState();
}

class _SitesListPageState extends State<SitesListPage> {
  List listaSitios = [];

  @override //ejecucion del metodo getSitio
  void initState() {
    // TODO: implement initState
    super.initState();
    getSitio(); // al iniciar la pantalla ejecuta el metodo
  }

// metodo para hacer consulta, cargar la lista y traer  todas los sitios
  Future getSitio() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid; //consultar id usuario
    //Busqueda por un parametro  clase  9/11/22
    //QuerySnapshot mascota= await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").where("nombre", isEqualTo: "Paquito").get();
    QuerySnapshot sitioQuery = await FirebaseFirestore.instance
        .collection("Usuarios").doc(uid)
        .collection("sitios").get(); // QuerySnapshot = coleccion de datos consultados
    setState(() {
      if (sitioQuery.docs.isNotEmpty) {
        for (var x in sitioQuery.docs) {
          listaSitios.add(x.data()); //data trae todos los datos de los sitios
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Site list"), /*actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: ((context) => const SitesPrincipalPage())));                                                         
            },
            icon: const Icon(Icons.list_alt_outlined,size: 24,color: Colors.white, )),                                                   
      ]*/
      ),
      drawer: MenuPage(), //drawer llama a la clase menu

      body: ListView.builder( //builder realiza el recorrido iterable        
        itemCount: listaSitios.length, // cuenta la longitud de la lista sitios
        itemBuilder: (BuildContext context, i) {
          return ListTile( //item del listview           
            title: CardImage(
                listaSitios[i]["foto"],
                listaSitios[i]["nombre"] +  " \n " +
                listaSitios[i]["ubicacion"] + "\n" +   //listaSitios[i]["detalle"] +
                listaSitios[i]["departamento"] +  " \n " +   
                listaSitios[i]["temperatura"] +  " \n\n " +                  
                    listaSitios[i]["detalle"] +
                    "\n\n " +
                    listaSitios[i]["descripcion"] +
                    "\n\n " +
                    listaSitios[i]["categoria"] +
                    " \n "), // clase card
            onTap: () {
              //Navigator
            },
          );
        }, //
      ),

      /*body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello,  ${FirebaseAuth.instance.currentUser?.email} "),
            Text("Descover the world! "),
          ],
        ),
      ),*/

      bottomNavigationBar: const MenuInferior(),
    );
  }
}
