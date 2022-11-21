import "package:hive/hive.dart";
//clase 15/11/22
part "favorites_local.g.dart";

//modelo que genera un repositorio que permite hacer el crud local

@HiveType(typeId: 0)  //anotacion que contiene el indice de la base de datos
class FavoritesLocal extends HiveObject {

@HiveField(0)  //columnas
String? id;
@HiveField(1)
String? nombre;
@HiveField(2)  //columnas
String? ubicacion;
@HiveField(3)
String? departamento;
@HiveField(4)  //columnas
String? temperatura;
@HiveField(5)
String? detalle;
@HiveField(6)  //columnas
String? descripcion;
@HiveField(7)
String? categoria;
@HiveField(8)
String? foto;





}