import 'package:app_autenticacion/pagina_registro.dart';
import 'package:flutter/material.dart';
import 'package:app_autenticacion/routes.dart';
import 'package:app_autenticacion/pantalla_principal.dart';
import 'package:app_autenticacion/login.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.Home.name: (context) => const HomePage(),
  MyRoutes.Login.name: (context) => const LoginPage(),
  MyRoutes.Registro.name: (context) => const PaginaRegistro(),
};
