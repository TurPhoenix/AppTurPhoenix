import 'package:hive/hive.dart';
import 'package:travel_project/models/favorites_local.dart';


//15/11/22
//clase que contiene la caja para el CRUD
class BoxDB {
//inicializa y guarda el modelo    funcion que realiza el llamado  caja contenedor      nombre de la tabla o coleccion
  static Box<FavoritesLocal>         boxFavoriteFuncion() =>       Hive.box<FavoritesLocal>('favoritos');

}





   
