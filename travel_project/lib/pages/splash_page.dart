


import "package:flutter/material.dart";
import 'package:travel_project/pages/login_page.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

//Funcion de inicio de estado
  void initState(){
    pasarPage();
    super.initState();

  }

  //FUNCION DESPUES DE(envia a otra pag)...  asincrona delayed-tiempo
  Future<void> pasarPage() async{
    Future.delayed(const Duration(seconds: 4), () async{ //TIEMPO DE TRANSICIÓN
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)  => const LoginPage())); //reemplaza una pagina con otra
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFE0F2F1), //color de fondo de la pantalla   0xFFB2DFDB
      body: Center(
        child: Container(
          //CONFIGURACION DE LA IMAGEN
          // ignore: sort_child_properties_last  
          child: const Image( image: AssetImage("assets/logoapp.png"), width: 200, height: 200,),
          // ignore: sort_child_properties_last //assets/excursionismo.png
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          margin: const  EdgeInsets.all(20),
          //caja del borde
          /*decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200), //   50  completamente circular borderRadius: BorderRadius.circular(200),
            border: Border.all(color: Colors.teal, width: 2), //width gruso de linea 4
            //color: Colors.white // color de fondo de la caja

          ),*/

        ),
      ),
    );
  }
}