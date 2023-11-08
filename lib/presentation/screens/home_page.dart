import 'package:flutter/material.dart';
import 'package:flutter_application_4/presentation/widgets/music_album_card.dart';
import 'package:flutter_application_4/presentation/widgets/music_albums_carousel.dart';
import 'package:flutter_application_4/presentation/widgets/music_artist_card.dart';
import 'package:flutter_application_4/presentation/widgets/music_artists_carousel.dart';
import 'package:flutter_application_4/presentation/widgets/music_categories.dart';
import 'package:flutter_application_4/presentation/widgets/music_category_card.dart';
import 'package:flutter_application_4/presentation/widgets/music_track_item.dart';
import 'package:flutter_application_4/presentation/widgets/promotional_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                actions: const [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                ],
              ),
              const PromotionalBanner(
                //requestPromotion
                imgPath:
                    'https://aqustico.com/wp-content/uploads/2023/08/Banners-web_Mesa-de-trabajo-1-1.png',
              ),
              const _Collapse(name: 'Playlist', child: [
                //requestCategories
                MusicCategories(
                  categories: [
                    MusicCategoryCard(
                        name: 'Tradicional venezolana',
                        color: Colors.deepPurple),
                    MusicCategoryCard(name: 'Alternativo', color: Colors.pink),
                    MusicCategoryCard(name: 'Pop Latino', color: Colors.amber),
                    MusicCategoryCard(name: 'Urbana', color: Colors.indigo)
                  ],
                )
              ]),
              const _Collapse(name: 'Aqustico Experience', child: [
                MusicAlbumsCarousel(albums: [
                  MusicAlbumCard(),
                  MusicAlbumCard(),
                  MusicAlbumCard(),
                  MusicAlbumCard(),
                ])
              ]),
              const _Collapse(name: 'Artistas Trending', child: [
                MusicArtistsCarousel(
                  artists: [
                    //requestAuthors
                    MusicArtistCard(),
                    MusicArtistCard(),
                    MusicArtistCard(),
                  ],
                )
              ]),
              const Divider(
                color: Color.fromARGB(18, 142, 139, 139),
                height: 40,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const _Collapse(name: 'Tracklist', child: [
                //requestTrackLists
                MusicTrackItem(),
                MusicTrackItem(),
                MusicTrackItem(),
                MusicTrackItem()
              ]),
            ],
          ),
        ),
        // const Positioned(bottom: 0, left: 0, right: 0, child: MusicPlayer())
      ],
    );
  }
}

class _Collapse extends StatelessWidget {
  final String name;
  final List<Widget> child;

  const _Collapse({required this.name, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        children: List.generate(child.length, (index) => child[index]),
      ),
    );
  }
}
