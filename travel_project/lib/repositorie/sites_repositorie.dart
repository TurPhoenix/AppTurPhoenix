import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_project/models/sites_model.dart';

//clase 8/11/22
class SitesRepositorie{

  Future<String?> registrarSitio(SitesClass sitio) async{
try{
  final uid= FirebaseAuth.instance.currentUser?.uid; //trae el id del usuario autenticado y que ingresa 
  //validacion sitio existente por medio del nombre
  //final validacionExistencia = await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("sitios").where("nombre", isEqualTo: sitio.nombre)
//se posiciona y toma la informacion del doc y id del usuario actual. y crea la coleccion sitios si no existe o accede a ella si ya la tiene
  final documentSites = await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("sitios").doc(); //.doc() genera un id automatico
   sitio.id = documentSites.id; //id de la mascota
   //guarda los datos 
   final resultadoRetorno =await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("sitios").doc(sitio.id).set(sitio.convertir2());
  return sitio.id;

}on FirebaseException catch (e){
  print(e.code);
  return e.code;
 

}

  }

}