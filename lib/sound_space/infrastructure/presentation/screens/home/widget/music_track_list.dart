import 'package:flutter/material.dart';
import 'music_track_item.dart';

class MusicTrackList extends StatelessWidget {
  final List<MusicTrackItem> tracks;
  const MusicTrackList({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(tracks.length, (index) => tracks[index]),
    );
  }
}
