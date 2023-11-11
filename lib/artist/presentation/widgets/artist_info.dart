import 'package:flutter/material.dart';

class ArtistInfo extends StatefulWidget {
  final String name;
  final String genre;
  final int albums;
  final int songs;
  final double currentHeight;
  final double currentWidth;
  const ArtistInfo(
      {super.key,
      required this.name,
      required this.genre,
      required this.albums,
      required this.songs,
      required this.currentHeight,
      required this.currentWidth});

  @override
  State<ArtistInfo> createState() => _ArtistInfoState();
}

class _ArtistInfoState extends State<ArtistInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.currentWidth * 40 / 100,
      width: widget.currentWidth * 40 / 100,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text(
                  widget.genre,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.albums} Album",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "${widget.songs} Canciones",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ]),
    );
  }
}
