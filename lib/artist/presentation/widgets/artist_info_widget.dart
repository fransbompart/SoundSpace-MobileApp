import 'package:flutter/material.dart';
import 'package:flutter_application_4/artist/presentation/widgets/artist_info.dart';
import 'package:flutter_application_4/artist/presentation/widgets/cover.dart';

class ArtistInfoWidget extends StatefulWidget {
  final double currentHeight;
  final double currentWidth;

  const ArtistInfoWidget({
    super.key,
    required this.currentHeight,
    required this.currentWidth,
  });

  @override
  State<ArtistInfoWidget> createState() => _ArtistInfoState();
}

class _ArtistInfoState extends State<ArtistInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoverImg(
          currentWidth: widget.currentWidth * 40 / 100,
          url: "images/CesarCede.png",
        ),
        ArtistInfo(
            currentHeight: widget.currentHeight,
            currentWidth: widget.currentWidth,
            name: 'César Cede',
            genre: "Alternativo",
            albums: 1,
            songs: 5)
      ],
    );
  }
}
