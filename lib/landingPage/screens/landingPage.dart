import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key});

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
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Image.asset(
              'images/aqustico.jpg',
            )),
            const SizedBox(height: 20),
            const Text(
              'Te brindamos la experiencia de estar en Aqustico 7 días gratis',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
// Handle button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Regístrate aquí',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '¿Tienes una cuenta? ',
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
// Handle login link press
                  },
                  child: const Text(
                    'Inicia sesión',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'O ingresa como ',
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
// Handle guest link press
                  },
                  child: const Text(
                    'Invitado',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
// Bottom Picture Placeholder
              width: 200,
              height: 200,
// Placeholder image or custom widget can be added here
            ),
          ],
        ),
      ),
    );
  }
}
