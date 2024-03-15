import 'package:app_autenticacion/textfield_costume.dart';
import 'package:flutter/material.dart';

class PaginaRegistro extends StatefulWidget {
  const PaginaRegistro({Key? key}) : super(key: key);

  @override
_PaginaRegistroState createState() => _PaginaRegistroState();
}
class _PaginaRegistroState extends State<PaginaRegistro> {
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _correoController = TextEditingController();
  TextEditingController _telefonoController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();
  TextEditingController _confirmarContrasenaController = TextEditingController();
  String _errorMessage = '';


@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Icon(
                  Icons.adb,
                  size: 150,
                ),
                CustomInput(
              controller: _nombreController,
              obscureText: false,
              labelText: 'Nombre',
              prefixIconData: Icons.person,
            ),
                const SizedBox(
                  height: 10.0,
                  width: 10.0,
                ),
                CustomInput(
              controller: _correoController,
              obscureText: false,
              inputType: TextInputType.emailAddress,
              labelText: 'Correo',
              prefixIconData: Icons.email,
                ),
                const SizedBox(
                  height: 10.0,
                  width: 10.0,
                ),
                CustomInput(
                  controller: _telefonoController,
              obscureText: false,
              inputType: TextInputType.phone,
              labelText: 'Teléfono',
              prefixIconData: Icons.phone,
                ),
                const SizedBox(
                  height: 10.0,
                  width: 10.0,
                ),
                CustomInput(
                  controller: _contrasenaController,
              obscureText: true,
              labelText: 'Contraseña',
              prefixIconData: Icons.lock,
                ),
               const SizedBox(
                  height: 10.0,
                  width: 10.0,
                ),
                CustomInput(
              controller: _confirmarContrasenaController,
              obscureText: true,
              labelText: 'Confirmar Contraseña',
              prefixIconData: Icons.lock,
            ),
            const SizedBox(
              height: 20.0,
            ),
ElevatedButton(
              onPressed: () {
                _registrarUsuario();
              },
              child: const Text('Registrarse'),
            ),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              ],
            )
            )
            ); 
  }   
void _registrarUsuario() {
    String nombre = _nombreController.text.trim();
    String correo = _correoController.text.trim();
    String telefono = _telefonoController.text.trim();
    String contrasena = _contrasenaController.text;
    String confirmarContrasena = _confirmarContrasenaController.text;
    if (nombre.isEmpty || correo.isEmpty || telefono.isEmpty || contrasena.isEmpty || confirmarContrasena.isEmpty) {
      setState(() {
        _errorMessage = 'Por favor, completa todos los campos';
      });
      return;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(telefono)) {
      setState(() {
        _errorMessage = 'El teléfono debe contener solo números';
      });
      return;
    }
    if (!correo.endsWith('@gmail.com')) {
      setState(() {
        _errorMessage = 'El correo electrónico debe tener la terminación "@gmail.com"';
      });
      return;
    }
    if (contrasena != confirmarContrasena) {
      setState(() {
        _errorMessage = 'La contraseña y la confirmación de la contraseña no coinciden';
      });
      return;
    }
    setState(() {
      _errorMessage = '';
    });

  print('Nombre: $nombre');
  print('Correo: $correo');
  print('Teléfono: $telefono');
  print('Contraseña: $contrasena');
  print('Confirmar Contraseña: $confirmarContrasena');

       
  }
}
