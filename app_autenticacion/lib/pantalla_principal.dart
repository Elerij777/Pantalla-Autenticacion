import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String userEmail;
  const HomePage({Key? key, required this.userEmail}) : super(key: key);


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
              Text('Has encontrado todos las parejas en $intentos intentos.'),
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
    String usuario = widget.userEmail;
    return Scaffold(
      appBar: AppBar(
        title: Text(
      'Juegos UNAH\n Bienvenido $usuario', textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24, 
        fontWeight: FontWeight.bold,)
    ),
    centerTitle: true,
    toolbarHeight: 90,
      ),


body: ListView(
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GridView.builder(
          shrinkWrap: true,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Mas Juegos Relacionados',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Juego 1
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset('assets/mario.jpg', width: 100, height: 100,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Super Mario 64',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 8), 
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          },
                          child: Text('Jugar'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Juego 2
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset('assets/gof.jpg', width: 100, height: 100,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'God of War',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 8), 
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          
                          },
                          child: Text('Jugar'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Juego 3
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset('assets/bla.jpg', width: 100, height: 100),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Blasphemouss',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 8), 
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                           
                          },
                          child: Text('Jugar'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ],
),
    );
  }
}
