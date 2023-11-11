import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? icon1;
  final IconData? icon2;
  final bool passwordObscured;


  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.icon1,
    this.icon2,
    this.passwordObscured = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: passwordObscured  ? passwordObscured : obscureText,
        decoration: InputDecoration(
            enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Color.fromARGB(0, 255, 255, 255)),
            ),
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color:  Color.fromARGB(0, 189, 189, 189)),
            ),
            fillColor: const Color.fromARGB(69, 238, 238, 238),
            filled: true,
            
            hintStyle: const TextStyle(color:  Color.fromARGB(255, 255, 255, 255)),
            suffixIcon: IconButton(
              onPressed: (){
                
              },
              icon: Icon(icon1, color: Colors.white),
            ),
            prefixIcon: icon2 != null ? Icon(icon2, color: Colors.white) : null,
            ),
            cursorColor: Colors.white,
            style: GoogleFonts.poppins().copyWith(
          color: Colors.white,
          fontSize: 15,
            ),
      ),
    );
  }
}