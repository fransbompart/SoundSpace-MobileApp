import 'package:flutter/material.dart';
import 'package:soundspace_mobileapp/domain/song.dart';

class PlaylistSongs extends StatelessWidget {
  final List<Song> songs;
  const PlaylistSongs({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    final List<PlaylistItem> tracklist = songs
        .map((song) => PlaylistItem(
              song: song,
            ))
        .toList();

    return Column(
      children: tracklist,
    );
  }
}

class PlaylistItem extends StatelessWidget {
  final Song song;
  const PlaylistItem({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xFF3E2962),
          border: Border(bottom: BorderSide(color: Colors.grey))),
      width: MediaQuery.of(context).size.width * 0.95,
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: const Icon(
                Icons.play_arrow,
                color: Color(0xFF01E5F0),
              ),
            ),
            Text(
              song.name,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Text(
            song.duration,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        )
      ]),
    );
  }
}
