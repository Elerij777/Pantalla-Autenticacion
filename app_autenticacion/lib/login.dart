import 'package:app_autenticacion/textfield_costume.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.person,
                size: 150,
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
                obscureText: true,
                inputType: TextInputType.visiblePassword,
              )
            ],
          ),
        ),
      ),
    );
  }
}
