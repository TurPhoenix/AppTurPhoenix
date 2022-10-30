import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Image(
                  image: AssetImage('assets/images/frontinoiglesia.jpg'),
                ),
                SizedBox(height: 16.0),
                Text("Pais: Colombia"),
                SizedBox(height: 16.0),
                Text("Departamento: Antioquia"),
                SizedBox(height: 16.0),
                Text("Municipio: Frontino"),
                SizedBox(height: 16.0),
                Text("Lugar de interés: Iglesia de Frontino"),
                SizedBox(height: 16.0),
                Text("T°: 21°C"),
                SizedBox(height: 16.0),
                Text("Dirección: Calle 30 Nº 30-04"),
                SizedBox(height: 16.0),
              ],
            ),
          ),
      ),
    );
  }
}
