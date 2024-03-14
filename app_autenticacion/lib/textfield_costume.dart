import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  CustomInput(
      {Key? key,
      required this.controller,
      this.obscureText = false,
      this.inputType = TextInputType.text,
      this.labelText,
      this.prefixIconData})
      : super(key: key);

  late IconData? prefixIconData;
  late String? labelText;
  final TextEditingController controller;
  bool obscureText;
  final TextInputType inputType; // Nuevo parámetro para el tipo de entrada

  @override
  State<CustomInput> createState() =>
      _CustomInputState(prefixIconData: prefixIconData, labelText: labelText);
}

class _CustomInputState extends State<CustomInput> {
  _CustomInputState({
    this.labelText,
    this.prefixIconData,
  });
  late IconData? prefixIconData;
  late String? labelText;

  @override
  void initState() {
    super.initState();
    // Configuración inicial del icono y el texto de acuerdo con el tipo de entrada
    if (prefixIconData == null) {
      if (widget.inputType == TextInputType.visiblePassword) {
        prefixIconData = Icons.lock;
      } else if (widget.inputType == TextInputType.emailAddress) {
        prefixIconData = Icons.email;
      } else {
        prefixIconData = Icons.person;
      }
    }
    if (labelText == null) {
      if (widget.inputType == TextInputType.visiblePassword) {
        labelText = 'Contraseña';
      } else if (widget.inputType == TextInputType.emailAddress) {
        labelText = 'Correo';
      } else {
        labelText = 'Nombre';
      }
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
