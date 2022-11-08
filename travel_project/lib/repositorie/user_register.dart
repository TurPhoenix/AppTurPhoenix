import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:travel_project/models/user_model.dart';
//clase 1/11/22
class UserRegister {
  //metodo asincrono que retorna si el usuario existe(true o false)
  //Future<bool> registrarUsuario(String email, String password) async{ retornaba true - false
  
  //retorna el usuario o las excepciones
  Future<String?> registrarUsuario(String email, String password) async{  //retorna un mensaje
    try{
      //funcion que contiene las credenciales del usuario (registra)
      final credencialUsuario = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return credencialUsuario.user?.uid;  //retorna UID codigo generado por firebase en la autenticacion //return true;
    } on FirebaseAuthException  catch (e){  //manejo de excepciones de autenticacion email - password
      return e.code;
      //clase 2/11/22
    }on FirebaseException  catch (e){ // manejo de excepciones de firebase conexion a los servicios
      return e.code;
    }

  }

  //clase 3/11/22
  //metodo que guarda el usuario en la base de datos
  Future<String?> crearUsuario(UsersClass usuarioBD) async{
    try{ 
      //GUARDA EN LA BASE DE DATOS     
      //se dirige a la coleccion, toma el id con doc.y modifica los datos con set y ejecuta la funcion convertir users_class
      var documentoJson = await FirebaseFirestore.instance.collection("Usuarios").doc(usuarioBD.id).set(usuarioBD.convertir());
      return usuarioBD.id;

    }on FirebaseException catch (e){
      return e.code;

    }

  }



}