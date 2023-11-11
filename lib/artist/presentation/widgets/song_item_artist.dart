import 'package:flutter/material.dart';
import 'package:flutter_application_4/artist/presentation/widgets/cover.dart';

class SongItem extends StatefulWidget {
  final String song_name;
  final String artist_name;
  final String duration;
  final CoverImg cover;
  final double currentWidth;

  const SongItem(
      {super.key,
      required this.song_name,
      required this.artist_name,
      required this.duration,
      required this.cover,
      required this.currentWidth});

  @override
  State<SongItem> createState() => _SongItemState();
}

class _SongItemState extends State<SongItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF3E2962), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.cover,
          SizedBox(
            width: widget.currentWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.song_name,
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    Text(
                      widget.artist_name,
                      style: const TextStyle(fontSize: 22, color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Text(
                        widget.duration,
                        style:
                            const TextStyle(fontSize: 22, color: Colors.grey),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Color(0xFF01E5F0),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
