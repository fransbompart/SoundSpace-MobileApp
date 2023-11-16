import 'package:flutter/material.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:provider/provider.dart';
import 'package:soundspace_mobileapp/domain/playlist.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/commons/widgets/background.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/providers/audio_player_provider.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/providers/playlist_provider.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/playlist/widget/playlist_songs.dart';
import 'package:soundspace_mobileapp/infrastructure/repositories/api_repository.dart';
import 'dart:math';

class PlaylistPage extends StatelessWidget {
  final Playlist playlist;
  const PlaylistPage({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    final ApiRepository repository = ApiRepository();
    return Scaffold(
        body: MultiProvider(
            providers: [
          ChangeNotifierProvider(
            create: (_) => AudioPlayerProvider(),
          ),
          ChangeNotifierProvider(
              create: (_) => PlaylistProvider(repository: repository))
        ],
            child: GradientBackground(
                child: IndividualPlaylist(
              repository: repository,
              playlist: playlist,
            ))));
  }
}

class IndividualPlaylist extends StatelessWidget {
  final ApiRepository repository;
  final Playlist playlist;
  const IndividualPlaylist(
      {super.key, required this.repository, required this.playlist});

  @override
  Widget build(BuildContext context) {
    final playerProvider = context.watch<AudioPlayerProvider>();
    final playlistProvider = context.watch<PlaylistProvider>();
    final List<double> samples = [];
    for (var i = 0; i < 180; i++) {
      samples.add(Random().nextDouble() * 5);
    }
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  )),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          playlist.iconPath,
                          fit: BoxFit.fill,
                          width: 220,
                        ),
                      ),
                    ],
                  )),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          playlist.name,
                          style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        (playlistProvider.creator == null)
                            ? FutureBuilder(
                                future: playlistProvider
                                    .getPlaylistCreator(playlist.id),
                                builder: (contex, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child:
                                            CircularProgressIndicator()); // muestra un indicador de carga mientras se espera
                                  } else {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      return Text(
                                        playlistProvider.creator!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal),
                                      );
                                    }
                                  }
                                })
                            : Text(
                                playlistProvider.creator!,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                        (playlistProvider.songs == null)
                            ? FutureBuilder(
                                future: playlistProvider
                                    .getPlaylistSongs(playlist.id),
                                builder: (contex, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child:
                                            CircularProgressIndicator()); // muestra un indicador de carga mientras se espera
                                  } else {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      return Text(
                                        '${playlistProvider.songs} CANCIONES',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal),
                                      );
                                    }
                                  }
                                })
                            : Text(
                                '${playlistProvider.songs} CANCIONES',
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Icon(
                                  Icons.av_timer_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                              (playlistProvider.duration == null)
                                  ? FutureBuilder(
                                      future: playlistProvider
                                          .getPlaylistDuration(playlist.id),
                                      builder: (contex, snapshot) {
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
                                              '${playlistProvider.duration} MIN',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            );
                                          }
                                        }
                                      })
                                  : Text(
                                      '${playlistProvider.duration} MIN',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                    ),
                            ],
                          ),
                        )
                      ]),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                width: double.infinity,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_circle_outline_outlined,
                        size: 110,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      children: [
                        RectangleWaveform(
                          samples: samples,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.65,
                          activeColor: Colors.white,
                          inactiveColor: Colors.grey,
                          maxDuration: Duration(seconds: 1),
                          elapsedDuration: Duration.zero,
                          isCentered: true,
                          isRoundedRectangle: true,
                          activeBorderColor: Colors.white,
                          inactiveBorderColor: Colors.grey,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: const TextButton(
                                  onPressed: null,
                                  child: Image(
                                    image: AssetImage('icons/15sBack.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: const TextButton(
                                  onPressed: null,
                                  child: Image(
                                    image: AssetImage('icons/30sNext.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: const TextButton(
                                  onPressed: null,
                                  child: Image(
                                    image: AssetImage('icons/RandomArrows.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: const TextButton(
                                  onPressed: null,
                                  child: Image(
                                    image: AssetImage('icons/1xIcon.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: const TextButton(
                                  onPressed: null,
                                  child: Image(
                                    image: AssetImage('icons/muteIcon.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
              (playlistProvider.playlistSongs == null)
                  ? FutureBuilder(
                      future: playlistProvider.getSongsByPlaylist(playlist.id),
                      builder: ((context, snapshot) {
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
                                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: Container(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        PlaylistSongs(
                                            songs:
                                                playlistProvider.playlistSongs!)
                                      ],
                                    )));
                          }
                        }
                      }))
                  : Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              PlaylistSongs(
                                  songs: playlistProvider.playlistSongs!)
                            ],
                          ))),
            ],
          ),
        )
      ],
    );
  }
}
