//clase 3/11/22
class UsersClass{
//atributos
var _id;
var _nombres;
var _apellidos;
var _telefono;
var _direccion;
var _email;
//var _genero;
var _password;

//constructor
UsersClass(this._id, this._nombres, this._apellidos, this._telefono, this._direccion, 
this._email, this._password);  //, this._genero  

//setter getter
get id => _id;

set id(value){ _id = value;}

get nombres => _nombres;

set nombres(value){_nombres = value;}

get apellidos => _apellidos;

set apellidos(value){_apellidos = value;}

get telefono => _telefono;

set telefono(value){_telefono = value;}

get email => _email;

set email(value){_email = value;}

get direccion => _direccion;

set direccion(value){_direccion = value;}

/*get genero => _genero;

set genero(value){_genero = value;}*/

get password => _password;

set password(value){ _password = value;}

//PLANTILLA funcion para establecer el formato JSON
UsersClass.fromJson(Map<String, dynamic> data)
:_id= data["id"],
_nombres= data["nombres"],
_apellidos= data["apellidos"],
_telefono= data["telefono"],
_direccion = data["direccion"],
_email= data["email"],
//_genero = data["genero"],
_password= data["password"];

//funcion que convierte la plantilla en JSON
Map<String, dynamic> convertir() => {
  "id":_id,
  "nombres":_nombres,
  "apellidos":_apellidos,
  "telefono":_telefono,
  "direccion":_direccion,
  "email":_email,
  //"genero":_genero,
  "password":_password
};


}