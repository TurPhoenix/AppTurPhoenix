//clase 8/11/22
class SitesClass{
//atributos
var _id;
var _nombre;
var _ubicacion;
var _departamento;
var _temperatura;
var _categoria;
var _descripcion;
var _detalle;
var _foto;


//constructor
SitesClass(this._id, this._nombre, this._departamento, this._temperatura, this._ubicacion, this._categoria, this._descripcion, this._detalle, this._foto );   

//setter getter
get id => _id;

set id(value){ _id = value;}

get nombre => _nombre;

set nombre(value){_nombre = value;}

get ubicacion => _ubicacion;

set ubicacion(value){_ubicacion = value;}

get categoria => _categoria;

set categoria(value){_categoria = value;}

get descripcion => _descripcion;

set descripcion(value){_descripcion = value;}

get foto => _foto;

set foto(value){_foto = value;}

get detalle => _detalle;

set detalle(value){_detalle = value;}

get departamento => _departamento;

set departamento(value){_departamento = value;}

get temperatura => _temperatura;

set temperatura(value){_temperatura = value;}


//PLANTILLA funcion para establecer el formato JSON
SitesClass.fromJson(Map<String, dynamic> data)
:_id= data["id"],
_nombre= data["nombre"],
_ubicacion= data["ubicacion"],
_categoria= data["categoria"],
_descripcion = data["descripcion"],
_foto = data["foto"],
_detalle = data["detalle"],
_departamento = data["departamento"],
_temperatura = data["temperatura"];


//funcion que convierte la plantilla en JSON
Map<String, dynamic> convertir2() => {
  "id":_id,
  "nombre":_nombre,
  "ubicacion":_ubicacion,
  "categoria":_categoria,
  "descripcion":_descripcion,
  "foto":_foto,
  "detalle":_detalle,
  "departamento":_departamento,
  "temperatura":_temperatura

};


}