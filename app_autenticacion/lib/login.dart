  import 'package:app_autenticacion/textfield_costume.dart';
  import 'package:flutter/material.dart';
  import 'package:app_autenticacion/routes.dart';
  import "package:app_autenticacion/pantalla_principal.dart";


  class LoginPage extends StatefulWidget {
    const LoginPage({Key? key}) : super(key: key);

    @override
    _LoginPageState createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    String _errorMessage = '';

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Login', style: TextStyle(
            fontSize: 45, 
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',)),

          centerTitle: true,
           toolbarHeight: 80,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/cat.gif", width: 300, height: 250,),
                
                CustomInput(
                  controller: _emailController,
                  obscureText: false,
                  inputType: TextInputType.emailAddress,
                  labelText: 'Correo electrónico',
                  prefixIconData: Icons.email,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomInput(
                  controller: _passwordController,
                  obscureText: true,
                  inputType: TextInputType.visiblePassword,
                  labelText: 'Contraseña',
                  prefixIconData: Icons.lock,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                TextButton(
                  onPressed: () {
                    _loginCredenciales();
                  },
                  child: const Text('Confirmar datos', style: TextStyle(fontSize: 16),),
                ),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                  height: 12.0,
                ),
                  TextButton(
                   onPressed: () {
                   Navigator.pushNamed(context, MyRoutes.Registro.name);
                 },
                child: const Text('Registrarse', style: TextStyle(
                  fontSize: 16.0,
                )),
                ),

              ],
            ),
          ),
        ),
        );
    }

    void _loginCredenciales() {
     
      String enteredEmail = _emailController.text.trim();
      String enteredPassword = _passwordController.text.trim();

      // Credenciales permitidas
      Map<String, String> validCredentials = {
        'degironm@unah.hn': '20222000528',
        'erick.turcios@unah.hn': '20212021280',
      };

      if (validCredentials.containsKey(enteredEmail) &&
          validCredentials[enteredEmail] == enteredPassword) {
        
        //Identificar al usuario
   String welcomeMessage = 'Bienvenido $enteredEmail';

    // Mostrar mensaje de bienvenida
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(welcomeMessage)),
    );
        //Resultado si las credenciales son correctas
        Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => HomePage(userEmail: enteredEmail),
  ),
);
      } else {
        //Resultado si no son correctas
        setState(() {
          _errorMessage = 'Verifique sus credenciales';
        });
      }
    }
  }
