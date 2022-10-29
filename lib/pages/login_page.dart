



import 'package:app_turismo/pages/home_page.dart';
import 'package:app_turismo/pages/registrar_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}
final email=TextEditingController();
final password=TextEditingController();

void validarUsuario(){

  if(email.text.isEmpty || password.text.isNotEmpty) {
    if (email.text == "Stephany@gmail.com"){
      if (password.text == "stepha123*") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        mostrarMensaje("Datos Incorrectos.");
      }
    }else{ mostrarMensaje("Usuario no registrado.");}
    }else{
    mostrarMensaje("Datos obligatorios");
  }
}

void mostrarMensaje(String mensaje){
  final pantalla=ScaffoldMessenger.of(context);
  pantalla.showSnackBar(
      SnackBar(
          content: Text(mensaje, style: const TextStyle(fontSize: 17),),
        backgroundColor: const Color(0xFFD50000),
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          label: "Aceptar",
          onPressed:(){
            pantalla.hideCurrentSnackBar;

          }

        ),
      )
   );
 }

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(color: Colors.black38, width: 4),
                ),
                child: const Image(image: AssetImage("assets/logo2.png"), width: 140, height: 140),
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: "Correo electronico",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.email_outlined, color: Colors.blueAccent, size: 22)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: password,
                obscureText: true,
                //keyboardType: TextInputType.emailAddress,
                //maxLength: 8,
                decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.vpn_key_sharp, color: Colors.blueAccent, size: 22)
                ),
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue)
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrarPage()));
                  },

                  child: const Text("Registrarse")
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    shadowColor: Colors.black26,
                    textStyle: const TextStyle(
                      //fontStyle: FontStyle.italic,
                      fontSize: 16
                    )
                  ),
                  onPressed: (){
                    validarUsuario();
                  },
                  child: const Text("Ingresar"))
            ],
          ),
        ),
      ),
    );
  }
}
