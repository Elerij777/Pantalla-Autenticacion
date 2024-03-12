import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  CustomInput({
    super.key,
    required this.controller,
    this.obscureText = false,
  });

  final TextEditingController controller;
  bool obscureText;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        label: const Text('Password'),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
            onPressed: () {
              // TODO: logica para mostrar u ocultar el pasword
            },
            icon: const Icon(Icons.remove_red_eye_rounded)),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
