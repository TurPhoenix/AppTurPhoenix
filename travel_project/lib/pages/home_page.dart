import "package:flutter/material.dart";
import 'package:travel_project/pages/card_home.dart';
import 'package:travel_project/pages/menu.dart';
import 'package:travel_project/pages/menu_inferior.dart';
import 'package:travel_project/pages/register_sites_page.dart';
import 'package:travel_project/pages/sites_principal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(title: const Text("Viajerx"), /*actions: [

        
        /*IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const SitesPrincipalPage())));
            },
            icon: const Icon(
              Icons.list_alt_outlined,
              size: 24,
              color: Colors.white,
            )),*/
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const CardHome())));
            },
            icon: const Icon(
              Icons.switch_video_sharp,
              size: 24,
              color: Colors.white,
            ))
      ]*/
      ),
      drawer: MenuPage(), //drawer llama a la clase menu
      body: Container(
        child: Padding(
          //margen interna
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          // ignore: sort_child_properties_last
          child: SingleChildScrollView(
            //Scroll de la pantalla
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const <Widget>[Text( "Discover the world "), //"Bienvenido ${FirebaseAuth.instance.currentUser?.email} "), //clase 1/11/22 ]
                  //Text("Hello ${FirebaseAuth.instance.currentUser?.email}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.black54), ),
                  const Text(
                    "Discover the world ",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                        color: Colors.black87),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

              /*      TextButton.icon(
                     // controller: buscar,             
              onPressed: () {},
              label: const Text("Search more", style: TextStyle(fontSize: 17, color: Colors.black26),),
              icon: const Icon(Icons.search_outlined, size: 30, color:Colors.black26,),),*/

                 /*  TextFormField(
                    //controller: buscar,
                    
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Search your trip',
                      labelStyle: TextStyle(
                          fontSize: 17,
                          fontStyle: FontStyle.normal,
                          color: Colors.black26), //color: Color(0xFF6200EE)
                      fillColor: Colors.white10, //color de fondo del texto
                      filled: true,
                      suffixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.black26,
                      ), // Icon(Icons.search_outlined, size: 20, color: Colors.black26, )),
                      //enabledBorder: UnderlineInputBorder(borderSide: BorderSide( color: Color(0xFF6200EE)),
                      //border: OutlineInputBorder(),
                    ),
                  ),*/

                 /* const SizedBox(
                    height: 18,
                  ),*/

                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30)), //shape dibuja los bordes
                    margin: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10) ,   //all(50),
                    elevation: 25,
                    color: const Color(0xFFE0F2F1),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBypBHvyEwGxvQaRyvh8at14CTvJzz7eugjQ&usqp=CAU"),
                       
                         ButtonBar(
                    alignment: MainAxisAlignment.center,                   
                    children: [
                      TextButton(                        
                        onPressed: () {
                          Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SitesPrincipalPage()));
                        },
                         child: const Text('Beach',  style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,color: Colors.black87),
                                ),
                                
                      ),
                    ],
                  ),
                      ],
                    ),
                  ),

                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30)), //shape dibuja los bordes
                    margin: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10) , //30
                    elevation: 25,
                    color: const Color(0xFFE0F2F1),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyDNtTALEEOxG1eKn8x141L0IOd9T7k_xnOkpjkgEGixxQ977E3rYIuYt97JSBQRHDwUU&usqp=CAU"),
                        
                      /*  const ListTile(
                          
                          title: Text(
                            'Frontino',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          // trailing: ElevatedButton(onPressed: (){}, child: Text("Explore")),
                        ),*/
                        ButtonBar(
                    alignment: MainAxisAlignment.center,                   
                    children: [
                      TextButton(                        
                        onPressed: () {
                          Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SitesPrincipalPage()));
                        },
                         child: const Text('Mountain',  style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,color: Colors.black87),
                                ),
                                
                      ),
                    ],
                  ),


                        /*Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14, bottom: 17 ),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SitesPrincipalPage()));
                              },
                              child: Text("Explore")),
                        )*/
                      ],
                    ),
                  ),

                   const SizedBox(
                    height: 18,
                  ),

                  FloatingActionButton.extended(
                    //backgroundColor: const Color(0xff03dac6),
                    foregroundColor: Colors.black,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterSites()));
                    },
                    icon: const Icon(
                      Icons.add_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    label: const Text('Create destination',
                        style: TextStyle(fontSize: 17, color: Colors.white)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
     /*  FloatingActionButton.extended(
                    //backgroundColor: const Color(0xff03dac6),
                    foregroundColor: Colors.black,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterSites()));
                    },
                    icon: const Icon(
                      Icons.add_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    label: const Text('Create destination',
                        style: TextStyle(fontSize: 17, color: Colors.white)),
                  ),*/

        bottomNavigationBar: const MenuInferior(),

    );
  }
}


  /*  Padding(
       padding: const EdgeInsets.only(left: 14, right: 14, bottom: 17 ),
        child: TextButton( style: TextButton.styleFrom( textStyle: const TextStyle( fontSize: 17, )),                                                                                                                                      
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => const SitesPrincipalPage()));
        },
        child: const Text("Explore"),
        ),
         )*/