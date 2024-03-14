import 'package:app_autenticacion/textfield_costume.dart';
import 'package:flutter/material.dart';

class PaginaRegistro extends StatelessWidget {
  const PaginaRegistro({
    super.key,
  });
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
                  controller: TextEditingController(),
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10.0,
                  width: 10.0,
                ),
                CustomInput(
                  controller: TextEditingController(),
                  obscureText: false,
                  labelText: 'Apellidos',
                  prefixIconData: Icons.person,
                ),
                const SizedBox(
                  height: 10.0,
                  width: 10.0,
                ),
                CustomInput(
                  controller: TextEditingController(),
                  obscureText: false,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10.0,
                  width: 10.0,
                ),
                CustomInput(
                  controller: TextEditingController(),
                  obscureText: false,
                  inputType: TextInputType.visiblePassword,
                )
              ],
            )));
  }
}
