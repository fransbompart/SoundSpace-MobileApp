import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({super.key, required this.child});
  //hola
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color.fromARGB(255, 60, 19, 125),
                Color.fromARGB(255, 44, 23, 82),
                Color.fromARGB(255, 31, 23, 47),
                Color.fromARGB(255, 44, 23, 82),
                Color.fromARGB(255, 60, 19, 125),
              ],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
