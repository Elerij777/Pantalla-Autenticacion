import 'package:flutter/material.dart';
import 'package:app_autenticacion/router.dart';
import 'package:app_autenticacion/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: MyRoutes.Registro.name,
      routes: routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => PageNotFound(name: settings.name),
        );
      },
    );
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key, required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('La ruta $name no existe'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, MyRoutes.Home.name);
              },
              child: const Text('Ir a la página principal'),
            ),
          ],
        ),
      ),
    );
  }
}
