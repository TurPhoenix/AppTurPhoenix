import 'package:travel_project/models/sites_model.dart';
import 'package:travel_project/pages/home_page.dart';
import 'package:travel_project/pages/menu.dart';
import "package:flutter/material.dart";
import 'package:travel_project/pages/menu_inferior.dart';
import 'package:travel_project/pages/sites_list_page.dart';
import 'package:travel_project/pages/snackbar.dart';
import 'package:travel_project/repositorie/sites_repositorie.dart';

//clase 8/11/22
class RegisterSites extends StatefulWidget {
  const RegisterSites({super.key});

  @override
  State<RegisterSites> createState() => _RegisterSitesState();
}

class _RegisterSitesState extends State<RegisterSites> {

//CONTROLADORES
  final nombre=TextEditingController();
  final ubicacion=TextEditingController();
  final categoria=TextEditingController();
  final descripcion=TextEditingController();
  final detalle=TextEditingController();
  final departamento=TextEditingController();
  final temperatura=TextEditingController();
  SitesRepositorie instanciaSites = SitesRepositorie(); //instancia de la clase sites_repositorie
  late mensaje msg;  //inicializa snacbar 9/11/22

//metodo para traer los datos 
  void traerDatos2(){
    setState(() { //para que realice las actualizaciones
      String foto= "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTucmKObBIfH2nKabaYcjot0CgopVZaXhzyig&usqp=CAU";
      if(nombre.text.isNotEmpty && ubicacion.text.isNotEmpty && categoria.text.isNotEmpty && descripcion.text.isNotEmpty){  //validacion de los campos
          //verificar sí es frio o calor
          //var SiteNew = SitesClass("", nombre.text, ubicacion.text, categoria.text, descripcion.text, foto);
      }
      var SiteNew = SitesClass("", nombre.text, ubicacion.text, categoria.text, descripcion.text, detalle.text, departamento.text, temperatura.text, foto); 
      registrarSitio2(SiteNew); 
            
    });
  }
  
  //metodo para crear sitio y retorna id del sitio o la excepcion
  void registrarSitio2(SitesClass sitio) async {
    var id = await instanciaSites.registrarSitio(sitio);
    msg.mostrarMensaje("Successful registration");
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SitesListPage()));

  }

  @override
  Widget build(BuildContext context) {
    msg= mensaje(context); 
    return  Scaffold(
      appBar: AppBar(
        title: const Text("My Travel sites"),        
      ),
      drawer: MenuPage(),
      //DETALLES MANEJO DE UNA IMAGEN DE FONDO
     // backgroundColor: Colors.blue,
      body: Container(
        /*decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/viajar.png"), //ruta imagen de fondo
            //fit: BoxFit.cover
             )
        ),*/
        child: Padding( //margen interna
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: SingleChildScrollView( //Scroll de la pantalla
            child:  Center(
              child: Column(
                children: [

                  //Container(
                    //child: const Image(image: AssetImage("assets/logoapp.png"), width: 120, height: 120), //imagen assets/excursionismo.png
                    //padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    //margin: const EdgeInsets.all(20), //margenes  */                 

                  //), 

                  
                  const Text( "Create a destination ", textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 29,
                        color: Colors.black87),),
                      
                  const SizedBox( height: 30,),

                  
                  TextFormField(
                    controller: nombre,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.location_history, size: 20, color: Colors.black26,)
                    ),
                  ), 
                  const SizedBox( height: 15,),

                  TextFormField(
                    controller: ubicacion,
                    keyboardType: TextInputType.streetAddress,
                    decoration: const InputDecoration(
                      labelText: "Capital",
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.location_on, size: 20, color: Colors.black26,)
                    ),
                  ), 

                  const SizedBox( height: 15,), 

                  TextFormField(  //Mountains, Beach, Forest
                    controller: departamento,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: "State",
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.location_on, size: 20, color: Colors.black26,)
                    ),
                  ), 

                  const SizedBox( height: 15,),

                  TextFormField(  //Mountains, Beach, Forest
                    controller: temperatura,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: "Temperature",
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.thermostat_outlined, size: 20, color: Colors.black26,)
                    ),
                  ), 

                  const SizedBox( height: 15,),

                  TextFormField(  //Mountains, Beach, Forest
                    controller: categoria,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: "Categories",
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.add, size: 20, color: Colors.black26,)
                    ),
                  ), 

                  const SizedBox( height: 15,),

                  TextFormField( //del sitio
                    controller: descripcion,
                    keyboardType: TextInputType.text,
                    //maxLength: 6, //4
                    decoration: const InputDecoration(
                      labelText: "Description",
                      fillColor: Colors.white12, //color de fondo del texto
                      filled: false,  //false = condicion de aplicacion
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.abc_outlined, size: 20, color: Colors.black26,)
                    ),
                  ), 

                  const SizedBox( height: 15,),

                  TextFormField( //del sitio
                    controller: detalle,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Details",
                      fillColor: Colors.white12, //color de fondo del texto
                      filled: false,  //false = condicion de aplicacion
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.abc_outlined, size: 20, color: Colors.black26,)
                    ),
                  ), 

                  const SizedBox( height: 25,),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      fixedSize: const Size(300, 50), //tamano boton
                      shape: RoundedRectangleBorder(  //tipo de borde
                          borderRadius: BorderRadius.circular(30) //50
                        ),
                     textStyle: const TextStyle(
                    fontStyle: FontStyle.normal, //tipo de fuente
                    fontSize: 20  //tamano letra
                   ),
                   ),
                    onPressed: (){ //Funcionalidad del boton 
                        traerDatos2();
                     },
                   child: const Text("Save"),
                       ),
                  const SizedBox(height: 15,),

                    //BOTON Cancelar
                 TextButton(
                    style: TextButton.styleFrom( // letra
                      textStyle: const  TextStyle(
                        fontSize: 16, 
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF004D40))
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    child: const Text("Cancel registration"),
                    ),



                  

                ],
              ),
            ),
            )         
          ),
      ),
      bottomNavigationBar: const MenuInferior(),
    );



  }
}