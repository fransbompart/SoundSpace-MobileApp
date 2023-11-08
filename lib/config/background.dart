import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({super.key, required this.child});

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
                Color.fromARGB(255, 52, 13, 131),
                Color.fromARGB(255, 30, 8, 58),
                Color.fromARGB(255, 24, 18, 31),
                Color.fromARGB(255, 30, 8, 58),
                Color.fromARGB(255, 57, 13, 145),
              ],
            ),
          ),
        ),
        child,
      ],
    );
  }
}
