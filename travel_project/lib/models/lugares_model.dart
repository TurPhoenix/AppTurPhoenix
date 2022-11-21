import 'package:cloud_firestore/cloud_firestore.dart';
//class 10/11/22
//manipular la informacion como objeto
class LugaresTuristicos {
String id;
String nombre;
String departamento;
String temperatura;
String ubicacion;
String detalle;
String categoria;
String descripcion;
String foto;
late GeoPoint coordenadas;

LugaresTuristicos (this.id, this.nombre, this.departamento, this.temperatura ,this.ubicacion, 
this.detalle, this.categoria, this.descripcion, this.foto, this.coordenadas

    );

/*LugaresTuristicos(this.categoria, this.coordenadas, this.departamento, 
this.descripcion, this.detalle, this.foto, this.id, this.nombre, this.temperatura,this.ubicacion );*/




}