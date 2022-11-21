import "package:flutter/material.dart";

//firebase maneja bases de datos no relacionels se accede por id a la informacion, y se anidan las relaciones

//clase 2/11/22 
class mensaje{
  late BuildContext context;

  mensaje(this.context);

  // SNACKBAR
// pantalla con mensaje de error clase 25/10/22 
  void mostrarMensaje(String mensaje){ //pantalla variable
    final pantalla = ScaffoldMessenger.of(context);
    pantalla.showSnackBar( //genera un mensaje en pantalla
      SnackBar(
        content: Text(mensaje, style: const TextStyle(fontSize: 20, fontStyle: FontStyle.normal, color: Color(0xFF004D40)),), // estilo de la fuente
        backgroundColor: const Color(0xFFB2DFDB), //color de fondo pantalla del mensaje    Colors.white
        duration: const Duration(seconds: 8),               // 
        //label: "OK",
        //onPressed: pantalla.hideCurrentSnackBar, // oculta la barra al presionr ok
      )
    );
  }

  



}