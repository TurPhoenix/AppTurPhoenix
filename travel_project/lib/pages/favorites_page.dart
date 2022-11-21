import "package:flutter/material.dart";
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_project/models/favorites_local.dart';
import 'package:travel_project/models/lugares_model.dart';
import 'package:travel_project/pages/info_lugares.dart';
import 'package:travel_project/pages/menu.dart';
import 'package:travel_project/pages/menu_inferior.dart';
import 'package:travel_project/repositorie/box_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/adapters.dart';


class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Favorites"),
      ),
      drawer: MenuPage(),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListaFav(),
      ),

      bottomNavigationBar: const MenuInferior(),
    );
  }


  Widget ListaFav(){
    return ValueListenableBuilder<Box<FavoritesLocal>>(
      valueListenable: BoxDB.boxFavoriteFuncion().listenable(),  //identifica la caja y sus valores
      builder: ((context, caja, _) {
        final lista = caja.values.toList().cast<FavoritesLocal>();
        //values.toList().cast<PaseadoresLocal>();
        //
       
        return ListView.builder( //builder realiza el recorrido iterable
                padding: EdgeInsets.all(20),
                itemCount:  lista.length, // cuenta la longitud de la lista sitios                   
                itemBuilder: (BuildContext context, i) {
                  
                  return Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(lista[i].foto ?? ""), 
                          radius: 40,
                        ),
                       
                      ),
                      Expanded(child: 
                      ListTile(
                        //item del listview
                        title: Text(lista[i].nombre ?? "", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),                                                  
                        subtitle: Text(lista[i].ubicacion ?? "", style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.6)), ),
                        onTap: () {
                          //instancia de la clase LugaresTuristicos - lugares_tu
                          //clase 16/11/22
                          /*LugaresTuristicos LugarNuevo = LugaresTuristicos(
                              lista[i].categoria?? "",
                              lista[i].departamento?? "",
                              lista[i].descripcion?? "",
                              lista[i].detalle?? "",
                              lista[i].foto?? "",
                              lista[i].nombre?? "",
                              lista[i].ubicacion?? "",                              
                              lista[i].temperatura?? "",     
                              lista[i].id?? "");

                          Navigator.push( context,  MaterialPageRoute( builder: (context) => InfoLugares(LugarNuevo)));*/
                              
                          //clase 16/11/22    eliminar datos de favoritos
                             
                        },

                        onLongPress: (){  //evento se ejecuta al mantener presionado
                            setState(() {   //actualiza el estado
                            lista[i].delete();  //eleimina de la lista y base de datos
                              
                            });
                          }



                      ),
                      ),
                    ],
                  );
                }, //
              );
        
      } ));
  }
}