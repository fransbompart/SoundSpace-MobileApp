import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget{
  const PasswordTextField({super.key});
  @override
  State<StatefulWidget> createState() {
    return  PasswordTextFieldState();
  }
}

class PasswordTextFieldState extends State<PasswordTextField>{
  bool obscureText = true;
  bool invalidData = false;
  bool valueEmpty = false;
  final formKey2 = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: formKey2,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      enabledBorder: valueEmpty
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
                      hintText: valueEmpty ? "Ingresa tu contraseña" : "",
                      hintStyle: TextStyle(
                        color: valueEmpty ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 255, 255, 255),
                      ),
                      prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Icon(obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: Colors.white),
                      ),
                    ),
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
  }
}