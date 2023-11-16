import 'package:flutter/material.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/home/home_page.dart';
import 'package:soundspace_mobileapp/infrastructure/repositories/api_repository.dart';
import 'Widgets/textfield.dart';
import 'Widgets/error_square.dart';
import 'Widgets/my_button.dart';
import 'Widgets/operators_button.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginPage();
}

class _LoginPage extends State<LoginApp> {
  //data de prueba
  String user = '12345';
  String movistar = '0cf45d3b-187e-49c2-b24f-18e6da8245e9';
  String digitel = 'd850ca20-cd91-4c53-95f4-7091ff46defe';
  //Keys para el acceso a stateful widgets
  GlobalKey<BaseTextFieldState> usernametextFieldKey =
      GlobalKey<BaseTextFieldState>();
  GlobalKey<ErrorSquareState> errorSquareKey = GlobalKey<ErrorSquareState>();
  final ApiRepository repository = ApiRepository();

//método iniciar sesion

  void signUserIn() async {
    print('Iniciando sesion...');
    // Obtener el número de teléfono desde el TextField
    String phoneNumber = usernametextFieldKey.currentState?.usernameController.text ?? '';

    // Realizar la solicitud de inicio de sesión
    String? userId = await ApiRepository().logInUser(phoneNumber);

    if (userId != null) {
      // Inicio de sesión exitoso, realizar la navegación o acciones correspondientes
      print('INICIO DE SESION EXITOSO. ID de usuario: $userId');

      // Navigecacion a la HomePage
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(repository: repository)),
      );
    } else {
      // Si userId es null, el inicio de sesión falló
      // Mostrar mensaje de error
      print('Fallo en el inicio de sesión');
      setState(() {
        errorSquareKey.currentState!.invalidData = true;
        errorSquareKey.currentState!.mensaje = ' Datos inválidos. Intenta nuevamente';
      });
    }
    if (usernametextFieldKey.currentState!.usernameController.text.isEmpty) {
      setState(() {
        errorSquareKey.currentState!.invalidData = false;
        usernametextFieldKey.currentState!.valueEmpty2 = true;
      });
    } else {
      setState(() {
        usernametextFieldKey.currentState!.valueEmpty2 = false;
      });
    }
  }
  //metodo registrar usuario
  void signUserUp(String operadora) async {
    print('Registrando...');
    // Obtener el número de teléfono desde el TextField
    String phoneNumber = usernametextFieldKey.currentState?.usernameController.text ?? '';
    if (phoneNumber.length <= 9 || phoneNumber.startsWith('0') ){
      setState(() {
      errorSquareKey.currentState!.mensaje = 'Formato inválido. Formato correcto de ejemplo: 584241232323 o 4121232323';
      errorSquareKey.currentState!.invalidData = true;
      });
    } else{

    

    // Realizar la solicitud de inicio de sesión
    String? userId = await ApiRepository().signUpUser(phoneNumber,operadora);

    if (userId != null) {
      // Inicio de sesión exitoso, realizar la navegación o acciones correspondientes
      print('Registrado con exito. ID de usuario: $userId');

      // Navigecacion a la HomePage
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(repository: repository)),
      );
    } else {
      // Si userId es null, el inicio de sesión falló
      // Mostrar mensaje de error
      print('Fallo en el registro');
      String errorMessage = await ApiRepository().getError(phoneNumber,operadora);
      setState(() {
        errorSquareKey.currentState!.mensaje = errorMessage;
        errorSquareKey.currentState!.invalidData = true;
      });
    }
    if (usernametextFieldKey.currentState!.usernameController.text.isEmpty) {
      setState(() {
        errorSquareKey.currentState!.invalidData = false;
        usernametextFieldKey.currentState!.valueEmpty2 = true;
      });
    } else {
      setState(() {
        usernametextFieldKey.currentState!.valueEmpty2 = false;
      });
    }
    }
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
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
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
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Número de teléfono',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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
                MyButton(onTap: () {
                  signUserIn();
                }),

                // Suscríbete text
                const SizedBox(height: 65),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
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
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Si no tienes cuenta suscríbete con tu operadora',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                //Boton movistar
                 Center(
                  child: ImageContainer(
                    imagePath: 'images/digitel_blanco.png',
                    onTap: () {
                      signUserUp(digitel);
                    }),
                ),
                //Boton digitel
                const SizedBox(height: 25),
                 Center(
                  child: ImageContainer(
                    imagePath: 'images/movistar_blanco.png',
                    onTap: () {
                      signUserUp(movistar);
                      }
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
