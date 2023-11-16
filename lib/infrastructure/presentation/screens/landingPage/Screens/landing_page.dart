import 'package:flutter/material.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/loginPage/login_page.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/landingPage/Widgets/landing_promo.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/landingPage/Widgets/register_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Imagen
                const LandingPromo(promoPath: 'images/aqustico2.png'),

                const SizedBox(height: 20),

                // Texto
                const Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                  child: Text(
                    "Te brindamos la experiencia de estar en Aqustico 7 días gratis.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 30),

                // Botón de registro
                const RegisterButtom(),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      '¿Tienes una cuenta? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginApp()),
                        );
                      },
                      child: const Text(
                        'Inicia sesión',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          decoration: TextDecoration.underline,
                          fontSize: 18,
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle guest link press
                      },
                      child: const Text(
                        'Invitado',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.lightBlue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 120),

                //Image
                Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Image.asset(
                      'images/logo_conectium.png',
                      width: 120,
                    )),
                Image.asset(
                  'images/hojitas.png',
                  width: 120,
                ),
              ],
            ),
          )),
    );
  }
}
