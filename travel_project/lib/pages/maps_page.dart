import "package:flutter/material.dart";
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_project/models/lugares_model.dart';
import 'package:travel_project/pages/menu.dart';
import 'package:travel_project/pages/menu_inferior.dart';

class MapaPage extends StatefulWidget {
  
  final LugaresTuristicos  Lugar1;
  MapaPage(this.Lugar1);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  Widget build(BuildContext context) {

    final posicion = const CameraPosition(
      target: LatLng(3.4480299867324034, -73.07180360273591),
      zoom: 5,
    );


    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.Lugar1.nombre)
      ),
      drawer: MenuPage(),
      body:  GoogleMap(
        initialCameraPosition: posicion,
        //scrollGesturesEnabled: false,
        //zoomGesturesEnable: false,
        mapType: MapType.normal, // tipos de mapas
        
        ),


    bottomNavigationBar: const MenuInferior(),
    );
    

  }
}