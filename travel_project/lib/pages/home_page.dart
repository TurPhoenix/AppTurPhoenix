import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Bienvenido ${FirebaseAuth.instance.currentUser?.email} ") //clase 1/11/22
          ],
        ),
      ),
    );
  }
}