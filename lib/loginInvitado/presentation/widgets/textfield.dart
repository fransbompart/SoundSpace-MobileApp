import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BaseTextField extends StatefulWidget{
  const BaseTextField({super.key});
  @override
  State<StatefulWidget> createState() {
    return  BaseTextFieldState();
  }
}

class BaseTextFieldState extends State<BaseTextField>{
  bool invalidData = false;
  bool valueEmpty2 = false;
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: usernameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: valueEmpty2
                      ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.red),
                        )
                      : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Color.fromARGB(0, 255, 255, 255)),
                        ),          
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Color.fromARGB(0, 189, 189, 189)),
                  ),
                    fillColor: const Color.fromARGB(69, 238, 238, 238),
                    filled: true,
                    hintText: valueEmpty2 ? "Ingresa tu número de identificación" : "",
                    hintStyle: TextStyle(
                      color: valueEmpty2 ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 255, 255, 255),
                    ),
                    suffixIcon: const Icon(Icons.info_outline, color: Colors.white),
                  ),
                  cursorColor: Colors.white,
                  style: GoogleFonts.poppins().copyWith(
          color: Colors.white,
            ),
                          
                  ),
                ),
              );
  }
}