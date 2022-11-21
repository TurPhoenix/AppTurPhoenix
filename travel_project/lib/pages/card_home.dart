import "package:flutter/material.dart";
class CardHome extends StatefulWidget {
  const CardHome({super.key});

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
 

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))  , //shape dibuja los bordes
              margin: const EdgeInsets.all(30),
              elevation: 25,
              color: const Color(0xFFE0F2F1),
              clipBehavior: Clip.antiAlias,
              child: Column(               
                children: [
                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBypBHvyEwGxvQaRyvh8at14CTvJzz7eugjQ&usqp=CAU"),         
                  ListTile(                     
                    leading: const Icon(Icons.location_on_outlined, size: 30, color: Colors.black45, ),           
                    title: const Text('Cartagena de Indias', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    subtitle: Text(
                      'Beach', style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.6)), ),
                  ),                                                   
                ],
              ),
            ),


            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))  , //shape dibuja los bordes
              margin: const EdgeInsets.all(30),
              elevation: 25,
              color: const Color(0xFFE0F2F1),
              clipBehavior: Clip.antiAlias,
              child: Column(               
                children: [
                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyDNtTALEEOxG1eKn8x141L0IOd9T7k_xnOkpjkgEGixxQ977E3rYIuYt97JSBQRHDwUU&usqp=CAU"),                  
                  ListTile(                     
                    leading: const Icon(Icons.location_on_outlined, size: 30, color: Colors.black45, ),           
                    title: const Text('Frontino', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    subtitle: Text(
                      'Mountain', style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.6)), ),
                  ),                                                   
                ],
              ),
            ),













           Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      'Secondary Text',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [

                      TextButton(
                        onPressed: () {
                          // Perform some action
                        },
                         child: const Text('ACTION 1'),
                      ),

              TextButton(
                        onPressed: () {
                          // Perform some action
                        },
                         child: const Text('ACTION 2'),
                      ),
    
                    ],
                  ),
                  Image.network("https://www.viajaporlibre.com/wp-content/uploads/2020/02/Cartagena-de-indias-1200x800.jpg")
                  //Image.asset('assets/excursionismo.png'),
                ],
              ),
            ),
        ],
      ),
    );
  }
  

}


