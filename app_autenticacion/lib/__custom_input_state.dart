import 'package:app_autenticacion/textfield_costume.dart';
import 'package:flutter/material.dart';

class _CustomInputState extends State<CustomInput> {
  late IconData prefixIconData;
  late String labelText;

  @override
  void initState() {
    super.initState();
    // Configuración inicial del icono y el texto de acuerdo con el tipo de entrada
    if (widget.inputType == TextInputType.visiblePassword) {
      prefixIconData = Icons.lock;
      labelText = 'Contraseña';
    } else if (widget.inputType == TextInputType.emailAddress) {
      prefixIconData = Icons.email;
      labelText = 'Correo';
    } else {
      prefixIconData = Icons.person;
      labelText = 'Nombre';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: labelText, // Usa el texto configurado dinámicamente
        prefixIcon:
            Icon(prefixIconData), // Usa el icono configurado dinámicamente
        suffixIcon: widget.inputType == TextInputType.visiblePassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: Icon(Icons.remove_red_eye_rounded),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
  }
}
