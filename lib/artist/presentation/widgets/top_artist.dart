import 'package:flutter/material.dart';

class TopArtist extends StatefulWidget {
  final double currentHeight;
  final double currentWidth;
  const TopArtist({
    super.key,
    required this.currentHeight,
    required this.currentWidth,
  });

  @override
  State<TopArtist> createState() => _TopArtistState();
}

class _TopArtistState extends State<TopArtist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.currentHeight * 8 / 100,
      width: widget.currentWidth,
      padding: const EdgeInsets.only(left: 5, top: 0, right: 0, bottom: 0),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
