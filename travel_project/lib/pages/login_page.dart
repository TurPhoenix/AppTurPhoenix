//import 'package:travel_project/pages/home_page.dart';
import 'package:travel_project/pages/register_page.dart';
import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:travel_project/pages/sites.dart';
import 'package:travel_project/pages/snackbar.dart';

//AUTENTICACION 1/11/22
//SIGN IN
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController();  // controller email
  final password = TextEditingController();
  FirebaseAuth objetoAuth= FirebaseAuth.instance; //variable instancia el objeto de autenticacion//instance -crea el objeto
  late final mensaje msg; // variable intancia la clase SNACKBAR





  //modificacion función validarUsuario 1/11/22
  void validarUsuario() async {  //await - async se ejecuta en el transcurso del tiempo
    try{
      //toma los datos realiza la validacion y arroja el usuario si existe
      final user= await objetoAuth.signInWithEmailAndPassword(email: email.text, password: password.text);
      if(user != null){
        msg.mostrarMensaje("Welcome Back ${FirebaseAuth.instance.currentUser?.email} ");
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SitiosPage()));
        // ignore: use_build_context_synchronously
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const HomePage())));

    } 
    } on FirebaseAuthException  catch (e){
      msg.mostrarMensaje("${e.code}");
      /*if (e.code== "internal-error"){ //unknown
          mostrarMensaje("Campo requerido");
      }else
      if (e.code== "invalid-email"){
        mostrarMensaje("Email incorrecto");
      }else
      if (e.code== "user-not-found"){
        mostrarMensaje("Usuario no registrado");
      }else
      if (e.code== "wrong-password"){
          mostrarMensaje("Password incorrecto");
      }else
      if (e.code== "network-request-failed"){
          mostrarMensaje("Fallo en la conexión");
      }*/
  }
}

 //FUNCION DE VALIDACION DATOS clase 25/10/22
  /*void validarUsuario(){ 
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      if(email.text== "l@gmail.com"){
        if(password.text=="123456"){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const HomePage())));
      }else{
        mostrarMensaje("Email o Paswword incorrectos");
       }
    }else{
      mostrarMensaje("Usuario no registrado");
      }
    }else{
      mostrarMensaje("Campo requerido");
    }
  }*/


  @override
  Widget build(BuildContext context) {
    msg= mensaje(context);    //inicializar la clase mensaje
    return  Scaffold(
      //backgroundColor: const Color(0xFFF3E5F5), //color de fondo de la pantalla
      //ELEMENTOS TEXFIELD, BOTONES, logo etc
      body: SingleChildScrollView(  //Scroll
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
        child: Center(
        child: Column(
          children: [
            Container(
          //CONFIGURACION DE LA IMAGEN     child: const Image( image: AssetImage("assets/excursionismo.png"), width: 120, height: 120,),     
          child: const Image( image: AssetImage("assets/logoapp.png")), // ignore: sort_child_properties_last
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // ignore: sort_child_properties_last
          //padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          margin: const  EdgeInsets.all(30),
          //caja del borde
          /*decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), //completamente circular borderRadius: BorderRadius.circular(200),
            border: Border.all(color: Colors.black, width: 4),
            color: Colors.blueGrey
          ),*/
        ),
        //TEXTFIELDS - 
        TextFormField(
          controller: email,
          decoration: const InputDecoration(
            labelText: "Email", 
            fillColor: Color(0xFFE0F2F1), //color de fondo del texto
            filled: false,  //false = condicion de aplicacion
            //border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.email_outlined, size: 20, color: Colors.black26,) //Colors.black45,
          ),
           ),
          //ESPACIO
           const SizedBox(height: 20, ),
          
           TextFormField(
            controller: password,
            obscureText: true, // vista del password
           // keyboardType: TextInputType.number, //tipo de teclado
           // maxLength: 4,  //longitud del password 
            decoration: const InputDecoration(
              labelText: "Password",
               fillColor: Color(0xFFE0F2F1), //color de fondo del texto  Colors.white, 
                filled: false,  //false = condicion de aplicacion
              //border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.remove_red_eye_outlined, size: 20, color: Colors.black26,)   //person_outline - remove_red_eye(abierto)
          ),
           ),


           //BOTON SIGN UP
           TextButton(
            style: TextButton.styleFrom( // letra
              textStyle: const  TextStyle(
                fontSize: 16, 
                fontStyle: FontStyle.normal,
                color: Colors.deepOrange)
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
            },
            child: const Text("Sign up"),
            ),

            
            //BOTON 
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(300, 50), //tamano boton
              shape: RoundedRectangleBorder(  //tipo de borde
                borderRadius: BorderRadius.circular(30) //50
                ), 
                shadowColor: Colors.black,  //color de la sombra
                textStyle: const TextStyle(
                  fontStyle: FontStyle.normal, //tipo de fuente
                  fontSize: 20  //tamano letra

                )
            ),
            onPressed: (){ //Funcionalidad del boton 
                validarUsuario(); //funcion ingreso de datos
            },
            child: const Text("Log in"),  //Log in
            
            )

          ],
          ),
      ),
      ),
      ),
    );
  }
}