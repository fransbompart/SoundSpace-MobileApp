import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/commons/widgets/albums_carousel.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/searchPage/screens/search_bar.dart';

import '../../../repositories/api_repository.dart';
import '../../commons/widgets/background.dart';
import '../../commons/widgets/player.dart';
import '../../commons/widgets/tracklist.dart';
import '../../providers/album_provider.dart';
import '../../providers/artist_provider.dart';
import '../../providers/audio_player_provider.dart';
import '../../providers/playlist_provider.dart';
import '../../providers/song_provider.dart';
import 'widget/artists_carousel.dart';
import 'widget/playlist_wrap.dart';
import 'widget/promotional_banner.dart';

class HomePage extends StatelessWidget {
  final ApiRepository repository;

  const HomePage({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(providers: [
        ChangeNotifierProvider(
            create: (_) => PlaylistProvider(repository: repository)),
        ChangeNotifierProvider(
            create: (_) => AlbumProvider(repository: repository)),
        ChangeNotifierProvider(
            create: (_) => ArtistProvider(repository: repository)),
        ChangeNotifierProvider(
            create: (_) => SongProvider(repository: repository)),
        ChangeNotifierProvider(
          create: (_) => AudioPlayerProvider(),
        )
      ], child: const GradientBackground(child: Home())),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final playlistProvider = context.watch<PlaylistProvider>();
    final albumsProvider = context.watch<AlbumProvider>();
    final artistsProvider = context.watch<ArtistProvider>();
    final songsProvider = context.watch<SongProvider>();
    final playerProvider = context.watch<AudioPlayerProvider>();

    return Stack(children: [
      SingleChildScrollView(
        child: Column(children: [
          AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  // Navegar a la página de búsqueda cuando se hace clic en el ícono de búsqueda
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchFrame()),
                  );
                },
              ),
              const SizedBox(width: 10),
              const Icon(Icons.more_vert, color: Colors.white),
              const SizedBox(width: 10),
            ],
          ),
          PromotionalBanner(imgPath: artistsProvider.bannerImgUrl!),
          //
          _Collapse(
              name: 'Playlist',
              child: [PlaylistWrap(playlists: playlistProvider.playlists!)]),
          //
          _Collapse(name: 'Aqustico Experience', child: [
            AlbumsCarousel(albums: albumsProvider.trendingAlbums!),
          ]),
          //
          _Collapse(name: 'Artistas Trending', child: [
            ArtistsCarousel(artists: artistsProvider.trendingArtists!)
          ]),
          //
          const Divider(
            color: Color.fromARGB(18, 142, 139, 139),
            height: 40,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          _Collapse(
              name: 'Tracklist',
              child: [Tracklist(songs: songsProvider.tracklist!)]),
          const Player(),
        ]),
      )
    ]);
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
