import "package:flutter/material.dart";
import 'package:travel_project/models/user_model.dart';
import 'package:travel_project/pages/login_page.dart';
import 'package:travel_project/repositorie/user_register.dart';
import 'package:travel_project/pages/snackbar.dart';
import 'package:travel_project/pages/home_page.dart';

//SIGN UP
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
//clase tipo enum
//enum Sexo { Femenino, Masculino}

class _RegisterPageState extends State<RegisterPage> { //DENTRO DE LA CLASE
//CONTROLADORES
  final nombres=TextEditingController();
  final apellidos=TextEditingController();
  //final telefono=TextEditingController();
  //final direccion=TextEditingController();
  final email=TextEditingController();
  final password=TextEditingController();
  final passwordConf=TextEditingController();
  UserRegister usuario = UserRegister();  //instacia de la clase UserRegister(user_register)  clase 1/11/22
  late mensaje msg; // variable intancia la clase SNACKBAR
  //late final mensaje msg;

//clase - variable - valor por defecto         
  //Sexo?  _sexo   =   Sexo.Femenino; 

    //metodo que llama a UserRegister(user_register) clase 1/11/22
  void guardarUsuario(UsersClass UserNew) async {
    //resultado retorna el ID
    var resultado = await usuario.registrarUsuario(email.text, password.text);
  
    if (resultado== "internal-error"){ //unknown
          msg.mostrarMensaje("Campo requerido");
      }else
      if (resultado== "invalid-email"){
        msg.mostrarMensaje("Email incorrecto");
      }else
      if (resultado== "weak-password"){
          msg.mostrarMensaje("Password debe contener 6 números");
      }else
      if (resultado== "network-request-failed"){
          msg.mostrarMensaje("Fallo en la conexión");
      }else{
        UserNew.id = resultado; //
        llamadocrearUsuario(UserNew); //llamada del metodo para cpmpletar registro en la BD
        msg.mostrarMensaje("Successful registration");
      }
  }

