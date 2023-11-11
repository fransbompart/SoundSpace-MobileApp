import 'package:flutter/material.dart';
import 'package:flutter_application_4/artist/presentation/widgets/artist_info_widget.dart';
import 'package:flutter_application_4/artist/config/gradient_widget.dart';
import 'package:flutter_application_4/artist/presentation/widgets/carousel_widget.dart';
import 'package:flutter_application_4/artist/presentation/widgets/top_artist.dart';
import 'package:flutter_application_4/artist/presentation/widgets/song_list_widget.dart';

class Artist extends StatefulWidget {
  final double currentHeight;
  final double currentWidth;

  const Artist({
    super.key,
    required this.currentHeight,
    required this.currentWidth,
  });

  @override
  State<Artist> createState() => _ArtistState();
}

class _ArtistState extends State<Artist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: LinearGradient(colors: [Color(0xff1C1827), Color(0xff3C1280)]),
      body: SafeArea(
          child: Center(
        child: Stack(alignment: Alignment.topCenter, children: [
          GradientWidget(
              currentHeight: widget.currentHeight,
              currentWidth: widget.currentWidth),
          //Blur(
          //  blur: 4,
          //  blurColor: Color.fromARGB(255, 30, 22, 53),
          //  child: ShadowOverlay(
          //    shadowHeight: widget.currentHeight,
          //    shadowWidth: widget.currentWidth,
          //    shadowColor: Color.fromARGB(255, 62, 48, 107),
          //    child: const Image(image: AssetImage('images/CesarCede.png')),
          //  ),
          //),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TopArtist(
                currentHeight: widget.currentHeight,
                currentWidth: widget.currentWidth),
            ArtistInfoWidget(
              currentHeight: widget.currentHeight,
              currentWidth: widget.currentWidth,
            ),
            CarouselWidget(
              currentHeight: widget.currentHeight,
              currentWidth: widget.currentWidth,
            ),
            SongListWidget(
                currentHeight: widget.currentHeight,
                currentWidth: widget.currentWidth)
          ]),
        ]),
      )),
    );
  }
}
