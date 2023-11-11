import 'package:flutter/material.dart';
import 'dart:math' as math;

class GradientWidget extends StatefulWidget {
  final double currentHeight;
  final double currentWidth;

  const GradientWidget(
      {super.key, required this.currentHeight, required this.currentWidth});

  @override
  State<GradientWidget> createState() => _GradientWidgetState();
}

class _GradientWidgetState extends State<GradientWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.currentWidth,
      height: widget.currentHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(math.pi / 16),
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff3C127E),
            Color.fromARGB(255, 30, 22, 53),
            Color.fromARGB(255, 60, 14, 134)
          ],
        ),
      ),
    );
  }
}
