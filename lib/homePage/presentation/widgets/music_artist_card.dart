import 'package:flutter/material.dart';

class MusicArtistCard extends StatelessWidget {
  const MusicArtistCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      GestureDetector(
        onTap: () {}, //ClipRRect con la imagen (model)
        child: Material(
          elevation: 5.0,
          color: Colors.transparent,
          shape: const CircleBorder(eccentricity: 1),
          child: Container(
            //imagen
            width: size.width * 0.3,
            height: size.width * 0.3,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 20, 196, 28),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      const Text('Artist') //texto (model)
    ]);
  }
}
