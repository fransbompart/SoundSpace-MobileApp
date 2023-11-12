import 'package:flutter/material.dart';
import 'package:flutter_application_4/loginInvitado/presentation/widgets/error_square.dart';
import 'package:flutter_application_4/loginInvitado/presentation/widgets/my_button.dart';
import 'package:flutter_application_4/loginInvitado/presentation/widgets/textfield.dart';
import 'package:flutter_application_4/loginPage/presentation/Widgets/operators_button.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginPage();
}

class _LoginPage extends State<LoginApp> {

    //data de prueba
  String user = '12345';
  //Keys para el acceso a stateful widgets
  GlobalKey<BaseTextFieldState> usernametextFieldKey = GlobalKey<BaseTextFieldState>();
  GlobalKey<ErrorSquareState> errorSquareKey = GlobalKey<ErrorSquareState>();

//método validar datos usuario
  void signUserIn(){
  if (usernametextFieldKey.currentState!.usernameController.text!=user ){
      setState(() {
        errorSquareKey.currentState!.invalidData=true;
      });
  } else{
    setState(() {
        errorSquareKey.currentState!.invalidData=false; 
      }
      );
      Navigator.pushNamed(context, '/homepage');
  }
  if (usernametextFieldKey.currentState!.usernameController.text.isEmpty){
      setState(() {
        errorSquareKey.currentState!.invalidData=false;
        usernametextFieldKey.currentState!.valueEmpty2 = true;
      });
  } else {
    setState(() {
        usernametextFieldKey.currentState!.valueEmpty2 = false;
      });
  }
}

 @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[
              Color.fromARGB(255, 52, 13, 131),
              Color.fromARGB(255, 30, 8, 58),
              Color.fromARGB(255, 30, 8, 58),
              Color.fromARGB(255, 57, 13, 145),
            ],
          ),
        ),
        child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
      
                    // iniciar sesion text
                    const SizedBox(height: 45),
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.0),
                      child:  Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 37,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
              
                    const SizedBox(height: 35),
      
                    //Numero de teléfono text
              
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.0),
                      child:  Text(
                        'Número de teléfono',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
      
                    const SizedBox(height: 20),
      
      
                    //  textfield numero identificación 
                      BaseTextField(key: usernametextFieldKey),
      
                    //Cuadro datos invalidos
      
                    ErrorSquare(key: errorSquareKey),
      
                    const SizedBox(height: 30),
      
                     // boton iniciar sesion
                    MyButton(
                      onTap: (){
                        signUserIn();
                        
                      }
                    ),
              
                   // Suscríbete text
                    const SizedBox(height: 65),
                    const Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20.0),
                            child:  Text(
                              'Suscríbete',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 37,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                    const SizedBox(height: 10),
                    const Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20.0),
                            child:  Text(
                              'Si no tienes cuenta suscríbete con tu operadora',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                    const SizedBox(height: 30),
                            //Boton movistar
                            const Center(
                              child: ImageContainer(
                                imagePath: 'images/digitel_blanco.png',
                              ),
                            ),
                            //Boton digitel
                            const SizedBox(height: 25),
                            const Center(
                              child: ImageContainer(
                                imagePath: 'images/movistar_blanco.png',
                              ),
                            ),  
                  ],
                ),
              ),
            ),
      ),
    );
  }
}