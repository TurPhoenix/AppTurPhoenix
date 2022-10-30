import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import '../models/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genero {masculino, femenino}

class _RegisterPageState extends State<RegisterPage> {
  final _nombre = TextEditingController();
  final _correo = TextEditingController();
  final _contra = TextEditingController();
  final _repContra = TextEditingController();

  String _data = "Información: ";

  Genero? _genero = Genero.masculino;

  bool _mar = false;
  bool _selva = false;
  bool _otros = false;

  String buttonMsg = "Fecha de nacimiento";

  String _fecha = "";

  String _dateConverter(DateTime newDate) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }

  void _showSelectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es", "CO"),
      initialDate: DateTime(2022, 10),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2022, 12),
      helpText: "Fecha de nacimiento",
    );
    if (newDate != null) {
      setState(() {
        _fecha = _dateConverter(newDate);
        buttonMsg = "Fecha de nacimiento: ${_fecha.toString()}";
      });
    }
  }

  void _showMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _onRegistrerButtonClicked() {
    setState(() {
      if (_contra.text == _repContra.text) {
        String genero = "Masculino";
        String destinos = "";

        if (_genero == Genero.femenino) {
          genero = "Femenino";
        }

        if (_mar) destinos = "$destinos Mar";
        if (_selva) destinos = "$destinos Selva";
        if (_otros) destinos = "$destinos Otros Destinos";

        var user = User(
            _nombre.text, _correo.text, _contra.text, genero, destinos, _fecha);
      } else {
        _showMsg("Las contraseñas deben de ser iguales");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(image: AssetImage('assets/images/logoapp.png')),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _nombre,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nombre'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _correo,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Correo'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _contra,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Contraseña'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _repContra,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Repetir Contraseña'),
                  keyboardType: TextInputType.text,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('M'),
                        leading: Radio<Genero>(
                            value: Genero.masculino,
                            groupValue: _genero,
                            onChanged: (Genero? value) {
                              setState(() {
                                _genero = value;
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('F'),
                        leading: Radio<Genero>(
                            value: Genero.femenino,
                            groupValue: _genero,
                            onChanged: (Genero? value) {
                              setState(() {
                                _genero = value;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Destinos turisticos',
                  style: TextStyle(fontSize: 20),
                ),
                CheckboxListTile(
                  title: const Text('Mar'),
                  value: _mar,
                  selected: _mar,
                  onChanged: (bool? value) {
                    setState(() {
                      _mar = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Selva'),
                  value: _selva,
                  selected: _selva,
                  onChanged: (bool? value) {
                    setState(() {
                      _selva = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Otros destinos'),
                  value: _otros,
                  selected: _otros,
                  onChanged: (bool? value) {
                    setState(() {
                      _otros = value!;
                    });
                  },
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    _showSelectDate();
                  },
                  child: Text(buttonMsg),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    _onRegistrerButtonClicked();
                  },
                  child: const Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



