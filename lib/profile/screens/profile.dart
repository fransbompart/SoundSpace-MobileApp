import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PerfilPage(),
    );
  }
}

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final nacimientoController = TextEditingController();
  final generoController = TextEditingController();
  bool editar = false;

  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    nacimientoController.dispose();
    generoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color.fromARGB(255, 52, 13, 131),
                Color.fromARGB(255, 30, 8, 58),
                Color.fromARGB(255, 24, 18, 31),
                Color.fromARGB(255, 30, 8, 58),
                Color.fromARGB(255, 57, 13, 145),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /*IconButton(
              onPressed: () {
                // Handle 3 dots button press
              },
              icon: const Icon(Icons.more_vert),
            ),*/
            const SizedBox(height: 50),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    '  Perfil',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    onPressed: () {
                      editar = true;
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ]),
            const SizedBox(height: 20),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '  Nombre y Apellido',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
            Row(
              children: <Widget>[
                const SizedBox(
                    width:
                        10), // Adding some spacing between the Text widget and TextField
                Expanded(
                  child: TextField(
                    enabled: editar,
                    controller: nombreController,
                    decoration: const InputDecoration(
                      hintText: 'Carlos Alonso',
                      fillColor: Color.fromARGB(255, 157, 145, 177),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '  Correo Electrónico',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
            Row(
              children: <Widget>[
                const SizedBox(
                    width:
                        10), // Adding some spacing between the Text widget and TextField
                Expanded(
                  child: TextField(
                    enabled: editar,
                    controller: correoController,
                    decoration: const InputDecoration(
                      hintText: 'Calonso@gmail.com',
                      fillColor: Color.fromARGB(255, 157, 145, 177),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '  Fecha de Nacimiento',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Género',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10),
                ]),
            Row(
              children: <Widget>[
                const SizedBox(
                    width:
                        10), // Adding some spacing between the Text widget and TextField
                Expanded(
                  child: TextField(
                    enabled: editar,
                    controller: nacimientoController,
                    decoration: const InputDecoration(
                      hintText: '19/04/1810',
                      fillColor: Color.fromARGB(255, 157, 145, 177),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    enabled: editar,
                    controller: generoController,
                    decoration: const InputDecoration(
                      hintText: 'M',
                      fillColor: Color.fromARGB(255, 157, 145, 177),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
