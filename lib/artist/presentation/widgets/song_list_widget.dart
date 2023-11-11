import 'package:flutter/material.dart';
import 'package:flutter_application_4/artist/presentation/widgets/cover.dart';
import 'package:flutter_application_4/artist/presentation/widgets/song_item_artist.dart';

class SongListWidget extends StatefulWidget {
  final double currentHeight;
  final double currentWidth;
  const SongListWidget(
      {super.key, required this.currentHeight, required this.currentWidth});

  @override
  State<SongListWidget> createState() => _SongListWidgetState();
}

class _SongListWidgetState extends State<SongListWidget> {
  @override
  Widget build(BuildContext context) {
    final widgets = [
      Container(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: SongItem(
          song_name: 'Track Uno',
          artist_name: 'Cesar Cede',
          duration: '3:00',
          cover: CoverImg(
              currentWidth: widget.currentWidth * 20 / 100,
              url: 'images/CesarCedeDramaQueen1.jpeg'),
          currentWidth: widget.currentWidth * 65 / 100,
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: SongItem(
          song_name: 'Track Dos',
          artist_name: 'Cesar Cede',
          duration: '3:00',
          cover: CoverImg(
              currentWidth: widget.currentWidth * 20 / 100,
              url: 'images/CesarCedeDomingo.jpeg'),
          currentWidth: widget.currentWidth * 65 / 100,
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: SongItem(
          song_name: 'Track Tres',
          artist_name: 'Cesar Cede',
          duration: '3:00',
          cover: CoverImg(
              currentWidth: widget.currentWidth * 20 / 100,
              url: 'images/CesarCedeImagina.jpeg'),
          currentWidth: widget.currentWidth * 65 / 100,
        ),
      ),
    ];
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: widget.currentWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets,
      ),
    );
  }
}
