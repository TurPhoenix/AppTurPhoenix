import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:travel_project/pages/login_page.dart';
import 'package:travel_project/pages/sites_list_page.dart';

class MenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(  //menu lateral
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white70,
              ),  

              child: //leading: 
               Image.network("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"), 
              ),

              Column(
                children:  [
                  ListTile(
                    leading: const Icon(Icons.person_outline, size: 18, color: Colors.teal,),
                    title: Text((FirebaseAuth.instance.currentUser?.email).toString(), style: TextStyle(fontSize: 18, color: Colors.teal)),
                    textColor: Colors.amber,
                    ),


                  ListTile(
                    leading: const Icon(Icons.exit_to_app_outlined, size: 18, color:Colors.teal,),
                    title: const Text("Sign Out", style: TextStyle(fontSize: 18, color: Colors.teal)),
                    textColor: Colors.cyan,
                    onTap: (){
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const LoginPage())));
                    }
                    ),

                    ListTile(
                    leading: const Icon(Icons.exit_to_app_outlined, size: 18, color:Colors.teal,),
                    title: const Text("Sites created", style: TextStyle(fontSize: 18, color: Colors.teal)),
                    textColor: Colors.cyan,
                    onTap: (){
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const SitesListPage())));
                    }
                    ),
                    ],
                  ),
                ],
              ),          
        );   
  }
}