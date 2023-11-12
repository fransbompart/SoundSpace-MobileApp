import 'package:flutter/material.dart';

class RegisterButtom extends StatefulWidget{

  const RegisterButtom({super.key});

  @override
  State<RegisterButtom> createState() => _RegisterButtomState();
}

class _RegisterButtomState extends State<RegisterButtom> {
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: () {
        // Handle button press
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        backgroundColor: const Color.fromARGB(255, 1, 229, 240),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 18),
      ),
      child: const Text(
        'REGÍSTRATE AQUÍ',
        style: TextStyle(
          color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 24,
          ),
      ),
    );
  }
}