    //metodo para capturar los datos, validarlos, almacenarlos y crear un usuario nuevo
    void traerDatos(){     
      setState(() { //actualiza el estado de la pantalla
      //validacion de password
        if(password.text == passwordConf.text){
          if(nombres.text.isNotEmpty && apellidos.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty && passwordConf.text.isNotEmpty){
          //if(nombres.text.isNotEmpty && apellidos.text.isNotEmpty && email.text.isNotEmpty && telefono.text.isNotEmpty 
          //&& direccion.text.isNotEmpty && password.text.isNotEmpty && passwordConf.text.isNotEmpty){
            /*String sex = "Femenino"; //variable que contiene la validacion del sexo y genera el cambio
            if(_sexo==Sexo.Masculino){
              sex= "Masculino";
            }*/
            //variable que contiene el constructor de la clase Users_class (user_model) y crea el usuario nuevo
            var UserNew = UsersClass("", nombres.text, apellidos.text, email.text, password.text);
            
            //var UserNew = UsersClass("", nombres.text, apellidos.text, 
            //telefono.text, direccion.text, email.text, password.text); // variable sex
            guardarUsuario(UserNew); //guardamos en la autenticacion y actualizamos el id
          }else{
            msg.mostrarMensaje("Complete data"); //complete los datos
          }

        }else{
          msg.mostrarMensaje("Enter same password"); // ingrese password
        }
        
      });

    }
//clase 3/11/22
  //metodo que llama a crear usuario user_register (UserRegister)
  void llamadocrearUsuario(UsersClass UserNew) async{
    var id= await usuario.crearUsuario(UserNew);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const HomePage()))); // Navigator lanza a otra pagina
  }







  @override
  Widget build(BuildContext context) {
    msg= mensaje(context);    //inicializar la clase mensaje
    return Scaffold(
      //DETALLES MANEJO DE UNA IMAGEN DE FONDO
     // backgroundColor: Colors.blue,
      body: Container(
        /*decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/viajar.png"), //ruta imagen de fondo
            fit: BoxFit.cover
             )
        ),*/

        child: Padding( //margen interna
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: SingleChildScrollView( //Scroll de la pantalla
            child:  Center(
              child: Column(
                children: [

                   Container(
                    //CONFIGURACION DE LA IMAGEN     child: const Image( image: AssetImage("assets/excursionismo.png"), width: 120, height: 120,),     
                    child: const Image( image: AssetImage("assets/logoapp.png")), // ignore: sort_child_properties_last
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // ignore: sort_child_properties_last
                    //padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                    margin: const  EdgeInsets.all(30), //margenes  
                    //DECORACION
                   /* decoration:  BoxDecoration( //decoraciones
                      gradient: const LinearGradient( //degradado
                        begin: Alignment.topCenter, //inicio desde la parte central superior
                        end: Alignment(0.0, 1.0), //FIN porcentaje de los anchos aplicados
                        colors: <Color>[
                          Color.fromARGB(172, 5, 80, 74),
                          Color(0XFF2E7D32),
                        ],
                        tileMode: TileMode.repeated
                        ),
                        borderRadius: BorderRadius.circular(200), // BORDES TIPO CIRCULAR
                        border: Border.all(color: Colors.black, width: 1), //BORDES
                    ),*/

                  ),   
                  TextFormField(
                    controller: nombres,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.person_outline, size: 20, color: Colors.black26,)
                    ),
                  ), 
                  const SizedBox( height: 15,),

                  TextFormField(
                    controller: apellidos,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: "Surnames",
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.person_outline, size: 20, color: Colors.black26,)
                    ),
                  ), 

                  const SizedBox( height: 15,), 

                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email_outlined, size: 20, color: Colors.black26,)
                    ),
                  ), 

                  const SizedBox( height: 15,),

                  /*  TextFormField(
                    controller: telefono,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.phone_outlined, size: 20, color: Colors.black26,)
                    ),
                  ), 

                  const SizedBox( height: 15,),

                  TextFormField(
                    controller: direccion,
                    keyboardType: TextInputType.streetAddress,
                    decoration: const InputDecoration(
                      labelText: "Address",
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.home_outlined, size: 20, color: Colors.black26,)
                    ),
                  ), 
                  const SizedBox( height: 15,),

                  //FILA SEXO               
               Row(                
                    children: [
                      Expanded(
                        child: ListTile(   //crea items tipo lista
                    title: const Text("F", style: TextStyle(color: Colors.black26)),
                    leading: Radio<Sexo>( //CIRCULO - radio tipo Sexo
                      value: Sexo.Femenino,
                      groupValue: _sexo,
                      onChanged: (Sexo? value) { 
                        setState((){ //cambia el estado de la interfaz
                          _sexo = value;
                        }); 
                      },),
                  ),
                  ),
                  Expanded(
                        child: ListTile(   //crea items tipo lista
                    title: const Text("M", style: TextStyle(color: Colors.black26)),
                    leading: Radio<Sexo>( //CIRCULO - radio tipo Sexo
                      value: Sexo.Masculino,
                      groupValue: _sexo,
                      onChanged: (Sexo? value) { 
                        setState((){ //cambia el estado de la interfaz
                          _sexo = value;
                        }
                        ); 
                      },
                      ),
                        ),
                  ),
                  ],
                  ),*/



                  TextFormField(
                    obscureText: true,
                    controller: password,
                    keyboardType: TextInputType.number,
                    maxLength: 6, //4
                    decoration: const InputDecoration(
                      labelText: "Password",
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined, size: 20, color: Colors.black26,)
                    ),
                  ), 
                  const SizedBox( height: 15,), //20

                  TextFormField(
                    obscureText: true,
                    controller: passwordConf,
                    keyboardType: TextInputType.number,
                    maxLength: 6, //4
                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
                      fillColor: Colors.white12, //color de fondo del texto
                      filled: false,  //false = condicion de aplicacion
                      //border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined, size: 20, color: Colors.black26,)
                    ),
                  ), 
                  const SizedBox( height: 15,),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      fixedSize: const Size(300, 50), //tamano boton
                      shape: RoundedRectangleBorder(  //tipo de borde
                          borderRadius: BorderRadius.circular(30) //50
                        ),
                     textStyle: const TextStyle(
                    fontStyle: FontStyle.normal, //tipo de fuente
                    fontSize: 20  //tamano letra
                   ),
                   ),
                    onPressed: (){ //Funcionalidad del boton 
                        traerDatos();
                     },
                   child: const Text("Sign up"),
                       ),
                  const SizedBox(height: 15,),

                    //BOTON LOG IN
                  TextButton(
                    style: TextButton.styleFrom( // letra
                      textStyle: const  TextStyle(
                        fontSize: 16, 
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF004D40))
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    child: const Text("Already have an account? Log in"),
                    ),



                  

                ],
              ),
            ),
            )         
          ),
      ),
    );
  }
}