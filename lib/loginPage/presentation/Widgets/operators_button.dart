import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imagePath;

  const ImageContainer({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 435,
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
             Color.fromARGB(76, 255, 255, 255),
             Color.fromARGB(76, 255, 255, 255),
          ],
        ),
      ),
      child: ElevatedButton.icon(
      onPressed: () {},
      icon: Image.asset(imagePath, width: 250),
      label: const Text(''),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors
            .transparent, // Establece el color de fondo como transparente,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )),


    );
  }
}