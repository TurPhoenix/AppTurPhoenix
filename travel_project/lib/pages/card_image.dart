import "package:flutter/material.dart";
//clase 9/11/22

class CardImage extends StatelessWidget {
//atributos
  final String url;
  final String texto;
//constructor
  CardImage(this.url, this.texto);
 

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))  , //shape dibuja los bordes
      margin: const EdgeInsets.all(30),
      elevation: 25,
      color: const Color(0xFFE0F2F1), 
       clipBehavior: Clip.antiAlias,
              child: Column(               
                children: [
                  Image.network(url, ),                  
                  Container(
                    alignment: Alignment.center,
                    //child: const Icon(Icons.location_on_outlined, size: 30, color: Colors.white, ), 
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    child: Text(texto, style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.6)),),
                  ),                                                                    
                ],
              ),

      /*child: ClipRRect( //clipRect carga la imagen
        borderRadius: BorderRadius.circular(40),
        child: Column(
          children: [                                             //higth para ajustarse al alto
            Image.network(url, width: MediaQuery.of(context).size.width,height: 250,),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: Text(texto, style: const TextStyle(fontSize: 14, color: Colors.black)),
            )
          ],
        ),
        ),*/ 
    );
  }
}



