import 'package:flutter/material.dart';

class LandingPromo extends StatefulWidget{
  final String promoPath;

  const LandingPromo({super.key, required this.promoPath});

  @override
  State<LandingPromo> createState() => _LandingPromoState();
}

class _LandingPromoState extends State<LandingPromo> {
  @override
  Widget build(BuildContext context){
    return Container(
      foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.5, 0.8, 0.85, 0.95],
                              colors: <Color>[
                                Colors.transparent,
                                Color.fromARGB(100, 46, 21, 90),
                                Color.fromARGB(150, 29, 21, 72),
                                Color.fromARGB(255, 34, 21, 59),
                              ],
                            ) 
              ),
              child: Image.asset(widget.promoPath),
    );
  }
}