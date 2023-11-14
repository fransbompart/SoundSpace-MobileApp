import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:soundspace_mobileapp/domain/album.dart';
import 'package:soundspace_mobileapp/domain/artist.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/commons/widgets/albums_carousel.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/commons/widgets/background.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/commons/widgets/player.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/commons/widgets/tracklist.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/providers/album_provider.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/providers/audio_player_provider.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/providers/playlist_provider.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/providers/song_provider.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/artist/artist_info.dart';
import 'package:soundspace_mobileapp/infrastructure/repositories/api_repository.dart';

class ArtistPage extends StatelessWidget {
  final Artist artist;

  const ArtistPage({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    final ApiRepository repository = ApiRepository();
    return Scaffold(
        body: MultiProvider(
            providers: [
          ChangeNotifierProvider(
              create: (_) => AlbumProvider(repository: repository)),
          ChangeNotifierProvider(
              create: (_) => SongProvider(repository: repository)),
          ChangeNotifierProvider(
            create: (_) => AudioPlayerProvider(),
          )
        ],
            child: GradientBackground(
                child: IndividualArtist(
              artist: artist,
              repository: repository,
            ))));
  }
}

class IndividualArtist extends StatelessWidget {
  final Artist artist;
  final ApiRepository repository;
  const IndividualArtist(
      {super.key, required this.artist, required this.repository});

  @override
  Widget build(BuildContext context) {
    final albumsProvider = context.watch<AlbumProvider>();
    final songsProvider = context.watch<SongProvider>();
    final playerProvider = context.watch<AudioPlayerProvider>();

    int getRealAlbums(List<Album>? list) {
      int a = 0;
      list?.forEach((element) {
        if (element.id != 'id') a = a + 1;
      });

      return a;
    }

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                width: double.infinity,
                color: Colors.transparent,
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(0),
                      iconSize: 25,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              artist.imageURL,
                              fit: BoxFit.fill,
                              width: 180,
                            ),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      artist.name,
                                      style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'genre',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    (albumsProvider.albumsByArtist == null)
                                        ? FutureBuilder(
                                            future: albumsProvider
                                                .updateAlbumsByArtist(
                                                    artist.id),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator()); // muestra un indicador de carga mientras se espera
                                              } else {
                                                if (snapshot.hasError) {
                                                  return Text(
                                                      'Error: ${snapshot.error}');
                                                } else {
                                                  return Text(
                                                    "${getRealAlbums(albumsProvider.albumsByArtist)} Album",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  );
                                                }
                                              }
                                            })
                                        : Text(
                                            "${getRealAlbums(albumsProvider.albumsByArtist)} Album",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white),
                                          ),
                                    (songsProvider.songsByArtist == null)
                                        ? FutureBuilder(
                                            future: songsProvider
                                                .getSongsByArtist(artist.id),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator()); // muestra un indicador de carga mientras se espera
                                              } else {
                                                if (snapshot.hasError) {
                                                  return Text(
                                                      'Error: ${snapshot.error}');
                                                } else {
                                                  return Text(
                                                    "${songsProvider.songsByArtist?.length} Canciones",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  );
                                                }
                                              }
                                            })
                                        : Text(
                                            "${songsProvider.songsByArtist?.length} Canciones",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          )
                                  ],
                                ),
                              ]),
                        ],
                      ))),
              (albumsProvider.albumsByArtist == null)
                  ? FutureBuilder(
                      future: albumsProvider.updateAlbumsByArtist(artist.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child:
                                  CircularProgressIndicator()); // muestra un indicador de carga mientras se espera
                        } else {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                                child: AlbumsCarousel(
                                    albums: albumsProvider.albumsByArtist!));
                          }
                        }
                      })
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: AlbumsCarousel(
                          albums: albumsProvider.albumsByArtist!)),
              (songsProvider.songsByArtist == null)
                  ? FutureBuilder(
                      future: songsProvider.getSongsByArtist(artist.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child:
                                  CircularProgressIndicator()); // muestra un indicador de carga mientras se espera
                        } else {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Tracklist(
                                    songs: songsProvider.songsByArtist!));
                          }
                        }
                      })
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Tracklist(songs: songsProvider.songsByArtist!)),
              const SizedBox(height: 100)
            ],
          ),
        ),
        Visibility(
          visible: ((playerProvider.player.processingState ==
                      ProcessingState.idle) ||
                  (playerProvider.player.processingState ==
                      ProcessingState.completed))
              ? false
              : true,
          child: const Align(
            alignment: Alignment.bottomLeft,
            child: Player(),
          ),
        )
      ],
    );
  }
}
