import 'package:flutter/material.dart';
import 'package:travel_project/models/favorites_local.dart';
import 'package:travel_project/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:hive_flutter/adapters.dart';

//firebase clase 27/10/22
//ICONO CLASE 20/10/22
//ANIMACION CLASE 21

void main() async {

  /*WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);*/


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

//clase 15/11/22
  await Hive.initFlutter();  // se trabaja sobre base de datos local
  Hive.registerAdapter(FavoritesLocalAdapter()); // se trabaja adapatador sobre un modelo favoriteslocal
  await Hive.openBox<FavoritesLocal>("favoritos"); //se abre la caja para trabajar
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //quita el debug
      title: 'Viajerx',
      theme: ThemeData(
        
        primarySwatch: Colors.teal, //Colors.cyan, ,//
        canvasColor: const  Color(0xFFFFFFFF), // color de fondo para TODA LA APP
      ),
      home: const SplashPage(),
    );
  }
}

//  clave api maps   AIzaSyDTi-pI2TpRACFfZ0fVUTbRmceXgdG0Jaw

