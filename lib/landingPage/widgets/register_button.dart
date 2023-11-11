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
            borderRadius: BorderRadius.circular(9.0),
          ),
        backgroundColor: const Color.fromARGB(255, 1, 229, 240),
        foregroundColor: Colors.black,
      ),
      child: const Text(
        'Regístrate aquí',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}