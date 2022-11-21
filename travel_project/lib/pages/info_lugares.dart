import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_project/models/favorites_local.dart';
import 'package:travel_project/models/lugares_model.dart';
import 'package:travel_project/pages/card_image.dart';
import 'package:travel_project/pages/maps_page.dart';
import 'package:travel_project/pages/menu_inferior.dart';
import 'package:travel_project/repositorie/Box_db.dart';

//CLASE 10/11/22
class InfoLugares extends StatefulWidget {
  
  final LugaresTuristicos  Lugar; //objeto tipo datos paseador
  InfoLugares(this.Lugar); //constructor

  
  
  @override
  State<InfoLugares> createState() => _InfoLugaresState();
}

class _InfoLugaresState extends State<InfoLugares> {

@override //ejecucion del metodo getSitio
  void initState() {
// TODO: implement initState
  super.initState();
  traerFavoritos();
}

void traerFavoritos(){ // funcion que consulta los favoritos existentes
  final variableFav = BoxDB.boxFavoriteFuncion(); //variabl que contiene todos los favoritos traidos desde box_db
  variableFav.values.forEach((element) {
    if(element.id == widget.Lugar.id){
      EstadoFavorito=true;
    }
  });
}  

//clase 16/11/22  CAMBIAR EL ESTADO DEL ICONO
  var EstadoFavorito = false; // variable que determina el estado de ListaFav - favorites_page

//funcion para crear favoritos por medio de 
 void agregarFavoritos(){ 
    var lugarFavorito = FavoritesLocal()  //variable que contiene la clase favorites:local y sus datos
    ..id = widget.Lugar.id
    ..nombre=widget.Lugar.nombre
    ..categoria=widget.Lugar.categoria
    ..departamento=widget.Lugar.departamento
    ..descripcion=widget.Lugar.descripcion
    ..detalle=widget.Lugar.detalle
    ..ubicacion=widget.Lugar.ubicacion
    ..temperatura=widget.Lugar.temperatura
    ..foto=widget.Lugar.foto;
  //variable que contiene la clase de la caja box_db y su funcion
    final caja=BoxDB.boxFavoriteFuncion();
    //caja.add(lugarFavorito); // anade la info a la variable 
    //clase 16/11/22 CAMBIAR EL ESTADO DEL ICONO
    //cambia la info en la BD y valida su existencia
    
    caja.put(lugarFavorito.id, lugarFavorito); //agrega con sus datos desde BD
    
    setState(() {
      EstadoFavorito=!EstadoFavorito;
    });


 }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore more"),
        actions: [

          IconButton( // relaiza  la accion de la funcion agregarFavoritos
            padding: const EdgeInsets.only(right: 40),
            onPressed: () { 
                 Navigator.push( context,  MaterialPageRoute( builder: (context) =>  MapaPage(widget.Lugar)));
            },icon:  const Icon(FontAwesomeIcons.locationPin  ,size: 20, color: Colors.white,),   
            ),

           IconButton( // relaiza  la accion de la funcion agregarFavoritos
            padding: const EdgeInsets.only(right: 40),
            onPressed: () { 
                agregarFavoritos();
            },icon:  Icon(EstadoFavorito? FontAwesomeIcons.heartCircleBolt : FontAwesomeIcons.heart, size: 20, color: Colors.white,),   
            ),


        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[ CardImage(
              widget.Lugar.foto,
              // ignore: prefer_interpolation_to_compose_strings
              widget.Lugar.nombre +"\n"+
              widget.Lugar.ubicacion +  "\n " + 
              widget.Lugar.departamento +  "\n " + 
              widget.Lugar.temperatura +  "\n\n " + 
              widget.Lugar.detalle +"\n \n" +
              widget.Lugar.descripcion +  "\n\n " +                     
              widget.Lugar.categoria +  "\n " ), 
             
              RatingBar.builder(  //Calificacion estrellas
                initialRating: 3, 
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) => 
                const Icon(Icons.star,
                color: Colors.deepOrangeAccent),
                onRatingUpdate: (rating) {
                  print(rating);
                },)  
                 
                 
                  
          ]
        )

      ),
      
      bottomNavigationBar: const MenuInferior(),
    );
  }
}