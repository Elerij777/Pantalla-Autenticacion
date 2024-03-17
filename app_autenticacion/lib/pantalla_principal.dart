import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> numeroCarta = List.filled(16, 0);
  List<bool> _cartasVolteadas = List.filled(16, false);
  int primerIndiceVolteado = -1;
  int segundoIndiceVolteado = -1;
  int intentos = 0;
  bool comprobando = false;
  int parejasEncontradas = 0;

  @override
  void initState() {
    super.initState();
    _inicializarJuego();
  }

  void _inicializarJuego() {
    setState(() {
      numeroCarta = List.generate(16, (index) => index ~/ 2);
      numeroCarta.shuffle();
      _cartasVolteadas = List.filled(16, false);
      primerIndiceVolteado = -1;
      segundoIndiceVolteado = -1;
      intentos = 0;
      comprobando = false;
      parejasEncontradas = 0;
    });
  }

  void _alTocarCarta(int index) {
    if (!_cartasVolteadas[index] && !comprobando) {
      setState(() {
        _cartasVolteadas[index] = true;
        if (primerIndiceVolteado == -1) {
          primerIndiceVolteado = index;
        } else {
          segundoIndiceVolteado = index;
          comprobando = true;
          intentos++;
          if (numeroCarta[primerIndiceVolteado] ==
              numeroCarta[segundoIndiceVolteado]) {
            parejasEncontradas++;
            if (parejasEncontradas == 8) {
              mostrarDialogoJuegoGanado();
            }
            primerIndiceVolteado = -1;
            segundoIndiceVolteado = -1;
            comprobando = false;
          } else {
            Timer(Duration(seconds: 1), () {
              setState(() {
                _cartasVolteadas[primerIndiceVolteado] = false;
                _cartasVolteadas[segundoIndiceVolteado] = false;
                primerIndiceVolteado = -1;
                segundoIndiceVolteado = -1;
                comprobando = false;
              });
            });
          }
        }
      });
    }
  }

  void mostrarDialogoJuegoGanado() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¡Felicidades!'),
          content:
              Text('Has encontrado todos las oarejas en $intentos intentos.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _inicializarJuego();
              },
              child: Text('Jugar de nuevo'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego de memoria'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _alTocarCarta(index),
            child: Container(
              color: _cartasVolteadas[index]
                  ? Color.fromARGB(255, 207, 199, 162)
                  : Color.fromRGBO(207, 184, 213, 1),
              child: Center(
                child: _cartasVolteadas[index]
                    ? Text(
                        numeroCarta[index].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Icon(Icons.flip_camera_android),
              ),
            ),
          );
        },
      ),
    );
  }
}
