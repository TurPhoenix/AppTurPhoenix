class User {
  var _nombre;
  var _correo;
  var _contra;
  var _genero;
  var _destinos;
  var _fecha;


  User(this._nombre, this._correo, this._contra, this._genero, this._destinos,
      this._fecha);

  User.Empty();

  User.fromJson(Map<String, dynamic> json)
      : _nombre = json['nombre'],
        _correo = json['correo'],
        _contra = json['contra'],
        _genero = json['genero'],
        _destinos = json['destinos'],
        _fecha = json['fecha'];

  Map<String, dynamic> toJson() =>
      {
        'nombre': _nombre,
        'correo': _correo,
        'contra': _contra,
        'genero': _genero,
        'destinos': _destinos,
        'fecha': _fecha,
      };

  get fecha => _fecha;

  set fecha(value) {
    _fecha = value;
  }

  get destinos => _destinos;

  set destinos(value) {
    _destinos = value;
  }

  get genero => _genero;

  set genero(value) {
    _genero = value;
  }

  get contra => _contra;

  set contra(value) {
    _contra = value;
  }

  get correo => _correo;

  set correo(value) {
    _correo = value;
  }

  get nombre => _nombre;

  set nombre(value) {
    _nombre = value;
  }
}