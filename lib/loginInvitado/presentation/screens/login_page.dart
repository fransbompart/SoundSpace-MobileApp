import 'package:flutter/material.dart';
import 'package:flutter_application_4/loginInvitado/presentation/widgets/error_square.dart';
import 'package:flutter_application_4/loginInvitado/presentation/widgets/my_button.dart';
import 'package:flutter_application_4/loginInvitado/presentation/widgets/password_textfield.dart';
import 'package:flutter_application_4/loginInvitado/presentation/widgets/textfield.dart';

class LoginState extends StatefulWidget{
  const LoginState({super.key});

  @override
  State<LoginState> createState() => _LoginPage();
}

class _LoginPage extends State<LoginState> {

  //data de prueba
  String user = '12345';
  String password = '12345';
  //Keys para el acceso a stateful widgets
  GlobalKey<BaseTextFieldState> usernametextFieldKey = GlobalKey<BaseTextFieldState>();
  GlobalKey<PasswordTextFieldState> passwordtextFieldKey = GlobalKey<PasswordTextFieldState>();
  GlobalKey<ErrorSquareState> errorSquareKey = GlobalKey<ErrorSquareState>();

//Función para simular validación de logeo

void signUserIn(){
  if (usernametextFieldKey.currentState!.usernameController.text!=user || passwordtextFieldKey.currentState!.passwordController.text!=password){
      setState(() {
        errorSquareKey.currentState!.invalidData=true;
      });
  } else{
    setState(() {
        errorSquareKey.currentState!.invalidData=false;
      });
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
  if (passwordtextFieldKey.currentState!.passwordController.text.isEmpty){
      setState(() {
        errorSquareKey.currentState!.invalidData=false;
        passwordtextFieldKey.currentState!.valueEmpty = true;
      });
  } else {
    setState(() {
        passwordtextFieldKey.currentState!.valueEmpty = false;
      });
  }
}

  @override
  Widget build(BuildContext context) {
    return  Center(
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

                //Numero identificacion text
          
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0),
                  child:  Text(
                    'Número de identificación',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 20),


                //  textfield numero identificación 
                  BaseTextField(key: usernametextFieldKey),
          
                const SizedBox(height: 30),

                //Contraseña text
          
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0),
                  child:  Text(
                    'Contraseña',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                //textfield contraseña
          
                PasswordTextField(key: passwordtextFieldKey),
          
                const SizedBox(height: 25),

                //Cuadro datos invalidos

                ErrorSquare(key: errorSquareKey),

                const SizedBox(height: 30),

                // olvidaste tu contraseña? text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 150),
          
                // boton iniciar sesion
                MyButton(
                  onTap: signUserIn
                ),
          
                const SizedBox(height: 50),
          
                // aun no tienes una cuenta? text
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Aún no tienes una cuenta?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                      ),
                    ),

                    SizedBox(width: 4),

                    //Registrate text
                    Text(
                      'Regístrate',
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 214, 251),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
  }
}