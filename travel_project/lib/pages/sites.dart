import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:travel_project/pages/iglesia.dart';

class SitiosPage extends StatelessWidget {
  const SitiosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tourist sites"),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20), //margen solo superior
          child: ListView(
            //ordena tipo lista
            children: [
              const Card(
                color: Colors.white70,
                child: ListTile(
                  title: Text("DISCOVER FRONTINO!", 
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, 
                  fontStyle: FontStyle.normal, fontSize: 30, color: Color(0xFF004D40)),
                  ),
                  //dense: true,
                ),
              ),

              const SizedBox(height: 40),

              Card(               
                color: Colors.white38,
                child: ListTile(
                  //leading trae un tamano predeterminado para la imagen
                  leading: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/2/26/Iglesia_de_Frontino-Fachada_Principal.jpg"), //IMAGEN
                  title: const Text("Basílica de Nuestra Señora del Carmen"),
                  trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(                   
                        fixedSize: const Size(100, 40), //tamano boton                   
                        shape: RoundedRectangleBorder(                       //tipo de borde
                          borderRadius: BorderRadius.circular(30) //50
                          ), 
                          shadowColor: Colors.black,  //color de la sombra                     
                    ),                                     
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Iglesia()));
                    }, child: Text("Explore")), //trailing ubica un objeto hacia la derecha
                  //subtitle: const Text("Aquí cabemos todos"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, //propiedad que permite alinear al inicio start
                    children: [
                      Text("Basílica en frontino"),
                      Row(
                        children: const [Text("4,8 -"), Icon(Icons.star)],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Card(               
                color: Colors.white38,
                child: ListTile(
                  //leading trae un tamano predeterminado para la imagen
                  leading: Image.network(
                      "http://3.bp.blogspot.com/_6D07jhuRCwY/Sag4GxfZRLI/AAAAAAAAACM/XWgLxwJCtgM/s320/fotos+cerro+plateado+(23).JPG"), //IMAGEN
                  title: const Text("El Chorro de San Pedro"),
                  trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(                   
                        fixedSize: const Size(100, 40), //tamano boton                   
                        shape: RoundedRectangleBorder(                       //tipo de borde
                          borderRadius: BorderRadius.circular(30) //50
                          ), 
                          shadowColor: Colors.black,  //color de la sombra                     
                    ),                                     
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Iglesia()));
                    }, child: Text("Explore")), //trailing ubica un objeto hacia la derecha
                  //subtitle: const Text("Aquí cabemos todos"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, //propiedad que permite alinear al inicio start
                    children: [
                      Text("Corregimiento el cerro"),
                      Row(
                        children: const [Text("4,8 -"), Icon(Icons.star)],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Card(               
                color: Colors.white38,
                child: ListTile(
                  //leading trae un tamano predeterminado para la imagen
                  leading: Image.network(
                      "http://3.bp.blogspot.com/-4Z1K2pxSz-M/TooVQCejp2I/AAAAAAAAEV0/gxEVJMgZGIM/s1600/Santos+%252815%2529.jpg"), //IMAGEN
                  title: const Text("Cavernas indígenas"),
                  trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(                   
                        fixedSize: const Size(100, 40), //tamano boton                   
                        shape: RoundedRectangleBorder(                       //tipo de borde
                          borderRadius: BorderRadius.circular(30) //50
                          ), 
                          shadowColor: Colors.black,  //color de la sombra                     
                    ),                                     
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Iglesia()));
                    }, child: Text("Explore")), //trailing ubica un objeto hacia la derecha
                  //subtitle: const Text("Aquí cabemos todos"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, //propiedad que permite alinear al inicio start
                    children: [
                      Text("Vereda Nore sector El Tejar"),
                      Row(
                        children: const [Text("4,8 -"), Icon(Icons.star)],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),


              
            ],
          ),
        ));
  }
}