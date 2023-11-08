import 'package:flutter/material.dart';

class MusicAlbumCard extends StatelessWidget {
  const MusicAlbumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.lime,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }
}
