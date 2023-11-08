import 'package:flutter/material.dart';
import 'package:flutter_application_4/presentation/widgets/music_artist_card.dart';

class MusicArtistsCarousel extends StatelessWidget {
  final List<MusicArtistCard> artists;
  const MusicArtistsCarousel({Key? key, required this.artists})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: 150,
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.38, initialPage: 0),
          itemCount: artists.length,
          itemBuilder: (context, index) => artists[index],
          padEnds: false,
        ),
      ),
    );
  }
}
