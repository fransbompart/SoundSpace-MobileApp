import 'package:flutter/material.dart';
import 'package:flutter_application_4/homePage/config/app_theme.dart';
import 'package:flutter_application_4/homePage/config/background.dart';
import 'package:flutter_application_4/landingPage/widgets/landing_promo.dart';
import 'package:flutter_application_4/landingPage/widgets/register_button.dart';

//TEMPORAL
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const Scaffold(
        body: GradientBackground(child: LandingPage()),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            // Imagen
            const LandingPromo(promoPath: 'images/aqustico2.png'),

            const SizedBox(height: 20),

            // Texto
            const Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
              child: Text(
                "Te brindamos la experiencia de estar en Aquistco 7 días gratis.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
                       
            const SizedBox(height: 20),

            // Botón de registro
            const RegisterButtom(),

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

            //Image 
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Image.asset('images/logo_conectium.png')
            )
           
          ],
        )
    );
  }
}
