import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_project/pages/favorites_page.dart';
import 'package:travel_project/pages/home_page.dart';
import 'package:travel_project/pages/sites_list_page.dart';
import 'package:travel_project/pages/sites_principal.dart';
//clase 15/11/22
class MenuInferior extends StatefulWidget {
  const MenuInferior({super.key});

  @override
  State<MenuInferior> createState() => _MenuInferiorState();
}

class _MenuInferiorState extends State<MenuInferior> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.amber,
      selectedItemColor: Colors.deepOrangeAccent,  //color item selccionado
      unselectedItemColor: Colors.black, //color item no seleccionado
      items: const [
        BottomNavigationBarItem(icon:
         Icon(FontAwesomeIcons.house, size: 20), label: "prueba0"),
        // label: "prueba0",
        
        BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.compass, size: 20), 
        label: "prueba0"),// label: "prueba1",
        
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.heart, size: 20),label: "prueba0"),
      
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user, size: 20), label: "prueba0"),
        

      ],
      onTap: (indice){
        if(indice==0){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const HomePage())));  
        }
        if(indice==1){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const SitesPrincipalPage())));   
        }
        if(indice==2){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const FavoritesPage())));  
        }
        if(indice==3){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const SitesListPage())));  
        }
      },
      
      
      
      );
  }
}